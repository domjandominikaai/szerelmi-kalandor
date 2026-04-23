import { Component, OnInit } from '@angular/core';
import { HttpClient, HttpClientModule, HttpHeaders } from '@angular/common/http';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

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
    questions: [
      {
        text: '',
        category: '',
        options: ['', '', '', ''],
        correctIndex: 0,
        wrong_pool: [] as string[]
      }
    ]
  };

  currentQuizId: number | null = null;
  uniqueCode: string = '';
  showSuccessModal = false;
  generatedLink = '';

  constructor(private http: HttpClient) { }

  ngOnInit() {
    this.createNewQuizSession();
  }

  createNewQuizSession() {
    this.http.get<any>('http://localhost/Szerelmi_Kalandor/szerelmi-kalandor/backend/api/create_quiz.php')
      .subscribe({
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
    this.http.get<any>('http://localhost/Szerelmi_Kalandor/szerelmi-kalandor/backend/api/get_random_question.php')
      .subscribe({
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

  // Ez a belső segédfüggvény végzi a tényleges mentést, hogy ne kelljen ismételni a kódot
  private saveCurrentQuestion(callback?: () => void) {
    if (!this.newQuiz.title || !this.newQuiz.questions[0].options[0]) {
      alert("Kérlek, töltsd ki a címet és a választ is! ❤️");
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

    this.http.post('http://localhost/Szerelmi_Kalandor/szerelmi-kalandor/backend/api/save_question_single.php', payload)
      .subscribe({
        next: (res: any) => {
          if (res.success) {
            if (callback) callback();
          } else {
            alert("Mentési hiba: " + res.error);
          }
        },
        error: (err) => alert("Kapcsolódási hiba!")
      });
  }

  nextQuestion() {
    this.saveCurrentQuestion(() => {
      // Mentés után új kérdést kérünk
      this.loadRandomQuestion();
    });
  }

  finishQuiz() {
    // Utolsó kérdés mentése, majd a modal megnyitása
    this.saveCurrentQuestion(() => {
      if (this.uniqueCode) {
        // Ügyelj az útvonalra: play-quiz vagy play? Használd azt, ami a routingban van!
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
}