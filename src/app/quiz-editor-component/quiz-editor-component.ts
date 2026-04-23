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

  // Új változók az egyedi munkamenethez
  currentQuizId: number | null = null;
  uniqueCode: string = '';

  showSuccessModal = false;
  generatedLink = '';
  quizCode: string = '';

  constructor(private http: HttpClient) { }

  ngOnInit() {
    // Első lépés: Létrehozunk egy egyedi kvíz ID-t az adatbázisban
    this.createNewQuizSession();
  }

  createNewQuizSession() {
    this.http.get<any>('http://localhost/Szerelmi_Kalandor/szerelmi-kalandor/backend/api/create_quiz.php')
      .subscribe({
        next: (res) => {
          if (res.success) {
            this.currentQuizId = res.quiz_id;
            this.uniqueCode = res.unique_code;
            console.log('Új kvíz munkamenet létrehozva:', this.uniqueCode);
            // Csak miután megvan az ID, töltünk be egy random alap-kérdést
            this.loadRandomQuestion();
          } else {
            console.error('Hiba a munkamenet létrehozásakor:', res.error);
          }
        },
        error: (err) => console.error('Kapcsolódási hiba a session létrehozásakor:', err)
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
            this.newQuiz.questions[0].options[0] = ''; // Üres mező a felhasználó válaszának
          }
        },
        error: (err) => console.error('Hiba a kérdés betöltésekor:', err)
      });
  }

  nextQuestion() {
    // Ellenőrzés: Ne küldjünk üres adatot
    if (!this.newQuiz.title || !this.newQuiz.questions[0].options[0]) {
      alert("Kérlek, töltsd ki a címet és a választ is! ❤️");
      return;
    }

    if (!this.currentQuizId) {
      alert("Hiba: Nincs érvényes kvíz azonosító!");
      return;
    }

    // A csomag, amit a PHP-nak küldünk
    const payload = {
      quiz_id: this.currentQuizId, // Az egyedi ID küldése
      quiz_title: this.newQuiz.title,
      question: {
        text: this.newQuiz.questions[0].text,
        category: this.newQuiz.questions[0].category || 'altalanos',
        options: [this.newQuiz.questions[0].options[0]], // A felhasználó saját válasza
        wrong_pool: this.newQuiz.questions[0].wrong_pool
      }
    };

    console.log('Küldés alatt:', payload);

    const headers = new HttpHeaders({ 'Content-Type': 'application/json' });

    this.http.post('http://localhost/Szerelmi_Kalandor/szerelmi-kalandor/backend/api/save_question_single.php',
      payload, // Az Angular HttpClient automatikusan JSON-ná alakítja
      { headers }
    ).subscribe({
      next: (res: any) => {
        console.log('Szerver válasza:', res);
        if (res.success) {
          // Ha sikerült a mentés, jöhet a következő random kérdés
          this.loadRandomQuestion();
        } else {
          alert("Szerver hiba: " + res.error);
        }
      },
      error: (err) => {
        console.error('Hálózati hiba:', err);
        alert("Kapcsolódási hiba! Ellenőrizd a PHP szervert.");
      }
    });
  }

 finishQuiz() {
  // 1. Ellenőrzés: legyen válasz az utolsó kérdésnél is
  if (!this.newQuiz.questions[0].options[0]) {
    alert("Kérlek, töltsd ki az utolsó választ is! ❤️");
    return;
  }

  // 2. A link összeállítása (a korábban már legenerált uniqueCode-ból)
  if (this.uniqueCode) {
    this.generatedLink = `http://localhost:4200/play-quiz/${this.uniqueCode}`;
    
    // 3. A MODAL MEGJELENÍTÉSE
    // Ez a sor fogja aktiválni a HTML végén lévő <div class="modal-overlay">-t
    this.showSuccessModal = true;

    // Fontos: Itt NE legyen alert() vagy prompt(), mert azok elfedik a modalt!
  } else {
    alert("Hiba: Nem sikerült azonosítani a kvízt.");
  }
}

  

  // Másolás funkció
  copyLink(inputElement: HTMLInputElement) {
    inputElement.select();
    document.execCommand('copy');
    alert('Link kimásolva a vágólapra!');
  }

  // Új kvíz indítása (oldal frissítése)
  createNewQuiz() {
    window.location.reload();
  }
}