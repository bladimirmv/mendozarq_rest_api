create table carritoproducto
(
    uuid         varchar(100)                          not null
        primary key,
    creadoEn     timestamp default current_timestamp() not null,
    cantidad     int       default 1                   not null,
    uuidProducto varchar(100)                          not null,
    uuidCliente  varchar(100)                          not null,
    constraint carritoproducto_ibfk_1
        foreign key (uuidProducto) references producto (uuid),
    constraint carritoproducto_ibfk_2
        foreign key (uuidCliente) references usuario (uuid)
);

create index uuidCliente
    on carritoproducto (uuidCliente);

create index uuidProducto
    on carritoproducto (uuidProducto);

INSERT INTO mendozarq.carritoproducto (uuid, creadoEn, cantidad, uuidProducto, uuidCliente) VALUES ('2823487e-3e34-469f-aa7d-5f9156e484cf', '2022-05-24 23:45:03', 1, '7bd5774f-6174-48a9-b456-ed132353885a', 'bf493a64-4573-433f-92b0-edbcae73a98b');
