/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/ mendozarq /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE mendozarq;

DROP TABLE IF EXISTS capitulopresupuesto;
CREATE TABLE `capitulopresupuesto` (
  `uuid` varchar(100) NOT NULL,
  `creadoEn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `nombre` text NOT NULL,
  `descuento` int(11) NOT NULL DEFAULT '0',
  `uuidPresupuestoObra` varchar(100) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `uuidPresupuestoObra` (`uuidPresupuestoObra`),
  CONSTRAINT `capitulopresupuesto_ibfk_1` FOREIGN KEY (`uuidPresupuestoObra`) REFERENCES `presupuestoobra` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS carpetaproyecto;
CREATE TABLE `carpetaproyecto` (
  `uuid` varchar(100) NOT NULL,
  `creadoEn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `nombre` varchar(50) DEFAULT NULL,
  `fechaCreacion` date DEFAULT NULL,
  `uuidProyecto` varchar(100) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `uuidProyecto` (`uuidProyecto`),
  CONSTRAINT `carpetaproyecto_ibfk_1` FOREIGN KEY (`uuidProyecto`) REFERENCES `proyecto` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS categoriaproducto;
CREATE TABLE `categoriaproducto` (
  `uuid` varchar(100) NOT NULL,
  `creadoEn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `keyName` text NOT NULL,
  `location` text NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS detallecapitulo;
CREATE TABLE `detallecapitulo` (
  `uuid` varchar(100) NOT NULL,
  `creadoEn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `descripcion` text NOT NULL,
  `unidad` varchar(10) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precioUnitario` decimal(15,2) NOT NULL,
  `uuidCapituloPresupuesto` varchar(100) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `uuidCapituloPresupuesto` (`uuidCapituloPresupuesto`),
  CONSTRAINT `detallecapitulo_ibfk_1` FOREIGN KEY (`uuidCapituloPresupuesto`) REFERENCES `capitulopresupuesto` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS detallecategoriaproducto;
CREATE TABLE `detallecategoriaproducto` (
  `uuid` varchar(100) NOT NULL,
  `uuidCategoria` varchar(100) DEFAULT NULL,
  `uuidProducto` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  KEY `uuidCategoria` (`uuidCategoria`),
  KEY `uuidProducto` (`uuidProducto`),
  CONSTRAINT `detallecategoriaproducto_ibfk_1` FOREIGN KEY (`uuidCategoria`) REFERENCES `categoriaproducto` (`uuid`),
  CONSTRAINT `detallecategoriaproducto_ibfk_2` FOREIGN KEY (`uuidProducto`) REFERENCES `producto` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS documentocarpeta;
CREATE TABLE `documentocarpeta` (
  `uuid` varchar(100) NOT NULL,
  `creadoEn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `uuidCarpeta` varchar(100) NOT NULL,
  `uuidDocumento` varchar(100) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `uuidCarpeta` (`uuidCarpeta`),
  KEY `uuidDocumento` (`uuidDocumento`),
  CONSTRAINT `documentocarpeta_ibfk_1` FOREIGN KEY (`uuidCarpeta`) REFERENCES `carpetaproyecto` (`uuid`),
  CONSTRAINT `documentocarpeta_ibfk_2` FOREIGN KEY (`uuidDocumento`) REFERENCES `documentoproyecto` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS documentoproyecto;
CREATE TABLE `documentoproyecto` (
  `uuid` varchar(100) NOT NULL,
  `creadoEn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `nombre` text NOT NULL,
  `keyName` text NOT NULL,
  `location` text NOT NULL,
  `fechaCreacion` date NOT NULL,
  `uuidProyecto` varchar(100) NOT NULL,
  `size` int(11) NOT NULL,
  `path` varchar(10) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `uuidProyecto` (`uuidProyecto`),
  CONSTRAINT `documentoproyecto_ibfk_1` FOREIGN KEY (`uuidProyecto`) REFERENCES `proyecto` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS fotoproducto;
CREATE TABLE `fotoproducto` (
  `uuid` varchar(100) NOT NULL,
  `creadoEn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `nombre` text NOT NULL,
  `indice` int(11) NOT NULL,
  `keyName` text NOT NULL,
  `location` text NOT NULL,
  `size` int(11) NOT NULL,
  `uuidProducto` varchar(100) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `uuidProducto` (`uuidProducto`),
  CONSTRAINT `fotoproducto_ibfk_1` FOREIGN KEY (`uuidProducto`) REFERENCES `producto` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS observacionpersonal;
CREATE TABLE `observacionpersonal` (
  `uuid` varchar(100) NOT NULL,
  `creadoEn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` varchar(100) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `fecha` date NOT NULL,
  `uuidPersonal` varchar(100) NOT NULL,
  `uuidVisita` varchar(100) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `uuidPersonal` (`uuidPersonal`),
  KEY `uuidVisita` (`uuidVisita`),
  CONSTRAINT `observacionpersonal_ibfk_1` FOREIGN KEY (`uuidPersonal`) REFERENCES `personal` (`uuid`),
  CONSTRAINT `observacionpersonal_ibfk_2` FOREIGN KEY (`uuidVisita`) REFERENCES `visitaproyecto` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS observacionservicio;
CREATE TABLE `observacionservicio` (
  `uuid` varchar(100) NOT NULL,
  `creadoEn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` varchar(100) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `fecha` date NOT NULL,
  `uuidServicio` varchar(100) NOT NULL,
  `uuidVisita` varchar(100) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `uuidServicio` (`uuidServicio`),
  KEY `uuidVisita` (`uuidVisita`),
  CONSTRAINT `observacionservicio_ibfk_1` FOREIGN KEY (`uuidServicio`) REFERENCES `servicioproyecto` (`uuid`),
  CONSTRAINT `observacionservicio_ibfk_2` FOREIGN KEY (`uuidVisita`) REFERENCES `visitaproyecto` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS opinionproducto;
CREATE TABLE `opinionproducto` (
  `uuid` varchar(100) NOT NULL,
  `creadoEn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `titulo` varchar(300) NOT NULL,
  `descripcion` varchar(1000) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '0',
  `verificado` tinyint(1) NOT NULL DEFAULT '0',
  `puntuacion` int(11) NOT NULL,
  `uuidProducto` varchar(100) NOT NULL,
  `uuidCliente` varchar(100) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `uuidProducto` (`uuidProducto`),
  KEY `uuidCliente` (`uuidCliente`),
  CONSTRAINT `opinionproducto_ibfk_1` FOREIGN KEY (`uuidProducto`) REFERENCES `producto` (`uuid`),
  CONSTRAINT `opinionproducto_ibfk_2` FOREIGN KEY (`uuidCliente`) REFERENCES `usuario` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS participantevisita;
CREATE TABLE `participantevisita` (
  `uuid` varchar(100) NOT NULL,
  `creadoEn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `uuidVisitaProyecto` varchar(100) NOT NULL,
  `uuidUsuario` varchar(100) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `uuidVisitaProyecto` (`uuidVisitaProyecto`),
  KEY `uuidUsuario` (`uuidUsuario`),
  CONSTRAINT `participantevisita_ibfk_1` FOREIGN KEY (`uuidVisitaProyecto`) REFERENCES `visitaproyecto` (`uuid`),
  CONSTRAINT `participantevisita_ibfk_2` FOREIGN KEY (`uuidUsuario`) REFERENCES `usuario` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS personal;
CREATE TABLE `personal` (
  `uuid` varchar(100) NOT NULL,
  `creadoEn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `nombre` varchar(50) NOT NULL,
  `apellidoPaterno` varchar(50) NOT NULL,
  `apellidoMaterno` varchar(50) DEFAULT NULL,
  `celular` int(11) DEFAULT NULL,
  `direccion` text,
  `correo` varchar(100) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `sueldo` decimal(15,2) DEFAULT NULL,
  `moneda` varchar(10) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS personalproyecto;
CREATE TABLE `personalproyecto` (
  `uuid` varchar(100) NOT NULL,
  `creadoEn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `uuidProyecto` varchar(100) NOT NULL,
  `uuidPersonal` varchar(100) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `uuidProyecto` (`uuidProyecto`),
  KEY `uuidPersonal` (`uuidPersonal`),
  CONSTRAINT `personalproyecto_ibfk_1` FOREIGN KEY (`uuidProyecto`) REFERENCES `proyecto` (`uuid`),
  CONSTRAINT `personalproyecto_ibfk_2` FOREIGN KEY (`uuidPersonal`) REFERENCES `personal` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS presupuestoobra;
CREATE TABLE `presupuestoobra` (
  `uuid` varchar(100) NOT NULL,
  `creadoEn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `fecha` date NOT NULL,
  `iva` decimal(12,2) DEFAULT NULL,
  `total` decimal(12,2) DEFAULT '0.00',
  `uuidCliente` varchar(100) NOT NULL,
  `uuidUsuario` varchar(100) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `uuidCliente` (`uuidCliente`),
  KEY `uuidUsuario` (`uuidUsuario`),
  CONSTRAINT `presupuestoobra_ibfk_1` FOREIGN KEY (`uuidCliente`) REFERENCES `usuario` (`uuid`),
  CONSTRAINT `presupuestoobra_ibfk_2` FOREIGN KEY (`uuidUsuario`) REFERENCES `usuario` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS presupuestoproyecto;
CREATE TABLE `presupuestoproyecto` (
  `uuid` varchar(100) NOT NULL,
  `creadoEn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `uuidPresupuestoObra` varchar(100) NOT NULL,
  `uuidProyecto` varchar(100) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `uuidPresupuestoObra` (`uuidPresupuestoObra`),
  KEY `uuidProyecto` (`uuidProyecto`),
  CONSTRAINT `presupuestoproyecto_ibfk_1` FOREIGN KEY (`uuidPresupuestoObra`) REFERENCES `presupuestoobra` (`uuid`),
  CONSTRAINT `presupuestoproyecto_ibfk_2` FOREIGN KEY (`uuidProyecto`) REFERENCES `proyecto` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS producto;
CREATE TABLE `producto` (
  `uuid` varchar(100) NOT NULL,
  `creadoEn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `nombre` varchar(300) NOT NULL,
  `descripcion` varchar(1000) DEFAULT NULL,
  `precio` decimal(15,2) NOT NULL,
  `moneda` varchar(5) NOT NULL DEFAULT 'Bs.',
  `stock` int(11) NOT NULL,
  `descuento` decimal(15,2) DEFAULT '0.00',
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS proyecto;
CREATE TABLE `proyecto` (
  `uuid` varchar(100) NOT NULL,
  `creadoEn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `categoria` varchar(100) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `fechaInicio` date DEFAULT NULL,
  `fechaFinal` date DEFAULT NULL,
  `lugarProyecto` varchar(200) DEFAULT NULL,
  `porcentaje` int(11) DEFAULT NULL,
  `uuidCliente` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  KEY `uuidCliente` (`uuidCliente`),
  CONSTRAINT `proyecto_ibfk_1` FOREIGN KEY (`uuidCliente`) REFERENCES `usuario` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS servicioproyecto;
CREATE TABLE `servicioproyecto` (
  `uuid` varchar(100) NOT NULL,
  `creadoEn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `avance` int(11) NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFinal` date NOT NULL,
  `uuidProyecto` varchar(100) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `uuidProyecto` (`uuidProyecto`),
  CONSTRAINT `servicioproyecto_ibfk_1` FOREIGN KEY (`uuidProyecto`) REFERENCES `proyecto` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS usuario;
CREATE TABLE `usuario` (
  `uuid` varchar(100) NOT NULL,
  `creadoEn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `nombre` varchar(50) NOT NULL,
  `apellidoPaterno` varchar(50) NOT NULL,
  `apellidoMaterno` varchar(50) DEFAULT NULL,
  `celular` int(11) DEFAULT NULL,
  `direccion` text,
  `correo` varchar(100) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `contrasenha` varchar(100) NOT NULL,
  `rol` varchar(20) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS usuarioproyecto;
CREATE TABLE `usuarioproyecto` (
  `uuid` varchar(100) NOT NULL,
  `creadoEn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `uuidProyecto` varchar(100) NOT NULL,
  `uuidUsuario` varchar(100) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `uuidProyecto` (`uuidProyecto`),
  KEY `uuidUsuario` (`uuidUsuario`),
  CONSTRAINT `usuarioproyecto_ibfk_1` FOREIGN KEY (`uuidProyecto`) REFERENCES `proyecto` (`uuid`),
  CONSTRAINT `usuarioproyecto_ibfk_2` FOREIGN KEY (`uuidUsuario`) REFERENCES `usuario` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS visitaproyecto;
CREATE TABLE `visitaproyecto` (
  `uuid` varchar(100) NOT NULL,
  `creadoEn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `nombre` varchar(50) NOT NULL,
  `faseDelProyecto` varchar(100) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `uuidProyecto` varchar(100) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `uuidProyecto` (`uuidProyecto`),
  CONSTRAINT `visitaproyecto_ibfk_1` FOREIGN KEY (`uuidProyecto`) REFERENCES `proyecto` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE OR REPLACE VIEW `proyectowiew` AS select `p`.`uuid` AS `uuid`,`p`.`creadoEn` AS `creadoEn`,`p`.`nombre` AS `nombre`,`p`.`descripcion` AS `descripcion`,`p`.`categoria` AS `categoria`,`p`.`estado` AS `estado`,`p`.`fechaInicio` AS `fechaInicio`,`p`.`fechaFinal` AS `fechaFinal`,`p`.`lugarProyecto` AS `lugarProyecto`,`p`.`porcentaje` AS `porcentaje`,`p`.`uuidCliente` AS `uuidCliente`,`u`.`nombre` AS `nombreCliente`,`u`.`apellidoPaterno` AS `apellidoPaterno`,`u`.`apellidoMaterno` AS `apellidoMaterno` from (`proyecto` `p` join `usuario` `u` on((`p`.`uuidCliente` = `u`.`uuid`)));



INSERT INTO categoriaproducto(uuid,creadoEn,nombre,descripcion,keyName,location,estado) VALUES('152054a7-2d6f-4975-8d2f-9fb7c009070d','2021-11-24 20:55:51','sillas','',X'',X'',1),('17ec4924-cf46-44c8-b814-69f1c0ab6548','2021-11-24 20:52:44','mesas','Gemir Batallador Bate Increíble.',X'',X'',1),('4c4c0f7a-e3ed-41b9-b169-8815bf8b9fb3','2021-11-24 20:55:10','mesedoras','',X'',X'',1),('66ae0979-62d4-426f-bab4-8d72a04198df','2021-11-24 20:54:32','vigas','',X'',X'',1),('6a8376c6-319a-46dc-90fb-3410e4381b9e','2021-11-24 20:58:23','abeto',' Es una madera clara, blanca-amarillenta y fácil de trabajar. Se utiliza para fabricar muebles, instrumentos musicales, puertas y ventanas, y es muy común en el sector de la construcción.',X'',X'',1),('6d518b5c-ca45-4fd8-9ce2-be076a35b264','2021-11-24 20:53:14','vitrinas','Cencerra Cenagoso Descensión.',X'',X'',1),('718abba8-fd1d-490c-9ecc-81addc302a35','2021-11-24 21:01:47','escaleras','',X'',X'',1),('739b3a09-2ee4-49f5-a07f-c309d2730443','2021-11-24 21:00:41','armarios','',X'',X'',1),('805ab00f-c607-42bc-9d20-60dfd58763db','2021-11-24 20:52:11','marcos de ventanas','Batanar Abaldonadamente Abajamiento Fidecomiso.',X'',X'',1),('8cec5a20-206d-4b57-a021-24aa340f1f51','2021-11-24 20:58:53','pino','Es muy fácil trabajar con el pino y, como la mayoría de las variedades que son relativamente suaves, se presta a la escultura.',X'',X'',1),('8f7a06df-bfd3-4fc4-92fb-12ee1e65250e','2021-11-24 20:59:12','cedro','El tipo más común de cedro es la variedad roja occidental. El cedro tiene un color rojizo , este tipo de madera es relativamente suave, tiene un grano recto y un olor ligeramente aromático',X'',X'',1),('939b6e45-82ea-4c94-8bbb-dd87eba0adda','2021-11-24 21:00:25','nogal','Hoy en día se utiliza mucho para revestimientos de lujo: muebles, armarios, puertas, adornos y elementos torneados.\n\nmuebles, pero también para suelos y paredes.',X'',X'',1),('e90fdffe-e621-4c27-8d14-bfa8de0b2418','2021-11-24 21:08:01','pisos','pisos de madera aplicable al concreto',X'',X'',1),('ec2400a2-78ee-4ec8-8399-cbcc1c23cb5b','2021-11-24 20:50:14','puertas','Descifrador Cencerrear Engargolado Generación Cenegar Fichaje Bastoncillo Cenata Batato.',X'',X'',1);


INSERT INTO detallecategoriaproducto(uuid,uuidCategoria,uuidProducto) VALUES('053a6545-ba8a-40c5-a2fb-85dea6fd2dac','805ab00f-c607-42bc-9d20-60dfd58763db','5e916855-3d48-46b5-b2ab-47cffea85be7'),('068224a3-c329-4f10-9e13-9b4d4ba9f07a','6d518b5c-ca45-4fd8-9ce2-be076a35b264','7d9ca4bb-b259-4ce2-b069-4893f074b597'),('1bfa5879-f181-492c-9c47-b522fb3e5681','718abba8-fd1d-490c-9ecc-81addc302a35','890d6295-ad7a-481f-acf0-c608c5e7a9df'),('2d8ab0e1-7f91-4162-8e7a-0c7772059e2b','17ec4924-cf46-44c8-b814-69f1c0ab6548','2fe5ff3e-f808-4e6d-916a-d4959bb87227'),('65284284-587a-4cc8-a0b7-17d296693097','6a8376c6-319a-46dc-90fb-3410e4381b9e','890d6295-ad7a-481f-acf0-c608c5e7a9df'),('6fdc55ef-d05a-4379-82d8-2155ea5a2540','6a8376c6-319a-46dc-90fb-3410e4381b9e','5e916855-3d48-46b5-b2ab-47cffea85be7'),('767bb08b-ac66-4179-8514-fda733e58001','8f7a06df-bfd3-4fc4-92fb-12ee1e65250e','2fe5ff3e-f808-4e6d-916a-d4959bb87227'),('a4c89bde-3181-4b45-9bd5-7583c2cb3823','805ab00f-c607-42bc-9d20-60dfd58763db','ec428dc7-a821-4b21-b16b-c9f98f88687c'),('a59a7f89-b3dc-4102-a8dc-09e68705b2b4','8cec5a20-206d-4b57-a021-24aa340f1f51','ec428dc7-a821-4b21-b16b-c9f98f88687c'),('c7bb77e9-26d1-4e64-9a09-51f2a1ca0699','152054a7-2d6f-4975-8d2f-9fb7c009070d','ad8325f8-1f19-4364-8a1f-0d85732d7d71'),('cde36986-6eb3-425e-b2cc-913173790bbe','6a8376c6-319a-46dc-90fb-3410e4381b9e','7d9ca4bb-b259-4ce2-b069-4893f074b597'),('d2b84b2b-0a74-49bf-a4ef-613d3f49a6f0','939b6e45-82ea-4c94-8bbb-dd87eba0adda','ad8325f8-1f19-4364-8a1f-0d85732d7d71');



INSERT INTO fotoproducto(uuid,creadoEn,nombre,indice,keyName,location,size,uuidProducto) VALUES('1e3c49dc-146b-493e-8bc2-a13b16845a23','2021-11-24 21:19:46',X'48544231736679696856634a4c314a6a535a464f713641576c585861732e6a7067',1,X'6c6972616b692f696d616765732f62663666663265662d306638312d343666612d623662352d6335623762326461323261352e6a7067',X'68747470733a2f2f6d656e646f7a6172712d6c6972616b692d73332e73332e616d617a6f6e6177732e636f6d2f6c6972616b692f696d616765732f62663666663265662d306638312d343666612d623662352d6335623762326461323261352e6a7067',255762,'ec428dc7-a821-4b21-b16b-c9f98f88687c'),('3f0fd344-e9c5-4516-bfe9-9b58f47af025','2021-11-24 21:17:15',X'31343764643539313233653832323836363231633065356635306161613636352e6a7067',1,X'6c6972616b692f696d616765732f64326366626633662d663130352d343030642d626632362d3234303033303537636162612e6a7067',X'68747470733a2f2f6d656e646f7a6172712d6c6972616b692d73332e73332e616d617a6f6e6177732e636f6d2f6c6972616b692f696d616765732f64326366626633662d663130352d343030642d626632362d3234303033303537636162612e6a7067',12396,'890d6295-ad7a-481f-acf0-c608c5e7a9df'),('3fed5f86-1bfb-4fec-b58c-75b77bd1af9a','2021-11-24 21:26:25',X'6465736361726761202831292e6a666966',0,X'6c6972616b692f696d616765732f36633662333233622d323461352d343233312d393665622d3362643961383639363737312e6a666966',X'68747470733a2f2f6d656e646f7a6172712d6c6972616b692d73332e73332e616d617a6f6e6177732e636f6d2f6c6972616b692f696d616765732f36633662333233622d323461352d343233312d393665622d3362643961383639363737312e6a666966',6000,'ad8325f8-1f19-4364-8a1f-0d85732d7d71'),('408c6af0-a7d5-4591-a06e-d51100566f93','2021-11-24 21:23:24',X'696d616765732e6a666966',3,X'6c6972616b692f696d616765732f30653037613431302d636533392d343034352d623561622d6333303666363431613333622e6a666966',X'68747470733a2f2f6d656e646f7a6172712d6c6972616b692d73332e73332e616d617a6f6e6177732e636f6d2f6c6972616b692f696d616765732f30653037613431302d636533392d343034352d623561622d6333303666363431613333622e6a666966',4361,'2fe5ff3e-f808-4e6d-916a-d4959bb87227'),('69272800-c7ec-4e5d-92d8-a80c0557d42d','2021-11-24 21:23:25',X'6d65736173206465206d6164657261207275737469636173206172746573616e616c65732032312e6a7067',0,X'6c6972616b692f696d616765732f35656636363265652d383266332d343337392d613332382d6237333461346534376264392e6a7067',X'68747470733a2f2f6d656e646f7a6172712d6c6972616b692d73332e73332e616d617a6f6e6177732e636f6d2f6c6972616b692f696d616765732f35656636363265652d383266332d343337392d613332382d6237333461346534376264392e6a7067',108507,'2fe5ff3e-f808-4e6d-916a-d4959bb87227'),('716f2edb-44e7-4d15-bd98-45d7133c6b1e','2021-11-24 21:20:50',X'48544231736679696856634a4c314a6a535a464f713641576c585861732e6a7067',3,X'6c6972616b692f696d616765732f65356630373139352d613865642d343962302d396437652d3039653638666266363134382e6a7067',X'68747470733a2f2f6d656e646f7a6172712d6c6972616b692d73332e73332e616d617a6f6e6177732e636f6d2f6c6972616b692f696d616765732f65356630373139352d613865642d343962302d396437652d3039653638666266363134382e6a7067',255762,'5e916855-3d48-46b5-b2ab-47cffea85be7'),('729784e9-c4bd-49c3-ba25-5e50efead0d1','2021-11-24 21:17:15',X'33376662633135383031333139616131393938373838366435323563386364322e6a7067',0,X'6c6972616b692f696d616765732f34343036333537612d633062362d343334332d393030332d3562356634653139653234382e6a7067',X'68747470733a2f2f6d656e646f7a6172712d6c6972616b692d73332e73332e616d617a6f6e6177732e636f6d2f6c6972616b692f696d616765732f34343036333537612d633062362d343334332d393030332d3562356634653139653234382e6a7067',49834,'890d6295-ad7a-481f-acf0-c608c5e7a9df'),('7676e484-ca97-4f28-83ce-e78b1632b340','2021-11-27 22:14:28',X'76697472696e612e6a7067',0,X'6c6972616b692f696d616765732f35346236363833372d343833652d346531652d626235312d6231663630616662626131642e6a7067',X'68747470733a2f2f6d656e646f7a6172712d6c6972616b692d73332e73332e616d617a6f6e6177732e636f6d2f6c6972616b692f696d616765732f35346236363833372d343833652d346531652d626235312d6231663630616662626131642e6a7067',60664,'7d9ca4bb-b259-4ce2-b069-4893f074b597'),('80f78971-8086-4831-bdb3-a1fd4bbb99e6','2021-11-27 22:14:28',X'696d616765732e6a666966',1,X'6c6972616b692f696d616765732f36646664636561302d346334322d343664362d613063362d3662353239663663383665632e6a666966',X'68747470733a2f2f6d656e646f7a6172712d6c6972616b692d73332e73332e616d617a6f6e6177732e636f6d2f6c6972616b692f696d616765732f36646664636561302d346334322d343664362d613063362d3662353239663663383665632e6a666966',5729,'7d9ca4bb-b259-4ce2-b069-4893f074b597'),('9dce9740-3ae6-4997-93d6-0c5d42a80d88','2021-11-24 21:20:50',X'38314f61674b662b2d754c2e5f41435f53533435305f2e6a7067',0,X'6c6972616b692f696d616765732f66636664633936632d613864642d343963392d613138392d3331666231643261656537302e6a7067',X'68747470733a2f2f6d656e646f7a6172712d6c6972616b692d73332e73332e616d617a6f6e6177732e636f6d2f6c6972616b692f696d616765732f66636664633936632d613864642d343963392d613138392d3331666231643261656537302e6a7067',31344,'5e916855-3d48-46b5-b2ab-47cffea85be7'),('a2517c17-e6b3-4592-9ae3-7e264d7dfe03','2021-11-24 21:26:25',X'6465736361726761202832292e6a666966',1,X'6c6972616b692f696d616765732f37396333303663372d356661322d343331392d623831642d6366303835373930326134622e6a666966',X'68747470733a2f2f6d656e646f7a6172712d6c6972616b692d73332e73332e616d617a6f6e6177732e636f6d2f6c6972616b692f696d616765732f37396333303663372d356661322d343331392d623831642d6366303835373930326134622e6a666966',4926,'ad8325f8-1f19-4364-8a1f-0d85732d7d71'),('b137c265-d4ee-4568-93e7-5e10d5c5762a','2021-11-24 21:20:50',X'35313937383531383364663531316430343630393966613135653562623063622e6a7067',1,X'6c6972616b692f696d616765732f38383035633266382d336230612d346331362d623465382d6331666538316161323133332e6a7067',X'68747470733a2f2f6d656e646f7a6172712d6c6972616b692d73332e73332e616d617a6f6e6177732e636f6d2f6c6972616b692f696d616765732f38383035633266382d336230612d346331362d623465382d6331666538316161323133332e6a7067',21498,'5e916855-3d48-46b5-b2ab-47cffea85be7'),('ccedd91f-e57b-410a-9a8e-650034f75707','2021-11-24 21:17:15',X'63633136313833363835313037333638616236373466356465313935373932362e6a7067',2,X'6c6972616b692f696d616765732f63323261653931332d303661382d343330662d383465372d6361613838303233336363652e6a7067',X'68747470733a2f2f6d656e646f7a6172712d6c6972616b692d73332e73332e616d617a6f6e6177732e636f6d2f6c6972616b692f696d616765732f63323261653931332d303661382d343330662d383465372d6361613838303233336363652e6a7067',49626,'890d6295-ad7a-481f-acf0-c608c5e7a9df'),('ce7c1b4a-8a94-465c-8ef5-788e03ba958c','2021-11-24 21:26:25',X'64657363617267612e6a666966',2,X'6c6972616b692f696d616765732f66333264616163382d333136302d346337632d386263652d6434613631303736366661622e6a666966',X'68747470733a2f2f6d656e646f7a6172712d6c6972616b692d73332e73332e616d617a6f6e6177732e636f6d2f6c6972616b692f696d616765732f66333264616163382d333136302d346337632d386263652d6434613631303736366661622e6a666966',6285,'ad8325f8-1f19-4364-8a1f-0d85732d7d71'),('d1e9459a-36aa-4b99-8ca0-1b2ac30c23bc','2021-11-24 21:19:46',X'6d6172636f2d64652d76656e74616e612d64652d6d61646572612d6169736c61646f2d656e2d626c616e636f2d31333133333032382e6a7067',2,X'6c6972616b692f696d616765732f33373763343064382d303333342d343931382d626530352d3564343362393265383034612e6a7067',X'68747470733a2f2f6d656e646f7a6172712d6c6972616b692d73332e73332e616d617a6f6e6177732e636f6d2f6c6972616b692f696d616765732f33373763343064382d303333342d343931382d626530352d3564343362393265383034612e6a7067',108348,'ec428dc7-a821-4b21-b16b-c9f98f88687c'),('d3112c6d-ad08-48e9-8c33-858eb9b1293e','2021-11-24 21:23:24',X'64657363617267612e6a666966',1,X'6c6972616b692f696d616765732f35343962376438612d376634322d343535382d386462322d3062643530323862363539652e6a666966',X'68747470733a2f2f6d656e646f7a6172712d6c6972616b692d73332e73332e616d617a6f6e6177732e636f6d2f6c6972616b692f696d616765732f35343962376438612d376634322d343535382d386462322d3062643530323862363539652e6a666966',14183,'2fe5ff3e-f808-4e6d-916a-d4959bb87227'),('d662a26f-6920-4be6-9d0b-f7820f361b58','2021-11-24 21:20:49',X'64657363617267612e6a666966',2,X'6c6972616b692f696d616765732f39656662316536302d633366312d346138312d393835342d3439656434663031303464652e6a666966',X'68747470733a2f2f6d656e646f7a6172712d6c6972616b692d73332e73332e616d617a6f6e6177732e636f6d2f6c6972616b692f696d616765732f39656662316536302d633366312d346138312d393835342d3439656434663031303464652e6a666966',5946,'5e916855-3d48-46b5-b2ab-47cffea85be7'),('df058e40-7f00-4084-bf75-7b0e8131af3b','2021-11-24 21:23:24',X'6d7565626c652d656e2d637275646f2e6a7067',2,X'6c6972616b692f696d616765732f31376334386664612d386533622d343031392d626334352d3163353766373266663465312e6a7067',X'68747470733a2f2f6d656e646f7a6172712d6c6972616b692d73332e73332e616d617a6f6e6177732e636f6d2f6c6972616b692f696d616765732f31376334386664612d386533622d343031392d626334352d3163353766373266663465312e6a7067',14556,'2fe5ff3e-f808-4e6d-916a-d4959bb87227'),('ea97b806-af53-48c5-a459-4cf8b205f208','2021-11-24 21:19:46',X'77696e646f772d353937343030305f3936305f3732302e706e67',0,X'6c6972616b692f696d616765732f35666664323339392d633037612d346330362d393263332d6161656533373537363430652e706e67',X'68747470733a2f2f6d656e646f7a6172712d6c6972616b692d73332e73332e616d617a6f6e6177732e636f6d2f6c6972616b692f696d616765732f35666664323339392d633037612d346330362d393263332d6161656533373537363430652e706e67',464592,'ec428dc7-a821-4b21-b16b-c9f98f88687c');



INSERT INTO opinionproducto(uuid,creadoEn,titulo,descripcion,estado,verificado,puntuacion,uuidProducto,uuidCliente) VALUES('9e92aac4-8bb3-4d14-8c8c-d13e61fa6777','2021-11-27 22:00:26','Mala calidad','La calidad de estr producto se ve reflejado en que apenas lo mire y se rompio xd.',0,0,1,'2fe5ff3e-f808-4e6d-916a-d4959bb87227','fa27b5b3-837b-4486-b2cd-c6a306e8bd72'),('da8513d6-2a00-4008-9c9a-12445c168ee4','2021-11-27 22:01:55','Exelente  Recomendado','Abalada Descifrable Ficoideo Géminis Gencianeo Cencapa. Engastadura Cenestesia\nBatavia Abajadero Gendarmería. Genearca Descervigamiento Descerrajar Fidecomiso\nEngaste Cencerro Batatazo Engastador. Batavia Cenceñada Abajo\nAbalada Descifrable Ficoideo Géminis Gencianeo Cencapa. Engastadura Cenestesia\nBatavia Abajadero Gendarmería. Genearca Descervigamiento Descerrajar Fidecomiso\nEngaste Cencerro Batatazo Engastador. Batavia Cenceñada Abajo',0,0,5,'2fe5ff3e-f808-4e6d-916a-d4959bb87227','fa27b5b3-837b-4486-b2cd-c6a306e8bd72');


INSERT INTO personal(uuid,creadoEn,nombre,apellidoPaterno,apellidoMaterno,celular,direccion,correo,descripcion,sueldo,moneda,activo) VALUES('0cdca13f-175a-4ed0-8320-650f65bf9167','2021-10-07 21:21:17','juan','perez ','mendez',7762509,X'6176656e6964612061726f6d6120656e7472652063616c6c65206e6f73652079206176656e69646120616c67756e6120','suarez@gmail.com','personal de construccion de obras',10000.00,'bs',1);




INSERT INTO producto(uuid,creadoEn,nombre,descripcion,precio,moneda,stock,descuento,estado) VALUES('2fe5ff3e-f808-4e6d-916a-d4959bb87227','2021-11-24 21:23:23','Mesa para exterior o jardin de madera cedro','Abada Gen Increpar Incorporal Abadejo Bastonada Engastador Abajadero Abacorar. Geminar Generador Abajo Abacorar Batán Ficticio Cendal Ficha. Cendrazo Cenata Gemoterapia Incrédulo. Engarrafador Batallador Abajeño Incrédulo Abajo Engarrar Cenata Generador. Engarberar Descepar Incorporal Incordio Gemoso Incredibilidad Fichar Fice Ceneque Gemiquear.\n',700.00,'Bs.',5,0.00,1),('5e916855-3d48-46b5-b2ab-47cffea85be7','2021-11-24 21:20:49','Marco de madera de abeto para interior y exteriror','Abada Gen Increpar Incorporal Abadejo Bastonada Engastador Abajadero Abacorar. Geminar Generador Abajo Abacorar Batán Ficticio Cendal Ficha. Cendrazo Cenata Gemoterapia Incrédulo. Engarrafador Batallador Abajeño Incrédulo Abajo Engarrar Cenata Generador. Engarberar Descepar Incorporal Incordio Gemoso Incredibilidad Fichar Fice Ceneque Gemiquear.\n',700.00,'Bs.',7,0.00,1),('7d9ca4bb-b259-4ce2-b069-4893f074b597','2021-11-27 22:14:26','Vitrina de madera de abeto matrimonial con cajuelas amplias','Lorem, ipsum dolor sit amet consectetur adipisicing elit. Doloremque debitis quibusdam laborum adipisci dolorem sunt provident, in eaque deleniti sequi? Quasi iure accusantium voluptas odio, maxime fugit perferendis ipsum reiciendis?',1000.00,'Bs.',0,3.00,1),('890d6295-ad7a-481f-acf0-c608c5e7a9df','2021-11-24 21:17:14','Escaleras de madera de abeto para interior','Abada Gen Increpar Incorporal Abadejo Bastonada Engastador Abajadero Abacorar. Geminar Generador Abajo Abacorar Batán Ficticio Cendal Ficha. Cendrazo Cenata Gemoterapia Incrédulo. Engarrafador Batallador Abajeño Incrédulo Abajo Engarrar Cenata Generador. Engarberar Descepar Incorporal Incordio Gemoso Incredibilidad Fichar Fice Ceneque Gemiquear.',5000.00,'Bs.',3,0.00,1),('ad8325f8-1f19-4364-8a1f-0d85732d7d71','2021-11-24 21:26:25','Sillas de madera de nogal para interior con un diseño clasico','Abada Gen Increpar Incorporal Abadejo Bastonada Engastador Abajadero Abacorar. Geminar Generador Abajo Abacorar Batán Ficticio Cendal Ficha. Cendrazo Cenata Gemoterapia Incrédulo. Engarrafador Batallador Abajeño Incrédulo Abajo Engarrar Cenata Generador. Engarberar Descepar Incorporal Incordio Gemoso Incredibilidad Fichar Fice Ceneque Gemiquear.\n',200.00,'Bs.',100,0.00,1),('ec428dc7-a821-4b21-b16b-c9f98f88687c','2021-11-24 21:19:44','Marco de ventana de madera de pino reforzado para exterior','Abada Gen Increpar Incorporal Abadejo Bastonada Engastador Abajadero Abacorar. Geminar Generador Abajo Abacorar Batán Ficticio Cendal Ficha. Cendrazo Cenata Gemoterapia Incrédulo. Engarrafador Batallador Abajeño Incrédulo Abajo Engarrar Cenata Generador. Engarberar Descepar Incorporal Incordio Gemoso Incredibilidad Fichar Fice Ceneque Gemiquear.\n',500.00,'Bs.',0,5.00,1);

INSERT INTO proyecto(uuid,creadoEn,nombre,descripcion,categoria,estado,fechaInicio,fechaFinal,lugarProyecto,porcentaje,uuidCliente) VALUES('13f3af68-d552-4c54-bde6-816f474dd4ec','2021-11-27 12:27:32','Cencerrillas Engarmarse Abajeño.',' Lorem ipsum dolor sit amet consectetur,\nadipisicing elit. Deleniti fugiat ipsum, sequi, quis eaque in nobis ullam voluptate id quia magni tempore pariatur voluptatem? Eos officia ut modi rem\naspernat','construccion',1,'2021-11-27','2021-11-30',' Lorem ipsum dolor sit amet consectetur,\nadipisicing elit. Deleniti fugiat ipsum, sequi, quis eaque in nobis ullam voluptate id quia magni tempore pariatur voluptatem? Eos officia ut modi rem\naspernat',0,'bf493a64-4573-433f-92b0-edbcae73a98b');


INSERT INTO usuario(uuid,creadoEn,nombre,apellidoPaterno,apellidoMaterno,celular,direccion,correo,username,contrasenha,rol,activo) VALUES('0976bfba-6a2a-4405-8bfe-2474a21f1e25','2021-11-24 20:30:52','evaristo','del','gelabert',67891432,X'333839362047696c20466572726f63617272696c0a','Lilia_Anaya@corpfolder.com','evari8pni9','$2b$10$56JrCWb4S9Zx1.GT9WdwCuNdH5jnFQcwQgKUXqbtLGQvZ2JrsUVSa','cliente',1),('178e1faa-b3f0-4900-a7b5-a19085c0cf9c','2021-11-24 20:29:26','salomón','ruano','',72686187,X'34323635204b6f727461206865726e616e64657a2056c3ad612050c3ba626c6963610a','Francisco_Santana@yahoo.com','salomo1ydq','$2b$10$MKlyLpWKHpnwOglfWDOMfeCnT0zwwFKXPEnWbyb7WZvyGTxo0HCiu','cliente',1),('2319b069-bde2-452c-af94-ec08f68c722c','2021-11-24 20:39:52','leandra','villa','jordán',74568926,X'3831372054616d61796f20477275706f0a','XimenaGuadalupe18@yahoo.com','leandhbal2','$2b$10$IN951.qE1yf.gHGRTlZp6.2ymwuyZmflQhmtd/xFjNb0ntGXpxF4m','vendedor',1),('35f44215-b58f-491e-a439-4b39ea044442','2021-11-24 20:42:26','sergio','olivé','lerma',70045451,X'3934333120436f6e747265726173205075656e74650a','Aarn.Gaitn22@example.com','sergimbswp','$2b$10$0KemAvwuw9r5CH5R8HEdnO6kf99USvCqP5ktz82O638HqlK1njYA6','administrador',1),('36f1f6d4-163d-4856-a964-aae308769f27','2021-11-24 20:39:06','severiano','peña','campillo',66365952,X'33383033204d6972616e64612056c3ad612050c3ba626c6963610a','Jorge.Tello@corpfolder.com','severx0md2','$2b$10$To8MZqCW0e6oYkvWzHAhPukq20Loln7Y6PPrBbaAJ9gV.mOepPjym','arquitecto',1),('4655d3ef-55cb-4579-9776-7f39377f5368','2021-11-24 20:34:38','josé','figueroa','ibáñez',62256672,X'393331204d6972616e64612052616d626c610a','Gabriela_Zelaya97@gmail.com','joséijvxca','$2b$10$h0hwzjwGhhLlQDgosMOfM.fwVWmSatBoQ3VY1Yv6dp1Chi0oP8f.G','arquitecto',1),('665d2f27-32f8-4ac2-81fc-f972bcfdce78','2021-11-24 20:37:57','evangelina','molina','mercader',66383117,X'303737204e656772657465204772616e205375626964610a','JosAntonio_Cazares68@hotmail.com','evang2vu74','$2b$10$ttZEYszXxEAIMJv9J23bOuSQ9c1LNsKRLa5HGcvlphXC0z7D1YYRK','arquitecto',1),('7a617f2c-0ca0-49be-a3f0-e77555174af0','2021-11-24 20:30:03','máximo','acedo','morillo',72807533,X'3233313120526f7361646f20506173616a650a','Toms_Quintana25@corpfolder.com','máximcrvd7','$2b$10$JjJc.uMBp1qckLkFtTreueK2c6i6Rk9vJ4Ugp16Y9FyyYA66O6t8O','cliente',1),('7ec2091c-abf2-4025-a207-3bbf04a5a8b9','2021-11-24 20:33:29','elodia','falcón','larrañaga',68966636,X'31373537204a75c3a172657a2053656e64610a','Dorotea92@corpfolder.com','elodib0825','$2b$10$NF6FJ62itir9Mbqqdl3YBeZSoaiMzz3FgihI/w0tsw9Sb4SwVe2ie','cliente',1),('81ed9811-5b7a-4316-8e9d-7081df740265','2021-11-24 20:28:59','lina','sáenz','ribes',78389801,X'34393838204d6f6e64726167c3b36e2052696e63c3b36e0a','Blanca_Orellana63@corpfolder.com','lina1tpy7e','$2b$10$W14t6MNoWIk5XHGUrra.GeSDtGXl6Bkk43sc7Wa1T1AvdF./6erX.','cliente',1),('81f19377-6c68-4bdc-9e38-d1c47b68c0c6','2021-11-24 20:38:31','néstor','almazán','azorin',64046915,X'39383230382059616d696c65746820477275706f0a','Mariana97@yahoo.com','nésto42u7t','$2b$10$GEtu3VwvQjwcAuRbSjpzguT1ry5py7mCx0hVL/T68kVtsD3DMKKtC','arquitecto',1),('8faf0153-fd37-4096-ba58-5592c24eed5a','2021-11-24 20:35:34','dafne','escamilla','miralles',63598297,X'36313034204172616e6461204d616e7a616e610a','Mercedes.Ayala1@nearbpo.com','dafne44lha','$2b$10$PCG9pfLytv7.6MszgE13N.aMTdDGhvEe8GiHbZaq8HXgPa/bc51z6','arquitecto',1),('942246e6-f202-47f9-9db6-c067a33707eb','2021-11-24 20:28:01','celia','cerdán','benavides',64859213,X'343532363720526f6c64c3a16e205375626964610a','Anita10@corpfolder.com','celia4w8yf','$2b$10$4SXxEZImtgfJzKvWjI9dj.9.ThA91zs94tr9LPOiLmGl8wQM4k54W','cliente',1),('a5b86b62-0ef8-4d23-a2f8-a242daa25103','2021-11-24 20:31:43','angelino octavio','pintor','benavides',70283107,X'31393533204178656c204875657274610a','Rosario_Narvez@hotmail.com','angelleftz','$2b$10$qfGFexEXzfnl/jR4QMHR8u7xg2fuoJ15302yvD7yi0cS1dtKR3eli','cliente',1),('bf493a64-4573-433f-92b0-edbcae73a98b','2021-11-24 20:45:00','carmelita','cabrero','castillo',75176717,X'38313836332050656c61796f205061727175650a','Mercedes67@yahoo.com','carmeky8ka','$2b$10$EIF49KhYeBkJ4TEcFxQE8OKqMWrjXelHVLCfUQrXEjkpqCodPn1T6','cliente',1),('ce754db3-3b9c-4dd5-81f1-ae2b5f5a060a','2021-11-24 20:27:02','juan','sobrino','suárez',68101913,X'373738363420456e726971756520436f6c6f6e6961','Diego82@corpfolder.com','juannwfqjc','$2b$10$EXWxE8u0VCeScF8pbeP4Me0.1JqHYdXVO4Fp2jbLxdmJj/ASVZ.cu','cliente',1),('fa27b5b3-837b-4486-b2cd-c6a306e8bd72','2021-11-24 20:40:00','bladimir','medrano','vargas',69509449,X'417620736567756e646120656e747265206d6172696e61206e756e657a2064656c20707261646f20792063616c6c6520677265636f2e','bladimilmedranoblod@gmail.com','blado959','$2b$10$Ejt7X/epAQ2kfChOFJa9T.apOjSfTR2xkMWOoIfWWKT4JFh8CDu.C','administrador',1);
