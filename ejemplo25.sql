-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 25-03-2022 a las 12:59:31
-- Versión del servidor: 5.7.33
-- Versión de PHP: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ejemplo25`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `cod_pro` int(11) NOT NULL,
  `nom_pro` varchar(20) NOT NULL,
  `dir_pro` varchar(35) NOT NULL,
  `cel_pro` int(11) NOT NULL,
  `cor_pro` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`cod_pro`, `nom_pro`, `dir_pro`, `cel_pro`, `cor_pro`) VALUES
(324, 'bata', 'calle 12 carrera 3', 3237362, 'bata@gmail.com'),
(897, 'zshop', 'calle 80 carrera 11 ', 31273828, 'zshop@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `cod_usu` int(11) NOT NULL,
  `nom_usu` varchar(20) NOT NULL,
  `ape_usu` varchar(20) NOT NULL,
  `cel_usu` int(11) NOT NULL,
  `dir_usu` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`cod_usu`, `nom_usu`, `ape_usu`, `cel_usu`, `dir_usu`) VALUES
(96324, 'Luisa', 'Rojas', 3117363, 'calle 90 barrio jardin'),
(648973, 'David', 'Gonzalez', 31465793, 'calle 75 barrio jordan ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_zapatillas`
--

CREATE TABLE `venta_zapatillas` (
  `proveedor_cod_pro` int(11) NOT NULL,
  `zapatillas_cod_zap` int(11) NOT NULL,
  `cod_ven` int(11) NOT NULL,
  `val_ven` int(11) NOT NULL,
  `fec_ven` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `venta_zapatillas`
--

INSERT INTO `venta_zapatillas` (`proveedor_cod_pro`, `zapatillas_cod_zap`, `cod_ven`, `val_ven`, `fec_ven`) VALUES
(324, 123, 789, 120000, '2022-03-31'),
(897, 456, 654, 90000, '2022-04-07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zapatillas`
--

CREATE TABLE `zapatillas` (
  `cod_zap` int(11) NOT NULL,
  `nom_zap` varchar(15) NOT NULL,
  `mar_zap` varchar(15) NOT NULL,
  `mod_zap` varchar(20) NOT NULL,
  `usuario_cod_usu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `zapatillas`
--

INSERT INTO `zapatillas` (`cod_zap`, `nom_zap`, `mar_zap`, `mod_zap`, `usuario_cod_usu`) VALUES
(123, 'nikeairforce', 'nike', 'air force one', 96324),
(456, 'vans clasicas', 'vans', 'clasicas', 648973);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`cod_pro`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`cod_usu`);

--
-- Indices de la tabla `venta_zapatillas`
--
ALTER TABLE `venta_zapatillas`
  ADD PRIMARY KEY (`proveedor_cod_pro`,`zapatillas_cod_zap`,`cod_ven`),
  ADD KEY `fk_proveedor_has_zapatillas_zapatillas1_idx` (`zapatillas_cod_zap`),
  ADD KEY `fk_proveedor_has_zapatillas_proveedor_idx` (`proveedor_cod_pro`);

--
-- Indices de la tabla `zapatillas`
--
ALTER TABLE `zapatillas`
  ADD PRIMARY KEY (`cod_zap`,`usuario_cod_usu`),
  ADD KEY `fk_zapatillas_usuario1_idx` (`usuario_cod_usu`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `venta_zapatillas`
--
ALTER TABLE `venta_zapatillas`
  ADD CONSTRAINT `fk_proveedor_has_zapatillas_proveedor` FOREIGN KEY (`proveedor_cod_pro`) REFERENCES `proveedor` (`cod_pro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_proveedor_has_zapatillas_zapatillas1` FOREIGN KEY (`zapatillas_cod_zap`) REFERENCES `zapatillas` (`cod_zap`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `zapatillas`
--
ALTER TABLE `zapatillas`
  ADD CONSTRAINT `fk_zapatillas_usuario1` FOREIGN KEY (`usuario_cod_usu`) REFERENCES `usuario` (`cod_usu`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
