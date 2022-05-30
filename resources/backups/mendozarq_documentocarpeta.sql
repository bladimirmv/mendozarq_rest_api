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

