import { CommonModule } from '@angular/common';
import { HttpClient, HttpClientModule } from '@angular/common/http';
import { Component, OnInit, ElementRef, ViewChild } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { AppComponent } from '../app';
import { Router } from '@angular/router';

@Component({
  selector: 'app-player-component',
  standalone: true,
  imports: [CommonModule, HttpClientModule],
  templateUrl: './player-component.html',
  styleUrl: './player-component.scss',
})
export class PlayerComponent implements OnInit {
  @ViewChild('scratchCanvas') canvasRef!: ElementRef<HTMLCanvasElement>;

  // Kvíz adatok
  questions: any[] = [];
  currentIndex = 0;
  score = 0;
  quizTitle = '';

  // Állapotjelzők
  loading = true;
  quizFinished = false;
  gameOver = false;
  showWrongAnswerModal = false;

  // Játék logika
  lives = 3;
  funnyMessage = '';

  // Kaparós sorsjegy adatok
  rewards: any[] = [];
  randomReward = "";
  isDrawing = false;

  constructor(
    private route: ActivatedRoute,
    private http: HttpClient,
    private appRef: AppComponent,
    private router: Router
  ) { }

  ngOnInit() {
    const code = this.route.snapshot.paramMap.get('code');
    if (code) {
      this.loadQuizData(code);
    }

    // Betöltjük a kuponokat a DB-ből az elején
    this.loadRewards();

    // Szinkronizáljuk a szíveket a globális állapottal
    this.lives = this.appRef.lives();
  }
  goToCreator() {
    // Itt irányítsd át arra az oldalra, ahol a kvízt létre lehet hozni
    // Ha például 'create' az útvonalad:
    this.router.navigate(['/create']);
  }

  get currentQuestion() {
    return this.questions[this.currentIndex];
  }

  // --- Adatbetöltés ---

  loadQuizData(code: string) {
    this.http.get<any>(`http://localhost/Szerelmi_Kalandor/szerelmi-kalandor/backend/api/get_quiz_data.php?code=${code}`)
      .subscribe({
        next: (res) => {
          this.questions = res.questions;
          this.quizTitle = res.title;
          this.loading = false;
        },
        error: (err) => {
          console.error('Hiba a kvíz betöltésekor:', err);
          this.loading = false;
        }
      });
  }

  loadRewards() {
    this.http.get<any>('http://localhost/Szerelmi_Kalandor/szerelmi-kalandor/backend/api/get_rewards.php')
      .subscribe({
        next: (res) => {
          if (res.success) {
            this.rewards = res.rewards;
          }
        },
        error: (err) => console.error('Nem sikerült betölteni a jutalmakat:', err)
      });
  }

  // --- Játékmenet ---

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
      this.lives = 0;
      this.gameOver = true;
    } else {
      this.http.get<any>('http://localhost/Szerelmi_Kalandor/szerelmi-kalandor/backend/api/get_funny_message.php?type=wrong')
        .subscribe(res => {
          if (res.success) {
            this.funnyMessage = res.message;
            this.showWrongAnswerModal = true;
          }
        });
    }
  }

  nextQuestion() {
    if (this.currentIndex < this.questions.length - 1) {
      this.currentIndex++;
    } else {
      // Ha elfogytak a kérdések, meghívjuk a befejezést
      this.finishQuiz();
    }
  }

  // --- Kvíz Befejezése & Kaparós Sorsjegy ---

  finishQuiz() {
  this.quizFinished = true;
  this.gameOver = false;

  // 1. Azonnali lekérés a szerverről (friss paraméterrel a cache ellen)
  const timestamp = new Date().getTime();
  this.http.get<any>(`http://localhost/Szerelmi_Kalandor/szerelmi-kalandor/backend/api/get_rewards.php?v=${timestamp}`)
    .subscribe({
      next: (res) => {
        // Ellenőrizzük, hogy a PHP sikeres-e és vannak-e adatok
        if (res.success && res.rewards && res.rewards.length > 0) {
          
          // Mivel a PHP-dban ORDER BY RAND() van, 
          // nekünk elég mindig az első elemet (index 0) kivenni
          this.randomReward = res.rewards[0].name;
          
          console.log("Adatbázisból érkezett jutalom:", this.randomReward);
        } else {
          // Ha a DB üres, adjunk egy hibaüzenetet, hogy tudd: baj van az adatbázissal
          this.randomReward = "Hiba: Nincs kupon a DB-ben!";
          console.error("A PHP sikerült, de a rewards tömb üres vagy success=false.");
        }
        
        // Csak a válasz megérkezése után indítjuk a kaparós felületet
        setTimeout(() => this.initScratchCard(), 150);
      },
      error: (err) => {
        console.error("Hálózati hiba a sorsoláskor:", err);
        this.randomReward = "Hálózati hiba a sorsolásnál!";
        setTimeout(() => this.initScratchCard(), 150);
      }
    });
}

  initScratchCard() {
    if (!this.canvasRef) return;

    const canvas = this.canvasRef.nativeElement;
    const ctx = canvas.getContext('2d');

    canvas.width = 300;
    canvas.height = 120;

    if (ctx) {
      // Fedőréteg stílusa
      ctx.fillStyle = '#FFD1D1';
      ctx.fillRect(0, 0, canvas.width, canvas.height);

      // Instrukció szöveg
      ctx.fillStyle = '#FF3131';
      ctx.font = 'bold 16px Arial';
      ctx.textAlign = 'center';
      ctx.fillText('Húzd az ujjad itt! ✨', 150, 65);
    }
  }

  // --- Kaparás események ---

  startScratching(e: any) {
    this.isDrawing = true;
    this.scratch(e);
  }

  stopScratching() {
    this.isDrawing = false;
  }

  scratch(event: any) {
    if (!this.isDrawing || !this.canvasRef) return;

    const canvas = this.canvasRef.nativeElement;
    const ctx = canvas.getContext('2d');
    const rect = canvas.getBoundingClientRect();

    const clientX = event.touches ? event.touches[0].clientX : event.clientX;
    const clientY = event.touches ? event.touches[0].clientY : event.clientY;

    const x = clientX - rect.left;
    const y = clientY - rect.top;

    if (ctx) {
      ctx.globalCompositeOperation = 'destination-out';
      ctx.beginPath();
      ctx.arc(x, y, 20, 0, Math.PI * 2);
      ctx.fill();
    }
  }

  reloadPage() {
    window.location.reload();
  }
}