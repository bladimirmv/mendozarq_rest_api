create table presupuestoobra
(
    uuid         varchar(100)                               not null
        primary key,
    creadoEn     timestamp      default current_timestamp() not null,
    nombre       varchar(100)                               not null,
    descripcion  varchar(200)                               not null,
    fecha        date                                       not null,
    iva          decimal(12, 2) default 0.00                null,
    total        decimal(12, 2) default 0.00                null,
    uuidCliente  varchar(100)                               null,
    uuidUsuario  varchar(100)                               null,
    uuidProyecto varchar(100)                               null,
    constraint presupuestoobra_ibfk_1
        foreign key (uuidCliente) references usuario (uuid),
    constraint presupuestoobra_ibfk_2
        foreign key (uuidUsuario) references usuario (uuid),
    constraint presupuestoobra_ibfk_3
        foreign key (uuidProyecto) references proyecto (uuid)
);

create index uuidCliente
    on presupuestoobra (uuidCliente);

create index uuidProyecto
    on presupuestoobra (uuidProyecto);

create index uuidUsuario
    on presupuestoobra (uuidUsuario);

INSERT INTO mendozarq.presupuestoobra (uuid, creadoEn, nombre, descripcion, fecha, iva, total, uuidCliente, uuidUsuario, uuidProyecto) VALUES ('5185e058-4571-47fd-abd8-84ba0fa9c633', '2022-03-31 21:48:23', 'trump tower', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. ', '2022-01-13', 5.00, 0.00, null, null, '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.presupuestoobra (uuid, creadoEn, nombre, descripcion, fecha, iva, total, uuidCliente, uuidUsuario, uuidProyecto) VALUES ('b4961720-0113-47b7-8bb7-06203e3b5c1b', '2022-04-02 20:16:30', 'proyecto de prueba', 'proyecto de prueba de la constructora mendozarq', null, 0.00, 0.00, null, null, '8ee6d457-1315-4c9b-bfae-7d7e04ac75a8');
INSERT INTO mendozarq.presupuestoobra (uuid, creadoEn, nombre, descripcion, fecha, iva, total, uuidCliente, uuidUsuario, uuidProyecto) VALUES ('e0251f45-2ddf-4096-872a-99c319a09b40', '2022-01-13 16:06:40', 'trump tower', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. ', '2022-01-13', 5.00, 0.00, 'bf493a64-4573-433f-92b0-edbcae73a98b', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', null);
