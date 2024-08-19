/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.7.33 : Database - sslz_erp
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `inventory_details` */

DROP TABLE IF EXISTS `inventory_details`;

CREATE TABLE `inventory_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `hr_unit_id` int(10) unsigned DEFAULT NULL,
  `category_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `warehouse_id` bigint(20) unsigned NOT NULL,
  `unit_price` double NOT NULL DEFAULT '0',
  `qty` double NOT NULL DEFAULT '0',
  `total_price` double NOT NULL DEFAULT '0',
  `status` enum('active','inactive','cancel') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `inventory_details_created_by_foreign` (`created_by`),
  KEY `inventory_details_updated_by_foreign` (`updated_by`),
  KEY `inventory_details_category_id_foreign` (`category_id`),
  KEY `inventory_details_product_id_foreign` (`product_id`),
  KEY `inventory_details_warehouse_id_foreign` (`warehouse_id`),
  KEY `inventory_details_hr_unit_id_foreign` (`hr_unit_id`),
  CONSTRAINT `inventory_details_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `inventory_details_hr_unit_id_foreign` FOREIGN KEY (`hr_unit_id`) REFERENCES `hr_unit` (`hr_unit_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `inventory_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `inventory_details_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `inventory_logs` */

DROP TABLE IF EXISTS `inventory_logs`;

CREATE TABLE `inventory_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `hr_unit_id` int(10) unsigned DEFAULT NULL,
  `category_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `warehouse_id` bigint(20) unsigned NOT NULL,
  `unit_price` double NOT NULL DEFAULT '0',
  `qty` double NOT NULL DEFAULT '0',
  `total_price` double NOT NULL DEFAULT '0',
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive','cancel') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `type` enum('in','out','adjusment') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `inventory_logs_created_by_foreign` (`created_by`),
  KEY `inventory_logs_updated_by_foreign` (`updated_by`),
  KEY `inventory_logs_hr_unit_id_foreign` (`hr_unit_id`),
  KEY `inventory_logs_category_id_foreign` (`category_id`),
  KEY `inventory_logs_product_id_foreign` (`product_id`),
  KEY `inventory_logs_warehouse_id_foreign` (`warehouse_id`),
  CONSTRAINT `inventory_logs_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `inventory_logs_hr_unit_id_foreign` FOREIGN KEY (`hr_unit_id`) REFERENCES `hr_unit` (`hr_unit_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `inventory_logs_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `inventory_logs_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `inventory_summaries` */

DROP TABLE IF EXISTS `inventory_summaries`;

CREATE TABLE `inventory_summaries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `unit_price` double NOT NULL DEFAULT '0',
  `qty` double NOT NULL DEFAULT '0',
  `total_price` double NOT NULL DEFAULT '0',
  `status` enum('active','inactive','cancel') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `buffer_inventory` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `inventory_summeries_created_by_foreign` (`created_by`),
  KEY `inventory_summeries_updated_by_foreign` (`updated_by`),
  KEY `inventory_summeries_category_id_foreign` (`category_id`),
  KEY `inventory_summeries_product_id_foreign` (`product_id`),
  CONSTRAINT `inventory_summaries_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `inventory_summaries_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
