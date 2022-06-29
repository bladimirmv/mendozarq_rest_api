create table tareaplanificacionproyecto
(
    uuid         varchar(100)                           not null
        primary key,
    creadoEn     timestamp  default current_timestamp() not null,
    nombre       varchar(200)                           not null,
    fechaInicio  date                                   null,
    fechaFinal   date                                   null,
    avance       int                                    null,
    dependencia  varchar(100)                           null,
    hito         tinyint(1) default 0                   null,
    color        text                                   null,
    actividades  text                                   null,
    uuidCapitulo varchar(100)                           not null,
    constraint tareaplanificacionproyecto_ibfk_1
        foreign key (uuidCapitulo) references capituloplanificacionproyecto (uuid)
            on delete cascade
);

create index uuidCapitulo
    on tareaplanificacionproyecto (uuidCapitulo);

INSERT INTO mendozarq.tareaplanificacionproyecto (uuid, creadoEn, nombre, fechaInicio, fechaFinal, avance, dependencia, hito, color, actividades, uuidCapitulo) VALUES ('06a1575e-2b0e-4c4a-8244-650801955ba3', '2022-06-29 06:40:19', 'Revoque grueso bajo revestimiento', '2022-06-30', '2022-10-07', 17, '', 0, '', '<li _ngcontent-gjx-c316="">Limpieza del lugar</li><li _ngcontent-gjx-c316=""><font color="#ff0000">Preparacion de la estructura</font></li><li _ngcontent-gjx-c316="">Fijar revestimientos&nbsp;</li><li _ngcontent-gjx-c316="">Acentamiento estructural de la obra</li>', 'f214a429-cb99-4add-80ad-21fb58265f33');
INSERT INTO mendozarq.tareaplanificacionproyecto (uuid, creadoEn, nombre, fechaInicio, fechaFinal, avance, dependencia, hito, color, actividades, uuidCapitulo) VALUES ('196856a7-6140-4894-b814-c836d7e4f087', '2022-06-28 22:56:42', 'Des. principal norte', '2022-08-17', '2022-08-17', 0, '', 1, '', '<li _ngcontent-lhs-c316="">Ninguno</li>', '181ef3be-cb84-4970-bf75-3133491ff01b');
INSERT INTO mendozarq.tareaplanificacionproyecto (uuid, creadoEn, nombre, fechaInicio, fechaFinal, avance, dependencia, hito, color, actividades, uuidCapitulo) VALUES ('1f7b81da-6c69-4408-bad5-8f811df64ad6', '2022-06-29 13:48:40', 'Mortero de nivelación', '2022-08-03', '2022-10-01', 21, '765ba8f5-f85e-4809-b32f-f88bb2e36626', 0, '#edfd17', '<li _ngcontent-ynw-c356="">Ninguno</li>', 'f214a429-cb99-4add-80ad-21fb58265f33');
INSERT INTO mendozarq.tareaplanificacionproyecto (uuid, creadoEn, nombre, fechaInicio, fechaFinal, avance, dependencia, hito, color, actividades, uuidCapitulo) VALUES ('439c5d6f-a52b-4687-aca9-af6bdac89c10', '2022-06-28 23:00:33', 'Conexión y empalme a cámara existente.', '2022-07-19', '2022-07-31', 20, '', 0, '', '<li _ngcontent-lhs-c316="">Ninguno</li>', '66e129e4-774f-479d-9da7-dc5763ac6ec1');
INSERT INTO mendozarq.tareaplanificacionproyecto (uuid, creadoEn, nombre, fechaInicio, fechaFinal, avance, dependencia, hito, color, actividades, uuidCapitulo) VALUES ('765ba8f5-f85e-4809-b32f-f88bb2e36626', '2022-06-29 06:54:38', 'Desmontar frente 3,10x3,70', '2022-07-21', '2022-09-07', 100, '', 0, '', '<li _ngcontent-lhs-c316="">Ninguno</li>', 'f214a429-cb99-4add-80ad-21fb58265f33');
