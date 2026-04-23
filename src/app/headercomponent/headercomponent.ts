import { Component, Input } from '@angular/core';
import { CommonModule } from '@angular/common'; // Mindig jó, ha bent van

@Component({
  selector: 'app-header', // Rövidítsük le 'app-header'-re, hogy egyezzen az app.ts-szel
  standalone: true,      // Standalone módban ez kötelező
  imports: [CommonModule],
  templateUrl: './headercomponent.html',
  styleUrl: './headercomponent.scss',
})
export class Headercomponent {
  @Input() currentLives: number = 3;
}