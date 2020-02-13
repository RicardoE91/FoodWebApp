import { Injectable } from '@angular/core';
import { of, Observable, throwError } from 'rxjs';
import { HttpClient, HttpHeaders, HttpRequest, HttpEvent } from '@angular/common/http';
import { map, catchError, tap } from 'rxjs/operators';import { Router } from '@angular/router';
import { formatDate, DatePipe } from '@angular/common';
import { Receta } from "../components/recetas/recetas"

@Injectable()
export class RecetaService{

private url:string='http://localhost:8080/RobustRounce/Recetas/'
private urlId:string='http://localhost:8080/RobustRounce/Recetas/FindbyId'

    constructor(private http: HttpClient, private router: Router){
      
    }

    //Obtener las recetas general
    getRecetas(): Observable<Receta[]> {
        return this.http.get<Receta[]>("http://localhost:8080/RobustRounce/Recetas/");
      } 

      getRecetaById(id:number): Observable<Receta> {      
        return this.http.get<Receta>(`${this.urlId}/${id}`);
      }
     

    /* -------------------- Desayuno -------------------- */
    //Obtener recetas Desayuno/Entrada
    getDesayunoEntrada(): Observable<Receta[]> {
        return this.http.get<Receta[]>("http://localhost:8080/RobustRounce/Recetas/1/2");
      } 
    //Obtener recetas Desayuno/PlatoFuerte
    getDesayunoPlatoFuerte(): Observable<Receta[]> {
      return this.http.get<Receta[]>("http://localhost:8080/RobustRounce/Recetas/1/3");
    }

    
    /* -------------------- Comida -------------------- */
    //Obtener recetas Comida/Entrada
    getComidaEntrada(): Observable<Receta[]> {
      return this.http.get<Receta[]>("http://localhost:8080/RobustRounce/Recetas/2/2");
    }   
    //Obtener recetas Comida/PaltoFuerte
    getComidaPlatoFuerte(): Observable<Receta[]> {
      return this.http.get<Receta[]>("http://localhost:8080/RobustRounce/Recetas/2/3");
    }   
    //Obtener recetas Comida/Postre
    getComidaPostre(): Observable<Receta[]> {
      return this.http.get<Receta[]>("http://localhost:8080/RobustRounce/Recetas/2/4");
    }   
    //Obtener recetas Comida/Snack
    getComidaSnack(): Observable<Receta[]> {
      return this.http.get<Receta[]>("http://localhost:8080/RobustRounce/Recetas/2/1");
    }   

    /* -------------------- Cena -------------------- */
    //Obtener recetas Comida/Entrada
    getCenaEntrada(): Observable<Receta[]> {
      return this.http.get<Receta[]>("http://localhost:8080/RobustRounce/Recetas/3/2");
    }   
    //Obtener recetas Comida/PaltoFuerte
    getCenaPlatoFuerte(): Observable<Receta[]> {
      return this.http.get<Receta[]>("http://localhost:8080/RobustRounce/Recetas/3/3");
    }   
    //Obtener recetas Comida/Postre
    getCenaPostre(): Observable<Receta[]> {
      return this.http.get<Receta[]>("http://localhost:8080/RobustRounce/Recetas/3/4");
    }   
    //Obtener recetas Comida/Snack
    getCenaSnack(): Observable<Receta[]> {
      return this.http.get<Receta[]>("http://localhost:8080/RobustRounce/Recetas/3/1");
    }   

       /* -------------------- Cena -------------------- */
    //Obtener recetas Comida/Postre
    getColacionPostre(): Observable<Receta[]> {
      return this.http.get<Receta[]>("http://localhost:8080/RobustRounce/Recetas/4/4");
    }   
    //Obtener recetas Comida/Snack
    getColacionSnack(): Observable<Receta[]> {
      return this.http.get<Receta[]>("http://localhost:8080/RobustRounce/Recetas/4/1");
    }  
}