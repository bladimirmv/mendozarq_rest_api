create table pedidoproducto
(
    uuid            varchar(100)                                                               not null
        primary key,
    creadoEn        timestamp                                      default current_timestamp() not null,
    numeroPedido    int auto_increment,
    nombre          varchar(50)                                                                not null,
    apellidoPaterno varchar(50)                                                                not null,
    apellidoMaterno varchar(50)                                                                null,
    celular         int                                                                        not null,
    direccion       text                                                                       not null,
    correo          varchar(100)                                                               not null,
    nombreFactura   varchar(50)                                                                not null,
    nitCI           text                                                                       not null,
    tipoEnvio       enum ('delivery', 'carpinteria')                                           null,
    descripcion     varchar(500)                                                               not null,
    metodoDePago    enum ('efectivo', 'deposito_transferencia_qr', 'paypal')                   not null,
    total           decimal(15, 2)                                                             not null,
    uuidCliente     varchar(100)                                                               not null,
    estado          enum ('pendiente', 'confirmado', 'completado') default 'pendiente'         not null,
    constraint numeroPedido
        unique (numeroPedido),
    constraint pedidoproducto_ibfk_1
        foreign key (uuidCliente) references usuario (uuid)
);

create index uuidCliente
    on pedidoproducto (uuidCliente);

INSERT INTO mendozarq.pedidoproducto (uuid, creadoEn, numeroPedido, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo, nombreFactura, nitCI, tipoEnvio, descripcion, metodoDePago, total, uuidCliente, estado) VALUES ('4a28b45e-86bb-457b-a93b-05601bf0ca09', '2022-03-16 13:32:39', 1000001, 'bladimir', 'medrano', 'vargas', 69509449, 'Av segunda entre marina nunez del prado y calle greco.', 'bladimilmedranoblod@gmail.com', 'medrano', 'ewq', 'carpinteria', '', 'deposito_transferencia_qr', 1100.00, 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'pendiente');
INSERT INTO mendozarq.pedidoproducto (uuid, creadoEn, numeroPedido, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo, nombreFactura, nitCI, tipoEnvio, descripcion, metodoDePago, total, uuidCliente, estado) VALUES ('50cdf0e8-9855-46d5-befc-0c7772a3984c', '2022-03-16 14:52:36', 1000002, 'bladimir', 'medrano', 'vargas', 69509449, 'Av segunda entre marina nunez del prado y calle greco.', 'bladimilmedranoblod@gmail.com', 'medrano', 'jj', 'carpinteria', '', 'deposito_transferencia_qr', 1100.00, 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'pendiente');
