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

INSERT INTO mendozarq.presupuestoobra (uuid, creadoEn, nombre, descripcion, fecha, iva, total, uuidCliente, uuidUsuario, uuidProyecto) VALUES ('e0251f45-2ddf-4096-872a-99c319a09b40', '2022-01-13 16:06:40', 'trump tower', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. ', '2022-01-13', 5.00, 0.00, 'bf493a64-4573-433f-92b0-edbcae73a98b', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', null);
