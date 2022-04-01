create table venta
(
    uuid          varchar(100)                                                                                                      not null
        primary key,
    creadoEn      timestamp                                                                             default current_timestamp() not null,
    numeroVenta   int auto_increment,
    nombreFactura varchar(50)                                                                                                       not null,
    nitCiCex      varchar(100)                                                                                                      not null,
    departamento  enum ('cbba', 'lp', 'scz')                                                            default 'cbba'              not null,
    direccion     varchar(500)                                                                                                      not null,
    descripcion   varchar(500)                                                                                                      not null,
    tipoVenta     enum ('fisica', 'online')                                                                                         not null,
    tipoEnvio     enum ('delivery', 'personal')                                                                                     not null,
    metodoDePago  enum ('efectivo', 'deposito_transferencia_qr', 'paypal', 'tarjeta')                                               not null,
    estado        enum ('pagando', 'pendiente', 'confirmado', 'en_envio', 'para_recoger', 'completado') default 'pendiente'         not null,
    total         decimal(16, 2)                                                                                                    null,
    uuidCliente   varchar(100)                                                                                                      not null,
    uuidVendedor  varchar(100)                                                                                                      null,
    constraint numeroVenta
        unique (numeroVenta),
    constraint venta_ibfk_1
        foreign key (uuidCliente) references usuario (uuid),
    constraint venta_ibfk_2
        foreign key (uuidVendedor) references usuario (uuid)
);

create index uuidCliente
    on venta (uuidCliente);

create index uuidVendedor
    on venta (uuidVendedor);

INSERT INTO mendozarq.venta (uuid, creadoEn, numeroVenta, nombreFactura, nitCiCex, departamento, direccion, descripcion, tipoVenta, tipoEnvio, metodoDePago, estado, total, uuidCliente, uuidVendedor) VALUES ('29c54bef-6ab0-436d-becf-6ce650767285', '2022-03-30 12:45:41', 1000027, 'cabrero castillo', 'DSSA', 'cbba', '81863 Pelayo Parque
 sdsadasdas', '', 'online', 'personal', 'deposito_transferencia_qr', 'completado', 700.00, 'bf493a64-4573-433f-92b0-edbcae73a98b', null);
INSERT INTO mendozarq.venta (uuid, creadoEn, numeroVenta, nombreFactura, nitCiCex, departamento, direccion, descripcion, tipoVenta, tipoEnvio, metodoDePago, estado, total, uuidCliente, uuidVendedor) VALUES ('3cc11389-8cf3-47f1-a410-11e1d5f28786', '2022-03-28 16:31:54', 1000014, 'cerdán benavides', '76574356546', 'cbba', '45267 Roldán Subida
', '', 'fisica', 'delivery', 'efectivo', 'en_envio', 3595.00, '942246e6-f202-47f9-9db6-c067a33707eb', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72');
INSERT INTO mendozarq.venta (uuid, creadoEn, numeroVenta, nombreFactura, nitCiCex, departamento, direccion, descripcion, tipoVenta, tipoEnvio, metodoDePago, estado, total, uuidCliente, uuidVendedor) VALUES ('43121aeb-3c5c-495f-aaef-901abaf0a187', '2022-03-28 16:31:25', 1000013, 'sobrino suárez', '675436546', 'cbba', '77864 Enrique Colonia', '', 'fisica', 'personal', 'efectivo', 'para_recoger', 100.00, 'ce754db3-3b9c-4dd5-81f1-ae2b5f5a060a', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72');
INSERT INTO mendozarq.venta (uuid, creadoEn, numeroVenta, nombreFactura, nitCiCex, departamento, direccion, descripcion, tipoVenta, tipoEnvio, metodoDePago, estado, total, uuidCliente, uuidVendedor) VALUES ('68ffeb5b-40f9-4b98-bea7-701c793707d1', '2022-03-28 15:38:55', 1000010, 'cabrero castillo', '342423421', 'cbba', '81863 Pelayo Parque
 sdsadasdas', '', 'fisica', 'delivery', 'efectivo', 'completado', 775.00, 'bf493a64-4573-433f-92b0-edbcae73a98b', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72');
INSERT INTO mendozarq.venta (uuid, creadoEn, numeroVenta, nombreFactura, nitCiCex, departamento, direccion, descripcion, tipoVenta, tipoEnvio, metodoDePago, estado, total, uuidCliente, uuidVendedor) VALUES ('72d9fe3f-30bf-4824-88c7-aeabf501955a', '2022-03-28 17:28:45', 1000023, 'cabrero castillo', '12334245234', 'cbba', '81863 Pelayo Parque
 sdsadasdas', '', 'fisica', 'personal', 'efectivo', 'completado', 1000.00, 'bf493a64-4573-433f-92b0-edbcae73a98b', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72');
INSERT INTO mendozarq.venta (uuid, creadoEn, numeroVenta, nombreFactura, nitCiCex, departamento, direccion, descripcion, tipoVenta, tipoEnvio, metodoDePago, estado, total, uuidCliente, uuidVendedor) VALUES ('79de7552-0d78-4769-a4a6-f9aeb387cdb9', '2022-03-29 22:49:28', 1000025, 'cabrero castillo', 'dsadsadasdsa', 'cbba', '81863 Pelayo Parque
 sdsadasdas', '', 'online', 'personal', 'efectivo', 'completado', 2037.00, 'bf493a64-4573-433f-92b0-edbcae73a98b', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72');
INSERT INTO mendozarq.venta (uuid, creadoEn, numeroVenta, nombreFactura, nitCiCex, departamento, direccion, descripcion, tipoVenta, tipoEnvio, metodoDePago, estado, total, uuidCliente, uuidVendedor) VALUES ('9b4fc1b7-5384-4cdf-9666-d8a468bbe447', '2022-03-28 16:31:11', 1000012, 'acedo morillo', '23453325353', 'cbba', '2311 Rosado Pasaje
', '', 'fisica', 'delivery', 'efectivo', 'completado', 950.00, '7a617f2c-0ca0-49be-a3f0-e77555174af0', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72');
INSERT INTO mendozarq.venta (uuid, creadoEn, numeroVenta, nombreFactura, nitCiCex, departamento, direccion, descripcion, tipoVenta, tipoEnvio, metodoDePago, estado, total, uuidCliente, uuidVendedor) VALUES ('cc4f12ad-e21c-4dda-a569-0317a59f8bc7', '2022-03-29 22:49:11', 1000024, 'falcón larrañaga', 'dassadad', 'cbba', '1757 Juárez Senda
', '', 'fisica', 'personal', 'tarjeta', 'confirmado', 90.00, '7ec2091c-abf2-4025-a207-3bbf04a5a8b9', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72');
INSERT INTO mendozarq.venta (uuid, creadoEn, numeroVenta, nombreFactura, nitCiCex, departamento, direccion, descripcion, tipoVenta, tipoEnvio, metodoDePago, estado, total, uuidCliente, uuidVendedor) VALUES ('f5146dff-9e4c-41e3-8088-0d9e51d11216', '2022-03-28 16:30:48', 1000011, 'falcón larrañaga', '23542366', 'cbba', '1757 Juárez Senda
', '', 'fisica', 'personal', 'efectivo', 'completado', 1100.00, '7ec2091c-abf2-4025-a207-3bbf04a5a8b9', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72');
