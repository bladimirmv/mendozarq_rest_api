use mendozarq;
# ==========================================================================================================
SHOW DATABASES;

SHOW TABLES;

CREATE DATABASE mendozarq;

USE mendozarq;

CREATE TABLE usuario
(
    uuid            varchar(100) PRIMARY KEY,
    creadoEn        timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
    nombre          varchar(50)                         NOT NULL,
    apellidoPaterno varchar(50)                         NOT NULL,
    apellidoMaterno varchar(50),
    celular         int,
    direccion       text,
    correo          varchar(100),
    username        varchar(50)                         NOT NULL,
    contrasenha     varchar(100)                        NOT NULL,
    rol             varchar(20)                         NOT NULL,
    activo          boolean                             NOT NULL
);

CREATE TABLE personal
(
    uuid            varchar(100) PRIMARY KEY,
    creadoEn        timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
    nombre          varchar(50)                         NOT NULL,
    apellidoPaterno varchar(50)                         NOT NULL,
    apellidoMaterno varchar(50),
    celular         int,
    direccion       text,
    correo          varchar(100),
    descripcion     varchar(200),
    sueldo          decimal(15, 2),
    moneda          varchar(10),
    activo          boolean                             NOT NULL
);

CREATE TABLE proyecto
(
    uuid          varchar(100) PRIMARY KEY,
    creadoEn      timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
    nombre        varchar(50)                         NOT NULL,
    descripcion   varchar(200),
    categoria     varchar(100)                        NOT NULL,
    estado        boolean                             NOT NULL,
    fechaInicio   date,
    fechaFinal    date,
    lugarProyecto varchar(200),
    porcentaje    int,
    uuidCliente   varchar(100),
    FOREIGN KEY (uuidCliente) REFERENCES usuario (uuid)
);

CREATE VIEW proyectoWiew AS
SELECT p.*,
       u.nombre AS nombreCliente,
       u.apellidoPaterno,
       u.apellidoMaterno
FROM proyecto AS p
         INNER JOIN usuario AS u ON p.uuidCliente = u.uuid;

CREATE TABLE carpetaProyecto
(
    uuid          varchar(100) PRIMARY KEY,
    creadoEn      timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
    nombre        varchar(50),
    fechaCreacion date,
    uuidProyecto  varchar(100)                        NOT NULL,
    FOREIGN KEY (uuidProyecto) REFERENCES proyecto (uuid)
);

CREATE TABLE documentoProyecto
(
    uuid          varchar(100) PRIMARY KEY,
    creadoEn      timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
    nombre        text                                NOT NULL,
    keyName       text                                NOT NULL,
    location      text                                NOT NULL,
    fechaCreacion date                                NOT NULL,
    uuidProyecto  varchar(100)                        NOT NULL,
    size          int                                 NOT NULL,
    path          varchar(10)                         NOT NULL,
    FOREIGN KEY (uuidProyecto) REFERENCES proyecto (uuid)
);

CREATE TABLE documentoCarpeta
(
    uuid          varchar(100) PRIMARY KEY,
    creadoEn      timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
    uuidCarpeta   varchar(100)                        NOT NULL,
    uuidDocumento varchar(100)                        NOT NULL,
    FOREIGN KEY (uuidCarpeta) REFERENCES carpetaProyecto (uuid),
    FOREIGN KEY (uuidDocumento) REFERENCES documentoProyecto (uuid)
);

CREATE TABLE personalProyecto
(
    uuid         varchar(100) PRIMARY KEY,
    creadoEn     timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
    uuidProyecto varchar(100)                        NOT NULL,
    uuidPersonal varchar(100)                        NOT NULL,
    FOREIGN KEY (uuidProyecto) REFERENCES proyecto (uuid),
    FOREIGN KEY (uuidPersonal) REFERENCES personal (uuid)
);

CREATE TABLE usuarioProyecto
(
    uuid         varchar(100) PRIMARY KEY,
    creadoEn     timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
    uuidProyecto varchar(100)                        NOT NULL,
    uuidUsuario  varchar(100)                        NOT NULL,
    FOREIGN KEY (uuidProyecto) REFERENCES proyecto (uuid),
    FOREIGN KEY (uuidUsuario) REFERENCES usuario (uuid)
);

CREATE TABLE servicioProyecto
(
    uuid         varchar(100) PRIMARY KEY,
    creadoEn     timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
    nombre       varchar(50)                         NOT NULL,
    descripcion  varchar(200),
    avance       int                                 NOT NULL,
    fechaInicio  date                                NOT NULL,
    fechaFinal   date                                NOT NULL,
    uuidProyecto varchar(100)                        NOT NULL,
    FOREIGN KEY (uuidProyecto) REFERENCES proyecto (uuid)
);

CREATE TABLE visitaProyecto
(
    uuid            varchar(100) PRIMARY KEY,
    creadoEn        timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
    nombre          varchar(50)                         NOT NULL,
    faseDelProyecto varchar(100)                        NOT NULL,
    descripcion     varchar(200),
    fecha           timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
    uuidProyecto    varchar(100)                        NOT NULL,
    FOREIGN KEY (uuidProyecto) REFERENCES proyecto (uuid)
);

CREATE TABLE participanteVisita
(
    uuid               varchar(100) PRIMARY KEY,
    creadoEn           timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
    uuidVisitaProyecto varchar(100)                        NOT NULL,
    uuidUsuario        varchar(100)                        NOT NULL,
    FOREIGN KEY (uuidVisitaProyecto) REFERENCES visitaProyecto (uuid),
    FOREIGN KEY (uuidUsuario) REFERENCES usuario (uuid)
);

CREATE TABLE observacionServicio
(
    uuid         varchar(100) PRIMARY KEY,
    creadoEn     timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
    estado       varchar(100)                        NOT NULL,
    descripcion  varchar(200)                        NOT NULL,
    fecha        date                                NOT NULL,
    uuidServicio varchar(100)                        NOT NULL,
    uuidVisita   varchar(100)                        NOT NULL,
    FOREIGN KEY (uuidServicio) REFERENCES servicioProyecto (uuid),
    FOREIGN KEY (uuidVisita) REFERENCES visitaProyecto (uuid)
);

CREATE TABLE observacionPersonal
(
    uuid         varchar(100) PRIMARY KEY,
    creadoEn     timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
    estado       varchar(100)                        NOT NULL,
    descripcion  varchar(200)                        NOT NULL,
    fecha        date                                NOT NULL,
    uuidPersonal varchar(100)                        NOT NULL,
    uuidVisita   varchar(100)                        NOT NULL,
    FOREIGN KEY (uuidPersonal) REFERENCES personal (uuid),
    FOREIGN KEY (uuidVisita) REFERENCES visitaProyecto (uuid)
);

CREATE TABLE presupuestoObra
(
    uuid        varchar(100) PRIMARY KEY,
    creadoEn    timestamp      DEFAULT CURRENT_TIMESTAMP NOT NULL,
    nombre      varchar(100)                             NOT NULL,
    descripcion varchar(200)                             NOT NULL,
    fecha       date                                     NOT NULL,
    iva         DECIMAL(12, 2),
    total       DECIMAL(12, 2) DEFAULT 0,
    uuidCliente varchar(100)                             NOT NULL,
    uuidUsuario varchar(100)                             NOT NULL,
    FOREIGN KEY (uuidCliente) REFERENCES usuario (uuid),
    FOREIGN KEY (uuidUsuario) REFERENCES usuario (uuid)
);

CREATE TABLE presupuestoProyecto
(
    uuid                varchar(100) PRIMARY KEY,
    creadoEn            timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
    uuidPresupuestoObra varchar(100)                        NOT NULL,
    uuidProyecto        varchar(100)                        NOT NULL,
    FOREIGN KEY (uuidPresupuestoObra) REFERENCES presupuestoObra (uuid),
    FOREIGN KEY (uuidProyecto) REFERENCES proyecto (uuid)
);

CREATE TABLE capituloPresupuesto
(
    uuid                varchar(100) PRIMARY KEY,
    creadoEn            timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
    nombre              text                                NOT NULL,
    descuento           int       DEFAULT 0                 NOT NULL,
    #     total               DECIMAL(12, 2) default 0,hub usb
    uuidPresupuestoObra varchar(100)                        NOT NULL,
    FOREIGN KEY (uuidPresupuestoObra) REFERENCES presupuestoObra (uuid)
);

CREATE TABLE detalleCapitulo
(
    uuid                    varchar(100) PRIMARY KEY,
    creadoEn                timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
    descripcion             text                                NOT NULL,
    unidad                  varchar(10)                         NOT NULL,
    cantidad                int                                 NOT NULL,
    precioUnitario          decimal(15, 2)                      NOT NULL,
    #     total                   decimal(15, 2)                      not null,
    uuidCapituloPresupuesto varchar(100)                        NOT NULL,
    FOREIGN KEY (uuidCapituloPresupuesto) REFERENCES capituloPresupuesto (uuid) on delete cascade
);


CREATE TABLE categoriaProducto
(
    uuid        varchar(100) PRIMARY KEY,
    creadoEn    timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
    nombre      varchar(100) UNIQUE                 NOT NULL,
    descripcion varchar(200),
    keyName     text                                NOT NULL,
    location    text                                NOT NULL,
    estado      boolean                             NOT NULL
);

CREATE TABLE producto
(
    uuid        varchar(100) PRIMARY KEY,
    creadoEn    timestamp      DEFAULT CURRENT_TIMESTAMP NOT NULL,
    nombre      varchar(300) UNIQUE                      NOT NULL,
    descripcion varchar(1000),
    precio      decimal(15, 2)                           NOT NULL,
    moneda      varchar(5)     DEFAULT 'Bs.'             NOT NULL,
    stock       int                                      NOT NULL,
    descuento   decimal(15, 2) DEFAULT 0                 NOT NULL,
    estado      boolean                                  NOT NULL
);

CREATE TABLE fotoProducto
(
    uuid         varchar(100) PRIMARY KEY,
    creadoEn     timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
    nombre       text                                NOT NULL,
    indice       int                                 NOT NULL,
    keyName      text                                NOT NULL,
    location     text                                NOT NULL,
    size         int                                 NOT NULL,
    uuidProducto varchar(100)                        NOT NULL,
    FOREIGN KEY (uuidProducto) REFERENCES producto (uuid) on delete  cascade
);


CREATE TABLE detalleCategoriaProducto
(
    uuid          varchar(100) PRIMARY KEY,
    uuidCategoria varchar(100),
    uuidProducto  varchar(100),
    FOREIGN KEY (uuidCategoria) REFERENCES categoriaProducto (uuid),
    FOREIGN KEY (uuidProducto) REFERENCES producto (uuid) on delete  cascade
);

CREATE TABLE opinionProducto
(
    uuid         varchar(100) PRIMARY KEY,
    creadoEn     timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
    titulo       varchar(300)                        NOT NULL,
    descripcion  varchar(1000)                       NOT NULL,
    estado       boolean   DEFAULT false             NOT NULL,
    verificado   boolean   DEFAULT false             NOT NULL,
    puntuacion   int                                 NOT NULL,
    uuidProducto varchar(100)                        NOT NULL,
    uuidCliente  varchar(100)                        NOT NULL,
    FOREIGN KEY (uuidProducto) REFERENCES producto (uuid),
    FOREIGN KEY (uuidCliente) REFERENCES usuario (uuid)
);

CREATE TABLE ventaProducto
(
    uuid         varchar(100) PRIMARY KEY,
    creadoEn     timestamp    DEFAULT CURRENT_TIMESTAMP NOT NULL,
    uuidCliente  varchar(100)                           NOT NULL,
    uuidVendedor varchar(100) DEFAULT NULL,
    tipoVenta    TEXT                                   NOT NULL,
    metodoPago   text                                   NOT NULL,
    FOREIGN KEY (uuidCliente) REFERENCES usuario (uuid),
    FOREIGN KEY (uuidVendedor) REFERENCES usuario(uuid)
);

CREATE TABLE detalleVentaProducto
(
    uuid              varchar(100) PRIMARY KEY,
    creadoEn          timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
    uuidVentaProducto varchar(100)                        NOT NULL,
    uuidProducto      varchar(100)                        NOT NULL,
    cantidad          int                                 NOT NULL,
    precio            decimal(15, 2)                      NOT NULL,
    FOREIGN KEY (uuidVentaProducto) REFERENCES ventaProducto (uuid) on delete cascade,
    FOREIGN KEY (uuidProducto) REFERENCES producto (uuid)
);



# LOGS
use mendozarq;

CREATE TABLE log_usuario
(
    operacion     CHAR(1)                         NOT NULL,
    creadoEn      TIMESTAMP                       NOT NULL,
    creadoPor     TEXT,
    uuidCreadoPor TEXT,
    hostname      TEXT,
    tabla         TEXT default 'usuario'          NOT NULL,
    path          text default 'mendozarq-liraki' NOT NULL,
    uuidRow       varchar(100)                    NOT NULL
);

CREATE TABLE log_personal
(
    operacion     CHAR(1)                  NOT NULL,
    creadoEn      TIMESTAMP                NOT NULL,
    creadoPor     TEXT,
    uuidCreadoPor TEXT,
    hostname      TEXT,
    tabla         TEXT default 'personal'  NOT NULL,
    path          text default 'mendozarq' not null,
    uuidRow       varchar(100)             NOT NULL
);

CREATE TABLE log_proyecto
(
    operacion     CHAR(1)                  NOT NULL,
    creadoEn      TIMESTAMP                NOT NULL,
    creadoPor     TEXT,
    uuidCreadoPor TEXT,
    hostname      TEXT,
    tabla         TEXT default 'proyecto'  NOT NULL,
    path          text default 'mendozarq' not null,
    uuidRow       varchar(100)             NOT NULL
);

CREATE TABLE log_documentos
(
    operacion     CHAR(1)                   NOT NULL,
    creadoEn      TIMESTAMP                 NOT NULL,
    creadoPor     TEXT,
    uuidCreadoPor TEXT,
    hostname      TEXT,
    tabla         TEXT default 'documentos' NOT NULL,
    path          text default 'mendozarq'  not null,
    uuidRow       varchar(100)              NOT NULL
);

CREATE TABLE log_producto
(
    operacion     CHAR(1)                 NOT NULL,
    creadoEn      TIMESTAMP               NOT NULL,
    creadoPor     TEXT,
    uuidCreadoPor TEXT,
    hostname      TEXT,
    tabla         TEXT default 'producto' NOT NULL,
    path          text default 'liraki'   not null,
    uuidRow       varchar(100)            NOT NULL
);


drop view logs;
create view logs AS
select *
from log_usuario
union
select *
from log_personal
union
select *
from log_proyecto
union
select *
from log_documentos
union
select *
from log_producto;


