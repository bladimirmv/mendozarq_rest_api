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

