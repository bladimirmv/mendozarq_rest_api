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

