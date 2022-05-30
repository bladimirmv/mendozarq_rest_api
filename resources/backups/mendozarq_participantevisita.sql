create table participantevisita
(
    uuid               varchar(100)                          not null
        primary key,
    creadoEn           timestamp default current_timestamp() not null,
    uuidVisitaProyecto varchar(100)                          not null,
    uuidUsuario        varchar(100)                          not null,
    constraint participantevisita_ibfk_1
        foreign key (uuidVisitaProyecto) references visitaproyecto (uuid),
    constraint participantevisita_ibfk_2
        foreign key (uuidUsuario) references usuario (uuid)
);

create index uuidUsuario
    on participantevisita (uuidUsuario);

create index uuidVisitaProyecto
    on participantevisita (uuidVisitaProyecto);

