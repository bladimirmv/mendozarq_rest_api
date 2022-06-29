create definer = root@localhost view proyectowiew as
select `p`.`uuid`            AS `uuid`,
       `p`.`creadoEn`        AS `creadoEn`,
       `p`.`nombre`          AS `nombre`,
       `p`.`descripcion`     AS `descripcion`,
       `p`.`categoria`       AS `categoria`,
       `p`.`estado`          AS `estado`,
       `p`.`fechaInicio`     AS `fechaInicio`,
       `p`.`fechaFinal`      AS `fechaFinal`,
       `p`.`lugarProyecto`   AS `lugarProyecto`,
       `p`.`porcentaje`      AS `porcentaje`,
       `p`.`uuidCliente`     AS `uuidCliente`,
       `u`.`nombre`          AS `nombreCliente`,
       `u`.`apellidoPaterno` AS `apellidoPaterno`,
       `u`.`apellidoMaterno` AS `apellidoMaterno`
from (`mendozarq`.`proyecto` `p`
         join `mendozarq`.`usuario` `u` on (`p`.`uuidCliente` = `u`.`uuid`));

INSERT INTO mendozarq.proyectowiew (uuid, creadoEn, nombre, descripcion, categoria, estado, fechaInicio, fechaFinal, lugarProyecto, porcentaje, uuidCliente, nombreCliente, apellidoPaterno, apellidoMaterno) VALUES ('7eee2e9f-3c07-4b59-bf8a-366e4c81720e', '2022-06-28 22:26:00', 'Edificio Cabral', 'Centro de atencion al cliente de la empresa cabral', 'construccion', 1, '2022-11-25', '2023-03-15', 'Calle San juan de dios y avenida octava', 0, '942246e6-f202-47f9-9db6-c067a33707eb', 'celia', 'cerdán', 'benavides');
INSERT INTO mendozarq.proyectowiew (uuid, creadoEn, nombre, descripcion, categoria, estado, fechaInicio, fechaFinal, lugarProyecto, porcentaje, uuidCliente, nombreCliente, apellidoPaterno, apellidoMaterno) VALUES ('92914a40-8a91-495b-9b6a-b46c491c317e', '2022-06-28 22:23:14', 'Lomas del sur tower', 'Edificio central de la empresa importadora lomas del sur.', 'construccion', 1, '2022-06-29', '2022-12-31', 'Avenida Blanco Galindo y Segunda', 5, 'bf493a64-4573-433f-92b0-edbcae73a98b', 'carmelita', 'cabrero', 'castillo');
