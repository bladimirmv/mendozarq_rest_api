create table categoriaproducto
(
    uuid        varchar(100)                          not null
        primary key,
    creadoEn    timestamp default current_timestamp() not null,
    nombre      varchar(100)                          not null,
    descripcion varchar(200)                          null,
    keyName     text                                  not null,
    fileName    text                                  not null,
    location    text                                  not null,
    size        int                                   not null,
    estado      tinyint(1)                            not null,
    constraint nombre
        unique (nombre)
);

INSERT INTO mendozarq.categoriaproducto (uuid, creadoEn, nombre, descripcion, keyName, fileName, location, size, estado) VALUES ('152054a7-2d6f-4975-8d2f-9fb7c009070d', '2021-11-24 20:55:51', 'sillas', '', 'liraki/images/98df930d-4332-4246-aa98-e4d53ae21130.jfif', 'images (1).jfif', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/98df930d-4332-4246-aa98-e4d53ae21130.jfif', 6128, 1);
INSERT INTO mendozarq.categoriaproducto (uuid, creadoEn, nombre, descripcion, keyName, fileName, location, size, estado) VALUES ('17ec4924-cf46-44c8-b814-69f1c0ab6548', '2021-11-24 20:52:44', 'mesas', 'Gemir Batallador Bate Increíble.', 'liraki/images/7a946046-7c6f-4ced-8cfd-b7bd53faa300.jfif', 'images.jfif', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/7a946046-7c6f-4ced-8cfd-b7bd53faa300.jfif', 4361, 1);
INSERT INTO mendozarq.categoriaproducto (uuid, creadoEn, nombre, descripcion, keyName, fileName, location, size, estado) VALUES ('4c4c0f7a-e3ed-41b9-b169-8815bf8b9fb3', '2021-11-24 20:55:10', 'mesedoras', '', 'liraki/images/2268c0a9-ed38-4b3f-aab6-d56fcd05375e.jpg', 'images.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/2268c0a9-ed38-4b3f-aab6-d56fcd05375e.jpg', 7586, 1);
INSERT INTO mendozarq.categoriaproducto (uuid, creadoEn, nombre, descripcion, keyName, fileName, location, size, estado) VALUES ('66ae0979-62d4-426f-bab4-8d72a04198df', '2021-11-24 20:54:32', 'vigas', '', 'liraki/images/13d5b723-ed41-4623-bcf1-c4a6f2b9b49f.jpg', 'download.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/13d5b723-ed41-4623-bcf1-c4a6f2b9b49f.jpg', 8824, 1);
INSERT INTO mendozarq.categoriaproducto (uuid, creadoEn, nombre, descripcion, keyName, fileName, location, size, estado) VALUES ('6a8376c6-319a-46dc-90fb-3410e4381b9e', '2021-11-24 20:58:23', 'abeto', ' Es una madera clara, blanca-amarillenta y fácil de trabajar. Se utiliza para fabricar muebles, instrumentos musicales, puertas y ventanas, y es muy común en el sector de la construcción.', 'liraki/images/c90d4a14-6bce-41ff-9248-94521fd05f8f.jpg', 'download.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/c90d4a14-6bce-41ff-9248-94521fd05f8f.jpg', 4654, 1);
INSERT INTO mendozarq.categoriaproducto (uuid, creadoEn, nombre, descripcion, keyName, fileName, location, size, estado) VALUES ('6d518b5c-ca45-4fd8-9ce2-be076a35b264', '2021-11-24 20:53:14', 'vitrinas', 'Cencerra Cenagoso Descensión.', 'liraki/images/306ca26f-a1e6-4541-850b-0d255f3db26b.jpg', 'vitrina.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/306ca26f-a1e6-4541-850b-0d255f3db26b.jpg', 60664, 1);
INSERT INTO mendozarq.categoriaproducto (uuid, creadoEn, nombre, descripcion, keyName, fileName, location, size, estado) VALUES ('718abba8-fd1d-490c-9ecc-81addc302a35', '2021-11-24 21:01:47', 'escaleras', '', 'liraki/images/ae125ea3-754d-443b-ae38-eea3cd63aa36.jpg', '147dd59123e82286621c0e5f50aaa665.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/ae125ea3-754d-443b-ae38-eea3cd63aa36.jpg', 12396, 1);
INSERT INTO mendozarq.categoriaproducto (uuid, creadoEn, nombre, descripcion, keyName, fileName, location, size, estado) VALUES ('739b3a09-2ee4-49f5-a07f-c309d2730443', '2021-11-24 21:00:41', 'armarios', '', 'liraki/images/d1ecc64b-3e38-45d5-a734-326daafc707c.jfif', 'images.jfif', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/d1ecc64b-3e38-45d5-a734-326daafc707c.jfif', 5729, 1);
INSERT INTO mendozarq.categoriaproducto (uuid, creadoEn, nombre, descripcion, keyName, fileName, location, size, estado) VALUES ('805ab00f-c607-42bc-9d20-60dfd58763db', '2021-11-24 20:52:11', 'marcos de ventanas', 'Batanar Abaldonadamente Abajamiento Fidecomiso.', 'liraki/images/c7c214c7-933e-4ef5-92f1-c9f5571e1a12.jfif', 'descarga.jfif', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/c7c214c7-933e-4ef5-92f1-c9f5571e1a12.jfif', 5946, 1);
INSERT INTO mendozarq.categoriaproducto (uuid, creadoEn, nombre, descripcion, keyName, fileName, location, size, estado) VALUES ('8cec5a20-206d-4b57-a021-24aa340f1f51', '2021-11-24 20:58:53', 'pino', 'Es muy fácil trabajar con el pino y, como la mayoría de las variedades que son relativamente suaves, se presta a la escultura.', 'liraki/images/f9709763-6632-4d6b-b7be-071260e08263.jpg', 'download.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/f9709763-6632-4d6b-b7be-071260e08263.jpg', 3351, 1);
INSERT INTO mendozarq.categoriaproducto (uuid, creadoEn, nombre, descripcion, keyName, fileName, location, size, estado) VALUES ('8f7a06df-bfd3-4fc4-92fb-12ee1e65250e', '2021-11-24 20:59:12', 'cedro', 'El tipo más común de cedro es la variedad roja occidental. El cedro tiene un color rojizo , este tipo de madera es relativamente suave, tiene un grano recto y un olor ligeramente aromático', 'liraki/images/444cfe9a-99fa-4874-a2c1-1fc618223193.jpg', 'download.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/444cfe9a-99fa-4874-a2c1-1fc618223193.jpg', 3451, 1);
INSERT INTO mendozarq.categoriaproducto (uuid, creadoEn, nombre, descripcion, keyName, fileName, location, size, estado) VALUES ('939b6e45-82ea-4c94-8bbb-dd87eba0adda', '2021-11-24 21:00:25', 'madera nogal', 'Hoy en día se utiliza mucho para revestimientos de lujo: muebles, armarios, puertas, adornos y elementos torneados.

muebles, pero también para suelos y paredes.', 'liraki/images/298d519b-2eed-4d9f-a771-2f46a2e17a95.jpg', 'Textura-madera-nogal-oscuro.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/298d519b-2eed-4d9f-a771-2f46a2e17a95.jpg', 904676, 1);
INSERT INTO mendozarq.categoriaproducto (uuid, creadoEn, nombre, descripcion, keyName, fileName, location, size, estado) VALUES ('e90fdffe-e621-4c27-8d14-bfa8de0b2418', '2021-11-24 21:08:01', 'pisos', 'pisos de madera aplicable al concreto', 'liraki/images/c06a70f6-ad20-4d90-84d1-47e6729c6c10.jpg', 'eliminar-crujidos-suelos-madera-xl-848x477x80xX.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/c06a70f6-ad20-4d90-84d1-47e6729c6c10.jpg', 91596, 1);
INSERT INTO mendozarq.categoriaproducto (uuid, creadoEn, nombre, descripcion, keyName, fileName, location, size, estado) VALUES ('ec2400a2-78ee-4ec8-8399-cbcc1c23cb5b', '2021-11-24 20:50:14', 'puertas', 'Descifrador Cencerrear Engargolado Generación Cenegar Fichaje Bastoncillo Cenata Batato.', 'liraki/images/f4457cf4-efe3-46d1-8d11-852291e7e288.png', '5ecd72d5e8af153da5d9ab44_5e744da8c5732f8e7bb01277_big5-2.png', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/f4457cf4-efe3-46d1-8d11-852291e7e288.png', 301604, 1);