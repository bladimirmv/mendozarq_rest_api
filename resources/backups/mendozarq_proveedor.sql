create table proveedor
(
    uuid        varchar(100)                          not null
        primary key,
    creadoEn    timestamp default current_timestamp() not null,
    nombre      varchar(100)                          not null,
    celular     int                                   null,
    direccion   varchar(200)                          null,
    descripcion varchar(200)                          null,
    uuidRecurso varchar(100)                          null,
    constraint proveedor_ibfk_1
        foreign key (uuidRecurso) references recurso (uuid)
);

create index uuidRecurso
    on proveedor (uuidRecurso);

INSERT INTO mendozarq.proveedor (uuid, creadoEn, nombre, celular, direccion, descripcion, uuidRecurso) VALUES ('5a1f17ec-2407-4425-b0db-de8da589429f', '2022-06-28 22:18:20', 'Importadora S.W.E', 44889218, 'Avenida blanco galindo N#634', '', 'cb1c84f8-53c1-4004-b9b9-9f0377b2a29c');
INSERT INTO mendozarq.proveedor (uuid, creadoEn, nombre, celular, direccion, descripcion, uuidRecurso) VALUES ('91df8f28-07dd-4c91-8ae4-3571ecf63901', '2022-06-28 22:14:15', 'Campero', 69840333, 'Avenida blanco galindo Nº 455', '', '1418f895-97f6-4fa9-aff3-3d5a7e14d822');
INSERT INTO mendozarq.proveedor (uuid, creadoEn, nombre, celular, direccion, descripcion, uuidRecurso) VALUES ('d0ac2233-7e26-4874-9453-74e7325fa88c', '2022-06-28 22:16:23', 'Aserradero la bolivianita', 69823923, 'Avenida segunda entre calle G. acha y M. Ramirez', '', '93ad39ff-dfd4-4bc2-a498-ffa17f5c8562');
