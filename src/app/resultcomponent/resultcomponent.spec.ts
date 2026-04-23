import { ComponentFixture, TestBed } from '@angular/core/testing';

import { Resultcomponent } from './resultcomponent';

describe('Resultcomponent', () => {
  let component: Resultcomponent;
  let fixture: ComponentFixture<Resultcomponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [Resultcomponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(Resultcomponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
