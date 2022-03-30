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

INSERT INTO mendozarq.observacionpersonal (uuid, creadoEn, estado, descripcion, fecha, uuidPersonal, uuidVisita) VALUES ('ce746cce-e651-46b6-ad66-527b7b72d59f', '2022-02-17 15:01:38', 'Fecha limite', 'fdsfsdfdsfds', '2022-02-17', '0cdca13f-175a-4ed0-8320-650f65bf9167', '38fc4888-69d9-4b9a-bbc5-7858f640334c');
INSERT INTO mendozarq.observacionpersonal (uuid, creadoEn, estado, descripcion, fecha, uuidPersonal, uuidVisita) VALUES ('da16b654-8650-4188-a710-17b4f4a77eb4', '2021-12-29 23:15:36', 'En curso', 'dsadsadsad', '2021-12-29', '0cdca13f-175a-4ed0-8320-650f65bf9167', '38fc4888-69d9-4b9a-bbc5-7858f640334c');
