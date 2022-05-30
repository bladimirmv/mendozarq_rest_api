create table personalproyecto
(
    uuid         varchar(100)                          not null
        primary key,
    creadoEn     timestamp default current_timestamp() not null,
    uuidProyecto varchar(100)                          not null,
    uuidPersonal varchar(100)                          not null,
    constraint personalproyecto_ibfk_1
        foreign key (uuidProyecto) references proyecto (uuid),
    constraint personalproyecto_ibfk_2
        foreign key (uuidPersonal) references personal (uuid)
);

create index uuidPersonal
    on personalproyecto (uuidPersonal);

create index uuidProyecto
    on personalproyecto (uuidProyecto);

