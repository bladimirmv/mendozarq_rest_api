create table carritopedido
(
    uuid         varchar(100)                               not null
        primary key,
    creadoEn     timestamp      default current_timestamp() not null,
    cantidad     int            default 1                   not null,
    uuidProducto varchar(100)                               not null,
    uuidPedido   varchar(100)                               not null,
    precio       decimal(15, 2)                             not null,
    descuento    decimal(15, 2) default 0.00                not null,
    nombre       varchar(300)                               not null,
    descripcion  varchar(1000)                              null,
    constraint carritopedido_ibfk_1
        foreign key (uuidProducto) references producto (uuid),
    constraint carritopedido_ibfk_2
        foreign key (uuidPedido) references pedidoproducto (uuid)
            on delete cascade
);

create index uuidPedido
    on carritopedido (uuidPedido);

create index uuidProducto
    on carritopedido (uuidProducto);

INSERT INTO mendozarq.carritopedido (uuid, creadoEn, cantidad, uuidProducto, uuidPedido, precio, descuento, nombre, descripcion) VALUES ('33084c0e-8246-4cbd-962e-84423dd44d16', '2022-03-24 21:14:50', 1, 'fa97335b-3efd-499d-9ec2-78c49597a301', '26e59816-f126-47e6-ac2d-4a5abe607538', 300.00, 0.00, 'Escaleras para exterior con disenho minimalista de madera de pino', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Explicabo beatae quisquam, optio eligendi atque dicta minima labore dolor odio? Ex quos vel aliquid possimus officia obcaecati harum repellat autem quo!');
INSERT INTO mendozarq.carritopedido (uuid, creadoEn, cantidad, uuidProducto, uuidPedido, precio, descuento, nombre, descripcion) VALUES ('b42fc84e-48fd-4bfc-a482-5afb4fbdbc2b', '2022-03-24 21:14:50', 1, '890d6295-ad7a-481f-acf0-c608c5e7a9df', '26e59816-f126-47e6-ac2d-4a5abe607538', 5000.00, 0.00, 'Escaleras de madera de abeto para interior', 'Abada Gen Increpar Incorporal Abadejo Bastonada Engastador Abajadero Abacorar. Geminar Generador Abajo Abacorar Batán Ficticio Cendal Ficha. Cendrazo Cenata Gemoterapia Incrédulo. Engarrafador Batallador Abajeño Incrédulo Abajo Engarrar Cenata Generador. Engarberar Descepar Incorporal Incordio Gemoso Incredibilidad Fichar Fice Ceneque Gemiquear.');
INSERT INTO mendozarq.carritopedido (uuid, creadoEn, cantidad, uuidProducto, uuidPedido, precio, descuento, nombre, descripcion) VALUES ('df3f9949-6fa9-4e10-8700-4690cab32048', '2022-03-24 21:14:50', 1, 'b84f59d3-650e-4cb6-815d-cec6bfc49ac0', '26e59816-f126-47e6-ac2d-4a5abe607538', 1000.00, 0.00, 'Escaleras minimalistas para interior de Abeto', '');
