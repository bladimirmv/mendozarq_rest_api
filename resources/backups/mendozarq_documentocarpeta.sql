create table documentocarpeta
(
    uuid          varchar(100)                          not null
        primary key,
    creadoEn      timestamp default current_timestamp() not null,
    uuidCarpeta   varchar(100)                          not null,
    uuidDocumento varchar(100)                          not null,
    constraint documentocarpeta_ibfk_1
        foreign key (uuidCarpeta) references carpetaproyecto (uuid),
    constraint documentocarpeta_ibfk_2
        foreign key (uuidDocumento) references documentoproyecto (uuid)
);

create index uuidCarpeta
    on documentocarpeta (uuidCarpeta);

create index uuidDocumento
    on documentocarpeta (uuidDocumento);

INSERT INTO mendozarq.documentocarpeta (uuid, creadoEn, uuidCarpeta, uuidDocumento) VALUES ('1ffcce77-bc31-4148-9866-934b0edd802a', '2022-06-28 23:12:17', '98c78ef9-5c65-4249-ab27-62df5d3d27d4', '9d2fe0cd-28e0-4889-b0b4-c1cfcd96bcd1');
INSERT INTO mendozarq.documentocarpeta (uuid, creadoEn, uuidCarpeta, uuidDocumento) VALUES ('5aefef4b-8158-4aa6-9f6e-69288f2c5377', '2022-06-28 23:12:17', '98c78ef9-5c65-4249-ab27-62df5d3d27d4', '0643c1b9-81a8-4d51-9784-fc5eb08cfdf4');
INSERT INTO mendozarq.documentocarpeta (uuid, creadoEn, uuidCarpeta, uuidDocumento) VALUES ('61643424-474c-43f8-bead-0702bcda33cd', '2022-06-28 23:12:06', 'b3573cb1-ba18-4e8f-9b94-dd73dfaef11b', 'a8cf4dd8-7c41-4049-955f-a22b4168311a');
