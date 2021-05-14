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
    uuid          varchar(100) primary key,
    creadoEn      timestamp default current_timestamp not null,
    nombre        varchar(50)                         not null,
    descripcion   varchar(200),
    categoria     varchar(100)                        not null,
    estado        boolean                             not null,
    fechaInicio   date,
    fechaFinal    date,
    lugarProyecto varchar(200),
    porcentaje    int,
    uuidCliente   varchar(100),
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

create table personalProyecto
(
    uuid         varchar(100) primary key,
    creadoEn     timestamp default current_timestamp not null,
    uuidProyecto varchar(100)                        not null,
    uuidPersonal varchar(100)                        not null,
    foreign key (uuidProyecto) references proyecto (uuid),
    foreign key (uuidPersonal) references personal (uuid)
);

create table usuarioProyecto
(
    uuid         varchar(100) primary key,
    creadoEn     timestamp default current_timestamp not null,
    uuidProyecto varchar(100)                        not null,
    uuidUsuario  varchar(100)                        not null,
    foreign key (uuidProyecto) references proyecto (uuid),
    foreign key (uuidUsuario) references usuario (uuid)
);

create table servicioProyecto
(
    uuid         varchar(100) primary key,
    creadoEn     timestamp default current_timestamp not null,
    nombre       varchar(50)                         not null,
    descripcion  varchar(200),
    avance       int                                 not null,
    fechaInicio  date                                not null,
    fechaFinal   date                                not null,
    uuidProyecto varchar(100)                        not null,
    foreign key (uuidProyecto) references proyecto (uuid)
);

create table visitaProyecto
(
    uuid            varchar(100) primary key,
    creadoEn        timestamp default current_timestamp not null,
    nombre          varchar(50)                         not null,
    faseDelProyecto varchar(100)                        not null,
    descripcion     varchar(200),
    fecha           timestamp default current_timestamp not null,
    uuidProyecto    varchar(100)                        not null,
    foreign key (uuidProyecto) references proyecto (uuid)
);

create table participanteVisita
(
    uuid               varchar(100) primary key,
    creadoEn           timestamp default current_timestamp not null,
    uuidVisitaProyecto varchar(100)                        not null,
    uuidUsuario        varchar(100)                        not null,
    foreign key (uuidVisitaProyecto) references visitaProyecto (uuid),
    foreign key (uuidUsuario) references usuario (uuid)
);

create table observacionServicio
(
    uuid         varchar(100) primary key,
    creadoEn     timestamp default current_timestamp not null,
    estado       varchar(100)                        not null,
    descripcion  varchar(200)                        not null,
    fecha        date                                not null,
    uuidServicio varchar(100)                        not null,
    uuidVisita   varchar(100)                        not null,
    foreign key (uuidServicio) references servicioProyecto (uuid),
    foreign key (uuidVisita) references visitaProyecto (uuid)
);

create table observacionPersonal
(
    uuid         varchar(100) primary key,
    creadoEn     timestamp default current_timestamp not null,
    estado       varchar(100)                        not null,
    descripcion  varchar(200)                        not null,
    fecha        date                                not null,
    uuidPersonal varchar(100)                        not null,
    uuidVisita   varchar(100)                        not null,
    foreign key (uuidPersonal) references personal (uuid),
    foreign key (uuidVisita) references visitaProyecto (uuid)
);


create table presupuestoObra
(
    uuid        varchar(100) primary key,
    creadoEn    timestamp      default current_timestamp not null,
    nombre      varchar(100)                             not null,
    descripcion varchar(200)                             not null,
    fecha       date                                     not null,
    iva         DECIMAL(12, 2),
    total       DECIMAL(12, 2) default 0,
    uuidCliente varchar(100)                             not null,
    uuidUsuario varchar(100)                             not null,
    foreign key (uuidCliente) references usuario (uuid),
    foreign key (uuidUsuario) references usuario (uuid)
);

create table presupuestoProyecto
(
    uuid                varchar(100) primary key,
    creadoEn            timestamp default current_timestamp not null,
    uuidPresupuestoObra varchar(100)                        not null,
    uuidProyecto        varchar(100)                        not null,
    foreign key (uuidPresupuestoObra) references presupuestoObra (uuid),
    foreign key (uuidProyecto) references proyecto (uuid)
);

create table capituloPresupuesto
(
    uuid                varchar(100) primary key,
    creadoEn            timestamp      default current_timestamp not null,
    nombre              text                                     not null,
    numero              int                                      not null,
    total               DECIMAL(12, 2) default 0,
    uuidPresupuestoObra varchar(100)                             not null,
    foreign key (uuidPresupuestoObra) references presupuestoObra (uuid)
);

create table detalleCapitulo
(
    uuid                    varchar(100) primary key,
    creadoEn                timestamp default current_timestamp not null,
    descripcion             text                                not null,
    unidad                  varchar(10)                         not null,
    cantidad                int                                 not null,
    precioUnitario          decimal(15, 2)                      not null,
    total                   decimal(15, 2)                      not null,
    uuidCapituloPresupuesto varchar(100)                        not null,
    foreign key (uuidCapituloPresupuesto) references capituloPresupuesto (uuid)
);





/*=====================================================================>*/
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

