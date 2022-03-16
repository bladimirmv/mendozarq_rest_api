create table observacionservicio
(
    uuid         varchar(100)                          not null
        primary key,
    creadoEn     timestamp default current_timestamp() not null,
    estado       varchar(100)                          not null,
    descripcion  varchar(200)                          not null,
    fecha        date                                  not null,
    uuidServicio varchar(100)                          not null,
    uuidVisita   varchar(100)                          not null,
    constraint observacionservicio_ibfk_1
        foreign key (uuidServicio) references servicioproyecto (uuid),
    constraint observacionservicio_ibfk_2
        foreign key (uuidVisita) references visitaproyecto (uuid)
);

create index uuidServicio
    on observacionservicio (uuidServicio);

create index uuidVisita
    on observacionservicio (uuidVisita);

