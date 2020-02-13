import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CenaEntradaComponent } from './cena-entrada.component';

describe('CenaEntradaComponent', () => {
  let component: CenaEntradaComponent;
  let fixture: ComponentFixture<CenaEntradaComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CenaEntradaComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CenaEntradaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
