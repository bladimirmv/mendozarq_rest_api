create table recurso
(
    uuid           varchar(100)                                                                               not null
        primary key,
    creadoEn       timestamp                                                      default current_timestamp() not null,
    nombre         varchar(100)                                                                               not null,
    descripcion    varchar(200)                                                                               null,
    tipoRecurso    enum ('materia_prima', 'maquinas', 'material_de_construccion') default 'materia_prima'     null,
    area           enum ('mendozarq', 'liraki', 'mendoraki')                      default 'mendozarq'         null,
    precioUnitario decimal(15, 2)                                                 default 0.00                null,
    precioPorMayor decimal(15, 2)                                                 default 0.00                null
);

INSERT INTO mendozarq.recurso (uuid, creadoEn, nombre, descripcion, tipoRecurso, area, precioUnitario, precioPorMayor) VALUES ('ede21838-08d6-437a-b361-461b19613e20', '2022-04-01 13:23:48', 'nuevo recurso ', 'ggggddddddddddddddddddddddddddddddddddd', 'materia_prima', 'liraki', 12.00, 15.00);
