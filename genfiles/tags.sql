-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 18, 2014 at 10:41 PM
-- Server version: 5.5.38-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `executive_development`
--

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE IF NOT EXISTS `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_tags_on_name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `created_at`, `updated_at`, `description`) VALUES
(1, 'sports secretary', '2014-08-02 09:18:43', '2014-08-02 09:18:43', 'mdsds fgdsfg fd sdfg sg ere mdsds fgdsfg fd sdfg sg ere mdsds fgdsfg fd sdfg sg ere mdsds fgdsfg fd sdfg sg ere '),
(2, 'Cultural affairs Secretary', '2014-08-02 09:18:43', '2014-08-02 09:18:43', ''),
(3, 'co-curricular affairs secretary', '2014-08-02 09:18:43', '2014-08-02 09:18:43', ''),
(4, 'academic affairs secretary', '2014-08-02 09:18:43', '2014-08-02 09:18:43', ''),
(5, 'research affairs secretary', NULL, NULL, ''),
(6, 'Hostel Affairs Secretary', NULL, NULL, ''),
(7, 'Students General Secretary', NULL, NULL, ''),
(8, 'Secretary, International and Alumni Affairs', NULL, NULL, ''),
(9, 'Speaker, Student Affairs Council', NULL, '2014-08-18 16:50:10', 'Check this out!!!');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
