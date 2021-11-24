create table capitulopresupuesto
(
    uuid                varchar(100)                        not null
        primary key,
    creadoEn            timestamp default CURRENT_TIMESTAMP not null,
    nombre              text                                not null,
    descuento           int       default 0                 not null,
    uuidPresupuestoObra varchar(100)                        not null,
    constraint capitulopresupuesto_ibfk_1
        foreign key (uuidPresupuestoObra) references presupuestoobra (uuid)
);

create index uuidPresupuestoObra
    on capitulopresupuesto (uuidPresupuestoObra);

INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('b60c139a-31e9-4f2c-8421-1de24ae184b8', '2021-10-07 21:57:13', 'nuevo capitlo', 10, '25cf79ba-e78c-44bd-b82c-f8fcdde9a2fa');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('bbfce704-f705-4121-893b-3c1245457b39', '2021-10-07 21:57:35', 'contruccion de la infraestructura', 5, '25cf79ba-e78c-44bd-b82c-f8fcdde9a2fa');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('fe161dd9-d471-4513-80e9-ae374ed70443', '2021-10-27 22:03:46', 'cxvsdfdsf', 0, 'afc7ad9f-b6c1-47b6-a29b-5f22d8691e84');
create table carpetaproyecto
(
    uuid          varchar(100)                        not null
        primary key,
    creadoEn      timestamp default CURRENT_TIMESTAMP not null,
    nombre        varchar(50)                         null,
    fechaCreacion date                                null,
    uuidProyecto  varchar(100)                        not null,
    constraint carpetaproyecto_ibfk_1
        foreign key (uuidProyecto) references proyecto (uuid)
);

create index uuidProyecto
    on carpetaproyecto (uuidProyecto);

INSERT INTO mendozarq.carpetaproyecto (uuid, creadoEn, nombre, fechaCreacion, uuidProyecto) VALUES ('1bb6f6f9-8439-453f-8e37-fbfb11c1b578', '2021-10-07 21:25:19', 'documentos', '2021-10-08', '5c2f359b-e272-455f-8844-120ac877df62');
INSERT INTO mendozarq.carpetaproyecto (uuid, creadoEn, nombre, fechaCreacion, uuidProyecto) VALUES ('52d8bce3-3e7d-47f0-bb0a-dc2c0ebedebf', '2021-10-07 21:23:44', 'fotos', '2021-10-08', '5c2f359b-e272-455f-8844-120ac877df62');
INSERT INTO mendozarq.carpetaproyecto (uuid, creadoEn, nombre, fechaCreacion, uuidProyecto) VALUES ('eb166f88-1d42-424c-b6c7-f298269c276f', '2021-10-07 21:23:36', 'planos', '2021-10-08', '5c2f359b-e272-455f-8844-120ac877df62');
create table categoriaproducto
(
    uuid        varchar(100)                        not null
        primary key,
    creadoEn    timestamp default CURRENT_TIMESTAMP not null,
    nombre      varchar(100)                        not null,
    descripcion varchar(200)                        null,
    constraint nombre
        unique (nombre)
);

INSERT INTO mendozarq.categoriaproducto (uuid, creadoEn, nombre, descripcion) VALUES ('04860856-94fb-43f8-914a-deff45ba0e49', '2021-10-21 12:53:13', 'categoria 1', 'jhj');
INSERT INTO mendozarq.categoriaproducto (uuid, creadoEn, nombre, descripcion) VALUES ('8b814a53-2da3-4368-bff0-03ee07621d1a', '2021-10-23 19:20:22', 'categoria xdq', '');
INSERT INTO mendozarq.categoriaproducto (uuid, creadoEn, nombre, descripcion) VALUES ('ca9735de-6b62-4cbb-b2bf-12736d48777f', '2021-10-23 19:20:10', 'categoria 2', '');
create table detallecapitulo
(
    uuid                    varchar(100)                        not null
        primary key,
    creadoEn                timestamp default CURRENT_TIMESTAMP not null,
    descripcion             text                                not null,
    unidad                  varchar(10)                         not null,
    cantidad                int                                 not null,
    precioUnitario          decimal(15, 2)                      not null,
    uuidCapituloPresupuesto varchar(100)                        not null,
    constraint detallecapitulo_ibfk_1
        foreign key (uuidCapituloPresupuesto) references capitulopresupuesto (uuid)
);

create index uuidCapituloPresupuesto
    on detallecapitulo (uuidCapituloPresupuesto);

INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('84b41ad4-3ab4-4b5c-8000-2f50aa5e76a5', '2021-10-27 22:03:56', 'dsadsadsa', 'mm', 0, 0.00, 'fe161dd9-d471-4513-80e9-ae374ed70443');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('c25b56ae-68fc-4103-ab6e-3341e3d7b043', '2021-10-07 21:59:57', 'fsdahijghfjdsbahjf', 'µm', 50, 70.00, 'b60c139a-31e9-4f2c-8421-1de24ae184b8');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('d6fbbfc1-299e-4953-89c4-21bc76ccfb92', '2021-10-07 21:59:15', 'fierro para la construccion', 'm', 100, 50.00, 'b60c139a-31e9-4f2c-8421-1de24ae184b8');
INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('da7b979f-8c3a-40ab-b499-32119cf738fd', '2021-11-02 14:34:06', 'gvvcbxvcnbxvcb', 'µm', 5, 432432.00, 'b60c139a-31e9-4f2c-8421-1de24ae184b8');
create table detallecategoriaproducto
(
    uuid          varchar(100) not null
        primary key,
    uuidCategoria varchar(100) null,
    uuidProducto  varchar(100) null,
    constraint detallecategoriaproducto_ibfk_1
        foreign key (uuidCategoria) references categoriaproducto (uuid),
    constraint detallecategoriaproducto_ibfk_2
        foreign key (uuidProducto) references producto (uuid)
);

create index uuidCategoria
    on detallecategoriaproducto (uuidCategoria);

create index uuidProducto
    on detallecategoriaproducto (uuidProducto);

INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('0c9781cf-47bd-46bc-8165-3b01cfcf9f4a', 'ca9735de-6b62-4cbb-b2bf-12736d48777f', '79635f9a-fa0c-43b1-af13-005e3a542116');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('2d51c85b-5175-4b95-b34d-20e73c54d4ee', '8b814a53-2da3-4368-bff0-03ee07621d1a', 'da1c33fa-7da9-454b-8741-80406655d591');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('32fa07a7-8d85-4039-813a-1fa5f696991d', '8b814a53-2da3-4368-bff0-03ee07621d1a', '2efa9682-8c1b-40c2-aa31-b5c1e1622a18');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('6539ddd9-7360-4a67-866e-aed94c13c5f8', '04860856-94fb-43f8-914a-deff45ba0e49', '5ce1487f-0c79-47a4-800b-1633b3bfb86b');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('7b5bd350-c05b-4c62-b971-195de361f29b', '8b814a53-2da3-4368-bff0-03ee07621d1a', 'a97f2d68-7c06-4867-b742-24311e10d99f');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('8ca850d8-e919-4d5a-a567-390c04af4576', '04860856-94fb-43f8-914a-deff45ba0e49', '2efa9682-8c1b-40c2-aa31-b5c1e1622a18');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('a1eaf39f-a53e-4f46-bdab-cf444d1eaaa1', 'ca9735de-6b62-4cbb-b2bf-12736d48777f', 'a9cfd083-4f53-48b9-ad5f-a85705213c00');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('a310dfcc-10c8-4bdd-a82a-fd7f876012b4', 'ca9735de-6b62-4cbb-b2bf-12736d48777f', '2a0a3ed3-4a86-43da-b27c-142f7cf5f5a6');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('a3448e19-3e2a-4fa9-a405-0ab2e0af80b0', '04860856-94fb-43f8-914a-deff45ba0e49', 'a9cfd083-4f53-48b9-ad5f-a85705213c00');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('a698dc37-bbaf-4f38-8c35-db6bbbd21620', '8b814a53-2da3-4368-bff0-03ee07621d1a', '79635f9a-fa0c-43b1-af13-005e3a542116');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('caa96e2a-1a9a-46b4-86c3-fe4e9109f7d3', 'ca9735de-6b62-4cbb-b2bf-12736d48777f', '2efa9682-8c1b-40c2-aa31-b5c1e1622a18');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('dbbe60bb-8f98-4b70-a3f5-0e67afb7217a', '8b814a53-2da3-4368-bff0-03ee07621d1a', 'a9cfd083-4f53-48b9-ad5f-a85705213c00');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('fa457a53-a935-4af3-919a-8e6b422ded83', 'ca9735de-6b62-4cbb-b2bf-12736d48777f', '5ce1487f-0c79-47a4-800b-1633b3bfb86b');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('fb8ca720-1d01-475e-a650-7a14ae2e116b', '8b814a53-2da3-4368-bff0-03ee07621d1a', '2a0a3ed3-4a86-43da-b27c-142f7cf5f5a6');
create table documentocarpeta
(
    uuid          varchar(100)                        not null
        primary key,
    creadoEn      timestamp default CURRENT_TIMESTAMP not null,
    uuidCarpeta   varchar(100)                        not null,
    uuidDocumento varchar(100)                        not null,
    constraint documentocarpeta_ibfk_1
        foreign key (uuidCarpeta) references carpetaproyecto (uuid),
    constraint documentocarpeta_ibfk_2
        foreign key (uuidDocumento) references documentoproyecto (uuid)
);

create index uuidCarpeta
    on documentocarpeta (uuidCarpeta);

create index uuidDocumento
    on documentocarpeta (uuidDocumento);

INSERT INTO mendozarq.documentocarpeta (uuid, creadoEn, uuidCarpeta, uuidDocumento) VALUES ('20750589-31c5-4dd8-9670-9fe32b81e1b5', '2021-10-23 18:26:00', 'eb166f88-1d42-424c-b6c7-f298269c276f', '4fb539ac-77d6-4c5c-be61-913c35c8b888');
INSERT INTO mendozarq.documentocarpeta (uuid, creadoEn, uuidCarpeta, uuidDocumento) VALUES ('35b91201-f70f-4781-9e82-00a24fa2fc43', '2021-11-02 14:33:32', '52d8bce3-3e7d-47f0-bb0a-dc2c0ebedebf', 'fe2d2471-15ac-4092-ab03-ac1cb9b05681');
INSERT INTO mendozarq.documentocarpeta (uuid, creadoEn, uuidCarpeta, uuidDocumento) VALUES ('49233699-779f-4660-91ec-65464c318f54', '2021-10-23 18:25:39', 'eb166f88-1d42-424c-b6c7-f298269c276f', 'b0890a27-f9c0-4204-b347-1bcd27a6092a');
INSERT INTO mendozarq.documentocarpeta (uuid, creadoEn, uuidCarpeta, uuidDocumento) VALUES ('8cf22e07-171e-496b-b99f-6ca6cda6c4fa', '2021-10-21 15:58:14', '1bb6f6f9-8439-453f-8e37-fbfb11c1b578', 'c40f5782-c62f-4198-8121-24cd9c373b23');
INSERT INTO mendozarq.documentocarpeta (uuid, creadoEn, uuidCarpeta, uuidDocumento) VALUES ('a222474b-0740-4f91-aea4-306ffd3102e9', '2021-10-21 15:58:13', '1bb6f6f9-8439-453f-8e37-fbfb11c1b578', '3520176b-153f-42d0-a8b3-fe6cf89b8b63');
INSERT INTO mendozarq.documentocarpeta (uuid, creadoEn, uuidCarpeta, uuidDocumento) VALUES ('c0e5169e-5607-4cbb-a9d5-7dcf5d7b5ddc', '2021-10-21 15:47:19', 'eb166f88-1d42-424c-b6c7-f298269c276f', 'cbd1dc9d-bfca-456b-8f0f-a0b72127a3af');
INSERT INTO mendozarq.documentocarpeta (uuid, creadoEn, uuidCarpeta, uuidDocumento) VALUES ('c7df5e55-fd51-4da8-9cc1-18be057f942b', '2021-11-02 14:33:32', '52d8bce3-3e7d-47f0-bb0a-dc2c0ebedebf', '41fa2e58-b10b-4a61-97c3-888142f7e6c6');
INSERT INTO mendozarq.documentocarpeta (uuid, creadoEn, uuidCarpeta, uuidDocumento) VALUES ('ca4ca538-de4a-4c27-b149-fef98188a2bc', '2021-11-02 14:33:32', '52d8bce3-3e7d-47f0-bb0a-dc2c0ebedebf', 'fa7dcedf-abd4-4b73-93ba-4c8fc7a38b9e');
INSERT INTO mendozarq.documentocarpeta (uuid, creadoEn, uuidCarpeta, uuidDocumento) VALUES ('f2bcde4b-023d-4951-8bdf-4b423b7111b7', '2021-11-02 14:33:32', '52d8bce3-3e7d-47f0-bb0a-dc2c0ebedebf', 'cef356c6-f938-4db1-9502-570b169437c3');
create table documentoproyecto
(
    uuid          varchar(100)                        not null
        primary key,
    creadoEn      timestamp default CURRENT_TIMESTAMP not null,
    nombre        text                                not null,
    keyName       text                                not null,
    location      text                                not null,
    fechaCreacion date                                not null,
    uuidProyecto  varchar(100)                        not null,
    size          int                                 not null,
    path          varchar(10)                         not null,
    constraint documentoproyecto_ibfk_1
        foreign key (uuidProyecto) references proyecto (uuid)
);

create index uuidProyecto
    on documentoproyecto (uuidProyecto);

INSERT INTO mendozarq.documentoproyecto (uuid, creadoEn, nombre, keyName, location, fechaCreacion, uuidProyecto, size, path) VALUES ('14c2054a-50ca-4018-bd05-38983a505e60', '2021-10-27 22:00:47', 'tbajy6t3n5ja1j7br8w4.jpg', 'mendozarq/documents/dfe2264c-d28d-48fc-a3e8-7b5a396523af.jpg', 'https://mendozarq-liraki.s3.sa-east-1.amazonaws.com/mendozarq/documents/dfe2264c-d28d-48fc-a3e8-7b5a396523af.jpg', '2021-10-27', '5c2f359b-e272-455f-8844-120ac877df62', 21603, 'root');
INSERT INTO mendozarq.documentoproyecto (uuid, creadoEn, nombre, keyName, location, fechaCreacion, uuidProyecto, size, path) VALUES ('29dfa228-1db5-4088-b436-1cc646bf18bd', '2021-10-25 18:25:50', 'earth.jpg', 'mendozarq/documents/c352074d-fdf2-42c4-bee9-58faa04f2128.jpg', 'https://mendozarq-liraki.s3.sa-east-1.amazonaws.com/mendozarq/documents/c352074d-fdf2-42c4-bee9-58faa04f2128.jpg', '2021-10-25', '5c2f359b-e272-455f-8844-120ac877df62', 340590, 'root');
INSERT INTO mendozarq.documentoproyecto (uuid, creadoEn, nombre, keyName, location, fechaCreacion, uuidProyecto, size, path) VALUES ('2c4e9c71-9d51-4952-beb7-55a1a5c9b96a', '2021-10-27 22:00:50', 'map.jpg', 'mendozarq/documents/126aec4c-d25a-4ae2-8f79-d6867c701ab8.jpg', 'https://mendozarq-liraki.s3.sa-east-1.amazonaws.com/mendozarq/documents/126aec4c-d25a-4ae2-8f79-d6867c701ab8.jpg', '2021-10-27', '5c2f359b-e272-455f-8844-120ac877df62', 1458672, 'root');
INSERT INTO mendozarq.documentoproyecto (uuid, creadoEn, nombre, keyName, location, fechaCreacion, uuidProyecto, size, path) VALUES ('2c94f7ef-c22d-477c-b214-7e45095e1ad3', '2021-10-27 22:00:49', 'earth.jpg', 'mendozarq/documents/12cca002-3c74-4b02-9c9b-b5ca755e15e4.jpg', 'https://mendozarq-liraki.s3.sa-east-1.amazonaws.com/mendozarq/documents/12cca002-3c74-4b02-9c9b-b5ca755e15e4.jpg', '2021-10-27', '5c2f359b-e272-455f-8844-120ac877df62', 340590, 'root');
INSERT INTO mendozarq.documentoproyecto (uuid, creadoEn, nombre, keyName, location, fechaCreacion, uuidProyecto, size, path) VALUES ('3520176b-153f-42d0-a8b3-fe6cf89b8b63', '2021-10-21 15:58:13', 'g13430.png', 'mendozarq/documents/aec46fea-0ada-4559-9bed-8acc8523150e.png', 'https://mendozarq-liraki.s3.amazonaws.com/mendozarq/documents/aec46fea-0ada-4559-9bed-8acc8523150e.png', '2021-10-21', '5c2f359b-e272-455f-8844-120ac877df62', 601110, 'folder');
INSERT INTO mendozarq.documentoproyecto (uuid, creadoEn, nombre, keyName, location, fechaCreacion, uuidProyecto, size, path) VALUES ('41fa2e58-b10b-4a61-97c3-888142f7e6c6', '2021-11-02 14:33:32', 'mendozarq.sql', 'mendozarq/documents/f25b71ff-f3b3-460d-9253-1c2e3ef3a127.sql', 'https://mendozarq-liraki.s3.sa-east-1.amazonaws.com/mendozarq/documents/f25b71ff-f3b3-460d-9253-1c2e3ef3a127.sql', '2021-11-02', '5c2f359b-e272-455f-8844-120ac877df62', 45527, 'folder');
INSERT INTO mendozarq.documentoproyecto (uuid, creadoEn, nombre, keyName, location, fechaCreacion, uuidProyecto, size, path) VALUES ('492a330c-61c3-44cb-89d4-3f6a3085a7a2', '2021-10-25 12:50:49', '1184.jpg', 'mendozarq/documents/f493b4c7-7612-487b-a3dd-e9da7fc3ff93.jpg', 'https://mendozarq-liraki.s3.amazonaws.com/mendozarq/documents/f493b4c7-7612-487b-a3dd-e9da7fc3ff93.jpg', '2021-10-25', '5c2f359b-e272-455f-8844-120ac877df62', 679726, 'root');
INSERT INTO mendozarq.documentoproyecto (uuid, creadoEn, nombre, keyName, location, fechaCreacion, uuidProyecto, size, path) VALUES ('4e9964a3-6490-4b35-9c2a-e8767c9a1e59', '2021-10-25 12:50:48', '13138.jpg', 'mendozarq/documents/ebd50065-e331-4f1a-ba65-65d6226a8c02.jpg', 'https://mendozarq-liraki.s3.amazonaws.com/mendozarq/documents/ebd50065-e331-4f1a-ba65-65d6226a8c02.jpg', '2021-10-25', '5c2f359b-e272-455f-8844-120ac877df62', 561286, 'root');
INSERT INTO mendozarq.documentoproyecto (uuid, creadoEn, nombre, keyName, location, fechaCreacion, uuidProyecto, size, path) VALUES ('4fb539ac-77d6-4c5c-be61-913c35c8b888', '2021-10-23 18:26:00', 'TEMA 2 - NOTACIÓN BÁSICA DE UML.pdf', 'mendozarq/documents/7f85b4ca-caf1-4efa-8c23-4a89fc171576.pdf', 'https://mendozarq-liraki.s3.sa-east-1.amazonaws.com/mendozarq/documents/7f85b4ca-caf1-4efa-8c23-4a89fc171576.pdf', '2021-10-23', '5c2f359b-e272-455f-8844-120ac877df62', 12923338, 'folder');
INSERT INTO mendozarq.documentoproyecto (uuid, creadoEn, nombre, keyName, location, fechaCreacion, uuidProyecto, size, path) VALUES ('55590b27-7f68-4760-95c0-4b6661deffed', '2021-10-27 22:00:48', 'Windows_10_439975_1366x768.jpg', 'mendozarq/documents/3ad1a9ef-2d0b-4de9-9908-804de8079fc7.jpg', 'https://mendozarq-liraki.s3.sa-east-1.amazonaws.com/mendozarq/documents/3ad1a9ef-2d0b-4de9-9908-804de8079fc7.jpg', '2021-10-27', '5c2f359b-e272-455f-8844-120ac877df62', 205811, 'root');
INSERT INTO mendozarq.documentoproyecto (uuid, creadoEn, nombre, keyName, location, fechaCreacion, uuidProyecto, size, path) VALUES ('7fe8cf39-aadd-4594-863a-7255ce9346e2', '2021-10-25 18:25:48', 'tbajy6t3n5ja1j7br8w4.jpg', 'mendozarq/documents/566ca55f-f671-4482-b253-70ee9a9d7c54.jpg', 'https://mendozarq-liraki.s3.sa-east-1.amazonaws.com/mendozarq/documents/566ca55f-f671-4482-b253-70ee9a9d7c54.jpg', '2021-10-25', '5c2f359b-e272-455f-8844-120ac877df62', 21603, 'root');
INSERT INTO mendozarq.documentoproyecto (uuid, creadoEn, nombre, keyName, location, fechaCreacion, uuidProyecto, size, path) VALUES ('99c3db5d-9e99-49f8-ae24-0a696a0688e2', '2021-10-25 12:51:56', '1184.jpg', 'mendozarq/documents/d0a8f9b2-aa4a-4d3f-9cf9-23c443962777.jpg', 'https://mendozarq-liraki.s3.sa-east-1.amazonaws.com/mendozarq/documents/d0a8f9b2-aa4a-4d3f-9cf9-23c443962777.jpg', '2021-10-25', '5c2f359b-e272-455f-8844-120ac877df62', 679726, 'root');
INSERT INTO mendozarq.documentoproyecto (uuid, creadoEn, nombre, keyName, location, fechaCreacion, uuidProyecto, size, path) VALUES ('99d4281a-4c9b-4b91-9883-f77e571829c4', '2021-10-25 18:25:52', 'map.jpg', 'mendozarq/documents/953c1d35-228b-4af4-83aa-8eaaa33cbe53.jpg', 'https://mendozarq-liraki.s3.sa-east-1.amazonaws.com/mendozarq/documents/953c1d35-228b-4af4-83aa-8eaaa33cbe53.jpg', '2021-10-25', '5c2f359b-e272-455f-8844-120ac877df62', 1458672, 'root');
INSERT INTO mendozarq.documentoproyecto (uuid, creadoEn, nombre, keyName, location, fechaCreacion, uuidProyecto, size, path) VALUES ('b0890a27-f9c0-4204-b347-1bcd27a6092a', '2021-10-23 18:25:39', 'reservacion (1).sql', 'mendozarq/documents/2da73ffb-c2f1-4be1-86db-1b178839bfb8.sql', 'https://mendozarq-liraki.s3.sa-east-1.amazonaws.com/mendozarq/documents/2da73ffb-c2f1-4be1-86db-1b178839bfb8.sql', '2021-10-23', '5c2f359b-e272-455f-8844-120ac877df62', 7395, 'folder');
INSERT INTO mendozarq.documentoproyecto (uuid, creadoEn, nombre, keyName, location, fechaCreacion, uuidProyecto, size, path) VALUES ('c40f5782-c62f-4198-8121-24cd9c373b23', '2021-10-21 15:58:14', 'g3094.png', 'mendozarq/documents/044236a4-e859-4df1-8981-ea9fdbfdcc6e.png', 'https://mendozarq-liraki.s3.amazonaws.com/mendozarq/documents/044236a4-e859-4df1-8981-ea9fdbfdcc6e.png', '2021-10-21', '5c2f359b-e272-455f-8844-120ac877df62', 1138793, 'folder');
INSERT INTO mendozarq.documentoproyecto (uuid, creadoEn, nombre, keyName, location, fechaCreacion, uuidProyecto, size, path) VALUES ('c4fbe175-21c9-44c8-8b34-50d8c15ed66d', '2021-10-25 18:25:49', 'Windows_10_439975_1366x768.jpg', 'mendozarq/documents/3802b651-5e3c-408e-881e-011423a48e34.jpg', 'https://mendozarq-liraki.s3.sa-east-1.amazonaws.com/mendozarq/documents/3802b651-5e3c-408e-881e-011423a48e34.jpg', '2021-10-25', '5c2f359b-e272-455f-8844-120ac877df62', 205811, 'root');
INSERT INTO mendozarq.documentoproyecto (uuid, creadoEn, nombre, keyName, location, fechaCreacion, uuidProyecto, size, path) VALUES ('c9d37ca0-751a-4ceb-9b1e-34d53014144a', '2021-10-25 12:53:02', '1184.jpg', 'mendozarq/documents/a0832bb9-fa06-4e14-8a86-5b7da7aedd4e.jpg', 'https://mendozarq-liraki.s3.sa-east-1.amazonaws.com/mendozarq/documents/a0832bb9-fa06-4e14-8a86-5b7da7aedd4e.jpg', '2021-10-25', '5c2f359b-e272-455f-8844-120ac877df62', 679726, 'root');
INSERT INTO mendozarq.documentoproyecto (uuid, creadoEn, nombre, keyName, location, fechaCreacion, uuidProyecto, size, path) VALUES ('cbd1dc9d-bfca-456b-8f0f-a0b72127a3af', '2021-10-21 15:47:19', 'WhatsApp Image 2021-10-19 at 1.59.28 PM.jpeg', 'mendozarq/documents/e34d7919-9ede-44ad-bc2f-b576e64605db.jpeg', 'https://mendozarq-liraki.s3.amazonaws.com/mendozarq/documents/e34d7919-9ede-44ad-bc2f-b576e64605db.jpeg', '2021-10-21', '5c2f359b-e272-455f-8844-120ac877df62', 206117, 'folder');
INSERT INTO mendozarq.documentoproyecto (uuid, creadoEn, nombre, keyName, location, fechaCreacion, uuidProyecto, size, path) VALUES ('cef356c6-f938-4db1-9502-570b169437c3', '2021-11-02 14:33:32', 'g35091.png', 'mendozarq/documents/c1249777-31ab-4603-bb39-a891f47e6101.png', 'https://mendozarq-liraki.s3.sa-east-1.amazonaws.com/mendozarq/documents/c1249777-31ab-4603-bb39-a891f47e6101.png', '2021-11-02', '5c2f359b-e272-455f-8844-120ac877df62', 275984, 'folder');
INSERT INTO mendozarq.documentoproyecto (uuid, creadoEn, nombre, keyName, location, fechaCreacion, uuidProyecto, size, path) VALUES ('e114d0c5-edd1-4937-b7be-f13140bb7686', '2021-10-27 22:00:52', '1184.jpg', 'mendozarq/documents/4669c303-c2d4-457b-b89c-67ab9b6457d3.jpg', 'https://mendozarq-liraki.s3.sa-east-1.amazonaws.com/mendozarq/documents/4669c303-c2d4-457b-b89c-67ab9b6457d3.jpg', '2021-10-27', '5c2f359b-e272-455f-8844-120ac877df62', 679726, 'root');
INSERT INTO mendozarq.documentoproyecto (uuid, creadoEn, nombre, keyName, location, fechaCreacion, uuidProyecto, size, path) VALUES ('f34eabc6-b044-43ab-ad87-816bb90fe6e4', '2021-10-27 22:00:47', 'BladimirMedranoVargasRedes.docx', 'mendozarq/documents/9a432fb0-1c68-4ed9-90c4-dde67bbd2720.docx', 'https://mendozarq-liraki.s3.sa-east-1.amazonaws.com/mendozarq/documents/9a432fb0-1c68-4ed9-90c4-dde67bbd2720.docx', '2021-10-27', '5c2f359b-e272-455f-8844-120ac877df62', 38866, 'root');
INSERT INTO mendozarq.documentoproyecto (uuid, creadoEn, nombre, keyName, location, fechaCreacion, uuidProyecto, size, path) VALUES ('fa7dcedf-abd4-4b73-93ba-4c8fc7a38b9e', '2021-11-02 14:33:32', 'database.sql', 'mendozarq/documents/ec850f0c-8545-4d50-bbe7-289c35ed50a2.sql', 'https://mendozarq-liraki.s3.sa-east-1.amazonaws.com/mendozarq/documents/ec850f0c-8545-4d50-bbe7-289c35ed50a2.sql', '2021-11-02', '5c2f359b-e272-455f-8844-120ac877df62', 11879, 'folder');
INSERT INTO mendozarq.documentoproyecto (uuid, creadoEn, nombre, keyName, location, fechaCreacion, uuidProyecto, size, path) VALUES ('fe2d2471-15ac-4092-ab03-ac1cb9b05681', '2021-11-02 14:33:31', 'Grand_Hotel.zip', 'mendozarq/documents/d71563c7-eb63-4852-bb9c-5d040ab5da2c.zip', 'https://mendozarq-liraki.s3.sa-east-1.amazonaws.com/mendozarq/documents/d71563c7-eb63-4852-bb9c-5d040ab5da2c.zip', '2021-11-02', '5c2f359b-e272-455f-8844-120ac877df62', 30688, 'folder');
create table fotoproducto
(
    uuid         varchar(100)                        not null
        primary key,
    creadoEn     timestamp default CURRENT_TIMESTAMP not null,
    nombre       text                                not null,
    indice       int                                 not null,
    keyName      text                                not null,
    location     text                                not null,
    size         int                                 not null,
    uuidProducto varchar(100)                        not null,
    constraint fotoproducto_ibfk_1
        foreign key (uuidProducto) references producto (uuid)
);

create index uuidProducto
    on fotoproducto (uuidProducto);

INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('62b6e375-fce4-4d42-97e3-f1cc65b34570', '2021-10-30 17:15:00', 'map.jpg', 1, 'liraki/images/8a6fdb22-94f1-4732-a636-dd556df3637e.jpg', 'https://mendozarq-liraki.s3.sa-east-1.amazonaws.com/liraki/images/8a6fdb22-94f1-4732-a636-dd556df3637e.jpg', 1458672, 'a9cfd083-4f53-48b9-ad5f-a85705213c00');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('77c2d211-0825-4ad8-9cd5-914cd4bdc174', '2021-10-30 15:40:34', 'map.jpg', 0, 'liraki/images/7a80812b-d622-4e1e-9b4e-d313f0e64b7c.jpg', 'https://mendozarq-liraki.s3.sa-east-1.amazonaws.com/liraki/images/7a80812b-d622-4e1e-9b4e-d313f0e64b7c.jpg', 1458672, '2a0a3ed3-4a86-43da-b27c-142f7cf5f5a6');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('81bf9b2e-75e1-4655-86c0-9ae2cfc7f3ce', '2021-11-09 04:04:25', 'D_NQ_NP_829166-MLM28084926754_092018-O.jpg', 1, 'liraki/images/7c5a61eb-f973-4ba1-a08a-7a5d3abffda6.jpg', 'https://mendozarq-liraki.s3.sa-east-1.amazonaws.com/liraki/images/7c5a61eb-f973-4ba1-a08a-7a5d3abffda6.jpg', 47168, '2efa9682-8c1b-40c2-aa31-b5c1e1622a18');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('85159dc5-b547-423b-8f6e-7a453cb9875c', '2021-10-30 15:37:56', 'earth.jpg', 0, 'liraki/images/336248a9-9ea5-49d5-bcd3-d44ad62ff146.jpg', 'https://mendozarq-liraki.s3.sa-east-1.amazonaws.com/liraki/images/336248a9-9ea5-49d5-bcd3-d44ad62ff146.jpg', 340590, 'da1c33fa-7da9-454b-8741-80406655d591');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('8ddf2166-8d93-4884-898d-e44bcb1e185f', '2021-10-30 19:44:01', 'imagen_1.jpg', 0, 'liraki/images/e3523476-57e2-4f83-a80b-39ecdf4b6ffd.jpg', 'https://mendozarq-liraki.s3.sa-east-1.amazonaws.com/liraki/images/e3523476-57e2-4f83-a80b-39ecdf4b6ffd.jpg', 28191, 'a97f2d68-7c06-4867-b742-24311e10d99f');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('9129c95f-0351-4a3a-b02b-ba1e69079d77', '2021-10-30 15:40:08', 'tbajy6t3n5ja1j7br8w4.jpg', 0, 'liraki/images/772b8ff7-22be-4a9c-bb1e-31f20f9408d3.jpg', 'https://mendozarq-liraki.s3.sa-east-1.amazonaws.com/liraki/images/772b8ff7-22be-4a9c-bb1e-31f20f9408d3.jpg', 21603, '79635f9a-fa0c-43b1-af13-005e3a542116');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('9d23f1f6-a61a-419a-856e-0f13c58d0137', '2021-11-09 04:04:25', 'mueble-en-crudo.jpg', 3, 'liraki/images/6f5c119c-8ab9-4a98-9c3b-55d4d10c52fd.jpg', 'https://mendozarq-liraki.s3.sa-east-1.amazonaws.com/liraki/images/6f5c119c-8ab9-4a98-9c3b-55d4d10c52fd.jpg', 14556, '2efa9682-8c1b-40c2-aa31-b5c1e1622a18');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('c565e0da-b6d1-4bed-947f-7f6e240a7275', '2021-11-04 19:23:02', 'e3523476-57e2-4f83-a80b-39ecdf4b6ffd (2).jpg', 4, 'liraki/images/90765724-d1f6-4a7f-a2fb-92a69d81e8d9.jpg', 'https://mendozarq-liraki.s3.sa-east-1.amazonaws.com/liraki/images/90765724-d1f6-4a7f-a2fb-92a69d81e8d9.jpg', 28191, '2efa9682-8c1b-40c2-aa31-b5c1e1622a18');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('dd87a581-c1d3-4949-b332-496cfc3662f7', '2021-11-03 18:39:27', 'Dual-Monitor-Wallpaper-5.jpg', 1, 'liraki/images/15d25cb9-d891-4bc3-94f6-b81a9f9de435.jpg', 'https://mendozarq-liraki.s3.sa-east-1.amazonaws.com/liraki/images/15d25cb9-d891-4bc3-94f6-b81a9f9de435.jpg', 478765, 'a97f2d68-7c06-4867-b742-24311e10d99f');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('def61069-a657-4952-a47e-74c1e0f530f1', '2021-11-09 04:04:25', 'images.jfif', 2, 'liraki/images/0896d8b5-237b-45a1-b752-f4068b743c43.jfif', 'https://mendozarq-liraki.s3.sa-east-1.amazonaws.com/liraki/images/0896d8b5-237b-45a1-b752-f4068b743c43.jfif', 5729, '2efa9682-8c1b-40c2-aa31-b5c1e1622a18');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('f84c90a6-7704-454f-86ab-288b0be9ed41', '2021-11-09 04:04:25', 'D_NQ_NP_981663-MLU41570543105_042020-V.jpg', 0, 'liraki/images/2ea2ee2f-026d-4e88-95ec-2014b4a38430.jpg', 'https://mendozarq-liraki.s3.sa-east-1.amazonaws.com/liraki/images/2ea2ee2f-026d-4e88-95ec-2014b4a38430.jpg', 9614, '2efa9682-8c1b-40c2-aa31-b5c1e1622a18');
INSERT INTO mendozarq.fotoproducto (uuid, creadoEn, nombre, indice, keyName, location, size, uuidProducto) VALUES ('ffdb4c28-a23a-42fb-b9ec-0e1a30153136', '2021-10-30 17:14:59', '1184.jpg', 0, 'liraki/images/3266835c-6869-4b7b-9853-f08b264d3210.jpg', 'https://mendozarq-liraki.s3.sa-east-1.amazonaws.com/liraki/images/3266835c-6869-4b7b-9853-f08b264d3210.jpg', 679726, 'a9cfd083-4f53-48b9-ad5f-a85705213c00');
create table observacionpersonal
(
    uuid         varchar(100)                        not null
        primary key,
    creadoEn     timestamp default CURRENT_TIMESTAMP not null,
    estado       varchar(100)                        not null,
    descripcion  varchar(200)                        not null,
    fecha        date                                not null,
    uuidPersonal varchar(100)                        not null,
    uuidVisita   varchar(100)                        not null,
    constraint observacionpersonal_ibfk_1
        foreign key (uuidPersonal) references personal (uuid),
    constraint observacionpersonal_ibfk_2
        foreign key (uuidVisita) references visitaproyecto (uuid)
);

create index uuidPersonal
    on observacionpersonal (uuidPersonal);

create index uuidVisita
    on observacionpersonal (uuidVisita);

INSERT INTO mendozarq.observacionpersonal (uuid, creadoEn, estado, descripcion, fecha, uuidPersonal, uuidVisita) VALUES ('2aa47fe8-b840-41cd-8c27-28086bf48fb8', '2021-10-22 10:49:36', 'En curso', 'dsada', '2021-10-22', '0cdca13f-175a-4ed0-8320-650f65bf9167', '938ae24a-97e2-4828-aba2-5b8e20c52579');
INSERT INTO mendozarq.observacionpersonal (uuid, creadoEn, estado, descripcion, fecha, uuidPersonal, uuidVisita) VALUES ('6d803562-a3d5-40d0-8383-7db554fed5a1', '2021-10-23 14:24:22', 'En curso', 'kjhkhj', '2021-10-23', '0cdca13f-175a-4ed0-8320-650f65bf9167', 'c801adaa-7e93-42fe-80bd-1d2b7299fc5f');
INSERT INTO mendozarq.observacionpersonal (uuid, creadoEn, estado, descripcion, fecha, uuidPersonal, uuidVisita) VALUES ('9ecfdc0b-6007-4765-88b4-8def594d14b6', '2021-10-22 10:49:28', 'En curso', 'dsadas', '2021-10-22', '0cdca13f-175a-4ed0-8320-650f65bf9167', '938ae24a-97e2-4828-aba2-5b8e20c52579');
INSERT INTO mendozarq.observacionpersonal (uuid, creadoEn, estado, descripcion, fecha, uuidPersonal, uuidVisita) VALUES ('bf92aa19-9648-451c-bf0e-3d2feb678e07', '2021-10-22 10:49:16', 'En curso', 'dsadsa', '2021-10-22', '0cdca13f-175a-4ed0-8320-650f65bf9167', '938ae24a-97e2-4828-aba2-5b8e20c52579');
create table observacionservicio
(
    uuid         varchar(100)                        not null
        primary key,
    creadoEn     timestamp default CURRENT_TIMESTAMP not null,
    estado       varchar(100)                        not null,
    descripcion  varchar(200)                        not null,
    fecha        date                                not null,
    uuidServicio varchar(100)                        not null,
    uuidVisita   varchar(100)                        not null,
    constraint observacionservicio_ibfk_1
        foreign key (uuidServicio) references servicioproyecto (uuid),
    constraint observacionservicio_ibfk_2
        foreign key (uuidVisita) references visitaproyecto (uuid)
);

create index uuidServicio
    on observacionservicio (uuidServicio);

create index uuidVisita
    on observacionservicio (uuidVisita);


create table opinionproducto
(
    uuid         varchar(100)                         not null
        primary key,
    creadoEn     timestamp  default CURRENT_TIMESTAMP not null,
    titulo       varchar(300)                         not null,
    descripcion  varchar(1000)                        not null,
    estado       tinyint(1) default 0                 not null,
    verificado   tinyint(1) default 0                 not null,
    puntuacion   int                                  not null,
    uuidProducto varchar(100)                         not null,
    uuidCliente  varchar(100)                         not null,
    constraint opinionproducto_ibfk_1
        foreign key (uuidProducto) references producto (uuid),
    constraint opinionproducto_ibfk_2
        foreign key (uuidCliente) references usuario (uuid)
);

create index uuidCliente
    on opinionproducto (uuidCliente);

create index uuidProducto
    on opinionproducto (uuidProducto);

INSERT INTO mendozarq.opinionproducto (uuid, creadoEn, titulo, descripcion, estado, verificado, puntuacion, uuidProducto, uuidCliente) VALUES ('1645fe26-2fc4-41a1-8577-3a5b46033a44', '2021-11-13 22:33:36', 'gfdgdfgdf', 'dfgfdgfdtgfdgdfgfdgdfgfdg', 0, 0, 5, '2efa9682-8c1b-40c2-aa31-b5c1e1622a18', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72');
INSERT INTO mendozarq.opinionproducto (uuid, creadoEn, titulo, descripcion, estado, verificado, puntuacion, uuidProducto, uuidCliente) VALUES ('928acd46-7c45-4261-9dbc-deeda5462c87', '2021-11-13 22:32:11', 'hgfhgfhgfhfg', 'hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh', 0, 0, 5, '2efa9682-8c1b-40c2-aa31-b5c1e1622a18', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72');
INSERT INTO mendozarq.opinionproducto (uuid, creadoEn, titulo, descripcion, estado, verificado, puntuacion, uuidProducto, uuidCliente) VALUES ('b278f03c-9ed9-45c7-b884-240681031e22', '2021-11-13 22:32:04', 'hgfhgfhf', 'hgfhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh', 0, 0, 3, '2efa9682-8c1b-40c2-aa31-b5c1e1622a18', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72');
INSERT INTO mendozarq.opinionproducto (uuid, creadoEn, titulo, descripcion, estado, verificado, puntuacion, uuidProducto, uuidCliente) VALUES ('bd947bda-f094-4dae-9659-8c4c33561112', '2021-11-13 22:32:21', 'hgfhgfhgfhgfhfg', 'hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh', 0, 0, 2, '2efa9682-8c1b-40c2-aa31-b5c1e1622a18', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72');
INSERT INTO mendozarq.opinionproducto (uuid, creadoEn, titulo, descripcion, estado, verificado, puntuacion, uuidProducto, uuidCliente) VALUES ('e80a6222-10ee-4a72-a01f-37bef593c3bf', '2021-11-13 21:50:38', 'HGFHFGHGF', 'TWRETRETERTERTTRRETRETRETERRETRET', 0, 0, 5, '2efa9682-8c1b-40c2-aa31-b5c1e1622a18', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72');
create table participantevisita
(
    uuid               varchar(100)                        not null
        primary key,
    creadoEn           timestamp default CURRENT_TIMESTAMP not null,
    uuidVisitaProyecto varchar(100)                        not null,
    uuidUsuario        varchar(100)                        not null,
    constraint participantevisita_ibfk_1
        foreign key (uuidVisitaProyecto) references visitaproyecto (uuid),
    constraint participantevisita_ibfk_2
        foreign key (uuidUsuario) references usuario (uuid)
);

create index uuidUsuario
    on participantevisita (uuidUsuario);

create index uuidVisitaProyecto
    on participantevisita (uuidVisitaProyecto);

INSERT INTO mendozarq.participantevisita (uuid, creadoEn, uuidVisitaProyecto, uuidUsuario) VALUES ('22a429e8-3391-4001-9dec-810af99a6827', '2021-10-23 14:24:15', 'c801adaa-7e93-42fe-80bd-1d2b7299fc5f', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72');
INSERT INTO mendozarq.participantevisita (uuid, creadoEn, uuidVisitaProyecto, uuidUsuario) VALUES ('4da6cbae-62af-4b75-ae98-ed16a34e9016', '2021-10-27 22:02:12', 'c801adaa-7e93-42fe-80bd-1d2b7299fc5f', '85d04b79-fa0d-4ae6-8cb2-5f059dd2e2c9');
INSERT INTO mendozarq.participantevisita (uuid, creadoEn, uuidVisitaProyecto, uuidUsuario) VALUES ('dd6d377d-b375-44c9-aee1-815d6da6db4a', '2021-10-20 13:54:53', '938ae24a-97e2-4828-aba2-5b8e20c52579', '85d04b79-fa0d-4ae6-8cb2-5f059dd2e2c9');
INSERT INTO mendozarq.participantevisita (uuid, creadoEn, uuidVisitaProyecto, uuidUsuario) VALUES ('e3bbd41c-9103-4c78-b014-3163575fd711', '2021-10-20 13:54:53', '938ae24a-97e2-4828-aba2-5b8e20c52579', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72');
create table personal
(
    uuid            varchar(100)                        not null
        primary key,
    creadoEn        timestamp default CURRENT_TIMESTAMP not null,
    nombre          varchar(50)                         not null,
    apellidoPaterno varchar(50)                         not null,
    apellidoMaterno varchar(50)                         null,
    celular         int                                 null,
    direccion       text                                null,
    correo          varchar(100)                        null,
    descripcion     varchar(200)                        null,
    sueldo          decimal(15, 2)                      null,
    moneda          varchar(10)                         null,
    activo          tinyint(1)                          not null
);

INSERT INTO mendozarq.personal (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo, descripcion, sueldo, moneda, activo) VALUES ('0cdca13f-175a-4ed0-8320-650f65bf9167', '2021-10-07 21:21:17', 'juan', 'perez ', 'mendez', 7762509, 'avenida aroma entre calle nose y avenida alguna ', 'suarez@gmail.com', 'personal de construccion de obras', 10000.00, 'bs', 1);
create table personalproyecto
(
    uuid         varchar(100)                        not null
        primary key,
    creadoEn     timestamp default CURRENT_TIMESTAMP not null,
    uuidProyecto varchar(100)                        not null,
    uuidPersonal varchar(100)                        not null,
    constraint personalproyecto_ibfk_1
        foreign key (uuidProyecto) references proyecto (uuid),
    constraint personalproyecto_ibfk_2
        foreign key (uuidPersonal) references personal (uuid)
);

create index uuidPersonal
    on personalproyecto (uuidPersonal);

create index uuidProyecto
    on personalproyecto (uuidProyecto);

INSERT INTO mendozarq.personalproyecto (uuid, creadoEn, uuidProyecto, uuidPersonal) VALUES ('82c20722-2396-4833-ada5-ce12e84a5e14', '2021-10-20 13:54:20', '5c2f359b-e272-455f-8844-120ac877df62', '0cdca13f-175a-4ed0-8320-650f65bf9167');
create table presupuestoobra
(
    uuid        varchar(100)                             not null
        primary key,
    creadoEn    timestamp      default CURRENT_TIMESTAMP not null,
    nombre      varchar(100)                             not null,
    descripcion varchar(200)                             not null,
    fecha       date                                     not null,
    iva         decimal(12, 2)                           null,
    total       decimal(12, 2) default 0.00              null,
    uuidCliente varchar(100)                             not null,
    uuidUsuario varchar(100)                             not null,
    constraint presupuestoobra_ibfk_1
        foreign key (uuidCliente) references usuario (uuid),
    constraint presupuestoobra_ibfk_2
        foreign key (uuidUsuario) references usuario (uuid)
);

create index uuidCliente
    on presupuestoobra (uuidCliente);

create index uuidUsuario
    on presupuestoobra (uuidUsuario);

INSERT INTO mendozarq.presupuestoobra (uuid, creadoEn, nombre, descripcion, fecha, iva, total, uuidCliente, uuidUsuario) VALUES ('25cf79ba-e78c-44bd-b82c-f8fcdde9a2fa', '2021-10-07 21:56:10', 'trump tower', 'dasdasds asdsadaqs asaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '2021-10-07', 5.00, 0.00, '56566109-e477-436b-8765-b533467e1978', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72');
INSERT INTO mendozarq.presupuestoobra (uuid, creadoEn, nombre, descripcion, fecha, iva, total, uuidCliente, uuidUsuario) VALUES ('afc7ad9f-b6c1-47b6-a29b-5f22d8691e84', '2021-10-27 22:03:24', 'jdhdsjhfds', 'fdsfds', '2021-10-27', 0.00, 0.00, 'b91e93e4-6ff4-4ad9-a2ef-10d496618e22', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72');
create table presupuestoproyecto
(
    uuid                varchar(100)                        not null
        primary key,
    creadoEn            timestamp default CURRENT_TIMESTAMP not null,
    uuidPresupuestoObra varchar(100)                        not null,
    uuidProyecto        varchar(100)                        not null,
    constraint presupuestoproyecto_ibfk_1
        foreign key (uuidPresupuestoObra) references presupuestoobra (uuid),
    constraint presupuestoproyecto_ibfk_2
        foreign key (uuidProyecto) references proyecto (uuid)
);

create index uuidPresupuestoObra
    on presupuestoproyecto (uuidPresupuestoObra);

create index uuidProyecto
    on presupuestoproyecto (uuidProyecto);


create table producto
(
    uuid        varchar(100)                             not null
        primary key,
    creadoEn    timestamp      default CURRENT_TIMESTAMP not null,
    nombre      varchar(300)                             not null,
    descripcion varchar(1000)                            null,
    precio      decimal(15, 2)                           not null,
    moneda      varchar(5)     default 'Bs.'             not null,
    stock       int                                      not null,
    descuento   decimal(15, 2) default 0.00              null,
    estado      tinyint(1)                               not null,
    constraint nombre
        unique (nombre)
);

INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('2a0a3ed3-4a86-43da-b27c-142f7cf5f5a6', '2021-10-30 15:40:29', 'ggfsd fddsfdsffds', 'fsdfsdfds', 0.00, 'Bs.', 1, 0.00, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('2efa9682-8c1b-40c2-aa31-b5c1e1622a18', '2021-11-02 14:30:36', 'Extra Large Panda Desk Pad/Mat with Stitched Edges (Varmilo) editado', '
Lorem ipsum dolor sit amet consectetur adipisicing elit. Qui ipsam molestiae neque? Aperiam quas iste hic porro. Quae asperiores beatae eius. Maxime ab suscipit sapiente libero sint atque culpa facilis.
Lorem ipsum dolor sit amet consectetur adipisicing elit. Qui ipsam molestiae
neque? Aperiam quas iste hic porro. Quae asperiores beatae eius. Maxime ab
suscipit sapiente libero sint atque culpa facilis.', 200.00, 'Bs.', 2, 5.00, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('5ce1487f-0c79-47a4-800b-1633b3bfb86b', '2021-10-27 22:05:29', 'new producto gg', 'esta es una descripcion', 6.00, 'Bs.', 7, 0.00, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('79635f9a-fa0c-43b1-af13-005e3a542116', '2021-10-30 15:40:07', 'dsadsadsadasdasdsadddddddddddddddddddddddddddddddddddddddddd', 'dsadsa', 0.00, 'Bs.', 2, 0.00, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('a97f2d68-7c06-4867-b742-24311e10d99f', '2021-10-30 15:44:00', 'Consectetur omnis aut eaque provident et quia ut nostrum sed. Qui est enim alias est reiciendis ', 'The Nagasaki Lander is the trademarked name of several series of Nagasaki sport bikes, that started with the 1984 ABC800J', 50.00, 'Bs.', 3, 0.00, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('a9cfd083-4f53-48b9-ad5f-a85705213c00', '2021-10-30 13:14:56', 'puerta de madera de roble oscuro tallado por los dioses en el olimpo', 'esta es una descripcion de prueba para mostrar una descripcion xd.', 700.00, 'Bs.', 4, 0.00, 1);
INSERT INTO mendozarq.producto (uuid, creadoEn, nombre, descripcion, precio, moneda, stock, descuento, estado) VALUES ('da1c33fa-7da9-454b-8741-80406655d591', '2021-10-30 15:37:55', 'this is a new product', 'dsadsa', 0.00, 'Bs.', 0, 0.00, 1);
create table proyecto
(
    uuid          varchar(100)                        not null
        primary key,
    creadoEn      timestamp default CURRENT_TIMESTAMP not null,
    nombre        varchar(50)                         not null,
    descripcion   varchar(200)                        null,
    categoria     varchar(100)                        not null,
    estado        tinyint(1)                          not null,
    fechaInicio   date                                null,
    fechaFinal    date                                null,
    lugarProyecto varchar(200)                        null,
    porcentaje    int                                 null,
    uuidCliente   varchar(100)                        null,
    constraint proyecto_ibfk_1
        foreign key (uuidCliente) references usuario (uuid)
);

create index uuidCliente
    on proyecto (uuidCliente);

INSERT INTO mendozarq.proyecto (uuid, creadoEn, nombre, descripcion, categoria, estado, fechaInicio, fechaFinal, lugarProyecto, porcentaje, uuidCliente) VALUES ('5c2f359b-e272-455f-8844-120ac877df62', '2021-10-07 21:22:59', 'trump tower dsfasdas asdasdasdasasdsada', 'este proyecto esta en colaboracion con la constructora mendoza', 'construccion', 1, '2021-10-21', '2022-05-31', 'avenida trump entre simon lopez y alguna calle', 0, 'b91e93e4-6ff4-4ad9-a2ef-10d496618e22');
create table servicioproyecto
(
    uuid         varchar(100)                        not null
        primary key,
    creadoEn     timestamp default CURRENT_TIMESTAMP not null,
    nombre       varchar(50)                         not null,
    descripcion  varchar(200)                        null,
    avance       int                                 not null,
    fechaInicio  date                                not null,
    fechaFinal   date                                not null,
    uuidProyecto varchar(100)                        not null,
    constraint servicioproyecto_ibfk_1
        foreign key (uuidProyecto) references proyecto (uuid)
);

create index uuidProyecto
    on servicioproyecto (uuidProyecto);


create table usuario
(
    uuid            varchar(100)                        not null
        primary key,
    creadoEn        timestamp default CURRENT_TIMESTAMP not null,
    nombre          varchar(50)                         not null,
    apellidoPaterno varchar(50)                         not null,
    apellidoMaterno varchar(50)                         null,
    celular         int                                 null,
    direccion       text                                null,
    correo          varchar(100)                        null,
    username        varchar(50)                         not null,
    contrasenha     varchar(100)                        not null,
    rol             varchar(20)                         not null,
    activo          tinyint(1)                          not null
);

INSERT INTO mendozarq.usuario (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo, username, contrasenha, rol, activo) VALUES ('56566109-e477-436b-8765-b533467e1978', '2021-10-07 21:14:31', 'donald john', 'trump', '', 66666666, 'trump avenue', 'me@trump.com', 'donalv8bci', '$2b$10$Spnhl31zyj36z8jQzR1v0OxYrpn4mKLIcA95D/ydSh83UCglcVLZO', 'cliente', 1);
INSERT INTO mendozarq.usuario (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo, username, contrasenha, rol, activo) VALUES ('623738f6-1a82-47d3-b3ee-f3eb86291a15', '2021-11-10 21:35:00', 'hilaria', 'adima', '', 0, '', 'email@gmail.com', 'hilar3j2g6', '$2b$10$dxVq0g4CZBwpXae3eEvbIefq88BIsdnHe5Eno70i2Bx87ZVFRVtnG', 'cliente', 1);
INSERT INTO mendozarq.usuario (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo, username, contrasenha, rol, activo) VALUES ('6d4b0974-7dc5-4a30-8a1e-b09d744b0cb6', '2021-10-07 21:16:40', 'sergio', 'andia', 'fernandez', 76890903, 'avenida tercera entre simon lopez y circunvalacion', 'fernandez@gmail.com', 'sergio2kpx', '$2b$10$ehA8BkNDH2VkUBjrAsUu5u6y/dIYgh63df8.zINouhuDiC43Xh5/y', 'vendedor', 1);
INSERT INTO mendozarq.usuario (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo, username, contrasenha, rol, activo) VALUES ('85d04b79-fa0d-4ae6-8cb2-5f059dd2e2c9', '2021-10-07 21:15:26', 'henry', 'barboza', 'suarez', 59789446, 'avenida ecologica entre daniel salamanca y siempre viva', 'suarezzzzzzzzzzzzzzzzzzzzzzzz@gmail.com', 'henry6ddi2', '$2b$10$lenLu6Xfv9pG5uK.pmuDTecviVUEz4lSzYLTVxcOlxw9jrgb6BVKW', 'arquitecto', 1);
INSERT INTO mendozarq.usuario (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo, username, contrasenha, rol, activo) VALUES ('b6ef4ba4-1b2f-47c0-88c7-bb05ecba81d8', '2021-11-09 21:26:02', 'bladimir', 'medrano', 'vargas', 4444444, '', 'bladimir@gmail.com', 'blado9595', '', 'cliente', 1);
INSERT INTO mendozarq.usuario (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo, username, contrasenha, rol, activo) VALUES ('b91e93e4-6ff4-4ad9-a2ef-10d496618e22', '2021-10-07 21:17:50', 'hilaria adima', 'vasquez', 'duran', 7688963, 'avenida la paz entre totora y venezuela n445', 'adima123@hotmail.com', 'hilarvaxeo', '$2b$10$/BZHtfOBLP4iE7bQp5XtYuq0zLgu7yFG6VXgpnshZeC6s8a7xiww6', 'cliente', 1);
INSERT INTO mendozarq.usuario (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo, username, contrasenha, rol, activo) VALUES ('fa27b5b3-837b-4486-b2cd-c6a306e8bd72', '2021-01-12 19:45:41', 'bladimir', 'medrano', 'vargas', 69509449, 'Av segunda entre marina nunez del prado y calle greco.cxz', 'example@gmail.com', 'blado959', '$2b$10$azGau1JLmisDRH2QDjVkY.Yr9ln1y4pvfH76OlKNgwweRVOt8MJzu', 'administrador', 1);
create table usuarioproyecto
(
    uuid         varchar(100)                        not null
        primary key,
    creadoEn     timestamp default CURRENT_TIMESTAMP not null,
    uuidProyecto varchar(100)                        not null,
    uuidUsuario  varchar(100)                        not null,
    constraint usuarioproyecto_ibfk_1
        foreign key (uuidProyecto) references proyecto (uuid),
    constraint usuarioproyecto_ibfk_2
        foreign key (uuidUsuario) references usuario (uuid)
);

create index uuidProyecto
    on usuarioproyecto (uuidProyecto);

create index uuidUsuario
    on usuarioproyecto (uuidUsuario);

INSERT INTO mendozarq.usuarioproyecto (uuid, creadoEn, uuidProyecto, uuidUsuario) VALUES ('1912cdc7-982a-4762-8c06-f0c31a583c72', '2021-10-23 14:23:04', '5c2f359b-e272-455f-8844-120ac877df62', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72');
INSERT INTO mendozarq.usuarioproyecto (uuid, creadoEn, uuidProyecto, uuidUsuario) VALUES ('33ffee18-7a71-45ed-b9ae-7504f4d04414', '2021-10-23 14:23:04', '5c2f359b-e272-455f-8844-120ac877df62', '85d04b79-fa0d-4ae6-8cb2-5f059dd2e2c9');
create table visitaproyecto
(
    uuid            varchar(100)                        not null
        primary key,
    creadoEn        timestamp default CURRENT_TIMESTAMP not null,
    nombre          varchar(50)                         not null,
    faseDelProyecto varchar(100)                        not null,
    descripcion     varchar(200)                        null,
    fecha           timestamp default CURRENT_TIMESTAMP not null,
    uuidProyecto    varchar(100)                        not null,
    constraint visitaproyecto_ibfk_1
        foreign key (uuidProyecto) references proyecto (uuid)
);

create index uuidProyecto
    on visitaproyecto (uuidProyecto);

INSERT INTO mendozarq.visitaproyecto (uuid, creadoEn, nombre, faseDelProyecto, descripcion, fecha, uuidProyecto) VALUES ('938ae24a-97e2-4828-aba2-5b8e20c52579', '2021-10-07 22:01:12', 'fdsfsd', 'fsdfsdddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd', 'fsdfsdfdddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd', '2021-10-07 03:06:00', '5c2f359b-e272-455f-8844-120ac877df62');
INSERT INTO mendozarq.visitaproyecto (uuid, creadoEn, nombre, faseDelProyecto, descripcion, fecha, uuidProyecto) VALUES ('c801adaa-7e93-42fe-80bd-1d2b7299fc5f', '2021-10-22 10:50:49', 'ewrew', 'rewr', 'erwrwe', '2021-10-22 10:54:00', '5c2f359b-e272-455f-8844-120ac877df62');