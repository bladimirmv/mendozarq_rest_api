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

INSERT INTO mendozarq.presupuestoobra (uuid, creadoEn, nombre, descripcion, fecha, iva, total, uuidCliente, uuidUsuario, uuidProyecto) VALUES ('92266b0e-82e7-4f6b-93d8-149c3457a8c5', '2022-06-28 21:39:42', 'trump tower', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley', '2022-06-28', 0.00, 0.00, '7ec2091c-abf2-4025-a207-3bbf04a5a8b9', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', null);
INSERT INTO mendozarq.presupuestoobra (uuid, creadoEn, nombre, descripcion, fecha, iva, total, uuidCliente, uuidUsuario, uuidProyecto) VALUES ('e0251f45-2ddf-4096-872a-99c319a09b40', '2022-01-13 16:06:40', 'lomas del sur tower', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. ', '2022-01-13', 5.00, 0.00, 'bf493a64-4573-433f-92b0-edbcae73a98b', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', null);
INSERT INTO mendozarq.presupuestoobra (uuid, creadoEn, nombre, descripcion, fecha, iva, total, uuidCliente, uuidUsuario, uuidProyecto) VALUES ('f36499a7-fe9d-4fa6-b15a-1b16d98e13b8', '2022-06-28 23:18:27', 'lomas del sur tower', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. ', '2022-01-13', 5.00, 0.00, null, null, '92914a40-8a91-495b-9b6a-b46c491c317e');
