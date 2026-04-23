import { Component, signal } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { CommonModule } from '@angular/common';
import { Headercomponent } from './headercomponent/headercomponent'; // Ellenőrizd az elérési utat!

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, Headercomponent, CommonModule],
  template: `
    <app-header [currentLives]="lives()"></app-header>
    
    <main>
      <router-outlet></router-outlet>
    </main>
  `,
  styles: [`
    main {
      min-height: 100vh;
      background-color: #FFE4E1; /* A moodboardod alap rózsaszínje */
      display: flex;
      justify-content: center;
      align-items: flex-start;
      padding-top: 2rem;
    }
  `]
})
export class AppComponent {
  // Ez a szignál tárolja az életeket globálisan
  lives = signal(3);

  // Ezt a függvényt fogjuk hívni a Quiz komponensből
  onWrongAnswer() {
    if (this.lives() > 0) {
      this.lives.update(v => v - 1);
    }
  }
}