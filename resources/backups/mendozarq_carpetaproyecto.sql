create table carpetaproyecto
(
    uuid          varchar(100)                          not null
        primary key,
    creadoEn      timestamp default current_timestamp() not null,
    nombre        varchar(50)                           null,
    fechaCreacion date                                  null,
    uuidProyecto  varchar(100)                          not null,
    constraint carpetaproyecto_ibfk_1
        foreign key (uuidProyecto) references proyecto (uuid)
);

create index uuidProyecto
    on carpetaproyecto (uuidProyecto);

