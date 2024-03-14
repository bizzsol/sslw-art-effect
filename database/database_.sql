/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.7.33 : Database - yb_customer_areas
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `activity_log` */

DROP TABLE IF EXISTS `activity_log`;

CREATE TABLE `activity_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `log_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` bigint(20) unsigned DEFAULT NULL,
  `causer_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` bigint(20) unsigned DEFAULT NULL,
  `properties` json DEFAULT NULL,
  `batch_uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subject` (`subject_type`,`subject_id`),
  KEY `causer` (`causer_type`,`causer_id`),
  KEY `activity_log_log_name_index` (`log_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `activity_log` */

insert  into `activity_log`(`id`,`log_name`,`description`,`subject_type`,`event`,`subject_id`,`causer_type`,`causer_id`,`properties`,`batch_uuid`,`created_at`,`updated_at`) values (1,'default','updated','App\\Models\\User','updated',1,'App\\Models\\User',1,'{\"old\": {\"name\": \"Omar Farook\", \"text\": null}, \"attributes\": {\"name\": \"Omar Farook\", \"text\": null}}',NULL,'2024-01-18 18:13:56','2024-01-18 18:13:56'),(2,'default','updated','App\\Models\\User','updated',1,'App\\Models\\User',1,'{\"old\": {\"name\": \"Omar Farook\", \"text\": null}, \"attributes\": {\"name\": \"Omar Farook\", \"text\": null}}',NULL,'2024-01-18 18:17:58','2024-01-18 18:17:58'),(3,'default','updated','App\\Models\\User','updated',1,'App\\Models\\User',1,'{\"old\": {\"name\": \"Omar Farook\", \"text\": null}, \"attributes\": {\"name\": \"Omar Farook\", \"text\": null}}',NULL,'2024-01-18 18:53:28','2024-01-18 18:53:28'),(4,'default','updated','App\\Models\\User','updated',1,'App\\Models\\User',1,'{\"old\": {\"name\": \"Omar Farook\", \"text\": null}, \"attributes\": {\"name\": \"Omar Farook\", \"text\": null}}',NULL,'2024-01-18 18:58:37','2024-01-18 18:58:37');

/*Table structure for table `business_information` */

DROP TABLE IF EXISTS `business_information`;

CREATE TABLE `business_information` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `contact_person` text COLLATE utf8mb4_unicode_ci,
  `position` text COLLATE utf8mb4_unicode_ci,
  `phone` text COLLATE utf8mb4_unicode_ci,
  `cell` text COLLATE utf8mb4_unicode_ci,
  `whatsapp` text COLLATE utf8mb4_unicode_ci,
  `email` text COLLATE utf8mb4_unicode_ci,
  `address` text COLLATE utf8mb4_unicode_ci,
  `zip` text COLLATE utf8mb4_unicode_ci,
  `business_structure` enum('sole-proprietor','partnership','LLC','c-corp','s-corp','non-profit') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sole-proprietor',
  `tax_filling_status` enum('individual','partnership','corporation') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'individual',
  `tax_id` text COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `business_information_user_id_foreign` (`user_id`),
  CONSTRAINT `business_information_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `business_information` */

insert  into `business_information`(`id`,`user_id`,`name`,`contact_person`,`position`,`phone`,`cell`,`whatsapp`,`email`,`address`,`zip`,`business_structure`,`tax_filling_status`,`tax_id`,`deleted_at`,`created_at`,`updated_at`) values (2,6,'Athena Holder','Explicabo Rerum sae','Harum natus tempor b','+1 (601) 618-6586','Explicabo Tempor re','Deserunt ex aut lore','powovu@mailinator.com','Quis est obcaecati','98544','c-corp','partnership','Laborum eos ad esse',NULL,'2024-01-30 15:58:20','2024-01-30 15:58:20'),(3,8,'Beverly Hebert','Nihil aliqua Modi u','In lorem accusamus e','+1 (738) 412-1749','Soluta aliquid dicta','Officiis est alias a','sityhylyk@mailinator.com','Ipsum laboris esse','29905','partnership','individual','Voluptatum velit fu',NULL,'2024-01-31 03:08:03','2024-01-31 03:08:03');

/*Table structure for table `document_types` */

DROP TABLE IF EXISTS `document_types`;

CREATE TABLE `document_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` longtext COLLATE utf8mb4_unicode_ci,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci DEFAULT 'active',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `document_types_created_by_foreign` (`created_by`),
  KEY `document_types_updated_by_foreign` (`updated_by`),
  CONSTRAINT `document_types_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `document_types_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `document_types` */

insert  into `document_types`(`id`,`title`,`slug`,`status`,`created_by`,`updated_by`,`created_at`,`updated_at`) values (1,'{\"en\":\"Income Statement\",\"es\":\"Income Statement\"}','9e1317d9f21dba59','active',1,1,'2024-01-23 16:31:57','2024-01-26 09:42:52'),(2,'{\"en\":\"EIN Letter\",\"es\":\"EIN Letter\"}','583f7d58c10c58a9','active',1,1,'2024-01-23 16:32:26','2024-01-26 09:42:40');

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `language_libraries` */

DROP TABLE IF EXISTS `language_libraries`;

CREATE TABLE `language_libraries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `language_id` bigint(20) unsigned NOT NULL,
  `slug` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `translation` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `language_libraries_language_id_foreign` (`language_id`),
  KEY `language_libraries_created_by_foreign` (`created_by`),
  KEY `language_libraries_updated_by_foreign` (`updated_by`),
  CONSTRAINT `language_libraries_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `language_libraries_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `language_libraries_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=361 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `language_libraries` */

insert  into `language_libraries`(`id`,`language_id`,`slug`,`translation`,`created_by`,`updated_by`,`deleted_at`,`created_at`,`updated_at`) values (11,1,'Name','Name',1,1,NULL,'2024-01-26 10:00:18','2024-01-26 10:10:12'),(12,2,'Name','Name',1,1,NULL,'2024-01-26 10:00:18','2024-01-30 14:37:41'),(13,1,'English','English',1,NULL,NULL,'2024-01-26 10:11:03','2024-01-26 10:11:03'),(14,2,'English','Inglesa',1,NULL,NULL,'2024-01-26 10:11:03','2024-01-26 10:11:03'),(15,1,'Spanish','Spanish',1,NULL,NULL,'2024-01-26 10:11:26','2024-01-26 10:11:26'),(16,2,'Spanish','Española',1,NULL,NULL,'2024-01-26 10:11:26','2024-01-26 10:11:26'),(17,1,'LogIn','Log In',1,NULL,NULL,'2024-01-27 08:54:59','2024-01-27 08:54:59'),(18,2,'LogIn','Acceso',1,NULL,NULL,'2024-01-27 08:54:59','2024-01-27 08:54:59'),(19,1,'SignIn','Sign In',1,1,NULL,'2024-01-27 08:55:46','2024-01-27 09:12:02'),(20,2,'SignIn','Iniciar sesión',1,NULL,NULL,'2024-01-27 08:55:46','2024-01-27 08:55:46'),(21,1,'LogInSubtext','Enter your email address and password to access admin panel',1,NULL,NULL,'2024-01-27 08:56:59','2024-01-27 08:56:59'),(22,2,'LogInSubtext','Ingrese su dirección de correo electrónico y contraseña para acceder al panel de administración',1,NULL,NULL,'2024-01-27 08:56:59','2024-01-27 08:56:59'),(23,1,'Email address','Email Address',1,NULL,NULL,'2024-01-27 08:57:39','2024-01-27 08:57:39'),(24,2,'Email address','Email Address',1,NULL,NULL,'2024-01-27 08:57:39','2024-01-30 14:37:42'),(25,1,'ForgotYourPassword?','Forgot your password?',1,NULL,NULL,'2024-01-27 08:58:41','2024-01-27 08:58:41'),(26,2,'ForgotYourPassword?','Olvidaste tu contraseña ?',1,NULL,NULL,'2024-01-27 08:58:41','2024-01-27 08:58:41'),(27,1,'RememberMe','Remember me',1,NULL,NULL,'2024-01-27 08:59:26','2024-01-27 08:59:26'),(28,2,'RememberMe','Acuérdate de mí',1,NULL,NULL,'2024-01-27 08:59:26','2024-01-27 08:59:26'),(29,1,'Don\'tHaveAnAccount?','Don\'t have an account?',1,NULL,NULL,'2024-01-27 09:00:30','2024-01-27 09:00:30'),(30,2,'Don\'tHaveAnAccount?','No tienes una cuenta ?',1,NULL,NULL,'2024-01-27 09:00:30','2024-01-27 09:00:30'),(31,1,'DesignAndDevelopedBy','Design and developed by',1,NULL,NULL,'2024-01-27 09:01:06','2024-01-27 09:01:06'),(32,2,'DesignAndDevelopedBy','Diseñado y desarrollado por',1,NULL,NULL,'2024-01-27 09:01:06','2024-01-27 09:01:06'),(33,1,'NAVIGATION','NAVIGATION',1,NULL,NULL,'2024-01-27 09:17:16','2024-01-27 09:17:16'),(34,2,'NAVIGATION','NAVEGACIÓN',1,NULL,NULL,'2024-01-27 09:17:16','2024-01-27 09:17:16'),(35,1,'Notification','Notification',1,NULL,NULL,'2024-01-27 09:24:47','2024-01-27 09:24:47'),(36,2,'Notification','Notificación',1,NULL,NULL,'2024-01-27 09:24:47','2024-01-27 09:24:47'),(37,1,'Clear All','Clear All',1,NULL,NULL,'2024-01-27 09:25:09','2024-01-27 09:25:09'),(38,2,'Clear All','Limpiar todo',1,NULL,NULL,'2024-01-27 09:25:09','2024-01-27 09:25:09'),(39,1,'View All','View All',1,NULL,NULL,'2024-01-27 09:25:35','2024-01-27 09:25:35'),(40,2,'View All','Ver todo',1,NULL,NULL,'2024-01-27 09:25:35','2024-01-27 09:25:35'),(41,1,'Welcome','Welcome',1,NULL,NULL,'2024-01-27 09:26:08','2024-01-27 09:26:08'),(42,2,'Welcome','Bienvenida',1,NULL,NULL,'2024-01-27 09:26:08','2024-01-27 09:26:08'),(43,1,'My Account','My Account',1,NULL,NULL,'2024-01-27 09:33:25','2024-01-27 09:33:25'),(44,2,'My Account','Mi cuenta',1,NULL,NULL,'2024-01-27 09:33:25','2024-01-27 09:33:25'),(45,1,'Logout','Logout',1,NULL,NULL,'2024-01-27 09:33:50','2024-01-27 09:33:50'),(46,2,'Logout','Cerrar sesión',1,NULL,NULL,'2024-01-27 09:33:50','2024-01-27 09:33:50'),(47,1,'About','About',1,NULL,NULL,'2024-01-27 09:34:45','2024-01-27 09:34:45'),(48,2,'About','Acerca de',1,NULL,NULL,'2024-01-27 09:34:45','2024-01-27 09:34:45'),(49,1,'Support','Support',1,NULL,NULL,'2024-01-27 09:35:04','2024-01-27 09:35:04'),(50,2,'Support','Apoyo',1,NULL,NULL,'2024-01-27 09:35:04','2024-01-27 09:35:04'),(51,1,'Contact Us','Contact Us',1,NULL,NULL,'2024-01-27 09:35:29','2024-01-27 09:35:29'),(52,2,'Contact Us','Contacta con nosotras',1,NULL,NULL,'2024-01-27 09:35:29','2024-01-27 09:35:29'),(53,1,'No Menu Data Found','No Menu Data Found',1,NULL,NULL,'2024-01-27 09:37:09','2024-01-27 09:37:09'),(54,2,'No Menu Data Found','No se encontraron datos del menú',1,NULL,NULL,'2024-01-27 09:37:09','2024-01-27 09:37:09'),(55,1,'ACL','ACL',1,NULL,NULL,'2024-01-27 09:37:32','2024-01-27 09:37:32'),(56,2,'ACL','ACL',1,NULL,NULL,'2024-01-27 09:37:32','2024-01-27 09:37:32'),(57,1,'Permission','Permission',1,NULL,NULL,'2024-01-27 09:37:54','2024-01-27 09:37:54'),(58,2,'Permission','Permission',1,NULL,NULL,'2024-01-27 09:37:54','2024-01-30 14:37:41'),(59,1,'Roles','Roles',1,NULL,NULL,'2024-01-27 09:38:18','2024-01-27 09:38:18'),(60,2,'Roles','Roles',1,NULL,NULL,'2024-01-27 09:38:18','2024-01-27 09:38:18'),(61,1,'Menu','Menu',1,NULL,NULL,'2024-01-27 09:38:37','2024-01-27 09:38:37'),(62,2,'Menu','Menu',1,NULL,NULL,'2024-01-27 09:38:37','2024-01-30 14:37:41'),(63,1,'Users','Users',1,NULL,NULL,'2024-01-27 09:39:00','2024-01-27 09:39:00'),(64,2,'Users','Usuarios',1,NULL,NULL,'2024-01-27 09:39:00','2024-01-27 09:39:00'),(65,1,'Settings','Settings',1,NULL,NULL,'2024-01-27 09:39:31','2024-01-27 09:39:31'),(66,2,'Settings','Ajustes',1,NULL,NULL,'2024-01-27 09:39:31','2024-01-27 09:39:31'),(67,1,'Website','Website',1,NULL,NULL,'2024-01-27 09:39:54','2024-01-27 09:39:54'),(68,2,'Website','Website',1,NULL,NULL,'2024-01-27 09:39:54','2024-01-30 14:37:42'),(69,1,'Social Media','Social Media',1,NULL,NULL,'2024-01-27 09:40:40','2024-01-27 09:40:40'),(70,2,'Social Media','Medios de comunicación social',1,NULL,NULL,'2024-01-27 09:40:40','2024-01-27 09:40:40'),(71,1,'Wallet Connect','Wallet Connect',1,NULL,NULL,'2024-01-27 09:41:08','2024-01-27 09:41:08'),(72,2,'Wallet Connect','Conexión de billetera',1,NULL,NULL,'2024-01-27 09:41:08','2024-01-27 09:41:08'),(73,1,'Mail Credential','Mail Credential',1,NULL,NULL,'2024-01-27 09:41:39','2024-01-27 09:41:39'),(74,2,'Mail Credential','Credencial de correo',1,NULL,NULL,'2024-01-27 09:41:39','2024-01-27 09:41:39'),(75,1,'CMS','CMS',1,NULL,NULL,'2024-01-27 09:41:58','2024-01-27 09:41:58'),(76,2,'CMS','CMS',1,NULL,NULL,'2024-01-27 09:41:58','2024-01-27 09:41:58'),(77,1,'Services','Services',1,NULL,NULL,'2024-01-27 09:42:18','2024-01-27 09:42:18'),(78,2,'Services','Servicios',1,NULL,NULL,'2024-01-27 09:42:18','2024-01-27 09:42:18'),(79,1,'Document Types','Document Types',1,NULL,NULL,'2024-01-27 09:42:42','2024-01-27 09:42:42'),(80,2,'Document Types','Document Types',1,NULL,NULL,'2024-01-27 09:42:42','2024-01-30 14:37:42'),(81,1,'Plans','Plans',1,NULL,NULL,'2024-01-27 09:43:01','2024-01-27 09:43:01'),(82,2,'Plans','Planes',1,NULL,NULL,'2024-01-27 09:43:01','2024-01-27 09:43:01'),(83,1,'Subscribers','Subscribers',1,NULL,NULL,'2024-01-27 09:46:43','2024-01-27 09:46:43'),(84,2,'Subscribers','Suscriptoras',1,NULL,NULL,'2024-01-27 09:46:43','2024-01-27 09:46:43'),(85,1,'Plan Payments','Plan Payments',1,NULL,NULL,'2024-01-27 09:47:06','2024-01-27 09:47:06'),(86,2,'Plan Payments','Pagos del plan',1,NULL,NULL,'2024-01-27 09:47:06','2024-01-27 09:47:06'),(87,1,'Reports','Reports',1,NULL,NULL,'2024-01-27 09:47:31','2024-01-27 09:47:31'),(88,2,'Reports','Reports',1,NULL,NULL,'2024-01-27 09:47:31','2024-01-30 14:37:42'),(89,1,'Add New','Add New',1,NULL,NULL,'2024-01-27 10:06:36','2024-01-27 10:06:36'),(90,2,'Add New','Agregar nueva',1,NULL,NULL,'2024-01-27 10:06:36','2024-01-27 10:06:36'),(91,1,'Module','Module',1,NULL,NULL,'2024-01-27 10:07:59','2024-01-27 10:07:59'),(92,2,'Module','Módulo',1,NULL,NULL,'2024-01-27 10:07:59','2024-01-27 10:07:59'),(93,1,'Close','Close',1,NULL,NULL,'2024-01-27 10:09:09','2024-01-27 10:09:09'),(94,2,'Close','Cerca',1,NULL,NULL,'2024-01-27 10:09:09','2024-01-27 10:09:09'),(95,1,'Role with allowed Permission','Role with allowed Permission',1,NULL,NULL,'2024-01-27 10:10:51','2024-01-27 10:10:51'),(96,2,'Role with allowed Permission','Rol con permiso permitido',1,NULL,NULL,'2024-01-27 10:10:51','2024-01-27 10:10:51'),(97,1,'Role Lists','Role Lists',1,NULL,NULL,'2024-01-27 10:17:19','2024-01-27 10:17:19'),(98,2,'Role Lists','Listas de roles',1,NULL,NULL,'2024-01-27 10:17:19','2024-01-27 10:17:19'),(99,1,'CREATE AN ACCOUNT','CREATE AN ACCOUNT',1,NULL,NULL,'2024-01-28 15:46:52','2024-01-28 15:46:52'),(100,2,'CREATE AN ACCOUNT','CREA UNA CUENTA',1,NULL,NULL,'2024-01-28 15:46:52','2024-01-28 15:46:52'),(101,1,'Create Account','Create Account',1,NULL,NULL,'2024-01-28 15:47:56','2024-01-28 15:47:56'),(102,2,'Create Account','Crear una cuenta',1,NULL,NULL,'2024-01-28 15:47:56','2024-01-28 15:47:56'),(103,1,'Business Info','Business Info',1,NULL,NULL,'2024-01-28 15:49:13','2024-01-28 15:49:13'),(104,2,'Business Info','Información comercial',1,NULL,NULL,'2024-01-28 15:49:13','2024-01-28 15:49:13'),(105,1,'Plan Info','Plan Info',1,NULL,NULL,'2024-01-28 15:49:30','2024-01-28 15:49:30'),(106,2,'Plan Info','Información del plan',1,NULL,NULL,'2024-01-28 15:49:30','2024-01-28 15:49:30'),(107,1,'Agreement','Agreement',1,NULL,NULL,'2024-01-28 15:49:44','2024-01-28 15:49:44'),(108,2,'Agreement','Agreement',1,NULL,NULL,'2024-01-28 15:49:44','2024-01-30 14:37:44'),(109,1,'Payment','Payment',1,NULL,NULL,'2024-01-28 15:50:01','2024-01-28 15:50:01'),(110,2,'Payment','Payment',1,NULL,NULL,'2024-01-28 15:50:01','2024-01-30 14:37:44'),(111,1,'Create an account to get started','Create an account to get started',1,NULL,NULL,'2024-01-28 15:50:29','2024-01-28 15:50:29'),(112,2,'Create an account to get started','Crea una cuenta para comenzar',1,NULL,NULL,'2024-01-28 15:50:29','2024-01-28 15:50:29'),(113,1,'Get started by filling out this form in under 1 minute','Get started by filling out this form in under 1 minute.',1,NULL,NULL,'2024-01-28 15:51:12','2024-01-28 15:51:12'),(114,2,'Get started by filling out this form in under 1 minute','Comience completando este formulario en menos de 1 minuto',1,NULL,NULL,'2024-01-28 15:51:12','2024-01-28 15:51:12'),(115,1,'We will then give you a custom pricing quote in 1 business day','We will then give you a custom pricing quote in 1 business day',1,NULL,NULL,'2024-01-28 16:00:41','2024-01-28 16:00:41'),(116,2,'We will then give you a custom pricing quote in 1 business day','Luego le daremos una cotización de precio personalizada en 1 día hábil.',1,NULL,NULL,'2024-01-28 16:00:41','2024-01-28 16:00:41'),(117,1,'From there, you can decide if we\'re the right fit for you','From there, you can decide if we\'re the right fit for you',1,NULL,NULL,'2024-01-28 16:03:48','2024-01-28 16:03:48'),(118,2,'From there, you can decide if we\'re the right fit for you','A partir de ahí, puede decidir si somos las adecuadas para usted.',1,NULL,NULL,'2024-01-28 16:03:48','2024-01-28 16:03:48'),(119,1,'If you have questions','If you have questions',1,NULL,NULL,'2024-01-28 16:05:16','2024-01-28 16:05:16'),(120,2,'If you have questions','Si tienes preguntas',1,NULL,NULL,'2024-01-28 16:05:16','2024-01-28 16:05:16'),(121,1,'Request a Callback','Request a Callback',1,NULL,NULL,'2024-01-28 16:05:55','2024-01-28 16:05:55'),(122,2,'Request a Callback','Solicitar una devolución de llamada',1,NULL,NULL,'2024-01-28 16:05:55','2024-01-28 16:05:55'),(123,1,'to learn more about','to learn more about',1,NULL,NULL,'2024-01-28 16:06:40','2024-01-28 16:06:40'),(124,2,'to learn more about','para aprender más sobre',1,NULL,NULL,'2024-01-28 16:06:40','2024-01-28 16:06:40'),(125,1,'By checking this box, I agree to','By checking this box, I agree to',1,NULL,NULL,'2024-01-28 16:09:17','2024-01-28 16:09:17'),(126,2,'By checking this box, I agree to','Al marcar esta casilla, acepto',1,NULL,NULL,'2024-01-28 16:09:17','2024-01-28 16:09:17'),(127,1,'Terms of Use','Terms of Use',1,NULL,NULL,'2024-01-28 16:09:41','2024-01-28 16:09:41'),(128,2,'Terms of Use','Condiciones de uso',1,NULL,NULL,'2024-01-28 16:09:41','2024-01-28 16:09:41'),(129,1,'Get Started','Get Started',1,NULL,NULL,'2024-01-28 16:10:22','2024-01-28 16:10:22'),(130,2,'Get Started','Empezar',1,NULL,NULL,'2024-01-28 16:10:22','2024-01-28 16:10:22'),(131,1,'SL','SL',NULL,NULL,NULL,'2024-01-30 14:37:38','2024-01-30 14:37:38'),(132,1,'URL','URL',NULL,NULL,NULL,'2024-01-30 14:37:38','2024-01-30 14:37:38'),(133,1,'Menu For','Menu For',NULL,NULL,NULL,'2024-01-30 14:37:38','2024-01-30 14:37:38'),(134,1,'Sub Menu','Sub Menu',NULL,NULL,NULL,'2024-01-30 14:37:38','2024-01-30 14:37:38'),(135,1,'Status','Status',NULL,NULL,NULL,'2024-01-30 14:37:38','2024-01-30 14:37:38'),(136,1,'Created At','Created At',NULL,NULL,NULL,'2024-01-30 14:37:38','2024-01-30 14:37:38'),(137,1,'Action','Action',NULL,NULL,NULL,'2024-01-30 14:37:38','2024-01-30 14:37:38'),(138,1,'Add New Menu','Add New Menu',NULL,NULL,NULL,'2024-01-30 14:37:38','2024-01-30 14:37:38'),(139,1,'No Menu Data','No Menu Data',NULL,NULL,NULL,'2024-01-30 14:37:38','2024-01-30 14:37:38'),(140,1,'Menu Lists','Menu Lists',NULL,NULL,NULL,'2024-01-30 14:37:38','2024-01-30 14:37:38'),(141,1,'Icon Class','Icon Class',NULL,NULL,NULL,'2024-01-30 14:37:38','2024-01-30 14:37:38'),(142,1,'Serial','Serial',NULL,NULL,NULL,'2024-01-30 14:37:38','2024-01-30 14:37:38'),(143,1,'Open New Tab','Open New Tab',NULL,NULL,NULL,'2024-01-30 14:37:38','2024-01-30 14:37:38'),(144,1,'Submit','Submit',NULL,NULL,NULL,'2024-01-30 14:37:38','2024-01-30 14:37:38'),(145,1,'Update','Update',NULL,NULL,NULL,'2024-01-30 14:37:38','2024-01-30 14:37:38'),(146,1,'Email','Email',NULL,NULL,NULL,'2024-01-30 14:37:38','2024-01-30 14:37:38'),(147,1,'Phone','Phone',NULL,NULL,NULL,'2024-01-30 14:37:38','2024-01-30 14:37:38'),(148,1,'Profile Photo','Profile Photo',NULL,NULL,NULL,'2024-01-30 14:37:38','2024-01-30 14:37:38'),(149,1,'Assigned Role','Assigned Role',NULL,NULL,NULL,'2024-01-30 14:37:38','2024-01-30 14:37:38'),(150,1,'Main Menu Lists','Main Menu Lists',NULL,NULL,NULL,'2024-01-30 14:37:38','2024-01-30 14:37:38'),(151,1,'Founder','Founder',NULL,NULL,NULL,'2024-01-30 14:37:38','2024-01-30 14:37:38'),(152,1,'Follow','Follow',NULL,NULL,NULL,'2024-01-30 14:37:38','2024-01-30 14:37:38'),(153,1,'Message','Message',NULL,NULL,NULL,'2024-01-30 14:37:38','2024-01-30 14:37:38'),(154,1,'About Me','About Me',NULL,NULL,NULL,'2024-01-30 14:37:38','2024-01-30 14:37:38'),(155,1,'Full Name','Full Name',NULL,NULL,NULL,'2024-01-30 14:37:38','2024-01-30 14:37:38'),(156,1,'Mobile','Mobile',NULL,NULL,NULL,'2024-01-30 14:37:38','2024-01-30 14:37:38'),(157,1,'Location','Location',NULL,NULL,NULL,'2024-01-30 14:37:38','2024-01-30 14:37:38'),(158,1,'Personal Info','Personal Info',NULL,NULL,NULL,'2024-01-30 14:37:39','2024-01-30 14:37:39'),(159,1,'User Name','User Name',NULL,NULL,NULL,'2024-01-30 14:37:39','2024-01-30 14:37:39'),(160,1,'Bio','Bio',NULL,NULL,NULL,'2024-01-30 14:37:39','2024-01-30 14:37:39'),(161,1,'Password','Password',NULL,NULL,NULL,'2024-01-30 14:37:39','2024-01-30 14:37:39'),(162,1,'avatar','avatar',NULL,NULL,NULL,'2024-01-30 14:37:39','2024-01-30 14:37:39'),(163,1,'Company Info','Company Info',NULL,NULL,NULL,'2024-01-30 14:37:39','2024-01-30 14:37:39'),(164,1,'Company Name','Company Name',NULL,NULL,NULL,'2024-01-30 14:37:39','2024-01-30 14:37:39'),(165,1,'Social','Social',NULL,NULL,NULL,'2024-01-30 14:37:39','2024-01-30 14:37:39'),(166,1,'Facebook','Facebook',NULL,NULL,NULL,'2024-01-30 14:37:39','2024-01-30 14:37:39'),(167,1,'Twitter','Twitter',NULL,NULL,NULL,'2024-01-30 14:37:39','2024-01-30 14:37:39'),(168,1,'Instagram','Instagram',NULL,NULL,NULL,'2024-01-30 14:37:39','2024-01-30 14:37:39'),(169,1,'Linkedin','Linkedin',NULL,NULL,NULL,'2024-01-30 14:37:39','2024-01-30 14:37:39'),(170,1,'Skype','Skype',NULL,NULL,NULL,'2024-01-30 14:37:39','2024-01-30 14:37:39'),(171,1,'Github','Github',NULL,NULL,NULL,'2024-01-30 14:37:39','2024-01-30 14:37:39'),(172,1,'Save','Save',NULL,NULL,NULL,'2024-01-30 14:37:39','2024-01-30 14:37:39'),(173,1,'Role Name','Role Name',NULL,NULL,NULL,'2024-01-30 14:37:39','2024-01-30 14:37:39'),(174,1,'Guard name','Guard name',NULL,NULL,NULL,'2024-01-30 14:37:39','2024-01-30 14:37:39'),(175,1,'Word Restrictions','Word Restrictions',NULL,NULL,NULL,'2024-01-30 14:37:39','2024-01-30 14:37:39'),(176,1,'Add New User','Add New User',NULL,NULL,NULL,'2024-01-30 14:37:39','2024-01-30 14:37:39'),(177,1,'User Details','User Details',NULL,NULL,NULL,'2024-01-30 14:37:39','2024-01-30 14:37:39'),(178,1,'Confirm Password','Confirm Password',NULL,NULL,NULL,'2024-01-30 14:37:39','2024-01-30 14:37:39'),(179,1,'Allow Permissions','Allow Permissions',NULL,NULL,NULL,'2024-01-30 14:37:39','2024-01-30 14:37:39'),(180,1,'Check all Permissions','Check all Permissions',NULL,NULL,NULL,'2024-01-30 14:37:39','2024-01-30 14:37:39'),(181,1,'Save User','Save User',NULL,NULL,NULL,'2024-01-30 14:37:39','2024-01-30 14:37:39'),(182,1,'Cancel','Cancel',NULL,NULL,NULL,'2024-01-30 14:37:39','2024-01-30 14:37:39'),(183,1,'Add New Document Type','Add New Document Type',NULL,NULL,NULL,'2024-01-30 14:37:39','2024-01-30 14:37:39'),(184,1,'Title','Title',NULL,NULL,NULL,'2024-01-30 14:37:39','2024-01-30 14:37:39'),(185,1,'Add New Service','Add New Service',NULL,NULL,NULL,'2024-01-30 14:37:39','2024-01-30 14:37:39'),(186,1,'Service Details','Service Details',NULL,NULL,NULL,'2024-01-30 14:37:39','2024-01-30 14:37:39'),(187,1,'Languages','Languages',NULL,NULL,NULL,'2024-01-30 14:37:39','2024-01-30 14:37:39'),(188,1,'Add New Language','Add New Language',NULL,NULL,NULL,'2024-01-30 14:37:39','2024-01-30 14:37:39'),(189,1,'Plan','Plan',NULL,NULL,NULL,'2024-01-30 14:37:39','2024-01-30 14:37:39'),(190,1,'Documents','Documents',NULL,NULL,NULL,'2024-01-30 14:37:39','2024-01-30 14:37:39'),(191,1,'Subject','Subject',NULL,NULL,NULL,'2024-01-30 14:37:39','2024-01-30 14:37:39'),(192,1,'Description','Description',NULL,NULL,NULL,'2024-01-30 14:37:39','2024-01-30 14:37:39'),(193,1,'Report Documents','Report Documents',NULL,NULL,NULL,'2024-01-30 14:37:39','2024-01-30 14:37:39'),(194,1,'Upload Reports','Upload Reports',NULL,NULL,NULL,'2024-01-30 14:37:39','2024-01-30 14:37:39'),(195,1,'Mail Mailer','Mail Mailer',NULL,NULL,NULL,'2024-01-30 14:37:39','2024-01-30 14:37:39'),(196,1,'Mail Host','Mail Host',NULL,NULL,NULL,'2024-01-30 14:37:39','2024-01-30 14:37:39'),(197,1,'Mail Port','Mail Port',NULL,NULL,NULL,'2024-01-30 14:37:39','2024-01-30 14:37:39'),(198,1,'Mail User Name','Mail User Name',NULL,NULL,NULL,'2024-01-30 14:37:40','2024-01-30 14:37:40'),(199,1,'User Password','User Password',NULL,NULL,NULL,'2024-01-30 14:37:40','2024-01-30 14:37:40'),(200,1,'Encryption','Encryption',NULL,NULL,NULL,'2024-01-30 14:37:40','2024-01-30 14:37:40'),(201,1,'From Address','From Address',NULL,NULL,NULL,'2024-01-30 14:37:40','2024-01-30 14:37:40'),(202,1,'Mail Name','Mail Name',NULL,NULL,NULL,'2024-01-30 14:37:40','2024-01-30 14:37:40'),(203,1,'App Secret key','App Secret key',NULL,NULL,NULL,'2024-01-30 14:37:40','2024-01-30 14:37:40'),(204,1,'API Key','API Key',NULL,NULL,NULL,'2024-01-30 14:37:40','2024-01-30 14:37:40'),(205,1,'App Version','App Version',NULL,NULL,NULL,'2024-01-30 14:37:40','2024-01-30 14:37:40'),(206,1,'CallBack Url','CallBack Url',NULL,NULL,NULL,'2024-01-30 14:37:40','2024-01-30 14:37:40'),(207,1,'Cancel URL','Cancel URL',NULL,NULL,NULL,'2024-01-30 14:37:40','2024-01-30 14:37:40'),(208,1,'Official Email','Official Email',NULL,NULL,NULL,'2024-01-30 14:37:40','2024-01-30 14:37:40'),(209,1,'Official Phone Number','Official Phone Number',NULL,NULL,NULL,'2024-01-30 14:37:40','2024-01-30 14:37:40'),(210,1,'Website Logo','Website Logo',NULL,NULL,NULL,'2024-01-30 14:37:40','2024-01-30 14:37:40'),(211,1,'Favicon','Favicon',NULL,NULL,NULL,'2024-01-30 14:37:40','2024-01-30 14:37:40'),(212,1,'Call','Call',NULL,NULL,NULL,'2024-01-30 14:37:40','2024-01-30 14:37:40'),(213,1,'Welcome to','Welcome to',NULL,NULL,NULL,'2024-01-30 14:37:40','2024-01-30 14:37:40'),(214,1,'Home','Home',NULL,NULL,NULL,'2024-01-30 14:37:40','2024-01-30 14:37:40'),(215,1,'About Us','About Us',NULL,NULL,NULL,'2024-01-30 14:37:40','2024-01-30 14:37:40'),(216,1,'Quick Links','Quick Links',NULL,NULL,NULL,'2024-01-30 14:37:40','2024-01-30 14:37:40'),(217,1,'Benifits','Benifits',NULL,NULL,NULL,'2024-01-30 14:37:40','2024-01-30 14:37:40'),(218,1,'Plan and Price','Plan and Price',NULL,NULL,NULL,'2024-01-30 14:37:40','2024-01-30 14:37:40'),(219,1,'Contact','Contact',NULL,NULL,NULL,'2024-01-30 14:37:40','2024-01-30 14:37:40'),(220,1,'Privacy Policy','Privacy Policy',NULL,NULL,NULL,'2024-01-30 14:37:40','2024-01-30 14:37:40'),(221,1,'Term Of Use','Term Of Use',NULL,NULL,NULL,'2024-01-30 14:37:40','2024-01-30 14:37:40'),(222,1,'FAQs','FAQs',NULL,NULL,NULL,'2024-01-30 14:37:40','2024-01-30 14:37:40'),(223,1,'Position','Position',NULL,NULL,NULL,'2024-01-30 14:37:40','2024-01-30 14:37:40'),(224,1,'Address','Address',NULL,NULL,NULL,'2024-01-30 14:37:40','2024-01-30 14:37:40'),(225,1,'Zip','Zip',NULL,NULL,NULL,'2024-01-30 14:37:40','2024-01-30 14:37:40'),(226,1,'Business Structure','Business Structure',NULL,NULL,NULL,'2024-01-30 14:37:40','2024-01-30 14:37:40'),(227,1,'TAX Filling Status','TAX Filling Status',NULL,NULL,NULL,'2024-01-30 14:37:40','2024-01-30 14:37:40'),(228,1,'TAX ID','TAX ID',NULL,NULL,NULL,'2024-01-30 14:37:40','2024-01-30 14:37:40'),(229,1,'Update Business Information','Update Business Information',NULL,NULL,NULL,'2024-01-30 14:37:40','2024-01-30 14:37:40'),(230,1,'Current Password','Current Password',NULL,NULL,NULL,'2024-01-30 14:37:40','2024-01-30 14:37:40'),(231,1,'New Password','New Password',NULL,NULL,NULL,'2024-01-30 14:37:40','2024-01-30 14:37:40'),(232,1,'Update Password','Update Password',NULL,NULL,NULL,'2024-01-30 14:37:40','2024-01-30 14:37:40'),(233,1,'View All Documents','View All Documents',NULL,NULL,NULL,'2024-01-30 14:37:40','2024-01-30 14:37:40'),(234,1,'Upload Documents','Upload Documents',NULL,NULL,NULL,'2024-01-30 14:37:40','2024-01-30 14:37:40'),(235,1,'Code','Code',NULL,NULL,NULL,'2024-01-30 14:37:40','2024-01-30 14:37:40'),(236,1,'Year','Year',NULL,NULL,NULL,'2024-01-30 14:37:41','2024-01-30 14:37:41'),(237,1,'Month','Month',NULL,NULL,NULL,'2024-01-30 14:37:41','2024-01-30 14:37:41'),(238,1,'Options','Options',NULL,NULL,NULL,'2024-01-30 14:37:41','2024-01-30 14:37:41'),(239,1,'View Document','View Document',NULL,NULL,NULL,'2024-01-30 14:37:41','2024-01-30 14:37:41'),(240,1,'Total Monthly','Total Monthly',NULL,NULL,NULL,'2024-01-30 14:37:41','2024-01-30 14:37:41'),(241,1,'Additional Services','Additional Services',NULL,NULL,NULL,'2024-01-30 14:37:41','2024-01-30 14:37:41'),(242,1,'Total Amount','Total Amount',NULL,NULL,NULL,'2024-01-30 14:37:41','2024-01-30 14:37:41'),(243,1,'Subscribed form','Subscribed form',NULL,NULL,NULL,'2024-01-30 14:37:41','2024-01-30 14:37:41'),(244,1,'Additional Monthly Services','Additional Monthly Services',NULL,NULL,NULL,'2024-01-30 14:37:41','2024-01-30 14:37:41'),(245,1,'Proceed to Next','Proceed to Next',NULL,NULL,NULL,'2024-01-30 14:37:41','2024-01-30 14:37:41'),(246,2,'SL','SL',NULL,NULL,NULL,'2024-01-30 14:37:41','2024-01-30 14:37:41'),(247,2,'URL','URL',NULL,NULL,NULL,'2024-01-30 14:37:41','2024-01-30 14:37:41'),(248,2,'Menu For','Menu For',NULL,NULL,NULL,'2024-01-30 14:37:41','2024-01-30 14:37:41'),(249,2,'Sub Menu','Sub Menu',NULL,NULL,NULL,'2024-01-30 14:37:41','2024-01-30 14:37:41'),(250,2,'Status','Status',NULL,NULL,NULL,'2024-01-30 14:37:41','2024-01-30 14:37:41'),(251,2,'Created At','Created At',NULL,NULL,NULL,'2024-01-30 14:37:41','2024-01-30 14:37:41'),(252,2,'Action','Action',NULL,NULL,NULL,'2024-01-30 14:37:41','2024-01-30 14:37:41'),(253,2,'Add New Menu','Add New Menu',NULL,NULL,NULL,'2024-01-30 14:37:41','2024-01-30 14:37:41'),(254,2,'No Menu Data','No Menu Data',NULL,NULL,NULL,'2024-01-30 14:37:41','2024-01-30 14:37:41'),(255,2,'Menu Lists','Menu Lists',NULL,NULL,NULL,'2024-01-30 14:37:41','2024-01-30 14:37:41'),(256,2,'Icon Class','Icon Class',NULL,NULL,NULL,'2024-01-30 14:37:41','2024-01-30 14:37:41'),(257,2,'Serial','Serial',NULL,NULL,NULL,'2024-01-30 14:37:41','2024-01-30 14:37:41'),(258,2,'Open New Tab','Open New Tab',NULL,NULL,NULL,'2024-01-30 14:37:41','2024-01-30 14:37:41'),(259,2,'Submit','Submit',NULL,NULL,NULL,'2024-01-30 14:37:41','2024-01-30 14:37:41'),(260,2,'Update','Update',NULL,NULL,NULL,'2024-01-30 14:37:41','2024-01-30 14:37:41'),(261,2,'Email','Email',NULL,NULL,NULL,'2024-01-30 14:37:41','2024-01-30 14:37:41'),(262,2,'Phone','Phone',NULL,NULL,NULL,'2024-01-30 14:37:41','2024-01-30 14:37:41'),(263,2,'Profile Photo','Profile Photo',NULL,NULL,NULL,'2024-01-30 14:37:41','2024-01-30 14:37:41'),(264,2,'Assigned Role','Assigned Role',NULL,NULL,NULL,'2024-01-30 14:37:41','2024-01-30 14:37:41'),(265,2,'Main Menu Lists','Main Menu Lists',NULL,NULL,NULL,'2024-01-30 14:37:41','2024-01-30 14:37:41'),(266,2,'Founder','Founder',NULL,NULL,NULL,'2024-01-30 14:37:41','2024-01-30 14:37:41'),(267,2,'Follow','Follow',NULL,NULL,NULL,'2024-01-30 14:37:41','2024-01-30 14:37:41'),(268,2,'Message','Message',NULL,NULL,NULL,'2024-01-30 14:37:41','2024-01-30 14:37:41'),(269,2,'About Me','About Me',NULL,NULL,NULL,'2024-01-30 14:37:41','2024-01-30 14:37:41'),(270,2,'Full Name','Full Name',NULL,NULL,NULL,'2024-01-30 14:37:41','2024-01-30 14:37:41'),(271,2,'Mobile','Mobile',NULL,NULL,NULL,'2024-01-30 14:37:41','2024-01-30 14:37:41'),(272,2,'Location','Location',NULL,NULL,NULL,'2024-01-30 14:37:42','2024-01-30 14:37:42'),(273,2,'Personal Info','Personal Info',NULL,NULL,NULL,'2024-01-30 14:37:42','2024-01-30 14:37:42'),(274,2,'User Name','User Name',NULL,NULL,NULL,'2024-01-30 14:37:42','2024-01-30 14:37:42'),(275,2,'Bio','Bio',NULL,NULL,NULL,'2024-01-30 14:37:42','2024-01-30 14:37:42'),(276,2,'Password','Password',NULL,NULL,NULL,'2024-01-30 14:37:42','2024-01-30 14:37:42'),(277,2,'avatar','avatar',NULL,NULL,NULL,'2024-01-30 14:37:42','2024-01-30 14:37:42'),(278,2,'Company Info','Company Info',NULL,NULL,NULL,'2024-01-30 14:37:42','2024-01-30 14:37:42'),(279,2,'Company Name','Company Name',NULL,NULL,NULL,'2024-01-30 14:37:42','2024-01-30 14:37:42'),(280,2,'Social','Social',NULL,NULL,NULL,'2024-01-30 14:37:42','2024-01-30 14:37:42'),(281,2,'Facebook','Facebook',NULL,NULL,NULL,'2024-01-30 14:37:42','2024-01-30 14:37:42'),(282,2,'Twitter','Twitter',NULL,NULL,NULL,'2024-01-30 14:37:42','2024-01-30 14:37:42'),(283,2,'Instagram','Instagram',NULL,NULL,NULL,'2024-01-30 14:37:42','2024-01-30 14:37:42'),(284,2,'Linkedin','Linkedin',NULL,NULL,NULL,'2024-01-30 14:37:42','2024-01-30 14:37:42'),(285,2,'Skype','Skype',NULL,NULL,NULL,'2024-01-30 14:37:42','2024-01-30 14:37:42'),(286,2,'Github','Github',NULL,NULL,NULL,'2024-01-30 14:37:42','2024-01-30 14:37:42'),(287,2,'Save','Save',NULL,NULL,NULL,'2024-01-30 14:37:42','2024-01-30 14:37:42'),(288,2,'Role Name','Role Name',NULL,NULL,NULL,'2024-01-30 14:37:42','2024-01-30 14:37:42'),(289,2,'Guard name','Guard name',NULL,NULL,NULL,'2024-01-30 14:37:42','2024-01-30 14:37:42'),(290,2,'Word Restrictions','Word Restrictions',NULL,NULL,NULL,'2024-01-30 14:37:42','2024-01-30 14:37:42'),(291,2,'Add New User','Add New User',NULL,NULL,NULL,'2024-01-30 14:37:42','2024-01-30 14:37:42'),(292,2,'User Details','User Details',NULL,NULL,NULL,'2024-01-30 14:37:42','2024-01-30 14:37:42'),(293,2,'Confirm Password','Confirm Password',NULL,NULL,NULL,'2024-01-30 14:37:42','2024-01-30 14:37:42'),(294,2,'Allow Permissions','Allow Permissions',NULL,NULL,NULL,'2024-01-30 14:37:42','2024-01-30 14:37:42'),(295,2,'Check all Permissions','Check all Permissions',NULL,NULL,NULL,'2024-01-30 14:37:42','2024-01-30 14:37:42'),(296,2,'Save User','Save User',NULL,NULL,NULL,'2024-01-30 14:37:42','2024-01-30 14:37:42'),(297,2,'Cancel','Cancel',NULL,NULL,NULL,'2024-01-30 14:37:42','2024-01-30 14:37:42'),(298,2,'Add New Document Type','Add New Document Type',NULL,NULL,NULL,'2024-01-30 14:37:42','2024-01-30 14:37:42'),(299,2,'Title','Title',NULL,NULL,NULL,'2024-01-30 14:37:42','2024-01-30 14:37:42'),(300,2,'Add New Service','Add New Service',NULL,NULL,NULL,'2024-01-30 14:37:42','2024-01-30 14:37:42'),(301,2,'Service Details','Service Details',NULL,NULL,NULL,'2024-01-30 14:37:42','2024-01-30 14:37:42'),(302,2,'Languages','Languages',NULL,NULL,NULL,'2024-01-30 14:37:42','2024-01-30 14:37:42'),(303,2,'Add New Language','Add New Language',NULL,NULL,NULL,'2024-01-30 14:37:42','2024-01-30 14:37:42'),(304,2,'Plan','Plan',NULL,NULL,NULL,'2024-01-30 14:37:42','2024-01-30 14:37:42'),(305,2,'Documents','Documents',NULL,NULL,NULL,'2024-01-30 14:37:42','2024-01-30 14:37:42'),(306,2,'Subject','Subject',NULL,NULL,NULL,'2024-01-30 14:37:42','2024-01-30 14:37:42'),(307,2,'Description','Description',NULL,NULL,NULL,'2024-01-30 14:37:42','2024-01-30 14:37:42'),(308,2,'Report Documents','Report Documents',NULL,NULL,NULL,'2024-01-30 14:37:43','2024-01-30 14:37:43'),(309,2,'Upload Reports','Upload Reports',NULL,NULL,NULL,'2024-01-30 14:37:43','2024-01-30 14:37:43'),(310,2,'Mail Mailer','Mail Mailer',NULL,NULL,NULL,'2024-01-30 14:37:43','2024-01-30 14:37:43'),(311,2,'Mail Host','Mail Host',NULL,NULL,NULL,'2024-01-30 14:37:43','2024-01-30 14:37:43'),(312,2,'Mail Port','Mail Port',NULL,NULL,NULL,'2024-01-30 14:37:43','2024-01-30 14:37:43'),(313,2,'Mail User Name','Mail User Name',NULL,NULL,NULL,'2024-01-30 14:37:43','2024-01-30 14:37:43'),(314,2,'User Password','User Password',NULL,NULL,NULL,'2024-01-30 14:37:43','2024-01-30 14:37:43'),(315,2,'Encryption','Encryption',NULL,NULL,NULL,'2024-01-30 14:37:43','2024-01-30 14:37:43'),(316,2,'From Address','From Address',NULL,NULL,NULL,'2024-01-30 14:37:43','2024-01-30 14:37:43'),(317,2,'Mail Name','Mail Name',NULL,NULL,NULL,'2024-01-30 14:37:43','2024-01-30 14:37:43'),(318,2,'App Secret key','App Secret key',NULL,NULL,NULL,'2024-01-30 14:37:43','2024-01-30 14:37:43'),(319,2,'API Key','API Key',NULL,NULL,NULL,'2024-01-30 14:37:43','2024-01-30 14:37:43'),(320,2,'App Version','App Version',NULL,NULL,NULL,'2024-01-30 14:37:43','2024-01-30 14:37:43'),(321,2,'CallBack Url','CallBack Url',NULL,NULL,NULL,'2024-01-30 14:37:43','2024-01-30 14:37:43'),(322,2,'Cancel URL','Cancel URL',NULL,NULL,NULL,'2024-01-30 14:37:43','2024-01-30 14:37:43'),(323,2,'Official Email','Official Email',NULL,NULL,NULL,'2024-01-30 14:37:43','2024-01-30 14:37:43'),(324,2,'Official Phone Number','Official Phone Number',NULL,NULL,NULL,'2024-01-30 14:37:43','2024-01-30 14:37:43'),(325,2,'Website Logo','Website Logo',NULL,NULL,NULL,'2024-01-30 14:37:43','2024-01-30 14:37:43'),(326,2,'Favicon','Favicon',NULL,NULL,NULL,'2024-01-30 14:37:43','2024-01-30 14:37:43'),(327,2,'Call','Call',NULL,NULL,NULL,'2024-01-30 14:37:43','2024-01-30 14:37:43'),(328,2,'Welcome to','Welcome to',NULL,NULL,NULL,'2024-01-30 14:37:43','2024-01-30 14:37:43'),(329,2,'Home','Home',NULL,NULL,NULL,'2024-01-30 14:37:43','2024-01-30 14:37:43'),(330,2,'About Us','About Us',NULL,NULL,NULL,'2024-01-30 14:37:43','2024-01-30 14:37:43'),(331,2,'Quick Links','Quick Links',NULL,NULL,NULL,'2024-01-30 14:37:43','2024-01-30 14:37:43'),(332,2,'Benifits','Benifits',NULL,NULL,NULL,'2024-01-30 14:37:43','2024-01-30 14:37:43'),(333,2,'Plan and Price','Plan and Price',NULL,NULL,NULL,'2024-01-30 14:37:43','2024-01-30 14:37:43'),(334,2,'Contact','Contact',NULL,NULL,NULL,'2024-01-30 14:37:43','2024-01-30 14:37:43'),(335,2,'Privacy Policy','Privacy Policy',NULL,NULL,NULL,'2024-01-30 14:37:43','2024-01-30 14:37:43'),(336,2,'Term Of Use','Term Of Use',NULL,NULL,NULL,'2024-01-30 14:37:43','2024-01-30 14:37:43'),(337,2,'FAQs','FAQs',NULL,NULL,NULL,'2024-01-30 14:37:43','2024-01-30 14:37:43'),(338,2,'Position','Position',NULL,NULL,NULL,'2024-01-30 14:37:43','2024-01-30 14:37:43'),(339,2,'Address','Address',NULL,NULL,NULL,'2024-01-30 14:37:43','2024-01-30 14:37:43'),(340,2,'Zip','Zip',NULL,NULL,NULL,'2024-01-30 14:37:43','2024-01-30 14:37:43'),(341,2,'Business Structure','Business Structure',NULL,NULL,NULL,'2024-01-30 14:37:43','2024-01-30 14:37:43'),(342,2,'TAX Filling Status','TAX Filling Status',NULL,NULL,NULL,'2024-01-30 14:37:43','2024-01-30 14:37:43'),(343,2,'TAX ID','TAX ID',NULL,NULL,NULL,'2024-01-30 14:37:43','2024-01-30 14:37:43'),(344,2,'Update Business Information','Update Business Information',NULL,NULL,NULL,'2024-01-30 14:37:43','2024-01-30 14:37:43'),(345,2,'Current Password','Current Password',NULL,NULL,NULL,'2024-01-30 14:37:43','2024-01-30 14:37:43'),(346,2,'New Password','New Password',NULL,NULL,NULL,'2024-01-30 14:37:43','2024-01-30 14:37:43'),(347,2,'Update Password','Update Password',NULL,NULL,NULL,'2024-01-30 14:37:43','2024-01-30 14:37:43'),(348,2,'View All Documents','View All Documents',NULL,NULL,NULL,'2024-01-30 14:37:44','2024-01-30 14:37:44'),(349,2,'Upload Documents','Upload Documents',NULL,NULL,NULL,'2024-01-30 14:37:44','2024-01-30 14:37:44'),(350,2,'Code','Code',NULL,NULL,NULL,'2024-01-30 14:37:44','2024-01-30 14:37:44'),(351,2,'Year','Year',NULL,NULL,NULL,'2024-01-30 14:37:44','2024-01-30 14:37:44'),(352,2,'Month','Month',NULL,NULL,NULL,'2024-01-30 14:37:44','2024-01-30 14:37:44'),(353,2,'Options','Options',NULL,NULL,NULL,'2024-01-30 14:37:44','2024-01-30 14:37:44'),(354,2,'View Document','View Document',NULL,NULL,NULL,'2024-01-30 14:37:44','2024-01-30 14:37:44'),(355,2,'Total Monthly','Total Monthly',NULL,NULL,NULL,'2024-01-30 14:37:44','2024-01-30 14:37:44'),(356,2,'Additional Services','Additional Services',NULL,NULL,NULL,'2024-01-30 14:37:44','2024-01-30 14:37:44'),(357,2,'Total Amount','Total Amount',NULL,NULL,NULL,'2024-01-30 14:37:44','2024-01-30 14:37:44'),(358,2,'Subscribed form','Subscribed form',NULL,NULL,NULL,'2024-01-30 14:37:44','2024-01-30 14:37:44'),(359,2,'Additional Monthly Services','Additional Monthly Services',NULL,NULL,NULL,'2024-01-30 14:37:44','2024-01-30 14:37:44'),(360,2,'Proceed to Next','Proceed to Next',NULL,NULL,NULL,'2024-01-30 14:37:44','2024-01-30 14:37:44');

/*Table structure for table `languages` */

DROP TABLE IF EXISTS `languages`;

CREATE TABLE `languages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `flag` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'US',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `languages_created_by_foreign` (`created_by`),
  KEY `languages_updated_by_foreign` (`updated_by`),
  CONSTRAINT `languages_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `languages_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `languages` */

insert  into `languages`(`id`,`code`,`name`,`flag`,`created_by`,`updated_by`,`deleted_at`,`created_at`,`updated_at`) values (1,'en','English','US',1,1,NULL,'2024-01-22 16:54:39','2024-01-26 09:09:35'),(2,'es','Spanish','ES',1,1,NULL,'2024-01-22 16:55:19','2024-01-26 09:09:22');

/*Table structure for table `logs` */

DROP TABLE IF EXISTS `logs`;

CREATE TABLE `logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `log` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_receipt` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `logs` */

insert  into `logs`(`id`,`log`,`read_receipt`,`created_at`,`updated_at`) values (1,'New Customer Registered. Name: Arafat Anwar, Email: programmer.arafatanwar@gmail.com, Phone: 01754148869','yes','2024-01-30 21:57:48','2024-01-31 03:54:22'),(2,'Customer Email has been varified. Name: Arafat Anwar, Email: programmer.arafatanwar@gmail.com, Phone: 01754148869','no','2024-01-30 21:57:50',NULL),(3,'Customer has paid Subscription Plan Prices. Customer Name: Arafat Anwar, Customer Email: programmer.arafatanwar@gmail.com, Customer Phone: 01754148869, Plan: Basic, Total Amount: USD899','no','2024-01-30 16:01:07',NULL),(4,'Customer submitted new Documents. Customer Name: Arafat Anwar, Customer Email: programmer.arafatanwar@gmail.com, Customer Phone: 01754148869, Documents Code: GMpTOUbM, Subject: 43r34r, Period: January, 2024','no','2024-01-30 16:05:22',NULL),(5,'Customer Report Delivered. Customer Name: Arafat Anwar, Customer Email: programmer.arafatanwar@gmail.com, Customer Phone: 01754148869, Report Code: ubwLNC4X, Subject: ed3wd, Period: January, 2024','no','2024-01-30 16:31:58',NULL),(6,'New Customer Registered. Name: Arafat Anwar, Email: anwarullah834@gmail.com, Phone: 01234567890','no','2024-01-30 17:00:35',NULL),(7,'New Customer Registered. Name: Hridoy, Email: farookhridoy@gmail.com, Phone: 01822252198','yes','2024-01-31 03:07:22','2024-01-31 03:54:04'),(8,'Customer Email has been varified. Name: Hridoy, Email: farookhridoy@gmail.com, Phone: 01822252198','yes','2024-01-31 03:07:46','2024-01-31 03:52:06'),(9,'Customer has paid Subscription Plan Prices. Customer Name: Hridoy, Customer Email: farookhridoy@gmail.com, Customer Phone: 01822252198, Plan: Basic, Total Amount: USD99','yes','2024-01-31 03:14:07','2024-01-31 03:50:47');

/*Table structure for table `menus` */

DROP TABLE IF EXISTS `menus`;

CREATE TABLE `menus` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_bn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `big_icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serial_num` tinyint(3) unsigned NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menu_for` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Menu for admin',
  `open_new_tab` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No Open New Tab',
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menus_created_by_foreign` (`created_by`),
  KEY `menus_updated_by_foreign` (`updated_by`),
  CONSTRAINT `menus_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `menus_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `menus` */

insert  into `menus`(`id`,`name`,`name_bn`,`url`,`icon_class`,`icon`,`big_icon`,`serial_num`,`status`,`slug`,`menu_for`,`open_new_tab`,`created_by`,`updated_by`,`deleted_at`,`created_at`,`updated_at`) values (1,'Dashboard',NULL,'dashboard','uil-home-alt',NULL,NULL,1,'Active','[\"Dashboard\"]','Menu for admin','No Open New Tab',1,1,NULL,'2023-02-01 12:27:14','2023-02-01 15:06:05'),(2,'ACL',NULL,'#','mdi mdi-account-settings',NULL,NULL,2,'Active','[\"submenu-list\",\"menu-list\",\"user-list\",\"role-list\",\"permission-list\"]','Menu for admin','No Open New Tab',1,1,NULL,'2023-02-01 12:48:23','2023-02-15 12:40:50'),(11,'Settings',NULL,'#','ri-settings-3-fill',NULL,NULL,8,'Active','[\"settings-list\"]','Menu for admin','No Open New Tab',1,1,NULL,'2023-03-24 21:50:28','2023-03-24 21:51:49'),(12,'CMS',NULL,'#','uil-globe',NULL,NULL,9,'Active','[\"document-types\",\"services\"]','Menu for admin','No Open New Tab',1,NULL,NULL,'2024-01-20 17:56:35','2024-01-20 17:56:35'),(13,'Language',NULL,'#','uil-globe',NULL,NULL,10,'Active','[\"language-library\",\"languages\"]','Menu for admin','No Open New Tab',1,1,NULL,'2024-01-22 16:10:16','2024-01-22 16:21:54'),(14,'Plans',NULL,'admin/plans','ri-task-fill',NULL,NULL,11,'Active','[\"plan-delete\",\"plan-edit\",\"plan-create\",\"plans\"]','Menu for admin','No Open New Tab',1,1,NULL,'2024-01-22 16:30:37','2024-01-23 15:46:29'),(15,'Subscribers',NULL,'admin/subscribers','uil-user-circle',NULL,NULL,12,'Active','[\"subscriber-approver\",\"subscriber-delete\",\"subscriber-edit\",\"subscriber-create\",\"subscribers\"]','Menu for admin','No Open New Tab',1,1,NULL,'2024-01-23 15:54:32','2024-01-23 15:57:13'),(16,'Plan Payments',NULL,'admin/payments','uil-usd-square',NULL,NULL,13,'Active','[\"payment-delete\",\"payment-show\",\"payments\"]','Menu for admin','No Open New Tab',1,1,NULL,'2024-01-23 15:55:39','2024-01-23 15:57:32'),(17,'Reports',NULL,'#','uil-file-bookmark-alt',NULL,NULL,14,'Active','[\"reports-generate\",\"reports\"]','Menu for admin','No Open New Tab',1,1,NULL,'2024-01-23 15:56:15','2024-01-23 15:58:26'),(18,'Notifications',NULL,'admin/notifications','ri-notification-3-line noti-icon',NULL,NULL,15,'Active','[\"read-logs\",\"logs\"]','Menu for admin','No Open New Tab',1,1,NULL,'2024-01-31 03:27:30','2024-01-31 03:28:37');

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_reset_tokens_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2020_11_24_022623_create_menus_table',1),(6,'2020_11_24_031938_create_sub_menus_table',1),(7,'2020_11_24_032345_create_sub_sub_menus_table',1),(8,'2022_12_18_153538_user_column_visibilities',1),(9,'2022_12_18_153539_create_permission_tables',2),(10,'2022_12_25_132445_add_module_to_permissions',2),(11,'2023_02_02_034707_add_soft_delete_to_table',2),(12,'2023_03_23_192825_add_type_column_in_users',2),(13,'2023_06_05_085004_create_settings_website_table',2),(14,'2023_06_05_085031_create_settings_social_media_table',2),(15,'2023_06_05_085047_create_settings_wallet_table',2),(16,'2023_06_05_085145_create_settings_mail_table',2),(17,'2023_06_05_155801_add_two_column_in_settings_website',2),(18,'2024_01_18_093516_create_activity_log_table',2),(19,'2024_01_18_093517_add_event_column_to_activity_log_table',2),(20,'2024_01_18_093518_add_batch_uuid_column_to_activity_log_table',2),(21,'2024_01_18_103116_add_column_roles_table',2),(22,'2024_01_20_180108_create_services_table',3),(23,'2024_01_20_180122_create_document_types_table',4),(24,'2024_01_21_033756_languages',5),(25,'2024_01_21_033805_language_libraries',5),(26,'2024_01_21_033903_plans',6),(27,'2024_01_21_033908_plan_services',6),(28,'2024_01_21_034023_business_information',7),(29,'2024_01_21_034148_subscriptions',7),(30,'2024_01_21_042528_subscription_plan_services',7),(31,'2024_01_21_042538_subscription_additional_services',7),(32,'2024_01_21_042549_subscription_payments',7),(37,'2024_01_21_034452_report_requests',8),(38,'2024_01_21_034459_report_request_documents',8),(39,'2024_01_21_034509_reports',8),(40,'2024_01_21_034517_report_documents',8),(41,'2024_01_23_160921_add_column_settings_website_table',9),(42,'2024_01_26_055524_wesite_multiple_language',10),(43,'2024_01_26_055557_cms_multiple_language',11),(44,'2024_01_26_055630_plan_multiple_language',12),(45,'2024_01_26_091208_add_flag_to_language',13),(46,'2024_01_27_084952_add_plan_features_in_website_settings',14),(47,'2024_01_27_100058_add_service_agreement_in_website_settings',15),(48,'2024_01_28_102014_add_timeline',16),(49,'2024_01_28_171327_remove_doc_type_form_report_doc',17),(50,'2024_01_30_152054_logs',18),(51,'2024_01_30_154125_update_wallet',19),(52,'2024_01_31_031850_add_read_in_log_table',20);

/*Table structure for table `model_has_permissions` */

DROP TABLE IF EXISTS `model_has_permissions`;

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `model_has_permissions` */

insert  into `model_has_permissions`(`permission_id`,`model_type`,`model_id`) values (2,'App\\Models\\User',1),(3,'App\\Models\\User',1),(4,'App\\Models\\User',1),(5,'App\\Models\\User',1),(6,'App\\Models\\User',1),(7,'App\\Models\\User',1),(8,'App\\Models\\User',1),(9,'App\\Models\\User',1),(10,'App\\Models\\User',1),(11,'App\\Models\\User',1),(12,'App\\Models\\User',1),(13,'App\\Models\\User',1),(14,'App\\Models\\User',1),(15,'App\\Models\\User',1),(16,'App\\Models\\User',1),(17,'App\\Models\\User',1),(18,'App\\Models\\User',1),(19,'App\\Models\\User',1),(20,'App\\Models\\User',1),(21,'App\\Models\\User',1),(22,'App\\Models\\User',1),(2,'App\\Models\\User',2),(3,'App\\Models\\User',2),(4,'App\\Models\\User',2),(5,'App\\Models\\User',2),(6,'App\\Models\\User',2),(7,'App\\Models\\User',2),(8,'App\\Models\\User',2),(9,'App\\Models\\User',2),(10,'App\\Models\\User',2),(11,'App\\Models\\User',2),(12,'App\\Models\\User',2),(13,'App\\Models\\User',2),(14,'App\\Models\\User',2),(15,'App\\Models\\User',2),(16,'App\\Models\\User',2),(17,'App\\Models\\User',2),(18,'App\\Models\\User',2),(19,'App\\Models\\User',2),(20,'App\\Models\\User',2),(21,'App\\Models\\User',2),(22,'App\\Models\\User',2);

/*Table structure for table `model_has_roles` */

DROP TABLE IF EXISTS `model_has_roles`;

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `model_has_roles` */

insert  into `model_has_roles`(`role_id`,`model_type`,`model_id`) values (1,'App\\Models\\User',1),(2,'App\\Models\\User',2),(3,'App\\Models\\User',3),(3,'App\\Models\\User',4),(3,'App\\Models\\User',5),(3,'App\\Models\\User',6),(3,'App\\Models\\User',7),(3,'App\\Models\\User',8);

/*Table structure for table `password_reset_tokens` */

DROP TABLE IF EXISTS `password_reset_tokens`;

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_reset_tokens` */

/*Table structure for table `permissions` */

DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `permissions` */

insert  into `permissions`(`id`,`name`,`guard_name`,`module`,`created_at`,`updated_at`) values (2,'permission-create','web','ACL','2023-01-30 21:37:24','2023-01-30 21:37:24'),(3,'permission-edit','web','ACL','2023-01-30 21:37:24','2023-01-30 21:37:24'),(4,'permission-delete','web','ACL','2023-01-30 21:37:24','2023-01-30 21:37:24'),(5,'permission-list','web','ACL','2023-01-30 22:04:40','2023-01-30 22:04:40'),(6,'role-list','web','ACL','2023-01-30 22:06:18','2023-01-30 22:06:18'),(7,'role-create','web','ACL','2023-01-30 22:06:18','2023-01-30 22:06:18'),(8,'role-edit','web','ACL','2023-01-30 22:06:18','2023-01-30 22:06:18'),(9,'role-delete','web','ACL','2023-01-30 22:06:18','2023-01-30 22:06:18'),(10,'user-list','web','Users','2023-01-30 22:06:41','2023-01-30 22:06:41'),(11,'user-create','web','Users','2023-01-30 22:06:41','2023-01-30 22:06:41'),(12,'user-edit','web','Users','2023-01-30 22:06:41','2023-01-30 22:06:41'),(13,'user-delete','web','Users','2023-01-30 22:06:41','2023-01-30 22:06:41'),(14,'menu-list','web','Menu','2023-01-30 22:07:56','2023-01-30 22:07:56'),(15,'menu-edit','web','Menu','2023-01-30 22:07:56','2023-01-30 22:07:56'),(16,'menu-create','web','Menu','2023-01-30 22:07:56','2023-01-30 22:07:56'),(17,'menu-delete','web','Menu','2023-01-30 22:07:56','2023-01-30 22:07:56'),(18,'submenu-list','web','Menu','2023-01-30 22:07:56','2023-01-30 22:07:56'),(19,'submenu-create','web','Menu','2023-01-30 22:07:56','2023-01-30 22:07:56'),(20,'submenu-edit','web','Menu','2023-01-30 22:07:56','2023-01-30 22:07:56'),(21,'submenu-delete','web','Menu','2023-01-30 22:07:56','2023-01-30 22:07:56'),(22,'Dashboard','web','Dashboard','2023-02-01 12:35:11','2023-02-01 12:35:11'),(23,'settings-list','web','Settings','2024-01-18 18:31:40','2024-01-18 18:31:40'),(24,'settings-create','web','Settings','2024-01-18 18:31:40','2024-01-18 18:31:40'),(25,'settings-edit','web','Settings','2024-01-18 18:31:40','2024-01-18 18:31:40'),(26,'settings-delete','web','Settings','2024-01-18 18:31:40','2024-01-18 18:31:40'),(27,'services','web','CMS','2024-01-20 17:52:03','2024-01-20 17:52:03'),(28,'service-create','web','CMS','2024-01-20 17:52:03','2024-01-20 17:52:03'),(29,'service-edit','web','CMS','2024-01-20 17:52:03','2024-01-20 17:52:03'),(30,'service-delete','web','CMS','2024-01-20 17:52:03','2024-01-20 17:52:03'),(31,'document-types','web','CMS','2024-01-20 17:53:56','2024-01-20 17:53:56'),(32,'document-type-create','web','CMS','2024-01-20 17:53:56','2024-01-20 17:53:56'),(33,'document-type-edit','web','CMS','2024-01-20 17:53:56','2024-01-20 17:53:56'),(34,'document-type-delete','web','CMS','2024-01-20 17:53:56','2024-01-20 17:53:56'),(35,'languages','web','Language','2024-01-22 16:15:22','2024-01-22 16:15:22'),(36,'language-create','web','Language','2024-01-22 16:15:24','2024-01-22 16:15:24'),(37,'language-edit','web','Language','2024-01-22 16:15:24','2024-01-22 16:15:24'),(38,'language-delete','web','Language','2024-01-22 16:15:24','2024-01-22 16:15:24'),(39,'language-library','web','Language','2024-01-22 16:16:19','2024-01-22 16:16:19'),(40,'language-library-create','web','Language','2024-01-22 16:16:21','2024-01-22 16:16:21'),(41,'language-library-edit','web','Language','2024-01-22 16:16:21','2024-01-22 16:16:21'),(42,'language-library-delete','web','Language','2024-01-22 16:16:21','2024-01-22 16:16:21'),(43,'plans','web','Plan','2024-01-22 16:29:30','2024-01-22 16:29:30'),(44,'plan-create','web','Plan','2024-01-22 16:29:30','2024-01-22 16:29:30'),(45,'plan-edit','web','Plan','2024-01-22 16:29:30','2024-01-22 16:29:30'),(46,'plan-delete','web','Plan','2024-01-22 16:29:30','2024-01-22 16:29:30'),(47,'subscribers','web','Subscribers','2024-01-23 15:51:41','2024-01-23 15:51:41'),(51,'subscriber-approver','web','Subscribers','2024-01-23 15:51:41','2024-01-23 15:51:41'),(52,'payments','web','Plan Payments','2024-01-23 15:52:45','2024-01-23 15:52:45'),(53,'payment-show','web','Plan Payments','2024-01-23 15:52:45','2024-01-23 15:52:45'),(55,'reports','web','Reports','2024-01-23 15:53:17','2024-01-23 15:53:17'),(56,'reports-generate','web','Reports','2024-01-23 15:53:17','2024-01-23 15:53:17'),(57,'logs','web','Logs','2024-01-31 03:22:59','2024-01-31 03:22:59'),(58,'read-logs','web','Logs','2024-01-31 03:22:59','2024-01-31 03:22:59');

/*Table structure for table `personal_access_tokens` */

DROP TABLE IF EXISTS `personal_access_tokens`;

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `personal_access_tokens` */

/*Table structure for table `plan_services` */

DROP TABLE IF EXISTS `plan_services`;

CREATE TABLE `plan_services` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `plan_id` bigint(20) unsigned NOT NULL,
  `service_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plan_services_plan_id_foreign` (`plan_id`),
  KEY `plan_services_service_id_foreign` (`service_id`),
  CONSTRAINT `plan_services_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `plan_services_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `plan_services` */

insert  into `plan_services`(`id`,`plan_id`,`service_id`,`created_at`,`updated_at`) values (1,1,1,NULL,NULL),(2,1,2,NULL,NULL),(3,1,3,NULL,NULL),(4,1,4,NULL,NULL),(5,1,5,NULL,NULL),(6,2,1,NULL,NULL),(7,2,2,NULL,NULL),(8,3,1,NULL,NULL),(9,3,2,NULL,NULL),(10,3,3,NULL,NULL);

/*Table structure for table `plans` */

DROP TABLE IF EXISTS `plans`;

CREATE TABLE `plans` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL DEFAULT '0',
  `type` enum('daily','weekly','monthly','half-yearly','yearly') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'monthly',
  `features` longtext COLLATE utf8mb4_unicode_ci,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plans_created_by_foreign` (`created_by`),
  KEY `plans_updated_by_foreign` (`updated_by`),
  CONSTRAINT `plans_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `plans_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `plans` */

insert  into `plans`(`id`,`code`,`name`,`price`,`type`,`features`,`description`,`created_by`,`updated_by`,`deleted_at`,`created_at`,`updated_at`) values (1,'vip','{\"en\":\"VIP\",\"es\":\"VIP\"}',299,'monthly','<ul><li>All Silver and Gold Benefit</li><li>Upto 450 Transaction</li></ul>','\"\\\"<ul><li>Plus upto 55 per employee<\\\\\\/li><li>Tax advice including<\\\\\\/li><\\\\\\/ul>\\\"\"',1,1,NULL,'2024-01-23 15:35:02','2024-01-27 04:05:47'),(2,'basic','{\"en\":\"Basic\",\"es\":\"B\\u00e1sica\"}',99,'monthly','<p>.</p>','\"\\\"<p>.<\\\\\\/p>\\\"\"',1,1,NULL,'2024-01-27 04:04:55','2024-01-27 04:06:16'),(3,'premium','{\"en\":\"Premium\",\"es\":\"De primera calidad\"}',199,'monthly','<p>.</p>','\"\\\"\\\\\\\"<p>.<\\\\\\\\\\\\\\/p>\\\\\\\"\\\"\"',1,1,NULL,'2024-01-27 04:05:32','2024-01-27 04:06:51');

/*Table structure for table `report_documents` */

DROP TABLE IF EXISTS `report_documents`;

CREATE TABLE `report_documents` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `report_id` bigint(20) unsigned NOT NULL,
  `fileinfo` longtext COLLATE utf8mb4_unicode_ci,
  `document` longtext COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `report_documents_report_id_foreign` (`report_id`),
  CONSTRAINT `report_documents_report_id_foreign` FOREIGN KEY (`report_id`) REFERENCES `reports` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `report_documents` */

insert  into `report_documents`(`id`,`report_id`,`fileinfo`,`document`,`deleted_at`,`created_at`,`updated_at`) values (3,2,'{\"name\":\"SSL_Bank Accounts.xlsx\",\"type\":\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.sheet\",\"size\":8909,\"width\":\"\",\"height\":\"\",\"extension\":\"xlsx\"}','upload/report-documents/vbW675q78Pm1IOdqZaMqzbTgXYekGllH.xlsx',NULL,NULL,NULL),(4,2,'{\"name\":\"SSL_Item_Master.xlsx\",\"type\":\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.sheet\",\"size\":11820,\"width\":\"\",\"height\":\"\",\"extension\":\"xlsx\"}','upload/report-documents/z60xv8yvvjWtiNlIAD3YLlU1Vfalt0nJ.xlsx',NULL,NULL,NULL);

/*Table structure for table `report_request_documents` */

DROP TABLE IF EXISTS `report_request_documents`;

CREATE TABLE `report_request_documents` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `report_request_id` bigint(20) unsigned NOT NULL,
  `document_type_id` bigint(20) unsigned NOT NULL,
  `fileinfo` longtext COLLATE utf8mb4_unicode_ci,
  `document` longtext COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `report_request_documents_report_request_id_foreign` (`report_request_id`),
  KEY `report_request_documents_document_type_id_foreign` (`document_type_id`),
  CONSTRAINT `report_request_documents_document_type_id_foreign` FOREIGN KEY (`document_type_id`) REFERENCES `document_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `report_request_documents_report_request_id_foreign` FOREIGN KEY (`report_request_id`) REFERENCES `report_requests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `report_request_documents` */

insert  into `report_request_documents`(`id`,`report_request_id`,`document_type_id`,`fileinfo`,`document`,`deleted_at`,`created_at`,`updated_at`) values (1,2,1,'{\"name\":\"Gap Analysis.xlsx\",\"type\":\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.sheet\",\"size\":164068,\"width\":\"\",\"height\":\"\",\"extension\":\"xlsx\"}','upload/documents/tElXsNpRkKOcslWSSTleLdJGM2H0Onqh.xlsx',NULL,NULL,NULL);

/*Table structure for table `report_requests` */

DROP TABLE IF EXISTS `report_requests`;

CREATE TABLE `report_requests` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `code` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `yearmonth` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci,
  `body` longtext COLLATE utf8mb4_unicode_ci,
  `status` enum('pending','processing','delivered','declined') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `report_requests_user_id_foreign` (`user_id`),
  CONSTRAINT `report_requests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `report_requests` */

insert  into `report_requests`(`id`,`user_id`,`code`,`yearmonth`,`subject`,`body`,`status`,`deleted_at`,`created_at`,`updated_at`) values (2,6,'GMpTOUbM','2024-01','43r34r','f3f3rf3','delivered',NULL,'2024-01-30 16:05:22','2024-01-30 16:31:58');

/*Table structure for table `reports` */

DROP TABLE IF EXISTS `reports`;

CREATE TABLE `reports` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `report_request_id` bigint(20) unsigned NOT NULL,
  `code` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci,
  `body` longtext COLLATE utf8mb4_unicode_ci,
  `status` enum('delivered','received') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'delivered',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reports_report_request_id_foreign` (`report_request_id`),
  KEY `reports_created_by_foreign` (`created_by`),
  KEY `reports_updated_by_foreign` (`updated_by`),
  CONSTRAINT `reports_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `reports_report_request_id_foreign` FOREIGN KEY (`report_request_id`) REFERENCES `report_requests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reports_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `reports` */

insert  into `reports`(`id`,`report_request_id`,`code`,`subject`,`body`,`status`,`created_by`,`updated_by`,`deleted_at`,`created_at`,`updated_at`) values (2,2,'ubwLNC4X','ed3wd','3d3d3d','delivered',1,NULL,NULL,'2024-01-30 16:31:58','2024-01-30 16:31:58');

/*Table structure for table `role_has_permissions` */

DROP TABLE IF EXISTS `role_has_permissions`;

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `role_has_permissions` */

insert  into `role_has_permissions`(`permission_id`,`role_id`) values (2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(42,1),(43,1),(44,1),(45,1),(46,1),(47,1),(51,1),(52,1),(53,1),(55,1),(56,1),(57,1),(58,1),(10,2),(22,2),(23,2),(24,2),(25,2),(26,2),(27,2),(28,2),(29,2),(30,2),(31,2),(32,2),(33,2),(34,2),(35,2),(36,2),(37,2),(38,2),(39,2),(40,2),(41,2),(42,2),(43,2),(44,2),(45,2),(46,2),(47,2),(51,2),(52,2),(53,2),(55,2),(56,2),(57,2),(58,2);

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `word_restrictions` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `roles` */

insert  into `roles`(`id`,`name`,`word_restrictions`,`guard_name`,`created_at`,`updated_at`,`deleted_at`) values (1,'Super-Admin','[\"\"]','web','2023-01-30 22:54:55','2023-02-15 12:37:53',NULL),(2,'Employee','[\"\"]','web','2023-02-01 16:21:17','2023-02-01 16:21:17',NULL),(3,'Customer','[\"\"]','web',NULL,NULL,NULL);

/*Table structure for table `services` */

DROP TABLE IF EXISTS `services`;

CREATE TABLE `services` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` longtext COLLATE utf8mb4_unicode_ci,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double NOT NULL DEFAULT '0',
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci DEFAULT 'active',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `services_created_by_foreign` (`created_by`),
  KEY `services_updated_by_foreign` (`updated_by`),
  CONSTRAINT `services_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `services_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `services` */

insert  into `services`(`id`,`title`,`slug`,`price`,`status`,`created_by`,`updated_by`,`created_at`,`updated_at`) values (1,'{\"en\":\"Bill Pay & Bill Invoice\",\"es\":\"Bill Pay & Bill Invoice\"}','a702f893502b6586',300,'active',1,1,'2024-01-20 18:31:28','2024-01-26 09:19:37'),(2,'{\"en\":\"Payroll Processing\",\"es\":\"Payroll Processing\"}','2327a42748df9b94',120,'active',1,1,'2024-01-23 15:31:43','2024-01-26 09:19:34'),(3,'{\"en\":\"Tax Preparation Advice\",\"es\":\"Tax Preparation Advice\"}','175a3b43d2e1f5c6',200,'active',1,1,'2024-01-23 15:31:59','2024-01-26 09:42:05'),(4,'{\"en\":\"Access QuickBooks Online\",\"es\":\"Access QuickBooks Online\"}','3ca068d97d405f3f',300,'active',1,1,'2024-01-23 15:32:23','2024-01-26 09:19:30'),(5,'{\"en\":\"Business Coaching\",\"es\":\"Business Coaching\"}','4f7223e72df04dac',300,'active',1,1,'2024-01-23 15:32:43','2024-01-26 09:19:09');

/*Table structure for table `settings_mail` */

DROP TABLE IF EXISTS `settings_mail`;

CREATE TABLE `settings_mail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `mail_mailer` text COLLATE utf8mb4_unicode_ci,
  `mail_host` text COLLATE utf8mb4_unicode_ci,
  `mail_port` text COLLATE utf8mb4_unicode_ci,
  `mail_user_name` text COLLATE utf8mb4_unicode_ci,
  `mail_user_password` text COLLATE utf8mb4_unicode_ci,
  `mail_encryption` text COLLATE utf8mb4_unicode_ci,
  `mail_from_address` text COLLATE utf8mb4_unicode_ci,
  `mail_name` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `settings_mail` */

insert  into `settings_mail`(`id`,`mail_mailer`,`mail_host`,`mail_port`,`mail_user_name`,`mail_user_password`,`mail_encryption`,`mail_from_address`,`mail_name`,`created_at`,`updated_at`) values (1,'smtp','mail.yourbookkeeper360.pro','465','test@yourbookkeeper360.pro','#11nrd~@$4he','ssl','test@yourbookkeeper360.pro','YB Customer Areas','2024-01-30 16:37:44','2024-01-30 16:37:44');

/*Table structure for table `settings_social_media` */

DROP TABLE IF EXISTS `settings_social_media`;

CREATE TABLE `settings_social_media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `twitter` text COLLATE utf8mb4_unicode_ci,
  `facebook` text COLLATE utf8mb4_unicode_ci,
  `telegram` text COLLATE utf8mb4_unicode_ci,
  `discord` text COLLATE utf8mb4_unicode_ci,
  `youtube` text COLLATE utf8mb4_unicode_ci,
  `vimeo` text COLLATE utf8mb4_unicode_ci,
  `tiktok` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `settings_social_media` */

insert  into `settings_social_media`(`id`,`twitter`,`facebook`,`telegram`,`discord`,`youtube`,`vimeo`,`tiktok`,`created_at`,`updated_at`) values (1,'#','https://www.facebook.com/yourbookkeeper360','https://www.linkedin.com/company/yourbookkeeper360','https://www.instagram.com/yourbookkeeper360/','https://youtube.com/@yourBookkeeper360?si=zP4sLVa0aXUQBUno','#','https://www.tiktok.com/@yourbookkeeper360?is_from_webapp=1&sender_device=pc','2024-01-25 08:40:47','2024-01-25 08:41:04');

/*Table structure for table `settings_wallet` */

DROP TABLE IF EXISTS `settings_wallet`;

CREATE TABLE `settings_wallet` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `environment` text COLLATE utf8mb4_unicode_ci,
  `access_token` text COLLATE utf8mb4_unicode_ci,
  `application_id` text COLLATE utf8mb4_unicode_ci,
  `location_id` text COLLATE utf8mb4_unicode_ci,
  `redirect_url` text COLLATE utf8mb4_unicode_ci,
  `merchant_support_email` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `settings_wallet` */

insert  into `settings_wallet`(`id`,`environment`,`access_token`,`application_id`,`location_id`,`redirect_url`,`merchant_support_email`,`created_at`,`updated_at`) values (1,'sandbox','EAAAl9vQAdez0WbH2r75gBLhpLTdfwUWBt8LcCbQqx1PEMoLZuvs8fwgGS4J5t4g','sandbox-sq0idb-LOSO1E8bZRG4GxYFo2sRUg','LEY0GQQHR60WC','http://127.0.0.1:8000/guest/callback','gmfaruk2021@gmail.com','2024-01-30 15:52:30','2024-01-30 15:52:30');

/*Table structure for table `settings_website` */

DROP TABLE IF EXISTS `settings_website`;

CREATE TABLE `settings_website` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8mb4_unicode_ci,
  `slogan` longtext COLLATE utf8mb4_unicode_ci,
  `logo` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_user_logo` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `official_email` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `official_phone` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `official_address` longtext COLLATE utf8mb4_unicode_ci,
  `default_user_cover` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fee_like_qty` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '10',
  `monthly_plan_features` longtext COLLATE utf8mb4_unicode_ci,
  `service_agreements` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `settings_website` */

insert  into `settings_website`(`id`,`name`,`slogan`,`logo`,`default_user_logo`,`favicon`,`official_email`,`official_phone`,`official_address`,`default_user_cover`,`fee_like_qty`,`monthly_plan_features`,`service_agreements`,`created_at`,`updated_at`) values (1,'{\"en\":\"YB Customer Areas\",\"es\":\"YB Customer Areas\"}','{\"en\":\"At yourBookkeper, we help businesses simplify their financial processes so they can focus on what they do best.\",\"es\":\"At yourBookkeper, we help businesses simplify their financial processes so they can focus on what they do best.\"}','uploads/website/logo/187230124033804.png','uploads/website/defaultUser/585180124065402.png','uploads/website/favicon/112230124033955.webp','info@yourBookkeeper360.pro','(888) 322-0970','{\"en\":\"4330 W Desert Inn Rd Suite E Las Vegas, NV 89102\",\"es\":\"4330 W Desert Inn Rd Suite E Las Vegas, NV 89102\"}','uploads/website/defaultCover/413310124061803.png','5','<ol><li>Plus $5 per employee</li></ol>','<h4 style=\"margin-bottom: 35px\"><strong>Service Agreement</strong></h4>\r\n<h6 style=\"margin-bottom: 20px\">CLIENT SERVICE AGREEMENT</h6>\r\n<p>\r\n    This Client Service Agreement (the \"Agreement\") dated [DATE] (\"Effective Date\"), is made by and between [COMPANY NAME] (the \"Client\"), and yourBookkeeper (the \"Bookkeeper\") whereas the Client wishes to retain the Bookkeeper for bookkeeping services, and whereas the Client agrees to engage and compensate the Bookkeeper as an independent contractor for these services, and the Bookkeeper agrees to provide such services. Therefore. in consideration of the terms and conditions detailed in this Agreement, the receipt, understanding. and approval of which is duly acknowledged through signature from both parties below, all parties to this Agreement agree to the following:\r\n</p>\r\n\r\n<ol>\r\n    <li style=\"line-height: 35px;\">\r\n        <strong>Services Provided:</strong> The Bookkeeper shall provide the following services to the Client:\r\n        [SERVICES]\r\n    </li>\r\n    <li style=\"line-height: 35px;\">\r\n        <strong>Service Rates:</strong> The Client hereby agrees to compensate the Bookkeeper at [PRICE] and Bookkeeper shall invoice Client at the end of each month for services provided. The Bookkeeper shall provide an itemized invoice to the Client for services rendered every 30 calendar days. Each invoice shall be paid in full by the Client within 30 days of receipt. Any fees or expenses not listed in this bookkeeping Agreement must be approved in writing by the Client prior to being invoiced.\r\n    </li>\r\n    <li style=\"line-height: 35px;\">\r\n        <strong>Service Rate Adjustments:</strong> The service rates outlined in this Agreement are subject to change based on the evolving performance of the Client\'s company and its fluctuating needs. The Bookkeeper reserves the right to review and potentially adjust the service rates periodically. considering a comprehensive financial analysis of the Client\'s business operations and requirements. Any proposed rate adjustments shall be communicated to the Client in writing. providing detailed justifications for the proposed changes. The Client and Bookkeeper shall mutually discuss and agree upon any revised service rates before their implementation. This clause acknowledges that the service rates may be amended to reflect the evolving nature of the Client\'s business needs and performance, ensuring that the services provided remain aligned with the Client\'s financial requirements.\r\n    </li>\r\n    <li style=\"line-height: 35px;\">\r\n        <strong>Compliance and Advisory Disclaimer:</strong> The Bookkeeper agrees to perform all services in compliance with prevailing bookkeeping regulations and standards to the best of their ability. It is expressly understood and agreed that any advice or guidance provided by the Bookkeeper is not to be construed as legal advice. The Bookkeeper explicitly disclaims any representation as legal advisors and asserts that the services provided are solely related to financial matters, drawing from their expertise in financial advising. The Client acknowledges and agrees that all information, quidance. or recommendations\r\n    </li>\r\n</ol>','2023-06-05 14:51:13','2024-01-31 06:18:03');

/*Table structure for table `sub_menus` */

DROP TABLE IF EXISTS `sub_menus`;

CREATE TABLE `sub_menus` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_bn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `big_icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serial_num` tinyint(3) unsigned NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menu_for` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Sub menu for admin',
  `open_new_tab` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No Open New Tab',
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sub_menus_menu_id_foreign` (`menu_id`),
  KEY `sub_menus_created_by_foreign` (`created_by`),
  KEY `sub_menus_updated_by_foreign` (`updated_by`),
  CONSTRAINT `sub_menus_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sub_menus_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`),
  CONSTRAINT `sub_menus_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sub_menus` */

insert  into `sub_menus`(`id`,`menu_id`,`name`,`name_bn`,`url`,`icon_class`,`icon`,`big_icon`,`serial_num`,`status`,`slug`,`menu_for`,`open_new_tab`,`created_by`,`updated_by`,`deleted_at`,`created_at`,`updated_at`) values (1,2,'Permission',NULL,'admin/acl/permission','uil uil-lock-access',NULL,NULL,1,'Active','[\"permission-list\",\"permission-delete\",\"permission-edit\",\"permission-create\"]','Sub menu for admin','No Open New Tab',1,1,NULL,'2023-02-01 14:18:50','2023-02-28 11:58:35'),(2,2,'Roles',NULL,'admin/acl/roles','uil uil-shield-check',NULL,NULL,2,'Active','[\"role-delete\",\"role-edit\",\"role-create\",\"role-list\"]','Sub menu for admin','No Open New Tab',1,1,NULL,'2023-02-01 14:32:37','2023-02-28 11:59:11'),(3,2,'Menu',NULL,'admin/acl/menu','uil  uil-align',NULL,NULL,3,'Active','[\"submenu-delete\",\"submenu-edit\",\"submenu-create\",\"submenu-list\",\"menu-delete\",\"menu-create\",\"menu-edit\",\"menu-list\"]','Sub menu for admin','No Open New Tab',1,1,NULL,'2023-02-01 14:33:11','2023-02-28 11:59:45'),(4,2,'Users',NULL,'admin/acl/users','uil uil-user-circle',NULL,NULL,4,'Active','[\"user-delete\",\"user-edit\",\"user-create\",\"user-list\"]','Sub menu for admin','No Open New Tab',1,1,NULL,'2023-02-01 15:13:29','2023-02-28 12:00:30'),(23,11,'Website',NULL,'admin/website-settings','mdi mdi-web-check',NULL,NULL,1,'Active','[\"settings-delete\",\"settings-edit\",\"settings-create\",\"settings-list\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-03-24 22:17:19','2023-03-24 22:17:19'),(24,11,'Social Media',NULL,'admin/social-media-settings','mdi mdi-facebook',NULL,NULL,2,'Active','[\"settings-list\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-03-24 22:19:48','2023-03-24 22:19:48'),(25,11,'Wallet Connect',NULL,'admin/wallet-connect','mdi mdi-wallet-plus',NULL,NULL,3,'Active','[\"settings-list\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-03-24 22:22:03','2023-03-24 22:22:03'),(26,11,'Payment Getway',NULL,'admin/payment-getway','mdi mdi-contactless-payment',NULL,NULL,4,'Active','[\"settings-list\"]','Sub menu for admin','No Open New Tab',1,NULL,'2023-06-06 01:44:42','2023-03-24 22:34:16','2023-06-06 01:44:42'),(27,11,'Mail Credential',NULL,'admin/mail-credential','mdi mdi-email-lock',NULL,NULL,5,'Active','[\"settings-list\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-03-24 22:35:20','2023-03-24 22:35:20'),(28,12,'Services',NULL,'admin/services','uil-align',NULL,NULL,1,'Active','[\"service-delete\",\"service-edit\",\"service-create\",\"services\"]','Sub menu for admin','No Open New Tab',1,1,NULL,'2024-01-20 17:57:18','2024-01-20 17:57:51'),(29,12,'Document Types',NULL,'admin/document-types','uil-file',NULL,NULL,2,'Active','[\"document-type-delete\",\"document-type-edit\",\"document-type-create\",\"document-types\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2024-01-20 17:58:40','2024-01-20 17:58:40'),(30,13,'Language',NULL,'admin/languages','uil-globe',NULL,NULL,1,'Active','[\"language-delete\",\"language-edit\",\"language-create\",\"languages\"]','Sub menu for admin','No Open New Tab',1,1,NULL,'2024-01-22 16:14:05','2024-01-23 15:46:13'),(31,13,'Language Library',NULL,'admin/language-library','uil-notebooks',NULL,NULL,2,'Active','[\"language-library-delete\",\"language-library-edit\",\"language-library-create\",\"language-library\"]','Sub menu for admin','No Open New Tab',1,1,NULL,'2024-01-22 16:14:30','2024-01-23 15:46:03'),(32,17,'Upload Reports',NULL,'admin/upload-reports','uil-list-ui-alt',NULL,NULL,1,'Active','[\"reports-generate\",\"reports\"]','Sub menu for admin','No Open New Tab',1,1,NULL,'2024-01-23 15:59:16','2024-01-28 14:40:50');

/*Table structure for table `sub_sub_menus` */

DROP TABLE IF EXISTS `sub_sub_menus`;

CREATE TABLE `sub_sub_menus` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint(20) unsigned NOT NULL,
  `sub_menu_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_bn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `big_icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serial_num` tinyint(3) unsigned NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menu_for` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Sub Sub Menu for admin',
  `open_new_tab` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No Open New Tab',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sub_sub_menus_menu_id_foreign` (`menu_id`),
  KEY `sub_sub_menus_sub_menu_id_foreign` (`sub_menu_id`),
  KEY `sub_sub_menus_created_by_foreign` (`created_by`),
  KEY `sub_sub_menus_updated_by_foreign` (`updated_by`),
  CONSTRAINT `sub_sub_menus_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sub_sub_menus_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`),
  CONSTRAINT `sub_sub_menus_sub_menu_id_foreign` FOREIGN KEY (`sub_menu_id`) REFERENCES `sub_menus` (`id`),
  CONSTRAINT `sub_sub_menus_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sub_sub_menus` */

/*Table structure for table `subscription_additional_services` */

DROP TABLE IF EXISTS `subscription_additional_services`;

CREATE TABLE `subscription_additional_services` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `subscription_id` bigint(20) unsigned NOT NULL,
  `service_id` bigint(20) unsigned NOT NULL,
  `price` double NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subscription_additional_services_subscription_id_foreign` (`subscription_id`),
  KEY `subscription_additional_services_service_id_foreign` (`service_id`),
  CONSTRAINT `subscription_additional_services_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subscription_additional_services_subscription_id_foreign` FOREIGN KEY (`subscription_id`) REFERENCES `subscriptions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `subscription_additional_services` */

insert  into `subscription_additional_services`(`id`,`subscription_id`,`service_id`,`price`,`created_at`,`updated_at`) values (4,2,3,200,NULL,NULL),(5,2,4,300,NULL,NULL),(6,2,5,300,NULL,NULL);

/*Table structure for table `subscription_payments` */

DROP TABLE IF EXISTS `subscription_payments`;

CREATE TABLE `subscription_payments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `subscription_id` bigint(20) unsigned NOT NULL,
  `information` longtext COLLATE utf8mb4_unicode_ci,
  `response` longtext COLLATE utf8mb4_unicode_ci,
  `status` enum('pending','approved','denied') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subscription_payments_subscription_id_foreign` (`subscription_id`),
  CONSTRAINT `subscription_payments_subscription_id_foreign` FOREIGN KEY (`subscription_id`) REFERENCES `subscriptions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `subscription_payments` */

insert  into `subscription_payments`(`id`,`subscription_id`,`information`,`response`,`status`,`deleted_at`,`created_at`,`updated_at`) values (2,2,'rvRLd4xP116h3NDIfVCT92xaTc4F','{\"id\":\"rvRLd4xP116h3NDIfVCT92xaTc4F\",\"location_id\":\"LEY0GQQHR60WC\",\"source\":{\"name\":\"Sandbox for sq0idp-FFSbwFG-jjWmvCrN565Fng\"},\"customer_id\":\"arafat-anwar\",\"line_items\":[{\"uid\":\"65b91d329dc59\",\"name\":\"Basic\",\"quantity\":\"1\",\"note\":\"Hello\",\"variation_name\":\"N\\/A\",\"item_type\":\"ITEM\",\"metadata\":{\"name\":\"Basic\"},\"base_price_money\":{\"amount\":899,\"currency\":\"USD\"},\"variation_total_price_money\":{\"amount\":899,\"currency\":\"USD\"},\"gross_sales_money\":{\"amount\":899,\"currency\":\"USD\"},\"total_tax_money\":{\"amount\":0,\"currency\":\"USD\"},\"total_discount_money\":{\"amount\":0,\"currency\":\"USD\"},\"total_money\":{\"amount\":899,\"currency\":\"USD\"},\"total_service_charge_money\":{\"amount\":0,\"currency\":\"USD\"}}],\"fulfillments\":[{\"uid\":\"YvRDYW8spH7CwZlB1xF4BD\",\"type\":\"DIGITAL\",\"state\":\"PROPOSED\"}],\"net_amounts\":{\"total_money\":{\"amount\":899,\"currency\":\"USD\"},\"tax_money\":{\"amount\":0,\"currency\":\"USD\"},\"discount_money\":{\"amount\":0,\"currency\":\"USD\"},\"tip_money\":{\"amount\":0,\"currency\":\"USD\"},\"service_charge_money\":{\"amount\":0,\"currency\":\"USD\"}},\"tenders\":[{\"id\":\"nVzpiXQipi8TbsdFsAf31zpoewXZY\",\"location_id\":\"LEY0GQQHR60WC\",\"transaction_id\":\"rvRLd4xP116h3NDIfVCT92xaTc4F\",\"created_at\":\"2024-01-30T16:04:10Z\",\"amount_money\":{\"amount\":899,\"currency\":\"USD\"},\"type\":\"OTHER\",\"payment_id\":\"nVzpiXQipi8TbsdFsAf31zpoewXZY\"}],\"created_at\":\"2024-01-30T16:04:00.166Z\",\"updated_at\":\"2024-01-30T16:04:13.000Z\",\"state\":\"OPEN\",\"version\":7,\"total_money\":{\"amount\":899,\"currency\":\"USD\"},\"total_tax_money\":{\"amount\":0,\"currency\":\"USD\"},\"total_discount_money\":{\"amount\":0,\"currency\":\"USD\"},\"total_tip_money\":{\"amount\":0,\"currency\":\"USD\"},\"total_service_charge_money\":{\"amount\":0,\"currency\":\"USD\"},\"net_amount_due_money\":{\"amount\":0,\"currency\":\"USD\"}}','approved',NULL,'2024-01-30 16:01:07','2024-01-30 16:01:07'),(3,3,'1eUiNkq9zxLzsqZ6ZUEHQEUzge4F','{\"id\":\"1eUiNkq9zxLzsqZ6ZUEHQEUzge4F\",\"location_id\":\"LEY0GQQHR60WC\",\"source\":{\"name\":\"Sandbox for sq0idp-FFSbwFG-jjWmvCrN565Fng\"},\"customer_id\":\"hridoy\",\"line_items\":[{\"uid\":\"65b9baf116561\",\"name\":\"Basic\",\"quantity\":\"1\",\"variation_name\":\"N\\/A\",\"item_type\":\"ITEM\",\"metadata\":{\"name\":\"Basic\"},\"base_price_money\":{\"amount\":99,\"currency\":\"USD\"},\"variation_total_price_money\":{\"amount\":99,\"currency\":\"USD\"},\"gross_sales_money\":{\"amount\":99,\"currency\":\"USD\"},\"total_tax_money\":{\"amount\":0,\"currency\":\"USD\"},\"total_discount_money\":{\"amount\":0,\"currency\":\"USD\"},\"total_money\":{\"amount\":99,\"currency\":\"USD\"},\"total_service_charge_money\":{\"amount\":0,\"currency\":\"USD\"}}],\"fulfillments\":[{\"uid\":\"aXUGQPpy211muHxItm14pC\",\"type\":\"DIGITAL\",\"state\":\"PROPOSED\"}],\"net_amounts\":{\"total_money\":{\"amount\":99,\"currency\":\"USD\"},\"tax_money\":{\"amount\":0,\"currency\":\"USD\"},\"discount_money\":{\"amount\":0,\"currency\":\"USD\"},\"tip_money\":{\"amount\":0,\"currency\":\"USD\"},\"service_charge_money\":{\"amount\":0,\"currency\":\"USD\"}},\"tenders\":[{\"id\":\"hkucDrAXWEUfoBHVE27iePBK4tZZY\",\"location_id\":\"LEY0GQQHR60WC\",\"transaction_id\":\"1eUiNkq9zxLzsqZ6ZUEHQEUzge4F\",\"created_at\":\"2024-01-31T03:14:41Z\",\"amount_money\":{\"amount\":99,\"currency\":\"USD\"},\"type\":\"OTHER\",\"payment_id\":\"hkucDrAXWEUfoBHVE27iePBK4tZZY\"}],\"created_at\":\"2024-01-31T03:14:34.112Z\",\"updated_at\":\"2024-01-31T03:14:43.000Z\",\"state\":\"OPEN\",\"version\":7,\"total_money\":{\"amount\":99,\"currency\":\"USD\"},\"total_tax_money\":{\"amount\":0,\"currency\":\"USD\"},\"total_discount_money\":{\"amount\":0,\"currency\":\"USD\"},\"total_tip_money\":{\"amount\":0,\"currency\":\"USD\"},\"total_service_charge_money\":{\"amount\":0,\"currency\":\"USD\"},\"net_amount_due_money\":{\"amount\":0,\"currency\":\"USD\"}}','approved',NULL,'2024-01-31 03:14:07','2024-01-31 03:14:07');

/*Table structure for table `subscription_plan_services` */

DROP TABLE IF EXISTS `subscription_plan_services`;

CREATE TABLE `subscription_plan_services` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `subscription_id` bigint(20) unsigned NOT NULL,
  `service_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subscription_plan_services_subscription_id_foreign` (`subscription_id`),
  KEY `subscription_plan_services_service_id_foreign` (`service_id`),
  CONSTRAINT `subscription_plan_services_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subscription_plan_services_subscription_id_foreign` FOREIGN KEY (`subscription_id`) REFERENCES `subscriptions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `subscription_plan_services` */

insert  into `subscription_plan_services`(`id`,`subscription_id`,`service_id`,`created_at`,`updated_at`) values (3,2,1,NULL,NULL),(4,2,2,NULL,NULL),(5,3,1,NULL,NULL),(6,3,2,NULL,NULL);

/*Table structure for table `subscriptions` */

DROP TABLE IF EXISTS `subscriptions`;

CREATE TABLE `subscriptions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `plan_id` bigint(20) unsigned NOT NULL,
  `plan_price` double NOT NULL DEFAULT '0',
  `additional_price` double NOT NULL DEFAULT '0',
  `from` date DEFAULT NULL,
  `to` date DEFAULT NULL,
  `status` enum('pending','approved','denied') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subscriptions_user_id_foreign` (`user_id`),
  KEY `subscriptions_plan_id_foreign` (`plan_id`),
  CONSTRAINT `subscriptions_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subscriptions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `subscriptions` */

insert  into `subscriptions`(`id`,`user_id`,`plan_id`,`plan_price`,`additional_price`,`from`,`to`,`status`,`deleted_at`,`created_at`,`updated_at`) values (2,6,2,99,800,'2024-01-30','2024-02-29','approved',NULL,'2024-01-30 16:01:06','2024-01-30 16:01:06'),(3,8,2,99,0,'2024-01-31','2024-03-01','approved',NULL,'2024-01-31 03:14:07','2024-01-31 03:14:07');

/*Table structure for table `user_column_visibilities` */

DROP TABLE IF EXISTS `user_column_visibilities`;

CREATE TABLE `user_column_visibilities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `url` text COLLATE utf8mb4_unicode_ci,
  `columns` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_column_visibilities_user_id_foreign` (`user_id`),
  CONSTRAINT `user_column_visibilities_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `user_column_visibilities` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8mb4_unicode_ci,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('admin','seller','customer') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`username`,`phone`,`avatar`,`bio`,`company_name`,`website`,`location`,`email_verified_at`,`password`,`type`,`remember_token`,`created_at`,`updated_at`,`deleted_at`) values (1,'Omar Farook','info@thelarasoft.com','thelarasoft','01822252198','uploads/users/997180124065328.png','Hi there','YB Customer Area','https://thelarasoft.com','Las Vegas',NULL,'$2y$10$QIuZ50yM24O9oM2nma2aVuAV2Nd0XqqPY9zDxFOW4tGpIxuGfZOhe','admin','s21CdaBr79f4872nLau9t4P4CWg3g0UrPYv46magylIRvNOUzCrxmtrld3ek','2024-01-18 10:40:25','2024-01-18 18:53:28',NULL),(6,'Arafat Anwar','programmer.arafatanwar@gmail.com','programmer.arafatanwar@gmail.com','01754148869',NULL,NULL,NULL,NULL,NULL,NULL,'$2y$12$wOJkcga/t0LQc4SBiiHBQeoGn/APjKYWTWvxGtsmoVQQ32zsMEz4.','customer',NULL,'2024-01-30 15:57:07','2024-01-30 15:57:26',NULL),(7,'Arafat Anwar','anwarullah834@gmail.com','anwarullah834@gmail.com','01234567890',NULL,NULL,NULL,NULL,NULL,NULL,'$2y$12$s0LV8nmJ08GyPdCAXNmhz.6J/M69e1fHdYiJ2UXYGJqzcs2Si9LJ2','customer','e1d77249ca9d89780610573014f31756','2024-01-30 17:00:31','2024-01-30 17:00:31',NULL),(8,'Hridoy','farookhridoy@gmail.com','farookhridoy@gmail.com','01822252198',NULL,NULL,NULL,NULL,NULL,NULL,'$2y$12$bRvoJ4huNKr3ISEbJ4CDYuNR3fcx6JrDn90IaXKmhUy.dzs9Yy89S','customer',NULL,'2024-01-31 03:07:09','2024-01-31 03:07:46',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
