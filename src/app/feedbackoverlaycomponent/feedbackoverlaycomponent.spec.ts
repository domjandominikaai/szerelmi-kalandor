import { ComponentFixture, TestBed } from '@angular/core/testing';

import { Feedbackoverlaycomponent } from './feedbackoverlaycomponent';

describe('Feedbackoverlaycomponent', () => {
  let component: Feedbackoverlaycomponent;
  let fixture: ComponentFixture<Feedbackoverlaycomponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [Feedbackoverlaycomponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(Feedbackoverlaycomponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
