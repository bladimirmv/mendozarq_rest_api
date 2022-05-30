create table fotoobservacionobra
(
    uuid                varchar(100)                          not null
        primary key,
    creadoEn            timestamp default current_timestamp() not null,
    keyName             text                                  not null,
    fileName            text                                  not null,
    location            text                                  not null,
    size                int                                   not null,
    uuidObservacionObra varchar(100)                          null,
    constraint fotoobservacionobra_ibfk_1
        foreign key (uuidObservacionObra) references observacionobra (uuid)
            on delete cascade
);

create index uuidObservacionObra
    on fotoobservacionobra (uuidObservacionObra);

