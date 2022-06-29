create table visitaproyecto
(
    uuid            varchar(100)                           not null
        primary key,
    creadoEn        timestamp  default current_timestamp() not null,
    estado          tinyint(1) default 0                   null,
    nombre          varchar(50)                            not null,
    faseDelProyecto text                                   not null,
    descripcion     varchar(200)                           null,
    fecha           timestamp  default current_timestamp() not null,
    uuidProyecto    varchar(100)                           not null,
    constraint visitaproyecto_ibfk_1
        foreign key (uuidProyecto) references proyecto (uuid)
);

create index uuidProyecto
    on visitaproyecto (uuidProyecto);

INSERT INTO mendozarq.visitaproyecto (uuid, creadoEn, estado, nombre, faseDelProyecto, descripcion, fecha, uuidProyecto) VALUES ('2449f5ef-95fa-4d88-9050-5174ebdc30dd', '2022-06-29 09:17:43', 0, 'revision de desmontacion frente norte', 'Desmontar frente 3,10x3,70 <=> Conexión y empalme a cámara existente.', '', '2022-06-29 11:20:00', '92914a40-8a91-495b-9b6a-b46c491c317e');
INSERT INTO mendozarq.visitaproyecto (uuid, creadoEn, estado, nombre, faseDelProyecto, descripcion, fecha, uuidProyecto) VALUES ('7031a3f1-65c5-4afe-ace8-d208c94b60ba', '2022-06-28 23:04:09', 0, 'revision de avance de conexiones y revoques', 'Conexión y empalme a cámara existente. <=> Revoque grueso bajo revestimiento', '', '2022-08-06 04:09:00', '92914a40-8a91-495b-9b6a-b46c491c317e');
