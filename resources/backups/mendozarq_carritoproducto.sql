create table carritoproducto
(
    uuid         varchar(100)                          not null
        primary key,
    creadoEn     timestamp default current_timestamp() not null,
    cantidad     int       default 1                   not null,
    uuidProducto varchar(100)                          not null,
    uuidCliente  varchar(100)                          not null,
    constraint carritoproducto_ibfk_1
        foreign key (uuidProducto) references producto (uuid),
    constraint carritoproducto_ibfk_2
        foreign key (uuidCliente) references usuario (uuid)
);

create index uuidCliente
    on carritoproducto (uuidCliente);

create index uuidProducto
    on carritoproducto (uuidProducto);

INSERT INTO mendozarq.carritoproducto (uuid, creadoEn, cantidad, uuidProducto, uuidCliente) VALUES ('b66e6474-8788-4bcc-8132-f15079f2487f', '2022-03-30 14:44:38', 5, 'fa97335b-3efd-499d-9ec2-78c49597a301', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72');
