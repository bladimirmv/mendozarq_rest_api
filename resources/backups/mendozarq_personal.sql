create table personal
(
    uuid            varchar(100)                          not null
        primary key,
    creadoEn        timestamp default current_timestamp() not null,
    nombre          varchar(50)                           not null,
    apellidoPaterno varchar(50)                           not null,
    apellidoMaterno varchar(50)                           null,
    celular         int                                   null,
    direccion       text                                  null,
    correo          varchar(100)                          null,
    descripcion     varchar(200)                          null,
    sueldo          decimal(15, 2)                        null,
    moneda          varchar(10)                           null,
    activo          tinyint(1)                            not null
);

INSERT INTO mendozarq.personal (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo, descripcion, sueldo, moneda, activo) VALUES ('0cdca13f-175a-4ed0-8320-650f65bf9167', '2021-10-07 21:21:17', 'juan', 'perez', 'mendez', 7762509, 'avenida aroma entre calle nose y avenida alguna ', 'suarez@gmail.com', 'personal de construccion', 2500.00, 'bs', 1);
INSERT INTO mendozarq.personal (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo, descripcion, sueldo, moneda, activo) VALUES ('122573dc-a098-45f7-8509-c54acf58e9c3', '2022-06-23 15:26:37', 'mario', 'mendez', 'mercado', 76393092, '', 'mariogg@gmail.com', 'personal de construccion', 0.00, 'bs', 1);
INSERT INTO mendozarq.personal (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo, descripcion, sueldo, moneda, activo) VALUES ('471c2837-6d59-43c2-ac1e-81a56f7a3d03', '2022-06-23 15:30:18', 'henry', 'andia', 'perez', 73532763, 'avenida tadeo h. y avenida segunda', 'henry.andia.p@gmail.com', 'personal de construccion', 0.00, 'bs', 1);
INSERT INTO mendozarq.personal (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo, descripcion, sueldo, moneda, activo) VALUES ('6739cd0f-9e3e-4eb2-9c22-e2a60be68401', '2022-03-30 23:30:25', 'alvaro', 'mendez', 'castro', 7324341, '', 'mendez@gmail.com', 'personal de contruccion', 0.00, 'bs', 1);
INSERT INTO mendozarq.personal (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo, descripcion, sueldo, moneda, activo) VALUES ('a2f0a1c4-06d9-4459-9283-49cf3460f9e1', '2022-06-23 15:28:18', 'javier ', 'huanca ', 'mamani', 68390943, 'avenida calama y antezana #234', 'huanca.mamani@gmail.com', 'personde de construccion', 0.00, 'bs', 1);
