-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-11-2018 a las 01:45:33
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
-- Base de datos: `combustible_ucatec`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignacion_vehiculos`
--

CREATE TABLE `asignacion_vehiculos` (
  `nro_asignacion` int(11) NOT NULL,
  `fecha_asignacion` date NOT NULL,
  `autorizado_por` varchar(20) NOT NULL,
  `estado_vehiculo` varchar(30) NOT NULL,
  `kilometraje` int(5) NOT NULL,
  `observaciones` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carga_comb`
--

CREATE TABLE `carga_comb` (
  `id_carga` int(10) NOT NULL,
  `fecha_carga` datetime NOT NULL,
  `cod_interno` varchar(20) NOT NULL,
  `ci_conductor` int(10) NOT NULL,
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
  `kilometraje` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra_combustible`
--

CREATE TABLE `compra_combustible` (
  `tipo_comb` varchar(20) NOT NULL,
  `cant_combustible` int(11) NOT NULL,
  `costo_combustible` int(11) NOT NULL,
  `fecha_compra` int(11) NOT NULL,
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
  `CI` int(11) NOT NULL,
  `nombres` varchar(20) NOT NULL,
  `paterno` varchar(20) NOT NULL,
  `materno` varchar(20) NOT NULL,
  `fecha_nac` date NOT NULL,
  `lugar_nac` varchar(30) NOT NULL,
  `telf_empleado` int(11) NOT NULL,
  `telf_celular` int(10) NOT NULL,
  `categoria_licencia` varchar(5) NOT NULL,
  `cargo` varchar(20) NOT NULL,
  `departamento` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `funcionario`
--

INSERT INTO `funcionario` (`id_funcionario`, `CI`, `nombres`, `paterno`, `materno`, `fecha_nac`, `lugar_nac`, `telf_empleado`, `telf_celular`, `categoria_licencia`, `cargo`, `departamento`) VALUES
(1, 4253144, 'Guillermo', 'Condori', 'Choque', '0000-00-00', 'La Paz', 77410300, 0, '', '', ''),
(1, 4253144, 'Guillermo', 'Condori', 'Choque', '0000-00-00', 'La Paz', 77410300, 0, '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `login` varchar(15) NOT NULL,
  `clave` varchar(10) NOT NULL,
  `rol` varchar(30) NOT NULL,
  `nombre_usuario` varchar(30) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `vigencia` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculos`
--

CREATE TABLE `vehiculos` (
  `nro_placa` varchar(10) NOT NULL,
  `marca` varchar(30) NOT NULL,
  `modelo` varchar(30) NOT NULL,
  `nro_chasis` varchar(20) NOT NULL,
  `tipo_combustible` varchar(20) NOT NULL,
  `cilindrada` decimal(10,0) NOT NULL,
  `categoria` varchar(30) NOT NULL,
  `cap_tanque` int(11) NOT NULL,
  `cod_interno` varchar(20) NOT NULL,
  `bsisa` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `vehiculos`
--

INSERT INTO `vehiculos` (`nro_placa`, `marca`, `modelo`, `nro_chasis`, `tipo_combustible`, `cilindrada`, `categoria`, `cap_tanque`, `cod_interno`, `bsisa`) VALUES
('123-XXX', 'Toyota', 'Hilux', '2000', 'Gasolina', '2500', 'camioneta', 40, '', ''),
('456-YYY', 'Nisan', 'Frontier', '2008', 'Gasolina', '2000', 'vagoneta', 35, '', '');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
