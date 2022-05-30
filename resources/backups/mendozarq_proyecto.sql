create table proyecto
(
    uuid          varchar(100)                          not null
        primary key,
    creadoEn      timestamp default current_timestamp() not null,
    nombre        varchar(50)                           not null,
    descripcion   text                                  null,
    categoria     varchar(100)                          not null,
    estado        tinyint(1)                            not null,
    fechaInicio   date                                  null,
    fechaFinal    date                                  null,
    lugarProyecto text                                  null,
    porcentaje    int                                   null,
    uuidCliente   varchar(100)                          null,
    constraint proyecto_ibfk_1
        foreign key (uuidCliente) references usuario (uuid)
);

create index uuidCliente
    on proyecto (uuidCliente);

