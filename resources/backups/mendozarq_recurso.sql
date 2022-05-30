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

