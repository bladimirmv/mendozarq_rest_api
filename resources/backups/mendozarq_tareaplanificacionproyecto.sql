create table tareaplanificacionproyecto
(
    uuid         varchar(100)                           not null
        primary key,
    creadoEn     timestamp  default current_timestamp() not null,
    nombre       varchar(200)                           not null,
    fechaInicio  date                                   null,
    fechaFinal   date                                   null,
    avance       int                                    null,
    dependencia  varchar(100)                           null,
    hito         tinyint(1) default 0                   null,
    color        text                                   null,
    actividades  text                                   null,
    uuidCapitulo varchar(100)                           not null,
    constraint tareaplanificacionproyecto_ibfk_1
        foreign key (uuidCapitulo) references capituloplanificacionproyecto (uuid)
            on delete cascade
);

create index uuidCapitulo
    on tareaplanificacionproyecto (uuidCapitulo);

