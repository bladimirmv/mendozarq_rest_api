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
    uuidCapitulo varchar(100)                           not null,
    constraint tareaplanificacionproyecto_ibfk_1
        foreign key (uuidCapitulo) references capituloplanificacionproyecto (uuid)
            on delete cascade
);

create index uuidCapitulo
    on tareaplanificacionproyecto (uuidCapitulo);

INSERT INTO mendozarq.tareaplanificacionproyecto (uuid, creadoEn, nombre, fechaInicio, fechaFinal, avance, dependencia, hito, color, uuidCapitulo) VALUES ('962f6dcd-4565-4c0b-93a2-8dc309b337a2', '2022-02-11 13:28:37', ' Aperiam debitis cum', '2022-04-21', '2022-04-30', 0, '46b085fd-dc1a-41ac-84f0-e1f6391be86d', 1, '', '3e5eb62b-388f-4ca2-b40f-afce49edd08a');
INSERT INTO mendozarq.tareaplanificacionproyecto (uuid, creadoEn, nombre, fechaInicio, fechaFinal, avance, dependencia, hito, color, uuidCapitulo) VALUES ('f6eedf06-6da0-4a96-8616-25867d9332f9', '2022-02-17 14:57:32', 'dsadas', '2022-02-09', '2022-02-28', 41, '962f6dcd-4565-4c0b-93a2-8dc309b337a2', 0, '#05ff09', '3e5eb62b-388f-4ca2-b40f-afce49edd08a');
