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

INSERT INTO mendozarq.carpetaproyecto (uuid, creadoEn, nombre, fechaCreacion, uuidProyecto) VALUES ('0408c8b7-568e-4b41-8d32-1494526794e6', '2022-02-17 15:02:57', 'fsdfsd', '2022-02-17', '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.carpetaproyecto (uuid, creadoEn, nombre, fechaCreacion, uuidProyecto) VALUES ('4ac34ea3-a85a-49ba-a5e9-9c959e29dbd8', '2021-12-20 12:47:52', 'gghh', '2021-12-20', '13f3af68-d552-4c54-bde6-816f474dd4ec');
