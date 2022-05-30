create table observacionpersonal
(
    uuid         varchar(100)                          not null
        primary key,
    creadoEn     timestamp default current_timestamp() not null,
    estado       varchar(100)                          not null,
    descripcion  varchar(200)                          not null,
    fecha        date                                  not null,
    uuidPersonal varchar(100)                          not null,
    uuidVisita   varchar(100)                          not null,
    constraint observacionpersonal_ibfk_1
        foreign key (uuidPersonal) references personal (uuid),
    constraint observacionpersonal_ibfk_2
        foreign key (uuidVisita) references visitaproyecto (uuid)
);

create index uuidPersonal
    on observacionpersonal (uuidPersonal);

create index uuidVisita
    on observacionpersonal (uuidVisita);

