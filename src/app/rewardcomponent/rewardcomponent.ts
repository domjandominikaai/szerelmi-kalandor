import { Component, ElementRef, ViewChild, AfterViewInit} from '@angular/core';

@Component({
  selector: 'app-rewardcomponent',
  imports: [],
  templateUrl: './rewardcomponent.html',
  styleUrl: './rewardcomponent.scss',
})
export class Rewardcomponent {
  @ViewChild('scratchCanvas') canvasRef!: ElementRef<HTMLCanvasElement>;
  canvas!: HTMLCanvasElement;
  ctx!: CanvasRenderingContext2D | null;
  
  isDrawing = false; // A kaparás állapotkövetése
  userPoints = 150;  // Teszt pontszám (később API-ból jön)
  
  currentPrize = {
    icon: '🎁',
    name: 'Egy masszázs kupon',
    description: 'Beváltható bármikor, amikor elfáradtál!'
  };

  constructor() {}

  // AfterViewInit-ben már elérjük a HTML elemeket
  ngAfterViewInit() {
    if (this.userPoints >= 100) {
      this.initCanvas();
    }
  }

  initCanvas() {
    this.canvas = this.canvasRef.nativeElement;
    this.ctx = this.canvas.getContext('2d');
    
    // Beállítjuk a canvas tényleges méretét
    this.canvas.width = 320;
    this.canvas.height = 180;

    if (this.ctx) {
      // Ezüstös-szürke fedőréteg
      this.ctx.fillStyle = '#C0C0C0';
      this.ctx.fillRect(0, 0, this.canvas.width, this.canvas.height);
      
      // Ráírunk valamit, hogy tudja, mit kell tenni
      this.ctx.fillStyle = '#666';
      this.ctx.font = 'bold 18px Arial';
      this.ctx.textAlign = 'center';
      this.ctx.fillText('Kaparj le!', 160, 95);
    }
  }

  // --- Eseménykezelők ---

  startScratching(event: any) {
    this.isDrawing = true;
    this.scratch(event); // Rögtön az első érintésnél is kaparjon
  }

  stopScratching() {
    this.isDrawing = false;
  }

  scratch(event: any) {
    if (!this.isDrawing || !this.ctx) return;

    const rect = this.canvas.getBoundingClientRect();
    
    // Kezeljük az egér és az érintőképernyő koordinátáit is
    const clientX = event.touches ? event.touches[0].clientX : event.clientX;
    const clientY = event.touches ? event.touches[0].clientY : event.clientY;
    
    const x = clientX - rect.left;
    const y = clientY - rect.top;

    // Itt történik a varázslat: "kitöröljük" a szürke réteget
    this.ctx.globalCompositeOperation = 'destination-out';
    this.ctx.beginPath();
    this.ctx.arc(x, y, 20, 0, Math.PI * 2);
    this.ctx.fill();
  }

}
