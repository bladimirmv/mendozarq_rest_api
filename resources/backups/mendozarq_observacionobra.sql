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

INSERT INTO mendozarq.observacionobra (uuid, creadoEn, puntoDeInspeccion, observacion, levantamientoObservacion, uuidVisita) VALUES ('01890f8a-7e30-42d5-aff3-9cc07027fbc5', '2022-06-29 10:15:52', 'Suelo y cimentaciones', 'Estabilizar el talud inestable, todos los taludesnaturales del recinto. Presentar carta de seguridad', 'Para brindar seguridad al personal,se fabrico y coloco malla deseguridad (malla 1), la cual cuentancon una estructura metálica ymallas, con la finalidad de clausurary prohibir el paso del personal.', '2449f5ef-95fa-4d88-9050-5174ebdc30dd');
INSERT INTO mendozarq.observacionobra (uuid, creadoEn, puntoDeInspeccion, observacion, levantamientoObservacion, uuidVisita) VALUES ('75855617-187e-4315-b935-ca2d0e1f680a', '2022-06-29 09:22:19', 'Suelo y cimentaciones', 'Reparar y/o reforzar las estructuras de la cimentacióndañadas, en plataforma frente a tolvas (molin', 'Se reparo piso dañado quepresentaba grietas y rajaduras, seconstruyo plataforma de concretoarmado, con la finalidad que lanueva superficie brinden mayorresistencia.', '2449f5ef-95fa-4d88-9050-5174ebdc30dd');
