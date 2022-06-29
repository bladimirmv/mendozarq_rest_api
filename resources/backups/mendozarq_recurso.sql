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

INSERT INTO mendozarq.recurso (uuid, creadoEn, nombre, descripcion, tipoRecurso, area, precioUnitario, precioPorMayor) VALUES ('1418f895-97f6-4fa9-aff3-3d5a7e14d822', '2022-06-28 22:10:17', 'Fierro de 1/2', '', 'material_de_construccion', 'mendozarq', 120.00, 100.00);
INSERT INTO mendozarq.recurso (uuid, creadoEn, nombre, descripcion, tipoRecurso, area, precioUnitario, precioPorMayor) VALUES ('1d1ddbb2-5410-4866-860b-d358e477fbf4', '2022-06-28 21:40:32', 'Madera maramacho', '', 'materia_prima', 'liraki', 100.00, 50.00);
INSERT INTO mendozarq.recurso (uuid, creadoEn, nombre, descripcion, tipoRecurso, area, precioUnitario, precioPorMayor) VALUES ('93ad39ff-dfd4-4bc2-a498-ffa17f5c8562', '2022-06-28 22:11:27', 'Madera blanca (comun)', '', 'materia_prima', 'mendoraki', 40.00, 20.00);
INSERT INTO mendozarq.recurso (uuid, creadoEn, nombre, descripcion, tipoRecurso, area, precioUnitario, precioPorMayor) VALUES ('cb1c84f8-53c1-4004-b9b9-9f0377b2a29c', '2022-06-28 22:09:20', 'Cemento camba', '', 'material_de_construccion', 'mendozarq', 70.00, 50.00);
INSERT INTO mendozarq.recurso (uuid, creadoEn, nombre, descripcion, tipoRecurso, area, precioUnitario, precioPorMayor) VALUES ('daefbd72-4d1b-4b07-9263-0651ff56d389', '2022-06-28 22:08:40', 'Madera Roble', '', 'materia_prima', 'mendozarq', 300.00, 200.00);
