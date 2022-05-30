create table documentoproyecto
(
    uuid          varchar(100)                          not null
        primary key,
    creadoEn      timestamp default current_timestamp() not null,
    nombre        text                                  not null,
    keyName       text                                  not null,
    location      text                                  not null,
    fechaCreacion date                                  not null,
    uuidProyecto  varchar(100)                          not null,
    size          int                                   not null,
    path          varchar(10)                           not null,
    constraint documentoproyecto_ibfk_1
        foreign key (uuidProyecto) references proyecto (uuid)
);

create index uuidProyecto
    on documentoproyecto (uuidProyecto);

