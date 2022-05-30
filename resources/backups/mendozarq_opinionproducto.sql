create table opinionproducto
(
    uuid         varchar(100)                           not null
        primary key,
    creadoEn     timestamp  default current_timestamp() not null,
    titulo       varchar(300)                           not null,
    descripcion  varchar(1000)                          not null,
    estado       tinyint(1) default 0                   not null,
    verificado   tinyint(1) default 0                   not null,
    puntuacion   int                                    not null,
    uuidProducto varchar(100)                           not null,
    uuidCliente  varchar(100)                           not null,
    constraint opinionproducto_ibfk_1
        foreign key (uuidProducto) references producto (uuid),
    constraint opinionproducto_ibfk_2
        foreign key (uuidCliente) references usuario (uuid)
);

create index uuidCliente
    on opinionproducto (uuidCliente);

create index uuidProducto
    on opinionproducto (uuidProducto);

