create table servicioproyecto
(
    uuid         varchar(100)                          not null
        primary key,
    creadoEn     timestamp default current_timestamp() not null,
    nombre       varchar(50)                           not null,
    descripcion  varchar(200)                          null,
    avance       int                                   not null,
    fechaInicio  date                                  not null,
    fechaFinal   date                                  not null,
    uuidProyecto varchar(100)                          not null,
    constraint servicioproyecto_ibfk_1
        foreign key (uuidProyecto) references proyecto (uuid)
);

create index uuidProyecto
    on servicioproyecto (uuidProyecto);

INSERT INTO mendozarq.servicioproyecto (uuid, creadoEn, nombre, descripcion, avance, fechaInicio, fechaFinal, uuidProyecto) VALUES ('9dd2d513-baab-4d53-a1b4-d76993255941', '2022-02-11 23:31:23', 'dsadas', 'dsadasd', 90, '2022-02-09', '2022-02-22', '13f3af68-d552-4c54-bde6-816f474dd4ec');
