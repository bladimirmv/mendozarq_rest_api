create table conceptoventa
(
    uuid           varchar(100)                               not null
        primary key,
    creadoEn       timestamp      default current_timestamp() not null,
    cantidad       int                                        not null,
    precioUnitario decimal(16, 2)                             not null,
    importe        decimal(16, 2)                             not null,
    descuento      decimal(15, 2) default 0.00                not null,
    uuidProducto   varchar(100)                               not null,
    uuidVenta      varchar(100)                               not null,
    constraint conceptoventa_ibfk_1
        foreign key (uuidVenta) references venta (uuid)
            on delete cascade,
    constraint conceptoventa_ibfk_2
        foreign key (uuidProducto) references producto (uuid)
);

create index uuidProducto
    on conceptoventa (uuidProducto);

create index uuidVenta
    on conceptoventa (uuidVenta);

