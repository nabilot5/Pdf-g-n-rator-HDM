-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 04 juil. 2022 à 12:01
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `hdm`
--

-- --------------------------------------------------------

--
-- Structure de la table `country`
--

DROP TABLE IF EXISTS `country`;
CREATE TABLE IF NOT EXISTS `country` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `country`
--

INSERT INTO `country` (`id`, `name`) VALUES
(1, 'Belgique'),
(2, 'France'),
(3, 'Allemagne'),
(4, 'Autriche'),
(5, 'Bulgarie'),
(6, 'Chypre'),
(7, 'Croatie'),
(8, 'Danemark'),
(9, 'Espagne'),
(10, 'Estonie'),
(11, 'Finlande'),
(12, 'Grèce'),
(13, 'Hongrie'),
(14, 'Irlande'),
(15, 'Italie'),
(16, 'Lettonie'),
(17, 'Lituanie'),
(18, 'Luxembourg'),
(19, 'Malte'),
(20, 'Pays-Bas'),
(21, 'Pologne'),
(22, 'Portugal'),
(23, 'République Tchèque'),
(24, 'Roumanie'),
(25, 'Slovaquie'),
(26, 'Slovénie'),
(27, 'Suède');

-- --------------------------------------------------------

--
-- Structure de la table `document_sourcing`
--

DROP TABLE IF EXISTS `document_sourcing`;
CREATE TABLE IF NOT EXISTS `document_sourcing` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `link` text NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `document_sourcing`
--

INSERT INTO `document_sourcing` (`id`, `name`, `link`, `description`) VALUES
(1, 'Message type', 'https://docs.google.com/document/d/1xlfW7UaOO17a9up0NblhLJ0ovAi_s5gAjrAXpYAvV5I/edit', 'L&#39;ensemble des messages types utilis?s lors du sourcing ainsi que quelques messages types pour le suivi de stage');

-- --------------------------------------------------------

--
-- Structure de la table `document_stagiaire`
--

DROP TABLE IF EXISTS `document_stagiaire`;
CREATE TABLE IF NOT EXISTS `document_stagiaire` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `link` text NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `experience`
--

DROP TABLE IF EXISTS `experience`;
CREATE TABLE IF NOT EXISTS `experience` (
  `id` bigint(20) NOT NULL,
  `id_user` bigint(20) NOT NULL,
  `company` text NOT NULL,
  `experience_begin` date NOT NULL,
  `experience_end` date NOT NULL,
  `job` text NOT NULL,
  `tasks` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `feedback_statut`
--

DROP TABLE IF EXISTS `feedback_statut`;
CREATE TABLE IF NOT EXISTS `feedback_statut` (
  `id` mediumint(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `feedback_statut`
--

INSERT INTO `feedback_statut` (`id`, `name`) VALUES
(1, 'Sourcing'),
(2, 'Feedback positif envoyé, en attente de la convention'),
(3, 'Feedback positif a envoyer après entretien'),
(4, 'Feedback négatif envoyé'),
(5, 'feedback négatif a envoyer après entretien'),
(6, 'Délibération à faire'),
(7, 'Test planifié/envoyé'),
(8, 'Feedback positif a envoyer après test'),
(9, 'Feedback négatif a envoyer après test'),
(11, 'Entretien à planifier'),
(12, 'Entretien planifié'),
(13, 'Stage en cours'),
(14, 'Convention à remplir'),
(15, 'Convention remplie et envoyée, en attente de la recevoir signée par les 3 parties'),
(16, 'Convention validée, en attente de débuter son stage');

-- --------------------------------------------------------

--
-- Structure de la table `internship_statut`
--

DROP TABLE IF EXISTS `internship_statut`;
CREATE TABLE IF NOT EXISTS `internship_statut` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `internship_statut`
--

INSERT INTO `internship_statut` (`id`, `name`) VALUES
(1, 'Candidat'),
(2, 'Candidat refusé'),
(3, 'En attente de la convention'),
(4, 'Convention signée'),
(5, 'Stage en cours'),
(6, 'Stage terminé'),
(7, 'Permanent');

-- --------------------------------------------------------

--
-- Structure de la table `interview`
--

DROP TABLE IF EXISTS `interview`;
CREATE TABLE IF NOT EXISTS `interview` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_user` bigint(20) NOT NULL,
  `interview_date` datetime NOT NULL DEFAULT '2020-01-01 00:00:00',
  `id_interviewer` bigint(20) NOT NULL DEFAULT '1',
  `name_interviewer` varchar(200) DEFAULT NULL,
  `id_backup` bigint(20) NOT NULL DEFAULT '1',
  `name_backup` varchar(200) DEFAULT NULL,
  `interviewer_feedback` text,
  `backup_feedback` text,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `interview`
--

INSERT INTO `interview` (`id`, `id_user`, `interview_date`, `id_interviewer`, `name_interviewer`, `id_backup`, `name_backup`, `interviewer_feedback`, `backup_feedback`) VALUES
(1, 3, '2022-06-13 13:30:00', 1, 'David Van Goidtsnoven', 10, 'Léonida Binalounga', 'tet', 'yeah'),
(2, 8, '2022-01-15 06:00:00', 1, NULL, 1, NULL, NULL, NULL),
(4, 10, '2022-06-28 14:00:00', 1, NULL, 1, NULL, NULL, NULL),
(6, 12, '2022-06-15 04:00:00', 8, 'Maxime Marcel', 10, 'Léonida Binalounga', 'ddd', 'dd'),
(7, 13, '2020-01-01 00:00:00', 1, NULL, 1, NULL, NULL, NULL),
(8, 14, '2022-01-19 00:00:00', 8, 'Maxime Marcel', 10, 'Léonida Binalounga', 'Nickel', 'cool'),
(9, 15, '2022-01-02 00:00:00', 8, 'Maxime Marcel', 10, 'Léonida Binalounga', 'test', 'test 2'),
(10, 16, '2020-01-01 00:00:00', 1, NULL, 1, NULL, NULL, NULL),
(11, 17, '2020-01-01 00:00:00', 1, NULL, 1, NULL, NULL, NULL),
(12, 18, '2022-01-02 00:00:00', 1, NULL, 1, NULL, NULL, NULL),
(13, 19, '2020-01-01 00:00:00', 1, NULL, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `language`
--

DROP TABLE IF EXISTS `language`;
CREATE TABLE IF NOT EXISTS `language` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `pole`
--

DROP TABLE IF EXISTS `pole`;
CREATE TABLE IF NOT EXISTS `pole` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `pole`
--

INSERT INTO `pole` (`id`, `name`) VALUES
(1, 'RH Recrutement'),
(2, 'RH Placement'),
(3, 'Webdev'),
(4, 'SEO'),
(5, 'B2B-Bdev'),
(6, 'Graphisme'),
(7, 'Admin');

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'candidat'),
(2, 'stagiaire'),
(3, 'RH Recrutement'),
(4, 'RH placement'),
(5, 'TL'),
(6, 'TL RHR'),
(7, 'TL RHP'),
(8, 'admin');

-- --------------------------------------------------------

--
-- Structure de la table `test`
--

DROP TABLE IF EXISTS `test`;
CREATE TABLE IF NOT EXISTS `test` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_users` bigint(20) NOT NULL,
  `id_sender` bigint(20) NOT NULL,
  `send_date` datetime NOT NULL,
  `receive_wanted` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_users` (`id_users`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `test`
--

INSERT INTO `test` (`id`, `id_users`, `id_sender`, `send_date`, `receive_wanted`) VALUES
(11, 14, 1, '2022-01-06 00:00:00', '2022-01-06 00:20:00'),
(10, 12, 1, '2022-06-28 11:00:00', '2022-06-29 11:00:00'),
(12, 13, 1, '2022-01-02 00:00:00', '2022-01-02 00:20:00');

-- --------------------------------------------------------

--
-- Structure de la table `training`
--

DROP TABLE IF EXISTS `training`;
CREATE TABLE IF NOT EXISTS `training` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `school` text NOT NULL,
  `training_begin` date NOT NULL,
  `training_end` date NOT NULL,
  `diploma` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `mail` varchar(100) NOT NULL,
  `phone` varchar(40) NOT NULL,
  `pole` smallint(3) NOT NULL,
  `role` smallint(3) NOT NULL DEFAULT '1',
  `password` text,
  `photo` text,
  `localisation` varchar(100) NOT NULL,
  `street` text,
  `street_number` mediumint(5) DEFAULT NULL,
  `street_bp` varchar(100) DEFAULT NULL,
  `cp` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `country` mediumint(3) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `search_for_a_job` smallint(2) DEFAULT NULL,
  `school_name` text,
  `school_phone` varchar(100) DEFAULT NULL,
  `school_mail` varchar(100) DEFAULT NULL,
  `school_contact` varchar(100) DEFAULT NULL,
  `intership_statut` varchar(50) DEFAULT NULL,
  `intership_begin` date DEFAULT NULL,
  `intership_end` date DEFAULT NULL,
  `intership_day` text,
  `work_wanted` varchar(200) DEFAULT NULL,
  `work_mobility` varchar(200) DEFAULT NULL,
  `work_description` text,
  `work_salary` float DEFAULT NULL,
  `work_wanted_salary` float DEFAULT NULL,
  `feedback_statut` mediumint(3) NOT NULL DEFAULT '1',
  `sourcing_by` bigint(20) NOT NULL,
  `interview_id` bigint(20) NOT NULL DEFAULT '0',
  `sourcing_on` mediumint(4) DEFAULT NULL,
  `sourcing_on_date` datetime NOT NULL DEFAULT '2020-01-01 00:00:00',
  `files_convention` text,
  `files_rules` text,
  `files_right` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `mail`, `phone`, `pole`, `role`, `password`, `photo`, `localisation`, `street`, `street_number`, `street_bp`, `cp`, `city`, `country`, `birthday`, `search_for_a_job`, `school_name`, `school_phone`, `school_mail`, `school_contact`, `intership_statut`, `intership_begin`, `intership_end`, `intership_day`, `work_wanted`, `work_mobility`, `work_description`, `work_salary`, `work_wanted_salary`, `feedback_statut`, `sourcing_by`, `interview_id`, `sourcing_on`, `sourcing_on_date`, `files_convention`, `files_rules`, `files_right`) VALUES
(1, 'David', 'Van Goidtsnoven', 'vangoidtsnovendavid@gmail.com', '0485160996', 7, 8, '098f6bcd4621d373cade4e832627b4f6', '', '', 'Rue Alfred Tenret', 38, '', '6030', 'Charleroi', 1, '1980-09-18', 1, '', '', '', '', '7', '2020-02-01', '2060-06-23', '', '', '', '', 0, 0, 1, 0, 0, NULL, '2020-01-01 00:00:00', NULL, NULL, NULL),
(3, 'Quentin', 'Mousset', 'quentinmousset@gmail.com', '0499179147', 3, 1, NULL, NULL, 'Charleroi', 'Rue Oppermans', 24, '', '6001', 'Marcinelle', 1, NULL, NULL, 'School of talents', '0485160996', 'asbl@hdmnetwork.com', 'David Van Goidtsnoven', '', '2020-01-02', '2023-12-31', NULL, NULL, NULL, NULL, NULL, NULL, 16, 1, 1, NULL, '2020-01-01 00:00:00', 'contrats-woods5_VANGOIDTSNOVEN.pdf', 'FR_Invoice Split - GAELLE SANTY[3568].pdf', 'lettre motivation.pdf'),
(8, 'Maxime', 'Marcel', 'maximemarcel1@gmail.com', '', 1, 6, '098f6bcd4621d373cade4e832627b4f6', NULL, 'Angers', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-16', '2022-07-08', NULL, NULL, NULL, NULL, NULL, NULL, 13, 1, 2, NULL, '2020-01-01 00:00:00', NULL, NULL, NULL),
(10, 'Léonida', 'Binalounga', 'Leonida.binalounga1@gmail.com', '', 1, 3, '098f6bcd4621d373cade4e832627b4f6', NULL, 'France', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-01', '2022-08-31', NULL, NULL, NULL, NULL, NULL, NULL, 13, 1, 4, 2, '2020-01-01 00:00:00', NULL, NULL, NULL),
(12, 'Cyril', 'Bousquet', 'cyrilbousquetpro@gmail.com', '', 4, 1, NULL, NULL, 'Lyon', 'Cours Tolstoi', 33, '6Ã¨me etage', '69100', 'Villeurbanne', 2, NULL, NULL, 'UniversitÃ© Jean Moulin - Lyon 3', '+33478787678', 'conventiondestage.iaelyon@univ-lyon3.fr', 'Nguyen Arthur', NULL, '2022-04-18', '2022-07-15', '{\r\n\"lundiAM\" : 1,\r\n\"lundiPM\" : 1,\r\n\"mardiAM\" : 1,\r\n\"mardiPM\" : 1,\r\n\"mercrediAM\" : 1,\r\n\"mercrediPM\" : 1,\r\n\"jeudiAM\" : 1,\r\n\"jeudiPM\" : 1,\r\n\"vendrediAM\" : 1,\r\n\"vendrediPM\" : 1,\r\n\"samediAM\" : 0,\r\n\"samediPM\" : 0\r\n}', NULL, NULL, NULL, NULL, NULL, 16, 1, 6, 1, '2022-06-27 15:31:07', 'C91_VAN_GOIDTSNOVEN_David.pdf', NULL, NULL),
(13, 'michel', 'legrand', 'gaellesanty@gmail.com', '+0452658512', 3, 1, NULL, NULL, 'belgique', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 1, 7, 1, '2022-06-30 15:24:57', NULL, NULL, NULL),
(14, 'michele', 'legrand', 'gaellesantye@gmail.com', '+0452658512', 3, 1, NULL, NULL, 'belgique', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-21', '2022-01-24', NULL, NULL, NULL, NULL, NULL, NULL, 16, 1, 8, 1, '2022-06-30 15:26:51', 'bondelivraison-016001.pdf', NULL, NULL),
(15, 'jean jaques', 'pirson', 'admine@spiderwolf.net', '2537255204537653', 5, 1, NULL, NULL, 'belgique', 'Rue Alfred Tenret', 38, '', '6030', 'Marchienne-Au-Pont', 1, NULL, NULL, 'School of talents', '0485160996', 'admin@spiderwolf.net', 'David Van Goidtsnoven', NULL, '2020-01-03', '2020-03-20', '{\r\n\"lundiAM\" : 1,\r\n\"lundiPM\" : 1,\r\n\"mardiAM\" : 1,\r\n\"mardiPM\" : 1,\r\n\"mercrediAM\" : 1,\r\n\"mercrediPM\" : 1,\r\n\"jeudiAM\" : 1,\r\n\"jeudiPM\" : 1,\r\n\"vendrediAM\" : 1,\r\n\"vendrediPM\" : 1,\r\n\"samediAM\" : 0,\r\n\"samediPM\" : 0\r\n}', NULL, NULL, NULL, NULL, NULL, 16, 1, 9, 3, '2022-06-30 15:27:18', 'Noms_formations_details_wiki_birthday.pdf', NULL, '2022-06-27T00-18 Transaction nÂ° 4928362913942352-10079429.pdf'),
(16, 'fg', 'gf', 'fddd@df.com', 'gf', 1, 1, NULL, NULL, 'gf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 10, 1, '2022-06-30 15:30:12', NULL, NULL, NULL),
(17, 'gg', 'fdsg', 'adminf@spiderwolf.net', 'gdsg', 3, 1, NULL, NULL, 'dfgsdgd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 11, 6, '2022-06-30 15:32:04', NULL, NULL, NULL),
(18, 'etj', 'ety', 'adrmin@spiderwolf.net', 'ety', 1, 1, NULL, NULL, 'rehr', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, 1, 12, 2, '2022-06-30 15:33:03', NULL, NULL, NULL),
(19, 'dqsdqs', 'sqdqs', 'adsqdin@spiderwolf.net', 'qsdsqd', 2, 1, NULL, NULL, 'qsdqsd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 13, 4, '2022-06-30 15:33:50', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `users_language`
--

DROP TABLE IF EXISTS `users_language`;
CREATE TABLE IF NOT EXISTS `users_language` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_user` bigint(20) NOT NULL,
  `id_language` bigint(20) NOT NULL,
  `level` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `users_sourcing_on`
--

DROP TABLE IF EXISTS `users_sourcing_on`;
CREATE TABLE IF NOT EXISTS `users_sourcing_on` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `login` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `users_sourcing_on`
--

INSERT INTO `users_sourcing_on` (`id`, `name`, `login`, `password`) VALUES
(1, 'Studl', 'rh@hdmnetwork.com', 'MgsWcX6eRJmi4ie'),
(2, 'Linkedin', 'rh@hdmnetwork.com', '3eZ3@BjR*K7yxFT'),
(3, 'Indeed', 'rh@hdmnetwork.com', 'x7mZT!p7@T@siQ8'),
(4, 'JobIRL', 'rh@hdmnetwork.com', 'Unknow'),
(5, 'Capcampus', 'rh@hdmnetwork.com', 'a2Sdiu4zCcFhAum'),
(6, 'page talent', 'rh@hdmnetwork.com', 'Goo56;FG'),
(7, 'Facebook', 'rh@hdmnetwork.com', '3i6F;8/wPZ#u'),
(9, 'Jooble', 'rh@hdmnetwork.com', 'HDMNetwork2022'),
(10, 'vivastreet', 'rh@hdmnetwork.com', 'f1v.plr%47mkas9.hz3'),
(11, 'CIDJ', 'rh@hdmnetwork.com', 'HDMNetwork2022'),
(12, 'Direct Emploi', 'rh@hdmnetwork.com', 'HDMNetwork2022'),
(13, 'EFC Formation Finance', 'rh@hdmnetwork.com', 'NjqyVtX4'),
(14, 'EFC Formation RH', 'rh@hdmnetwork.com', 'QhF86nPd'),
(15, 'Ephec', 'rh@hdmnetwork.com', 'EPHEC-200615-8936'),
(16, 'Candidature Spontanée (gmail)', 'recrutementhdm@gmail.com', ''),
(17, 'Candidature Spontanée (thunderbird)', 'rh@hdmnetwork.com', '');

-- --------------------------------------------------------

--
-- Structure de la table `users_training`
--

DROP TABLE IF EXISTS `users_training`;
CREATE TABLE IF NOT EXISTS `users_training` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_training` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
