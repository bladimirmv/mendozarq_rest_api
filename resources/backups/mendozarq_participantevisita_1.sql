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

INSERT INTO mendozarq.participantevisita (uuid, creadoEn, uuidVisitaProyecto, uuidUsuario) VALUES ('8718a759-22c2-4375-88d7-ee52dc396672', '2022-02-17 15:00:58', '38fc4888-69d9-4b9a-bbc5-7858f640334c', '35f44215-b58f-491e-a439-4b39ea044442');
INSERT INTO mendozarq.participantevisita (uuid, creadoEn, uuidVisitaProyecto, uuidUsuario) VALUES ('9bd2aed8-d47d-4b78-ad57-5c23685406be', '2022-02-17 15:00:58', '38fc4888-69d9-4b9a-bbc5-7858f640334c', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72');
