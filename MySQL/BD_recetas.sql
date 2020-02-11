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
  ingredientes varchar(255)DEFAULT NULL,
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
  descripcion varchar(255)DEFAULT NULL,
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