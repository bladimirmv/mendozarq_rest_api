create table visitaproyecto
(
    uuid            varchar(100)                           not null
        primary key,
    creadoEn        timestamp  default current_timestamp() not null,
    estado          tinyint(1) default 0                   null,
    nombre          varchar(50)                            not null,
    faseDelProyecto text                                   not null,
    descripcion     varchar(200)                           null,
    fecha           timestamp  default current_timestamp() not null,
    uuidProyecto    varchar(100)                           not null,
    constraint visitaproyecto_ibfk_1
        foreign key (uuidProyecto) references proyecto (uuid)
);

create index uuidProyecto
    on visitaproyecto (uuidProyecto);

