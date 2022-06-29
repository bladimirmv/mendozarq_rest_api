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

