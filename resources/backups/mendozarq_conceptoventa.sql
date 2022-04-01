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

INSERT INTO mendozarq.conceptoventa (uuid, creadoEn, cantidad, precioUnitario, importe, descuento, uuidProducto, uuidVenta) VALUES ('11d38ecc-4eea-4f49-be74-571da3e3e667', '2022-03-29 14:30:50', 1, 1000.00, 1000.00, 0.00, 'b84f59d3-650e-4cb6-815d-cec6bfc49ac0', '72d9fe3f-30bf-4824-88c7-aeabf501955a');
INSERT INTO mendozarq.conceptoventa (uuid, creadoEn, cantidad, precioUnitario, importe, descuento, uuidProducto, uuidVenta) VALUES ('16681a33-1c63-4cc8-ad76-929d338b627f', '2022-03-29 14:31:42', 1, 100.00, 100.00, 0.00, '7307299d-ec02-4f52-98d0-baf027033698', '43121aeb-3c5c-495f-aaef-901abaf0a187');
INSERT INTO mendozarq.conceptoventa (uuid, creadoEn, cantidad, precioUnitario, importe, descuento, uuidProducto, uuidVenta) VALUES ('23149635-0bd6-4943-9991-123332d00437', '2022-03-28 16:32:10', 1, 200.00, 200.00, 0.00, 'ad8325f8-1f19-4364-8a1f-0d85732d7d71', '3cc11389-8cf3-47f1-a410-11e1d5f28786');
INSERT INTO mendozarq.conceptoventa (uuid, creadoEn, cantidad, precioUnitario, importe, descuento, uuidProducto, uuidVenta) VALUES ('39c349a3-582b-471f-a388-f11559052b7d', '2022-03-29 22:55:01', 3, 700.00, 2037.00, 3.00, '2fe5ff3e-f808-4e6d-916a-d4959bb87227', '79de7552-0d78-4769-a4a6-f9aeb387cdb9');
INSERT INTO mendozarq.conceptoventa (uuid, creadoEn, cantidad, precioUnitario, importe, descuento, uuidProducto, uuidVenta) VALUES ('49fe99f6-9207-4f5c-a598-800f5301d982', '2022-03-30 12:50:53', 1, 150.00, 90.00, 40.00, '7e92e09b-7a2a-44ba-b2c9-21a0bc9b7d63', 'cc4f12ad-e21c-4dda-a569-0317a59f8bc7');
INSERT INTO mendozarq.conceptoventa (uuid, creadoEn, cantidad, precioUnitario, importe, descuento, uuidProducto, uuidVenta) VALUES ('62aafcfa-6647-446e-bc0f-52d58c651ff2', '2022-03-28 16:32:22', 2, 500.00, 950.00, 5.00, 'ec428dc7-a821-4b21-b16b-c9f98f88687c', '9b4fc1b7-5384-4cdf-9666-d8a468bbe447');
INSERT INTO mendozarq.conceptoventa (uuid, creadoEn, cantidad, precioUnitario, importe, descuento, uuidProducto, uuidVenta) VALUES ('8bc11ef8-136c-4acb-915d-7e100305b038', '2022-03-28 15:55:23', 1, 300.00, 300.00, 0.00, 'fa97335b-3efd-499d-9ec2-78c49597a301', '68ffeb5b-40f9-4b98-bea7-701c793707d1');
INSERT INTO mendozarq.conceptoventa (uuid, creadoEn, cantidad, precioUnitario, importe, descuento, uuidProducto, uuidVenta) VALUES ('9405f14e-1a8d-419c-b932-54c2b4b37e94', '2022-03-28 16:30:48', 1, 100.00, 100.00, 0.00, '7307299d-ec02-4f52-98d0-baf027033698', 'f5146dff-9e4c-41e3-8088-0d9e51d11216');
INSERT INTO mendozarq.conceptoventa (uuid, creadoEn, cantidad, precioUnitario, importe, descuento, uuidProducto, uuidVenta) VALUES ('94e3d057-a76a-4582-803e-ed59bd397200', '2022-03-30 12:50:20', 1, 700.00, 700.00, 0.00, '5e916855-3d48-46b5-b2ab-47cffea85be7', '29c54bef-6ab0-436d-becf-6ce650767285');
INSERT INTO mendozarq.conceptoventa (uuid, creadoEn, cantidad, precioUnitario, importe, descuento, uuidProducto, uuidVenta) VALUES ('c3b7759d-97dd-4aa7-86f5-122ecdd0a303', '2022-03-28 16:32:10', 5, 700.00, 3395.00, 3.00, '2fe5ff3e-f808-4e6d-916a-d4959bb87227', '3cc11389-8cf3-47f1-a410-11e1d5f28786');
INSERT INTO mendozarq.conceptoventa (uuid, creadoEn, cantidad, precioUnitario, importe, descuento, uuidProducto, uuidVenta) VALUES ('d3ceda5f-2e7d-48c1-b98e-bd452df8ccf0', '2022-03-28 15:55:23', 1, 500.00, 475.00, 5.00, 'ec428dc7-a821-4b21-b16b-c9f98f88687c', '68ffeb5b-40f9-4b98-bea7-701c793707d1');
INSERT INTO mendozarq.conceptoventa (uuid, creadoEn, cantidad, precioUnitario, importe, descuento, uuidProducto, uuidVenta) VALUES ('dd3d3b4d-4d30-401c-a94d-e60969bc715c', '2022-03-28 16:30:48', 1, 1000.00, 1000.00, 0.00, 'b84f59d3-650e-4cb6-815d-cec6bfc49ac0', 'f5146dff-9e4c-41e3-8088-0d9e51d11216');
