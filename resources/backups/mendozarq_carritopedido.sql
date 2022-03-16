create table carritopedido
(
    uuid         varchar(100)                               not null
        primary key,
    creadoEn     timestamp      default current_timestamp() not null,
    cantidad     int            default 1                   not null,
    uuidProducto varchar(100)                               not null,
    uuidPedido   varchar(100)                               not null,
    precio       decimal(15, 2)                             not null,
    descuento    decimal(15, 2) default 0.00                not null,
    nombre       varchar(300)                               not null,
    descripcion  varchar(1000)                              null,
    constraint nombre
        unique (nombre),
    constraint uuidProducto
        unique (uuidProducto),
    constraint carritopedido_ibfk_1
        foreign key (uuidProducto) references producto (uuid),
    constraint carritopedido_ibfk_2
        foreign key (uuidPedido) references pedidoproducto (uuid)
);

create index uuidPedido
    on carritopedido (uuidPedido);

