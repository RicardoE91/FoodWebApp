import { Component, OnInit } from '@angular/core';
import { MessageService } from '../../services/message.service';
import Swal from 'sweetalert2'


@Component({
  selector: 'app-contacto',
  templateUrl: './contacto.component.html',
  styleUrls: ['./contacto.component.css']
})
export class ContactoComponent implements OnInit {

  constructor(public _MessageService: MessageService) { }

  ngOnInit() {
  }

  contactForm(form) {
    this._MessageService.sendMessage(form).subscribe(() => {
      Swal.fire({
        position: 'top-end',
        icon: 'success',
        title: 'Tu mensaje ha sivo enviado',
        showConfirmButton: false,
        timer: 1500
      })
    });
    } 

}
