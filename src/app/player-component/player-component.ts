import { CommonModule } from '@angular/common';
import { HttpClient, HttpClientModule } from '@angular/common/http';
import { Component, OnInit, ElementRef, ViewChild } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { AppComponent } from '../app';
import { environment } from '../../environments/environment';

@Component({
  selector: 'app-player-component',
  standalone: true,
  imports: [CommonModule, HttpClientModule],
  templateUrl: './player-component.html',
  styleUrl: './player-component.scss',
})
export class PlayerComponent implements OnInit {
  @ViewChild('scratchCanvas') canvasRef!: ElementRef<HTMLCanvasElement>;

  questions: any[] = [];
  currentIndex = 0;
  score = 0;
  quizTitle = '';

  loading = true;
  quizFinished = false;
  gameOver = false;
  showWrongAnswerModal = false;

  lives = 3;
  funnyMessage = '';
  randomReward = '';
  isDrawing = false;

  constructor(
    private route: ActivatedRoute,
    private http: HttpClient,
    private appRef: AppComponent,
    private router: Router
  ) {}

  ngOnInit() {
    const code = this.route.snapshot.paramMap.get('code');
    if (code) this.loadQuizData(code);
    this.lives = this.appRef.lives();
  }

  get currentQuestion() {
    return this.questions[this.currentIndex];
  }

  loadQuizData(code: string) {
    this.http.get<any>(`${environment.apiUrl}/get_quiz_data.php?code=${code}`).subscribe({
      next: (res) => {
        this.questions = res.questions;
        this.quizTitle = res.title;
        this.loading = false;
      },
      error: () => { this.loading = false; }
    });
  }

  selectOption(index: number) {
    if (this.gameOver || this.quizFinished) return;

    if (index === this.currentQuestion.correctIndex) {
      this.score++;
      this.nextQuestion();
    } else {
      this.handleWrongAnswer();
    }
  }

  handleWrongAnswer() {
    this.appRef.onWrongAnswer();
    this.lives = this.appRef.lives();

    if (this.lives <= 0) {
      this.gameOver = true;
      return;
    }

    this.http.get<any>(`${environment.apiUrl}/get_funny_message.php?type=wrong`).subscribe({
      next: (res) => {
        if (res.success) {
          this.funnyMessage = res.message;
          this.showWrongAnswerModal = true;
        }
      }
    });
  }

  nextQuestion() {
    if (this.currentIndex < this.questions.length - 1) {
      this.currentIndex++;
    } else {
      this.finishQuiz();
    }
  }

  finishQuiz() {
    this.quizFinished = true;
    this.gameOver = false;

    this.http.get<any>(`${environment.apiUrl}/get_rewards.php?v=${Date.now()}`).subscribe({
      next: (res) => {
        this.randomReward = res.success && res.rewards?.length
          ? res.rewards[0].name
          : 'Egy nagy ölelés ❤️';
        setTimeout(() => this.initScratchCard(), 150);
      },
      error: () => {
        this.randomReward = 'Egy nagy ölelés ❤️';
        setTimeout(() => this.initScratchCard(), 150);
      }
    });
  }

  initScratchCard() {
    if (!this.canvasRef) return;
    const canvas = this.canvasRef.nativeElement;
    const wrapper = canvas.parentElement;
    const w = wrapper?.clientWidth || 320;
    const h = wrapper?.clientHeight || 130;

    canvas.width = w;
    canvas.height = h;

    const ctx = canvas.getContext('2d');
    if (!ctx) return;

    ctx.fillStyle = '#FFD6D6';
    ctx.fillRect(0, 0, w, h);

    ctx.fillStyle = '#E8302A';
    ctx.font = 'bold 15px DM Sans, sans-serif';
    ctx.textAlign = 'center';
    ctx.textBaseline = 'middle';
    ctx.fillText('Húzd az ujjad ide! ✨', w / 2, h / 2);
  }

  startScratching(e: MouseEvent | TouchEvent) {
    this.isDrawing = true;
    this.scratch(e);
  }

  stopScratching() {
    this.isDrawing = false;
  }

  scratch(event: MouseEvent | TouchEvent) {
    if (!this.isDrawing || !this.canvasRef) return;

    const canvas = this.canvasRef.nativeElement;
    const ctx = canvas.getContext('2d');
    const rect = canvas.getBoundingClientRect();

    const clientX = (event as TouchEvent).touches
      ? (event as TouchEvent).touches[0].clientX
      : (event as MouseEvent).clientX;
    const clientY = (event as TouchEvent).touches
      ? (event as TouchEvent).touches[0].clientY
      : (event as MouseEvent).clientY;

    const scaleX = canvas.width / rect.width;
    const scaleY = canvas.height / rect.height;
    const x = (clientX - rect.left) * scaleX;
    const y = (clientY - rect.top) * scaleY;

    if (ctx) {
      ctx.globalCompositeOperation = 'destination-out';
      ctx.beginPath();
      ctx.arc(x, y, 24, 0, Math.PI * 2);
      ctx.fill();
    }
  }

  goToCreator() {
    this.router.navigate(['/quiz-editor']);
  }

  reloadPage() {
    window.location.reload();
  }

  openCoffee(event: Event) {
    event.preventDefault();
    event.stopPropagation();
    window.open('https://www.buymeacoffee.com/dominikatok', '_blank');
  }
}
