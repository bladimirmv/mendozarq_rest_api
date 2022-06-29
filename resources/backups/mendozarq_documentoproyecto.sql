create table documentoproyecto
(
    uuid          varchar(100)                          not null
        primary key,
    creadoEn      timestamp default current_timestamp() not null,
    nombre        text                                  not null,
    keyName       text                                  not null,
    location      text                                  not null,
    fechaCreacion date                                  not null,
    uuidProyecto  varchar(100)                          not null,
    size          int                                   not null,
    path          varchar(10)                           not null,
    constraint documentoproyecto_ibfk_1
        foreign key (uuidProyecto) references proyecto (uuid)
);

create index uuidProyecto
    on documentoproyecto (uuidProyecto);

INSERT INTO mendozarq.documentoproyecto (uuid, creadoEn, nombre, keyName, location, fechaCreacion, uuidProyecto, size, path) VALUES ('0643c1b9-81a8-4d51-9784-fc5eb08cfdf4', '2022-06-28 23:12:17', '48c21595-0e3c-4343-8c4e-1e409d30983c.jpg', 'mendozarq/documents/431e5ad8-561c-43ea-a59a-349d26cd4852.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/mendozarq/documents/431e5ad8-561c-43ea-a59a-349d26cd4852.jpg', '2022-06-28', '92914a40-8a91-495b-9b6a-b46c491c317e', 73342, 'folder');
INSERT INTO mendozarq.documentoproyecto (uuid, creadoEn, nombre, keyName, location, fechaCreacion, uuidProyecto, size, path) VALUES ('0e903802-9a9c-494c-be86-3f67bc4aa6af', '2022-06-28 23:11:40', 'cv.pdf', 'mendozarq/documents/804089eb-44d1-4519-9bcb-237b1b02745b.pdf', 'https://mendozarq-liraki-s3.s3.amazonaws.com/mendozarq/documents/804089eb-44d1-4519-9bcb-237b1b02745b.pdf', '2022-06-28', '92914a40-8a91-495b-9b6a-b46c491c317e', 43108, 'root');
INSERT INTO mendozarq.documentoproyecto (uuid, creadoEn, nombre, keyName, location, fechaCreacion, uuidProyecto, size, path) VALUES ('3797496e-d344-4427-9604-b2fa54360d5b', '2022-06-28 23:10:50', 'Arq. SD docs.docx', 'mendozarq/documents/1343e326-3b12-45a8-8780-e0cb98a3be3f.docx', 'https://mendozarq-liraki-s3.s3.amazonaws.com/mendozarq/documents/1343e326-3b12-45a8-8780-e0cb98a3be3f.docx', '2022-06-28', '92914a40-8a91-495b-9b6a-b46c491c317e', 11904, 'root');
INSERT INTO mendozarq.documentoproyecto (uuid, creadoEn, nombre, keyName, location, fechaCreacion, uuidProyecto, size, path) VALUES ('43e62589-3870-4dcd-8e16-184a2f007781', '2022-06-28 23:09:41', 'AsusSetup.ini', 'mendozarq/documents/48cdf36a-601e-4e2c-8c79-0c855838b35d.ini', 'https://mendozarq-liraki-s3.s3.amazonaws.com/mendozarq/documents/48cdf36a-601e-4e2c-8c79-0c855838b35d.ini', '2022-06-28', '92914a40-8a91-495b-9b6a-b46c491c317e', 652, 'root');
INSERT INTO mendozarq.documentoproyecto (uuid, creadoEn, nombre, keyName, location, fechaCreacion, uuidProyecto, size, path) VALUES ('56a73615-4747-420e-a07c-b0b6f986f66a', '2022-06-28 23:09:44', 'vs_community__864259fb84b54dc1b609f9d6cb102656.exe', 'mendozarq/documents/db56c814-735f-44ed-ac8e-781e623a4cf9.exe', 'https://mendozarq-liraki-s3.s3.amazonaws.com/mendozarq/documents/db56c814-735f-44ed-ac8e-781e623a4cf9.exe', '2022-06-28', '92914a40-8a91-495b-9b6a-b46c491c317e', 1649784, 'root');
INSERT INTO mendozarq.documentoproyecto (uuid, creadoEn, nombre, keyName, location, fechaCreacion, uuidProyecto, size, path) VALUES ('9d2fe0cd-28e0-4889-b0b4-c1cfcd96bcd1', '2022-06-28 23:12:17', 'Hellblade Senua’s Sacrifice.torrent', 'mendozarq/documents/d11fa2fe-d414-41b9-bc92-63ea859de5fe.torrent', 'https://mendozarq-liraki-s3.s3.amazonaws.com/mendozarq/documents/d11fa2fe-d414-41b9-bc92-63ea859de5fe.torrent', '2022-06-28', '92914a40-8a91-495b-9b6a-b46c491c317e', 38585, 'folder');
INSERT INTO mendozarq.documentoproyecto (uuid, creadoEn, nombre, keyName, location, fechaCreacion, uuidProyecto, size, path) VALUES ('a8cf4dd8-7c41-4049-955f-a22b4168311a', '2022-06-28 23:12:06', '48c21595-0e3c-4343-8c4e-1e409d30983c.jpg', 'mendozarq/documents/f0b88bea-168d-4b6b-b2bd-b6888a8122c2.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/mendozarq/documents/f0b88bea-168d-4b6b-b2bd-b6888a8122c2.jpg', '2022-06-28', '92914a40-8a91-495b-9b6a-b46c491c317e', 73342, 'folder');
INSERT INTO mendozarq.documentoproyecto (uuid, creadoEn, nombre, keyName, location, fechaCreacion, uuidProyecto, size, path) VALUES ('d3470258-7c82-467c-b6b9-0b44921d004d', '2022-06-28 23:09:41', 'Fredoka_One.zip', 'mendozarq/documents/8467a19e-bc25-4347-87b2-21a805d64d46.zip', 'https://mendozarq-liraki-s3.s3.amazonaws.com/mendozarq/documents/8467a19e-bc25-4347-87b2-21a805d64d46.zip', '2022-06-28', '92914a40-8a91-495b-9b6a-b46c491c317e', 23564, 'root');
INSERT INTO mendozarq.documentoproyecto (uuid, creadoEn, nombre, keyName, location, fechaCreacion, uuidProyecto, size, path) VALUES ('f25c3ed8-9a76-476a-9c5d-344505f4c943', '2022-06-28 23:09:42', '48c21595-0e3c-4343-8c4e-1e409d30983c.jpg', 'mendozarq/documents/fd19be5d-b451-413f-9977-0fe3063c7b32.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/mendozarq/documents/fd19be5d-b451-413f-9977-0fe3063c7b32.jpg', '2022-06-28', '92914a40-8a91-495b-9b6a-b46c491c317e', 73342, 'root');
