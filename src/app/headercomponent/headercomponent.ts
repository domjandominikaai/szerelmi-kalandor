import { Component, Input } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterLink } from '@angular/router';

@Component({
  selector: 'app-header',
  standalone: true,
  imports: [CommonModule, RouterLink],
  templateUrl: './headercomponent.html',
  styleUrl: './headercomponent.scss',
})
export class Headercomponent {
  @Input() currentLives: number = 3;
}
