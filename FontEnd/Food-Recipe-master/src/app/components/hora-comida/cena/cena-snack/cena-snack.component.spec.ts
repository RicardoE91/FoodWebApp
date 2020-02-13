import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CenaSnackComponent } from './cena-snack.component';

describe('CenaSnackComponent', () => {
  let component: CenaSnackComponent;
  let fixture: ComponentFixture<CenaSnackComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CenaSnackComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CenaSnackComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
