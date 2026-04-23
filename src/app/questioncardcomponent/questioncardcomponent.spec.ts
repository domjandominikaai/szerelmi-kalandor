import { ComponentFixture, TestBed } from '@angular/core/testing';

import { Questioncardcomponent } from './questioncardcomponent';

describe('Questioncardcomponent', () => {
  let component: Questioncardcomponent;
  let fixture: ComponentFixture<Questioncardcomponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [Questioncardcomponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(Questioncardcomponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
