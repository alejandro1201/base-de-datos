-- phpMyAdmin SQL Dump
-- version 5.2.0-rc1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 25-03-2022 a las 14:28:27
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
-- Base de datos: `mydb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

CREATE TABLE `cursos` (
  `idcursos` int(11) NOT NULL,
  `cursos` varchar(30) NOT NULL,
  `duracion` time NOT NULL,
  `Tip_curso_idTip_curso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cursos`
--

INSERT INTO `cursos` (`idcursos`, `cursos`, `duracion`, `Tip_curso_idTip_curso`) VALUES
(123, 'sistemas', '99:45:45', 567),
(234, 'zootecnia', '76:59:12', 345);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes`
--

CREATE TABLE `estudiantes` (
  `id_est` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `numero` varchar(30) NOT NULL,
  `edad` int(12) NOT NULL,
  `correo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estudiantes`
--

INSERT INTO `estudiantes` (`id_est`, `nombre`, `numero`, `edad`, `correo`) VALUES
(274, 'adriany uribe', '3004101445', 19, 'adriany67@gmail.com'),
(981, 'Juan Mendoza', '3232517623', 20, 'juans81@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matriculas`
--

CREATE TABLE `matriculas` (
  `id_matricula` int(11) NOT NULL,
  `estudiante_id_est` int(11) NOT NULL,
  `cursos_idcursos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `matriculas`
--

INSERT INTO `matriculas` (`id_matricula`, `estudiante_id_est`, `cursos_idcursos`) VALUES
(7397, 274, 123),
(9135, 981, 234);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tip_curso`
--

CREATE TABLE `tip_curso` (
  `idTip_curso` int(11) NOT NULL,
  `Nombre_curso` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tip_curso`
--

INSERT INTO `tip_curso` (`idTip_curso`, `Nombre_curso`) VALUES
(345, 'zootecnia'),
(567, 'Sistemas');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`idcursos`,`Tip_curso_idTip_curso`),
  ADD KEY `fk_cursos_Tip_curso1_idx` (`Tip_curso_idTip_curso`);

--
-- Indices de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD PRIMARY KEY (`id_est`);

--
-- Indices de la tabla `matriculas`
--
ALTER TABLE `matriculas`
  ADD PRIMARY KEY (`id_matricula`,`estudiante_id_est`,`cursos_idcursos`),
  ADD UNIQUE KEY `matriculascol_UNIQUE` (`id_matricula`),
  ADD KEY `fk_estudiante_has_cursos_cursos1_idx` (`cursos_idcursos`),
  ADD KEY `fk_estudiante_has_cursos_estudiante_idx` (`estudiante_id_est`);

--
-- Indices de la tabla `tip_curso`
--
ALTER TABLE `tip_curso`
  ADD PRIMARY KEY (`idTip_curso`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD CONSTRAINT `fk_cursos_Tip_curso1` FOREIGN KEY (`Tip_curso_idTip_curso`) REFERENCES `tip_curso` (`idTip_curso`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `matriculas`
--
ALTER TABLE `matriculas`
  ADD CONSTRAINT `fk_estudiante_has_cursos_cursos1` FOREIGN KEY (`cursos_idcursos`) REFERENCES `cursos` (`idcursos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_estudiante_has_cursos_estudiante` FOREIGN KEY (`estudiante_id_est`) REFERENCES `estudiantes` (`id_est`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
