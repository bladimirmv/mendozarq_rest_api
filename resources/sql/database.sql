create database mendozarq;
use mendozarq;

create table usuario
(
  uuid            varchar(100) primary key,
  creadoEn        timestamp default current_timestamp not null,
  nombre          varchar(50)                         not null,
  apellidoPaterno varchar(50)                         not null,
  apellidoMaterno varchar(50),
  celular         int,
  direccion       text,
  correo          varchar(100),
  username        varchar(50)                         not null,
  contrasenha     varchar(100)                        not null,
  rol             varchar(20)                         not null,
  activo          boolean                             not null
);

create table personal
(
  uuid            varchar(100) primary key,
  creadoEn        timestamp default current_timestamp not null,
  nombre          varchar(50)                         not null,
  apellidoPaterno varchar(50)                         not null,
  apellidoMaterno varchar(50),
  celular         int,
  direccion       text,
  correo          varchar(100),
  descripcion     varchar(200),
  sueldo          decimal(15, 2),
  moneda          varchar(10),
  activo          boolean                             not null
);
create table proyecto
(
    uuid                  varchar(100) primary key,
    creadoEn              timestamp default current_timestamp not null,
    nombre                varchar(50)                         not null,
    descripcion           varchar(200),
    estado                boolean                             not null,
    fechaInicio           date,
    fechaFinal            date,
    lugarProyecto         varchar(200),
    porcentaje            int,
    uuidCategoriaProyecto varchar(100),
    uuidCliente           varchar(100),
    foreign key (uuidCategoriaProyecto) references categoriaProyecto (uuid),
    foreign key (uuidCliente) references usuario (uuid)
);


CREATE VIEW proyectoWiew AS
SELECT p.*,
       u.nombre as nombreCliente,
       u.apellidoPaterno,
       u.apellidoMaterno
FROM proyecto AS p
         INNER JOIN usuario AS u ON p.uuidCliente = u.uuid;

create table carpetaProyecto
(
    uuid          varchar(100) primary key,
    creadoEn      timestamp default current_timestamp not null,
    nombre        varchar(50),
    fechaCreacion date,
    uuidProyecto  varchar(100)                        not null,
    foreign key (uuidProyecto) references proyecto (uuid)
);

create table documentoProyecto
(
    uuid          varchar(100) primary key,
    creadoEn      timestamp default current_timestamp not null,
    nombre        text                                not null,
    keyName       text                                not null,
    location      text                                not null,
    fechaCreacion date                                not null,
    uuidProyecto  varchar(100)                        not null,
    size          int                                 not null,
    path          varchar(10)                         not null,
    foreign key (uuidProyecto) references proyecto (uuid)
);

create table documentoCarpeta
(
    uuid          varchar(100) primary key,
    creadoEn      timestamp default current_timestamp not null,
    uuidCarpeta   varchar(100)                        not null,
    uuidDocumento varchar(100)                        not null,
    foreign key (uuidCarpeta) references carpetaProyecto (uuid),
    foreign key (uuidDocumento) references documentoProyecto (uuid)
);






create table herramienta
(
  uuid            varchar(100) primary key,
  creadoEn        timestamp default current_timestamp not null,
  nombre          varchar(50)                         not null,
  categoria       varchar(30)                         not null,
  descripcion     varchar(200),
  estado          boolean                             not null,
  keyImg          text,
  originalNameImg varchar(50),
  urlImg          text                                not null
);

INSERT INTO mendozarq.usuario (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo,
                               username, contrasenha, rol, activo)
VALUES ('fa27b5b3-837b-4486-b2cd-c6a306e8bd72', '2021-01-12 19:45:41', 'bladimir', 'medrano', 'vargas', 69509449,
        'Av segunda entre marina nunez del prado y calle greco.', 'example@gmail.com', 'blado959',
        '$2b$10$Ejt7X/epAQ2kfChOFJa9T.apOjSfTR2xkMWOoIfWWKT4JFh8CDu.C', 'administrador', 1);












CREATE TABLE proyecto (
    idProyecto varchar(100) primary key,
    creadoEn timestamp  default current_timestamp not null,
    nombre varchar(50) not null,
    descripcion TEXT not null,
    estado BOOLEAN not null,
    fechaInicio  DATE not null,
    fechaFinal DATE not null,
    lugarProyecto varchar(200) not null,
    filerefCont TEXT not null,
    urlCont TEXT not null,
    idCliente varchar(100) not null,
    nombreCliente varchar(100) not null,
    porcentaje INT not null,
	FOREIGN KEY(idCliente) REFERENCES usuario(uuid)
);

CREATE TABLE categoriaProyecto(
    idCategoriaProyecto varchar(100) primary key,
    creadoEn timestamp  default current_timestamp not null,
    nombre varchar(50) not null,
    color varchar(200) not null
);

CREATE TABLE categoriasAsignadasProyecto (
    id int AUTO_INCREMENT PRIMARY KEY,
    idProyecto varchar(100) not null,
    idCategoriaProyecto varchar(100) not null,
    FOREIGN KEY(idProyecto) REFERENCES proyecto(idProyecto),
    FOREIGN KEY(idCategoriaProyecto) REFERENCES categoriaProyecto(idCategoriaProyecto)
);

CREATE TABLE cronograma (
    idCronograma varchar(100) PRIMARY KEY,
    creadoEn timestamp  default current_timestamp not null,
    fechaInicio  DATE not null,
    fechaFinal DATE not null,
    idProyecto varchar(100) not null,
    FOREIGN KEY (idProyecto) REFERENCES proyecto(idProyecto)
);

CREATE TABLE actividad (
    idActividad varchar(100) PRIMARY KEY,
    creadoEn timestamp  default current_timestamp not null,
    nombre varchar(100) NOT NULL,
    fechaInicio  DATE not null,
    fechaFinal DATE not null,
    porcentaje int not null,
    creadoPor varchar(100) not null,
    idCronograma varchar(100) not null,
    FOREIGN KEY (creadoPor) REFERENCES usuario(uuid),
    FOREIGN KEY (idCronograma) REFERENCES cronograma(idCronograma)
);

CREATE TABLE categoriaRecurso (
    idCategoriaRecurso varchar(100) PRIMARY KEY,
    creadoEn timestamp  default current_timestamp not null,
    nombre varchar(50) NOT NULL,
    descripcion varchar(100) not null,
    color varchar(50) not null
);

CREATE TABLE recurso (
    idRecurso varchar(100) PRIMARY KEY,
    creadoEn timestamp  default current_timestamp not null,
    nombre varchar (50) not null,
    filerefImg varchar (200) not null,
    urlImg varchar(200) not null,
    estado BOOLEAN not null,
    descripcion varchar(100) not null,
    idCategoriaRecurso varchar (100) not null,
    FOREIGN KEY (idCategoriaRecurso) REFERENCES categoriaRecurso(idCategoriaRecurso)
);

CREATE TABLE recursosActividad(
    idRecursosActividad varchar(100) PRIMARY KEY,
    creadoEn timestamp  default current_timestamp not null,
    idActividad varchar (100) not null,
    idRecurso varchar(100) not null,
    FOREIGN KEY (idActividad) REFERENCES actividad(idActividad),
    FOREIGN KEY (idRecurso) REFERENCES recurso(idRecurso)
);

CREATE TABLE personal(
    idPersonal varchar(100) PRIMARY KEY,
    creadoEn timestamp  default current_timestamp not null,
    nombre varchar(70) not null,
    apellidos varchar(70) not null,
    celular int(8) not null,
    direccion varchar(150) not null,
    correo  varchar(100) not null,
    activo BOOLEAN not null,
    cargo varchar(50) not null,--ACA NACE UNA CONSULTA, VAMOS A CREAR LA TABLA CARGOS? O SERA ASI NOMAS LO Q INGRESEN, PARA VOLVERLO ID CARGO
    sueldo float not null,
    moneda varchar(3) not null,
    filerefCont varchar(200) not null,
    urlCont varchar(200) not null
);

CREATE TABLE presupuestoDeObra(
    idPresupuesto varchar(100) PRIMARY KEY,
    creadoEn timestamp  default current_timestamp not null,
    nombre VARCHAR(100) not null,
    descripcion varchar(250) not null,
    totalPresupuesto FLOAT not null,
    idProyecto varchar(100) not null,
    FOREIGN KEY(idProyecto) REFERENCES proyecto(idProyecto)
);

CREATE TABLE detallePresupuesto(
    idDetallePresupuesto varchar(100) PRIMARY KEY,
    creadoEn timestamp  default current_timestamp not null,
    nombre varchar(50) not null,
    totalDetalle float not null,
    idPresupuesto varchar(100) not null,
    FOREIGN KEY (idPresupuesto) REFERENCES presupuestoDeObra(idPresupuesto)
);

CREATE TABLE subDetallePresupuesto (
    idSubDetallePresupuesto varchar(100) PRIMARY KEY,
    creadoEn timestamp  default current_timestamp not null,
    nombre varchar(20) not null,
    medida varchar(10) not null,
    cantidad int not null,
    precioUnitario float not null,
    totalSubDetalle float not null,
    idDetallePresupuesto varchar(100) not null,
    FOREIGN KEY (idDetallePresupuesto) REFERENCES detallePresupuesto(idDetallePresupuesto)
);

CREATE TABLE servicioProyecto(
    idServicio varchar(100) PRIMARY KEY,
    creadoEn timestamp  default current_timestamp not null,
    nombre varchar(50) not null,
    descripcion varchar(200) not null,
    avance float not null,
    fechaInicio DATE not null,
    fechaFinal DATE not null,
    idProyecto varchar(100) not null,
    FOREIGN KEY(idProyecto) REFERENCES proyecto(idProyecto)
);

CREATE TABLE participanteProyecto (
    idParticipante varchar(100) PRIMARY KEY,
    creadoEn timestamp  default current_timestamp not null,
    idProyecto varchar(100) not null,
    idPersonal varchar(100) not null,
    FOREIGN KEY(idProyecto) REFERENCES proyecto(idProyecto),
    FOREIGN KEY(idPersonal) REFERENCES personal(idPersonal)
);

CREATE TABLE visitaProyecto(
    idVisita varchar(100) PRIMARY KEY,
    creadoEn timestamp  default current_timestamp not null,
    nombre varchar(50) not null,
    descripcion varchar(200) not null,
    numeroVisita int not null,
    fecha TIMESTAMP default CURRENT_TIMESTAMP not null,
    idProyecto varchar(100) not null,
    FOREIGN KEY(idProyecto) REFERENCES proyecto(idProyecto)
);

CREATE TABLE participanteVisitaProyecto (
    idParticipanteVisitaProyecto varchar(100) PRIMARY KEY,
    creadoEn timestamp  default current_timestamp not null,
    idVisita varchar(100) not null,
    idParticipante varchar(100) not null,
    FOREIGN KEY (idVisita) REFERENCES visitaProyecto(idVisita),
    FOREIGN KEY (idParticipante) REFERENCES participanteProyecto(idParticipante)
);

CREATE TABLE servicioVisitaProyecto(
    idServicioVisitaProyecto varchar(100) PRIMARY KEY,
    creadoEn timestamp  default current_timestamp not null,
    idVisita varchar(100) not null,
    idServicio varchar(100) not null,
    FOREIGN KEY (idVisita) REFERENCES visitaProyecto(idVisita),
    FOREIGN KEY (idServicio) REFERENCES servicioProyecto(idServicio)
);

CREATE TABLE observacionServicio (
    idObsServicio varchar(100) PRIMARY KEY,
    creadoEn timestamp  default current_timestamp not null,
    estado varchar(50) not null,
    descripcion varchar(150) not null,
    idVisita varchar(100) not null,
    idServicio varchar(100) not null,
    FOREIGN KEY (idVisita) REFERENCES visitaProyecto(idVisita),
    FOREIGN key (idServicio) REFERENCES servicioProyecto(idServicio)
);


-- //////////////////////////////////////////////////////////////////////////////////
--ESTA AUN NO USAR!
CREATE TABLE documentoProyecto (
    idDocumentoProyecto varchar(100) PRIMARY KEY,
    creadoEn timestamp  default current_timestamp not null,
    idProyecto varchar(100) not null,
    idPersonal varchar(100) not null,
    filerefCont varchar(200) not null,
    urlCont varchar(200) not null,
    FOREIGN KEY (idProyecto) REFERENCES proyecto(idProyecto),
    FOREIGN KEY (idPersonal) REFERENCES personal(idPersonal)
);



-- algunas querys que serviran mas adelante
-- alterar la tabla categoriaRecurso
ALTER TABLE categoriarecurso
ADD COLUMN descripcion varchar(100) NOT NULL,
ADD COLUMN color VARCHAR(50) NOT NULL
--asd
ALTER TABLE recurso
ADD COLUMN descripcion varchar(100) not null;
-- Recuperar categorias asignadas a un proyecto especifico
SELECT c.nombre
FROM categoriaasignadaproyecto as catA
INNER JOIN categoriaproyecto as c ON c.idCategoriaProyecto = catA.idCategoria
WHERE catA.idCategoria = c.idCategoriaProyecto AND catA.idProyecto = ?;


SELECT obss.creadoEn, obss.estado, obss.descripcion, vst.nombre AS "visita", svc.nombre AS "servicio" 
FROM observacionservicio as obss
INNER JOIN servicioproyecto AS svc ON obss.idServicio = svc.idServicio
INNER JOIN visitaproyecto AS vst ON vst.idVisita = obss.idVisita
WHERE obss.idVisita ="vviissiittaa1";