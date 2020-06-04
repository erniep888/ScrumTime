import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ScrumTimeHomeComponent } from './scrum-time-home.component';

describe('ScrumTimeHomeComponent', () => {
  let component: ScrumTimeHomeComponent;
  let fixture: ComponentFixture<ScrumTimeHomeComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ScrumTimeHomeComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ScrumTimeHomeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
