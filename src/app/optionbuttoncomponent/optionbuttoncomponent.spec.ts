import { ComponentFixture, TestBed } from '@angular/core/testing';

import { Optionbuttoncomponent } from './optionbuttoncomponent';

describe('Optionbuttoncomponent', () => {
  let component: Optionbuttoncomponent;
  let fixture: ComponentFixture<Optionbuttoncomponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [Optionbuttoncomponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(Optionbuttoncomponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
