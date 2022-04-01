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

INSERT INTO mendozarq.opinionproducto (uuid, creadoEn, titulo, descripcion, estado, verificado, puntuacion, uuidProducto, uuidCliente) VALUES ('5ba26b9e-f051-40ed-a878-4f439889ea88', '2022-03-29 15:39:48', 'rewrewr', 'werrrrrrrrrrrrrrrrrrrrrrrrrrrr', 0, 0, 3, 'fa97335b-3efd-499d-9ec2-78c49597a301', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.opinionproducto (uuid, creadoEn, titulo, descripcion, estado, verificado, puntuacion, uuidProducto, uuidCliente) VALUES ('78a9061b-56ad-43a2-ba91-f83407ba0f88', '2022-03-29 15:40:10', 'rrrrrrrrrrrr', 'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr', 0, 0, 4, 'fa97335b-3efd-499d-9ec2-78c49597a301', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.opinionproducto (uuid, creadoEn, titulo, descripcion, estado, verificado, puntuacion, uuidProducto, uuidCliente) VALUES ('8376e961-9286-49e8-982e-a688c006ec95', '2022-03-29 15:39:35', 'tret', 'ertretretertretretert', 1, 0, 5, 'fa97335b-3efd-499d-9ec2-78c49597a301', 'bf493a64-4573-433f-92b0-edbcae73a98b');
