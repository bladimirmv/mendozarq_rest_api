create table proyecto
(
    uuid          varchar(100)                          not null
        primary key,
    creadoEn      timestamp default current_timestamp() not null,
    nombre        varchar(50)                           not null,
    descripcion   varchar(200)                          null,
    categoria     varchar(100)                          not null,
    estado        tinyint(1)                            not null,
    fechaInicio   date                                  null,
    fechaFinal    date                                  null,
    lugarProyecto varchar(200)                          null,
    porcentaje    int                                   null,
    uuidCliente   varchar(100)                          null,
    constraint proyecto_ibfk_1
        foreign key (uuidCliente) references usuario (uuid)
);

create index uuidCliente
    on proyecto (uuidCliente);

INSERT INTO mendozarq.proyecto (uuid, creadoEn, nombre, descripcion, categoria, estado, fechaInicio, fechaFinal, lugarProyecto, porcentaje, uuidCliente) VALUES ('13f3af68-d552-4c54-bde6-816f474dd4ec', '2021-11-27 12:27:32', 'Cencerrillas Engarmarse Abajeño', ' Lorem ipsum dolor sit amet consectetur,
adipisicing elit. Deleniti fugiat ipsum, sequi, quis eaque in nobis ullam voluptate id quia magni tempore pariatur voluptatem? Eos officia ut modi rem
aspernat', 'construccion', 1, '2021-11-27', '2022-12-31', ' Lorem ipsum dolor sit amet consectetur,
adipisicing elit. Deleniti fugiat ipsum, sequi, quis eaque in nobis ullam voluptate id quia magni tempore pariatur voluptatem? Eos officia ut modi rem
aspernat', 0, 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.proyecto (uuid, creadoEn, nombre, descripcion, categoria, estado, fechaInicio, fechaFinal, lugarProyecto, porcentaje, uuidCliente) VALUES ('5f1c430d-cda9-4ee8-aa58-b011c3544567', '2022-02-15 18:35:38', 'dasd', 'dsadsadsadsadsa', 'construccion', 1, '2022-02-17', '2022-02-28', '', 0, 'bf493a64-4573-433f-92b0-edbcae73a98b');
