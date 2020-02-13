import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ColacionComponent } from './colacion.component';

describe('ColacionComponent', () => {
  let component: ColacionComponent;
  let fixture: ComponentFixture<ColacionComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ColacionComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ColacionComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
