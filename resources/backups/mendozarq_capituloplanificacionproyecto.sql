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

INSERT INTO mendozarq.capituloplanificacionproyecto (uuid, creadoEn, nombre, fechaInicio, fechaFinal, avance, dependencia, color, uuidPlanificacionProyecto) VALUES ('07d76d47-8c38-457e-b3cf-5e8a02b68325', '2022-06-29 06:34:01', 'Revestimientos', '2022-06-28', '2022-07-28', 0, '', '', '1dbb5b64-b1af-421a-893f-7f2dae14d433');
INSERT INTO mendozarq.capituloplanificacionproyecto (uuid, creadoEn, nombre, fechaInicio, fechaFinal, avance, dependencia, color, uuidPlanificacionProyecto) VALUES ('181ef3be-cb84-4970-bf75-3133491ff01b', '2022-06-28 22:36:29', 'Desagüe Industrial', '2022-06-29', '2022-08-17', 0, '', '', '1dbb5b64-b1af-421a-893f-7f2dae14d433');
INSERT INTO mendozarq.capituloplanificacionproyecto (uuid, creadoEn, nombre, fechaInicio, fechaFinal, avance, dependencia, color, uuidPlanificacionProyecto) VALUES ('49e63801-200a-480e-9830-7a45e5020ccd', '2022-06-28 22:36:47', 'Piso Poliretanico', '2022-08-17', '2022-11-30', 0, '196856a7-6140-4894-b814-c836d7e4f087', '', '1dbb5b64-b1af-421a-893f-7f2dae14d433');
INSERT INTO mendozarq.capituloplanificacionproyecto (uuid, creadoEn, nombre, fechaInicio, fechaFinal, avance, dependencia, color, uuidPlanificacionProyecto) VALUES ('66e129e4-774f-479d-9da7-dc5763ac6ec1', '2022-06-28 22:35:20', 'Tareas Previas', '2022-06-30', '2022-08-24', 20, '', '', '1dbb5b64-b1af-421a-893f-7f2dae14d433');
INSERT INTO mendozarq.capituloplanificacionproyecto (uuid, creadoEn, nombre, fechaInicio, fechaFinal, avance, dependencia, color, uuidPlanificacionProyecto) VALUES ('682a3040-1d20-403b-b9d2-2f06054bb8fc', '2022-06-28 22:36:12', 'Pintura', '2022-12-01', '2022-12-31', 0, '06a1575e-2b0e-4c4a-8244-650801955ba3', '', '1dbb5b64-b1af-421a-893f-7f2dae14d433');
INSERT INTO mendozarq.capituloplanificacionproyecto (uuid, creadoEn, nombre, fechaInicio, fechaFinal, avance, dependencia, color, uuidPlanificacionProyecto) VALUES ('83974424-63bb-4ea9-92a3-b2720134fce1', '2022-06-28 22:34:37', 'Cielorraso', '2022-09-21', '2022-11-30', 0, '', '', '1dbb5b64-b1af-421a-893f-7f2dae14d433');
INSERT INTO mendozarq.capituloplanificacionproyecto (uuid, creadoEn, nombre, fechaInicio, fechaFinal, avance, dependencia, color, uuidPlanificacionProyecto) VALUES ('b6fe012b-6e55-4b03-b93f-92e1fbfecc52', '2022-06-29 02:37:21', 'Demoliciones', '2022-06-29', '2022-08-24', 0, '', '', '1dbb5b64-b1af-421a-893f-7f2dae14d433');
INSERT INTO mendozarq.capituloplanificacionproyecto (uuid, creadoEn, nombre, fechaInicio, fechaFinal, avance, dependencia, color, uuidPlanificacionProyecto) VALUES ('f214a429-cb99-4add-80ad-21fb58265f33', '2022-06-28 22:34:21', 'Revoques', '2022-06-28', '2022-10-27', 22, '', '', '1dbb5b64-b1af-421a-893f-7f2dae14d433');
