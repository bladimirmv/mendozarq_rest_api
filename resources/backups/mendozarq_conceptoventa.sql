create table conceptoventa
(
    uuid           varchar(100)                               not null
        primary key,
    creadoEn       timestamp      default current_timestamp() not null,
    cantidad       int                                        not null,
    precioUnitario decimal(16, 2)                             not null,
    importe        decimal(16, 2)                             not null,
    descuento      decimal(15, 2) default 0.00                not null,
    uuidProducto   varchar(100)                               not null,
    uuidVenta      varchar(100)                               not null,
    constraint conceptoventa_ibfk_1
        foreign key (uuidVenta) references venta (uuid)
            on delete cascade,
    constraint conceptoventa_ibfk_2
        foreign key (uuidProducto) references producto (uuid)
);

create index uuidProducto
    on conceptoventa (uuidProducto);

create index uuidVenta
    on conceptoventa (uuidVenta);

INSERT INTO mendozarq.conceptoventa (uuid, creadoEn, cantidad, precioUnitario, importe, descuento, uuidProducto, uuidVenta) VALUES ('0f47b8ef-b6be-4e08-aa88-bca8072c21dd', '2022-06-29 12:29:55', 1, 1851.00, 1851.00, 0.00, 'a35424cc-fd28-44ac-a604-4c4b2d628f43', '6a88f8b1-aeb2-44b7-ab52-cc0a59e2c9ab');
INSERT INTO mendozarq.conceptoventa (uuid, creadoEn, cantidad, precioUnitario, importe, descuento, uuidProducto, uuidVenta) VALUES ('108c6533-4fc6-474d-92eb-ce3e6c20e343', '2022-06-29 12:28:06', 1, 6000.00, 6000.00, 0.00, '4cc90ad9-5e15-436d-8106-bf3cddd1ab41', '2b518b2e-58df-477b-8249-429da46901ed');
INSERT INTO mendozarq.conceptoventa (uuid, creadoEn, cantidad, precioUnitario, importe, descuento, uuidProducto, uuidVenta) VALUES ('25bc7cef-fb7a-45bf-87bf-ac2b38b5c677', '2022-06-29 12:30:55', 1, 7000.00, 7000.00, 0.00, 'a23de6cb-54a0-475e-acfd-975c36de336e', '1b85459b-d8d9-4c48-ba86-d9e5b5c22e62');
INSERT INTO mendozarq.conceptoventa (uuid, creadoEn, cantidad, precioUnitario, importe, descuento, uuidProducto, uuidVenta) VALUES ('25c105eb-b40f-4400-b6f0-d4daff5f4365', '2022-06-29 12:35:42', 1, 6000.00, 6000.00, 0.00, '4cc90ad9-5e15-436d-8106-bf3cddd1ab41', 'e28fac07-aa33-4b9e-9f7e-5198a8bb8567');
INSERT INTO mendozarq.conceptoventa (uuid, creadoEn, cantidad, precioUnitario, importe, descuento, uuidProducto, uuidVenta) VALUES ('3bd6fb00-1f5d-48f6-92ee-bb8d65899df6', '2022-06-29 12:40:14', 2, 975.00, 1950.00, 0.00, '69ad9459-0273-46a9-a312-e5b7d8952e86', '919635bc-9f01-431e-a7dc-788c19c6647c');
INSERT INTO mendozarq.conceptoventa (uuid, creadoEn, cantidad, precioUnitario, importe, descuento, uuidProducto, uuidVenta) VALUES ('479023ea-b6d1-4dc9-b630-f6cf19881074', '2022-06-29 12:29:55', 1, 1507.00, 1396.99, 7.30, 'ce1c1bf2-d9a1-449d-a02b-9b3f220f1dbb', '6a88f8b1-aeb2-44b7-ab52-cc0a59e2c9ab');
INSERT INTO mendozarq.conceptoventa (uuid, creadoEn, cantidad, precioUnitario, importe, descuento, uuidProducto, uuidVenta) VALUES ('55832c59-3f8c-4ab3-a415-7247949ca5fa', '2022-06-29 12:32:30', 1, 2700.00, 2700.00, 0.00, 'd54e1a74-b861-4ad6-a934-c1f5661997b3', 'b015d58f-2706-4da2-901e-9d856cd461a3');
INSERT INTO mendozarq.conceptoventa (uuid, creadoEn, cantidad, precioUnitario, importe, descuento, uuidProducto, uuidVenta) VALUES ('58a14a82-3d31-4394-8d00-d7e2e73b5e7f', '2022-06-29 12:39:55', 2, 1925.00, 3850.00, 0.00, '410b5731-4c04-4262-a734-b5c03c140569', '6350d397-fdc4-4ea7-b066-3f6d581d33b8');
INSERT INTO mendozarq.conceptoventa (uuid, creadoEn, cantidad, precioUnitario, importe, descuento, uuidProducto, uuidVenta) VALUES ('61c52774-1143-462d-844f-35f1dba37131', '2022-06-29 12:28:06', 1, 7000.00, 7000.00, 0.00, 'dea18ab5-3cd2-4626-bcff-ef4126af7303', '2b518b2e-58df-477b-8249-429da46901ed');
INSERT INTO mendozarq.conceptoventa (uuid, creadoEn, cantidad, precioUnitario, importe, descuento, uuidProducto, uuidVenta) VALUES ('685699da-7dbe-4041-b99b-7d0171a5179e', '2022-06-29 12:28:06', 1, 1253.00, 1253.00, 0.00, '46445a16-b0e9-4200-a080-3cf1cd20cca0', '2b518b2e-58df-477b-8249-429da46901ed');
INSERT INTO mendozarq.conceptoventa (uuid, creadoEn, cantidad, precioUnitario, importe, descuento, uuidProducto, uuidVenta) VALUES ('6d6bee5c-00ec-484e-b0af-51adabe73f52', '2022-06-29 12:30:55', 1, 1507.00, 1396.99, 7.30, 'ce1c1bf2-d9a1-449d-a02b-9b3f220f1dbb', '1b85459b-d8d9-4c48-ba86-d9e5b5c22e62');
INSERT INTO mendozarq.conceptoventa (uuid, creadoEn, cantidad, precioUnitario, importe, descuento, uuidProducto, uuidVenta) VALUES ('75ee2c4a-530c-431d-8e89-44b836f0d927', '2022-06-29 12:39:55', 2, 1851.00, 3702.00, 0.00, 'a35424cc-fd28-44ac-a604-4c4b2d628f43', '6350d397-fdc4-4ea7-b066-3f6d581d33b8');
INSERT INTO mendozarq.conceptoventa (uuid, creadoEn, cantidad, precioUnitario, importe, descuento, uuidProducto, uuidVenta) VALUES ('94c322ea-90a8-4ccd-9ae1-fce76a7be0d7', '2022-06-29 12:35:42', 1, 1400.00, 1400.00, 0.00, '4b9e4a99-2619-4805-ac41-0428dc4bce45', 'e28fac07-aa33-4b9e-9f7e-5198a8bb8567');
INSERT INTO mendozarq.conceptoventa (uuid, creadoEn, cantidad, precioUnitario, importe, descuento, uuidProducto, uuidVenta) VALUES ('9bb4db12-94a2-45dc-96c2-b8275853a010', '2022-06-29 12:28:06', 1, 1507.00, 1396.99, 7.30, 'ce1c1bf2-d9a1-449d-a02b-9b3f220f1dbb', '2b518b2e-58df-477b-8249-429da46901ed');
INSERT INTO mendozarq.conceptoventa (uuid, creadoEn, cantidad, precioUnitario, importe, descuento, uuidProducto, uuidVenta) VALUES ('9fd105cb-b0e7-4e15-abb7-0bc740d4cf90', '2022-06-29 13:22:24', 1, 6000.00, 6000.00, 0.00, '4cc90ad9-5e15-436d-8106-bf3cddd1ab41', 'cd0c3ce0-3634-4895-946e-ef7df6945880');
INSERT INTO mendozarq.conceptoventa (uuid, creadoEn, cantidad, precioUnitario, importe, descuento, uuidProducto, uuidVenta) VALUES ('bedd5d0f-2bd2-4506-9578-215cda111c4f', '2022-06-29 12:38:23', 2, 7000.00, 14000.00, 0.00, 'dea18ab5-3cd2-4626-bcff-ef4126af7303', 'ec0b9bf6-4661-4cbb-8b7b-4a6795678331');
INSERT INTO mendozarq.conceptoventa (uuid, creadoEn, cantidad, precioUnitario, importe, descuento, uuidProducto, uuidVenta) VALUES ('efec92e3-f220-48f4-a831-521f41f6c34e', '2022-06-29 12:30:55', 1, 1682.00, 1682.00, 0.00, 'b30ac8ef-ad14-477e-9f57-0fa0eba5d71d', '1b85459b-d8d9-4c48-ba86-d9e5b5c22e62');
