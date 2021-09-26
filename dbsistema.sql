SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


create database dbsistema;
use dbsistema; 

select * from persona; 
select * from usuario; 

CREATE TABLE `articulo` (
  `idarticulo` 			int(11) 		NOT NULL,
  `idcategoria` 		int(11) 		NOT NULL,
  `codigo` 				varchar(50) 	DEFAULT NULL,
  `nombre` 				varchar(100) 	NOT NULL,
  `stock` 				int(11) 		DEFAULT NULL,
  `descripcion` 		varchar(256) 	DEFAULT NULL,
  `imagen` 				varchar(50) 	DEFAULT NULL,
  `condicion` 			tinyint(4) 		DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `articulo`

INSERT INTO `articulo` (`idarticulo`, `idcategoria`, `codigo`, `nombre`, `stock`, `descripcion`, `imagen`, `condicion`) VALUES
(6, 7, 'TC-2320', 'LIGHETER', 20, 'Gamers', '1590458536.jpg', 1),
(7, 9, 'DD-345', 'DISCO DURO SD', 49, 'Extraible', '1590458329.jpg', 1),
(8, 14, 'SD-012', 'MEMORIAS MICRO SD', 60, '64 GB', '1590456318.jpg', 1);

(9, 13, 'MS-003', 'Mouse Inalambrico 3.0', 98, 'Color negro con gris', '1590455533.jpg', 1),
(10, 14, 'SD-029', 'MICRO SD KINGSTON', 220, '32 GB', '1590456065.jpg', 1),
(12, 15, 'BS-993', 'BASE INVO', 45, 'Dos ventiladores', '1590456665.jpg', 1),

(13, 15, 'BS-001', 'BASE VMC', 52, 'Un ventilador con luces', '1590456922.jpg', 1),
(14, 16, 'CR-0233', 'CARGADOR HP', 30, 'Color negro', '1590457196.jpg', 1),
(15, 17, 'AU-302', 'AUDIFONOS DC', 90, 'Función con Bluetooth', '1590457443.jpg', 1),

(16, 17, 'AU-334', 'AURICULARES AD', 40, 'Súper cómodos', '1590457621.jpg', 1),
(17, 17, 'AU-1203', 'AURICULARES RSD', 125, 'Función con Bluetooth', '1590457809.png', 1),
(18, 19, 'MC-9087', 'MICRÓFONO MCR', 35, 'Color negro', '1590458770.jpg', 1),
(19, 17, 'AU-435', 'AUDIFONOS RWE', 95, 'Solo para PC', '1590462940.jpg', 1);

select * from articulo;
select * from usuario; 

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idcategoria` 	int(11) 		NOT NULL,
  `nombre` 			varchar(50) 	NOT NULL,
  `descripcion` 	varchar(256) 	DEFAULT NULL,
  `condicion` 		tinyint(4) 		NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idcategoria`, `nombre`, `descripcion`, `condicion`) VALUES
(7, 'TECLADOS', 'Teclados Gamers', 1),
(8, 'CPU\'s', 'Cpus Gamers de alta categoria', 1),
(9, 'MEMORIAS USB', 'Variedad de Marcas', 1),
(12, 'MONITORES', 'Monitores Gamers', 1),

(13, 'MOUSE', 'De alta categoria', 1),
(14, 'MEMORIAS MICRO SD', 'Variedad de Marcas', 1),
(15, 'BASE PARA PC', 'Ajustables', 1),
(16, 'CARGADOR PARA LAPTOP', 'Variedad de Marcas', 1),

(17, 'AUDIFONOS', 'De alta categoria', 1),
(18, 'DISCOS DUROS', 'Variedad de Marcas', 1);

select * from categoria; 
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_ingreso`
--

CREATE TABLE `detalle_ingreso` (
  `iddetalle_ingreso` 		int(11) 		NOT NULL,
  `idingreso` 				int(11) 		NOT NULL,
  `idarticulo` 				int(11) 		NOT NULL,
  `cantidad` 				int(11) 		NOT NULL,
  `precio_compra` 			decimal(11,2) 	NOT NULL,
  `precio_venta` 			decimal(11,2) 	NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `detalle_ingreso`
--

INSERT INTO `detalle_ingreso` (`iddetalle_ingreso`, `idingreso`, `idarticulo`, `cantidad`, `precio_compra`, `precio_venta`) VALUES
(16, 6, 6, 10, '20.00', '30.00'),
(17, 6, 7, 5, '200.00', '250.00'),
(18, 7, 8, 10, '16.00', '25.00'),
(19, 8, 7, 10, '250.00', '300.00'),
(20, 9, 8, 50, '20.00', '30.00'),
(21, 10, 6, 10, '25.00', '30.00'),
(22, 11, 7, 15, '250.00', '300.00'),
(23, 12, 9, 50, '85.00', '90.00'),
(24, 13, 10, 110, '65.00', '75.00'),
(25, 14, 12, 10, '130.00', '150.00'),
(26, 14, 13, 10, '140.00', '160.00'),
(27, 14, 14, 5, '450.00', '465.00'),
(28, 15, 15, 5, '120.00', '135.00'),
(29, 15, 16, 5, '65.00', '75.00'),
(30, 15, 17, 5, '75.00', '85.00'),
(31, 15, 18, 5, '75.00', '80.00'),
(32, 15, 19, 5, '85.00', '90.00'),
(33, 16, 8, 10, '100.00', '110.00');

select * from detalle_ingreso;
--
-- Disparadores `detalle_ingreso`
--
DELIMITER $$
CREATE TRIGGER `tr_updStockIngreso` AFTER INSERT ON `detalle_ingreso` FOR EACH ROW BEGIN
UPDATE articulo SET stock=stock + NEW.cantidad
WHERE articulo.idarticulo = NEW.idarticulo;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `iddetalle_venta` 		int(11) 		NOT NULL,
  `idventa` 				int(11) 		NOT NULL,
  `idarticulo` 				int(11) 		NOT NULL,
  `cantidad` 				int(11) 		NOT NULL,
  `precio_venta` 			decimal(11,2) 	NOT NULL,
  `descuento` 				decimal(11,2) 	NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `detalle_venta`
--

INSERT INTO `detalle_venta` (`iddetalle_venta`, `idventa`, `idarticulo`, `cantidad`, `precio_venta`, `descuento`) VALUES
(12, 10, 6, 10, '30.00', '5.00'),
(13, 10, 7, 10, '250.00', '10.00'),
(14, 11, 6, 1, '30.00', '0.00'),
(15, 11, 7, 1, '250.00', '0.00'),
(16, 12, 7, 4, '250.00', '0.00'),
(17, 13, 7, 1, '250.00', '10.00'),
(18, 14, 7, 2, '250.00', '10.00'),
(19, 15, 6, 1, '30.00', '10.00'),
(20, 16, 7, 1, '250.00', '5.00'),
(21, 17, 7, 1, '250.00', '5.00'),
(22, 18, 6, 1, '30.00', '0.00'),
(23, 19, 7, 1, '250.00', '2.00'),
(24, 20, 8, 2, '25.00', '0.00'),
(25, 21, 6, 1, '30.00', '5.00'),
(26, 22, 6, 1, '30.00', '0.00'),
(27, 22, 7, 1, '300.00', '0.00'),
(28, 22, 8, 1, '30.00', '0.00'),
(29, 23, 7, 4, '300.00', '10.00'),
(31, 24, 8, 2, '30.00', '0.00'),
(32, 25, 7, 4, '300.00', '10.00'),
(33, 26, 8, 5, '30.00', '0.00'),
(36, 27, 6, 5, '30.00', '0.00'),
(37, 28, 7, 1, '300.00', '0.00'),
(38, 30, 15, 15, '135.00', '0.00'),
(39, 31, 9, 2, '90.00', '0.00');

select * from detalle_venta;
--
-- Disparadores `detalle_venta`
--
DELIMITER $$
CREATE TRIGGER `tr_udpStockVenta` AFTER INSERT ON `detalle_venta` FOR EACH ROW BEGIN
UPDATE articulo SET stock = stock - NEW.cantidad
WHERE articulo.idarticulo = NEW.idarticulo;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingreso`
--

CREATE TABLE `ingreso` (
  `idingreso` 			int(11) 		NOT NULL,
  `idproveedor` 		int(11) 		NOT NULL,
  `idusuario` 			int(11) 		DEFAULT NULL,
  `tipo_comprobante` 	varchar(20) 	NOT NULL,
  `serie_comprobante` 	varchar(7) 		DEFAULT NULL,
  `num_comprobante` 	varchar(10) 	NOT NULL,
  `fecha_hora` 			datetime 		NOT NULL,
  `impuesto` 			decimal(4,2) 	NOT NULL,
  `total_compra` 		decimal(11,2) 	NOT NULL,
  `estado` 				varchar(20) 	NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ingreso`
--

INSERT INTO `ingreso` (`idingreso`, `idproveedor`, `idusuario`, `tipo_comprobante`, `serie_comprobante`, `num_comprobante`, `fecha_hora`, `impuesto`, `total_compra`, `estado`) VALUES
(6, 7, 1, 'Factura', '001', '0001', '2018-08-20 00:00:00', '12.00', '1200.00', 'Aceptado'),
(7, 7, 1, 'Factura', '001', '008', '2018-08-21 00:00:00', '12.00', '160.00', 'Aceptado'),
(8, 7, 1, 'Boleta', '0002', '0004', '2018-08-22 00:00:00', '0.00', '2500.00', 'Aceptado'),
(9, 9, 1, 'Factura', '001', '0005', '2018-08-23 00:00:00', '12.00', '1000.00', 'Aceptado'),
(10, 10, 1, 'Factura', '001', '0006', '2018-08-25 00:00:00', '12.00', '250.00', 'Aceptado'),
(11, 10, 1, 'Factura', '001', '0007', '2018-08-27 00:00:00', '12.00', '3750.00', 'Aceptado'),
(12, 9, 2, 'Factura', '12', '9776', '2020-05-25 00:00:00', '12.00', '4250.00', 'Aceptado'),
(13, 7, 2, 'Factura', '10', '223', '2020-05-25 00:00:00', '12.00', '7150.00', 'Aceptado'),
(14, 9, 2, 'Factura', '11', '865', '2020-05-25 00:00:00', '12.00', '4950.00', 'Aceptado'),
(15, 10, 2, 'Factura', '10', '249', '2020-05-25 00:00:00', '12.00', '2100.00', 'Aceptado'),
(16, 9, 2, 'Factura', '12', '848', '2020-05-25 00:00:00', '12.00', '1000.00', 'Aceptado');

select * from ingreso;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permiso`
--

CREATE TABLE `permiso` (
  `idpermiso` 	int(11) 		NOT NULL,
  `nombre` 		varchar(30) 	NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `permiso`
--

INSERT INTO `permiso` (`idpermiso`, `nombre`) VALUES
(1, 'Escritorio'),
(2, 'Almacen'),
(3, 'Compras'),
(4, 'Ventas'),
(5, 'Acceso'),
(6, 'Consulta Compras'),
(7, 'Consulta Ventas');

select * from permiso;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `idpersona` 		int(11) 		NOT NULL,
  `tipo_persona` 	varchar(20) 	NOT NULL,
  `nombre` 			varchar(100) 	NOT NULL,
  `tipo_documento` 	varchar(20) 	DEFAULT NULL,
  `num_documento` 	varchar(20) 	DEFAULT NULL,
  `direccion` 		varchar(70) 	DEFAULT NULL,
  `telefono` 		varchar(20) 	DEFAULT NULL,
  `email` 			varchar(50) 	DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`idpersona`, `tipo_persona`, `nombre`, `tipo_documento`, `num_documento`, `direccion`, `telefono`, `email`) VALUES
(7, 'Proveedor', 'INKA-PC S.R.L', 'RUC', '12587845254', 'Zona 11, Ciudad Guatemala.', '54328730', 'inkapc@hotmail.com'),
(8, 'Cliente', 'Pablo Roldan', 'DNI', '3022452020101', 'Zona 1, Ciudad Guatemala.', '54325230', 'paroldan@hotmail.com'),
(9, 'Proveedor', 'TECNO-PC', 'RUC', '20485248751', 'Zona 3, Ciudad Guatemala.', '78386564', 'tecno@gmail.com'),
(10, 'Proveedor', 'INFONET', 'RUC', '40485245824', 'Zona 5, Ciudad Guatemala.', '66579421', 'infonet@hotmail.com'),
(11, 'Cliente', 'Pedro Solares', 'DNI', '4585217487832', 'Zona 10, Ciudad Guatemala', '78954263', 'pedro@gmailcom'),
(12, 'Cliente', 'Mishell Herrera', 'DNI', '8291205375265', 'Col. Sacramento, Palín', '78382555', 'herreramish@gmail.com'),
(13, 'Cliente', 'Violeta Ramírez', 'DNI', '3233043231112', 'Zona 2, Ciudad Guatemala.', '32211389', 'violetrami@hotmail.com'),
(14, 'Cliente', 'Daniel Ortega', 'DNI', '2344949031234', '6 Avenida, Escuintla.', '23403922', 'ortegadani@hotmail.com'),
(15, 'Cliente', 'Derlyn Herrera', 'DNI', '1265093931123', '4 Avenida, Escuintla.', '45321289', 'derherrera@gmail.com'),
(16, 'Cliente', 'Oscar Beltran', 'DNI', '5032214659032', 'Ciudad Vieja, Sacatepequez', '78380909', 'oscbeltran12@gmail.com');

select * from persona; 	


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` 		int(11) 		NOT NULL,
  `nombre` 			varchar(100) 	NOT NULL,
  `tipo_documento` 	varchar(20) 	NOT NULL,
  `num_documento` 	varchar(20) 	NOT NULL,
  `direccion` 		varchar(70) 	DEFAULT NULL,
  `telefono` 		varchar(20) 	DEFAULT NULL,
  `email` 			varchar(50) 	DEFAULT NULL,
  `cargo` 			varchar(20) 	DEFAULT NULL,
  `login` 			varchar(20) 	NOT NULL,
  `clave` 			varchar(64) 	NOT NULL,
  `imagen` 			varchar(50) 	NOT NULL,
  `condicion` 		tinyint(4) 		NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nombre`, `tipo_documento`, `num_documento`, `direccion`, `telefono`, `email`, `cargo`, `login`, `clave`, `imagen`, `condicion`) VALUES
(1, 'Joe Rojas', 'DNI', '1242445254384', 'Zona 4, Palín.', '78483259', 'joerojas@gmail.com', 'Administrador', 'jrojas', 'fea474d08e6d3a4dca57193e8871f6a1282c4b43ed7347d8e7a23c1c808ec663', '1535417472.jpg', 1),
(2, 'José Álvarez', 'DNI', '3011542540101', 'Taxisco, Chiquimula.', '78384312', 'josealvarez@hotmail.com', 'Administrador', 'jalvarez', 'ed1296540f49b0dcd3cc74e47393b184e0eca12b31e68319ac436243d9b06961', '1590464650.jpg', 1),
(3, 'Edbin Quispal', 'DNI', '3829102939492', 'Col. Avenida, Palín', '78382992', 'quispal@gmail.com', 'Administrador', 'equispalg', '3791f4aff0c64bf59db07517a4f69f6017e56337b72da4169bb52a8ac68778ec', '1590464796.jpg', 1);


select * from usuario;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_permiso`
--

CREATE TABLE `usuario_permiso` (
  `idusuario_permiso` 	int(11) 		NOT NULL,
  `idusuario` 			int(11) 		NOT NULL,
  `idpermiso` 			int(11) 		NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario_permiso`
--

INSERT INTO `usuario_permiso` (`idusuario_permiso`, `idusuario`, `idpermiso`) VALUES
(122, 1, 1),
(123, 1, 2),
(124, 1, 3),
(125, 1, 4),
(126, 1, 5),
(127, 1, 6),
(128, 1, 7),
(157, 2, 1),
(158, 2, 2),
(159, 2, 3),
(160, 2, 4),
(161, 2, 5),
(162, 2, 6),
(163, 2, 7),
(164, 3, 1),
(165, 3, 2),
(166, 3, 3),
(167, 3, 4),
(168, 3, 5),
(169, 3, 6),
(170, 3, 7);

select * from usuario_permiso;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `idventa` 			int(11) 		NOT NULL,
  `idcliente` 			int(11) 		NOT NULL,
  `idusuario` 			int(11) 		NOT NULL,
  `tipo_comprobante` 	varchar(20) 	NOT NULL,
  `serie_comprobante` 	varchar(7) 		DEFAULT NULL,
  `num_comprobante` 	varchar(10) 	NOT NULL,
  `fecha_hora` 			datetime 		NOT NULL,
  `impuesto` 			decimal(4,2) 	DEFAULT NULL,
  `total_venta` 		decimal(11,2) 	DEFAULT NULL,
  `estado` 				varchar(20) 	DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`idventa`, `idcliente`, `idusuario`, `tipo_comprobante`, `serie_comprobante`, `num_comprobante`, `fecha_hora`, `impuesto`, `total_venta`, `estado`) VALUES
(10, 8, 1, 'Boleta', '001', '0001', '2018-01-08 00:00:00', '0.00', '11800.15', 'Aceptado'),
(11, 8, 1, 'Factura', '001', '0002', '2018-03-05 00:00:00', '12.00', '3800.00', 'Anulado'),
(12, 8, 1, 'Ticket', '001', '0001', '2018-04-17 00:00:00', '0.00', '1000.00', 'Aceptado'),
(13, 8, 1, 'Factura', '001', '0002', '2018-06-09 00:00:00', '12.00', '240.00', 'Aceptado'),
(14, 8, 1, 'Factura', '20', '30', '2018-07-24 00:00:00', '12.00', '490.00', 'Aceptado'),
(15, 8, 1, 'Factura', '001', '0008', '2018-08-26 00:00:00', '12.00', '20.00', 'Aceptado'),
(16, 8, 1, 'Boleta', '001', '0070', '2018-08-26 00:00:00', '0.00', '245.00', 'Aceptado'),
(17, 8, 1, 'Factura', '002', '0004', '2018-08-26 00:00:00', '12.00', '245.00', 'Aceptado'),
(18, 8, 1, 'Boleta', '001', '0006', '2018-08-26 00:00:00', '0.00', '30.00', 'Aceptado'),
(19, 8, 1, 'Factura', '001', '0009', '2018-08-26 00:00:00', '12.00', '248.00', 'Aceptado'),
(20, 8, 1, 'Factura', '001', '002', '2018-08-26 00:00:00', '12.00', '50.00', 'Aceptado'),
(21, 8, 1, 'Factura', '001', '0004', '2018-08-27 00:00:00', '12.00', '25.00', 'Aceptado'),
(22, 11, 1, 'Ticket', '001', '0004', '2018-08-27 00:00:00', '0.00', '360.00', 'Aceptado'),

(23, 12, 3, 'Factura', '12731', '43', '2020-05-24 00:00:00', '12.00', '300.00', 'Anulado'),
(24, 12, 3, 'Factura', '1231', '11', '2020-05-24 00:00:00', '0.00', '60.00', 'Aceptado'),
(25, 12, 3, 'Factura', '4332', '12', '2020-05-24 00:00:00', '12.00', '1190.00', 'Aceptado'),
(26, 11, 3, 'Factura', '2982', '02', '2020-05-24 00:00:00', '12.00', '150.00', 'Aceptado'),
(27, 14, 2, 'Ticket', '12', '443', '2020-05-25 00:00:00', '0.00', '150.00', 'Aceptado'),
(28, 13, 2, 'Factura', '43', '344', '2018-08-27 00:00:00', '0.00', '300.00', 'Aceptado'),
(29, 15, 3, 'Factura', '10', '111', '2020-05-25 00:00:00', '12.00', '1875.00', 'Aceptado'),
(30, 13, 3, 'Boleta', '15', '233', '2020-05-25 00:00:00', '12.00', '2025.00', 'Aceptado'),
(31, 16, 3, 'Ticket', '20', '839', '2020-05-25 00:00:00', '0.00', '180.00', 'Aceptado');

select * from venta;

update venta set impuesto = '12.00'
where idventa = 21;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulo`
--
ALTER TABLE `articulo`
  ADD PRIMARY KEY (`idarticulo`),
  ADD UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  ADD KEY `fk_articulo_categoria_idx` (`idcategoria`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idcategoria`),
  ADD UNIQUE KEY `nombre_UNIQUE` (`nombre`);

--
-- Indices de la tabla `detalle_ingreso`
--
ALTER TABLE `detalle_ingreso`
  ADD PRIMARY KEY (`iddetalle_ingreso`),
  ADD KEY `fk_detalle_ingreso_idx` (`idingreso`),
  ADD KEY `fk_detalle_articulo_idx` (`idarticulo`);

--
-- Indices de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD PRIMARY KEY (`iddetalle_venta`),
  ADD KEY `fk_detalle_venta_venta_idx` (`idventa`),
  ADD KEY `fk_detalle_venta_articulo_idx` (`idarticulo`);

--
-- Indices de la tabla `ingreso`
--
ALTER TABLE `ingreso`
  ADD PRIMARY KEY (`idingreso`),
  ADD KEY `fk_ingreso_persona_idx` (`idproveedor`),
  ADD KEY `fk_ingreso_usuario_idx` (`idusuario`);

--
-- Indices de la tabla `permiso`
--
ALTER TABLE `permiso`
  ADD PRIMARY KEY (`idpermiso`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`idpersona`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`),
  ADD UNIQUE KEY `login_UNIQUE` (`login`);

--
-- Indices de la tabla `usuario_permiso`
--
ALTER TABLE `usuario_permiso`
  ADD PRIMARY KEY (`idusuario_permiso`),
  ADD KEY `fk_u_permiso_usuario_idx` (`idusuario`),
  ADD KEY `fk_usuario_permiso_idx` (`idpermiso`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`idventa`),
  ADD KEY `fk_venta_persona_idx` (`idcliente`),
  ADD KEY `fk_venta_usuario_idx` (`idusuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articulo`
--
ALTER TABLE `articulo`
  MODIFY `idarticulo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idcategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `detalle_ingreso`
--
ALTER TABLE `detalle_ingreso`
  MODIFY `iddetalle_ingreso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  MODIFY `iddetalle_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `ingreso`
--
ALTER TABLE `ingreso`
  MODIFY `idingreso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `permiso`
--
ALTER TABLE `permiso`
  MODIFY `idpermiso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `idpersona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario_permiso`
--
ALTER TABLE `usuario_permiso`
  MODIFY `idusuario_permiso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `idventa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `articulo`
--
ALTER TABLE `articulo`
  ADD CONSTRAINT `fk_articulo_categoria` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`idcategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_ingreso`
--
ALTER TABLE `detalle_ingreso`
  ADD CONSTRAINT `fk_detalle_articulo` FOREIGN KEY (`idarticulo`) REFERENCES `articulo` (`idarticulo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detalle_ingreso` FOREIGN KEY (`idingreso`) REFERENCES `ingreso` (`idingreso`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD CONSTRAINT `fk_detalle_venta_articulo` FOREIGN KEY (`idarticulo`) REFERENCES `articulo` (`idarticulo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detalle_venta_venta` FOREIGN KEY (`idventa`) REFERENCES `venta` (`idventa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ingreso`
--
ALTER TABLE `ingreso`
  ADD CONSTRAINT `fk_ingreso_persona` FOREIGN KEY (`idproveedor`) REFERENCES `persona` (`idpersona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ingreso_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario_permiso`
--
ALTER TABLE `usuario_permiso`
  ADD CONSTRAINT `fk_u_permiso_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuario_permiso` FOREIGN KEY (`idpermiso`) REFERENCES `permiso` (`idpermiso`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `fk_venta_persona` FOREIGN KEY (`idcliente`) REFERENCES `persona` (`idpersona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_venta_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
