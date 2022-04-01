create table pedidoproducto
(
    uuid            varchar(100)                                                                                   not null
        primary key,
    creadoEn        timestamp                                                          default current_timestamp() not null,
    numeroPedido    int auto_increment,
    nombre          varchar(50)                                                                                    not null,
    apellidoPaterno varchar(50)                                                                                    not null,
    apellidoMaterno varchar(50)                                                                                    null,
    celular         int                                                                                            not null,
    direccion       text                                                                                           not null,
    correo          varchar(100)                                                                                   not null,
    nombreFactura   varchar(50)                                                                                    not null,
    nitCI           text                                                                                           not null,
    tipoEnvio       enum ('delivery', 'carpinteria')                                                               null,
    descripcion     varchar(500)                                                                                   not null,
    metodoDePago    enum ('efectivo', 'deposito_transferencia_qr', 'paypal')                                       not null,
    total           decimal(15, 2)                                                                                 not null,
    uuidCliente     varchar(100)                                                                                   not null,
    estado          enum ('pagando', 'pendiente', 'confirmado', 'envio', 'completado') default 'pendiente'         not null,
    constraint numeroPedido
        unique (numeroPedido),
    constraint pedidoproducto_ibfk_1
        foreign key (uuidCliente) references usuario (uuid)
);

create index uuidCliente
    on pedidoproducto (uuidCliente);

INSERT INTO mendozarq.pedidoproducto (uuid, creadoEn, numeroPedido, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo, nombreFactura, nitCI, tipoEnvio, descripcion, metodoDePago, total, uuidCliente, estado) VALUES ('26e59816-f126-47e6-ac2d-4a5abe607538', '2022-03-24 21:14:50', 1000024, 'bladimir', 'medrano', 'vargas', 69509449, 'Av segunda entre marina nunez del prado y calle greco.', 'bladimilmedranoblod@gmail.com', 'medrano', '123312312', 'carpinteria', '', 'paypal', 6300.00, 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'pendiente');
