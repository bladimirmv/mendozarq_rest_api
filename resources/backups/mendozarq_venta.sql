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

INSERT INTO mendozarq.venta (uuid, creadoEn, numeroVenta, nombreFactura, nitCiCex, departamento, direccion, descripcion, tipoVenta, tipoEnvio, metodoDePago, estado, total, uuidCliente, uuidVendedor) VALUES ('1b85459b-d8d9-4c48-ba86-d9e5b5c22e62', '2022-06-29 12:30:55', 1000005, 'sáenz ribes', '4322233', 'cbba', '4988 Mondragón Rincón
    ', '', 'fisica', 'personal', 'efectivo', 'para_recoger', 10078.99, '81ed9811-5b7a-4316-8e9d-7081df740265', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72');
INSERT INTO mendozarq.venta (uuid, creadoEn, numeroVenta, nombreFactura, nitCiCex, departamento, direccion, descripcion, tipoVenta, tipoEnvio, metodoDePago, estado, total, uuidCliente, uuidVendedor) VALUES ('2b518b2e-58df-477b-8249-429da46901ed', '2022-06-29 12:28:06', 1000003, 'cabrero castillo', '876663', 'cbba', '81863 Pelayo Parque ', 'La puerta de la casa es de color verde y se ubicada a lado de la parada de micros 12', 'online', 'delivery', 'efectivo', 'completado', 15649.99, 'bf493a64-4573-433f-92b0-edbcae73a98b', null);
INSERT INTO mendozarq.venta (uuid, creadoEn, numeroVenta, nombreFactura, nitCiCex, departamento, direccion, descripcion, tipoVenta, tipoEnvio, metodoDePago, estado, total, uuidCliente, uuidVendedor) VALUES ('6350d397-fdc4-4ea7-b066-3f6d581d33b8', '2022-06-29 12:39:39', 1000010, 'ruano ', '5347567', 'cbba', '4265 Korta hernandez Vía Pública
    ', '', 'fisica', 'delivery', 'efectivo', 'confirmado', 7552.00, '178e1faa-b3f0-4900-a7b5-a19085c0cf9c', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72');
INSERT INTO mendozarq.venta (uuid, creadoEn, numeroVenta, nombreFactura, nitCiCex, departamento, direccion, descripcion, tipoVenta, tipoEnvio, metodoDePago, estado, total, uuidCliente, uuidVendedor) VALUES ('6a88f8b1-aeb2-44b7-ab52-cc0a59e2c9ab', '2022-06-29 12:29:55', 1000004, 'pintor benavides', '98667', 'cbba', '1953 Axel Huerta
    ', '', 'fisica', 'personal', 'efectivo', 'completado', 3247.99, 'a5b86b62-0ef8-4d23-a2f8-a242daa25103', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72');
INSERT INTO mendozarq.venta (uuid, creadoEn, numeroVenta, nombreFactura, nitCiCex, departamento, direccion, descripcion, tipoVenta, tipoEnvio, metodoDePago, estado, total, uuidCliente, uuidVendedor) VALUES ('919635bc-9f01-431e-a7dc-788c19c6647c', '2022-06-29 12:39:05', 1000009, 'sobrino suárez', '3462345', 'cbba', '77864 Enrique Colonia', '', 'fisica', 'delivery', 'efectivo', 'confirmado', 1950.00, 'ce754db3-3b9c-4dd5-81f1-ae2b5f5a060a', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72');
INSERT INTO mendozarq.venta (uuid, creadoEn, numeroVenta, nombreFactura, nitCiCex, departamento, direccion, descripcion, tipoVenta, tipoEnvio, metodoDePago, estado, total, uuidCliente, uuidVendedor) VALUES ('b015d58f-2706-4da2-901e-9d856cd461a3', '2022-06-29 12:32:30', 1000006, 'cabrero castillo', '5344566', 'cbba', '81863 Pelayo Parque sdsadasdas', '', 'online', 'delivery', 'deposito_transferencia_qr', 'confirmado', 2700.00, 'bf493a64-4573-433f-92b0-edbcae73a98b', null);
INSERT INTO mendozarq.venta (uuid, creadoEn, numeroVenta, nombreFactura, nitCiCex, departamento, direccion, descripcion, tipoVenta, tipoEnvio, metodoDePago, estado, total, uuidCliente, uuidVendedor) VALUES ('cd0c3ce0-3634-4895-946e-ef7df6945880', '2022-06-29 13:22:24', 1000011, 'villa jordán', '4325645', 'cbba', '817 Tamayo Grupo
    ', '', 'online', 'personal', 'deposito_transferencia_qr', 'completado', 6000.00, '2319b069-bde2-452c-af94-ec08f68c722c', null);
INSERT INTO mendozarq.venta (uuid, creadoEn, numeroVenta, nombreFactura, nitCiCex, departamento, direccion, descripcion, tipoVenta, tipoEnvio, metodoDePago, estado, total, uuidCliente, uuidVendedor) VALUES ('e28fac07-aa33-4b9e-9f7e-5198a8bb8567', '2022-06-29 12:35:42', 1000007, 'del gelabert', '4523256', 'cbba', '3896 Gil Ferrocarril
    ', '', 'online', 'delivery', 'paypal', 'pendiente', 7400.00, '0976bfba-6a2a-4405-8bfe-2474a21f1e25', null);
INSERT INTO mendozarq.venta (uuid, creadoEn, numeroVenta, nombreFactura, nitCiCex, departamento, direccion, descripcion, tipoVenta, tipoEnvio, metodoDePago, estado, total, uuidCliente, uuidVendedor) VALUES ('ec0b9bf6-4661-4cbb-8b7b-4a6795678331', '2022-06-29 12:38:23', 1000008, 'cerdán benavides', '2334567', 'cbba', '45267 Roldán Subida
    ', '', 'fisica', 'personal', 'efectivo', 'completado', 14000.00, '942246e6-f202-47f9-9db6-c067a33707eb', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72');
