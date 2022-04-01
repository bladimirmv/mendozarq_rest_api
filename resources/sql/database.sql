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



CREATE TABLE ventaProducto
(
    uuid         varchar(100) PRIMARY KEY,
    creadoEn     timestamp    DEFAULT CURRENT_TIMESTAMP NOT NULL,
    uuidCliente  varchar(100)                           NOT NULL,
    uuidVendedor varchar(100) DEFAULT NULL,
    tipoVenta    TEXT                                   NOT NULL,
    metodoPago   text                                   NOT NULL,
    FOREIGN KEY (uuidCliente) REFERENCES usuario (uuid),
    FOREIGN KEY (uuidVendedor) REFERENCES usuario (uuid)
);



CREATE TABLE detalleVentaProducto
(
    uuid              varchar(100) PRIMARY KEY,
    creadoEn          timestamp      DEFAULT CURRENT_TIMESTAMP NOT NULL,
    uuidVentaProducto varchar(100)                             NOT NULL,
    uuidProducto      varchar(100)                             NOT NULL,
    descuento         decimal(15, 2) DEFAULT 0                 NOT NULL,
    cantidad          int                                      NOT NULL,
    precio            decimal(15, 2)                           NOT NULL,
    FOREIGN KEY (uuidVentaProducto) REFERENCES ventaProducto (uuid) on delete cascade,
    FOREIGN KEY (uuidProducto) REFERENCES producto (uuid)
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


CREATE TABLE pedidoProducto
(
    uuid            varchar(100) PRIMARY KEY,
    creadoEn        timestamp                                                        DEFAULT CURRENT_TIMESTAMP NOT NULL,
    numeroPedido    int unique auto_increment                                                                  NOT NULL,
    nombre          varchar(50)                                                                                NOT NULL,
    apellidoPaterno varchar(50)                                                                                NOT NULL,
    apellidoMaterno varchar(50),
    celular         int                                                                                        not null,
    direccion       text                                                                                       not null,
    correo          varchar(100)                                                                               not null,
    nombreFactura   varchar(50)                                                                                not null,
    nitCI           text                                                                                       not null,
    tipoEnvio       enum ('delivery', 'carpinteria'),
    descripcion     varchar(500)                                                                               not null,
    metodoDePago    enum ( 'efectivo','deposito_transferencia_qr', 'paypal')                                   not null,
    total           decimal(15, 2)                                                                             NOT NULL,
    uuidCliente     varchar(100)                                                                               not null,
    estado          enum ('pagando','pendiente', 'confirmado','envio', 'completado') default 'pendiente'       not null,
    FOREIGN KEY (uuidCliente) REFERENCES usuario (uuid)
);

drop table if exists carritoPedido, pedidoProducto;

alter table pedidoProducto
    auto_increment = 1000001;
CREATE TABLE carritoPedido
(
    uuid         varchar(100) PRIMARY KEY,
    creadoEn     timestamp      DEFAULT CURRENT_TIMESTAMP NOT NULL,
    cantidad     int            default 1                 not null,
    uuidProducto varchar(100)                             not null,
    uuidPedido   varchar(100)                             not null,
    precio       decimal(15, 2)                           NOT NULL,
    descuento    decimal(15, 2) DEFAULT 0                 NOT NULL,
    nombre       varchar(300)                             NOT NULL,
    descripcion  varchar(1000),
    FOREIGN KEY (uuidProducto) REFERENCES producto (uuid),
    FOREIGN KEY (uuidPedido) REFERENCES pedidoProducto (uuid) ON DELETE CASCADE
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
    uuidVendedor  varchar(100)                                                                                                  not null,
    FOREIGN KEY (uuidCliente) REFERENCES usuario (uuid),
    FOREIGN KEY (uuidVendedor) REFERENCES usuario (uuid)
);

drop table if exists conceptoVenta, venta;
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



/* ////////////////////////////// */

use mendozarq;

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


