import { Component, OnInit } from '@angular/core';
import {RecetaService} from '../../../../services/receta.service';
import { ActivatedRoute } from '@angular/router';
import { faShareAlt } from '@fortawesome/free-solid-svg-icons';
import { faHeart } from '@fortawesome/free-solid-svg-icons';

@Component({
  selector: 'app-cena-plato-fuerte',
  templateUrl: './cena-plato-fuerte.component.html',
  styleUrls: ['./cena-plato-fuerte.component.css']
})
export class CenaPlatoFuerteComponent implements OnInit {
  public recetas: any = [];
  faShareAlt = faShareAlt;
  faHeart = faHeart;

  constructor(private _RecetaService: RecetaService, private activatedRoute: ActivatedRoute) { }

  ngOnInit() {
    this._RecetaService.getCenaPlatoFuerte().subscribe(
    data => {
      this.recetas = data ;
      console.log(data);
      console.log("AppComponent: ", this.recetas);
    },
    error => {
      console.log(error)
    }
  )
  }

}
