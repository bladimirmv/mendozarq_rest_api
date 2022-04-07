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

INSERT INTO mendozarq.capituloplanificacionproyecto (uuid, creadoEn, nombre, fechaInicio, fechaFinal, avance, dependencia, color, uuidPlanificacionProyecto) VALUES ('384a37d2-9d46-489e-9127-c80d5f1e9037', '2022-04-06 19:06:18', 'Limpieza de obra', '2022-04-06', '2022-04-30', 46, '962f6dcd-4565-4c0b-93a2-8dc309b337a2', '', '3d8c04fa-552d-43c0-b2fc-c49e0c9f6bf2');
INSERT INTO mendozarq.capituloplanificacionproyecto (uuid, creadoEn, nombre, fechaInicio, fechaFinal, avance, dependencia, color, uuidPlanificacionProyecto) VALUES ('3e5eb62b-388f-4ca2-b40f-afce49edd08a', '2022-02-12 09:27:41', 'Lorem ipsum dolor sit amet consectetura', '2022-02-01', '2022-05-31', 31, '', '#ed1212', '3d8c04fa-552d-43c0-b2fc-c49e0c9f6bf2');
INSERT INTO mendozarq.capituloplanificacionproyecto (uuid, creadoEn, nombre, fechaInicio, fechaFinal, avance, dependencia, color, uuidPlanificacionProyecto) VALUES ('7bc3ab75-27bc-4955-bbfc-59f5ba5a36eb', '2022-04-06 18:34:53', 'Cielorraso', '2022-04-05', '2022-04-27', 81, 'b75d2f11-abbf-41d4-bf4d-96bb6db2ac19', '#17a215', '9086f313-c5a7-4ce4-8444-73d50b31d0ba');
INSERT INTO mendozarq.capituloplanificacionproyecto (uuid, creadoEn, nombre, fechaInicio, fechaFinal, avance, dependencia, color, uuidPlanificacionProyecto) VALUES ('c6bdce00-1b21-4e82-afe6-d0fd62eb33e1', '2022-04-03 00:24:51', 'Carpintería', '2022-04-07', '2022-04-29', 5, '', '', '9086f313-c5a7-4ce4-8444-73d50b31d0ba');
