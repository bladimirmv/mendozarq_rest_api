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

INSERT INTO mendozarq.tareaplanificacionproyecto (uuid, creadoEn, nombre, fechaInicio, fechaFinal, avance, dependencia, hito, color, actividades, uuidCapitulo) VALUES ('707f1644-260c-4560-bd1a-58feedf97866', '2022-04-06 15:18:47', 'Azotado de concreto c/hidrófugo', '2022-04-11', '2022-04-30', 10, '', 0, '', '<li _ngcontent-urn-c316="">Ninguno</li>', 'c6bdce00-1b21-4e82-afe6-d0fd62eb33e1');
INSERT INTO mendozarq.tareaplanificacionproyecto (uuid, creadoEn, nombre, fechaInicio, fechaFinal, avance, dependencia, hito, color, actividades, uuidCapitulo) VALUES ('962f6dcd-4565-4c0b-93a2-8dc309b337a2', '2022-02-11 13:28:37', ' Aperiam debitis cum', '2022-04-21', '2022-04-30', 0, '46b085fd-dc1a-41ac-84f0-e1f6391be86d', 1, '', null, '3e5eb62b-388f-4ca2-b40f-afce49edd08a');
INSERT INTO mendozarq.tareaplanificacionproyecto (uuid, creadoEn, nombre, fechaInicio, fechaFinal, avance, dependencia, hito, color, actividades, uuidCapitulo) VALUES ('d5cad56e-992f-4fb1-a97b-177b3709a801', '2022-04-06 15:19:28', 'Aserrado y demolic. Piso sobrepuesto sector Presala esp. 0,20', '2022-04-27', '2022-04-30', 0, '707f1644-260c-4560-bd1a-58feedf97866', 0, '#01f979', '<li _ngcontent-urn-c316="">Ninguno</li>', 'c6bdce00-1b21-4e82-afe6-d0fd62eb33e1');
INSERT INTO mendozarq.tareaplanificacionproyecto (uuid, creadoEn, nombre, fechaInicio, fechaFinal, avance, dependencia, hito, color, actividades, uuidCapitulo) VALUES ('e1ad1b68-545d-4cde-8544-b67ceceba201', '2022-04-05 15:55:42', 'Llave de paso 1/2"', '2022-04-27', '2022-06-30', 90, '', 0, '#199a68', '<li _ngcontent-sjn-c315=""><font color="#425066">Lista 1</font></li><li _ngcontent-sjn-c315=""><font color="#425066">lorem <b><i><u>ipsum</u></i></b></font></li><li _ngcontent-sjn-c315=""><font color="#425066">no olvidar las llaves</font></li><li _ngcontent-sjn-c315=""><font color="#425066">kk</font></li><li>Nuevo<ol><li><font color="#425066">Sub</font></li></ol></li><li><font color="#ff0000"><b>Nuevo</b></font></li><li>Nuevo</li><ol><li>nuevo</li><li>agrando&nbsp;</li><li>desudada</li><li>desdás</li></ol><li>dadas</li><li>asd</li>', '3e5eb62b-388f-4ca2-b40f-afce49edd08a');
INSERT INTO mendozarq.tareaplanificacionproyecto (uuid, creadoEn, nombre, fechaInicio, fechaFinal, avance, dependencia, hito, color, actividades, uuidCapitulo) VALUES ('f6eedf06-6da0-4a96-8616-25867d9332f9', '2022-02-18 18:57:32', 'dsadas', '2022-02-09', '2022-02-28', 100, '962f6dcd-4565-4c0b-93a2-8dc309b337a2', 0, '#05ff09', '<li>Nuevo<ol><li>Sub</li></ol></li>', '3e5eb62b-388f-4ca2-b40f-afce49edd08a');
