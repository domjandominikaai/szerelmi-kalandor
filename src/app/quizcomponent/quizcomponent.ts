import { Component, OnInit, Renderer2, ElementRef } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { HttpClient, HttpClientModule } from '@angular/common/http';
import { AppComponent } from '../app';
import { Router } from '@angular/router';

@Component({
  selector: 'app-quizcomponent',
  standalone: true,
  imports: [CommonModule, FormsModule, HttpClientModule],
  templateUrl: './quizcomponent.html',
  styleUrl: './quizcomponent.scss',
})
export class Quizcomponent implements OnInit {
  questions: any[] = [];
  currentIndex: number = 0;
  
  // Állapotjelzők
  isLoaded: boolean = false;
  isStarted: boolean = false;
  isPhaseTwo: boolean = false; // ÚJ: Jelzi, hogy a kitalálós fázisban vagyunk-e
  gameOver: boolean = false;
  score: number = 0;

  userName: string = '';
  partnerName: string = '';
  feedbackMessage: string | null = null;
  isCorrect: boolean = false;

  constructor(private app: AppComponent, private http: HttpClient, private renderer: Renderer2, private el: ElementRef, private router: Router) {}

  ngOnInit() {
    this.fetchQuestions();
  }

  fetchQuestions() {
    this.http.get<any>('http://localhost/Szerelmi_Kalandor/szerelmi-kalandor/backend/api/get_quiz.php').subscribe({
      next: (data) => {
        this.questions = data.questions;
        // Mesterséges késleltetés a lüktető szívhez
        setTimeout(() => { this.isLoaded = true; }, 2000);
      },
      error: (err) => {
        console.error('Hiba az adatok betöltésekor:', err);
        this.isLoaded = true;
      }
    });
  }

 get currentQuestion() {
  // Csak akkor adjunk vissza kérdést, ha van mit!
  if (this.questions && this.questions.length > 0 && this.currentIndex < this.questions.length) {
    return this.questions[this.currentIndex];
  }
  return null; // Ha nincs adat, null-t adunk vissza, amit a HTML le tud kezelni
}

  // 1. FÁZIS: A vásárló (Dominika) rögzíti a saját válaszát
  submitUserAnswer(answer: string) {
    if (!answer || !answer.trim()) {
      alert('Kérlek, írj be valamit! ❤️');
      return;
    }

    const currentQ = this.questions[this.currentIndex];
    const correctAnswer = answer.trim();

    // Opciók generálása a PHP-tól kapott wrong_pool-ból
    // Kiválasztunk 3 random elemet, ami nem egyezik a beírttal
    let options = currentQ.wrong_pool
      .filter((a: string) => a.toLowerCase() !== correctAnswer.toLowerCase())
      .sort(() => 0.5 - Math.random())
      .slice(0, 3);

    // Hozzáadjuk a helyeset és megkeverjük
    options.push(correctAnswer);
    currentQ.options = options.sort(() => 0.5 - Math.random());
    currentQ.correctIndex = currentQ.options.indexOf(correctAnswer);

    // Továbblépés vagy fázisváltás
    if (this.currentIndex < this.questions.length - 1) {
      this.currentIndex++;
    } else {
      // Ha minden kérdésre válaszolt, jöhet a párja
      this.currentIndex = 0;
      this.isPhaseTwo = true;
    }
  }

  // 2. FÁZIS: A párja (Jani) tippel
  onAnswer(index: number) {
    if (this.feedbackMessage || this.gameOver) return;

    if (index === this.currentQuestion.correctIndex) {
      this.isCorrect = true;
      this.score++;
      this.feedbackMessage = 'Eltaláltad! ❤️';
    } else {
      this.isCorrect = false;
      this.feedbackMessage = 'Sajnos nem ez volt... 💔';
      if (this.app?.onWrongAnswer) this.app.onWrongAnswer();
    }

    setTimeout(() => {
      this.feedbackMessage = null;
      if (this.currentIndex < this.questions.length - 1) {
        this.currentIndex++;
      } else {
        this.gameOver = true;
      }
    }, 1500);
  }

  // Kezdőképernyő indítása animációval
  startQuizWithAnim(event: MouseEvent) {
    if (!this.userName.trim() || !this.partnerName.trim()) {
      alert('Kérlek, töltsd ki mindkét nevet! ❤️');
      return;
    }
    const button = event.currentTarget as HTMLElement;
    const container = button.querySelector('.heart-burst-container');
    if (container) this.createHeartBurst(container);

    setTimeout(() => { this.isStarted = true; }, 800);
  }

  private createHeartBurst(container: Element) {
    const heartPath = 'M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z';
    for (let i = 0; i < 25; i++) {
      const svg = this.renderer.createElement('svg', 'http://www.w3.org/2000/svg');
      this.renderer.setAttribute(svg, 'viewBox', '0 0 24 24');
      this.renderer.addClass(svg, 'burst-heart-svg');
      const path = this.renderer.createElement('path', 'http://www.w3.org/2000/svg');
      this.renderer.setAttribute(path, 'd', heartPath);
      this.renderer.appendChild(svg, path);

      const angle = Math.random() * Math.PI * 2;
      const velocity = 80 + Math.random() * 120;
      const tx = Math.cos(angle) * velocity;
      const ty = Math.sin(angle) * velocity;
      this.renderer.setStyle(svg, '--tx', `${tx}px`);
      this.renderer.setStyle(svg, '--ty', `${ty}px`);
      this.renderer.setStyle(svg, '--scale', 0.5 + Math.random());
      this.renderer.setStyle(svg, '--rot', `${Math.random() * 360}deg`);

      this.renderer.appendChild(container, svg);
      setTimeout(() => this.renderer.removeChild(container, svg), 850);
    }
  }

  resetGame() {
    this.isStarted = false;
    this.isPhaseTwo = false;
    this.gameOver = false;
    this.currentIndex = 0;
    this.score = 0;
    this.fetchQuestions();
  }

  goToEditor(event: MouseEvent) {
    // 1. Megkeressük a gombot az animációhoz
    const button = event.currentTarget as HTMLElement;
    const container = button.querySelector('.heart-burst-container');
    
    // 2. Elindítjuk a szívrobbanást, ha van konténer
    if (container) {
      this.createHeartBurst(container);
    }

    // 3. Navigáció 800ms után (amikor az animáció látványos)
    setTimeout(() => {
      console.log('Navigálás a szerkesztőbe...');
      this.router.navigate(['/quiz-editor']).then(success => {
        if (!success) {
          console.error('A navigáció sikertelen! Ellenőrizd az app.routes.ts fájlt.');
        }
      });
    }, 800);
  }
}