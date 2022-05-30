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

