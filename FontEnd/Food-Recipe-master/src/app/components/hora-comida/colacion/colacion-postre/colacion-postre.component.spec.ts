import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ColacionPostreComponent } from './colacion-postre.component';

describe('ColacionPostreComponent', () => {
  let component: ColacionPostreComponent;
  let fixture: ComponentFixture<ColacionPostreComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ColacionPostreComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ColacionPostreComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
