import { Component, OnInit, Renderer2, ElementRef } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { HttpClient, HttpClientModule } from '@angular/common/http';
import { AppComponent } from '../app';
import { Router } from '@angular/router';
import { environment } from '../../environments/environment';

@Component({
  selector: 'app-quizcomponent',
  standalone: true,
  imports: [CommonModule, FormsModule, HttpClientModule],
  templateUrl: './quizcomponent.html',
  styleUrl: './quizcomponent.scss',
})
export class Quizcomponent implements OnInit {
  questions: any[] = [];
  currentIndex = 0;

  isLoaded = false;
  isStarted = false;
  isPhaseTwo = false;
  gameOver = false;
  score = 0;

  userName = '';
  partnerName = '';
  feedbackMessage: string | null = null;
  isCorrect = false;

  constructor(
    private app: AppComponent,
    private http: HttpClient,
    private renderer: Renderer2,
    private el: ElementRef,
    private router: Router
  ) {}

  ngOnInit() {
    this.fetchQuestions();
  }

  fetchQuestions() {
    this.http.get<any>(`${environment.apiUrl}/get_quiz.php`).subscribe({
      next: (data) => {
        this.questions = data.questions;
        setTimeout(() => { this.isLoaded = true; }, 1200);
      },
      error: () => { this.isLoaded = true; }
    });
  }

  get currentQuestion() {
    if (this.questions?.length && this.currentIndex < this.questions.length) {
      return this.questions[this.currentIndex];
    }
    return null;
  }

  submitUserAnswer(answer: string) {
    if (!answer?.trim()) {
      alert('Kérlek, írj be valamit! ❤️');
      return;
    }

    const currentQ = this.questions[this.currentIndex];
    const correctAnswer = answer.trim();

    let options = currentQ.wrong_pool
      .filter((a: string) => a.toLowerCase() !== correctAnswer.toLowerCase())
      .sort(() => 0.5 - Math.random())
      .slice(0, 3);

    options.push(correctAnswer);
    currentQ.options = options.sort(() => 0.5 - Math.random());
    currentQ.correctIndex = currentQ.options.indexOf(correctAnswer);

    if (this.currentIndex < this.questions.length - 1) {
      this.currentIndex++;
    } else {
      this.currentIndex = 0;
      this.isPhaseTwo = true;
    }
  }

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
    for (let i = 0; i < 20; i++) {
      const svg = this.renderer.createElement('svg', 'http://www.w3.org/2000/svg');
      this.renderer.setAttribute(svg, 'viewBox', '0 0 24 24');
      this.renderer.addClass(svg, 'burst-heart-svg');
      const path = this.renderer.createElement('path', 'http://www.w3.org/2000/svg');
      this.renderer.setAttribute(path, 'd', heartPath);
      this.renderer.appendChild(svg, path);

      const angle = Math.random() * Math.PI * 2;
      const velocity = 70 + Math.random() * 110;
      this.renderer.setStyle(svg, '--tx', `${Math.cos(angle) * velocity}px`);
      this.renderer.setStyle(svg, '--ty', `${Math.sin(angle) * velocity}px`);
      this.renderer.setStyle(svg, '--scale', String(0.5 + Math.random()));
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
    const button = event.currentTarget as HTMLElement;
    const container = button.querySelector('.heart-burst-container');
    if (container) this.createHeartBurst(container);
    setTimeout(() => { this.router.navigate(['/quiz-editor']); }, 600);
  }
}
