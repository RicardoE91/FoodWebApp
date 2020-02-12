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
('40', '1', 'p1.jpg', 'Los chiles se pasan por 300 gramos de manteca caliente, se colocan en una cazuela con agua muy caliente y se deja que den un hervor para que se suavicen.'),
('40', '2', 'p2.jpg', 'En la misma manteca se acitronan el ajo y la cebolla, se añaden la tortilla, el pan, las pasas, las almendras, las pepitas de chile, la mitad del ajonjolí, el anís, el clavo, la canela, las pimientas, el chocolate y el jitomate y se fríe todo muy bien'),
('40', '3', 'p3.jpg', 'Se agregan los chiles escurridos y se fríe unos segundos más.'),
('40', '4', 'p2.jpg', 'Todo lo anterior se muele en la licuadora con el caldo donde se coció el pavo y se cuela.'),
('40', '5', 'p2.jpg', 'En una cazuela de barro especial para mole se pone a calentar el resto de la manteca, se añade la salsa, se deja hervir el mole durante cinco minutos, se sazona con sal y azúcar y, si es necesario, se añade más caldo'),
('40', '6', 'p3.jpg', 'Debe quedar una salsa espesa. Se deja hervir de 25 a 30 minutos más a fuego lento, se añaden los trozos de guajolote y se deja hervir unos minutos más.');