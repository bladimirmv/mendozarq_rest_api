create table visitaproyecto
(
    uuid            varchar(100)                          not null
        primary key,
    creadoEn        timestamp default current_timestamp() not null,
    nombre          varchar(50)                           not null,
    faseDelProyecto varchar(100)                          not null,
    descripcion     varchar(200)                          null,
    fecha           timestamp default current_timestamp() not null,
    uuidProyecto    varchar(100)                          not null,
    constraint visitaproyecto_ibfk_1
        foreign key (uuidProyecto) references proyecto (uuid)
);

create index uuidProyecto
    on visitaproyecto (uuidProyecto);

INSERT INTO mendozarq.visitaproyecto (uuid, creadoEn, nombre, faseDelProyecto, descripcion, fecha, uuidProyecto) VALUES ('38fc4888-69d9-4b9a-bbc5-7858f640334c', '2021-12-20 21:45:38', 'dasdsadas', 'dsadsadsad', 'dasdsad', '2021-12-20 14:50:00', '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.visitaproyecto (uuid, creadoEn, nombre, faseDelProyecto, descripcion, fecha, uuidProyecto) VALUES ('fe83cb0a-1df6-4081-a8da-0311cb91541f', '2022-03-31 22:42:16', 'dsad', 'dsaddsa', 'dsada', '2022-03-31 13:45:00', '8ee6d457-1315-4c9b-bfae-7d7e04ac75a8');
