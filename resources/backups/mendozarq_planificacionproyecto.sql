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

INSERT INTO mendozarq.planificacionproyecto (uuid, creadoEn, titulo, subtitulo, uuidProyecto) VALUES ('1dbb5b64-b1af-421a-893f-7f2dae14d433', '2022-06-28 22:28:33', 'Lomas del sur tower', 'Edificio central de la empresa importadora lomas del sur.', '92914a40-8a91-495b-9b6a-b46c491c317e');
