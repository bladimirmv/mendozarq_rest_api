create table proveedor
(
    uuid        varchar(100)                          not null
        primary key,
    creadoEn    timestamp default current_timestamp() not null,
    nombre      varchar(100)                          not null,
    celular     int                                   null,
    direccion   varchar(200)                          null,
    descripcion varchar(200)                          null,
    uuidRecurso varchar(100)                          null,
    constraint proveedor_ibfk_1
        foreign key (uuidRecurso) references recurso (uuid)
);

create index uuidRecurso
    on proveedor (uuidRecurso);

