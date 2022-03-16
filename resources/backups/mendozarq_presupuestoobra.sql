create table presupuestoobra
(
    uuid        varchar(100)                               not null
        primary key,
    creadoEn    timestamp      default current_timestamp() not null,
    nombre      varchar(100)                               not null,
    descripcion varchar(200)                               not null,
    fecha       date                                       not null,
    iva         decimal(12, 2)                             null,
    total       decimal(12, 2) default 0.00                null,
    uuidCliente varchar(100)                               not null,
    uuidUsuario varchar(100)                               not null,
    constraint presupuestoobra_ibfk_1
        foreign key (uuidCliente) references usuario (uuid),
    constraint presupuestoobra_ibfk_2
        foreign key (uuidUsuario) references usuario (uuid)
);

create index uuidCliente
    on presupuestoobra (uuidCliente);

create index uuidUsuario
    on presupuestoobra (uuidUsuario);

INSERT INTO mendozarq.presupuestoobra (uuid, creadoEn, nombre, descripcion, fecha, iva, total, uuidCliente, uuidUsuario) VALUES ('106aa15f-e6f1-4b78-9547-57ea0d42a2e1', '2022-02-11 23:24:12', 'dsadsad', 'dsadsa', '2022-02-11', 0.00, 0.00, '7ec2091c-abf2-4025-a207-3bbf04a5a8b9', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72');
INSERT INTO mendozarq.presupuestoobra (uuid, creadoEn, nombre, descripcion, fecha, iva, total, uuidCliente, uuidUsuario) VALUES ('e0251f45-2ddf-4096-872a-99c319a09b40', '2022-01-13 16:06:40', 'trump tower', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. ', '2022-01-13', 5.00, 0.00, 'bf493a64-4573-433f-92b0-edbcae73a98b', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72');
