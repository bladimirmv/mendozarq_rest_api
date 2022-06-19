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

INSERT INTO mendozarq.carritoproducto (uuid, creadoEn, cantidad, uuidProducto, uuidCliente) VALUES ('642bcda9-1029-4ab4-b449-059cd055a6ac', '2022-06-15 23:05:58', 5, '9104aded-4387-44dd-a95d-850445433181', 'bf493a64-4573-433f-92b0-edbcae73a98b');
