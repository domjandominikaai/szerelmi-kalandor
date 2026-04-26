import { Component, OnInit } from '@angular/core';
import { HttpClient, HttpClientModule } from '@angular/common/http';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { environment } from '../../environments/environment';

@Component({
  selector: 'app-quiz-editor',
  standalone: true,
  imports: [CommonModule, FormsModule, HttpClientModule],
  templateUrl: './quiz-editor-component.html',
  styleUrl: './quiz-editor-component.scss'
})
export class QuizEditorComponent implements OnInit {
  newQuiz = {
    title: '',
    questions: [{
      text: '',
      category: '',
      options: ['', '', '', ''],
      correctIndex: 0,
      wrong_pool: [] as string[]
    }]
  };

  currentQuizId: number | null = null;
  uniqueCode = '';
  showSuccessModal = false;
  generatedLink = '';
  savedCount = 0;

  constructor(private http: HttpClient) {}

  ngOnInit() {
    this.createNewQuizSession();
  }

  createNewQuizSession() {
    this.http.get<any>(`${environment.apiUrl}/create_quiz.php`).subscribe({
      next: (res) => {
        if (res.success) {
          this.currentQuizId = res.quiz_id;
          this.uniqueCode = res.unique_code;
          this.loadRandomQuestion();
        }
      },
      error: (err) => console.error('Hiba a session létrehozásakor:', err)
    });
  }

  loadRandomQuestion() {
    this.http.get<any>(`${environment.apiUrl}/get_random_question.php`).subscribe({
      next: (data) => {
        if (data && !data.error) {
          this.newQuiz.questions[0].text = data.text;
          this.newQuiz.questions[0].category = data.category;
          this.newQuiz.questions[0].wrong_pool = data.wrong_pool;
          this.newQuiz.questions[0].options[0] = '';
        }
      }
    });
  }

  private saveCurrentQuestion(callback?: () => void) {
    if (!this.newQuiz.title?.trim() || !this.newQuiz.questions[0].options[0]?.trim()) {
      alert('Kérlek, töltsd ki a kvíz nevét és a válaszodat is! ❤️');
      return;
    }

    const payload = {
      quiz_id: this.currentQuizId,
      quiz_title: this.newQuiz.title,
      question: {
        text: this.newQuiz.questions[0].text,
        category: this.newQuiz.questions[0].category || 'altalanos',
        options: [this.newQuiz.questions[0].options[0]],
        wrong_pool: this.newQuiz.questions[0].wrong_pool
      }
    };

    this.http.post(`${environment.apiUrl}/save_question_single.php`, payload).subscribe({
      next: (res: any) => {
        if (res.success) {
          if (callback) callback();
        } else {
          alert('Mentési hiba: ' + res.error);
        }
      },
      error: () => alert('Kapcsolódási hiba!')
    });
  }

  nextQuestion() {
    this.saveCurrentQuestion(() => {
      this.savedCount++;
      this.loadRandomQuestion();
    });
  }

  finishQuiz() {
    this.saveCurrentQuestion(() => {
      if (this.uniqueCode) {
        this.generatedLink = `${window.location.origin}/play-quiz/${this.uniqueCode}`;
        this.showSuccessModal = true;
      }
    });
  }

  copyLink(inputElement: HTMLInputElement) {
    inputElement.select();
    navigator.clipboard.writeText(inputElement.value).then(() => {
      alert('Link kimásolva! 💌');
    });
  }

  createNewQuiz() {
    window.location.reload();
  }

  openCoffee(event: Event) {
    event.preventDefault();
    event.stopPropagation();
    window.open('https://www.buymeacoffee.com/dominikatok', '_blank');
  }
}
