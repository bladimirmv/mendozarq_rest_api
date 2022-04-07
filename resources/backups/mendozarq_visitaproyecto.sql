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

INSERT INTO mendozarq.visitaproyecto (uuid, creadoEn, estado, nombre, faseDelProyecto, descripcion, fecha, uuidProyecto) VALUES ('2cf386a1-5f32-4996-952a-75f758757c44', '2022-04-02 22:10:42', 1, 'ddddddd', 'Azotado de concreto c/hidrófugo <=> Aserrado y demolic. Piso sobrepuesto sector Presala esp. 0,20', '', '2022-04-07 22:10:00', '8ee6d457-1315-4c9b-bfae-7d7e04ac75a8');
INSERT INTO mendozarq.visitaproyecto (uuid, creadoEn, estado, nombre, faseDelProyecto, descripcion, fecha, uuidProyecto) VALUES ('38fc4888-69d9-4b9a-bbc5-7858f640334c', '2021-12-20 21:45:38', 1, 'dasdsadas', 'dsadsadsad <=> Aperiam debitis cum <=> dsadas', 'dasdsad', '2021-12-20 02:50:00', '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.visitaproyecto (uuid, creadoEn, estado, nombre, faseDelProyecto, descripcion, fecha, uuidProyecto) VALUES ('4dae56e6-9536-4750-850d-95d2e56263e3', '2022-04-02 22:26:08', 0, 'dsadsa', 'dassd', 'dasdas', '2022-03-30 22:26:00', '8ee6d457-1315-4c9b-bfae-7d7e04ac75a8');
INSERT INTO mendozarq.visitaproyecto (uuid, creadoEn, estado, nombre, faseDelProyecto, descripcion, fecha, uuidProyecto) VALUES ('e5c685d4-a547-4adf-91d1-41d012a5e3ed', '2022-04-03 01:22:39', 0, 'nuevo', 'Aserrado y demolic. Piso sobrepuesto sector Presala esp. 0,20 <=> Azotado de concreto c/hidrófugo <=> avances', '', '2022-04-08 01:22:00', '8ee6d457-1315-4c9b-bfae-7d7e04ac75a8');
