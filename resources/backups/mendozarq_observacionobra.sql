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

