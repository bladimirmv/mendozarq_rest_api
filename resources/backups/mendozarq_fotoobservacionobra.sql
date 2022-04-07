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

INSERT INTO mendozarq.fotoobservacionobra (uuid, creadoEn, keyName, fileName, location, size, uuidObservacionObra) VALUES ('8930d19e-2202-4f71-becc-d4f28d272bd6', '2022-04-05 00:07:43', 'mendozarq/observaciones/images/ce25a568-9de7-4598-934d-933abae48ecf.png', 'capas-1024x763.png', 'https://mendozarq-liraki-s3.s3.amazonaws.com/mendozarq/observaciones/images/ce25a568-9de7-4598-934d-933abae48ecf.png', 581660, 'c357d0fc-197a-4726-9148-c02b4b917e42');
