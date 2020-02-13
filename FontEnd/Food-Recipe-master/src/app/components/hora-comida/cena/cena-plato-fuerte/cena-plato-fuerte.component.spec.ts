import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CenaPlatoFuerteComponent } from './cena-plato-fuerte.component';

describe('CenaPlatoFuerteComponent', () => {
  let component: CenaPlatoFuerteComponent;
  let fixture: ComponentFixture<CenaPlatoFuerteComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CenaPlatoFuerteComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CenaPlatoFuerteComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
