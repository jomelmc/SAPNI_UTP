-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-11-2018 a las 04:23:03
-- Versión del servidor: 10.1.9-MariaDB
-- Versión de PHP: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_sapni`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alcance_evento`
--

CREATE TABLE `alcance_evento` (
  `id` int(4) NOT NULL,
  `nombre` varchar(40) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apoyo_ofrecido`
--

CREATE TABLE `apoyo_ofrecido` (
  `id` int(4) NOT NULL,
  `nombre` varchar(40) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apoyo_posible`
--

CREATE TABLE `apoyo_posible` (
  `id` int(4) NOT NULL,
  `nombre` varchar(40) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apoyo_solicitado`
--

CREATE TABLE `apoyo_solicitado` (
  `id` int(4) NOT NULL,
  `nombre` varchar(40) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comision_evaluadora`
--

CREATE TABLE `comision_evaluadora` (
  `id_comision` int(4) UNSIGNED NOT NULL,
  `id_profesor` int(4) UNSIGNED NOT NULL,
  `otp` varchar(30) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante_local`
--

CREATE TABLE `estudiante_local` (
  `id_estudiante` int(4) UNSIGNED NOT NULL,
  `id_matricula` int(4) UNSIGNED NOT NULL,
  `ultima_participacion_evento` varchar(40) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante_matricula`
--

CREATE TABLE `estudiante_matricula` (
  `id_estudiante` int(4) UNSIGNED NOT NULL,
  `cedula` varchar(12) COLLATE utf8_spanish_ci NOT NULL,
  `contrasenia` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `apellido` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `correo_institucional` varchar(40) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `id_rutp_fv_4_svu`
--

CREATE TABLE `id_rutp_fv_4_svu` (
  `id_solicitud` int(4) UNSIGNED NOT NULL,
  `hora_fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login_administrativo`
--

CREATE TABLE `login_administrativo` (
  `id_administrativo` int(4) UNSIGNED NOT NULL,
  `correo_institucional` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `contrasenia` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `apellido` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `rol` varchar(12) COLLATE utf8_spanish_ci NOT NULL,
  `otp` varchar(30) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `procede`
--

CREATE TABLE `procede` (
  `id` int(4) NOT NULL,
  `nombre` varchar(40) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesor`
--

CREATE TABLE `profesor` (
  `id_profesor` int(4) UNSIGNED NOT NULL,
  `nombre` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `apellido` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `id_presidente` int(4) UNSIGNED NOT NULL,
  `correo_institucional` varchar(40) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyeccion_utp`
--

CREATE TABLE `proyeccion_utp` (
  `id` int(4) NOT NULL,
  `nombre` varchar(40) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `relevancia`
--

CREATE TABLE `relevancia` (
  `id` int(4) NOT NULL,
  `nombre` varchar(40) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rutp_fv_4_ce`
--

CREATE TABLE `rutp_fv_4_ce` (
  `observaciones` varchar(500) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_solicitud` int(4) UNSIGNED NOT NULL,
  `hora_fecha` datetime NOT NULL,
  `id_relevancia` int(4) NOT NULL,
  `id_procede` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rut_fv_4_rec`
--

CREATE TABLE `rut_fv_4_rec` (
  `presupuesto` double NOT NULL,
  `observaciones` varchar(500) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_solicitud` int(4) UNSIGNED NOT NULL,
  `hora_fecha` datetime NOT NULL,
  `id_apoyo_posible` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitud_rutp_fv_4_est`
--

CREATE TABLE `solicitud_rutp_fv_4_est` (
  `id_solicitud` int(4) UNSIGNED NOT NULL,
  `fecha_solicitud` date NOT NULL,
  `id_estudiante` int(4) UNSIGNED NOT NULL,
  `evento` varchar(75) COLLATE utf8_spanish_ci NOT NULL,
  `lugar` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `justificacion` varchar(300) COLLATE utf8_spanish_ci NOT NULL,
  `anexo` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `visto_bueno` char(1) COLLATE utf8_spanish_ci NOT NULL,
  `etapa` varchar(40) COLLATE utf8_spanish_ci DEFAULT NULL,
  `hora_fecha` datetime NOT NULL,
  `id_comision` int(4) UNSIGNED NOT NULL,
  `inicio_evento` datetime NOT NULL,
  `fin_evento` datetime NOT NULL,
  `id_tipo_evento` int(4) NOT NULL,
  `id_alcance_evento` int(4) NOT NULL,
  `id_apoyo_ofrecido` int(4) NOT NULL,
  `id_apoyo_posible` int(4) NOT NULL,
  `id_apoyo_solicitado` int(4) NOT NULL,
  `id_proyeccion_utp` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_evento`
--

CREATE TABLE `tipo_evento` (
  `id` int(4) NOT NULL,
  `nombre` varchar(40) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alcance_evento`
--
ALTER TABLE `alcance_evento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `apoyo_ofrecido`
--
ALTER TABLE `apoyo_ofrecido`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `apoyo_posible`
--
ALTER TABLE `apoyo_posible`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `apoyo_solicitado`
--
ALTER TABLE `apoyo_solicitado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `comision_evaluadora`
--
ALTER TABLE `comision_evaluadora`
  ADD PRIMARY KEY (`id_comision`),
  ADD KEY `id_profesor` (`id_profesor`);

--
-- Indices de la tabla `estudiante_local`
--
ALTER TABLE `estudiante_local`
  ADD PRIMARY KEY (`id_estudiante`);

--
-- Indices de la tabla `estudiante_matricula`
--
ALTER TABLE `estudiante_matricula`
  ADD PRIMARY KEY (`cedula`),
  ADD KEY `id_estudiante` (`id_estudiante`);

--
-- Indices de la tabla `id_rutp_fv_4_svu`
--
ALTER TABLE `id_rutp_fv_4_svu`
  ADD KEY `id_solicitud` (`id_solicitud`);

--
-- Indices de la tabla `login_administrativo`
--
ALTER TABLE `login_administrativo`
  ADD PRIMARY KEY (`correo_institucional`);

--
-- Indices de la tabla `procede`
--
ALTER TABLE `procede`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `profesor`
--
ALTER TABLE `profesor`
  ADD PRIMARY KEY (`id_profesor`),
  ADD KEY `fk_correo_institucional` (`correo_institucional`);

--
-- Indices de la tabla `proyeccion_utp`
--
ALTER TABLE `proyeccion_utp`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `relevancia`
--
ALTER TABLE `relevancia`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `rutp_fv_4_ce`
--
ALTER TABLE `rutp_fv_4_ce`
  ADD KEY `id_solicitud` (`id_solicitud`),
  ADD KEY `fk_id_relevancia` (`id_relevancia`),
  ADD KEY `fk_id_procede` (`id_procede`);

--
-- Indices de la tabla `rut_fv_4_rec`
--
ALTER TABLE `rut_fv_4_rec`
  ADD KEY `id_solicitud` (`id_solicitud`),
  ADD KEY `fk2_id_apoyo_posible` (`id_apoyo_posible`);

--
-- Indices de la tabla `solicitud_rutp_fv_4_est`
--
ALTER TABLE `solicitud_rutp_fv_4_est`
  ADD PRIMARY KEY (`id_solicitud`),
  ADD KEY `id_estudiante` (`id_estudiante`),
  ADD KEY `fk_id_comision` (`id_comision`),
  ADD KEY `fk_id_tipo_evento` (`id_tipo_evento`),
  ADD KEY `fk_id_alcance_evento` (`id_alcance_evento`),
  ADD KEY `fk_id_apoyo_ofrecido` (`id_apoyo_ofrecido`),
  ADD KEY `fk_id_apoyo_posible` (`id_apoyo_posible`),
  ADD KEY `fk_id_apoyo_solicitado` (`id_apoyo_solicitado`),
  ADD KEY `fk_id_proyeccion_utp` (`id_proyeccion_utp`);

--
-- Indices de la tabla `tipo_evento`
--
ALTER TABLE `tipo_evento`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alcance_evento`
--
ALTER TABLE `alcance_evento`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `apoyo_ofrecido`
--
ALTER TABLE `apoyo_ofrecido`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `apoyo_posible`
--
ALTER TABLE `apoyo_posible`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `apoyo_solicitado`
--
ALTER TABLE `apoyo_solicitado`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `comision_evaluadora`
--
ALTER TABLE `comision_evaluadora`
  MODIFY `id_comision` int(4) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `estudiante_local`
--
ALTER TABLE `estudiante_local`
  MODIFY `id_estudiante` int(4) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `estudiante_matricula`
--
ALTER TABLE `estudiante_matricula`
  MODIFY `id_estudiante` int(4) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `procede`
--
ALTER TABLE `procede`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `profesor`
--
ALTER TABLE `profesor`
  MODIFY `id_profesor` int(4) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `proyeccion_utp`
--
ALTER TABLE `proyeccion_utp`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `relevancia`
--
ALTER TABLE `relevancia`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `solicitud_rutp_fv_4_est`
--
ALTER TABLE `solicitud_rutp_fv_4_est`
  MODIFY `id_solicitud` int(4) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comision_evaluadora`
--
ALTER TABLE `comision_evaluadora`
  ADD CONSTRAINT `comision_evaluadora_ibfk_1` FOREIGN KEY (`id_profesor`) REFERENCES `profesor` (`id_profesor`) ON DELETE CASCADE;

--
-- Filtros para la tabla `estudiante_matricula`
--
ALTER TABLE `estudiante_matricula`
  ADD CONSTRAINT `estudiante_matricula_ibfk_1` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiante_local` (`id_estudiante`) ON DELETE CASCADE;

--
-- Filtros para la tabla `id_rutp_fv_4_svu`
--
ALTER TABLE `id_rutp_fv_4_svu`
  ADD CONSTRAINT `id_rutp_fv_4_svu_ibfk_1` FOREIGN KEY (`id_solicitud`) REFERENCES `solicitud_rutp_fv_4_est` (`id_solicitud`) ON DELETE CASCADE;

--
-- Filtros para la tabla `profesor`
--
ALTER TABLE `profesor`
  ADD CONSTRAINT `fk_correo_institucional` FOREIGN KEY (`correo_institucional`) REFERENCES `login_administrativo` (`correo_institucional`);

--
-- Filtros para la tabla `rutp_fv_4_ce`
--
ALTER TABLE `rutp_fv_4_ce`
  ADD CONSTRAINT `fk_id_procede` FOREIGN KEY (`id_procede`) REFERENCES `procede` (`id`),
  ADD CONSTRAINT `fk_id_relevancia` FOREIGN KEY (`id_relevancia`) REFERENCES `relevancia` (`id`),
  ADD CONSTRAINT `rutp_fv_4_ce_ibfk_1` FOREIGN KEY (`id_solicitud`) REFERENCES `solicitud_rutp_fv_4_est` (`id_solicitud`) ON DELETE CASCADE;

--
-- Filtros para la tabla `rut_fv_4_rec`
--
ALTER TABLE `rut_fv_4_rec`
  ADD CONSTRAINT `fk2_id_apoyo_posible` FOREIGN KEY (`id_apoyo_posible`) REFERENCES `apoyo_posible` (`id`),
  ADD CONSTRAINT `rut_fv_4_rec_ibfk_1` FOREIGN KEY (`id_solicitud`) REFERENCES `solicitud_rutp_fv_4_est` (`id_solicitud`) ON DELETE CASCADE;

--
-- Filtros para la tabla `solicitud_rutp_fv_4_est`
--
ALTER TABLE `solicitud_rutp_fv_4_est`
  ADD CONSTRAINT `fk_id_alcance_evento` FOREIGN KEY (`id_alcance_evento`) REFERENCES `alcance_evento` (`id`),
  ADD CONSTRAINT `fk_id_apoyo_ofrecido` FOREIGN KEY (`id_apoyo_ofrecido`) REFERENCES `apoyo_ofrecido` (`id`),
  ADD CONSTRAINT `fk_id_apoyo_posible` FOREIGN KEY (`id_apoyo_posible`) REFERENCES `apoyo_posible` (`id`),
  ADD CONSTRAINT `fk_id_apoyo_solicitado` FOREIGN KEY (`id_apoyo_solicitado`) REFERENCES `apoyo_solicitado` (`id`),
  ADD CONSTRAINT `fk_id_comision` FOREIGN KEY (`id_comision`) REFERENCES `comision_evaluadora` (`id_comision`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_id_proyeccion_utp` FOREIGN KEY (`id_proyeccion_utp`) REFERENCES `proyeccion_utp` (`id`),
  ADD CONSTRAINT `fk_id_tipo_evento` FOREIGN KEY (`id_tipo_evento`) REFERENCES `tipo_evento` (`id`),
  ADD CONSTRAINT `solicitud_rutp_fv_4_est_ibfk_1` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiante_local` (`id_estudiante`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
