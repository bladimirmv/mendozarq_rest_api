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

INSERT INTO mendozarq.proveedor (uuid, creadoEn, nombre, celular, direccion, descripcion, uuidRecurso) VALUES ('1c02ee0e-268f-4a4c-8234-1cd9165412d5', '2022-04-01 21:50:06', 'rewrwer', 32432423, '', 'rwerwe', 'ede21838-08d6-437a-b361-461b19613e20');
INSERT INTO mendozarq.proveedor (uuid, creadoEn, nombre, celular, direccion, descripcion, uuidRecurso) VALUES ('a6d7db3a-425f-42d4-8856-71a83eff9ed2', '2022-04-05 00:25:47', 'dsadsad', 34324324, 'dfasd', 'asdsadas', null);
INSERT INTO mendozarq.proveedor (uuid, creadoEn, nombre, celular, direccion, descripcion, uuidRecurso) VALUES ('f036600f-dd07-4fdd-88e2-bc4e6fa4c019', '2022-04-01 22:01:20', 'dasdsa', 4355344, 'fsdfsd', '', 'ede21838-08d6-437a-b361-461b19613e20');
