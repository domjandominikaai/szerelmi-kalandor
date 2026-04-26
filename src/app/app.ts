import { Component, signal } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { CommonModule } from '@angular/common';
import { Headercomponent } from './headercomponent/headercomponent';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, Headercomponent, CommonModule],
  templateUrl: './app.html',
  styleUrl: './app.scss',
})
export class AppComponent {
  lives = signal(3);

  onWrongAnswer() {
    if (this.lives() > 0) {
      this.lives.update(v => v - 1);
    }
  }

  openCoffee(event: Event) {
    event.preventDefault();
    event.stopPropagation();
    window.open('https://www.buymeacoffee.com/dominikatok', '_blank');
  }
}
