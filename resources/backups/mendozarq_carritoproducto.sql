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

INSERT INTO mendozarq.carritoproducto (uuid, creadoEn, cantidad, uuidProducto, uuidCliente) VALUES ('7460efc6-a798-4e57-8832-479c7937d6fe', '2022-03-16 13:22:13', 1, '7380f463-deb1-40ce-9f4f-7f5a959b6e32', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72');
INSERT INTO mendozarq.carritoproducto (uuid, creadoEn, cantidad, uuidProducto, uuidCliente) VALUES ('eaa2b3c2-d6fc-474a-baf8-e388fbf108c3', '2022-03-16 13:22:23', 1, '5e916855-3d48-46b5-b2ab-47cffea85be7', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72');
