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

INSERT INTO mendozarq.proyecto (uuid, creadoEn, nombre, descripcion, categoria, estado, fechaInicio, fechaFinal, lugarProyecto, porcentaje, uuidCliente) VALUES ('7eee2e9f-3c07-4b59-bf8a-366e4c81720e', '2022-06-28 22:26:00', 'Edificio Cabral', 'Centro de atencion al cliente de la empresa cabral', 'construccion', 1, '2022-11-25', '2023-03-15', 'Calle San juan de dios y avenida octava', 0, '942246e6-f202-47f9-9db6-c067a33707eb');
INSERT INTO mendozarq.proyecto (uuid, creadoEn, nombre, descripcion, categoria, estado, fechaInicio, fechaFinal, lugarProyecto, porcentaje, uuidCliente) VALUES ('92914a40-8a91-495b-9b6a-b46c491c317e', '2022-06-28 22:23:14', 'Lomas del sur tower', 'Edificio central de la empresa importadora lomas del sur.', 'construccion', 1, '2022-06-29', '2022-12-31', 'Avenida Blanco Galindo y Segunda', 13, 'bf493a64-4573-433f-92b0-edbcae73a98b');
