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

INSERT INTO mendozarq.proyectowiew (uuid, creadoEn, nombre, descripcion, categoria, estado, fechaInicio, fechaFinal, lugarProyecto, porcentaje, uuidCliente, nombreCliente, apellidoPaterno, apellidoMaterno) VALUES ('13f3af68-d552-4c54-bde6-816f474dd4ec', '2021-11-27 12:27:32', 'Cencerrillas Engarmarse Abajeño', ' Lorem ipsum dolor sit amet consectetur,
adipisicing elit. Deleniti fugiat ipsum, sequi, quis eaque in nobis ullam voluptate id quia magni tempore pariatur voluptatem? Eos officia ut modi rem
aspernat', 'construccion', 1, '2021-11-27', '2022-12-31', ' Lorem ipsum dolor sit amet consectetur,
adipisicing elit. Deleniti fugiat ipsum, sequi, quis eaque in nobis ullam voluptate id quia magni tempore pariatur voluptatem? Eos officia ut modi rem
aspernat', 0, 'bf493a64-4573-433f-92b0-edbcae73a98b', 'carmelita', 'cabrero', 'castillo');
INSERT INTO mendozarq.proyectowiew (uuid, creadoEn, nombre, descripcion, categoria, estado, fechaInicio, fechaFinal, lugarProyecto, porcentaje, uuidCliente, nombreCliente, apellidoPaterno, apellidoMaterno) VALUES ('5f1c430d-cda9-4ee8-aa58-b011c3544567', '2022-02-15 18:35:38', 'dasd', 'dsadsadsadsadsa', 'construccion', 1, '2022-02-17', '2022-02-28', '', 0, 'bf493a64-4573-433f-92b0-edbcae73a98b', 'carmelita', 'cabrero', 'castillo');
