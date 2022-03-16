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

INSERT INTO mendozarq.opinionproducto (uuid, creadoEn, titulo, descripcion, estado, verificado, puntuacion, uuidProducto, uuidCliente) VALUES ('4f9de555-30b8-437a-8371-986a32f39915', '2022-01-05 16:58:18', 'Demasidado car!', 'Ayer compre este producto y resulta que en la chancha esta a mitad de precio, no lo compren es una estafa xd.', 0, 0, 5, '7d9ca4bb-b259-4ce2-b069-4893f074b597', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72');
INSERT INTO mendozarq.opinionproducto (uuid, creadoEn, titulo, descripcion, estado, verificado, puntuacion, uuidProducto, uuidCliente) VALUES ('74042bcf-0a6e-43d2-83b1-c57a1388d688', '2022-01-05 16:59:20', 'dasd', 'dasdasdasdsadsadsadsad', 0, 0, 1, '7d9ca4bb-b259-4ce2-b069-4893f074b597', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72');
INSERT INTO mendozarq.opinionproducto (uuid, creadoEn, titulo, descripcion, estado, verificado, puntuacion, uuidProducto, uuidCliente) VALUES ('9e92aac4-8bb3-4d14-8c8c-d13e61fa6777', '2021-11-27 22:00:26', 'Mala calidad', 'La calidad de estr producto se ve reflejado en que apenas lo mire y se rompio xd.', 0, 0, 1, '2fe5ff3e-f808-4e6d-916a-d4959bb87227', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72');
INSERT INTO mendozarq.opinionproducto (uuid, creadoEn, titulo, descripcion, estado, verificado, puntuacion, uuidProducto, uuidCliente) VALUES ('ca8ad072-2f80-450f-b1c3-bfb93af2f32c', '2021-12-20 21:48:50', 'dsadsa', 'dsadasdsadasdasdsaasdd', 0, 0, 5, '7d9ca4bb-b259-4ce2-b069-4893f074b597', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72');
INSERT INTO mendozarq.opinionproducto (uuid, creadoEn, titulo, descripcion, estado, verificado, puntuacion, uuidProducto, uuidCliente) VALUES ('da8513d6-2a00-4008-9c9a-12445c168ee4', '2021-11-27 22:01:55', 'Exelente  Recomendado', 'Abalada Descifrable Ficoideo Géminis Gencianeo Cencapa. Engastadura Cenestesia
Batavia Abajadero Gendarmería. Genearca Descervigamiento Descerrajar Fidecomiso
Engaste Cencerro Batatazo Engastador. Batavia Cenceñada Abajo
Abalada Descifrable Ficoideo Géminis Gencianeo Cencapa. Engastadura Cenestesia
Batavia Abajadero Gendarmería. Genearca Descervigamiento Descerrajar Fidecomiso
Engaste Cencerro Batatazo Engastador. Batavia Cenceñada Abajo', 0, 0, 5, '2fe5ff3e-f808-4e6d-916a-d4959bb87227', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72');
