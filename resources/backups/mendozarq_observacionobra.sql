create table observacionobra
(
    uuid                     varchar(100)                          not null
        primary key,
    creadoEn                 timestamp default current_timestamp() not null,
    puntoDeInspeccion        text                                  null,
    observacion              varchar(100)                          null,
    levantamientoObservacion text                                  null,
    uuidVisita               varchar(100)                          null,
    constraint observacionobra_ibfk_1
        foreign key (uuidVisita) references visitaproyecto (uuid)
);

create index uuidVisita
    on observacionobra (uuidVisita);

INSERT INTO mendozarq.observacionobra (uuid, creadoEn, puntoDeInspeccion, observacion, levantamientoObservacion, uuidVisita) VALUES ('3e631e76-8ad4-427b-9aa2-db0487caa369', '2022-04-04 15:10:27', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequuntur veniam
nisi vero, consequatur inventore harum. Dolorum, rem pariatur suscipit
exercitationem esse adipisci aliquam.', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequuntur veniam
nisi vero, consequatur ', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequuntur veniam
nisi vero, consequatur inventore harum. Dolorum, rem pariatur suscipit
exercitationem esse adipisci aliquam.', '38fc4888-69d9-4b9a-bbc5-7858f640334c');
INSERT INTO mendozarq.observacionobra (uuid, creadoEn, puntoDeInspeccion, observacion, levantamientoObservacion, uuidVisita) VALUES ('c357d0fc-197a-4726-9148-c02b4b917e42', '2022-04-04 15:10:01', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequuntur veniam
nisi vero, consequatur inventore harum. Dolorum, rem pariatur suscipit
exercitationem esse adipisci aliquam.', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequuntur veniam
nisi vero, consequatur ', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequuntur veniam
nisi vero, consequatur inventore harum. Dolorum, rem pariatur suscipit
exercitationem esse adipisci aliquam.', '38fc4888-69d9-4b9a-bbc5-7858f640334c');
