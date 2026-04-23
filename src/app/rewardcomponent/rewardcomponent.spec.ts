import { ComponentFixture, TestBed } from '@angular/core/testing';

import { Rewardcomponent } from './rewardcomponent';

describe('Rewardcomponent', () => {
  let component: Rewardcomponent;
  let fixture: ComponentFixture<Rewardcomponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [Rewardcomponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(Rewardcomponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
