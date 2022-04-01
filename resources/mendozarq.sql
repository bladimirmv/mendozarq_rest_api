-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-04-2022 a las 21:48:31
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mendozarq`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `documentos_procedure` (IN `operacion` CHAR(1), IN `creadoEn` TIMESTAMP, IN `creadoPor` TEXT, IN `uuidCreadoPor` TEXT, IN `hostname` TEXT, IN `uuidRow` VARCHAR(100))  BEGIN
    INSERT INTO log_documentos (operacion,
                            creadoEn,
                            creadoPor,
                            uuidCreadoPor,
                            hostname,
                            uuidRow)
    SELECT operacion,
           creadoEn,
           creadoPor,
           uuidCreadoPor,
           hostname,
           uuidRow;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `personal_procedure` (IN `operacion` CHAR(1), IN `creadoEn` TIMESTAMP, IN `creadoPor` TEXT, IN `uuidCreadoPor` TEXT, IN `hostname` TEXT, IN `uuidRow` VARCHAR(100))  BEGIN
    INSERT INTO log_personal(operacion,
                            creadoEn,
                            creadoPor,
                            uuidCreadoPor,
                            hostname,
                            uuidRow)
    SELECT operacion,
           creadoEn,
           creadoPor,
           uuidCreadoPor,
           hostname,
           uuidRow;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `producto_procedure` (IN `operacion` CHAR(1), IN `creadoEn` TIMESTAMP, IN `creadoPor` TEXT, IN `uuidCreadoPor` TEXT, IN `hostname` TEXT, IN `uuidRow` VARCHAR(100))  BEGIN
    INSERT INTO log_producto (operacion,
                            creadoEn,
                            creadoPor,
                            uuidCreadoPor,
                            hostname,
                            uuidRow)
    SELECT operacion,
           creadoEn,
           creadoPor,
           uuidCreadoPor,
           hostname,
           uuidRow;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proyecto_procedure` (IN `operacion` CHAR(1), IN `creadoEn` TIMESTAMP, IN `creadoPor` TEXT, IN `uuidCreadoPor` TEXT, IN `hostname` TEXT, IN `uuidRow` VARCHAR(100))  BEGIN
    INSERT INTO log_proyecto (operacion,
                            creadoEn,
                            creadoPor,
                            uuidCreadoPor,
                            hostname,
                            uuidRow)
    SELECT operacion,
           creadoEn,
           creadoPor,
           uuidCreadoPor,
           hostname,
           uuidRow;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `usuario_procedure` (IN `operacion` CHAR(1), IN `creadoEn` TIMESTAMP, IN `creadoPor` TEXT, IN `uuidCreadoPor` TEXT, IN `hostname` TEXT, IN `uuidRow` VARCHAR(100))  BEGIN
    INSERT INTO log_usuario(operacion,
                            creadoEn,
                            creadoPor,
                            uuidCreadoPor,
                            hostname,
                            uuidRow)
    SELECT operacion,
           creadoEn,
           creadoPor,
           uuidCreadoPor,
           hostname,
           uuidRow;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `capituloplanificacionproyecto`
--

CREATE TABLE `capituloplanificacionproyecto` (
  `uuid` varchar(100) NOT NULL,
  `creadoEn` timestamp NOT NULL DEFAULT current_timestamp(),
  `nombre` varchar(200) NOT NULL,
  `fechaInicio` date DEFAULT NULL,
  `fechaFinal` date DEFAULT NULL,
  `avance` int(11) DEFAULT NULL,
  `dependencia` varchar(100) DEFAULT NULL,
  `color` text DEFAULT NULL,
  `uuidPlanificacionProyecto` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `capituloplanificacionproyecto`
--

INSERT INTO `capituloplanificacionproyecto` (`uuid`, `creadoEn`, `nombre`, `fechaInicio`, `fechaFinal`, `avance`, `dependencia`, `color`, `uuidPlanificacionProyecto`) VALUES
('3e5eb62b-388f-4ca2-b40f-afce49edd08a', '2022-02-11 17:27:41', 'Lorem ipsum dolor sit amet consectetura', '2022-02-01', '2022-05-31', 0, '', '#ed1212', '3d8c04fa-552d-43c0-b2fc-c49e0c9f6bf2'),
('c2ced438-d97e-4f1c-8a7c-f3a56de9b4d5', '2022-02-17 18:57:16', 'dsadasdas', '2022-02-15', '2022-02-28', 58, '962f6dcd-4565-4c0b-93a2-8dc309b337a2', '#00ff1e', '3d8c04fa-552d-43c0-b2fc-c49e0c9f6bf2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `capitulopresupuesto`
--

CREATE TABLE `capitulopresupuesto` (
  `uuid` varchar(100) NOT NULL,
  `creadoEn` timestamp NOT NULL DEFAULT current_timestamp(),
  `nombre` text NOT NULL,
  `descuento` int(11) NOT NULL DEFAULT 0,
  `uuidPresupuestoObra` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `capitulopresupuesto`
--

INSERT INTO `capitulopresupuesto` (`uuid`, `creadoEn`, `nombre`, `descuento`, `uuidPresupuestoObra`) VALUES
('0867e0f0-2cef-4cf6-9c97-43bb9b2bf300', '2022-04-01 01:48:23', 'Instalación de agua', 0, '5185e058-4571-47fd-abd8-84ba0fa9c633'),
('0d88ad6c-9969-459e-b783-9f8090139d1c', '2022-04-01 01:48:23', 'Estructura de Hormigón - Piso de Hormigón', 3, '5185e058-4571-47fd-abd8-84ba0fa9c633'),
('1b6fada0-d017-4a2e-9caf-df8039cf7415', '2022-04-01 01:48:23', 'Cielorraso', 0, '5185e058-4571-47fd-abd8-84ba0fa9c633'),
('1d3debb0-896b-47d2-93fe-a91a8652bfe2', '2022-03-30 21:49:38', 'Carpintería', 0, 'e0251f45-2ddf-4096-872a-99c319a09b40'),
('2a3b23e5-3385-4327-a803-ea80a19baed3', '2022-03-30 21:48:01', 'Piso Poliretanico', 1, 'e0251f45-2ddf-4096-872a-99c319a09b40'),
('2c90df14-b962-4dd2-be4f-4f06ebc17dde', '2022-04-01 01:48:23', 'Limpieza de obra', 0, '5185e058-4571-47fd-abd8-84ba0fa9c633'),
('3191b6e8-f84f-4bd9-8f7b-3116d89f30a4', '2022-03-30 21:49:45', 'Instalación Eléctrica', 0, 'e0251f45-2ddf-4096-872a-99c319a09b40'),
('34ef8c42-85b1-4026-8de8-d78f5ac31550', '2022-03-30 21:47:28', 'Demoliciones', 0, 'e0251f45-2ddf-4096-872a-99c319a09b40'),
('43baf6dc-5410-46da-898f-72e273d89030', '2022-04-01 01:48:23', 'Demoliciones', 0, '5185e058-4571-47fd-abd8-84ba0fa9c633'),
('49b0aa81-f4e8-4a3d-9aa7-cd6208f30689', '2022-03-30 21:47:41', 'Desagüe Industrial', 3, 'e0251f45-2ddf-4096-872a-99c319a09b40'),
('4c7b80ce-2db0-48c7-b96b-499d34e25d8f', '2022-04-01 01:48:23', 'Desagüe Industrial', 3, '5185e058-4571-47fd-abd8-84ba0fa9c633'),
('54408d6e-f7a6-4347-b7f0-b4edba0aa90e', '2022-04-01 01:48:23', 'Piso Poliretanico', 1, '5185e058-4571-47fd-abd8-84ba0fa9c633'),
('63c6be32-c9df-473b-9fa9-c068765ded0c', '2022-03-30 21:47:17', 'Tareas Previas', 0, 'e0251f45-2ddf-4096-872a-99c319a09b40'),
('6a0a8817-a570-4f47-b3f9-72b88dbc3ad2', '2022-04-01 01:48:23', 'Pintura', 0, '5185e058-4571-47fd-abd8-84ba0fa9c633'),
('9db9179d-2927-4d13-b15d-b17a389008bc', '2022-03-30 21:49:53', 'Instalación de agua', 0, 'e0251f45-2ddf-4096-872a-99c319a09b40'),
('9f31619a-6441-442e-ace3-acf09f3087f1', '2022-04-01 01:48:23', 'Instalación Eléctrica', 0, '5185e058-4571-47fd-abd8-84ba0fa9c633'),
('a4c20d02-6161-44a7-bfb0-5db4459d5bf4', '2022-04-01 01:48:23', 'Revestimientos', 2, '5185e058-4571-47fd-abd8-84ba0fa9c633'),
('ac4f8ef6-aea4-4ccf-8b53-6e80a687cfb0', '2022-03-30 21:50:00', 'Pintura', 0, 'e0251f45-2ddf-4096-872a-99c319a09b40'),
('b3be546e-62c4-478a-a556-51197e25a3f2', '2022-03-30 21:48:10', 'Mampostería piso de hormigón', 30, 'e0251f45-2ddf-4096-872a-99c319a09b40'),
('b91a9b5c-7440-4807-b661-8bb086395c0f', '2022-03-30 21:49:13', 'Revoques', 0, 'e0251f45-2ddf-4096-872a-99c319a09b40'),
('c884b424-64e7-4e29-b6a0-77f3e611129b', '2022-04-01 01:48:23', 'Mampostería piso de hormigón', 30, '5185e058-4571-47fd-abd8-84ba0fa9c633'),
('c96ec13a-e65a-4718-838b-4f40abc07a5d', '2022-04-01 01:48:23', 'Tareas Previas', 0, '5185e058-4571-47fd-abd8-84ba0fa9c633'),
('cf926cbf-3410-462a-a63a-0f24f4c7ecf1', '2022-04-01 01:48:23', 'Revoques', 0, '5185e058-4571-47fd-abd8-84ba0fa9c633'),
('d69f0aa3-a583-488e-af05-a25c9169409b', '2022-03-30 21:50:07', 'Limpieza de obra', 0, 'e0251f45-2ddf-4096-872a-99c319a09b40'),
('da0094f1-e3eb-412a-b2ea-f8483eadfe28', '2022-03-30 21:49:21', 'Revestimientos', 2, 'e0251f45-2ddf-4096-872a-99c319a09b40'),
('dd5df8f4-a389-4fdc-a013-7ef6ae727a72', '2022-04-01 01:48:23', 'Carpintería', 0, '5185e058-4571-47fd-abd8-84ba0fa9c633'),
('eda9d0b4-f7fa-4c6b-8888-f3f941e6bfbf', '2022-03-30 21:49:31', 'Cielorraso', 0, 'e0251f45-2ddf-4096-872a-99c319a09b40'),
('f8386c9c-d897-480d-a37d-92408da6cb1a', '2022-03-30 21:47:51', 'Estructura de Hormigón - Piso de Hormigón', 3, 'e0251f45-2ddf-4096-872a-99c319a09b40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carpetaproyecto`
--

CREATE TABLE `carpetaproyecto` (
  `uuid` varchar(100) NOT NULL,
  `creadoEn` timestamp NOT NULL DEFAULT current_timestamp(),
  `nombre` varchar(50) DEFAULT NULL,
  `fechaCreacion` date DEFAULT NULL,
  `uuidProyecto` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `carpetaproyecto`
--

INSERT INTO `carpetaproyecto` (`uuid`, `creadoEn`, `nombre`, `fechaCreacion`, `uuidProyecto`) VALUES
('0408c8b7-568e-4b41-8d32-1494526794e6', '2022-02-17 19:02:57', 'fsdfsd', '2022-02-17', '13f3af68-d552-4c54-bde6-816f474dd4ec'),
('4ac34ea3-a85a-49ba-a5e9-9c959e29dbd8', '2021-12-20 16:47:52', 'gghh', '2021-12-20', '13f3af68-d552-4c54-bde6-816f474dd4ec');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carritopedido`
--

CREATE TABLE `carritopedido` (
  `uuid` varchar(100) NOT NULL,
  `creadoEn` timestamp NOT NULL DEFAULT current_timestamp(),
  `cantidad` int(11) NOT NULL DEFAULT 1,
  `uuidProducto` varchar(100) NOT NULL,
  `uuidPedido` varchar(100) NOT NULL,
  `precio` decimal(15,2) NOT NULL,
  `descuento` decimal(15,2) NOT NULL DEFAULT 0.00,
  `nombre` varchar(300) NOT NULL,
  `descripcion` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `carritopedido`
--

INSERT INTO `carritopedido` (`uuid`, `creadoEn`, `cantidad`, `uuidProducto`, `uuidPedido`, `precio`, `descuento`, `nombre`, `descripcion`) VALUES
('33084c0e-8246-4cbd-962e-84423dd44d16', '2022-03-25 01:14:50', 1, 'fa97335b-3efd-499d-9ec2-78c49597a301', '26e59816-f126-47e6-ac2d-4a5abe607538', '300.00', '0.00', 'Escaleras para exterior con disenho minimalista de madera de pino', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Explicabo beatae quisquam, optio eligendi atque dicta minima labore dolor odio? Ex quos vel aliquid possimus officia obcaecati harum repellat autem quo!'),
('b42fc84e-48fd-4bfc-a482-5afb4fbdbc2b', '2022-03-25 01:14:50', 1, '890d6295-ad7a-481f-acf0-c608c5e7a9df', '26e59816-f126-47e6-ac2d-4a5abe607538', '5000.00', '0.00', 'Escaleras de madera de abeto para interior', 'Abada Gen Increpar Incorporal Abadejo Bastonada Engastador Abajadero Abacorar. Geminar Generador Abajo Abacorar Batán Ficticio Cendal Ficha. Cendrazo Cenata Gemoterapia Incrédulo. Engarrafador Batallador Abajeño Incrédulo Abajo Engarrar Cenata Generador. Engarberar Descepar Incorporal Incordio Gemoso Incredibilidad Fichar Fice Ceneque Gemiquear.'),
('df3f9949-6fa9-4e10-8700-4690cab32048', '2022-03-25 01:14:50', 1, 'b84f59d3-650e-4cb6-815d-cec6bfc49ac0', '26e59816-f126-47e6-ac2d-4a5abe607538', '1000.00', '0.00', 'Escaleras minimalistas para interior de Abeto', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carritoproducto`
--

CREATE TABLE `carritoproducto` (
  `uuid` varchar(100) NOT NULL,
  `creadoEn` timestamp NOT NULL DEFAULT current_timestamp(),
  `cantidad` int(11) NOT NULL DEFAULT 1,
  `uuidProducto` varchar(100) NOT NULL,
  `uuidCliente` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `carritoproducto`
--

INSERT INTO `carritoproducto` (`uuid`, `creadoEn`, `cantidad`, `uuidProducto`, `uuidCliente`) VALUES
('b66e6474-8788-4bcc-8132-f15079f2487f', '2022-03-30 18:44:38', 5, 'fa97335b-3efd-499d-9ec2-78c49597a301', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoriaproducto`
--

CREATE TABLE `categoriaproducto` (
  `uuid` varchar(100) NOT NULL,
  `creadoEn` timestamp NOT NULL DEFAULT current_timestamp(),
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `keyName` text NOT NULL,
  `fileName` text NOT NULL,
  `location` text NOT NULL,
  `size` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categoriaproducto`
--

INSERT INTO `categoriaproducto` (`uuid`, `creadoEn`, `nombre`, `descripcion`, `keyName`, `fileName`, `location`, `size`, `estado`) VALUES
('152054a7-2d6f-4975-8d2f-9fb7c009070d', '2021-11-25 00:55:51', 'sillas', '', 'liraki/images/98df930d-4332-4246-aa98-e4d53ae21130.jfif', 'images (1).jfif', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/98df930d-4332-4246-aa98-e4d53ae21130.jfif', 6128, 1),
('17ec4924-cf46-44c8-b814-69f1c0ab6548', '2021-11-25 00:52:44', 'mesas', 'Gemir Batallador Bate Increíble.', 'liraki/images/7a946046-7c6f-4ced-8cfd-b7bd53faa300.jfif', 'images.jfif', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/7a946046-7c6f-4ced-8cfd-b7bd53faa300.jfif', 4361, 1),
('4c4c0f7a-e3ed-41b9-b169-8815bf8b9fb3', '2021-11-25 00:55:10', 'mesedoras', '', 'liraki/images/2268c0a9-ed38-4b3f-aab6-d56fcd05375e.jpg', 'images.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/2268c0a9-ed38-4b3f-aab6-d56fcd05375e.jpg', 7586, 1),
('66ae0979-62d4-426f-bab4-8d72a04198df', '2021-11-25 00:54:32', 'vigas', '', 'liraki/images/13d5b723-ed41-4623-bcf1-c4a6f2b9b49f.jpg', 'download.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/13d5b723-ed41-4623-bcf1-c4a6f2b9b49f.jpg', 8824, 1),
('6a8376c6-319a-46dc-90fb-3410e4381b9e', '2021-11-25 00:58:23', 'abeto', ' Es una madera clara, blanca-amarillenta y fácil de trabajar. Se utiliza para fabricar muebles, instrumentos musicales, puertas y ventanas, y es muy común en el sector de la construcción.', 'liraki/images/c90d4a14-6bce-41ff-9248-94521fd05f8f.jpg', 'download.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/c90d4a14-6bce-41ff-9248-94521fd05f8f.jpg', 4654, 1),
('6d518b5c-ca45-4fd8-9ce2-be076a35b264', '2021-11-25 00:53:14', 'vitrinas', 'Cencerra Cenagoso Descensión.', 'liraki/images/306ca26f-a1e6-4541-850b-0d255f3db26b.jpg', 'vitrina.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/306ca26f-a1e6-4541-850b-0d255f3db26b.jpg', 60664, 1),
('718abba8-fd1d-490c-9ecc-81addc302a35', '2021-11-25 01:01:47', 'escaleras', '', 'liraki/images/ae125ea3-754d-443b-ae38-eea3cd63aa36.jpg', '147dd59123e82286621c0e5f50aaa665.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/ae125ea3-754d-443b-ae38-eea3cd63aa36.jpg', 12396, 1),
('739b3a09-2ee4-49f5-a07f-c309d2730443', '2021-11-25 01:00:41', 'armarios', '', 'liraki/images/d1ecc64b-3e38-45d5-a734-326daafc707c.jfif', 'images.jfif', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/d1ecc64b-3e38-45d5-a734-326daafc707c.jfif', 5729, 1),
('805ab00f-c607-42bc-9d20-60dfd58763db', '2021-11-25 00:52:11', 'marcos de ventanas', 'Batanar Abaldonadamente Abajamiento Fidecomiso.', 'liraki/images/c7c214c7-933e-4ef5-92f1-c9f5571e1a12.jfif', 'descarga.jfif', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/c7c214c7-933e-4ef5-92f1-c9f5571e1a12.jfif', 5946, 1),
('8cec5a20-206d-4b57-a021-24aa340f1f51', '2021-11-25 00:58:53', 'pino', 'Es muy fácil trabajar con el pino y, como la mayoría de las variedades que son relativamente suaves, se presta a la escultura.', 'liraki/images/f9709763-6632-4d6b-b7be-071260e08263.jpg', 'download.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/f9709763-6632-4d6b-b7be-071260e08263.jpg', 3351, 1),
('8f7a06df-bfd3-4fc4-92fb-12ee1e65250e', '2021-11-25 00:59:12', 'cedro', 'El tipo más común de cedro es la variedad roja occidental. El cedro tiene un color rojizo , este tipo de madera es relativamente suave, tiene un grano recto y un olor ligeramente aromático', 'liraki/images/444cfe9a-99fa-4874-a2c1-1fc618223193.jpg', 'download.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/444cfe9a-99fa-4874-a2c1-1fc618223193.jpg', 3451, 1),
('939b6e45-82ea-4c94-8bbb-dd87eba0adda', '2021-11-25 01:00:25', 'madera nogal', 'Hoy en día se utiliza mucho para revestimientos de lujo: muebles, armarios, puertas, adornos y elementos torneados.\n\nmuebles, pero también para suelos y paredes.', 'liraki/images/298d519b-2eed-4d9f-a771-2f46a2e17a95.jpg', 'Textura-madera-nogal-oscuro.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/298d519b-2eed-4d9f-a771-2f46a2e17a95.jpg', 904676, 1),
('e90fdffe-e621-4c27-8d14-bfa8de0b2418', '2021-11-25 01:08:01', 'pisos', 'pisos de madera aplicable al concreto', 'liraki/images/c06a70f6-ad20-4d90-84d1-47e6729c6c10.jpg', 'eliminar-crujidos-suelos-madera-xl-848x477x80xX.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/c06a70f6-ad20-4d90-84d1-47e6729c6c10.jpg', 91596, 1),
('ec2400a2-78ee-4ec8-8399-cbcc1c23cb5b', '2021-11-25 00:50:14', 'puertas', 'Descifrador Cencerrear Engargolado Generación Cenegar Fichaje Bastoncillo Cenata Batato.', 'liraki/images/f4457cf4-efe3-46d1-8d11-852291e7e288.png', '5ecd72d5e8af153da5d9ab44_5e744da8c5732f8e7bb01277_big5-2.png', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/f4457cf4-efe3-46d1-8d11-852291e7e288.png', 301604, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conceptoventa`
--

CREATE TABLE `conceptoventa` (
  `uuid` varchar(100) NOT NULL,
  `creadoEn` timestamp NOT NULL DEFAULT current_timestamp(),
  `cantidad` int(11) NOT NULL,
  `precioUnitario` decimal(16,2) NOT NULL,
  `importe` decimal(16,2) NOT NULL,
  `descuento` decimal(15,2) NOT NULL DEFAULT 0.00,
  `uuidProducto` varchar(100) NOT NULL,
  `uuidVenta` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `conceptoventa`
--

INSERT INTO `conceptoventa` (`uuid`, `creadoEn`, `cantidad`, `precioUnitario`, `importe`, `descuento`, `uuidProducto`, `uuidVenta`) VALUES
('11d38ecc-4eea-4f49-be74-571da3e3e667', '2022-03-29 18:30:50', 1, '1000.00', '1000.00', '0.00', 'b84f59d3-650e-4cb6-815d-cec6bfc49ac0', '72d9fe3f-30bf-4824-88c7-aeabf501955a'),
('16681a33-1c63-4cc8-ad76-929d338b627f', '2022-03-29 18:31:42', 1, '100.00', '100.00', '0.00', '7307299d-ec02-4f52-98d0-baf027033698', '43121aeb-3c5c-495f-aaef-901abaf0a187'),
('23149635-0bd6-4943-9991-123332d00437', '2022-03-28 20:32:10', 1, '200.00', '200.00', '0.00', 'ad8325f8-1f19-4364-8a1f-0d85732d7d71', '3cc11389-8cf3-47f1-a410-11e1d5f28786'),
('39c349a3-582b-471f-a388-f11559052b7d', '2022-03-30 02:55:01', 3, '700.00', '2037.00', '3.00', '2fe5ff3e-f808-4e6d-916a-d4959bb87227', '79de7552-0d78-4769-a4a6-f9aeb387cdb9'),
('49fe99f6-9207-4f5c-a598-800f5301d982', '2022-03-30 16:50:53', 1, '150.00', '90.00', '40.00', '7e92e09b-7a2a-44ba-b2c9-21a0bc9b7d63', 'cc4f12ad-e21c-4dda-a569-0317a59f8bc7'),
('62aafcfa-6647-446e-bc0f-52d58c651ff2', '2022-03-28 20:32:22', 2, '500.00', '950.00', '5.00', 'ec428dc7-a821-4b21-b16b-c9f98f88687c', '9b4fc1b7-5384-4cdf-9666-d8a468bbe447'),
('8bc11ef8-136c-4acb-915d-7e100305b038', '2022-03-28 19:55:23', 1, '300.00', '300.00', '0.00', 'fa97335b-3efd-499d-9ec2-78c49597a301', '68ffeb5b-40f9-4b98-bea7-701c793707d1'),
('9405f14e-1a8d-419c-b932-54c2b4b37e94', '2022-03-28 20:30:48', 1, '100.00', '100.00', '0.00', '7307299d-ec02-4f52-98d0-baf027033698', 'f5146dff-9e4c-41e3-8088-0d9e51d11216'),
('94e3d057-a76a-4582-803e-ed59bd397200', '2022-03-30 16:50:20', 1, '700.00', '700.00', '0.00', '5e916855-3d48-46b5-b2ab-47cffea85be7', '29c54bef-6ab0-436d-becf-6ce650767285'),
('c3b7759d-97dd-4aa7-86f5-122ecdd0a303', '2022-03-28 20:32:10', 5, '700.00', '3395.00', '3.00', '2fe5ff3e-f808-4e6d-916a-d4959bb87227', '3cc11389-8cf3-47f1-a410-11e1d5f28786'),
('d3ceda5f-2e7d-48c1-b98e-bd452df8ccf0', '2022-03-28 19:55:23', 1, '500.00', '475.00', '5.00', 'ec428dc7-a821-4b21-b16b-c9f98f88687c', '68ffeb5b-40f9-4b98-bea7-701c793707d1'),
('dd3d3b4d-4d30-401c-a94d-e60969bc715c', '2022-03-28 20:30:48', 1, '1000.00', '1000.00', '0.00', 'b84f59d3-650e-4cb6-815d-cec6bfc49ac0', 'f5146dff-9e4c-41e3-8088-0d9e51d11216');

--
-- Disparadores `conceptoventa`
--
DELIMITER $$
CREATE TRIGGER `delete_ventaConcepto_trigger` AFTER DELETE ON `conceptoventa` FOR EACH ROW BEGIN
    UPDATE producto AS p
    INNER JOIN conceptoventa c on p.uuid = c.uuidProducto
    INNER JOIN venta v on c.uuidVenta = v.uuid
    SET p.stock = p.stock + OLD.cantidad
    WHERE p.uuid = OLD.uuidProducto AND v.estado != 'pendiente' AND v.estado!= 'pagando';
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_conceptoVenta_trigger` AFTER INSERT ON `conceptoventa` FOR EACH ROW BEGIN
    UPDATE producto AS p
        INNER JOIN conceptoventa c on p.uuid = c.uuidProducto
        INNER JOIN venta v on c.uuidVenta = v.uuid
    SET p.stock = p.stock - NEW.cantidad
    WHERE p.uuid = NEW.uuidProducto
      AND v.estado != 'pendiente' AND v.estado!= 'pagando' AND NEW.uuid = c.uuid;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallecapitulo`
--

CREATE TABLE `detallecapitulo` (
  `uuid` varchar(100) NOT NULL,
  `creadoEn` timestamp NOT NULL DEFAULT current_timestamp(),
  `descripcion` text NOT NULL,
  `unidad` varchar(10) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precioUnitario` decimal(15,2) NOT NULL,
  `uuidCapituloPresupuesto` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detallecapitulo`
--

INSERT INTO `detallecapitulo` (`uuid`, `creadoEn`, `descripcion`, `unidad`, `cantidad`, `precioUnitario`, `uuidCapituloPresupuesto`) VALUES
('00c2ae12-36df-47a6-ade5-3b9de5c341fa', '2022-03-30 22:09:48', 'Llave esférica de corte 3/4', 'N/A', 3, '543.00', '9db9179d-2927-4d13-b15d-b17a389008bc'),
('01f4fbb3-adf6-43ca-b98b-9e28e29c95f8', '2022-03-30 21:56:13', 'Conexión y empalme a cámara existente.', 'N/A', 6, '654.00', '49b0aa81-f4e8-4a3d-9aa7-cd6208f30689'),
('07b5d9eb-ba67-4028-b39f-93f5f271aea4', '2022-03-30 21:58:16', 'Lijado preparación de subbase nivelación / pisos nuevos', 'm²', 4, '658.00', '2a3b23e5-3385-4327-a803-ea80a19baed3'),
('0e191a9e-d3d0-473e-952e-ace53b0505a8', '2022-04-01 01:48:23', 'Revoque grueso bajo revestimiento', 'm²', 3, '432.00', 'cf926cbf-3410-462a-a63a-0f24f4c7ecf1'),
('0ef723fa-5341-47cb-8204-8d2867df31e8', '2022-03-30 22:03:06', 'Azotado de concreto c/hidrófugo', 'm²', 4, '856.00', 'b91a9b5c-7440-4807-b661-8bb086395c0f'),
('136fed03-39e2-48a2-b277-e7cf7764b34f', '2022-04-01 01:48:23', 'Cortinas de bandas de PVC. 1,60X2,05 con soporte aº. Inox..', 'N/A', 2, '3254.00', 'dd5df8f4-a389-4fdc-a013-7ef6ae727a72'),
('1609bb27-f5bd-4c26-a0f3-e69b906038f6', '2022-03-30 22:03:35', 'Malla de Fibra de vidrio', 'm²', 2, '756.00', 'b91a9b5c-7440-4807-b661-8bb086395c0f'),
('1b4306a3-fcc6-488f-b1f5-1f852b84b668', '2022-03-30 21:56:04', 'Canal de desagüe 0,30x2,10 con c/marco y reja ac.inox.', 'N/A', 4, '654.00', '49b0aa81-f4e8-4a3d-9aa7-cd6208f30689'),
('1c26e74f-8e0c-4ee5-bc59-2d49a4307e4a', '2022-04-01 01:48:23', 'Puerta de abrir 0,80x2,00 tipo P1 C/CERRAD/VIDRIOS LAM/ CIERRAP.', 'N/A', 3, '756.00', 'dd5df8f4-a389-4fdc-a013-7ef6ae727a72'),
('1d3e3c59-0350-401e-a7ff-23df5c6a4726', '2022-04-01 01:48:23', 'Aserrado y nivelación piso Sala de Jugos y canaleta desag.  Esp. 0,10', 'N/A', 6, '423.00', '43baf6dc-5410-46da-898f-72e273d89030'),
('1e6aa7f4-d2e3-4959-a69e-4bd246e28c67', '2022-04-01 01:48:23', 'Aserrado y demolición piso de hº. Desag. Sala CIP', 'N/A', 1, '3.00', '43baf6dc-5410-46da-898f-72e273d89030'),
('214b4c07-4f13-430e-990c-1106011fe3fd', '2022-04-01 01:48:23', 'Llave esférica de corte 3/4', 'N/A', 3, '543.00', '0867e0f0-2cef-4cf6-9c97-43bb9b2bf300'),
('21978deb-e9a1-4f4b-aa8f-5ee015d2f847', '2022-04-01 01:48:23', 'Demolición de mampostería de bloques', 'N/A', 4, '756.00', '43baf6dc-5410-46da-898f-72e273d89030'),
('2e15e2ce-a0c0-43a2-986b-07dd67d2c99d', '2022-04-01 01:48:23', 'Cañería termofusión 3/4\"', 'ml', 7, '534.00', '0867e0f0-2cef-4cf6-9c97-43bb9b2bf300'),
('3537b7e5-95be-4e2c-b8d0-3ef75c3647d8', '2022-04-01 01:48:23', 'Conexión y empalme a cámara existente.', 'N/A', 6, '654.00', '4c7b80ce-2db0-48c7-b96b-499d34e25d8f'),
('371bcedc-6694-45b8-9652-a0a80b3ee43b', '2022-03-30 21:54:41', 'Demolición de mampostería de bloques', 'N/A', 4, '756.00', '34ef8c42-85b1-4026-8de8-d78f5ac31550'),
('37238e85-34f0-4585-954d-de621a40135d', '2022-04-01 01:48:23', 'Flexibles 1/2\"', 'N/A', 2, '12.00', '0867e0f0-2cef-4cf6-9c97-43bb9b2bf300'),
('381aa6ee-df79-4242-a5d1-739caed2fec3', '2022-04-01 01:48:23', 'Obrador - Baños Químicos', 'N/A', 2, '432.00', 'c96ec13a-e65a-4718-838b-4f40abc07a5d'),
('3e60129f-66bc-4f3e-b599-8cf8a4ff9519', '2022-03-30 21:53:21', 'Represent. Técnico', 'N/A', 6, '654645.00', '63c6be32-c9df-473b-9fa9-c068765ded0c'),
('3f86f144-47e1-4e7b-8337-f77d90b3d918', '2022-04-01 01:48:23', 'Canalización pared', 'm', 3, '534.00', '9f31619a-6441-442e-ace3-acf09f3087f1'),
('40e3d3e5-5128-463a-aba1-5bbc81b00027', '2022-04-01 01:48:23', 'Azotado de concreto c/hidrófugo', 'm²', 4, '856.00', 'cf926cbf-3410-462a-a63a-0f24f4c7ecf1'),
('470c19f3-8e98-4791-95e2-d87cf24df38a', '2022-04-01 01:48:23', 'Desmontar frente 3,10x3,70', 'N/A', 6, '534.00', 'dd5df8f4-a389-4fdc-a013-7ef6ae727a72'),
('47c8a860-9f9d-443c-a443-5b3692551999', '2022-04-01 01:48:23', 'Columnas de refuerzo con bloques 0,20x0,20x4,00  (19x19x39)', 'ml', 6, '432.00', 'c884b424-64e7-4e29-b6a0-77f3e611129b'),
('48934f55-c1d3-4163-8d85-8238107131ca', '2022-03-30 22:08:02', 'Puerta de abrir 0,80x2,00 tipo P1 C/CERRAD/VIDRIOS LAM/ CIERRAP.', 'N/A', 3, '756.00', '1d3debb0-896b-47d2-93fe-a91a8652bfe2'),
('4dc94152-a06f-4a86-939d-4119ffd1853f', '2022-04-01 01:48:23', 'Mampostería bloques de hormigón 12x19x39 lisos estándar (19x19x39)', 'm²', 9, '46545.00', 'c884b424-64e7-4e29-b6a0-77f3e611129b'),
('4e30ab9f-89c5-4773-935a-05d7f4a81a7e', '2022-03-30 22:09:18', 'Instalación cañería con 2 bocas', 'gal', 5, '756756.00', '3191b6e8-f84f-4bd9-8f7b-3116d89f30a4'),
('52dee65d-59dc-4d66-8e63-a54a555dbf23', '2022-03-30 22:01:17', 'Laca antirayado', 'm²', 5, '756.00', '2a3b23e5-3385-4327-a803-ea80a19baed3'),
('531db7c4-73f5-491e-be4f-05e77d26cd30', '2022-03-30 22:08:16', 'Desmontar frente 3,10x3,70', 'N/A', 6, '534.00', '1d3debb0-896b-47d2-93fe-a91a8652bfe2'),
('55a8fa9f-7c71-47ae-8c1b-f0c2baae11b4', '2022-03-30 22:07:51', 'Frente vidriado de paños fijos 2,20x3,70 tipo M2', 'N/A', 6, '321.00', '1d3debb0-896b-47d2-93fe-a91a8652bfe2'),
('5862c82d-d85c-440f-b306-e7b25f65d9fa', '2022-04-01 01:48:23', 'Grifería tipo FV Monocomando', 'N/A', 4, '321.00', '0867e0f0-2cef-4cf6-9c97-43bb9b2bf300'),
('5aa77690-8f60-4f43-99cf-ebb0005a807f', '2022-04-01 01:48:23', 'Canal de desagüe 0,30x2,10 con c/marco y reja ac.inox.', 'N/A', 4, '654.00', '4c7b80ce-2db0-48c7-b96b-499d34e25d8f'),
('5ac121fc-b3eb-4510-b040-7680523ac6af', '2022-04-01 01:48:23', 'Viga encadenado sobre mampostería de bloques de hormigón 0,20x0,20', 'ml', 2, '423.00', '0d88ad6c-9969-459e-b783-9f8090139d1c'),
('5d2c9eec-6766-49b2-a73e-6709c321f53c', '2022-04-01 01:48:23', 'Represent. Técnico', 'N/A', 6, '654645.00', 'c96ec13a-e65a-4718-838b-4f40abc07a5d'),
('5ecce96c-3cbe-4e2e-bb4c-5d7d3233f56f', '2022-03-30 22:10:46', 'Imprimación', 'm²', 8, '312.00', 'ac4f8ef6-aea4-4ccf-8b53-6e80a687cfb0'),
('60ea34e0-b717-4100-852f-cb313bd8444f', '2022-03-30 21:54:16', 'Aserrado y demolic. Piso sobrepuesto sector Presala esp. 0,20', 'N/A', 7, '786.00', '34ef8c42-85b1-4026-8de8-d78f5ac31550'),
('62f6e480-a39d-463b-9cdd-916527bb2810', '2022-03-30 22:06:43', 'Cielorraso desmontable de Placa Durlock 0,60x1,21 ', 'm²', 7, '312.00', 'eda9d0b4-f7fa-4c6b-8888-f3f941e6bfbf'),
('656325a4-8352-4e1f-ae46-18deb7c32bc3', '2022-03-30 22:02:23', 'Mampostería bloques de hormigón 12x19x39 lisos estándar (19x19x39)', 'm²', 9, '46545.00', 'b3be546e-62c4-478a-a556-51197e25a3f2'),
('6b9225af-92fc-4d40-8c3e-973afa15f43f', '2022-03-30 21:53:32', 'Cerramiento de aislación del sector (estructura tubular + film pe. 200mc.)30,00X4,50', 'N/A', 1, '321.00', '63c6be32-c9df-473b-9fa9-c068765ded0c'),
('6eb0c9f8-9b16-4cee-b0ff-e0ed506d667e', '2022-03-30 22:10:58', 'Pintura al latex uso exterior antihongo repintado gral.', 'm²', 6, '312.00', 'ac4f8ef6-aea4-4ccf-8b53-6e80a687cfb0'),
('6f8f94b9-1dfe-405f-90a4-eab5d06478e0', '2022-03-30 22:07:42', 'Frente vidriado de paños fijos 3,95x3,70 TIPO  M1', 'N/A', 3, '312.00', '1d3debb0-896b-47d2-93fe-a91a8652bfe2'),
('78b7a8be-8fe1-4c0e-b7a3-08af4b1956e4', '2022-04-01 01:48:23', 'Frente vidriado de paños fijos 3,95x3,70 TIPO  M1', 'N/A', 3, '312.00', 'dd5df8f4-a389-4fdc-a013-7ef6ae727a72'),
('79feb2de-a44a-4c1b-8b69-ce731bd63686', '2022-03-30 22:08:10', 'Desmontar frente 3,10x3,70', 'N/A', 2, '312.00', '1d3debb0-896b-47d2-93fe-a91a8652bfe2'),
('7b83eaaf-9a03-491e-b793-3643fa818c51', '2022-04-01 01:48:23', 'Serv. Seg. Higiene', 'N/A', 2, '534.00', 'c96ec13a-e65a-4718-838b-4f40abc07a5d'),
('7bb8b283-6186-4816-beb0-c03c684baf2a', '2022-03-30 22:00:43', 'Mortero de nivelación', 'm²', 2, '765.00', '2a3b23e5-3385-4327-a803-ea80a19baed3'),
('7c6faee5-ef31-4e27-a707-04789f6f5c2c', '2022-03-30 22:08:24', 'Cortinas de bandas de PVC. 1,60X2,05 con soporte aº. Inox..', 'N/A', 2, '3254.00', '1d3debb0-896b-47d2-93fe-a91a8652bfe2'),
('7d85280f-5868-4e9f-8e4a-911fa14d4e75', '2022-04-01 01:48:23', 'Mortero de nivelación', 'm²', 2, '765.00', '54408d6e-f7a6-4347-b7f0-b4edba0aa90e'),
('814071d6-7626-4c9c-959a-d101ef04c3ab', '2022-04-01 01:48:23', 'Cañería pvc. D:0,064', 'ml', 3, '423.00', '4c7b80ce-2db0-48c7-b96b-499d34e25d8f'),
('83fafeaf-a6a4-42ec-b6b6-c4952c2775e5', '2022-04-01 01:48:23', 'Piso de hº. ESP.0,20', 'm²', 1, '765.00', '0d88ad6c-9969-459e-b783-9f8090139d1c'),
('8c17e243-e761-417b-a15c-99495550d8c1', '2022-04-01 01:48:23', 'Llave de paso 1/2\"', 'N/A', 2, '423.00', '0867e0f0-2cef-4cf6-9c97-43bb9b2bf300'),
('927e9cc6-12d4-42ed-9c29-3fa0bc59e0bc', '2022-03-30 22:10:27', 'Grifería tipo FV Monocomando', 'N/A', 4, '321.00', '9db9179d-2927-4d13-b15d-b17a389008bc'),
('92f21dbd-9c29-4257-b22c-19347c00d0eb', '2022-04-01 01:48:23', '', '', 0, '0.00', 'a4c20d02-6161-44a7-bfb0-5db4459d5bf4'),
('940a79d9-da28-48d9-920d-815419643496', '2022-04-01 01:48:23', 'Enduido poliuretánico', 'm²', 3, '432.00', '54408d6e-f7a6-4347-b7f0-b4edba0aa90e'),
('979263b2-e56a-4104-8fd4-a40ab5919239', '2022-03-30 22:02:42', 'Columnas de refuerzo con bloques 0,20x0,20x4,00  (19x19x39)', 'ml', 6, '432.00', 'b3be546e-62c4-478a-a556-51197e25a3f2'),
('98c85181-38ee-4ca5-9336-9cb59dc9590e', '2022-04-01 01:48:23', 'Desmontar frente 3,10x3,70', 'N/A', 2, '312.00', 'dd5df8f4-a389-4fdc-a013-7ef6ae727a72'),
('9e411136-f571-439b-9549-eeca2fbe01ff', '2022-03-30 22:00:57', 'Enduido poliuretánico', 'm²', 3, '432.00', '2a3b23e5-3385-4327-a803-ea80a19baed3'),
('9fb152f6-6a05-4b00-81a5-a745d5fc8fe8', '2022-04-01 01:48:23', 'Cielorraso desmontable de Placa Durlock 0,60x1,21 ', 'm²', 7, '312.00', '1b6fada0-d017-4a2e-9caf-df8039cf7415'),
('9fcd007c-8d5a-4cc1-b67d-9a14bd1dc62e', '2022-04-01 01:48:23', 'Instalación cañería con 2 bocas', 'gal', 5, '756756.00', '9f31619a-6441-442e-ace3-acf09f3087f1'),
('a482819d-1b1e-491a-be5e-5d9c6633e626', '2022-04-01 01:48:23', 'Pintura al latex uso exterior antihongo repintado gral.', 'm²', 6, '312.00', '6a0a8817-a570-4f47-b3f9-72b88dbc3ad2'),
('a924292c-4e04-493e-8683-e61383ae034b', '2022-03-30 22:09:35', 'Cañería termofusión 3/4\"', 'ml', 7, '534.00', '9db9179d-2927-4d13-b15d-b17a389008bc'),
('aa646ccb-f80a-4921-8aeb-38b466c3173b', '2022-03-30 22:10:14', 'Flexibles 1/2\"', 'N/A', 2, '12.00', '9db9179d-2927-4d13-b15d-b17a389008bc'),
('b3c29ed7-0861-4210-876e-56e3462b4f64', '2022-03-30 21:54:08', 'Aserrado y demolición piso de hº. Desag. Sala CIP', 'N/A', 1, '3.00', '34ef8c42-85b1-4026-8de8-d78f5ac31550'),
('b977c0b4-46e7-4c12-9deb-3bcc1bcff77d', '2022-04-01 01:48:23', 'Cerramiento de aislación del sector (estructura tubular + film pe. 200mc.)30,00X4,50', 'N/A', 1, '321.00', 'c96ec13a-e65a-4718-838b-4f40abc07a5d'),
('ba69fb05-b97c-428a-98a1-3b93089ed036', '2022-04-01 01:48:23', 'Lijado preparación de subbase nivelación / pisos nuevos', 'm²', 4, '658.00', '54408d6e-f7a6-4347-b7f0-b4edba0aa90e'),
('bb3e2b52-ed2d-4699-ad7f-0f3011f3e429', '2022-03-30 21:57:17', 'Piso de hº. ESP.0,20', 'm²', 1, '765.00', 'f8386c9c-d897-480d-a37d-92408da6cb1a'),
('bc74516c-1507-44ca-95d3-1df17614a02b', '2022-04-01 01:48:23', 'Aserrado y demolic. Piso sobrepuesto sector Presala esp. 0,20', 'N/A', 7, '786.00', '43baf6dc-5410-46da-898f-72e273d89030'),
('bcec7686-5f59-49b0-979a-f166a4ca93ee', '2022-03-30 22:03:21', 'Revoque grueso bajo revestimiento', 'm²', 3, '432.00', 'b91a9b5c-7440-4807-b661-8bb086395c0f'),
('bd9cc3c3-0356-42e6-a5bf-b7633e3e71aa', '2022-03-30 21:57:35', 'Zócalo sanitario', 'ml', 1, '423.00', 'f8386c9c-d897-480d-a37d-92408da6cb1a'),
('c2a863d9-21ae-41f5-9909-d3ef41bac44b', '2022-03-30 21:56:54', 'Viga encadenado sobre mampostería de bloques de hormigón 0,20x0,20', 'ml', 2, '423.00', 'f8386c9c-d897-480d-a37d-92408da6cb1a'),
('c4293a08-ba96-4e8c-8d3b-dba36fedfbf8', '2022-03-30 21:54:29', 'Aserrado y nivelación piso Sala de Jugos y canaleta desag.  Esp. 0,10', 'N/A', 6, '423.00', '34ef8c42-85b1-4026-8de8-d78f5ac31550'),
('c5c5d199-77f7-47d9-abc3-05d1c64d4c84', '2022-04-01 01:48:23', 'Imprimación', 'm²', 8, '312.00', '6a0a8817-a570-4f47-b3f9-72b88dbc3ad2'),
('cd6134d0-90df-47d2-b557-4680139684f1', '2022-04-01 01:48:23', 'Zócalo sanitario', 'ml', 1, '423.00', '0d88ad6c-9969-459e-b783-9f8090139d1c'),
('ce61231f-08b9-45bd-a06e-ed2aecf1a7ac', '2022-04-01 01:48:23', 'Limpieza de obra', 'hr', 1, '534.00', '2c90df14-b962-4dd2-be4f-4f06ebc17dde'),
('d0217f4d-59fc-4f06-a112-979e03a67498', '2022-04-01 01:48:23', 'Frente vidriado de paños fijos 2,20x3,70 tipo M2', 'N/A', 6, '321.00', 'dd5df8f4-a389-4fdc-a013-7ef6ae727a72'),
('d185cacc-85b6-4f0b-af12-a6e84df33ddc', '2022-04-01 01:48:23', 'Reconstrucción piso de hormigón esp. 0,20', 'N/A', 3, '435.00', '4c7b80ce-2db0-48c7-b96b-499d34e25d8f'),
('d8bd8066-8589-45a3-9a37-b93433819d25', '2022-03-30 22:11:18', 'Limpieza de obra', 'hr', 1, '534.00', 'd69f0aa3-a583-488e-af05-a25c9169409b'),
('e5d89aa1-c6e1-46e3-a433-b54e42cf0573', '2022-03-30 22:10:00', 'Llave de paso 1/2\"', 'N/A', 2, '423.00', '9db9179d-2927-4d13-b15d-b17a389008bc'),
('e8b5652a-adb3-4a38-9b17-5a33a2521438', '2022-04-01 01:48:23', 'Laca antirayado', 'm²', 5, '756.00', '54408d6e-f7a6-4347-b7f0-b4edba0aa90e'),
('ef850cbb-4a67-4991-be55-bac27ae35b1c', '2022-03-30 21:52:24', 'Obrador - Baños Químicos', 'N/A', 2, '432.00', '63c6be32-c9df-473b-9fa9-c068765ded0c'),
('f355d92b-8991-4f5b-a7b2-78c2a36c3b37', '2022-03-30 21:55:54', 'Cañería pvc. D:0,064', 'ml', 3, '423.00', '49b0aa81-f4e8-4a3d-9aa7-cd6208f30689'),
('f6725a53-afd8-4085-b6bc-0eb03a13eeb4', '2022-04-01 01:48:23', 'Malla de Fibra de vidrio', 'm²', 2, '756.00', 'cf926cbf-3410-462a-a63a-0f24f4c7ecf1'),
('f72264ec-0861-4572-8139-8d7c90965b59', '2022-03-30 22:08:50', 'Canalización pared', 'm', 3, '534.00', '3191b6e8-f84f-4bd9-8f7b-3116d89f30a4'),
('f9988457-9b78-440c-b484-be5f0238d8e4', '2022-03-30 21:53:12', 'Serv. Seg. Higiene', 'N/A', 2, '534.00', '63c6be32-c9df-473b-9fa9-c068765ded0c'),
('fca9b39c-8ea8-4b4c-a9f5-47d191836c0f', '2022-03-30 21:56:22', 'Reconstrucción piso de hormigón esp. 0,20', 'N/A', 3, '435.00', '49b0aa81-f4e8-4a3d-9aa7-cd6208f30689');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallecategoriaproducto`
--

CREATE TABLE `detallecategoriaproducto` (
  `uuid` varchar(100) NOT NULL,
  `uuidCategoria` varchar(100) DEFAULT NULL,
  `uuidProducto` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detallecategoriaproducto`
--

INSERT INTO `detallecategoriaproducto` (`uuid`, `uuidCategoria`, `uuidProducto`) VALUES
('053a6545-ba8a-40c5-a2fb-85dea6fd2dac', '805ab00f-c607-42bc-9d20-60dfd58763db', '5e916855-3d48-46b5-b2ab-47cffea85be7'),
('1380a6af-1b18-4fcf-b9e4-b6ddc4a0f0bc', '6a8376c6-319a-46dc-90fb-3410e4381b9e', 'b84f59d3-650e-4cb6-815d-cec6bfc49ac0'),
('1bfa5879-f181-492c-9c47-b522fb3e5681', '718abba8-fd1d-490c-9ecc-81addc302a35', '890d6295-ad7a-481f-acf0-c608c5e7a9df'),
('2518ad42-6894-4997-836b-798ace79cb5e', 'ec2400a2-78ee-4ec8-8399-cbcc1c23cb5b', '7307299d-ec02-4f52-98d0-baf027033698'),
('2c74628c-d1dc-4245-b761-264dcfc1cc6a', '8f7a06df-bfd3-4fc4-92fb-12ee1e65250e', '7307299d-ec02-4f52-98d0-baf027033698'),
('4453f1a4-464c-4152-8b2f-b21ea86d7401', '8f7a06df-bfd3-4fc4-92fb-12ee1e65250e', '2fe5ff3e-f808-4e6d-916a-d4959bb87227'),
('4fbb4165-4930-42ff-96b2-56eb2edfaa16', '6a8376c6-319a-46dc-90fb-3410e4381b9e', '7d9ca4bb-b259-4ce2-b069-4893f074b597'),
('579d012d-a88f-4e4b-a368-1fe79c1cba47', '718abba8-fd1d-490c-9ecc-81addc302a35', '7380f463-deb1-40ce-9f4f-7f5a959b6e32'),
('65284284-587a-4cc8-a0b7-17d296693097', '6a8376c6-319a-46dc-90fb-3410e4381b9e', '890d6295-ad7a-481f-acf0-c608c5e7a9df'),
('67ffd63a-5bb2-4c80-b5fb-0a66524e0ed5', '718abba8-fd1d-490c-9ecc-81addc302a35', 'b84f59d3-650e-4cb6-815d-cec6bfc49ac0'),
('6fdc55ef-d05a-4379-82d8-2155ea5a2540', '6a8376c6-319a-46dc-90fb-3410e4381b9e', '5e916855-3d48-46b5-b2ab-47cffea85be7'),
('818135ef-a93b-4913-b1e3-78305bfe5415', '8cec5a20-206d-4b57-a021-24aa340f1f51', 'fa97335b-3efd-499d-9ec2-78c49597a301'),
('addc94b1-e2ef-4166-b5cc-91de0f30eec3', '8cec5a20-206d-4b57-a021-24aa340f1f51', 'ec428dc7-a821-4b21-b16b-c9f98f88687c'),
('bb8c1b6c-45b8-4382-88f6-0b67f3663925', '17ec4924-cf46-44c8-b814-69f1c0ab6548', '2fe5ff3e-f808-4e6d-916a-d4959bb87227'),
('c7bb77e9-26d1-4e64-9a09-51f2a1ca0699', '152054a7-2d6f-4975-8d2f-9fb7c009070d', 'ad8325f8-1f19-4364-8a1f-0d85732d7d71'),
('d2b84b2b-0a74-49bf-a4ef-613d3f49a6f0', '939b6e45-82ea-4c94-8bbb-dd87eba0adda', 'ad8325f8-1f19-4364-8a1f-0d85732d7d71'),
('d82080e3-ed25-429e-a14d-3d2902573cf6', '17ec4924-cf46-44c8-b814-69f1c0ab6548', '7e92e09b-7a2a-44ba-b2c9-21a0bc9b7d63'),
('e0ffaa46-8a38-4db1-a080-40d80b093ec2', '6d518b5c-ca45-4fd8-9ce2-be076a35b264', '7d9ca4bb-b259-4ce2-b069-4893f074b597'),
('f2682a66-cf46-4480-b88e-b48627391525', '718abba8-fd1d-490c-9ecc-81addc302a35', 'fa97335b-3efd-499d-9ec2-78c49597a301'),
('f996ec6a-18e8-409b-81f4-9e8809490bfc', '8cec5a20-206d-4b57-a021-24aa340f1f51', '7e92e09b-7a2a-44ba-b2c9-21a0bc9b7d63'),
('fd580642-161c-4559-9fad-faceda684eaf', '805ab00f-c607-42bc-9d20-60dfd58763db', 'ec428dc7-a821-4b21-b16b-c9f98f88687c');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentocarpeta`
--

CREATE TABLE `documentocarpeta` (
  `uuid` varchar(100) NOT NULL,
  `creadoEn` timestamp NOT NULL DEFAULT current_timestamp(),
  `uuidCarpeta` varchar(100) NOT NULL,
  `uuidDocumento` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `documentocarpeta`
--

INSERT INTO `documentocarpeta` (`uuid`, `creadoEn`, `uuidCarpeta`, `uuidDocumento`) VALUES
('7b944c9a-45c5-4cad-8aa5-9ec7b9659db6', '2021-12-30 03:29:59', '4ac34ea3-a85a-49ba-a5e9-9c959e29dbd8', 'c0a0e27c-66b2-4e18-9326-1977b5b05412');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentoproyecto`
--

CREATE TABLE `documentoproyecto` (
  `uuid` varchar(100) NOT NULL,
  `creadoEn` timestamp NOT NULL DEFAULT current_timestamp(),
  `nombre` text NOT NULL,
  `keyName` text NOT NULL,
  `location` text NOT NULL,
  `fechaCreacion` date NOT NULL,
  `uuidProyecto` varchar(100) NOT NULL,
  `size` int(11) NOT NULL,
  `path` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `documentoproyecto`
--

INSERT INTO `documentoproyecto` (`uuid`, `creadoEn`, `nombre`, `keyName`, `location`, `fechaCreacion`, `uuidProyecto`, `size`, `path`) VALUES
('079424f6-ec39-4dea-b8c4-54cde87636ad', '2021-12-20 16:14:45', 'ec099a798919901f12cba319de00f4ec.jpg', 'mendozarq/documents/48c21595-0e3c-4343-8c4e-1e409d30983c.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/mendozarq/documents/48c21595-0e3c-4343-8c4e-1e409d30983c.jpg', '2021-12-20', '13f3af68-d552-4c54-bde6-816f474dd4ec', 73342, 'root'),
('083fe6e4-aea9-4b65-883c-66384a0a0d43', '2022-02-17 18:44:44', 'moon-river-mountains-gradient-background-blue-night-cold-3440x1440-2527.jpg', 'mendozarq/documents/6f4715f4-a2d1-47fa-8895-96a06ddb2267.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/mendozarq/documents/6f4715f4-a2d1-47fa-8895-96a06ddb2267.jpg', '2022-02-17', '13f3af68-d552-4c54-bde6-816f474dd4ec', 521587, 'root'),
('0e62490b-8444-48d1-80f0-0994595574bf', '2022-02-14 14:49:30', 'how-to-extract-img-files-in-windows-10-thumb-bzxI4IDgg.jpg', 'mendozarq/documents/98559927-c666-4cbf-b9df-be7033e77428.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/mendozarq/documents/98559927-c666-4cbf-b9df-be7033e77428.jpg', '2022-02-14', '13f3af68-d552-4c54-bde6-816f474dd4ec', 13952, 'root'),
('32db189a-2d87-45ff-9eb4-7a8cf78b2d17', '2022-02-17 18:44:43', 'how-to-extract-img-files-in-windows-10-thumb-bzxI4IDgg.jpg', 'mendozarq/documents/aa558844-94d0-43f4-b3b9-7e480c1588a3.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/mendozarq/documents/aa558844-94d0-43f4-b3b9-7e480c1588a3.jpg', '2022-02-17', '13f3af68-d552-4c54-bde6-816f474dd4ec', 13952, 'root'),
('808d6b68-db2f-46d9-b58a-fdd522da1fee', '2021-12-20 16:14:49', 'mendo.jpg', 'mendozarq/documents/d6c59c23-c197-4bdb-8a94-3caf2b5c9a5b.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/mendozarq/documents/d6c59c23-c197-4bdb-8a94-3caf2b5c9a5b.jpg', '2021-12-20', '13f3af68-d552-4c54-bde6-816f474dd4ec', 1206600, 'root'),
('bfb76376-e2bb-4dd7-8e0f-f76929851462', '2021-12-20 16:14:47', 'planos_mendozarq.docx', 'mendozarq/documents/aa1f0fed-602b-4020-bce6-22dbcb85beda.docx', 'https://mendozarq-liraki-s3.s3.amazonaws.com/mendozarq/documents/aa1f0fed-602b-4020-bce6-22dbcb85beda.docx', '2021-12-20', '13f3af68-d552-4c54-bde6-816f474dd4ec', 493516, 'root'),
('c0a0e27c-66b2-4e18-9326-1977b5b05412', '2021-12-30 03:29:59', 'capitulopresupuesto.sql', 'mendozarq/documents/07f500f3-fe8b-4ad7-93f0-a9ff585c2202.sql', 'https://mendozarq-liraki-s3.s3.amazonaws.com/mendozarq/documents/07f500f3-fe8b-4ad7-93f0-a9ff585c2202.sql', '2021-12-29', '13f3af68-d552-4c54-bde6-816f474dd4ec', 621, 'folder'),
('e473dae9-134f-42a2-9fb8-4c3a45677337', '2021-12-20 16:14:46', 'planos_mendozarq.pdf', 'mendozarq/documents/dd0577b0-c920-49d2-aa82-4038ce1a6756.pdf', 'https://mendozarq-liraki-s3.s3.amazonaws.com/mendozarq/documents/dd0577b0-c920-49d2-aa82-4038ce1a6756.pdf', '2021-12-20', '13f3af68-d552-4c54-bde6-816f474dd4ec', 257333, 'root'),
('f9b1df7a-8e17-4317-95fb-cef1bbe7c9c1', '2021-12-20 19:22:24', '8-7_LA1-548737959_05.webm', 'mendozarq/documents/4effe6ec-c639-4c79-850b-114f215cf4f3.webm', 'https://mendozarq-liraki-s3.s3.amazonaws.com/mendozarq/documents/4effe6ec-c639-4c79-850b-114f215cf4f3.webm', '2021-12-20', '13f3af68-d552-4c54-bde6-816f474dd4ec', 6888705, 'root');

--
-- Disparadores `documentoproyecto`
--
DELIMITER $$
CREATE TRIGGER `delete_documentos_trigger` AFTER DELETE ON `documentoproyecto` FOR EACH ROW BEGIN
    CALL documentos_procedure(
            'D',
            CURRENT_TIMESTAMP,
            @creadoPor,
            @uuidCreadoPor,
            @@hostname,
            OLD.uuid
        );

    set @uuidCreadoPor = '', @creadoPor = '';
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_documentos_trigger` AFTER INSERT ON `documentoproyecto` FOR EACH ROW BEGIN
    CALL documentos_procedure(
            'I',
            CURRENT_TIMESTAMP,
            @creadoPor,
            @uuidCreadoPor,
            @@hostname,
            NEW.uuid
        );

    set @uuidCreadoPor = '', @creadoPor = '';
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_documentos_trigger` AFTER UPDATE ON `documentoproyecto` FOR EACH ROW BEGIN
    CALL documentos_procedure(
            'U',
            CURRENT_TIMESTAMP,
            @creadoPor,
            @uuidCreadoPor,
            @@hostname,
            NEW.uuid
        );
    set @uuidCreadoPor = '', @creadoPor = '';
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fotoproducto`
--

CREATE TABLE `fotoproducto` (
  `uuid` varchar(100) NOT NULL,
  `creadoEn` timestamp NOT NULL DEFAULT current_timestamp(),
  `nombre` text NOT NULL,
  `indice` int(11) NOT NULL,
  `keyName` text NOT NULL,
  `location` text NOT NULL,
  `size` int(11) NOT NULL,
  `uuidProducto` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `fotoproducto`
--

INSERT INTO `fotoproducto` (`uuid`, `creadoEn`, `nombre`, `indice`, `keyName`, `location`, `size`, `uuidProducto`) VALUES
('01f19dad-b017-4393-bf7a-d168325acca3', '2022-03-11 22:56:42', '8ae794bfb3766f49104c419d96b4bf4a.jpg', 1, 'liraki/images/9e93e5c7-ebf0-4374-902d-01ec08c59082.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/9e93e5c7-ebf0-4374-902d-01ec08c59082.jpg', 19745, '7380f463-deb1-40ce-9f4f-7f5a959b6e32'),
('1e3c49dc-146b-493e-8bc2-a13b16845a23', '2021-11-25 01:19:46', 'HTB1sfyihVcJL1JjSZFOq6AWlXXas.jpg', 1, 'liraki/images/bf6ff2ef-0f81-46fa-b6b5-c5b7b2da22a5.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/bf6ff2ef-0f81-46fa-b6b5-c5b7b2da22a5.jpg', 255762, 'ec428dc7-a821-4b21-b16b-c9f98f88687c'),
('3cc219c3-6179-490f-949d-a68a373348ca', '2022-03-11 19:02:30', 'stairs-3958661__340.webp', 0, 'liraki/images/b48dc83c-890a-49cf-925c-9d8e81a8ff83.webp', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/b48dc83c-890a-49cf-925c-9d8e81a8ff83.webp', 51988, 'b84f59d3-650e-4cb6-815d-cec6bfc49ac0'),
('3f0fd344-e9c5-4516-bfe9-9b58f47af025', '2021-11-25 01:17:15', '147dd59123e82286621c0e5f50aaa665.jpg', 1, 'liraki/images/d2cfbf3f-f105-400d-bf26-24003057caba.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/d2cfbf3f-f105-400d-bf26-24003057caba.jpg', 12396, '890d6295-ad7a-481f-acf0-c608c5e7a9df'),
('3fed5f86-1bfb-4fec-b58c-75b77bd1af9a', '2021-11-25 01:26:25', 'descarga (1).jfif', 0, 'liraki/images/6c6b323b-24a5-4231-96eb-3bd9a8696771.jfif', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/6c6b323b-24a5-4231-96eb-3bd9a8696771.jfif', 6000, 'ad8325f8-1f19-4364-8a1f-0d85732d7d71'),
('408c6af0-a7d5-4591-a06e-d51100566f93', '2021-11-25 01:23:24', 'images.jfif', 3, 'liraki/images/0e07a410-ce39-4045-b5ab-c306f641a33b.jfif', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/0e07a410-ce39-4045-b5ab-c306f641a33b.jfif', 4361, '2fe5ff3e-f808-4e6d-916a-d4959bb87227'),
('69272800-c7ec-4e5d-92d8-a80c0557d42d', '2021-11-25 01:23:25', 'mesas de madera rusticas artesanales 21.jpg', 0, 'liraki/images/5ef662ee-82f3-4379-a328-b734a4e47bd9.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/5ef662ee-82f3-4379-a328-b734a4e47bd9.jpg', 108507, '2fe5ff3e-f808-4e6d-916a-d4959bb87227'),
('716f2edb-44e7-4d15-bd98-45d7133c6b1e', '2021-11-25 01:20:50', 'HTB1sfyihVcJL1JjSZFOq6AWlXXas.jpg', 3, 'liraki/images/e5f07195-a8ed-49b0-9d7e-09e68fbf6148.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/e5f07195-a8ed-49b0-9d7e-09e68fbf6148.jpg', 255762, '5e916855-3d48-46b5-b2ab-47cffea85be7'),
('729784e9-c4bd-49c3-ba25-5e50efead0d1', '2021-11-25 01:17:15', '37fbc15801319aa19987886d525c8cd2.jpg', 0, 'liraki/images/4406357a-c0b6-4343-9003-5b5f4e19e248.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/4406357a-c0b6-4343-9003-5b5f4e19e248.jpg', 49834, '890d6295-ad7a-481f-acf0-c608c5e7a9df'),
('7676e484-ca97-4f28-83ce-e78b1632b340', '2021-11-28 02:14:28', 'vitrina.jpg', 0, 'liraki/images/54b66837-483e-4e1e-bb51-b1f60afbba1d.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/54b66837-483e-4e1e-bb51-b1f60afbba1d.jpg', 60664, '7d9ca4bb-b259-4ce2-b069-4893f074b597'),
('7cb7c118-f6f2-4519-b10b-97a1b188efd0', '2022-03-11 22:59:07', 'ec56d144fab307ee4060457c48ce4e64.jpg', 1, 'liraki/images/e173cf62-1306-4216-a07d-004e6863e56c.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/e173cf62-1306-4216-a07d-004e6863e56c.jpg', 15427, 'fa97335b-3efd-499d-9ec2-78c49597a301'),
('80f78971-8086-4831-bdb3-a1fd4bbb99e6', '2021-11-28 02:14:28', 'images.jfif', 1, 'liraki/images/6dfdcea0-4c42-46d6-a0c6-6b529f6c86ec.jfif', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/6dfdcea0-4c42-46d6-a0c6-6b529f6c86ec.jfif', 5729, '7d9ca4bb-b259-4ce2-b069-4893f074b597'),
('9dce9740-3ae6-4997-93d6-0c5d42a80d88', '2021-11-25 01:20:50', '81OagKf+-uL._AC_SS450_.jpg', 0, 'liraki/images/fcfdc96c-a8dd-49c9-a189-31fb1d2aee70.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/fcfdc96c-a8dd-49c9-a189-31fb1d2aee70.jpg', 31344, '5e916855-3d48-46b5-b2ab-47cffea85be7'),
('a2517c17-e6b3-4592-9ae3-7e264d7dfe03', '2021-11-25 01:26:25', 'descarga (2).jfif', 1, 'liraki/images/79c306c7-5fa2-4319-b81d-cf0857902a4b.jfif', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/79c306c7-5fa2-4319-b81d-cf0857902a4b.jfif', 4926, 'ad8325f8-1f19-4364-8a1f-0d85732d7d71'),
('b137c265-d4ee-4568-93e7-5e10d5c5762a', '2021-11-25 01:20:50', '519785183df511d046099fa15e5bb0cb.jpg', 1, 'liraki/images/8805c2f8-3b0a-4c16-b4e8-c1fe81aa2133.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/8805c2f8-3b0a-4c16-b4e8-c1fe81aa2133.jpg', 21498, '5e916855-3d48-46b5-b2ab-47cffea85be7'),
('c7e3d55e-b063-4842-87f4-b3fd343c3f59', '2022-03-11 19:02:00', 'gothic-stairs-4931155__340.png', 0, 'liraki/images/d14c65ed-dfd9-425b-8e47-9a5e5ab1ca5e.png', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/d14c65ed-dfd9-425b-8e47-9a5e5ab1ca5e.png', 93675, '7380f463-deb1-40ce-9f4f-7f5a959b6e32'),
('ccedd91f-e57b-410a-9a8e-650034f75707', '2021-11-25 01:17:15', 'cc16183685107368ab674f5de1957926.jpg', 2, 'liraki/images/c22ae913-06a8-430f-84e7-caa880233cce.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/c22ae913-06a8-430f-84e7-caa880233cce.jpg', 49626, '890d6295-ad7a-481f-acf0-c608c5e7a9df'),
('ce7c1b4a-8a94-465c-8ef5-788e03ba958c', '2021-11-25 01:26:25', 'descarga.jfif', 2, 'liraki/images/f32daac8-3160-4c7c-8bce-d4a610766fab.jfif', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/f32daac8-3160-4c7c-8bce-d4a610766fab.jfif', 6285, 'ad8325f8-1f19-4364-8a1f-0d85732d7d71'),
('d1e9459a-36aa-4b99-8ca0-1b2ac30c23bc', '2021-11-25 01:19:46', 'marco-de-ventana-de-madera-aislado-en-blanco-13133028.jpg', 2, 'liraki/images/377c40d8-0334-4918-be05-5d43b92e804a.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/377c40d8-0334-4918-be05-5d43b92e804a.jpg', 108348, 'ec428dc7-a821-4b21-b16b-c9f98f88687c'),
('d3112c6d-ad08-48e9-8c33-858eb9b1293e', '2021-11-25 01:23:24', 'descarga.jfif', 1, 'liraki/images/549b7d8a-7f42-4558-8db2-0bd5028b659e.jfif', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/549b7d8a-7f42-4558-8db2-0bd5028b659e.jfif', 14183, '2fe5ff3e-f808-4e6d-916a-d4959bb87227'),
('d662a26f-6920-4be6-9d0b-f7820f361b58', '2021-11-25 01:20:49', 'descarga.jfif', 2, 'liraki/images/9efb1e60-c3f1-4a81-9854-49ed4f0104de.jfif', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/9efb1e60-c3f1-4a81-9854-49ed4f0104de.jfif', 5946, '5e916855-3d48-46b5-b2ab-47cffea85be7'),
('d70bd614-cf03-4aec-8d53-27fa52827a17', '2022-03-11 19:04:59', 'download.jpg', 0, 'liraki/images/7a2a9c7a-547d-493a-9851-7df52f65613a.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/7a2a9c7a-547d-493a-9851-7df52f65613a.jpg', 3804, '7e92e09b-7a2a-44ba-b2c9-21a0bc9b7d63'),
('deb96b07-56f0-4b14-a1b0-d064f80d54a2', '2022-03-12 00:09:45', 'images.jpg', 0, 'liraki/images/3eb2c702-28e1-45bf-83ff-b37c117f8d0d.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/3eb2c702-28e1-45bf-83ff-b37c117f8d0d.jpg', 4648, '7307299d-ec02-4f52-98d0-baf027033698'),
('df058e40-7f00-4084-bf75-7b0e8131af3b', '2021-11-25 01:23:24', 'mueble-en-crudo.jpg', 2, 'liraki/images/17c48fda-8e3b-4019-bc45-1c57f72ff4e1.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/17c48fda-8e3b-4019-bc45-1c57f72ff4e1.jpg', 14556, '2fe5ff3e-f808-4e6d-916a-d4959bb87227'),
('ea97b806-af53-48c5-a459-4cf8b205f208', '2021-11-25 01:19:46', 'window-5974000_960_720.png', 0, 'liraki/images/5ffd2399-c07a-4c06-92c3-aaee3757640e.png', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/5ffd2399-c07a-4c06-92c3-aaee3757640e.png', 464592, 'ec428dc7-a821-4b21-b16b-c9f98f88687c'),
('f77cc954-cd68-4cb3-b0d5-894445ae2060', '2022-03-11 22:57:43', '56ecd9f9d6d56ea9ef98acbcbdde4083.jpg', 1, 'liraki/images/ee75ba30-50b1-4919-ba30-3add7fe6a578.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/ee75ba30-50b1-4919-ba30-3add7fe6a578.jpg', 13005, 'b84f59d3-650e-4cb6-815d-cec6bfc49ac0'),
('fe4a5ba8-32ae-4cd5-975f-37152d9150ba', '2022-03-11 19:01:29', 'istockphoto-1305090918-170667a.jpg', 0, 'liraki/images/35bf9020-e4a4-4efe-8efa-af98ef1fc9b2.jpg', 'https://mendozarq-liraki-s3.s3.amazonaws.com/liraki/images/35bf9020-e4a4-4efe-8efa-af98ef1fc9b2.jpg', 96995, 'fa97335b-3efd-499d-9ec2-78c49597a301');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `logs`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `logs` (
`operacion` char(1)
,`creadoEn` timestamp
,`creadoPor` mediumtext
,`uuidCreadoPor` mediumtext
,`hostname` mediumtext
,`tabla` mediumtext
,`path` mediumtext
,`uuidRow` varchar(100)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log_documentos`
--

CREATE TABLE `log_documentos` (
  `operacion` char(1) NOT NULL,
  `creadoEn` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `creadoPor` text DEFAULT NULL,
  `uuidCreadoPor` text DEFAULT NULL,
  `hostname` text DEFAULT NULL,
  `tabla` text NOT NULL DEFAULT 'documentos',
  `path` text NOT NULL DEFAULT 'mendozarq',
  `uuidRow` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `log_documentos`
--

INSERT INTO `log_documentos` (`operacion`, `creadoEn`, `creadoPor`, `uuidCreadoPor`, `hostname`, `tabla`, `path`, `uuidRow`) VALUES
('U', '2022-01-13 02:36:45', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'documentos', 'mendozarq', '808d6b68-db2f-46d9-b58a-fdd522da1fee'),
('I', '2022-01-13 02:38:25', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'documentos', 'mendozarq', 'a7680150-1213-4048-961e-6dea49772863'),
('I', '2022-01-13 02:38:40', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'documentos', 'mendozarq', 'db7878c5-c66d-4d4d-b62f-b89a4123ac5c'),
('I', '2022-01-13 02:38:40', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'documentos', 'mendozarq', 'd41aa38e-2bbd-4fd7-bd2e-2289cc290381'),
('I', '2022-01-13 02:38:40', NULL, NULL, 'DESKTOP-0D2F255', 'documentos', 'mendozarq', '410e2fc7-f88b-4b46-b5f8-de017ef478e0'),
('I', '2022-01-13 02:38:59', '', '', 'DESKTOP-0D2F255', 'documentos', 'mendozarq', '694c97e2-f7ac-41a0-ac13-d6565ae4e022'),
('I', '2022-01-13 02:38:59', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'documentos', 'mendozarq', 'dcf2f930-f372-4c80-80da-5d87142c5d34'),
('I', '2022-01-13 02:38:59', '', '', 'DESKTOP-0D2F255', 'documentos', 'mendozarq', '4aa83608-70f8-44b9-9046-6217234a61a8'),
('D', '2022-01-13 02:39:24', '', '', 'DESKTOP-0D2F255', 'documentos', 'mendozarq', '4aa83608-70f8-44b9-9046-6217234a61a8'),
('D', '2022-01-13 02:39:29', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'documentos', 'mendozarq', '694c97e2-f7ac-41a0-ac13-d6565ae4e022'),
('D', '2022-01-13 02:39:32', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'documentos', 'mendozarq', 'dcf2f930-f372-4c80-80da-5d87142c5d34'),
('D', '2022-01-13 02:39:35', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'documentos', 'mendozarq', '410e2fc7-f88b-4b46-b5f8-de017ef478e0'),
('D', '2022-01-13 02:39:37', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'documentos', 'mendozarq', 'd41aa38e-2bbd-4fd7-bd2e-2289cc290381'),
('D', '2022-01-13 02:39:41', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'documentos', 'mendozarq', 'db7878c5-c66d-4d4d-b62f-b89a4123ac5c'),
('D', '2022-01-17 15:34:10', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'documentos', 'mendozarq', 'a7680150-1213-4048-961e-6dea49772863'),
('I', '2022-02-12 04:10:06', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'documentos', 'mendozarq', '31e1a469-31a7-4a33-b2e6-ea4565318446'),
('D', '2022-02-12 04:10:13', '', '', 'DESKTOP-0D2F255', 'documentos', 'mendozarq', '31e1a469-31a7-4a33-b2e6-ea4565318446'),
('I', '2022-02-14 14:49:30', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'documentos', 'mendozarq', '0e62490b-8444-48d1-80f0-0994595574bf'),
('I', '2022-02-17 18:44:43', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'documentos', 'mendozarq', '32db189a-2d87-45ff-9eb4-7a8cf78b2d17'),
('I', '2022-02-17 18:44:44', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'documentos', 'mendozarq', '083fe6e4-aea9-4b65-883c-66384a0a0d43');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log_personal`
--

CREATE TABLE `log_personal` (
  `operacion` char(1) NOT NULL,
  `creadoEn` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `creadoPor` text DEFAULT NULL,
  `uuidCreadoPor` text DEFAULT NULL,
  `hostname` text DEFAULT NULL,
  `tabla` text NOT NULL DEFAULT 'personal',
  `path` text NOT NULL DEFAULT 'mendozarq',
  `uuidRow` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `log_personal`
--

INSERT INTO `log_personal` (`operacion`, `creadoEn`, `creadoPor`, `uuidCreadoPor`, `hostname`, `tabla`, `path`, `uuidRow`) VALUES
('U', '2022-01-11 22:01:36', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'personal', 'mendozarq', '0cdca13f-175a-4ed0-8320-650f65bf9167'),
('I', '2022-01-11 22:01:53', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'personal', 'mendozarq', 'eb2428e5-42d2-4ec0-bad7-4c7f50b11fcf'),
('D', '2022-01-11 22:01:57', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'personal', 'mendozarq', 'eb2428e5-42d2-4ec0-bad7-4c7f50b11fcf'),
('U', '2022-01-11 23:31:59', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'personal', 'mendozarq', '0cdca13f-175a-4ed0-8320-650f65bf9167'),
('U', '2022-01-11 23:32:09', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'personal', 'mendozarq', '0cdca13f-175a-4ed0-8320-650f65bf9167'),
('U', '2022-01-11 23:32:20', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'personal', 'mendozarq', '0cdca13f-175a-4ed0-8320-650f65bf9167'),
('I', '2022-01-11 23:33:06', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'personal', 'mendozarq', 'ea20f106-3301-4449-8acd-f5cddab39366'),
('U', '2022-01-11 23:36:53', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'personal', 'mendozarq', 'ea20f106-3301-4449-8acd-f5cddab39366'),
('I', '2022-01-11 23:37:09', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'personal', 'mendozarq', 'd8eb8089-3fc3-4950-b078-9f25679a6541'),
('D', '2022-01-11 23:37:18', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'personal', 'mendozarq', 'ea20f106-3301-4449-8acd-f5cddab39366'),
('I', '2022-01-12 15:25:24', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'personal', 'mendozarq', '6a08128f-06eb-432e-975d-9f43ee21c69a'),
('D', '2022-01-12 15:30:19', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'personal', 'mendozarq', 'd8eb8089-3fc3-4950-b078-9f25679a6541'),
('D', '2022-01-12 15:30:19', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'personal', 'mendozarq', '6a08128f-06eb-432e-975d-9f43ee21c69a'),
('U', '2022-02-09 03:35:12', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'personal', 'mendozarq', '0cdca13f-175a-4ed0-8320-650f65bf9167'),
('U', '2022-02-09 03:35:20', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'personal', 'mendozarq', '0cdca13f-175a-4ed0-8320-650f65bf9167'),
('I', '2022-03-31 03:30:25', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'personal', 'mendozarq', '6739cd0f-9e3e-4eb2-9c22-e2a60be68401');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log_producto`
--

CREATE TABLE `log_producto` (
  `operacion` char(1) NOT NULL,
  `creadoEn` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `creadoPor` text DEFAULT NULL,
  `uuidCreadoPor` text DEFAULT NULL,
  `hostname` text DEFAULT NULL,
  `tabla` text NOT NULL DEFAULT 'producto',
  `path` text NOT NULL DEFAULT 'liraki',
  `uuidRow` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `log_producto`
--

INSERT INTO `log_producto` (`operacion`, `creadoEn`, `creadoPor`, `uuidCreadoPor`, `hostname`, `tabla`, `path`, `uuidRow`) VALUES
('I', '2022-01-13 22:30:52', NULL, NULL, 'DESKTOP-0D2F255', 'producto', 'liraki', '70976add-5a52-4849-8ede-2da02c2a195d'),
('U', '2022-01-13 23:57:44', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '70976add-5a52-4849-8ede-2da02c2a195d'),
('D', '2022-01-13 23:59:01', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', '70976add-5a52-4849-8ede-2da02c2a195d'),
('I', '2022-01-14 00:00:54', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '9876a910-bd27-43f4-86df-40d0afce2577'),
('D', '2022-01-14 00:01:08', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '9876a910-bd27-43f4-86df-40d0afce2577'),
('I', '2022-01-14 00:10:15', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '3d283a31-b419-4692-b83f-a99208e322bf'),
('D', '2022-01-14 00:10:24', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '3d283a31-b419-4692-b83f-a99208e322bf'),
('I', '2022-01-14 00:24:15', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', 'd88add78-7eff-4ce6-9313-b1b49739b8bb'),
('U', '2022-01-14 00:27:26', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', 'd88add78-7eff-4ce6-9313-b1b49739b8bb'),
('U', '2022-01-18 00:25:18', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', 'd88add78-7eff-4ce6-9313-b1b49739b8bb'),
('I', '2022-01-20 17:51:35', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '0a87d352-4b57-48d7-a353-f6559e600859'),
('U', '2022-01-20 22:44:28', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '2fe5ff3e-f808-4e6d-916a-d4959bb87227'),
('U', '2022-02-12 02:44:39', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '0a87d352-4b57-48d7-a353-f6559e600859'),
('U', '2022-02-13 23:06:01', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '0a87d352-4b57-48d7-a353-f6559e600859'),
('D', '2022-02-18 04:24:28', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', 'd88add78-7eff-4ce6-9313-b1b49739b8bb'),
('D', '2022-02-18 04:24:28', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', '0a87d352-4b57-48d7-a353-f6559e600859'),
('I', '2022-02-18 04:26:26', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', 'b6748291-281e-4600-ae7b-9cc43aae5591'),
('D', '2022-02-21 19:55:25', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', 'b6748291-281e-4600-ae7b-9cc43aae5591'),
('U', '2022-02-21 19:55:48', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', 'ec428dc7-a821-4b21-b16b-c9f98f88687c'),
('U', '2022-02-24 15:18:32', NULL, NULL, 'DESKTOP-0D2F255', 'producto', 'liraki', '7d9ca4bb-b259-4ce2-b069-4893f074b597'),
('U', '2022-03-02 15:24:26', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '7d9ca4bb-b259-4ce2-b069-4893f074b597'),
('I', '2022-03-11 18:56:40', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '7380f463-deb1-40ce-9f4f-7f5a959b6e32'),
('I', '2022-03-11 18:57:42', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', 'b84f59d3-650e-4cb6-815d-cec6bfc49ac0'),
('I', '2022-03-11 18:59:06', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', 'fa97335b-3efd-499d-9ec2-78c49597a301'),
('U', '2022-03-11 19:01:32', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', 'fa97335b-3efd-499d-9ec2-78c49597a301'),
('I', '2022-03-11 19:04:58', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '7e92e09b-7a2a-44ba-b2c9-21a0bc9b7d63'),
('I', '2022-03-12 00:09:44', NULL, NULL, 'DESKTOP-0D2F255', 'producto', 'liraki', '7307299d-ec02-4f52-98d0-baf027033698'),
('U', '2022-03-12 00:28:54', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', '7e92e09b-7a2a-44ba-b2c9-21a0bc9b7d63'),
('U', '2022-03-19 18:06:13', NULL, NULL, 'DESKTOP-0D2F255', 'producto', 'liraki', '7307299d-ec02-4f52-98d0-baf027033698'),
('U', '2022-03-21 20:45:45', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '7307299d-ec02-4f52-98d0-baf027033698'),
('U', '2022-03-26 03:21:58', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', 'b84f59d3-650e-4cb6-815d-cec6bfc49ac0'),
('U', '2022-03-28 21:02:41', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '7307299d-ec02-4f52-98d0-baf027033698'),
('U', '2022-03-28 21:06:35', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '7307299d-ec02-4f52-98d0-baf027033698'),
('U', '2022-03-28 21:08:59', NULL, NULL, 'DESKTOP-0D2F255', 'producto', 'liraki', '7307299d-ec02-4f52-98d0-baf027033698'),
('U', '2022-03-28 21:09:13', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '7307299d-ec02-4f52-98d0-baf027033698'),
('U', '2022-03-28 21:09:56', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '7307299d-ec02-4f52-98d0-baf027033698'),
('U', '2022-03-28 21:11:15', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', '7307299d-ec02-4f52-98d0-baf027033698'),
('U', '2022-03-28 21:11:47', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '7307299d-ec02-4f52-98d0-baf027033698'),
('U', '2022-03-28 21:20:22', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', '7307299d-ec02-4f52-98d0-baf027033698'),
('U', '2022-03-28 21:20:35', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '7307299d-ec02-4f52-98d0-baf027033698'),
('U', '2022-03-28 21:20:43', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '7307299d-ec02-4f52-98d0-baf027033698'),
('U', '2022-03-28 21:22:20', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', '7e92e09b-7a2a-44ba-b2c9-21a0bc9b7d63'),
('U', '2022-03-28 21:22:48', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', '7e92e09b-7a2a-44ba-b2c9-21a0bc9b7d63'),
('U', '2022-03-28 21:22:48', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', '7307299d-ec02-4f52-98d0-baf027033698'),
('U', '2022-03-28 21:22:58', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '7307299d-ec02-4f52-98d0-baf027033698'),
('U', '2022-03-28 21:22:58', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', '7e92e09b-7a2a-44ba-b2c9-21a0bc9b7d63'),
('U', '2022-03-28 21:23:40', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '7e92e09b-7a2a-44ba-b2c9-21a0bc9b7d63'),
('U', '2022-03-28 21:23:40', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', '7307299d-ec02-4f52-98d0-baf027033698'),
('U', '2022-03-28 21:23:58', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', '7e92e09b-7a2a-44ba-b2c9-21a0bc9b7d63'),
('U', '2022-03-28 21:23:58', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', '7307299d-ec02-4f52-98d0-baf027033698'),
('U', '2022-03-28 21:28:45', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '7307299d-ec02-4f52-98d0-baf027033698'),
('U', '2022-03-28 21:29:14', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '7307299d-ec02-4f52-98d0-baf027033698'),
('U', '2022-03-28 21:29:14', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '7307299d-ec02-4f52-98d0-baf027033698'),
('U', '2022-03-28 21:29:53', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', '7307299d-ec02-4f52-98d0-baf027033698'),
('U', '2022-03-28 21:29:53', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '7e92e09b-7a2a-44ba-b2c9-21a0bc9b7d63'),
('U', '2022-03-28 21:29:53', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', '7307299d-ec02-4f52-98d0-baf027033698'),
('U', '2022-03-28 21:30:08', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '7e92e09b-7a2a-44ba-b2c9-21a0bc9b7d63'),
('U', '2022-03-28 21:30:08', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', '7307299d-ec02-4f52-98d0-baf027033698'),
('U', '2022-03-28 21:30:08', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', 'b84f59d3-650e-4cb6-815d-cec6bfc49ac0'),
('U', '2022-03-29 18:30:50', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', 'b84f59d3-650e-4cb6-815d-cec6bfc49ac0'),
('U', '2022-03-29 18:30:50', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', 'b84f59d3-650e-4cb6-815d-cec6bfc49ac0'),
('U', '2022-03-29 18:31:42', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', 'fa97335b-3efd-499d-9ec2-78c49597a301'),
('U', '2022-03-29 18:31:42', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '7307299d-ec02-4f52-98d0-baf027033698'),
('U', '2022-03-30 02:49:11', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '7e92e09b-7a2a-44ba-b2c9-21a0bc9b7d63'),
('U', '2022-03-30 02:49:28', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '2fe5ff3e-f808-4e6d-916a-d4959bb87227'),
('U', '2022-03-30 02:51:13', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '7307299d-ec02-4f52-98d0-baf027033698'),
('U', '2022-03-30 02:51:37', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '7307299d-ec02-4f52-98d0-baf027033698'),
('U', '2022-03-30 02:51:37', NULL, NULL, 'DESKTOP-0D2F255', 'producto', 'liraki', '7307299d-ec02-4f52-98d0-baf027033698'),
('U', '2022-03-30 02:52:49', NULL, NULL, 'DESKTOP-0D2F255', 'producto', 'liraki', '7307299d-ec02-4f52-98d0-baf027033698'),
('U', '2022-03-30 02:52:49', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '7307299d-ec02-4f52-98d0-baf027033698'),
('U', '2022-03-30 02:54:41', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '7307299d-ec02-4f52-98d0-baf027033698'),
('U', '2022-03-30 02:55:01', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '2fe5ff3e-f808-4e6d-916a-d4959bb87227'),
('U', '2022-03-30 02:55:01', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '2fe5ff3e-f808-4e6d-916a-d4959bb87227'),
('U', '2022-03-30 16:45:41', 'carmelita cabrero castillo', 'bf493a64-4573-433f-92b0-edbcae73a98b', 'DESKTOP-0D2F255', 'producto', 'liraki', '5e916855-3d48-46b5-b2ab-47cffea85be7'),
('U', '2022-03-30 16:50:20', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '5e916855-3d48-46b5-b2ab-47cffea85be7'),
('U', '2022-03-30 16:50:20', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '5e916855-3d48-46b5-b2ab-47cffea85be7'),
('U', '2022-03-30 16:50:42', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', '7e92e09b-7a2a-44ba-b2c9-21a0bc9b7d63'),
('U', '2022-03-30 16:50:42', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '7e92e09b-7a2a-44ba-b2c9-21a0bc9b7d63'),
('U', '2022-03-30 16:50:53', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', '7e92e09b-7a2a-44ba-b2c9-21a0bc9b7d63'),
('U', '2022-03-30 16:50:53', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '7e92e09b-7a2a-44ba-b2c9-21a0bc9b7d63'),
('U', '2022-03-30 16:52:52', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '7307299d-ec02-4f52-98d0-baf027033698'),
('U', '2022-03-30 17:01:06', 'carmelita cabrero castillo', 'bf493a64-4573-433f-92b0-edbcae73a98b', 'DESKTOP-0D2F255', 'producto', 'liraki', '890d6295-ad7a-481f-acf0-c608c5e7a9df'),
('U', '2022-03-30 17:01:06', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', '2fe5ff3e-f808-4e6d-916a-d4959bb87227'),
('U', '2022-03-30 17:03:09', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '890d6295-ad7a-481f-acf0-c608c5e7a9df'),
('U', '2022-03-30 17:03:09', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', '2fe5ff3e-f808-4e6d-916a-d4959bb87227'),
('U', '2022-03-30 17:03:09', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '890d6295-ad7a-481f-acf0-c608c5e7a9df'),
('U', '2022-03-30 17:03:09', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', '2fe5ff3e-f808-4e6d-916a-d4959bb87227'),
('U', '2022-03-30 17:08:38', NULL, NULL, 'DESKTOP-0D2F255', 'producto', 'liraki', '7380f463-deb1-40ce-9f4f-7f5a959b6e32'),
('U', '2022-03-30 17:08:38', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', 'ec428dc7-a821-4b21-b16b-c9f98f88687c'),
('U', '2022-03-30 17:08:38', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', '2fe5ff3e-f808-4e6d-916a-d4959bb87227'),
('U', '2022-03-30 18:52:24', NULL, NULL, 'DESKTOP-0D2F255', 'producto', 'liraki', 'fa97335b-3efd-499d-9ec2-78c49597a301'),
('U', '2022-03-30 19:05:07', NULL, NULL, 'DESKTOP-0D2F255', 'producto', 'liraki', 'b84f59d3-650e-4cb6-815d-cec6bfc49ac0'),
('U', '2022-03-30 19:25:14', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '7e92e09b-7a2a-44ba-b2c9-21a0bc9b7d63'),
('U', '2022-03-30 19:27:07', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '7e92e09b-7a2a-44ba-b2c9-21a0bc9b7d63'),
('U', '2022-03-30 19:27:19', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '7e92e09b-7a2a-44ba-b2c9-21a0bc9b7d63'),
('U', '2022-03-30 20:30:40', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '2fe5ff3e-f808-4e6d-916a-d4959bb87227'),
('U', '2022-03-30 20:30:40', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', '5e916855-3d48-46b5-b2ab-47cffea85be7'),
('U', '2022-03-30 20:30:40', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', '7307299d-ec02-4f52-98d0-baf027033698'),
('U', '2022-03-30 20:30:40', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', '7380f463-deb1-40ce-9f4f-7f5a959b6e32'),
('U', '2022-03-30 20:30:40', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', '7e92e09b-7a2a-44ba-b2c9-21a0bc9b7d63'),
('U', '2022-03-30 20:30:40', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', '890d6295-ad7a-481f-acf0-c608c5e7a9df'),
('U', '2022-03-30 20:30:40', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', 'ad8325f8-1f19-4364-8a1f-0d85732d7d71'),
('U', '2022-03-30 20:30:40', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', 'b84f59d3-650e-4cb6-815d-cec6bfc49ac0'),
('U', '2022-03-30 20:30:40', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', 'ec428dc7-a821-4b21-b16b-c9f98f88687c'),
('U', '2022-03-30 20:30:40', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', 'fa97335b-3efd-499d-9ec2-78c49597a301'),
('U', '2022-03-30 20:30:55', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '2fe5ff3e-f808-4e6d-916a-d4959bb87227'),
('U', '2022-03-30 20:30:55', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', '5e916855-3d48-46b5-b2ab-47cffea85be7'),
('U', '2022-03-30 20:30:55', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', '7307299d-ec02-4f52-98d0-baf027033698'),
('U', '2022-03-30 20:30:55', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', '7380f463-deb1-40ce-9f4f-7f5a959b6e32'),
('U', '2022-03-30 20:30:55', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', '7e92e09b-7a2a-44ba-b2c9-21a0bc9b7d63'),
('U', '2022-03-30 20:30:55', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', '890d6295-ad7a-481f-acf0-c608c5e7a9df'),
('U', '2022-03-30 20:30:55', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', 'ad8325f8-1f19-4364-8a1f-0d85732d7d71'),
('U', '2022-03-30 20:30:55', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', 'b84f59d3-650e-4cb6-815d-cec6bfc49ac0'),
('U', '2022-03-30 20:30:55', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', 'ec428dc7-a821-4b21-b16b-c9f98f88687c'),
('U', '2022-03-30 20:30:55', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', 'fa97335b-3efd-499d-9ec2-78c49597a301'),
('U', '2022-03-30 20:31:10', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '2fe5ff3e-f808-4e6d-916a-d4959bb87227'),
('U', '2022-03-30 20:31:10', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', '5e916855-3d48-46b5-b2ab-47cffea85be7'),
('U', '2022-03-30 20:31:10', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', '7307299d-ec02-4f52-98d0-baf027033698'),
('U', '2022-03-30 20:31:10', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', '7380f463-deb1-40ce-9f4f-7f5a959b6e32'),
('U', '2022-03-30 20:31:10', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', '7e92e09b-7a2a-44ba-b2c9-21a0bc9b7d63'),
('U', '2022-03-30 20:31:10', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', '890d6295-ad7a-481f-acf0-c608c5e7a9df'),
('U', '2022-03-30 20:31:10', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', 'ad8325f8-1f19-4364-8a1f-0d85732d7d71'),
('U', '2022-03-30 20:31:10', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', 'b84f59d3-650e-4cb6-815d-cec6bfc49ac0'),
('U', '2022-03-30 20:31:10', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', 'ec428dc7-a821-4b21-b16b-c9f98f88687c'),
('U', '2022-03-30 20:31:10', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', 'fa97335b-3efd-499d-9ec2-78c49597a301'),
('U', '2022-03-30 20:33:57', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', 'b84f59d3-650e-4cb6-815d-cec6bfc49ac0'),
('U', '2022-03-30 20:35:59', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', 'b84f59d3-650e-4cb6-815d-cec6bfc49ac0'),
('U', '2022-03-30 20:36:35', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', 'fa97335b-3efd-499d-9ec2-78c49597a301'),
('U', '2022-03-30 20:37:01', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', 'b84f59d3-650e-4cb6-815d-cec6bfc49ac0'),
('U', '2022-03-30 20:37:16', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', 'fa97335b-3efd-499d-9ec2-78c49597a301'),
('U', '2022-03-30 20:38:25', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '7e92e09b-7a2a-44ba-b2c9-21a0bc9b7d63'),
('U', '2022-03-30 20:38:36', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '7e92e09b-7a2a-44ba-b2c9-21a0bc9b7d63'),
('U', '2022-03-30 20:42:08', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '7e92e09b-7a2a-44ba-b2c9-21a0bc9b7d63'),
('U', '2022-03-30 20:42:23', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '7e92e09b-7a2a-44ba-b2c9-21a0bc9b7d63'),
('U', '2022-03-30 20:44:38', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', 'b84f59d3-650e-4cb6-815d-cec6bfc49ac0'),
('U', '2022-03-30 20:44:38', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', 'fa97335b-3efd-499d-9ec2-78c49597a301'),
('U', '2022-03-30 20:44:48', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', 'ec428dc7-a821-4b21-b16b-c9f98f88687c'),
('U', '2022-03-30 20:44:48', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', '7380f463-deb1-40ce-9f4f-7f5a959b6e32'),
('U', '2022-03-30 20:44:48', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', '2fe5ff3e-f808-4e6d-916a-d4959bb87227'),
('U', '2022-03-30 20:44:48', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '890d6295-ad7a-481f-acf0-c608c5e7a9df'),
('U', '2022-03-30 20:44:48', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', '2fe5ff3e-f808-4e6d-916a-d4959bb87227'),
('U', '2022-03-30 20:44:48', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '7307299d-ec02-4f52-98d0-baf027033698');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log_proyecto`
--

CREATE TABLE `log_proyecto` (
  `operacion` char(1) NOT NULL,
  `creadoEn` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `creadoPor` text DEFAULT NULL,
  `uuidCreadoPor` text DEFAULT NULL,
  `hostname` text DEFAULT NULL,
  `tabla` text NOT NULL DEFAULT 'proyecto',
  `path` text NOT NULL DEFAULT 'mendozarq',
  `uuidRow` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `log_proyecto`
--

INSERT INTO `log_proyecto` (`operacion`, `creadoEn`, `creadoPor`, `uuidCreadoPor`, `hostname`, `tabla`, `path`, `uuidRow`) VALUES
('U', '2022-01-13 02:33:16', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '13f3af68-d552-4c54-bde6-816f474dd4ec'),
('I', '2022-01-13 02:34:27', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '2506c130-7622-4ef7-92b3-4fb2be6080e0'),
('U', '2022-01-13 02:34:37', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '2506c130-7622-4ef7-92b3-4fb2be6080e0'),
('D', '2022-01-13 02:34:42', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '2506c130-7622-4ef7-92b3-4fb2be6080e0'),
('U', '2022-02-09 03:42:49', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '13f3af68-d552-4c54-bde6-816f474dd4ec'),
('U', '2022-02-09 03:43:56', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '13f3af68-d552-4c54-bde6-816f474dd4ec'),
('U', '2022-02-10 00:49:14', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '13f3af68-d552-4c54-bde6-816f474dd4ec'),
('U', '2022-02-11 17:58:45', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '13f3af68-d552-4c54-bde6-816f474dd4ec'),
('U', '2022-02-11 17:59:05', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '13f3af68-d552-4c54-bde6-816f474dd4ec'),
('U', '2022-02-11 18:00:07', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '13f3af68-d552-4c54-bde6-816f474dd4ec'),
('U', '2022-02-11 18:00:37', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '13f3af68-d552-4c54-bde6-816f474dd4ec'),
('I', '2022-02-15 22:35:38', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '5f1c430d-cda9-4ee8-aa58-b011c3544567'),
('D', '2022-03-30 21:01:27', '', '', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '5f1c430d-cda9-4ee8-aa58-b011c3544567'),
('I', '2022-03-31 01:51:37', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '8ee6d457-1315-4c9b-bfae-7d7e04ac75a8'),
('U', '2022-04-01 01:38:59', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '8ee6d457-1315-4c9b-bfae-7d7e04ac75a8');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log_usuario`
--

CREATE TABLE `log_usuario` (
  `operacion` char(1) NOT NULL,
  `creadoEn` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `creadoPor` text DEFAULT NULL,
  `uuidCreadoPor` text DEFAULT NULL,
  `hostname` text DEFAULT NULL,
  `tabla` text NOT NULL DEFAULT 'usuario',
  `path` text NOT NULL DEFAULT 'mendozarq-liraki',
  `uuidRow` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `log_usuario`
--

INSERT INTO `log_usuario` (`operacion`, `creadoEn`, `creadoPor`, `uuidCreadoPor`, `hostname`, `tabla`, `path`, `uuidRow`) VALUES
('U', '2021-12-27 21:20:27', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'e3f1efed-b797-4c87-9f95-ae0a78a43384'),
('I', '2021-12-27 21:22:48', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'c2af07dc-a31c-463f-b7db-a36191c6b2f3'),
('U', '2021-12-27 21:23:20', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'c2af07dc-a31c-463f-b7db-a36191c6b2f3'),
('D', '2021-12-27 21:23:26', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'c2af07dc-a31c-463f-b7db-a36191c6b2f3'),
('D', '2021-12-27 21:23:34', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'e3f1efed-b797-4c87-9f95-ae0a78a43384'),
('D', '2021-12-27 21:25:27', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'a5309073-b7ea-4916-8c04-f553e731cab7'),
('U', '2021-12-27 21:25:48', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b'),
('U', '2021-12-27 21:27:24', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b'),
('I', '2021-12-27 21:27:50', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'd35a9834-8b89-4ad1-a266-0eafa35c3d22'),
('D', '2021-12-27 21:27:55', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'd35a9834-8b89-4ad1-a266-0eafa35c3d22'),
('U', '2021-12-27 21:33:12', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b'),
('U', '2021-12-27 21:33:23', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b'),
('U', '2021-12-27 21:39:27', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b'),
('U', '2021-12-27 21:39:36', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b'),
('U', '2021-12-27 21:40:05', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b'),
('U', '2021-12-27 21:40:43', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b'),
('U', '2021-12-27 21:41:14', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b'),
('U', '2021-12-27 21:41:54', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b'),
('U', '2021-12-27 21:42:12', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b'),
('U', '2021-12-27 21:43:47', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b'),
('U', '2021-12-27 21:47:33', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b'),
('U', '2021-12-30 03:44:04', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b'),
('U', '2022-01-01 02:15:49', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b'),
('U', '2022-01-03 03:46:33', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b'),
('U', '2022-01-03 03:46:37', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', '35f44215-b58f-491e-a439-4b39ea044442'),
('U', '2022-01-17 16:29:39', NULL, NULL, 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b'),
('U', '2022-02-11 00:39:03', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b'),
('U', '2022-02-17 18:39:03', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b'),
('U', '2022-02-22 18:53:42', NULL, NULL, 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b'),
('U', '2022-02-22 18:54:08', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', '35f44215-b58f-491e-a439-4b39ea044442'),
('U', '2022-02-22 18:54:33', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', '35f44215-b58f-491e-a439-4b39ea044442'),
('I', '2022-03-13 17:58:05', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'b47217c5-fb5c-4441-9dd1-912d9d6e64e2'),
('D', '2022-03-27 15:48:07', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'b47217c5-fb5c-4441-9dd1-912d9d6e64e2'),
('U', '2022-03-27 15:55:41', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b'),
('U', '2022-03-27 15:55:55', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b'),
('U', '2022-03-27 22:20:12', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', '35f44215-b58f-491e-a439-4b39ea044442'),
('U', '2022-03-27 22:20:22', '', '', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', '35f44215-b58f-491e-a439-4b39ea044442'),
('U', '2022-03-27 22:24:34', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b'),
('U', '2022-03-28 14:08:36', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b'),
('U', '2022-03-28 17:20:10', 'carmelita cabrero castillo', 'bf493a64-4573-433f-92b0-edbcae73a98b', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b'),
('U', '2022-03-28 17:24:11', 'carmelita cabrero castillo', 'bf493a64-4573-433f-92b0-edbcae73a98b', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b'),
('U', '2022-03-28 17:24:45', 'carmelita cabrero castillo', 'bf493a64-4573-433f-92b0-edbcae73a98b', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b'),
('U', '2022-03-30 16:26:08', 'carmelita cabrero castillo', 'bf493a64-4573-433f-92b0-edbcae73a98b', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b'),
('U', '2022-04-01 02:26:25', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', '36f1f6d4-163d-4856-a964-aae308769f27'),
('U', '2022-04-01 02:27:23', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', '2319b069-bde2-452c-af94-ec08f68c722c');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `observacionpersonal`
--

CREATE TABLE `observacionpersonal` (
  `uuid` varchar(100) NOT NULL,
  `creadoEn` timestamp NOT NULL DEFAULT current_timestamp(),
  `estado` varchar(100) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `fecha` date NOT NULL,
  `uuidPersonal` varchar(100) NOT NULL,
  `uuidVisita` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `observacionpersonal`
--

INSERT INTO `observacionpersonal` (`uuid`, `creadoEn`, `estado`, `descripcion`, `fecha`, `uuidPersonal`, `uuidVisita`) VALUES
('ce746cce-e651-46b6-ad66-527b7b72d59f', '2022-02-17 19:01:38', 'Fecha limite', 'fdsfsdfdsfds', '2022-02-17', '0cdca13f-175a-4ed0-8320-650f65bf9167', '38fc4888-69d9-4b9a-bbc5-7858f640334c'),
('da16b654-8650-4188-a710-17b4f4a77eb4', '2021-12-30 03:15:36', 'En curso', 'dsadsadsad', '2021-12-29', '0cdca13f-175a-4ed0-8320-650f65bf9167', '38fc4888-69d9-4b9a-bbc5-7858f640334c');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `observacionservicio`
--

CREATE TABLE `observacionservicio` (
  `uuid` varchar(100) NOT NULL,
  `creadoEn` timestamp NOT NULL DEFAULT current_timestamp(),
  `estado` varchar(100) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `fecha` date NOT NULL,
  `uuidServicio` varchar(100) NOT NULL,
  `uuidVisita` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opinionproducto`
--

CREATE TABLE `opinionproducto` (
  `uuid` varchar(100) NOT NULL,
  `creadoEn` timestamp NOT NULL DEFAULT current_timestamp(),
  `titulo` varchar(300) NOT NULL,
  `descripcion` varchar(1000) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 0,
  `verificado` tinyint(1) NOT NULL DEFAULT 0,
  `puntuacion` int(11) NOT NULL,
  `uuidProducto` varchar(100) NOT NULL,
  `uuidCliente` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `opinionproducto`
--

INSERT INTO `opinionproducto` (`uuid`, `creadoEn`, `titulo`, `descripcion`, `estado`, `verificado`, `puntuacion`, `uuidProducto`, `uuidCliente`) VALUES
('5ba26b9e-f051-40ed-a878-4f439889ea88', '2022-03-29 19:39:48', 'rewrewr', 'werrrrrrrrrrrrrrrrrrrrrrrrrrrr', 0, 0, 3, 'fa97335b-3efd-499d-9ec2-78c49597a301', 'bf493a64-4573-433f-92b0-edbcae73a98b'),
('78a9061b-56ad-43a2-ba91-f83407ba0f88', '2022-03-29 19:40:10', 'rrrrrrrrrrrr', 'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr', 0, 0, 4, 'fa97335b-3efd-499d-9ec2-78c49597a301', 'bf493a64-4573-433f-92b0-edbcae73a98b'),
('8376e961-9286-49e8-982e-a688c006ec95', '2022-03-29 19:39:35', 'tret', 'ertretretertretretert', 1, 0, 5, 'fa97335b-3efd-499d-9ec2-78c49597a301', 'bf493a64-4573-433f-92b0-edbcae73a98b');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `participantevisita`
--

CREATE TABLE `participantevisita` (
  `uuid` varchar(100) NOT NULL,
  `creadoEn` timestamp NOT NULL DEFAULT current_timestamp(),
  `uuidVisitaProyecto` varchar(100) NOT NULL,
  `uuidUsuario` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `participantevisita`
--

INSERT INTO `participantevisita` (`uuid`, `creadoEn`, `uuidVisitaProyecto`, `uuidUsuario`) VALUES
('8718a759-22c2-4375-88d7-ee52dc396672', '2022-02-17 19:00:58', '38fc4888-69d9-4b9a-bbc5-7858f640334c', '35f44215-b58f-491e-a439-4b39ea044442'),
('9bd2aed8-d47d-4b78-ad57-5c23685406be', '2022-02-17 19:00:58', '38fc4888-69d9-4b9a-bbc5-7858f640334c', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidoproducto`
--

CREATE TABLE `pedidoproducto` (
  `uuid` varchar(100) NOT NULL,
  `creadoEn` timestamp NOT NULL DEFAULT current_timestamp(),
  `numeroPedido` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidoPaterno` varchar(50) NOT NULL,
  `apellidoMaterno` varchar(50) DEFAULT NULL,
  `celular` int(11) NOT NULL,
  `direccion` text NOT NULL,
  `correo` varchar(100) NOT NULL,
  `nombreFactura` varchar(50) NOT NULL,
  `nitCI` text NOT NULL,
  `tipoEnvio` enum('delivery','carpinteria') DEFAULT NULL,
  `descripcion` varchar(500) NOT NULL,
  `metodoDePago` enum('efectivo','deposito_transferencia_qr','paypal') NOT NULL,
  `total` decimal(15,2) NOT NULL,
  `uuidCliente` varchar(100) NOT NULL,
  `estado` enum('pagando','pendiente','confirmado','envio','completado') NOT NULL DEFAULT 'pendiente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pedidoproducto`
--

INSERT INTO `pedidoproducto` (`uuid`, `creadoEn`, `numeroPedido`, `nombre`, `apellidoPaterno`, `apellidoMaterno`, `celular`, `direccion`, `correo`, `nombreFactura`, `nitCI`, `tipoEnvio`, `descripcion`, `metodoDePago`, `total`, `uuidCliente`, `estado`) VALUES
('26e59816-f126-47e6-ac2d-4a5abe607538', '2022-03-25 01:14:50', 1000024, 'bladimir', 'medrano', 'vargas', 69509449, 'Av segunda entre marina nunez del prado y calle greco.', 'bladimilmedranoblod@gmail.com', 'medrano', '123312312', 'carpinteria', '', 'paypal', '6300.00', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'pendiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

CREATE TABLE `personal` (
  `uuid` varchar(100) NOT NULL,
  `creadoEn` timestamp NOT NULL DEFAULT current_timestamp(),
  `nombre` varchar(50) NOT NULL,
  `apellidoPaterno` varchar(50) NOT NULL,
  `apellidoMaterno` varchar(50) DEFAULT NULL,
  `celular` int(11) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `sueldo` decimal(15,2) DEFAULT NULL,
  `moneda` varchar(10) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `personal`
--

INSERT INTO `personal` (`uuid`, `creadoEn`, `nombre`, `apellidoPaterno`, `apellidoMaterno`, `celular`, `direccion`, `correo`, `descripcion`, `sueldo`, `moneda`, `activo`) VALUES
('0cdca13f-175a-4ed0-8320-650f65bf9167', '2021-10-08 01:21:17', 'juan', 'perez', 'mendez', 7762509, 'avenida aroma entre calle nose y avenida alguna ', 'suarez@gmail.com', 'personal de construccion de obras', '10000.00', 'bs', 1),
('6739cd0f-9e3e-4eb2-9c22-e2a60be68401', '2022-03-31 03:30:25', 'alvaro', 'mendez', 'castro', 7324341, '', 'mendez@gmail.com', 'Personal de contruccion', '0.00', 'bs', 1);

--
-- Disparadores `personal`
--
DELIMITER $$
CREATE TRIGGER `delete_personal_trigger` AFTER DELETE ON `personal` FOR EACH ROW BEGIN
    CALL personal_procedure(
            'D',
            CURRENT_TIMESTAMP,
            @creadoPor,
            @uuidCreadoPor,
            @@hostname,
            OLD.uuid
        );

    set @uuidCreadoPor = '', @creadoPor = '';
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_personal_trigger` AFTER INSERT ON `personal` FOR EACH ROW BEGIN
    CALL personal_procedure(
            'I',
            CURRENT_TIMESTAMP,
            @creadoPor,
            @uuidCreadoPor,
            @@hostname,
            NEW.uuid
        );

    set @uuidCreadoPor = '', @creadoPor = '';
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_personal_trigger` AFTER UPDATE ON `personal` FOR EACH ROW BEGIN
    CALL personal_procedure(
            'U',
            CURRENT_TIMESTAMP,
            @creadoPor,
            @uuidCreadoPor,
            @@hostname,
            NEW.uuid
        );
    set @uuidCreadoPor = '', @creadoPor = '';
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personalproyecto`
--

CREATE TABLE `personalproyecto` (
  `uuid` varchar(100) NOT NULL,
  `creadoEn` timestamp NOT NULL DEFAULT current_timestamp(),
  `uuidProyecto` varchar(100) NOT NULL,
  `uuidPersonal` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `personalproyecto`
--

INSERT INTO `personalproyecto` (`uuid`, `creadoEn`, `uuidProyecto`, `uuidPersonal`) VALUES
('c0013267-110a-4db8-ad73-fdccb16620b9', '2022-02-17 19:00:00', '13f3af68-d552-4c54-bde6-816f474dd4ec', '0cdca13f-175a-4ed0-8320-650f65bf9167');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planificacionproyecto`
--

CREATE TABLE `planificacionproyecto` (
  `uuid` varchar(100) NOT NULL,
  `creadoEn` timestamp NOT NULL DEFAULT current_timestamp(),
  `titulo` text NOT NULL,
  `subtitulo` text DEFAULT NULL,
  `uuidProyecto` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `planificacionproyecto`
--

INSERT INTO `planificacionproyecto` (`uuid`, `creadoEn`, `titulo`, `subtitulo`, `uuidProyecto`) VALUES
('3d8c04fa-552d-43c0-b2fc-c49e0c9f6bf2', '2022-02-11 17:26:42', 'Cencerrillas Engarmarse Abajeño', ' Lorem ipsum dolor sit amet consectetur,\nadipisicing elit. Deleniti fugiat ipsum, sequi, quis eaque in nobis ullam voluptate id quia magni tempore pariatur voluptatem? Eos officia ut modi rem\nasper', '13f3af68-d552-4c54-bde6-816f474dd4ec'),
('9086f313-c5a7-4ce4-8444-73d50b31d0ba', '2022-04-01 02:12:59', 'proyecto de prueba', 'proyecto de prueba de la constructora mendozarq', '8ee6d457-1315-4c9b-bfae-7d7e04ac75a8');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presupuestoobra`
--

CREATE TABLE `presupuestoobra` (
  `uuid` varchar(100) NOT NULL,
  `creadoEn` timestamp NOT NULL DEFAULT current_timestamp(),
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `fecha` date NOT NULL,
  `iva` decimal(12,2) DEFAULT 0.00,
  `total` decimal(12,2) DEFAULT 0.00,
  `uuidCliente` varchar(100) DEFAULT NULL,
  `uuidUsuario` varchar(100) DEFAULT NULL,
  `uuidProyecto` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `presupuestoobra`
--

INSERT INTO `presupuestoobra` (`uuid`, `creadoEn`, `nombre`, `descripcion`, `fecha`, `iva`, `total`, `uuidCliente`, `uuidUsuario`, `uuidProyecto`) VALUES
('5185e058-4571-47fd-abd8-84ba0fa9c633', '2022-04-01 01:48:23', 'trump tower', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. ', '2022-01-13', '5.00', '0.00', NULL, NULL, '13f3af68-d552-4c54-bde6-816f474dd4ec'),
('e0251f45-2ddf-4096-872a-99c319a09b40', '2022-01-13 20:06:40', 'trump tower', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. ', '2022-01-13', '5.00', '0.00', 'bf493a64-4573-433f-92b0-edbcae73a98b', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presupuestoproyecto`
--

CREATE TABLE `presupuestoproyecto` (
  `uuid` varchar(100) NOT NULL,
  `creadoEn` timestamp NOT NULL DEFAULT current_timestamp(),
  `uuidPresupuestoObra` varchar(100) NOT NULL,
  `uuidProyecto` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `uuid` varchar(100) NOT NULL,
  `creadoEn` timestamp NOT NULL DEFAULT current_timestamp(),
  `nombre` varchar(300) NOT NULL,
  `descripcion` varchar(1000) DEFAULT NULL,
  `precio` decimal(15,2) NOT NULL,
  `moneda` varchar(5) NOT NULL DEFAULT 'Bs.',
  `stock` int(11) NOT NULL,
  `descuento` decimal(15,2) NOT NULL DEFAULT 0.00,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`uuid`, `creadoEn`, `nombre`, `descripcion`, `precio`, `moneda`, `stock`, `descuento`, `estado`) VALUES
('2fe5ff3e-f808-4e6d-916a-d4959bb87227', '2021-11-25 01:23:23', 'Mesa para exterior o jardin de madera cedro', 'Abada Gen Increpar Incorporal Abadejo Bastonada Engastador Abajadero Abacorar. Geminar Generador Abajo Abacorar Batán Ficticio Cendal Ficha. Cendrazo Cenata Gemoterapia Incrédulo. Engarrafador Batallador Abajeño Incrédulo Abajo Engarrar Cenata Generador. Engarberar Descepar Incorporal Incordio Gemoso Incredibilidad Fichar Fice Ceneque Gemiquear.\n', '700.00', 'Bs.', 11, '3.00', 1),
('5e916855-3d48-46b5-b2ab-47cffea85be7', '2021-11-25 01:20:49', 'Marco de madera de abeto para interior y exteriror', 'Abada Gen Increpar Incorporal Abadejo Bastonada Engastador Abajadero Abacorar. Geminar Generador Abajo Abacorar Batán Ficticio Cendal Ficha. Cendrazo Cenata Gemoterapia Incrédulo. Engarrafador Batallador Abajeño Incrédulo Abajo Engarrar Cenata Generador. Engarberar Descepar Incorporal Incordio Gemoso Incredibilidad Fichar Fice Ceneque Gemiquear.\n', '700.00', 'Bs.', 9, '0.00', 1),
('7307299d-ec02-4f52-98d0-baf027033698', '2022-03-12 00:09:44', 'Puerta de cedro para interiores', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Explicabo beatae quisquam, optio eligendi atque dicta minima labore dolor odio? Ex quos vel aliquid possimus officia obcaecati harum repellat autem quo!', '100.00', 'Bs.', 4, '0.00', 1),
('7380f463-deb1-40ce-9f4f-7f5a959b6e32', '2022-03-11 18:56:40', 'Escaleras de madera Tradicionales', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Explicabo beatae quisquam, optio eligendi atque dicta minima labore dolor odio? Ex quos vel aliquid possimus officia obcaecati harum repellat autem quo!', '400.00', 'Bs.', 13, '0.00', 1),
('7d9ca4bb-b259-4ce2-b069-4893f074b597', '2021-11-28 02:14:26', 'Vitrina de madera de abeto matrimonial con cajuelas amplias', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Doloremque debitis quibusdam laborum adipisci dolorem sunt provident, in eaque deleniti sequi? Quasi iure accusantium voluptas odio, maxime fugit perferendis ipsum reiciendis?', '1000.00', 'Bs.', 0, '3.00', 1),
('7e92e09b-7a2a-44ba-b2c9-21a0bc9b7d63', '2022-03-11 19:04:58', 'Mesa de madera de pino 4m x 4m', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Explicabo beatae quisquam, optio eligendi atque dicta minima labore dolor odio? Ex quos vel aliquid possimus officia obcaecati harum repellat autem quo!', '150.00', 'Bs.', 4, '40.00', 1),
('890d6295-ad7a-481f-acf0-c608c5e7a9df', '2021-11-25 01:17:14', 'Escaleras de madera de abeto para interior', 'Abada Gen Increpar Incorporal Abadejo Bastonada Engastador Abajadero Abacorar. Geminar Generador Abajo Abacorar Batán Ficticio Cendal Ficha. Cendrazo Cenata Gemoterapia Incrédulo. Engarrafador Batallador Abajeño Incrédulo Abajo Engarrar Cenata Generador. Engarberar Descepar Incorporal Incordio Gemoso Incredibilidad Fichar Fice Ceneque Gemiquear.', '5000.00', 'Bs.', 6, '0.00', 1),
('ad8325f8-1f19-4364-8a1f-0d85732d7d71', '2021-11-25 01:26:25', 'Sillas de madera de nogal para interior con un diseño clasico', 'Abada Gen Increpar Incorporal Abadejo Bastonada Engastador Abajadero Abacorar. Geminar Generador Abajo Abacorar Batán Ficticio Cendal Ficha. Cendrazo Cenata Gemoterapia Incrédulo. Engarrafador Batallador Abajeño Incrédulo Abajo Engarrar Cenata Generador. Engarberar Descepar Incorporal Incordio Gemoso Incredibilidad Fichar Fice Ceneque Gemiquear.\n', '200.00', 'Bs.', 103, '0.00', 1),
('b84f59d3-650e-4cb6-815d-cec6bfc49ac0', '2022-03-11 18:57:42', 'Escaleras minimalistas para interior', '', '1000.00', 'Bs.', 8, '0.00', 1),
('ec428dc7-a821-4b21-b16b-c9f98f88687c', '2021-11-25 01:19:44', 'Marco de ventana de madera de pino reforzado para exterior', 'Abada Gen Increpar Incorporal Abadejo Bastonada Engastador Abajadero Abacorar. Geminar Generador Abajo Abacorar Batán Ficticio Cendal Ficha. Cendrazo Cenata Gemoterapia Incrédulo. Engarrafador Batallador Abajeño Incrédulo Abajo Engarrar Cenata Generador. Engarberar Descepar Incorporal Incordio Gemoso Incredibilidad Fichar Fice Ceneque Gemiquear.\n', '500.00', 'Bs.', 43, '5.00', 1),
('fa97335b-3efd-499d-9ec2-78c49597a301', '2022-03-11 18:59:06', 'Escaleras para exterior con disenho minimalista de madera de pino', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Explicabo beatae quisquam, optio eligendi atque dicta minima labore dolor odio? Ex quos vel aliquid possimus officia obcaecati harum repellat autem quo!', '300.00', 'Bs.', 10, '0.00', 1);

--
-- Disparadores `producto`
--
DELIMITER $$
CREATE TRIGGER `delete_prodducto_trigger` AFTER DELETE ON `producto` FOR EACH ROW BEGIN
    CALL producto_procedure(
            'D',
            CURRENT_TIMESTAMP,
            @creadoPor,
            @uuidCreadoPor,
            @@hostname,
            OLD.uuid
        );

    set @uuidCreadoPor = '', @creadoPor = '';
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_producto_trigger` AFTER INSERT ON `producto` FOR EACH ROW BEGIN
    CALL producto_procedure(
            'I',
            CURRENT_TIMESTAMP,
            @creadoPor,
            @uuidCreadoPor,
            @@hostname,
            NEW.uuid
        );

    set @uuidCreadoPor = '', @creadoPor = '';
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_producto_trigger` AFTER UPDATE ON `producto` FOR EACH ROW BEGIN
    CALL producto_procedure(
            'U',
            CURRENT_TIMESTAMP,
            @creadoPor,
            @uuidCreadoPor,
            @@hostname,
            NEW.uuid
        );
    set @uuidCreadoPor = '', @creadoPor = '';
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `uuid` varchar(100) NOT NULL,
  `creadoEn` timestamp NOT NULL DEFAULT current_timestamp(),
  `nombre` varchar(100) NOT NULL,
  `celular` int(11) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `uuidRecurso` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto`
--

CREATE TABLE `proyecto` (
  `uuid` varchar(100) NOT NULL,
  `creadoEn` timestamp NOT NULL DEFAULT current_timestamp(),
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `categoria` varchar(100) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `fechaInicio` date DEFAULT NULL,
  `fechaFinal` date DEFAULT NULL,
  `lugarProyecto` varchar(200) DEFAULT NULL,
  `porcentaje` int(11) DEFAULT NULL,
  `uuidCliente` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proyecto`
--

INSERT INTO `proyecto` (`uuid`, `creadoEn`, `nombre`, `descripcion`, `categoria`, `estado`, `fechaInicio`, `fechaFinal`, `lugarProyecto`, `porcentaje`, `uuidCliente`) VALUES
('13f3af68-d552-4c54-bde6-816f474dd4ec', '2021-11-27 16:27:32', 'Cencerrillas Engarmarse Abajeño', ' Lorem ipsum dolor sit amet consectetur,\nadipisicing elit. Deleniti fugiat ipsum, sequi, quis eaque in nobis ullam voluptate id quia magni tempore pariatur voluptatem? Eos officia ut modi rem\naspernat', 'construccion', 1, '2021-11-27', '2022-12-31', ' Lorem ipsum dolor sit amet consectetur,\nadipisicing elit. Deleniti fugiat ipsum, sequi, quis eaque in nobis ullam voluptate id quia magni tempore pariatur voluptatem? Eos officia ut modi rem\naspernat', 0, 'bf493a64-4573-433f-92b0-edbcae73a98b'),
('8ee6d457-1315-4c9b-bfae-7d7e04ac75a8', '2022-03-31 01:51:37', 'proyecto de prueba', 'proyecto de prueba de la constructora mendozarq', 'construccion', 1, '2022-03-18', '2022-03-31', 'dsaas', 0, 'bf493a64-4573-433f-92b0-edbcae73a98b');

--
-- Disparadores `proyecto`
--
DELIMITER $$
CREATE TRIGGER `delete_proyecto_trigger` AFTER DELETE ON `proyecto` FOR EACH ROW BEGIN
    CALL proyecto_procedure(
            'D',
            CURRENT_TIMESTAMP,
            @creadoPor,
            @uuidCreadoPor,
            @@hostname,
            OLD.uuid
        );

    set @uuidCreadoPor = '', @creadoPor = '';
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_proyecto_trigger` AFTER INSERT ON `proyecto` FOR EACH ROW BEGIN
    CALL proyecto_procedure(
            'I',
            CURRENT_TIMESTAMP,
            @creadoPor,
            @uuidCreadoPor,
            @@hostname,
            NEW.uuid
        );

    set @uuidCreadoPor = '', @creadoPor = '';
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_proyecto_trigger` AFTER UPDATE ON `proyecto` FOR EACH ROW BEGIN
    CALL proyecto_procedure(
            'U',
            CURRENT_TIMESTAMP,
            @creadoPor,
            @uuidCreadoPor,
            @@hostname,
            NEW.uuid
        );
    set @uuidCreadoPor = '', @creadoPor = '';
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `proyectowiew`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `proyectowiew` (
`uuid` varchar(100)
,`creadoEn` timestamp
,`nombre` varchar(50)
,`descripcion` varchar(200)
,`categoria` varchar(100)
,`estado` tinyint(1)
,`fechaInicio` date
,`fechaFinal` date
,`lugarProyecto` varchar(200)
,`porcentaje` int(11)
,`uuidCliente` varchar(100)
,`nombreCliente` varchar(50)
,`apellidoPaterno` varchar(50)
,`apellidoMaterno` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recurso`
--

CREATE TABLE `recurso` (
  `uuid` varchar(100) NOT NULL,
  `creadoEn` timestamp NOT NULL DEFAULT current_timestamp(),
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `tipoRecurso` enum('materia_prima','maquinas','material_de_construccion') DEFAULT 'materia_prima',
  `area` enum('mendozarq','liraki','mendoraki') DEFAULT 'mendozarq',
  `precioUnitario` decimal(15,2) DEFAULT 0.00,
  `precioPorMayor` decimal(15,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `recurso`
--

INSERT INTO `recurso` (`uuid`, `creadoEn`, `nombre`, `descripcion`, `tipoRecurso`, `area`, `precioUnitario`, `precioPorMayor`) VALUES
('ede21838-08d6-437a-b361-461b19613e20', '2022-04-01 17:23:48', 'nuevo recurso ', 'ggggddddddddddddddddddddddddddddddddddd', 'materia_prima', 'liraki', '12.00', '15.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicioproyecto`
--

CREATE TABLE `servicioproyecto` (
  `uuid` varchar(100) NOT NULL,
  `creadoEn` timestamp NOT NULL DEFAULT current_timestamp(),
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `avance` int(11) NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFinal` date NOT NULL,
  `uuidProyecto` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `servicioproyecto`
--

INSERT INTO `servicioproyecto` (`uuid`, `creadoEn`, `nombre`, `descripcion`, `avance`, `fechaInicio`, `fechaFinal`, `uuidProyecto`) VALUES
('9dd2d513-baab-4d53-a1b4-d76993255941', '2022-02-12 03:31:23', 'dsadas', 'dsadasd', 90, '2022-02-09', '2022-02-22', '13f3af68-d552-4c54-bde6-816f474dd4ec');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tareaplanificacionproyecto`
--

CREATE TABLE `tareaplanificacionproyecto` (
  `uuid` varchar(100) NOT NULL,
  `creadoEn` timestamp NOT NULL DEFAULT current_timestamp(),
  `nombre` varchar(200) NOT NULL,
  `fechaInicio` date DEFAULT NULL,
  `fechaFinal` date DEFAULT NULL,
  `avance` int(11) DEFAULT NULL,
  `dependencia` varchar(100) DEFAULT NULL,
  `hito` tinyint(1) DEFAULT 0,
  `color` text DEFAULT NULL,
  `uuidCapitulo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tareaplanificacionproyecto`
--

INSERT INTO `tareaplanificacionproyecto` (`uuid`, `creadoEn`, `nombre`, `fechaInicio`, `fechaFinal`, `avance`, `dependencia`, `hito`, `color`, `uuidCapitulo`) VALUES
('962f6dcd-4565-4c0b-93a2-8dc309b337a2', '2022-02-11 17:28:37', ' Aperiam debitis cum', '2022-04-21', '2022-04-30', 0, '46b085fd-dc1a-41ac-84f0-e1f6391be86d', 1, '', '3e5eb62b-388f-4ca2-b40f-afce49edd08a'),
('f6eedf06-6da0-4a96-8616-25867d9332f9', '2022-02-17 18:57:32', 'dsadas', '2022-02-09', '2022-02-28', 41, '962f6dcd-4565-4c0b-93a2-8dc309b337a2', 0, '#05ff09', '3e5eb62b-388f-4ca2-b40f-afce49edd08a');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `uuid` varchar(100) NOT NULL,
  `creadoEn` timestamp NOT NULL DEFAULT current_timestamp(),
  `nombre` varchar(50) NOT NULL,
  `apellidoPaterno` varchar(50) NOT NULL,
  `apellidoMaterno` varchar(50) DEFAULT NULL,
  `celular` int(11) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `contrasenha` varchar(100) NOT NULL,
  `rol` varchar(20) NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`uuid`, `creadoEn`, `nombre`, `apellidoPaterno`, `apellidoMaterno`, `celular`, `direccion`, `correo`, `username`, `contrasenha`, `rol`, `activo`) VALUES
('0976bfba-6a2a-4405-8bfe-2474a21f1e25', '2021-11-25 00:30:52', 'evaristo', 'del', 'gelabert', 67891432, '3896 Gil Ferrocarril\n', 'Lilia_Anaya@corpfolder.com', 'evari8pni9', '$2b$10$56JrCWb4S9Zx1.GT9WdwCuNdH5jnFQcwQgKUXqbtLGQvZ2JrsUVSa', 'cliente', 1),
('178e1faa-b3f0-4900-a7b5-a19085c0cf9c', '2021-11-25 00:29:26', 'salomón', 'ruano', '', 72686187, '4265 Korta hernandez Vía Pública\n', 'Francisco_Santana@yahoo.com', 'salomo1ydq', '$2b$10$MKlyLpWKHpnwOglfWDOMfeCnT0zwwFKXPEnWbyb7WZvyGTxo0HCiu', 'cliente', 1),
('2319b069-bde2-452c-af94-ec08f68c722c', '2021-11-25 00:39:52', 'leandra', 'villa', 'jordán', 74568926, '817 Tamayo Grupo\n', 'XimenaGuadalupe18@yahoo.com', 'leandhbal2', '$2b$10$g5h4utbZBrmhjrKTMV64.O3x6d43Zper9cu5CA7q9zpz5sQSSdHm6', 'vendedor', 1),
('35f44215-b58f-491e-a439-4b39ea044442', '2021-11-25 00:42:26', 'sergio', 'olivé', 'lerma', 70045451, '9431 Contreras Puente\n', 'Aarn.Gaitn22@example.com', 'sergimbswp', '$2b$10$ix0pSZUTSrJPnXcMfRxsCeuwS8RgwaEXRojgpxf.dD.yP2Ulsi1N2', 'administrador', 1),
('36f1f6d4-163d-4856-a964-aae308769f27', '2021-11-25 00:39:06', 'severiano', 'peña', 'campillo', 66365952, '3803 Miranda Vía Pública\n', 'Jorge.Tello@corpfolder.com', 'severx0md2', '$2b$10$1gKBcTW.CzxQB2kmJ8slqeu4kHTpgbgfOBCFOWoDML9siHcVb0qtu', 'arquitecto', 1),
('4655d3ef-55cb-4579-9776-7f39377f5368', '2021-11-25 00:34:38', 'josé', 'figueroa', 'ibáñez', 62256672, '931 Miranda Rambla\n', 'Gabriela_Zelaya97@gmail.com', 'joséijvxca', '$2b$10$h0hwzjwGhhLlQDgosMOfM.fwVWmSatBoQ3VY1Yv6dp1Chi0oP8f.G', 'arquitecto', 1),
('665d2f27-32f8-4ac2-81fc-f972bcfdce78', '2021-11-25 00:37:57', 'evangelina', 'molina', 'mercader', 66383117, '077 Negrete Gran Subida\n', 'JosAntonio_Cazares68@hotmail.com', 'evang2vu74', '$2b$10$ttZEYszXxEAIMJv9J23bOuSQ9c1LNsKRLa5HGcvlphXC0z7D1YYRK', 'arquitecto', 1),
('7a617f2c-0ca0-49be-a3f0-e77555174af0', '2021-11-25 00:30:03', 'máximo', 'acedo', 'morillo', 72807533, '2311 Rosado Pasaje\n', 'Toms_Quintana25@corpfolder.com', 'máximcrvd7', '$2b$10$JjJc.uMBp1qckLkFtTreueK2c6i6Rk9vJ4Ugp16Y9FyyYA66O6t8O', 'cliente', 1),
('7ec2091c-abf2-4025-a207-3bbf04a5a8b9', '2021-11-25 00:33:29', 'elodia', 'falcón', 'larrañaga', 68966636, '1757 Juárez Senda\n', 'Dorotea92@corpfolder.com', 'elodib0825', '$2b$10$NF6FJ62itir9Mbqqdl3YBeZSoaiMzz3FgihI/w0tsw9Sb4SwVe2ie', 'cliente', 1),
('81ed9811-5b7a-4316-8e9d-7081df740265', '2021-11-25 00:28:59', 'lina', 'sáenz', 'ribes', 78389801, '4988 Mondragón Rincón\n', 'Blanca_Orellana63@corpfolder.com', 'lina1tpy7e', '$2b$10$W14t6MNoWIk5XHGUrra.GeSDtGXl6Bkk43sc7Wa1T1AvdF./6erX.', 'cliente', 1),
('81f19377-6c68-4bdc-9e38-d1c47b68c0c6', '2021-11-25 00:38:31', 'néstor', 'almazán', 'azorin', 64046915, '98208 Yamileth Grupo\n', 'Mariana97@yahoo.com', 'nésto42u7t', '$2b$10$GEtu3VwvQjwcAuRbSjpzguT1ry5py7mCx0hVL/T68kVtsD3DMKKtC', 'arquitecto', 1),
('8faf0153-fd37-4096-ba58-5592c24eed5a', '2021-11-25 00:35:34', 'dafne', 'escamilla', 'miralles', 63598297, '6104 Aranda Manzana\n', 'Mercedes.Ayala1@nearbpo.com', 'dafne44lha', '$2b$10$PCG9pfLytv7.6MszgE13N.aMTdDGhvEe8GiHbZaq8HXgPa/bc51z6', 'arquitecto', 1),
('942246e6-f202-47f9-9db6-c067a33707eb', '2021-11-25 00:28:01', 'celia', 'cerdán', 'benavides', 64859213, '45267 Roldán Subida\n', 'Anita10@corpfolder.com', 'celia4w8yf', '$2b$10$4SXxEZImtgfJzKvWjI9dj.9.ThA91zs94tr9LPOiLmGl8wQM4k54W', 'cliente', 1),
('a5b86b62-0ef8-4d23-a2f8-a242daa25103', '2021-11-25 00:31:43', 'angelino octavio', 'pintor', 'benavides', 70283107, '1953 Axel Huerta\n', 'Rosario_Narvez@hotmail.com', 'angelleftz', '$2b$10$qfGFexEXzfnl/jR4QMHR8u7xg2fuoJ15302yvD7yi0cS1dtKR3eli', 'cliente', 1),
('bf493a64-4573-433f-92b0-edbcae73a98b', '2021-11-25 00:45:00', 'carmelita', 'cabrero', 'castillo', 75176717, '81863 Pelayo Parque sdsadasdas', 'Mercedes67@yahoo.com', 'carmeky8ka', '$2b$10$0QPVaM7NGiSNm1neCyTIU.vQeF/jTOhpA9MYUhQLZORb7wVIgb5ku', 'cliente', 1),
('ce754db3-3b9c-4dd5-81f1-ae2b5f5a060a', '2021-11-25 00:27:02', 'juan', 'sobrino', 'suárez', 68101913, '77864 Enrique Colonia', 'Diego82@corpfolder.com', 'juannwfqjc', '$2b$10$EXWxE8u0VCeScF8pbeP4Me0.1JqHYdXVO4Fp2jbLxdmJj/ASVZ.cu', 'cliente', 1),
('fa27b5b3-837b-4486-b2cd-c6a306e8bd72', '2021-11-25 00:40:00', 'bladimir', 'medrano', 'vargas', 69509449, 'Av segunda entre marina nunez del prado y calle greco.', 'bladimilmedranoblod@gmail.com', 'blado959', '$2b$10$Ejt7X/epAQ2kfChOFJa9T.apOjSfTR2xkMWOoIfWWKT4JFh8CDu.C', 'administrador', 1);

--
-- Disparadores `usuario`
--
DELIMITER $$
CREATE TRIGGER `delete_usuario_trigger` AFTER DELETE ON `usuario` FOR EACH ROW BEGIN
    CALL usuario_procedure(
            'D',
            CURRENT_TIMESTAMP,
            @creadoPor,
            @uuidCreadoPor,
            @@hostname,
            OLD.uuid
        );

    set @uuidCreadoPor = '', @creadoPor = '';
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_usuario_trigger` AFTER INSERT ON `usuario` FOR EACH ROW BEGIN
    CALL usuario_procedure(
            'I',
            CURRENT_TIMESTAMP,
            @creadoPor,
            @uuidCreadoPor,
            @@hostname,
            NEW.uuid
        );

    set @uuidCreadoPor = '', @creadoPor = '';
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_usuario_trigger` AFTER UPDATE ON `usuario` FOR EACH ROW BEGIN
    CALL usuario_procedure(
            'U',
            CURRENT_TIMESTAMP,
            @creadoPor,
            @uuidCreadoPor,
            @@hostname,
            NEW.uuid
        );
    set @uuidCreadoPor = '', @creadoPor = '';
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarioproyecto`
--

CREATE TABLE `usuarioproyecto` (
  `uuid` varchar(100) NOT NULL,
  `creadoEn` timestamp NOT NULL DEFAULT current_timestamp(),
  `uuidProyecto` varchar(100) NOT NULL,
  `uuidUsuario` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarioproyecto`
--

INSERT INTO `usuarioproyecto` (`uuid`, `creadoEn`, `uuidProyecto`, `uuidUsuario`) VALUES
('067d431f-a5ac-4fc7-b9ba-cda3c8770f0f', '2022-02-17 18:59:55', '13f3af68-d552-4c54-bde6-816f474dd4ec', '36f1f6d4-163d-4856-a964-aae308769f27'),
('453ff224-54b9-4161-87c3-03817ca8f1d2', '2022-02-17 18:59:55', '13f3af68-d552-4c54-bde6-816f474dd4ec', '35f44215-b58f-491e-a439-4b39ea044442'),
('d07f7ce0-8020-4f7e-9c64-688d85f0004b', '2022-02-17 18:59:55', '13f3af68-d552-4c54-bde6-816f474dd4ec', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `uuid` varchar(100) NOT NULL,
  `creadoEn` timestamp NOT NULL DEFAULT current_timestamp(),
  `numeroVenta` int(11) NOT NULL,
  `nombreFactura` varchar(50) NOT NULL,
  `nitCiCex` varchar(100) NOT NULL,
  `departamento` enum('cbba','lp','scz') NOT NULL DEFAULT 'cbba',
  `direccion` varchar(500) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `tipoVenta` enum('fisica','online') NOT NULL,
  `tipoEnvio` enum('delivery','personal') NOT NULL,
  `metodoDePago` enum('efectivo','deposito_transferencia_qr','paypal','tarjeta') NOT NULL,
  `estado` enum('pagando','pendiente','confirmado','en_envio','para_recoger','completado') NOT NULL DEFAULT 'pendiente',
  `total` decimal(16,2) DEFAULT NULL,
  `uuidCliente` varchar(100) NOT NULL,
  `uuidVendedor` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`uuid`, `creadoEn`, `numeroVenta`, `nombreFactura`, `nitCiCex`, `departamento`, `direccion`, `descripcion`, `tipoVenta`, `tipoEnvio`, `metodoDePago`, `estado`, `total`, `uuidCliente`, `uuidVendedor`) VALUES
('29c54bef-6ab0-436d-becf-6ce650767285', '2022-03-30 16:45:41', 1000027, 'cabrero castillo', 'DSSA', 'cbba', '81863 Pelayo Parque\n sdsadasdas', '', 'online', 'personal', 'deposito_transferencia_qr', 'completado', '700.00', 'bf493a64-4573-433f-92b0-edbcae73a98b', NULL),
('3cc11389-8cf3-47f1-a410-11e1d5f28786', '2022-03-28 20:31:54', 1000014, 'cerdán benavides', '76574356546', 'cbba', '45267 Roldán Subida\n', '', 'fisica', 'delivery', 'efectivo', 'en_envio', '3595.00', '942246e6-f202-47f9-9db6-c067a33707eb', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72'),
('43121aeb-3c5c-495f-aaef-901abaf0a187', '2022-03-28 20:31:25', 1000013, 'sobrino suárez', '675436546', 'cbba', '77864 Enrique Colonia', '', 'fisica', 'personal', 'efectivo', 'para_recoger', '100.00', 'ce754db3-3b9c-4dd5-81f1-ae2b5f5a060a', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72'),
('68ffeb5b-40f9-4b98-bea7-701c793707d1', '2022-03-28 19:38:55', 1000010, 'cabrero castillo', '342423421', 'cbba', '81863 Pelayo Parque\n sdsadasdas', '', 'fisica', 'delivery', 'efectivo', 'completado', '775.00', 'bf493a64-4573-433f-92b0-edbcae73a98b', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72'),
('72d9fe3f-30bf-4824-88c7-aeabf501955a', '2022-03-28 21:28:45', 1000023, 'cabrero castillo', '12334245234', 'cbba', '81863 Pelayo Parque\n sdsadasdas', '', 'fisica', 'personal', 'efectivo', 'completado', '1000.00', 'bf493a64-4573-433f-92b0-edbcae73a98b', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72'),
('79de7552-0d78-4769-a4a6-f9aeb387cdb9', '2022-03-30 02:49:28', 1000025, 'cabrero castillo', 'dsadsadasdsa', 'cbba', '81863 Pelayo Parque\n sdsadasdas', '', 'online', 'personal', 'efectivo', 'completado', '2037.00', 'bf493a64-4573-433f-92b0-edbcae73a98b', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72'),
('9b4fc1b7-5384-4cdf-9666-d8a468bbe447', '2022-03-28 20:31:11', 1000012, 'acedo morillo', '23453325353', 'cbba', '2311 Rosado Pasaje\n', '', 'fisica', 'delivery', 'efectivo', 'completado', '950.00', '7a617f2c-0ca0-49be-a3f0-e77555174af0', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72'),
('cc4f12ad-e21c-4dda-a569-0317a59f8bc7', '2022-03-30 02:49:11', 1000024, 'falcón larrañaga', 'dassadad', 'cbba', '1757 Juárez Senda\n', '', 'fisica', 'personal', 'tarjeta', 'confirmado', '90.00', '7ec2091c-abf2-4025-a207-3bbf04a5a8b9', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72'),
('f5146dff-9e4c-41e3-8088-0d9e51d11216', '2022-03-28 20:30:48', 1000011, 'falcón larrañaga', '23542366', 'cbba', '1757 Juárez Senda\n', '', 'fisica', 'personal', 'efectivo', 'completado', '1100.00', '7ec2091c-abf2-4025-a207-3bbf04a5a8b9', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72');

--
-- Disparadores `venta`
--
DELIMITER $$
CREATE TRIGGER `delete_venta_trigger` BEFORE DELETE ON `venta` FOR EACH ROW BEGIN
    UPDATE producto AS p INNER JOIN conceptoventa c on p.uuid = c.uuidProducto
    INNER JOIN venta v on c.uuidVenta = v.uuid
    SET p.stock = p.stock + c.cantidad
    WHERE c.uuidVenta = OLD.uuid AND v.estado != 'pendiente' AND v.estado!= 'pagando';
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_venta_trigger` AFTER UPDATE ON `venta` FOR EACH ROW BEGIN
    UPDATE producto AS p
    INNER JOIN conceptoventa c on p.uuid = c.uuidProducto
    INNER JOIN venta v on c.uuidVenta = v.uuid
    SET p.stock = p.stock - c.cantidad
    WHERE  v.estado != 'pendiente' AND v.estado!= 'pagando' AND v.uuid = NEW.uuid AND v.tipoVenta = 'online';
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visitaproyecto`
--

CREATE TABLE `visitaproyecto` (
  `uuid` varchar(100) NOT NULL,
  `creadoEn` timestamp NOT NULL DEFAULT current_timestamp(),
  `nombre` varchar(50) NOT NULL,
  `faseDelProyecto` varchar(100) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `uuidProyecto` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `visitaproyecto`
--

INSERT INTO `visitaproyecto` (`uuid`, `creadoEn`, `nombre`, `faseDelProyecto`, `descripcion`, `fecha`, `uuidProyecto`) VALUES
('38fc4888-69d9-4b9a-bbc5-7858f640334c', '2021-12-21 01:45:38', 'dasdsadas', 'dsadsadsad', 'dasdsad', '2021-12-20 18:50:00', '13f3af68-d552-4c54-bde6-816f474dd4ec'),
('fe83cb0a-1df6-4081-a8da-0311cb91541f', '2022-04-01 02:42:16', 'dsad', 'dsaddsa', 'dsada', '2022-03-31 17:45:00', '8ee6d457-1315-4c9b-bfae-7d7e04ac75a8');

-- --------------------------------------------------------

--
-- Estructura para la vista `logs`
--
DROP TABLE IF EXISTS `logs`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `logs`  AS SELECT `log_usuario`.`operacion` AS `operacion`, `log_usuario`.`creadoEn` AS `creadoEn`, `log_usuario`.`creadoPor` AS `creadoPor`, `log_usuario`.`uuidCreadoPor` AS `uuidCreadoPor`, `log_usuario`.`hostname` AS `hostname`, `log_usuario`.`tabla` AS `tabla`, `log_usuario`.`path` AS `path`, `log_usuario`.`uuidRow` AS `uuidRow` FROM `log_usuario` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `proyectowiew`
--
DROP TABLE IF EXISTS `proyectowiew`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `proyectowiew`  AS SELECT `p`.`uuid` AS `uuid`, `p`.`creadoEn` AS `creadoEn`, `p`.`nombre` AS `nombre`, `p`.`descripcion` AS `descripcion`, `p`.`categoria` AS `categoria`, `p`.`estado` AS `estado`, `p`.`fechaInicio` AS `fechaInicio`, `p`.`fechaFinal` AS `fechaFinal`, `p`.`lugarProyecto` AS `lugarProyecto`, `p`.`porcentaje` AS `porcentaje`, `p`.`uuidCliente` AS `uuidCliente`, `u`.`nombre` AS `nombreCliente`, `u`.`apellidoPaterno` AS `apellidoPaterno`, `u`.`apellidoMaterno` AS `apellidoMaterno` FROM (`proyecto` `p` join `usuario` `u` on(`p`.`uuidCliente` = `u`.`uuid`)) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `capituloplanificacionproyecto`
--
ALTER TABLE `capituloplanificacionproyecto`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `uuidPlanificacionProyecto` (`uuidPlanificacionProyecto`);

--
-- Indices de la tabla `capitulopresupuesto`
--
ALTER TABLE `capitulopresupuesto`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `uuidPresupuestoObra` (`uuidPresupuestoObra`);

--
-- Indices de la tabla `carpetaproyecto`
--
ALTER TABLE `carpetaproyecto`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `uuidProyecto` (`uuidProyecto`);

--
-- Indices de la tabla `carritopedido`
--
ALTER TABLE `carritopedido`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `uuidProducto` (`uuidProducto`),
  ADD KEY `uuidPedido` (`uuidPedido`);

--
-- Indices de la tabla `carritoproducto`
--
ALTER TABLE `carritoproducto`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `uuidProducto` (`uuidProducto`),
  ADD KEY `uuidCliente` (`uuidCliente`);

--
-- Indices de la tabla `categoriaproducto`
--
ALTER TABLE `categoriaproducto`
  ADD PRIMARY KEY (`uuid`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `conceptoventa`
--
ALTER TABLE `conceptoventa`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `uuidVenta` (`uuidVenta`),
  ADD KEY `uuidProducto` (`uuidProducto`);

--
-- Indices de la tabla `detallecapitulo`
--
ALTER TABLE `detallecapitulo`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `uuidCapituloPresupuesto` (`uuidCapituloPresupuesto`);

--
-- Indices de la tabla `detallecategoriaproducto`
--
ALTER TABLE `detallecategoriaproducto`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `uuidCategoria` (`uuidCategoria`),
  ADD KEY `uuidProducto` (`uuidProducto`);

--
-- Indices de la tabla `documentocarpeta`
--
ALTER TABLE `documentocarpeta`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `uuidCarpeta` (`uuidCarpeta`),
  ADD KEY `uuidDocumento` (`uuidDocumento`);

--
-- Indices de la tabla `documentoproyecto`
--
ALTER TABLE `documentoproyecto`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `uuidProyecto` (`uuidProyecto`);

--
-- Indices de la tabla `fotoproducto`
--
ALTER TABLE `fotoproducto`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `uuidProducto` (`uuidProducto`);

--
-- Indices de la tabla `observacionpersonal`
--
ALTER TABLE `observacionpersonal`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `uuidPersonal` (`uuidPersonal`),
  ADD KEY `uuidVisita` (`uuidVisita`);

--
-- Indices de la tabla `observacionservicio`
--
ALTER TABLE `observacionservicio`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `uuidServicio` (`uuidServicio`),
  ADD KEY `uuidVisita` (`uuidVisita`);

--
-- Indices de la tabla `opinionproducto`
--
ALTER TABLE `opinionproducto`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `uuidProducto` (`uuidProducto`),
  ADD KEY `uuidCliente` (`uuidCliente`);

--
-- Indices de la tabla `participantevisita`
--
ALTER TABLE `participantevisita`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `uuidVisitaProyecto` (`uuidVisitaProyecto`),
  ADD KEY `uuidUsuario` (`uuidUsuario`);

--
-- Indices de la tabla `pedidoproducto`
--
ALTER TABLE `pedidoproducto`
  ADD PRIMARY KEY (`uuid`),
  ADD UNIQUE KEY `numeroPedido` (`numeroPedido`),
  ADD KEY `uuidCliente` (`uuidCliente`);

--
-- Indices de la tabla `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`uuid`);

--
-- Indices de la tabla `personalproyecto`
--
ALTER TABLE `personalproyecto`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `uuidProyecto` (`uuidProyecto`),
  ADD KEY `uuidPersonal` (`uuidPersonal`);

--
-- Indices de la tabla `planificacionproyecto`
--
ALTER TABLE `planificacionproyecto`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `uuidProyecto` (`uuidProyecto`);

--
-- Indices de la tabla `presupuestoobra`
--
ALTER TABLE `presupuestoobra`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `uuidCliente` (`uuidCliente`),
  ADD KEY `uuidUsuario` (`uuidUsuario`),
  ADD KEY `uuidProyecto` (`uuidProyecto`);

--
-- Indices de la tabla `presupuestoproyecto`
--
ALTER TABLE `presupuestoproyecto`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `uuidPresupuestoObra` (`uuidPresupuestoObra`),
  ADD KEY `uuidProyecto` (`uuidProyecto`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`uuid`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `uuidRecurso` (`uuidRecurso`);

--
-- Indices de la tabla `proyecto`
--
ALTER TABLE `proyecto`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `uuidCliente` (`uuidCliente`);

--
-- Indices de la tabla `recurso`
--
ALTER TABLE `recurso`
  ADD PRIMARY KEY (`uuid`);

--
-- Indices de la tabla `servicioproyecto`
--
ALTER TABLE `servicioproyecto`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `uuidProyecto` (`uuidProyecto`);

--
-- Indices de la tabla `tareaplanificacionproyecto`
--
ALTER TABLE `tareaplanificacionproyecto`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `uuidCapitulo` (`uuidCapitulo`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`uuid`);

--
-- Indices de la tabla `usuarioproyecto`
--
ALTER TABLE `usuarioproyecto`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `uuidProyecto` (`uuidProyecto`),
  ADD KEY `uuidUsuario` (`uuidUsuario`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`uuid`),
  ADD UNIQUE KEY `numeroVenta` (`numeroVenta`),
  ADD KEY `uuidCliente` (`uuidCliente`),
  ADD KEY `uuidVendedor` (`uuidVendedor`);

--
-- Indices de la tabla `visitaproyecto`
--
ALTER TABLE `visitaproyecto`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `uuidProyecto` (`uuidProyecto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pedidoproducto`
--
ALTER TABLE `pedidoproducto`
  MODIFY `numeroPedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000025;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `numeroVenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000038;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `capituloplanificacionproyecto`
--
ALTER TABLE `capituloplanificacionproyecto`
  ADD CONSTRAINT `capituloplanificacionproyecto_ibfk_1` FOREIGN KEY (`uuidPlanificacionProyecto`) REFERENCES `planificacionproyecto` (`uuid`) ON DELETE CASCADE;

--
-- Filtros para la tabla `capitulopresupuesto`
--
ALTER TABLE `capitulopresupuesto`
  ADD CONSTRAINT `capitulopresupuesto_ibfk_1` FOREIGN KEY (`uuidPresupuestoObra`) REFERENCES `presupuestoobra` (`uuid`) ON DELETE CASCADE;

--
-- Filtros para la tabla `carpetaproyecto`
--
ALTER TABLE `carpetaproyecto`
  ADD CONSTRAINT `carpetaproyecto_ibfk_1` FOREIGN KEY (`uuidProyecto`) REFERENCES `proyecto` (`uuid`);

--
-- Filtros para la tabla `carritopedido`
--
ALTER TABLE `carritopedido`
  ADD CONSTRAINT `carritopedido_ibfk_1` FOREIGN KEY (`uuidProducto`) REFERENCES `producto` (`uuid`),
  ADD CONSTRAINT `carritopedido_ibfk_2` FOREIGN KEY (`uuidPedido`) REFERENCES `pedidoproducto` (`uuid`) ON DELETE CASCADE;

--
-- Filtros para la tabla `carritoproducto`
--
ALTER TABLE `carritoproducto`
  ADD CONSTRAINT `carritoproducto_ibfk_1` FOREIGN KEY (`uuidProducto`) REFERENCES `producto` (`uuid`),
  ADD CONSTRAINT `carritoproducto_ibfk_2` FOREIGN KEY (`uuidCliente`) REFERENCES `usuario` (`uuid`);

--
-- Filtros para la tabla `conceptoventa`
--
ALTER TABLE `conceptoventa`
  ADD CONSTRAINT `conceptoventa_ibfk_1` FOREIGN KEY (`uuidVenta`) REFERENCES `venta` (`uuid`) ON DELETE CASCADE,
  ADD CONSTRAINT `conceptoventa_ibfk_2` FOREIGN KEY (`uuidProducto`) REFERENCES `producto` (`uuid`);

--
-- Filtros para la tabla `detallecapitulo`
--
ALTER TABLE `detallecapitulo`
  ADD CONSTRAINT `detallecapitulo_ibfk_1` FOREIGN KEY (`uuidCapituloPresupuesto`) REFERENCES `capitulopresupuesto` (`uuid`) ON DELETE CASCADE;

--
-- Filtros para la tabla `detallecategoriaproducto`
--
ALTER TABLE `detallecategoriaproducto`
  ADD CONSTRAINT `detallecategoriaproducto_ibfk_1` FOREIGN KEY (`uuidCategoria`) REFERENCES `categoriaproducto` (`uuid`),
  ADD CONSTRAINT `detallecategoriaproducto_ibfk_2` FOREIGN KEY (`uuidProducto`) REFERENCES `producto` (`uuid`) ON DELETE CASCADE;

--
-- Filtros para la tabla `documentocarpeta`
--
ALTER TABLE `documentocarpeta`
  ADD CONSTRAINT `documentocarpeta_ibfk_1` FOREIGN KEY (`uuidCarpeta`) REFERENCES `carpetaproyecto` (`uuid`),
  ADD CONSTRAINT `documentocarpeta_ibfk_2` FOREIGN KEY (`uuidDocumento`) REFERENCES `documentoproyecto` (`uuid`);

--
-- Filtros para la tabla `documentoproyecto`
--
ALTER TABLE `documentoproyecto`
  ADD CONSTRAINT `documentoproyecto_ibfk_1` FOREIGN KEY (`uuidProyecto`) REFERENCES `proyecto` (`uuid`);

--
-- Filtros para la tabla `fotoproducto`
--
ALTER TABLE `fotoproducto`
  ADD CONSTRAINT `fotoproducto_ibfk_1` FOREIGN KEY (`uuidProducto`) REFERENCES `producto` (`uuid`) ON DELETE CASCADE;

--
-- Filtros para la tabla `observacionpersonal`
--
ALTER TABLE `observacionpersonal`
  ADD CONSTRAINT `observacionpersonal_ibfk_1` FOREIGN KEY (`uuidPersonal`) REFERENCES `personal` (`uuid`),
  ADD CONSTRAINT `observacionpersonal_ibfk_2` FOREIGN KEY (`uuidVisita`) REFERENCES `visitaproyecto` (`uuid`);

--
-- Filtros para la tabla `observacionservicio`
--
ALTER TABLE `observacionservicio`
  ADD CONSTRAINT `observacionservicio_ibfk_1` FOREIGN KEY (`uuidServicio`) REFERENCES `servicioproyecto` (`uuid`),
  ADD CONSTRAINT `observacionservicio_ibfk_2` FOREIGN KEY (`uuidVisita`) REFERENCES `visitaproyecto` (`uuid`);

--
-- Filtros para la tabla `opinionproducto`
--
ALTER TABLE `opinionproducto`
  ADD CONSTRAINT `opinionproducto_ibfk_1` FOREIGN KEY (`uuidProducto`) REFERENCES `producto` (`uuid`),
  ADD CONSTRAINT `opinionproducto_ibfk_2` FOREIGN KEY (`uuidCliente`) REFERENCES `usuario` (`uuid`);

--
-- Filtros para la tabla `participantevisita`
--
ALTER TABLE `participantevisita`
  ADD CONSTRAINT `participantevisita_ibfk_1` FOREIGN KEY (`uuidVisitaProyecto`) REFERENCES `visitaproyecto` (`uuid`),
  ADD CONSTRAINT `participantevisita_ibfk_2` FOREIGN KEY (`uuidUsuario`) REFERENCES `usuario` (`uuid`);

--
-- Filtros para la tabla `pedidoproducto`
--
ALTER TABLE `pedidoproducto`
  ADD CONSTRAINT `pedidoproducto_ibfk_1` FOREIGN KEY (`uuidCliente`) REFERENCES `usuario` (`uuid`);

--
-- Filtros para la tabla `personalproyecto`
--
ALTER TABLE `personalproyecto`
  ADD CONSTRAINT `personalproyecto_ibfk_1` FOREIGN KEY (`uuidProyecto`) REFERENCES `proyecto` (`uuid`),
  ADD CONSTRAINT `personalproyecto_ibfk_2` FOREIGN KEY (`uuidPersonal`) REFERENCES `personal` (`uuid`);

--
-- Filtros para la tabla `planificacionproyecto`
--
ALTER TABLE `planificacionproyecto`
  ADD CONSTRAINT `planificacionproyecto_ibfk_1` FOREIGN KEY (`uuidProyecto`) REFERENCES `proyecto` (`uuid`) ON DELETE CASCADE;

--
-- Filtros para la tabla `presupuestoobra`
--
ALTER TABLE `presupuestoobra`
  ADD CONSTRAINT `presupuestoobra_ibfk_1` FOREIGN KEY (`uuidCliente`) REFERENCES `usuario` (`uuid`),
  ADD CONSTRAINT `presupuestoobra_ibfk_2` FOREIGN KEY (`uuidUsuario`) REFERENCES `usuario` (`uuid`),
  ADD CONSTRAINT `presupuestoobra_ibfk_3` FOREIGN KEY (`uuidProyecto`) REFERENCES `proyecto` (`uuid`);

--
-- Filtros para la tabla `presupuestoproyecto`
--
ALTER TABLE `presupuestoproyecto`
  ADD CONSTRAINT `presupuestoproyecto_ibfk_1` FOREIGN KEY (`uuidPresupuestoObra`) REFERENCES `presupuestoobra` (`uuid`),
  ADD CONSTRAINT `presupuestoproyecto_ibfk_2` FOREIGN KEY (`uuidProyecto`) REFERENCES `proyecto` (`uuid`);

--
-- Filtros para la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD CONSTRAINT `proveedor_ibfk_1` FOREIGN KEY (`uuidRecurso`) REFERENCES `recurso` (`uuid`);

--
-- Filtros para la tabla `proyecto`
--
ALTER TABLE `proyecto`
  ADD CONSTRAINT `proyecto_ibfk_1` FOREIGN KEY (`uuidCliente`) REFERENCES `usuario` (`uuid`);

--
-- Filtros para la tabla `servicioproyecto`
--
ALTER TABLE `servicioproyecto`
  ADD CONSTRAINT `servicioproyecto_ibfk_1` FOREIGN KEY (`uuidProyecto`) REFERENCES `proyecto` (`uuid`);

--
-- Filtros para la tabla `tareaplanificacionproyecto`
--
ALTER TABLE `tareaplanificacionproyecto`
  ADD CONSTRAINT `tareaplanificacionproyecto_ibfk_1` FOREIGN KEY (`uuidCapitulo`) REFERENCES `capituloplanificacionproyecto` (`uuid`) ON DELETE CASCADE;

--
-- Filtros para la tabla `usuarioproyecto`
--
ALTER TABLE `usuarioproyecto`
  ADD CONSTRAINT `usuarioproyecto_ibfk_1` FOREIGN KEY (`uuidProyecto`) REFERENCES `proyecto` (`uuid`),
  ADD CONSTRAINT `usuarioproyecto_ibfk_2` FOREIGN KEY (`uuidUsuario`) REFERENCES `usuario` (`uuid`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`uuidCliente`) REFERENCES `usuario` (`uuid`),
  ADD CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`uuidVendedor`) REFERENCES `usuario` (`uuid`);

--
-- Filtros para la tabla `visitaproyecto`
--
ALTER TABLE `visitaproyecto`
  ADD CONSTRAINT `visitaproyecto_ibfk_1` FOREIGN KEY (`uuidProyecto`) REFERENCES `proyecto` (`uuid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
