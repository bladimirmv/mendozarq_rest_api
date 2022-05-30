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

