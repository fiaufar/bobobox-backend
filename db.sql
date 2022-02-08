-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.11-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for bobobox_assignment
CREATE DATABASE IF NOT EXISTS `bobobox_assignment` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `bobobox_assignment`;

-- Dumping structure for table bobobox_assignment.hotels
CREATE TABLE IF NOT EXISTS `hotels` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `hotel_name` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_hotels_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bobobox_assignment.hotels: ~3 rows (approximately)
/*!40000 ALTER TABLE `hotels` DISABLE KEYS */;
INSERT INTO `hotels` (`id`, `hotel_name`, `address`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Hotel Pratama', 'Jl. Pratama', NULL, NULL, NULL);
INSERT INTO `hotels` (`id`, `hotel_name`, `address`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(2, 'Hotel Dwi', 'Jl. Dwi', NULL, NULL, NULL);
INSERT INTO `hotels` (`id`, `hotel_name`, `address`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(3, 'Hotel Tri', 'Jl. Tri', NULL, NULL, NULL);
/*!40000 ALTER TABLE `hotels` ENABLE KEYS */;

-- Dumping structure for table bobobox_assignment.prices
CREATE TABLE IF NOT EXISTS `prices` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `room_type_id` bigint(20) NOT NULL,
  `price` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_price_room_type` (`room_type_id`),
  KEY `idx_prices_deleted_at` (`deleted_at`),
  CONSTRAINT `FK_price_room_type` FOREIGN KEY (`room_type_id`) REFERENCES `room_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bobobox_assignment.prices: ~6 rows (approximately)
/*!40000 ALTER TABLE `prices` DISABLE KEYS */;
INSERT INTO `prices` (`id`, `date`, `room_type_id`, `price`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, '2021-01-10', 1, 100000, NULL, NULL, NULL);
INSERT INTO `prices` (`id`, `date`, `room_type_id`, `price`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(2, '2021-01-10', 2, 120000, NULL, NULL, NULL);
INSERT INTO `prices` (`id`, `date`, `room_type_id`, `price`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(3, '2021-01-10', 3, 130000, NULL, NULL, NULL);
INSERT INTO `prices` (`id`, `date`, `room_type_id`, `price`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(4, '2021-01-11', 1, 110000, NULL, NULL, NULL);
INSERT INTO `prices` (`id`, `date`, `room_type_id`, `price`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(5, '2021-01-11', 2, 122000, NULL, NULL, NULL);
INSERT INTO `prices` (`id`, `date`, `room_type_id`, `price`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(6, '2021-01-11', 3, 133000, NULL, NULL, NULL);
/*!40000 ALTER TABLE `prices` ENABLE KEYS */;

-- Dumping structure for table bobobox_assignment.promos
CREATE TABLE IF NOT EXISTS `promos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `percentage` int(11) DEFAULT NULL,
  `currency` int(11) DEFAULT NULL,
  `minimum_night` int(11) DEFAULT NULL,
  `minimum_room` int(11) DEFAULT NULL,
  `promo_quota` int(11) DEFAULT NULL,
  `checkin_day` varchar(255) DEFAULT NULL,
  `booking_day` varchar(255) DEFAULT NULL,
  `booking_hour_start` varchar(255) DEFAULT NULL,
  `booking_hour_end` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_promos_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bobobox_assignment.promos: ~1 rows (approximately)
/*!40000 ALTER TABLE `promos` DISABLE KEYS */;
INSERT INTO `promos` (`id`, `created_at`, `updated_at`, `deleted_at`, `percentage`, `currency`, `minimum_night`, `minimum_room`, `promo_quota`, `checkin_day`, `booking_day`, `booking_hour_start`, `booking_hour_end`) VALUES
	(1, NULL, NULL, NULL, 70, 0, 1, 1, 2, 'Friday, Saturday, Monday', 'Tuesday, Wednesday', '7', '15');
/*!40000 ALTER TABLE `promos` ENABLE KEYS */;

-- Dumping structure for table bobobox_assignment.reservations
CREATE TABLE IF NOT EXISTS `reservations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL,
  `customer_name` varchar(50) DEFAULT NULL,
  `booked_room_count` int(11) DEFAULT NULL,
  `checkin_date` date NOT NULL,
  `checkout_date` date NOT NULL,
  `hotel_id` bigint(20) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_reservation_hotel` (`hotel_id`),
  KEY `idx_reservations_deleted_at` (`deleted_at`),
  CONSTRAINT `FK_reservation_hotel` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bobobox_assignment.reservations: ~2 rows (approximately)
/*!40000 ALTER TABLE `reservations` DISABLE KEYS */;
INSERT INTO `reservations` (`id`, `order_id`, `customer_name`, `booked_room_count`, `checkin_date`, `checkout_date`, `hotel_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(3, 1, 'Ahmad', 1, '2021-01-10', '2021-01-11', 2, NULL, NULL, NULL);
INSERT INTO `reservations` (`id`, `order_id`, `customer_name`, `booked_room_count`, `checkin_date`, `checkout_date`, `hotel_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(9, 1, 'Budi', 2, '2021-01-10', '2021-01-11', 3, NULL, NULL, NULL);
/*!40000 ALTER TABLE `reservations` ENABLE KEYS */;

-- Dumping structure for table bobobox_assignment.rooms
CREATE TABLE IF NOT EXISTS `rooms` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `hotel_id` bigint(20) NOT NULL,
  `room_type_id` bigint(20) NOT NULL,
  `room_number` int(11) DEFAULT NULL,
  `room_status` enum('available','out of service') DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_room_hotel` (`hotel_id`),
  KEY `FK_room_room_type` (`room_type_id`),
  KEY `idx_rooms_deleted_at` (`deleted_at`),
  CONSTRAINT `FK_room_hotel` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_room_room_type` FOREIGN KEY (`room_type_id`) REFERENCES `room_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bobobox_assignment.rooms: ~5 rows (approximately)
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` (`id`, `hotel_id`, `room_type_id`, `room_number`, `room_status`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 1, 1, 400, 'available', NULL, NULL, NULL);
INSERT INTO `rooms` (`id`, `hotel_id`, `room_type_id`, `room_number`, `room_status`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(2, 1, 2, 500, 'available', NULL, NULL, NULL);
INSERT INTO `rooms` (`id`, `hotel_id`, `room_type_id`, `room_number`, `room_status`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(3, 1, 3, 600, 'out of service', NULL, NULL, NULL);
INSERT INTO `rooms` (`id`, `hotel_id`, `room_type_id`, `room_number`, `room_status`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(4, 2, 1, 410, 'available', NULL, NULL, NULL);
INSERT INTO `rooms` (`id`, `hotel_id`, `room_type_id`, `room_number`, `room_status`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(5, 3, 3, 620, 'available', NULL, NULL, NULL);
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;

-- Dumping structure for table bobobox_assignment.room_types
CREATE TABLE IF NOT EXISTS `room_types` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_room_types_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bobobox_assignment.room_types: ~3 rows (approximately)
/*!40000 ALTER TABLE `room_types` DISABLE KEYS */;
INSERT INTO `room_types` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Room Type 1', NULL, NULL, NULL);
INSERT INTO `room_types` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(2, 'Room Type 2', NULL, NULL, NULL);
INSERT INTO `room_types` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(3, 'Room Type 3', NULL, NULL, NULL);
/*!40000 ALTER TABLE `room_types` ENABLE KEYS */;

-- Dumping structure for table bobobox_assignment.stays
CREATE TABLE IF NOT EXISTS `stays` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `reservation_id` bigint(20) NOT NULL,
  `guest_name` varchar(50) DEFAULT NULL,
  `room_id` bigint(20) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_stay_reservation` (`reservation_id`),
  KEY `FK_stay_room` (`room_id`),
  KEY `idx_stays_deleted_at` (`deleted_at`),
  CONSTRAINT `FK_stay_reservation` FOREIGN KEY (`reservation_id`) REFERENCES `reservations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_stay_room` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bobobox_assignment.stays: ~1 rows (approximately)
/*!40000 ALTER TABLE `stays` DISABLE KEYS */;
INSERT INTO `stays` (`id`, `reservation_id`, `guest_name`, `room_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 3, 'Ahmad', 3, NULL, NULL, NULL);
/*!40000 ALTER TABLE `stays` ENABLE KEYS */;

-- Dumping structure for table bobobox_assignment.stay_rooms
CREATE TABLE IF NOT EXISTS `stay_rooms` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `stay_id` bigint(20) NOT NULL,
  `room_id` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_stay_room_stay` (`stay_id`),
  KEY `FK_stay_room_room` (`room_id`),
  KEY `idx_stay_rooms_deleted_at` (`deleted_at`),
  CONSTRAINT `FK_stay_room_room` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_stay_room_stay` FOREIGN KEY (`stay_id`) REFERENCES `stays` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bobobox_assignment.stay_rooms: ~0 rows (approximately)
/*!40000 ALTER TABLE `stay_rooms` DISABLE KEYS */;
/*!40000 ALTER TABLE `stay_rooms` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
