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

INSERT INTO mendozarq.documentocarpeta (uuid, creadoEn, uuidCarpeta, uuidDocumento) VALUES ('7b944c9a-45c5-4cad-8aa5-9ec7b9659db6', '2021-12-29 23:29:59', '4ac34ea3-a85a-49ba-a5e9-9c959e29dbd8', 'c0a0e27c-66b2-4e18-9326-1977b5b05412');
