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

INSERT INTO mendozarq.participantevisita (uuid, creadoEn, uuidVisitaProyecto, uuidUsuario) VALUES ('163ecf55-f583-4c3d-9f54-15be7d60ecc6', '2022-06-29 09:17:53', '2449f5ef-95fa-4d88-9050-5174ebdc30dd', '81f19377-6c68-4bdc-9e38-d1c47b68c0c6');
INSERT INTO mendozarq.participantevisita (uuid, creadoEn, uuidVisitaProyecto, uuidUsuario) VALUES ('49d3a1fc-6ae1-4c76-8ee9-2ad406b03036', '2022-06-28 23:04:33', '7031a3f1-65c5-4afe-ace8-d208c94b60ba', '36f1f6d4-163d-4856-a964-aae308769f27');
INSERT INTO mendozarq.participantevisita (uuid, creadoEn, uuidVisitaProyecto, uuidUsuario) VALUES ('5fe60b47-96b7-4bc3-ae77-4bcf92fe2e73', '2022-06-28 23:04:33', '7031a3f1-65c5-4afe-ace8-d208c94b60ba', '81f19377-6c68-4bdc-9e38-d1c47b68c0c6');
INSERT INTO mendozarq.participantevisita (uuid, creadoEn, uuidVisitaProyecto, uuidUsuario) VALUES ('6a598bf5-6268-4156-960f-1cef416e7e8a', '2022-06-28 23:04:33', '7031a3f1-65c5-4afe-ace8-d208c94b60ba', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72');
INSERT INTO mendozarq.participantevisita (uuid, creadoEn, uuidVisitaProyecto, uuidUsuario) VALUES ('81f082a5-5ca6-47d9-b3db-6e6bca823fa6', '2022-06-29 09:17:53', '2449f5ef-95fa-4d88-9050-5174ebdc30dd', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72');
INSERT INTO mendozarq.participantevisita (uuid, creadoEn, uuidVisitaProyecto, uuidUsuario) VALUES ('9a64f8ff-1e36-4fd8-9266-b7d96af2038f', '2022-06-29 09:17:53', '2449f5ef-95fa-4d88-9050-5174ebdc30dd', '36f1f6d4-163d-4856-a964-aae308769f27');
INSERT INTO mendozarq.participantevisita (uuid, creadoEn, uuidVisitaProyecto, uuidUsuario) VALUES ('cf598b2c-8dce-4352-be8a-d030493cad3e', '2022-06-29 09:17:53', '2449f5ef-95fa-4d88-9050-5174ebdc30dd', '35f44215-b58f-491e-a439-4b39ea044442');
