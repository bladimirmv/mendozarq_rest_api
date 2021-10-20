-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-09-2021 a las 14:28:11
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


use mendozarq;




/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mendozarq`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `capitulopresupuesto`
--

CREATE TABLE `capitulopresupuesto` (
  `uuid` varchar(100) NOT NULL,
  `creadoEn` timestamp NOT NULL DEFAULT current_timestamp(),
  `nombre` text NOT NULL,
  `descuento` int(11) NOT NULL DEFAULT 0,
  `total` decimal(12,2) DEFAULT 0.00,
  `uuidPresupuestoObra` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `capitulopresupuesto`
--

INSERT INTO `capitulopresupuesto` (`uuid`, `creadoEn`, `nombre`, `descuento`, `total`, `uuidPresupuestoObra`) VALUES
('12e7fdfb-d190-4215-af0e-33a4be425325', '2021-08-05 23:13:39', 'new comment ', 35, '0.00', '0c31287d-bc4f-438a-a4a4-b6260feeb750'),
('493cc6d4-a7d9-4568-8eb6-9715a32bd78b', '2021-08-06 01:34:46', 'neuvo capitulo', 21, '0.00', '260309c9-dfc0-40d2-97b0-635646028ac1'),
('9d5ecf19-047a-46e4-ae10-e5879ec16620', '2021-06-01 16:13:47', 'este es un capitulo de prueba', 16, '0.00', '0c31287d-bc4f-438a-a4a4-b6260feeb750');

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
('01290e40-d74e-45e2-aa80-a68af5dcf38c', '2021-02-14 02:05:53', 'docs', '2021-02-14', '188e21a5-a804-495a-9bbf-6e004d710cf8'),
('1504fa37-be64-4868-b7ac-e0f84b6de90a', '2021-02-18 02:30:28', 'planos', '2021-02-18', '8e6b94bd-0a2d-45fc-8a41-138ada725405'),
('1c3f5071-00a7-491e-8439-f138ef7f395e', '2021-03-05 00:55:48', 'planos', '2021-03-05', '0b250ef3-19ec-4106-978f-30167bff9649'),
('74305cd9-a3fc-4285-b370-1c883daa9c4b', '2021-02-28 00:19:28', 'iyilku', '2021-02-28', '188e21a5-a804-495a-9bbf-6e004d710cf8'),
('8431cac6-0f86-4ec1-aff7-92651d31fdf2', '2021-04-15 15:43:26', 'nueva carpeta', '2021-04-15', '8e6b94bd-0a2d-45fc-8a41-138ada725405'),
('90a128a2-c352-4938-b48e-f1b8d654ccc3', '2021-03-05 00:55:42', 'planillas', '2021-03-05', '0b250ef3-19ec-4106-978f-30167bff9649'),
('9537faef-05b2-43fe-afe4-743b4e019217', '2021-07-02 20:55:15', 'new folder', '2021-07-02', '0b250ef3-19ec-4106-978f-30167bff9649'),
('b45e40b0-3f00-43cd-8770-ac9570fa6c3b', '2021-03-05 01:05:25', 'nueva carpeta', '2021-03-05', '0b250ef3-19ec-4106-978f-30167bff9649'),
('c83ee331-8fa1-490a-af63-abbc60ec35b5', '2021-02-10 02:42:59', 'planos', '2021-02-10', '188e21a5-a804-495a-9bbf-6e004d710cf8');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoriaproducto`
--

CREATE TABLE `categoriaproducto` (
  `uuid` varchar(100) NOT NULL,
  `creadoEn` timestamp NOT NULL DEFAULT current_timestamp(),
  `nombre` text NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categoriaproducto`
--

INSERT INTO `categoriaproducto` (`uuid`, `creadoEn`, `nombre`, `descripcion`) VALUES
('e18566ba-69db-4864-b749-8263a1facd9e', '2021-09-18 15:21:49', 'nueva categoria', '');

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
  `total` decimal(15,2) NOT NULL,
  `uuidCapituloPresupuesto` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detallecapitulo`
--

INSERT INTO `detallecapitulo` (`uuid`, `creadoEn`, `descripcion`, `unidad`, `cantidad`, `precioUnitario`, `total`, `uuidCapituloPresupuesto`) VALUES
('2cfd30f1-b94e-4169-9f54-5bc351c170ed', '2021-08-06 01:35:19', 'cables', 'm', 155, '5.50', '0.00', '493cc6d4-a7d9-4568-8eb6-9715a32bd78b'),
('8bb89b58-d786-4769-ad9c-e536a2db5be1', '2021-08-06 00:02:08', 'new comment xd para probar nomas lol', 'µm', 133, '50.90', '0.00', '9d5ecf19-047a-46e4-ae10-e5879ec16620'),
('8c543e30-009f-4b2f-846e-67379349ba2f', '2021-08-05 23:15:07', 'gggfdgdfg', 'N/A', 6, '10.00', '0.00', '12e7fdfb-d190-4215-af0e-33a4be425325'),
('b6147e1d-a636-41a3-a419-4dd90932ddc8', '2021-08-05 07:55:47', 'this is a new commet to improove my tasks at the time going to some places to prooob gg nos euqe estay escribiendo adasdol okldasmdlask  gg nomas por queue esty difdsaijfss probando cosas poara testear mi proyecto xd ahora dias dashdasmdasdm  das das dfgfalsdfasdsad', 'kWhr', 300, '600.00', '0.00', '9d5ecf19-047a-46e4-ae10-e5879ec16620');

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
('2304e3b5-d20b-45f7-a738-c382f20a73ef', '2021-07-02 20:54:51', 'b45e40b0-3f00-43cd-8770-ac9570fa6c3b', '028b2242-4925-44da-9e15-657e9d0054b1'),
('300b5250-d410-4b5b-bb54-96f610078bdf', '2021-02-14 02:00:31', 'c83ee331-8fa1-490a-af63-abbc60ec35b5', '6f0fd772-ca29-44e0-ad0d-6f45a74919fe'),
('3e1e7c5a-b287-4329-9459-06121eaedd5a', '2021-03-05 00:58:05', '1c3f5071-00a7-491e-8439-f138ef7f395e', 'c3c36682-715b-4b56-b717-98ec8bcc5b26'),
('648c315e-a973-4398-85db-e1b8c3518db9', '2021-02-14 02:00:31', 'c83ee331-8fa1-490a-af63-abbc60ec35b5', 'c9b160bc-12db-4dfb-a7b0-26b1df9c2ffc'),
('9bad10eb-c903-4667-9036-9513f9d050b7', '2021-02-14 02:06:00', '01290e40-d74e-45e2-aa80-a68af5dcf38c', '3e1e6ac3-ab21-4a45-a7eb-29f5d7431b7f'),
('a7436ab7-b137-4437-af17-72b7df2c51d2', '2021-03-20 20:14:34', '74305cd9-a3fc-4285-b370-1c883daa9c4b', 'f684f692-d35a-4522-a90a-d2d5675e74e7'),
('b6f0d3a3-4c46-4538-8634-78f28ca25373', '2021-02-14 02:01:43', 'c83ee331-8fa1-490a-af63-abbc60ec35b5', '954fd0d9-a977-40ec-8645-5b124f4fd089'),
('bf4eb0b6-25ec-47b9-a56c-a53ff0a6e1dc', '2021-02-14 23:03:29', '01290e40-d74e-45e2-aa80-a68af5dcf38c', '828dd07c-1321-477b-afcf-2f2ccebcfbf7'),
('c3219222-1b83-4573-96b1-26e818a6570b', '2021-03-05 00:58:05', '1c3f5071-00a7-491e-8439-f138ef7f395e', 'beffca5f-9762-4a87-9233-98360eb1c364');

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
('028b2242-4925-44da-9e15-657e9d0054b1', '2021-07-02 20:54:51', '4-40729_earth-4k.jpg', 'mendozarq/documents/7312397f-2982-4122-9a57-089f47c58c45.jpg', 'https://mendozarq-liraki.s3.amazonaws.com/mendozarq/documents/7312397f-2982-4122-9a57-089f47c58c45.jpg', '2021-07-02', '0b250ef3-19ec-4106-978f-30167bff9649', 275116, 'folder'),
('0c646093-3aa3-4ee9-b1fa-a439996a4139', '2021-02-12 00:49:48', 'imagen.jpg', 'mendozarq/documents/17d8fbb8-4bc9-4e2c-9edd-970379a529a5.jpg', 'https://mendozarq-liraki.s3.sa-east-1.amazonaws.com/mendozarq/documents/17d8fbb8-4bc9-4e2c-9edd-970379a529a5.jpg', '2021-02-12', '188e21a5-a804-495a-9bbf-6e004d710cf8', 57203, 'root'),
('122cd7af-4658-4440-8667-ae3644120892', '2021-02-12 00:51:59', 'robo.zip', 'mendozarq/documents/f6f5b51c-d0df-4e87-bcef-60438de57695.zip', 'https://mendozarq-liraki.s3.sa-east-1.amazonaws.com/mendozarq/documents/f6f5b51c-d0df-4e87-bcef-60438de57695.zip', '2021-02-12', '188e21a5-a804-495a-9bbf-6e004d710cf8', 35271, 'root'),
('17477b71-c96a-4f49-8eeb-dbe6e1f49dbe', '2021-03-05 00:57:20', 'client-cert.pem', 'mendozarq/documents/e3349ad1-04d0-4eb5-8942-2bcc5a9eae21.pem', 'https://mendozarq-liraki.s3.sa-east-1.amazonaws.com/mendozarq/documents/e3349ad1-04d0-4eb5-8942-2bcc5a9eae21.pem', '2021-03-05', '0b250ef3-19ec-4106-978f-30167bff9649', 1236, 'root'),
('2f0eab9e-c781-4ff9-a967-b547e5583485', '2021-03-02 15:47:08', 'unnamed.jpg', 'mendozarq/documents/f91e3d76-ea4d-41b2-8a53-4b9f102ab043.jpg', 'https://mendozarq-liraki.s3.amazonaws.com/mendozarq/documents/f91e3d76-ea4d-41b2-8a53-4b9f102ab043.jpg', '2021-03-02', '188e21a5-a804-495a-9bbf-6e004d710cf8', 57203, 'root'),
('3e1e6ac3-ab21-4a45-a7eb-29f5d7431b7f', '2021-02-14 02:06:00', 'walkers.jpg', 'mendozarq/documents/3471a79b-ae94-4ab1-9a2f-c8de7e186400.jpg', 'https://mendozarq-liraki.s3.sa-east-1.amazonaws.com/mendozarq/documents/3471a79b-ae94-4ab1-9a2f-c8de7e186400.jpg', '2021-02-14', '188e21a5-a804-495a-9bbf-6e004d710cf8', 146974, 'folder'),
('5140d604-143e-4aa8-a719-e38f91bdf485', '2021-02-12 00:49:19', 'descarga1.jpg', 'mendozarq/documents/9484fe47-1a46-46ed-9efb-72b6eafefef0.jpg', 'https://mendozarq-liraki.s3.amazonaws.com/mendozarq/documents/9484fe47-1a46-46ed-9efb-72b6eafefef0.jpg', '2021-02-12', '188e21a5-a804-495a-9bbf-6e004d710cf8', 11582, 'root'),
('6095459a-10b0-418c-bee8-17456a3925eb', '2021-09-23 15:34:57', '4-40729_earth-4k.jpg', 'mendozarq/documents/6922ab5f-7fe5-4cfd-a300-2ee186017f5e.jpg', 'https://mendozarq-liraki.s3.amazonaws.com/mendozarq/documents/6922ab5f-7fe5-4cfd-a300-2ee186017f5e.jpg', '2021-09-23', '0b250ef3-19ec-4106-978f-30167bff9649', 275116, 'root'),
('64a63355-81f1-4f5e-86e2-f62e03d8e2b0', '2021-02-11 21:55:33', 'image123 .jpg', 'mendozarq/documents/2e37938d-8f3d-4284-97c4-c81e5a9704ce.jpg', 'https://mendozarq-liraki.s3.sa-east-1.amazonaws.com/mendozarq/documents/2e37938d-8f3d-4284-97c4-c81e5a9704ce.jpg', '2021-02-11', '188e21a5-a804-495a-9bbf-6e004d710cf8', 275116, 'root'),
('6f0fd772-ca29-44e0-ad0d-6f45a74919fe', '2021-02-14 02:00:31', 'unnamed.jpg', 'mendozarq/documents/fd63c767-40ea-46fa-9a1a-7f26ed2ecd23.jpg', 'https://mendozarq-liraki.s3.amazonaws.com/mendozarq/documents/fd63c767-40ea-46fa-9a1a-7f26ed2ecd23.jpg', '2021-02-14', '188e21a5-a804-495a-9bbf-6e004d710cf8', 57203, 'folder'),
('81a67fb4-934a-4331-8137-6980499b2af0', '2021-02-19 02:47:13', 'gggg1.jpg', 'mendozarq/documents/f8e72b94-9d87-468a-86f9-5f1b91767b4e.jpg', 'https://mendozarq-liraki.s3.amazonaws.com/mendozarq/documents/f8e72b94-9d87-468a-86f9-5f1b91767b4e.jpg', '2021-02-19', '8e6b94bd-0a2d-45fc-8a41-138ada725405', 246053, 'root'),
('828dd07c-1321-477b-afcf-2f2ccebcfbf7', '2021-02-14 23:03:29', 'gggg.jpg', 'mendozarq/documents/01cf7299-d816-4720-b2d5-08268f2f62eb.jpg', 'https://mendozarq-liraki.s3.amazonaws.com/mendozarq/documents/01cf7299-d816-4720-b2d5-08268f2f62eb.jpg', '2021-02-14', '188e21a5-a804-495a-9bbf-6e004d710cf8', 275116, 'folder'),
('91852c11-cd29-4b8b-8dca-e19bc42daf23', '2021-02-18 02:17:54', 'gggg.jpg', 'mendozarq/documents/778dcf29-5c99-46bf-8d6a-0dba90aa7def.jpg', 'https://mendozarq-liraki.s3.amazonaws.com/mendozarq/documents/778dcf29-5c99-46bf-8d6a-0dba90aa7def.jpg', '2021-02-18', '8e6b94bd-0a2d-45fc-8a41-138ada725405', 210812, 'root'),
('954fd0d9-a977-40ec-8645-5b124f4fd089', '2021-02-14 02:01:43', 'descarga .jpg', 'mendozarq/documents/62e5c255-d186-4aae-abee-b9eb01a22fdc.jpg', 'https://mendozarq-liraki.s3.sa-east-1.amazonaws.com/mendozarq/documents/62e5c255-d186-4aae-abee-b9eb01a22fdc.jpg', '2021-02-14', '188e21a5-a804-495a-9bbf-6e004d710cf8', 11582, 'folder'),
('97390e2b-4a3c-462a-8927-0f417d5316ff', '2021-03-17 16:48:28', '4-40729_earth-4k.jpg', 'mendozarq/documents/997aec8c-33c6-4028-8126-897f59335ae5.jpg', 'https://mendozarq-liraki.s3.amazonaws.com/mendozarq/documents/997aec8c-33c6-4028-8126-897f59335ae5.jpg', '2021-03-17', '0b250ef3-19ec-4106-978f-30167bff9649', 275116, 'root'),
('a847cbf7-8c3c-4a27-a0a2-fbb55986e95a', '2021-03-05 01:03:01', 'imagen2.jpg', 'mendozarq/documents/9aa5f50a-875c-4f76-98a2-be23c7ef5bbf.jpg', 'https://mendozarq-liraki.s3.sa-east-1.amazonaws.com/mendozarq/documents/9aa5f50a-875c-4f76-98a2-be23c7ef5bbf.jpg', '2021-03-05', '0b250ef3-19ec-4106-978f-30167bff9649', 347251, 'root'),
('afc49e08-42f0-45ad-bbb6-80837f1389ac', '2021-03-05 00:57:20', 'installer_debug.txt', 'mendozarq/documents/b55cfaaf-45d8-4aa1-999a-79d349c15cca.txt', 'https://mendozarq-liraki.s3.sa-east-1.amazonaws.com/mendozarq/documents/b55cfaaf-45d8-4aa1-999a-79d349c15cca.txt', '2021-03-05', '0b250ef3-19ec-4106-978f-30167bff9649', 31910, 'root'),
('beffca5f-9762-4a87-9233-98360eb1c364', '2021-03-05 00:58:05', 'client-key.pem', 'mendozarq/documents/7d53fbc4-81bf-4b4f-bdb9-034fefd8e302.pem', 'https://mendozarq-liraki.s3.sa-east-1.amazonaws.com/mendozarq/documents/7d53fbc4-81bf-4b4f-bdb9-034fefd8e302.pem', '2021-03-05', '0b250ef3-19ec-4106-978f-30167bff9649', 1674, 'folder'),
('c026e8ea-f649-4816-8dfe-0e7c09d778a4', '2021-03-05 00:57:20', 'example.html', 'mendozarq/documents/48deade4-e1ef-438e-9e72-c569e9f5baf6.html', 'https://mendozarq-liraki.s3.sa-east-1.amazonaws.com/mendozarq/documents/48deade4-e1ef-438e-9e72-c569e9f5baf6.html', '2021-03-05', '0b250ef3-19ec-4106-978f-30167bff9649', 725, 'root'),
('c3c36682-715b-4b56-b717-98ec8bcc5b26', '2021-03-05 00:58:05', 'gg.txtr', 'mendozarq/documents/3b1950d9-c58c-4fb0-bf12-771608e9f783.txtr', 'https://mendozarq-liraki.s3.sa-east-1.amazonaws.com/mendozarq/documents/3b1950d9-c58c-4fb0-bf12-771608e9f783.txtr', '2021-03-05', '0b250ef3-19ec-4106-978f-30167bff9649', 34, 'folder'),
('c9b160bc-12db-4dfb-a7b0-26b1df9c2ffc', '2021-02-14 02:00:31', 'predator.jpg', 'mendozarq/documents/8767bee7-00ec-4506-bc1c-3c049e768fce.jpg', 'https://mendozarq-liraki.s3.amazonaws.com/mendozarq/documents/8767bee7-00ec-4506-bc1c-3c049e768fce.jpg', '2021-02-14', '188e21a5-a804-495a-9bbf-6e004d710cf8', 91144, 'folder'),
('d0dafe69-2117-4ae9-a2b1-7afba6ffed5f', '2021-03-17 16:53:05', 'descarga (1).jpg', 'mendozarq/documents/cad6608b-a329-45b3-a36b-320f0149c2c3.jpg', 'https://mendozarq-liraki.s3.sa-east-1.amazonaws.com/mendozarq/documents/cad6608b-a329-45b3-a36b-320f0149c2c3.jpg', '2021-03-17', '0b250ef3-19ec-4106-978f-30167bff9649', 11582, 'root'),
('d41c0c3a-5ca1-4e26-81c4-781c52a958db', '2021-02-18 17:40:51', 'gggg.jpg', 'mendozarq/documents/538a88e7-a617-47ca-981f-fe8def17cccb.jpg', 'https://mendozarq-liraki.s3.amazonaws.com/mendozarq/documents/538a88e7-a617-47ca-981f-fe8def17cccb.jpg', '2021-02-18', '188e21a5-a804-495a-9bbf-6e004d710cf8', 263268, 'root'),
('d6365539-ce59-4bcd-9fac-e36c9299eac4', '2021-02-18 17:32:57', '1234.jpg', 'mendozarq/documents/283f4cb0-c805-435d-bdae-c53136b405ec.jpg', 'https://mendozarq-liraki.s3.amazonaws.com/mendozarq/documents/283f4cb0-c805-435d-bdae-c53136b405ec.jpg', '2021-02-18', '188e21a5-a804-495a-9bbf-6e004d710cf8', 347251, 'root'),
('f684f692-d35a-4522-a90a-d2d5675e74e7', '2021-03-20 20:14:34', 'presupuesto1.pdf', 'mendozarq/documents/780c67b1-a332-4a6c-b678-32c3a9b8e039.pdf', 'https://mendozarq-liraki.s3.amazonaws.com/mendozarq/documents/780c67b1-a332-4a6c-b678-32c3a9b8e039.pdf', '2021-03-20', '188e21a5-a804-495a-9bbf-6e004d710cf8', 29520, 'folder');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `herramienta`
--

CREATE TABLE `herramienta` (
  `uuid` varchar(100) NOT NULL,
  `creadoEn` timestamp NOT NULL DEFAULT current_timestamp(),
  `nombre` varchar(50) NOT NULL,
  `categoria` varchar(30) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `estado` tinyint(1) NOT NULL,
  `keyImg` text DEFAULT NULL,
  `originalNameImg` varchar(50) DEFAULT NULL,
  `urlImg` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
('43ba187f-c149-4d88-a9b8-5894d17e32e1', '2021-04-02 00:59:02', 'En curso', 'jhgfmjfghmgfh', '2021-04-01', 'ff1fa77c-5bd5-45a1-81dc-cfef125ce761', '36e8a392-b04b-4e5a-9a4b-80f0073afc39'),
('59adbc3a-559f-4230-b694-b78a3cdf9027', '2021-03-31 18:32:21', 'Fecha limite', 'la fecha pvto', '2021-03-31', '18ece005-e114-4353-b281-04d16ff1c3cc', 'cab6e6dd-a4d7-47cc-b210-2ccf5353b421'),
('6cf46261-517d-4e3c-a643-2ceace2b33c8', '2021-04-02 00:58:55', 'Con retraso', 'retrazado :v', '2021-04-01', '142dc817-852c-4f1f-b7fd-3e9804d7f011', '36e8a392-b04b-4e5a-9a4b-80f0073afc39'),
('f739d940-20d0-462d-83a8-4c044c97b900', '2021-04-02 00:58:29', 'Fecha limite', 'Se observaron retrazos en el avance del proyecto,', '2021-04-01', '142dc817-852c-4f1f-b7fd-3e9804d7f011', '36e8a392-b04b-4e5a-9a4b-80f0073afc39');

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

--
-- Volcado de datos para la tabla `observacionservicio`
--

INSERT INTO `observacionservicio` (`uuid`, `creadoEn`, `estado`, `descripcion`, `fecha`, `uuidServicio`, `uuidVisita`) VALUES
('336f7c29-1170-4a47-82a0-a41f3aa1a66f', '2021-04-02 00:59:39', 'Finalizado', 'etapa finalizado xd', '2021-04-01', '3b60f7ee-c863-4bd7-9f45-3ea3b6655653', '36e8a392-b04b-4e5a-9a4b-80f0073afc39'),
('5295124a-b8b8-4ef6-bbd6-e8db3d5900fd', '2021-03-04 16:31:17', 'Con retraso', 'descrip', '2021-03-04', '42ac433d-4a59-4ebe-87b4-7932aaafe16d', 'd9238f73-d176-44a5-8f59-e25175ce2274'),
('91b7325b-e41d-49cf-9343-c6adba66e693', '2021-03-24 22:44:30', 'En curso', 'dasd', '2021-03-24', '3b60f7ee-c863-4bd7-9f45-3ea3b6655653', 'cab6e6dd-a4d7-47cc-b210-2ccf5353b421'),
('a4936bf1-aae5-406b-aad4-5c7efad538fc', '2021-03-04 02:22:19', 'Fecha limite', 'con fecha limite', '2021-03-03', '956559d6-a752-48e2-865f-382cb490dabd', 'd9238f73-d176-44a5-8f59-e25175ce2274'),
('beda8723-43f0-4e2e-b668-636c25f5a5ec', '2021-03-25 16:11:44', 'En curso', 'dsadas', '2021-03-25', 'd5ef3e17-0e3c-4932-9e80-1f5a04d62515', 'cab6e6dd-a4d7-47cc-b210-2ccf5353b421'),
('d5705ba2-ac65-46ce-8e94-59e18bf2e31a', '2021-03-26 01:07:48', 'En curso', 'holaaaa xd12', '2021-03-25', 'd5ef3e17-0e3c-4932-9e80-1f5a04d62515', 'cab6e6dd-a4d7-47cc-b210-2ccf5353b421'),
('dae3559d-5b52-4c2b-bb74-5f24b1e1011c', '2021-03-25 16:13:42', 'En curso', 'hola xd', '2021-03-25', '3b60f7ee-c863-4bd7-9f45-3ea3b6655653', 'cab6e6dd-a4d7-47cc-b210-2ccf5353b421'),
('ea5bbeb4-8299-44c6-be2c-9024b71e369e', '2021-03-26 01:22:17', 'En curso', 'gg', '2021-03-25', '3b60f7ee-c863-4bd7-9f45-3ea3b6655653', 'cab6e6dd-a4d7-47cc-b210-2ccf5353b421');

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
('24b36ae9-169c-4677-96cf-a806f0413102', '2021-04-02 00:55:06', '17c33fc3-9174-4c38-954a-bbda50c9d44f', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72'),
('3e8fa23b-db3b-4b08-9e07-29877b99691f', '2021-03-23 01:19:53', 'cab6e6dd-a4d7-47cc-b210-2ccf5353b421', '9d7bf1d1-0833-4ac5-b994-4631b06a0a13'),
('4e2523b9-84b1-4810-b152-735fd442fd67', '2021-04-02 00:56:36', '36e8a392-b04b-4e5a-9a4b-80f0073afc39', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72'),
('529e55ff-f5d7-441b-809b-4109b0a7175c', '2021-03-22 01:18:12', 'a464ffae-0c11-40e2-96ae-0368f04e3ba0', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72'),
('66a7e370-232e-4333-abdd-0fa314c6f856', '2021-04-02 00:56:36', '36e8a392-b04b-4e5a-9a4b-80f0073afc39', '9d7bf1d1-0833-4ac5-b994-4631b06a0a13'),
('6eab2695-028a-4b33-a756-57503f0663e6', '2021-03-22 01:50:31', '99d7ac47-15db-4607-9093-7ac719996957', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72'),
('ad1812b2-8fa4-4f4b-bbb5-2ed857364e12', '2021-03-22 02:38:50', '99d7ac47-15db-4607-9093-7ac719996957', '9d7bf1d1-0833-4ac5-b994-4631b06a0a13'),
('b3f09034-8102-4f0a-b4bd-9846256d3081', '2021-03-22 01:18:12', 'a464ffae-0c11-40e2-96ae-0368f04e3ba0', '9d7bf1d1-0833-4ac5-b994-4631b06a0a13'),
('f184b67e-c5b5-4388-a083-fb914b8e0f96', '2021-04-02 00:56:36', '36e8a392-b04b-4e5a-9a4b-80f0073afc39', 'c29b98bd-aad7-48d1-b7e4-2e9b2f5fc12d'),
('f4bcfbb5-be26-4eed-9514-f67c3b624698', '2021-03-23 01:19:53', 'cab6e6dd-a4d7-47cc-b210-2ccf5353b421', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72');

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
('142dc817-852c-4f1f-b7fd-3e9804d7f011', '2021-01-21 16:04:12', 'henryy', 'barboza', 'mendez', 72589648, 'Avenida Caceres\n', 'henrysoft@gmail.com', 'Albañil de tiempo completo', '10.00', 'usd', 0),
('18ece005-e114-4353-b281-04d16ff1c3cc', '2021-01-21 15:45:40', 'franco', 'medrano', '', 69509449, '', 'example@gmail.com', 'Jefe responsable de las operaciones de las contrucciones', '500.00', 'bs', 1),
('ff1fa77c-5bd5-45a1-81dc-cfef125ce761', '2021-01-21 19:12:07', 'juanito', 'morales', 'nava', 4500421, 'Avenida siempre viva', 'example@gmail.com', 'Maestro de obra teimpo completo', '300.00', 'bs', 1);

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
('1d7f1b5e-8314-4a1d-a7bf-f01fb1782085', '2021-03-05 01:12:14', '0b250ef3-19ec-4106-978f-30167bff9649', '18ece005-e114-4353-b281-04d16ff1c3cc'),
('268eabdd-c09d-46c2-b6c6-a972153eac3a', '2021-04-17 23:31:57', '8e6b94bd-0a2d-45fc-8a41-138ada725405', '142dc817-852c-4f1f-b7fd-3e9804d7f011'),
('34484f3a-a3cc-4129-9167-310637274c06', '2021-02-18 17:11:05', '188e21a5-a804-495a-9bbf-6e004d710cf8', '18ece005-e114-4353-b281-04d16ff1c3cc'),
('9d86e7ae-a1c0-4212-9403-f88bb21b74b7', '2021-03-31 14:37:58', '0b250ef3-19ec-4106-978f-30167bff9649', '142dc817-852c-4f1f-b7fd-3e9804d7f011'),
('b5ed0801-66cf-480a-941b-58e59c205dbf', '2021-03-05 01:12:14', '0b250ef3-19ec-4106-978f-30167bff9649', 'ff1fa77c-5bd5-45a1-81dc-cfef125ce761'),
('bde5fc38-00a4-4298-860b-aea3f7baf928', '2021-03-04 19:10:16', '188e21a5-a804-495a-9bbf-6e004d710cf8', '142dc817-852c-4f1f-b7fd-3e9804d7f011'),
('ca1a1f9d-f3e4-4a7f-a61c-7741857c0784', '2021-02-18 17:03:36', '188e21a5-a804-495a-9bbf-6e004d710cf8', 'ff1fa77c-5bd5-45a1-81dc-cfef125ce761'),
('cfd0448e-7856-469d-a19e-f580193d7a0b', '2021-02-19 00:20:42', '8e6b94bd-0a2d-45fc-8a41-138ada725405', '18ece005-e114-4353-b281-04d16ff1c3cc'),
('d6303920-8353-4c70-9755-6ee2f4e0a975', '2021-02-19 00:20:42', '8e6b94bd-0a2d-45fc-8a41-138ada725405', 'ff1fa77c-5bd5-45a1-81dc-cfef125ce761');

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
  `iva` decimal(12,2) DEFAULT NULL,
  `total` decimal(12,2) DEFAULT 0.00,
  `uuidCliente` varchar(100) NOT NULL,
  `uuidUsuario` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `presupuestoobra`
--

INSERT INTO `presupuestoobra` (`uuid`, `creadoEn`, `nombre`, `descripcion`, `fecha`, `iva`, `total`, `uuidCliente`, `uuidUsuario`) VALUES
('0c31287d-bc4f-438a-a4a4-b6260feeb750', '2021-05-28 14:55:03', 'trump tower', 'the most famous tower of the year', '2021-05-28', '15.00', '0.00', '7fe8bdbb-aa83-4e3e-820d-e742ff13e895', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72'),
('1f490863-b5f3-4f89-866d-bddc8ee212a3', '2021-09-23 15:49:37', 'blaidmir', 'gg', '2021-09-23', '1.00', '0.00', '7fe8bdbb-aa83-4e3e-820d-e742ff13e895', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72'),
('260309c9-dfc0-40d2-97b0-635646028ac1', '2021-04-29 21:29:44', 'mendo', 'esto es una descripcion\n', '2021-04-29', '21.00', '600.00', '19ff6adc-4586-4637-890a-677860d657d6', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72');

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
('0b250ef3-19ec-4106-978f-30167bff9649', '2021-03-05 00:50:46', 'edificio segunda', 'Este es sun proyecto con la contructora mendozarq', 'construccion', 1, '2021-03-04', '2021-03-31', 'Avendia Segunda', 0, '84c07954-f033-4818-af26-a0368582aa48'),
('188e21a5-a804-495a-9bbf-6e004d710cf8', '2021-02-02 17:23:47', 'edificio portales', 'descripcion 2dsa', 'estructural', 1, '2021-02-27', '2021-02-28', 'lugar xd 2das', 0, '19ff6adc-4586-4637-890a-677860d657d6'),
('8e6b94bd-0a2d-45fc-8a41-138ada725405', '2021-02-17 22:57:17', 'edificio morales', 'Una colaboracion con la constructora mendoaarq', 'construccion', 1, '2021-02-18', '2021-02-21', 'avenida segunda\n', 0, '9cb77000-8843-4ef1-8646-013aed41d184');

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
('3b60f7ee-c863-4bd7-9f45-3ea3b6655653', '2021-03-24 02:37:02', 'serv', 'dasdsa', 64, '2021-03-25', '2021-03-25', '0b250ef3-19ec-4106-978f-30167bff9649'),
('3ec098c3-2599-402d-9fe5-a2b2272a93ef', '2021-02-24 01:04:55', 'servicio 3', '1234', 40, '2021-02-23', '2021-02-24', '188e21a5-a804-495a-9bbf-6e004d710cf8'),
('42ac433d-4a59-4ebe-87b4-7932aaafe16d', '2021-02-24 01:06:48', 'servicio 1', 'hjhgj', 100, '2021-02-09', '2021-02-24', '188e21a5-a804-495a-9bbf-6e004d710cf8'),
('956559d6-a752-48e2-865f-382cb490dabd', '2021-02-24 01:06:32', 'servicio 2', 'dsad', 60, '2021-02-19', '2021-02-17', '188e21a5-a804-495a-9bbf-6e004d710cf8'),
('d5ef3e17-0e3c-4932-9e80-1f5a04d62515', '2021-03-24 22:25:24', 'dasdas', 'dsadas', 42, '2021-03-24', '2021-03-31', '0b250ef3-19ec-4106-978f-30167bff9649');

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
('19ff6adc-4586-4637-890a-677860d657d6', '2021-01-29 14:47:18', 'weimar', 'mendoza', 'mendoza', 6958424, '', 'example2@gmail.com', 'weimain13z', '$2b$10$28dI5s3kUGQBfOQuMx7vCe69UvPbOzQhgZ7dx1Krx6QyE4/GFXWqa', 'cliente', 1),
('7fe8bdbb-aa83-4e3e-820d-e742ff13e895', '2021-05-28 14:31:14', 'donald', 'trump', '', 65102815, 'second avenue', 'donald@trump.en', 'donalxh8pq', '$2b$10$Kpoyna6wK1O5zKgOsM2QnONB4Tfjl/kJkzFx0ZQ.Cn8ChhgXs1mXa', 'cliente', 1),
('84c07954-f033-4818-af26-a0368582aa48', '2021-02-03 23:37:37', 'hilaria adima', 'vazquez', '', 5215465, 'avenida siempre viva\n', 'example@gmail.com', 'hilar3zez9', '$2b$10$LD1cnQ2IXpHWLDJbUN1g4ehWv1Y/HDNi/mE3IltcXw06YiKVj8e6.', 'cliente', 1),
('8737dab9-b6e0-468c-83a5-500ba80e710c', '2021-01-29 14:46:33', 'jhenny', 'medrano', '', 85499652, '', 'example@gmail.com', 'jhenngo3ur', '$2b$10$o3r99J9iSB7zN.m7J9l7juFcyKHtA0x0c3sgZVQiZlXXn/sPvuoJW', 'vendedor', 1),
('9cb77000-8843-4ef1-8646-013aed41d184', '2021-02-02 16:48:53', 'bladimir', 'medrano', 'vargas', 12345678, 'avenida seguna y siempre viva', 'dasdsa@dsad.co', 'bladir8616', '$2b$10$UOepstei6qQ8/QCYvSuErea8rZyC1Gmwr/VRDwQ9hTgyovHIEhYeS', 'cliente', 1),
('9d7bf1d1-0833-4ac5-b994-4631b06a0a13', '2021-03-05 01:11:01', 'hilaria', 'vazquez', '', 1516545, 'avenida segunda', 'example@gmail.com', 'hilara4a50', '$2b$10$2LMswL.w1fhRy/ez5lG34uflgvYFpzPSeamftvCDd9ov9LWi/p/zO', 'arquitecto', 1),
('c29b98bd-aad7-48d1-b7e4-2e9b2f5fc12d', '2021-01-29 14:46:04', 'franco', 'medrano', 'vargas', 58962114, '', 'frnaco@gmail.com', 'francsy0jm', '$2b$10$HN4ooYcJNtgVi3N/yW8Nfu.hU7v0Amt8WMynS3OTABDuS5IyN2mSe', 'arquitecto', 1),
('fa27b5b3-837b-4486-b2cd-c6a306e8bd72', '2021-01-12 23:45:41', 'bladimir', 'medrano', 'vargas', 69509449, 'Av segunda entre marina nunez del prado y calle greco.\n', 'example@gmail.com', 'blado959', '$2b$10$Ejt7X/epAQ2kfChOFJa9T.apOjSfTR2xkMWOoIfWWKT4JFh8CDu.C', 'administrador', 1);

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
('09735a69-9710-4457-81f6-6ba6c4a676e3', '2021-03-08 19:36:26', '0b250ef3-19ec-4106-978f-30167bff9649', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72'),
('171e2b50-8982-4c5a-a111-9ffd4dd8fcc3', '2021-03-20 23:59:02', '8e6b94bd-0a2d-45fc-8a41-138ada725405', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72'),
('3f6304e4-0795-4ae5-8fe1-0ebd48f5f1f2', '2021-03-20 23:59:02', '8e6b94bd-0a2d-45fc-8a41-138ada725405', '9d7bf1d1-0833-4ac5-b994-4631b06a0a13'),
('74c99f54-22a6-4e1f-8bc5-32ab741c74f0', '2021-02-23 18:13:33', '188e21a5-a804-495a-9bbf-6e004d710cf8', 'c29b98bd-aad7-48d1-b7e4-2e9b2f5fc12d'),
('a1017e9a-b420-4902-a551-d7c7546079e1', '2021-02-23 18:12:30', '188e21a5-a804-495a-9bbf-6e004d710cf8', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72'),
('a7390d9a-dbb7-4c14-bfd0-0b91a1e58d10', '2021-02-26 19:26:32', '8e6b94bd-0a2d-45fc-8a41-138ada725405', 'c29b98bd-aad7-48d1-b7e4-2e9b2f5fc12d'),
('f4be1440-1f24-4502-929a-f2076d38410a', '2021-03-22 23:51:46', '0b250ef3-19ec-4106-978f-30167bff9649', 'c29b98bd-aad7-48d1-b7e4-2e9b2f5fc12d'),
('fb6092ec-d227-4b60-a268-ce3a1f219f96', '2021-04-02 00:52:13', '0b250ef3-19ec-4106-978f-30167bff9649', '9d7bf1d1-0833-4ac5-b994-4631b06a0a13');

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
('17c33fc3-9174-4c38-954a-bbda50c9d44f', '2021-02-28 00:31:55', 'kyhjkl', 'hjkhjkjgluiliuyoo', 'khjgljkhlhjklkjhljkljkhljhk', '2021-05-05 16:35:00', '188e21a5-a804-495a-9bbf-6e004d710cf8'),
('285ae9c9-ac91-4bd1-a410-53953b427b89', '2021-02-27 17:30:11', 'primeros avance', 'dasd', 'asdas', '2021-02-27 05:30:00', '8e6b94bd-0a2d-45fc-8a41-138ada725405'),
('36e8a392-b04b-4e5a-9a4b-80f0073afc39', '2021-04-02 00:51:06', 'visita 3', 'construccion', 'esto es una descripcion', '2021-04-02 00:54:00', '0b250ef3-19ec-4106-978f-30167bff9649'),
('6599927a-0496-4fda-a6c3-d731ec608b15', '2021-03-05 01:14:30', 'visita1', 'exacavacion de sanjaaaaas', 'visitas para ver los avances de las excavaciones', '2021-03-29 01:59:00', '0b250ef3-19ec-4106-978f-30167bff9649'),
('99d7ac47-15db-4607-9093-7ac719996957', '2021-02-27 17:30:19', 'visita 2', 'sadsa', 'dsadas', '2021-03-31 09:30:00', '8e6b94bd-0a2d-45fc-8a41-138ada725405'),
('a464ffae-0c11-40e2-96ae-0368f04e3ba0', '2021-02-27 17:30:32', 'visita', 'visita fase', 'visita desc', '2021-04-10 14:52:00', '8e6b94bd-0a2d-45fc-8a41-138ada725405'),
('cab6e6dd-a4d7-47cc-b210-2ccf5353b421', '2021-03-22 17:06:25', 'visitasssss', 'fase xd', 'descripcion xd', '2021-05-05 00:59:00', '0b250ef3-19ec-4106-978f-30167bff9649'),
('d9238f73-d176-44a5-8f59-e25175ce2274', '2021-02-28 00:24:39', 'visita 1', 'excavacion de sanjas', '', '2021-02-28 05:30:00', '188e21a5-a804-495a-9bbf-6e004d710cf8');

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
-- Indices de la tabla `categoriaproducto`
--
ALTER TABLE `categoriaproducto`
  ADD PRIMARY KEY (`uuid`),
  ADD UNIQUE KEY `nombre` (`nombre`) USING HASH;

--
-- Indices de la tabla `detallecapitulo`
--
ALTER TABLE `detallecapitulo`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `uuidCapituloPresupuesto` (`uuidCapituloPresupuesto`);

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
-- Indices de la tabla `herramienta`
--
ALTER TABLE `herramienta`
  ADD PRIMARY KEY (`uuid`);

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
-- Indices de la tabla `participantevisita`
--
ALTER TABLE `participantevisita`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `uuidVisitaProyecto` (`uuidVisitaProyecto`),
  ADD KEY `uuidUsuario` (`uuidUsuario`);

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
-- Indices de la tabla `presupuestoobra`
--
ALTER TABLE `presupuestoobra`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `uuidCliente` (`uuidCliente`),
  ADD KEY `uuidUsuario` (`uuidUsuario`);

--
-- Indices de la tabla `presupuestoproyecto`
--
ALTER TABLE `presupuestoproyecto`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `uuidPresupuestoObra` (`uuidPresupuestoObra`),
  ADD KEY `uuidProyecto` (`uuidProyecto`);

--
-- Indices de la tabla `proyecto`
--
ALTER TABLE `proyecto`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `uuidCliente` (`uuidCliente`);

--
-- Indices de la tabla `servicioproyecto`
--
ALTER TABLE `servicioproyecto`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `uuidProyecto` (`uuidProyecto`);

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
-- Indices de la tabla `visitaproyecto`
--
ALTER TABLE `visitaproyecto`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `uuidProyecto` (`uuidProyecto`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `capitulopresupuesto`
--
ALTER TABLE `capitulopresupuesto`
  ADD CONSTRAINT `capitulopresupuesto_ibfk_1` FOREIGN KEY (`uuidPresupuestoObra`) REFERENCES `presupuestoobra` (`uuid`);

--
-- Filtros para la tabla `carpetaproyecto`
--
ALTER TABLE `carpetaproyecto`
  ADD CONSTRAINT `carpetaproyecto_ibfk_1` FOREIGN KEY (`uuidProyecto`) REFERENCES `proyecto` (`uuid`);

--
-- Filtros para la tabla `detallecapitulo`
--
ALTER TABLE `detallecapitulo`
  ADD CONSTRAINT `detallecapitulo_ibfk_1` FOREIGN KEY (`uuidCapituloPresupuesto`) REFERENCES `capitulopresupuesto` (`uuid`);

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
-- Filtros para la tabla `participantevisita`
--
ALTER TABLE `participantevisita`
  ADD CONSTRAINT `participantevisita_ibfk_1` FOREIGN KEY (`uuidVisitaProyecto`) REFERENCES `visitaproyecto` (`uuid`),
  ADD CONSTRAINT `participantevisita_ibfk_2` FOREIGN KEY (`uuidUsuario`) REFERENCES `usuario` (`uuid`);

--
-- Filtros para la tabla `personalproyecto`
--
ALTER TABLE `personalproyecto`
  ADD CONSTRAINT `personalproyecto_ibfk_1` FOREIGN KEY (`uuidProyecto`) REFERENCES `proyecto` (`uuid`),
  ADD CONSTRAINT `personalproyecto_ibfk_2` FOREIGN KEY (`uuidPersonal`) REFERENCES `personal` (`uuid`);

--
-- Filtros para la tabla `presupuestoobra`
--
ALTER TABLE `presupuestoobra`
  ADD CONSTRAINT `presupuestoobra_ibfk_1` FOREIGN KEY (`uuidCliente`) REFERENCES `usuario` (`uuid`),
  ADD CONSTRAINT `presupuestoobra_ibfk_2` FOREIGN KEY (`uuidUsuario`) REFERENCES `usuario` (`uuid`);

--
-- Filtros para la tabla `presupuestoproyecto`
--
ALTER TABLE `presupuestoproyecto`
  ADD CONSTRAINT `presupuestoproyecto_ibfk_1` FOREIGN KEY (`uuidPresupuestoObra`) REFERENCES `presupuestoobra` (`uuid`),
  ADD CONSTRAINT `presupuestoproyecto_ibfk_2` FOREIGN KEY (`uuidProyecto`) REFERENCES `proyecto` (`uuid`);

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
-- Filtros para la tabla `usuarioproyecto`
--
ALTER TABLE `usuarioproyecto`
  ADD CONSTRAINT `usuarioproyecto_ibfk_1` FOREIGN KEY (`uuidProyecto`) REFERENCES `proyecto` (`uuid`),
  ADD CONSTRAINT `usuarioproyecto_ibfk_2` FOREIGN KEY (`uuidUsuario`) REFERENCES `usuario` (`uuid`);

--
-- Filtros para la tabla `visitaproyecto`
--
ALTER TABLE `visitaproyecto`
  ADD CONSTRAINT `visitaproyecto_ibfk_1` FOREIGN KEY (`uuidProyecto`) REFERENCES `proyecto` (`uuid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
