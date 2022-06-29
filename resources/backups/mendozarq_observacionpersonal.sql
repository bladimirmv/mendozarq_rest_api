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

INSERT INTO mendozarq.observacionpersonal (uuid, creadoEn, estado, descripcion, fecha, uuidPersonal, uuidVisita) VALUES ('7409ba7e-8f63-45bd-b1a6-eb522cbffa6a', '2022-06-29 10:17:59', 'Con retraso', 'Sin avances importantes en la estructuracion de la base de cimentaciones.', '2022-06-29', '471c2837-6d59-43c2-ac1e-81a56f7a3d03', '2449f5ef-95fa-4d88-9050-5174ebdc30dd');
