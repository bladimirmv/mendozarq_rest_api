create table carpetaproyecto
(
    uuid          varchar(100)                          not null
        primary key,
    creadoEn      timestamp default current_timestamp() not null,
    nombre        varchar(50)                           null,
    fechaCreacion date                                  null,
    uuidProyecto  varchar(100)                          not null,
    constraint carpetaproyecto_ibfk_1
        foreign key (uuidProyecto) references proyecto (uuid)
);

create index uuidProyecto
    on carpetaproyecto (uuidProyecto);

INSERT INTO mendozarq.carpetaproyecto (uuid, creadoEn, nombre, fechaCreacion, uuidProyecto) VALUES ('98c78ef9-5c65-4249-ab27-62df5d3d27d4', '2022-06-28 23:06:44', 'diseños estructurales', '2022-06-29', '92914a40-8a91-495b-9b6a-b46c491c317e');
INSERT INTO mendozarq.carpetaproyecto (uuid, creadoEn, nombre, fechaCreacion, uuidProyecto) VALUES ('b3573cb1-ba18-4e8f-9b94-dd73dfaef11b', '2022-06-28 23:06:09', 'planos', '2022-06-29', '92914a40-8a91-495b-9b6a-b46c491c317e');
