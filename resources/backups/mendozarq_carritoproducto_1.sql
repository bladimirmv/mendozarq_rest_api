create table carritoproducto
(
    uuid         varchar(100)                          not null
        primary key,
    creadoEn     timestamp default current_timestamp() not null,
    cantidad     int       default 1                   not null,
    uuidProducto varchar(100)                          not null,
    uuidCliente  varchar(100)                          not null,
    constraint uuidProducto
        unique (uuidProducto),
    constraint carritoproducto_ibfk_1
        foreign key (uuidProducto) references producto (uuid),
    constraint carritoproducto_ibfk_2
        foreign key (uuidCliente) references usuario (uuid)
);

create index uuidCliente
    on carritoproducto (uuidCliente);

INSERT INTO mendozarq.carritoproducto (uuid, creadoEn, cantidad, uuidProducto, uuidCliente) VALUES ('26731469-a6bc-44e1-9f29-4efe1175641d', '2022-03-28 13:21:20', 1, '5e916855-3d48-46b5-b2ab-47cffea85be7', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.carritoproducto (uuid, creadoEn, cantidad, uuidProducto, uuidCliente) VALUES ('58fa069f-f05a-46a3-b891-2abb6cca63aa', '2022-03-24 21:18:52', 4, 'fa97335b-3efd-499d-9ec2-78c49597a301', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72');
