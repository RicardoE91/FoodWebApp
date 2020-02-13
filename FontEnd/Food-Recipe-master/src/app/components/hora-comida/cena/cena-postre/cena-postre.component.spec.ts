import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CenaPostreComponent } from './cena-postre.component';

describe('CenaPostreComponent', () => {
  let component: CenaPostreComponent;
  let fixture: ComponentFixture<CenaPostreComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CenaPostreComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CenaPostreComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
