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

INSERT INTO mendozarq.fotoobservacionobra (uuid, creadoEn, keyName, fileName, location, size, uuidObservacionObra) VALUES ('19cd9745-e378-4dda-9ca8-de75ba0842bb', '2022-06-29 09:27:49', 'mendozarq/observaciones/images/8d460666-8e76-42a1-89b6-abef146a23ab.jpg', 'obras-civiles.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/mendozarq/observaciones/images/8d460666-8e76-42a1-89b6-abef146a23ab.jpg', 184498, '75855617-187e-4315-b935-ca2d0e1f680a');
INSERT INTO mendozarq.fotoobservacionobra (uuid, creadoEn, keyName, fileName, location, size, uuidObservacionObra) VALUES ('8c7fe49a-e574-4413-ab8a-02256d5ace3e', '2022-06-29 10:16:34', 'mendozarq/observaciones/images/79d0e437-0f3e-4356-88e3-357eb7876349.jpg', 'construyendo-deposito-agua-para-hospital.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/mendozarq/observaciones/images/79d0e437-0f3e-4356-88e3-357eb7876349.jpg', 141643, '01890f8a-7e30-42d5-aff3-9cc07027fbc5');
INSERT INTO mendozarq.fotoobservacionobra (uuid, creadoEn, keyName, fileName, location, size, uuidObservacionObra) VALUES ('e93641ff-e62a-4346-b674-34a3119f49ee', '2022-06-29 09:27:49', 'mendozarq/observaciones/images/e9176863-b35d-47ac-9c05-b277f5694517.jpg', 'standard__DSC0739.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/mendozarq/observaciones/images/e9176863-b35d-47ac-9c05-b277f5694517.jpg', 92020, '75855617-187e-4315-b935-ca2d0e1f680a');
