import { Component, OnInit } from '@angular/core';
import {RecetaService} from '../../../../services/receta.service';
import { ActivatedRoute } from '@angular/router';
import { faShareAlt } from '@fortawesome/free-solid-svg-icons';
import { faHeart } from '@fortawesome/free-solid-svg-icons';

@Component({
  selector: 'app-snack',
  templateUrl: './snack.component.html',
  styleUrls: ['./snack.component.css']
})
export class ComidaSnackComponent implements OnInit {
  public recetas: any = [];
  faShareAlt = faShareAlt;
  faHeart = faHeart;

  constructor(private _RecetaService: RecetaService, private activatedRoute: ActivatedRoute) { }

  ngOnInit() { 
    this._RecetaService.getDesayunoEntrada().subscribe(
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
