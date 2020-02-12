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
  biografia varchar(255) DEFAULT NULL,
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
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();
INSERT INTO receta (nombre, imagen, ingredientes, horario_comida_id, tiempo_comida_id, proteina_id, tiempo_preparacion_id, tipo_coccion_id, porciones_id, tipo_cocina_id, usuario_id)
VALUES ();