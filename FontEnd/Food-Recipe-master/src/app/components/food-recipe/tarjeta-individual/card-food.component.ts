import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from "@angular/router"
import { RecetaService } from '../../../services/receta.service';
import { Receta } from '../../recetas/recetas'


@Component({
  selector: 'app-card-food',
  templateUrl: './card-food.component.html',
  styleUrls: ['./card-food.component.css']
})
export class CardFoodComponent implements OnInit {
 
  _receta : Receta;

  constructor(private _recetaService : RecetaService,
              private _activatedRoute : ActivatedRoute) { }

  ngOnInit() {
    this.ObtenerReceta();
  }

  ObtenerReceta() : void{
    this._activatedRoute.params.subscribe(
      params => {
        let id = params['id'];
        if(id)
        this._recetaService.getRecetaById(id).subscribe((receta) => {
        this._receta = receta, console.log(receta) 
        });
      }
    )
  }

}
