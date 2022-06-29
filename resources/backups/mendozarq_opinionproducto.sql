create table opinionproducto
(
    uuid         varchar(100)                           not null
        primary key,
    creadoEn     timestamp  default current_timestamp() not null,
    titulo       varchar(300)                           not null,
    descripcion  varchar(1000)                          not null,
    estado       tinyint(1) default 0                   not null,
    verificado   tinyint(1) default 0                   not null,
    puntuacion   int                                    not null,
    uuidProducto varchar(100)                           not null,
    uuidCliente  varchar(100)                           not null,
    constraint opinionproducto_ibfk_1
        foreign key (uuidProducto) references producto (uuid),
    constraint opinionproducto_ibfk_2
        foreign key (uuidCliente) references usuario (uuid)
);

create index uuidCliente
    on opinionproducto (uuidCliente);

create index uuidProducto
    on opinionproducto (uuidProducto);

INSERT INTO mendozarq.opinionproducto (uuid, creadoEn, titulo, descripcion, estado, verificado, puntuacion, uuidProducto, uuidCliente) VALUES ('49b3d179-d292-40f8-8cb6-2e23da41ff6a', '2022-06-29 12:53:42', 'Precio un poco caro pero aceptable', 'Realice el pedido de este producto, por la calidad de la madera aunque deverian hacer alguna descuento. ', 1, 0, 4, '4cc90ad9-5e15-436d-8106-bf3cddd1ab41', '0976bfba-6a2a-4405-8bfe-2474a21f1e25');
INSERT INTO mendozarq.opinionproducto (uuid, creadoEn, titulo, descripcion, estado, verificado, puntuacion, uuidProducto, uuidCliente) VALUES ('60946576-4367-4009-b328-c77653ef2880', '2022-06-29 12:49:00', 'Retrazo del envio de 1 dia', 'El producto me llego con las mejores condiciones, pero el envio se retrazo con 1 dia mas de espera.', 1, 1, 3, '4cc90ad9-5e15-436d-8106-bf3cddd1ab41', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.opinionproducto (uuid, creadoEn, titulo, descripcion, estado, verificado, puntuacion, uuidProducto, uuidCliente) VALUES ('7e06c84d-f251-4457-9ebc-c45c47c1d044', '2022-06-29 12:43:14', 'Buena calidad de construcción ', 'El precio no se veía tan bueno, pero cuando me llego el producto note que valia cada peso que pague', 1, 1, 5, '46445a16-b0e9-4200-a080-3cf1cd20cca0', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.opinionproducto (uuid, creadoEn, titulo, descripcion, estado, verificado, puntuacion, uuidProducto, uuidCliente) VALUES ('cf578cc9-dd52-467f-a2cb-e8c39ff2504b', '2022-06-29 13:24:26', 'Excelente calidad', 'Talvez el precio no este elevado pero la calidad de la cama es de la mejor totalmente recomendable', 1, 1, 5, '4cc90ad9-5e15-436d-8106-bf3cddd1ab41', '2319b069-bde2-452c-af94-ec08f68c722c');
