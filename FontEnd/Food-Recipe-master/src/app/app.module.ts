import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule }   from '@angular/forms';

import { AppComponent } from './app.component';
import { RouterModule, Routes } from '@angular/router';
import { HttpClientModule } from '@angular/common/http';


import { CardFoodComponent } from './components/food-recipe/tarjeta-individual/card-food.component';
import { FontAwesomeModule } from '@fortawesome/angular-fontawesome';
import { InicioComponent } from './components/inicio/inicio.component';
import { ComidaComponent } from './components/hora-comida/tiempo/tiempo.component';
import { NavbarComponent } from './components/cabezera/navbar/navbar.component';
import { DesayunoComponent } from './components/hora-comida/desayuno/desayuno.component';
import { CenaComponent } from './components/hora-comida/cena/cena.component';
import { ColacionComponent } from './components/hora-comida/colacion/colacion.component';
import { RecetasComponent } from './components/recetas/recetas.component';
import { NewRecipeComponent } from './components/food-recipe/nueva-receta/new-recipe.component';
import { PerfilComponent } from './components/perfil/perfil.component';

import { MessageService } from './services/message.service';
import { AuthGuard } from './services/auth.guard';
import { ContactoComponent } from './components/contacto/contacto.component';
import { FooterComponent } from './components/footer/footer.component';
import { RecetaService } from './services/receta.service';

/* Desayuno */
import { DesayunoEntradaComponent } from './components/hora-comida/desayuno/entrada/entrada.component';
import { PlatoFuerteComponent } from './components/hora-comida/desayuno/plato-fuerte/plato-fuerte.component';

/* Comida */
import { ComidaEntradaComponent } from './components/hora-comida/tiempo/entrada/entrada.component';
import { ComidaPlatoFuerteComponent } from './components/hora-comida/tiempo/plato-fuerte/plato-fuerte.component';
import { ComidaPostreComponent } from './components/hora-comida/tiempo/postre/postre.component';
import { ComidaSnackComponent } from './components/hora-comida/tiempo/snack/snack.component';

/* Cena */
import { CenaEntradaComponent } from './components/hora-comida/cena/cena-entrada/cena-entrada.component';
import { CenaPlatoFuerteComponent } from './components/hora-comida/cena/cena-plato-fuerte/cena-plato-fuerte.component';
import { CenaPostreComponent } from './components/hora-comida/cena/cena-postre/cena-postre.component';
import { CenaSnackComponent } from './components/hora-comida/cena/cena-snack/cena-snack.component';

/* Colacion */
import { ColacionPostreComponent } from './components/hora-comida/colacion/colacion-postre/colacion-postre.component';
import { ColacionSnackComponent } from './components/hora-comida/colacion/colacion-snack/colacion-snack.component';


const appRoutes: Routes = [
  { path: 'inicio', component: InicioComponent },
  { path: 'recetas', component: RecetasComponent },
  { path: 'receta/:id', component: CardFoodComponent },

  { path: 'contacto', component: ContactoComponent },

  { path: 'comida', component: ComidaComponent },
  { path: 'comida/entrada', component: ComidaEntradaComponent },
  { path: 'comida/plato-fuerte', component: ComidaPlatoFuerteComponent },
  { path: 'comida/postre', component: ComidaPostreComponent },
  { path: 'comida/snack', component: ComidaSnackComponent },

  { path: 'desayuno', component: DesayunoComponent},
  { path: 'desayuno/entrada', component: DesayunoEntradaComponent},
  { path: 'desayuno/plato-fuerte', component: PlatoFuerteComponent},

  { path: 'cena', component: CenaComponent },
  { path: 'cena/entrada', component: CenaEntradaComponent },
  { path: 'cena/plato-fuerte', component: CenaPlatoFuerteComponent },
  { path: 'cena/postre', component: CenaPostreComponent },
  { path: 'cena/snack', component: CenaSnackComponent },

  { path: 'colacion', component: ColacionComponent },
  { path: 'colacion/postre', component: ColacionPostreComponent },
  { path: 'colacion/snack', component: ColacionSnackComponent },

  { path: 'recetario/crear', component: NewRecipeComponent },

  { path: 'perfil', 
    component: PerfilComponent,
    canActivate: [AuthGuard] },

  { path: '**', component: InicioComponent }
];


@NgModule({
  declarations: [
    AppComponent,
    CardFoodComponent,
    InicioComponent,
    ComidaComponent,
    NavbarComponent,
    DesayunoComponent,
    CenaComponent,
    ColacionComponent,
    RecetasComponent,
    NewRecipeComponent,
    PerfilComponent,
    ContactoComponent,
    FooterComponent,

    DesayunoEntradaComponent,
    PlatoFuerteComponent,

    ComidaEntradaComponent,
    ComidaPlatoFuerteComponent,
    ComidaPostreComponent,
    ComidaSnackComponent,

    CenaEntradaComponent,
    CenaPlatoFuerteComponent,
    CenaPostreComponent,
    CenaSnackComponent,
    ColacionPostreComponent,
    ColacionSnackComponent,
  ],
  imports: [
    RouterModule.forRoot(
      appRoutes,
      { enableTracing: true } // <-- debugging purposes only
    ),
    BrowserModule,
    FontAwesomeModule,
    HttpClientModule,
    FormsModule      
  ],
  providers: [MessageService, RecetaService],
  bootstrap: [AppComponent]
})
export class AppModule { }
