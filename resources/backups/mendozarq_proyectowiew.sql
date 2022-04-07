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
aspernat', 39, 'bf493a64-4573-433f-92b0-edbcae73a98b', 'carmelita', 'cabrero', 'castillo');
INSERT INTO mendozarq.proyectowiew (uuid, creadoEn, nombre, descripcion, categoria, estado, fechaInicio, fechaFinal, lugarProyecto, porcentaje, uuidCliente, nombreCliente, apellidoPaterno, apellidoMaterno) VALUES ('8ee6d457-1315-4c9b-bfae-7d7e04ac75a8', '2022-03-30 21:51:37', 'proyecto de prueba', 'proyecto de prueba de la constructora mendozarq', 'construccion', 1, '2022-03-18', '2022-03-31', 'dsaas', 43, 'bf493a64-4573-433f-92b0-edbcae73a98b', 'carmelita', 'cabrero', 'castillo');
