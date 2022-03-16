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

INSERT INTO mendozarq.personalproyecto (uuid, creadoEn, uuidProyecto, uuidPersonal) VALUES ('c0013267-110a-4db8-ad73-fdccb16620b9', '2022-02-17 15:00:00', '13f3af68-d552-4c54-bde6-816f474dd4ec', '0cdca13f-175a-4ed0-8320-650f65bf9167');
