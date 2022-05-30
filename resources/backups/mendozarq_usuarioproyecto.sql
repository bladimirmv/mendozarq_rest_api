create table usuarioproyecto
(
    uuid         varchar(100)                          not null
        primary key,
    creadoEn     timestamp default current_timestamp() not null,
    uuidProyecto varchar(100)                          not null,
    uuidUsuario  varchar(100)                          not null,
    constraint usuarioproyecto_ibfk_1
        foreign key (uuidProyecto) references proyecto (uuid),
    constraint usuarioproyecto_ibfk_2
        foreign key (uuidUsuario) references usuario (uuid)
);

create index uuidProyecto
    on usuarioproyecto (uuidProyecto);

create index uuidUsuario
    on usuarioproyecto (uuidUsuario);

