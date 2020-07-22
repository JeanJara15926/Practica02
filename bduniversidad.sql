-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 20-07-2020 a las 22:23:02
-- Versión del servidor: 5.5.24-log
-- Versión de PHP: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `bduniversidad`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera`
--

CREATE TABLE IF NOT EXISTS `carrera` (
  `idcarrera` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(12) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `estado` varchar(2) NOT NULL,
  PRIMARY KEY (`idcarrera`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE IF NOT EXISTS `curso` (
  `idcurso` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(12) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `horas` int(11) NOT NULL,
  `creditos` int(11) NOT NULL,
  `estado` varchar(2) NOT NULL,
  PRIMARY KEY (`idcurso`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `curso`
--

INSERT INTO `curso` (`idcurso`, `codigo`, `nombre`, `horas`, `creditos`, `estado`) VALUES
(1, 'C1010', 'Fundamento de programacion', 6, 4, 'A'),
(4, 'C1040', 'Sistemas digitales', 5, 4, 'A'),
(8, 'C1015', 'Lenguaje de programación II', 6, 3, 'A'),
(9, 'C1045', 'Diseño de Sistemas', 4, 2, 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE IF NOT EXISTS `estudiante` (
  `idestudiante` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `apellidos` varchar(40) NOT NULL,
  `dni` varchar(8) NOT NULL,
  `codigo` varchar(12) NOT NULL,
  `estado` varchar(2) NOT NULL,
  PRIMARY KEY (`idestudiante`),
  UNIQUE KEY `dni` (`dni`,`codigo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`idestudiante`, `nombre`, `apellidos`, `dni`, `codigo`, `estado`) VALUES
(4, 'jean', 'Jara Solis', '99885252', '1813011519', 'A'),
(6, 'alex david', 'palacios', '77216855', '1813011555', 'D'),
(8, 'ernesto david', 'diaz cardenas', '55883399', '1813011512', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matricula`
--

CREATE TABLE IF NOT EXISTS `matricula` (
  `idmatricula` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `semestre` varchar(10) NOT NULL,
  `ciclo` varchar(2) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `idestudiante` int(10) unsigned NOT NULL,
  `idcurso` int(10) unsigned NOT NULL,
  `idcarrera` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idmatricula`),
  KEY `idestudiante` (`idestudiante`),
  KEY `idcurso` (`idcurso`),
  KEY `idcarrera` (`idcarrera`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `matricula`
--
ALTER TABLE `matricula`
  ADD CONSTRAINT `matricula_ibfk_7` FOREIGN KEY (`idcarrera`) REFERENCES `carrera` (`idcarrera`) ON UPDATE CASCADE,
  ADD CONSTRAINT `matricula_ibfk_5` FOREIGN KEY (`idestudiante`) REFERENCES `estudiante` (`idestudiante`) ON UPDATE CASCADE,
  ADD CONSTRAINT `matricula_ibfk_6` FOREIGN KEY (`idcurso`) REFERENCES `curso` (`idcurso`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
