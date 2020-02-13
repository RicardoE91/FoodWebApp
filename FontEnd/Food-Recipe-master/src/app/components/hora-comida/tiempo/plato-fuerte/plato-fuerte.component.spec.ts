import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PlatoFuerteComponent } from './plato-fuerte.component';

describe('PlatoFuerteComponent', () => {
  let component: PlatoFuerteComponent;
  let fixture: ComponentFixture<PlatoFuerteComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PlatoFuerteComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PlatoFuerteComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
