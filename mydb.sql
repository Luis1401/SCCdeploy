-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-11-2018 a las 00:39:08
-- Versión del servidor: 10.1.36-MariaDB
-- Versión de PHP: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mydb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignacion_vehiculos`
--

CREATE TABLE `asignacion_vehiculos` (
  `id_asignacion` int(11) NOT NULL,
  `fecha_asignacion` date NOT NULL,
  `autorizado_por` varchar(20) NOT NULL,
  `estado_vehiculo` varchar(30) NOT NULL,
  `kilometraje` int(5) NOT NULL,
  `observaciones` varchar(30) NOT NULL,
  `vehiculos_cod_interno` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carga_comb`
--

CREATE TABLE `carga_comb` (
  `id_carga` int(10) NOT NULL,
  `fecha_carga` datetime NOT NULL,
  `cod_interno` varchar(20) NOT NULL,
  `ci_conductor` int(10) UNSIGNED NOT NULL,
  `tipo_comb` varchar(20) NOT NULL,
  `cant_carga` varchar(20) NOT NULL,
  `precinto_ant` varchar(10) NOT NULL,
  `precinto_act` varchar(10) NOT NULL,
  `costo_carga` decimal(10,0) NOT NULL,
  `nro_vale` int(11) NOT NULL,
  `tipo_carga` varchar(10) NOT NULL,
  `nro_factura` int(10) NOT NULL,
  `nro_autorizacion` varchar(20) NOT NULL,
  `cod_control` varchar(20) NOT NULL,
  `kilometraje` int(10) NOT NULL,
  `vehiculos_cod_interno` varchar(20) NOT NULL,
  `funcionario_id_funcionario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra_combustible`
--

CREATE TABLE `compra_combustible` (
  `tipo_comb` varchar(20) NOT NULL,
  `fecha_compra` int(11) NOT NULL,
  `cant_combustible` int(11) NOT NULL,
  `costo_combustible` int(11) NOT NULL,
  `nro_factura` int(10) NOT NULL,
  `nro_autorizacion` varchar(20) NOT NULL,
  `cod_control` varchar(20) NOT NULL,
  `razon_social` varchar(30) NOT NULL,
  `nro_nit` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra_precintos`
--

CREATE TABLE `compra_precintos` (
  `fecha_compra` date NOT NULL,
  `cantidad_precinto` int(11) NOT NULL,
  `costo_precinto` int(11) NOT NULL,
  `nro_factura` int(10) NOT NULL,
  `nro_autorizacion` varchar(20) NOT NULL,
  `cod_control` varchar(20) NOT NULL,
  `razon_social` varchar(30) NOT NULL,
  `nro_nit` int(15) NOT NULL,
  `nro_inicial` int(11) NOT NULL,
  `nro_final` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `funcionario`
--

CREATE TABLE `funcionario` (
  `id_funcionario` int(11) NOT NULL,
  `ci` int(11) NOT NULL,
  `nombres` varchar(20) NOT NULL,
  `paterno` varchar(20) NOT NULL,
  `materno` varchar(20) NOT NULL,
  `fecha_nac` date NOT NULL,
  `lugar_nac` varchar(30) NOT NULL,
  `telf_empleado` int(11) NOT NULL,
  `telf_celular` int(10) NOT NULL,
  `categoria_licencia` varchar(5) NOT NULL,
  `cargo` varchar(20) NOT NULL,
  `departamento` varchar(30) NOT NULL,
  `asignacion_vehiculos_id_asignacion1` int(11) NOT NULL,
  `asignacion_vehiculos_carga_comb_id_carga` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` varchar(45) NOT NULL,
  `login` varchar(15) NOT NULL,
  `clave` varchar(10) NOT NULL,
  `rol` varchar(30) NOT NULL,
  `nombre_usuario` varchar(30) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `vigencia` varchar(30) NOT NULL,
  `funcionario_id_funcionario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculos`
--

CREATE TABLE `vehiculos` (
  `cod_interno` varchar(20) NOT NULL,
  `nro_placa` varchar(10) NOT NULL,
  `marca` varchar(30) NOT NULL,
  `modelo` varchar(30) NOT NULL,
  `nro_chasis` varchar(20) NOT NULL,
  `tipo_combustible` varchar(20) NOT NULL,
  `cilindrada` decimal(10,0) NOT NULL,
  `categoria` varchar(30) NOT NULL,
  `cap_tanque` int(11) NOT NULL,
  `bsisa` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignacion_vehiculos`
--
ALTER TABLE `asignacion_vehiculos`
  ADD PRIMARY KEY (`id_asignacion`),
  ADD KEY `fk_asignacion_vehiculos_vehiculos1` (`vehiculos_cod_interno`);

--
-- Indices de la tabla `carga_comb`
--
ALTER TABLE `carga_comb`
  ADD PRIMARY KEY (`id_carga`),
  ADD KEY `fk_carga_comb_vehiculos1` (`vehiculos_cod_interno`),
  ADD KEY `fk_carga_comb_funcionario1` (`funcionario_id_funcionario`);

--
-- Indices de la tabla `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`id_funcionario`),
  ADD KEY `fk_funcionario_asignacion_vehiculos1` (`asignacion_vehiculos_id_asignacion1`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `fk_usuarios_funcionario1` (`funcionario_id_funcionario`);

--
-- Indices de la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD PRIMARY KEY (`cod_interno`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asignacion_vehiculos`
--
ALTER TABLE `asignacion_vehiculos`
  ADD CONSTRAINT `fk_asignacion_vehiculos_vehiculos1` FOREIGN KEY (`vehiculos_cod_interno`) REFERENCES `vehiculos` (`cod_interno`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `carga_comb`
--
ALTER TABLE `carga_comb`
  ADD CONSTRAINT `fk_carga_comb_funcionario1` FOREIGN KEY (`funcionario_id_funcionario`) REFERENCES `funcionario` (`id_funcionario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_carga_comb_vehiculos1` FOREIGN KEY (`vehiculos_cod_interno`) REFERENCES `vehiculos` (`cod_interno`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `fk_funcionario_asignacion_vehiculos1` FOREIGN KEY (`asignacion_vehiculos_id_asignacion1`) REFERENCES `asignacion_vehiculos` (`id_asignacion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_usuarios_funcionario1` FOREIGN KEY (`funcionario_id_funcionario`) REFERENCES `funcionario` (`id_funcionario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
