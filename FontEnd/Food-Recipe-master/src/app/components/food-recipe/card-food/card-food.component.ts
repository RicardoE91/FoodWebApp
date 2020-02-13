import { Component, OnInit } from '@angular/core';
import { faShareAlt } from '@fortawesome/free-solid-svg-icons';
import { faHeart } from '@fortawesome/free-solid-svg-icons';



@Component({
  selector: 'app-card-food',
  templateUrl: './card-food.component.html',
  styleUrls: ['./card-food.component.css']
})
export class CardFoodComponent implements OnInit {
  faShareAlt = faShareAlt;
  faHeart = faHeart;


  constructor() { }

  ngOnInit() {
  }

}
