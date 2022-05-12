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
    uuidVendedor  varchar(100) default null                                                                                                ,
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
from log_producto order by creadoEn desc limit 100;



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
      AND v.estado != 'pendiente' AND v.estado!= 'pagando' AND NEW.uuid = c.uuid;
END;

drop trigger insert_conceptoVenta_trigger;




CREATE TRIGGER delete_venta_trigger
    BEFORE
        DELETE
    ON venta
    FOR EACH ROW
BEGIN
    UPDATE producto AS p INNER JOIN conceptoventa c on p.uuid = c.uuidProducto
    INNER JOIN venta v on c.uuidVenta = v.uuid
    SET p.stock = p.stock + c.cantidad
    WHERE c.uuidVenta = OLD.uuid AND v.estado != 'pendiente' AND v.estado!= 'pagando';
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
    WHERE p.uuid = OLD.uuidProducto AND v.estado != 'pendiente' AND v.estado!= 'pagando';
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
    WHERE  v.estado != 'pendiente' AND v.estado!= 'pagando' AND v.uuid = NEW.uuid AND v.tipoVenta = 'online';
END;


















INSERT INTO mendozarq.usuario (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo, username, contrasenha, rol, activo) VALUES ('0976bfba-6a2a-4405-8bfe-2474a21f1e25', '2021-11-24 20:30:52', 'evaristo', 'del', 'gelabert', 67891432, '3896 Gil Ferrocarril
', 'Lilia_Anaya@corpfolder.com', 'evari8pni9', '$2b$10$56JrCWb4S9Zx1.GT9WdwCuNdH5jnFQcwQgKUXqbtLGQvZ2JrsUVSa', 'cliente', 1);
INSERT INTO mendozarq.usuario (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo, username, contrasenha, rol, activo) VALUES ('178e1faa-b3f0-4900-a7b5-a19085c0cf9c', '2021-11-24 20:29:26', 'salomón', 'ruano', '', 72686187, '4265 Korta hernandez Vía Pública
', 'Francisco_Santana@yahoo.com', 'salomo1ydq', '$2b$10$MKlyLpWKHpnwOglfWDOMfeCnT0zwwFKXPEnWbyb7WZvyGTxo0HCiu', 'cliente', 1);
INSERT INTO mendozarq.usuario (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo, username, contrasenha, rol, activo) VALUES ('2319b069-bde2-452c-af94-ec08f68c722c', '2021-11-24 20:39:52', 'leandra', 'villa', 'jordán', 74568926, '817 Tamayo Grupo
', 'XimenaGuadalupe18@yahoo.com', 'leandhbal2', '$2b$10$g5h4utbZBrmhjrKTMV64.O3x6d43Zper9cu5CA7q9zpz5sQSSdHm6', 'vendedor', 1);
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

INSERT INTO mendozarq.personal (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo, descripcion, sueldo, moneda, activo) VALUES ('0cdca13f-175a-4ed0-8320-650f65bf9167', '2021-10-07 21:21:17', 'juan', 'perez', 'mendez', 7762509, 'avenida aroma entre calle nose y avenida alguna ', 'suarez@gmail.com', 'personal de construccion de obras', 10000.00, 'bs', 1);
INSERT INTO mendozarq.personal (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo, descripcion, sueldo, moneda, activo) VALUES ('6739cd0f-9e3e-4eb2-9c22-e2a60be68401', '2022-03-30 23:30:25', 'alvaro', 'mendez', 'castro', 7324341, '', 'mendez@gmail.com', 'Personal de contruccion', 0.00, 'bs', 1);





INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2021-12-27 17:20:27', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'e3f1efed-b797-4c87-9f95-ae0a78a43384');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2021-12-27 17:22:48', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'c2af07dc-a31c-463f-b7db-a36191c6b2f3');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2021-12-27 17:23:20', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'c2af07dc-a31c-463f-b7db-a36191c6b2f3');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('D', '2021-12-27 17:23:26', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'c2af07dc-a31c-463f-b7db-a36191c6b2f3');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('D', '2021-12-27 17:23:34', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'e3f1efed-b797-4c87-9f95-ae0a78a43384');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('D', '2021-12-27 17:25:27', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'a5309073-b7ea-4916-8c04-f553e731cab7');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2021-12-27 17:25:48', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2021-12-27 17:27:24', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2021-12-27 17:27:50', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'd35a9834-8b89-4ad1-a266-0eafa35c3d22');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('D', '2021-12-27 17:27:55', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'd35a9834-8b89-4ad1-a266-0eafa35c3d22');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2021-12-27 17:33:12', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2021-12-27 17:33:23', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2021-12-27 17:39:27', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2021-12-27 17:39:36', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2021-12-27 17:40:05', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2021-12-27 17:40:43', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2021-12-27 17:41:14', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2021-12-27 17:41:54', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2021-12-27 17:42:12', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2021-12-27 17:43:47', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2021-12-27 17:47:33', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2021-12-29 23:44:04', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2021-12-31 22:15:49', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-01-02 23:46:33', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-01-02 23:46:37', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', '35f44215-b58f-491e-a439-4b39ea044442');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-01-17 12:29:39', null, null, 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-02-10 20:39:03', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-02-17 14:39:03', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-02-22 14:53:42', null, null, 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-02-22 14:54:08', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', '35f44215-b58f-491e-a439-4b39ea044442');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-02-22 14:54:33', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', '35f44215-b58f-491e-a439-4b39ea044442');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-03-13 13:58:05', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'b47217c5-fb5c-4441-9dd1-912d9d6e64e2');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('D', '2022-03-27 11:48:07', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'b47217c5-fb5c-4441-9dd1-912d9d6e64e2');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-03-27 11:55:41', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-03-27 11:55:55', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-03-27 18:20:12', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', '35f44215-b58f-491e-a439-4b39ea044442');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-03-27 18:20:22', '', '', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', '35f44215-b58f-491e-a439-4b39ea044442');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-03-27 18:24:34', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-03-28 10:08:36', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-03-28 13:20:10', 'carmelita cabrero castillo', 'bf493a64-4573-433f-92b0-edbcae73a98b', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-03-28 13:24:11', 'carmelita cabrero castillo', 'bf493a64-4573-433f-92b0-edbcae73a98b', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-03-28 13:24:45', 'carmelita cabrero castillo', 'bf493a64-4573-433f-92b0-edbcae73a98b', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-03-30 12:26:08', 'carmelita cabrero castillo', 'bf493a64-4573-433f-92b0-edbcae73a98b', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-03-31 22:26:25', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', '36f1f6d4-163d-4856-a964-aae308769f27');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-03-31 22:27:23', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', '2319b069-bde2-452c-af94-ec08f68c722c');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-04-06 15:37:37', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-04-06 15:37:41', 'bladimir medranoo vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72');




INSERT INTO mendozarq.log_personal (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-01-11 18:01:36', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'personal', 'mendozarq', '0cdca13f-175a-4ed0-8320-650f65bf9167');
INSERT INTO mendozarq.log_personal (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-01-11 18:01:53', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'personal', 'mendozarq', 'eb2428e5-42d2-4ec0-bad7-4c7f50b11fcf');
INSERT INTO mendozarq.log_personal (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('D', '2022-01-11 18:01:57', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'personal', 'mendozarq', 'eb2428e5-42d2-4ec0-bad7-4c7f50b11fcf');
INSERT INTO mendozarq.log_personal (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-01-11 19:31:59', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'personal', 'mendozarq', '0cdca13f-175a-4ed0-8320-650f65bf9167');
INSERT INTO mendozarq.log_personal (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-01-11 19:32:09', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'personal', 'mendozarq', '0cdca13f-175a-4ed0-8320-650f65bf9167');
INSERT INTO mendozarq.log_personal (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-01-11 19:32:20', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'personal', 'mendozarq', '0cdca13f-175a-4ed0-8320-650f65bf9167');
INSERT INTO mendozarq.log_personal (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-01-11 19:33:06', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'personal', 'mendozarq', 'ea20f106-3301-4449-8acd-f5cddab39366');
INSERT INTO mendozarq.log_personal (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-01-11 19:36:53', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'personal', 'mendozarq', 'ea20f106-3301-4449-8acd-f5cddab39366');
INSERT INTO mendozarq.log_personal (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-01-11 19:37:09', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'personal', 'mendozarq', 'd8eb8089-3fc3-4950-b078-9f25679a6541');
INSERT INTO mendozarq.log_personal (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('D', '2022-01-11 19:37:18', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'personal', 'mendozarq', 'ea20f106-3301-4449-8acd-f5cddab39366');
INSERT INTO mendozarq.log_personal (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-01-12 11:25:24', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'personal', 'mendozarq', '6a08128f-06eb-432e-975d-9f43ee21c69a');
INSERT INTO mendozarq.log_personal (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('D', '2022-01-12 11:30:19', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'personal', 'mendozarq', 'd8eb8089-3fc3-4950-b078-9f25679a6541');
INSERT INTO mendozarq.log_personal (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('D', '2022-01-12 11:30:19', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'personal', 'mendozarq', '6a08128f-06eb-432e-975d-9f43ee21c69a');
INSERT INTO mendozarq.log_personal (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-02-08 23:35:12', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'personal', 'mendozarq', '0cdca13f-175a-4ed0-8320-650f65bf9167');
INSERT INTO mendozarq.log_personal (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-02-08 23:35:20', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'personal', 'mendozarq', '0cdca13f-175a-4ed0-8320-650f65bf9167');
INSERT INTO mendozarq.log_personal (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-03-30 23:30:25', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'personal', 'mendozarq', '6739cd0f-9e3e-4eb2-9c22-e2a60be68401');




INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-01-12 22:33:16', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-01-12 22:34:27', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '2506c130-7622-4ef7-92b3-4fb2be6080e0');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-01-12 22:34:37', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '2506c130-7622-4ef7-92b3-4fb2be6080e0');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('D', '2022-01-12 22:34:42', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '2506c130-7622-4ef7-92b3-4fb2be6080e0');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-02-08 23:42:49', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-02-08 23:43:56', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-02-09 20:49:14', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-02-11 13:58:45', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-02-11 13:59:05', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-02-11 14:00:07', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-02-11 14:00:37', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-02-15 18:35:38', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '5f1c430d-cda9-4ee8-aa58-b011c3544567');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('D', '2022-03-30 17:01:27', '', '', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '5f1c430d-cda9-4ee8-aa58-b011c3544567');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-03-30 21:51:37', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '8ee6d457-1315-4c9b-bfae-7d7e04ac75a8');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-03-31 21:38:59', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '8ee6d457-1315-4c9b-bfae-7d7e04ac75a8');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-04-06 09:45:05', null, null, 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-04-06 09:46:38', '', '', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-04-06 09:47:19', '', '', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-04-06 09:48:06', '', '', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-04-06 09:48:48', '', '', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-04-06 10:34:53', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '8ee6d457-1315-4c9b-bfae-7d7e04ac75a8');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-04-06 10:35:05', '', '', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '8ee6d457-1315-4c9b-bfae-7d7e04ac75a8');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-04-06 10:35:33', '', '', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '8ee6d457-1315-4c9b-bfae-7d7e04ac75a8');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-04-06 10:35:43', '', '', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '8ee6d457-1315-4c9b-bfae-7d7e04ac75a8');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-04-06 13:35:38', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-04-06 13:38:59', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-04-06 13:39:03', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-04-06 13:39:08', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-04-06 13:39:19', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-04-06 13:40:24', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-04-06 13:40:29', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-04-06 15:05:53', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-04-06 15:05:59', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-04-06 15:06:07', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-04-06 15:06:18', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-04-06 15:08:03', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-04-06 15:08:09', '', '', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-04-06 15:12:57', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '8ee6d457-1315-4c9b-bfae-7d7e04ac75a8');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-04-06 15:13:01', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '8ee6d457-1315-4c9b-bfae-7d7e04ac75a8');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-04-06 15:15:03', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '8ee6d457-1315-4c9b-bfae-7d7e04ac75a8');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-04-06 15:15:15', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '8ee6d457-1315-4c9b-bfae-7d7e04ac75a8');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-04-06 15:16:18', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '8ee6d457-1315-4c9b-bfae-7d7e04ac75a8');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-04-06 15:16:26', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '8ee6d457-1315-4c9b-bfae-7d7e04ac75a8');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-04-06 15:16:32', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '8ee6d457-1315-4c9b-bfae-7d7e04ac75a8');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-04-06 15:16:50', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '8ee6d457-1315-4c9b-bfae-7d7e04ac75a8');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-04-06 15:17:51', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '8ee6d457-1315-4c9b-bfae-7d7e04ac75a8');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-04-06 15:17:55', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '8ee6d457-1315-4c9b-bfae-7d7e04ac75a8');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-04-06 15:18:05', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '8ee6d457-1315-4c9b-bfae-7d7e04ac75a8');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-04-06 15:18:47', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '8ee6d457-1315-4c9b-bfae-7d7e04ac75a8');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-04-06 15:19:28', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '8ee6d457-1315-4c9b-bfae-7d7e04ac75a8');



INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-01-12 22:36:45', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'documentos', 'mendozarq', '808d6b68-db2f-46d9-b58a-fdd522da1fee');
INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-01-12 22:38:25', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'documentos', 'mendozarq', 'a7680150-1213-4048-961e-6dea49772863');
INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-01-12 22:38:40', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'documentos', 'mendozarq', 'db7878c5-c66d-4d4d-b62f-b89a4123ac5c');
INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-01-12 22:38:40', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'documentos', 'mendozarq', 'd41aa38e-2bbd-4fd7-bd2e-2289cc290381');
INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-01-12 22:38:40', null, null, 'DESKTOP-0D2F255', 'documentos', 'mendozarq', '410e2fc7-f88b-4b46-b5f8-de017ef478e0');
INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-01-12 22:38:59', '', '', 'DESKTOP-0D2F255', 'documentos', 'mendozarq', '694c97e2-f7ac-41a0-ac13-d6565ae4e022');
INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-01-12 22:38:59', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'documentos', 'mendozarq', 'dcf2f930-f372-4c80-80da-5d87142c5d34');
INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-01-12 22:38:59', '', '', 'DESKTOP-0D2F255', 'documentos', 'mendozarq', '4aa83608-70f8-44b9-9046-6217234a61a8');
INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('D', '2022-01-12 22:39:24', '', '', 'DESKTOP-0D2F255', 'documentos', 'mendozarq', '4aa83608-70f8-44b9-9046-6217234a61a8');
INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('D', '2022-01-12 22:39:29', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'documentos', 'mendozarq', '694c97e2-f7ac-41a0-ac13-d6565ae4e022');
INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('D', '2022-01-12 22:39:32', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'documentos', 'mendozarq', 'dcf2f930-f372-4c80-80da-5d87142c5d34');
INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('D', '2022-01-12 22:39:35', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'documentos', 'mendozarq', '410e2fc7-f88b-4b46-b5f8-de017ef478e0');
INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('D', '2022-01-12 22:39:37', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'documentos', 'mendozarq', 'd41aa38e-2bbd-4fd7-bd2e-2289cc290381');
INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('D', '2022-01-12 22:39:41', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'documentos', 'mendozarq', 'db7878c5-c66d-4d4d-b62f-b89a4123ac5c');
INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('D', '2022-01-17 11:34:10', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'documentos', 'mendozarq', 'a7680150-1213-4048-961e-6dea49772863');
INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-02-12 00:10:06', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'documentos', 'mendozarq', '31e1a469-31a7-4a33-b2e6-ea4565318446');
INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('D', '2022-02-12 00:10:13', '', '', 'DESKTOP-0D2F255', 'documentos', 'mendozarq', '31e1a469-31a7-4a33-b2e6-ea4565318446');
INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-02-14 10:49:30', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'documentos', 'mendozarq', '0e62490b-8444-48d1-80f0-0994595574bf');
INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-02-17 14:44:43', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'documentos', 'mendozarq', '32db189a-2d87-45ff-9eb4-7a8cf78b2d17');
INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-02-17 14:44:44', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'documentos', 'mendozarq', '083fe6e4-aea9-4b65-883c-66384a0a0d43');
INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-04-04 23:02:14', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'documentos', 'mendozarq', 'a7b80b1b-f166-4639-abe3-c40f41553d4c');
INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('D', '2022-04-04 23:18:26', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'documentos', 'mendozarq', '079424f6-ec39-4dea-b8c4-54cde87636ad');
INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('D', '2022-04-05 17:05:21', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'documentos', 'mendozarq', 'a7b80b1b-f166-4639-abe3-c40f41553d4c');


