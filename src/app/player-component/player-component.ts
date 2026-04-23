import { CommonModule } from '@angular/common';
import { HttpClient, HttpClientModule } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { AppComponent } from '../app'; // Importáld be az App-ot a Signal eléréséhez

@Component({
  selector: 'app-player-component',
  standalone: true,
  imports: [CommonModule, HttpClientModule],
  templateUrl: './player-component.html',
  styleUrl: './player-component.scss',
})
export class PlayerComponent implements OnInit {
  questions: any[] = [];
  currentIndex = 0;
  score = 0;
  quizFinished = false;
  loading = true;
  quizTitle = '';

  // Helyi változó a modal és a logika számára
  lives = 3;
  gameOver = false;

  funnyMessage = '';
  showWrongAnswerModal = false;

  constructor(
    private route: ActivatedRoute,
    private http: HttpClient,
    private appRef: AppComponent // Injektáljuk az AppComponent-et
  ) { }

  ngOnInit() {
    const code = this.route.snapshot.paramMap.get('code');
    if (code) {
      this.loadQuizData(code);
    }
    // Szinkronizáljuk a helyi életet az App-ban lévő Signallal az elején
    this.lives = this.appRef.lives();
  }

  get currentQuestion() {
    return this.questions[this.currentIndex];
  }

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
      this.showGameOverModal();
    } else {
      // Vicces üzenet lekérése a backendről
      this.http.get<any>('http://localhost/Szerelmi_Kalandor/szerelmi-kalandor/backend/api/get_funny_message.php?type=wrong')
        .subscribe(res => {
          if (res.success) {
            this.funnyMessage = res.message;
            this.showWrongAnswerModal = true; // Megnyitjuk az ugyanolyan típusú modalt
          }
        });
    }
  }

    nextQuestion() {
      if (this.currentIndex < this.questions.length - 1) {
        this.currentIndex++;
      } else {
        this.quizFinished = true;
      }
    }

    showGameOverModal() {
      this.gameOver = true;
    }

    reloadPage() {
      // Újraindításkor érdemes a szíveket is visszaállítani a Signalban!
      // Ehhez az app.ts-be kell egy lives.set(3) típusú metódus
      window.location.reload();
    }
  }