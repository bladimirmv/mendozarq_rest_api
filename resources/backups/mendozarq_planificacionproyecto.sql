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

INSERT INTO mendozarq.planificacionproyecto (uuid, creadoEn, titulo, subtitulo, uuidProyecto) VALUES ('3d8c04fa-552d-43c0-b2fc-c49e0c9f6bf2', '2022-02-11 13:26:42', 'Cencerrillas Engarmarse Abajeño', ' Lorem ipsum dolor sit amet consectetur,
adipisicing elit. Deleniti fugiat ipsum, sequi, quis eaque in nobis ullam voluptate id quia magni tempore pariatur voluptatem? Eos officia ut modi rem
asper', '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.planificacionproyecto (uuid, creadoEn, titulo, subtitulo, uuidProyecto) VALUES ('9086f313-c5a7-4ce4-8444-73d50b31d0ba', '2022-03-31 22:12:59', 'proyecto de prueba', 'proyecto de prueba de la constructora mendozarq', '8ee6d457-1315-4c9b-bfae-7d7e04ac75a8');
