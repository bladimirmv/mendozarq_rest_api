create table planificacionproyecto
(
    uuid         varchar(100)                          not null
        primary key,
    creadoEn     timestamp default current_timestamp() not null,
    titulo       text                                  not null,
    subtitulo    text                                  null,
    uuidProyecto varchar(100)                          not null,
    constraint planificacionproyecto_ibfk_1
        foreign key (uuidProyecto) references proyecto (uuid)
            on delete cascade
);

create index uuidProyecto
    on planificacionproyecto (uuidProyecto);

