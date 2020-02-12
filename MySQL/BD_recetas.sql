CREATE DATABASE  IF NOT EXISTS recetas;
USE recetas;

CREATE TABLE rol(
  rol_id int(11) NOT NULL AUTO_INCREMENT,
  descripcion varchar(25) DEFAULT NULL,
  PRIMARY KEY (rol_id) 
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE usuario (
  usuario_id int(11) NOT NULL AUTO_INCREMENT,
  nombre_usuario varchar(30) DEFAULT NULL,
  nombre varchar(40) DEFAULT NULL,
  apellido varchar(50) DEFAULT NULL,
  rol_id int(11) DEFAULT NULL,
  estatus tinyint (1) DEFAULT NULL,
  biografia varchar(750) DEFAULT NULL,
  correo varchar(40) DEFAULT NULL,
  password varchar(20) DEFAULT NULL,
  PRIMARY KEY(usuario_id),
  CONSTRAINT fk_usuario_rol FOREIGN KEY (rol_id) REFERENCES rol(rol_id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE horario_comida(
  horario_comida_id int (11) NOT NULL AUTO_INCREMENT,
  descripcion varchar(25)DEFAULT NULL,
  PRIMARY KEY (horario_comida_id)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE tiempo_comida(
  tiempo_comida_id int (11) NOT NULL AUTO_INCREMENT,
  descripcion varchar(25) DEFAULT NULL,
  PRIMARY KEY (tiempo_comida_id)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE proteina(
  proteina_id int (11) NOT NULL AUTO_INCREMENT,
  descripcion varchar(25) DEFAULT NULL,
  PRIMARY KEY (proteina_id)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE tiempo_preparacion(
  tiempo_preparacion_id int (11) NOT NULL AUTO_INCREMENT,
  descripcion varchar(25) DEFAULT NULL,
  PRIMARY KEY (tiempo_preparacion_id)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE tipo_coccion(
  tipo_coccion_id int (11) NOT NULL AUTO_INCREMENT,
  descripcion varchar(25) DEFAULT NULL,
  PRIMARY KEY (tipo_coccion_id)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE porciones(
  porciones_id int (11) NOT NULL AUTO_INCREMENT,
  descripcion varchar(25)DEFAULT NULL,
  PRIMARY KEY (porciones_id)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE tipo_cocina(
  tipo_cocina_id int (11) NOT NULL AUTO_INCREMENT,
  descripcion varchar(25)DEFAULT NULL,
  PRIMARY KEY (tipo_cocina_id)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE receta(
  receta_id int (11) NOT NULL AUTO_INCREMENT,
  nombre varchar(200)DEFAULT NULL,
  imagen varchar(25)DEFAULT NULL,
  video varchar(25)DEFAULT NULL,
  ingredientes varchar(2000)DEFAULT NULL,
  horario_comida_id int(11)DEFAULT NULL,
  tiempo_comida_id int(11)DEFAULT NULL,
  proteina_id int(11)DEFAULT NULL,
  tiempo_preparacion_id int(11)DEFAULT NULL,
  tipo_coccion_id int(11)DEFAULT NULL,
  porciones_id int(11)DEFAULT NULL,
  tipo_cocina_id int(11)DEFAULT NULL,
  usuario_id int(11)DEFAULT NULL,
  fecha_creacion timestamp default current_timestamp,
  fecha_modificacion timestamp default current_timestamp on update current_timestamp,
  PRIMARY KEY (receta_id),
  CONSTRAINT fk_receta_horario_comida FOREIGN KEY (horario_comida_id) REFERENCES horario_comida(horario_comida_id),
  CONSTRAINT fk_receta_tiempo_comida FOREIGN KEY (tiempo_comida_id) REFERENCES tiempo_comida(tiempo_comida_id),
  CONSTRAINT fk_receta_proteina FOREIGN KEY (proteina_id) REFERENCES proteina(proteina_id),
  CONSTRAINT fk_receta_tiempo_preparacion FOREIGN KEY (tiempo_preparacion_id) REFERENCES tiempo_preparacion(tiempo_preparacion_id),
  CONSTRAINT fk_receta_tipo_coccion FOREIGN KEY (tipo_coccion_id) REFERENCES tipo_coccion(tipo_coccion_id),
  CONSTRAINT fk_receta_porciones FOREIGN KEY (porciones_id) REFERENCES porciones(porciones_id),
  CONSTRAINT fk_receta_tipo_cocina FOREIGN KEY (tipo_cocina_id) REFERENCES tipo_cocina(tipo_cocina_id),
  CONSTRAINT fk_receta_usuario FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id)
);

CREATE TABLE me_gusta(
  me_gusta_id int(11) NOT NULL AUTO_INCREMENT,
  receta_id int(11)DEFAULT NULL,
  usuario_id int(11)DEFAULT NULL,
  PRIMARY KEY (me_gusta_id),
  CONSTRAINT fk_me_gusta_receta FOREIGN KEY (receta_id) REFERENCES receta(receta_id),
  CONSTRAINT fk_me_gusta_usuario FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE pasos_preparacion(
  pasos_preparacion_id int (11) NOT NULL AUTO_INCREMENT,
  receta_id int(11)DEFAULT NULL,
  numero_paso int(11) DEFAULT NULL,
  imagen varchar(30)DEFAULT NULL,
  descripcion varchar(2000)DEFAULT NULL,
  PRIMARY KEY (pasos_preparacion_id),
  CONSTRAINT fk_pasos_preparacion_receta FOREIGN KEY (receta_id) REFERENCES receta(receta_id)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE critica_calificacion(
  critica_calificacion_id int (11) NOT NULL AUTO_INCREMENT,
  receta_id int(11)DEFAULT NULL,
  usuario_id int(11)DEFAULT NULL,
  critica varchar(255)DEFAULT NULL,
  calificacion int(2)DEFAULT NULL,
  fecha_creacion timestamp not null default current_timestamp,
  PRIMARY KEY (critica_calificacion_id),
  CONSTRAINT fk_critica_calificacion_receta FOREIGN KEY (receta_id) REFERENCES receta(receta_id),
  CONSTRAINT fk_critica_calificacion_usuario FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

INSERT INTO horario_comida (descripcion)
VALUES ('Desayuno'), ('Comida'), ('Cena'), ('Colacion');
INSERT INTO tiempo_comida (descripcion)
VALUES ('Botana'), ('Entrada'), ('Plato fuerte'), ('Postre');
INSERT INTO proteina (descripcion) 
VALUES ('Carne'), ('Aves'), ('Pescado'), ('Mariscos'), ('Vegetariana');
INSERT INTO tiempo_preparacion (descripcion)
VALUES ('Menos de 15 min'), ('15 - 30 min'), ('30 - 60 min'), ('Mas de 1 hora');
INSERT INTO tipo_coccion (descripcion)
VALUES ('Horno de gas'), ('Horno electrico'), ('Microondas'), ('Estufa'), ('Asador'), ('Refrigerador'), ('Temperatura ambiente');
INSERT INTO porciones (descripcion)
VALUES ('2 personas'), ('4 personas'), ('8 personas o mas');
INSERT INTO tipo_cocina (descripcion)
VALUES ('Europea'), ('Asiatica'), ('Mexicana'), ('Americana');
INSERT INTO rol (descripcion)
VALUES ('Administrador'), ('Usuario registrado'), ('Visitante');

INSERT INTO usuario (nombre_usuario, nombre, apellido, rol_id, estatus, biografia, correo, password) 
VALUES ('Ricardo2020', 'Ricardo', 'Elizalde', '1', '1', 'Software Developer', 'ricardo.elizalde@softtek.com', '1234');
INSERT INTO usuario (nombre_usuario, nombre, apellido, rol_id, estatus, biografia, correo, password) 
VALUES ('lilianahdz9', 'Liliana', 'Hernandez', '1', '1', 'Me gusta cocinar', 'liliana.toluca99@gmail.com', '12345678');
INSERT INTO usuario (nombre_usuario, nombre, apellido, rol_id, estatus, biografia, correo, password) 
VALUES ('ela24', 'Elizabeth', 'Granados', '2', '1', 'Amo cocinar', 'ela24@gmail.com', '1234567890');
INSERT INTO usuario (nombre_usuario, nombre, apellido, rol_id, estatus, biografia, correo, password) 
VALUES ('javier.deLara', 'Javier', 'Anguiano', '2', '1', 'Experto en cocina', 'javier.delara@gmail.com', '12345');

INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Sopa de lentejas',
  'lentejas121.jpg',
  '1/2 kg de lentejas.
1/4 de cebolla en trozo.
1 litro de agua.
2 jitomates picados.
1 cucharada de aceite.
1/4 de cebolla picada.
200 gramos de jamón picado.
5 chiles serranos picados.
sal al gusto.',
  '1',
  '2',
  '1',
  '3',
  '4',
  '2',
  '3',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Sopa de tortilla',
  'sopatortilla.jpg',
  '3 Piezas Chile pasilla sin semillas y remojados en agua caliente.
3 Piezas Jitomate cortados en cuadros.
3 1/2 Tazas Agua.
1/2 Taza Puré de tomate.
2 Cubos Concentrado de Tomate con Pollo.
500 Gramos Chips de tortilla sin grasa baja en grasa tortilla frita en tiritas.
1 Paquete Queso Panela desmoronado (200 g).
1 Botella Media Crema NESTLÉ® (190 g).
1 Pieza Aguacate en cubos.',
  '1',
  '2',
  '1',
  '3',
  '4',
  '3',
  '3',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Sopa de verduras',
  'sopaverduras.jpg',
  '4 Piezas Jitomate sin semillas.
1/4 Pieza Cebolla.
1 Pieza Ajo diente, pelado.
2 Cubos Concentrado de Tomate con Pollo.
5 Tazas Agua.
1 Cucharada Aceite de maíz.
2 Piezas Zanahorias peladas y cortadas en cubos.
2 Piezas Calabaza cortadas en cubos.
1/4 Pieza Col fileteada.',
  '1',
  '2',
  '5',
  '3',
  '4',
  '2',
  '3',	
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Sopa de papa y boro',
  'sopaboropapa.jpg',
  '1 Papa en cubos medianos.
 1 cucharada de Aceite de oliva.
 1 Poro en rodajas finas.
 2 jitomates.
 1 diente de Ajo.
 1/2 taza de Agua.
 1 litro de Caldo de pollo.
 Sal al gusto.
 Pimienta al gusto.',
  '1',
  '2',
  '5',
  '3',
  '4',
  '2',
  '3',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Consome de pollo',
  'consomepollo.jpg',
  '2 1/2 litros de agua.
1 kilo de piezas de pollo.
1 cebolla blanca, picada.
1 diente de ajo.
2 tallos de apio, picado.
3 zanahorias, troceadas.
1/4 taza de cilantro, picado
1 cucharada de hierbabuena picada.
Sal y pimienta, al gusto.
3 tazas de arroz cocido.
1 aguacate, pelado y picado.
2 chiles serranos, picados .
2 limones, cuarteados.',
  '1',
  '2',
  '1',
  '4',
  '4',
  '3',
  '3',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Atun a las finas hierbas',
  'atunhierbas.jpg',
  '4 filetes de atún.
albahaca.
perejil.
romeros.
1 diente de ajo finamente picado o en polvo.
aceites de oliva.
oréganos.
tomillos.
sal.
pimientas.
hierbabuenas.',
  '1',
  '3',
  '3',
  '2',
  '7',
  '1',
  '4',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Camaron salteado',
  'camaronsalteado.jpg',
  ' 1/4 cucharita de pimienta negra molida. 
600 gramos de camarón 40/50  
4 piezas de cebollita de cambray.  
4 cucharadas de aceite de oliva. 
6 dientes de ajo.
7 ramas de cilantro.  
1 cucharita de sal.',
  '1',
  '3',
  '4',
  '4',
  '4',
  '1',
  '2',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Chuletas de cerdo con salsa de tamarindo',
  'chuletastamarindo.jpg',
  '1 cucharada de aceite de oliva.  
1 diente de ajo.  
1/4 cucharita de sal.  
1 pieza de chile chipotle adobado.  
1 cucharada de vinagre balsámico.  
1/2 taza de concentrado de tamarindo.  
4 piezas de chuleta ahumada de cerdo.',
  '1',
  '3',
  '1',
  '3',
  '4',
  '3',
  '3',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Fajitas de carne',
  'fajitascarne.jpg',
  'Morrón amarillo 1/2 Unidad.
Morrón colorado 1/2 Unidad.
Aceite neutro Cantidad necesaria.
Cebolla 1 Unidad.
Tortillas mexicanas 8 Unidades.
Carne de ternera 200 g.
Ajo 2 Dientes.
Sal y Pimienta A gusto.
Pechuga de pollo 1 Unidad.
Morrón verde 1/2 Unidad.',
  '1',
  '3',
  '1',
  '4',
  '4',
  '2',
  '3',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Fetuccini mediterraneo',
  'fetuccinimediterraneo.jpg',
  '1/2 kg. de Fetuccini.
400 gr. de mariscos.
4 tomates.
1 lata mediana de jugo de tomate.
3 cucharaditas de orégano.
3 ramitas de albahaca.
4 dientes de ajo.
1 cebolla.
1 taza de aceite de oliva.',
  '1',
  '3',
  '4',
  '4',
  '4',
  '1',
  '1',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Pancita',
  'pancita.jpg',
  '1 1/2 kilo de pancita cruda y limpia. 
1/2 kilo de pata. 
1/2 taza de sal de grano. 
4 limones cortados a la mitad.
½ taza de vinagre blanco.  
1/2 cebolla entera. 
6 dientes de ajo enteros. 
1/2 cebolla blanca cortada en cuartos. 
1 cucharadita de pimientas gordas. 
2 hojas de laurel. 
1 rama de tomillo.
1 cucharadita de comino. 
1/2 cucharadita de orégano. 
12 chiles guajillos desvenados y sin semillas.
1 rama de epazote.
2 hojas santas.',
  '1',
  '3',
  '1',
  '4',
  '4',
  '3',
  '3',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Papas cataluña',
  'papascataluña.jpg',
  'Un pimiento.
Dos puerros.
Medio kilo de costilla de cerdo.
Cinco patatas medianas.
Azafrán.
Tres vasos de cava.
Medio litro de caldo, hasta cubrir.
Harina.
Tomillo.
Dos huevos.
Aceite y sal.',
  '1',
  '3',
  '1',
  '3',
  '4',
  '3',
  '1',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Pollo Almendrado',
  'polloalmendrado.jpg',
  '2 piezas de muslo sin piel.
1 pieza de pierna.
2 pechugas de pollo limpias y sin hueso.
¼ taza de aceite.
80 gramos de almendras enteras.
2 chiles chipotle de lata.
4 jitomates.
2 dientes de ajo.
1 cebolla.
3 clavos.
½ taza de caldo de pollo desgrasado.
½ cucharadita de pimienta.
1 ½ cucharadita de sal.',
  '1',
  '3',
  '1',
  '4',
  '4',
  '3',
  '4',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Pastel de carne con verduras',
  'pastelcarne.jpg',
  '500 gramos de ternera.
1 unidad de cebolla.
1 unidad de tomate.
1 unidad de Ajo tierno.
1 unidad de zanahoria.
1/2 unidad de calabacín.
6 unidades de champiñón.
1 chorro de Aceite de oliva.
1 pizca de Sal.
1 pizca de Pimienta blanca.
5 cucharadas soperas de Salsa Worcestershire.',
  '1',
  '3',
  '1',
  '3',
  '2',
  '3',
  '3',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Ramen',
  'ramen.jpg',
  'Huevos.
Fideos ramen.
Aceite de sésamo.
Ajo picado 2 dientes.
Jengibre rallado.
Salsa de soja baja en sal.		
Mirin.
Caldo de pollo bajo en sal.		
Sal.
Pollo (pechuga).	
Setas shiitake (deshidratadas).		
Cebollino.',
  '2',
  '1',
  '1',
  '4',
  '4',
  '2',
  '2',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Volovan',
  'volovan.jpg',
  '1 lámina de hojaldre.
1 yema de huevo.
sal y pimienta (opcional).',
  '2',
  '1',
  '1',
  '3',
  '1',
  '2',
  '3',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Brochetas de camarones empanizados',
  'brochetascamarones.jpg',
  '2 tazas de camarón grande sin cáscara y limpios.
1/4 de taza de queso crema suavizado.
1 cucharadita de sal.
1/2 cucharadita de pimienta.
1/2 taza de harina.
2 huevos batido.
1 paquete de Pan Molido.
10 palos de brocheta.
1 taza de aceite para freír.
1 taza de tomate asado.
1/4 de cebolla asada.
1 diente de ajo asado.
1 chile habanero asado.
1 cucharada de cilantro fresco.
1/4 de taza de jugo de limón.
1 aguacate.
1 cucharadita de sal.
1/2 cucharadita de pimienta.',
  '2',
  '1',
  '4',
  '3',
  '4',
  '2',
  '3',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Croquetas de arroz y queso',
  'croquetasarrozqueso.jpg',
  '300 gr de arroz bomba o redondo.
Media cebolla.
1 cucharada de mantequilla (unos 25 gr).
Un chorrito de aceite de oliva.
100 grs de mozzarella en dados (puede ser Feta o cualquier queso a tu gusto, hasta queso manchego).
100 grs de queso rallado Edam, Gruyere, o cualquier otro a tu gusto.
Sal. 
Nuez moscada.
Pimienta.
Harina o pan rallado cantidad necesaria.
2 huevos batidos.
Aceite para freír.',
  '2',
  '1',
  '1',
  '4',
  '4',
  '1',
  '4',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Guacamole',
  'guacamole.jpg',
  '1 Pieza Aguacate ssin cáscara y sin hueso.
1 Lata Media Crema.
1 Cucharada Jugo de limón.
1/4 Cucharadita Sal.
1/2 Cucharadita Cebolla en polvo.
5 Ramitas Cilantro fresco picada.
1/2 Bolsa *Totopos de tortilla de maíz.
1 Pieza Chile jalapeño.',
  '2',
  '1',
  '5',
  '1',
  '7',
  '1',
  '3',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Boneless',
  'boneless.jpg',
  '400 gramos de pechuga de pollo.
100 gramos de harina.
200 gramos de empanizador.
2 huevos.
al gusto de orégano.
al gusto de sal y pimienta.
500 mililitros de aceite.
al gusto de salsa picante.
al gusto de salsa BBQ.',
  '2',
  '1',
  '1',
  '4',
  '4',
  '2',
  '4',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Queso panela en cubos',
  'quesocubos.jpg',
  '1 queso panela de 500gr',
  '2',
  '1',
  '1',
  '1',
  '7',
  '2',
  '4',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Queso crema con galletas',
  'quesogalletas.jpg',
  '1 queso crema de 500gr.
1 paquete de galletas Ritz.',
  '2',
  '1',
  '1',
  '1',
  '7',
  '2',
  '4',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Alitas',
  'alitas.jpg',
  '1 kilo de alita de pollo.
1 cebolla.
2 dientes de ajo.
1 cucharada de mantequilla.
1/2 taza de salsa catsup.
1/4 de taza de agua.
1/2 taza de miel de abeja.
2 cucharadas de azúcar.
1 cucharadita de mostaza Dijon.
3 cucharadas de salsa worcestershire o salsa inglesa.
1 cucharadita de pimienta cayena opcional.
al gusto de sal y pimienta.',
  '2',
  '1',
  '1',
  '4',
  '4',
  '3',
  '4',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Arroz al vapor',
  'arrozvapor.jpg',
  '1 taza de arroz.
3 tazas de agua.',
  '2',
  '2',
  '5',
  '2',
  '4',
  '2',
  '2',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Caldo de camaron',
  'caldocamaron.jpg',
  '4 Piezas Jitomate cortados en trozos.
1/2 Pieza Cebolla.
1 Pieza Ajo diente, pelado.
3 Cubos Concentrado de Tomate con Pollo.
3 Piezas Chile pasilla sin semillas y remojados en agua caliente.
2 Piezas Chile ancho sin semillas y remojados en agua caliente.
1 Cucharada Aceite de maíz.
1500 Mililitros Agua.
400 Gramos Camarones cocinados secos, limpios.
2 Piezas Papa peladas y cortadas en cubos.
4 Piezas Zanahorias peladas y cortadas en cubos.',
  '2',
  '2',
  '4',
  '3',
  '4',
  '2',
  '2',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Crema de elote',
  'cremaelote.jpg',
  '2 Tazas Granos de elote amarillo descongelados.
1 Taza Leche Evaporada.
1 Lata Media Crema.
1 Taza Agua.
1 Cucharada Consomé de pollo en polvo.
1 Pizca Pimienta negra.
1 Cucharada Fécula de maíz.
2 Ramitas Perejil fresco desinfectado y picado finamente.',
  '2',
  '2',
  '2',
  '2',
  '4',
  '2',
  '4',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Caldo tlalpeño',
  'caldotlalpeño.jpg',
  '8 tazas de caldo de pollo.
400 gramos de pechuga de pollo.
3 zanahorias cortadas en cubos.
1 cucharada de aceite.
1/3 de cebolla cortada en trozos.
2 dientes de ajo.
4 jitomates cortados en cuartos y sin semillas.
1 rama de cilantro fresco.
1 rama de epazote fresco.
1 taza de garbanzo cocido.
2 chiles chipotles.
al gusto de sal.
1 aguacate cortado en láminas, para acompañar.
al gusto de limón para acompañar.',
  '2',
  '2',
  '2',
  '3',
  '4',
  '2',
  '3',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Crema de champiñones',
  'cremachampiñones.jpg',
  '1 Cucharada Mantequilla light.
500 Gramos Champiñones limpios y fileteados.
2 Tazas Agua.
1 Lata Leche Evaporada.
1 Cucharada Consomé de pollo en polvo.',
  '2',
  '2',
  '5',
  '2',
  '4',
  '2',
  '4',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Crema de chile poblano',
  'cremachilepoblano.jpg',
  '1 Cucharadita Cebolla en polvo.
4 Tazas Agua.
3 Piezas Chile poblano asados, pelados y desvenados.
2 Ramitas Cilantro fresco limpias.
1 Lata Leche Evaporada.
1 Cucharada Mantequilla.
1 Cucharada Consomé de pollo en polvo.',
  '2',
  '2',
  '5',
  '1',
  '4',
  '1',
  '4',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Frijoles charros',
  'frijolescharros.jpg',
  '1 taza de tocino cortado en cuadritos.
1 taza de chorizo cortado en cubos.
1 cebolla finamente picada.
2 dientes de ajo finamente picado.
1 taza de salchicha picada en cubitos.
3 chiles jalapeños picado.
2 tazas de frijoles bayos cocidos.
2 tazas de caldo de fríjol.
1/2 taza de chicharrón troceado.
1/4 de taza de cilantro fresco finamente picado.
1 pizca de sal.
1 taza de epazote hojas fritas, para decorar.',
  '2',
  '2',
  '1',
  '3',
  '4',
  '2',
  '3',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Fideo seco con chorizo',
  'fideochorizo.jpg',
  '200 g de fideos secos.
150 g de Chorizo de su preferencia.
4 cucharadas de aceite vegetal.
300 g de Puré natural de Jitomate colado.
1 taza de cebolla blanca picada.
1 diente de ajo picado.
3/4 litro de consomé de Pollo.
2 chiles chipotles en Adobo sin Semillas.
1 cucharada de concentrado de Pollo.
Sal y Pimienta.',
  '2',
  '2',
  '1',
  '2',
  '4',
  '3',
  '3',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Spaghetti Aglio, Olio e Peperoncino',
  'spaghettiaglio.jpg',
  '350 g de Spaghetti (nº5) Barilla.
70 ml de aceite de oliva virgen extra.
1 diente de ajo.
1 guindilla roja.
1 cucharada de perejil fresco.
Sal.',
  '2',
  '2',
  '5',
  '2',
  '4',
  '2',
  '1',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Tostadas de mariscos',
  'tostadasmarisco.jpg',
  '1 paquete de tostadas de maíz.
250 g de camarón pacotilla.
250 g de aros de calamar cocidos y picados.
250 g de surimi finamente rebanado.
250 g de almejas picadas.
1/2 taza de jugo de limón.
1/4 de cebolla picada.
1/2 lechuga romana lavada, desinfectada y picada.
Sal y pimienta al gusto.
Salsa picante al gusto.',
  '2',
  '3',
  '4',
  '3',
  '7',
  '3',
  '2',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Barbacoa',
  'barbacoa.jpg',
  '1 kg carne de res (medio de costilla y medio de pecho).
10 Hojas laurel.
1/5 cucharadita orégano.
2 cebollas.
3 dientes ajo.
6 chiles guajillos.
1/2 cucharadita tomillo.
1/2 cucharadita cominos.',
  '2',
  '3',
  '1',
  '4',
  '4',
  '2',
  '3',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Chuletas de cerdo a la cerveza',
  'chuletascerveza.jpg',
  '6 chuletas de cerdo.
1/2 cebolla cortada en rodajas.
2 dientes de ajo finamente picados.
3 cucharadas de aceite.
2 cucharadas de sal.
2 cucharadas de mostaza.
2 ½ tazas de cerveza.
1 cucharada de pimienta.
2 hojas de laurel.
1 cucharadita de tomillo.
12 papas cambray cortadas a la mitad.',
  '2',
  '3',
  '1',
  '2',
  '4',
  '2',
  '3',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Fusilli con arrachera y esparragos',
  'fusilliarrachera.jpg',
  '500 gramos de arrachera. 
300 gramos de pasta.
100 gramos de jitomate guaje.  
100 gramos de espárrago fresco.',
  '2',
  '3',
  '1',
  '2',
  '4',
  '1',
  '1',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Huachinango a la veracruzana',
  'huachinango.jpg',
  '2 kilos de huachinango.
1/4 de taza de jugo de limón.
1 taza de aceite.
2 dientes de ajo.
1 cucharada de cebolla rallada.
6 jitomates.
1/2 cebolla.
1 pimiento rojo o pimiento verde.
1/4 de taza de aceite de oliva.
1 raja de canela.
2 clavos de olor.
1 hoja de laurel.
1 taza de aceituna con pimiento.
1/4 de taza de alcaparras.
al gusto de sal y pimienta.
1 taza de pan molido.
al gusto de chile en escabeche largos.
1/2 taza de perejil picado.
1/2 taza de cilantro fresco picado.',
  '2',
  '3',
  '3',
  '4',
  '4',
  '1',
  '3',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Medallones de cerdo en salsa de mostaza',
  'medallones.jpg',
  '1 cucharada de sal.
2 cucharadas de aceite de oliva.
4 dientes de ajo picado.
1 cucharada de tomillo fresco.
2 cucharadas de albahaca finamente picada.
1 cucharada de romero finamente picado.
2 cucharadas de mostaza antigua.
1 1/2 kilos de lomo de cerdo limpio.
1 taza de crema para batir.
1 diente de ajo.
1 cucharada de mostaza.
1/4 de taza de miel de abeja.
1/2 taza de caldo de pollo.
1 cucharada de romero.
1 cucharada de mantequilla.
al gusto de sal.
al gusto de romero para decorar.',
  '2',
  '3',
  '1',
  '3',
  '4',
  '2',
  '4',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Filete al albañil',
  'filetealbañil.jpg',
  'aceite el necesario.
1 kg filete de res en medallones.
al gusto sal y pimienta.
4 chiles mortia.
1 cebolla fileteada.
1 diente ajo picado.
2 ramitas epazote picado.
3 tazas hongos troceados.',
  '2',
  '3',
  '1',
  '3',
  '4',
  '2',
  '3',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Mole de olla',
  'mole.jpg',
  '500 gramos de chiles mulatos.
750 gramos de chiles pasillas.
750 gramos de chiles anchos (las tres variedades de chiles van desvenados y despepitados).
450 gramos de manteca de cerdo.
5 dientes de ajo medianos.
2 cebollas medianas rebanadas.
4 tortillas duras partidas en cuatro.
1 bolillo frito bien dorado.
125 gramos de pasitas.
250 gramos de almendras.
Pepitas de chile al gusto.
150 gramos de ajonjolí.
½ cucharada de anís.
1 cucharadita de clavo en polvo o 5 clavos de olor.
25 gramos de canela en trozo.
1 cucharadita de pimienta negra en polvo o 6 pimientas enteras.
4 tabletas de chocolate de metate.
250 gramos de jitomate pelado y picado.
Azúcar y sal al gusto.
1 guajolote o pavo grande partido en piezas y cocido en un buen caldo hecho con zanahorias.
poro.
cebolla.
rama de apio.
perejil.
diente de ajo.',
  '2',
  '3',
  '1',
  '4',
  '4',
  '3',
  '3',
  '4');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Mole poblano',
  'molepoblano.jpg',
  '500 gramos de chiles mulatos.
750 gramos de chiles pasillas.
750 gramos de chiles anchos (las tres variedades de chiles van desvenados y despepitados).
450 gramos de manteca de cerdo.
5 dientes de ajo medianos.
2 cebollas medianas rebanadas.
4 tortillas duras partidas en cuatro.
1 bolillo frito bien dorado.
125 gramos de pasitas.
250 gramos de almendras.
Pepitas de chile al gusto.
150 gramos de ajonjolí.
½ cucharada de anís.
1 cucharadita de clavo en polvo o 5 clavos de olor.
25 gramos de canela en trozo.
1 cucharadita de pimienta negra en polvo o 6 pimientas enteras.
4 tabletas de chocolate de metate.
250 gramos de jitomate pelado y picado.
Azúcar y sal al gusto.
1 guajolote o pavo grande partido en piezas y cocido en un buen caldo hecho con zanahorias.
poro.
cebolla.
rama de apio.
perejil.
diente de ajo.',
  '2',
  '3',
  '1',
  '4',
  '4',
  '3',
  '3',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Calabaza en tacha',
  'calabazatacha.jpg',
  '1 calabaza mediana aproximadamente 2 a 2-1/2 kilos.
2 pequeños conos de piloncillo * aproximadamente 500 gramos.
3 palitos de canela mexicanos enteros o cortados por la mitad.
1 naranja cortado en rodajas (opcional).
4 tazas de agua.',
  '2',
  '4',
  '3',
  '3',
  '4',
  '2',
  '3',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Galletas de platano',
  'galletasplatano.jpg',
  '100 gr de mantequilla.
1 taza de azúcar moreno.
2 huevos.
3 plátanos maduros.
2 tazas de harina.
1 sobre de levadura.
1 cucharada de canela en polvo.
100 gr de nueces picadas (opcional).
1 taza de azúcar glass.
1 cucharada de mantequilla.
1 cucharada de vainilla.
3 cucharadas de leche.',
  '2',
  '4',
  '3',
  '3',
  '1',
  '2',
  '4',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Tarta de elote',
  'tartaelote.jpg',
  '6 elotes tiernos.
250 gr mantequilla.
4 huevos.
1 taza leche puede ser de vaca o de coco.
al gusto Miel.
1 pizca carbonato.',
  '2',
  '4',
  '3',
  '3',
  '1',
  '2',
  '4',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Brownie',
  'brownie.jpg',
  '1 taza de harina.
2 tazas de azúcar.
2 barras de mantequilla 90 g c/u.
1/2 taza de cocoa.
4 huevos.
1/2 cucharada de polvo para hornear.
1 cucharada de vainilla líquida.
azúcar glass.',
  '2',
  '4',
  '3',
  '3',
  '2',
  '2',
  '4',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Bocaditos de fresa y nata',
  'bocaditos.jpg',
  'Ingredientes para la masa.
2 huevos.
50 gr azúcar.
50 gr harina.
Para la crema.
300 ml nata.
30 gr azúcar glass.
Para decorar.
25 gr semiias chía.
25 azúcar glass.
Más ingredientes.
200-300 gr fresa.',
  '2',
  '4',
  '3',
  '3',
  '2',
  '2',
  '4',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Bollitos de manzana y canela',
  'bollitos.jpg',
  '400 gr Preparado mix C para dulces.
300 ml Leche.
50 ml Nata para montar.
1 Huevo.
100 gr Azúcar.
100 gr Mantequilla.
1 Levadura seca de panadería.
4 Manzanas.
medio Zumo limón.
1 cucharadita Canela en polvo.
30 gr Azúcar.
6 gr Goma xantana.',
  '2',
  '4',
  '3',
  '4',
  '1',
  '3',
  '4',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Tartas de flores',
  'tartaflores.jpg',
  '1 paquete de masa filo (5 hojas o 250 gramos).
400 ml de leche (1 y 3/4 de taza).
3 huevos tamaño L.
125 g de azúcar cristal.
1 piel de limón.
1 ramita de canela.
50 g de mantequilla.
25 g de azúcar glas para decorar.',
  '2',
  '4',
  '3',
  '4',
  '2',
  '3',
  '4',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Estrellas',
  'estrellas.jpg',
  '500gr almendras molidas.
3 claras de huevo.
1 cda 1/2 canela en polvo.
400gr azúcar en polvo (glaçé).
2 cdas orujo (opcional).
azúcar en polvo para espolvorear.',
  '2',
  '4',
  '3',
  '4',
  '2',
  '3',
  '4',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Tarta sacher',
  'tartasacher.jpg',
  '100 gr de mantequilla.
100 gr de almendras peladas.
6 huevos tamaño L.
100 gr de azúcar glas.
100 gr de azúcar blanco.
65 gr de cacao puro en polvo.
100 gr de harina de trigo.
10 gr de levadura química (tipo Royal).
300 gr de mermelada de albaricoque.
100 ml de nata para montar.
130 gr de chocolate para fundir.
20 gr de mantequilla sin sal.
2 cucharadas soperas de agua.',
  '2',
  '4',
  '3',
  '4',
  '2',
  '3',
  '1',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Frijoles refritos con totopos',
  'frijolestotopos.jpg',
  '3 tazas de frijoles cocidos con un poco de su caldo.
1/3 taza de cebolla blanca finamente picada.
3 cucharadas de grasa, manteca de cerdo, tocino o chorizo.
Para decorar y acompañar: Queso fresco mexicano y totopos o tortillas tostadas de maíz.
Sal al gusto.',
  '3',
  '1',
  '5',
  '1',
  '4',
  '2',
  '4',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Pure de papa campesino',
  'purecampesino.jpg',
  '1 Kilogramo de papas cocinadas con cáscara en agua de sal.
3 Cebollas finamente picadas.
1 Diente de ajo.
Pimienta al gusto.
2 Cucharadas de Margarina.
2 Cucharadas de aceite.
Sal al gusto.
1 Cucharadita copetona de achiote.',
  '3',
  '1',
  '5',
  '3',
  '4',
  '2',
  '1',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Mini pizza',
  'minipizza.jpg',
  '1 paquete de tortillas de harina.
1/2 taza de queso manchego o mozarella.
1 lata de salsa de tomate para pizza.
3/4 de taza de peperoni pequeños.
200 gramos de tocino.
aceites de oliva cantidad necesaria.',
  '3',
  '1',
  '1',
  '2',
  '2',
  '1',
  '1',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Aros de cebolla',
  'aros.jpg',
  '2 cebollas mediana.
1 taza de harina.
1 taza de leche fresca.
2 cucharadas de aceite.
1 huevo.
1 cucharadita de sal.
aceites para freír.
pimientas blancas en polvo.',
  '3',
  '1',
  '5',
  '1',
  '4',
  '1',
  '4',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Mini Fugazzeta',
  'fugazzeta.jpeg',
  '360 gr. de harina común.
4 cucharitas de levadura (tipo Polvo Royal).
1 y 1/2 cucharita de sal.
200 ml. de agua fría.
4 cucharadas de aceite.
1 y 1/2 cebolla cortada en juliana.
2 cucharadas de aceite.
Sal y pimienta.
Queso mozarella.
Queso crema (tipo Philadelphia).
Cebollino troceado.',
  '3',
  '1',
  '1',
  '3',
  '1',
  '2',
  '1',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Dip de queso y nuez',
  'dipquesonuez.jpg',
  '1 Taza Nuez.
1 Lata Media Crema.
1 Paquete Queso crema (190 g).
1 Pieza *Chile chipotle.
1 Cucharada *Consomé de pollo en polvo.
2 Paquetes Galletas saladas (270 g).',
  '3',
  '1',
  '1',
  '1',
  '7',
  '2',
  '4',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Corn dogs',
  'corndogs.jpg',
  '6 salchichas grandes cortadas por la mitad.
Palitos para pinchar las salchichas.
4 cucharadas de harina de repostería.
4 cucharadas de harina de maíz amarillo.
1 cucharada de azúcar.
½ cucharada de levadura Royal.
1 taza de leche (aproximadamente).
Sal y pimienta al gusto.
Aceite para freír.',
  '3',
  '1',
  '1',
  '3',
  '4',
  '2',
  '4',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Salchipulpos',
  'salchipupos.jng',
  '8 salchichas.
catsup.',
  '3',
  '1',
  '1',
  '3',
  '4',
  '2',
  '4',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Portobellos rellenos de tocino',
  'portobellos.jpg',
  '4 piezas de portobello.
1 ajo.
2 cucharadas de mantequilla.
2 cucharadas de aceite de oliva.
200 gramos de queso parmesano.
1 pizca de sal.
1/2 manojo de albahaca.
200 gramos de tocino.
2 jitomates.
1 cebolla.',
  '3',
  '1',
  '1',
  '2',
  '4',
  '2',
  '3',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Crema de jitomate rostizado',
  'cremajitomate.jpg',
  '6 jitomates.
2 dientes de ajo.
1/8 de cebolla.
1/4 de taza de aceite de oliva.
1 cucharadita de sal de grano.
1/2 cucharadita de pimienta.
1 cucharadita de tomillo.
1 cucharadita de orégano fresco.
1 cucharada de albahaca.
2 tazas de caldo de pollo.
1 taza de crema para batir.
al gusto de jitomate cherry para decorar.
al gusto de albahaca para decorar.',
  '3',
  '2',
  '5',
  '3',
  '4',
  '3',
  '1',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Crema de cilantro',
  'cremacilantro.jpg',
  '3 cucharadas de mantequilla.
1 cebolla, picada.
1 manojo de cilantro, limpio.
2 cucharadas de vino blanco (opcional).
1/2 taza de caldo de pollo.
1 lata (378 mililitros) de leche evaporada.
500 mililitros de crema de vaca.
Sal al gusto.',
  '3',
  '2',
  '5',
  '1',
  '4',
  '2',
  '1',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Arroz rojo',
  'arrozrojo.jpg',
  '1 taza de arroz entero.
1/2 taza de aceite.
2 tazas de agua caliente o caldo de pollo.
2 jitomates sin piel, picados.
2 zanahorias peladas y en cuadritos.
1/2 taza de chícharo.
1 chile serrano entero.
al gusto de sal.
2 ramas de perejil.
2 ramas de cilantro fresco.',
  '3',
  '2',
  '5',
  '2',
  '4',
  '2',
  '1',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Arroz verde',
  'arrozverde.jpg',
  '1/4 cebolla finamente picada.
1 diente de ajo finamente picado.
2 cucharadas de aceite vegetal.
2 tazas de arroz.
3 tazas de caldo de pollo.
2 chiles poblanos.
¼ manojo de perejil lavado y desinfectado.
½ taza de elote amarillo desgranado.
1 ½ cucharadita de sal.
½ cucharadita de pimienta.',
  '3',
  '2',
  '5',
  '2',
  '4',
  '2',
  '1',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Arroz a la jardinera',
  'arrozjardinera.jpg',
  'Arroz – 400 g.
Guisantes congelados –150 g.
Pimiento rojo – 1 unidad.
Maíz dulce – 3 cucharadas.
Cebolla – 1 unidad.
Dientes de ajo – 3 unidades.
Tomate natural tamizado –2 cucharadas.
Caldo de verduras – 1 pastilla.
Agua – 850 ml.
Colorante o azafrán en polvo – ¼ de cucharadita.
Aceite de oliva sabor suave – 2 cucharadas.',
  '3',
  '2',
  '5',
  '2',
  '4',
  '2',
  '1',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Envueltos de pollo con queso y huitlacoche',
  'envueltos.jpg',
  '5 Piezas Milanesa de pollo.
4 Cucharadas.
6 Cucharadas Mantequilla.
3 Cucharadas Cebolla PICADA.
1/2 Taza Granos de elote amarillo.
4 Tazas Chile poblano asados,pelados,desvenados y cortados en rajas.
2 Cucharadas Consomé de pollo en polvo.
3 Gramos Epazote fresco.
2 Latas Media Crema.
95 Gramos Queso crema.
1 Lata Leche Evaporada.
500 Gramos Huitlacoche.',
  '3',
  '2',
  '2',
  '3',
  '4',
  '3',
  '4',
  '3');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Brochetas de res',
  'brochetasres.jpg',
  '500 Gramos Carne de res de carne puntas de filete.
3 Piezas Pimiento morrón enlatado verde, lavados, cortados en cubos grandes.
12 Piezas Champiñones limpios, blancos.
2 Cucharadas Salsa de Soya.
2 Cucharadas Perejil fresco limpio, picado.
2 Cucharadas Aceite de maíz.',
  '3',
  '3',
  '1',
  '2',
  '4',
  '1',
  '4',
  '4');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Cuete mechado',
  'cuetemechado.jpg',
  '1 pza. Cuete de 1 1/2kg (perforado para mechar).
1 taza Vino blanco.
1 taza Jugo de naranja.
Sal (al gusto).
Pimienta (al gusto).
1/2 taza Nuez de la india.
1/4 taza Pistaches.
1 pza. Pimiento morrón amarillo.
1/2 taza Aceitunas negras.
1/4 taza Piñón rosa.',
  '3',
  '3',
  '1',
  '2',
  '4',
  '1',
  '4',
  '4');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Lomo relleno de frutas secas',
  'lomofrutassecas.jpg',
  '1 kg de lomo de cerdo.
3/4 taza de almendras.
1/2 taza de pasitas.
1/2 taza de ciruelas deshidratas.
100 gramos de chabacano deshidratado.
2 cebollas blancas.
1 cucharada de aceite de oliva.
sal.
pimienta.
1 taza de agua.
1 rama grande de romero fresco.
1/4 taza de brandy.
1 hoja de laurel.',
  '3',
  '3',
  '1',
  '2',
  '4',
  '1',
  '1',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Espagueti con salsa de queso y mini albondigas',
  'espaguetialbondigas.jpg',
  '250 Gramos de carne molida de res.
1 Pizca de Sal.
1 Pizca de pimienta negra molida.
1 Pieza de huevo.
0.25 Taza de avena molida.
2 Cucharadas de hoja de albahaca lavadas desinfectadas y picadas.
1 Cucharada de aceite de canola.
1 Cucharadas de pasta de tomate.
1 Pieza de diente de ajo picado.
0.25 Pieza de cebolla picada.
8 Pieza de tomate (jitomate) escalfados sin semillas y en cubos chicos.
2 Pieza de chile de árbol seco sin semillas finamente picado.
0.25 Taza de hoja de albahaca lavadas desinfectadas y picadas.
1 Pizca de pimienta negra molida.
0.25 Taza de agua caliente (de la cocción de la pasta.
1 Taza de queso parmesano recién rallado al gusto.
200 Gramos de Spaghetti.',
  '3',
  '3',
  '1',
  '4',
  '4',
  '2',
  '1',
  '2');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Salmon en salsa de vino',
  'salmonvino.jpg',
  '4 filetes de salmón.
1 cucharada de mantequilla sin sal.
2 cucharadas de harina.
1 taza de vino blanco.
1 cucharada de cebollín picado finamente.
pimientas.',
  '3',
  '3',
  '3',
  '4',
  '4',
  '2',
  '1',
  '3');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Lomo a la naranja',
  'lomonaranja.jpg',
  '1 kilo de lomo de cerdo.
4 dientes de ajo.
2 cucharaditas de aceite.
1 1/2 tazas de cebollas rebanada.
1/4 de cucharadita de pimienta.
1/4 de cucharadita de nuez moscada.
1/2 cucharadita de mostaza en polvo.
1 1/2 tazas de jugo de naranja.
1 taza de caldo de pollo.
1 taza de vino blanco.
1/2 taza de cilantro fresco.
pizcas de maicena si es necesario.',
  '3',
  '3',
  '1',
  '4',
  '4',
  '2',
  '3',
  '2');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Lomo de cerdo en salsa de ciruela pasa',
  'lomopasa.jpg',
  '1/2 pieza cebolla.
3 piezas dientes de ajo.
1 1/2 tazas ciruelas pasas deshuesadas y remojadas en agua.
10 cdas Salsa tipo Inglesa.
1 pieza ramita de tomillo.
1/4 taza vinagre de vino.
1 cda sal.
1 taza jugo de uva.
1 1/2 Kg lomo de cerdo entero.
1 pieza cebolla.
3 piezas ajo.
500ml vino tinto.
200g azúcar.
300g ciruela pasa.
3 cdas Consomé de Pollo.
1L agua.
30g fécula de maíz.',
  '3',
  '3',
  '1',
  '4',
  '4',
  '2',
  '3',
  '2');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Paella valenciana',
  'paella.jpg',
  '1 taza de chícharos.
Sal y pimienta al gusto.
4 cdas. de aceite de oliva.
5 gotas de jugo de limón.
2 hebras de azafrán.
1 rama de mejorana.
1 rama de perejil.
1 cebolla picada.
1 taza de ejotes partidos.
2 tazas de arroz.
1 pimiento verde cortado en tiras.
1 pimiento rojo cortado en tiras.
500 g de camarones.
500 g de mejillones precocidos.
1 kg de almejas.
200 g de chorizo rebanado.
500 g de costillas de cerdo.
1 pollo cortado en piezas.',
  '3',
  '3',
  '1',
  '4',
  '4',
  '2',
  '3',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Arroz con leche',
  'arrozleche.jpg',
  '4 1/2 Tazas Agua.
1 Pieza Canela en raja.
1 Taza Arroz remojado en agua caliente por 10 minutos y escurrido.
1 Lata Leche Condensada.
1 Lata Leche Evaporada.
1/2 Taza Pasas.
1 Cucharada canela molida.',
  '3',
  '4',
  '3',
  '4',
  '4',
  '2',
  '4',
  '2');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Crepas de cajeta',
  'crepas.jpg',
  '1 1/2 tazas de leche de vaca.
1 taza de harina.
2 huevos.
1 cucharada de aceite.
1/4 de cucharadita de sal.
2 cucharaditas de azúcar.
1 taza de cajeta o dulce de leche.
1 taza de leche de vaca o la cantidad necesaria.
1/4 de taza de nuez picada (opcional).',
  '3',
  '4',
  '3',
  '2',
  '4',
  '3',
  '1',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Tamal de chocolate con nuez ',
  'tamalchocolate.jpg',
  '15 hojas de maíz para tamal.
1 kg harina de maíz para tamales.
450 g manteca o aceite vegetal.
150 g azúcar.
1 cucharada de polvo para hornear.
1 lata de leche condensada.
taza de leche.
taza de agua.
cucharadita de sal.
1 taza de nuez.
1 taza de crema de avellanas.
1 taza de chocolate picado.',
  '3',
  '4',
  '3',
  '2',
  '4',
  '1',
  '1',
  '2');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Gelatina de mosaico',
  'gelatinamosaico.jpeg',
  '1 Paquete Grenetina sabor uva (35 g).
1 Lata Leche Condensada.
1 Lata Leche Evaporada.
1 Cucharadita Esencia de vainilla.
3 Paquetes Grenetina (7 g c/u), disuelta en ½ taza de agua fría y derretida a baño María.',
  '3',
  '4',
  '3',
  '3',
  '7',
  '2',
  '4',
  '4');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Pastel de Zanahoria',
  'pastelzanahoria.jpg',
  '4 unidades de huevos.
1 1/2 tazas de azúcar (300 gramos).
1 cucharadita de esencia de vainilla (opcional).
1 1/2tazas de harina (210 gramos).
1 taza de aceite vegetal.
1 pizca de sal.
2 cucharaditas de polvos para hornear o levadura tipo Royal.
2 cucharaditas de canela en polvo (opcional).
2 tazas de zanahoria rallada.
1/2 taza de nueces picadas.
200 gramos de queso crema.
1/2 barra de mantequilla.
1 taza de azúcar glass (140 gramos).',
  '3',
  '4',
  '3',
  '4',
  '2',
  '3',
  '1',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Pastel de chocolate',
  'pastelchocolate.jpg',
  '1/2 Taza Azúcar.
2 Barras Mantequilla.
2 Tazas Harina de trigo.
3 Piezas Huevo.
1 Cucharada Esencia de vainilla.
1 Cucharadita Sal.
1 Lata LA LECHERA en Balance Sin Grasa.
1/2 Taza Alimento en polvo para preparar bebida fortificada sabor a chocolate.
1 Lata Leche Evaporada en Balance Reducida en Grasa.
1/2 Cucharadita Bicarbonato de sodio.
4 Cucharadas Alimento en polvo para preparar bebida fortificada sabor a chocolate.
3 Cucharadas Leche Evaporada CARNATION® CLAVEL® en Balance Reducida en Grasa.
1 Taza Crema para batir.',
  '3',
  '4',
  '3',
  '4',
  '2',
  '3',
  '1',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Ensalada caprese',
  'ensaladacaprese.jpg',
  '2 unidades de tomates perita.
150 gramos de Mozzarella.
20 hojas de albahaca fresca.
1 cucharadita de Sal.
1 pizca de Pimienta negra.
1 cucharada sopera de Aceite de oliva extra virgen.',
  '4',
  '1',
  '5',
  '1',
  '7',
  '3',
  '1',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Brocheta de fruta',
  'brochetafruta.jpg',
  '3 kiwis.
2 melocotones.
150 g de fresas.
2 rodajas de piña.
Chocolate fundido.',
  '4',
  '1',
  '5',
  '1',
  '7',
  '2',
  '4',
  '3');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Palitos de pan con arugula prosciutto',
  'palitos.jpg',
  '2 tazas de harina.
5 gramos de sal.
3 gramos de levadura seca.
1/2 taza de agua.
2 cucharadas de Oli De Nutrioli® Extra Virgen Aceite De Oliva (más un poco para barnizar).
1/4 de taza de ajonjolí.
1/4 de taza de ajonjolí negro.
1 taza de arúgula.
15 rebanadas de jamón serrano.',
  '4',
  '1',
  '5',
  '1',
  '1',
  '2',
  '4',
  '3');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Dedos de queso',
  'dedos.jpg',
  '2 huevos.
1/4 de taza de agua.
1 1/2 tazas de pan molido.
1/2 cucharada de orégano.
1/2 cucharada de albahaca.
1/2 cucharada de sal de ajo.
2/3 de taza de harina.
2 tazas de aceite para freír.
300 gramos de queso manchego.
1/3 de taza de maicena.',
  '4',
  '1',
  '5',
  '1',
  '4',
  '2',
  '4',
  '4');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Papas gajo',
  'papasgajo.jpg',
  '3 papas.
1 taza de harina.
4 cucharadas de sal.
4 cucharadas de pimienta.
4 cucharadas de paprika.
aceites para freír.
hierbas secas.',
  '4',
  '1',
  '5',
  '3',
  '4',
  '2',
  '4',
  '3');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Papas fritas',
  'papasfrita.jpg',
  '4 papas amarillas grandes.
2 tazas de aceite vegetal.
Sal, al gusto.',
  '4',
  '1',
  '5',
  '3',
  '4',
  '2',
  '4',
  '4');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Nuggets',
  'nuggets.jpg',
  '200g de carne picada de pollo.
Un chorrito de leche.
Una rebanada de pan de molde.
Opcionalmente, una loncha de queso blando, tipo Sandwich.
Harina, huevo y pan rallado para empanarlas.
Aceite de oliva.
sal y pimienta.',
  '4',
  '1',
  '2',
  '2',
  '4',
  '2',
  '4',
  '2');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Rollitos de queso y tocino',
  'rollito.jpg',
  '10 rebanadas de pan blanco.
10 rebanadas de tocino.
2 paquetes de queso crema.',
  '4',
  '1',
  '1',
  '2',
  '2',
  '2',
  '4',
  '2');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Jalapeño popper',
  'jalapeño.jpg',
  '8 chiles jalapeños grandes.
190 gramos de queso crema.
100 gramos de queso oaxaca o asadero.
100 gramos de chorizo.
1 huevo.
60 mililitros de leche de vaca.
suficiente de pan molido.
suficiente de aceite.',
  '4',
  '1',
  '1',
  '2',
  '4',
  '2',
  '3',
  '1');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Pastel ingles de manzana',
  'pastelingles.jpg',
  '4 manzanas medianas (unos 700-800 gramos).
50 gr de azúcar blanquilla.
50 gr de azúcar moreno.
El zumo de medio limón mediano.
1 cucharadita de canela en polvo.
¼ de cucharadita de nuez moscada en polvo.
¼ de cucharadita de jengibre molido (yo no lo usé).
Una pizca de sal.
Una cucharada de maizena o harina de repostería.
2 cucharadas de mantequilla.',
  '4',
  '4',
  '3',
  '4',
  '2',
  '2',
  '1',
  '3');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Volteado de piña',
  'volteado.jpg',
  '1 1/2 Barra Mantequilla a temperatura ambiente (90 g c/u), para el pastel.
1 Lata Leche Condensada LA LECHERA® , para el pastel.
3 Piezas Huevo , para el pastel.
3 Tazas Harina de trigo , para el pastel.
1 1/2 Cucharadita Polvo para hornear , para el pastel.
1/2 Lata Leche Evaporada CARNATION® CLAVEL®.
3/4 Taza Azúcar mascabado, para decorar.
1 Lata Piña en almíbar en rebanadas y escurridas (580 g), para decorar.
125 Gramos Cerezas en almíbar y escurridas, para decorar.
1/2 Taza Almíbar de fruta piña.',
  '4',
  '4',
  '3',
  '4',
  '2',
  '2',
  '1',
  '3');
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ('Barritas de almendra y cereza',
  'barrita.jpg',
  '1 taza (2 barras) de mantequilla sin sal, a temperatura ambiente.
2 tazas de azúcar morena.
1 huevo grande.
2 cucharaditas de extracto de almendras.
2 cucharaditas de polvo de hornear.
2 tazas de harina para todo uso.
2 tazas de avena arrollada.
1/2 taza de almendras en rodajas.
12 onzas de mermelada de cerezas agrias.',
  '4',
  '4',
  '3',
  '4',
  '2',
  '2',
  '1',
  '2');

INSERT INTO pasos_preparacion (receta_id, numero_paso, imagen, descripcion)
VALUES
('1', '1', 'p1.jpg', 'Lavar las lentejas y colocarlas en una olla junto con los demas ingredientes. Deja cocer a fuego medio-alto hasta hervir'),
('1', '2', 'p2.jpg', 'Al hervir agrega las papas, zanahoria, chorizo y sal. Baja el fuego y deja cocinar'),
('1', '3', 'p3.jpg', 'Espera a que las lentejas esten blanditas y disfrutar'),
('2', '1', 'p1.jpg', 'Saltea el tomate con el ajo, chile pasilla, cebolla y orégano a fuego medio hasta que se suavice, unos 3 a 5 minutos.'),
('2', '2', 'p2.jpg', 'Licua la mezcla con ½ taza de agua.'),
('2', '3', 'p3.jpg', 'Regresa a la olla, agrega el caldo de pollo o verduras, sazona con sal – pimienta y lleva a hervor. Recuerda que el caldo es salado así que ve probando hasta que esté como te gusta.'),
('2', '4', 'p2.jpg', 'Tapa la olla, baja el fuego y cocina por uno 8 a 10 minutos.'),
('2', '5', 'p2.jpg', 'Para servir coloca las tortillas en un plato, llena con caldo y agrega queso panela y aguacate en cubos. Puedes decorar si lo deseas con crema ácida y acompañar con jugo de limón y unas tiras de chile pasilla o guajillo frito.'),
('3', '1', 'p1.jpg', 'PICA en cubos la zanahoria, la papa, el chayote y el brócoli.'),
('3', '2', 'p2.jpg', 'FILETEA la col y las acelgas.'),
('3', '3', 'p2.jpg', 'LICÚA los jitomates, la cebolla, el ajo, una taza de agua y sal.'),
('3', '4', 'p2.jpg', 'CALIENTA el aceite en una cacerola y sofríe el puré de jitomate. Añade sal y vierte el caldo de pollo.'),
('3', '5', 'p2.jpg', 'TAPA y cocina por 15 minutos.'),
('3', '6', 'p2.jpg', 'AGREGA las papas, el chayote, la zanahoria y tapa. Cocina por 10 minutos.'),
('3', '7', 'p3.jpg', 'AÑADE el brócoli y la col. Cocina por 10 minutos y agrega los granos de elote y acelgas.'),
('3', '8', 'p1.jpg', 'RECTIFICA sazón y cocina por 15 minutos o hasta que toda la verdura esté cocida. Sirve y añade limón al gusto.'),
('4', '1', 'p1.jpg', 'CALIENTA el aceite en una olla y sofríe el poro por 2 minutos, sin dejar de mover.'),
('4', '2', 'p2.jpg', 'LICÚA el jitomate con el ajo, el agua y sal. Cuela y vierte en la olla. Deja hervir por 1 minuto para que sazone y agrega la papa y el caldo de pollo.'),
('4', '3', 'p3.jpg', 'COCINA a fuego bajo, durante 15 minutos o hasta que las papas estén suaves; salpimienta y sirve caliente.'),
('5', '1', 'p1.jpg', 'Calienta el agua en una olla grande a fuego alto. Cuando empiece a hervir, agrega el pollo y deja que hierva de nuevo. Reduce el fuego a bajo, tapa y cocina durante 10 minutos.'),
('5', '2', 'p2.jpg', 'Añade la cebolla, ajo, apio, zanahoria, cilantro y hierbabuena. Tapa de nuevo y cocina durante 1 hora.'),
('5', '3', 'p2.jpg', ' Saca el pollo de la olla y deshébralo. Regrésalo a la olla y agrega el arroz cocido. Sazona con sal y pimienta. Deja que todo se caliente y apaga.'),
('5', '4', 'p3.jpg', ' Sirve con aguacate, chiles serranos y gotas de jugo de limón.'),
('6', '1', 'p1.jpg', 'Primero vamos a picar todas las hierbas aromáticas que le darán un muy buen sabor a nuestro filete.'),
('6', '2', 'p2.jpg', 'Ahora en un recipiente las mezclamos con aceite de olivo (el necesario)y ahí mismo agrega un poco de sal (preferentemente en grano) y pimienta al gusto.'),
('6', '3', 'p3.jpg', 'A continuación vamos a usar una brocha para hacer como si pintáramos los filetes.'),
('6', '4', 'p2.jpg', 'Ya que agregaste la mezcla deja reposar unos minutos en lo que se calienta una plancha o parrilla .Pon por cada lado un poco de aceite de oliva y cocina alrededor de 3 minutos de cada lado.'),
('7', '1', 'p1.jpg', 'Primeramente, tomaremos una cacerola y la llevaremos al fuego medio'),
('7', '2', 'p2.jpg', 'Verter en esta la mantequilla, y al notarla derretida, los ajos picados'),
('7', '3', 'p2.jpg', 'Dejar sofreír por unos 4 minutos antes de agregar los camarones'),
('7', '4', 'p2.jpg', 'Añadir los camarones a la preparación y agregar el zumo de limón'),
('7', '5', 'p2.jpg', 'Salpimentar a gusto y dejar cocinar por unos 4 o 6 minutos o hasta que los camarones tengan un intenso color rosa o se hayan dorado lo suficiente'),
('7', '6', 'p3.jpg', 'Por último, agregar el perejil picado finamente por encima. ¡y listo!'),
('8', '1', 'p1.jpg', 'Para preparar la salsa colocar en el vaso de la licuadora el concentrado de tamarindo, chile chipotle adobado, diente de ajo, vinagre balsámico y sal. Moler todo hasta obtener una mezcla homogénea.'),
('8', '2', 'p2.jpg', 'Calentar la cucharada de aceite en una olla y sofreír la salsa moviendo constantemente hasta que se espese y se concentren los sabores. Reservar'),
('8', '3', 'p3.jpg', 'Calentar un poquito de aceite y cuando este bien caliente sofreír las chuletas un par de minutos por cada lado.'),
('8', '4', 'p3.jpg', 'Para servir colocar una chuleta en el plato y bañar con un poco de la salsa de tamarindo acompañar con una copa de vino.'),
('9', '1', 'p1.jpg', 'Lo primero para preparar estas fajitas de carne será cortar las verduras. Corta en trozos medianos, si prefieres, también puedes hacerlo en tiras. La zanahoria debe estar lo más pareja posible para que se cocine en forma igual.'),
('9', '2', 'p2.jpg', 'Calienta aceite en una sartén y saltea la carne allí. Agrega algo de paprika picante (o pimentón) y sal. Cocina hasta dorar de todos lados y luego retira.'),
('9', '3', 'p2.jpg', 'Saltea ahora en la sartén las verduras. Deja el puerro para el final. Tienes que cocinar hasta que estén blandas. Condimenta con algo de sal y paprika a gusto. Agrega la carne y mezcla todo.'),
('9', '4', 'p2.jpg', 'En otra sartén calienta las tortillas. Rellena y dobla en tres partes.'),
('9', '5', 'p3.jpg', '¡Ya está pronta la comida! Todos a la mesa para disfrutar una deliciosa comida mexicana.'),
('10', '1', 'p1.jpg', 'Picar la cebolla, ajo y tomate. Poner los mejillones en una olla a fuego fuerte para que suelten su agua.'),
('10', '2', 'p2.jpg', 'En una olla poner la mitad de aceite de oliva y blanquear el ajo y la cebolla'),
('10', '3', 'p2.jpg', 'Luego echar el tomate cortado y el jugo de tomate en el jugo de los mejillones, la albahaca y el orégano. Añadir agua y cocinarlo por 30 min.'),
('10', '4', 'p2.jpg', 'En otra olla hervir agua con sal y el aceite y cocinar los Fetuccini hasta que estén al dente. (9 min.). '),
('10', '5', 'p2.jpg', 'Cuando la salsa esté terminada añadir los mariscos y cocinarlos por 3 min.'),
('10', '6', 'p2.jpg', 'Rectificar la sazón y servir la salsa sobre los Fetuccini.'),
('11', '1', 'p1.jpg', 'Para que el menudo o pancita tenga mejor sabor, pide en la carnicería la panza cruda no la pre cocida.'),
('11', '2', 'p2.jpg', 'Elimina el mal olor de la pancita y las patas retirando por completo la grasita que tenga pegada, luego frótalas con sal de grano, enjuágalas y sumérgelas en agua con limón por 25 minutos.'),
('11', '3', 'p2.jpg', 'Una vez que la pancita y las patas se hayan enjuagado, colócalas en una olla con agua hasta cubrir y añade media taza de vinagre blanco; de esta forma no quedará rastro del mal olor y sabor que estas piezas llegan a tener.'),
('11', '4', 'p2.jpg', 'Corta la pata del mismo tamaño que la pancita para estén listas al mismo tiempo ya que, la pata tarda más en cocinarse.'),
('11', '5', 'p2.jpg', 'Para que tenga un delicioso sabor, coloca en una olla de barro las menudencias, agrega media cebolla blanca entera y tres ajos enteros. Déjala cocinar a fuego medio por aproximadamente dos horas y media hasta tres horas.'),
('11', '6', 'p2.jpg', 'Prepara el adobo mezclando chiles guajillos, cebolla, ajo, pimientas gordas, orégano y comino. Sofríe todos los ingredientes por 10 minutos antes de licuarlo y colarlo sobre la olla con las menudencias.'),
('11', '7', 'p2.jpg', 'Si vas a utilizar hoja santa y epazote, no las dejes en el guisado durante toda la cocción, de lo contrario quedará con un sabor muy fuerte. Te sugerimos añadir la rama de epazote a mitad de cocción por 5 minutos, retírala y una vez que el fuego esté apagado, coloca las hojas santas por cinco minutos para que suelten su olor en el caldo.'),
('11', '8', 'p3.jpg', 'Como todo buen platillo mexicano no puede faltar la guarnición del guisado. Sírvelo con jugo de limón, cebollita picada, chile de árbol frito y tortillas.'),
('12', '1', 'p1.jpg', 'Pelar y picar muy finos los dientes de ajo y sofreírlos en una olla sin que lleguen a cambiar de color.'),
('12', '2', 'p2.jpg', 'Agregar dos o tres cucharas soperas colmadas de harina.Remover un poco, cuidando que la harina no llegue al punto en que cambia de color.'),
('12', '3', 'p2.jpg', 'Tirar agua hasta hacer un caldo donde se cocinarán las patatas (peladas y en trozos no muy pequeños).'),
('12', '4', 'p3.jpg', 'Agregar la sal y remover de modo que nada se pegue al fondo la olla.Servir decorándolo con perejil picado.'),
('13', '1', 'p1.jpg', 'COCINA el pollo en una olla profunda con aceite hasta que esté completamente cocido. Retira del fuego y reserva.'),
('13', '2', 'p2.jpg', 'LICÚA las almendras con el chile chipotle, los jitomates, el ajo, la cebolla y los clavos.'),
('13', '3', 'p2.jpg', 'AGREGA la salsa de almendra a la olla donde se cocinó el pollo, añade el caldo de pollo, la sal y la pimienta. Cocina a fuego medio por 10 minutos.'),
('13', '4', 'p2.jpg', 'REGRESA las piezas de pollo a la olla y cubre por completo con la salsa. Deja a fuego bajo por 15 minutos.'),
('13', '5', 'p3.jpg', 'SIRVE con guarnición de arroz y verduras.'),
('14', '1', 'p1.jpg', 'Precalentamos el horno a 180ºC, con calor arriba y abajo.'),
('14', '2', 'p2.jpg', 'Empezamos haciendo un sofrito con todas las verduras. Tras lavarlas adecuadamente, las cortaremos todas en trocitos muy finos, prácticamente picadas. En una sartén con un chorro de aceite pocharemos la cebolla y a continuación añadiremos el resto de verduras: ajo tierno, zanahoria, calabacín, champiñones y tomate.'),
('14', '3', 'p2.jpg', 'Dejaremos que en total se cueza a fuego medio durante 15 o 20 minutos. Piensa que las verduras se acabarán de hacer al horno, junto a la carne.'),
('14', '4', 'p2.jpg', 'En un bol mezclamos las verduras con la carne picada cruda. Añadimos sal, pimienta blanca y la salsa Worcestershire al gusto, y removemos bien para formar una mezcla más o menos homogénea.'),
('14', '5', 'p2.jpg', 'A continuación vertemos la mezcla en un molde rectangular. Con la ayuda de un tenedor o una espátula apretaremos bien la carne para que nos quede un pastel salado compacto. Horneamos el pastel de verduras durante 30 minutos a 180 grados de temperatura.'),
('14', '6', 'p2.jpg', 'Horneamos el pastel de verduras durante 30 minutos a 180 grados de temperatura.'),
('14', '7', 'p2.jpg', 'Una vez sacado del horno, puedes dejar enfriar el pastel de carne y tomarlo frío o servirlo inmediatamente. Aunque caliente está delicioso.'),
('14', '8', 'p3.jpg', 'Acompaña el pastel de carne y verduras con un buen vino tinto, unos champiñones en salsa de tomate y, de postre, por qué no regalarte un delicioso pastel de boniato americano.'),
('15', '1', 'p1.jpg', 'Coloca agua en una olla y ponla a hervir. Añade los fideos deja cocinar, escurre y reserva.'),
('15', '2', 'p2.jpg', 'En otra olla, calienta el aceite, añade el ajo y el jengibre, cocina hasta que estén tiernos. Añade la salsa de soja y el mirin. Mezcla durante 1 minuto y añade el caldo de pollo. Tapa la olla y lleva a ebullición. Sazona con sal.'),
('15', '3', 'p3.jpg', 'Agrega el pollo, deja cocinar durante 10 minutos.'),
('15', '4', 'p1.jpg', 'Añade el shiitake, deja cocinar por 10 minutos.'),
('15', '5', 'p2.jpg', 'Agrega la carne de cerdo, espera 2 minutos y retira del fuego.'),
('15', '6', 'p3.jpg', 'Para emplatar, reparte primero los fideos, luego sirve el caldo. Añade el pollo, una o varias piezas de carne de cerdo y una mitad de huevo cocido. Termina con la cebolleta verde picada.'),
('16', '1', 'p1.jpg', 'Extiende la masa de hojaldre y corta 8 círculos con ayuda de un cortapastas redondo. '),
('16', '2', 'p2.jpg', 'Reserva 4 piezas y haz aros con las otras 4 recortando un círculo interior en cada una con un cortapastas más pequeño (reserva el interior para utilizar como tapa del volován).'),
('16', '3', 'p3.jpg', 'Mezcla la yema de un huevo con unas gotas de agua y remueve. Coloca los 4 círculos grandes sobre una superficie lisa y píntalos con la yema utilizando un pincel de cocina.'),
('16', '4', 'p2.jpg', 'Coloca encima de cada uno un aro de hojaldre y vuelve a pintar con la yema. Pincha el centro de los círculos con la punta de un cuchillo (para que el hojaldre suba menos por el centro).'),
('16', '5', 'p3.jpg', 'Pon papel de horno sobre una bandeja para horno y coloca encima los volovanes y las tapas. Si lo deseas, salpimienta el hojaldre. Hornea con el horno precalentado a 180ºC durante 10-12 minutos, hasta que el hojaldre esté dorado.'),
('16', '6', 'p3.jpg', 'Para saber si están hechos, comprueba que la base de los volovanes esté bien cocinada y no quede cruda. Sácalos del horno y déjalos enfriar sobre una rejilla metálica. Retira el centro de los volovanes con cuidado para poder rellenarlos.'),
('17', '1', 'p1.jpg', 'Abre los camarones con mucho cuidado por la parte de en medio y rellena con un poco de queso crema. Salpimenta.'),
('17', '2', 'p2.jpg', 'Empaniza los camarones pasando por harina, huevo y Pan Molido Clásico Bimbo ®'),
('17', '3', 'p3.jpg', 'Coloca los camarones en palitos para brocheta y fríe en una sartén con aceite caliente a fuego medio, hasta que tengan un color dorado. Escurre sobre papel absorbente.'),
('17', '4', 'p2.jpg', 'Para la salsa, licúa todos los ingredientes hasta obtener una salsa homogénea.'),
('17', '5', 'p3.jpg', 'Sirve los camarones con la salsa.'),
('18', '1', 'p1.jpg', 'En una sartén grande rehogamos en aceite la cebolla picada muy menudita. Lo hacemos a fuego lento para que se poche despacio.'),
('18', '2', 'p2.jpg', 'Cuando esté tierna agregamos el arroz y salteamos 1 minuto. Cubrimos con agua, salpimentamos y cocinamos el arroz 18 minutos o hasta que esté en su punto, al dente pero tierno.'),
('18', '3', 'p3.jpg', 'Durante la cocción removemos a menudo y agregamos más agua si es necesario.'),
('18', '4', 'p1.jpg', 'Retiramos del fuego, incorporamos la mantequilla, la nuez moscada, el queso rallado, y volvemos a probar de sal. Dejamos enfriar a temperatura ambiente.'),
('18', '5', 'p2.jpg', 'Cuando esté frío formamos las croquetas, alargadas o como albóndigas redondas, al gusto.'),
('18', '6', 'p1.jpg', 'En el centro de cara croqueta ponemos un trozo de mozzarella (redondo o alargado, según la forma que vayas a darle a la croqueta) y pasamos al momento por harina, huevo batido y pan rallado.'),
('18', '7', 'p2.jpg', 'Reservamos en frío hasta el momento de freírlas para que se compacten. '),
('18', '8', 'p3.jpg', 'Freímos en aceite caliente y servimos al momento, bien calientes, para que el queso esté fundido en el interior. También se pueden tomar frías.'),
('19', '1', 'p1.jpg', 'Pelamos la cebolla y lavamos el tomate. Los picamos muy finos, lo más posible, que se vean pero que se note lo justo.'),
('19', '2', 'p2.jpg', 'Elegimos unos aguacates maduros que no estén demasiados duros para aplastarlos, además el sabor del aguacate maduro es mucho mejor.'),
('19', '3', 'p3.jpg', 'Debe estar maduro pero no blando, la piel debe estar firme y al apretar con el dedo se hundirá ligeramente.'),
('19', '4', 'p1.jpg', 'Si los habéis comprado muy verdes, los podéis envolver en papel de periódico y dejarlos en un bol a temperatura ambiente para que maduren. Nunca en la nevera.'),
('19', '5', 'p2.jpg', 'Cortamos los aguacates por la mitad hasta el hueso y giramos cada parte separando las dos mitades.'),
('19', '6', 'p3.jpg', 'Nos ayudamos de una cuchara de plástico para vaciar las dos partes y dejamos el hueso en la misma fuente donde vamos a poner el aguacate.'),
('20', '1', 'p1.jpg', 'Sazona el pollo con sal, pimienta y orégano al gusto para posteriormente cortarlo en tiras cortas aprox. de 2cm.'),
('20', '2', 'p2.jpg', 'Coloca un recipiente al fuego con el aceite para que se vaya calentando.'),
('20', '3', 'p1.jpg', 'Bate los dos huevos.'),
('20', '4', 'p2.jpg', 'Coloca el harina, los huevos batidos y el empanizador en recipientes por separado donde se puedan bañar las tiras de pollo.'),
('20', '5', 'p3.jpg', 'Se pasan las tiras de pollo sazonadas por harina, luego por el batido de huevo y por último por el empanizador.'),
('20', '6', 'p1.jpg', 'Después se pasan al aceite caliente y se dejan freír por 10 minutos o menos aproximadamente.'),
('20', '7', 'p2.jpg', 'En lo que se fríen las tiras de pollo se puede ir preparando la salsa mezclando la salsa picante con salsa BBQ hasta que quede al gusto.'),
('20', '8', 'p3.jpg', 'Cuando se termine de freír el pollo deja que se escurra y retira el exceso de grasa, para después servir y bañar con la salsa.'),
('21', '1', 'p1.jpg', 'Corta el queso en cubos'),
('21', '2', 'p2.jpg', 'Sirve'),
('21', '3', 'p3.jpg', 'Y listo! puedes acompañarlo con lo que quieras'),
('22', '1', 'p1.jpg', 'Sirve el queso crema en un plato'),
('22', '2', 'p2.jpg', 'Acompañalo con galletas'),
('22', '3', 'p3.jpg', 'Y listo para comer'),
('23', '1', 'p1.jpg', 'Si no las tenemos cortadas ya, cortamos las alitas de pollo. Utilizando un cuchillo muy afilado, cortamos cada alita por su articulación. La puntilla, la retiramos'),
('23', '2', 'p2.jpg', 'Una vez cortadas, las introducimos en un bol. Después salpimentamos y añadimos la harina, una cucharadita del pimentón y otra de la guindilla de cayena o chile. '),
('23', '3', 'p3.jpg', 'Removemos bien con las manos, para que las alitas de pollo se impregnen bien de la mezcla y reservamos en la nevera de 1 hora a 1 hora y media.'),
('23', '4', 'p1.jpg', 'Pasado el tiempo, freímos las alitas en abundante aceite. Debemos freírlas alrededor de 10 minutos, hasta que estén doradas.'),
('23', '5', 'p2.jpg', 'Mientras se cocina, preparamos la salsa buffalo wings. En otro cazo ponemos la mantequilla y la derretimos a fuego suave. '),
('23', '6', 'p1.jpg', 'Después añadimos la salsa picante, una pizca de azúcar, el chorrito de vinagre, la cucharadita de ajo en polvo, una cucharadita de pimentón, otra cucharadita de guindilla de cayena o chile y la cucharadita de maizena. Removemos e integramos todos los ingredientes bien y cocinamos a fuego suave unos 10 minutos.'),
('23', '7', 'p2.jpg', 'Pasado el tiempo, ya tendremos fritas las alitas y la salsa lista. Antes de nada, retiramos las alitas de pollo del aceite y las colocamos sobre papel absorbente, para eliminar el exceso de aceite.'),
('23', '8', 'p1.jpg', ' Ahora sí que sí. Colocamos el pollo en una sartén u otro recipiente y ponemos la salsa encima. Removemos bien y servimos inmediatamente. ¡Que no se enfríe!'),
('24', '1', 'p1.jpg', 'El primer paso para preparar arroz al vapor será medir la cantidad de arroz que vamos a preparar. Normalmente, se toma como medida de referencia una taza de arroz para dos personas, aunque algunas pueden requerir otras cantidades. '),
('24', '2', 'p2.jpg', 'Asimismo, a la hora de hervir este alimento, cabe destacar que la proporción de agua y arroz es de dos tazas de agua por cada taza de arroz.'),
('24', '3', 'p1.jpg', 'A continuación, deberás poner al fuego una cacerola o olla con agua con un colador encima; es fundamental que la cacerola sea suficientemente grande para que el agua no llegue a tocar el colador o salpique al cocer. '),
('24', '4', 'p2.jpg', 'Asimismo, el colador deberá encajar perfectamente sobre la olla y ser suficientemente fino para que no se cuelen los granos de arroz.'),
('24', '5', 'p1.jpg', 'Mientras se calienta el agua, deberás lavar el arroz con agua fría para quitar el almidón y evitar que se apelmace al cocinarlo. Puedes usar el colador u otro escurridor y ponerlo directamente bajo el grifo.'),
('24', '6', 'p2.jpg', 'En el momento en que el agua rompa a hervir, tendrás que poner el colador con el arroz sobre la cacerola y colocar una tapadera que encaje sobre el arroz, para evitar que se escape el vapor pero sin que llegue a aplastarlo.'),
('24', '7', 'p1.jpg', 'Deberemos dejar que el arroz se cocine al vapor durante unos 20 minutos y después apagaremos el fuego.'),
('24', '8', 'p2.jpg', 'Una vez pasado este tiempo, el arroz al vapor estará listo y su apariencia será pegajosa. En caso de que no vayas a usarlo en ese momento, tápalo con un trapo de algodón limpio para que se conserve perfectamente'),
('25', '1', 'p1.jpg', 'Licúa los jitomates con la cebolla, el ajo, los cubos de Concentrado de Tomate con Pollo CONSOMATE® y los chiles, cuela y reserva.'),
('25', '2', 'p2.jpg', 'Calienta el aceite y fríe lo que licuaste durante 3 minutos o hasta que cambie de color ligeramente, agrega el agua y calienta hasta que comience a hervir.'),
('25', '3', 'p3.jpg', 'Agrega los camarones, las papas y las zanahorias, cocina por 10 minutos a fuego medio o hasta que las verduras estén suaves.'),
('25', '4', 'p1.jpg', 'Servir caliente'),
('26', '1', 'p1.jpg', 'Licúa los granos de elote con la Leche Evaporada CARNATION® CLAVEL®, la Media Crema NESTLÉ®, el agua, el consomé de pollo, la pimienta y la fécula.'),
('26', '2', 'p2.jpg', 'Calienta la crema durante 8 a 10 minutos a fuego medio o hasta que espese ligeramente, moviendo constantemente para evitar que se pegue.'),
('26', '3', 'p3.jpg', 'Sirve en un tazón y decora con perejil.'),
('27', '1', 'p1.jpg', 'Coloca el pollo y agua en una olla exprés y cocínalo de 15 a 20 minutos a partir de que comience a sonar la válvula.'),
('27', '2', 'p2.jpg', 'Deja enfriar un poco y deshebra la carne.'),
('27', '3', 'p3.jpg', 'Licúa el Concentrado de Tomate con Pollo CONSOMATE® con los chiles y el jitomate. En una olla calienta el aceite; cuela lo que licuaste y cocina 5 minutos a fuego medio o hasta que el color cambie ligeramente.'),
('27', '4', 'p2.jpg', 'Vierte en la olla el caldo donde cocinaste el pollo e incorpora el epazote, las zanahorias y las papas, cocina por 5 minutos más.'),
('27', '5', 'p3.jpg', 'Sirve el caldo en un tazón y agrega el pollo deshebrado; decora con el aguacate y ofrece.'),
('28', '1', 'p1.jpg', 'Calienta la mantequilla y fríe los champiñones, cocina hasta que estén tiernos y reserva.'),
('28', '2', 'p2.jpg', 'Licúa la Leche Evaporada CARNATION® CLAVEL® 80% Menos Grasa* con los champiñones, el agua y el consomé de pollo en polvo. Cuela y regresa al fuego'),
('28', '3', 'p3.jpg', 'Deja que se caliente y cocina por 10 minutos o hasta que espese un poco, moviendo constantemente para evitar que se pegue. Retira del fuego y ofrece.'),
('29', '1', 'p1.jpg', 'Licúa junto con los chiles, el cilantro, la Leche Evaporada CARNATION® CLAVEL®, el consomé de pollo en polvo, la cebolla en polvo.'),
('29', '2', 'p2.jpg', 'En una olla con mantequilla caliente, sofríe esta preparación a fuego bajo por 15 minutos.'),
('29', '3', 'p3.jpg', 'Sirve caliente.'),
('30', '1', 'p1.jpg', 'Coloque los frijoles en una olla, cúbralos con agua fría y déjelos remojar toda la noche para que se hidraten. Drene y deseche el agua.'),
('30', '2', 'p2.jpg', 'Cueza los frijoles con agua hasta que estén suaves; en olla de presión, por 20 minutos, y en una olla normal, 2 horas. (En caso de no remojarlos previamente, el tiempo de cocción aumentará.)'),
('30', '3', 'p3.jpg', 'Fría el tocino en una cazuela a fuego medio hasta que se dore ligeramente y suelte su grasa; agregue la longaniza o el chorizo, deje dorar un poco y añada la cebolla, el ajo, el jitomate y los chiles; deje que todo se sofría muy bien.'),
('30', '4', 'p1.jpg', 'Cuando los frijoles estén cocidos y suaves, añada el sofrito del tocino al caldo y deje cocer durante 20 minutos más.'),
('30', '5', 'p2.jpg', 'Pruebe, ajuste de sal y agregue el cilantro poco antes de servir los frijoles.'),
('30', '6', 'p2.jpg', 'Sirva bien caliente en platos hondos o tazones procurando que en cada uno haya suficientes frijoles, tocino, longaniza y componentes del preparado.'),
('30', '7', 'p3.jpg', 'De esta forma, el platillo está completo; los comensales pueden añadir las guarniciones al gusto.'),
('31', '1', 'p1.jpg', 'CALENTAR en una cacerola amplia el aceite a lumbre media-alta y freír ahí el Chorizo a dorar ligeramente, retirarlo y colocarlo sobre un papel absorbente para retirarle el excedente de grasa'),
('31', '2', 'p2.jpg', 'FREÍR en la misma cacerola con el aceite y la grasa que soltó el Chorizo el Fideo, solo a que comience a dorar, con cuidado retirarle el exceso de grasa'),
('31', '3', 'p1.jpg', 'LICUAR el Puré de Jitomate con la cebolla, ajo, chipotle, concentrado de Pollo y Pimienta'),
('31', '4', 'p2.jpg', 'VERTER sobre el Fideo el Puré licuado, dejar cocinar moviendo constantemente por 5 minutos, agregar el consomé y el Chorizo, tapar y bajar la lumbre a mínimo, dejar cocinar hasta que se haya absorbido todo el líquido y el Fideo este cocido y suave. Rectificar en el proceso de sal'),
('31', '5', 'p3.jpg', 'SERVIR caliente adornando por encima con queso rallado seco'),
('32', '1', 'p1.jpg', 'Poner una olla de agua y llevar a ebullición, luego echar un poco de sal y cocer la pasta al dente. "Evitar que el agua tenga muchas burbujas para mejor cocción de la pasta"'),
('32', '2', 'p2.jpg', 'Mientras se va cocinando la pasta pelar los ajo y cortar en rodajas, picar el peperoncino / guindilla si es fresca o machacar si es seco y picar el perejil.'),
('32', '3', 'p3.jpg', 'Cuando la pasta este casi lista vierta el aceite en una sartén, añadir los ajos hasta que estén dorados dejar parcialmente a fuego muy suave y añadir el peperoncino / guindilla.'),
('32', '4', 'p2.jpg', 'Una vez los ajos estén completamente dorados, añadir la mitad del perejil y unos segundos más tarde, un cucharón de agua de cocción de la pasta.'),
('32', '5', 'p2.jpg', 'Escurrir la pasta y verter en la sartén y saltear con el ajo, el peperoncino / guindilla y el perejil durante un par de minutos.'),
('32', '6', 'p3.jpg', 'servir inmediatamente y decorar en el perejil picado restante.'),
('33', '1', 'p1.jpg', 'En un trasto pon los mariscos y la cebolla, revuelve y báñalos con el jugo de limón'),
('33', '2', 'p2.jpg', 'Sazona con sal y pimienta, cubre con plástico autoadherible y refrigera 20 minutos.'),
('33', '3', 'p3.jpg', 'Al momento de servir, distribuye la lechuga entre las tostadas, encima reparte la preparación de mariscos y acompaña con salsa.'),
('34', '1', 'p1.jpg', 'Coloca la carne en la olla de presión. Cubre con agua y agrega la cebolla, 3 dientes de ajo, laurel y sal al gusto.'),
('34', '2', 'p2.jpg', 'Tapa y cuece a presión durante 1 hora (a partir de el momento en que la válvula empiece a sonar).'),
('34', '3', 'p3.jpg', 'Una vez lista, saca la carne de la olla y deshebra. Cuela el caldo, toma 2 tazas para la salsa y reserva el resto para otro uso.'),
('34', '4', 'p2.jpg', 'Hierve los chiles durante 5 minutos. Retira del fuego y deja reposar en el agua caliente durante 5 minutos más o hasta que se suavicen.'),
('34', '5', 'p3.jpg', 'Licúa muy bien los chiles con 2 tazas del caldo de la carne, vinagre, ajo, pimienta negra, orégano, tomillo, cominos, jengibre, clavos, pimientas gordas, pimienta negra y canela, hasta tener una salsa espesa completamente tersa.'),
('34', '6', 'p2.jpg', 'Vierte la salsa dentro de una cazuela o cacerola grande a fuego medio. Cuando empiece a hervir, reduce el fuego a lo más bajo y agrega la carne; revuelve muy bien.'),
('34', '7', 'p3.jpg', 'Tapa la cazuela y cocina la carne por lo menos 30 minutos para que los sabores se integren.'),
('35', '1', 'p1.jpg', 'COCINA las papa en agua hirviendo con dos cucharadas de sal por 10 minutos. Drena el agua y sumérgelas en agua fría por 5 minutos.'),
('35', '2', 'p2.jpg', 'CALIENTA una olla grande y profunda, agrega el aceite y sofríe las cebollas hasta que estén transparentes, añade el ajo, la mostaza y cocina por 2 minutos más.'),
('35', '3', 'p3.jpg', 'SAZONA las chuletas con sal y pimienta por ambos lados, agrégalas a la olla junto con la cerveza, las papas, el tomillo y las hojas de laurel. Tapa y cocina por 20 minutos a fuego medio.'),
('35', '4', 'p3.jpg', 'RETIRA las hojas de laurel y sirve.'),
('36', '1', 'p1.jpg', 'Cuece la pasta al dente, escúrrela.'),
('36', '2', 'p2.jpg', 'Corta el jitomate en cuadros, los espárragos y la arrachera.'),
('36', '3', 'p3.jpg', 'En un sartén dora los espárragos con un poco cebolla en cuadros, agrega sal y pimienta, agrega la arrachera y el jitomate, verifica sal y pimienta. '),
('36', '4', 'p3.jpg', 'Incorpora la pasta con los ingredientes.'),
('37', '1', 'p1.jpg', 'Lavar el huachinango, untarlo con limón, con el aceite, ajo y cebolla. Ponerlo en el horno caliente por 20 minutos a escalfar y sacarlo.'),
('37', '2', 'p2.jpg', 'Pelar los jitomates, quitarles las semillas y picarlos. Rebanar la cebolla y si se quiere el pimiento morrón. Freírlos en el aceite de oliva y dejar cocinar 5 minutos. Añadir la canela, el clavo, las hojas de laurel, las aceitunas, y las alcaparras.'),
('37', '3', 'p3.jpg', 'Dejar cocinar. Condimentar con sal y pimienta y si es necesario añadir una pizca de bicarbonato.'),
('37', '4', 'p2.jpg', 'Se le añade el jugo que soltó el pescado, se rectifica el sazón y se pone un poco de pan molido para que espese un poco y recoja los jugos.'),
('37', '5', 'p3.jpg', 'Se vacía la salsa sobre el pescado, y justo antes de servir se mete al horno por 20 minutos. Se adorna con chiles largos y si se quiere un poco picante se le pone a la salsa un poco del jugo de los chiles.'),
('38', '1', 'p1.jpg', 'Precalienta el horno a 220°C.'),
('38', '2', 'p2.jpg', 'En un bowl, mezcla la sal con el aceite, el ajo, el tomillo, la albahaca, el romero y la mostaza a la antigua. Unta el lomo de cerdo con esta mezcla y cubre perfectamente bien.'),
('38', '3', 'p3.jpg', 'Envuelve el lomo en papel aluminio y coloca en una charola para horno, hornea alrededor de 40 minutos. Retira el papel aluminio y hornea 20 minutos más o hasta que esté bien cocido. Reserva.'),
('38', '4', 'p2.jpg', 'Para la salsa, licúa la crema para batir con el ajo, la mostaza, la miel, el caldo y el romero en tu Licuadora Infiny Force de T-fal® con la función de “salsa”, durante 10 segundos o hasta obtener la mezcla deseada.'),
('38', '5', 'p2.jpg', 'Calienta una olla a fuego medio y derrite la mantequilla. Agrega la salsa y cocina 10 minutos, sazona con sal.'),
('38', '6', 'p3.jpg', 'Rebana el lomo y sirve con la salsa, decora con romero fresco.'),
('39', '1', 'p1.jpg', 'Sazonamos las puntas con sal, pimienta y laurel al gusto; las ponemos a cocinar en la plancha, con la mitad de aceite, según el término deseado.'),
('39', '2', 'p2.jpg', 'Posteriormente cocinamos en la plancha el tocino con el restante del aceite, la cebolla, los champiñones y los chiles serranos; una vez cocinados los añadimos a las puntas de filete. '),
('39', '3', 'p3.jpg', 'Servimos con tortillas y se acompaña con guacamole y salsa ranchera.'),
('40', '1', 'p1.jpg', 'Asa los chiles, hasta que obtengan un tono más intenso, límpialos y remójalos en agua tibia por 15 minutos.'),
('40', '2', 'p2.jpg', 'En una olla grande a fuego medio, pon a cocer la carne con la cebolla, dientes de ajo, epazote y sazona con un poco de sal. Cuando la carne ya esté bien cocida, retira la cebolla y los dientes de ajo.'),
('40', '3', 'p3.jpg', 'Agrega la verdura restante, mientras, muele los chiles, con el trozo de cebolla y los ajos del caldo. Pasa la salsa por un colador y agrégala al caldo. Hierve hasta cocer la verdura.'),
('41', '1', 'p1.jpg', 'Los chiles se pasan por 300 gramos de manteca caliente, se colocan en una cazuela con agua muy caliente y se deja que den un hervor para que se suavicen.'),
('41', '2', 'p2.jpg', 'En la misma manteca se acitronan el ajo y la cebolla, se añaden la tortilla, el pan, las pasas, las almendras, las pepitas de chile, la mitad del ajonjolí, el anís, el clavo, la canela, las pimientas, el chocolate y el jitomate y se fríe todo muy bien'),
('41', '3', 'p3.jpg', 'Se agregan los chiles escurridos y se fríe unos segundos más.'),
('41', '4', 'p2.jpg', 'Todo lo anterior se muele en la licuadora con el caldo donde se coció el pavo y se cuela.'),
('41', '5', 'p2.jpg', 'En una cazuela de barro especial para mole se pone a calentar el resto de la manteca, se añade la salsa, se deja hervir el mole durante cinco minutos, se sazona con sal y azúcar y, si es necesario, se añade más caldo'),
('41', '6', 'p3.jpg', 'Debe quedar una salsa espesa. Se deja hervir de 25 a 30 minutos más a fuego lento, se añaden los trozos de guajolote y se deja hervir unos minutos más.'),
('42', '1', 'p1.jpg', 'Corte la calabaza en secciones de 3 ", cada porción. si prefieres usar las semillas por separado retira las semillas y las cuerdas, o puedes cocinarlas también con el jarabe. '),
('42', '2', 'p2.jpg', 'Coloca los conos de piloncillo, palitos de canela y rodajas de naranja en una olla grande y pesada.'),
('42', '3', 'p3.jpg', 'grega cuatro tazas de agua y gira el fuego a medio-alto hasta que comience a hervir. '),
('42', '4', 'p2.jpg', 'Los conos de piloncillo empezarán a disolverse, revuelva de vez en cuando. '),
('42', '5', 'p1.jpg', 'Una vez que el piloncillo se ha disuelto, coloca algunas piezas de calabaza con el lado de la piel hacia abajo y luego el resto de la calabaza con la piel hacia arriba. '),
('42', '6', 'p2.jpg', 'Si ves que las piezas no están cubiertas con el líquido del piloncillo, no se preocupe, la calabaza liberará algunos de sus propios jugos, y el vapor también ayudará con la cocción.'),
('42', '7', 'p3.jpg', 'Baja el fuego, cubra la olla y cocine a fuego lento. Cocina por unos 20-30 minutos, estará lista cuando la calabaza esté tierna, y se hayan empapado de algunos de los jarabes.'),
('42', '8', 'p2.jpg', 'Una vez que la calabaza se cocina, retírala de la olla con una cuchara ranurada grande y transfiérala a una bandeja, cubra con papel de aluminio para mantener el calor mientras el jarabe sigue cocinando y se reduzca.'),
('42', '9', 'p1.jpg', 'Regresa el jarabe a ebullición, subiendo el fuego a medio alto. Mantenga la cocción revolviendo de vez en cuando hasta que se espese. '),
('42', '10', 'p2.jpg', 'Regresa los pedazos de la calabaza a la olla y agrega cucharas de jarabe por todas partes de la calabaza.'),
('42', '11', 'p3.jpg', 'Sirva la calabaza caliente o a temperatura ambiente con una llovizna de jarabe o en un cálido plato de leche. '),
('42', '12', 'p2.jpg', 'Los sabores de calabaza serán mejores al día siguiente, así que guarda algunos para más tarde.'),
('43', '1', 'p1.jpg', 'Empezamos estas galletas preparando el horno, lo precalentaremos a 180º para que esté listo a la hora de recibir estas galletas. '),
('43', '2', 'p2.jpg', 'A continuación, podemos dejar lista la bandeja de horno, la forraremos con papel de horno para que no se peguen las galletas.'),
('43', '3', 'p3.jpg', 'Seguidamente batiremos la mantequilla con la ayuda de las varillas eléctricas, hasta que esté ablandada. '),
('43', '4', 'p2.jpg', 'Será más fácil de poder trabajar la masa de las galletas. Le agregamos la taza de azúcar, hasta conseguir una masa con un color más pálido.'),
('43', '5', 'p2.jpg', 'Incorporamos los huevos sin parar de remover. '),
('43', '6', 'p3.jpg', 'Esta será la base líquida de las galletas, común para este tipo de postres.'),
('43', '7', 'p2.jpg', 'Llega el momento de darle el sabor, los plátanos los pelaremos y aplastaremos con un tenedor, hasta conseguir una masa.'),
('43', '8', 'p2.jpg', 'Añadimos los plátanos a la masa principal y batimos bien todos los ingredientes. '),
('43', '9', 'p3.jpg', 'Será en ese momento que deberemos incorporar la harina tamizada con la levadura.'),
('43', '10', 'p2.jpg', 'Para darle un toque extra de sabor le pondremos la cucharada de canela y las nueces troceadas.'),
('43', '12', 'p2.jpg', 'Estos tropezones de frutos secos se pueden substituir por trozos de chocolate o directamente no poner nada.'),
('43', '13', 'p3.jpg', 'Vamos poniendo con la ayuda de una cuchara la masa en la bandeja, hacemos círculos y los separamos unos 5 centímetros entre ellos, para que las galletas no se peguen las unas con las otras.'),
('43', '14', 'p3.jpg', 'Horneamos estas galletas unos 15 minutos. Mientras podemos preparar un glaseada con el azúcar glas, la mantequilla y un poco de vainilla. Cuando estén listas bañamos las galletas en esta mezcla, quedarán de vicio.'),
('44', '1', 'p1.jpg', 'Precalienta el horno a 200 C° .'),
('44', '2', 'p2.jpg', 'Engrasa y enharina un molde de 25 cms de diámetro.'),
('44', '3', 'p3.jpg', 'Licua los granos de elote con los demás ingredientes '),
('44', '4', 'p2.jpg', 'Viertelos sobre el molde y hornea hasta que dore.'),
('44', '5', 'p3.jpg', 'Ideal para llevar a la oficina y el lunch de los niños como postre!!!'),
('45', '1', 'p1.jpg', 'Derretir las barras de mantequilla y batir con el azúcar.'),
('45', '2', 'p2.jpg', 'Agregar los huevos, harina, cocoa y polvo para hornear uno por uno sin dejar de batir.'),
('45', '3', 'p3.jpg', 'Cuando estén incorporados todos los ingredientes, agregar las nueces y la vainilla.'),
('45', '4', 'p2.jpg', 'Engrasar a un molde rectangular o cuadrado con mantequilla y vaciar la mezcla.'),
('45', '5', 'p3.jpg', 'Meter al horno precalentado a 175°C por 40 minutos.'),
('46', '1', 'p1.jpg', 'imero, ponemos en una cazo la nata o crema de leche fría y disolvemos el sobre de gelatina de fresa.'),
('46', '2', 'p2.jpg', 'A continuación, añadimos las 2 cucharadas de azúcar y lo ponemos a calentar.'),
('46', '3', 'p3.jpg', 'Cuando esté casi hirviendo lo retiramos del fuego y añadimos la leche fría, mezclándolo bien.'),
('46', '4', 'p2.jpg', 'Cuando ya esté templada la crema de nata y fresa, pondremos un profiterol en el medio y rellenamos los vasitos con cuidado para que no se muevan del sitio.'),
('46', '5', 'p3.jpg', 'Por último, lo guardamos en la nevera hasta que cuaje.'),
('47', '1', 'p1.jpg', 'En un bol muy amplio ponemos la harina tamizada. En el centro hacemos forma de volcán y ponemos el resto de ingredientes. '),
('47', '2', 'p2.jpg', 'Es conveniente que todos ellos estén a temperatura ambiente.'),
('47', '3', 'p3.jpg', 'Mezclamos bien con las manos unos 12 a 15 minutos o con ayuda de la batidora con el accesorio de amasar unos 12 minutos.'),
('47', '4', 'p2.jpg', 'Nos debe quedar una masa sedosa y fina, no pegajosa pero de las que se pegan un poquito. Si es necesario, añade un poco de harina hasta que veamos que tiene la consistencia que necesitamos.'),
('47', '5', 'p1.jpg', 'En un bol muy grande engrasado con un poco de aceite pasamos la masa. Damos vueltas a la masa para que se quede engrasada pero no debemos volver a mezclar.'),
('47', '6', 'p2.jpg', 'Tapamos el bol con papel film y lo dejamos en un lugar cálido levar unas dos a dos horas y media. Debe duplicar su tamaño.'),
('47', '7', 'p3.jpg', 'Una vez ha levado, la ponemos sobre un papel vegetal y la estiramos con un rodillo, si todavía se pega un poco enharinamos el rodillo y un poco la masa por encima para que no se pegue. '),
('47', '8', 'p2.jpg', 'En mi caso no ha hecho falta Formamos un rectángulo de 1 a 2 cm de grosor y sale unos 40 por 30 aproximadamente de tamaño.'),
('47', '9', 'p1.jpg', 'Corta la manzana en pequeños cuadraditos y pásalas con zumo de limón para que no se nos "oxiden", los cuadraditos deben ser pequeños para que se horneen bien. En un bol mezclamos el azúcar y la canela. '),
('47', '10', 'p2.jpg', 'Empezamos en le inicio poniendo la manzana e iremos enrollando y repartiendo manzana. Se enrolla como si fuera un brazo de gitano, nos quedará un enrollado'),
('47', '11', 'p3.jpg', 'En este caso lo he puesto en el congelador 15 minutos para que no se rompiera al cortarlo antes de pasarlo a la bandeja de horno.'),
('47', '12', 'p2.jpg', 'Preparamos dos bandejas de horno con papel de hornear. Pasados los 15 minutos cortamos en rodajas un poco triangulares nuestro enrollado de 3 a 4 cm y vamos repartiendo dejando distancia de en nuestras bandejas preparadas con papel de hornear.'),
('47', '13', 'p3.jpg', 'Dejamos reposar los bollos una hora y media aproximadamente en lugar cálido para que vuelva a levar la masa. '),
('47', '14', 'p2.jpg', 'Precalentamos el horno a 180 º. Una vez han levado los bollos, los "pintamos" con cuidado con una brocha de silicona pintamos los bollos.'),
('47', '15', 'p3.jpg', 'Los horneamos entre 20 y 30 minutos, tomarán un color dorado. Sacamos del horno, dejamos enfriar y listos para comer. '),
('47', '16', 'p2.jpg', 'Si te queda alguno puedes congelarlos e ir sacando cuando te apetezca comer alguno.'),
('47', '17', 'p3.jpg', 'Dejamos a temperatura ambiente descongelar y luego unos segundos de microondas.'),
('48', '1', 'p1.jpg', 'Precalienta el horno a 175 grados con calor arriba y abajo.'),
('48', '2', 'p2.jpg', 'Calienta la mantequilla en el microondas durante 1 minuto para derretirla. Pincela el molde con la mantequilla derretida para que no se pegue la tarta.'),
('48', '3', 'p3.jpg', 'Prepara la masa. Pincela cada una de las láminas con la mantequilla derretida. Arruga cada lámina como si estuvieras haciendo un abanico y, con cuidado de que no se rompa, ve formando las flores. (Mira en el vídeo cómo lo hago). '),
('48', '4', 'p2.jpg', 'Sencillamente hay que empezar con una tira enrollada en el centro e ir añadiendo las tiras alrededor, es muy sencillo hacer la flor con masa filo. '),
('48', '5', 'p3.jpg', 'Debes pincelar las láminas rápido porque la masa se rompe con facilidad. Ve formando todas las flores, cuanto más irregulares queden más bonita se verá.'),
('48', '6', 'p1.jpg', 'Lleva la masa al horno precalentado a 175 grados. En 10 minutos tendrás la flor dorada.'),
('48', '7', 'p2.jpg', ' Prepara el flan. Coloca un cazo al fuego con la leche, la canela, y unas pieles de limón. Baja el fuego en cuanto empiece a hervir y deja que hierva un minuto.'),
('48', '8', 'p3.jpg', 'Retira del fuego. Coloca los huevos en un bol, añade el azúcar y mezcla bien. Añade la leche a través de un colador para retirar la piel del limón y la canela.'),
('48', '9', 'p2.jpg', 'Reparte el flan en la tarta con cuidado. Introduce en el horno a 175 grados con calor por la parte de abajo durante 20 minutos o hasta que, al pinchar con un palito, salga limpio.'),
('48', '10', 'p3.jpg', 'Adorna la tarta. Espolvorea a través de un colador azúcar glass cuando la tarta esté fría.'),
('49', '1', 'p1.jpg', 'Batir las claras a punta de nieve'),
('49', '2', 'p2.jpg', 'Mezclar almendra molida, canela y orujo en un bol. En otro bol, mezclar las claras montadas con el azúcar'),
('49', '3', 'p3.jpg', 'Añadir la mitad de la mezcla de claras con azúcar a la mezcla de almendra, canela y orujo. mezclar muy bien - si está muy seca la masa se puede añadir más clara. Hecha la masa, dejar reposar 10 minutos'),
('49', '4', 'p2.jpg', 'Espolvorear azúcar en polvo en la superficie donde va a enrollar. Extender la masa y cortar estrellas con una molde para cortar estrellas (venden en Ikea). Poner las estrellas sobre una bandeja o plato grande. Poner en el centro una cucharadita de la clara de huevo y azúcar, y untar por la galleta.'),
('49', '5', 'p3.jpg', 'Calentar el horno a 175ºC durante unos 5 minutos (tal vez un poco mas) hasta que estén doradas y crujientes.'),
('50', '1', 'p1.jpg', 'Lo primero que vamos a preparar es el bizcocho. Para ello comenzamos dorando las almendras, puedes hacerlo poniéndolas en una bandeja de horno y a 150ºC durante unos 15 minutos vigilándolas que no se quemen, o más rápido en una sartén como hemos hecho nosotros, apenas 5 minutos a fuego medio y removiéndolas para evitar que se doren demasiado'),
('50', '2', 'p2.jpg', 'Con una picadora las trituramos y las dejamos como si fuera una harina gruesa para que se mezcle perfectamente con los demás ingredientes. Reserva.'),
('50', '3', 'p3.jpg', 'Precalienta el horno a 170ºC mientras preparas el bizcocho.'),
('50', '4', 'p2.jpg', 'En un bol grande mezcla la mantequilla (que deberá estar en textura pomada, es decir, sácala al menos 30 minutos antes de la nevera para que sea fácil trabajar con ella) y el azúcar blanco, y bátelo bien hasta que la mezcla sea densa y blanquecina y el azúcar se haya integrado con la mantequilla.'),
('50', '5', 'p3.jpg', 'Ahora vamos a montar las claras. Los huevos deberán estar a temperatura ambiente, por lo que sácalos de la nevera al menos media hora antes de comenzar a manipularlos. Separa las yemas de las claras dejando las claras en un bol grande y móntalas con unas varillas manuales o eléctricas. Cuando estén casi montadas añade el azúcar glas y sigue con el proceso, procurando que no queden muy duras.'),
('51', '1', 'p1.jpg', 'Calienta el aceite o la manteca de cerdo en un sartén a fuego medio-bajo.'),
('51', '2', 'p2.jpg', 'Empieza a freír las cebollas hasta que estén transparentes y comiencen a dorarse.'),
('51', '3', 'p3.jpg', 'Agrega los frijoles y machuca los frijoles con un machacador ya sea de metal o madera hasta formar una pasta muy fina. Mezcla muy bien con las cebollas doradas hasta obtener un puré suave . '),
('51', '4', 'p2.jpg', '“Se convertirán en un puré espeso, con una cuchara revuleve bien hasta los bordes y el fondo de la sartén. Si prefieres agregar un poco más de aceite, este es el momento de hacerlo”.'),
('51', '5', 'p3.jpg', 'Inclina la sartén hacia los lados y forma un como un rollo con la pasta de frijoles. Me gusta voltearlos un poco como hot cakes.'),
('51', '6', 'p3.jpg', ' Prueba la sazón para comprobar si necesita sal. Los frijoles se despegarán de las orillas del sarten cuando ya esten listos.'),
('52', '1', 'p1.jpg', 'Pele las papas previamente cocinadas, májelas con el prensapapas, reserve.'),
('52', '2', 'p2.jpg', 'En un sárten coloque la margarina y el aceite junto con el achiote'),
('52', '3', 'p3.jpg', 'Añada la cebolla y caranelica, debe quedar bien doraditasin que se queme'),
('52', '4', 'p2.jpg', 'Añada el ajo finamente picado, añada el puré de papa, revuelva bien, debe quedar anaranjado'),
('52', '5', 'p3.jpg', 'Salpimiente al gusto.'),
('53', '1', 'p1.jpg', 'Precalienta el horno a 180°C.'),
('53', '2', 'p2.jpg', 'Abre la lata de la salsa vaciala en un recipiente y reserva.'),
('53', '3', 'p3.jpg', 'Utiliza la misma lata, enjuagala y con ella corta las tortillas en forma circular.'),
('53', '4', 'p2.jpg', 'Utiliza un molde para cupcakes y engrasalo con un poco del aceite para que no se vayan a pegar nuestras pizzas. Acomoda las tortillas recien cortadas.'),
('53', '5', 'p3.jpg', 'Agregales un poco de la salsa, queso , unos cuentos pepperonis y un poco de tocino. En ese orden.'),
('53', '6', 'p2.jpg', 'Metelas al horno por 10 o 12 minutos o hasta que el queso este derretido y la tortilla este doradita.'),
('53', '7', 'p3.jpg', 'Retira y deja enfriar.'),
('54', '1', 'p1.jpg', 'En un recipiente batir levemente el huevo, agregar el aceite, leche, harina, sal y pimienta a gusto. Batir hasta formar un batido suave y homogénea.'),
('54', '2', 'p2.jpg', 'Mientras, cortamos la cebolla en finos aros (1/2 cm aprox.). Untamos cada aro dentro del batido y escurrimos un poquito para luego poner a freír en aceite caliente.'),
('54', '3', 'p3.jpg', 'Cuidar de no poner muchos aros a freir a la vez, y que el aceite esté caliente pero no excesivamente, para así darle tiempo a la cebolla se cocine un poco mejor. '),
('54', '4', 'p2.jpg', 'Freír hasta dorar volteando con un tenedor.'),
('54', '5', 'p3.jpg', 'Retirar los aros de cebolla fritos y poner sobre papel absorvente antes de servir.'),
('55', '1', 'p1.jpg', 'Estiramos la masa en una bandeja a la que habremos puesto un poco de aceite, y la dejamos subir un poco.'),
('55', '2', 'p2.jpg', 'En mi caso también eché un poco de aceite en la masa para que se pudiese extender mejor. '),
('55', '3', 'p3.jpg', 'En un principio debería tardar entre 30minutos o una hora, dependiendo de la temperatura de vuestra cocina, la temperatura de la masa, etc.'),
('55', '4', 'p2.jpg', 'Una vez que tenemos la masa lista, ponemos todo el queso mozzarella [muzzarella] por encima y el queso brie [cuartirolo], dejando siempre un borde libre alrededor de la pizza para que luego podamos poner la capa de masa por encima y tenga superficie para que se pegue. '),
('55', '5', 'p3.jpg', 'Una vez que tenemos el queso, le podemos dar un toque de pimienta negra por encima si queremos.'),
('55', '6', 'p1.jpg', 'Ahora, con mucho cuidado, extendemos la masa de pizza que habremos reservado para hacer la capa  hasta que consigamos una masa muy fina, y la ponemos por encima.'),
('55', '7', 'p2.jpg', 'Para ayudarnos, la pegamos de un lado y seguidamente del extremo opuesto, luego hacemos lo mismo con los otros extremos, como si se tratase de un cuadrado, y por último vamos pegando la masa a todos los bordes de la pizza. '),
('55', '8', 'p3.jpg', 'Nos tendría que quedar casi como una apariencia de empanada gallega, solo que la capa superior es muchísimo más fina.'),
('55', '9', 'p2.jpg', 'Por último ponemos la cebolla que habremos reservado por encima de la pizza y metemos en el horno a 250ºC durante algo más de tiempo de lo normal. Creo que en esta ocasión estuvo unos 8-9 minutos, aunque los tiempos dependen mucho del tipo de horno que tengas. '),
('55', '10', 'p3.jpg', 'Si queremos podemos ponerle un poco de parmesano y un chorrito de aceite de oliva virgen extra por encima de la pizza antes de meterla en el horno.'),
('56', '1', 'p1.jpg', 'Licua la Media Crema NESTLÉ® con el queso crema, las nueces, el consomé de pollo en polvo y el chile chipotle'),
('56', '2', 'p2.jpg', 'Sirve el dip sobre galletas saladas y ofrece.'),
('57', '1', 'p1.jpg', 'Cortamos las salchichas por la mitad y les clavamos el palito.'),
('57', '2', 'p2.jpg', 'Ponemos el aceite a calentar en un cazo estrecho, para que tenga profundidad. Mezclamos las dos harinas con el azúcar, la levadura, la sal y la pimienta.'),
('57', '3', 'p3.jpg', 'Vamos añadiendo la leche poco a poco y comprobando si hace falta más hasta que quede la textura de una bechamel espesa. Lo batimos todo muy bien hasta que no queden grumos.'),
('57', '4', 'p2.jpg', 'Pasamos la mezcla a un vaso alto, así será más fácil cubrir las salchichas. Las vamos cubriendo una a una con la mezcla y freímos alrededor de 2-3 minutos cada una, hasta que empiecen a dorarse.'),
('57', '5', 'p3.jpg', 'Dejamos que reposen sobre un papel de cocina para que absorba el exceso de aceite. Servimos calientes o templadas, acompañado con salsas ketchup, mostaza y mayonesa.'),
('58', '1', 'p1.jpg', 'Se toma la salchicha y de un extremo se hacen dos cortes transversales hasta la mitad de la salchicha de esta forma se simulan las extremidades del pulpo. Se fríen los salchipulpos hasta que tengan un color dorado.'),
('58', '2', 'p2.jpg', 'Se coloca dentro de un plato lechuga o ensalda con lo que se quiera acompañar y se ponen las dos salchichas cortadas extiendondolas para que tome forma de pulpo.'),
('58', '3', 'p3.jpg', 'Se les puede poner unos puntos para sus ojos y boca con catsup y listo tienes un delicioso lunch para tus hijos.'),
('59', '1', 'p1.jpg', 'En una sarteneta derretir la mantequilla, sofreír la cebollita con todo y rabo.'),
('59', '2', 'p2.jpg', 'Agregar el tocino de pavo picado salpimentando al gusto.'),
('59', '3', 'p3.jpg', 'Precalentar el horno, acomodar los portobellos limpios y sin tallo sobre una charola para hornear.'),
('59', '4', 'p3.jpg', 'Rellenar los portobellos con la preparación salpimentada, cubrir con las laminillas de manchego y hornear hasta que esten blanditos y crujientes.'),
('60', '1', 'p1.jpg', 'Precalienta el horno a 200°C.'),
('60', '2', 'p2.jpg', 'En un bowl mezcla los jitomates, el ajo, la cebolla, el aceite de oliva, la sal de grano y la pimienta.'),
('60', '3', 'p3.jpg', 'Vierte los ingredientes del bowl en una charola y hornea por 15 minutos o hasta que se rosticen.'),
('60', '4', 'p1.jpg', 'Retira del horno y licúa con el tomillo, el orégano, la albahaca, el caldo y la crema para batir hasta conseguir una mezcla homogénea.'),
('60', '5', 'p2.jpg', 'Coloca la mezcla en una olla y deja hervir. Rectifica sazón, y sirve caliente.'),
('60', '6', 'p3.jpg', 'Decora con jitomate cherry y albahaca fresca.'),
('61', '1', 'p1.jpg', 'Derrite la mantequilla en una olla a fuego moderado. Agrega mitad de la cebolla, y sofríe hasta que se vea transparente.'),
('61', '2', 'p2.jpg', 'Añade el cilantro y sofríe hasta que se haya marchitado. Agrega el vino, tapa y cocina unos segundos. Retira del fuego y deja enfriar un poco.'),
('61', '3', 'p3.jpg', 'Pasa la mezcla anterior al vaso de la licuadora. Agrega la cebolla cruda, caldo de pollo y leche evaporada. '),
('61', '4', 'p2.jpg', 'Licua bien. Regresa a la olla y cocina a fuego medio, moviendo constantemente, durante 5 minutos. '),
('61', '5', 'p3.jpg', 'Reduce el fuego a bajo, incorpora la crema y sazona con sal. Cocina hasta que todo se haya calentado. Sirve caliente.'),
('62', '1', 'p1.jpg', 'Remojar el arroz en agua caliente por unos 15 minutos, después lo lavas en agua fría hasta que el agua salga transparente, lo escurres bien y lo dejas secar.'),
('62', '2', 'p2.jpg', 'En una cacerola vamos a freír el arroz con aceite hasta que empiece a verse dorado claro y retira el exceso de aceite.'),
('62', '3', 'p3.jpg', 'Vamos a licuar el jitomate, ajo y cebolla el puré debe quedar espeso, lo agregas al arroz y lo dejas cocinando unos minutos hasta que lo absorba.'),
('62', '4', 'p2.jpg', 'Después agregamos el liquido (caldo ó agua), sal y las verduras y mueve con cuidado para distribuir los ingredientes, vamos a cubrir con las ramas de perejil y cilantro'),
('62', '5', 'p3.jpg', 'y ya que empiece a hervir, tape la cacerola y no vuelva a destapar hasta después de 15 minutos para revisar cuánta agua tiene máximo déjalo 20 minutos y quítalo del fuego y déjalos unos 10 minutos y listo lo puedes servir'),
('63', '1', 'p1.jpg', 'LAVA el arroz bajo el chorro de agua hasta que ésta deje de salir blanca. Reposa el arroz en el colador hasta que esté casi seco.'),
('63', '2', 'p2.jpg', 'ASA los chiles hasta que la piel se torne de color oscuro. Colócalos en una bolsa y déjalos sudar por 10 minutos. Retira la piel quemada, retira las semillas.'),
('63', '3', 'p1.jpg', 'LICÚA los chiles junto con el perejil, 1 taza de caldo de pollo, sal y pimienta; reserva.'),
('63', '4', 'p2.jpg', 'SOFRÍE la cebolla y el ajo por 5 minutos a fuego medio, añade el arroz y dóralo por 7 minutos.'),
('63', '5', 'p1.jpg', 'AGREGA el caldillo de chile poblano, mezcla bien para que todo quede bien incorporado y hierve.'),
('63', '6', 'p2.jpg', 'ADICIONA los granos de elote amarillo, vuelve a mezcla con cuidado. Cuando hierva, tapa la olla dejando un pequeño espacio para que salga el vapor y baja el fuego a lo más bajo que de tu estufa. Cocina por 35 minutos.'),
('63', '7', 'p3.jpg', 'MUEVE el arroz con un tenedor para esponjarlo y sirve. '),
('64', '1', 'p1.jpg', 'En cazo ponemos el agua a calentar y añadimos la pastilla de caldo de verduras. Cuando hierva apagamos el fuego y lo reservamos.'),
('64', '2', 'p2.jpg', 'Mientras cortamos en trozos la cebolla, ajos y el pimiento. En una olla añade un poco de aceite y sofreímos estos ingredientes durante tres minutos. '),
('64', '3', 'p1.jpg', 'A continuación añade el arroz sin el caldo y sofríe otro minuto.'),
('64', '4', 'p2.jpg', 'Incorpora dos cucharadas de tomate natural, el caldo de verduras y un poco de colorante o azafrán molido. Cocinamos el arroz a fuego medio durante 15 minutos'),
('64', '5', 'p1.jpg', 'Transcurridos diez minutos de cocción, añade los guisantes congelados directamente de la bolsa.'),
('64', '6', 'p2.jpg', 'Esperamos que finalice los 5 minutos restante de la cocción.'),
('64', '7', 'p3.jpg', 'Apaga el fuego, agrega ahora las tres cucharadas de maíz, y tapamos la olla o recipiente con una tapa o un trapo. Dejamos reposar 5 minutos.'),
('65', '1', 'p1.jpg', 'Pre-calentar el horno a 180°C'),
('65', '2', 'p2.jpg', 'Marina las pechugas con el Sazonador Líquido MAGGI® durante 1 hora dentro del refrigerador.'),
('65', '3', 'p2.jpg', 'En una sartén calienta la mantequilla y fríe el cuitlacoche. Agrega la cebolla con los granos de elote, una cucharada de consomé de pollo en polvo y el epazote. Cocina por 10 minutos.'),
('65', '4', 'p1.jpg', 'Coloca sobre cada pechuga un poco de cuitlacoche preparado y enróllalas de manera que no se salga el relleno'),
('65', '5', 'p1.jpg', 'Calienta el aceite y séllalas por ambos lados. Pásalas en un refractario con cuadritos de mantequilla'),
('65', '6', 'p1.jpg', 'Tapa con papel aluminio y hornea por 40 minutos o hasta que se hayan cocido por completo '),
('65', '7', 'p3.jpg', 'Retira del fuego y licúa con la Media Crema NESTLÉ®, el queso crema, el consomé de pollo en polvo y la Leche Evaporada'),
('66', '1', 'p1.jpg', 'Arma cada brocheta insertando de manera alternada la carne, los champiñones y el pimiento. '),
('66', '2', 'p2.jpg', 'Sazona con la Salsa de Soya MAGGI®.'),
('66', '3', 'p3.jpg', 'En una sartén calentar el aceite y freír las brochetas. Servir caliente.'),
('67', '1', 'p1.jpg', 'Mezclar en un recipiente el vino blanco y jugo de naranja. Reservar.'),
('67', '2', 'p2.jpg', 'Cortar el pimiento morrón en julianas medianas y las aceitunas en cuartos a lo largo.'),
('67', '3', 'p3.jpg', 'Salpimentar el cuete e introducir de forma alternada los piñones, nuez, pistache, pimiento morrón y aceitunas.'),
('67', '4', 'p2.jpg', 'Bañar el cuete con la mezcla que tenemos reservada y dejar marinar.'),
('67', '5', 'p3.jpg', 'Hornear de 180 a 200ºC por un espacio de 1 hora 40 minutos.'),
('68', '1', 'p1.jpg', 'Precalienta el horno a 220°C.'),
('68', '2', 'p2.jpg', 'Para el relleno, calienta el aceite con la mantequilla en una sartén profundo a fuego medio. Agrega la cebolla y el ajo, cocina unos minutos y añade las nueces, las almendras, los cacahuates, nueces de la india y la ciruela pasa, cocina dándole su tiempo a cada ingrediente.'),
('68', '3', 'p1.jpg', 'Añade el vino blanco, la sal y la pimienta. Cocina 10 minutos más o hasta que se reduzca el vino. Enfría ligeramente.'),
('68', '4', 'p2.jpg', 'Rellena el lomo con la preparación anterior. Brida con un hilo de cáñamo y sazona con sal y pimienta.'),
('68', '5', 'p1.jpg', 'Coloca en una charola y cubre con papel aluminio, hornea alrededor de 40 minutos. Destapa y hornea 20 minutos más para que tome color. Deja reposar unos minutos antes de cortar.'),
('68', '6', 'p2.jpg', 'Para la salsa, cocina la cebolla y el ajo con la mantequilla en una olla a fuego medio. Agrega la harina de golpe y cocina hasta formar una masita dorada. '),
('68', '7', 'p1.jpg', ' Añade la leche, una vez que suelte el hervor, cocina hasta que espese a fuego bajo sin dejar de mover.'),
('68', '8', 'p2.jpg', 'Añade el queso y la crema, cocina 5 minutos más. Sazona con sal, pimienta y un poco de nuez moscada. Cuela si lo deseas.'),
('68', '9', 'p3.jpg', 'Sirve el lomo acompañado de la salsa.'),
('69', '1', 'p1.jpg', 'Combina en un tazón carne molida, sal, pimienta, huevo, avena y albahaca.'),
('69', '2', 'p2.jpg', 'Integra muy bien todos los ingredientes y forma pelotas medianas con ayuda de tus manos.'),
('69', '3', 'p3.jpg', 'Calienta el aceite en un sartén y sella las albóndigas a fuego alto hasta que cambien de color y tengan una apariencia doradaRetíralas del sartén y resérvalas.'),
('69', '4', 'p1.jpg', 'Calienta el aceite en el mismo sartén donde cocinaste las albóndigas, añade pasta de tomate, ajo, cebolla, tomate (jitomate), chile de árbol y albahaca; saltea todo hasta que el tomate (jitomate) se cocine, aumenta el sabor con pimienta y vierte el agua de cocción de las pasta; mezcla bien.'),
('69', '5', 'p2.jpg', 'Incorpora las albóndigas que reservaste a la salsaTapa el sartén y continúa cocinando a fuego bajo, hasta que las albóndigas estén bien cocinadas al centro.'),
('69', '6', 'p3.jpg', 'Sirve la pasta recién cocinada en 4 platos extendidos y agrega encima un par de cucharadas de salsa con albóndigasDisfruta con queso parmesano rallado.'),
('70', '1', 'p1.jpg', 'Precaliente el horno a 450 F o 230 grados.'),
('70', '2', 'p2.jpg', 'Ponga sal y pimienta en el salmón y cocine en el horno en un pyrex por 15 minutos o hasta que esté opaco.'),
('70', '3', 'p3.jpg', 'Mientras se cocina el salmón, derrita 1 cucharada de mantequilla en una olla chica y cuando se derrite agregue el harina. '),
('70', '4', 'p1.jpg', 'Revuelva con un batidor de globo por un minuto. Agregue el vino y deje que hierva (revolviendo con el batidor) hasta que se reduzca el líquido a la mitad, unos 8-10 minutos.'),
('70', '5', 'p2.jpg', 'Agregue el cebollin picadito y sazone con sal y pimienta.'),
('70', '6', 'p3.jpg', 'Sirva los filetes de salmón con la salsa de vino blanco encima.'),
('71', '1', 'p1.jpg', 'Partir el ajo en tiritas e insertarlas al lomo. Sazonarlo con sal y pimienta y sellarlo en el aceite.'),
('71', '2', 'p2.jpg', 'En la misma cacerola, poner la cebolla y dejar colorear. Agregar la pimienta, nuez moscada, mostaza, jugo de naranja, caldo de pollo, vino blanco y cilantro y dejarlo hervir unos minutos.'),
('71', '3', 'p3.jpg', 'Agregar el lomo a la cacerola y meterlo al horno por 45 minutos, o una hora hasta que esté suave (a 180 centígrados). Sacarlo del horno y dejarlo enfriar en la salsa.'),
('71', '4', 'p2.jpg', 'Una vez que esté a temperatura ambiente, rebanar el lomo y ponerlo en un platón. Luego espesar la salsa con un poquito de maicena (solo si es necesario), condimentar con sal y pimienta.'),
('71', '5', 'p3.jpg', 'Colar la salsa y poner encima del lomo. Adornar con rebanaditas de naranja, y acompanar con zanahorias glaseadas y papitas.'),
('72', '1', 'p1.jpg', 'Saltear la cebolla y el ajo, después de 5 min. agregar el vino tinto, reducir a la mitad, agregamos las ciruelas, azúcar, dejamos hervir por 5 min. más, agregamos el consomé de pollo junto con el agua y apagamos cuando este hirviendo.'),
('72', '2', 'p2.jpg', 'Esperar un poco que se enfrié la mezcla y licuar.'),
('72', '3', 'p1.jpg', 'Agregar la salsa en un sartén y calentar. Al final agregar la fécula de maíz con un poco de agua para espesar.'),
('72', '4', 'p2.jpg', 'Saque del horno, rebane la carne y sirva calientito.'),
('72', '5', 'p1.jpg', 'Licúe la cebolla, el ajo, las ciruelas pasas, la Salsa CROSSE & BLACKWELL®, el tomillo, el vinagre, la sal y el jugo de uva. Ponga a macerar la carne en lo que licuó, de preferencia de un día para otro.'),
('72', '6', 'p2.jpg', 'Pre-caliente el horno a 200C.'),
('72', '7', 'p3.jpg', 'En un moldé refractario engrasado coloque la carne y la salsa de ciruelas, tape con papel aluminio y horneé durante 1 hora. Destape el lomo y continúe horneándolo durante 1 hora más. Báñelo contantemente con la salsa.'),
('73', '1', 'p1.jpg', 'Reserva los muslos, la pechuga y las piernas de pollo; cocina las demás piezas en 1 1/4 litros de agua con el perejil, la mejorana, sal y pimienta para hacer un caldo; cuélalo y reserva.'),
('73', '2', 'p2.jpg', 'En una paellera calienta el aceite y fríe las piezas de pollo que reservaste junto con las costillitas; cuando comiencen a dorar, retíralas y reserva.'),
('73', '3', 'p3.jpg', 'En la misma grasa fríe el chorizo y la cebolla; quita el exceso de grasa e incorpora el arroz, mueve para impregnarlo de grasa, añade el pollo frito, las costillitas y las verduras.'),
('73', '4', 'p1.jpg', 'Mide el caldo de pollo, debe ser 1 litro (si hace falta completa con agua); añade el azafrán y mueve para que se “pinte” el líquido.'),
('73', '5', 'p2.jpg', 'Vierte sobre el arroz, agrega las gotas de limón y acomoda los mariscos; cubre con papel aluminio, baja el fuego y cocina durante 20 minutos.'),
('73', '6', 'p3.jpg', 'A la mitad de la cocción, sazona con sal y pimienta, añade el chorizo y cocina hasta que el arroz esté suave pero entero.'),
('74', '1', 'p1.jpg', 'Calienta el agua con la canela y cuando suelte el hervor, agrega el arroz; cocina durante 15 minutos o hasta que el arroz esté tierno.'),
('74', '2', 'p2.jpg', 'Vierte la Leche Condensada LA LECHERA®, la Leche Evaporada CARNATION® CLAVEL® y las pasitas'),
('74', '3', 'p3.jpg', 'Mezcla y continúa la cocción a fuego bajo de 20 a 25 minutos hasta que espese ligeramente.'),
('74', '4', 'p3.jpg', 'Sirve tibio o frío y espolvorea con canela molida.'),
('75', '1', 'p1.jpg', 'Se ponen todos los ingredientes (menos la cajeta y la nuez) en la licuadora y se licuan.'),
('75', '2', 'p2.jpg', 'Se calienta un sarten redondo pequeño con unas gotitas de aceite (se puede distribuir por el sartén con una servilleta para que no quede grasoso).'),
('75', '3', 'p3.jpg', 'Con una cuchara honda se sirve un poco de la mezcla en el sartén, asegurando que cubra todo el sartén y se deja cocinar unos 45 segundos hasta que este doradita por abajo.'),
('75', '4', 'p1.jpg', 'Se repite lo mismo hasta hacer todas las crepas. Se acomodan en un platón engrasado doblandolas en cuatro.'),
('75', '5', 'p2.jpg', 'En una cacerola se pone cajeta, un poquito de leche y se calienta hasta que quede con la consistencia deseada (no hervirla).'),
('75', '6', 'p3.jpg', 'Se pone la salsa de cajeta caliente sobre las crepas y se espolvorean con nuez picada. Se pueden meter al horno para calentar, o servir inmediatamente.'),
('76', '1', 'p1.jpg', 'Integra todos los ingredientes (excepto el chocolate, nuez y crema de avellanas) en la batidora y bate hasta formar una masa uniforme.'),
('76', '2', 'p2.jpg', 'Envuelve la nuez y el chocolate picado en la mezcla, forma los tamales rellenando las hojas con la mezcla anterior y termina el centro de los tamales con una cucharada de crema de avellanas.'),
('76', '3', 'p3.jpg', 'Cierra y cuece en una olla de vapor a fuego medio durante dos horas.'),
('77', '1', 'p1.jpg', 'Prepara las gelatinas de sabor una por una con dos tazas menos de agua de lo que indica el paquete.'),
('77', '2', 'p2.jpg', 'Viértelas por separado en moldes rectangulares y refrigera para que cuajen. '),
('77', '3', 'p3.jpg', 'Retira del refrigerador y córtalas en cubitos; combínalos y colócalos en un molde para gelatina.'),
('77', '4', 'p1.jpg', 'Licúa la Leche Condensada LA LECHERA® con la Leche Evaporada CARNATION® CLAVEL® y la esencia de vainilla'),
('77', '5', 'p2.jpg', 'Con la licuadora encendida agrega, poco a poco, la grenetina previamente disuelta.'),
('77', '6', 'p3.jpg', 'Vierte la preparación anterior en el molde con los cuadros de las gelatinas de sabores y refrigera hasta que cuaje; desmolda y ofrece.'),
('78', '1', 'p1.jpg', 'Empezaremos nuestro pastel de zanahoria fácil de hacer por la masa del bizcocho. Para ello, introduce los huevos en un recipiente y bátelos hasta que adquieran una textura espumosa. Asimismo, precalienta el horno a 180 ºC.'),
('78', '2', 'p2.jpg', 'Luego, agrega el azúcar, la harina y los polvos de hornear bien tamizados alternándolos con el aceite y sigue batiendo.'),
('78', '3', 'p3.jpg', 'De esta forma será más fácil integrar todos los ingredientes y conseguir una masa de bizcocho de zanahoria homogénea y sin grumos.'),
('78', '4', 'p1.jpg', 'Ahora es el turno de la zanahoria rallada: incorpórala junto con las nueces picadas y no dejes de batir. Si lo deseas, puedes incorporar una cucharadita de esencia de vainilla o canela en polvo.'),
('78', '5', 'p2.jpg', 'Mientras se hornea la mejor tarta de zanahoria, puedes ir preparando la cobertura. Para hacerla coge un recipiente y mezcla el queso crema con la mantequilla. '),
('78', '6', 'p3.jpg', 'Cuando hablamos de queso crema nos referimos al queso de untar suave tipo Philadelphia.'),
('78', '7', 'p1.jpg', 'Cuando el bizcocho de zanahoria esté listo, deja que se enfríe un poco sobre una rejilla y córtalo por la mitad para rellenarlo con una fina capa de la mezcla anterior.'),
('78', '8', 'p2.jpg', 'Si no quieres rellenar el pastel de zanahoria fácil y rico no lo cortes y simplemente unta el frosting de queso por la parte superior y los bordes.'),
('78', '9', 'p3.jpg', 'La típica tarta de zanahoria americana con nueces se caracteriza por estar decorada con una cobertura dulce y blanca '),
('79', '1', 'p1.jpg', 'En un recipiente combinar harina, azúcar, cocoa, polvo hornear, bicarbonato y sal. Revolver a baja velocidad con la batidora .'),
('79', '2', 'p2.jpg', 'Agregar leche, mantequilla y vainilla. Batir con batidora a velocidad baja, luego batir 2 minutos a velocidad media, agregar huevo y batir 2 minutos más. Poner en un molde redondo de 22 cms. de diámetro, engrasado y enharinado.'),
('79', '3', 'p3.jpg', 'Hornear a 180 °C por 30 o 35 minutos. Sacar del horno y enfriar en una rejilla 10 minutos. Sacar del molde y dejar enfriar completamente.'),
('79', '4', 'p2.jpg', 'Para hacer el glaseado: derretir chocolate y mantequilla a fuego suave, remover del fuego y agregar el azúcar glass y el agua caliente moviendo siempre. Si es necesario agregar mas de agua para tener la consistencia de glaseado'),
('79', '5', 'p3.jpg', 'Glasear el pastel y dejar escurrir por los lados a cubrirlo totalmente'),
('80', '1', 'p1.jpg', 'Para esta ensalada italiana les aconsejo elegir tomates perita porque no expulsan tanto jugo. Cortamos los tomates en rodajas, ni muy finas ni muy gruesas, y reservamos.'),
('80', '2', 'p2.jpg', 'Tomamos el queso mozzarella y lo cartamos en rodajas similares a las del tomate. Reservamos.'),
('80', '3', 'p3.jpg', 'Por otro lado, para sazonar esta exquisita ensalada caprese, realizamos una preparación con unas hojitas de albahaca fresca picada, aceite de oliva virgen extra, sal y pimienta negra recién molida. Otra opción totalmente válida es condimentar la ensalada con salsa pesto casera.'),
('80', '4', 'p1.jpg', 'Por último, para la presentación de la ensalada, tomamos un plato o una fuente plana y vamos acomodando los ingredientes intercalando una rodaja de tomate, una de mozzarella, una hoja de albahaca fresca y así sucesivamente.'),
('80', '5', 'p2.jpg', 'Aderezamos con la preparación realizada con anterioridad y espolvoreamos con un toque de pimienta en grano recién molida para completar la decoración de esta deliciosa e irresistible ensalada caprese. '),
('80', '6', 'p3.jpg', 'Esta ensalada se puede consumir sola como entrante, pero también, es ideal para acompañar cualquier tipo de carne asada.'),
('81', '1', 'p1.jpg', 'Lavar bien todas las frutas y pelar el mango, la naranja y el kiwi. Pelar el plátano y cortar en rodajas de aproximadamente 1 cm de espesor. '),
('81', '2', 'p2.jpg', 'El resto de las frutas deben cortarse en cubos, excepto las fresas que sólo les retiramos las hojas y las partimos por su mitad.'),
('81', '3', 'p2.jpg', 'Las colocamos en palillos de brochetas para armar los pinchos, siempre intercalando colores para que el resultado final quede más atractivo a la vista.'),
('81', '4', 'p3.jpg', 'Finalmente, colocamos las brochetas en un plato y salseamos con el yogur líquido por encima. ¡Listo para comer!'),
('82', '1', 'p1.jpg', 'Precalienta el horno a 220°C.'),
('82', '2', 'p2.jpg', 'En un bowl coloca la harina, la sal, la levadura, agrega el agua, Oli de Nutrioli® Extra virgen Aceite de Oliva, amasa por 7 minutos hasta obtener una masa homogénea.'),
('82', '3', 'p3.jpg', 'Coloca la masa en un bowl, tapado con plástico antiadherente y fermenta por 1 hora o hasta que duplique su tamaño.'),
('82', '4', 'p1.jpg', 'Extiende la masa sobre una mesa enharinada con ayuda de un rodillo hasta tener un grosor de 3mm, barniza con Oli de Nutrioli® Extra virgen Aceite de Oliva, espolvorea el ajonjolí.'),
('82', '5', 'p2.jpg', 'Corta con ayuda de un cuchillo filoso, tiras largas de 1 cm de grosor.'),
('82', '6', 'p3.jpg', 'Coloca las tiritas sobre una charola, hornea por 15 minutos, hasta que estén doraditos. Deja enfriar.'),
('82', '7', 'p1.jpg', 'Coloca arúgula sobre los palitos de pan, envuelve los palitos de pan con jamón serrano.'),
('82', '8', 'p2.jpg', 'Disfruta con una copa de vino.'),
('83', '1', 'p1.jpg', 'En un recipiente hondo mezcle los huevos y el agua.'),
('83', '2', 'p2.jpg', 'En otro recipiente mezcle el pan molido, la sal de ajo, la albahaca, y el orégano.'),
('83', '3', 'p3.jpg', 'En un tercer recipiente hondo mezcle la harina y la maicena.'),
('83', '4', 'p1.jpg', 'Caliente en un sartén grande el aceite hasta que esté listo para freír.'),
('83', '5', 'p2.jpg', 'Corte el queso manchego en rectángulos (los dedos) y pase cada uno por la mezcla de la harina, luego la de los huevos y por último la del pan molido.'),
('83', '6', 'p3.jpg', 'Fría cada dedo hasta que este dorado (aproximadamente 45 segundos) y seque muy bien con una toalla de papel para remover la grasa.'),
('84', '1', 'p1.jpg', 'El primer paso es poner a calentar el aceite a fuego medio, lo vaciamos en una olla, freidora, o lo que vayamos a usar, es para hacerlo más rápido. Intentar ya tener cortadas las papas para no quemar el aceite.'),
('84', '2', 'p2.jpg', 'En un recipiente con tapa, mezclamos el harina, sal, pimienta, hierbas y paprika, se agitan para que se mezclen y se empanizan los gajos en el polvo.'),
('84', '3', 'p2.jpg', 'A continuación vamos añadiendo las papas al aceite, recuerden no añadir demasiadas. Y dejamos freír por unos 5 minutos, y/o hasta que estén doradas.'),
('84', '4', 'p3.jpg', 'Al final basta con ponerlos en un colador o en un plato con unas toallas de papel para retirar el exceso de aceite.'),
('85', '1', 'p1.jpg', 'Para preparar las papas fritas: Pela las papas y córtalas en tiras finas. Trata que todas salgan parejas, más o menos del mismo tamaño. Pon todas las papas cortadas en un recipiente y cubre con agua para que eliminen el almidón.'),
('85', '2', 'p2.jpg', 'Repite un par de veces hasta que el agua salga limpia. Escurre las papas y seca bien con servilletas de papel.'),
('85', '3', 'p3.jpg', 'Calienta el aceite en una sartén grande sobre fuego medio-alto. Cuando esté caliente, agrega una parte de las papas y cocina, moviendo de vez en cuando, hasta que las papitas estén doradas.'),
('85', '4', 'p2.jpg', 'Retíralas del aceite con una espumadera y ponlas en un plato cubierto con varias capas de servilletas de papel para que escurra el aceite. Sazona las papitas con sal y repite hasta que todas las papas estén fritas.'),
('85', '5', 'p3.jpg', 'Para preparar las salsas: En un recipiente, combina 1 taza de mayonesa con la pasta de rocoto, las hojas de huacatay, sal y pimienta al gusto.'),
('85', '6', 'p2.jpg', 'En otro recipiente combina la 1/2 taza de mayonesa con la pasta de ají amarillo. Salpimienta al gusto.'),
('85', '7', 'p3.jpg', 'Sirve las papitas fritas con estas dos salsas.'),
('86', '1', 'p1.jpg', 'Ponemos en un bol la carne picada de pollo y salpimentamos. Después, quitamos la corteza a la rebanada de pan de mole y la añadimos al bol junto a la carne picada. Añadimos un chorro de leche.'),
('86', '2', 'p2.jpg', 'La miga y la leche, serán lo que les de esa cremosidad que queremos, al interior de la nugget de pollo. Añadimos, si lo deseamos, el queso y mezclamos todo con ayuda de la mano o una cuchara, hasta que quede todo bien integrado. '),
('86', '3', 'p3.jpg', 'Después, se puede dejar reposar unos minutos en el frigorífico para que se compacte la masa.'),
('86', '4', 'p2.jpg', 'Ahora, con la mano, cogemos una pequeña porción de la masa, la aplastamos un poquito, dándole esa forma característica de nugget y la pasamos por harina, huevo y pan rallado (por ese orden).'),
('86', '5', 'p3.jpg', ' Las freímos en abundante aceite de oliva a fuego fuerte. Retiramos y dejamos reposar durante 1 minuto en papel absorbente. Y ¡ya están listas! Un plato de comida rapida hecho en casa, cosa que siempre es de agradecer.'),
('87', '1', 'p1.jpg', 'Quítale las orillitas al pan y parte cada rebanada a la mitad. Unta queso crema sobre cada mitad, coloca el tocino del otro lado de la rebanada y enrolla.'),
('87', '2', 'p2.jpg', 'Calienta el horno a 180°C, unta mantequilla sobre el refractario para que no se peguen los panes y hornea por 20 o 30 minutos (hasta que el tocino se dore por completo).'),
('87', '3', 'p3.jpg', 'Deja enfriar y sirve con la salsa de tu elección.'),
('88', '1', 'p1.jpg', 'Fríe el chorizo y cuela el aceite.'),
('88', '2', 'p2.jpg', 'Corta los chiles por la mitad, saca las venas y las semillas con mucho quidado para dejar un compartimiento para poner el queso.'),
('88', '3', 'p3.jpg', 'En un recipiente agrega el queso crema (a temperatura ambiente) junto con el queso oaxaca e integra, añade el chorizo y mezcla hasta que quede una masa untable.'),
('88', '4', 'p1.jpg', 'Toma los chiles y rellénalos de la mezcla de queso y chorizo, refrigera por unos minutos para que endurezca el queso.'),
('88', '5', 'p2.jpg', 'Mezcla los huevos con la leche, empaniza los chiles: primero sumérgelos en el huevo, luego en harina, de nuevo en el huevo y después en el pan molido.'),
('88', '6', 'p3.jpg', 'Fríe de 4 a 6 minutos hasta que estén doraditos y crujientes.'),
('89', '1', 'p1.jpg', 'Empezamos por la masa de la tarta. En un bol grande echamos la harina, el azúcar y la sal. Mezclamos'),
('89', '2', 'p2.jpg', 'Añadimos a la mezcla los dados de mantequilla muy fríos (recién sacados de la nevera). Los mezclamos con el resto de ingredientes. Como hay que evitar que la mantequilla se caliente, yo la mezclo con unos cuchillos y luego finalizo con las manos bien limpias. Debe quedar como unas migas.'),
('89', '3', 'p3.jpg', 'Añadimos 7 cucharadas de agua (si necesitas más puedes añadir) para hacer que la masa quede como una bola. Amasaremos hasta que se unifique y se despegue fácilmente de las paredes del recipiente.'),
('89', '4', 'p1.jpg', 'Procurad no calentar mucho la masa con nuestras manos, solamente unificamos.'),
('89', '5', 'p2.jpg', 'Repartimos la masa resultante en dos bolas. Las envolvemos con film y la metemos en la nevera durante dos horas.'),
('89', '6', 'p3.jpg', 'Media hora antes de sacar la masa, comenzamos a preparar el relleno.'),
('90', '1', 'p1.jpg', 'Cubre el fondo de un molde para pastel con papel encerado y engrasa y enharina las paredes; vierte el azúcar mascabado en el fondo para formar una capa uniforme, coloca las rebanadas de piña y rellena los huecos con las cerezas. '),
('90', '2', 'p2.jpg', 'Vierte la mezcla de pastel sobre las rebanadas de piña y hornea a 180 °C por 55 minutos o hasta que al introducir un palillo este salga limpio.'),
('90', '3', 'p3.jpg', 'Deja enfriar, desmolda y ofrece.'),
('91', '1', 'p1.jpg', 'Coloca papel manteca sobre una fuente grande.'),
('91', '2', 'p2.jpg', 'En un bowl combina la quinoa, la avena, las semillas, las almendras, las cerezas y el chocolate.'),
('91', '3', 'p3.jpg', 'Calienta en una sartén a fuego bajo la manteca de almendras, el aceite, la miel y 1/2 cucharadita de sal hasta que se derritan. Mezcla cada tanto. Agrega el puré de ciruelas.'),
('91', '4', 'p1.jpg', 'Vuelca la mezcla de manteca sobre la de avena. Combina ambas.'),
('91', '5', 'p2.jpg', 'Con las manos arma barritas de 2 a 3 centímetros, colócalas sobre la placa con el papel y llévala a la heladera durante 1 hora.'),
('91', '6', 'p3.jpg', 'Una vez pasada la hora ya están listas para disfrutar. En la heladera se mantienen hasta 3 semanas en buen estado, sólo recuerda guardarlas en un tupper con cierre hermético.');