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
    latLng text default '-17.401848609775207, -66.18253244641603',
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
# ============================================================================= planificacion
CREATE TRIGGER insert_capituloPlanificacion_trigger
    AFTER
        INSERT
    ON capituloPlanificacionProyecto
    FOR EACH ROW
BEGIN
    UPDATE proyecto as p
        INNER JOIN planificacionProyecto pp on p.uuid = pp.uuidProyecto
        INNER JOIN capituloPlanificacionProyecto cpp on pp.uuid = cpp.uuidPlanificacionProyecto
    SET porcentaje = (SELECT (sum(cp.avance) / (100 * count(cp.avance))) * 100
                      FROM capituloPlanificacionProyecto as cp
                      where cp.uuidPlanificacionProyecto = NEW.uuidPlanificacionProyecto)
    WHERE cpp.uuidPlanificacionProyecto =  NEW.uuidPlanificacionProyecto;
END;

CREATE TRIGGER update_capituloPlanificacion_trigger
    AFTER
        UPDATE
    ON capituloPlanificacionProyecto
    FOR EACH ROW
BEGIN
    UPDATE proyecto as p
        INNER JOIN planificacionProyecto pp on p.uuid = pp.uuidProyecto
        INNER JOIN capituloPlanificacionProyecto cpp on pp.uuid = cpp.uuidPlanificacionProyecto
    SET porcentaje = (SELECT (sum(cp.avance) / (100 * count(cp.avance))) * 100
                      FROM capituloPlanificacionProyecto as cp
                      where cp.uuidPlanificacionProyecto = NEW.uuidPlanificacionProyecto)
    WHERE cpp.uuidPlanificacionProyecto =  NEW.uuidPlanificacionProyecto;
END;

CREATE TRIGGER delete_capituloPlanificacion_trigger
    AFTER
        DELETE
    ON capituloPlanificacionProyecto
    FOR EACH ROW
BEGIN
    UPDATE proyecto as p
        INNER JOIN planificacionProyecto pp on p.uuid = pp.uuidProyecto
        INNER JOIN capituloPlanificacionProyecto cpp on pp.uuid = cpp.uuidPlanificacionProyecto
    SET porcentaje = (SELECT (sum(cp.avance) / (100 * count(cp.avance))) * 100
                      FROM capituloPlanificacionProyecto as cp
                      where cp.uuidPlanificacionProyecto = OLD.uuidPlanificacionProyecto)
    WHERE cpp.uuidPlanificacionProyecto =  OLD.uuidPlanificacionProyecto;
END;



CREATE TRIGGER insert_tareaPlanificacion_trigger
    AFTER
        INSERT
    ON tareaplanificacionproyecto
    FOR EACH ROW
BEGIN
    UPDATE capituloplanificacionproyecto as cp
    INNER JOIN tareaplanificacionproyecto t on cp.uuid = t.uuidCapitulo
    SET cp.avance = (SELECT (sum(t.avance) / (100 * count(t.avance))) * 100
                      FROM tareaplanificacionproyecto as t
                      where t.uuidCapitulo = NEW.uuidCapitulo)
    WHERE cp.uuid =  NEW.uuidCapitulo;
END;


CREATE TRIGGER update_tareaPlanificacion_trigger
    AFTER
        UPDATE
    ON tareaplanificacionproyecto
    FOR EACH ROW
BEGIN
    UPDATE capituloplanificacionproyecto as cp
    INNER JOIN tareaplanificacionproyecto t on cp.uuid = t.uuidCapitulo
    SET cp.avance = (SELECT (sum(t.avance) / (100 * count(t.avance))) * 100
                      FROM tareaplanificacionproyecto as t
                      where t.uuidCapitulo = NEW.uuidCapitulo)
    WHERE cp.uuid =  NEW.uuidCapitulo;
END;


CREATE TRIGGER delete_tareaPlanificacion_trigger
    AFTER
        DELETE
    ON tareaplanificacionproyecto
    FOR EACH ROW
BEGIN
    UPDATE capituloplanificacionproyecto as cp
    INNER JOIN tareaplanificacionproyecto t on cp.uuid = t.uuidCapitulo
    SET cp.avance = (SELECT (sum(t.avance) / (100 * count(t.avance))) * 100
                      FROM tareaplanificacionproyecto as t
                      where t.uuidCapitulo = OLD.uuidCapitulo)
    WHERE cp.uuid =  OLD.uuidCapitulo;
END;





INSERT INTO mendozarq.usuario (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo, username, contrasenha, rol, activo) VALUES ('0976bfba-6a2a-4405-8bfe-2474a21f1e25', '2021-11-24 20:30:52', 'evaristo', 'del', 'gelabert', 67891432, '3896 Gil Ferrocarril
    ', 'Lilia_Anaya@corpfolder.com', 'evari8pni9', '$2b$10$FeSC4PFsq3lmOHThfgutaOqwMNdWPtwDL5wzr69klCsu9MYEsMWkW', 'cliente', 1);
INSERT INTO mendozarq.usuario (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo, username, contrasenha, rol, activo) VALUES ('178e1faa-b3f0-4900-a7b5-a19085c0cf9c', '2021-11-24 20:29:26', 'salomón', 'ruano', '', 72686187, '4265 Korta hernandez Vía Pública
    ', 'Francisco_Santana@yahoo.com', 'salomo1ydq', '$2b$10$MKlyLpWKHpnwOglfWDOMfeCnT0zwwFKXPEnWbyb7WZvyGTxo0HCiu', 'cliente', 1);
INSERT INTO mendozarq.usuario (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo, username, contrasenha, rol, activo) VALUES ('2319b069-bde2-452c-af94-ec08f68c722c', '2021-11-24 20:39:52', 'leandra', 'villa', 'jordán', 74568926, '817 Tamayo Grupo
    ', 'XimenaGuadalupe18@yahoo.com', 'leandhbal2', '$2b$10$z/ujjtN5Oxbn1pDmOLW/BOjuXwZFSyD9h6exRmx644m19OmkktU9G', 'vendedor', 1);
INSERT INTO mendozarq.usuario (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo, username, contrasenha, rol, activo) VALUES ('35f44215-b58f-491e-a439-4b39ea044442', '2021-11-24 20:42:26', 'sergio', 'olivé', 'lerma', 70045451, '9431 Contreras Puente
    ', 'Aarn.Gaitn22@example.com', 'sergimbswp', '$2b$10$ix0pSZUTSrJPnXcMfRxsCeuwS8RgwaEXRojgpxf.dD.yP2Ulsi1N2', 'administrador', 1);
INSERT INTO mendozarq.usuario (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo, username, contrasenha, rol, activo) VALUES ('36f1f6d4-163d-4856-a964-aae308769f27', '2021-11-24 20:39:06', 'severiano', 'peña', 'campillo', 66365952, '3803 Miranda Vía Pública
    ', 'Jorge.Tello@corpfolder.com', 'severx0md2', '$2b$10$1gKBcTW.CzxQB2kmJ8slqeu4kHTpgbgfOBCFOWoDML9siHcVb0qtu', 'arquitecto', 1);
INSERT INTO mendozarq.usuario (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo, username, contrasenha, rol, activo) VALUES ('4655d3ef-55cb-4579-9776-7f39377f5368', '2021-11-24 20:34:38', 'josé', 'figueroa', 'ibáñez', 62256672, '931 Miranda Rambla
    ', 'Gabriela_Zelaya97@gmail.com', 'joséijvxca', '$2b$10$h0hwzjwGhhLlQDgosMOfM.fwVWmSatBoQ3VY1Yv6dp1Chi0oP8f.G', 'arquitecto', 1);
INSERT INTO mendozarq.usuario (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo, username, contrasenha, rol, activo) VALUES ('665d2f27-32f8-4ac2-81fc-f972bcfdce78', '2021-11-24 20:37:57', 'evangelina', 'molina', 'mercader', 66383117, '077 Negrete Gran Subida
    ', 'JosAntonio_Cazares68@hotmail.com', 'evang2vu74', '$2b$10$ttZEYszXxEAIMJv9J23bOuSQ9c1LNsKRLa5HGcvlphXC0z7D1YYRK', 'arquitecto', 1);
INSERT INTO mendozarq.usuario (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo, username, contrasenha, rol, activo) VALUES ('7a617f2c-0ca0-49be-a3f0-e77555174af0', '2021-11-24 20:30:03', 'máximo', 'acedo', 'morillo', 72807533, '2311 Rosado Pasaje
    ', 'Toms_Quintana25@corpfolder.com', 'máximcrvd7', '$2b$10$JjJc.uMBp1qckLkFtTreueK2c6i6Rk9vJ4Ugp16Y9FyyYA66O6t8O', 'cliente', 1);
INSERT INTO mendozarq.usuario (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo, username, contrasenha, rol, activo) VALUES ('7ec2091c-abf2-4025-a207-3bbf04a5a8b9', '2021-11-24 20:33:29', 'elodia', 'falcón', 'larrañaga', 68966636, '1757 Juárez Senda
    ', 'Dorotea92@corpfolder.com', 'elodib0825', '$2b$10$NF6FJ62itir9Mbqqdl3YBeZSoaiMzz3FgihI/w0tsw9Sb4SwVe2ie', 'cliente', 1);
INSERT INTO mendozarq.usuario (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo, username, contrasenha, rol, activo) VALUES ('81ed9811-5b7a-4316-8e9d-7081df740265', '2021-11-24 20:28:59', 'lina', 'sáenz', 'ribes', 78389801, '4988 Mondragón Rincón
    ', 'Blanca_Orellana63@corpfolder.com', 'lina1tpy7e', '$2b$10$W14t6MNoWIk5XHGUrra.GeSDtGXl6Bkk43sc7Wa1T1AvdF./6erX.', 'cliente', 1);
INSERT INTO mendozarq.usuario (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo, username, contrasenha, rol, activo) VALUES ('81f19377-6c68-4bdc-9e38-d1c47b68c0c6', '2021-11-24 20:38:31', 'néstor', 'almazán', 'azorin', 64046915, '98208 Yamileth Grupo
    ', 'Mariana97@yahoo.com', 'nésto42u7t', '$2b$10$GEtu3VwvQjwcAuRbSjpzguT1ry5py7mCx0hVL/T68kVtsD3DMKKtC', 'arquitecto', 1);
INSERT INTO mendozarq.usuario (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo, username, contrasenha, rol, activo) VALUES ('8faf0153-fd37-4096-ba58-5592c24eed5a', '2021-11-24 20:35:34', 'dafne', 'escamilla', 'miralles', 63598297, '6104 Aranda Manzana
    ', 'Mercedes.Ayala1@nearbpo.com', 'dafne44lha', '$2b$10$PCG9pfLytv7.6MszgE13N.aMTdDGhvEe8GiHbZaq8HXgPa/bc51z6', 'arquitecto', 1);
INSERT INTO mendozarq.usuario (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo, username, contrasenha, rol, activo) VALUES ('942246e6-f202-47f9-9db6-c067a33707eb', '2021-11-24 20:28:01', 'celia', 'cerdán', 'benavides', 64859213, '45267 Roldán Subida
    ', 'Anita10@corpfolder.com', 'celia4w8yf', '$2b$10$4SXxEZImtgfJzKvWjI9dj.9.ThA91zs94tr9LPOiLmGl8wQM4k54W', 'cliente', 1);
INSERT INTO mendozarq.usuario (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo, username, contrasenha, rol, activo) VALUES ('a5b86b62-0ef8-4d23-a2f8-a242daa25103', '2021-11-24 20:31:43', 'angelino octavio', 'pintor', 'benavides', 70283107, '1953 Axel Huerta
    ', 'Rosario_Narvez@hotmail.com', 'angelleftz', '$2b$10$qfGFexEXzfnl/jR4QMHR8u7xg2fuoJ15302yvD7yi0cS1dtKR3eli', 'cliente', 1);
INSERT INTO mendozarq.usuario (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo, username, contrasenha, rol, activo) VALUES ('bf493a64-4573-433f-92b0-edbcae73a98b', '2021-11-24 20:45:00', 'carmelita', 'cabrero', 'castillo', 75176717, '81863 Pelayo Parque sdsadasdas', 'Mercedes67@yahoo.com', 'carmeky8ka', '$2b$10$0QPVaM7NGiSNm1neCyTIU.vQeF/jTOhpA9MYUhQLZORb7wVIgb5ku', 'cliente', 1);
INSERT INTO mendozarq.usuario (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo, username, contrasenha, rol, activo) VALUES ('ce754db3-3b9c-4dd5-81f1-ae2b5f5a060a', '2021-11-24 20:27:02', 'juan', 'sobrino', 'suárez', 68101913, '77864 Enrique Colonia', 'Diego82@corpfolder.com', 'juannwfqjc', '$2b$10$EXWxE8u0VCeScF8pbeP4Me0.1JqHYdXVO4Fp2jbLxdmJj/ASVZ.cu', 'cliente', 1);
INSERT INTO mendozarq.usuario (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo, username, contrasenha, rol, activo) VALUES ('fa27b5b3-837b-4486-b2cd-c6a306e8bd72', '2021-11-24 20:40:00', 'bladimir', 'medrano', 'vargas', 69509449, 'Av segunda entre marina nunez del prado y calle greco.', 'bladimilmedranoblod@gmail.com', 'blado959', '$2b$10$Ejt7X/epAQ2kfChOFJa9T.apOjSfTR2xkMWOoIfWWKT4JFh8CDu.C', 'administrador', 1);









INSERT INTO mendozarq.personal (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo, descripcion, sueldo, moneda, activo) VALUES ('0cdca13f-175a-4ed0-8320-650f65bf9167', '2021-10-07 21:21:17', 'juan', 'perez', 'mendez', 7762509, 'avenida aroma entre calle nose y avenida alguna ', 'suarez@gmail.com', 'personal de construccion', 2500.00, 'bs', 1);
INSERT INTO mendozarq.personal (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo, descripcion, sueldo, moneda, activo) VALUES ('122573dc-a098-45f7-8509-c54acf58e9c3', '2022-06-23 15:26:37', 'mario', 'mendez', 'mercado', 76393092, '', 'mariogg@gmail.com', 'personal de construccion', 0.00, 'bs', 1);
INSERT INTO mendozarq.personal (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo, descripcion, sueldo, moneda, activo) VALUES ('471c2837-6d59-43c2-ac1e-81a56f7a3d03', '2022-06-23 15:30:18', 'henry', 'andia', 'perez', 73532763, 'avenida tadeo h. y avenida segunda', 'henry.andia.p@gmail.com', 'personal de construccion', 0.00, 'bs', 1);
INSERT INTO mendozarq.personal (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo, descripcion, sueldo, moneda, activo) VALUES ('6739cd0f-9e3e-4eb2-9c22-e2a60be68401', '2022-03-30 23:30:25', 'alvaro', 'mendez', 'castro', 7324341, '', 'mendez@gmail.com', 'personal de contruccion', 0.00, 'bs', 1);
INSERT INTO mendozarq.personal (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo, descripcion, sueldo, moneda, activo) VALUES ('a2f0a1c4-06d9-4459-9283-49cf3460f9e1', '2022-06-23 15:28:18', 'javier ', 'huanca ', 'mamani', 68390943, 'avenida calama y antezana #234', 'huanca.mamani@gmail.com', 'personde de construccion', 0.00, 'bs', 1);




INSERT INTO mendozarq.recurso (uuid, creadoEn, nombre, descripcion, tipoRecurso, area, precioUnitario, precioPorMayor) VALUES ('1418f895-97f6-4fa9-aff3-3d5a7e14d822', '2022-06-28 22:10:17', 'Fierro de 1/2', '', 'material_de_construccion', 'mendozarq', 120.00, 100.00);
INSERT INTO mendozarq.recurso (uuid, creadoEn, nombre, descripcion, tipoRecurso, area, precioUnitario, precioPorMayor) VALUES ('1d1ddbb2-5410-4866-860b-d358e477fbf4', '2022-06-28 21:40:32', 'Madera maramacho', '', 'materia_prima', 'liraki', 100.00, 50.00);
INSERT INTO mendozarq.recurso (uuid, creadoEn, nombre, descripcion, tipoRecurso, area, precioUnitario, precioPorMayor) VALUES ('93ad39ff-dfd4-4bc2-a498-ffa17f5c8562', '2022-06-28 22:11:27', 'Madera blanca (comun)', '', 'materia_prima', 'mendoraki', 40.00, 20.00);
INSERT INTO mendozarq.recurso (uuid, creadoEn, nombre, descripcion, tipoRecurso, area, precioUnitario, precioPorMayor) VALUES ('cb1c84f8-53c1-4004-b9b9-9f0377b2a29c', '2022-06-28 22:09:20', 'Cemento camba', '', 'material_de_construccion', 'mendozarq', 70.00, 50.00);
INSERT INTO mendozarq.recurso (uuid, creadoEn, nombre, descripcion, tipoRecurso, area, precioUnitario, precioPorMayor) VALUES ('daefbd72-4d1b-4b07-9263-0651ff56d389', '2022-06-28 22:08:40', 'Madera Roble', '', 'materia_prima', 'mendozarq', 300.00, 200.00);


INSERT INTO mendozarq.proveedor (uuid, creadoEn, nombre, celular, direccion, descripcion, uuidRecurso) VALUES ('5a1f17ec-2407-4425-b0db-de8da589429f', '2022-06-28 22:18:20', 'Importadora S.W.E', 44889218, 'Avenida blanco galindo N#634', '', 'cb1c84f8-53c1-4004-b9b9-9f0377b2a29c');
INSERT INTO mendozarq.proveedor (uuid, creadoEn, nombre, celular, direccion, descripcion, uuidRecurso) VALUES ('91df8f28-07dd-4c91-8ae4-3571ecf63901', '2022-06-28 22:14:15', 'Campero', 69840333, 'Avenida blanco galindo Nº 455', '', '1418f895-97f6-4fa9-aff3-3d5a7e14d822');
INSERT INTO mendozarq.proveedor (uuid, creadoEn, nombre, celular, direccion, descripcion, uuidRecurso) VALUES ('d0ac2233-7e26-4874-9453-74e7325fa88c', '2022-06-28 22:16:23', 'Aserradero la bolivianita', 69823923, 'Avenida segunda entre calle G. acha y M. Ramirez', '', '93ad39ff-dfd4-4bc2-a498-ffa17f5c8562');




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
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('02718e83-f899-4242-97c2-ae550e750683', '2022-06-29 11:47:00', 'Puerta vidriera con vidrio crudo opacid', '<li _ngcontent-vgw-c368=""><b _ngcontent-vgw-c368="">Material</b><br _ngcontent-vgw-c368=""></li><div _ngcontent-vgw-c368="">Maramacho</div><li _ngcontent-vgw-c368=""><b _ngcontent-vgw-c368="">Dimensiones</b><br _ngcontent-vgw-c368=""></li><div _ngcontent-vgw-c368="">2.10 x 0.90</div><div _ngcontent-vgw-c368=""><li _ngcontent-vgw-c368=""><b>Espesor</b></li><div _ngcontent-vgw-c368="">2 pulgadas</div></div><div _ngcontent-vgw-c368=""><div _ngcontent-vgw-c368=""><li _ngcontent-vgw-c368=""><b _ngcontent-vgw-c368="">COLOR&nbsp;</b><br _ngcontent-vgw-c368=""></li><div _ngcontent-vgw-c368="">A elección</div><div _ngcontent-vgw-c368=""><li _ngcontent-vgw-c368=""><b _ngcontent-vgw-c368="">DETALLE</b><br _ngcontent-vgw-c368=""></li> Puerta con vidrio crudo opacid</div></div><div _ngcontent-vgw-c368=""><font _ngcontent-vgw-c368="" color="#ff0000"><b _ngcontent-vgw-c368="">* Fabricamos a medida, espesor, color y madera a gusto del</b><br _ngcontent-vgw-c368=""></font></div><div _ngcontent-vgw-c368=""><font _ngcontent-vgw-c368="" color="#ff0000"><b _ngcontent-vgw-c368="">cliente.</b></font></div></div>', 887.00, 'Bs.', 1000, 7.60, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('02cea732-e77c-4546-b841-0fd048f15d0c', '2022-05-26 14:36:22', 'Mueble de recepción con cajones y puertas con vidrio templado en la parte superior', '<li><b>MATERIAL</b><br></li>Melamina<li><b>COLOR&nbsp;</b><br></li>A elección<div><li><b>DETALLE</b><br></li>Mueble de recepción con cajones y puertas con vidrio templado en la parte superior</div><div><div><font color="#ff0000"><b>* Fabricamos a medida, espesor, color y madera a gusto del</b></font></div><div><font color="#ff0000"><b>cliente.</b></font></div></div>', 0.00, 'Bs.', 0, 0.00, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('03819ff5-84a4-4bf2-bb23-fea2ca888a6f', '2022-05-25 16:07:40', 'Repisa para computadora con base para teclado con dos cajones y repisas', '<li><b>MATERIAL</b><br></li>Melamina<li><b>COLOR&nbsp;</b><br></li>A elección<div><li><b>DETALLE</b><br></li>Escritorio para computadora con base para teclado con dos cajones y repisas</div><div><div><font color="#ff0000"><b>* Fabricamos a medida, espesor, color y madera a gusto del</b></font></div><div><font color="#ff0000"><b>cliente.</b></font></div></div>', 0.00, 'Bs.', 0, 0.00, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('0ffbfaa6-a0f3-4374-afda-a7dee8bd8618', '2022-06-15 22:56:52', 'Comedor Sirius (6 sillas)', '<li><b>Material</b><br></li><div><div>Madera maramacho</div><div><div><li><b>COLOR&nbsp;</b><br></li><div>A elección<div><li><b>DETALLE</b><br></li>Mesa reactangular con 6 sillas tapiz con tela americana</div></div></div><div><font color="#ff0000"><b>* Fabricamos a medida, espesor, color y madera a gusto del</b><br></font></div><div><font color="#ff0000"><b>cliente.</b></font></div></div></div>', 6000.00, 'Bs.', 1000, 0.00, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('208dbcc3-caeb-401a-aec2-03c97db83495', '2022-05-26 14:05:11', 'Escritorio múltiple con cajones y jaladores de aluminio ', '<li><b>MATERIAL</b><br></li>Melamina<li><b>COLOR&nbsp;</b><br></li>A elección<div><li><b>DETALLE</b><br></li>Escritorio múltiple con cajones y jaladores de aluminio</div><div><div><font color="#ff0000"><b>* Fabricamos a medida, espesor, color y madera a gusto del</b></font></div><div><font color="#ff0000"><b>cliente.</b></font></div></div>', 0.00, 'Bs.', 0, 0.00, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('24a102fe-58cf-4de1-9063-1db1c75d9eb4', '2022-05-27 22:41:17', 'puerta acabado maciza con diseño especial (maramacho)', '<li><b>MATERIAL</b><br></li>Maramacho<li><b>COLOR&nbsp;</b><br></li>A elección<br><li><b>DIMENSIONES&nbsp;</b>(Minimas Recomendadas)<br></li>2.10 x 0.90<br><li><b>ESPESOR</b><br></li>2 Pulgadas<br><li><b>DETALLE</b><br></li>Puerta con diseño especial<br><div><font color="#ff0000"><b>* Fabricamos a medida, espesor, color y madera a gusto del</b></font></div><div><font color="#ff0000"><b>cliente.</b></font></div>', 1436.00, 'Bs.', 1000, 0.00, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('2a04a96f-5b41-4140-ab9a-94ed38a75d6e', '2022-06-10 11:47:16', 'Estante con esquinero y cajones ', '<li><b>MATERIAL</b><br></li>Melamina<li><b>COLOR&nbsp;</b><br></li>A elección<div><li><b>DETALLE</b><br></li>Estante con esquinero y cajones con jaladores de aluminio</div><div><div><font color="#ff0000"><b>* Fabricamos a medida, espesor, color y madera a gusto del</b></font></div><div><font color="#ff0000"><b>cliente.</b></font></div></div>', 0.00, 'Bs.', 0, 0.00, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('2d078933-ff74-43ae-8322-fc19ba53b39c', '2022-06-28 21:30:51', 'Vestidor de melamina con puertas vaivén ', '<li _ngcontent-wct-c311=""><b _ngcontent-wct-c311="">Material</b><br _ngcontent-wct-c311=""></li><div _ngcontent-wct-c311="">Melamina</div><div _ngcontent-wct-c311=""><div _ngcontent-wct-c311=""><li _ngcontent-wct-c311=""><b _ngcontent-wct-c311="">COLOR&nbsp;</b><br _ngcontent-wct-c311=""></li><div _ngcontent-wct-c311="">A elección</div><div _ngcontent-wct-c311=""><li _ngcontent-wct-c311=""><b _ngcontent-wct-c311="">DETALLE</b><br _ngcontent-wct-c311=""></li>Vestidor con puertas vaivén, jaladores de aluminio con zapatero en la parte inferior.</div></div><div _ngcontent-wct-c311=""><font _ngcontent-wct-c311="" color="#ff0000"><b _ngcontent-wct-c311="">* Fabricamos a medida, espesor, color y madera a gusto del</b><br _ngcontent-wct-c311=""></font></div><div _ngcontent-wct-c311=""><font _ngcontent-wct-c311="" color="#ff0000"><b _ngcontent-wct-c311="">cliente.</b></font></div></div>', 0.00, 'Bs.', 0, 0.00, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('353f7727-3130-46a3-be67-92ab0896a630', '2022-06-15 22:34:26', 'Mesa redonda phoenix de 6 sillas ', '<li><b>MATERIAL</b><br></li>Madera Maramacho<li><b>Dimensiones</b></li>Mesa de 4 sillas: 105 cm<div><li><b>COLOR&nbsp;</b><br></li>A elección<div><li><b>DETALLE</b><br></li>Mesa redonda de 4 sillas con tapiz con tela americana guindo terracota</div><div><div><font color="#ff0000"><b>* Fabricamos a medida, espesor, color y madera a gusto del</b></font></div><div><font color="#ff0000"><b>cliente.</b></font></div></div></div>', 3800.00, 'Bs.', 994, 0.00, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('36d2421b-cbae-4dd3-aac7-4544efc9d6af', '2022-05-25 16:04:12', 'Mesa de reunión de 5 sillas con enchufe en el centro', '<li><b>MATERIAL</b><br></li>Melamina<li><b>COLOR&nbsp;</b><br></li>A elección<div><li><b>DETALLE</b><br></li>Mesa de 5 sillas con enchufe en el centro</div><div><div><font color="#ff0000"><b>* Fabricamos a medida, espesor, color y madera a gusto del</b></font></div><div><font color="#ff0000"><b>cliente.</b></font></div></div>', 0.00, 'Bs.', 0, 0.00, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('410b5731-4c04-4262-a734-b5c03c140569', '2022-06-29 12:29:12', 'puerta principal de doble hoja, 6 divisiones, aluminio o vidrio templado entre división (maramacho)', '<li><b>MATERIAL</b><br></li>Maramacho<li><b>COLOR&nbsp;</b><br></li>A elección<br><li><b>DIMENSIONES&nbsp;</b>(Minimas Recomendadas)<br></li>2.10 x 1.20<div><div><li><b>ESPESOR</b><br></li>2 Pulgadas<br><li><b>DETALLE</b><br></li>Puerta doble hoja, 6 divisiones, aluminio o vidrio templado entre división<br><div><font color="#ff0000"><b>* Fabricamos a medida, espesor, color y madera a gusto del</b></font></div><div><font color="#ff0000"><b>cliente.</b></font></div></div></div>', 1925.00, 'Bs.', 996, 0.00, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('447bac09-6ed6-48cb-9d43-321833b91eee', '2022-06-29 12:31:17', 'puerta acabado maciza de 3 divisiones (maramacho)', '<li><b>MATERIAL</b><br></li>Maramacho<li><b>COLOR&nbsp;</b><br></li>A elección<br><li><b>DIMENSIONES&nbsp;</b>(Minimas Recomendadas)<br></li>2.10 x 0.90<br><li><b>ESPESOR</b><br></li>2 Pulgadas<br><li><b>DETALLE</b><br></li>Puerta 3 divisiones<br><div><font color="#ff0000"><b>* Fabricamos a medida, espesor, color y madera a gusto del</b></font></div><div><font color="#ff0000"><b>cliente.</b></font></div>', 1507.00, 'Bs.', 1000, 7.30, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('46445a16-b0e9-4200-a080-3cf1cd20cca0', '2022-06-16 17:02:06', 'Cajonería de baños de melamina (Gold)', '<li><b>Material</b><br></li><div><div>Melamina</div><div><div><li><b>CALIDAD</b></li></div><div><font color="#333333" face="none"><span style="text-transform: capitalize;"><b>🥇🥇🥇&nbsp;</b></span></font>(Gold)</div></div><div><div><li><b>COLOR&nbsp;</b><br></li><div>A elección</div><div><li><b>DETALLE</b><br></li>Cajonería de baños de melamina con bisagras cierre suave, rieles telescópicas con cierre suave, puertas horizontales y batientes o puertas corredizas + detalles en vidrio (si el cliente lo desea)con luces en el interior.&nbsp; &nbsp;Plus dos colores (alta un color y baja otro)<br></div></div><div><font color="#ff0000"><b>* Fabricamos a medida, espesor, color y madera a gusto del</b><br></font></div><div><font color="#ff0000"><b>cliente.</b></font></div></div></div>', 1253.00, 'Bs.', 999, 0.00, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('4b9e4a99-2619-4805-ac41-0428dc4bce45', '2022-06-10 22:31:04', 'Zpaterto Artemisa  de maramacho (3 divisiones)', '<li><b>MATERIAL</b><br></li>Madera Maramacho<li><b>Dimensiones</b></li>Largo: 111 cm<div>Alto: 133 cm</div><div>Ancho: 33 cm<br><li><b>COLOR&nbsp;</b><br></li>A elección<div><li><b>DETALLE</b><br></li>Gaveterro con 3 divisiones mas un cajon</div><div><div><font color="#ff0000"><b>* Fabricamos a medida, espesor, color y madera a gusto del</b></font></div><div><font color="#ff0000"><b>cliente.</b></font></div></div></div>', 1400.00, 'Bs.', 1000, 0.00, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('4cc90ad9-5e15-436d-8106-bf3cddd1ab41', '2022-06-10 22:36:34', 'cama hipnos de 2 plazas', '<li><b>MATERIAL</b><br></li>Madera Roble<li><b>Dimensiones</b></li>Cama: 140 x 190 cm<div>Velador: 54 x 56 cm</div><div><li><b>COLOR&nbsp;</b><br></li>A elección<div><li><b>DETALLE</b><br></li>Cama de 2 plazas colores combinados de madera, 2 veladores (2 cajones por velador)</div><div><div><font color="#ff0000"><b>* Fabricamos a medida, espesor, color y madera a gusto del</b></font></div><div><font color="#ff0000"><b>cliente.</b></font></div></div></div>', 6000.00, 'Bs.', 998, 0.00, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('4d6712b0-c7f5-48f2-bfa5-305e8a766781', '2022-05-25 14:10:24', 'Mueble Odontológico con cajones y puertas batientes, jaladores de sobreponer y mampara', '<li><b>MATERIAL</b><br></li>Madera y aglomerado<li><b>COLOR&nbsp;</b><br></li>A elección<div><li><b>DETALLE</b><br></li>Puerta&nbsp; doble hoja con 6 divisiones, con vidrio opacid o aluminios</div><div><div><font color="#ff0000"><b>* Fabricamos a medida, espesor, color y madera a gusto del</b></font></div><div><font color="#ff0000"><b>cliente.</b></font></div></div>', 0.00, 'Bs.', 0, 0.00, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('51ca6e63-a7ef-4b11-ac4a-d885f5479340', '2022-06-29 11:25:55', 'Cajoneria de cocina de melammina con interiores de color y jaladores de aluminio', '<li _ngcontent-vgw-c368=""><b _ngcontent-vgw-c368="">Material</b><br _ngcontent-vgw-c368=""></li><div _ngcontent-vgw-c368="">Melamina</div><div _ngcontent-vgw-c368=""><div _ngcontent-vgw-c368=""><li _ngcontent-vgw-c368=""><b _ngcontent-vgw-c368="">COLOR&nbsp;</b><br _ngcontent-vgw-c368=""></li><div _ngcontent-vgw-c368="">A elección</div><div _ngcontent-vgw-c368=""><li _ngcontent-vgw-c368=""><b _ngcontent-vgw-c368="">DETALLE</b><br _ngcontent-vgw-c368=""></li> Cajoneria de cocina alta y baja con interiores de color y jaladores de aluminio.</div></div><div _ngcontent-vgw-c368=""><font _ngcontent-vgw-c368="" color="#ff0000"><b _ngcontent-vgw-c368="">* Fabricamos a medida, espesor, color y madera a gusto del</b><br _ngcontent-vgw-c368=""></font></div><div _ngcontent-vgw-c368=""><font _ngcontent-vgw-c368="" color="#ff0000"><b _ngcontent-vgw-c368="">cliente.</b></font></div></div>', 0.00, 'Bs.', 0, 0.00, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('56eb1196-c03c-4c5a-84bd-64284c32d9eb', '2022-06-28 21:36:05', 'Ropero de melamina con puertas corredizas y jalador de aluminio con zapatero', '<li _ngcontent-wct-c311=""><b _ngcontent-wct-c311="">Material</b><br _ngcontent-wct-c311=""></li><div _ngcontent-wct-c311="">Melamina</div><div _ngcontent-wct-c311=""><div _ngcontent-wct-c311=""><li _ngcontent-wct-c311=""><b _ngcontent-wct-c311="">COLOR&nbsp;</b><br _ngcontent-wct-c311=""></li><div _ngcontent-wct-c311="">A elección</div><div _ngcontent-wct-c311=""><li _ngcontent-wct-c311=""><b _ngcontent-wct-c311="">DETALLE</b><br _ngcontent-wct-c311=""></li>Ropero empotrado de tres cuerpos intterior blanco con puertas corredizas y jaladores de aluminio con zapatero</div></div><div _ngcontent-wct-c311=""><font _ngcontent-wct-c311="" color="#ff0000"><b _ngcontent-wct-c311="">* Fabricamos a medida, espesor, color y madera a gusto del</b><br _ngcontent-wct-c311=""></font></div><div _ngcontent-wct-c311=""><font _ngcontent-wct-c311="" color="#ff0000"><b _ngcontent-wct-c311="">cliente.</b></font></div></div>', 0.00, 'Bs.', 0, 0.00, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('69ad9459-0273-46a9-a312-e5b7d8952e86', '2022-06-16 16:24:53', 'Cajonería de Baño de melamina brasilera (Silver)', '<li><b>Material</b><br></li><div><div>Melamina</div><div><div><li><b>CALIDAD</b></li></div><div><font color="#333333" face="none"><span style="text-transform: capitalize;"><b>🥈🥈🥈</b></span></font>(Silver)</div></div><div><div><li><b>COLOR&nbsp;</b><br></li><div>A elección</div><div><li><b>DETALLE</b><br></li>Cajonería de baños de melamina brasilera con espesor de 15mm, estructura de blanca, puertas de color, bisagras cierre suave, rieles telescópicas con cierre suave, puertas horizontales y batientes.<br></div></div><div><font color="#ff0000"><b>* Fabricamos a medida, espesor, color y madera a gusto del</b><br></font></div><div><font color="#ff0000"><b>cliente.</b></font></div></div></div>', 975.00, 'Bs.', 996, 0.00, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('6dd0e270-fb5c-4e27-ab6f-c8e79c258047', '2022-06-10 14:11:31', 'Zapatero Artemisa de maramacho (2 divisiones)', '<li><b>MATERIAL</b><br></li>Madera Maramacho<li><b>Dimensiones</b></li>Largo: 73 cm<div>Alto: 133 cm</div><div>Ancho: 33 cm<br><li><b>COLOR&nbsp;</b><br></li>A elección<div><li><b>DETALLE</b><br></li>Gaveterro con 4 cajones&nbsp;</div><div><div><font color="#ff0000"><b>* Fabricamos a medida, espesor, color y madera a gusto del</b></font></div><div><font color="#ff0000"><b>cliente.</b></font></div></div></div><div><font color="#ff0000"><b><br></b></font></div>', 1150.00, 'Bs.', 1000, 0.00, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('6ff0adec-3491-4d93-b038-d25effe2dfc1', '2022-06-29 11:31:28', 'Marco de puerta de maramacho con espesor de 2 x 8 pulgadas', '<li _ngcontent-vgw-c368=""><b _ngcontent-vgw-c368="">Material</b><br _ngcontent-vgw-c368=""></li><div _ngcontent-vgw-c368="">Maramacho</div><li _ngcontent-vgw-c368=""><b _ngcontent-vgw-c368="">Dimensiones</b><br _ngcontent-vgw-c368=""></li><div _ngcontent-vgw-c368="">2.10 x 0.90</div><div _ngcontent-vgw-c368=""><div _ngcontent-vgw-c368=""><li _ngcontent-vgw-c368=""><b _ngcontent-vgw-c368="">COLOR&nbsp;</b><br _ngcontent-vgw-c368=""></li><div _ngcontent-vgw-c368="">A elección</div><div _ngcontent-vgw-c368=""><li _ngcontent-vgw-c368=""><b _ngcontent-vgw-c368="">ESPESOR&nbsp;</b><br _ngcontent-vgw-c368=""></li><div _ngcontent-vgw-c368="">2 x 8 pulgadas</div></div><div _ngcontent-vgw-c368=""><li _ngcontent-vgw-c368=""><b _ngcontent-vgw-c368="">DETALLE</b><br _ngcontent-vgw-c368=""></li> Marco se añade 7 cm. tanto en los parantes y orejas para empotre.</div></div><div _ngcontent-vgw-c368=""><font _ngcontent-vgw-c368="" color="#ff0000"><b _ngcontent-vgw-c368="">* Fabricamos a medida, espesor, color y madera a gusto del</b><br _ngcontent-vgw-c368=""></font></div><div _ngcontent-vgw-c368=""><font _ngcontent-vgw-c368="" color="#ff0000"><b _ngcontent-vgw-c368="">cliente.</b></font></div></div>', 0.00, 'Bs.', 0, 0.00, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('72668ec0-19d6-4062-9477-45623f4f3f9a', '2022-05-26 14:13:32', 'Escritorio múltiple cajonería alta con vidrio opacid en la parte inferior dos cajones con base para computadora y teclado', '<li><b>MATERIAL</b><br></li>Melamina con vidrio opacid<li><b>COLOR&nbsp;</b><br></li>A elección<div><li><b>DETALLE</b><br></li>Escritorio múltiple cajonería alta con vidrio opacid en la parte inferior dos cajones con base para computadora y teclado</div><div><div><font color="#ff0000"><b>* Fabricamos a medida, espesor, color y madera a gusto del</b></font></div><div><font color="#ff0000"><b>cliente.</b></font></div></div>', 0.00, 'Bs.', 0, 0.00, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('7bd5774f-6174-48a9-b456-ed132353885a', '2022-05-27 23:18:40', 'puerta principal de 9 disiones con tragaluz lateral, superior vidrio (maramacho)', '<li><b>MATERIAL</b><br></li>Maramacho<li><b>COLOR&nbsp;</b><br></li>A elección<br><li><b>DIMENSIONES&nbsp;</b>(Minimas Recomendadas)<br></li>Puerta: 2.10 x 0.90<div>Tragaluz: 2.50 x 0.80<br><li><b>ESPESOR</b><br></li>2 Pulgadas<br><li><b>DETALLE</b><br></li>Puerta 9 divisiones con tragaluz lateral, superior vidrio<br><div><font color="#ff0000"><b>* Fabricamos a medida, espesor, color y madera a gusto del</b></font></div><div><font color="#ff0000"><b>cliente.</b></font></div></div>', 1407.00, 'Bs.', 1000, 0.00, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('8910a1bb-e604-4fb7-b745-837c7a22b4b0', '2022-06-28 21:33:10', 'Ropero de melamina con puertas corredizas y jaladores de sobre poner', '<li _ngcontent-wct-c311=""><b _ngcontent-wct-c311="">Material</b><br _ngcontent-wct-c311=""></li><div _ngcontent-wct-c311="">Melamina</div><div _ngcontent-wct-c311=""><div _ngcontent-wct-c311=""><li _ngcontent-wct-c311=""><b _ngcontent-wct-c311="">COLOR&nbsp;</b><br _ngcontent-wct-c311=""></li><div _ngcontent-wct-c311="">A elección</div><div _ngcontent-wct-c311=""><li _ngcontent-wct-c311=""><b _ngcontent-wct-c311="">DETALLE</b><br _ngcontent-wct-c311=""></li>Ropero empotrado de tres cuerpos con puertas corredizas y jaladores de sobre poner</div></div><div _ngcontent-wct-c311=""><font _ngcontent-wct-c311="" color="#ff0000"><b _ngcontent-wct-c311="">* Fabricamos a medida, espesor, color y madera a gusto del</b><br _ngcontent-wct-c311=""></font></div><div _ngcontent-wct-c311=""><font _ngcontent-wct-c311="" color="#ff0000"><b _ngcontent-wct-c311="">cliente.</b></font></div></div>', 0.00, 'Bs.', 0, 0.00, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('9104aded-4387-44dd-a95d-850445433181', '2022-06-15 22:44:26', 'Living Cygnus (5 piezas)', '<li><b>Material</b><br></li><div><div>Tapizado de tela americana guindo terracota o cuero ecológico Blanco</div><div><div><li><b>COLOR&nbsp;</b><br></li><div>A elección<div><li><b>DETALLE</b><br></li>Living de 5 piezas:</div><div><ol><li>Sofá individual</li><li>Sofá de dos cuerpos</li><li>Sofá de 3 cuerpos</li><li>Taburete</li><li>Mesa central de trupan 77 x 58 cm</li></ol></div></div></div><div><font color="#ff0000"><b style="">* Fabricamos a medida, espesor, color y madera a gusto del</b><br></font></div><div><font color="#ff0000"><b>cliente.</b></font></div></div></div>', 9000.00, 'Bs.', 1000, 0.00, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('95925ddf-95ff-4e5e-82a8-8d98cb5c7790', '2022-05-26 15:50:24', 'Mueble de recepción con cajones y puertas con granito en la parte superior con base para computadora', '<li><b>MATERIAL</b><br></li>Melamina<li><b>COLOR&nbsp;</b><br></li>A elección<div><li><b>DETALLE</b><br></li>Mueble de recepción con cajones y puertas con granito en la parte superior con base para computadora</div><div><div><font color="#ff0000"><b>* Fabricamos a medida, espesor, color y madera a gusto del</b></font></div><div><font color="#ff0000"><b>cliente.</b></font></div></div>', 0.00, 'Bs.', 0, 0.00, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('a23de6cb-54a0-475e-acfd-975c36de336e', '2022-06-15 19:20:34', 'cama hipnos 2 1/2 plazas', '<li><b>MATERIAL</b><br></li>Madera Roble<li><b>Dimensiones</b></li>Cama: 160 x 190 cm<div>Velador: 54 x 56 cm</div><div><li><b>COLOR&nbsp;</b><br></li>A elección<div><li><b>DETALLE</b><br></li>Cama de 2 1/2 plazas colores combinados de madera, 2 veladores (2 cajones por velador)</div><div><div><font color="#ff0000"><b>* Fabricamos a medida, espesor, color y madera a gusto del</b></font></div><div><font color="#ff0000"><b>cliente.</b></font></div></div></div>', 7000.00, 'Bs.', 999, 0.00, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('a35424cc-fd28-44ac-a604-4c4b2d628f43', '2022-06-29 13:48:46', 'puerta principal de doble hoja con 6 divisiones y vidrio opacid o aluminio (maramacho)', '<li><b>MATERIAL</b><br></li>Maramacho<li><b>COLOR&nbsp;</b><br></li>A elección<br><li><b>DIMENSIONES&nbsp;</b>(Minimas Recomendadas)<br></li>2.10 x 1.10<div><li><b>ESPESOR</b><br></li>2 Pulgadas<br><li><b>DETALLE</b><br></li>Puerta&nbsp; doble hoja con 6 divisiones, con vidrio opacid o aluminios<br><div><font color="#ff0000"><b>* Fabricamos a medida, espesor, color y madera a gusto del</b></font></div><div><font color="#ff0000"><b>cliente.</b></font></div></div>', 1851.00, 'Bs.', 997, 0.00, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('b1cb4347-9792-4454-b9f6-a8b5db3e9ee9', '2022-05-26 14:31:47', 'Escritorio ejecutivo de 3 cajones con vidrio templado sobre el escritorio y vidrio templado en la parte frontal', '<li><b>MATERIAL</b><br></li>Trupan con vidrio templado<li><b>COLOR&nbsp;</b><br></li>A elección<div><li><b>DETALLE</b><br></li>3 cajones con vidrio templado sobre el escritorio y vidrio templado en la parte frontal</div><div><div><font color="#ff0000"><b>* Fabricamos a medida, espesor, color y madera a gusto del</b></font></div><div><font color="#ff0000"><b>cliente.</b></font></div></div>', 0.00, 'Bs.', 0, 0.00, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('b30ac8ef-ad14-477e-9f57-0fa0eba5d71d', '2022-06-29 12:20:17', 'puerta principal de doble hoja, tragaluz superior (maramacho)', '<li><b>MATERIAL</b><br></li>Maramacho<li><b>COLOR&nbsp;</b><br></li>A elección<br><li><b>DIMENSIONES&nbsp;</b>(Minimas Recomendadas)<br></li>Puerta: 2.10 x 1.20<div>Tragaluz: 0.40 x 1.20<br><div><li><b>ESPESOR</b><br></li>2 Pulgadas<br><li><b>DETALLE</b><br></li>Puerta doble hoja, tragaluz superior<br><div><font color="#ff0000"><b>* Fabricamos a medida, espesor, color y madera a gusto del</b></font></div><div><font color="#ff0000"><b>cliente.</b></font></div></div></div>', 1682.00, 'Bs.', 999, 0.00, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('b877f8ba-4a1b-426a-8901-762a5ec02746', '2022-06-29 11:23:09', 'Cajoneria de cocina con interiores de color y jaladores de aluminio', '<li _ngcontent-vgw-c368=""><b _ngcontent-vgw-c368="">Material</b><br _ngcontent-vgw-c368=""></li><div _ngcontent-vgw-c368="">Melamina</div><div _ngcontent-vgw-c368=""><div _ngcontent-vgw-c368=""><li _ngcontent-vgw-c368=""><b _ngcontent-vgw-c368="">COLOR&nbsp;</b><br _ngcontent-vgw-c368=""></li><div _ngcontent-vgw-c368="">A elección</div><div _ngcontent-vgw-c368=""><li _ngcontent-vgw-c368=""><b _ngcontent-vgw-c368="">DETALLE</b><br _ngcontent-vgw-c368=""></li> Cajoneria de cocina alta y baja con interiores de color jaladores de aluminio</div></div><div _ngcontent-vgw-c368=""><font _ngcontent-vgw-c368="" color="#ff0000"><b _ngcontent-vgw-c368="">* Fabricamos a medida, espesor, color y madera a gusto del</b><br _ngcontent-vgw-c368=""></font></div><div _ngcontent-vgw-c368=""><font _ngcontent-vgw-c368="" color="#ff0000"><b _ngcontent-vgw-c368="">cliente.</b></font></div></div>', 0.00, 'Bs.', 0, 0.00, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('c05c67f9-8333-4c0b-b170-4929a2661085', '2022-05-26 14:08:08', 'Escritorio múltiple diversos colores con base para computadora y teclado en la parte superior repisa', '<li><b>MATERIAL</b><br></li>Trupan<li><b>COLOR&nbsp;</b><br></li>A elección<div><li><b>DETALLE</b><br></li>Escritorio múltiple diversos colores con base para computadora y teclado en la parte superior repisa para documentos</div><div><div><font color="#ff0000"><b>* Fabricamos a medida, espesor, color y madera a gusto del</b></font></div><div><font color="#ff0000"><b>cliente.</b></font></div></div>', 0.00, 'Bs.', 0, 0.00, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('c6103880-4cce-4ffd-bb19-120e00986d14', '2022-06-16 16:21:38', 'Cajonería de Baño de melamina brasilera (Bronce)', '<li><b>Material</b><br></li><div><div>Melamina</div><div><div><li><b>CALIDAD</b></li></div><div><span style="color: rgb(51, 51, 51); font-family: none; font-weight: 700; text-transform: capitalize;">🥉</span><span style="color: rgb(51, 51, 51); font-family: none; font-weight: 700; text-transform: capitalize;">🥉</span><span style="color: rgb(51, 51, 51); font-family: none; font-weight: 700; text-transform: capitalize;">🥉&nbsp;</span>(Bronce)<font color="#ff0000"><b><br></b></font></div></div><div><div><li><b>COLOR&nbsp;</b><br></li><div>A elección</div><div><div><li><b>DETALLE</b><br></li>Cajonería de baños de melamina brasilera con espesor de 15mm, estructura blanca, puertas de color, bisagras pispot, rieles telescópicas normales y puertas batientes.</div></div></div><div><font color="#ff0000"><b>* Fabricamos a medida, espesor, color y madera a gusto del</b><br></font></div><div><font color="#ff0000"><b>cliente.</b></font></div></div></div><br>', 750.00, 'Bs.', 1001, 0.00, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('c6bdc4d0-d3ae-4365-86fd-09777b602cdc', '2022-06-29 11:40:59', 'Puerta doble hoja de maramacho con detalles en aluminio', '<li _ngcontent-vgw-c368=""><b _ngcontent-vgw-c368="">Material</b><br _ngcontent-vgw-c368=""></li><div _ngcontent-vgw-c368="">Maramacho + Aglomerado</div><li _ngcontent-vgw-c368=""><b _ngcontent-vgw-c368="">Dimensiones</b></li><div _ngcontent-vgw-c368=""><ol><li>Puerta 1: 2.10 x 0.45</li><li>Puerta 2: 2.10 x 0.45</li></ol></div><div _ngcontent-vgw-c368=""><div _ngcontent-vgw-c368=""><li _ngcontent-vgw-c368=""><b _ngcontent-vgw-c368="">COLOR&nbsp;</b><br _ngcontent-vgw-c368=""></li><div _ngcontent-vgw-c368="">A elección</div><div _ngcontent-vgw-c368=""><li _ngcontent-vgw-c368=""><b _ngcontent-vgw-c368="">DETALLE</b><br _ngcontent-vgw-c368=""></li> Puerta doble hoja con detalles en aluminio.</div></div><div _ngcontent-vgw-c368=""><font _ngcontent-vgw-c368="" color="#ff0000"><b _ngcontent-vgw-c368="">* Fabricamos a medida, espesor, color y madera a gusto del</b><br _ngcontent-vgw-c368=""></font></div><div _ngcontent-vgw-c368=""><font _ngcontent-vgw-c368="" color="#ff0000"><b _ngcontent-vgw-c368="">cliente.</b></font></div></div><li><br></li>', 1256.00, 'Bs.', 1000, 7.40, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('cb099636-c1c2-44d5-8c25-8d18cf619e23', '2022-06-29 12:25:43', 'puerta principal de Puerta  6 divisiones, con vidrio opacid o aluminios (maramacho)', '<li><b>MATERIAL</b><br></li>Maramacho<li><b>COLOR&nbsp;</b><br></li>A elección<br><li><b>DIMENSIONES&nbsp;</b>(Minimas Recomendadas)<br></li>2.10 x 0.90<div><li><b>ESPESOR</b><br></li>2 Pulgadas<br><li><b>DETALLE</b><br></li>Puerta&nbsp; 6 divisiones, con vidrio opacid o aluminios<br><div><font color="#ff0000"><b>* Fabricamos a medida, espesor, color y madera a gusto del</b></font></div><div><font color="#ff0000"><b>cliente.</b></font></div></div>', 1368.00, 'Bs.', 1000, 0.00, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('ce1c1bf2-d9a1-449d-a02b-9b3f220f1dbb', '2022-06-29 17:40:15', 'puerta acabado maciza de 5 divisiones (maramacho)', '<li><b>MATERIAL</b><br></li>Maramacho<li><b>COLOR&nbsp;</b><br></li>A elección<br><li><b>DIMENSIONES&nbsp;</b>(Minimas Recomendadas)<br></li>2.10 x 0.90<br><li><b>ESPESOR</b><br></li>2 Pulgadas<br><li><b>DETALLE</b><br></li>Puerta 5 divisiones<br><div><font color="#ff0000"><b>* Fabricamos a medida, espesor, color y madera a gusto del</b></font></div><div><font color="#ff0000"><b>cliente.</b></font></div>', 1507.00, 'Bs.', 997, 7.30, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('d2bd9d15-1039-4444-8dcf-082592157bdd', '2022-06-10 11:54:55', 'gavetero centauros (4 cajones)', '<li><b>MATERIAL</b><br></li>Madera Maramacho<li><b>Dimensiones</b></li>Largo: 49.5 cm<div>Alto: 136 cm</div><div>Ancho: 65 cm<br><li><b>COLOR&nbsp;</b><br></li>A elección<div><li><b>DETALLE</b><br></li>Gaveterro con 4 cajones&nbsp;</div><div><div><font color="#ff0000"><b>* Fabricamos a medida, espesor, color y madera a gusto del</b></font></div><div><font color="#ff0000"><b>cliente.</b></font></div></div><div><font color="#ff0000"><b><br></b></font></div></div>', 900.00, 'Bs.', 1000, 0.00, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('d54e1a74-b861-4ad6-a934-c1f5661997b3', '2022-06-15 22:04:24', 'Mesa redonda phoenix de 4 sillas', '<li><b>MATERIAL</b><br></li>Madera Maramacho<li><b>Dimensiones</b></li>Mesa de 4 sillas: 105 cm<div><li><b>COLOR&nbsp;</b><br></li>A elección<div><li><b>DETALLE</b><br></li>Mesa redonda de 4 sillas con tapiz con tela americana guindo terracota</div><div><div><font color="#ff0000"><b>* Fabricamos a medida, espesor, color y madera a gusto del</b></font></div><div><font color="#ff0000"><b>cliente.</b></font></div></div></div>', 2700.00, 'Bs.', 909, 0.00, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('d6741f11-aa21-486a-817f-1d516c452da1', '2022-05-25 15:40:23', 'Mesa de 12 sillas con enchufe empotrado en el centro', '<li><b>MATERIAL</b><br></li>Madera maramacho<li><b>COLOR&nbsp;</b><br></li>A elección<div><li><b>DETALLE</b><br></li>Mesa estática de 12 sillas con enchufe empotrado en el centro</div><div><div><font color="#ff0000"><b>* Fabricamos a medida, espesor, color y madera a gusto del</b></font></div><div><font color="#ff0000"><b>cliente.</b></font></div></div>', 0.00, 'Bs.', 0, 0.00, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('dea18ab5-3cd2-4626-bcff-ef4126af7303', '2022-06-15 23:01:28', 'Comedor Sirius (8 sillas)', '<li><b>Material</b><br></li><div><div>Madera maramacho</div><div><div><li><b>COLOR&nbsp;</b><br></li><div>A elección</div><div><li><b>MEDIDAS</b><br></li><div>Largo: 128 x 112 cm</div><div>Silla: 40 x 45 cm</div><div><li><b>DETALLE</b><br></li>Mesa rectangular con 8 sillas tapiz con tela americana color guindo terracota</div></div></div><div><font color="#ff0000"><b>* Fabricamos a medida, espesor, color y madera a gusto del</b><br></font></div><div><font color="#ff0000"><b>cliente.</b></font></div></div></div>', 7000.00, 'Bs.', 997, 0.00, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('decda335-f5d2-4987-96bf-79794f1462ab', '2022-06-29 12:27:02', 'puerta acabado maciza de 11 divisiones (maramacho)', '<li><b>MATERIAL</b><br></li>Maramacho<li><b>COLOR&nbsp;</b><br></li>A elección<br><li><b>DIMENSIONES&nbsp;</b>(Minimas Recomendadas)<br></li>2.10 x 0.90<br><li><b>ESPESOR</b><br></li>2 Pulgadas<br><li><b>DETALLE</b><br></li>Puerta 11 divisiones<br><div><font color="#ff0000"><b>* Fabricamos a medida, espesor, color y madera a gusto del</b></font></div><div><font color="#ff0000"><b>cliente.</b></font></div>', 1507.00, 'Bs.', 1000, 7.30, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('e19d5792-f417-411e-abce-436ef5fb7815', '2022-06-29 11:20:58', 'Cajoneria de churrasquero', '<li _ngcontent-vgw-c368=""><b _ngcontent-vgw-c368="">Material</b><br _ngcontent-vgw-c368=""></li><div _ngcontent-vgw-c368="">Roble</div><div _ngcontent-vgw-c368="">Maramacho</div><div _ngcontent-vgw-c368="">Alternativo</div><div _ngcontent-vgw-c368=""><div _ngcontent-vgw-c368=""><li _ngcontent-vgw-c368=""><b _ngcontent-vgw-c368="">COLOR&nbsp;</b><br _ngcontent-vgw-c368=""></li><div _ngcontent-vgw-c368="">A elección</div><div _ngcontent-vgw-c368=""><li _ngcontent-vgw-c368=""><b _ngcontent-vgw-c368="">DETALLE</b><table border="0" cellpadding="0" cellspacing="0" width="364" style="border-collapse:
 collapse;width:273pt"><tbody><tr height="38" style="height:28.8pt">
  <td height="38" class="xl65" width="364" style="height:28.8pt;width:273pt">Cajonería
  alta y baja con jaladores de sobrew poner.</td></tr></tbody></table></li></div></div><div _ngcontent-vgw-c368=""><font _ngcontent-vgw-c368="" color="#ff0000"><b _ngcontent-vgw-c368="">* Fabricamos a medida, espesor, color y madera a gusto del</b><br _ngcontent-vgw-c368=""></font></div><div _ngcontent-vgw-c368=""><font _ngcontent-vgw-c368="" color="#ff0000"><b _ngcontent-vgw-c368="">cliente.</b></font></div></div>', 0.00, 'Bs.', 0, 0.00, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('e81f4e59-44cc-49fc-9d14-1a10b778fc4f', '2022-06-29 11:36:14', 'Puerta persiana de maramacho con 4 divisiones', '<li _ngcontent-vgw-c368=""><b _ngcontent-vgw-c368="">Material</b><br _ngcontent-vgw-c368=""></li><div _ngcontent-vgw-c368="">Maramacho</div><li _ngcontent-vgw-c368=""><b _ngcontent-vgw-c368="">Dimensiones</b><br _ngcontent-vgw-c368=""></li><div _ngcontent-vgw-c368="">2.10 x 0.90</div><div _ngcontent-vgw-c368=""><div _ngcontent-vgw-c368=""><li _ngcontent-vgw-c368=""><b _ngcontent-vgw-c368="">COLOR&nbsp;</b><br _ngcontent-vgw-c368=""></li><div _ngcontent-vgw-c368="">A elección</div><div _ngcontent-vgw-c368=""><li _ngcontent-vgw-c368=""><b _ngcontent-vgw-c368="">DETALLE</b><br _ngcontent-vgw-c368=""></li> Puerta para closet o alacena 4 divisiones con perrsiana</div></div><div _ngcontent-vgw-c368=""><font _ngcontent-vgw-c368="" color="#ff0000"><b _ngcontent-vgw-c368="">* Fabricamos a medida, espesor, color y madera a gusto del</b><br _ngcontent-vgw-c368=""></font></div><div _ngcontent-vgw-c368=""><font _ngcontent-vgw-c368="" color="#ff0000"><b _ngcontent-vgw-c368="">cliente.</b></font></div></div>', 1217.00, 'Bs.', 1000, 7.50, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('fdf00dc4-cb2b-42a0-9b63-46132723946b', '2022-05-26 14:20:19', 'Mueble de recepción con cajones y puertas con vidrio templado en la parte superior y cinta led', '<li><b>MATERIAL</b><br></li>Trupan<li><b>COLOR&nbsp;</b><br></li>A elección<div><li><b>DETALLE</b><br></li>Mueble de recepción con cajones y puertas con vidrio templado en la parte superior y cinta led</div><div><div><font color="#ff0000"><b>* Fabricamos a medida, espesor, color y madera a gusto del</b></font></div><div><font color="#ff0000"><b>cliente.</b></font></div></div>', 0.00, 'Bs.', 0, 0.00, 1);



INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('0a5e397a-a255-4550-890f-7bb4bf16f6f0', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', '03819ff5-84a4-4bf2-bb23-fea2ca888a6f');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('0b4b842f-2322-477b-a149-956c542fa214', '0515f17a-1408-4e52-bdfc-fac22ae0652c', '03819ff5-84a4-4bf2-bb23-fea2ca888a6f');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('16c32120-6cad-410a-a7cd-db6fd0773d41', '9d2551ac-b73e-40b2-b88e-3820c4f3ca29', '410b5731-4c04-4262-a734-b5c03c140569');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('18dc2e23-9b46-44b7-adbd-2e3501cf27cc', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', 'a23de6cb-54a0-475e-acfd-975c36de336e');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('1c9ab7f0-5387-4789-99cb-03677e55f6d4', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', '02cea732-e77c-4546-b841-0fd048f15d0c');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('24398e2b-fbb9-459e-bdcf-e3adf754c9ce', '139fcae1-5f39-4f06-8456-af152672b082', '208dbcc3-caeb-401a-aec2-03c97db83495');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('245930a4-16d9-4eec-8e3a-123a0b0a9419', '9d2551ac-b73e-40b2-b88e-3820c4f3ca29', 'cb099636-c1c2-44d5-8c25-8d18cf619e23');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('28226f70-b98c-4a3b-9276-bde4363ebe29', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', 'dea18ab5-3cd2-4626-bcff-ef4126af7303');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('33220fc5-aba1-4fa6-9740-6ededed10b91', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', 'c05c67f9-8333-4c0b-b170-4929a2661085');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('3d331709-cda8-40d4-bdaa-c9ade49dd527', '33ea4589-56fb-4d08-a5a1-55d676daebbb', '6dd0e270-fb5c-4e27-ab6f-c8e79c258047');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('3e3b274b-491b-4070-b7aa-f45153c23ddf', '95ab02e8-a716-465f-8c91-947bf8f33906', 'c6103880-4cce-4ffd-bb19-120e00986d14');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('3f736604-d9d5-4417-a124-e63f4377bd89', '0a0dfb3c-b600-4473-be3a-b79ded043822', '0ffbfaa6-a0f3-4374-afda-a7dee8bd8618');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('45815f56-259b-40f5-8273-b1b339dcfc2c', '95ab02e8-a716-465f-8c91-947bf8f33906', '46445a16-b0e9-4200-a080-3cf1cd20cca0');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('4ca260f4-97d2-4606-ace7-16f118d7d47c', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', 'd6741f11-aa21-486a-817f-1d516c452da1');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('51e86b77-e3e9-472a-9bdb-129d7cee95a0', '139fcae1-5f39-4f06-8456-af152672b082', 'b1cb4347-9792-4454-b9f6-a8b5db3e9ee9');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('566bd497-3cfc-495c-a9a4-fafaaff999e7', '9d2551ac-b73e-40b2-b88e-3820c4f3ca29', '006fe36f-1f53-49c6-b5d6-5dcca6571d42');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('5847cf35-02e9-47ba-978b-e58fd9f086dc', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', '9104aded-4387-44dd-a95d-850445433181');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('5bb11414-b71e-4404-8d61-29b6ecc6a8ad', '9b8bbf40-3894-4cbb-9fdd-6d9e3107018c', 'a23de6cb-54a0-475e-acfd-975c36de336e');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('5f3b6bc5-de5b-4a05-8de4-72c95e7c14fa', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', '36d2421b-cbae-4dd3-aac7-4544efc9d6af');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('5fb7b7a1-4326-492b-a054-b59eb22eebcd', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', '56eb1196-c03c-4c5a-84bd-64284c32d9eb');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('6271bd58-4b04-4d9c-967c-b37671d1700e', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', '4d6712b0-c7f5-48f2-bfa5-305e8a766781');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('657ddd05-dc4d-4d93-b951-c329a7f2f488', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', '72668ec0-19d6-4062-9477-45623f4f3f9a');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('66e3ec50-2494-4a9d-88b4-54e7ab49f82a', 'db512728-2154-4df3-91e9-4a802b21632c', 'd2bd9d15-1039-4444-8dcf-082592157bdd');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('7068b4cc-5154-45f8-a7bc-6036ed3578a0', '9d2551ac-b73e-40b2-b88e-3820c4f3ca29', '7bd5774f-6174-48a9-b456-ed132353885a');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('70739894-980d-4721-ad81-39314757d654', '33ea4589-56fb-4d08-a5a1-55d676daebbb', '4b9e4a99-2619-4805-ac41-0428dc4bce45');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('738b23ab-a061-4596-b84e-3e92ebbb5ebe', '9097c619-6e0c-46cb-9ecb-72ecc1b6eb3b', '8910a1bb-e604-4fb7-b745-837c7a22b4b0');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('769d77ad-eee9-4662-8947-112ef1a47c4b', '9b8bbf40-3894-4cbb-9fdd-6d9e3107018c', '4cc90ad9-5e15-436d-8106-bf3cddd1ab41');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('7aa4dc27-479d-43d0-85f8-f413d03c457d', '139fcae1-5f39-4f06-8456-af152672b082', '0050a1a6-1ee2-4ad7-9685-8b8e6292e277');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('7abc21c6-b813-49a2-94ab-a78ff7845f8b', '9d2551ac-b73e-40b2-b88e-3820c4f3ca29', '02718e83-f899-4242-97c2-ae550e750683');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('7c385e4d-5f7b-491d-9d77-1b3f0b52702b', '79f1a74b-f19c-4b63-9cfd-4ed0098a2a78', 'b877f8ba-4a1b-426a-8901-762a5ec02746');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('835c0be1-0a21-4f81-80ed-09db62857b89', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', '0050a1a6-1ee2-4ad7-9685-8b8e6292e277');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('845115f6-816d-41f6-a47e-442e702008dd', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', 'd2bd9d15-1039-4444-8dcf-082592157bdd');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('84d15da9-cda4-4692-8355-0df7cf1fd839', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', 'fdf00dc4-cb2b-42a0-9b63-46132723946b');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('878e7345-7780-478d-8b00-995a7d87261b', '9097c619-6e0c-46cb-9ecb-72ecc1b6eb3b', '56eb1196-c03c-4c5a-84bd-64284c32d9eb');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('87b268da-1efc-49f0-adda-b17af6e64129', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', '353f7727-3130-46a3-be67-92ab0896a630');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('890679a6-e98e-4a2e-8e7d-bd0a198ecf75', '9d2551ac-b73e-40b2-b88e-3820c4f3ca29', 'e81f4e59-44cc-49fc-9d14-1a10b778fc4f');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('9455b5c1-0a1c-491a-98b6-44272a8c3d32', '9097c619-6e0c-46cb-9ecb-72ecc1b6eb3b', '2d078933-ff74-43ae-8322-fc19ba53b39c');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('9a9d7e52-f4d1-47fb-9dad-1dbaa1694ce8', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', '95925ddf-95ff-4e5e-82a8-8d98cb5c7790');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('9c1f7758-8f17-4f58-8732-c6ebdd15143b', '139fcae1-5f39-4f06-8456-af152672b082', 'c05c67f9-8333-4c0b-b170-4929a2661085');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('9e03056b-4554-43a8-9e29-31f642e1cd96', '9d2551ac-b73e-40b2-b88e-3820c4f3ca29', '447bac09-6ed6-48cb-9d43-321833b91eee');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('9f3b1191-3510-46a1-8ffe-84ec21b557d3', '46e94a93-5511-43bc-b88d-b15525af7cbc', '36d2421b-cbae-4dd3-aac7-4544efc9d6af');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('9f742434-987e-4c65-be23-bde14e231eb3', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', '4cc90ad9-5e15-436d-8106-bf3cddd1ab41');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('a1dba1e1-3bcc-4a72-aac8-25b87354c18c', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', 'd54e1a74-b861-4ad6-a934-c1f5661997b3');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('a3f57cec-e9b1-4625-b184-eec4c3bdcd73', '79f1a74b-f19c-4b63-9cfd-4ed0098a2a78', '51ca6e63-a7ef-4b11-ac4a-d885f5479340');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('a6d48a78-d031-479f-abe7-eca96dc82fbb', '46e94a93-5511-43bc-b88d-b15525af7cbc', 'd54e1a74-b861-4ad6-a934-c1f5661997b3');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('a8633dbe-cabe-47a7-afb0-fd2f66e15b33', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', 'e19d5792-f417-411e-abce-436ef5fb7815');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('b1335071-8e5b-4010-8e82-7ae00525cb74', '9d2551ac-b73e-40b2-b88e-3820c4f3ca29', '24a102fe-58cf-4de1-9063-1db1c75d9eb4');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('b23b2ab6-e042-4644-9684-6be4b739af7f', '9d2551ac-b73e-40b2-b88e-3820c4f3ca29', 'ce1c1bf2-d9a1-449d-a02b-9b3f220f1dbb');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('b4614d60-d10b-4cc5-9bab-9ae691095c93', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', 'b1cb4347-9792-4454-b9f6-a8b5db3e9ee9');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('b61ec0f9-b746-4239-8964-5a40e5d32148', '46e94a93-5511-43bc-b88d-b15525af7cbc', 'd6741f11-aa21-486a-817f-1d516c452da1');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('b755f24e-c9a7-4220-b6c1-ba03d6a6478b', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', '4b9e4a99-2619-4805-ac41-0428dc4bce45');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('bd197426-1b2e-4337-bebb-6784a831d297', '139fcae1-5f39-4f06-8456-af152672b082', '72668ec0-19d6-4062-9477-45623f4f3f9a');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('c3080b16-b052-4be1-b846-52279117a88e', '0a0dfb3c-b600-4473-be3a-b79ded043822', 'dea18ab5-3cd2-4626-bcff-ef4126af7303');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('c4f7aa33-a532-41c8-b368-87a830181d65', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', '2d078933-ff74-43ae-8322-fc19ba53b39c');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('c5c8f06f-44c3-45ab-babe-a7eb65a2ac1d', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', '6dd0e270-fb5c-4e27-ab6f-c8e79c258047');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('c8deca10-bcb5-450b-9438-a2d9491ddcb3', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', 'b877f8ba-4a1b-426a-8901-762a5ec02746');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('ca638d97-cd97-46c1-9b9b-b49c9cbe9f29', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', '0ffbfaa6-a0f3-4374-afda-a7dee8bd8618');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('d1cfc0d9-9323-4dec-8aa6-f36f02e410ae', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', '208dbcc3-caeb-401a-aec2-03c97db83495');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('d44ec167-6cbe-46b1-9e27-96d6667f8b0e', '79f1a74b-f19c-4b63-9cfd-4ed0098a2a78', 'e19d5792-f417-411e-abce-436ef5fb7815');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('dbce4d2d-b1a7-4b46-b912-3d2e1496d599', '95ab02e8-a716-465f-8c91-947bf8f33906', '69ad9459-0273-46a9-a312-e5b7d8952e86');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('ddb5dd17-51a0-4bf1-9a9a-21801cdb7158', '9d2551ac-b73e-40b2-b88e-3820c4f3ca29', 'b30ac8ef-ad14-477e-9f57-0fa0eba5d71d');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('e7518d65-f8d2-46c3-86e0-ab7f36d9d036', '9d2551ac-b73e-40b2-b88e-3820c4f3ca29', 'c6bdc4d0-d3ae-4365-86fd-09777b602cdc');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('eaeaed4c-5bd7-4b40-aca4-2caf60aad5fd', '9d2551ac-b73e-40b2-b88e-3820c4f3ca29', 'decda335-f5d2-4987-96bf-79794f1462ab');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('ebfa8a30-126b-4972-bcb4-a77ad7380731', '4284c9b8-ba48-4431-ab43-9684b0951f5d', '6ff0adec-3491-4d93-b038-d25effe2dfc1');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('ec10953f-9ca1-427a-b0ab-40ac3004c129', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', '2a04a96f-5b41-4140-ab9a-94ed38a75d6e');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('f0bb39fd-a4be-4fa7-8d30-8ad272465cb1', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', '8910a1bb-e604-4fb7-b745-837c7a22b4b0');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('f1ca0580-f41f-4a88-b5fd-e0aac6f7aa9c', '139fcae1-5f39-4f06-8456-af152672b082', '03819ff5-84a4-4bf2-bb23-fea2ca888a6f');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('f2cf8c89-a836-4741-b58b-257081e804b4', '7e15ebbf-79ea-43f4-ae37-de74a84a6735', '9104aded-4387-44dd-a95d-850445433181');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('f5b39e53-506e-4cd3-93fa-4d22024b9139', '9b8bbf40-3894-4cbb-9fdd-6d9e3107018c', '353f7727-3130-46a3-be67-92ab0896a630');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('fa91d60d-d030-426a-a56b-eed74e2a94d4', '9d2551ac-b73e-40b2-b88e-3820c4f3ca29', 'a35424cc-fd28-44ac-a604-4c4b2d628f43');



INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('001dff2d-4808-46d7-bf6a-422fb97c4957', '2022-06-16 17:02:07', 'SmartSelect_20220507-101259_Adobe Acrobat.jpg', 3, 'liraki/images/9116bc58-40dd-430e-83f6-21fa28b0f6ed.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/9116bc58-40dd-430e-83f6-21fa28b0f6ed.jpg', 123814, '46445a16-b0e9-4200-a080-3cf1cd20cca0');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('0181e7ca-7928-4202-a1c4-79cb8acca1bf', '2022-06-10 11:54:56', 'SmartSelect_20220507-100007_Adobe Acrobat.jpg', 0, 'liraki/images/db8a07a2-8bc9-45e6-91be-785822a48471.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/db8a07a2-8bc9-45e6-91be-785822a48471.jpg', 64853, 'd2bd9d15-1039-4444-8dcf-082592157bdd');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('051b1214-f0f6-4a15-b735-6b1065f282c6', '2022-05-26 15:51:03', 'SmartSelect_20220507-095752_Adobe Acrobat.jpg', 1, 'liraki/images/6c673a42-5cb0-4fd0-bdd8-2581d40de557.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/6c673a42-5cb0-4fd0-bdd8-2581d40de557.jpg', 44032, '95925ddf-95ff-4e5e-82a8-8d98cb5c7790');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('0adedac3-f3b7-4278-8539-9d65b68cb389', '2022-05-25 16:07:41', 'SmartSelect_20220507-094926_Adobe Acrobat.jpg', 0, 'liraki/images/c3f06c16-0d0e-46ea-ac04-eefb0911d981.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/c3f06c16-0d0e-46ea-ac04-eefb0911d981.jpg', 40671, '03819ff5-84a4-4bf2-bb23-fea2ca888a6f');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('0dd09197-f513-435f-9a1e-4dcad69f2850', '2022-05-26 14:32:21', 'SmartSelect_20220507-095607_Adobe Acrobat.jpg', 1, 'liraki/images/d2cd7858-b6b8-45da-9dd1-eaa6731617fa.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/d2cd7858-b6b8-45da-9dd1-eaa6731617fa.jpg', 56021, 'b1cb4347-9792-4454-b9f6-a8b5db3e9ee9');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('12439669-f294-41bd-ae66-c7a5d33cfce6', '2022-05-26 14:20:20', 'SmartSelect_20220507-095555_Adobe Acrobat.jpg', 1, 'liraki/images/105acc70-ce5e-4cc1-9e30-e151cf51939e.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/105acc70-ce5e-4cc1-9e30-e151cf51939e.jpg', 86342, 'fdf00dc4-cb2b-42a0-9b63-46132723946b');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('14245dde-8496-4f9c-954b-533a7aa89021', '2022-06-29 11:36:16', 'SmartSelect_20220507-104124_Adobe Acrobat.jpg', 0, 'liraki/images/e667b049-44a5-4238-b499-07781b3a48bf.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/e667b049-44a5-4238-b499-07781b3a48bf.jpg', 109381, 'e81f4e59-44cc-49fc-9d14-1a10b778fc4f');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('1487e071-fab9-4854-9c5e-e11fbcc5d190', '2022-06-10 11:47:17', 'SmartSelect_20220507-095909_Adobe Acrobat.jpg', 2, 'liraki/images/878370b5-ecea-46b2-9f90-667466ee0c01.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/878370b5-ecea-46b2-9f90-667466ee0c01.jpg', 25055, '2a04a96f-5b41-4140-ab9a-94ed38a75d6e');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('1751f704-e87b-4873-accb-e12fd15a7e19', '2022-06-16 16:21:40', 'SmartSelect_20220507-101240_Adobe Acrobat.jpg', 0, 'liraki/images/b54f1f5b-0813-45a3-8f93-86e6680de6bf.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/b54f1f5b-0813-45a3-8f93-86e6680de6bf.jpg', 135747, 'c6103880-4cce-4ffd-bb19-120e00986d14');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('178f63bc-7378-4acb-9c6c-fa282ba06383', '2022-06-16 16:21:40', 'SmartSelect_20220507-101228_Adobe Acrobat.jpg', 1, 'liraki/images/ca911af5-ce83-442b-a944-ca59e632cc56.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/ca911af5-ce83-442b-a944-ca59e632cc56.jpg', 156266, 'c6103880-4cce-4ffd-bb19-120e00986d14');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('18c49ef7-e6cc-48ee-88d4-f8f604eee156', '2022-05-25 10:29:13', 'SmartSelect_20220507-110625_Adobe Acrobat.jpg', 0, 'liraki/images/969b6a06-3e5f-49f6-b5b7-997684abbad6.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/969b6a06-3e5f-49f6-b5b7-997684abbad6.jpg', 43875, '410b5731-4c04-4262-a734-b5c03c140569');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('1a6bd71f-bd07-4fe0-bf60-4f98549982c7', '2022-05-26 19:50:25', 'SmartSelect_20220507-095729_Adobe Acrobat.jpg', 0, 'liraki/images/503ccb23-9b32-4b91-9e08-be85076edcab.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/503ccb23-9b32-4b91-9e08-be85076edcab.jpg', 64887, '95925ddf-95ff-4e5e-82a8-8d98cb5c7790');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('1ae86b5a-7649-4d54-87ce-a87674066c89', '2022-06-15 23:01:29', 'SmartSelect_20220507-101004_Adobe Acrobat.jpg', 0, 'liraki/images/c8b433b1-e44d-4750-a76b-4c5d202f7958.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/c8b433b1-e44d-4750-a76b-4c5d202f7958.jpg', 36095, 'dea18ab5-3cd2-4626-bcff-ef4126af7303');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('1bb0f447-c483-4ab1-817f-2cfc072dd368', '2022-06-10 11:54:56', 'SmartSelect_20220507-095943_Adobe Acrobat.jpg', 1, 'liraki/images/9ebdb6b4-5def-42f4-9b5d-e09281fed945.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/9ebdb6b4-5def-42f4-9b5d-e09281fed945.jpg', 43235, 'd2bd9d15-1039-4444-8dcf-082592157bdd');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('20e25d5a-2d41-4fa2-90cb-8abacb08a623', '2022-06-16 16:24:54', 'SmartSelect_20220507-101308_Adobe Acrobat.jpg', 4, 'liraki/images/19748029-e415-4f6d-970a-1a4b4765cf02.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/19748029-e415-4f6d-970a-1a4b4765cf02.jpg', 156950, '69ad9459-0273-46a9-a312-e5b7d8952e86');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('21649994-ad7e-40bc-98ee-a964b7ca6c30', '2022-06-15 23:20:35', 'SmartSelect_20220507-100511_Adobe Acrobat.jpg', 1, 'liraki/images/316fc011-eb6f-48b3-800c-9e762d5eee46.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/316fc011-eb6f-48b3-800c-9e762d5eee46.jpg', 75688, 'a23de6cb-54a0-475e-acfd-975c36de336e');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('243354cd-e401-4420-b707-45d789db0e80', '2022-05-26 14:00:05', 'SmartSelect_20220507-095121_Adobe Acrobat.jpg', 0, 'liraki/images/f169c8da-ffac-403a-9042-5397aef3e18b.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/f169c8da-ffac-403a-9042-5397aef3e18b.jpg', 38238, '0050a1a6-1ee2-4ad7-9685-8b8e6292e277');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('277b10af-dc73-46fc-b1c0-90450511faca', '2022-06-28 21:30:54', 'SmartSelect_20220507-101744_Adobe Acrobat.jpg', 0, 'liraki/images/46b50944-ac45-4402-896a-b939f8565d5f.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/46b50944-ac45-4402-896a-b939f8565d5f.jpg', 417855, '2d078933-ff74-43ae-8322-fc19ba53b39c');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('2b06b7c2-9b6e-45e9-9f5d-c67a8f954895', '2022-06-29 11:21:00', 'SmartSelect_20220507-102529_Adobe Acrobat.jpg', 1, 'liraki/images/69b4b97a-f4ca-4819-a492-4330d7e5f4a4.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/69b4b97a-f4ca-4819-a492-4330d7e5f4a4.jpg', 175295, 'e19d5792-f417-411e-abce-436ef5fb7815');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('2c4330ed-cb7a-4649-b264-96ce9ab6d44d', '2022-06-16 16:24:54', 'SmartSelect_20220507-101259_Adobe Acrobat.jpg', 3, 'liraki/images/86319beb-cc51-45bb-9fe4-72e1db7c0ea1.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/86319beb-cc51-45bb-9fe4-72e1db7c0ea1.jpg', 123814, '69ad9459-0273-46a9-a312-e5b7d8952e86');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('2c979e05-a2fc-4deb-a55b-41ab1dcd77ce', '2022-06-29 11:25:57', 'SmartSelect_20220507-102654_Adobe Acrobat.jpg', 2, 'liraki/images/030c1a20-46e2-475a-ac8c-8f8a3a8c9eea.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/030c1a20-46e2-475a-ac8c-8f8a3a8c9eea.jpg', 138234, '51ca6e63-a7ef-4b11-ac4a-d885f5479340');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('2d1ae37e-5a5d-4c3a-80b0-a2ac299b41a2', '2022-06-16 16:24:54', 'SmartSelect_20220507-101250_Adobe Acrobat.jpg', 2, 'liraki/images/6e2ccfd9-ee20-4b87-a82f-e12e15cbc3de.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/6e2ccfd9-ee20-4b87-a82f-e12e15cbc3de.jpg', 126395, '69ad9459-0273-46a9-a312-e5b7d8952e86');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('2e432487-9dc7-4dba-b0e8-9084717d96f3', '2022-06-10 11:47:17', 'SmartSelect_20220507-095853_Adobe Acrobat.jpg', 1, 'liraki/images/9c44475b-db46-4674-8392-43b7206c8053.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/9c44475b-db46-4674-8392-43b7206c8053.jpg', 28719, '2a04a96f-5b41-4140-ab9a-94ed38a75d6e');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('30db4005-f5e4-46dd-955e-e21ba217afbe', '2022-06-29 11:23:11', 'SmartSelect_20220507-102631_Adobe Acrobat.jpg', 1, 'liraki/images/72d7d716-07d2-4c22-9d0b-72b2cce78b2c.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/72d7d716-07d2-4c22-9d0b-72b2cce78b2c.jpg', 143112, 'b877f8ba-4a1b-426a-8901-762a5ec02746');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('32580e3a-d164-4204-b141-f9adf1df1d60', '2022-05-26 14:36:23', 'SmartSelect_20220507-095643_Adobe Acrobat.jpg', 0, 'liraki/images/49e9cfa4-fc85-4d68-bab0-5628f93fc596.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/49e9cfa4-fc85-4d68-bab0-5628f93fc596.jpg', 90909, '02cea732-e77c-4546-b841-0fd048f15d0c');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('36b38c4a-f8e3-44db-93d8-370ad98239c9', '2022-06-29 11:31:29', 'SmartSelect_20220507-103350_Adobe Acrobat.jpg', 1, 'liraki/images/e0d5cc63-d270-47a1-b77b-b05f9be5e9f9.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/e0d5cc63-d270-47a1-b77b-b05f9be5e9f9.jpg', 18582, '6ff0adec-3491-4d93-b038-d25effe2dfc1');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('3794038f-a381-4752-b251-ff540eb6b466', '2022-06-29 11:31:30', 'SmartSelect_20220507-103404_Adobe Acrobat.jpg', 0, 'liraki/images/4a12399b-6692-4c30-b20d-45e11abe4b97.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/4a12399b-6692-4c30-b20d-45e11abe4b97.jpg', 144811, '6ff0adec-3491-4d93-b038-d25effe2dfc1');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('3a39bbd1-4891-456b-a61a-a353061e3d62', '2022-06-16 17:02:08', 'SmartSelect_20220507-101228_Adobe Acrobat.jpg', 1, 'liraki/images/51209be2-79b7-4c6d-bb85-47c2cb2205f4.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/51209be2-79b7-4c6d-bb85-47c2cb2205f4.jpg', 156266, '46445a16-b0e9-4200-a080-3cf1cd20cca0');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('3dbdc06d-cb43-42b5-ac67-6893c5207c21', '2022-05-24 23:18:41', 'SmartSelect_20220507-110243_Adobe Acrobat.jpg', 0, 'liraki/images/d50682ad-c0aa-4b25-800a-8c3a02545aa0.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/d50682ad-c0aa-4b25-800a-8c3a02545aa0.jpg', 30912, '7bd5774f-6174-48a9-b456-ed132353885a');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('3de8ab15-29b2-4544-a419-20fd25261476', '2022-05-24 21:46:53', 'SmartSelect_20220507-110357_Adobe Acrobat.jpg', 0, 'liraki/images/7317f0b2-d809-48fc-8b44-b79d707b807b.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/7317f0b2-d809-48fc-8b44-b79d707b807b.jpg', 51995, 'ce1c1bf2-d9a1-449d-a02b-9b3f220f1dbb');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('3e55e21e-7b12-4e52-824d-bda4a24f9242', '2022-06-16 16:21:39', 'SmartSelect_20220507-101308_Adobe Acrobat.jpg', 4, 'liraki/images/6decf604-2a93-4180-9214-4d24e78ecdd2.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/6decf604-2a93-4180-9214-4d24e78ecdd2.jpg', 156950, 'c6103880-4cce-4ffd-bb19-120e00986d14');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('3f79bff0-9554-4ed2-8514-028a59f5fa4b', '2022-06-16 16:21:39', 'SmartSelect_20220507-101259_Adobe Acrobat.jpg', 3, 'liraki/images/03d631e9-fac7-4f94-9513-65ef230be204.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/03d631e9-fac7-4f94-9513-65ef230be204.jpg', 123814, 'c6103880-4cce-4ffd-bb19-120e00986d14');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('43f8a1f9-fa52-4753-b83b-25dac1e09957', '2022-05-25 12:25:44', 'SmartSelect_20220507-105958_Adobe Acrobat.jpg', 0, 'liraki/images/f25cb054-c538-4ed7-8b81-9d52dcc094d3.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/f25cb054-c538-4ed7-8b81-9d52dcc094d3.jpg', 80808, 'cb099636-c1c2-44d5-8c25-8d18cf619e23');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('594af716-531f-43e4-913f-26e03b52d432', '2022-06-10 11:47:17', 'SmartSelect_20220507-095931_Adobe Acrobat.jpg', 0, 'liraki/images/d3cbe1ea-4870-4ffb-826b-2878d01eb250.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/d3cbe1ea-4870-4ffb-826b-2878d01eb250.jpg', 73257, '2a04a96f-5b41-4140-ab9a-94ed38a75d6e');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('59a14464-f81b-4933-9dce-2138423967f7', '2022-06-15 22:44:27', 'SmartSelect_20220507-100924_Adobe Acrobat.jpg', 1, 'liraki/images/12b2ef9d-373e-42c6-9ae8-bd895cf32c26.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/12b2ef9d-373e-42c6-9ae8-bd895cf32c26.jpg', 70504, '9104aded-4387-44dd-a95d-850445433181');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('5a391145-adf9-4094-828b-f9ede12f968c', '2022-05-24 22:35:14', 'SmartSelect_20220507-110257_Adobe Acrobat.jpg', 0, 'liraki/images/bd07b406-0269-4299-a45c-361d7b914a49.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/bd07b406-0269-4299-a45c-361d7b914a49.jpg', 75056, '24a102fe-58cf-4de1-9063-1db1c75d9eb4');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('5dd0761c-742f-4355-8d20-1131e074189c', '2022-05-24 22:31:19', 'SmartSelect_20220507-110307_Adobe Acrobat.jpg', 0, 'liraki/images/3380e6ad-e10a-4ee3-9a47-a1dc821323f8.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/3380e6ad-e10a-4ee3-9a47-a1dc821323f8.jpg', 62219, '447bac09-6ed6-48cb-9d43-321833b91eee');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('63e397a7-5ab5-4a7b-b06d-0d8fc62a0c81', '2022-06-16 16:24:55', 'SmartSelect_20220507-101228_Adobe Acrobat.jpg', 1, 'liraki/images/b2073ec4-5872-4bed-a495-67a35ceafca2.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/b2073ec4-5872-4bed-a495-67a35ceafca2.jpg', 156266, '69ad9459-0273-46a9-a312-e5b7d8952e86');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('65865561-4118-4638-bdd1-b200619bb307', '2022-05-26 14:08:09', 'SmartSelect_20220507-095404_Adobe Acrobat.jpg', 1, 'liraki/images/21cdaa22-7d2a-460b-9f05-2cc74b72be94.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/21cdaa22-7d2a-460b-9f05-2cc74b72be94.jpg', 78244, 'c05c67f9-8333-4c0b-b170-4929a2661085');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('6590a35c-fe29-44d9-a4db-925cfcf68010', '2022-06-15 22:34:27', 'SmartSelect_20220507-100704_Adobe Acrobat.jpg', 0, 'liraki/images/56e84f64-80b2-4624-b20e-f45a06b0c600.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/56e84f64-80b2-4624-b20e-f45a06b0c600.jpg', 65165, '353f7727-3130-46a3-be67-92ab0896a630');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('68b09ad9-f205-41f4-924d-51c8af50825a', '2022-06-28 21:33:13', 'SmartSelect_20220507-101822_Adobe Acrobat.jpg', 0, 'liraki/images/888674d1-4871-40d6-8cf9-9ba7f5fe92dd.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/888674d1-4871-40d6-8cf9-9ba7f5fe92dd.jpg', 363251, '8910a1bb-e604-4fb7-b745-837c7a22b4b0');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('68b94741-2271-4b5e-888f-9340fe9db381', '2022-06-29 11:47:01', 'SmartSelect_20220507-104153_Adobe Acrobat.jpg', 0, 'liraki/images/7244bd33-6b5b-449a-bba0-e7dc3f58edad.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/7244bd33-6b5b-449a-bba0-e7dc3f58edad.jpg', 87395, '02718e83-f899-4242-97c2-ae550e750683');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('6b21e4f0-226b-410b-87a2-b04758c08feb', '2022-06-29 11:23:11', 'SmartSelect_20220507-102624_Adobe Acrobat.jpg', 0, 'liraki/images/e3ba3f7c-74d0-4169-8890-c175b8810c21.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/e3ba3f7c-74d0-4169-8890-c175b8810c21.jpg', 146099, 'b877f8ba-4a1b-426a-8901-762a5ec02746');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('6ebea786-f91e-438c-ab35-8006b8989055', '2022-05-25 10:20:18', 'SmartSelect_20220507-110139_Adobe Acrobat.jpg', 0, 'liraki/images/c98c5804-a7e5-45e5-a081-eff0c66ccf29.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/c98c5804-a7e5-45e5-a081-eff0c66ccf29.jpg', 77300, 'b30ac8ef-ad14-477e-9f57-0fa0eba5d71d');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('6fc2ce90-05d6-4e1e-a195-265a63a7a713', '2022-05-25 13:48:47', 'SmartSelect_20220507-105939_Adobe Acrobat.jpg', 0, 'liraki/images/ea1ac177-9761-4174-a194-1b40cd622689.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/ea1ac177-9761-4174-a194-1b40cd622689.jpg', 77626, 'a35424cc-fd28-44ac-a604-4c4b2d628f43');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('7434fa35-eee2-4cb1-be6a-7cefe5845dbb', '2022-06-29 11:21:03', 'SmartSelect_20220507-102543_Adobe Acrobat.jpg', 2, 'liraki/images/b377e3e7-e316-4632-909d-9d220fa8296a.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/b377e3e7-e316-4632-909d-9d220fa8296a.jpg', 288343, 'e19d5792-f417-411e-abce-436ef5fb7815');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('7483f9dc-92b7-45dc-8452-88a4e7ff80e1', '2022-06-16 17:02:08', 'SmartSelect_20220507-101250_Adobe Acrobat.jpg', 2, 'liraki/images/1fe6e86f-b31d-4556-8bc6-fc96ed50d8a3.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/1fe6e86f-b31d-4556-8bc6-fc96ed50d8a3.jpg', 126395, '46445a16-b0e9-4200-a080-3cf1cd20cca0');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('773b05ec-e531-4647-b9df-018609cd85cc', '2022-06-11 10:36:36', 'SmartSelect_20220507-100434_Adobe Acrobat.jpg', 2, 'liraki/images/7585cb75-cd46-4b8f-9a2e-02d2f09d8024.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/7585cb75-cd46-4b8f-9a2e-02d2f09d8024.jpg', 104918, '4cc90ad9-5e15-436d-8106-bf3cddd1ab41');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('7b4a6318-0e12-4b26-a991-657f625087a9', '2022-06-11 10:36:36', 'SmartSelect_20220507-100415_Adobe Acrobat.jpg', 0, 'liraki/images/6e97b1af-b0ca-46e6-8bd1-4983842b3617.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/6e97b1af-b0ca-46e6-8bd1-4983842b3617.jpg', 62978, '4cc90ad9-5e15-436d-8106-bf3cddd1ab41');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('8632db01-3857-40f0-a35d-483703935ea4', '2022-05-25 18:10:25', 'SmartSelect_20220507-094732_Adobe Acrobat.jpg', 3, 'liraki/images/3ecb238e-34ce-4130-8a2c-44d94555578b.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/3ecb238e-34ce-4130-8a2c-44d94555578b.jpg', 68719, '4d6712b0-c7f5-48f2-bfa5-305e8a766781');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('877870c4-f956-4ecd-8bcc-bc96541c6142', '2022-05-26 14:13:33', 'SmartSelect_20220507-095510_Adobe Acrobat.jpg', 2, 'liraki/images/b6bf7042-efe0-4a15-9bbc-62b2c26bc13c.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/b6bf7042-efe0-4a15-9bbc-62b2c26bc13c.jpg', 29699, '72668ec0-19d6-4062-9477-45623f4f3f9a');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('8df9ab12-eb70-4aa9-9368-e31052759448', '2022-06-28 21:36:07', 'SmartSelect_20220507-101834_Adobe Acrobat.jpg', 1, 'liraki/images/8da80d9a-71b3-4cee-8952-48658f186e16.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/8da80d9a-71b3-4cee-8952-48658f186e16.jpg', 183967, '56eb1196-c03c-4c5a-84bd-64284c32d9eb');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('976cd7c0-dcd9-4eaa-ad02-d1dcb55676fb', '2022-06-10 22:31:07', 'SmartSelect_20220507-100349_Adobe Acrobat.jpg', 1, 'liraki/images/aaa3f1b3-4bc8-458d-bdee-38b2d5fd718f.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/aaa3f1b3-4bc8-458d-bdee-38b2d5fd718f.jpg', 57897, '4b9e4a99-2619-4805-ac41-0428dc4bce45');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('9863e469-73c3-48a7-99d8-3d62446dee69', '2022-06-16 16:21:40', 'SmartSelect_20220507-101250_Adobe Acrobat.jpg', 2, 'liraki/images/32321c5f-5172-405e-b8dd-ef3ff5693ef0.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/32321c5f-5172-405e-b8dd-ef3ff5693ef0.jpg', 126395, 'c6103880-4cce-4ffd-bb19-120e00986d14');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('9d62301a-ed37-4d49-892a-2833c6c4d1ce', '2022-05-24 22:27:03', 'SmartSelect_20220507-110321_Adobe Acrobat.jpg', 0, 'liraki/images/54c338c8-1dfa-4c9c-8eed-d6f0193f704e.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/54c338c8-1dfa-4c9c-8eed-d6f0193f704e.jpg', 63641, 'decda335-f5d2-4987-96bf-79794f1462ab');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('a211d5f3-d08e-474b-a2d4-baa58957e377', '2022-05-26 14:08:09', 'SmartSelect_20220507-095428_Adobe Acrobat.jpg', 2, 'liraki/images/876d08ea-a68e-4292-8367-61f985a45b3c.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/876d08ea-a68e-4292-8367-61f985a45b3c.jpg', 69142, 'c05c67f9-8333-4c0b-b170-4929a2661085');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('a2faf594-e98f-4f92-8ab8-88fba31853f7', '2022-05-25 16:04:13', 'SmartSelect_20220507-094849_Adobe Acrobat.jpg', 0, 'liraki/images/d1134ae5-e83c-449b-a39a-31dc74207c51.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/d1134ae5-e83c-449b-a39a-31dc74207c51.jpg', 77168, '36d2421b-cbae-4dd3-aac7-4544efc9d6af');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('a3f20f38-a1d3-4b4e-a9cb-44c654bcff5e', '2022-06-15 23:20:35', 'SmartSelect_20220507-100559_Adobe Acrobat.jpg', 2, 'liraki/images/2370e29b-6c39-4079-bcea-badc5beee53e.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/2370e29b-6c39-4079-bcea-badc5beee53e.jpg', 55682, 'a23de6cb-54a0-475e-acfd-975c36de336e');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('a665b0bd-8210-4149-a7e8-1b91017cfff0', '2022-06-10 22:31:07', 'SmartSelect_20220507-100134_Adobe Acrobat.jpg', 0, 'liraki/images/74a3b01a-6c5e-4f3a-ae6a-5296335015b6.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/74a3b01a-6c5e-4f3a-ae6a-5296335015b6.jpg', 59402, '4b9e4a99-2619-4805-ac41-0428dc4bce45');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('a7c52150-b5b3-4363-86c5-927853820365', '2022-05-26 14:05:12', 'SmartSelect_20220507-095150_Adobe Acrobat.jpg', 1, 'liraki/images/a8038a93-e532-42e6-827c-0e7a047ad493.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/a8038a93-e532-42e6-827c-0e7a047ad493.jpg', 19501, '208dbcc3-caeb-401a-aec2-03c97db83495');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('a809d36b-f0a7-472e-b3bd-4760430f27bf', '2022-06-10 14:11:32', 'SmartSelect_20220507-100120_Adobe Acrobat.jpg', 1, 'liraki/images/4f4563b8-cbd2-4cdb-9472-f896641828d7.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/4f4563b8-cbd2-4cdb-9472-f896641828d7.jpg', 42526, '6dd0e270-fb5c-4e27-ab6f-c8e79c258047');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('a820ea07-f379-4f1a-98ae-1d6d398f7a97', '2022-05-25 18:10:25', 'SmartSelect_20220507-094701_Adobe Acrobat.jpg', 0, 'liraki/images/a8a151bb-a577-4283-963b-1bfbdec9cf9d.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/a8a151bb-a577-4283-963b-1bfbdec9cf9d.jpg', 46472, '4d6712b0-c7f5-48f2-bfa5-305e8a766781');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('a8bea73c-0caf-4389-a067-2ca14d83903e', '2022-05-26 14:08:09', 'SmartSelect_20220507-095214_Adobe Acrobat.jpg', 0, 'liraki/images/a10f816e-4f3d-4caa-9322-0f5f80febb24.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/a10f816e-4f3d-4caa-9322-0f5f80febb24.jpg', 29731, 'c05c67f9-8333-4c0b-b170-4929a2661085');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('a990d96e-ddbd-4d41-bd0d-97a5db88ace5', '2022-05-26 18:31:48', 'SmartSelect_20220507-095621_Adobe Acrobat.jpg', 0, 'liraki/images/9c61bad1-f09f-44c4-a37d-86fe873ec22d.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/9c61bad1-f09f-44c4-a37d-86fe873ec22d.jpg', 114825, 'b1cb4347-9792-4454-b9f6-a8b5db3e9ee9');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('aa78aa77-2a51-41eb-9b8c-39ffcc8d858c', '2022-06-29 11:23:11', 'SmartSelect_20220507-102643_Adobe Acrobat.jpg', 2, 'liraki/images/850b5aef-0d30-4561-8e81-0eb4f91e2284.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/850b5aef-0d30-4561-8e81-0eb4f91e2284.jpg', 356233, 'b877f8ba-4a1b-426a-8901-762a5ec02746');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('ab824d07-505c-46d1-b047-9d0d046b58e6', '2022-05-25 16:07:41', 'SmartSelect_20220507-094910_Adobe Acrobat.jpg', 1, 'liraki/images/d093c2ab-ef2b-4534-81d5-514a1adcbcc2.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/d093c2ab-ef2b-4534-81d5-514a1adcbcc2.jpg', 43298, '03819ff5-84a4-4bf2-bb23-fea2ca888a6f');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('b1394e06-5fd5-4a6c-a95a-77831ee744ee', '2022-06-15 22:56:53', 'SmartSelect_20220507-100937_Adobe Acrobat.jpg', 0, 'liraki/images/928f28a8-0e27-4f78-8903-bc7471cc9852.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/928f28a8-0e27-4f78-8903-bc7471cc9852.jpg', 55854, '0ffbfaa6-a0f3-4374-afda-a7dee8bd8618');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('bae51dc6-0789-4e27-b914-400d8370dd73', '2022-06-15 22:04:26', 'SmartSelect_20220507-100718_Adobe Acrobat.jpg', 0, 'liraki/images/cc3e9f43-c08d-46b6-8f74-84099e667c40.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/cc3e9f43-c08d-46b6-8f74-84099e667c40.jpg', 89076, 'd54e1a74-b861-4ad6-a934-c1f5661997b3');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('bb0fe298-3a43-4f35-ab65-9353f1201dac', '2022-05-25 04:25:27', 'SmartSelect_20220507-110217_Adobe Acrobat.jpg', 0, 'liraki/images/cf876c7e-e72a-4b23-8914-3249d9c4849b.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/cf876c7e-e72a-4b23-8914-3249d9c4849b.jpg', 27910, '006fe36f-1f53-49c6-b5d6-5dcca6571d42');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('bb31da84-d0a6-4f31-8f68-e28bbd140999', '2022-06-15 22:44:27', 'SmartSelect_20220507-100809_Adobe Acrobat.jpg', 0, 'liraki/images/fab62914-9131-48c3-bfda-3e056e19f752.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/fab62914-9131-48c3-bfda-3e056e19f752.jpg', 89397, '9104aded-4387-44dd-a95d-850445433181');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('bd354e3f-04ac-4bc6-abf5-df6558d77f98', '2022-06-15 22:04:25', 'SmartSelect_20220507-100654_Adobe Acrobat.jpg', 1, 'liraki/images/10786f12-5d48-4a42-992c-cdc8030e5f6e.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/10786f12-5d48-4a42-992c-cdc8030e5f6e.jpg', 25746, 'd54e1a74-b861-4ad6-a934-c1f5661997b3');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('c7f391f4-e0db-415f-ba34-dbe35775e7d2', '2022-06-15 23:20:35', 'SmartSelect_20220507-100625_Adobe Acrobat.jpg', 0, 'liraki/images/83d5772c-7176-4433-bc20-3fb540792eeb.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/83d5772c-7176-4433-bc20-3fb540792eeb.jpg', 51002, 'a23de6cb-54a0-475e-acfd-975c36de336e');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('c8cb82fa-5d31-4b09-841d-ee37098d574c', '2022-06-29 11:41:00', 'SmartSelect_20220507-104141_Adobe Acrobat.jpg', 0, 'liraki/images/9a02808a-efed-4318-9101-13de0c013910.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/9a02808a-efed-4318-9101-13de0c013910.jpg', 162760, 'c6bdc4d0-d3ae-4365-86fd-09777b602cdc');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('ce824992-4419-4349-a542-05f74b5d5f8d', '2022-06-29 11:25:57', 'SmartSelect_20220507-102702_Adobe Acrobat.jpg', 0, 'liraki/images/e3b6d6ee-e69c-433e-a4f0-d7d33c9b2e33.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/e3b6d6ee-e69c-433e-a4f0-d7d33c9b2e33.jpg', 137544, '51ca6e63-a7ef-4b11-ac4a-d885f5479340');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('cfe08624-b044-47b3-9e7b-4fa256a8c36b', '2022-06-28 21:36:06', 'SmartSelect_20220507-101842_Adobe Acrobat.jpg', 0, 'liraki/images/9391575f-6a8d-4b5a-870d-d5cbbfd6562f.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/9391575f-6a8d-4b5a-870d-d5cbbfd6562f.jpg', 171922, '56eb1196-c03c-4c5a-84bd-64284c32d9eb');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('d0004bf4-2942-4c59-ac4c-0e466287633d', '2022-06-15 19:22:21', 'SmartSelect_20220507-100559_Adobe Acrobat.jpg', 3, 'liraki/images/99890f38-65db-4b04-8592-6cb8a2d75f91.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/99890f38-65db-4b04-8592-6cb8a2d75f91.jpg', 55682, '4cc90ad9-5e15-436d-8106-bf3cddd1ab41');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('d39fbea8-6d7a-49bb-9769-4eb302faee9a', '2022-05-25 18:10:26', 'SmartSelect_20220507-094548_Adobe Acrobat.jpg', 2, 'liraki/images/e123ecbf-b0e3-4a94-a0a1-104b97a3d77e.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/e123ecbf-b0e3-4a94-a0a1-104b97a3d77e.jpg', 66510, '4d6712b0-c7f5-48f2-bfa5-305e8a766781');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('d4d83e8d-d839-4634-97a3-84597752a52e', '2022-05-25 15:40:24', 'SmartSelect_20220507-094834_Adobe Acrobat.jpg', 0, 'liraki/images/b04fb579-e3a1-49ca-af38-26741807cb61.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/b04fb579-e3a1-49ca-af38-26741807cb61.jpg', 59342, 'd6741f11-aa21-486a-817f-1d516c452da1');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('d7484e2b-4f46-4d6c-b7a3-1f8bd25e8367', '2022-06-29 11:25:58', 'SmartSelect_20220507-102709_Adobe Acrobat.jpg', 1, 'liraki/images/72ba59bc-4fa2-4e42-aeeb-64b60b0f7dfb.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/72ba59bc-4fa2-4e42-aeeb-64b60b0f7dfb.jpg', 326711, '51ca6e63-a7ef-4b11-ac4a-d885f5479340');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('d86ad06d-9480-49ea-9b7b-e1b1f34a1ab3', '2022-06-16 16:24:54', 'SmartSelect_20220507-101240_Adobe Acrobat.jpg', 0, 'liraki/images/8b626715-5ae8-48f4-ac04-d89e726d2832.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/8b626715-5ae8-48f4-ac04-d89e726d2832.jpg', 135747, '69ad9459-0273-46a9-a312-e5b7d8952e86');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('d98b8226-cff2-44a2-a140-91f050f32488', '2022-05-26 14:13:33', 'SmartSelect_20220507-095524_Adobe Acrobat.jpg', 0, 'liraki/images/261c3e3d-0353-4b33-acda-b07a3adddae0.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/261c3e3d-0353-4b33-acda-b07a3adddae0.jpg', 97300, '72668ec0-19d6-4062-9477-45623f4f3f9a');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('db709192-842f-403a-b287-e7d3e971db72', '2022-06-16 17:02:08', 'SmartSelect_20220507-101308_Adobe Acrobat.jpg', 4, 'liraki/images/d613ea21-9075-48c4-902f-dbfe4d14976f.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/d613ea21-9075-48c4-902f-dbfe4d14976f.jpg', 156950, '46445a16-b0e9-4200-a080-3cf1cd20cca0');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('dd7d3767-0dfc-4144-8b2e-c46336ab8a72', '2022-06-15 22:34:27', 'SmartSelect_20220507-100654_Adobe Acrobat.jpg', 1, 'liraki/images/f3304b96-bafb-48e0-8a77-fff497311c18.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/f3304b96-bafb-48e0-8a77-fff497311c18.jpg', 25746, '353f7727-3130-46a3-be67-92ab0896a630');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('deeee85b-7a25-4438-b9eb-ad3a32faecef', '2022-06-15 22:56:53', 'SmartSelect_20220507-100952_Adobe Acrobat.jpg', 1, 'liraki/images/0cc523dd-9263-414d-a392-8df80a42226b.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/0cc523dd-9263-414d-a392-8df80a42226b.jpg', 93982, '0ffbfaa6-a0f3-4374-afda-a7dee8bd8618');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('e06599c3-b217-46a0-8b2c-5fd20075334e', '2022-05-25 18:10:26', 'SmartSelect_20220507-094808_Adobe Acrobat.jpg', 1, 'liraki/images/60b0e605-a447-4ee6-bbec-ecac378eb2aa.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/60b0e605-a447-4ee6-bbec-ecac378eb2aa.jpg', 60815, '4d6712b0-c7f5-48f2-bfa5-305e8a766781');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('e1b102c5-a975-4937-9866-a27d2f5ff838', '2022-06-16 17:02:08', 'SmartSelect_20220507-101240_Adobe Acrobat.jpg', 0, 'liraki/images/1c2bfcf1-4b0c-476a-b0ef-c9dd68844f2e.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/1c2bfcf1-4b0c-476a-b0ef-c9dd68844f2e.jpg', 135747, '46445a16-b0e9-4200-a080-3cf1cd20cca0');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('e471ebe4-7415-4724-9911-df4064efea00', '2022-06-15 19:22:21', 'SmartSelect_20220507-100511_Adobe Acrobat.jpg', 1, 'liraki/images/597e04a1-8c39-45f0-978c-543dfbb7bfc6.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/597e04a1-8c39-45f0-978c-543dfbb7bfc6.jpg', 75688, '4cc90ad9-5e15-436d-8106-bf3cddd1ab41');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('e7a7dc22-2164-4c2b-8ca1-ac055ced1b8f', '2022-06-29 11:21:00', 'SmartSelect_20220507-102522_Adobe Acrobat.jpg', 0, 'liraki/images/62567def-0de9-4f7e-9c5c-bb06e918f031.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/62567def-0de9-4f7e-9c5c-bb06e918f031.jpg', 170096, 'e19d5792-f417-411e-abce-436ef5fb7815');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('e87ad6f2-6ce0-4497-9327-015e2cdb4c0a', '2022-05-26 14:20:20', 'SmartSelect_20220507-095540_Adobe Acrobat.jpg', 0, 'liraki/images/62f7ac63-8e27-48cb-8685-b82f2b7057b9.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/62f7ac63-8e27-48cb-8685-b82f2b7057b9.jpg', 67750, 'fdf00dc4-cb2b-42a0-9b63-46132723946b');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('e940b279-4242-4055-8f98-62636dd41465', '2022-06-15 22:34:27', 'SmartSelect_20220507-100718_Adobe Acrobat.jpg', 2, 'liraki/images/3dba7ced-0f7b-4522-9dfe-393ca0ef351e.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/3dba7ced-0f7b-4522-9dfe-393ca0ef351e.jpg', 89076, '353f7727-3130-46a3-be67-92ab0896a630');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('eb6a852e-1fc9-4bed-a502-db5ba01b504d', '2022-06-15 23:01:29', 'SmartSelect_20220507-101037_Adobe Acrobat.jpg', 1, 'liraki/images/b940d177-e844-4224-a5f7-8e4cae8c406e.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/b940d177-e844-4224-a5f7-8e4cae8c406e.jpg', 82424, 'dea18ab5-3cd2-4626-bcff-ef4126af7303');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('eca56ce4-ade4-4e64-91ec-b0a113b15ffe', '2022-06-10 14:11:32', 'SmartSelect_20220507-100022_Adobe Acrobat.jpg', 0, 'liraki/images/094803eb-657a-4f00-86eb-98cb6e167249.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/094803eb-657a-4f00-86eb-98cb6e167249.jpg', 44120, '6dd0e270-fb5c-4e27-ab6f-c8e79c258047');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('ece446eb-9f50-4e23-8cf1-8e043d00836c', '2022-05-26 14:05:12', 'SmartSelect_20220507-095141_Adobe Acrobat.jpg', 2, 'liraki/images/b7295623-6d0b-4c16-b3f8-7fd265f2064e.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/b7295623-6d0b-4c16-b3f8-7fd265f2064e.jpg', 19545, '208dbcc3-caeb-401a-aec2-03c97db83495');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('f21cccc5-02aa-4c0e-a243-c104c3d48a21', '2022-05-26 14:05:12', 'SmartSelect_20220507-095201_Adobe Acrobat.jpg', 0, 'liraki/images/52d0fdb7-f50f-4457-9779-9dd8894fd9a7.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/52d0fdb7-f50f-4457-9779-9dd8894fd9a7.jpg', 39959, '208dbcc3-caeb-401a-aec2-03c97db83495');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('f5a16150-fe86-43cc-8768-2dfb65dc2afb', '2022-06-15 22:04:26', 'SmartSelect_20220507-100704_Adobe Acrobat.jpg', 2, 'liraki/images/65e5f15b-9882-4941-a67b-23116c1a5c4f.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/65e5f15b-9882-4941-a67b-23116c1a5c4f.jpg', 65165, 'd54e1a74-b861-4ad6-a934-c1f5661997b3');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('f84da4b2-1193-4f20-bdd4-27a5bb62ba62', '2022-05-26 14:13:33', 'SmartSelect_20220507-095500_Adobe Acrobat.jpg', 1, 'liraki/images/ba05a868-e17c-47ba-abc3-2b1327cf0065.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/ba05a868-e17c-47ba-abc3-2b1327cf0065.jpg', 54656, '72668ec0-19d6-4062-9477-45623f4f3f9a');




INSERT INTO mendozarq.venta (uuid, creadoEn, numeroVenta, nombreFactura, nitCiCex, departamento, direccion, descripcion, tipoVenta, tipoEnvio, metodoDePago, estado, total, uuidCliente, uuidVendedor) VALUES ('1b85459b-d8d9-4c48-ba86-d9e5b5c22e62', '2022-06-29 12:30:55', 1000005, 'sáenz ribes', '4322233', 'cbba', '4988 Mondragón Rincón
    ', '', 'fisica', 'personal', 'efectivo', 'para_recoger', 10078.99, '81ed9811-5b7a-4316-8e9d-7081df740265', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72');
INSERT INTO mendozarq.venta (uuid, creadoEn, numeroVenta, nombreFactura, nitCiCex, departamento, direccion, descripcion, tipoVenta, tipoEnvio, metodoDePago, estado, total, uuidCliente, uuidVendedor) VALUES ('2b518b2e-58df-477b-8249-429da46901ed', '2022-06-29 12:28:06', 1000003, 'cabrero castillo', '876663', 'cbba', '81863 Pelayo Parque ', 'La puerta de la casa es de color verde y se ubicada a lado de la parada de micros 12', 'online', 'delivery', 'efectivo', 'completado', 15649.99, 'bf493a64-4573-433f-92b0-edbcae73a98b', null);
INSERT INTO mendozarq.venta (uuid, creadoEn, numeroVenta, nombreFactura, nitCiCex, departamento, direccion, descripcion, tipoVenta, tipoEnvio, metodoDePago, estado, total, uuidCliente, uuidVendedor) VALUES ('6350d397-fdc4-4ea7-b066-3f6d581d33b8', '2022-06-29 12:39:39', 1000010, 'ruano ', '5347567', 'cbba', '4265 Korta hernandez Vía Pública
    ', '', 'fisica', 'delivery', 'efectivo', 'confirmado', 7552.00, '178e1faa-b3f0-4900-a7b5-a19085c0cf9c', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72');
INSERT INTO mendozarq.venta (uuid, creadoEn, numeroVenta, nombreFactura, nitCiCex, departamento, direccion, descripcion, tipoVenta, tipoEnvio, metodoDePago, estado, total, uuidCliente, uuidVendedor) VALUES ('6a88f8b1-aeb2-44b7-ab52-cc0a59e2c9ab', '2022-06-29 12:29:55', 1000004, 'pintor benavides', '98667', 'cbba', '1953 Axel Huerta
    ', '', 'fisica', 'personal', 'efectivo', 'completado', 3247.99, 'a5b86b62-0ef8-4d23-a2f8-a242daa25103', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72');
INSERT INTO mendozarq.venta (uuid, creadoEn, numeroVenta, nombreFactura, nitCiCex, departamento, direccion, descripcion, tipoVenta, tipoEnvio, metodoDePago, estado, total, uuidCliente, uuidVendedor) VALUES ('919635bc-9f01-431e-a7dc-788c19c6647c', '2022-06-29 12:39:05', 1000009, 'sobrino suárez', '3462345', 'cbba', '77864 Enrique Colonia', '', 'fisica', 'delivery', 'efectivo', 'confirmado', 1950.00, 'ce754db3-3b9c-4dd5-81f1-ae2b5f5a060a', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72');
INSERT INTO mendozarq.venta (uuid, creadoEn, numeroVenta, nombreFactura, nitCiCex, departamento, direccion, descripcion, tipoVenta, tipoEnvio, metodoDePago, estado, total, uuidCliente, uuidVendedor) VALUES ('b015d58f-2706-4da2-901e-9d856cd461a3', '2022-06-29 12:32:30', 1000006, 'cabrero castillo', '5344566', 'cbba', '81863 Pelayo Parque sdsadasdas', '', 'online', 'delivery', 'deposito_transferencia_qr', 'confirmado', 2700.00, 'bf493a64-4573-433f-92b0-edbcae73a98b', null);
INSERT INTO mendozarq.venta (uuid, creadoEn, numeroVenta, nombreFactura, nitCiCex, departamento, direccion, descripcion, tipoVenta, tipoEnvio, metodoDePago, estado, total, uuidCliente, uuidVendedor) VALUES ('cd0c3ce0-3634-4895-946e-ef7df6945880', '2022-06-29 13:22:24', 1000011, 'villa jordán', '4325645', 'cbba', '817 Tamayo Grupo
    ', '', 'online', 'personal', 'deposito_transferencia_qr', 'completado', 6000.00, '2319b069-bde2-452c-af94-ec08f68c722c', null);
INSERT INTO mendozarq.venta (uuid, creadoEn, numeroVenta, nombreFactura, nitCiCex, departamento, direccion, descripcion, tipoVenta, tipoEnvio, metodoDePago, estado, total, uuidCliente, uuidVendedor) VALUES ('e28fac07-aa33-4b9e-9f7e-5198a8bb8567', '2022-06-29 12:35:42', 1000007, 'del gelabert', '4523256', 'cbba', '3896 Gil Ferrocarril
    ', '', 'online', 'delivery', 'paypal', 'pendiente', 7400.00, '0976bfba-6a2a-4405-8bfe-2474a21f1e25', null);
INSERT INTO mendozarq.venta (uuid, creadoEn, numeroVenta, nombreFactura, nitCiCex, departamento, direccion, descripcion, tipoVenta, tipoEnvio, metodoDePago, estado, total, uuidCliente, uuidVendedor) VALUES ('ec0b9bf6-4661-4cbb-8b7b-4a6795678331', '2022-06-29 12:38:23', 1000008, 'cerdán benavides', '2334567', 'cbba', '45267 Roldán Subida
    ', '', 'fisica', 'personal', 'efectivo', 'completado', 14000.00, '942246e6-f202-47f9-9db6-c067a33707eb', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72');



INSERT INTO mendozarq.conceptoventa (uuid, creadoEn, cantidad, precioUnitario, importe, descuento, uuidProducto, uuidVenta) VALUES ('0f47b8ef-b6be-4e08-aa88-bca8072c21dd', '2022-06-29 12:29:55', 1, 1851.00, 1851.00, 0.00, 'a35424cc-fd28-44ac-a604-4c4b2d628f43', '6a88f8b1-aeb2-44b7-ab52-cc0a59e2c9ab');
INSERT INTO mendozarq.conceptoventa (uuid, creadoEn, cantidad, precioUnitario, importe, descuento, uuidProducto, uuidVenta) VALUES ('108c6533-4fc6-474d-92eb-ce3e6c20e343', '2022-06-29 12:28:06', 1, 6000.00, 6000.00, 0.00, '4cc90ad9-5e15-436d-8106-bf3cddd1ab41', '2b518b2e-58df-477b-8249-429da46901ed');
INSERT INTO mendozarq.conceptoventa (uuid, creadoEn, cantidad, precioUnitario, importe, descuento, uuidProducto, uuidVenta) VALUES ('25bc7cef-fb7a-45bf-87bf-ac2b38b5c677', '2022-06-29 12:30:55', 1, 7000.00, 7000.00, 0.00, 'a23de6cb-54a0-475e-acfd-975c36de336e', '1b85459b-d8d9-4c48-ba86-d9e5b5c22e62');
INSERT INTO mendozarq.conceptoventa (uuid, creadoEn, cantidad, precioUnitario, importe, descuento, uuidProducto, uuidVenta) VALUES ('25c105eb-b40f-4400-b6f0-d4daff5f4365', '2022-06-29 12:35:42', 1, 6000.00, 6000.00, 0.00, '4cc90ad9-5e15-436d-8106-bf3cddd1ab41', 'e28fac07-aa33-4b9e-9f7e-5198a8bb8567');
INSERT INTO mendozarq.conceptoventa (uuid, creadoEn, cantidad, precioUnitario, importe, descuento, uuidProducto, uuidVenta) VALUES ('3bd6fb00-1f5d-48f6-92ee-bb8d65899df6', '2022-06-29 12:40:14', 2, 975.00, 1950.00, 0.00, '69ad9459-0273-46a9-a312-e5b7d8952e86', '919635bc-9f01-431e-a7dc-788c19c6647c');
INSERT INTO mendozarq.conceptoventa (uuid, creadoEn, cantidad, precioUnitario, importe, descuento, uuidProducto, uuidVenta) VALUES ('479023ea-b6d1-4dc9-b630-f6cf19881074', '2022-06-29 12:29:55', 1, 1507.00, 1396.99, 7.30, 'ce1c1bf2-d9a1-449d-a02b-9b3f220f1dbb', '6a88f8b1-aeb2-44b7-ab52-cc0a59e2c9ab');
INSERT INTO mendozarq.conceptoventa (uuid, creadoEn, cantidad, precioUnitario, importe, descuento, uuidProducto, uuidVenta) VALUES ('55832c59-3f8c-4ab3-a415-7247949ca5fa', '2022-06-29 12:32:30', 1, 2700.00, 2700.00, 0.00, 'd54e1a74-b861-4ad6-a934-c1f5661997b3', 'b015d58f-2706-4da2-901e-9d856cd461a3');
INSERT INTO mendozarq.conceptoventa (uuid, creadoEn, cantidad, precioUnitario, importe, descuento, uuidProducto, uuidVenta) VALUES ('58a14a82-3d31-4394-8d00-d7e2e73b5e7f', '2022-06-29 12:39:55', 2, 1925.00, 3850.00, 0.00, '410b5731-4c04-4262-a734-b5c03c140569', '6350d397-fdc4-4ea7-b066-3f6d581d33b8');
INSERT INTO mendozarq.conceptoventa (uuid, creadoEn, cantidad, precioUnitario, importe, descuento, uuidProducto, uuidVenta) VALUES ('61c52774-1143-462d-844f-35f1dba37131', '2022-06-29 12:28:06', 1, 7000.00, 7000.00, 0.00, 'dea18ab5-3cd2-4626-bcff-ef4126af7303', '2b518b2e-58df-477b-8249-429da46901ed');
INSERT INTO mendozarq.conceptoventa (uuid, creadoEn, cantidad, precioUnitario, importe, descuento, uuidProducto, uuidVenta) VALUES ('685699da-7dbe-4041-b99b-7d0171a5179e', '2022-06-29 12:28:06', 1, 1253.00, 1253.00, 0.00, '46445a16-b0e9-4200-a080-3cf1cd20cca0', '2b518b2e-58df-477b-8249-429da46901ed');
INSERT INTO mendozarq.conceptoventa (uuid, creadoEn, cantidad, precioUnitario, importe, descuento, uuidProducto, uuidVenta) VALUES ('6d6bee5c-00ec-484e-b0af-51adabe73f52', '2022-06-29 12:30:55', 1, 1507.00, 1396.99, 7.30, 'ce1c1bf2-d9a1-449d-a02b-9b3f220f1dbb', '1b85459b-d8d9-4c48-ba86-d9e5b5c22e62');
INSERT INTO mendozarq.conceptoventa (uuid, creadoEn, cantidad, precioUnitario, importe, descuento, uuidProducto, uuidVenta) VALUES ('75ee2c4a-530c-431d-8e89-44b836f0d927', '2022-06-29 12:39:55', 2, 1851.00, 3702.00, 0.00, 'a35424cc-fd28-44ac-a604-4c4b2d628f43', '6350d397-fdc4-4ea7-b066-3f6d581d33b8');
INSERT INTO mendozarq.conceptoventa (uuid, creadoEn, cantidad, precioUnitario, importe, descuento, uuidProducto, uuidVenta) VALUES ('94c322ea-90a8-4ccd-9ae1-fce76a7be0d7', '2022-06-29 12:35:42', 1, 1400.00, 1400.00, 0.00, '4b9e4a99-2619-4805-ac41-0428dc4bce45', 'e28fac07-aa33-4b9e-9f7e-5198a8bb8567');
INSERT INTO mendozarq.conceptoventa (uuid, creadoEn, cantidad, precioUnitario, importe, descuento, uuidProducto, uuidVenta) VALUES ('9bb4db12-94a2-45dc-96c2-b8275853a010', '2022-06-29 12:28:06', 1, 1507.00, 1396.99, 7.30, 'ce1c1bf2-d9a1-449d-a02b-9b3f220f1dbb', '2b518b2e-58df-477b-8249-429da46901ed');
INSERT INTO mendozarq.conceptoventa (uuid, creadoEn, cantidad, precioUnitario, importe, descuento, uuidProducto, uuidVenta) VALUES ('9fd105cb-b0e7-4e15-abb7-0bc740d4cf90', '2022-06-29 13:22:24', 1, 6000.00, 6000.00, 0.00, '4cc90ad9-5e15-436d-8106-bf3cddd1ab41', 'cd0c3ce0-3634-4895-946e-ef7df6945880');
INSERT INTO mendozarq.conceptoventa (uuid, creadoEn, cantidad, precioUnitario, importe, descuento, uuidProducto, uuidVenta) VALUES ('bedd5d0f-2bd2-4506-9578-215cda111c4f', '2022-06-29 12:38:23', 2, 7000.00, 14000.00, 0.00, 'dea18ab5-3cd2-4626-bcff-ef4126af7303', 'ec0b9bf6-4661-4cbb-8b7b-4a6795678331');
INSERT INTO mendozarq.conceptoventa (uuid, creadoEn, cantidad, precioUnitario, importe, descuento, uuidProducto, uuidVenta) VALUES ('efec92e3-f220-48f4-a831-521f41f6c34e', '2022-06-29 12:30:55', 1, 1682.00, 1682.00, 0.00, 'b30ac8ef-ad14-477e-9f57-0fa0eba5d71d', '1b85459b-d8d9-4c48-ba86-d9e5b5c22e62');




INSERT INTO mendozarq.opinionproducto (uuid, creadoEn, titulo, descripcion, estado, verificado, puntuacion, uuidProducto, uuidCliente) VALUES ('49b3d179-d292-40f8-8cb6-2e23da41ff6a', '2022-06-29 12:53:42', 'Precio un poco caro pero aceptable', 'Realice el pedido de este producto, por la calidad de la madera aunque deverian hacer alguna descuento. ', 1, 0, 4, '4cc90ad9-5e15-436d-8106-bf3cddd1ab41', '0976bfba-6a2a-4405-8bfe-2474a21f1e25');
INSERT INTO mendozarq.opinionproducto (uuid, creadoEn, titulo, descripcion, estado, verificado, puntuacion, uuidProducto, uuidCliente) VALUES ('60946576-4367-4009-b328-c77653ef2880', '2022-06-29 12:49:00', 'Retrazo del envio de 1 dia', 'El producto me llego con las mejores condiciones, pero el envio se retrazo con 1 dia mas de espera.', 1, 1, 3, '4cc90ad9-5e15-436d-8106-bf3cddd1ab41', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.opinionproducto (uuid, creadoEn, titulo, descripcion, estado, verificado, puntuacion, uuidProducto, uuidCliente) VALUES ('7e06c84d-f251-4457-9ebc-c45c47c1d044', '2022-06-29 12:43:14', 'Buena calidad de construcción ', 'El precio no se veía tan bueno, pero cuando me llego el producto note que valia cada peso que pague', 1, 1, 5, '46445a16-b0e9-4200-a080-3cf1cd20cca0', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.opinionproducto (uuid, creadoEn, titulo, descripcion, estado, verificado, puntuacion, uuidProducto, uuidCliente) VALUES ('cf578cc9-dd52-467f-a2cb-e8c39ff2504b', '2022-06-29 13:24:26', 'Excelente calidad', 'Talvez el precio no este elevado pero la calidad de la cama es de la mejor totalmente recomendable', 1, 1, 5, '4cc90ad9-5e15-436d-8106-bf3cddd1ab41', '2319b069-bde2-452c-af94-ec08f68c722c');




INSERT INTO mendozarq.proyecto (uuid, creadoEn, nombre, descripcion, categoria, estado, fechaInicio, fechaFinal, lugarProyecto, porcentaje, uuidCliente) VALUES ('7eee2e9f-3c07-4b59-bf8a-366e4c81720e', '2022-06-28 22:26:00', 'Edificio Cabral', 'Centro de atencion al cliente de la empresa cabral', 'construccion', 1, '2022-11-25', '2023-03-15', 'Calle San juan de dios y avenida octava', 0, '942246e6-f202-47f9-9db6-c067a33707eb');
INSERT INTO mendozarq.proyecto (uuid, creadoEn, nombre, descripcion, categoria, estado, fechaInicio, fechaFinal, lugarProyecto, porcentaje, uuidCliente) VALUES ('92914a40-8a91-495b-9b6a-b46c491c317e', '2022-06-28 22:23:14', 'Lomas del sur tower', 'Edificio central de la empresa importadora lomas del sur.', 'construccion', 1, '2022-06-29', '2022-12-31', 'Avenida Blanco Galindo y Segunda', 13, 'bf493a64-4573-433f-92b0-edbcae73a98b');

INSERT INTO mendozarq.usuarioproyecto (uuid, creadoEn, uuidProyecto, uuidUsuario) VALUES ('82c1c33c-3d49-47b7-bae9-16c8f217df6c', '2022-06-28 22:23:35', '92914a40-8a91-495b-9b6a-b46c491c317e', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72');
INSERT INTO mendozarq.usuarioproyecto (uuid, creadoEn, uuidProyecto, uuidUsuario) VALUES ('87d472d8-e7c5-4165-aa50-a77173a1e4d0', '2022-06-28 22:23:35', '92914a40-8a91-495b-9b6a-b46c491c317e', '36f1f6d4-163d-4856-a964-aae308769f27');
INSERT INTO mendozarq.usuarioproyecto (uuid, creadoEn, uuidProyecto, uuidUsuario) VALUES ('e4914caa-cad6-4451-958c-370bcb1cb436', '2022-06-28 22:23:35', '92914a40-8a91-495b-9b6a-b46c491c317e', '35f44215-b58f-491e-a439-4b39ea044442');
INSERT INTO mendozarq.usuarioproyecto (uuid, creadoEn, uuidProyecto, uuidUsuario) VALUES ('fc9fa744-0c3c-40e3-96b6-488c77063180', '2022-06-28 22:23:35', '92914a40-8a91-495b-9b6a-b46c491c317e', '81f19377-6c68-4bdc-9e38-d1c47b68c0c6');

INSERT INTO mendozarq.personalproyecto (uuid, creadoEn, uuidProyecto, uuidPersonal) VALUES ('6b532d16-a929-4abf-b8c6-88e44c523382', '2022-06-28 22:23:50', '92914a40-8a91-495b-9b6a-b46c491c317e', '471c2837-6d59-43c2-ac1e-81a56f7a3d03');
INSERT INTO mendozarq.personalproyecto (uuid, creadoEn, uuidProyecto, uuidPersonal) VALUES ('772490c5-95e5-4971-a803-ad39abea4caf', '2022-06-28 22:23:50', '92914a40-8a91-495b-9b6a-b46c491c317e', '6739cd0f-9e3e-4eb2-9c22-e2a60be68401');
INSERT INTO mendozarq.personalproyecto (uuid, creadoEn, uuidProyecto, uuidPersonal) VALUES ('c815cf0b-0d7b-452e-af7c-615173970fe3', '2022-06-28 22:23:50', '92914a40-8a91-495b-9b6a-b46c491c317e', 'a2f0a1c4-06d9-4459-9283-49cf3460f9e1');
INSERT INTO mendozarq.personalproyecto (uuid, creadoEn, uuidProyecto, uuidPersonal) VALUES ('d4a1e3c2-852e-4659-9ebd-cbb8ea6471ed', '2022-06-28 22:23:50', '92914a40-8a91-495b-9b6a-b46c491c317e', '122573dc-a098-45f7-8509-c54acf58e9c3');
INSERT INTO mendozarq.personalproyecto (uuid, creadoEn, uuidProyecto, uuidPersonal) VALUES ('f167f2cf-b7f4-4e48-b58c-293bddd5d8b0', '2022-06-28 22:23:50', '92914a40-8a91-495b-9b6a-b46c491c317e', '0cdca13f-175a-4ed0-8320-650f65bf9167');





INSERT INTO mendozarq.servicioproyecto (uuid, creadoEn, nombre, descripcion, avance, fechaInicio, fechaFinal, uuidProyecto) VALUES ('ea5b4d61-7cb1-4f8b-b2b1-e9b08e74e4f3', '2022-06-28 22:30:53', 'hormigon coboce', 'hormigon de coboce para la construccion', 21, '2022-07-29', '2022-10-31', '92914a40-8a91-495b-9b6a-b46c491c317e');




INSERT INTO mendozarq.presupuestoobra (uuid, creadoEn, nombre, descripcion, fecha, iva, total, uuidCliente, uuidUsuario, uuidProyecto) VALUES ('92266b0e-82e7-4f6b-93d8-149c3457a8c5', '2022-06-28 21:39:42', 'trump tower', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley', '2022-06-28', 0.00, 0.00, '7ec2091c-abf2-4025-a207-3bbf04a5a8b9', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', null);
INSERT INTO mendozarq.presupuestoobra (uuid, creadoEn, nombre, descripcion, fecha, iva, total, uuidCliente, uuidUsuario, uuidProyecto) VALUES ('e0251f45-2ddf-4096-872a-99c319a09b40', '2022-01-13 16:06:40', 'lomas del sur tower', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. ', '2022-01-13', 5.00, 0.00, 'bf493a64-4573-433f-92b0-edbcae73a98b', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', null);
INSERT INTO mendozarq.presupuestoobra (uuid, creadoEn, nombre, descripcion, fecha, iva, total, uuidCliente, uuidUsuario, uuidProyecto) VALUES ('f36499a7-fe9d-4fa6-b15a-1b16d98e13b8', '2022-06-28 23:18:27', 'lomas del sur tower', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. ', '2022-01-13', 5.00, 0.00, null, null, '92914a40-8a91-495b-9b6a-b46c491c317e');



INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('1d3debb0-896b-47d2-93fe-a91a8652bfe2', '2022-03-30 17:49:38', 'Carpintería', 0, 'e0251f45-2ddf-4096-872a-99c319a09b40');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('1e4f166c-9684-428a-ab52-06af7ab27fc2', '2022-06-28 23:18:27', 'Instalación de agua', 0, 'f36499a7-fe9d-4fa6-b15a-1b16d98e13b8');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('2423ea93-36d6-4442-8217-bc6b90aa6249', '2022-06-28 23:18:27', 'Estructura de Hormigón - Piso de Hormigón', 3, 'f36499a7-fe9d-4fa6-b15a-1b16d98e13b8');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('2a3b23e5-3385-4327-a803-ea80a19baed3', '2022-03-30 17:48:01', 'Piso Poliretanico', 1, 'e0251f45-2ddf-4096-872a-99c319a09b40');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('3191b6e8-f84f-4bd9-8f7b-3116d89f30a4', '2022-03-30 17:49:45', 'Instalación Eléctrica', 0, 'e0251f45-2ddf-4096-872a-99c319a09b40');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('34ef8c42-85b1-4026-8de8-d78f5ac31550', '2022-03-30 17:47:28', 'Demoliciones', 0, 'e0251f45-2ddf-4096-872a-99c319a09b40');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('49b0aa81-f4e8-4a3d-9aa7-cd6208f30689', '2022-03-30 17:47:41', 'Desagüe Industrial', 3, 'e0251f45-2ddf-4096-872a-99c319a09b40');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('60e54ac6-0e08-4c3e-ad67-4a4f286f5569', '2022-06-28 23:18:27', 'Pintura', 0, 'f36499a7-fe9d-4fa6-b15a-1b16d98e13b8');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('63c6be32-c9df-473b-9fa9-c068765ded0c', '2022-03-30 17:47:17', 'Tareas Previas', 0, 'e0251f45-2ddf-4096-872a-99c319a09b40');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('86230b5e-a624-45fd-93c4-903806e0ce4b', '2022-06-28 23:18:27', 'Tareas Previas', 0, 'f36499a7-fe9d-4fa6-b15a-1b16d98e13b8');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('8aedca0a-7df4-40db-91e4-05bb506bd077', '2022-06-28 23:18:27', 'Piso Poliretanico', 1, 'f36499a7-fe9d-4fa6-b15a-1b16d98e13b8');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('93cf7383-7e98-4ada-bcc0-2786fb05af11', '2022-06-28 23:18:27', 'Desagüe Industrial', 3, 'f36499a7-fe9d-4fa6-b15a-1b16d98e13b8');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('9db9179d-2927-4d13-b15d-b17a389008bc', '2022-03-30 17:49:53', 'Instalación de agua', 0, 'e0251f45-2ddf-4096-872a-99c319a09b40');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('a2d77a17-e0ca-4738-8848-a48fb734838d', '2022-06-28 23:18:27', 'Limpieza de obra', 0, 'f36499a7-fe9d-4fa6-b15a-1b16d98e13b8');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('ac4f8ef6-aea4-4ccf-8b53-6e80a687cfb0', '2022-03-30 17:50:00', 'Pintura', 0, 'e0251f45-2ddf-4096-872a-99c319a09b40');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('b3be546e-62c4-478a-a556-51197e25a3f2', '2022-03-30 17:48:10', 'Mampostería piso de hormigón', 30, 'e0251f45-2ddf-4096-872a-99c319a09b40');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('b91a9b5c-7440-4807-b661-8bb086395c0f', '2022-03-30 17:49:13', 'Revoques', 0, 'e0251f45-2ddf-4096-872a-99c319a09b40');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('bc3a1c36-838c-4416-bcd5-99db5225f2e6', '2022-06-28 23:18:27', 'Revestimientos', 2, 'f36499a7-fe9d-4fa6-b15a-1b16d98e13b8');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('c817d285-723b-452c-a670-4012ecabccec', '2022-06-28 23:18:27', 'Instalación Eléctrica', 0, 'f36499a7-fe9d-4fa6-b15a-1b16d98e13b8');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('d1d8abee-8239-4e09-9f32-4d521a5e0679', '2022-06-28 23:18:27', 'Mampostería piso de hormigón', 30, 'f36499a7-fe9d-4fa6-b15a-1b16d98e13b8');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('d69f0aa3-a583-488e-af05-a25c9169409b', '2022-03-30 17:50:07', 'Limpieza de obra', 0, 'e0251f45-2ddf-4096-872a-99c319a09b40');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('da0094f1-e3eb-412a-b2ea-f8483eadfe28', '2022-03-30 17:49:21', 'Revestimientos', 2, 'e0251f45-2ddf-4096-872a-99c319a09b40');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('eda9d0b4-f7fa-4c6b-8888-f3f941e6bfbf', '2022-03-30 17:49:31', 'Cielorraso', 0, 'e0251f45-2ddf-4096-872a-99c319a09b40');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('f4b0cb58-2e9e-4da2-a259-165d28cf4bcb', '2022-06-28 23:18:27', 'Carpintería', 0, 'f36499a7-fe9d-4fa6-b15a-1b16d98e13b8');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('f6cb544d-ea4e-439b-b2f4-04ae7e799d5a', '2022-06-28 23:18:27', 'Cielorraso', 0, 'f36499a7-fe9d-4fa6-b15a-1b16d98e13b8');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('f8386c9c-d897-480d-a37d-92408da6cb1a', '2022-03-30 17:47:51', 'Estructura de Hormigón - Piso de Hormigón', 3, 'e0251f45-2ddf-4096-872a-99c319a09b40');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('fa9be2f8-919a-4f8b-bd2f-c2fb83c0d58f', '2022-06-28 23:18:27', 'Revoques', 0, 'f36499a7-fe9d-4fa6-b15a-1b16d98e13b8');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('fffc256c-6b21-4f9a-8a55-3c80e042b0c2', '2022-06-28 23:18:27', 'Demoliciones', 0, 'f36499a7-fe9d-4fa6-b15a-1b16d98e13b8');





INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('00c2ae12-36df-47a6-ade5-3b9de5c341fa', '2022-03-30 18:09:48', 'Llave esférica de corte 3/4', 'N/A', 3, 543.00, '9db9179d-2927-4d13-b15d-b17a389008bc');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('01f4fbb3-adf6-43ca-b98b-9e28e29c95f8', '2022-03-30 17:56:13', 'Conexión y empalme a cámara existente.', 'N/A', 6, 654.00, '49b0aa81-f4e8-4a3d-9aa7-cd6208f30689');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('021d7c3a-4967-4520-aa57-77ef1c77b184', '2022-06-28 23:18:27', 'Llave de paso 1/2"', 'N/A', 2, 423.00, '1e4f166c-9684-428a-ab52-06af7ab27fc2');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('07b5d9eb-ba67-4028-b39f-93f5f271aea4', '2022-03-30 17:58:16', 'Lijado preparación de subbase nivelación / pisos nuevos', 'm²', 4, 658.00, '2a3b23e5-3385-4327-a803-ea80a19baed3');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('09ce0493-ba21-4a89-a2eb-cc81ce48ba09', '2022-06-28 23:18:27', 'Cañería pvc. D:0,064', 'ml', 3, 423.00, '93cf7383-7e98-4ada-bcc0-2786fb05af11');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('0aa0c117-2ba6-440b-b48e-97d9cd6686b7', '2022-06-28 23:18:27', 'Llave esférica de corte 3/4', 'N/A', 3, 543.00, '1e4f166c-9684-428a-ab52-06af7ab27fc2');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('0ef723fa-5341-47cb-8204-8d2867df31e8', '2022-03-30 18:03:06', 'Azotado de concreto c/hidrófugo', 'm²', 4, 856.00, 'b91a9b5c-7440-4807-b661-8bb086395c0f');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('108d69da-091e-4771-815c-84711f424b12', '2022-06-28 23:18:27', 'Piso de hº. ESP.0,20', 'm²', 1, 765.00, '2423ea93-36d6-4442-8217-bc6b90aa6249');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('1609bb27-f5bd-4c26-a0f3-e69b906038f6', '2022-03-30 18:03:35', 'Malla de Fibra de vidrio', 'm²', 2, 756.00, 'b91a9b5c-7440-4807-b661-8bb086395c0f');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('1b4306a3-fcc6-488f-b1f5-1f852b84b668', '2022-03-30 17:56:04', 'Canal de desagüe 0,30x2,10 con c/marco y reja ac.inox.', 'N/A', 4, 654.00, '49b0aa81-f4e8-4a3d-9aa7-cd6208f30689');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('2113b535-aa00-411b-a7c8-5d2aed43aaa2', '2022-06-28 23:18:27', 'Flexibles 1/2"', 'N/A', 2, 12.00, '1e4f166c-9684-428a-ab52-06af7ab27fc2');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('2139c8ca-ce4b-4a07-87b1-f5e82666bc53', '2022-06-28 23:18:27', 'Conexión y empalme a cámara existente.', 'N/A', 6, 654.00, '93cf7383-7e98-4ada-bcc0-2786fb05af11');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('3058ee50-f23e-4213-872b-2c70204a40a2', '2022-06-28 23:18:27', 'Imprimación', 'm²', 8, 312.00, '60e54ac6-0e08-4c3e-ad67-4a4f286f5569');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('371bcedc-6694-45b8-9652-a0a80b3ee43b', '2022-03-30 17:54:41', 'Demolición de mampostería de bloques', 'N/A', 4, 756.00, '34ef8c42-85b1-4026-8de8-d78f5ac31550');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('3bef2bb5-1cff-42ad-85ae-63020c5c2d15', '2022-06-28 23:18:27', 'Lijado preparación de subbase nivelación / pisos nuevos', 'm²', 4, 658.00, '8aedca0a-7df4-40db-91e4-05bb506bd077');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('3e60129f-66bc-4f3e-b599-8cf8a4ff9519', '2022-03-30 17:53:21', 'Represent. Técnico', 'N/A', 6, 654645.00, '63c6be32-c9df-473b-9fa9-c068765ded0c');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('4193bd27-2817-4c63-adc4-d557659e44dc', '2022-06-28 23:18:27', 'Desmontar frente 3,10x3,70', 'N/A', 2, 312.00, 'f4b0cb58-2e9e-4da2-a259-165d28cf4bcb');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('4226c7d8-6144-45d6-aa89-921deaa33b94', '2022-06-28 23:18:27', 'Pintura al latex uso exterior antihongo repintado gral.', 'm²', 6, 312.00, '60e54ac6-0e08-4c3e-ad67-4a4f286f5569');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('48934f55-c1d3-4163-8d85-8238107131ca', '2022-03-30 18:08:02', 'Puerta de abrir 0,80x2,00 tipo P1 C/CERRAD/VIDRIOS LAM/ CIERRAP.', 'N/A', 3, 756.00, '1d3debb0-896b-47d2-93fe-a91a8652bfe2');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('4df48778-92aa-49cb-b6d1-03e57d4edeae', '2022-06-28 23:18:27', 'Aserrado y nivelación piso Sala de Jugos y canaleta desag.  Esp. 0,10', 'N/A', 6, 423.00, 'fffc256c-6b21-4f9a-8a55-3c80e042b0c2');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('4e30ab9f-89c5-4773-935a-05d7f4a81a7e', '2022-03-30 18:09:18', 'Instalación cañería con 2 bocas', 'gal', 5, 756756.00, '3191b6e8-f84f-4bd9-8f7b-3116d89f30a4');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('52dee65d-59dc-4d66-8e63-a54a555dbf23', '2022-03-30 18:01:17', 'Laca antirayado', 'm²', 5, 756.00, '2a3b23e5-3385-4327-a803-ea80a19baed3');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('531db7c4-73f5-491e-be4f-05e77d26cd30', '2022-03-30 18:08:16', 'Desmontar frente 3,10x3,70', 'N/A', 6, 534.00, '1d3debb0-896b-47d2-93fe-a91a8652bfe2');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('55a8fa9f-7c71-47ae-8c1b-f0c2baae11b4', '2022-03-30 18:07:51', 'Frente vidriado de paños fijos 2,20x3,70 tipo M2', 'N/A', 6, 321.00, '1d3debb0-896b-47d2-93fe-a91a8652bfe2');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('584e282d-b093-4117-88c0-51a6d93f258f', '2022-06-28 23:18:27', 'Cañería termofusión 3/4"', 'ml', 7, 534.00, '1e4f166c-9684-428a-ab52-06af7ab27fc2');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('5ecce96c-3cbe-4e2e-bb4c-5d7d3233f56f', '2022-03-30 18:10:46', 'Imprimación', 'm²', 8, 312.00, 'ac4f8ef6-aea4-4ccf-8b53-6e80a687cfb0');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('60615136-c485-43bc-8255-fe115fde6140', '2022-06-28 23:18:27', 'Mortero de nivelación', 'm²', 2, 765.00, '8aedca0a-7df4-40db-91e4-05bb506bd077');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('60ea34e0-b717-4100-852f-cb313bd8444f', '2022-03-30 17:54:16', 'Aserrado y demolic. Piso sobrepuesto sector Presala esp. 0,20', 'N/A', 7, 786.00, '34ef8c42-85b1-4026-8de8-d78f5ac31550');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('612ab625-d124-4137-b508-1f9a5206b71c', '2022-06-28 23:18:27', 'Canalización pared', 'm', 3, 534.00, 'c817d285-723b-452c-a670-4012ecabccec');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('62f6e480-a39d-463b-9cdd-916527bb2810', '2022-03-30 18:06:43', 'Cielorraso desmontable de Placa Durlock 0,60x1,21 ', 'm²', 7, 312.00, 'eda9d0b4-f7fa-4c6b-8888-f3f941e6bfbf');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('656325a4-8352-4e1f-ae46-18deb7c32bc3', '2022-03-30 18:02:23', 'Mampostería bloques de hormigón 12x19x39 lisos estándar (19x19x39)', 'm²', 9, 46545.00, 'b3be546e-62c4-478a-a556-51197e25a3f2');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('66980ac4-4841-4ee4-9718-4c88ba2b46be', '2022-06-28 23:18:27', 'Zócalo sanitario', 'ml', 1, 423.00, '2423ea93-36d6-4442-8217-bc6b90aa6249');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('6b5810ba-fd8e-41ef-84fb-0b6968140c47', '2022-06-28 23:18:27', 'Grifería tipo FV Monocomando', 'N/A', 4, 321.00, '1e4f166c-9684-428a-ab52-06af7ab27fc2');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('6b9225af-92fc-4d40-8c3e-973afa15f43f', '2022-03-30 17:53:32', 'Cerramiento de aislación del sector (estructura tubular + film pe. 200mc.)30,00X4,50', 'N/A', 1, 321.00, '63c6be32-c9df-473b-9fa9-c068765ded0c');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('6e4f4012-8600-4314-b807-332499f68764', '2022-06-28 23:18:27', 'Enduido poliuretánico', 'm²', 3, 432.00, '8aedca0a-7df4-40db-91e4-05bb506bd077');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('6eb0c9f8-9b16-4cee-b0ff-e0ed506d667e', '2022-03-30 18:10:58', 'Pintura al latex uso exterior antihongo repintado gral.', 'm²', 6, 312.00, 'ac4f8ef6-aea4-4ccf-8b53-6e80a687cfb0');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('6f8f94b9-1dfe-405f-90a4-eab5d06478e0', '2022-03-30 18:07:42', 'Frente vidriado de paños fijos 3,95x3,70 TIPO  M1', 'N/A', 3, 312.00, '1d3debb0-896b-47d2-93fe-a91a8652bfe2');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('786e0fd3-a8b1-46e1-b4ae-61cb5dea2c19', '2022-06-28 23:18:27', 'Columnas de refuerzo con bloques 0,20x0,20x4,00  (19x19x39)', 'ml', 6, 432.00, 'd1d8abee-8239-4e09-9f32-4d521a5e0679');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('79feb2de-a44a-4c1b-8b69-ce731bd63686', '2022-03-30 18:08:10', 'Desmontar frente 3,10x3,70', 'N/A', 2, 312.00, '1d3debb0-896b-47d2-93fe-a91a8652bfe2');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('7b88c7d1-3fdc-4f44-8170-1440667224e4', '2022-06-28 23:18:27', 'Frente vidriado de paños fijos 2,20x3,70 tipo M2', 'N/A', 6, 321.00, 'f4b0cb58-2e9e-4da2-a259-165d28cf4bcb');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('7bb8b283-6186-4816-beb0-c03c684baf2a', '2022-03-30 18:00:43', 'Mortero de nivelación', 'm²', 2, 765.00, '2a3b23e5-3385-4327-a803-ea80a19baed3');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('7c6faee5-ef31-4e27-a707-04789f6f5c2c', '2022-03-30 18:08:24', 'Cortinas de bandas de PVC. 1,60X2,05 con soporte aº. Inox..', 'N/A', 2, 3254.00, '1d3debb0-896b-47d2-93fe-a91a8652bfe2');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('804956db-8a1a-4e9d-9a5e-e6d3609c2ea9', '2022-06-28 23:18:27', 'Represent. Técnico', 'N/A', 6, 654645.00, '86230b5e-a624-45fd-93c4-903806e0ce4b');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('868ddb32-f513-439b-b88f-8bb87c8ca9bf', '2022-06-28 23:18:27', 'Desmontar frente 3,10x3,70', 'N/A', 6, 534.00, 'f4b0cb58-2e9e-4da2-a259-165d28cf4bcb');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('927e9cc6-12d4-42ed-9c29-3fa0bc59e0bc', '2022-03-30 18:10:27', 'Grifería tipo FV Monocomando', 'N/A', 4, 321.00, '9db9179d-2927-4d13-b15d-b17a389008bc');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('92fb4cda-0b2d-4b74-839f-6c4c81691c1f', '2022-06-28 23:18:27', 'Cerramiento de aislación del sector (estructura tubular + film pe. 200mc.)30,00X4,50', 'N/A', 1, 321.00, '86230b5e-a624-45fd-93c4-903806e0ce4b');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('94102902-6b0f-4db3-8af1-8e4c431eb740', '2022-06-28 23:18:27', 'Obrador - Baños Químicos', 'N/A', 2, 432.00, '86230b5e-a624-45fd-93c4-903806e0ce4b');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('966648cf-a621-4df5-8fe9-94d36feb7d31', '2022-06-28 23:18:27', 'Cielorraso desmontable de Placa Durlock 0,60x1,21 ', 'm²', 7, 312.00, 'f6cb544d-ea4e-439b-b2f4-04ae7e799d5a');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('979263b2-e56a-4104-8fd4-a40ab5919239', '2022-03-30 18:02:42', 'Columnas de refuerzo con bloques 0,20x0,20x4,00  (19x19x39)', 'ml', 6, 432.00, 'b3be546e-62c4-478a-a556-51197e25a3f2');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('9e411136-f571-439b-9549-eeca2fbe01ff', '2022-03-30 18:00:57', 'Enduido poliuretánico', 'm²', 3, 432.00, '2a3b23e5-3385-4327-a803-ea80a19baed3');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('a403b780-6009-4d25-86b7-7e32532c707f', '2022-06-28 23:18:27', 'Instalación cañería con 2 bocas', 'gal', 5, 756756.00, 'c817d285-723b-452c-a670-4012ecabccec');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('a6033946-80f6-48e9-868c-32c9693ad401', '2022-06-28 23:18:27', 'Canal de desagüe 0,30x2,10 con c/marco y reja ac.inox.', 'N/A', 4, 654.00, '93cf7383-7e98-4ada-bcc0-2786fb05af11');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('a924292c-4e04-493e-8683-e61383ae034b', '2022-03-30 18:09:35', 'Cañería termofusión 3/4"', 'ml', 7, 534.00, '9db9179d-2927-4d13-b15d-b17a389008bc');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('aa2eb523-3ff4-4cbb-8e28-809c3c6f5e89', '2022-06-28 23:18:27', 'Demolición de mampostería de bloques', 'N/A', 4, 756.00, 'fffc256c-6b21-4f9a-8a55-3c80e042b0c2');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('aa646ccb-f80a-4921-8aeb-38b466c3173b', '2022-03-30 18:10:14', 'Flexibles 1/2"', 'N/A', 2, 12.00, '9db9179d-2927-4d13-b15d-b17a389008bc');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('b07fc862-3d84-4d1a-91c3-4fc7d93d814d', '2022-06-28 23:18:27', 'Aserrado y demolición piso de hº. Desag. Sala CIP', 'N/A', 1, 3.00, 'fffc256c-6b21-4f9a-8a55-3c80e042b0c2');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('b12e4a3f-2d83-44ac-a98b-88581e459eb3', '2022-06-28 23:18:27', 'Revoque grueso bajo revestimiento', 'm²', 3, 432.00, 'fa9be2f8-919a-4f8b-bd2f-c2fb83c0d58f');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('b1e656ba-8f0c-4ad0-bb1a-5947e39abaf2', '2022-06-28 23:18:27', 'Frente vidriado de paños fijos 3,95x3,70 TIPO  M1', 'N/A', 3, 312.00, 'f4b0cb58-2e9e-4da2-a259-165d28cf4bcb');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('b1f1f87b-6d27-4ee9-8fd0-1a62d3541104', '2022-06-28 23:18:27', 'Viga encadenado sobre mampostería de bloques de hormigón 0,20x0,20', 'ml', 2, 423.00, '2423ea93-36d6-4442-8217-bc6b90aa6249');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('b3c29ed7-0861-4210-876e-56e3462b4f64', '2022-03-30 17:54:08', 'Aserrado y demolición piso de hº. Desag. Sala CIP', 'N/A', 1, 3.00, '34ef8c42-85b1-4026-8de8-d78f5ac31550');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('b8798ae5-7a1b-4f60-92b8-dcb2fe7f47f2', '2022-06-28 23:18:27', 'Laca antirayado', 'm²', 5, 756.00, '8aedca0a-7df4-40db-91e4-05bb506bd077');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('bb3e2b52-ed2d-4699-ad7f-0f3011f3e429', '2022-03-30 17:57:17', 'Piso de hº. ESP.0,20', 'm²', 1, 765.00, 'f8386c9c-d897-480d-a37d-92408da6cb1a');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('bcec7686-5f59-49b0-979a-f166a4ca93ee', '2022-03-30 18:03:21', 'Revoque grueso bajo revestimiento', 'm²', 3, 432.00, 'b91a9b5c-7440-4807-b661-8bb086395c0f');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('bd9cc3c3-0356-42e6-a5bf-b7633e3e71aa', '2022-03-30 17:57:35', 'Zócalo sanitario', 'ml', 1, 423.00, 'f8386c9c-d897-480d-a37d-92408da6cb1a');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('c2a863d9-21ae-41f5-9909-d3ef41bac44b', '2022-03-30 17:56:54', 'Viga encadenado sobre mampostería de bloques de hormigón 0,20x0,20', 'ml', 2, 423.00, 'f8386c9c-d897-480d-a37d-92408da6cb1a');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('c3fa0121-fb15-4946-8f8c-fd70a7a0f8f8', '2022-06-28 23:18:27', 'Serv. Seg. Higiene', 'N/A', 2, 534.00, '86230b5e-a624-45fd-93c4-903806e0ce4b');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('c4293a08-ba96-4e8c-8d3b-dba36fedfbf8', '2022-03-30 17:54:29', 'Aserrado y nivelación piso Sala de Jugos y canaleta desag.  Esp. 0,10', 'N/A', 6, 423.00, '34ef8c42-85b1-4026-8de8-d78f5ac31550');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('cb3bf9a5-6bb9-4c22-94e3-d40c1e3ae42b', '2022-06-28 23:18:27', 'Reconstrucción piso de hormigón esp. 0,20', 'N/A', 3, 435.00, '93cf7383-7e98-4ada-bcc0-2786fb05af11');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('cd75a7d4-eaf4-404a-86d2-fd370039b9e4', '2022-06-28 23:18:27', 'Puerta de abrir 0,80x2,00 tipo P1 C/CERRAD/VIDRIOS LAM/ CIERRAP.', 'N/A', 3, 756.00, 'f4b0cb58-2e9e-4da2-a259-165d28cf4bcb');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('d2de541f-bb8c-4d9b-a5ef-e81b1c716c6a', '2022-06-28 23:18:27', 'Malla de Fibra de vidrio', 'm²', 2, 756.00, 'fa9be2f8-919a-4f8b-bd2f-c2fb83c0d58f');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('d8bd8066-8589-45a3-9a37-b93433819d25', '2022-03-30 18:11:18', 'Limpieza de obra', 'hr', 1, 534.00, 'd69f0aa3-a583-488e-af05-a25c9169409b');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('e5d89aa1-c6e1-46e3-a433-b54e42cf0573', '2022-03-30 18:10:00', 'Llave de paso 1/2"', 'N/A', 2, 423.00, '9db9179d-2927-4d13-b15d-b17a389008bc');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('e6a8224d-2a07-4ae5-b713-4d2a14ced544', '2022-06-28 23:18:27', 'Azotado de concreto c/hidrófugo', 'm²', 4, 856.00, 'fa9be2f8-919a-4f8b-bd2f-c2fb83c0d58f');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('ec539d9c-ccc9-44c7-903b-872ff3e06414', '2022-06-28 23:18:27', 'Limpieza de obra', 'hr', 1, 534.00, 'a2d77a17-e0ca-4738-8848-a48fb734838d');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('ee5485fc-6576-46a6-949c-194bc6ce762c', '2022-06-28 23:18:27', 'Aserrado y demolic. Piso sobrepuesto sector Presala esp. 0,20', 'N/A', 7, 786.00, 'fffc256c-6b21-4f9a-8a55-3c80e042b0c2');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('ee55b0e4-f287-4ca8-bb0e-d4fbdc388986', '2022-06-28 23:18:27', 'Cortinas de bandas de PVC. 1,60X2,05 con soporte aº. Inox..', 'N/A', 2, 3254.00, 'f4b0cb58-2e9e-4da2-a259-165d28cf4bcb');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('eeeba16b-77e1-4718-adb7-a8fcd877de24', '2022-06-28 23:18:27', '', '', 0, 0.00, 'bc3a1c36-838c-4416-bcd5-99db5225f2e6');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('ef0192de-558d-4a50-85d4-50f412b0a5cc', '2022-06-28 23:18:27', 'Mampostería bloques de hormigón 12x19x39 lisos estándar (19x19x39)', 'm²', 9, 46545.00, 'd1d8abee-8239-4e09-9f32-4d521a5e0679');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('ef850cbb-4a67-4991-be55-bac27ae35b1c', '2022-03-30 17:52:24', 'Obrador - Baños Químicos', 'N/A', 2, 432.00, '63c6be32-c9df-473b-9fa9-c068765ded0c');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('f355d92b-8991-4f5b-a7b2-78c2a36c3b37', '2022-03-30 17:55:54', 'Cañería pvc. D:0,064', 'ml', 3, 423.00, '49b0aa81-f4e8-4a3d-9aa7-cd6208f30689');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('f72264ec-0861-4572-8139-8d7c90965b59', '2022-03-30 18:08:50', 'Canalización pared', 'm', 3, 534.00, '3191b6e8-f84f-4bd9-8f7b-3116d89f30a4');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('f9988457-9b78-440c-b484-be5f0238d8e4', '2022-03-30 17:53:12', 'Serv. Seg. Higiene', 'N/A', 2, 534.00, '63c6be32-c9df-473b-9fa9-c068765ded0c');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('fca9b39c-8ea8-4b4c-a9f5-47d191836c0f', '2022-03-30 17:56:22', 'Reconstrucción piso de hormigón esp. 0,20', 'N/A', 3, 435.00, '49b0aa81-f4e8-4a3d-9aa7-cd6208f30689');





INSERT INTO mendozarq.planificacionproyecto (uuid, creadoEn, titulo, subtitulo, uuidProyecto) VALUES ('1dbb5b64-b1af-421a-893f-7f2dae14d433', '2022-06-28 22:28:33', 'Lomas del sur tower', 'Edificio central de la empresa importadora lomas del sur.', '92914a40-8a91-495b-9b6a-b46c491c317e');

INSERT INTO mendozarq.capituloplanificacionproyecto (uuid, creadoEn, nombre, fechaInicio, fechaFinal, avance, dependencia, color, uuidPlanificacionProyecto) VALUES ('07d76d47-8c38-457e-b3cf-5e8a02b68325', '2022-06-29 06:34:01', 'Revestimientos', '2022-06-28', '2022-07-28', 0, '', '', '1dbb5b64-b1af-421a-893f-7f2dae14d433');
INSERT INTO mendozarq.capituloplanificacionproyecto (uuid, creadoEn, nombre, fechaInicio, fechaFinal, avance, dependencia, color, uuidPlanificacionProyecto) VALUES ('181ef3be-cb84-4970-bf75-3133491ff01b', '2022-06-28 22:36:29', 'Desagüe Industrial', '2022-06-29', '2022-08-17', 38, '', '', '1dbb5b64-b1af-421a-893f-7f2dae14d433');
INSERT INTO mendozarq.capituloplanificacionproyecto (uuid, creadoEn, nombre, fechaInicio, fechaFinal, avance, dependencia, color, uuidPlanificacionProyecto) VALUES ('49e63801-200a-480e-9830-7a45e5020ccd', '2022-06-28 22:36:47', 'Piso Poliretanico', '2022-08-17', '2022-11-30', 0, '196856a7-6140-4894-b814-c836d7e4f087', '', '1dbb5b64-b1af-421a-893f-7f2dae14d433');
INSERT INTO mendozarq.capituloplanificacionproyecto (uuid, creadoEn, nombre, fechaInicio, fechaFinal, avance, dependencia, color, uuidPlanificacionProyecto) VALUES ('66e129e4-774f-479d-9da7-dc5763ac6ec1', '2022-06-28 22:35:20', 'Tareas Previas', '2022-06-30', '2022-08-24', 20, '', '', '1dbb5b64-b1af-421a-893f-7f2dae14d433');
INSERT INTO mendozarq.capituloplanificacionproyecto (uuid, creadoEn, nombre, fechaInicio, fechaFinal, avance, dependencia, color, uuidPlanificacionProyecto) VALUES ('682a3040-1d20-403b-b9d2-2f06054bb8fc', '2022-06-28 22:36:12', 'Pintura', '2022-12-01', '2022-12-31', 0, '06a1575e-2b0e-4c4a-8244-650801955ba3', '', '1dbb5b64-b1af-421a-893f-7f2dae14d433');
INSERT INTO mendozarq.capituloplanificacionproyecto (uuid, creadoEn, nombre, fechaInicio, fechaFinal, avance, dependencia, color, uuidPlanificacionProyecto) VALUES ('83974424-63bb-4ea9-92a3-b2720134fce1', '2022-06-28 22:34:37', 'Cielorraso', '2022-09-21', '2022-11-30', 0, '', '', '1dbb5b64-b1af-421a-893f-7f2dae14d433');
INSERT INTO mendozarq.capituloplanificacionproyecto (uuid, creadoEn, nombre, fechaInicio, fechaFinal, avance, dependencia, color, uuidPlanificacionProyecto) VALUES ('b6fe012b-6e55-4b03-b93f-92e1fbfecc52', '2022-06-29 02:37:21', 'Demoliciones', '2022-06-29', '2022-08-24', 0, '', '', '1dbb5b64-b1af-421a-893f-7f2dae14d433');
INSERT INTO mendozarq.capituloplanificacionproyecto (uuid, creadoEn, nombre, fechaInicio, fechaFinal, avance, dependencia, color, uuidPlanificacionProyecto) VALUES ('f214a429-cb99-4add-80ad-21fb58265f33', '2022-06-28 22:34:21', 'Revoques', '2022-06-28', '2022-10-27', 46, '', '', '1dbb5b64-b1af-421a-893f-7f2dae14d433');


INSERT INTO mendozarq.tareaplanificacionproyecto (uuid, creadoEn, nombre, fechaInicio, fechaFinal, avance, dependencia, hito, color, actividades, uuidCapitulo) VALUES ('06a1575e-2b0e-4c4a-8244-650801955ba3', '2022-06-29 06:40:19', 'Revoque grueso bajo revestimiento', '2022-06-30', '2022-10-07', 17, '', 0, '', '<li _ngcontent-gjx-c316="">Limpieza del lugar</li><li _ngcontent-gjx-c316=""><font color="#ff0000">Preparacion de la estructura</font></li><li _ngcontent-gjx-c316="">Fijar revestimientos&nbsp;</li><li _ngcontent-gjx-c316="">Acentamiento estructural de la obra</li>', 'f214a429-cb99-4add-80ad-21fb58265f33');
INSERT INTO mendozarq.tareaplanificacionproyecto (uuid, creadoEn, nombre, fechaInicio, fechaFinal, avance, dependencia, hito, color, actividades, uuidCapitulo) VALUES ('196856a7-6140-4894-b814-c836d7e4f087', '2022-06-28 22:56:42', 'Des. principal norte', '2022-08-17', '2022-08-17', 0, '', 1, '', '<li _ngcontent-lhs-c316="">Ninguno</li>', '181ef3be-cb84-4970-bf75-3133491ff01b');
INSERT INTO mendozarq.tareaplanificacionproyecto (uuid, creadoEn, nombre, fechaInicio, fechaFinal, avance, dependencia, hito, color, actividades, uuidCapitulo) VALUES ('1f7b81da-6c69-4408-bad5-8f811df64ad6', '2022-06-29 13:48:40', 'Mortero de nivelación', '2022-08-03', '2022-10-01', 21, '765ba8f5-f85e-4809-b32f-f88bb2e36626', 0, '#edfd17', '<li _ngcontent-ynw-c356="">Ninguno</li>', 'f214a429-cb99-4add-80ad-21fb58265f33');
INSERT INTO mendozarq.tareaplanificacionproyecto (uuid, creadoEn, nombre, fechaInicio, fechaFinal, avance, dependencia, hito, color, actividades, uuidCapitulo) VALUES ('439c5d6f-a52b-4687-aca9-af6bdac89c10', '2022-06-28 23:00:33', 'Conexión y empalme a cámara existente.', '2022-07-19', '2022-07-31', 20, '', 0, '', '<li _ngcontent-lhs-c316="">Ninguno</li>', '66e129e4-774f-479d-9da7-dc5763ac6ec1');
INSERT INTO mendozarq.tareaplanificacionproyecto (uuid, creadoEn, nombre, fechaInicio, fechaFinal, avance, dependencia, hito, color, actividades, uuidCapitulo) VALUES ('765ba8f5-f85e-4809-b32f-f88bb2e36626', '2022-06-29 06:54:38', 'Desmontar frente 3,10x3,70', '2022-07-21', '2022-09-07', 100, '', 0, '', '<li _ngcontent-lhs-c316="">Ninguno</li>', 'f214a429-cb99-4add-80ad-21fb58265f33');



INSERT INTO mendozarq.visitaproyecto (uuid, creadoEn, estado, nombre, faseDelProyecto, descripcion, fecha, uuidProyecto) VALUES ('2449f5ef-95fa-4d88-9050-5174ebdc30dd', '2022-06-29 09:17:43', 0, 'revision de desmontacion frente norte', 'Desmontar frente 3,10x3,70 <=> Conexión y empalme a cámara existente.', '', '2022-06-29 11:20:00', '92914a40-8a91-495b-9b6a-b46c491c317e');
INSERT INTO mendozarq.visitaproyecto (uuid, creadoEn, estado, nombre, faseDelProyecto, descripcion, fecha, uuidProyecto) VALUES ('7031a3f1-65c5-4afe-ace8-d208c94b60ba', '2022-06-28 23:04:09', 0, 'revision de avance de conexiones y revoques', 'Conexión y empalme a cámara existente. <=> Revoque grueso bajo revestimiento', '', '2022-08-06 04:09:00', '92914a40-8a91-495b-9b6a-b46c491c317e');




INSERT INTO mendozarq.participantevisita (uuid, creadoEn, uuidVisitaProyecto, uuidUsuario) VALUES ('163ecf55-f583-4c3d-9f54-15be7d60ecc6', '2022-06-29 09:17:53', '2449f5ef-95fa-4d88-9050-5174ebdc30dd', '81f19377-6c68-4bdc-9e38-d1c47b68c0c6');
INSERT INTO mendozarq.participantevisita (uuid, creadoEn, uuidVisitaProyecto, uuidUsuario) VALUES ('49d3a1fc-6ae1-4c76-8ee9-2ad406b03036', '2022-06-28 23:04:33', '7031a3f1-65c5-4afe-ace8-d208c94b60ba', '36f1f6d4-163d-4856-a964-aae308769f27');
INSERT INTO mendozarq.participantevisita (uuid, creadoEn, uuidVisitaProyecto, uuidUsuario) VALUES ('5fe60b47-96b7-4bc3-ae77-4bcf92fe2e73', '2022-06-28 23:04:33', '7031a3f1-65c5-4afe-ace8-d208c94b60ba', '81f19377-6c68-4bdc-9e38-d1c47b68c0c6');
INSERT INTO mendozarq.participantevisita (uuid, creadoEn, uuidVisitaProyecto, uuidUsuario) VALUES ('6a598bf5-6268-4156-960f-1cef416e7e8a', '2022-06-28 23:04:33', '7031a3f1-65c5-4afe-ace8-d208c94b60ba', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72');
INSERT INTO mendozarq.participantevisita (uuid, creadoEn, uuidVisitaProyecto, uuidUsuario) VALUES ('81f082a5-5ca6-47d9-b3db-6e6bca823fa6', '2022-06-29 09:17:53', '2449f5ef-95fa-4d88-9050-5174ebdc30dd', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72');
INSERT INTO mendozarq.participantevisita (uuid, creadoEn, uuidVisitaProyecto, uuidUsuario) VALUES ('9a64f8ff-1e36-4fd8-9266-b7d96af2038f', '2022-06-29 09:17:53', '2449f5ef-95fa-4d88-9050-5174ebdc30dd', '36f1f6d4-163d-4856-a964-aae308769f27');
INSERT INTO mendozarq.participantevisita (uuid, creadoEn, uuidVisitaProyecto, uuidUsuario) VALUES ('cf598b2c-8dce-4352-be8a-d030493cad3e', '2022-06-29 09:17:53', '2449f5ef-95fa-4d88-9050-5174ebdc30dd', '35f44215-b58f-491e-a439-4b39ea044442');



INSERT INTO mendozarq.observacionpersonal (uuid, creadoEn, estado, descripcion, fecha, uuidPersonal, uuidVisita) VALUES ('7409ba7e-8f63-45bd-b1a6-eb522cbffa6a', '2022-06-29 10:17:59', 'Con retraso', 'Sin avances importantes en la estructuracion de la base de cimentaciones.', '2022-06-29', '471c2837-6d59-43c2-ac1e-81a56f7a3d03', '2449f5ef-95fa-4d88-9050-5174ebdc30dd');

INSERT INTO mendozarq.observacionservicio (uuid, creadoEn, estado, descripcion, fecha, uuidServicio, uuidVisita) VALUES ('875774e7-d5ce-47a3-9744-d65b04d3f766', '2022-06-29 10:18:54', 'Finalizado', 'Se finalizo la entrega del dia sin ninguna novedad. Entregas restantes 23', '2022-06-29', 'ea5b4d61-7cb1-4f8b-b2b1-e9b08e74e4f3', '2449f5ef-95fa-4d88-9050-5174ebdc30dd');


INSERT INTO mendozarq.observacionobra (uuid, creadoEn, puntoDeInspeccion, observacion, levantamientoObservacion, uuidVisita) VALUES ('01890f8a-7e30-42d5-aff3-9cc07027fbc5', '2022-06-29 10:15:52', 'Suelo y cimentaciones', 'Estabilizar el talud inestable, todos los taludesnaturales del recinto. Presentar carta de seguridad', 'Para brindar seguridad al personal,se fabrico y coloco malla deseguridad (malla 1), la cual cuentancon una estructura metálica ymallas, con la finalidad de clausurary prohibir el paso del personal.', '2449f5ef-95fa-4d88-9050-5174ebdc30dd');
INSERT INTO mendozarq.observacionobra (uuid, creadoEn, puntoDeInspeccion, observacion, levantamientoObservacion, uuidVisita) VALUES ('75855617-187e-4315-b935-ca2d0e1f680a', '2022-06-29 09:22:19', 'Suelo y cimentaciones', 'Reparar y/o reforzar las estructuras de la cimentacióndañadas, en plataforma frente a tolvas (molin', 'Se reparo piso dañado quepresentaba grietas y rajaduras, seconstruyo plataforma de concretoarmado, con la finalidad que lanueva superficie brinden mayorresistencia.', '2449f5ef-95fa-4d88-9050-5174ebdc30dd');


INSERT INTO mendozarq.fotoobservacionobra (uuid, creadoEn, keyName, fileName, location, size, uuidObservacionObra) VALUES ('19cd9745-e378-4dda-9ca8-de75ba0842bb', '2022-06-29 09:27:49', 'mendozarq/observaciones/images/8d460666-8e76-42a1-89b6-abef146a23ab.jpg', 'obras-civiles.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/mendozarq/observaciones/images/8d460666-8e76-42a1-89b6-abef146a23ab.jpg', 184498, '75855617-187e-4315-b935-ca2d0e1f680a');
INSERT INTO mendozarq.fotoobservacionobra (uuid, creadoEn, keyName, fileName, location, size, uuidObservacionObra) VALUES ('8c7fe49a-e574-4413-ab8a-02256d5ace3e', '2022-06-29 10:16:34', 'mendozarq/observaciones/images/79d0e437-0f3e-4356-88e3-357eb7876349.jpg', 'construyendo-deposito-agua-para-hospital.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/mendozarq/observaciones/images/79d0e437-0f3e-4356-88e3-357eb7876349.jpg', 141643, '01890f8a-7e30-42d5-aff3-9cc07027fbc5');
INSERT INTO mendozarq.fotoobservacionobra (uuid, creadoEn, keyName, fileName, location, size, uuidObservacionObra) VALUES ('e93641ff-e62a-4346-b674-34a3119f49ee', '2022-06-29 09:27:49', 'mendozarq/observaciones/images/e9176863-b35d-47ac-9c05-b277f5694517.jpg', 'standard__DSC0739.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/mendozarq/observaciones/images/e9176863-b35d-47ac-9c05-b277f5694517.jpg', 92020, '75855617-187e-4315-b935-ca2d0e1f680a');



INSERT INTO mendozarq.carpetaproyecto (uuid, creadoEn, nombre, fechaCreacion, uuidProyecto) VALUES ('98c78ef9-5c65-4249-ab27-62df5d3d27d4', '2022-06-28 23:06:44', 'diseños estructurales', '2022-06-29', '92914a40-8a91-495b-9b6a-b46c491c317e');
INSERT INTO mendozarq.carpetaproyecto (uuid, creadoEn, nombre, fechaCreacion, uuidProyecto) VALUES ('b3573cb1-ba18-4e8f-9b94-dd73dfaef11b', '2022-06-28 23:06:09', 'planos', '2022-06-29', '92914a40-8a91-495b-9b6a-b46c491c317e');


INSERT INTO mendozarq.documentoproyecto (uuid, creadoEn, nombre, keyName, location, fechaCreacion, uuidProyecto, size, path) VALUES ('0643c1b9-81a8-4d51-9784-fc5eb08cfdf4', '2022-06-28 23:12:17', '48c21595-0e3c-4343-8c4e-1e409d30983c.jpg', 'mendozarq/documents/431e5ad8-561c-43ea-a59a-349d26cd4852.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/mendozarq/documents/431e5ad8-561c-43ea-a59a-349d26cd4852.jpg', '2022-06-28', '92914a40-8a91-495b-9b6a-b46c491c317e', 73342, 'folder');
INSERT INTO mendozarq.documentoproyecto (uuid, creadoEn, nombre, keyName, location, fechaCreacion, uuidProyecto, size, path) VALUES ('0e903802-9a9c-494c-be86-3f67bc4aa6af', '2022-06-28 23:11:40', 'cv.pdf', 'mendozarq/documents/804089eb-44d1-4519-9bcb-237b1b02745b.pdf', 'https://mendozarq-liraki-s3.s3.amazonaws.com/mendozarq/documents/804089eb-44d1-4519-9bcb-237b1b02745b.pdf', '2022-06-28', '92914a40-8a91-495b-9b6a-b46c491c317e', 43108, 'root');
INSERT INTO mendozarq.documentoproyecto (uuid, creadoEn, nombre, keyName, location, fechaCreacion, uuidProyecto, size, path) VALUES ('3797496e-d344-4427-9604-b2fa54360d5b', '2022-06-28 23:10:50', 'Arq. SD docs.docx', 'mendozarq/documents/1343e326-3b12-45a8-8780-e0cb98a3be3f.docx', 'https://mendozarq-liraki-s3.s3.amazonaws.com/mendozarq/documents/1343e326-3b12-45a8-8780-e0cb98a3be3f.docx', '2022-06-28', '92914a40-8a91-495b-9b6a-b46c491c317e', 11904, 'root');
INSERT INTO mendozarq.documentoproyecto (uuid, creadoEn, nombre, keyName, location, fechaCreacion, uuidProyecto, size, path) VALUES ('43e62589-3870-4dcd-8e16-184a2f007781', '2022-06-28 23:09:41', 'AsusSetup.ini', 'mendozarq/documents/48cdf36a-601e-4e2c-8c79-0c855838b35d.ini', 'https://mendozarq-liraki-s3.s3.amazonaws.com/mendozarq/documents/48cdf36a-601e-4e2c-8c79-0c855838b35d.ini', '2022-06-28', '92914a40-8a91-495b-9b6a-b46c491c317e', 652, 'root');
INSERT INTO mendozarq.documentoproyecto (uuid, creadoEn, nombre, keyName, location, fechaCreacion, uuidProyecto, size, path) VALUES ('56a73615-4747-420e-a07c-b0b6f986f66a', '2022-06-28 23:09:44', 'vs_community__864259fb84b54dc1b609f9d6cb102656.exe', 'mendozarq/documents/db56c814-735f-44ed-ac8e-781e623a4cf9.exe', 'https://mendozarq-liraki-s3.s3.amazonaws.com/mendozarq/documents/db56c814-735f-44ed-ac8e-781e623a4cf9.exe', '2022-06-28', '92914a40-8a91-495b-9b6a-b46c491c317e', 1649784, 'root');
INSERT INTO mendozarq.documentoproyecto (uuid, creadoEn, nombre, keyName, location, fechaCreacion, uuidProyecto, size, path) VALUES ('9d2fe0cd-28e0-4889-b0b4-c1cfcd96bcd1', '2022-06-28 23:12:17', 'Hellblade Senua’s Sacrifice.torrent', 'mendozarq/documents/d11fa2fe-d414-41b9-bc92-63ea859de5fe.torrent', 'https://mendozarq-liraki-s3.s3.amazonaws.com/mendozarq/documents/d11fa2fe-d414-41b9-bc92-63ea859de5fe.torrent', '2022-06-28', '92914a40-8a91-495b-9b6a-b46c491c317e', 38585, 'folder');
INSERT INTO mendozarq.documentoproyecto (uuid, creadoEn, nombre, keyName, location, fechaCreacion, uuidProyecto, size, path) VALUES ('a8cf4dd8-7c41-4049-955f-a22b4168311a', '2022-06-28 23:12:06', '48c21595-0e3c-4343-8c4e-1e409d30983c.jpg', 'mendozarq/documents/f0b88bea-168d-4b6b-b2bd-b6888a8122c2.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/mendozarq/documents/f0b88bea-168d-4b6b-b2bd-b6888a8122c2.jpg', '2022-06-28', '92914a40-8a91-495b-9b6a-b46c491c317e', 73342, 'folder');
INSERT INTO mendozarq.documentoproyecto (uuid, creadoEn, nombre, keyName, location, fechaCreacion, uuidProyecto, size, path) VALUES ('d3470258-7c82-467c-b6b9-0b44921d004d', '2022-06-28 23:09:41', 'Fredoka_One.zip', 'mendozarq/documents/8467a19e-bc25-4347-87b2-21a805d64d46.zip', 'https://mendozarq-liraki-s3.s3.amazonaws.com/mendozarq/documents/8467a19e-bc25-4347-87b2-21a805d64d46.zip', '2022-06-28', '92914a40-8a91-495b-9b6a-b46c491c317e', 23564, 'root');
INSERT INTO mendozarq.documentoproyecto (uuid, creadoEn, nombre, keyName, location, fechaCreacion, uuidProyecto, size, path) VALUES ('f25c3ed8-9a76-476a-9c5d-344505f4c943', '2022-06-28 23:09:42', '48c21595-0e3c-4343-8c4e-1e409d30983c.jpg', 'mendozarq/documents/fd19be5d-b451-413f-9977-0fe3063c7b32.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/mendozarq/documents/fd19be5d-b451-413f-9977-0fe3063c7b32.jpg', '2022-06-28', '92914a40-8a91-495b-9b6a-b46c491c317e', 73342, 'root');


INSERT INTO mendozarq.documentocarpeta (uuid, creadoEn, uuidCarpeta, uuidDocumento) VALUES ('1ffcce77-bc31-4148-9866-934b0edd802a', '2022-06-28 23:12:17', '98c78ef9-5c65-4249-ab27-62df5d3d27d4', '9d2fe0cd-28e0-4889-b0b4-c1cfcd96bcd1');
INSERT INTO mendozarq.documentocarpeta (uuid, creadoEn, uuidCarpeta, uuidDocumento) VALUES ('5aefef4b-8158-4aa6-9f6e-69288f2c5377', '2022-06-28 23:12:17', '98c78ef9-5c65-4249-ab27-62df5d3d27d4', '0643c1b9-81a8-4d51-9784-fc5eb08cfdf4');
INSERT INTO mendozarq.documentocarpeta (uuid, creadoEn, uuidCarpeta, uuidDocumento) VALUES ('61643424-474c-43f8-bead-0702bcda33cd', '2022-06-28 23:12:06', 'b3573cb1-ba18-4e8f-9b94-dd73dfaef11b', 'a8cf4dd8-7c41-4049-955f-a22b4168311a');





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


