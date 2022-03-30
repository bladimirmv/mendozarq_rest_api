create table capituloplanificacionproyecto
(
    uuid                      varchar(100)                          not null
        primary key,
    creadoEn                  timestamp default current_timestamp() not null,
    nombre                    varchar(200)                          not null,
    fechaInicio               date                                  null,
    fechaFinal                date                                  null,
    avance                    int                                   null,
    dependencia               varchar(100)                          null,
    color                     text                                  null,
    uuidPlanificacionProyecto varchar(100)                          not null,
    constraint capituloplanificacionproyecto_ibfk_1
        foreign key (uuidPlanificacionProyecto) references planificacionproyecto (uuid)
            on delete cascade
);

create index uuidPlanificacionProyecto
    on capituloplanificacionproyecto (uuidPlanificacionProyecto);

INSERT INTO mendozarq.capituloplanificacionproyecto (uuid, creadoEn, nombre, fechaInicio, fechaFinal, avance, dependencia, color, uuidPlanificacionProyecto) VALUES ('3e5eb62b-388f-4ca2-b40f-afce49edd08a', '2022-02-11 13:27:41', 'Lorem ipsum dolor sit amet consectetura', '2022-02-01', '2022-05-31', 0, '', '#ed1212', '3d8c04fa-552d-43c0-b2fc-c49e0c9f6bf2');
INSERT INTO mendozarq.capituloplanificacionproyecto (uuid, creadoEn, nombre, fechaInicio, fechaFinal, avance, dependencia, color, uuidPlanificacionProyecto) VALUES ('c2ced438-d97e-4f1c-8a7c-f3a56de9b4d5', '2022-02-17 14:57:16', 'dsadasdas', '2022-02-15', '2022-02-28', 58, '962f6dcd-4565-4c0b-93a2-8dc309b337a2', '#00ff1e', '3d8c04fa-552d-43c0-b2fc-c49e0c9f6bf2');
