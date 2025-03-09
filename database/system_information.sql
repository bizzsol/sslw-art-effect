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
/*Table structure for table `system_information` */

DROP TABLE IF EXISTS `system_information`;

CREATE TABLE `system_information` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `organization` text COLLATE utf8mb4_unicode_ci,
  `name` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `phone` text COLLATE utf8mb4_unicode_ci,
  `mobile` text COLLATE utf8mb4_unicode_ci,
  `address` text COLLATE utf8mb4_unicode_ci,
  `email` text COLLATE utf8mb4_unicode_ci,
  `website` text COLLATE utf8mb4_unicode_ci,
  `twitter` text COLLATE utf8mb4_unicode_ci,
  `facebook` text COLLATE utf8mb4_unicode_ci,
  `instagram` text COLLATE utf8mb4_unicode_ci,
  `skype` text COLLATE utf8mb4_unicode_ci,
  `linked_in` text COLLATE utf8mb4_unicode_ci,
  `resend_limit` int(11) NOT NULL DEFAULT '0',
  `logo` text COLLATE utf8mb4_unicode_ci,
  `secondary_logo` text COLLATE utf8mb4_unicode_ci,
  `icon` text COLLATE utf8mb4_unicode_ci,
  `pad` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `system_information` */

insert  into `system_information`(`id`,`organization`,`name`,`description`,`phone`,`mobile`,`address`,`email`,`website`,`twitter`,`facebook`,`instagram`,`skype`,`linked_in`,`resend_limit`,`logo`,`secondary_logo`,`icon`,`pad`,`created_at`,`updated_at`) values (1,'Bizz Solutions PLC','BizzPack','<a href=\"https://bizzsol.com.bd/\">Bizz Solutions PLC</a>',NULL,NULL,NULL,'info@bizzsol.com.bd',NULL,NULL,NULL,NULL,NULL,NULL,0,'upload/system-images/logos/2024/02/13/299130224102420.png','upload/system-images/secondary-logos/2024/02/13/122130224102420.png','upload/system-images/icons/2024/02/12/967120224102133.png','upload/system-images/pads/2024/02/13/997130224102420.png',NULL,'2024-02-13 10:24:20');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
