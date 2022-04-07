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

INSERT INTO mendozarq.documentoproyecto (uuid, creadoEn, nombre, keyName, location, fechaCreacion, uuidProyecto, size, path) VALUES ('083fe6e4-aea9-4b65-883c-66384a0a0d43', '2022-02-17 14:44:44', 'moon-river-mountains-gradient-background-blue-night-cold-3440x1440-2527.jpg', 'mendozarq/documents/6f4715f4-a2d1-47fa-8895-96a06ddb2267.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/mendozarq/documents/6f4715f4-a2d1-47fa-8895-96a06ddb2267.jpg', '2022-02-17', '13f3af68-d552-4c54-bde6-816f474dd4ec', 521587, 'root');
INSERT INTO mendozarq.documentoproyecto (uuid, creadoEn, nombre, keyName, location, fechaCreacion, uuidProyecto, size, path) VALUES ('0e62490b-8444-48d1-80f0-0994595574bf', '2022-02-14 10:49:30', 'how-to-extract-img-files-in-windows-10-thumb-bzxI4IDgg.jpg', 'mendozarq/documents/98559927-c666-4cbf-b9df-be7033e77428.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/mendozarq/documents/98559927-c666-4cbf-b9df-be7033e77428.jpg', '2022-02-14', '13f3af68-d552-4c54-bde6-816f474dd4ec', 13952, 'root');
INSERT INTO mendozarq.documentoproyecto (uuid, creadoEn, nombre, keyName, location, fechaCreacion, uuidProyecto, size, path) VALUES ('32db189a-2d87-45ff-9eb4-7a8cf78b2d17', '2022-02-17 14:44:43', 'how-to-extract-img-files-in-windows-10-thumb-bzxI4IDgg.jpg', 'mendozarq/documents/aa558844-94d0-43f4-b3b9-7e480c1588a3.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/mendozarq/documents/aa558844-94d0-43f4-b3b9-7e480c1588a3.jpg', '2022-02-17', '13f3af68-d552-4c54-bde6-816f474dd4ec', 13952, 'root');
INSERT INTO mendozarq.documentoproyecto (uuid, creadoEn, nombre, keyName, location, fechaCreacion, uuidProyecto, size, path) VALUES ('808d6b68-db2f-46d9-b58a-fdd522da1fee', '2021-12-20 12:14:49', 'mendo.jpg', 'mendozarq/documents/d6c59c23-c197-4bdb-8a94-3caf2b5c9a5b.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/mendozarq/documents/d6c59c23-c197-4bdb-8a94-3caf2b5c9a5b.jpg', '2021-12-20', '13f3af68-d552-4c54-bde6-816f474dd4ec', 1206600, 'root');
INSERT INTO mendozarq.documentoproyecto (uuid, creadoEn, nombre, keyName, location, fechaCreacion, uuidProyecto, size, path) VALUES ('bfb76376-e2bb-4dd7-8e0f-f76929851462', '2021-12-20 12:14:47', 'planos_mendozarq.docx', 'mendozarq/documents/aa1f0fed-602b-4020-bce6-22dbcb85beda.docx', 'https://mendozarq-liraki-s3.s3.amazonaws.com/mendozarq/documents/aa1f0fed-602b-4020-bce6-22dbcb85beda.docx', '2021-12-20', '13f3af68-d552-4c54-bde6-816f474dd4ec', 493516, 'root');
INSERT INTO mendozarq.documentoproyecto (uuid, creadoEn, nombre, keyName, location, fechaCreacion, uuidProyecto, size, path) VALUES ('c0a0e27c-66b2-4e18-9326-1977b5b05412', '2021-12-29 23:29:59', 'capitulopresupuesto.sql', 'mendozarq/documents/07f500f3-fe8b-4ad7-93f0-a9ff585c2202.sql', 'https://mendozarq-liraki-s3.s3.amazonaws.com/mendozarq/documents/07f500f3-fe8b-4ad7-93f0-a9ff585c2202.sql', '2021-12-29', '13f3af68-d552-4c54-bde6-816f474dd4ec', 621, 'folder');
INSERT INTO mendozarq.documentoproyecto (uuid, creadoEn, nombre, keyName, location, fechaCreacion, uuidProyecto, size, path) VALUES ('e473dae9-134f-42a2-9fb8-4c3a45677337', '2021-12-20 12:14:46', 'planos_mendozarq.pdf', 'mendozarq/documents/dd0577b0-c920-49d2-aa82-4038ce1a6756.pdf', 'https://mendozarq-liraki-s3.s3.amazonaws.com/mendozarq/documents/dd0577b0-c920-49d2-aa82-4038ce1a6756.pdf', '2021-12-20', '13f3af68-d552-4c54-bde6-816f474dd4ec', 257333, 'root');
INSERT INTO mendozarq.documentoproyecto (uuid, creadoEn, nombre, keyName, location, fechaCreacion, uuidProyecto, size, path) VALUES ('f9b1df7a-8e17-4317-95fb-cef1bbe7c9c1', '2021-12-20 15:22:24', '8-7_LA1-548737959_05.webm', 'mendozarq/documents/4effe6ec-c639-4c79-850b-114f215cf4f3.webm', 'https://mendozarq-liraki-s3.s3.amazonaws.com/mendozarq/documents/4effe6ec-c639-4c79-850b-114f215cf4f3.webm', '2021-12-20', '13f3af68-d552-4c54-bde6-816f474dd4ec', 6888705, 'root');
