import { Component, OnInit } from '@angular/core';
import {RecetaService} from '../../../../services/receta.service';
import { ActivatedRoute } from '@angular/router';
import { faShareAlt } from '@fortawesome/free-solid-svg-icons';
import { faHeart } from '@fortawesome/free-solid-svg-icons';

@Component({
  selector: 'app-cena-snack',
  templateUrl: './cena-snack.component.html',
  styleUrls: ['./cena-snack.component.css']
})
export class CenaSnackComponent implements OnInit {
  public recetas: any = [];
  faShareAlt = faShareAlt;
  faHeart = faHeart;

  constructor(private _RecetaService: RecetaService, private activatedRoute: ActivatedRoute) { }

  ngOnInit() {
    this._RecetaService.getCenaSnack().subscribe(
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
