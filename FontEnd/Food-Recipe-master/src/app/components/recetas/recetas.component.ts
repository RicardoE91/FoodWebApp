import { Component, OnInit } from '@angular/core';
import {RecetaService} from '../../services/receta.service';
import { ActivatedRoute } from '@angular/router';
import { faShareAlt } from '@fortawesome/free-solid-svg-icons';
import { faHeart } from '@fortawesome/free-solid-svg-icons';


@Component({
  selector: 'app-recetas',
  templateUrl: './recetas.component.html',
  styleUrls: ['./recetas.component.css']
})
export class RecetasComponent implements OnInit {

  public recetas: any = [];
  faShareAlt = faShareAlt;
  faHeart = faHeart;

  
  constructor(private _RecetaService: RecetaService, private activatedRoute: ActivatedRoute) { }

  ngOnInit() {
    this._RecetaService.getRecetas().subscribe(
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
