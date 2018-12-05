-- phpMyAdmin SQL Dump
-- version 4.8.0-dev
-- https://www.phpmyadmin.net/
--
-- Host: 6d2e6c97-2f77-4449-b676-35832133341a.sapniphp-544.mysql.dbs.scalingo.com:31423
-- Generation Time: Dec 05, 2018 at 04:02 AM
-- Server version: 5.7.21-log
-- PHP Version: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sapniphp_544`
--

-- --------------------------------------------------------

--
-- Table structure for table `alcance_evento`
--

CREATE TABLE `alcance_evento` (
  `id` int(4) NOT NULL,
  `nombre` varchar(40) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `alcance_evento`
--

INSERT INTO `alcance_evento` (`id`, `nombre`) VALUES
(1, 'Nacional'),
(2, 'Internacional');

-- --------------------------------------------------------

--
-- Table structure for table `apoyo_ofrecido`
--

CREATE TABLE `apoyo_ofrecido` (
  `id` int(4) NOT NULL,
  `nombre` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `id_solicitud` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `apoyo_ofrecido`
--

INSERT INTO `apoyo_ofrecido` (`id`, `nombre`, `id_solicitud`) VALUES
(1, 'Inscripción', 0),
(2, 'Gastos de viaje', 0),
(3, 'Manutención', 0),
(4, 'Hospedaje', 0),
(5, 'Apoyo económico parcial', 0);

-- --------------------------------------------------------

--
-- Table structure for table `apoyo_posible`
--

CREATE TABLE `apoyo_posible` (
  `id` int(4) NOT NULL,
  `nombre` varchar(40) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `apoyo_solicitado`
--

CREATE TABLE `apoyo_solicitado` (
  `id` int(4) NOT NULL,
  `nombre` varchar(40) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `apoyo_solicitado`
--

INSERT INTO `apoyo_solicitado` (`id`, `nombre`) VALUES
(1, 'Inscripción'),
(2, 'Gastos de viaje'),
(3, 'Apoyo económico parcial');

-- --------------------------------------------------------

--
-- Table structure for table `comision_evaluadora`
--

CREATE TABLE `comision_evaluadora` (
  `id_comision` int(4) UNSIGNED NOT NULL,
  `id_profesor` int(4) UNSIGNED NOT NULL,
  `otp` varchar(30) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `estudiante_local`
--

CREATE TABLE `estudiante_local` (
  `id_estudiante` int(4) UNSIGNED NOT NULL,
  `ultima_participacion_evento` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `id_matricula` varchar(12) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_solicitud` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `estudiante_local`
--

INSERT INTO `estudiante_local` (`id_estudiante`, `ultima_participacion_evento`, `id_matricula`, `id_solicitud`) VALUES
(100, 'Antes de ayer creo.', '7-777-7777', 25),
(101, 'Antes de ayer creo.', '8-888-8888', 26),
(102, 'Antes de ayer creo.', '7-777-7777', 26),
(103, 'Antes de ayer creo.', '8-888-8888', 1),
(104, 'Antes de ayer creo.', '7-777-7777', 1),
(105, 'Antes de ayer creo.', '8-888-8888', 28),
(106, 'Antes de ayer creo.', '7-777-7777', 28),
(107, 'Antes de ayer creo.', '8-888-8888', 29),
(108, 'Antes de ayer creo.', '7-777-7777', 29),
(109, 'Antes de ayer creo.', '8-888-8888', 30),
(110, 'Antes de ayer creo.', '7-777-7777', 30),
(111, 'Antes de ayer creo.', '8-888-8888', 31),
(112, 'Bueno yo hace un mes.', '7-777-7777', 31),
(113, '', '', 32),
(114, '', '', 32),
(115, '', '', 32),
(116, '', '', 32),
(117, '', '', 32),
(118, 'Antes de ayer creo.', '8-888-8888', 32),
(119, 'Bueno yo hace un mes.', '7-777-7777', 32),
(120, 'Antes de ayer creo.', '8-888-8888', 33),
(121, 'Bueno yo hace un mes.', '7-777-7777', 33),
(122, 'Antes de ayer creo.', '8-888-8888', 34),
(123, 'Bueno yo hace un mes.', '7-777-7777', 34),
(124, 'Hace 1 semestre', '8-888-8888', 35),
(125, 'Hace 1 semestre', '8-888-8888', 36),
(126, 'Hace 1 semestre', '8-888-8888', 37),
(127, 'Hace 1 semestre', '8-888-8888', 38),
(128, 'Hace 1 semestre', '8-888-8888', 39),
(129, 'Hace 1 semestre', '8-888-8888', 40),
(130, 'Hace 1 semestre', '8-888-8888', 41),
(131, 'Hace 1 semestre', '8-888-8888', 42),
(132, 'Antes de ayer creo.', '8-888-8888', 43),
(133, 'Bueno yo hace un mes.', '7-777-7777', 43),
(134, 'Hace 1 año', '8-888-8888', 44),
(135, 'En menos de 1 mes', '8-888-8888', 45),
(136, 'Hace 1 semestre', '8-888-8888', 46),
(137, 'Antes de ayer creo.', '8-888-8888', 46),
(138, 'Bueno yo hace un mes.', '7-777-7777', 46),
(139, 'Antes de ayer creo.', '8-888-8888', 47),
(140, 'Bueno yo hace un mes.', '7-777-7777', 47),
(141, 'Hace 1 año', '8-888-8888', 48),
(142, 'Antes de ayer creo.', '8-888-8888', 49),
(143, 'Bueno yo hace un mes.', '7-777-7777', 49),
(144, 'Antes de ayer creo.', '8-888-8888', 50),
(145, 'Bueno yo hace un mes.', '7-777-7777', 50),
(146, 'Antes de ayer creo.', '8-888-8888', 51),
(147, 'Bueno yo hace un mes.', '7-777-7777', 51),
(148, 'Hace 1 semestre', '8-888-8888', 52),
(149, 'Antes de ayer creo.', '8-888-8888', 53),
(150, 'Bueno yo hace un mes.', '7-777-7777', 53),
(151, 'Hace 1 semestre', '8-888-8888', 54),
(152, 'Hace 1 semestre', '8-888-8888', 55),
(153, 'Hace 1 semestre', '8-888-8888', 56),
(154, 'Antes de ayer creo.', '8-888-8888', 57),
(155, 'Bueno yo hace un mes.', '7-777-7777', 57);

-- --------------------------------------------------------

--
-- Table structure for table `estudiante_matricula`
--

CREATE TABLE `estudiante_matricula` (
  `id_estudiante` int(4) DEFAULT NULL,
  `cedula` varchar(12) COLLATE utf8_spanish_ci NOT NULL,
  `contrasenia` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `apellido` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `correo_institucional` varchar(40) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `estudiante_matricula`
--

INSERT INTO `estudiante_matricula` (`id_estudiante`, `cedula`, `contrasenia`, `nombre`, `apellido`, `correo_institucional`) VALUES
(NULL, '7-777-7777', 'abcd1234', 'Jomel', 'McDonald', 'jomel.mcdonald@utp.ac.pa'),
(NULL, '8-888-8888', 'abcd1234', 'Jhoel', 'Ramos', 'jhoel.ramos@utp.ac.pa');

-- --------------------------------------------------------

--
-- Table structure for table `id_rutp_fv_4_svu`
--

CREATE TABLE `id_rutp_fv_4_svu` (
  `id_solicitud` int(4) UNSIGNED NOT NULL,
  `hora_fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `login_administrativo`
--

CREATE TABLE `login_administrativo` (
  `correo_institucional` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `contrasenia` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `apellido` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `rol` varchar(12) COLLATE utf8_spanish_ci NOT NULL,
  `otp` varchar(90) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `login_administrativo`
--

INSERT INTO `login_administrativo` (`correo_institucional`, `contrasenia`, `nombre`, `apellido`, `rol`, `otp`) VALUES
('christopher.jimenez@utp.ac.pa', 'abcd1234', 'Christopher', 'Jimenez', 'Profesor', 'e6c3dd630428fd54834172b8fd2735fed9416da4'),
('jhoel.ramos@utp.ac.pa', 'abcd1234', 'Jhoel', 'Ramos', 'Rector', '4d134bc072212ace2df385dae143139da74ec0ef'),
('mayka@utp.ac.pa', 'abcd1234', 'Mayka', 'Yaniza', 'Secretaria', '902ba3cda1883801594b6e1b452790cc53948fda');

-- --------------------------------------------------------

--
-- Table structure for table `procede`
--

CREATE TABLE `procede` (
  `id` int(4) NOT NULL,
  `nombre` varchar(40) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `procede`
--

INSERT INTO `procede` (`id`, `nombre`) VALUES
(1, 'Sí'),
(2, 'No');

-- --------------------------------------------------------

--
-- Table structure for table `profesor`
--

CREATE TABLE `profesor` (
  `id_profesor` int(4) UNSIGNED NOT NULL,
  `nombre` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `apellido` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `id_presidente` int(4) UNSIGNED DEFAULT NULL,
  `correo_institucional` varchar(40) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `profesor`
--

INSERT INTO `profesor` (`id_profesor`, `nombre`, `apellido`, `id_presidente`, `correo_institucional`) VALUES
(1111, 'Jhoel', 'Ramos', 1111, 'jhoel.ramos@utp.ac.pa'),
(2222, 'Christopher', 'Jimenez', NULL, 'christopher.jimenez@utp.ac.pa');

-- --------------------------------------------------------

--
-- Table structure for table `proyeccion_utp`
--

CREATE TABLE `proyeccion_utp` (
  `id` int(4) NOT NULL,
  `nombre` varchar(40) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `proyeccion_utp`
--

INSERT INTO `proyeccion_utp` (`id`, `nombre`) VALUES
(1, 'Excelente'),
(2, 'Buena'),
(3, 'No tiene');

-- --------------------------------------------------------

--
-- Table structure for table `relevancia`
--

CREATE TABLE `relevancia` (
  `id` int(4) NOT NULL,
  `nombre` varchar(40) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `relevancia`
--

INSERT INTO `relevancia` (`id`, `nombre`) VALUES
(1, 'Alto'),
(2, 'Medio'),
(3, 'Bajo');

-- --------------------------------------------------------

--
-- Table structure for table `rutp_fv_4_ce`
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
-- Table structure for table `rut_fv_4_rec`
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
-- Table structure for table `solicitud_rutp_fv_4_est`
--

CREATE TABLE `solicitud_rutp_fv_4_est` (
  `id_solicitud` int(4) UNSIGNED NOT NULL,
  `fecha_solicitud` date NOT NULL,
  `id_estudiante` int(4) UNSIGNED NOT NULL,
  `evento` varchar(75) COLLATE utf8_spanish_ci NOT NULL,
  `lugar` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `justificacion` varchar(300) COLLATE utf8_spanish_ci NOT NULL,
  `anexo` varchar(40) COLLATE utf8_spanish_ci DEFAULT NULL,
  `visto_bueno` char(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `etapa` varchar(40) COLLATE utf8_spanish_ci DEFAULT NULL,
  `hora_fecha` datetime NOT NULL,
  `id_comision` int(4) UNSIGNED DEFAULT NULL,
  `inicio_evento` datetime NOT NULL,
  `fin_evento` datetime NOT NULL,
  `id_tipo_evento` int(4) NOT NULL,
  `id_alcance_evento` int(4) NOT NULL,
  `id_apoyo_ofrecido` int(4) NOT NULL,
  `id_apoyo_posible` int(4) DEFAULT NULL,
  `id_apoyo_solicitado` int(4) NOT NULL,
  `id_proyeccion_utp` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `solicitud_rutp_fv_4_est`
--

INSERT INTO `solicitud_rutp_fv_4_est` (`id_solicitud`, `fecha_solicitud`, `id_estudiante`, `evento`, `lugar`, `justificacion`, `anexo`, `visto_bueno`, `etapa`, `hora_fecha`, `id_comision`, `inicio_evento`, `fin_evento`, `id_tipo_evento`, `id_alcance_evento`, `id_apoyo_ofrecido`, `id_apoyo_posible`, `id_apoyo_solicitado`, `id_proyeccion_utp`) VALUES
(27, '2018-11-24', 101, 'Olimpiadas de Minecraft', 'En mi casa', 'Yo quiero ese dinero porque sí.', '-', 'F', 'EN SOLICITUD', '2007-05-08 12:35:29', NULL, '2007-05-08 12:35:29', '2007-05-08 12:35:29', 2, 2, 2, NULL, 1, 1),
(28, '2018-11-24', 101, 'Olimpiadas de Minecraft', 'En mi casa', 'Yo quiero ese dinero porque sí.', '-', 'F', 'EN SOLICITUD', '2007-05-08 12:35:29', NULL, '2007-05-08 12:35:29', '2007-05-08 12:35:29', 2, 2, 2, NULL, 1, 1),
(29, '2018-11-24', 101, 'Olimpiadas de Minecraft', 'En mi casa', 'Yo quiero ese dinero porque sí.', '-', 'F', 'EN SOLICITUD', '2007-05-08 12:35:29', NULL, '2007-05-08 12:35:29', '2007-05-08 12:35:29', 2, 2, 2, NULL, 1, 1),
(30, '2018-11-24', 101, 'Olimpiadas de Minecraft', 'En mi casa', 'Yo quiero ese dinero porque sí.', '-', 'F', 'EN SOLICITUD', '2007-05-08 12:35:29', NULL, '2007-05-08 12:35:29', '2007-05-08 12:35:29', 2, 2, 2, NULL, 1, 1),
(31, '2018-11-24', 101, 'Olimpiadas de Minecraft', 'En mi casa', 'Yo quiero ese dinero porque sí.', '-', 'F', 'EN SOLICITUD', '2007-05-08 12:35:29', NULL, '2007-05-08 12:35:29', '2007-05-08 12:35:29', 2, 2, 2, NULL, 1, 1),
(32, '2018-11-24', 101, 'Olimpiadas de Minecraft', 'En mi casa', 'Yo quiero ese dinero porque sí.', '-', 'F', 'EN SOLICITUD', '2007-05-08 12:35:29', NULL, '2007-05-08 12:35:29', '2007-05-08 12:35:29', 2, 2, 2, NULL, 1, 1),
(33, '2018-11-24', 101, 'Olimpiadas de Minecraft', 'En mi casa', 'Yo quiero ese dinero porque sí.', '-', 'F', 'EN SOLICITUD', '2007-05-08 12:35:29', NULL, '2007-05-08 12:35:29', '2007-05-08 12:35:29', 2, 2, 2, NULL, 1, 1),
(34, '2018-11-24', 101, 'Olimpiadas de Minecraft', 'En mi casa', 'Yo quiero ese dinero porque sí.', '-', 'F', 'EN SOLICITUD', '2007-05-08 12:35:29', NULL, '2007-05-08 12:35:29', '2007-05-08 12:35:29', 2, 2, 2, NULL, 1, 1),
(35, '2018-11-21', 101, 'sddjfhcvhkcv', 'xvchvjcbcjvc', 'bhghghhjhj', '-', 'F', 'EN SOLICITUD', '2018-11-21 00:00:00', NULL, '2018-11-30 00:00:00', '2018-11-07 00:00:00', 2, 2, 4, NULL, 1, 1),
(36, '2018-11-21', 101, 'sddjfhcvhkcv', 'xvchvjcbcjvc', 'bhghghhjhj', '-', 'F', 'EN SOLICITUD', '2018-11-21 00:00:00', NULL, '2018-11-30 00:00:00', '2018-11-07 00:00:00', 2, 2, 4, NULL, 1, 1),
(37, '2018-11-21', 101, 'sddjfhcvhkcv', 'xvchvjcbcjvc', 'bhghghhjhj', '-', 'F', 'EN SOLICITUD', '2018-11-21 00:00:00', NULL, '2018-11-30 00:00:00', '2018-11-07 00:00:00', 2, 2, 4, NULL, 1, 1),
(38, '2018-11-22', 101, 'ffgfgsgf', 'gfgfgfg', 'fgfgfgfgf', '-', 'F', 'EN SOLICITUD', '2018-11-22 00:00:00', NULL, '2018-11-07 00:00:00', '2018-11-23 00:00:00', 1, 1, 1, NULL, 1, 2),
(39, '2018-11-21', 101, 'sddjfhcvhkcv', 'xvchvjcbcjvc', 'bhghghhjhj', '-', 'F', 'EN SOLICITUD', '2018-11-21 00:00:00', NULL, '2018-11-30 00:00:00', '2018-11-07 00:00:00', 2, 2, 4, NULL, 1, 1),
(40, '2018-11-21', 101, 'sddjfhcvhkcv', 'xvchvjcbcjvc', 'bhghghhjhj', '-', 'F', 'EN SOLICITUD', '2018-11-21 00:00:00', NULL, '2018-11-30 00:00:00', '2018-11-07 00:00:00', 2, 2, 4, NULL, 1, 1),
(41, '2018-11-21', 101, 'sddjfhcvhkcv', 'xvchvjcbcjvc', 'bhghghhjhj', '-', 'F', 'EN SOLICITUD', '2018-11-21 00:00:00', NULL, '2018-11-30 00:00:00', '2018-11-07 00:00:00', 2, 2, 4, NULL, 1, 1),
(42, '2018-11-21', 101, 'sddjfhcvhkcv', 'xvchvjcbcjvc', 'bhghghhjhj', '-', 'F', 'EN SOLICITUD', '2018-11-21 00:00:00', NULL, '2018-11-30 00:00:00', '2018-11-07 00:00:00', 2, 2, 4, NULL, 1, 1),
(43, '2018-11-24', 101, 'Olimpiadas de Minecraft', 'En mi casa', 'Yo quiero ese dinero porque sí.', '-', 'F', 'EN SOLICITUD', '2007-05-08 12:35:29', NULL, '2007-05-08 12:35:29', '2007-05-08 12:35:29', 2, 2, 2, NULL, 1, 1),
(44, '2018-11-24', 101, 'dafdfdf', 'dfdfdfdf', 'dfdfdfdfdf', '-', 'F', 'EN SOLICITUD', '2018-11-24 00:00:00', NULL, '2018-10-30 00:00:00', '2018-11-20 00:00:00', 1, 1, 1, NULL, 1, 1),
(45, '2018-11-24', 101, 'sdaffdfd', 'dfdffdf', 'ddffdfdf', '-', 'F', 'EN SOLICITUD', '2018-11-24 00:00:00', NULL, '2018-11-14 00:00:00', '2018-11-20 00:00:00', 1, 1, 1, NULL, 1, 1),
(46, '2018-11-24', 101, 'Olimpiadas de Minecraft', 'En mi casa', 'Yo quiero ese dinero porque sí.', '-', 'F', 'EN SOLICITUD', '2007-05-08 12:35:29', NULL, '2007-05-08 12:35:29', '2007-05-08 12:35:29', 2, 2, 2, NULL, 1, 1),
(47, '2020-11-24', 101, 'Olimpiadas de Minecraft', 'En mi casa', 'Yo quiero ese dinero porque sí.', '-', 'F', 'EN SOLICITUD', '2007-05-08 12:35:29', NULL, '2007-05-08 12:35:29', '2007-05-08 12:35:29', 2, 2, 2, NULL, 1, 1),
(48, '2018-11-25', 101, 'ssxsxsxsx', 'ssxxssxs', 'wswssxsxsx', '-', 'F', 'EN SOLICITUD', '2018-11-25 00:00:00', NULL, '2018-11-15 00:00:00', '2018-11-22 00:00:00', 1, 1, 2, NULL, 1, 1),
(49, '2020-11-24', 101, 'Olimpiadas de Minecraft', 'En mi casa', 'Yo quiero ese dinero porque sí.', '-', 'F', 'EN SOLICITUD', '2007-05-08 12:35:29', NULL, '2007-05-08 12:35:29', '2007-05-08 12:35:29', 2, 2, 2, NULL, 1, 1),
(50, '2020-11-24', 101, 'Olimpiadas de Minecraft', 'En mi casa', 'Yo quiero ese dinero porque sí.', '-', 'F', 'EN SOLICITUD', '2007-05-08 12:35:29', NULL, '2007-05-08 12:35:29', '2007-05-08 12:35:29', 2, 2, 2, NULL, 1, 1),
(51, '2020-11-24', 101, 'Olimpiadas de Minecraft', 'En mi casa', 'Yo quiero ese dinero porque sí.', '-', 'F', 'EN SOLICITUD', '2007-05-08 12:35:29', NULL, '2007-05-08 12:35:29', '2007-05-08 12:35:29', 2, 2, 2, NULL, 1, 1),
(52, '2018-12-04', 101, 'dfdfdff', 'ssddsdds', 'dssdsdsd', '-', 'F', 'EN SOLICITUD', '2018-12-04 00:00:00', NULL, '2018-12-12 00:00:00', '2018-12-20 00:00:00', 1, 2, 2, NULL, 1, 1),
(53, '2018-11-24', 101, 'Olimpiadas de Minecraft', 'En mi casa', 'Yo quiero ese dinero porque sí.', '-', 'F', 'EN SOLICITUD', '2007-05-08 12:35:29', NULL, '2007-05-08 12:35:29', '2007-05-08 12:35:29', 2, 2, 2, NULL, 1, 1),
(54, '2018-12-04', 101, 'dfdfdff', 'ssddsdds', 'dssdsdsd', '-', 'F', 'EN SOLICITUD', '2018-12-04 00:00:00', NULL, '2018-12-12 00:00:00', '2018-12-20 00:00:00', 1, 2, 2, NULL, 1, 1),
(55, '2018-12-04', 101, 'kmkmkmmk', 'm m', 'jnnjnjnjn', '-', 'F', 'EN SOLICITUD', '2018-12-04 00:00:00', NULL, '2018-11-30 00:00:00', '2018-12-22 00:00:00', 1, 2, 4, NULL, 1, 1),
(56, '2018-12-04', 101, 'dfdfdff', 'ssddsdds', 'dssdsdsd', '-', 'F', 'EN SOLICITUD', '2018-12-04 00:00:00', NULL, '2018-12-12 00:00:00', '2018-12-20 00:00:00', 1, 2, 2, NULL, 1, 1),
(57, '2018-11-24', 101, 'Olimpiadas de Minecraft', 'En mi casa', 'Yo quiero ese dinero porque sí.', '-', 'F', 'EN SOLICITUD', '2007-05-08 12:35:29', NULL, '2007-05-08 12:35:29', '2007-05-08 12:35:29', 2, 2, 2, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tipo_evento`
--

CREATE TABLE `tipo_evento` (
  `id` int(4) NOT NULL,
  `nombre` varchar(40) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `tipo_evento`
--

INSERT INTO `tipo_evento` (`id`, `nombre`) VALUES
(1, 'Cultural'),
(2, 'Deportivo');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alcance_evento`
--
ALTER TABLE `alcance_evento`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `apoyo_ofrecido`
--
ALTER TABLE `apoyo_ofrecido`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `apoyo_posible`
--
ALTER TABLE `apoyo_posible`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `apoyo_solicitado`
--
ALTER TABLE `apoyo_solicitado`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comision_evaluadora`
--
ALTER TABLE `comision_evaluadora`
  ADD PRIMARY KEY (`id_comision`),
  ADD KEY `id_profesor` (`id_profesor`);

--
-- Indexes for table `estudiante_local`
--
ALTER TABLE `estudiante_local`
  ADD PRIMARY KEY (`id_estudiante`);

--
-- Indexes for table `estudiante_matricula`
--
ALTER TABLE `estudiante_matricula`
  ADD PRIMARY KEY (`cedula`),
  ADD KEY `id_estudiante` (`id_estudiante`);

--
-- Indexes for table `id_rutp_fv_4_svu`
--
ALTER TABLE `id_rutp_fv_4_svu`
  ADD KEY `id_solicitud` (`id_solicitud`);

--
-- Indexes for table `login_administrativo`
--
ALTER TABLE `login_administrativo`
  ADD PRIMARY KEY (`correo_institucional`);

--
-- Indexes for table `procede`
--
ALTER TABLE `procede`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profesor`
--
ALTER TABLE `profesor`
  ADD PRIMARY KEY (`id_profesor`),
  ADD KEY `fk_correo_institucional` (`correo_institucional`);

--
-- Indexes for table `proyeccion_utp`
--
ALTER TABLE `proyeccion_utp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `relevancia`
--
ALTER TABLE `relevancia`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rutp_fv_4_ce`
--
ALTER TABLE `rutp_fv_4_ce`
  ADD KEY `id_solicitud` (`id_solicitud`),
  ADD KEY `fk_id_relevancia` (`id_relevancia`),
  ADD KEY `fk_id_procede` (`id_procede`);

--
-- Indexes for table `rut_fv_4_rec`
--
ALTER TABLE `rut_fv_4_rec`
  ADD KEY `id_solicitud` (`id_solicitud`),
  ADD KEY `fk2_id_apoyo_posible` (`id_apoyo_posible`);

--
-- Indexes for table `solicitud_rutp_fv_4_est`
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
-- Indexes for table `tipo_evento`
--
ALTER TABLE `tipo_evento`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alcance_evento`
--
ALTER TABLE `alcance_evento`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `apoyo_ofrecido`
--
ALTER TABLE `apoyo_ofrecido`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `apoyo_posible`
--
ALTER TABLE `apoyo_posible`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `apoyo_solicitado`
--
ALTER TABLE `apoyo_solicitado`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `comision_evaluadora`
--
ALTER TABLE `comision_evaluadora`
  MODIFY `id_comision` int(4) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `estudiante_local`
--
ALTER TABLE `estudiante_local`
  MODIFY `id_estudiante` int(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT for table `procede`
--
ALTER TABLE `procede`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `profesor`
--
ALTER TABLE `profesor`
  MODIFY `id_profesor` int(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2223;

--
-- AUTO_INCREMENT for table `proyeccion_utp`
--
ALTER TABLE `proyeccion_utp`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `relevancia`
--
ALTER TABLE `relevancia`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `solicitud_rutp_fv_4_est`
--
ALTER TABLE `solicitud_rutp_fv_4_est`
  MODIFY `id_solicitud` int(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comision_evaluadora`
--
ALTER TABLE `comision_evaluadora`
  ADD CONSTRAINT `comision_evaluadora_ibfk_1` FOREIGN KEY (`id_profesor`) REFERENCES `profesor` (`id_profesor`) ON DELETE CASCADE;

--
-- Constraints for table `id_rutp_fv_4_svu`
--
ALTER TABLE `id_rutp_fv_4_svu`
  ADD CONSTRAINT `id_rutp_fv_4_svu_ibfk_1` FOREIGN KEY (`id_solicitud`) REFERENCES `solicitud_rutp_fv_4_est` (`id_solicitud`) ON DELETE CASCADE;

--
-- Constraints for table `profesor`
--
ALTER TABLE `profesor`
  ADD CONSTRAINT `fk_correo_institucional` FOREIGN KEY (`correo_institucional`) REFERENCES `login_administrativo` (`correo_institucional`);

--
-- Constraints for table `rutp_fv_4_ce`
--
ALTER TABLE `rutp_fv_4_ce`
  ADD CONSTRAINT `fk_id_procede` FOREIGN KEY (`id_procede`) REFERENCES `procede` (`id`),
  ADD CONSTRAINT `fk_id_relevancia` FOREIGN KEY (`id_relevancia`) REFERENCES `relevancia` (`id`),
  ADD CONSTRAINT `rutp_fv_4_ce_ibfk_1` FOREIGN KEY (`id_solicitud`) REFERENCES `solicitud_rutp_fv_4_est` (`id_solicitud`) ON DELETE CASCADE;

--
-- Constraints for table `rut_fv_4_rec`
--
ALTER TABLE `rut_fv_4_rec`
  ADD CONSTRAINT `fk2_id_apoyo_posible` FOREIGN KEY (`id_apoyo_posible`) REFERENCES `apoyo_posible` (`id`),
  ADD CONSTRAINT `rut_fv_4_rec_ibfk_1` FOREIGN KEY (`id_solicitud`) REFERENCES `solicitud_rutp_fv_4_est` (`id_solicitud`) ON DELETE CASCADE;

--
-- Constraints for table `solicitud_rutp_fv_4_est`
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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
