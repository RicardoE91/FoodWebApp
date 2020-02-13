import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ColacionSnackComponent } from './colacion-snack.component';

describe('ColacionSnackComponent', () => {
  let component: ColacionSnackComponent;
  let fixture: ComponentFixture<ColacionSnackComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ColacionSnackComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ColacionSnackComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
