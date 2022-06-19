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
    descripcion   text,
    categoria     varchar(100)                        NOT NULL,
    estado        boolean                             NOT NULL,
    fechaInicio   date,
    fechaFinal    date,
    lugarProyecto text,
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
    estado          boolean   default false,
    nombre          varchar(50)                         NOT NULL,
    faseDelProyecto TEXT                                NOT NULL,
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
    uuid         varchar(100) PRIMARY KEY,
    creadoEn     timestamp      DEFAULT CURRENT_TIMESTAMP NOT NULL,
    nombre       varchar(100)                             NOT NULL,
    descripcion  varchar(200)                             NOT NULL,
    fecha        date                                     NOT NULL,
    iva          DECIMAL(12, 2) DEFAULT 0,
    total        DECIMAL(12, 2) DEFAULT 0,
    uuidCliente  varchar(100)   DEFAULT NULL,
    uuidUsuario  varchar(100)   DEFAULT NULL,
    uuidProyecto varchar(100)   DEFAULT NULL,
    FOREIGN KEY (uuidCliente) REFERENCES usuario (uuid),
    FOREIGN KEY (uuidUsuario) REFERENCES usuario (uuid),
    FOREIGN KEY (uuidProyecto) REFERENCES proyecto (uuid)
);


CREATE TABLE capituloPresupuesto
(
    uuid                varchar(100) PRIMARY KEY,
    creadoEn            timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
    nombre              text                                NOT NULL,
    descuento           int       DEFAULT 0                 NOT NULL,
    uuidPresupuestoObra varchar(100)                        NOT NULL,
    FOREIGN KEY (uuidPresupuestoObra) REFERENCES presupuestoObra (uuid) ON DELETE CASCADE
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


show databases;

CREATE TABLE categoriaProducto
(
    uuid        varchar(100) PRIMARY KEY,
    creadoEn    timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
    nombre      varchar(100) UNIQUE                 NOT NULL,
    descripcion varchar(200),
    keyName     text                                NOT NULL,
    fileName    text                                not null,
    location    text                                NOT NULL,
    size        int                                 not null,
    estado      boolean                             NOT NULL
);

CREATE TABLE producto
(
    uuid        varchar(100) PRIMARY KEY,
    creadoEn    timestamp      DEFAULT CURRENT_TIMESTAMP NOT NULL,
    nombre      varchar(300) UNIQUE                      NOT NULL,
    descripcion text,
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
    FOREIGN KEY (uuidProducto) REFERENCES producto (uuid) on delete cascade
);


CREATE TABLE detalleCategoriaProducto
(
    uuid          varchar(100) PRIMARY KEY,
    uuidCategoria varchar(100),
    uuidProducto  varchar(100),
    FOREIGN KEY (uuidCategoria) REFERENCES categoriaProducto (uuid),
    FOREIGN KEY (uuidProducto) REFERENCES producto (uuid) on delete cascade
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

CREATE TABLE planificacionProyecto
(
    uuid         varchar(100) PRIMARY KEY,
    creadoEn     timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
    titulo       TEXT                                not null,
    subtitulo    TEXT,
    uuidProyecto varchar(100)                        not null,
    FOREIGN KEY (uuidProyecto) REFERENCES proyecto (uuid) on delete cascade
);

CREATE TABLE capituloPlanificacionProyecto
(
    uuid                      varchar(100) PRIMARY KEY,
    creadoEn                  timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
    nombre                    varchar(200)                        not null,
    fechaInicio               date,
    fechaFinal                date,
    avance                    int,
    dependencia               varchar(100),
    color                     text,
    uuidPlanificacionProyecto varchar(100)                        not null,
    FOREIGN KEY (uuidPlanificacionProyecto) REFERENCES planificacionProyecto (uuid) ON DELETE CASCADE
);


CREATE TABLE tareaPlanificacionProyecto
(
    uuid         varchar(100) PRIMARY KEY,
    creadoEn     timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
    nombre       varchar(200)                        not null,
    fechaInicio  date,
    fechaFinal   date,
    avance       int,
    dependencia  varchar(100),
    hito         boolean   default false,
    color        text,
    actividades  text,
    uuidCapitulo varchar(100)                        not null,
    FOREIGN KEY (uuidCapitulo) REFERENCES capituloPlanificacionProyecto (uuid) ON DELETE CASCADE
);

CREATE TABLE carritoProducto
(
    uuid         varchar(100) PRIMARY KEY,
    creadoEn     timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
    cantidad     int       default 1                 not null,
    uuidProducto varchar(100)                        not null,
    uuidCliente  varchar(100)                        not null,
    FOREIGN KEY (uuidProducto) REFERENCES producto (uuid),
    FOREIGN KEY (uuidCliente) REFERENCES usuario (uuid)
);

CREATE TABLE venta
(
    uuid          varchar(100) PRIMARY KEY,
    creadoEn      timestamp                                                                           DEFAULT CURRENT_TIMESTAMP NOT NULL,
    numeroVenta   int unique auto_increment                                                                                     NOT NULL,
    nombreFactura varchar(50)                                                                                                   not null,
    nitCiCex      VARCHAR(100)                                                                                                  not null,
    departamento  enum ('cbba', 'lp', 'scz')                                                          default 'cbba'            not null,
    direccion     varchar(500)                                                                                                  not null,
    descripcion   varchar(500)                                                                                                  not null,
    tipoVenta     enum ('fisica', 'online')                                                                                     NOT NULL,
    tipoEnvio     enum ('delivery', 'personal')                                                                                 NOT NULL,
    metodoDePago  enum ( 'efectivo','deposito_transferencia_qr', 'paypal', 'tarjeta')                                           not null,
    estado        enum ('pagando','pendiente', 'confirmado','en_envio', 'para_recoger', 'completado') default 'pendiente'       not null,
    total         decimal(16, 2),
    uuidCliente   varchar(100)                                                                                                  not null,
    uuidVendedor  varchar(100)                                                                        default null,
    FOREIGN KEY (uuidCliente) REFERENCES usuario (uuid),
    FOREIGN KEY (uuidVendedor) REFERENCES usuario (uuid)
);

alter table venta
    auto_increment = 1000001;

CREATE TABLE conceptoVenta
(
    uuid           varchar(100) PRIMARY KEY,
    creadoEn       timestamp      DEFAULT CURRENT_TIMESTAMP NOT NULL,
    cantidad       int                                      NOT NULL,
    precioUnitario decimal(16, 2)                           NOT NULL,
    importe        decimal(16, 2)                           NOT NULL,
    descuento      decimal(15, 2) DEFAULT 0                 NOT NULL,
    uuidProducto   varchar(100)                             not null,
    uuidVenta      varchar(100)                             not null,
    FOREIGN KEY (uuidVenta) REFERENCES venta (uuid) ON DELETE CASCADE,
    FOREIGN KEY (uuidProducto) REFERENCES producto (uuid)
);

CREATE TABLE recurso
(
    uuid           varchar(100) PRIMARY KEY,
    creadoEn       timestamp                                                      DEFAULT CURRENT_TIMESTAMP NOT NULL,
    nombre         varchar(100)                                                                             NOT NULL,
    descripcion    varchar(200),
    tipoRecurso    enum ('materia_prima', 'maquinas', 'material_de_construccion') DEFAULT 'materia_prima',
    area           enum ('mendozarq', 'liraki', 'mendoraki')                      DEFAULT 'mendozarq',
    precioUnitario decimal(15, 2)                                                 DEFAULT 0,
    precioPorMayor decimal(15, 2)                                                 DEFAULT 0
);

CREATE TABLE proveedor
(
    uuid        varchar(100) PRIMARY KEY,
    creadoEn    timestamp    DEFAULT CURRENT_TIMESTAMP NOT NULL,
    nombre      varchar(100)                           NOT NULL,
    celular     int,
    direccion   varchar(200),
    descripcion varchar(200),
    uuidRecurso varchar(100) DEFAULT NULL,
    FOREIGN KEY (uuidRecurso) REFERENCES recurso (uuid)
);

CREATE TABLE observacionObra
(
    uuid                     varchar(100) PRIMARY KEY,
    creadoEn                 timestamp    DEFAULT CURRENT_TIMESTAMP NOT NULL,
    puntoDeInspeccion        TEXT,
    observacion              varchar(100),
    levantamientoObservacion TEXT,
    uuidVisita               varchar(100) DEFAULT NULL,
    FOREIGN KEY (uuidVisita) REFERENCES visitaProyecto (uuid)
);

CREATE TABLE fotoObservacionObra
(
    uuid                varchar(100) PRIMARY KEY,
    creadoEn            timestamp    DEFAULT CURRENT_TIMESTAMP NOT NULL,
    keyName             text                                   NOT NULL,
    fileName            text                                   not null,
    location            text                                   NOT NULL,
    size                int                                    not null,
    uuidObservacionObra varchar(100) DEFAULT NULL,
    FOREIGN KEY (uuidObservacionObra) REFERENCES observacionObra (uuid) ON DELETE CASCADE
);


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
from log_producto
order by creadoEn desc
limit 100;

# ======================================================================================================================================

CREATE PROCEDURE usuario_procedure(
    IN operacion CHAR(1),
    IN creadoEn TIMESTAMP,
    IN creadoPor TEXT,
    IN uuidCreadoPor TEXT,
    IN hostname TEXT,
    IN uuidRow varchar(100)
)
BEGIN
    INSERT INTO log_usuario(operacion,
                            creadoEn,
                            creadoPor,
                            uuidCreadoPor,
                            hostname,
                            uuidRow)
    SELECT operacion,
           creadoEn,
           creadoPor,
           uuidCreadoPor,
           hostname,
           uuidRow;
END;


CREATE TRIGGER insert_usuario_trigger
    AFTER
        INSERT
    ON usuario
    FOR EACH ROW
BEGIN
    CALL usuario_procedure(
            'I',
            CURRENT_TIMESTAMP,
            @creadoPor,
            @uuidCreadoPor,
            @@hostname,
            NEW.uuid
        );

    set @uuidCreadoPor = '', @creadoPor = '';
END;

CREATE TRIGGER update_usuario_trigger
    AFTER
        UPDATE
    ON usuario
    FOR EACH ROW
BEGIN
    CALL usuario_procedure(
            'U',
            CURRENT_TIMESTAMP,
            @creadoPor,
            @uuidCreadoPor,
            @@hostname,
            NEW.uuid
        );
    set @uuidCreadoPor = '', @creadoPor = '';
END;


CREATE TRIGGER delete_usuario_trigger
    AFTER
        delete
    ON usuario
    FOR EACH ROW
BEGIN
    CALL usuario_procedure(
            'D',
            CURRENT_TIMESTAMP,
            @creadoPor,
            @uuidCreadoPor,
            @@hostname,
            OLD.uuid
        );

    set @uuidCreadoPor = '', @creadoPor = '';
END;


# PERSONAL

CREATE PROCEDURE personal_procedure(
    IN operacion CHAR(1),
    IN creadoEn TIMESTAMP,
    IN creadoPor TEXT,
    IN uuidCreadoPor TEXT,
    IN hostname TEXT,
    IN uuidRow varchar(100)
)
BEGIN
    INSERT INTO log_personal(operacion,
                             creadoEn,
                             creadoPor,
                             uuidCreadoPor,
                             hostname,
                             uuidRow)
    SELECT operacion,
           creadoEn,
           creadoPor,
           uuidCreadoPor,
           hostname,
           uuidRow;
END;

CREATE TRIGGER insert_personal_trigger
    AFTER
        INSERT
    ON personal
    FOR EACH ROW
BEGIN
    CALL personal_procedure(
            'I',
            CURRENT_TIMESTAMP,
            @creadoPor,
            @uuidCreadoPor,
            @@hostname,
            NEW.uuid
        );

    set @uuidCreadoPor = '', @creadoPor = '';
END;

CREATE TRIGGER update_personal_trigger
    AFTER
        UPDATE
    ON personal
    FOR EACH ROW
BEGIN
    CALL personal_procedure(
            'U',
            CURRENT_TIMESTAMP,
            @creadoPor,
            @uuidCreadoPor,
            @@hostname,
            NEW.uuid
        );
    set @uuidCreadoPor = '', @creadoPor = '';
END;


CREATE TRIGGER delete_personal_trigger
    AFTER
        delete
    ON personal
    FOR EACH ROW
BEGIN
    CALL personal_procedure(
            'D',
            CURRENT_TIMESTAMP,
            @creadoPor,
            @uuidCreadoPor,
            @@hostname,
            OLD.uuid
        );

    set @uuidCreadoPor = '', @creadoPor = '';
END;


# PROYECTO

CREATE PROCEDURE proyecto_procedure(
    IN operacion CHAR(1),
    IN creadoEn TIMESTAMP,
    IN creadoPor TEXT,
    IN uuidCreadoPor TEXT,
    IN hostname TEXT,
    IN uuidRow varchar(100)
)
BEGIN
    INSERT INTO log_proyecto (operacion,
                              creadoEn,
                              creadoPor,
                              uuidCreadoPor,
                              hostname,
                              uuidRow)
    SELECT operacion,
           creadoEn,
           creadoPor,
           uuidCreadoPor,
           hostname,
           uuidRow;
END;

CREATE TRIGGER insert_proyecto_trigger
    AFTER
        INSERT
    ON proyecto
    FOR EACH ROW
BEGIN
    CALL proyecto_procedure(
            'I',
            CURRENT_TIMESTAMP,
            @creadoPor,
            @uuidCreadoPor,
            @@hostname,
            NEW.uuid
        );

    set @uuidCreadoPor = '', @creadoPor = '';
END;

CREATE TRIGGER update_proyecto_trigger
    AFTER
        UPDATE
    ON proyecto
    FOR EACH ROW
BEGIN
    CALL proyecto_procedure(
            'U',
            CURRENT_TIMESTAMP,
            @creadoPor,
            @uuidCreadoPor,
            @@hostname,
            NEW.uuid
        );
    set @uuidCreadoPor = '', @creadoPor = '';
END;


CREATE TRIGGER delete_proyecto_trigger
    AFTER
        delete
    ON proyecto
    FOR EACH ROW
BEGIN
    CALL proyecto_procedure(
            'D',
            CURRENT_TIMESTAMP,
            @creadoPor,
            @uuidCreadoPor,
            @@hostname,
            OLD.uuid
        );

    set @uuidCreadoPor = '', @creadoPor = '';
END;


#DOCUMENTOS

CREATE PROCEDURE documentos_procedure(
    IN operacion CHAR(1),
    IN creadoEn TIMESTAMP,
    IN creadoPor TEXT,
    IN uuidCreadoPor TEXT,
    IN hostname TEXT,
    IN uuidRow varchar(100)
)
BEGIN
    INSERT INTO log_documentos (operacion,
                                creadoEn,
                                creadoPor,
                                uuidCreadoPor,
                                hostname,
                                uuidRow)
    SELECT operacion,
           creadoEn,
           creadoPor,
           uuidCreadoPor,
           hostname,
           uuidRow;
END;

CREATE TRIGGER insert_documentos_trigger
    AFTER
        INSERT
    ON documentoproyecto
    FOR EACH ROW
BEGIN
    CALL documentos_procedure(
            'I',
            CURRENT_TIMESTAMP,
            @creadoPor,
            @uuidCreadoPor,
            @@hostname,
            NEW.uuid
        );

    set @uuidCreadoPor = '', @creadoPor = '';
END;

CREATE TRIGGER update_documentos_trigger
    AFTER
        UPDATE
    ON documentoproyecto
    FOR EACH ROW
BEGIN
    CALL documentos_procedure(
            'U',
            CURRENT_TIMESTAMP,
            @creadoPor,
            @uuidCreadoPor,
            @@hostname,
            NEW.uuid
        );
    set @uuidCreadoPor = '', @creadoPor = '';
END;


CREATE TRIGGER delete_documentos_trigger
    AFTER
        delete
    ON documentoproyecto
    FOR EACH ROW
BEGIN
    CALL documentos_procedure(
            'D',
            CURRENT_TIMESTAMP,
            @creadoPor,
            @uuidCreadoPor,
            @@hostname,
            OLD.uuid
        );

    set @uuidCreadoPor = '', @creadoPor = '';
END;



#producto
CREATE PROCEDURE producto_procedure(
    IN operacion CHAR(1),
    IN creadoEn TIMESTAMP,
    IN creadoPor TEXT,
    IN uuidCreadoPor TEXT,
    IN hostname TEXT,
    IN uuidRow varchar(100)
)
BEGIN
    INSERT INTO log_producto (operacion,
                              creadoEn,
                              creadoPor,
                              uuidCreadoPor,
                              hostname,
                              uuidRow)
    SELECT operacion,
           creadoEn,
           creadoPor,
           uuidCreadoPor,
           hostname,
           uuidRow;
END;

CREATE TRIGGER insert_producto_trigger
    AFTER
        INSERT
    ON producto
    FOR EACH ROW
BEGIN
    CALL producto_procedure(
            'I',
            CURRENT_TIMESTAMP,
            @creadoPor,
            @uuidCreadoPor,
            @@hostname,
            NEW.uuid
        );

    set @uuidCreadoPor = '', @creadoPor = '';
END;

CREATE TRIGGER update_producto_trigger
    AFTER
        UPDATE
    ON producto
    FOR EACH ROW
BEGIN
    CALL producto_procedure(
            'U',
            CURRENT_TIMESTAMP,
            @creadoPor,
            @uuidCreadoPor,
            @@hostname,
            NEW.uuid
        );
    set @uuidCreadoPor = '', @creadoPor = '';
END;


CREATE TRIGGER delete_prodducto_trigger
    AFTER
        delete
    ON producto
    FOR EACH ROW
BEGIN
    CALL producto_procedure(
            'D',
            CURRENT_TIMESTAMP,
            @creadoPor,
            @uuidCreadoPor,
            @@hostname,
            OLD.uuid
        );

    set @uuidCreadoPor = '', @creadoPor = '';
END;


# =============================== trigger ventas

CREATE TRIGGER insert_conceptoVenta_trigger
    AFTER
        INSERT
    ON conceptoVenta
    FOR EACH ROW
BEGIN
    UPDATE producto AS p
        INNER JOIN conceptoventa c on p.uuid = c.uuidProducto
        INNER JOIN venta v on c.uuidVenta = v.uuid
    SET p.stock = p.stock - NEW.cantidad
    WHERE p.uuid = NEW.uuidProducto
      AND v.estado != 'pendiente'
      AND v.estado != 'pagando'
      AND NEW.uuid = c.uuid;
END;



CREATE TRIGGER delete_venta_trigger
    BEFORE
        DELETE
    ON venta
    FOR EACH ROW
BEGIN
    UPDATE producto AS p INNER JOIN conceptoventa c on p.uuid = c.uuidProducto
        INNER JOIN venta v on c.uuidVenta = v.uuid
    SET p.stock = p.stock + c.cantidad
    WHERE c.uuidVenta = OLD.uuid
      AND v.estado != 'pendiente'
      AND v.estado != 'pagando';
END;


CREATE TRIGGER delete_ventaConcepto_trigger
    AFTER
        DELETE
    ON conceptoventa
    FOR EACH ROW
BEGIN
    UPDATE producto AS p
        INNER JOIN conceptoventa c on p.uuid = c.uuidProducto
        INNER JOIN venta v on c.uuidVenta = v.uuid
    SET p.stock = p.stock + OLD.cantidad
    WHERE p.uuid = OLD.uuidProducto
      AND v.estado != 'pendiente'
      AND v.estado != 'pagando';
END;


CREATE TRIGGER update_venta_trigger
    AFTER
        UPDATE
    ON venta
    FOR EACH ROW
BEGIN
    UPDATE producto AS p
        INNER JOIN conceptoventa c on p.uuid = c.uuidProducto
        INNER JOIN venta v on c.uuidVenta = v.uuid
    SET p.stock = p.stock - c.cantidad
    WHERE v.estado != 'pendiente'
      AND v.estado != 'pagando'
      AND v.uuid = NEW.uuid
      AND v.tipoVenta = 'online';
END;



INSERT INTO mendozarq.usuario (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo,
                               username, contrasenha, rol, activo)
VALUES ('0976bfba-6a2a-4405-8bfe-2474a21f1e25', '2021-11-24 20:30:52', 'evaristo', 'del', 'gelabert', 67891432, '3896 Gil Ferrocarril
    ', 'Lilia_Anaya@corpfolder.com', 'evari8pni9', '$2b$10$56JrCWb4S9Zx1.GT9WdwCuNdH5jnFQcwQgKUXqbtLGQvZ2JrsUVSa',
        'cliente', 1);
INSERT INTO mendozarq.usuario (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo,
                               username, contrasenha, rol, activo)
VALUES ('178e1faa-b3f0-4900-a7b5-a19085c0cf9c', '2021-11-24 20:29:26', 'salomón', 'ruano', '', 72686187, '4265 Korta hernandez Vía Pública
    ', 'Francisco_Santana@yahoo.com', 'salomo1ydq', '$2b$10$MKlyLpWKHpnwOglfWDOMfeCnT0zwwFKXPEnWbyb7WZvyGTxo0HCiu',
        'cliente', 1);
INSERT INTO mendozarq.usuario (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo,
                               username, contrasenha, rol, activo)
VALUES ('2319b069-bde2-452c-af94-ec08f68c722c', '2021-11-24 20:39:52', 'leandra', 'villa', 'jordán', 74568926, '817 Tamayo Grupo
    ', 'XimenaGuadalupe18@yahoo.com', 'leandhbal2', '$2b$10$g5h4utbZBrmhjrKTMV64.O3x6d43Zper9cu5CA7q9zpz5sQSSdHm6',
        'vendedor', 1);
INSERT INTO mendozarq.usuario (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo,
                               username, contrasenha, rol, activo)
VALUES ('35f44215-b58f-491e-a439-4b39ea044442', '2021-11-24 20:42:26', 'sergio', 'olivé', 'lerma', 70045451, '9431 Contreras Puente
    ', 'Aarn.Gaitn22@example.com', 'sergimbswp', '$2b$10$ix0pSZUTSrJPnXcMfRxsCeuwS8RgwaEXRojgpxf.dD.yP2Ulsi1N2',
        'administrador', 1);
INSERT INTO mendozarq.usuario (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo,
                               username, contrasenha, rol, activo)
VALUES ('36f1f6d4-163d-4856-a964-aae308769f27', '2021-11-24 20:39:06', 'severiano', 'peña', 'campillo', 66365952, '3803 Miranda Vía Pública
    ', 'Jorge.Tello@corpfolder.com', 'severx0md2', '$2b$10$1gKBcTW.CzxQB2kmJ8slqeu4kHTpgbgfOBCFOWoDML9siHcVb0qtu',
        'arquitecto', 1);
INSERT INTO mendozarq.usuario (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo,
                               username, contrasenha, rol, activo)
VALUES ('4655d3ef-55cb-4579-9776-7f39377f5368', '2021-11-24 20:34:38', 'josé', 'figueroa', 'ibáñez', 62256672, '931 Miranda Rambla
    ', 'Gabriela_Zelaya97@gmail.com', 'joséijvxca', '$2b$10$h0hwzjwGhhLlQDgosMOfM.fwVWmSatBoQ3VY1Yv6dp1Chi0oP8f.G',
        'arquitecto', 1);
INSERT INTO mendozarq.usuario (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo,
                               username, contrasenha, rol, activo)
VALUES ('665d2f27-32f8-4ac2-81fc-f972bcfdce78', '2021-11-24 20:37:57', 'evangelina', 'molina', 'mercader', 66383117, '077 Negrete Gran Subida
    ', 'JosAntonio_Cazares68@hotmail.com', 'evang2vu74', '$2b$10$ttZEYszXxEAIMJv9J23bOuSQ9c1LNsKRLa5HGcvlphXC0z7D1YYRK',
        'arquitecto', 1);
INSERT INTO mendozarq.usuario (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo,
                               username, contrasenha, rol, activo)
VALUES ('7a617f2c-0ca0-49be-a3f0-e77555174af0', '2021-11-24 20:30:03', 'máximo', 'acedo', 'morillo', 72807533, '2311 Rosado Pasaje
    ', 'Toms_Quintana25@corpfolder.com', 'máximcrvd7', '$2b$10$JjJc.uMBp1qckLkFtTreueK2c6i6Rk9vJ4Ugp16Y9FyyYA66O6t8O',
        'cliente', 1);
INSERT INTO mendozarq.usuario (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo,
                               username, contrasenha, rol, activo)
VALUES ('7ec2091c-abf2-4025-a207-3bbf04a5a8b9', '2021-11-24 20:33:29', 'elodia', 'falcón', 'larrañaga', 68966636, '1757 Juárez Senda
    ', 'Dorotea92@corpfolder.com', 'elodib0825', '$2b$10$NF6FJ62itir9Mbqqdl3YBeZSoaiMzz3FgihI/w0tsw9Sb4SwVe2ie',
        'cliente', 1);
INSERT INTO mendozarq.usuario (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo,
                               username, contrasenha, rol, activo)
VALUES ('81ed9811-5b7a-4316-8e9d-7081df740265', '2021-11-24 20:28:59', 'lina', 'sáenz', 'ribes', 78389801, '4988 Mondragón Rincón
    ', 'Blanca_Orellana63@corpfolder.com', 'lina1tpy7e', '$2b$10$W14t6MNoWIk5XHGUrra.GeSDtGXl6Bkk43sc7Wa1T1AvdF./6erX.',
        'cliente', 1);
INSERT INTO mendozarq.usuario (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo,
                               username, contrasenha, rol, activo)
VALUES ('81f19377-6c68-4bdc-9e38-d1c47b68c0c6', '2021-11-24 20:38:31', 'néstor', 'almazán', 'azorin', 64046915, '98208 Yamileth Grupo
    ', 'Mariana97@yahoo.com', 'nésto42u7t', '$2b$10$GEtu3VwvQjwcAuRbSjpzguT1ry5py7mCx0hVL/T68kVtsD3DMKKtC',
        'arquitecto', 1);
INSERT INTO mendozarq.usuario (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo,
                               username, contrasenha, rol, activo)
VALUES ('8faf0153-fd37-4096-ba58-5592c24eed5a', '2021-11-24 20:35:34', 'dafne', 'escamilla', 'miralles', 63598297, '6104 Aranda Manzana
    ', 'Mercedes.Ayala1@nearbpo.com', 'dafne44lha', '$2b$10$PCG9pfLytv7.6MszgE13N.aMTdDGhvEe8GiHbZaq8HXgPa/bc51z6',
        'arquitecto', 1);
INSERT INTO mendozarq.usuario (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo,
                               username, contrasenha, rol, activo)
VALUES ('942246e6-f202-47f9-9db6-c067a33707eb', '2021-11-24 20:28:01', 'celia', 'cerdán', 'benavides', 64859213, '45267 Roldán Subida
    ', 'Anita10@corpfolder.com', 'celia4w8yf', '$2b$10$4SXxEZImtgfJzKvWjI9dj.9.ThA91zs94tr9LPOiLmGl8wQM4k54W',
        'cliente', 1);
INSERT INTO mendozarq.usuario (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo,
                               username, contrasenha, rol, activo)
VALUES ('a5b86b62-0ef8-4d23-a2f8-a242daa25103', '2021-11-24 20:31:43', 'angelino octavio', 'pintor', 'benavides',
        70283107, '1953 Axel Huerta
    ', 'Rosario_Narvez@hotmail.com', 'angelleftz', '$2b$10$qfGFexEXzfnl/jR4QMHR8u7xg2fuoJ15302yvD7yi0cS1dtKR3eli',
        'cliente', 1);
INSERT INTO mendozarq.usuario (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo,
                               username, contrasenha, rol, activo)
VALUES ('bf493a64-4573-433f-92b0-edbcae73a98b', '2021-11-24 20:45:00', 'carmelita', 'cabrero', 'castillo', 75176717,
        '81863 Pelayo Parque sdsadasdas', 'Mercedes67@yahoo.com', 'carmeky8ka',
        '$2b$10$0QPVaM7NGiSNm1neCyTIU.vQeF/jTOhpA9MYUhQLZORb7wVIgb5ku', 'cliente', 1);
INSERT INTO mendozarq.usuario (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo,
                               username, contrasenha, rol, activo)
VALUES ('ce754db3-3b9c-4dd5-81f1-ae2b5f5a060a', '2021-11-24 20:27:02', 'juan', 'sobrino', 'suárez', 68101913,
        '77864 Enrique Colonia', 'Diego82@corpfolder.com', 'juannwfqjc',
        '$2b$10$EXWxE8u0VCeScF8pbeP4Me0.1JqHYdXVO4Fp2jbLxdmJj/ASVZ.cu', 'cliente', 1);
INSERT INTO mendozarq.usuario (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo,
                               username, contrasenha, rol, activo)
VALUES ('fa27b5b3-837b-4486-b2cd-c6a306e8bd72', '2021-11-24 20:40:00', 'bladimir', 'medrano', 'vargas', 69509449,
        'Av segunda entre marina nunez del prado y calle greco.', 'bladimilmedranoblod@gmail.com', 'blado959',
        '$2b$10$Ejt7X/epAQ2kfChOFJa9T.apOjSfTR2xkMWOoIfWWKT4JFh8CDu.C', 'administrador', 1);

INSERT INTO mendozarq.personal (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo,
                                descripcion, sueldo, moneda, activo)
VALUES ('0cdca13f-175a-4ed0-8320-650f65bf9167', '2021-10-07 21:21:17', 'juan', 'perez', 'mendez', 7762509,
        'avenida aroma entre calle nose y avenida alguna ', 'suarez@gmail.com', 'personal de construccion de obras',
        10000.00, 'bs', 1);
INSERT INTO mendozarq.personal (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo,
                                descripcion, sueldo, moneda, activo)
VALUES ('6739cd0f-9e3e-4eb2-9c22-e2a60be68401', '2022-03-30 23:30:25', 'alvaro', 'mendez', 'castro', 7324341, '',
        'mendez@gmail.com', 'Personal de contruccion', 0.00, 'bs', 1);


# =================================================================== presupuesto

INSERT INTO mendozarq.presupuestoobra (uuid, creadoEn, nombre, descripcion, fecha, iva, total, uuidCliente, uuidUsuario, uuidProyecto) VALUES ('e0251f45-2ddf-4096-872a-99c319a09b40', '2022-01-13 16:06:40', 'trump tower', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. ', '2022-01-13', 5.00, 0.00, 'bf493a64-4573-433f-92b0-edbcae73a98b', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', null);


INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('1d3debb0-896b-47d2-93fe-a91a8652bfe2', '2022-03-30 17:49:38', 'Carpintería', 0, 'e0251f45-2ddf-4096-872a-99c319a09b40');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('2a3b23e5-3385-4327-a803-ea80a19baed3', '2022-03-30 17:48:01', 'Piso Poliretanico', 1, 'e0251f45-2ddf-4096-872a-99c319a09b40');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('3191b6e8-f84f-4bd9-8f7b-3116d89f30a4', '2022-03-30 17:49:45', 'Instalación Eléctrica', 0, 'e0251f45-2ddf-4096-872a-99c319a09b40');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('34ef8c42-85b1-4026-8de8-d78f5ac31550', '2022-03-30 17:47:28', 'Demoliciones', 0, 'e0251f45-2ddf-4096-872a-99c319a09b40');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('49b0aa81-f4e8-4a3d-9aa7-cd6208f30689', '2022-03-30 17:47:41', 'Desagüe Industrial', 3, 'e0251f45-2ddf-4096-872a-99c319a09b40');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('63c6be32-c9df-473b-9fa9-c068765ded0c', '2022-03-30 17:47:17', 'Tareas Previas', 0, 'e0251f45-2ddf-4096-872a-99c319a09b40');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('9db9179d-2927-4d13-b15d-b17a389008bc', '2022-03-30 17:49:53', 'Instalación de agua', 0, 'e0251f45-2ddf-4096-872a-99c319a09b40');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('ac4f8ef6-aea4-4ccf-8b53-6e80a687cfb0', '2022-03-30 17:50:00', 'Pintura', 0, 'e0251f45-2ddf-4096-872a-99c319a09b40');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('b3be546e-62c4-478a-a556-51197e25a3f2', '2022-03-30 17:48:10', 'Mampostería piso de hormigón', 30, 'e0251f45-2ddf-4096-872a-99c319a09b40');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('b91a9b5c-7440-4807-b661-8bb086395c0f', '2022-03-30 17:49:13', 'Revoques', 0, 'e0251f45-2ddf-4096-872a-99c319a09b40');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('d69f0aa3-a583-488e-af05-a25c9169409b', '2022-03-30 17:50:07', 'Limpieza de obra', 0, 'e0251f45-2ddf-4096-872a-99c319a09b40');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('da0094f1-e3eb-412a-b2ea-f8483eadfe28', '2022-03-30 17:49:21', 'Revestimientos', 2, 'e0251f45-2ddf-4096-872a-99c319a09b40');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('eda9d0b4-f7fa-4c6b-8888-f3f941e6bfbf', '2022-03-30 17:49:31', 'Cielorraso', 0, 'e0251f45-2ddf-4096-872a-99c319a09b40');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('f8386c9c-d897-480d-a37d-92408da6cb1a', '2022-03-30 17:47:51', 'Estructura de Hormigón - Piso de Hormigón', 3, 'e0251f45-2ddf-4096-872a-99c319a09b40');




INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('00c2ae12-36df-47a6-ade5-3b9de5c341fa', '2022-03-30 18:09:48', 'Llave esférica de corte 3/4', 'N/A', 3, 543.00, '9db9179d-2927-4d13-b15d-b17a389008bc');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('01f4fbb3-adf6-43ca-b98b-9e28e29c95f8', '2022-03-30 17:56:13', 'Conexión y empalme a cámara existente.', 'N/A', 6, 654.00, '49b0aa81-f4e8-4a3d-9aa7-cd6208f30689');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('07b5d9eb-ba67-4028-b39f-93f5f271aea4', '2022-03-30 17:58:16', 'Lijado preparación de subbase nivelación / pisos nuevos', 'm²', 4, 658.00, '2a3b23e5-3385-4327-a803-ea80a19baed3');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('0ef723fa-5341-47cb-8204-8d2867df31e8', '2022-03-30 18:03:06', 'Azotado de concreto c/hidrófugo', 'm²', 4, 856.00, 'b91a9b5c-7440-4807-b661-8bb086395c0f');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('1609bb27-f5bd-4c26-a0f3-e69b906038f6', '2022-03-30 18:03:35', 'Malla de Fibra de vidrio', 'm²', 2, 756.00, 'b91a9b5c-7440-4807-b661-8bb086395c0f');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('1b4306a3-fcc6-488f-b1f5-1f852b84b668', '2022-03-30 17:56:04', 'Canal de desagüe 0,30x2,10 con c/marco y reja ac.inox.', 'N/A', 4, 654.00, '49b0aa81-f4e8-4a3d-9aa7-cd6208f30689');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('371bcedc-6694-45b8-9652-a0a80b3ee43b', '2022-03-30 17:54:41', 'Demolición de mampostería de bloques', 'N/A', 4, 756.00, '34ef8c42-85b1-4026-8de8-d78f5ac31550');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('3e60129f-66bc-4f3e-b599-8cf8a4ff9519', '2022-03-30 17:53:21', 'Represent. Técnico', 'N/A', 6, 654645.00, '63c6be32-c9df-473b-9fa9-c068765ded0c');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('48934f55-c1d3-4163-8d85-8238107131ca', '2022-03-30 18:08:02', 'Puerta de abrir 0,80x2,00 tipo P1 C/CERRAD/VIDRIOS LAM/ CIERRAP.', 'N/A', 3, 756.00, '1d3debb0-896b-47d2-93fe-a91a8652bfe2');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('4e30ab9f-89c5-4773-935a-05d7f4a81a7e', '2022-03-30 18:09:18', 'Instalación cañería con 2 bocas', 'gal', 5, 756756.00, '3191b6e8-f84f-4bd9-8f7b-3116d89f30a4');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('52dee65d-59dc-4d66-8e63-a54a555dbf23', '2022-03-30 18:01:17', 'Laca antirayado', 'm²', 5, 756.00, '2a3b23e5-3385-4327-a803-ea80a19baed3');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('531db7c4-73f5-491e-be4f-05e77d26cd30', '2022-03-30 18:08:16', 'Desmontar frente 3,10x3,70', 'N/A', 6, 534.00, '1d3debb0-896b-47d2-93fe-a91a8652bfe2');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('55a8fa9f-7c71-47ae-8c1b-f0c2baae11b4', '2022-03-30 18:07:51', 'Frente vidriado de paños fijos 2,20x3,70 tipo M2', 'N/A', 6, 321.00, '1d3debb0-896b-47d2-93fe-a91a8652bfe2');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('5ecce96c-3cbe-4e2e-bb4c-5d7d3233f56f', '2022-03-30 18:10:46', 'Imprimación', 'm²', 8, 312.00, 'ac4f8ef6-aea4-4ccf-8b53-6e80a687cfb0');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('60ea34e0-b717-4100-852f-cb313bd8444f', '2022-03-30 17:54:16', 'Aserrado y demolic. Piso sobrepuesto sector Presala esp. 0,20', 'N/A', 7, 786.00, '34ef8c42-85b1-4026-8de8-d78f5ac31550');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('62f6e480-a39d-463b-9cdd-916527bb2810', '2022-03-30 18:06:43', 'Cielorraso desmontable de Placa Durlock 0,60x1,21 ', 'm²', 7, 312.00, 'eda9d0b4-f7fa-4c6b-8888-f3f941e6bfbf');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('656325a4-8352-4e1f-ae46-18deb7c32bc3', '2022-03-30 18:02:23', 'Mampostería bloques de hormigón 12x19x39 lisos estándar (19x19x39)', 'm²', 9, 46545.00, 'b3be546e-62c4-478a-a556-51197e25a3f2');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('6b9225af-92fc-4d40-8c3e-973afa15f43f', '2022-03-30 17:53:32', 'Cerramiento de aislación del sector (estructura tubular + film pe. 200mc.)30,00X4,50', 'N/A', 1, 321.00, '63c6be32-c9df-473b-9fa9-c068765ded0c');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('6eb0c9f8-9b16-4cee-b0ff-e0ed506d667e', '2022-03-30 18:10:58', 'Pintura al latex uso exterior antihongo repintado gral.', 'm²', 6, 312.00, 'ac4f8ef6-aea4-4ccf-8b53-6e80a687cfb0');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('6f8f94b9-1dfe-405f-90a4-eab5d06478e0', '2022-03-30 18:07:42', 'Frente vidriado de paños fijos 3,95x3,70 TIPO  M1', 'N/A', 3, 312.00, '1d3debb0-896b-47d2-93fe-a91a8652bfe2');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('79feb2de-a44a-4c1b-8b69-ce731bd63686', '2022-03-30 18:08:10', 'Desmontar frente 3,10x3,70', 'N/A', 2, 312.00, '1d3debb0-896b-47d2-93fe-a91a8652bfe2');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('7bb8b283-6186-4816-beb0-c03c684baf2a', '2022-03-30 18:00:43', 'Mortero de nivelación', 'm²', 2, 765.00, '2a3b23e5-3385-4327-a803-ea80a19baed3');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('7c6faee5-ef31-4e27-a707-04789f6f5c2c', '2022-03-30 18:08:24', 'Cortinas de bandas de PVC. 1,60X2,05 con soporte aº. Inox..', 'N/A', 2, 3254.00, '1d3debb0-896b-47d2-93fe-a91a8652bfe2');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('927e9cc6-12d4-42ed-9c29-3fa0bc59e0bc', '2022-03-30 18:10:27', 'Grifería tipo FV Monocomando', 'N/A', 4, 321.00, '9db9179d-2927-4d13-b15d-b17a389008bc');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('979263b2-e56a-4104-8fd4-a40ab5919239', '2022-03-30 18:02:42', 'Columnas de refuerzo con bloques 0,20x0,20x4,00  (19x19x39)', 'ml', 6, 432.00, 'b3be546e-62c4-478a-a556-51197e25a3f2');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('9e411136-f571-439b-9549-eeca2fbe01ff', '2022-03-30 18:00:57', 'Enduido poliuretánico', 'm²', 3, 432.00, '2a3b23e5-3385-4327-a803-ea80a19baed3');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('a924292c-4e04-493e-8683-e61383ae034b', '2022-03-30 18:09:35', 'Cañería termofusión 3/4"', 'ml', 7, 534.00, '9db9179d-2927-4d13-b15d-b17a389008bc');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('aa646ccb-f80a-4921-8aeb-38b466c3173b', '2022-03-30 18:10:14', 'Flexibles 1/2"', 'N/A', 2, 12.00, '9db9179d-2927-4d13-b15d-b17a389008bc');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('b3c29ed7-0861-4210-876e-56e3462b4f64', '2022-03-30 17:54:08', 'Aserrado y demolición piso de hº. Desag. Sala CIP', 'N/A', 1, 3.00, '34ef8c42-85b1-4026-8de8-d78f5ac31550');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('bb3e2b52-ed2d-4699-ad7f-0f3011f3e429', '2022-03-30 17:57:17', 'Piso de hº. ESP.0,20', 'm²', 1, 765.00, 'f8386c9c-d897-480d-a37d-92408da6cb1a');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('bcec7686-5f59-49b0-979a-f166a4ca93ee', '2022-03-30 18:03:21', 'Revoque grueso bajo revestimiento', 'm²', 3, 432.00, 'b91a9b5c-7440-4807-b661-8bb086395c0f');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('bd9cc3c3-0356-42e6-a5bf-b7633e3e71aa', '2022-03-30 17:57:35', 'Zócalo sanitario', 'ml', 1, 423.00, 'f8386c9c-d897-480d-a37d-92408da6cb1a');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('c2a863d9-21ae-41f5-9909-d3ef41bac44b', '2022-03-30 17:56:54', 'Viga encadenado sobre mampostería de bloques de hormigón 0,20x0,20', 'ml', 2, 423.00, 'f8386c9c-d897-480d-a37d-92408da6cb1a');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('c4293a08-ba96-4e8c-8d3b-dba36fedfbf8', '2022-03-30 17:54:29', 'Aserrado y nivelación piso Sala de Jugos y canaleta desag.  Esp. 0,10', 'N/A', 6, 423.00, '34ef8c42-85b1-4026-8de8-d78f5ac31550');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('d8bd8066-8589-45a3-9a37-b93433819d25', '2022-03-30 18:11:18', 'Limpieza de obra', 'hr', 1, 534.00, 'd69f0aa3-a583-488e-af05-a25c9169409b');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('e5d89aa1-c6e1-46e3-a433-b54e42cf0573', '2022-03-30 18:10:00', 'Llave de paso 1/2"', 'N/A', 2, 423.00, '9db9179d-2927-4d13-b15d-b17a389008bc');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('ef850cbb-4a67-4991-be55-bac27ae35b1c', '2022-03-30 17:52:24', 'Obrador - Baños Químicos', 'N/A', 2, 432.00, '63c6be32-c9df-473b-9fa9-c068765ded0c');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('f355d92b-8991-4f5b-a7b2-78c2a36c3b37', '2022-03-30 17:55:54', 'Cañería pvc. D:0,064', 'ml', 3, 423.00, '49b0aa81-f4e8-4a3d-9aa7-cd6208f30689');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('f72264ec-0861-4572-8139-8d7c90965b59', '2022-03-30 18:08:50', 'Canalización pared', 'm', 3, 534.00, '3191b6e8-f84f-4bd9-8f7b-3116d89f30a4');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('f9988457-9b78-440c-b484-be5f0238d8e4', '2022-03-30 17:53:12', 'Serv. Seg. Higiene', 'N/A', 2, 534.00, '63c6be32-c9df-473b-9fa9-c068765ded0c');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('fca9b39c-8ea8-4b4c-a9f5-47d191836c0f', '2022-03-30 17:56:22', 'Reconstrucción piso de hormigón esp. 0,20', 'N/A', 3, 435.00, '49b0aa81-f4e8-4a3d-9aa7-cd6208f30689');


# ==================================================productos
INSERT INTO mendozarq.categoriaproducto (uuid, creadoEn, nombre, descripcion, keyName, fileName, location, size, estado) VALUES ('0515f17a-1408-4e52-bdfc-fac22ae0652c', '2022-05-24 17:14:33', 'repisas', '', 'liraki/images/7609f49d-13f2-4dfd-a227-af171ce42c56.png', 'repisas.png', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/7609f49d-13f2-4dfd-a227-af171ce42c56.png', 173666, 1);
INSERT INTO mendozarq.categoriaproducto (uuid, creadoEn, nombre, descripcion, keyName, fileName, location, size, estado) VALUES ('0a0dfb3c-b600-4473-be3a-b79ded043822', '2022-05-24 17:17:33', 'comedores', '', 'liraki/images/ff02b45b-3bf4-462c-9e38-f820cef4add3.png', 'comedores.png', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/ff02b45b-3bf4-462c-9e38-f820cef4add3.png', 349385, 1);
INSERT INTO mendozarq.categoriaproducto (uuid, creadoEn, nombre, descripcion, keyName, fileName, location, size, estado) VALUES ('139fcae1-5f39-4f06-8456-af152672b082', '2022-05-24 17:18:48', 'escritorios', '', 'liraki/images/51541b32-d749-491d-a1c9-87f0d92d86b7.png', 'escritorios.png', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/51541b32-d749-491d-a1c9-87f0d92d86b7.png', 451873, 1);
INSERT INTO mendozarq.categoriaproducto (uuid, creadoEn, nombre, descripcion, keyName, fileName, location, size, estado) VALUES ('33ea4589-56fb-4d08-a5a1-55d676daebbb', '2022-05-24 17:17:09', 'zapateros', '', 'liraki/images/f56196b8-f064-4874-baf2-1252f517b6d3.png', 'zapateras.png', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/f56196b8-f064-4874-baf2-1252f517b6d3.png', 303815, 1);
INSERT INTO mendozarq.categoriaproducto (uuid, creadoEn, nombre, descripcion, keyName, fileName, location, size, estado) VALUES ('4284c9b8-ba48-4431-ab43-9684b0951f5d', '2022-05-24 12:26:27', 'marcos', '', 'liraki/images/50bc4542-9815-45c6-9da0-ba0fb3ab13a6.png', 'marcos.png', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/50bc4542-9815-45c6-9da0-ba0fb3ab13a6.png', 324057, 1);
INSERT INTO mendozarq.categoriaproducto (uuid, creadoEn, nombre, descripcion, keyName, fileName, location, size, estado) VALUES ('46e94a93-5511-43bc-b88d-b15525af7cbc', '2022-05-24 17:18:12', 'mesas', '', 'liraki/images/e3e86256-0a1a-48a2-9a71-f035505d21ae.png', 'mesas.png', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/e3e86256-0a1a-48a2-9a71-f035505d21ae.png', 325591, 1);
INSERT INTO mendozarq.categoriaproducto (uuid, creadoEn, nombre, descripcion, keyName, fileName, location, size, estado) VALUES ('79f1a74b-f19c-4b63-9cfd-4ed0098a2a78', '2022-05-24 17:13:27', 'cajonería de cocina', '', 'liraki/images/f93cee41-8256-47a2-aac2-700c7a30724f.png', 'cajoneria cocinas.png', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/f93cee41-8256-47a2-aac2-700c7a30724f.png', 402782, 1);
INSERT INTO mendozarq.categoriaproducto (uuid, creadoEn, nombre, descripcion, keyName, fileName, location, size, estado) VALUES ('7e15ebbf-79ea-43f4-ae37-de74a84a6735', '2022-05-24 17:16:10', 'livings', '', 'liraki/images/88558250-e088-4b90-b9b5-24f445fec361.png', 'livings.png', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/88558250-e088-4b90-b9b5-24f445fec361.png', 424593, 1);
INSERT INTO mendozarq.categoriaproducto (uuid, creadoEn, nombre, descripcion, keyName, fileName, location, size, estado) VALUES ('9097c619-6e0c-46cb-9ecb-72ecc1b6eb3b', '2022-05-24 17:15:12', 'roperos', '', 'liraki/images/e3bf63fd-e570-4568-962d-bdcf71c5bbe2.png', 'roperos.png', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/e3bf63fd-e570-4568-962d-bdcf71c5bbe2.png', 415284, 1);
INSERT INTO mendozarq.categoriaproducto (uuid, creadoEn, nombre, descripcion, keyName, fileName, location, size, estado) VALUES ('95ab02e8-a716-465f-8c91-947bf8f33906', '2022-05-24 17:12:56', 'cajonería de baño', '', 'liraki/images/3adba9be-e3e9-4c2b-90f7-a623dc698db0.png', 'cajoneria de banhos.png', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/3adba9be-e3e9-4c2b-90f7-a623dc698db0.png', 418111, 1);
INSERT INTO mendozarq.categoriaproducto (uuid, creadoEn, nombre, descripcion, keyName, fileName, location, size, estado) VALUES ('9b8bbf40-3894-4cbb-9fdd-6d9e3107018c', '2022-05-24 17:18:27', 'camas', '', 'liraki/images/433a04ba-3282-484d-a18c-02ec6881fc75.png', 'camas.png', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/433a04ba-3282-484d-a18c-02ec6881fc75.png', 408416, 1);
INSERT INTO mendozarq.categoriaproducto (uuid, creadoEn, nombre, descripcion, keyName, fileName, location, size, estado) VALUES ('9d2551ac-b73e-40b2-b88e-3820c4f3ca29', '2022-05-24 17:19:02', 'puertas', '', 'liraki/images/c4a28fca-b47f-40a4-9d66-d13811f16a64.png', 'puertas.png', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/c4a28fca-b47f-40a4-9d66-d13811f16a64.png', 510463, 1);
INSERT INTO mendozarq.categoriaproducto (uuid, creadoEn, nombre, descripcion, keyName, fileName, location, size, estado) VALUES ('db512728-2154-4df3-91e9-4a802b21632c', '2022-05-24 17:15:48', 'gaveteros', '', 'liraki/images/906b63aa-93e3-4c24-aa94-7f5fe1dbc139.png', 'gaveteros.png', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/906b63aa-93e3-4c24-aa94-7f5fe1dbc139.png', 208462, 1);
INSERT INTO mendozarq.categoriaproducto (uuid, creadoEn, nombre, descripcion, keyName, fileName, location, size, estado) VALUES ('f724fb00-fde9-46fb-a528-f5eda0dcd23b', '2022-05-24 17:13:54', 'muebles en general', '', 'liraki/images/fe78edfa-d615-4305-b700-a8aaf9ceacf3.png', 'muebles.png', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/fe78edfa-d615-4305-b700-a8aaf9ceacf3.png', 489829, 1);




INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('0050a1a6-1ee2-4ad7-9685-8b8e6292e277', '2022-05-26 14:00:05', 'Escritorio para computadora con base para teclado con dos cajones y repisas', '<li><b>MATERIAL</b><br></li>Melamina<li><b>COLOR&nbsp;</b><br></li>A elección<div><li><b>DETALLE</b><br></li>Escritorio para computadora con base para teclado con dos cajones y repisas</div><div><div><font color="#ff0000"><b>* Fabricamos a medida, espesor, color y madera a gusto del</b></font></div><div><font color="#ff0000"><b>cliente.</b></font></div></div>', 0.00, 'Bs.', 0, 0.00, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('006fe36f-1f53-49c6-b5d6-5dcca6571d42', '2022-05-27 00:25:26', 'puerta principal de doble hoja con jaladores de aluminio (maramacho)', '<li><b>MATERIAL</b><br></li>Maramacho<li><b>COLOR&nbsp;</b><br></li>A elección<br><li><b>DIMENSIONES&nbsp;</b>(Minimas Recomendadas)<br></li>2.10 x 1.10<div><li><b>ESPESOR</b><br></li>2 Pulgadas<br><li><b>DETALLE</b><br></li>Doble hoja con jaladores de aluminio<br><div><font color="#ff0000"><b>* Fabricamos a medida, espesor, color y madera a gusto del</b></font></div><div><font color="#ff0000"><b>cliente.</b></font></div></div>', 1407.00, 'Bs.', 1000, 0.00, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('02cea732-e77c-4546-b841-0fd048f15d0c', '2022-05-26 14:36:22', 'Mueble de recepción con cajones y puertas con vidrio templado en la parte superior', '<li><b>MATERIAL</b><br></li>Melamina<li><b>COLOR&nbsp;</b><br></li>A elección<div><li><b>DETALLE</b><br></li>Mueble de recepción con cajones y puertas con vidrio templado en la parte superior</div><div><div><font color="#ff0000"><b>* Fabricamos a medida, espesor, color y madera a gusto del</b></font></div><div><font color="#ff0000"><b>cliente.</b></font></div></div>', 0.00, 'Bs.', 0, 0.00, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('03819ff5-84a4-4bf2-bb23-fea2ca888a6f', '2022-05-25 16:07:40', 'Repisa para computadora con base para teclado con dos cajones y repisas', '<li><b>MATERIAL</b><br></li>Melamina<li><b>COLOR&nbsp;</b><br></li>A elección<div><li><b>DETALLE</b><br></li>Escritorio para computadora con base para teclado con dos cajones y repisas</div><div><div><font color="#ff0000"><b>* Fabricamos a medida, espesor, color y madera a gusto del</b></font></div><div><font color="#ff0000"><b>cliente.</b></font></div></div>', 0.00, 'Bs.', 0, 0.00, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('208dbcc3-caeb-401a-aec2-03c97db83495', '2022-05-26 14:05:11', 'Escritorio múltiple con cajones y jaladores de aluminio ', '<li><b>MATERIAL</b><br></li>Melamina<li><b>COLOR&nbsp;</b><br></li>A elección<div><li><b>DETALLE</b><br></li>Escritorio múltiple con cajones y jaladores de aluminio</div><div><div><font color="#ff0000"><b>* Fabricamos a medida, espesor, color y madera a gusto del</b></font></div><div><font color="#ff0000"><b>cliente.</b></font></div></div>', 0.00, 'Bs.', 0, 0.00, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('24a102fe-58cf-4de1-9063-1db1c75d9eb4', '2022-05-27 22:41:17', 'puerta acabado maciza con diseño especial (maramacho)', '<li><b>MATERIAL</b><br></li>Maramacho<li><b>COLOR&nbsp;</b><br></li>A elección<br><li><b>DIMENSIONES&nbsp;</b>(Minimas Recomendadas)<br></li>2.10 x 0.90<br><li><b>ESPESOR</b><br></li>2 Pulgadas<br><li><b>DETALLE</b><br></li>Puerta con diseño especial<br><div><font color="#ff0000"><b>* Fabricamos a medida, espesor, color y madera a gusto del</b></font></div><div><font color="#ff0000"><b>cliente.</b></font></div>', 1436.00, 'Bs.', 1000, 0.00, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('36d2421b-cbae-4dd3-aac7-4544efc9d6af', '2022-05-25 16:04:12', 'Mesa de reunión de 5 sillas con enchufe en el centro', '<li><b>MATERIAL</b><br></li>Melamina<li><b>COLOR&nbsp;</b><br></li>A elección<div><li><b>DETALLE</b><br></li>Mesa de 5 sillas con enchufe en el centro</div><div><div><font color="#ff0000"><b>* Fabricamos a medida, espesor, color y madera a gusto del</b></font></div><div><font color="#ff0000"><b>cliente.</b></font></div></div>', 0.00, 'Bs.', 0, 0.00, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('410b5731-4c04-4262-a734-b5c03c140569', '2022-05-27 10:29:12', 'puerta principal de doble hoja, 6 divisiones, aluminio o vidrio templado entre división (maramacho)', '<li><b>MATERIAL</b><br></li>Maramacho<li><b>COLOR&nbsp;</b><br></li>A elección<br><li><b>DIMENSIONES&nbsp;</b>(Minimas Recomendadas)<br></li>2.10 x 1.20<div><div><li><b>ESPESOR</b><br></li>2 Pulgadas<br><li><b>DETALLE</b><br></li>Puerta doble hoja, 6 divisiones, aluminio o vidrio templado entre división<br><div><font color="#ff0000"><b>* Fabricamos a medida, espesor, color y madera a gusto del</b></font></div><div><font color="#ff0000"><b>cliente.</b></font></div></div></div>', 1925.00, 'Bs.', 1000, 0.00, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('447bac09-6ed6-48cb-9d43-321833b91eee', '2022-05-27 22:31:17', 'puerta acabado maciza de 3 divisiones (maramacho)', '<li><b>MATERIAL</b><br></li>Maramacho<li><b>COLOR&nbsp;</b><br></li>A elección<br><li><b>DIMENSIONES&nbsp;</b>(Minimas Recomendadas)<br></li>2.10 x 0.90<br><li><b>ESPESOR</b><br></li>2 Pulgadas<br><li><b>DETALLE</b><br></li>Puerta 3 divisiones<br><div><font color="#ff0000"><b>* Fabricamos a medida, espesor, color y madera a gusto del</b></font></div><div><font color="#ff0000"><b>cliente.</b></font></div>', 1507.00, 'Bs.', 1000, 7.30, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('4d6712b0-c7f5-48f2-bfa5-305e8a766781', '2022-05-25 14:10:24', 'Mueble Odontológico con cajones y puertas batientes, jaladores de sobreponer y mampara', '<li><b>MATERIAL</b><br></li>Madera y aglomerado<li><b>COLOR&nbsp;</b><br></li>A elección<div><li><b>DETALLE</b><br></li>Puerta&nbsp; doble hoja con 6 divisiones, con vidrio opacid o aluminios</div><div><div><font color="#ff0000"><b>* Fabricamos a medida, espesor, color y madera a gusto del</b></font></div><div><font color="#ff0000"><b>cliente.</b></font></div></div>', 0.00, 'Bs.', 0, 0.00, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('72668ec0-19d6-4062-9477-45623f4f3f9a', '2022-05-26 14:13:32', 'Escritorio múltiple cajonería alta con vidrio opacid en la parte inferior dos cajones con base para computadora y teclado', '<li><b>MATERIAL</b><br></li>Melamina con vidrio opacid<li><b>COLOR&nbsp;</b><br></li>A elección<div><li><b>DETALLE</b><br></li>Escritorio múltiple cajonería alta con vidrio opacid en la parte inferior dos cajones con base para computadora y teclado</div><div><div><font color="#ff0000"><b>* Fabricamos a medida, espesor, color y madera a gusto del</b></font></div><div><font color="#ff0000"><b>cliente.</b></font></div></div>', 0.00, 'Bs.', 0, 0.00, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('7bd5774f-6174-48a9-b456-ed132353885a', '2022-05-27 23:18:40', 'puerta principal de 9 disiones con tragaluz lateral, superior vidrio (maramacho)', '<li><b>MATERIAL</b><br></li>Maramacho<li><b>COLOR&nbsp;</b><br></li>A elección<br><li><b>DIMENSIONES&nbsp;</b>(Minimas Recomendadas)<br></li>Puerta: 2.10 x 0.90<div>Tragaluz: 2.50 x 0.80<br><li><b>ESPESOR</b><br></li>2 Pulgadas<br><li><b>DETALLE</b><br></li>Puerta 9 divisiones con tragaluz lateral, superior vidrio<br><div><font color="#ff0000"><b>* Fabricamos a medida, espesor, color y madera a gusto del</b></font></div><div><font color="#ff0000"><b>cliente.</b></font></div></div>', 1407.00, 'Bs.', 1000, 0.00, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('95925ddf-95ff-4e5e-82a8-8d98cb5c7790', '2022-05-26 15:50:24', 'Mueble de recepción con cajones y puertas con granito en la parte superior con base para computadora', '<li><b>MATERIAL</b><br></li>Melamina<li><b>COLOR&nbsp;</b><br></li>A elección<div><li><b>DETALLE</b><br></li>Mueble de recepción con cajones y puertas con granito en la parte superior con base para computadora</div><div><div><font color="#ff0000"><b>* Fabricamos a medida, espesor, color y madera a gusto del</b></font></div><div><font color="#ff0000"><b>cliente.</b></font></div></div>', 0.00, 'Bs.', 0, 0.00, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('a35424cc-fd28-44ac-a604-4c4b2d628f43', '2022-05-27 13:48:46', 'puerta principal de doble hoja con 6 divisiones y vidrio opacid o aluminio (maramacho)', '<li><b>MATERIAL</b><br></li>Maramacho<li><b>COLOR&nbsp;</b><br></li>A elección<br><li><b>DIMENSIONES&nbsp;</b>(Minimas Recomendadas)<br></li>2.10 x 1.10<div><li><b>ESPESOR</b><br></li>2 Pulgadas<br><li><b>DETALLE</b><br></li>Puerta&nbsp; doble hoja con 6 divisiones, con vidrio opacid o aluminios<br><div><font color="#ff0000"><b>* Fabricamos a medida, espesor, color y madera a gusto del</b></font></div><div><font color="#ff0000"><b>cliente.</b></font></div></div>', 1851.00, 'Bs.', 1000, 0.00, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('b1cb4347-9792-4454-b9f6-a8b5db3e9ee9', '2022-05-26 14:31:47', 'Escritorio ejecutivo de 3 cajones con vidrio templado sobre el escritorio y vidrio templado en la parte frontal', '<li><b>MATERIAL</b><br></li>Trupan con vidrio templado<li><b>COLOR&nbsp;</b><br></li>A elección<div><li><b>DETALLE</b><br></li>3 cajones con vidrio templado sobre el escritorio y vidrio templado en la parte frontal</div><div><div><font color="#ff0000"><b>* Fabricamos a medida, espesor, color y madera a gusto del</b></font></div><div><font color="#ff0000"><b>cliente.</b></font></div></div>', 0.00, 'Bs.', 0, 0.00, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('b30ac8ef-ad14-477e-9f57-0fa0eba5d71d', '2022-05-27 10:20:17', 'puerta principal de doble hoja, tragaluz superior (maramacho)', '<li><b>MATERIAL</b><br></li>Maramacho<li><b>COLOR&nbsp;</b><br></li>A elección<br><li><b>DIMENSIONES&nbsp;</b>(Minimas Recomendadas)<br></li>Puerta: 2.10 x 1.20<div>Tragaluz: 0.40 x 1.20<br><div><li><b>ESPESOR</b><br></li>2 Pulgadas<br><li><b>DETALLE</b><br></li>Puerta doble hoja, tragaluz superior<br><div><font color="#ff0000"><b>* Fabricamos a medida, espesor, color y madera a gusto del</b></font></div><div><font color="#ff0000"><b>cliente.</b></font></div></div></div>', 1682.00, 'Bs.', 1000, 0.00, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('c05c67f9-8333-4c0b-b170-4929a2661085', '2022-05-26 14:08:08', 'Escritorio múltiple diversos colores con base para computadora y teclado en la parte superior repisa', '<li><b>MATERIAL</b><br></li>Trupan<li><b>COLOR&nbsp;</b><br></li>A elección<div><li><b>DETALLE</b><br></li>Escritorio múltiple diversos colores con base para computadora y teclado en la parte superior repisa para documentos</div><div><div><font color="#ff0000"><b>* Fabricamos a medida, espesor, color y madera a gusto del</b></font></div><div><font color="#ff0000"><b>cliente.</b></font></div></div>', 0.00, 'Bs.', 0, 0.00, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('cb099636-c1c2-44d5-8c25-8d18cf619e23', '2022-05-27 12:25:43', 'puerta principal de Puerta  6 divisiones, con vidrio opacid o aluminios (maramacho)', '<li><b>MATERIAL</b><br></li>Maramacho<li><b>COLOR&nbsp;</b><br></li>A elección<br><li><b>DIMENSIONES&nbsp;</b>(Minimas Recomendadas)<br></li>2.10 x 0.90<div><li><b>ESPESOR</b><br></li>2 Pulgadas<br><li><b>DETALLE</b><br></li>Puerta&nbsp; 6 divisiones, con vidrio opacid o aluminios<br><div><font color="#ff0000"><b>* Fabricamos a medida, espesor, color y madera a gusto del</b></font></div><div><font color="#ff0000"><b>cliente.</b></font></div></div>', 1368.00, 'Bs.', 1000, 0.00, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('ce1c1bf2-d9a1-449d-a02b-9b3f220f1dbb', '2022-05-27 17:40:15', 'puerta acabado maciza de 5 divisiones (maramacho)', '<li><b>MATERIAL</b><br></li>Maramacho<li><b>COLOR&nbsp;</b><br></li>A elección<br><li><b>DIMENSIONES&nbsp;</b>(Minimas Recomendadas)<br></li>2.10 x 0.90<br><li><b>ESPESOR</b><br></li>2 Pulgadas<br><li><b>DETALLE</b><br></li>Puerta 5 divisiones<br><div><font color="#ff0000"><b>* Fabricamos a medida, espesor, color y madera a gusto del</b></font></div><div><font color="#ff0000"><b>cliente.</b></font></div>', 1507.00, 'Bs.', 1000, 7.30, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('d6741f11-aa21-486a-817f-1d516c452da1', '2022-05-25 15:40:23', 'Mesa de 12 sillas con enchufe empotrado en el centro', '<li><b>MATERIAL</b><br></li>Madera maramacho<li><b>COLOR&nbsp;</b><br></li>A elección<div><li><b>DETALLE</b><br></li>Mesa estática de 12 sillas con enchufe empotrado en el centro</div><div><div><font color="#ff0000"><b>* Fabricamos a medida, espesor, color y madera a gusto del</b></font></div><div><font color="#ff0000"><b>cliente.</b></font></div></div>', 0.00, 'Bs.', 0, 0.00, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('decda335-f5d2-4987-96bf-79794f1462ab', '2022-05-27 22:27:02', 'puerta acabado maciza de 11 divisiones (maramacho)', '<li><b>MATERIAL</b><br></li>Maramacho<li><b>COLOR&nbsp;</b><br></li>A elección<br><li><b>DIMENSIONES&nbsp;</b>(Minimas Recomendadas)<br></li>2.10 x 0.90<br><li><b>ESPESOR</b><br></li>2 Pulgadas<br><li><b>DETALLE</b><br></li>Puerta 11 divisiones<br><div><font color="#ff0000"><b>* Fabricamos a medida, espesor, color y madera a gusto del</b></font></div><div><font color="#ff0000"><b>cliente.</b></font></div>', 1507.00, 'Bs.', 1000, 7.30, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('fdf00dc4-cb2b-42a0-9b63-46132723946b', '2022-05-26 14:20:19', 'Mueble de recepción con cajones y puertas con vidrio templado en la parte superior y cinta led', '<li><b>MATERIAL</b><br></li>Trupan<li><b>COLOR&nbsp;</b><br></li>A elección<div><li><b>DETALLE</b><br></li>Mueble de recepción con cajones y puertas con vidrio templado en la parte superior y cinta led</div><div><div><font color="#ff0000"><b>* Fabricamos a medida, espesor, color y madera a gusto del</b></font></div><div><font color="#ff0000"><b>cliente.</b></font></div></div>', 0.00, 'Bs.', 0, 0.00, 1);





# ======================================================logs
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2021-12-27 17:20:27', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'e3f1efed-b797-4c87-9f95-ae0a78a43384');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('I', '2021-12-27 17:22:48', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'c2af07dc-a31c-463f-b7db-a36191c6b2f3');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2021-12-27 17:23:20', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'c2af07dc-a31c-463f-b7db-a36191c6b2f3');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('D', '2021-12-27 17:23:26', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'c2af07dc-a31c-463f-b7db-a36191c6b2f3');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('D', '2021-12-27 17:23:34', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'e3f1efed-b797-4c87-9f95-ae0a78a43384');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('D', '2021-12-27 17:25:27', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'a5309073-b7ea-4916-8c04-f553e731cab7');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2021-12-27 17:25:48', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255',
        'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2021-12-27 17:27:24', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255',
        'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('I', '2021-12-27 17:27:50', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255',
        'usuario', 'mendozarq-liraki', 'd35a9834-8b89-4ad1-a266-0eafa35c3d22');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('D', '2021-12-27 17:27:55', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255',
        'usuario', 'mendozarq-liraki', 'd35a9834-8b89-4ad1-a266-0eafa35c3d22');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2021-12-27 17:33:12', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255',
        'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2021-12-27 17:33:23', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255',
        'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2021-12-27 17:39:27', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255',
        'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2021-12-27 17:39:36', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2021-12-27 17:40:05', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255',
        'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2021-12-27 17:40:43', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2021-12-27 17:41:14', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255',
        'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2021-12-27 17:41:54', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2021-12-27 17:42:12', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255',
        'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2021-12-27 17:43:47', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2021-12-27 17:47:33', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255',
        'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2021-12-29 23:44:04', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2021-12-31 22:15:49', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-01-02 23:46:33', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-01-02 23:46:37', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', '35f44215-b58f-491e-a439-4b39ea044442');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-01-17 12:29:39', null, null, 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki',
        'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-02-10 20:39:03', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255',
        'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-02-17 14:39:03', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-02-22 14:53:42', null, null, 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki',
        'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-02-22 14:54:08', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', '35f44215-b58f-491e-a439-4b39ea044442');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-02-22 14:54:33', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', '35f44215-b58f-491e-a439-4b39ea044442');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('I', '2022-03-13 13:58:05', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'b47217c5-fb5c-4441-9dd1-912d9d6e64e2');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('D', '2022-03-27 11:48:07', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'b47217c5-fb5c-4441-9dd1-912d9d6e64e2');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-03-27 11:55:41', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-03-27 11:55:55', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-03-27 18:20:12', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', '35f44215-b58f-491e-a439-4b39ea044442');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-03-27 18:20:22', '', '', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki',
        '35f44215-b58f-491e-a439-4b39ea044442');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-03-27 18:24:34', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-03-28 10:08:36', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-03-28 13:20:10', 'carmelita cabrero castillo', 'bf493a64-4573-433f-92b0-edbcae73a98b',
        'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-03-28 13:24:11', 'carmelita cabrero castillo', 'bf493a64-4573-433f-92b0-edbcae73a98b',
        'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-03-28 13:24:45', 'carmelita cabrero castillo', 'bf493a64-4573-433f-92b0-edbcae73a98b',
        'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-03-30 12:26:08', 'carmelita cabrero castillo', 'bf493a64-4573-433f-92b0-edbcae73a98b',
        'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-03-31 22:26:25', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', '36f1f6d4-163d-4856-a964-aae308769f27');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-03-31 22:27:23', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', '2319b069-bde2-452c-af94-ec08f68c722c');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-04-06 15:37:37', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-04-06 15:37:41', 'bladimir medranoo vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72');



INSERT INTO mendozarq.log_personal (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-01-11 18:01:36', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'personal', 'mendozarq', '0cdca13f-175a-4ed0-8320-650f65bf9167');
INSERT INTO mendozarq.log_personal (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('I', '2022-01-11 18:01:53', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'personal', 'mendozarq', 'eb2428e5-42d2-4ec0-bad7-4c7f50b11fcf');
INSERT INTO mendozarq.log_personal (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('D', '2022-01-11 18:01:57', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'personal', 'mendozarq', 'eb2428e5-42d2-4ec0-bad7-4c7f50b11fcf');
INSERT INTO mendozarq.log_personal (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-01-11 19:31:59', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255',
        'personal', 'mendozarq', '0cdca13f-175a-4ed0-8320-650f65bf9167');
INSERT INTO mendozarq.log_personal (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-01-11 19:32:09', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255',
        'personal', 'mendozarq', '0cdca13f-175a-4ed0-8320-650f65bf9167');
INSERT INTO mendozarq.log_personal (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-01-11 19:32:20', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255',
        'personal', 'mendozarq', '0cdca13f-175a-4ed0-8320-650f65bf9167');
INSERT INTO mendozarq.log_personal (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('I', '2022-01-11 19:33:06', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255',
        'personal', 'mendozarq', 'ea20f106-3301-4449-8acd-f5cddab39366');
INSERT INTO mendozarq.log_personal (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-01-11 19:36:53', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255',
        'personal', 'mendozarq', 'ea20f106-3301-4449-8acd-f5cddab39366');
INSERT INTO mendozarq.log_personal (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('I', '2022-01-11 19:37:09', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255',
        'personal', 'mendozarq', 'd8eb8089-3fc3-4950-b078-9f25679a6541');
INSERT INTO mendozarq.log_personal (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('D', '2022-01-11 19:37:18', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255',
        'personal', 'mendozarq', 'ea20f106-3301-4449-8acd-f5cddab39366');
INSERT INTO mendozarq.log_personal (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('I', '2022-01-12 11:25:24', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'personal', 'mendozarq', '6a08128f-06eb-432e-975d-9f43ee21c69a');
INSERT INTO mendozarq.log_personal (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('D', '2022-01-12 11:30:19', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255',
        'personal', 'mendozarq', 'd8eb8089-3fc3-4950-b078-9f25679a6541');
INSERT INTO mendozarq.log_personal (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('D', '2022-01-12 11:30:19', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255',
        'personal', 'mendozarq', '6a08128f-06eb-432e-975d-9f43ee21c69a');
INSERT INTO mendozarq.log_personal (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-02-08 23:35:12', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'personal', 'mendozarq', '0cdca13f-175a-4ed0-8320-650f65bf9167');
INSERT INTO mendozarq.log_personal (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-02-08 23:35:20', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'personal', 'mendozarq', '0cdca13f-175a-4ed0-8320-650f65bf9167');
INSERT INTO mendozarq.log_personal (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('I', '2022-03-30 23:30:25', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'personal', 'mendozarq', '6739cd0f-9e3e-4eb2-9c22-e2a60be68401');



INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-01-12 22:33:16', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('I', '2022-01-12 22:34:27', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255',
        'proyecto', 'mendozarq', '2506c130-7622-4ef7-92b3-4fb2be6080e0');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-01-12 22:34:37', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255',
        'proyecto', 'mendozarq', '2506c130-7622-4ef7-92b3-4fb2be6080e0');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('D', '2022-01-12 22:34:42', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255',
        'proyecto', 'mendozarq', '2506c130-7622-4ef7-92b3-4fb2be6080e0');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-02-08 23:42:49', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-02-08 23:43:56', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-02-09 20:49:14', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-02-11 13:58:45', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-02-11 13:59:05', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-02-11 14:00:07', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-02-11 14:00:37', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('I', '2022-02-15 18:35:38', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '5f1c430d-cda9-4ee8-aa58-b011c3544567');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('D', '2022-03-30 17:01:27', '', '', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq',
        '5f1c430d-cda9-4ee8-aa58-b011c3544567');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('I', '2022-03-30 21:51:37', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '8ee6d457-1315-4c9b-bfae-7d7e04ac75a8');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-03-31 21:38:59', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '8ee6d457-1315-4c9b-bfae-7d7e04ac75a8');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-04-06 09:45:05', null, null, 'DESKTOP-0D2F255', 'proyecto', 'mendozarq',
        '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-04-06 09:46:38', '', '', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq',
        '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-04-06 09:47:19', '', '', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq',
        '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-04-06 09:48:06', '', '', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq',
        '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-04-06 09:48:48', '', '', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq',
        '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-04-06 10:34:53', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '8ee6d457-1315-4c9b-bfae-7d7e04ac75a8');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-04-06 10:35:05', '', '', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq',
        '8ee6d457-1315-4c9b-bfae-7d7e04ac75a8');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-04-06 10:35:33', '', '', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq',
        '8ee6d457-1315-4c9b-bfae-7d7e04ac75a8');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-04-06 10:35:43', '', '', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq',
        '8ee6d457-1315-4c9b-bfae-7d7e04ac75a8');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-04-06 13:35:38', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-04-06 13:38:59', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-04-06 13:39:03', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-04-06 13:39:08', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-04-06 13:39:19', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-04-06 13:40:24', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-04-06 13:40:29', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-04-06 15:05:53', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-04-06 15:05:59', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-04-06 15:06:07', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-04-06 15:06:18', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-04-06 15:08:03', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-04-06 15:08:09', '', '', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq',
        '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-04-06 15:12:57', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '8ee6d457-1315-4c9b-bfae-7d7e04ac75a8');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-04-06 15:13:01', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '8ee6d457-1315-4c9b-bfae-7d7e04ac75a8');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-04-06 15:15:03', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '8ee6d457-1315-4c9b-bfae-7d7e04ac75a8');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-04-06 15:15:15', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '8ee6d457-1315-4c9b-bfae-7d7e04ac75a8');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-04-06 15:16:18', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '8ee6d457-1315-4c9b-bfae-7d7e04ac75a8');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-04-06 15:16:26', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '8ee6d457-1315-4c9b-bfae-7d7e04ac75a8');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-04-06 15:16:32', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '8ee6d457-1315-4c9b-bfae-7d7e04ac75a8');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-04-06 15:16:50', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '8ee6d457-1315-4c9b-bfae-7d7e04ac75a8');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-04-06 15:17:51', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '8ee6d457-1315-4c9b-bfae-7d7e04ac75a8');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-04-06 15:17:55', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '8ee6d457-1315-4c9b-bfae-7d7e04ac75a8');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-04-06 15:18:05', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '8ee6d457-1315-4c9b-bfae-7d7e04ac75a8');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-04-06 15:18:47', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '8ee6d457-1315-4c9b-bfae-7d7e04ac75a8');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-04-06 15:19:28', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '8ee6d457-1315-4c9b-bfae-7d7e04ac75a8');



INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('U', '2022-01-12 22:36:45', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255',
        'documentos', 'mendozarq', '808d6b68-db2f-46d9-b58a-fdd522da1fee');
INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('I', '2022-01-12 22:38:25', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255',
        'documentos', 'mendozarq', 'a7680150-1213-4048-961e-6dea49772863');
INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('I', '2022-01-12 22:38:40', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255',
        'documentos', 'mendozarq', 'db7878c5-c66d-4d4d-b62f-b89a4123ac5c');
INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('I', '2022-01-12 22:38:40', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255',
        'documentos', 'mendozarq', 'd41aa38e-2bbd-4fd7-bd2e-2289cc290381');
INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('I', '2022-01-12 22:38:40', null, null, 'DESKTOP-0D2F255', 'documentos', 'mendozarq',
        '410e2fc7-f88b-4b46-b5f8-de017ef478e0');
INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('I', '2022-01-12 22:38:59', '', '', 'DESKTOP-0D2F255', 'documentos', 'mendozarq',
        '694c97e2-f7ac-41a0-ac13-d6565ae4e022');
INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('I', '2022-01-12 22:38:59', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255',
        'documentos', 'mendozarq', 'dcf2f930-f372-4c80-80da-5d87142c5d34');
INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('I', '2022-01-12 22:38:59', '', '', 'DESKTOP-0D2F255', 'documentos', 'mendozarq',
        '4aa83608-70f8-44b9-9046-6217234a61a8');
INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('D', '2022-01-12 22:39:24', '', '', 'DESKTOP-0D2F255', 'documentos', 'mendozarq',
        '4aa83608-70f8-44b9-9046-6217234a61a8');
INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('D', '2022-01-12 22:39:29', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255',
        'documentos', 'mendozarq', '694c97e2-f7ac-41a0-ac13-d6565ae4e022');
INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('D', '2022-01-12 22:39:32', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255',
        'documentos', 'mendozarq', 'dcf2f930-f372-4c80-80da-5d87142c5d34');
INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('D', '2022-01-12 22:39:35', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255',
        'documentos', 'mendozarq', '410e2fc7-f88b-4b46-b5f8-de017ef478e0');
INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('D', '2022-01-12 22:39:37', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255',
        'documentos', 'mendozarq', 'd41aa38e-2bbd-4fd7-bd2e-2289cc290381');
INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('D', '2022-01-12 22:39:41', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255',
        'documentos', 'mendozarq', 'db7878c5-c66d-4d4d-b62f-b89a4123ac5c');
INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('D', '2022-01-17 11:34:10', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'documentos', 'mendozarq', 'a7680150-1213-4048-961e-6dea49772863');
INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('I', '2022-02-12 00:10:06', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'documentos', 'mendozarq', '31e1a469-31a7-4a33-b2e6-ea4565318446');
INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('D', '2022-02-12 00:10:13', '', '', 'DESKTOP-0D2F255', 'documentos', 'mendozarq',
        '31e1a469-31a7-4a33-b2e6-ea4565318446');
INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('I', '2022-02-14 10:49:30', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'documentos', 'mendozarq', '0e62490b-8444-48d1-80f0-0994595574bf');
INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('I', '2022-02-17 14:44:43', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'documentos', 'mendozarq', '32db189a-2d87-45ff-9eb4-7a8cf78b2d17');
INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('I', '2022-02-17 14:44:44', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'documentos', 'mendozarq', '083fe6e4-aea9-4b65-883c-66384a0a0d43');
INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('I', '2022-04-04 23:02:14', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'documentos', 'mendozarq', 'a7b80b1b-f166-4639-abe3-c40f41553d4c');
INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('D', '2022-04-04 23:18:26', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'documentos', 'mendozarq', '079424f6-ec39-4dea-b8c4-54cde87636ad');
INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow)
VALUES ('D', '2022-04-05 17:05:21', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72',
        'DESKTOP-0D2F255', 'documentos', 'mendozarq', 'a7b80b1b-f166-4639-abe3-c40f41553d4c');


