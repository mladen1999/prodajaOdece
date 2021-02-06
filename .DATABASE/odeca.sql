/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP DATABASE IF EXISTS `odeca`;
CREATE DATABASE IF NOT EXISTS `odeca` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `odeca`;

DROP TABLE IF EXISTS `administrator`;
CREATE TABLE IF NOT EXISTS `administrator` (
  `administrator_id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL DEFAULT '0',
  `password_hash` varchar(128) NOT NULL DEFAULT '0',
  PRIMARY KEY (`administrator_id`),
  UNIQUE KEY `uq_administrator_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELETE FROM `administrator`;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` (`administrator_id`, `username`, `password_hash`) VALUES
	(1, 'mladen', '123456789'),
	(2, 'test_admin', '18F94E0E8472D0558A8B2C8BC832C7D22B378B50DF8DA2F0AC1F34FB4AF4EC85392B2B41A956153D86E87F7547C1B19BC9808C3F9878202F063399975852165D'),
	(3, 'mcvetkovic', '6A4C0DC4FCC43BDEA28963DF73E4F8351BCDAE08FDA1516234E8D764AF8178A610BCCA2813D204DFF92A43F0511EB0016C7682CCF7B343D99E01739FC26EF104'),
	(5, 'mladenc', 'D1B080950E85C8916A16DA7CE500D85B56E52B64F59B958F1929F164FB0751544925557C0649C9BB50F3DE0D1471FCE3E233E1EF33BD0EA06601FC7D54F927FC'),
	(7, 'admin', '7FCF4BA391C48784EDDE599889D6E3F1E47A27DB36ECC050CC92F259BFAC38AFAD2C68A1AE804D77075E8FB722503F3ECA2B2C1006EE6F6C7B7628CB45FFFD1D'),
	(8, 'test', 'EE26B0DD4AF7E749AA1A8EE3C10AE9923F618980772E473F8819A5D4940E0DB27AC185F8A0E1D5F84F88BC887FD67B143732C304CC5FA9AD8E6F57F50028A8FF');
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;

DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `article_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `category_id` int unsigned NOT NULL DEFAULT '0',
  `excerpt` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('available','visible','hidden') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'available',
  `is_promoted` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`article_id`),
  KEY `fk_article_category_id` (`category_id`),
  CONSTRAINT `fk_article_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DELETE FROM `article`;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` (`article_id`, `name`, `category_id`, `excerpt`, `description`, `status`, `is_promoted`, `created_at`) VALUES
	(1, 'A NIKE M NSW SS TEE GB', 5, 'Kratak opis', 'Detaljan opis', 'available', 0, '2021-01-04 10:29:39'),
	(2, 'NIKE M NSW TEE EDIT GB', 5, 'Neki kratak tekst..._2', 'Neki malo duzi tekst o proizvodu._2', 'visible', 1, '2021-01-04 18:59:30'),
	(3, 'JAKNA NIKE', 3, 'Kratak opis jakne', 'Detaljan opis nike janke', 'available', 0, '2021-01-31 10:30:24'),
	(4, 'A JAKNA NIKE', 3, 'Kratak opis za jaknu', 'Neki malo duzi opis za NIKE jaknu 1', 'available', 0, '2021-01-31 18:45:20'),
	(6, 'Nike crvena majica', 5, 'Crvena nike majica', 'Detaljan opis nike crvene majice', 'available', 0, '2021-02-06 19:04:52'),
	(7, 'Nike jakna TSW', 3, 'Ovo je nike jakna', 'Ovo je detaljan opis nike jakne', 'available', 0, '2021-02-06 19:17:10');
/*!40000 ALTER TABLE `article` ENABLE KEYS */;

DROP TABLE IF EXISTS `article_feature`;
CREATE TABLE IF NOT EXISTS `article_feature` (
  `article_feature_id` int unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int unsigned NOT NULL DEFAULT '0',
  `feature_id` int unsigned NOT NULL DEFAULT '0',
  `Column 4` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`article_feature_id`),
  UNIQUE KEY `uq_article_feature_article_id_feature_id` (`article_id`,`feature_id`),
  KEY `fk_article_feature_feature_id` (`feature_id`),
  CONSTRAINT `fk_article_feature_article_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_article_feature_feature_id` FOREIGN KEY (`feature_id`) REFERENCES `feature` (`feature_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DELETE FROM `article_feature`;
/*!40000 ALTER TABLE `article_feature` DISABLE KEYS */;
INSERT INTO `article_feature` (`article_feature_id`, `article_id`, `feature_id`, `Column 4`) VALUES
	(1, 1, 1, 'Crna'),
	(2, 1, 6, 'Pamuk'),
	(3, 1, 7, 'Kina'),
	(6, 2, 6, 'Pamuk'),
	(7, 2, 7, 'Pamuk...'),
	(8, 3, 13, 'Nike'),
	(9, 3, 15, 'Crna'),
	(10, 3, 16, 'Zimska'),
	(11, 4, 13, 'Nike'),
	(12, 4, 15, 'Siva'),
	(13, 4, 16, 'Zimska');
/*!40000 ALTER TABLE `article_feature` ENABLE KEYS */;

DROP TABLE IF EXISTS `article_price`;
CREATE TABLE IF NOT EXISTS `article_price` (
  `article_price_id` int unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int unsigned NOT NULL DEFAULT '0',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`article_price_id`),
  KEY `fk_article_price_article_id` (`article_id`),
  CONSTRAINT `fk_article_price_article_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DELETE FROM `article_price`;
/*!40000 ALTER TABLE `article_price` DISABLE KEYS */;
INSERT INTO `article_price` (`article_price_id`, `article_id`, `price`, `created_at`) VALUES
	(1, 1, 45.00, '2021-01-04 10:44:24'),
	(2, 1, 40.00, '2021-01-04 10:44:35'),
	(3, 2, 56.89, '2021-01-04 18:59:33'),
	(4, 2, 57.11, '2021-01-29 12:23:35'),
	(5, 3, 120.00, '2021-01-31 10:30:54'),
	(6, 4, 140.00, '2021-01-31 18:46:11'),
	(7, 6, 30.00, '2021-02-06 19:05:15'),
	(8, 7, 30.00, '2021-02-06 19:17:49');
/*!40000 ALTER TABLE `article_price` ENABLE KEYS */;

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `cart_id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cart_id`),
  KEY `fk_cart_user_id` (`user_id`),
  CONSTRAINT `fk_cart_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DELETE FROM `cart`;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` (`cart_id`, `user_id`, `created_at`) VALUES
	(1, 1, '2021-01-30 12:56:14'),
	(2, 1, '2021-01-30 13:02:21'),
	(3, 1, '2021-01-30 17:23:30'),
	(4, 1, '2021-01-30 18:38:30'),
	(5, 1, '2021-01-30 18:39:25'),
	(6, 1, '2021-02-01 09:02:52'),
	(7, 1, '2021-02-01 09:08:41'),
	(8, 1, '2021-02-01 09:13:56'),
	(9, 1, '2021-02-01 09:14:46'),
	(10, 1, '2021-02-04 10:01:49'),
	(11, 1, '2021-02-06 12:07:51'),
	(12, 9, '2021-02-06 12:24:26'),
	(13, 9, '2021-02-06 17:23:43'),
	(14, 9, '2021-02-06 17:31:05');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;

DROP TABLE IF EXISTS `cart_article`;
CREATE TABLE IF NOT EXISTS `cart_article` (
  `cart_article_id` int unsigned NOT NULL AUTO_INCREMENT,
  `cart_id` int unsigned NOT NULL DEFAULT '0',
  `article_id` int unsigned NOT NULL DEFAULT '0',
  `quantity` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cart_article_id`),
  UNIQUE KEY `uq_cat_article_cart_id_article_id` (`cart_id`,`article_id`),
  KEY `fk_cart_article_article_id` (`article_id`),
  CONSTRAINT `fk_cart_article_article_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_cart_article_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DELETE FROM `cart_article`;
/*!40000 ALTER TABLE `cart_article` DISABLE KEYS */;
INSERT INTO `cart_article` (`cart_article_id`, `cart_id`, `article_id`, `quantity`) VALUES
	(1, 1, 1, 4),
	(2, 1, 2, 2),
	(4, 2, 1, 8),
	(5, 2, 2, 5),
	(8, 3, 2, 2),
	(9, 4, 1, 1),
	(10, 5, 1, 4),
	(11, 6, 2, 1),
	(12, 6, 1, 3),
	(13, 7, 2, 1),
	(14, 7, 1, 3),
	(15, 8, 2, 1),
	(16, 8, 1, 3),
	(17, 9, 2, 1),
	(18, 9, 1, 3),
	(19, 10, 1, 3),
	(20, 11, 1, 3),
	(21, 12, 3, 3),
	(25, 12, 1, 1),
	(26, 12, 2, 1),
	(27, 13, 1, 3);
/*!40000 ALTER TABLE `cart_article` ENABLE KEYS */;

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `category_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `image_path` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `parent__category_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `uq_category_name` (`name`),
  UNIQUE KEY `uq_category_image_path` (`image_path`),
  KEY `fk_category_parent__category_id` (`parent__category_id`),
  CONSTRAINT `fk_category_parent__category_id` FOREIGN KEY (`parent__category_id`) REFERENCES `category` (`category_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DELETE FROM `category`;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`category_id`, `name`, `image_path`, `parent__category_id`) VALUES
	(1, 'Muskarci', 'clothes/mclothes.jpg', NULL),
	(2, 'Zene', 'clothes/wclothes.jpg', NULL),
	(3, 'Odeca', 'clothes/mclothes/jacket.jpg', 1),
	(4, 'Majice', 'clothes/mclothes/shirt.jpg', 1),
	(5, 'Nike majica', 'clothes/mclothes/shirt/nike.jpg', 4);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

DROP TABLE IF EXISTS `feature`;
CREATE TABLE IF NOT EXISTS `feature` (
  `feature_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `category_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`feature_id`),
  UNIQUE KEY `uq_feature_name_category_id` (`name`,`category_id`),
  KEY `fk_feature_category_id` (`category_id`),
  CONSTRAINT `fk_feature_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DELETE FROM `feature`;
/*!40000 ALTER TABLE `feature` DISABLE KEYS */;
INSERT INTO `feature` (`feature_id`, `name`, `category_id`) VALUES
	(15, 'Boja', 3),
	(1, 'Boja', 5),
	(13, 'Proizvodjac', 3),
	(16, 'Vrsta', 3),
	(6, 'Vrsta', 5),
	(12, 'Vrsta materijal', 2),
	(7, 'Zemlja', 5);
/*!40000 ALTER TABLE `feature` ENABLE KEYS */;

DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cart_id` int unsigned NOT NULL DEFAULT '0',
  `status` enum('rejected','accepted','shipped','pending') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `uq_order_cart_id` (`cart_id`),
  CONSTRAINT `fk_order_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DELETE FROM `order`;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` (`order_id`, `created_at`, `cart_id`, `status`) VALUES
	(2, '2021-01-30 13:01:47', 2, 'shipped'),
	(6, '2021-02-01 08:27:42', 5, 'accepted'),
	(7, '2021-02-01 09:08:11', 6, 'pending'),
	(8, '2021-02-01 09:09:15', 7, 'pending'),
	(9, '2021-02-01 09:14:22', 8, 'pending'),
	(10, '2021-02-01 09:15:19', 9, 'rejected'),
	(11, '2021-02-04 10:02:45', 10, 'pending'),
	(12, '2021-02-06 17:22:48', 12, 'pending'),
	(13, '2021-02-06 17:25:14', 13, 'pending');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;

DROP TABLE IF EXISTS `photo`;
CREATE TABLE IF NOT EXISTS `photo` (
  `photo_id` int unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int unsigned NOT NULL DEFAULT '0',
  `image_path` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`photo_id`),
  UNIQUE KEY `uq_photo_image_path` (`image_path`),
  KEY `fk_photo_article_id` (`article_id`),
  CONSTRAINT `fk_photo_article_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DELETE FROM `photo`;
/*!40000 ALTER TABLE `photo` DISABLE KEYS */;
INSERT INTO `photo` (`photo_id`, `article_id`, `image_path`) VALUES
	(10, 2, '2021128-7545007921-slika2.jpg'),
	(12, 3, '202125-4285382312-nike1.jpg'),
	(13, 4, '202125-2488382656-nika111.jpg'),
	(14, 1, '202125-4195228660-majica1.jpg'),
	(15, 6, '202126-4485368128-cop.png'),
	(16, 7, '202126-7266244995-nikej1.jpg');
/*!40000 ALTER TABLE `photo` ENABLE KEYS */;

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '0',
  `password_hash` varchar(128) NOT NULL DEFAULT '0',
  `forename` varchar(64) NOT NULL DEFAULT '0',
  `surname` varchar(64) NOT NULL DEFAULT '0',
  `phone_number` varchar(24) NOT NULL DEFAULT '0',
  `postal_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `uq_user_email` (`email`),
  UNIQUE KEY `uq_user_phone_number` (`phone_number`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`user_id`, `email`, `password_hash`, `forename`, `surname`, `phone_number`, `postal_address`) VALUES
	(1, 'test@test.rs', '8D2F4D9C7F87141F0810F1ACD6C0462FF0319BB049AA88EA4E310649628091DE316CF1392E19AF4F0A327826545F63E4E969838F5E7D572A475DE3255B738ACA', 'Pera', 'Peric', '+38166999999', 'Neka adresa, Grad, Drzava'),
	(3, 'test123@test.rs', 'C70B5DD9EBFB6F51D09D4132B7170C9D20750A7852F00680F65658F0310E810056E6763C34C9A00B0E940076F54495C169FC2302CCEB312039271C43469507DC', 'Mladen', 'Cvetkovic', '+38164333333', 'Nova adresa, Grad, Drzava'),
	(7, 'proba@proba.rs', '12431BDAD0E857D5FE422755F8330FC1D2E08D6895AD0CAB8F7DC7ABB301D68DA584F22E5745B0E9F7F8D53505DC471512B5014BA200315F3618DEF0C59FB5B7', 'Proba', 'Test', '+381643333333', 'Nema probna adresa BB\n18000 Nis\nSrbija'),
	(8, 'niko@niko.niko', '78463991D9BDE6BD98C32A3F2264AB472AB65C62D1710CC16FB0C8A9459E16FC7DA8DA45DDDAA43283C4A6B1A91C1ACB55057B4A332AD1723B1E8DFE4B72A8CB', 'Niko', 'Nikic', '+381654455484', 'Nikova neka dresa je ovde'),
	(9, 'mladenvts@gmail.com', 'C7D101E4009A4F6CE7B99FDFB6AF4B86D9BD123E5C5C21BE9B0BD3425297D44A0650C105DEE7A19AC0FD0639009BBB607182EC10C34DC0A6E832B81F43A1EE74', 'Mladen', 'Cvetkovic', '+381645124578', 'Moja adresa BB,\n18000 Nis\nSrbija');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

DROP TABLE IF EXISTS `user_token`;
CREATE TABLE IF NOT EXISTS `user_token` (
  `user_token_id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` text COLLATE utf8_unicode_ci NOT NULL,
  `expires_at` datetime NOT NULL,
  `is_valid` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`user_token_id`),
  KEY `fk_user_token_user_id` (`user_id`),
  CONSTRAINT `fk_user_token_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DELETE FROM `user_token`;
/*!40000 ALTER TABLE `user_token` DISABLE KEYS */;
INSERT INTO `user_token` (`user_token_id`, `user_id`, `created_at`, `token`, `expires_at`, `is_valid`) VALUES
	(1, 1, '2021-02-01 18:14:11', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYxNDg3ODA1MS4zMjEsImlwIjoiOjoxIiwidWEiOiJQb3N0bWFuUnVudGltZS83LjI2LjEwIiwiaWF0IjoxNjEyMTk5NjUxfQ.jOXl5Ooq9ucogV28zwlQWBoz1KxSN422F2-vL9j_-yg', '2021-03-04 17:14:11', 1),
	(53, 7, '2021-02-05 10:04:12', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjo3LCJpZGVudGl0eSI6InByb2JhQHByb2JhLnJzIiwiZXhwIjoxNjE1MTk0MjUxLjk4OCwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84OC4wLjQzMjQuOTYgU2FmYXJpLzUzNy4zNiBFZGcvODguMC43MDUuNTYiLCJpYXQiOjE2MTI1MTU4NTF9.ujH1U6pKmYKFCBjcONX456D3h3rvqSkXBsqqGt-HKY0', '2021-03-08 09:04:11', 1),
	(54, 7, '2021-02-05 10:48:11', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjo3LCJpZGVudGl0eSI6InByb2JhQHByb2JhLnJzIiwiZXhwIjoxNjE1MTk2ODkxLjY5OSwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84OC4wLjQzMjQuOTYgU2FmYXJpLzUzNy4zNiBFZGcvODguMC43MDUuNTYiLCJpYXQiOjE2MTI1MTg0OTF9.d6mfF4z83yuMzaFnTSubBnDpW_GdKx3iYB4ug-LQdSg', '2021-03-08 09:48:11', 1),
	(55, 7, '2021-02-05 10:48:12', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjo3LCJpZGVudGl0eSI6InByb2JhQHByb2JhLnJzIiwiZXhwIjoxNjE1MTk2ODkyLjc3NSwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84OC4wLjQzMjQuOTYgU2FmYXJpLzUzNy4zNiBFZGcvODguMC43MDUuNTYiLCJpYXQiOjE2MTI1MTg0OTJ9.FiBAm9Uwu9oUx23aL5OkO2CTPAG1DP7QYlq1EUDItig', '2021-03-08 09:48:12', 1),
	(56, 7, '2021-02-05 10:48:13', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjo3LCJpZGVudGl0eSI6InByb2JhQHByb2JhLnJzIiwiZXhwIjoxNjE1MTk2ODkzLjM5OCwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84OC4wLjQzMjQuOTYgU2FmYXJpLzUzNy4zNiBFZGcvODguMC43MDUuNTYiLCJpYXQiOjE2MTI1MTg0OTN9.c_Kx-Lu6tHVYQSBFOySosMDf1QjoeXn4Crj0WFGre50', '2021-03-08 09:48:13', 1),
	(57, 7, '2021-02-05 10:48:13', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjo3LCJpZGVudGl0eSI6InByb2JhQHByb2JhLnJzIiwiZXhwIjoxNjE1MTk2ODkzLjg3LCJpcCI6Ijo6MSIsInVhIjoiTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgMTAuMDsgV2luNjQ7IHg2NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzg4LjAuNDMyNC45NiBTYWZhcmkvNTM3LjM2IEVkZy84OC4wLjcwNS41NiIsImlhdCI6MTYxMjUxODQ5M30.dYgXOK5fWq-bVcmNOPInuJCcrRt1FyxXGV9iG3hfU-4', '2021-03-08 09:48:13', 1),
	(58, 7, '2021-02-05 10:48:14', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjo3LCJpZGVudGl0eSI6InByb2JhQHByb2JhLnJzIiwiZXhwIjoxNjE1MTk2ODk0LjA1OCwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84OC4wLjQzMjQuOTYgU2FmYXJpLzUzNy4zNiBFZGcvODguMC43MDUuNTYiLCJpYXQiOjE2MTI1MTg0OTR9._oJNotpQkuwsRy35KcBVLXv5FXSnYzjifmmuW8sSXRA', '2021-03-08 09:48:14', 1),
	(59, 7, '2021-02-05 10:48:14', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjo3LCJpZGVudGl0eSI6InByb2JhQHByb2JhLnJzIiwiZXhwIjoxNjE1MTk2ODk0LjI1LCJpcCI6Ijo6MSIsInVhIjoiTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgMTAuMDsgV2luNjQ7IHg2NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzg4LjAuNDMyNC45NiBTYWZhcmkvNTM3LjM2IEVkZy84OC4wLjcwNS41NiIsImlhdCI6MTYxMjUxODQ5NH0.3wx_BMaLcFvT-74rbocGXw7V_eb1jHHmGRuGvXYlCN8', '2021-03-08 09:48:14', 1),
	(60, 7, '2021-02-05 10:48:28', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjo3LCJpZGVudGl0eSI6InByb2JhQHByb2JhLnJzIiwiZXhwIjoxNjE1MTk2OTA4LjA4MywiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84OC4wLjQzMjQuOTYgU2FmYXJpLzUzNy4zNiBFZGcvODguMC43MDUuNTYiLCJpYXQiOjE2MTI1MTg1MDh9.UN156YQDfRw0uUtqTnZIUiF2G86fj1Cwk1IWRTcy474', '2021-03-08 09:48:28', 1),
	(61, 7, '2021-02-05 10:48:35', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjo3LCJpZGVudGl0eSI6InByb2JhQHByb2JhLnJzIiwiZXhwIjoxNjE1MTk2OTE1LjIyLCJpcCI6Ijo6MSIsInVhIjoiTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgMTAuMDsgV2luNjQ7IHg2NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzg4LjAuNDMyNC45NiBTYWZhcmkvNTM3LjM2IEVkZy84OC4wLjcwNS41NiIsImlhdCI6MTYxMjUxODUxNX0.8Kbc0IeOfg7nDcY8l6YrYXaX6Q564EDEdWydgSbuGXc', '2021-03-08 09:48:35', 1),
	(62, 7, '2021-02-05 11:05:47', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjo3LCJpZGVudGl0eSI6InByb2JhQHByb2JhLnJzIiwiZXhwIjoxNjE1MTk3OTQ3LjUwMywiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84OC4wLjQzMjQuOTYgU2FmYXJpLzUzNy4zNiBFZGcvODguMC43MDUuNTYiLCJpYXQiOjE2MTI1MTk1NDd9.50EHwMrKVNRBkF9bL0cvEFc0x3q-XM6jiaCht4GZ18g', '2021-03-08 10:05:47', 1),
	(63, 7, '2021-02-05 11:14:28', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjo3LCJpZGVudGl0eSI6InByb2JhQHByb2JhLnJzIiwiZXhwIjoxNjE1MTk4NDY4LjgwNiwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84OC4wLjQzMjQuOTYgU2FmYXJpLzUzNy4zNiBFZGcvODguMC43MDUuNTYiLCJpYXQiOjE2MTI1MjAwNjh9.FRBVy3wU5M4PHThZQxQ7SzkJMf4vWBjk7Xwg88ZYHJM', '2021-03-08 10:14:28', 1),
	(64, 7, '2021-02-05 11:17:08', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjo3LCJpZGVudGl0eSI6InByb2JhQHByb2JhLnJzIiwiZXhwIjoxNjE1MTk4NjI4LjkyNywiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84OC4wLjQzMjQuOTYgU2FmYXJpLzUzNy4zNiBFZGcvODguMC43MDUuNTYiLCJpYXQiOjE2MTI1MjAyMjh9.TAg2Yk-y_EZxvmjFhn46d5FPXvZ9HTB8WBO14RCPldM', '2021-03-08 10:17:08', 1),
	(65, 1, '2021-02-05 11:53:07', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYxNTIwMDc4Ny45MzcsImlwIjoiOjoxIiwidWEiOiJQb3N0bWFuUnVudGltZS83LjI2LjEwIiwiaWF0IjoxNjEyNTIyMzg3fQ.tDEpR7rkxpcwNDiLhgcKcxh2E5mUcmtWAT4Sk7n7f_Y', '2021-03-08 10:53:07', 1),
	(66, 1, '2021-02-05 11:53:25', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYxNTIwMDgwNS4xMTUsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODguMC40MzI0Ljk2IFNhZmFyaS81MzcuMzYgRWRnLzg4LjAuNzA1LjU2IiwiaWF0IjoxNjEyNTIyNDA1fQ.pAbE2cxM0wiq_od3YInMH7Xletj96GBSGUQBPH0j-rg', '2021-03-08 10:53:25', 1),
	(67, 1, '2021-02-05 11:53:33', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYxNTIwMDgxMy44MDcsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODguMC40MzI0Ljk2IFNhZmFyaS81MzcuMzYgRWRnLzg4LjAuNzA1LjU2IiwiaWF0IjoxNjEyNTIyNDEzfQ.C7uMEm0GT1TXG9nr9X7xksx6IaPpIjFrxvC4mgtjMUI', '2021-03-08 10:53:33', 1),
	(68, 8, '2021-02-05 12:00:59', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjo4LCJpZGVudGl0eSI6Im5pa29Abmlrby5uaWtvIiwiZXhwIjoxNjE1MjAxMjU5LjI3NiwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84OC4wLjQzMjQuOTYgU2FmYXJpLzUzNy4zNiBFZGcvODguMC43MDUuNTYiLCJpYXQiOjE2MTI1MjI4NTl9.2CD-1NGh1n-9-iTO36DXACqgjM9XR47cxGeYfJfQhZw', '2021-03-08 11:00:59', 1),
	(69, 8, '2021-02-05 12:08:12', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjo4LCJpZGVudGl0eSI6Im5pa29Abmlrby5uaWtvIiwiZXhwIjoxNjE1MjAxNjkyLjkxNSwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84OC4wLjQzMjQuOTYgU2FmYXJpLzUzNy4zNiBFZGcvODguMC43MDUuNTYiLCJpYXQiOjE2MTI1MjMyOTJ9.3Aue6fuoIV-TYDPHzjc-zY_Od8EWEJo3fQQDPbKBPGA', '2021-03-08 11:08:12', 1),
	(70, 8, '2021-02-05 12:15:33', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjo4LCJpZGVudGl0eSI6Im5pa29Abmlrby5uaWtvIiwiZXhwIjoxNjE1MjAyMTMzLjksImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODguMC40MzI0Ljk2IFNhZmFyaS81MzcuMzYgRWRnLzg4LjAuNzA1LjU2IiwiaWF0IjoxNjEyNTIzNzMzfQ.yelgxaf31xNku6UiuT1tHdXj8ABhLrWMCuTYhp7R490', '2021-03-08 11:15:33', 1),
	(71, 7, '2021-02-05 12:36:05', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjo3LCJpZGVudGl0eSI6InByb2JhQHByb2JhLnJzIiwiZXhwIjoxNjE1MjAzMzY1LjE3OSwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84OC4wLjQzMjQuOTYgU2FmYXJpLzUzNy4zNiBFZGcvODguMC43MDUuNTYiLCJpYXQiOjE2MTI1MjQ5NjV9.ydiUqbV7e2my4GaQvcYLCYqh46u1ItP_RvoGYvJPVq0', '2021-03-08 11:36:05', 1),
	(72, 8, '2021-02-05 14:07:57', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjo4LCJpZGVudGl0eSI6Im5pa29Abmlrby5uaWtvIiwiZXhwIjoxNjE1MjA4ODc3LjkwNywiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84OC4wLjQzMjQuOTYgU2FmYXJpLzUzNy4zNiBFZGcvODguMC43MDUuNTYiLCJpYXQiOjE2MTI1MzA0Nzd9.rmgEG2qJJ5UJZ4kbcmrr3XtUs9qTaFJPKl3spFCaNnQ', '2021-03-08 13:07:57', 1),
	(73, 7, '2021-02-05 18:29:41', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjo3LCJpZGVudGl0eSI6InByb2JhQHByb2JhLnJzIiwiZXhwIjoxNjE1MjI0NTgxLjQwMywiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84OC4wLjQzMjQuOTYgU2FmYXJpLzUzNy4zNiBFZGcvODguMC43MDUuNTYiLCJpYXQiOjE2MTI1NDYxODF9.oAsFDAGNG7wntvMtNlEMrcyjuvXKFlV94DTf89E3w_w', '2021-03-08 17:29:41', 1),
	(74, 9, '2021-02-05 18:45:55', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjo5LCJpZGVudGl0eSI6Im1sYWRlbnZ0c0BnbWFpbC5jb20iLCJleHAiOjE2MTUyMjU1NTUuMjY1LCJpcCI6Ijo6MSIsInVhIjoiTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgMTAuMDsgV2luNjQ7IHg2NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzg4LjAuNDMyNC45NiBTYWZhcmkvNTM3LjM2IEVkZy84OC4wLjcwNS41NiIsImlhdCI6MTYxMjU0NzE1NX0.hPpBH0nz0RbDqetTaa9lgOKjDiIINwTC_qRNnph4NdY', '2021-03-08 17:45:55', 1),
	(75, 9, '2021-02-06 08:31:25', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjo5LCJpZGVudGl0eSI6Im1sYWRlbnZ0c0BnbWFpbC5jb20iLCJleHAiOjE2MTUyNzUwODUuMDc4LCJpcCI6Ijo6MSIsInVhIjoiTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgMTAuMDsgV2luNjQ7IHg2NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzg4LjAuNDMyNC4xNTAgU2FmYXJpLzUzNy4zNiBFZGcvODguMC43MDUuNjMiLCJpYXQiOjE2MTI1OTY2ODV9.ajyR1-JaCAcZ-945CtuKyqXEuNIULFKhl2FOdtfXjUI', '2021-03-09 07:31:25', 1),
	(76, 9, '2021-02-06 08:35:33', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjo5LCJpZGVudGl0eSI6Im1sYWRlbnZ0c0BnbWFpbC5jb20iLCJleHAiOjE2MTUyNzUzMzMuODUsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODguMC40MzI0LjE1MCBTYWZhcmkvNTM3LjM2IEVkZy84OC4wLjcwNS42MyIsImlhdCI6MTYxMjU5NjkzM30.E5E4pRihMlK-PheSVNafilI7ceqxj6Jf_ccovciEetk', '2021-03-09 07:35:33', 1),
	(77, 1, '2021-02-06 10:06:59', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYxNTI4MDgxOS44ODUsImlwIjoiOjoxIiwidWEiOiJQb3N0bWFuUnVudGltZS83LjI2LjEwIiwiaWF0IjoxNjEyNjAyNDE5fQ.Tlmq3IzXQF9z_edUDlahU3XEHK1b6UmHYQ_M0nHI1NE', '2021-03-09 09:06:59', 1),
	(78, 9, '2021-02-06 12:05:13', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjo5LCJpZGVudGl0eSI6Im1sYWRlbnZ0c0BnbWFpbC5jb20iLCJleHAiOjE2MTUyODc5MTMuNzAxLCJpcCI6Ijo6MSIsInVhIjoiTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgMTAuMDsgV2luNjQ7IHg2NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzg4LjAuNDMyNC4xNTAgU2FmYXJpLzUzNy4zNiBFZGcvODguMC43MDUuNjMiLCJpYXQiOjE2MTI2MDk1MTN9.acJ-tmJHYV6TwZy389b_n5yO3ckpJdn9b3dnCIQcOco', '2021-03-09 11:05:13', 1),
	(79, 9, '2021-02-06 18:30:43', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjo5LCJpZGVudGl0eSI6Im1sYWRlbnZ0c0BnbWFpbC5jb20iLCJleHAiOjE2MTUzMTEwNDMuMjksImlwIjoiOjpmZmZmOjEyNy4wLjAuMSIsInVhIjoiTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgMTAuMDsgV2luNjQ7IHg2NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzg4LjAuNDMyNC4xNTAgU2FmYXJpLzUzNy4zNiBFZGcvODguMC43MDUuNjMiLCJpYXQiOjE2MTI2MzI2NDN9.G6s1IoQeJyoh1Oc8LULbSg1VjetLVpUFxCjz4hukok4', '2021-03-09 17:30:43', 1),
	(80, 9, '2021-02-06 18:46:22', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjo5LCJpZGVudGl0eSI6Im1sYWRlbnZ0c0BnbWFpbC5jb20iLCJleHAiOjE2MTUzMTE5ODIuMzA0LCJpcCI6Ijo6MSIsInVhIjoiTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgMTAuMDsgV2luNjQ7IHg2NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzg4LjAuNDMyNC4xNTAgU2FmYXJpLzUzNy4zNiBFZGcvODguMC43MDUuNjMiLCJpYXQiOjE2MTI2MzM1ODJ9.CLxhIiknP7oGjTFk5Uy8eiOLSpaAFZFtveMA7DtkzSw', '2021-03-09 17:46:22', 1),
	(81, 9, '2021-02-06 19:01:45', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjo5LCJpZGVudGl0eSI6Im1sYWRlbnZ0c0BnbWFpbC5jb20iLCJleHAiOjE2MTUzMTI5MDUuMjEsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODguMC40MzI0LjE1MCBTYWZhcmkvNTM3LjM2IEVkZy84OC4wLjcwNS42MyIsImlhdCI6MTYxMjYzNDUwNX0.Jeol46YGyv2_RL64UbKuVl0AjL3tJnFO8LRDftx1kyA', '2021-03-09 18:01:45', 1);
/*!40000 ALTER TABLE `user_token` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
