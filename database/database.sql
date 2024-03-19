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
/*Table structure for table `account_classes` */

DROP TABLE IF EXISTS `account_classes`;

CREATE TABLE `account_classes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci,
  `is_debit_positive` int(11) NOT NULL DEFAULT '1',
  `is_credit_positive` int(11) NOT NULL DEFAULT '0',
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_classes_created_by_foreign` (`created_by`),
  KEY `account_classes_updated_by_foreign` (`updated_by`),
  CONSTRAINT `account_classes_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `account_classes_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `account_classes` */

insert  into `account_classes`(`id`,`name`,`desc`,`is_debit_positive`,`is_credit_positive`,`created_by`,`updated_by`,`created_at`,`updated_at`,`deleted_at`) values (1,'Assets',NULL,1,0,1,NULL,'2022-08-09 12:37:39','2022-08-09 12:37:39',NULL),(2,'Equity',NULL,0,1,1,NULL,'2022-08-09 12:37:39','2022-08-09 12:37:39',NULL),(3,'Liabilities',NULL,0,1,1,NULL,'2022-08-09 12:37:39','2022-08-09 12:37:39',NULL),(4,'Incomes',NULL,0,1,1,NULL,'2022-08-09 12:37:39','2022-08-09 12:37:39',NULL),(5,'Expenses',NULL,1,0,1,NULL,'2022-08-09 12:37:39','2022-08-09 12:37:39',NULL);

/*Table structure for table `account_default_settings` */

DROP TABLE IF EXISTS `account_default_settings`;

CREATE TABLE `account_default_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `supplier_payable` bigint(20) NOT NULL DEFAULT '0',
  `supplier_payable_purchase` bigint(20) NOT NULL DEFAULT '0',
  `supplier_payable_discount` bigint(20) NOT NULL DEFAULT '0',
  `supplier_advance` bigint(20) NOT NULL DEFAULT '0',
  `bank_account_group` bigint(20) NOT NULL DEFAULT '0',
  `inventory_account` bigint(20) NOT NULL DEFAULT '0',
  `cogs_account` bigint(20) NOT NULL DEFAULT '0',
  `inventory_adjustments_account` bigint(20) NOT NULL DEFAULT '0',
  `fixed_asset_account` bigint(20) NOT NULL DEFAULT '0',
  `cwip_account` bigint(20) NOT NULL DEFAULT '0',
  `cwip_asset_account` bigint(20) NOT NULL DEFAULT '0',
  `fixed_asset_adjustment_account` bigint(20) NOT NULL DEFAULT '0',
  `sales_account` bigint(20) NOT NULL DEFAULT '0',
  `sales_discount_account` bigint(20) NOT NULL DEFAULT '0',
  `receivables_account` bigint(20) NOT NULL DEFAULT '0',
  `payment_discount_account` bigint(20) NOT NULL DEFAULT '0',
  `depreciation_cost_account` bigint(20) NOT NULL DEFAULT '0',
  `depreciation_disposal_account` bigint(20) NOT NULL DEFAULT '0',
  `petty_cash_account` bigint(20) NOT NULL DEFAULT '0',
  `cash_in_hand_account` bigint(20) NOT NULL DEFAULT '0',
  `grir_account` bigint(20) NOT NULL DEFAULT '0',
  `supplier_payable_account` bigint(20) NOT NULL DEFAULT '0',
  `supplier_payable_purchase_account` bigint(20) NOT NULL DEFAULT '0',
  `supplier_payable_discount_account` bigint(20) NOT NULL DEFAULT '0',
  `supplier_advance_account` bigint(20) NOT NULL DEFAULT '0',
  `bank_account` bigint(20) NOT NULL DEFAULT '0',
  `bank_interest_account` bigint(20) NOT NULL DEFAULT '0',
  `bank_charges_account` bigint(20) NOT NULL DEFAULT '0',
  `vat_payable` bigint(20) NOT NULL DEFAULT '0',
  `tax_payable` bigint(20) NOT NULL DEFAULT '0',
  `currency_id` bigint(20) NOT NULL DEFAULT '0',
  `currency_carry_account` bigint(20) NOT NULL DEFAULT '0',
  `currency_gain_loss_account` bigint(20) NOT NULL DEFAULT '0',
  `balance_sheet_items` text COLLATE utf8mb4_unicode_ci,
  `profit_loss_items` text COLLATE utf8mb4_unicode_ci,
  `retained_earnings` bigint(20) DEFAULT '0',
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_default_settings_created_by_foreign` (`created_by`),
  KEY `account_default_settings_updated_by_foreign` (`updated_by`),
  CONSTRAINT `account_default_settings_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `account_default_settings_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `account_default_settings` */

insert  into `account_default_settings`(`id`,`supplier_payable`,`supplier_payable_purchase`,`supplier_payable_discount`,`supplier_advance`,`bank_account_group`,`inventory_account`,`cogs_account`,`inventory_adjustments_account`,`fixed_asset_account`,`cwip_account`,`cwip_asset_account`,`fixed_asset_adjustment_account`,`sales_account`,`sales_discount_account`,`receivables_account`,`payment_discount_account`,`depreciation_cost_account`,`depreciation_disposal_account`,`petty_cash_account`,`cash_in_hand_account`,`grir_account`,`supplier_payable_account`,`supplier_payable_purchase_account`,`supplier_payable_discount_account`,`supplier_advance_account`,`bank_account`,`bank_interest_account`,`bank_charges_account`,`vat_payable`,`tax_payable`,`currency_id`,`currency_carry_account`,`currency_gain_loss_account`,`balance_sheet_items`,`profit_loss_items`,`retained_earnings`,`created_by`,`updated_by`,`created_at`,`updated_at`,`deleted_at`) values (1,48,49,50,66,51,16,184,130,49,203,49,50,200,57,14,37,118,58,130,187,201,188,189,190,191,131,59,132,197,28,1,212,210,'[\"1\",\"2\",\"3\"]','[\"4\",\"5\"]',1506,1,22,'2022-08-26 04:49:38','2024-03-12 10:59:24',NULL);

/*Table structure for table `account_groups` */

DROP TABLE IF EXISTS `account_groups`;

CREATE TABLE `account_groups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NOT NULL DEFAULT '0',
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_code_starts_at` int(11) NOT NULL DEFAULT '0',
  `group_code_ends_at` int(11) NOT NULL DEFAULT '0',
  `coa_code_starts_at` int(11) NOT NULL DEFAULT '0',
  `coa_code_ends_at` int(11) NOT NULL DEFAULT '0',
  `account_class_id` bigint(20) unsigned NOT NULL DEFAULT '1',
  `is_reviewed` enum('pending','approved','denied') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `is_assessed` enum('pending','approved','denied') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `is_approved` enum('pending','approved','denied') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_groups_created_by_foreign` (`created_by`),
  KEY `account_groups_updated_by_foreign` (`updated_by`),
  KEY `account_groups_account_class_id_foreign` (`account_class_id`),
  CONSTRAINT `account_groups_account_class_id_foreign` FOREIGN KEY (`account_class_id`) REFERENCES `account_classes` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `account_groups_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `account_groups_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=185 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `account_groups` */

insert  into `account_groups`(`id`,`parent_id`,`code`,`name`,`group_code_starts_at`,`group_code_ends_at`,`coa_code_starts_at`,`coa_code_ends_at`,`account_class_id`,`is_reviewed`,`is_assessed`,`is_approved`,`created_by`,`updated_by`,`created_at`,`updated_at`,`deleted_at`) values (118,0,'1000000000','ASSETS',0,0,0,0,1,'approved','approved','approved',1,NULL,'2024-03-11 13:01:49','2024-03-11 13:01:49',NULL),(119,118,'1010000000','Non Current Assets',0,0,0,0,1,'approved','approved','approved',1,NULL,'2024-03-11 13:01:49','2024-03-11 13:01:49',NULL),(120,119,'1010100000','Property, plant & equipment',0,0,0,0,1,'approved','approved','approved',1,NULL,'2024-03-11 13:01:49','2024-03-11 13:01:49',NULL),(121,119,'1010200000','Accumulated Depreciation',0,0,0,0,1,'approved','approved','approved',1,NULL,'2024-03-11 13:01:49','2024-03-11 13:01:49',NULL),(122,119,'1010300000','Other Non Current Assets',0,0,0,0,1,'approved','approved','approved',1,NULL,'2024-03-11 13:01:49','2024-03-11 13:01:49',NULL),(123,118,'1020000000','Current Assets',0,0,0,0,1,'approved','approved','approved',1,NULL,'2024-03-11 13:01:49','2024-03-11 13:01:49',NULL),(124,123,'1020100000','Inventories',0,0,0,0,1,'approved','approved','approved',1,NULL,'2024-03-11 13:01:49','2024-03-11 13:01:49',NULL),(125,123,'1020200000','Accounts Receivable',0,0,0,0,1,'approved','approved','approved',1,NULL,'2024-03-11 13:01:49','2024-03-11 13:01:49',NULL),(126,125,'1020201000','Accounts Receivable-Trade',0,0,0,0,1,'approved','approved','approved',1,NULL,'2024-03-11 13:01:49','2024-03-11 13:01:49',NULL),(127,125,'1020202000','Provision for doubtful debts - AR Trade',0,0,0,0,1,'approved','approved','approved',1,NULL,'2024-03-11 13:01:49','2024-03-11 13:01:49',NULL),(128,125,'1020203000','Accounts Receivable-Acquirer Bank',0,0,0,0,1,'approved','approved','approved',1,NULL,'2024-03-11 13:01:49','2024-03-11 13:01:49',NULL),(129,123,'1020300000','Intercompany Balances',0,0,0,0,1,'approved','approved','approved',1,NULL,'2024-03-11 13:01:49','2024-03-11 13:01:49',NULL),(130,129,'1020301000','Intercompany Receivables',0,0,0,0,1,'approved','approved','approved',1,NULL,'2024-03-11 13:01:49','2024-03-11 13:01:49',NULL),(131,129,'1020302000','Provision for doubtful debts - AR Intercompany',0,0,0,0,1,'approved','approved','approved',1,NULL,'2024-03-11 13:01:49','2024-03-11 13:01:49',NULL),(132,129,'1020401000','Other Receivables',0,0,0,0,1,'approved','approved','approved',1,NULL,'2024-03-11 13:01:49','2024-03-11 13:01:49',NULL),(133,123,'1030400000','Advance, Deposits & Prepayments',0,0,0,0,1,'approved','approved','approved',1,NULL,'2024-03-11 13:01:49','2024-03-11 13:01:49',NULL),(134,133,'1030401000','Advances',0,0,0,0,1,'approved','approved','approved',1,NULL,'2024-03-11 13:01:49','2024-03-11 13:01:49',NULL),(135,133,'1030402000','Deposits',0,0,0,0,1,'approved','approved','approved',1,NULL,'2024-03-11 13:01:49','2024-03-11 13:01:49',NULL),(136,133,'1030403000','Top Up Recharge Current Account',0,0,0,0,1,'approved','approved','approved',1,NULL,'2024-03-11 13:01:49','2024-03-11 13:01:49',NULL),(137,133,'1030404000','SMS Recharge Current Account',0,0,0,0,1,'approved','approved','approved',1,NULL,'2024-03-11 13:01:49','2024-03-11 13:01:49',NULL),(138,123,'1030500000','Advance Income Tax',0,0,0,0,1,'approved','approved','approved',1,NULL,'2024-03-11 13:01:49','2024-03-11 13:01:49',NULL),(139,123,'1030600000','VAT Recoverable',0,0,0,0,1,'approved','approved','approved',1,NULL,'2024-03-11 13:01:49','2024-03-11 13:01:49',NULL),(140,123,'1030700000','Cash & Cash Equivalent',0,0,0,0,1,'approved','approved','approved',1,NULL,'2024-03-11 13:01:49','2024-03-11 13:01:49',NULL),(141,140,'1030701000','Cash in Hand',0,0,0,0,1,'approved','approved','approved',1,NULL,'2024-03-11 13:01:49','2024-03-11 13:01:49',NULL),(142,140,'1030702000','Cash at Bank',0,0,0,0,1,'approved','approved','approved',1,NULL,'2024-03-11 13:01:49','2024-03-11 13:01:49',NULL),(143,140,'1030703000','TCSA Bank Account',0,0,0,0,1,'approved','approved','approved',1,NULL,'2024-03-11 13:01:49','2024-03-11 13:01:49',NULL),(144,140,'1030704000','Invest in FDR & SND',0,0,0,0,1,'approved','approved','approved',1,NULL,'2024-03-11 13:01:49','2024-03-11 13:01:49',NULL),(145,0,'2000000000','EQUITY',0,0,0,0,2,'approved','approved','approved',1,NULL,'2024-03-11 13:01:49','2024-03-11 13:01:49',NULL),(146,145,'2010000000','Capital & Reserves',0,0,0,0,2,'approved','approved','approved',1,NULL,'2024-03-11 13:01:49','2024-03-11 13:01:49',NULL),(147,0,'3000000000','LIABILITIES',0,0,0,0,3,'approved','approved','approved',1,NULL,'2024-03-11 13:01:49','2024-03-11 13:01:49',NULL),(148,147,'3010000000','Non Current Liability',0,0,0,0,3,'approved','approved','approved',1,NULL,'2024-03-11 13:01:49','2024-03-11 13:01:49',NULL),(149,148,'3010100000','Term Loan',0,0,0,0,3,'approved','approved','approved',1,NULL,'2024-03-11 13:01:49','2024-03-11 13:01:49',NULL),(150,148,'3010300000','Deferred Tax',0,0,0,0,3,'approved','approved','approved',1,NULL,'2024-03-11 13:01:49','2024-03-11 13:01:49',NULL),(151,147,'3020000000','Current Liabilities',0,0,0,0,3,'approved','approved','approved',1,NULL,'2024-03-11 13:01:49','2024-03-11 13:01:49',NULL),(152,151,'3020100000','Trade & Other Payables',0,0,0,0,3,'approved','approved','approved',1,NULL,'2024-03-11 13:01:49','2024-03-11 13:01:49',NULL),(153,152,'3020101000','Vendor Payable',0,0,0,0,3,'approved','approved','approved',1,NULL,'2024-03-11 13:01:49','2024-03-11 13:01:49',NULL),(154,152,'3020102000','Other Payable',0,0,0,0,3,'approved','approved','approved',1,NULL,'2024-03-11 13:01:49','2024-03-11 13:01:49',NULL),(155,151,'3020200000','Merchant Payable',0,0,0,0,3,'approved','approved','approved',1,NULL,'2024-03-11 13:01:49','2024-03-11 13:01:49',NULL),(156,151,'3020300000','Liabilities For Expenses',0,0,0,0,3,'approved','approved','approved',1,NULL,'2024-03-11 13:01:49','2024-03-11 13:01:49',NULL),(157,151,'3020400000','Deferred Revenue',0,0,0,0,3,'approved','approved','approved',1,NULL,'2024-03-11 13:01:49','2024-03-11 13:01:49',NULL),(158,151,'3020500000','Inter Company Payable',0,0,0,0,3,'approved','approved','approved',1,NULL,'2024-03-11 13:01:49','2024-03-11 13:01:49',NULL),(159,151,'3020600000','Short Term Loan',0,0,0,0,3,'approved','approved','approved',1,NULL,'2024-03-11 13:01:49','2024-03-11 13:01:49',NULL),(160,151,'3020700000','Bank Overdraft',0,0,0,0,3,'approved','approved','approved',1,NULL,'2024-03-11 13:01:49','2024-03-11 13:01:49',NULL),(161,151,'3020800000','Lease Finance',0,0,0,0,3,'approved','approved','approved',1,NULL,'2024-03-11 13:01:49','2024-03-11 13:01:49',NULL),(162,151,'3020900000','Other Liabilities',0,0,0,0,3,'approved','approved','approved',1,NULL,'2024-03-11 13:01:49','2024-03-11 13:01:49',NULL),(163,0,'4000000000','REVENUE',0,0,0,0,4,'approved','approved','approved',1,NULL,'2024-03-11 13:01:49','2024-03-11 13:01:49',NULL),(164,163,'4010000000','Business Revenue',0,0,0,0,4,'approved','approved','approved',1,NULL,'2024-03-11 13:01:49','2024-03-11 13:01:49',NULL),(165,163,'4020000000','Output VAT',0,0,0,0,4,'approved','approved','approved',1,NULL,'2024-03-11 13:01:49','2024-03-11 13:01:49',NULL),(166,0,'5000000000','COST OF REVENUE',0,0,0,0,5,'approved','approved','approved',1,NULL,'2024-03-11 13:01:49','2024-03-11 13:01:49',NULL),(167,166,'5010000000','Purchases',0,0,0,0,5,'approved','approved','approved',1,NULL,'2024-03-11 13:01:49','2024-03-11 13:01:49',NULL),(168,166,'5020000000','Other Directly Atrributable Cost of Revenue',0,0,0,0,5,'approved','approved','approved',1,NULL,'2024-03-11 13:01:49','2024-03-11 13:01:49',NULL),(169,168,'5020100000','Depreciation (Service)',0,0,0,0,5,'approved','approved','approved',1,NULL,'2024-03-11 13:01:49','2024-03-11 13:01:49',NULL),(170,168,'5020200000','Direct Salary and Allowances',0,0,0,0,5,'approved','approved','approved',1,NULL,'2024-03-11 13:01:49','2024-03-11 13:01:49',NULL),(171,0,'6000000000','ADMINISTRATION EXPENSE',0,0,0,0,5,'approved','approved','approved',1,NULL,'2024-03-11 13:01:49','2024-03-11 13:01:49',NULL),(172,171,'6010100000','General Admin Overhead',0,0,0,0,5,'approved','approved','approved',1,NULL,'2024-03-11 13:01:49','2024-03-11 13:01:49',NULL),(173,171,'6010200000','Depreciation (Admin)',0,0,0,0,5,'approved','approved','approved',1,NULL,'2024-03-11 13:01:49','2024-03-11 13:01:49',NULL),(174,0,'7000000000','SELLING & DISTRIBUTION EXPENSE',0,0,0,0,5,'approved','approved','approved',1,NULL,'2024-03-11 13:01:49','2024-03-11 13:01:49',NULL),(175,174,'7010000000','Promotional Expense',0,0,0,0,5,'approved','approved','approved',1,NULL,'2024-03-11 13:01:49','2024-03-11 13:01:49',NULL),(176,174,'7020000000','Other Selling Expenses',0,0,0,0,5,'approved','approved','approved',1,NULL,'2024-03-11 13:01:49','2024-03-11 13:01:49',NULL),(177,0,'8000000000','FINANCIAL EXPENSES',0,0,0,0,5,'approved','approved','approved',1,NULL,'2024-03-11 13:01:49','2024-03-11 13:01:49',NULL),(178,177,'8010000000','Bank Charges & Others',0,0,0,0,5,'approved','approved','approved',1,NULL,'2024-03-11 13:01:49','2024-03-11 13:01:49',NULL),(179,177,'8020000000','Interest Expense',0,0,0,0,5,'approved','approved','approved',1,NULL,'2024-03-11 13:01:49','2024-03-11 13:01:49',NULL),(180,0,'9000000000','Other Income',0,0,0,0,4,'approved','approved','approved',1,22,'2024-03-11 13:01:49','2024-03-18 11:32:43',NULL),(181,180,'9010000000','Interest Income',0,0,0,0,4,'approved','approved','approved',1,22,'2024-03-11 13:01:49','2024-03-18 11:32:50',NULL),(182,180,'9020000000','Non Operating Income',0,0,0,0,5,'approved','approved','approved',1,NULL,'2024-03-11 13:01:49','2024-03-11 13:01:49',NULL),(183,0,'10000000000','INCOME TAXES',0,0,0,0,5,'approved','approved','approved',1,NULL,'2024-03-11 13:01:49','2024-03-11 13:01:49',NULL),(184,148,'3010200000','Leases',0,0,0,0,3,'approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL);

/*Table structure for table `activity_log` */

DROP TABLE IF EXISTS `activity_log`;

CREATE TABLE `activity_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `log_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` bigint(20) unsigned DEFAULT NULL,
  `causer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` bigint(20) unsigned DEFAULT NULL,
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subject` (`subject_type`,`subject_id`),
  KEY `causer` (`causer_type`,`causer_id`),
  KEY `activity_log_log_name_index` (`log_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `activity_log` */

/*Table structure for table `advance_categories` */

DROP TABLE IF EXISTS `advance_categories`;

CREATE TABLE `advance_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `chart_of_account_id` bigint(20) unsigned NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `advance_categories_chart_of_account_id_foreign` (`chart_of_account_id`),
  KEY `advance_categories_created_by_foreign` (`created_by`),
  KEY `advance_categories_updated_by_foreign` (`updated_by`),
  CONSTRAINT `advance_categories_chart_of_account_id_foreign` FOREIGN KEY (`chart_of_account_id`) REFERENCES `chart_of_accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `advance_categories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `advance_categories_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `advance_categories` */

insert  into `advance_categories`(`id`,`code`,`name`,`chart_of_account_id`,`description`,`created_by`,`updated_by`,`created_at`,`updated_at`,`deleted_at`) values (1,'A','Advance posting',191,'Advance posting',22,22,'2022-10-19 16:09:20','2022-10-19 16:15:01',NULL),(2,'I','Prepaid Insurance',191,'Prepaid Insurance',22,NULL,'2022-10-19 16:15:43','2022-10-19 16:15:43',NULL),(3,'R','Prepaid Rent',191,'Prepaid Rent',22,NULL,'2022-10-19 16:16:22','2022-10-19 16:16:22',NULL);

/*Table structure for table `alignables` */

DROP TABLE IF EXISTS `alignables`;

CREATE TABLE `alignables` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `department_hr_department_id` bigint(20) NOT NULL,
  `alignable_id` bigint(20) NOT NULL,
  `alignable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `alignables` */

/*Table structure for table `approval_levels` */

DROP TABLE IF EXISTS `approval_levels`;

CREATE TABLE `approval_levels` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `approval_levels_created_by_foreign` (`created_by`),
  KEY `approval_levels_updated_by_foreign` (`updated_by`),
  CONSTRAINT `approval_levels_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `approval_levels_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `approval_levels` */

insert  into `approval_levels`(`id`,`code`,`name`,`created_by`,`updated_by`,`deleted_at`,`created_at`,`updated_at`) values (1,'01','Review',22,NULL,NULL,'2024-03-02 12:05:43','2024-03-02 12:10:14'),(2,'02','Audit',22,22,NULL,'2024-03-02 12:05:52','2024-03-02 12:07:17'),(3,'03','Approval',22,22,NULL,'2024-03-02 12:06:01','2024-03-02 12:07:25');

/*Table structure for table `approval_range_setups` */

DROP TABLE IF EXISTS `approval_range_setups`;

CREATE TABLE `approval_range_setups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `min_amount` decimal(15,2) NOT NULL,
  `max_amount` decimal(15,2) NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `approval_range_setups` */

insert  into `approval_range_setups`(`id`,`min_amount`,`max_amount`,`created_by`,`updated_by`,`created_at`,`updated_at`,`deleted_at`) values (2,1.00,100000000.00,1,1,'2022-01-18 12:15:43','2022-06-02 18:59:58',NULL),(3,1.00,999999999.00,1,1,'2022-01-19 00:20:18','2022-06-02 19:08:27',NULL),(4,1.00,100000000.00,1,1,'2022-01-19 00:21:33','2022-06-02 18:59:36',NULL);

/*Table structure for table `asset_costing_entries` */

DROP TABLE IF EXISTS `asset_costing_entries`;

CREATE TABLE `asset_costing_entries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `supplier_id` bigint(20) unsigned DEFAULT '0',
  `purchase_order_id` bigint(20) unsigned NOT NULL,
  `goods_received_items_stock_in_id` bigint(20) unsigned DEFAULT '5',
  `requisition_delivery_item_id` bigint(20) unsigned NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `cost` double NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `attachments` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `asset_costing_entries_purchase_order_id_foreign` (`purchase_order_id`),
  KEY `asset_costing_entries_created_by_foreign` (`created_by`),
  KEY `asset_costing_entries_updated_by_foreign` (`updated_by`),
  KEY `asset_costing_entries_product_id_foreign` (`requisition_delivery_item_id`),
  KEY `asset_costing_entries_goods_received_items_stock_in_id_foreign` (`goods_received_items_stock_in_id`),
  CONSTRAINT `asset_costing_entries_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `asset_costing_entries_goods_received_items_stock_in_id_foreign` FOREIGN KEY (`goods_received_items_stock_in_id`) REFERENCES `goods_received_items_stock_in` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `asset_costing_entries_purchase_order_id_foreign` FOREIGN KEY (`purchase_order_id`) REFERENCES `purchase_orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `asset_costing_entries_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `asset_costing_entries` */

/*Table structure for table `attribute_options` */

DROP TABLE IF EXISTS `attribute_options`;

CREATE TABLE `attribute_options` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_options_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `attribute_options_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `attribute_options` */

insert  into `attribute_options`(`id`,`attribute_id`,`name`,`description`,`created_at`,`updated_at`,`deleted_at`) values (1,1,'XL',NULL,NULL,'2022-12-24 14:52:39',NULL),(2,1,'L',NULL,NULL,NULL,NULL),(3,1,'M','For All',NULL,'2022-06-23 02:03:13',NULL),(4,1,'S',NULL,NULL,NULL,NULL),(5,2,'Red',NULL,NULL,NULL,NULL),(6,2,'Blue',NULL,NULL,NULL,NULL),(7,2,'Green',NULL,NULL,NULL,NULL),(8,2,'Yellow',NULL,NULL,NULL,NULL),(9,2,'Black',NULL,NULL,NULL,NULL),(10,2,'White',NULL,NULL,NULL,NULL),(11,3,'2020',NULL,NULL,NULL,NULL),(12,3,'2021',NULL,NULL,NULL,NULL),(13,3,'2022',NULL,NULL,NULL,NULL),(14,4,'1 Metre',NULL,NULL,NULL,NULL),(15,4,'2 Metre',NULL,NULL,NULL,NULL),(16,4,'3 Metre',NULL,NULL,NULL,NULL),(17,4,'4 Metre',NULL,NULL,NULL,NULL),(18,4,'5 Metre',NULL,NULL,NULL,NULL),(19,5,'1 Metre',NULL,NULL,NULL,NULL),(20,5,'2 Metre',NULL,NULL,NULL,NULL),(21,5,'3 Metre',NULL,NULL,NULL,NULL),(22,6,'Toyota',NULL,NULL,NULL,NULL),(23,6,'BMW',NULL,NULL,NULL,NULL),(24,6,'Tata',NULL,NULL,NULL,NULL),(25,6,'Corrola',NULL,NULL,NULL,NULL),(26,7,'option-1','option 1 description','2022-05-13 15:59:41','2022-05-13 15:59:41',NULL),(27,7,'option-2','option 2 description','2022-05-13 15:59:57','2022-05-13 15:59:57',NULL),(28,8,'PCC','Portland Composite Cement','2022-05-19 18:04:37','2022-05-19 18:04:37',NULL),(29,8,'OPC','Ordinary Portland Composite Cement','2022-05-19 18:04:57','2022-05-19 18:04:57',NULL),(30,7,'test12',NULL,'2022-05-23 14:45:24','2022-05-23 14:45:24',NULL),(31,7,'test3211',NULL,'2022-05-25 17:28:38','2022-05-25 17:29:45',NULL),(32,1,'A4','For Paper','2022-05-30 03:07:03','2022-05-30 03:07:03',NULL),(33,1,'A3','for Paper','2022-05-30 03:07:14','2022-05-30 03:07:14',NULL),(34,1,'Legal','For Paper','2022-05-30 03:07:24','2022-05-30 03:07:24',NULL),(35,9,'Paper One','For Paper','2022-05-30 03:08:55','2022-05-30 03:08:55',NULL),(36,9,'Fresh','For Paper','2022-05-30 03:09:06','2022-05-30 03:09:06',NULL),(37,10,'60 GSM','For Paper','2022-05-30 03:09:46','2022-05-30 03:09:46',NULL),(38,10,'80 GSM','For Paper','2022-05-30 03:09:56','2022-05-30 03:09:56',NULL),(39,9,'Oreo','For Biscuit','2022-05-30 03:14:27','2022-05-30 03:14:27',NULL),(40,9,'Lexus','For Biscuit','2022-05-30 03:14:44','2022-05-30 03:14:44',NULL),(41,9,'Link','For Pen','2022-05-30 13:01:15','2022-05-30 13:01:15',NULL),(42,9,'Pilot','For Pen','2022-05-30 13:01:28','2022-05-30 13:01:28',NULL),(43,9,'Matador','For Pen','2022-05-30 13:01:41','2022-05-30 13:01:41',NULL),(44,1,'0.5 mm','For Pen','2022-06-22 17:19:31','2022-06-22 17:19:31',NULL),(45,1,'0.4 mm','For Pen','2022-06-22 17:19:41','2022-06-22 17:19:41',NULL),(46,1,'0.7 mm','For Pen','2022-06-22 17:19:51','2022-06-22 17:19:51',NULL),(47,11,'8 GB',NULL,'2023-11-06 11:20:30','2023-11-06 11:20:54',NULL),(48,11,'16 GB',NULL,'2023-11-06 11:20:37','2023-11-06 11:20:37',NULL),(49,12,'256 GB',NULL,'2023-11-06 11:21:08','2023-11-06 11:21:08',NULL),(50,12,'512 GB',NULL,'2023-11-06 11:21:13','2023-11-06 11:21:13',NULL),(51,13,'Core I5',NULL,'2023-11-06 11:21:28','2023-11-06 11:21:28',NULL),(52,13,'Core I7',NULL,'2023-11-06 11:21:33','2023-11-06 11:21:33',NULL);

/*Table structure for table `attributes` */

DROP TABLE IF EXISTS `attributes`;

CREATE TABLE `attributes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `searchable` enum('yes','no') COLLATE utf8mb4_unicode_ci DEFAULT 'yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `attributes` */

insert  into `attributes`(`id`,`code`,`name`,`description`,`searchable`,`created_at`,`updated_at`,`deleted_at`) values (1,'Size','Size','Size Attributes','yes',NULL,'2022-12-27 12:49:27',NULL),(2,'Color','Color','Color Attributes','yes',NULL,NULL,NULL),(3,'Year','Year','Year Attributes','yes',NULL,NULL,NULL),(4,'Length','Length','Length Attributes','yes',NULL,NULL,NULL),(5,'Width','Width','Width Attributes','yes',NULL,NULL,NULL),(6,'Models','Models','Models Attributes','yes',NULL,NULL,NULL),(7,'Test','Test','test Attributes Description','yes','2022-05-13 15:59:08','2022-05-13 15:59:08',NULL),(8,'Type','Type','Type of Cement','yes','2022-05-19 18:02:06','2022-05-19 18:02:06',NULL),(9,'Brand','Brand','For Paper','yes','2022-05-30 03:08:28','2022-05-30 03:08:28',NULL),(10,'Thickness','Thickness','For Paper','yes','2022-05-30 03:09:32','2022-05-30 03:09:32',NULL),(11,'RAM','RAM',NULL,'yes','2023-11-06 11:20:05','2023-11-06 11:20:05',NULL),(12,'ROM','ROM',NULL,'yes','2023-11-06 11:20:12','2023-11-06 11:20:12',NULL),(13,'CPU','CPU',NULL,'yes','2023-11-06 11:20:18','2023-11-06 11:20:18',NULL);

/*Table structure for table `bank_account_types` */

DROP TABLE IF EXISTS `bank_account_types`;

CREATE TABLE `bank_account_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bank_account_types_created_by_foreign` (`created_by`),
  KEY `bank_account_types_updated_by_foreign` (`updated_by`),
  CONSTRAINT `bank_account_types_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bank_account_types_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `bank_account_types` */

insert  into `bank_account_types`(`id`,`code`,`name`,`description`,`created_by`,`updated_by`,`deleted_at`,`created_at`,`updated_at`) values (6,'01','Current Despost Account','Current Despost Account',1,NULL,NULL,'2024-03-12 09:43:47','2024-03-12 09:43:47'),(7,'02','Notice Account','Notice Account',1,NULL,NULL,'2024-03-12 09:43:59','2024-03-12 09:43:59'),(8,'03','Super Value Corporate Account','Super Value Corporate Account',1,NULL,NULL,'2024-03-12 09:44:11','2024-03-12 09:44:11'),(9,'04','Short Notice Deposit Account','Short Notice Deposit Account',1,NULL,NULL,'2024-03-12 09:44:22','2024-03-12 09:44:22'),(10,'05','Special Notice Deposit Account','Special Notice Deposit Account',1,NULL,NULL,'2024-03-12 09:44:34','2024-03-12 09:44:34'),(11,'06','Savings Account','Savings Account',1,NULL,NULL,'2024-03-12 09:44:51','2024-03-12 09:44:51'),(12,'07','Short Term Deposit Account','Short Term Deposit Account',1,NULL,NULL,'2024-03-12 09:45:04','2024-03-12 09:45:04'),(13,'08','Savings Account (Virtual Account)','Savings Account (Virtual Account)',1,NULL,NULL,'2024-03-12 09:45:14','2024-03-12 09:45:14'),(14,'09','Short Notice Deposits Corporate Account','Short Notice Deposits Corporate Account',1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31');

/*Table structure for table `bank_accounts` */

DROP TABLE IF EXISTS `bank_accounts`;

CREATE TABLE `bank_accounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_account_type_id` bigint(20) unsigned NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_branch_id` bigint(20) unsigned NOT NULL DEFAULT '1',
  `last_reconciled_date` date DEFAULT NULL,
  `ending_reconcile_balance` decimal(8,2) NOT NULL DEFAULT '0.00',
  `chart_of_account_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `bank_charges_account` bigint(20) unsigned NOT NULL DEFAULT '0',
  `currency_id` bigint(20) unsigned NOT NULL DEFAULT '1',
  `is_reviewed` enum('pending','approved','denied') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `is_assessed` enum('pending','approved','denied') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `is_approved` enum('pending','approved','denied') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bank_accounts_created_by_foreign` (`created_by`),
  KEY `bank_accounts_updated_by_foreign` (`updated_by`),
  KEY `bank_accounts_chart_of_account_id_foreign` (`chart_of_account_id`),
  KEY `bank_accounts_bank_charges_account_foreign` (`bank_charges_account`),
  KEY `bank_accounts_currency_id_foreign` (`currency_id`),
  KEY `bank_accounts_bank_account_type_id_foreign` (`bank_account_type_id`),
  KEY `bank_accounts_bank_branch_id_foreign` (`bank_branch_id`),
  CONSTRAINT `bank_accounts_bank_account_type_id_foreign` FOREIGN KEY (`bank_account_type_id`) REFERENCES `bank_account_types` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `bank_accounts_bank_branch_id_foreign` FOREIGN KEY (`bank_branch_id`) REFERENCES `bank_branches` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `bank_accounts_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bank_accounts_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `bank_accounts_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=229 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `bank_accounts` */

insert  into `bank_accounts`(`id`,`code`,`bank_account_type_id`,`name`,`number`,`bank_branch_id`,`last_reconciled_date`,`ending_reconcile_balance`,`chart_of_account_id`,`bank_charges_account`,`currency_id`,`is_reviewed`,`is_assessed`,`is_approved`,`status`,`created_by`,`updated_by`,`deleted_at`,`created_at`,`updated_at`) values (151,'SSLB54',7,'Software Shop Limited Trust Cum Settlement Account (TCSA)','4002780915430',2,NULL,0.00,1477,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:37:29','2024-03-12 10:37:29'),(152,'SSLB55',6,'Software Shop Limited Trust Cum Settlement Account (TCSA)','00233012450',3,NULL,0.00,1478,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:37:29','2024-03-12 10:37:29'),(153,'SSLB56',6,'Software Shop Limited Trust Cum Settlement Account (TCSA)','1520202149152002',4,NULL,0.00,1479,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:37:29','2024-03-12 10:37:29'),(154,'SSLB57',6,'Software Shop Limited Trust Cum Settlement Account (TCSA)','1221147641001',5,NULL,0.00,1480,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:37:29','2024-03-12 10:37:29'),(155,'SSLB58',8,'Software Shop Limited Trust Cum Settlement Account (TCSA)','1051000002799',6,NULL,0.00,1491,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:37:29','2024-03-12 10:37:29'),(156,'SSLB59',6,'Software Shop Limited Trust Cum Settlement Account (TCSA)','1071080000015',7,NULL,0.00,1481,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:37:29','2024-03-12 10:37:29'),(157,'SSLB60',6,'Software Shop Limited Trust Cum Settlement Account (TCSA)','1271030198257',8,NULL,0.00,1662,0,1,'approved','approved','approved',1,1,1,NULL,'2024-03-12 10:37:29','2024-03-12 10:47:12'),(158,'SSLB61',6,'Software Shop Limited Trust Cum Settlement Account (TCSA)','017611100000376',9,NULL,0.00,1662,0,1,'approved','approved','approved',1,1,1,NULL,'2024-03-12 10:37:29','2024-03-12 10:47:12'),(159,'SSLB62',6,'Software Shop Limited Trust Cum Settlement Account (TCSA)','20504300100034405',10,NULL,0.00,1484,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:37:29','2024-03-12 10:37:29'),(160,'SSLB63',9,'Software Shop Limited Trust Cum Settlement Account (TCSA)','01560320000041',11,NULL,0.00,1493,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:37:29','2024-03-12 10:37:29'),(161,'SSLB64',6,'Software Shop Limited Trust Cum Settlement Account (TCSA)','1301010001617',12,NULL,0.00,1485,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:37:29','2024-03-12 10:37:29'),(162,'SSLB65',6,'Software Shop Limited Trust Cum Settlement Account (TCSA)','1012010159698',13,NULL,0.00,1489,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:37:29','2024-03-12 10:37:29'),(163,'SSLB66',10,'Software Shop Limited Trust Cum Settlement Account (TCSA)','10713100005688',14,NULL,0.00,1492,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:37:29','2024-03-12 10:37:29'),(164,'SSLB67',10,'Software Shop Limited Trust Cum Settlement Account (TCSA)','2128119018623',15,NULL,0.00,1486,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:37:29','2024-03-12 10:37:29'),(165,'SSLB68',6,'Software Shop Limited Trust Cum Settlement Account (TCSA)','1612102000380',16,NULL,0.00,1496,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:37:29','2024-03-12 10:37:29'),(166,'SSLB69',6,'Software Shop Limited Trust Cum Settlement Account (TCSA)','010211100000611',17,NULL,0.00,1487,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:37:29','2024-03-12 10:37:29'),(167,'SSLB70',6,'Software Shop Limited Trust Cum Settlement Account (TCSA)','0032116488101',18,NULL,0.00,1662,0,1,'approved','approved','approved',1,1,1,NULL,'2024-03-12 10:37:29','2024-03-12 10:47:12'),(168,'SSLB71',6,'Software Shop Limited Trust Cum Settlement Account (TCSA)','05120678020201',19,NULL,0.00,1662,0,1,'approved','approved','approved',1,1,1,NULL,'2024-03-12 10:37:29','2024-03-12 10:47:12'),(169,'SSLB72',10,'Software Shop Limited Trust Cum Settlement Account (TCSA)','0941301000000414',20,NULL,0.00,1488,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:37:29','2024-03-12 10:37:29'),(170,'SSLB73',6,'Software Shop Limited Trust Cum Settlement Account (TCSA)','1509230943079',21,NULL,0.00,1495,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:37:29','2024-03-12 10:37:29'),(171,'SSLB01',6,'Software Shop Limited','4002771777000',22,NULL,0.00,1425,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:38:00','2024-03-12 10:38:00'),(172,'SSLB02',6,'Software Shop Limited','00221003149',23,NULL,0.00,1426,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:38:00','2024-03-12 10:38:00'),(173,'SSLB03',6,'Software Shop Limited','07052100327988',24,NULL,0.00,1428,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:38:00','2024-03-12 10:38:00'),(174,'SSLB04',6,'Software Shop Limited','00233011723',25,NULL,0.00,1429,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:38:00','2024-03-12 10:38:00'),(175,'SSLB05',6,'Software Shop Limited','0210010014320',26,NULL,0.00,1430,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:38:00','2024-03-12 10:38:00'),(176,'SSLB06',6,'Software Shop Limited','0650200002657',27,NULL,0.00,1427,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:38:00','2024-03-12 10:38:00'),(177,'SSLB07',6,'Software Shop Limited','1001141003686',28,NULL,0.00,1431,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:38:00','2024-03-12 10:38:00'),(178,'SSLB08',6,'Software Shop Limited','1520202149152001',29,NULL,0.00,1432,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:38:00','2024-03-12 10:38:00'),(179,'SSLB09',11,'Software Shop Limited','1520102149152001',29,NULL,0.00,1433,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:38:00','2024-03-12 10:38:00'),(180,'SSLB10',6,'Software Shop Limited','10011001111000002',30,NULL,0.00,1662,0,1,'approved','approved','approved',1,1,1,NULL,'2024-03-12 10:38:00','2024-03-12 10:47:45'),(181,'SSLB11',6,'Software Shop Limited','1818005767',31,NULL,0.00,1435,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:38:00','2024-03-12 10:38:00'),(182,'SSLB12',14,'Software Shop Limited','0010312595301',32,NULL,0.00,1436,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:38:00','2024-03-12 10:38:00'),(183,'SSLB13',6,'Software Shop Limited','0010312595101',33,NULL,0.00,1437,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:38:00','2024-03-12 10:38:00'),(184,'SSLB14',12,'Software Shop Limited','1051500000289',6,NULL,0.00,1438,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:38:00','2024-03-12 10:38:00'),(185,'SSLB15',6,'Software Shop Limited','1061000000536',34,NULL,0.00,1662,0,1,'approved','approved','approved',1,1,1,NULL,'2024-03-12 10:38:00','2024-03-12 10:47:45'),(186,'SSLB16',6,'Software Shop Limited','1071100008604',35,NULL,0.00,1440,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:38:00','2024-03-12 10:38:00'),(187,'SSLB17',6,'Software Shop Limited','1051290082479',36,NULL,0.00,1441,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:38:00','2024-03-12 10:38:00'),(188,'SSLB18',13,'Software Shop Limited','1051280082490',36,NULL,0.00,1662,0,1,'approved','approved','approved',1,1,1,NULL,'2024-03-12 10:38:00','2024-03-12 10:47:45'),(189,'SSLB19',6,'Software Shop Limited','1051070098652',36,NULL,0.00,1442,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:38:00','2024-03-12 10:38:00'),(190,'SSLB20',6,'Software Shop Limited','0011100118189',37,NULL,0.00,1443,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:38:00','2024-03-12 10:38:00'),(191,'SSLB21',6,'Software Shop Limited',' 017611100000291',38,NULL,0.00,1444,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:38:00','2024-03-12 10:38:00'),(192,'SSLB22',6,'Software Shop Limited','2624070003415',39,NULL,0.00,1662,0,1,'approved','approved','approved',1,1,1,NULL,'2024-03-12 10:38:00','2024-03-12 10:47:45'),(193,'SSLB23',6,'Software Shop Limited','1017773574001',40,NULL,0.00,1445,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:38:00','2024-03-12 10:38:00'),(194,'SSLB24',6,'Software Shop Limited','20501020101063909',41,NULL,0.00,1446,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:38:00','2024-03-12 10:38:00'),(195,'SSLB25',6,'Software Shop Limited','0240210013593',42,NULL,0.00,1447,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:38:00','2024-03-12 10:38:00'),(196,'SSLB26',14,'Software Shop Limited','111813500000011',43,NULL,0.00,1448,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:38:00','2024-03-12 10:38:00'),(197,'SSLB27',6,'Software Shop Limited','013411100007712',44,NULL,0.00,1449,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:38:00','2024-03-12 10:38:00'),(198,'SSLB28',6,'Software Shop Limited','00011050002887',45,NULL,0.00,1450,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:38:00','2024-03-12 10:38:00'),(199,'SSLB29',6,'Software Shop Limited','112311100000304',46,NULL,0.00,1451,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:38:01','2024-03-12 10:38:01'),(200,'SSLB30',6,'Software Shop Limited','00030210013589',47,NULL,0.00,1452,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:38:01','2024-03-12 10:38:01'),(201,'SSLB31',6,'Software Shop Limited','1999001787316',48,NULL,0.00,1453,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:38:01','2024-03-12 10:38:01'),(202,'SSLB32',6,'Software Shop Limited','00020210026558',49,NULL,0.00,1454,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:38:01','2024-03-12 10:38:01'),(203,'SSLB33',6,'Software Shop Limited','1022010023616',50,NULL,0.00,1455,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:38:01','2024-03-12 10:38:01'),(204,'SSLB34',6,'Software Shop Limited','0121020005322',51,NULL,0.00,1456,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:38:01','2024-03-12 10:38:01'),(205,'SSLB35',6,'Software Shop Limited','0111100376044',52,NULL,0.00,1457,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:38:01','2024-03-12 10:38:01'),(206,'SSLB36',6,'Software Shop Limited','0011100100701',53,NULL,0.00,1458,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:38:01','2024-03-12 10:38:01'),(207,'SSLB37',6,'Software Shop Limited','0011100005135',54,NULL,0.00,1459,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:38:01','2024-03-12 10:38:01'),(208,'SSLB38',6,'Software Shop Limited','2128112009199',55,NULL,0.00,1662,0,1,'approved','approved','approved',1,1,1,NULL,'2024-03-12 10:38:01','2024-03-12 10:47:45'),(209,'SSLB39',6,'Software Shop Limited','2775901029901',56,NULL,0.00,1461,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:38:01','2024-03-12 10:38:01'),(210,'SSLB40',6,'Software Shop Limited','0011100000224',57,NULL,0.00,1462,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:38:01','2024-03-12 10:38:01'),(211,'SSLB41',6,'Software Shop Limited','405711100000180',58,NULL,0.00,1463,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:38:01','2024-03-12 10:38:01'),(212,'SSLB42',6,'Software Shop Limited','1001241000365',59,NULL,0.00,1464,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:38:01','2024-03-12 10:38:01'),(213,'SSLB43',6,'Software Shop Limited','0551330001807',60,NULL,0.00,1465,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:38:01','2024-03-12 10:38:01'),(214,'SSLB44',6,'Software Shop Limited','1612102000307',61,NULL,0.00,1466,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:38:01','2024-03-12 10:38:01'),(215,'SSLB45',6,'Software Shop Limited','0067111000980',62,NULL,0.00,1467,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:38:01','2024-03-12 10:38:01'),(216,'SSLB46',6,'Software Shop Limited','003111100008090',63,NULL,0.00,1468,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:38:01','2024-03-12 10:38:01'),(217,'SSLB47',6,'Software Shop Limited','0008133000238',64,NULL,0.00,1469,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:38:01','2024-03-12 10:38:01'),(218,'SSLB48',6,'Software Shop Limited','01116488101',65,NULL,0.00,1470,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:38:01','2024-03-12 10:38:01'),(219,'SSLB49',6,'Software Shop Limited','05420501420201',66,NULL,0.00,1471,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:38:01','2024-03-12 10:38:01'),(220,'SSLB50',6,'Software Shop Limited','1101147641001',67,NULL,0.00,1472,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:38:01','2024-03-12 10:38:01'),(221,'SSLB51',6,'Software Shop Limited','00220210018330',68,NULL,0.00,1473,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:38:01','2024-03-12 10:38:01'),(222,'SSLB52',6,'Software Shop Limited','0021010005741',69,NULL,0.00,1474,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:38:01','2024-03-12 10:38:01'),(223,'SSLB53',6,'Software Shop Limited','0941101000003089',70,NULL,0.00,1475,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:38:01','2024-03-12 10:38:01'),(224,'SSLB54',6,'Software Shop Limited','0012200212492',71,NULL,0.00,1476,0,1,'approved','approved','approved',1,1,NULL,NULL,'2024-03-12 10:38:01','2024-03-12 10:38:01'),(225,'NGB01',6,'NGAGE 360 LIMITED','1051000002079',72,NULL,0.00,1662,0,1,'approved','approved','approved',1,1,1,NULL,'2024-03-12 10:39:43','2024-03-12 10:47:56'),(226,'NGB02',6,'NGAGE 360 LIMITED','\'2052765210001',73,NULL,0.00,1662,0,1,'approved','approved','approved',1,1,1,NULL,'2024-03-12 10:39:43','2024-03-12 10:47:56'),(227,'COMB01',6,'SSLCOMMERZ LIMITED','152010471178',74,NULL,0.00,1662,0,1,'approved','approved','approved',1,1,1,NULL,'2024-03-12 10:41:47','2024-03-12 10:48:03'),(228,'COMB02',6,'SSLCOMMERZ LIMITED','1051000002631',75,NULL,0.00,1662,0,1,'approved','approved','approved',1,1,1,NULL,'2024-03-12 10:41:47','2024-03-12 10:48:03');

/*Table structure for table `bank_branch` */

DROP TABLE IF EXISTS `bank_branch`;

CREATE TABLE `bank_branch` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `bank_id` int(10) unsigned NOT NULL,
  `branch_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `routing_no` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `bank_branch` */

/*Table structure for table `bank_branches` */

DROP TABLE IF EXISTS `bank_branches`;

CREATE TABLE `bank_branches` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `bank_id` bigint(20) unsigned NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `swift_code` text COLLATE utf8mb4_unicode_ci,
  `routing_no` text COLLATE utf8mb4_unicode_ci,
  `address` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bank_branches_bank_id_foreign` (`bank_id`),
  KEY `bank_branches_created_by_foreign` (`created_by`),
  KEY `bank_branches_updated_by_foreign` (`updated_by`),
  CONSTRAINT `bank_branches_bank_id_foreign` FOREIGN KEY (`bank_id`) REFERENCES `banks` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `bank_branches_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bank_branches_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `bank_branches` */

insert  into `bank_branches`(`id`,`bank_id`,`code`,`short_name`,`name`,`swift_code`,`routing_no`,`address`,`description`,`created_by`,`updated_by`,`deleted_at`,`created_at`,`updated_at`) values (2,2,'001','Kawran Bazar.','Kawran Bazar.','020262536','020262536','BSEC Bhaban, 102 Kazi Nazrul Islam Avenue, Dhaka 1215',NULL,1,NULL,NULL,'2024-03-12 10:14:24','2024-03-12 10:14:24'),(3,3,'002','Corporate Branch.','Corporate Branch.','070260854','070260854','Noor Tower, 73 Sonargaon Road, Dhaka 1205',NULL,1,NULL,NULL,'2024-03-12 10:14:24','2024-03-12 10:14:24'),(4,4,'003','Kawran Bazar.','Kawran Bazar.','060261397','060261397','23 New Eskaton Road, Ramna, Dhaka 1000',NULL,1,NULL,NULL,'2024-03-12 10:14:24','2024-03-12 10:14:24'),(5,5,'004','Kawran Bazar.','Kawran Bazar.','225262531','225262531','UTC Building, 8 Panthapath, Kawran Bazar, Tejgaon, Dhaka 1215',NULL,1,NULL,NULL,'2024-03-12 10:14:24','2024-03-12 10:14:24'),(6,6,'005','New Eskaton Branch','New Eskaton Branch','085274248','085274248','Shanta Garden, 50/B New Eskaton Road, Dhaka 1217',NULL,1,NULL,NULL,'2024-03-12 10:14:24','2024-03-12 10:14:24'),(7,7,'006','Kawran Bazar.','Kawran Bazar.','090262537','090262537','BSRS Bhaban, 12 Karwan Bazar, Dhaka 1215',NULL,1,NULL,NULL,'2024-03-12 10:14:24','2024-03-12 10:14:24'),(8,8,'007','Gulshan North Branch.','Gulshan North Branch.','095261904','095261904','Kalpana House, 169 Gulshan Avenue, Gulshan North, Dhaka 1212',NULL,1,NULL,NULL,'2024-03-12 10:14:24','2024-03-12 10:14:24'),(9,9,'008','Kawran Bazar.','Kawran Bazar.','105262530','105262530','40 Kazi Nazrul Islam Avenue, Karwan Bazar, Dhaka',NULL,1,NULL,NULL,'2024-03-12 10:14:24','2024-03-12 10:14:24'),(10,10,'009','Banglamotor Branch','Banglamotor Branch','125270852','125270852','Padma Life Tower, Holding No. 115, Kazi Nazrul Islam Avenue, Ward No.- 35, P.S- Ramna, District- Dhaka',NULL,1,NULL,NULL,'2024-03-12 10:14:24','2024-03-12 10:14:24'),(11,11,'010','Sonargaon Janapath Road Branch','Sonargaon Janapath Road Branch','130260086','130260086','TSL Tower, 1st & 2nd Floor, Plot No- 43, Sector- 12, Sonargaon Janapath Road, Ward no. 51, Dhaka North City Corporation, Thana- Uttara, Dhaka- 1230',NULL,1,NULL,NULL,'2024-03-12 10:14:24','2024-03-12 10:14:24'),(12,12,'011','MTB Tower Branch, Banglamotor.','MTB Tower Branch, Banglamotor.','145270232','145270232','MTB Tower, 111 Kazi Nazrul Islam Avenue, Dhaka 1000',NULL,1,NULL,NULL,'2024-03-12 10:14:24','2024-03-12 10:14:24'),(13,13,'012','Principal Branch','Principal Branch','290260218','290260218','Simple Tree Anarkali, 89 Gulshan Avenue, Gulshan 1, Dhaka 1212',NULL,1,NULL,NULL,'2024-03-12 10:14:24','2024-03-12 10:14:24'),(14,14,'013','Kawran Bazar.','Kawran Bazar.','235262534','235262534','BTMC Bhaban, 7-9 Karwan Bazar, Dhaka 1215',NULL,1,NULL,NULL,'2024-03-12 10:14:24','2024-03-12 10:14:24'),(15,15,'014','Eskaton Branch','Eskaton Branch','170275028','170275028','133 New Eskaton Road, Dhaka 1000',NULL,1,NULL,NULL,'2024-03-12 10:14:24','2024-03-12 10:14:24'),(16,16,'015','Krishi Bhaban Branch.','Krishi Bhaban Branch.','200273761','200273761','Dilkusha, Dhaka 1000',NULL,1,NULL,NULL,'2024-03-12 10:14:24','2024-03-12 10:14:24'),(17,17,'016','Banglamotor Branch','Banglamotor Branch','205270301','205270301','Rupayan Trade Centre, 114 Kazi Nazrul Islam Avenue, Karwan Bazar, Dhaka 1215',NULL,1,NULL,NULL,'2024-03-12 10:14:24','2024-03-12 10:14:24'),(18,18,'017','Gulshan Avenue Branch','Gulshan Avenue Branch','215261726','215261726','67 Gulshan Avenue, Dhaka 1212',NULL,1,NULL,NULL,'2024-03-12 10:14:24','2024-03-12 10:14:24'),(19,19,'018','Dhaka Branch.','Dhaka Branch.','220271514','220271514','24-25 Dilkusha Commercial Area, Dhaka 1000',NULL,1,NULL,NULL,'2024-03-12 10:14:24','2024-03-12 10:14:24'),(20,20,'019','Eskaton Branch','Eskaton Branch','245261396','245261396','Waqf Bhaban, 4 New Eskaton Road, Dhaka',NULL,1,NULL,NULL,'2024-03-12 10:14:24','2024-03-12 10:14:24'),(21,21,'020','Dhaka Branch.','Dhaka Branch.','255271518','255271518','Suvastu Imam Square, 65 Gulshan Avenue, Dhaka 1212',NULL,1,NULL,NULL,'2024-03-12 10:14:24','2024-03-12 10:14:24'),(22,2,'021','Karwan Bazar Branch','Karwan Bazar Branch','020262536','020262536','BSEC Bhaban, 102 Kazi Nazrul Islam Avenue, Dhaka 1215',NULL,1,NULL,NULL,'2024-03-12 10:24:30','2024-03-12 10:24:30'),(23,22,'022','Principal Branch','Principal Branch','30275355','30275355','Taranga Complex, 19 Rajuk Avenue, Motijheel C/A, Dhaka 1000',NULL,1,NULL,NULL,'2024-03-12 10:24:30','2024-03-12 10:24:30'),(24,23,'023','Dhanmondi Branch','Dhanmondi Branch','065261189','065261189','House 81/A, Road 8/A,Satmasjid Road, Dhanmondi, Dhaka 1209',NULL,1,NULL,NULL,'2024-03-12 10:24:30','2024-03-12 10:24:30'),(25,3,'024','Corporate Branch','Corporate Branch','070260854','070260854','Noor Tower, 73 Sonargaon Road, Dhaka 1205',NULL,1,NULL,NULL,'2024-03-12 10:24:30','2024-03-12 10:24:30'),(26,24,'025','Basic Bank Main Branch','Basic Bank Main Branch','055271789','055271789','Bana Shilpa Bhaban, 73 Motijheel C/A, Dhaka 1000',NULL,1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(27,25,'026','Principal Branch','Principal Branch','047271571','047271571','BDBL Bhaban, 8 Rajuk Avenue, Dhaka 1000',NULL,1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(28,26,'027','Corporate Branch','Corporate Branch','315260856','315260856','Khandaker Tower, Ground Floor, 94 Gulshan Avenue, Dhaka 1212',NULL,1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(29,4,'028','New Eskaton Branch','New Eskaton Branch','060261397','060261397','23 New Eskaton Road, Ramna, Dhaka 1000',NULL,1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(30,27,'029','Principal Branch','Principal Branch','320275357','320275357','Chini Shilpa Bhaban-2, 76, Motijheel C/A, Dhaka-1000.',NULL,1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(31,28,'030','Corporate Branch','Corporate Branch','080260857','080260857','Hadi Tower, NW(K)-1, Road No. 50, Kemal Ataturk Avenue, Gulshan 2, Dhaka 1212',NULL,1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(32,29,'031','Gulshan Corporate Branch','Gulshan Corporate Branch','310260851','310260851','Police Plaza Concord (Level 5, Tower 2), Plot 2, Road 144, Gulshan 1, Dhaka 1212',NULL,1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(33,29,'032','Corporate Branch, Police Plaza','Corporate Branch, Police Plaza','310260851','310260851','Police Plaza Concord (Level 5, Tower 2), Plot 2, Road 144, Gulshan 1, Dhaka 1212',NULL,1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(34,6,'033','Kakrail Branch','Kakrail Branch','085273373','085273373','Holding No. 71, Road 13 ( 36 Old), Kakrail, Paltan, Dhaka 1000',NULL,1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(35,7,'034','Karwan Bazar Branch','Karwan Bazar Branch','090262537','090262537','BSRS Bhaban, 12 Karwan Bazar, Dhaka 1215',NULL,1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(36,30,'035','Sonargaon Road Branch, Hatirpul','Sonargaon Road Branch, Hatirpul','095276586','095276586','AHN Tower, 13 & 15 Bir Uttam CR Datta Road (Sonargaon Road), Biponon C/A, Bangla Motor, Ramna, Dhaka',NULL,1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(37,31,'036','New Eskaton Branch','New Eskaton Branch','100275027','100275027','STANDARD CENTER, HOLDING NO 27/1, NEW ESKATON ROAD, DHAKA',NULL,1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(38,9,'037','Karwan Bazar Branch','Karwan Bazar Branch','105262530','105262530','40 Kazi Nazrul Islam Avenue, Karwan Bazar, Dhaka',NULL,1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(39,32,'038','Gulshan Branch','Gulshan Branch','110261726','110261726','South Avenue Tower, 7 Gulshan Avenue, Road 3, Gulshan 1, Dhaka 1212',NULL,1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(40,33,'039','Karwan Bazar Branch','Karwan Bazar Branch','120262531','120262531','Petro Centre Building, 3 Karwan Bazar, Dhaka',NULL,1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(41,34,'040','Local Office Branch','Local Office Branch','125273888','125273888','75 Motijheel Commerical Area, Dhaka 1000',NULL,1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(42,35,'041','Motijheel Branch','Motijheel Branch','130274243','130274243','Surma Tower, 59/2 Purana Paltan, Dhaka 1000',NULL,1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(43,36,'042','Sonargaon Road Branch, Hatirpul','Sonargaon Road Branch, Hatirpul','275276580','275276580','RK Tower, 312 Hatirpul, Sonargaon Road, Dhaka',NULL,1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(44,37,'043','Moghbazar Branch','Moghbazar Branch','140274183','140274183','227 OUTER CIRCULAR ROAD, MOGHBAZAR, DHAKA',NULL,1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(45,38,'044','Corporate Branch, Dilkusha','Corporate Branch, Dilkusha','285271933','285271933','Chini Shilpa Bhaban, 3 Dilkusha C/A, Dhaka 1000',NULL,1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(46,39,'045','Bangla Motor Branch','Bangla Motor Branch','295260813','295260813','Rupayan Trade Center, Banglamotor, Dhaka',NULL,1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(47,12,'046','PANTHA PATH Branch','PANTHA PATH Branch','145263610','145263610','Chandrashila Suvastu Tower, 69/1 Panthapath, Dhaka',NULL,1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(48,40,'047','Dilkusha Branch','Dilkusha Branch','150271905','150271905','48 DILKUSHA COMMERCIAL AREA, DHAKA 1000',NULL,1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(49,41,'048','Motijheel Main Branch','Motijheel Main Branch','160274242','160274242','6 MOTIJHEEL COMMERCIAL AREA, DHAKA 1000',NULL,1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(50,13,'049','Gulshan Branch','Gulshan Branch','290261725','290261725','GULSHAN, DHAKA NORTH, Bangladesh',NULL,1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(51,42,'050','Karwan Bazar Branch','Karwan Bazar Branch','165262538','165262538','HRC Bhaban, 46 Karwan Bazar C/A, Dhaka',NULL,1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(52,43,'051','Kazi Nazrul Islam Avenue Branch','Kazi Nazrul Islam Avenue Branch','280270300','280270300','KAZI NAZRUL ISLAM AVENUE, DHAKA SOUTH, Bangladesh',NULL,1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(53,44,'052','Karwan Bazar Branch','Karwan Bazar Branch','235262534','235262534','BTMC Bhaban, 7-9 Karwan Bazar, Dhaka 1215',NULL,1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(54,45,'053','Narayangonj Branch','Narayangonj Branch','235671183','235671183','Al-Joynal Plaza, Holding No. 56, SM Maleh Road, Tanbazar, Narayanganj',NULL,1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(55,46,'054','New Eskaton Branch','New Eskaton Branch','170275028','170275028','133 New Eskaton Road, Dhaka 1000',NULL,1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(56,47,'055','Moghbazar Branch','Moghbazar Branch','175274187','175274187','13 New Eskaton Road, Moghbazar, Dhaka 1000',NULL,1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(57,48,'056','Dhaka Corporate Branch','Dhaka Corporate Branch','180271517','180271517','65, Dilkusha (First Floor), Dhaka',NULL,1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(58,49,'057','Shahjalal Islami Bank Tower Branch','Shahjalal Islami Bank Tower Branch','190260871','190260871','Shahjalal Islami Bank Tower, Plot No. 4, CWN(C), Gulshan Avenue, Dhaka 1212',NULL,1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(59,50,'058','Principal Branch','Principal Branch','305260211','305260211','Shimanto Kallyan Trust Bhaban, Road No-02, Bir Uttam M.A. Rab Sarak, Shimanto Square, Dhanmondi, Dhaka-1205',NULL,1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(60,51,'059','New Eskaton Branch','New Eskaton Branch','195275029','195275029','27 NEW ESKATON ROAD, RAMNA, DHAKA 1000',NULL,1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(61,52,'060','Krishi Bhaban Branch','Krishi Bhaban Branch','200273761','200273761','Dilkusha, Dhaka 1000',NULL,1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(62,53,'061','SBAC Corporate Branch','SBAC Corporate Branch','270270628','270270628','BSC Tower, (2nd-3rd Floor) 2-3 Rajuk Avenue, Motijheel, Dhaka-1000',NULL,1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(63,17,'062','Corporate Branch, EUNOOS TRADE CENTRE','Corporate Branch, EUNOOS TRADE CENTRE','205271397','205271397','Eunoos Trade Centre, Plot No. 52-53, Dilkusha C/A, Dhaka 1000',NULL,1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(64,54,'063','New Eskaton Branch','New Eskaton Branch','210275025','210275025','Eskaton Tower, 129 New Eskaton Road, Dhaka',NULL,1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(65,55,'064','Gulshan Branch','Gulshan Branch','215261726','215261726','67 Gulshan Avenue, Dhaka 1212',NULL,1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(66,19,'065','Gulshan Branch','Gulshan Branch','220261724','220261724','Uday Tower, 57 Gulshan Avenue, Circle 1, Dhaka 1212',NULL,1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(67,56,'066','Karwan Bazar Branch','Karwan Bazar Branch','225262531','225262531','UTC Building, 8 Panthapath, Kawran Bazar, Tejgaon, Dhaka 1215',NULL,1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(68,57,'067','MILLENIUM CORPORATE BRANCH','MILLENIUM CORPORATE BRANCH','240262958','240262958','Shadhinata Tower, Birshrestha Shaheed Jahangir Gate, 546 Dhaka Cantonment ,Dhaka 1206',NULL,1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(69,58,'068','Gulshan Branch','Gulshan Branch','265261721','265261721','Bahela Tower, 72 Gulshan Avenue, Gulshan 1, Dhaka 1212',NULL,1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(70,20,'069','New Eskaton Branch','New Eskaton Branch','245261396','245261396','Waqf Bhaban, 4 New Eskaton Road, Dhaka',NULL,1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(71,59,'070','New Eskaton Branch','New Eskaton Branch','250276550','250276550','Eastern Tower, Holding No. 51 (Old 20), Rashed Khan Menon Sarak (New Eskaton Road), Ramna, Dhaka',NULL,1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(72,60,'071','Eskaton','Eskaton','085274248','085274248','Shanta Garden, 50/B New Eskaton Road, Dhaka 1217',NULL,1,NULL,NULL,'2024-03-12 10:26:09','2024-03-12 10:26:09'),(73,61,'072','Moghbazar','Moghbazar','060274184','060274184','Arong Plaza, 211 Moghbazar, Dhaka',NULL,1,NULL,NULL,'2024-03-12 10:26:09','2024-03-12 10:26:09'),(74,4,'073','Moghbazar','Moghbazar','060274184','060274184','Arong Plaza, 211 Moghbazar, Dhaka',NULL,1,NULL,NULL,'2024-03-12 10:41:47','2024-03-12 10:41:47'),(75,6,'074','Eskaton Branch','Eskaton Branch','060261397','060261397','Shanta Garden, 50/B New Eskaton Road, Dhaka 1217',NULL,1,NULL,NULL,'2024-03-12 10:41:47','2024-03-12 10:41:47');

/*Table structure for table `bank_reconciliation_statements` */

DROP TABLE IF EXISTS `bank_reconciliation_statements`;

CREATE TABLE `bank_reconciliation_statements` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `bank_account_id` bigint(20) unsigned NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date NOT NULL,
  `book_balance` double DEFAULT '0',
  `bank_interest_earned` double DEFAULT '0',
  `bank_interest_earned_narration` text COLLATE utf8mb4_unicode_ci,
  `bank_balance` double DEFAULT '0',
  `reconciling_amount` double DEFAULT '0',
  `bank_charges` double DEFAULT '0',
  `bank_charges_narration` text COLLATE utf8mb4_unicode_ci,
  `difference` double DEFAULT '0',
  `reconciling_entries` text COLLATE utf8mb4_unicode_ci,
  `pending_entries` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bank_reconciliation_statements_bank_account_id_foreign` (`bank_account_id`),
  KEY `bank_reconciliation_statements_created_by_foreign` (`created_by`),
  KEY `bank_reconciliation_statements_updated_by_foreign` (`updated_by`),
  CONSTRAINT `bank_reconciliation_statements_bank_account_id_foreign` FOREIGN KEY (`bank_account_id`) REFERENCES `bank_accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bank_reconciliation_statements_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bank_reconciliation_statements_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `bank_reconciliation_statements` */

/*Table structure for table `banks` */

DROP TABLE IF EXISTS `banks`;

CREATE TABLE `banks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `banks_created_by_foreign` (`created_by`),
  KEY `banks_updated_by_foreign` (`updated_by`),
  CONSTRAINT `banks_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `banks_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `banks` */

insert  into `banks`(`id`,`code`,`short_name`,`name`,`description`,`created_by`,`updated_by`,`deleted_at`,`created_at`,`updated_at`) values (2,'01','AB Bank Limited','AB Bank Limited','AB Bank Limited',1,NULL,NULL,'2024-03-12 10:14:24','2024-03-12 10:14:24'),(3,'02','Bank Asia Limited','Bank Asia Limited','Bank Asia Limited',1,NULL,NULL,'2024-03-12 10:14:24','2024-03-12 10:14:24'),(4,'03','BRAC Bank Limited','BRAC Bank Limited','BRAC Bank Limited',1,NULL,NULL,'2024-03-12 10:14:24','2024-03-12 10:14:24'),(5,'04','City Bank Limited','City Bank Limited','City Bank Limited',1,NULL,NULL,'2024-03-12 10:14:24','2024-03-12 10:14:24'),(6,'05','Dhaka Bank Limited','Dhaka Bank Limited','Dhaka Bank Limited',1,NULL,NULL,'2024-03-12 10:14:24','2024-03-12 10:14:24'),(7,'06','Dutch Bangla Bank Limited','Dutch Bangla Bank Limited','Dutch Bangla Bank Limited',1,NULL,NULL,'2024-03-12 10:14:24','2024-03-12 10:14:24'),(8,'07','Eastern Bank Limited.','Eastern Bank Limited.','Eastern Bank Limited.',1,NULL,NULL,'2024-03-12 10:14:24','2024-03-12 10:14:24'),(9,'08','First Security Islami Bank Limited','First Security Islami Bank Limited','First Security Islami Bank Limited',1,NULL,NULL,'2024-03-12 10:14:24','2024-03-12 10:14:24'),(10,'09','Islami Bank Bangladesh Limited','Islami Bank Bangladesh Limited','Islami Bank Bangladesh Limited',1,NULL,NULL,'2024-03-12 10:14:24','2024-03-12 10:14:24'),(11,'10','Jamuna Bank Limited','Jamuna Bank Limited','Jamuna Bank Limited',1,NULL,NULL,'2024-03-12 10:14:24','2024-03-12 10:14:24'),(12,'11','Mutual Trust Bank Limited','Mutual Trust Bank Limited','Mutual Trust Bank Limited',1,NULL,NULL,'2024-03-12 10:14:24','2024-03-12 10:14:24'),(13,'12','NRB Bank Limited','NRB Bank Limited','NRB Bank Limited',1,NULL,NULL,'2024-03-12 10:14:24','2024-03-12 10:14:24'),(14,'13','Premier Bank Limited','Premier Bank Limited','Premier Bank Limited',1,NULL,NULL,'2024-03-12 10:14:24','2024-03-12 10:14:24'),(15,'14','Prime Bank Limited','Prime Bank Limited','Prime Bank Limited',1,NULL,NULL,'2024-03-12 10:14:24','2024-03-12 10:14:24'),(16,'15','Sonali Bank limited.','Sonali Bank limited.','Sonali Bank limited.',1,NULL,NULL,'2024-03-12 10:14:24','2024-03-12 10:14:24'),(17,'16','Southeast Bank Limited','Southeast Bank Limited','Southeast Bank Limited',1,NULL,NULL,'2024-03-12 10:14:24','2024-03-12 10:14:24'),(18,'17','Standard Chartered Bank','Standard Chartered Bank','Standard Chartered Bank',1,NULL,NULL,'2024-03-12 10:14:24','2024-03-12 10:14:24'),(19,'18','State Bank of India','State Bank of India','State Bank of India',1,NULL,NULL,'2024-03-12 10:14:24','2024-03-12 10:14:24'),(20,'19','United Commercial Bank Limited','United Commercial Bank Limited','United Commercial Bank Limited',1,NULL,NULL,'2024-03-12 10:14:24','2024-03-12 10:14:24'),(21,'20','Woori Bank Limited.','Woori Bank Limited.','Woori Bank Limited.',1,NULL,NULL,'2024-03-12 10:14:24','2024-03-12 10:14:24'),(22,'21','Bangladesh Commerce Bank Limited','Bangladesh Commerce Bank Limited','Bangladesh Commerce Bank Limited',1,NULL,NULL,'2024-03-12 10:24:30','2024-03-12 10:24:30'),(23,'22','Bank Al Falahh Bangladesh','Bank Al Falahh Bangladesh','Bank Al Falahh Bangladesh',1,NULL,NULL,'2024-03-12 10:24:30','2024-03-12 10:24:30'),(24,'23','Basic Bank Limited','Basic Bank Limited','Basic Bank Limited',1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(25,'24','Bangladesh Development Bank Limited','Bangladesh Development Bank Limited','Bangladesh Development Bank Limited',1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(26,'25','Bengal Commercial Bank Limited','Bengal Commercial Bank Limited','Bengal Commercial Bank Limited',1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(27,'26','Citizens Bank Limited','Citizens Bank Limited','Citizens Bank Limited',1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(28,'27','Commercial Bank of Ceylon PLC','Commercial Bank of Ceylon PLC','Commercial Bank of Ceylon PLC',1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(29,'28','Community Bank Bangladesh Limited','Community Bank Bangladesh Limited','Community Bank Bangladesh Limited',1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(30,'29','Eastern Bank Limited','Eastern Bank Limited','Eastern Bank Limited',1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(31,'30','EXIM Bank Limited','EXIM Bank Limited','EXIM Bank Limited',1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(32,'31','Habib Bank Limited','Habib Bank Limited','Habib Bank Limited',1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(33,'32','IFIC Bank','IFIC Bank','IFIC Bank',1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(34,'33','Islami Bank Limited','Islami Bank Limited','Islami Bank Limited',1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(35,'34','Jamuna Bank','Jamuna Bank','Jamuna Bank',1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(36,'35','Meghna Bank Limited','Meghna Bank Limited','Meghna Bank Limited',1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(37,'36','Mercantile Bank','Mercantile Bank','Mercantile Bank',1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(38,'37','Midland Bank Account','Midland Bank Account','Midland Bank Account',1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(39,'38','Modhumoti Bank Limited.','Modhumoti Bank Limited.','Modhumoti Bank Limited.',1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(40,'39','National Bank Limited','National Bank Limited','National Bank Limited',1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(41,'40','NCC Bank Limited','NCC Bank Limited','NCC Bank Limited',1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(42,'41','One Bank Limited','One Bank Limited','One Bank Limited',1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(43,'42','Padma Bank Limited','Padma Bank Limited','Padma Bank Limited',1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(44,'43','Premier Bank Limited (Karwan Bazar Branch)','Premier Bank Limited (Karwan Bazar Branch)','Premier Bank Limited (Karwan Bazar Branch)',1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(45,'44','Premier Bank Limited (N. Ganj Branch)','Premier Bank Limited (N. Ganj Branch)','Premier Bank Limited (N. Ganj Branch)',1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(46,'45','Prime Bank Account','Prime Bank Account','Prime Bank Account',1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(47,'46','Pubali Bank Limited','Pubali Bank Limited','Pubali Bank Limited',1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(48,'47','Rajshahi Krishi Unnayan Bank Limited','Rajshahi Krishi Unnayan Bank Limited','Rajshahi Krishi Unnayan Bank Limited',1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(49,'48','Shahjalal Islami Bank','Shahjalal Islami Bank','Shahjalal Islami Bank',1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(50,'49','Shimanto Bank','Shimanto Bank','Shimanto Bank',1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(51,'50','Social Islami Bank','Social Islami Bank','Social Islami Bank',1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(52,'51','Sonali Bank ','Sonali Bank ','Sonali Bank ',1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(53,'52','South Bangla Agriculture Bank','South Bangla Agriculture Bank','South Bangla Agriculture Bank',1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(54,'53','Standard Bank Limited','Standard Bank Limited','Standard Bank Limited',1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(55,'54','Standard Chartared Bank','Standard Chartared Bank','Standard Chartared Bank',1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(56,'55','The City Bank Limited','The City Bank Limited','The City Bank Limited',1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(57,'56','Trust Bank Limited','Trust Bank Limited','Trust Bank Limited',1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(58,'57','Union Bank Limited','Union Bank Limited','Union Bank Limited',1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(59,'58','Uttara Bank Limited','Uttara Bank Limited','Uttara Bank Limited',1,NULL,NULL,'2024-03-12 10:24:31','2024-03-12 10:24:31'),(60,'59','Dhaka Bank','Dhaka Bank','Dhaka Bank',1,NULL,NULL,'2024-03-12 10:26:09','2024-03-12 10:26:09'),(61,'60','Brac Bank','Brac Bank','Brac Bank',1,NULL,NULL,'2024-03-12 10:26:09','2024-03-12 10:26:09');

/*Table structure for table `billing_chalan` */

DROP TABLE IF EXISTS `billing_chalan`;

CREATE TABLE `billing_chalan` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `purchase_order_attachment_id` bigint(20) unsigned DEFAULT NULL,
  `goods_received_note_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `billingchalan_purchase_order_attachment_id_foreign` (`purchase_order_attachment_id`),
  KEY `billingchalan_created_by_foreign` (`created_by`),
  KEY `billingchalan_updated_by_foreign` (`updated_by`),
  KEY `billing_chalan_goods_received_note_id_foreign` (`goods_received_note_id`),
  CONSTRAINT `billing_chalan_goods_received_note_id_foreign` FOREIGN KEY (`goods_received_note_id`) REFERENCES `goods_received_notes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `billingchalan_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `billingchalan_purchase_order_attachment_id_foreign` FOREIGN KEY (`purchase_order_attachment_id`) REFERENCES `purchase_order_attachment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `billingchalan_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `billing_chalan` */

/*Table structure for table `brands` */

DROP TABLE IF EXISTS `brands`;

CREATE TABLE `brands` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `brands_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `brands` */

/*Table structure for table `categories` */

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `type` enum('common','uncommon') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'uncommon',
  `is_fixed_asset` int(11) NOT NULL DEFAULT '0',
  `is_cwip` int(11) NOT NULL DEFAULT '0',
  `is_service` int(11) DEFAULT '0',
  `is_sale_item` int(11) NOT NULL DEFAULT '0',
  `depreciation_rate` double NOT NULL DEFAULT '0',
  `inventory_account_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cwip_asset_account_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cogs_account_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `inventory_adjustments_account_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `sales_account_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `depreciation_cost_account_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `depreciation_disposal_account_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `requisition_type_id` bigint(20) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_code_unique` (`code`),
  KEY `categories_inventory_account_id_foreign` (`inventory_account_id`),
  KEY `categories_cogs_account_id_foreign` (`cogs_account_id`),
  KEY `categories_inventory_adjustments_account_id_foreign` (`inventory_adjustments_account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `categories` */

insert  into `categories`(`id`,`code`,`name`,`parent_id`,`type`,`is_fixed_asset`,`is_cwip`,`is_service`,`is_sale_item`,`depreciation_rate`,`inventory_account_id`,`cwip_asset_account_id`,`cogs_account_id`,`inventory_adjustments_account_id`,`sales_account_id`,`depreciation_cost_account_id`,`depreciation_disposal_account_id`,`created_at`,`updated_at`,`requisition_type_id`,`deleted_at`) values (1,'CT-0001','Stationaries',NULL,'common',0,0,0,0,0,0,0,0,0,0,0,0,'2024-03-18 11:21:50','2024-03-18 11:21:50',0,NULL),(2,'CT-0002','Writing Items',1,'uncommon',0,0,0,0,0,0,0,0,0,0,0,0,'2024-03-18 11:24:30','2024-03-18 11:24:30',0,NULL);

/*Table structure for table `categories_department` */

DROP TABLE IF EXISTS `categories_department`;

CREATE TABLE `categories_department` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) unsigned NOT NULL,
  `hr_department_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_department_category_id_foreign` (`category_id`),
  KEY `categories_department_hr_department_id_foreign` (`hr_department_id`),
  CONSTRAINT `categories_department_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `categories_department_hr_department_id_foreign` FOREIGN KEY (`hr_department_id`) REFERENCES `hr_department` (`hr_department_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `categories_department` */

insert  into `categories_department`(`id`,`category_id`,`hr_department_id`,`created_at`,`updated_at`) values (1,1,113,NULL,NULL),(2,1,114,NULL,NULL),(3,1,115,NULL,NULL),(4,1,116,NULL,NULL),(5,1,117,NULL,NULL),(6,1,118,NULL,NULL),(7,1,119,NULL,NULL),(8,1,120,NULL,NULL),(9,1,121,NULL,NULL),(10,1,122,NULL,NULL),(11,1,123,NULL,NULL),(12,1,124,NULL,NULL),(13,1,125,NULL,NULL),(14,1,126,NULL,NULL),(15,1,127,NULL,NULL),(16,1,128,NULL,NULL),(17,1,129,NULL,NULL),(18,1,130,NULL,NULL),(19,1,131,NULL,NULL),(20,1,132,NULL,NULL),(21,1,133,NULL,NULL),(22,1,134,NULL,NULL),(23,1,135,NULL,NULL),(24,1,136,NULL,NULL),(25,1,137,NULL,NULL),(26,1,138,NULL,NULL),(27,1,139,NULL,NULL),(28,1,140,NULL,NULL),(29,1,141,NULL,NULL),(30,1,142,NULL,NULL),(31,1,143,NULL,NULL),(32,1,144,NULL,NULL),(33,1,145,NULL,NULL),(34,1,146,NULL,NULL),(35,1,147,NULL,NULL),(36,1,148,NULL,NULL),(37,1,149,NULL,NULL),(38,1,150,NULL,NULL),(39,1,151,NULL,NULL),(40,1,152,NULL,NULL),(41,1,153,NULL,NULL),(42,1,154,NULL,NULL),(43,1,155,NULL,NULL),(44,1,156,NULL,NULL),(45,1,157,NULL,NULL),(46,1,158,NULL,NULL),(47,2,113,NULL,NULL),(48,2,114,NULL,NULL),(49,2,115,NULL,NULL),(50,2,116,NULL,NULL),(51,2,117,NULL,NULL),(52,2,118,NULL,NULL),(53,2,119,NULL,NULL),(54,2,120,NULL,NULL),(55,2,121,NULL,NULL),(56,2,122,NULL,NULL),(57,2,123,NULL,NULL),(58,2,124,NULL,NULL),(59,2,125,NULL,NULL),(60,2,126,NULL,NULL),(61,2,127,NULL,NULL),(62,2,128,NULL,NULL),(63,2,129,NULL,NULL),(64,2,130,NULL,NULL),(65,2,131,NULL,NULL),(66,2,132,NULL,NULL),(67,2,133,NULL,NULL),(68,2,134,NULL,NULL),(69,2,135,NULL,NULL),(70,2,136,NULL,NULL),(71,2,137,NULL,NULL),(72,2,138,NULL,NULL),(73,2,139,NULL,NULL),(74,2,140,NULL,NULL),(75,2,141,NULL,NULL),(76,2,142,NULL,NULL),(77,2,143,NULL,NULL),(78,2,144,NULL,NULL),(79,2,145,NULL,NULL),(80,2,146,NULL,NULL),(81,2,147,NULL,NULL),(82,2,148,NULL,NULL),(83,2,149,NULL,NULL),(84,2,150,NULL,NULL),(85,2,151,NULL,NULL),(86,2,152,NULL,NULL),(87,2,153,NULL,NULL),(88,2,154,NULL,NULL),(89,2,155,NULL,NULL),(90,2,156,NULL,NULL),(91,2,157,NULL,NULL),(92,2,158,NULL,NULL);

/*Table structure for table `category_attributes` */

DROP TABLE IF EXISTS `category_attributes`;

CREATE TABLE `category_attributes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) unsigned NOT NULL,
  `attribute_id` bigint(20) unsigned NOT NULL,
  `serial` int(11) NOT NULL DEFAULT '0',
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_attributes_category_id_foreign` (`category_id`),
  KEY `category_attributes_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `category_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `category_attributes_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `category_attributes` */

/*Table structure for table `chart_of_account_approval_levels` */

DROP TABLE IF EXISTS `chart_of_account_approval_levels`;

CREATE TABLE `chart_of_account_approval_levels` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `chart_of_account_id` bigint(20) unsigned NOT NULL,
  `approval_level_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chart_of_account_approval_levels_chart_of_account_id_foreign` (`chart_of_account_id`),
  KEY `chart_of_account_approval_levels_approval_level_id_foreign` (`approval_level_id`),
  CONSTRAINT `chart_of_account_approval_levels_approval_level_id_foreign` FOREIGN KEY (`approval_level_id`) REFERENCES `approval_levels` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `chart_of_account_approval_levels_chart_of_account_id_foreign` FOREIGN KEY (`chart_of_account_id`) REFERENCES `chart_of_accounts` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2551 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `chart_of_account_approval_levels` */

insert  into `chart_of_account_approval_levels`(`id`,`chart_of_account_id`,`approval_level_id`,`created_at`,`updated_at`) values (1501,1313,1,NULL,NULL),(1502,1313,2,NULL,NULL),(1503,1313,3,NULL,NULL),(1504,1314,1,NULL,NULL),(1505,1314,2,NULL,NULL),(1506,1314,3,NULL,NULL),(1507,1315,1,NULL,NULL),(1508,1315,2,NULL,NULL),(1509,1315,3,NULL,NULL),(1510,1316,1,NULL,NULL),(1511,1316,2,NULL,NULL),(1512,1316,3,NULL,NULL),(1513,1317,1,NULL,NULL),(1514,1317,2,NULL,NULL),(1515,1317,3,NULL,NULL),(1516,1318,1,NULL,NULL),(1517,1318,2,NULL,NULL),(1518,1318,3,NULL,NULL),(1519,1319,1,NULL,NULL),(1520,1319,2,NULL,NULL),(1521,1319,3,NULL,NULL),(1522,1320,1,NULL,NULL),(1523,1320,2,NULL,NULL),(1524,1320,3,NULL,NULL),(1525,1321,1,NULL,NULL),(1526,1321,2,NULL,NULL),(1527,1321,3,NULL,NULL),(1528,1322,1,NULL,NULL),(1529,1322,2,NULL,NULL),(1530,1322,3,NULL,NULL),(1531,1323,1,NULL,NULL),(1532,1323,2,NULL,NULL),(1533,1323,3,NULL,NULL),(1534,1324,1,NULL,NULL),(1535,1324,2,NULL,NULL),(1536,1324,3,NULL,NULL),(1537,1325,1,NULL,NULL),(1538,1325,2,NULL,NULL),(1539,1325,3,NULL,NULL),(1540,1326,1,NULL,NULL),(1541,1326,2,NULL,NULL),(1542,1326,3,NULL,NULL),(1543,1327,1,NULL,NULL),(1544,1327,2,NULL,NULL),(1545,1327,3,NULL,NULL),(1546,1328,1,NULL,NULL),(1547,1328,2,NULL,NULL),(1548,1328,3,NULL,NULL),(1549,1329,1,NULL,NULL),(1550,1329,2,NULL,NULL),(1551,1329,3,NULL,NULL),(1552,1330,1,NULL,NULL),(1553,1330,2,NULL,NULL),(1554,1330,3,NULL,NULL),(1555,1331,1,NULL,NULL),(1556,1331,2,NULL,NULL),(1557,1331,3,NULL,NULL),(1558,1332,1,NULL,NULL),(1559,1332,2,NULL,NULL),(1560,1332,3,NULL,NULL),(1561,1333,1,NULL,NULL),(1562,1333,2,NULL,NULL),(1563,1333,3,NULL,NULL),(1564,1334,1,NULL,NULL),(1565,1334,2,NULL,NULL),(1566,1334,3,NULL,NULL),(1567,1335,1,NULL,NULL),(1568,1335,2,NULL,NULL),(1569,1335,3,NULL,NULL),(1570,1336,1,NULL,NULL),(1571,1336,2,NULL,NULL),(1572,1336,3,NULL,NULL),(1573,1337,1,NULL,NULL),(1574,1337,2,NULL,NULL),(1575,1337,3,NULL,NULL),(1576,1338,1,NULL,NULL),(1577,1338,2,NULL,NULL),(1578,1338,3,NULL,NULL),(1579,1339,1,NULL,NULL),(1580,1339,2,NULL,NULL),(1581,1339,3,NULL,NULL),(1582,1340,1,NULL,NULL),(1583,1340,2,NULL,NULL),(1584,1340,3,NULL,NULL),(1585,1341,1,NULL,NULL),(1586,1341,2,NULL,NULL),(1587,1341,3,NULL,NULL),(1588,1342,1,NULL,NULL),(1589,1342,2,NULL,NULL),(1590,1342,3,NULL,NULL),(1591,1343,1,NULL,NULL),(1592,1343,2,NULL,NULL),(1593,1343,3,NULL,NULL),(1594,1344,1,NULL,NULL),(1595,1344,2,NULL,NULL),(1596,1344,3,NULL,NULL),(1597,1345,1,NULL,NULL),(1598,1345,2,NULL,NULL),(1599,1345,3,NULL,NULL),(1600,1346,1,NULL,NULL),(1601,1346,2,NULL,NULL),(1602,1346,3,NULL,NULL),(1603,1347,1,NULL,NULL),(1604,1347,2,NULL,NULL),(1605,1347,3,NULL,NULL),(1606,1348,1,NULL,NULL),(1607,1348,2,NULL,NULL),(1608,1348,3,NULL,NULL),(1609,1349,1,NULL,NULL),(1610,1349,2,NULL,NULL),(1611,1349,3,NULL,NULL),(1612,1350,1,NULL,NULL),(1613,1350,2,NULL,NULL),(1614,1350,3,NULL,NULL),(1615,1351,1,NULL,NULL),(1616,1351,2,NULL,NULL),(1617,1351,3,NULL,NULL),(1618,1352,1,NULL,NULL),(1619,1352,2,NULL,NULL),(1620,1352,3,NULL,NULL),(1621,1353,1,NULL,NULL),(1622,1353,2,NULL,NULL),(1623,1353,3,NULL,NULL),(1624,1354,1,NULL,NULL),(1625,1354,2,NULL,NULL),(1626,1354,3,NULL,NULL),(1627,1355,1,NULL,NULL),(1628,1355,2,NULL,NULL),(1629,1355,3,NULL,NULL),(1630,1356,1,NULL,NULL),(1631,1356,2,NULL,NULL),(1632,1356,3,NULL,NULL),(1633,1357,1,NULL,NULL),(1634,1357,2,NULL,NULL),(1635,1357,3,NULL,NULL),(1636,1358,1,NULL,NULL),(1637,1358,2,NULL,NULL),(1638,1358,3,NULL,NULL),(1639,1359,1,NULL,NULL),(1640,1359,2,NULL,NULL),(1641,1359,3,NULL,NULL),(1642,1360,1,NULL,NULL),(1643,1360,2,NULL,NULL),(1644,1360,3,NULL,NULL),(1645,1361,1,NULL,NULL),(1646,1361,2,NULL,NULL),(1647,1361,3,NULL,NULL),(1648,1362,1,NULL,NULL),(1649,1362,2,NULL,NULL),(1650,1362,3,NULL,NULL),(1651,1363,1,NULL,NULL),(1652,1363,2,NULL,NULL),(1653,1363,3,NULL,NULL),(1654,1364,1,NULL,NULL),(1655,1364,2,NULL,NULL),(1656,1364,3,NULL,NULL),(1657,1365,1,NULL,NULL),(1658,1365,2,NULL,NULL),(1659,1365,3,NULL,NULL),(1660,1366,1,NULL,NULL),(1661,1366,2,NULL,NULL),(1662,1366,3,NULL,NULL),(1663,1367,1,NULL,NULL),(1664,1367,2,NULL,NULL),(1665,1367,3,NULL,NULL),(1666,1368,1,NULL,NULL),(1667,1368,2,NULL,NULL),(1668,1368,3,NULL,NULL),(1669,1369,1,NULL,NULL),(1670,1369,2,NULL,NULL),(1671,1369,3,NULL,NULL),(1672,1370,1,NULL,NULL),(1673,1370,2,NULL,NULL),(1674,1370,3,NULL,NULL),(1675,1371,1,NULL,NULL),(1676,1371,2,NULL,NULL),(1677,1371,3,NULL,NULL),(1678,1372,1,NULL,NULL),(1679,1372,2,NULL,NULL),(1680,1372,3,NULL,NULL),(1681,1373,1,NULL,NULL),(1682,1373,2,NULL,NULL),(1683,1373,3,NULL,NULL),(1684,1374,1,NULL,NULL),(1685,1374,2,NULL,NULL),(1686,1374,3,NULL,NULL),(1687,1375,1,NULL,NULL),(1688,1375,2,NULL,NULL),(1689,1375,3,NULL,NULL),(1690,1376,1,NULL,NULL),(1691,1376,2,NULL,NULL),(1692,1376,3,NULL,NULL),(1693,1377,1,NULL,NULL),(1694,1377,2,NULL,NULL),(1695,1377,3,NULL,NULL),(1696,1378,1,NULL,NULL),(1697,1378,2,NULL,NULL),(1698,1378,3,NULL,NULL),(1699,1379,1,NULL,NULL),(1700,1379,2,NULL,NULL),(1701,1379,3,NULL,NULL),(1702,1380,1,NULL,NULL),(1703,1380,2,NULL,NULL),(1704,1380,3,NULL,NULL),(1705,1381,1,NULL,NULL),(1706,1381,2,NULL,NULL),(1707,1381,3,NULL,NULL),(1708,1382,1,NULL,NULL),(1709,1382,2,NULL,NULL),(1710,1382,3,NULL,NULL),(1711,1383,1,NULL,NULL),(1712,1383,2,NULL,NULL),(1713,1383,3,NULL,NULL),(1714,1384,1,NULL,NULL),(1715,1384,2,NULL,NULL),(1716,1384,3,NULL,NULL),(1717,1385,1,NULL,NULL),(1718,1385,2,NULL,NULL),(1719,1385,3,NULL,NULL),(1720,1386,1,NULL,NULL),(1721,1386,2,NULL,NULL),(1722,1386,3,NULL,NULL),(1723,1387,1,NULL,NULL),(1724,1387,2,NULL,NULL),(1725,1387,3,NULL,NULL),(1726,1388,1,NULL,NULL),(1727,1388,2,NULL,NULL),(1728,1388,3,NULL,NULL),(1729,1389,1,NULL,NULL),(1730,1389,2,NULL,NULL),(1731,1389,3,NULL,NULL),(1732,1390,1,NULL,NULL),(1733,1390,2,NULL,NULL),(1734,1390,3,NULL,NULL),(1735,1391,1,NULL,NULL),(1736,1391,2,NULL,NULL),(1737,1391,3,NULL,NULL),(1738,1392,1,NULL,NULL),(1739,1392,2,NULL,NULL),(1740,1392,3,NULL,NULL),(1741,1393,1,NULL,NULL),(1742,1393,2,NULL,NULL),(1743,1393,3,NULL,NULL),(1744,1394,1,NULL,NULL),(1745,1394,2,NULL,NULL),(1746,1394,3,NULL,NULL),(1747,1395,1,NULL,NULL),(1748,1395,2,NULL,NULL),(1749,1395,3,NULL,NULL),(1750,1396,1,NULL,NULL),(1751,1396,2,NULL,NULL),(1752,1396,3,NULL,NULL),(1753,1397,1,NULL,NULL),(1754,1397,2,NULL,NULL),(1755,1397,3,NULL,NULL),(1756,1398,1,NULL,NULL),(1757,1398,2,NULL,NULL),(1758,1398,3,NULL,NULL),(1759,1399,1,NULL,NULL),(1760,1399,2,NULL,NULL),(1761,1399,3,NULL,NULL),(1762,1400,1,NULL,NULL),(1763,1400,2,NULL,NULL),(1764,1400,3,NULL,NULL),(1765,1401,1,NULL,NULL),(1766,1401,2,NULL,NULL),(1767,1401,3,NULL,NULL),(1768,1402,1,NULL,NULL),(1769,1402,2,NULL,NULL),(1770,1402,3,NULL,NULL),(1771,1403,1,NULL,NULL),(1772,1403,2,NULL,NULL),(1773,1403,3,NULL,NULL),(1774,1404,1,NULL,NULL),(1775,1404,2,NULL,NULL),(1776,1404,3,NULL,NULL),(1777,1405,1,NULL,NULL),(1778,1405,2,NULL,NULL),(1779,1405,3,NULL,NULL),(1780,1406,1,NULL,NULL),(1781,1406,2,NULL,NULL),(1782,1406,3,NULL,NULL),(1783,1407,1,NULL,NULL),(1784,1407,2,NULL,NULL),(1785,1407,3,NULL,NULL),(1786,1408,1,NULL,NULL),(1787,1408,2,NULL,NULL),(1788,1408,3,NULL,NULL),(1789,1409,1,NULL,NULL),(1790,1409,2,NULL,NULL),(1791,1409,3,NULL,NULL),(1792,1410,1,NULL,NULL),(1793,1410,2,NULL,NULL),(1794,1410,3,NULL,NULL),(1795,1411,1,NULL,NULL),(1796,1411,2,NULL,NULL),(1797,1411,3,NULL,NULL),(1798,1412,1,NULL,NULL),(1799,1412,2,NULL,NULL),(1800,1412,3,NULL,NULL),(1801,1413,1,NULL,NULL),(1802,1413,2,NULL,NULL),(1803,1413,3,NULL,NULL),(1804,1414,1,NULL,NULL),(1805,1414,2,NULL,NULL),(1806,1414,3,NULL,NULL),(1807,1415,1,NULL,NULL),(1808,1415,2,NULL,NULL),(1809,1415,3,NULL,NULL),(1810,1416,1,NULL,NULL),(1811,1416,2,NULL,NULL),(1812,1416,3,NULL,NULL),(1813,1417,1,NULL,NULL),(1814,1417,2,NULL,NULL),(1815,1417,3,NULL,NULL),(1816,1418,1,NULL,NULL),(1817,1418,2,NULL,NULL),(1818,1418,3,NULL,NULL),(1819,1419,1,NULL,NULL),(1820,1419,2,NULL,NULL),(1821,1419,3,NULL,NULL),(1822,1420,1,NULL,NULL),(1823,1420,2,NULL,NULL),(1824,1420,3,NULL,NULL),(1825,1421,1,NULL,NULL),(1826,1421,2,NULL,NULL),(1827,1421,3,NULL,NULL),(1828,1422,1,NULL,NULL),(1829,1422,2,NULL,NULL),(1830,1422,3,NULL,NULL),(1831,1423,1,NULL,NULL),(1832,1423,2,NULL,NULL),(1833,1423,3,NULL,NULL),(1834,1424,1,NULL,NULL),(1835,1424,2,NULL,NULL),(1836,1424,3,NULL,NULL),(1837,1425,1,NULL,NULL),(1838,1425,2,NULL,NULL),(1839,1425,3,NULL,NULL),(1840,1426,1,NULL,NULL),(1841,1426,2,NULL,NULL),(1842,1426,3,NULL,NULL),(1843,1427,1,NULL,NULL),(1844,1427,2,NULL,NULL),(1845,1427,3,NULL,NULL),(1846,1428,1,NULL,NULL),(1847,1428,2,NULL,NULL),(1848,1428,3,NULL,NULL),(1849,1429,1,NULL,NULL),(1850,1429,2,NULL,NULL),(1851,1429,3,NULL,NULL),(1852,1430,1,NULL,NULL),(1853,1430,2,NULL,NULL),(1854,1430,3,NULL,NULL),(1855,1431,1,NULL,NULL),(1856,1431,2,NULL,NULL),(1857,1431,3,NULL,NULL),(1858,1432,1,NULL,NULL),(1859,1432,2,NULL,NULL),(1860,1432,3,NULL,NULL),(1861,1433,1,NULL,NULL),(1862,1433,2,NULL,NULL),(1863,1433,3,NULL,NULL),(1864,1434,1,NULL,NULL),(1865,1434,2,NULL,NULL),(1866,1434,3,NULL,NULL),(1867,1435,1,NULL,NULL),(1868,1435,2,NULL,NULL),(1869,1435,3,NULL,NULL),(1870,1436,1,NULL,NULL),(1871,1436,2,NULL,NULL),(1872,1436,3,NULL,NULL),(1873,1437,1,NULL,NULL),(1874,1437,2,NULL,NULL),(1875,1437,3,NULL,NULL),(1876,1438,1,NULL,NULL),(1877,1438,2,NULL,NULL),(1878,1438,3,NULL,NULL),(1879,1439,1,NULL,NULL),(1880,1439,2,NULL,NULL),(1881,1439,3,NULL,NULL),(1882,1440,1,NULL,NULL),(1883,1440,2,NULL,NULL),(1884,1440,3,NULL,NULL),(1885,1441,1,NULL,NULL),(1886,1441,2,NULL,NULL),(1887,1441,3,NULL,NULL),(1888,1442,1,NULL,NULL),(1889,1442,2,NULL,NULL),(1890,1442,3,NULL,NULL),(1891,1443,1,NULL,NULL),(1892,1443,2,NULL,NULL),(1893,1443,3,NULL,NULL),(1894,1444,1,NULL,NULL),(1895,1444,2,NULL,NULL),(1896,1444,3,NULL,NULL),(1897,1445,1,NULL,NULL),(1898,1445,2,NULL,NULL),(1899,1445,3,NULL,NULL),(1900,1446,1,NULL,NULL),(1901,1446,2,NULL,NULL),(1902,1446,3,NULL,NULL),(1903,1447,1,NULL,NULL),(1904,1447,2,NULL,NULL),(1905,1447,3,NULL,NULL),(1906,1448,1,NULL,NULL),(1907,1448,2,NULL,NULL),(1908,1448,3,NULL,NULL),(1909,1449,1,NULL,NULL),(1910,1449,2,NULL,NULL),(1911,1449,3,NULL,NULL),(1912,1450,1,NULL,NULL),(1913,1450,2,NULL,NULL),(1914,1450,3,NULL,NULL),(1915,1451,1,NULL,NULL),(1916,1451,2,NULL,NULL),(1917,1451,3,NULL,NULL),(1918,1452,1,NULL,NULL),(1919,1452,2,NULL,NULL),(1920,1452,3,NULL,NULL),(1921,1453,1,NULL,NULL),(1922,1453,2,NULL,NULL),(1923,1453,3,NULL,NULL),(1924,1454,1,NULL,NULL),(1925,1454,2,NULL,NULL),(1926,1454,3,NULL,NULL),(1927,1455,1,NULL,NULL),(1928,1455,2,NULL,NULL),(1929,1455,3,NULL,NULL),(1930,1456,1,NULL,NULL),(1931,1456,2,NULL,NULL),(1932,1456,3,NULL,NULL),(1933,1457,1,NULL,NULL),(1934,1457,2,NULL,NULL),(1935,1457,3,NULL,NULL),(1936,1458,1,NULL,NULL),(1937,1458,2,NULL,NULL),(1938,1458,3,NULL,NULL),(1939,1459,1,NULL,NULL),(1940,1459,2,NULL,NULL),(1941,1459,3,NULL,NULL),(1942,1460,1,NULL,NULL),(1943,1460,2,NULL,NULL),(1944,1460,3,NULL,NULL),(1945,1461,1,NULL,NULL),(1946,1461,2,NULL,NULL),(1947,1461,3,NULL,NULL),(1948,1462,1,NULL,NULL),(1949,1462,2,NULL,NULL),(1950,1462,3,NULL,NULL),(1951,1463,1,NULL,NULL),(1952,1463,2,NULL,NULL),(1953,1463,3,NULL,NULL),(1954,1464,1,NULL,NULL),(1955,1464,2,NULL,NULL),(1956,1464,3,NULL,NULL),(1957,1465,1,NULL,NULL),(1958,1465,2,NULL,NULL),(1959,1465,3,NULL,NULL),(1960,1466,1,NULL,NULL),(1961,1466,2,NULL,NULL),(1962,1466,3,NULL,NULL),(1963,1467,1,NULL,NULL),(1964,1467,2,NULL,NULL),(1965,1467,3,NULL,NULL),(1966,1468,1,NULL,NULL),(1967,1468,2,NULL,NULL),(1968,1468,3,NULL,NULL),(1969,1469,1,NULL,NULL),(1970,1469,2,NULL,NULL),(1971,1469,3,NULL,NULL),(1972,1470,1,NULL,NULL),(1973,1470,2,NULL,NULL),(1974,1470,3,NULL,NULL),(1975,1471,1,NULL,NULL),(1976,1471,2,NULL,NULL),(1977,1471,3,NULL,NULL),(1978,1472,1,NULL,NULL),(1979,1472,2,NULL,NULL),(1980,1472,3,NULL,NULL),(1981,1473,1,NULL,NULL),(1982,1473,2,NULL,NULL),(1983,1473,3,NULL,NULL),(1984,1474,1,NULL,NULL),(1985,1474,2,NULL,NULL),(1986,1474,3,NULL,NULL),(1987,1475,1,NULL,NULL),(1988,1475,2,NULL,NULL),(1989,1475,3,NULL,NULL),(1990,1476,1,NULL,NULL),(1991,1476,2,NULL,NULL),(1992,1476,3,NULL,NULL),(1993,1477,1,NULL,NULL),(1994,1477,2,NULL,NULL),(1995,1477,3,NULL,NULL),(1996,1478,1,NULL,NULL),(1997,1478,2,NULL,NULL),(1998,1478,3,NULL,NULL),(1999,1479,1,NULL,NULL),(2000,1479,2,NULL,NULL),(2001,1479,3,NULL,NULL),(2002,1480,1,NULL,NULL),(2003,1480,2,NULL,NULL),(2004,1480,3,NULL,NULL),(2005,1481,1,NULL,NULL),(2006,1481,2,NULL,NULL),(2007,1481,3,NULL,NULL),(2008,1482,1,NULL,NULL),(2009,1482,2,NULL,NULL),(2010,1482,3,NULL,NULL),(2011,1483,1,NULL,NULL),(2012,1483,2,NULL,NULL),(2013,1483,3,NULL,NULL),(2014,1484,1,NULL,NULL),(2015,1484,2,NULL,NULL),(2016,1484,3,NULL,NULL),(2017,1485,1,NULL,NULL),(2018,1485,2,NULL,NULL),(2019,1485,3,NULL,NULL),(2020,1486,1,NULL,NULL),(2021,1486,2,NULL,NULL),(2022,1486,3,NULL,NULL),(2023,1487,1,NULL,NULL),(2024,1487,2,NULL,NULL),(2025,1487,3,NULL,NULL),(2026,1488,1,NULL,NULL),(2027,1488,2,NULL,NULL),(2028,1488,3,NULL,NULL),(2029,1489,1,NULL,NULL),(2030,1489,2,NULL,NULL),(2031,1489,3,NULL,NULL),(2032,1490,1,NULL,NULL),(2033,1490,2,NULL,NULL),(2034,1490,3,NULL,NULL),(2035,1491,1,NULL,NULL),(2036,1491,2,NULL,NULL),(2037,1491,3,NULL,NULL),(2038,1492,1,NULL,NULL),(2039,1492,2,NULL,NULL),(2040,1492,3,NULL,NULL),(2041,1493,1,NULL,NULL),(2042,1493,2,NULL,NULL),(2043,1493,3,NULL,NULL),(2044,1494,1,NULL,NULL),(2045,1494,2,NULL,NULL),(2046,1494,3,NULL,NULL),(2047,1495,1,NULL,NULL),(2048,1495,2,NULL,NULL),(2049,1495,3,NULL,NULL),(2050,1496,1,NULL,NULL),(2051,1496,2,NULL,NULL),(2052,1496,3,NULL,NULL),(2053,1497,1,NULL,NULL),(2054,1497,2,NULL,NULL),(2055,1497,3,NULL,NULL),(2056,1498,1,NULL,NULL),(2057,1498,2,NULL,NULL),(2058,1498,3,NULL,NULL),(2059,1499,1,NULL,NULL),(2060,1499,2,NULL,NULL),(2061,1499,3,NULL,NULL),(2062,1500,1,NULL,NULL),(2063,1500,2,NULL,NULL),(2064,1500,3,NULL,NULL),(2065,1501,1,NULL,NULL),(2066,1501,2,NULL,NULL),(2067,1501,3,NULL,NULL),(2068,1502,1,NULL,NULL),(2069,1502,2,NULL,NULL),(2070,1502,3,NULL,NULL),(2071,1503,1,NULL,NULL),(2072,1503,2,NULL,NULL),(2073,1503,3,NULL,NULL),(2074,1504,1,NULL,NULL),(2075,1504,2,NULL,NULL),(2076,1504,3,NULL,NULL),(2077,1505,1,NULL,NULL),(2078,1505,2,NULL,NULL),(2079,1505,3,NULL,NULL),(2080,1506,1,NULL,NULL),(2081,1506,2,NULL,NULL),(2082,1506,3,NULL,NULL),(2083,1507,1,NULL,NULL),(2084,1507,2,NULL,NULL),(2085,1507,3,NULL,NULL),(2086,1508,1,NULL,NULL),(2087,1508,2,NULL,NULL),(2088,1508,3,NULL,NULL),(2089,1509,1,NULL,NULL),(2090,1509,2,NULL,NULL),(2091,1509,3,NULL,NULL),(2092,1510,1,NULL,NULL),(2093,1510,2,NULL,NULL),(2094,1510,3,NULL,NULL),(2095,1511,1,NULL,NULL),(2096,1511,2,NULL,NULL),(2097,1511,3,NULL,NULL),(2098,1512,1,NULL,NULL),(2099,1512,2,NULL,NULL),(2100,1512,3,NULL,NULL),(2101,1513,1,NULL,NULL),(2102,1513,2,NULL,NULL),(2103,1513,3,NULL,NULL),(2104,1514,1,NULL,NULL),(2105,1514,2,NULL,NULL),(2106,1514,3,NULL,NULL),(2107,1515,1,NULL,NULL),(2108,1515,2,NULL,NULL),(2109,1515,3,NULL,NULL),(2110,1516,1,NULL,NULL),(2111,1516,2,NULL,NULL),(2112,1516,3,NULL,NULL),(2113,1517,1,NULL,NULL),(2114,1517,2,NULL,NULL),(2115,1517,3,NULL,NULL),(2116,1518,1,NULL,NULL),(2117,1518,2,NULL,NULL),(2118,1518,3,NULL,NULL),(2119,1519,1,NULL,NULL),(2120,1519,2,NULL,NULL),(2121,1519,3,NULL,NULL),(2122,1520,1,NULL,NULL),(2123,1520,2,NULL,NULL),(2124,1520,3,NULL,NULL),(2125,1521,1,NULL,NULL),(2126,1521,2,NULL,NULL),(2127,1521,3,NULL,NULL),(2128,1522,1,NULL,NULL),(2129,1522,2,NULL,NULL),(2130,1522,3,NULL,NULL),(2131,1523,1,NULL,NULL),(2132,1523,2,NULL,NULL),(2133,1523,3,NULL,NULL),(2134,1524,1,NULL,NULL),(2135,1524,2,NULL,NULL),(2136,1524,3,NULL,NULL),(2137,1525,1,NULL,NULL),(2138,1525,2,NULL,NULL),(2139,1525,3,NULL,NULL),(2140,1526,1,NULL,NULL),(2141,1526,2,NULL,NULL),(2142,1526,3,NULL,NULL),(2143,1527,1,NULL,NULL),(2144,1527,2,NULL,NULL),(2145,1527,3,NULL,NULL),(2146,1528,1,NULL,NULL),(2147,1528,2,NULL,NULL),(2148,1528,3,NULL,NULL),(2149,1529,1,NULL,NULL),(2150,1529,2,NULL,NULL),(2151,1529,3,NULL,NULL),(2152,1530,1,NULL,NULL),(2153,1530,2,NULL,NULL),(2154,1530,3,NULL,NULL),(2155,1531,1,NULL,NULL),(2156,1531,2,NULL,NULL),(2157,1531,3,NULL,NULL),(2158,1532,1,NULL,NULL),(2159,1532,2,NULL,NULL),(2160,1532,3,NULL,NULL),(2161,1533,1,NULL,NULL),(2162,1533,2,NULL,NULL),(2163,1533,3,NULL,NULL),(2164,1534,1,NULL,NULL),(2165,1534,2,NULL,NULL),(2166,1534,3,NULL,NULL),(2167,1535,1,NULL,NULL),(2168,1535,2,NULL,NULL),(2169,1535,3,NULL,NULL),(2170,1536,1,NULL,NULL),(2171,1536,2,NULL,NULL),(2172,1536,3,NULL,NULL),(2173,1537,1,NULL,NULL),(2174,1537,2,NULL,NULL),(2175,1537,3,NULL,NULL),(2176,1538,1,NULL,NULL),(2177,1538,2,NULL,NULL),(2178,1538,3,NULL,NULL),(2179,1539,1,NULL,NULL),(2180,1539,2,NULL,NULL),(2181,1539,3,NULL,NULL),(2182,1540,1,NULL,NULL),(2183,1540,2,NULL,NULL),(2184,1540,3,NULL,NULL),(2185,1541,1,NULL,NULL),(2186,1541,2,NULL,NULL),(2187,1541,3,NULL,NULL),(2188,1542,1,NULL,NULL),(2189,1542,2,NULL,NULL),(2190,1542,3,NULL,NULL),(2191,1543,1,NULL,NULL),(2192,1543,2,NULL,NULL),(2193,1543,3,NULL,NULL),(2194,1544,1,NULL,NULL),(2195,1544,2,NULL,NULL),(2196,1544,3,NULL,NULL),(2197,1545,1,NULL,NULL),(2198,1545,2,NULL,NULL),(2199,1545,3,NULL,NULL),(2200,1546,1,NULL,NULL),(2201,1546,2,NULL,NULL),(2202,1546,3,NULL,NULL),(2203,1547,1,NULL,NULL),(2204,1547,2,NULL,NULL),(2205,1547,3,NULL,NULL),(2206,1548,1,NULL,NULL),(2207,1548,2,NULL,NULL),(2208,1548,3,NULL,NULL),(2209,1549,1,NULL,NULL),(2210,1549,2,NULL,NULL),(2211,1549,3,NULL,NULL),(2212,1550,1,NULL,NULL),(2213,1550,2,NULL,NULL),(2214,1550,3,NULL,NULL),(2215,1551,1,NULL,NULL),(2216,1551,2,NULL,NULL),(2217,1551,3,NULL,NULL),(2218,1552,1,NULL,NULL),(2219,1552,2,NULL,NULL),(2220,1552,3,NULL,NULL),(2221,1553,1,NULL,NULL),(2222,1553,2,NULL,NULL),(2223,1553,3,NULL,NULL),(2224,1554,1,NULL,NULL),(2225,1554,2,NULL,NULL),(2226,1554,3,NULL,NULL),(2227,1555,1,NULL,NULL),(2228,1555,2,NULL,NULL),(2229,1555,3,NULL,NULL),(2230,1556,1,NULL,NULL),(2231,1556,2,NULL,NULL),(2232,1556,3,NULL,NULL),(2233,1557,1,NULL,NULL),(2234,1557,2,NULL,NULL),(2235,1557,3,NULL,NULL),(2236,1558,1,NULL,NULL),(2237,1558,2,NULL,NULL),(2238,1558,3,NULL,NULL),(2239,1559,1,NULL,NULL),(2240,1559,2,NULL,NULL),(2241,1559,3,NULL,NULL),(2242,1560,1,NULL,NULL),(2243,1560,2,NULL,NULL),(2244,1560,3,NULL,NULL),(2245,1561,1,NULL,NULL),(2246,1561,2,NULL,NULL),(2247,1561,3,NULL,NULL),(2248,1562,1,NULL,NULL),(2249,1562,2,NULL,NULL),(2250,1562,3,NULL,NULL),(2251,1563,1,NULL,NULL),(2252,1563,2,NULL,NULL),(2253,1563,3,NULL,NULL),(2254,1564,1,NULL,NULL),(2255,1564,2,NULL,NULL),(2256,1564,3,NULL,NULL),(2257,1565,1,NULL,NULL),(2258,1565,2,NULL,NULL),(2259,1565,3,NULL,NULL),(2260,1566,1,NULL,NULL),(2261,1566,2,NULL,NULL),(2262,1566,3,NULL,NULL),(2263,1567,1,NULL,NULL),(2264,1567,2,NULL,NULL),(2265,1567,3,NULL,NULL),(2266,1568,1,NULL,NULL),(2267,1568,2,NULL,NULL),(2268,1568,3,NULL,NULL),(2269,1569,1,NULL,NULL),(2270,1569,2,NULL,NULL),(2271,1569,3,NULL,NULL),(2272,1570,1,NULL,NULL),(2273,1570,2,NULL,NULL),(2274,1570,3,NULL,NULL),(2275,1571,1,NULL,NULL),(2276,1571,2,NULL,NULL),(2277,1571,3,NULL,NULL),(2278,1572,1,NULL,NULL),(2279,1572,2,NULL,NULL),(2280,1572,3,NULL,NULL),(2281,1573,1,NULL,NULL),(2282,1573,2,NULL,NULL),(2283,1573,3,NULL,NULL),(2284,1574,1,NULL,NULL),(2285,1574,2,NULL,NULL),(2286,1574,3,NULL,NULL),(2287,1575,1,NULL,NULL),(2288,1575,2,NULL,NULL),(2289,1575,3,NULL,NULL),(2290,1576,1,NULL,NULL),(2291,1576,2,NULL,NULL),(2292,1576,3,NULL,NULL),(2293,1577,1,NULL,NULL),(2294,1577,2,NULL,NULL),(2295,1577,3,NULL,NULL),(2296,1578,1,NULL,NULL),(2297,1578,2,NULL,NULL),(2298,1578,3,NULL,NULL),(2299,1579,1,NULL,NULL),(2300,1579,2,NULL,NULL),(2301,1579,3,NULL,NULL),(2302,1580,1,NULL,NULL),(2303,1580,2,NULL,NULL),(2304,1580,3,NULL,NULL),(2305,1581,1,NULL,NULL),(2306,1581,2,NULL,NULL),(2307,1581,3,NULL,NULL),(2308,1582,1,NULL,NULL),(2309,1582,2,NULL,NULL),(2310,1582,3,NULL,NULL),(2311,1583,1,NULL,NULL),(2312,1583,2,NULL,NULL),(2313,1583,3,NULL,NULL),(2314,1584,1,NULL,NULL),(2315,1584,2,NULL,NULL),(2316,1584,3,NULL,NULL),(2317,1585,1,NULL,NULL),(2318,1585,2,NULL,NULL),(2319,1585,3,NULL,NULL),(2320,1586,1,NULL,NULL),(2321,1586,2,NULL,NULL),(2322,1586,3,NULL,NULL),(2323,1587,1,NULL,NULL),(2324,1587,2,NULL,NULL),(2325,1587,3,NULL,NULL),(2326,1588,1,NULL,NULL),(2327,1588,2,NULL,NULL),(2328,1588,3,NULL,NULL),(2329,1589,1,NULL,NULL),(2330,1589,2,NULL,NULL),(2331,1589,3,NULL,NULL),(2332,1590,1,NULL,NULL),(2333,1590,2,NULL,NULL),(2334,1590,3,NULL,NULL),(2335,1591,1,NULL,NULL),(2336,1591,2,NULL,NULL),(2337,1591,3,NULL,NULL),(2338,1592,1,NULL,NULL),(2339,1592,2,NULL,NULL),(2340,1592,3,NULL,NULL),(2341,1593,1,NULL,NULL),(2342,1593,2,NULL,NULL),(2343,1593,3,NULL,NULL),(2344,1594,1,NULL,NULL),(2345,1594,2,NULL,NULL),(2346,1594,3,NULL,NULL),(2347,1595,1,NULL,NULL),(2348,1595,2,NULL,NULL),(2349,1595,3,NULL,NULL),(2350,1596,1,NULL,NULL),(2351,1596,2,NULL,NULL),(2352,1596,3,NULL,NULL),(2353,1597,1,NULL,NULL),(2354,1597,2,NULL,NULL),(2355,1597,3,NULL,NULL),(2356,1598,1,NULL,NULL),(2357,1598,2,NULL,NULL),(2358,1598,3,NULL,NULL),(2359,1599,1,NULL,NULL),(2360,1599,2,NULL,NULL),(2361,1599,3,NULL,NULL),(2362,1600,1,NULL,NULL),(2363,1600,2,NULL,NULL),(2364,1600,3,NULL,NULL),(2365,1601,1,NULL,NULL),(2366,1601,2,NULL,NULL),(2367,1601,3,NULL,NULL),(2368,1602,1,NULL,NULL),(2369,1602,2,NULL,NULL),(2370,1602,3,NULL,NULL),(2371,1603,1,NULL,NULL),(2372,1603,2,NULL,NULL),(2373,1603,3,NULL,NULL),(2374,1604,1,NULL,NULL),(2375,1604,2,NULL,NULL),(2376,1604,3,NULL,NULL),(2377,1605,1,NULL,NULL),(2378,1605,2,NULL,NULL),(2379,1605,3,NULL,NULL),(2380,1606,1,NULL,NULL),(2381,1606,2,NULL,NULL),(2382,1606,3,NULL,NULL),(2383,1607,1,NULL,NULL),(2384,1607,2,NULL,NULL),(2385,1607,3,NULL,NULL),(2386,1608,1,NULL,NULL),(2387,1608,2,NULL,NULL),(2388,1608,3,NULL,NULL),(2389,1609,1,NULL,NULL),(2390,1609,2,NULL,NULL),(2391,1609,3,NULL,NULL),(2392,1610,1,NULL,NULL),(2393,1610,2,NULL,NULL),(2394,1610,3,NULL,NULL),(2395,1611,1,NULL,NULL),(2396,1611,2,NULL,NULL),(2397,1611,3,NULL,NULL),(2398,1612,1,NULL,NULL),(2399,1612,2,NULL,NULL),(2400,1612,3,NULL,NULL),(2401,1613,1,NULL,NULL),(2402,1613,2,NULL,NULL),(2403,1613,3,NULL,NULL),(2404,1614,1,NULL,NULL),(2405,1614,2,NULL,NULL),(2406,1614,3,NULL,NULL),(2407,1615,1,NULL,NULL),(2408,1615,2,NULL,NULL),(2409,1615,3,NULL,NULL),(2410,1616,1,NULL,NULL),(2411,1616,2,NULL,NULL),(2412,1616,3,NULL,NULL),(2413,1617,1,NULL,NULL),(2414,1617,2,NULL,NULL),(2415,1617,3,NULL,NULL),(2416,1618,1,NULL,NULL),(2417,1618,2,NULL,NULL),(2418,1618,3,NULL,NULL),(2419,1619,1,NULL,NULL),(2420,1619,2,NULL,NULL),(2421,1619,3,NULL,NULL),(2422,1620,1,NULL,NULL),(2423,1620,2,NULL,NULL),(2424,1620,3,NULL,NULL),(2425,1621,1,NULL,NULL),(2426,1621,2,NULL,NULL),(2427,1621,3,NULL,NULL),(2428,1622,1,NULL,NULL),(2429,1622,2,NULL,NULL),(2430,1622,3,NULL,NULL),(2431,1623,1,NULL,NULL),(2432,1623,2,NULL,NULL),(2433,1623,3,NULL,NULL),(2434,1624,1,NULL,NULL),(2435,1624,2,NULL,NULL),(2436,1624,3,NULL,NULL),(2437,1625,1,NULL,NULL),(2438,1625,2,NULL,NULL),(2439,1625,3,NULL,NULL),(2440,1626,1,NULL,NULL),(2441,1626,2,NULL,NULL),(2442,1626,3,NULL,NULL),(2443,1627,1,NULL,NULL),(2444,1627,2,NULL,NULL),(2445,1627,3,NULL,NULL),(2446,1628,1,NULL,NULL),(2447,1628,2,NULL,NULL),(2448,1628,3,NULL,NULL),(2449,1629,1,NULL,NULL),(2450,1629,2,NULL,NULL),(2451,1629,3,NULL,NULL),(2452,1630,1,NULL,NULL),(2453,1630,2,NULL,NULL),(2454,1630,3,NULL,NULL),(2455,1631,1,NULL,NULL),(2456,1631,2,NULL,NULL),(2457,1631,3,NULL,NULL),(2458,1632,1,NULL,NULL),(2459,1632,2,NULL,NULL),(2460,1632,3,NULL,NULL),(2461,1633,1,NULL,NULL),(2462,1633,2,NULL,NULL),(2463,1633,3,NULL,NULL),(2464,1634,1,NULL,NULL),(2465,1634,2,NULL,NULL),(2466,1634,3,NULL,NULL),(2467,1635,1,NULL,NULL),(2468,1635,2,NULL,NULL),(2469,1635,3,NULL,NULL),(2470,1636,1,NULL,NULL),(2471,1636,2,NULL,NULL),(2472,1636,3,NULL,NULL),(2473,1637,1,NULL,NULL),(2474,1637,2,NULL,NULL),(2475,1637,3,NULL,NULL),(2476,1638,1,NULL,NULL),(2477,1638,2,NULL,NULL),(2478,1638,3,NULL,NULL),(2479,1639,1,NULL,NULL),(2480,1639,2,NULL,NULL),(2481,1639,3,NULL,NULL),(2482,1640,1,NULL,NULL),(2483,1640,2,NULL,NULL),(2484,1640,3,NULL,NULL),(2485,1641,1,NULL,NULL),(2486,1641,2,NULL,NULL),(2487,1641,3,NULL,NULL),(2488,1642,1,NULL,NULL),(2489,1642,2,NULL,NULL),(2490,1642,3,NULL,NULL),(2491,1643,1,NULL,NULL),(2492,1643,2,NULL,NULL),(2493,1643,3,NULL,NULL),(2494,1644,1,NULL,NULL),(2495,1644,2,NULL,NULL),(2496,1644,3,NULL,NULL),(2497,1645,1,NULL,NULL),(2498,1645,2,NULL,NULL),(2499,1645,3,NULL,NULL),(2500,1646,1,NULL,NULL),(2501,1646,2,NULL,NULL),(2502,1646,3,NULL,NULL),(2503,1647,1,NULL,NULL),(2504,1647,2,NULL,NULL),(2505,1647,3,NULL,NULL),(2506,1648,1,NULL,NULL),(2507,1648,2,NULL,NULL),(2508,1648,3,NULL,NULL),(2509,1649,1,NULL,NULL),(2510,1649,2,NULL,NULL),(2511,1649,3,NULL,NULL),(2512,1650,1,NULL,NULL),(2513,1650,2,NULL,NULL),(2514,1650,3,NULL,NULL),(2515,1651,1,NULL,NULL),(2516,1651,2,NULL,NULL),(2517,1651,3,NULL,NULL),(2518,1652,1,NULL,NULL),(2519,1652,2,NULL,NULL),(2520,1652,3,NULL,NULL),(2521,1653,1,NULL,NULL),(2522,1653,2,NULL,NULL),(2523,1653,3,NULL,NULL),(2524,1654,1,NULL,NULL),(2525,1654,2,NULL,NULL),(2526,1654,3,NULL,NULL),(2527,1655,1,NULL,NULL),(2528,1655,2,NULL,NULL),(2529,1655,3,NULL,NULL),(2530,1656,1,NULL,NULL),(2531,1656,2,NULL,NULL),(2532,1656,3,NULL,NULL),(2533,1657,1,NULL,NULL),(2534,1657,2,NULL,NULL),(2535,1657,3,NULL,NULL),(2536,1658,1,NULL,NULL),(2537,1658,2,NULL,NULL),(2538,1658,3,NULL,NULL),(2539,1659,1,NULL,NULL),(2540,1659,2,NULL,NULL),(2541,1659,3,NULL,NULL),(2542,1660,1,NULL,NULL),(2543,1660,2,NULL,NULL),(2544,1660,3,NULL,NULL),(2545,1661,1,NULL,NULL),(2546,1661,2,NULL,NULL),(2547,1661,3,NULL,NULL),(2548,1662,1,NULL,NULL),(2549,1662,2,NULL,NULL),(2550,1662,3,NULL,NULL);

/*Table structure for table `chart_of_account_companies` */

DROP TABLE IF EXISTS `chart_of_account_companies`;

CREATE TABLE `chart_of_account_companies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `chart_of_account_id` bigint(20) unsigned NOT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chart_of_account_companies_chart_of_account_id_foreign` (`chart_of_account_id`),
  KEY `chart_of_account_companies_company_id_foreign` (`company_id`),
  CONSTRAINT `chart_of_account_companies_chart_of_account_id_foreign` FOREIGN KEY (`chart_of_account_id`) REFERENCES `chart_of_accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `chart_of_account_companies_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5382 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `chart_of_account_companies` */

insert  into `chart_of_account_companies`(`id`,`chart_of_account_id`,`company_id`,`created_at`,`updated_at`) values (3282,1313,2,NULL,NULL),(3283,1313,5,NULL,NULL),(3284,1313,9,NULL,NULL),(3285,1313,10,NULL,NULL),(3286,1313,11,NULL,NULL),(3287,1313,12,NULL,NULL),(3288,1314,2,NULL,NULL),(3289,1314,5,NULL,NULL),(3290,1314,9,NULL,NULL),(3291,1314,10,NULL,NULL),(3292,1314,11,NULL,NULL),(3293,1314,12,NULL,NULL),(3294,1315,2,NULL,NULL),(3295,1315,5,NULL,NULL),(3296,1315,9,NULL,NULL),(3297,1315,10,NULL,NULL),(3298,1315,11,NULL,NULL),(3299,1315,12,NULL,NULL),(3300,1316,2,NULL,NULL),(3301,1316,5,NULL,NULL),(3302,1316,9,NULL,NULL),(3303,1316,10,NULL,NULL),(3304,1316,11,NULL,NULL),(3305,1316,12,NULL,NULL),(3306,1317,2,NULL,NULL),(3307,1317,5,NULL,NULL),(3308,1317,9,NULL,NULL),(3309,1317,10,NULL,NULL),(3310,1317,11,NULL,NULL),(3311,1317,12,NULL,NULL),(3312,1318,2,NULL,NULL),(3313,1318,5,NULL,NULL),(3314,1318,9,NULL,NULL),(3315,1318,10,NULL,NULL),(3316,1318,11,NULL,NULL),(3317,1318,12,NULL,NULL),(3318,1319,2,NULL,NULL),(3319,1319,5,NULL,NULL),(3320,1319,9,NULL,NULL),(3321,1319,10,NULL,NULL),(3322,1319,11,NULL,NULL),(3323,1319,12,NULL,NULL),(3324,1320,2,NULL,NULL),(3325,1320,5,NULL,NULL),(3326,1320,9,NULL,NULL),(3327,1320,10,NULL,NULL),(3328,1320,11,NULL,NULL),(3329,1320,12,NULL,NULL),(3330,1321,2,NULL,NULL),(3331,1321,5,NULL,NULL),(3332,1321,9,NULL,NULL),(3333,1321,10,NULL,NULL),(3334,1321,11,NULL,NULL),(3335,1321,12,NULL,NULL),(3336,1322,2,NULL,NULL),(3337,1322,5,NULL,NULL),(3338,1322,9,NULL,NULL),(3339,1322,10,NULL,NULL),(3340,1322,11,NULL,NULL),(3341,1322,12,NULL,NULL),(3342,1323,2,NULL,NULL),(3343,1323,5,NULL,NULL),(3344,1323,9,NULL,NULL),(3345,1323,10,NULL,NULL),(3346,1323,11,NULL,NULL),(3347,1323,12,NULL,NULL),(3348,1324,2,NULL,NULL),(3349,1324,5,NULL,NULL),(3350,1324,9,NULL,NULL),(3351,1324,10,NULL,NULL),(3352,1324,11,NULL,NULL),(3353,1324,12,NULL,NULL),(3354,1325,2,NULL,NULL),(3355,1325,5,NULL,NULL),(3356,1325,9,NULL,NULL),(3357,1325,10,NULL,NULL),(3358,1325,11,NULL,NULL),(3359,1325,12,NULL,NULL),(3360,1326,2,NULL,NULL),(3361,1326,5,NULL,NULL),(3362,1326,9,NULL,NULL),(3363,1326,10,NULL,NULL),(3364,1326,11,NULL,NULL),(3365,1326,12,NULL,NULL),(3366,1327,2,NULL,NULL),(3367,1327,5,NULL,NULL),(3368,1327,9,NULL,NULL),(3369,1327,10,NULL,NULL),(3370,1327,11,NULL,NULL),(3371,1327,12,NULL,NULL),(3372,1328,2,NULL,NULL),(3373,1328,5,NULL,NULL),(3374,1328,9,NULL,NULL),(3375,1328,10,NULL,NULL),(3376,1328,11,NULL,NULL),(3377,1328,12,NULL,NULL),(3378,1329,2,NULL,NULL),(3379,1329,5,NULL,NULL),(3380,1329,9,NULL,NULL),(3381,1329,10,NULL,NULL),(3382,1329,11,NULL,NULL),(3383,1329,12,NULL,NULL),(3384,1330,2,NULL,NULL),(3385,1330,5,NULL,NULL),(3386,1330,9,NULL,NULL),(3387,1330,10,NULL,NULL),(3388,1330,11,NULL,NULL),(3389,1330,12,NULL,NULL),(3390,1331,2,NULL,NULL),(3391,1331,5,NULL,NULL),(3392,1331,9,NULL,NULL),(3393,1331,10,NULL,NULL),(3394,1331,11,NULL,NULL),(3395,1331,12,NULL,NULL),(3396,1332,2,NULL,NULL),(3397,1332,5,NULL,NULL),(3398,1332,9,NULL,NULL),(3399,1332,10,NULL,NULL),(3400,1332,11,NULL,NULL),(3401,1332,12,NULL,NULL),(3402,1333,2,NULL,NULL),(3403,1333,5,NULL,NULL),(3404,1333,9,NULL,NULL),(3405,1333,10,NULL,NULL),(3406,1333,11,NULL,NULL),(3407,1333,12,NULL,NULL),(3408,1334,2,NULL,NULL),(3409,1334,5,NULL,NULL),(3410,1334,9,NULL,NULL),(3411,1334,10,NULL,NULL),(3412,1334,11,NULL,NULL),(3413,1334,12,NULL,NULL),(3414,1335,2,NULL,NULL),(3415,1335,5,NULL,NULL),(3416,1335,9,NULL,NULL),(3417,1335,10,NULL,NULL),(3418,1335,11,NULL,NULL),(3419,1335,12,NULL,NULL),(3420,1336,2,NULL,NULL),(3421,1336,5,NULL,NULL),(3422,1336,9,NULL,NULL),(3423,1336,10,NULL,NULL),(3424,1336,11,NULL,NULL),(3425,1336,12,NULL,NULL),(3426,1337,2,NULL,NULL),(3427,1337,5,NULL,NULL),(3428,1337,9,NULL,NULL),(3429,1337,10,NULL,NULL),(3430,1337,11,NULL,NULL),(3431,1337,12,NULL,NULL),(3432,1338,2,NULL,NULL),(3433,1338,5,NULL,NULL),(3434,1338,9,NULL,NULL),(3435,1338,10,NULL,NULL),(3436,1338,11,NULL,NULL),(3437,1338,12,NULL,NULL),(3438,1339,2,NULL,NULL),(3439,1339,5,NULL,NULL),(3440,1339,9,NULL,NULL),(3441,1339,10,NULL,NULL),(3442,1339,11,NULL,NULL),(3443,1339,12,NULL,NULL),(3444,1340,2,NULL,NULL),(3445,1340,5,NULL,NULL),(3446,1340,9,NULL,NULL),(3447,1340,10,NULL,NULL),(3448,1340,11,NULL,NULL),(3449,1340,12,NULL,NULL),(3450,1341,2,NULL,NULL),(3451,1341,5,NULL,NULL),(3452,1341,9,NULL,NULL),(3453,1341,10,NULL,NULL),(3454,1341,11,NULL,NULL),(3455,1341,12,NULL,NULL),(3456,1342,2,NULL,NULL),(3457,1342,5,NULL,NULL),(3458,1342,9,NULL,NULL),(3459,1342,10,NULL,NULL),(3460,1342,11,NULL,NULL),(3461,1342,12,NULL,NULL),(3462,1343,2,NULL,NULL),(3463,1343,5,NULL,NULL),(3464,1343,9,NULL,NULL),(3465,1343,10,NULL,NULL),(3466,1343,11,NULL,NULL),(3467,1343,12,NULL,NULL),(3468,1344,2,NULL,NULL),(3469,1344,5,NULL,NULL),(3470,1344,9,NULL,NULL),(3471,1344,10,NULL,NULL),(3472,1344,11,NULL,NULL),(3473,1344,12,NULL,NULL),(3474,1345,2,NULL,NULL),(3475,1345,5,NULL,NULL),(3476,1345,9,NULL,NULL),(3477,1345,10,NULL,NULL),(3478,1345,11,NULL,NULL),(3479,1345,12,NULL,NULL),(3480,1346,2,NULL,NULL),(3481,1346,5,NULL,NULL),(3482,1346,9,NULL,NULL),(3483,1346,10,NULL,NULL),(3484,1346,11,NULL,NULL),(3485,1346,12,NULL,NULL),(3486,1347,2,NULL,NULL),(3487,1347,5,NULL,NULL),(3488,1347,9,NULL,NULL),(3489,1347,10,NULL,NULL),(3490,1347,11,NULL,NULL),(3491,1347,12,NULL,NULL),(3492,1348,2,NULL,NULL),(3493,1348,5,NULL,NULL),(3494,1348,9,NULL,NULL),(3495,1348,10,NULL,NULL),(3496,1348,11,NULL,NULL),(3497,1348,12,NULL,NULL),(3498,1349,2,NULL,NULL),(3499,1349,5,NULL,NULL),(3500,1349,9,NULL,NULL),(3501,1349,10,NULL,NULL),(3502,1349,11,NULL,NULL),(3503,1349,12,NULL,NULL),(3504,1350,2,NULL,NULL),(3505,1350,5,NULL,NULL),(3506,1350,9,NULL,NULL),(3507,1350,10,NULL,NULL),(3508,1350,11,NULL,NULL),(3509,1350,12,NULL,NULL),(3510,1351,2,NULL,NULL),(3511,1351,5,NULL,NULL),(3512,1351,9,NULL,NULL),(3513,1351,10,NULL,NULL),(3514,1351,11,NULL,NULL),(3515,1351,12,NULL,NULL),(3516,1352,2,NULL,NULL),(3517,1352,5,NULL,NULL),(3518,1352,9,NULL,NULL),(3519,1352,10,NULL,NULL),(3520,1352,11,NULL,NULL),(3521,1352,12,NULL,NULL),(3522,1353,2,NULL,NULL),(3523,1353,5,NULL,NULL),(3524,1353,9,NULL,NULL),(3525,1353,10,NULL,NULL),(3526,1353,11,NULL,NULL),(3527,1353,12,NULL,NULL),(3528,1354,2,NULL,NULL),(3529,1354,5,NULL,NULL),(3530,1354,9,NULL,NULL),(3531,1354,10,NULL,NULL),(3532,1354,11,NULL,NULL),(3533,1354,12,NULL,NULL),(3534,1355,2,NULL,NULL),(3535,1355,5,NULL,NULL),(3536,1355,9,NULL,NULL),(3537,1355,10,NULL,NULL),(3538,1355,11,NULL,NULL),(3539,1355,12,NULL,NULL),(3540,1356,2,NULL,NULL),(3541,1356,5,NULL,NULL),(3542,1356,9,NULL,NULL),(3543,1356,10,NULL,NULL),(3544,1356,11,NULL,NULL),(3545,1356,12,NULL,NULL),(3546,1357,2,NULL,NULL),(3547,1357,5,NULL,NULL),(3548,1357,9,NULL,NULL),(3549,1357,10,NULL,NULL),(3550,1357,11,NULL,NULL),(3551,1357,12,NULL,NULL),(3552,1358,2,NULL,NULL),(3553,1358,5,NULL,NULL),(3554,1358,9,NULL,NULL),(3555,1358,10,NULL,NULL),(3556,1358,11,NULL,NULL),(3557,1358,12,NULL,NULL),(3558,1359,2,NULL,NULL),(3559,1359,5,NULL,NULL),(3560,1359,9,NULL,NULL),(3561,1359,10,NULL,NULL),(3562,1359,11,NULL,NULL),(3563,1359,12,NULL,NULL),(3564,1360,2,NULL,NULL),(3565,1360,5,NULL,NULL),(3566,1360,9,NULL,NULL),(3567,1360,10,NULL,NULL),(3568,1360,11,NULL,NULL),(3569,1360,12,NULL,NULL),(3570,1361,2,NULL,NULL),(3571,1361,5,NULL,NULL),(3572,1361,9,NULL,NULL),(3573,1361,10,NULL,NULL),(3574,1361,11,NULL,NULL),(3575,1361,12,NULL,NULL),(3576,1362,2,NULL,NULL),(3577,1362,5,NULL,NULL),(3578,1362,9,NULL,NULL),(3579,1362,10,NULL,NULL),(3580,1362,11,NULL,NULL),(3581,1362,12,NULL,NULL),(3582,1363,2,NULL,NULL),(3583,1363,5,NULL,NULL),(3584,1363,9,NULL,NULL),(3585,1363,10,NULL,NULL),(3586,1363,11,NULL,NULL),(3587,1363,12,NULL,NULL),(3588,1364,2,NULL,NULL),(3589,1364,5,NULL,NULL),(3590,1364,9,NULL,NULL),(3591,1364,10,NULL,NULL),(3592,1364,11,NULL,NULL),(3593,1364,12,NULL,NULL),(3594,1365,2,NULL,NULL),(3595,1365,5,NULL,NULL),(3596,1365,9,NULL,NULL),(3597,1365,10,NULL,NULL),(3598,1365,11,NULL,NULL),(3599,1365,12,NULL,NULL),(3600,1366,2,NULL,NULL),(3601,1366,5,NULL,NULL),(3602,1366,9,NULL,NULL),(3603,1366,10,NULL,NULL),(3604,1366,11,NULL,NULL),(3605,1366,12,NULL,NULL),(3606,1367,2,NULL,NULL),(3607,1367,5,NULL,NULL),(3608,1367,9,NULL,NULL),(3609,1367,10,NULL,NULL),(3610,1367,11,NULL,NULL),(3611,1367,12,NULL,NULL),(3612,1368,2,NULL,NULL),(3613,1368,5,NULL,NULL),(3614,1368,9,NULL,NULL),(3615,1368,10,NULL,NULL),(3616,1368,11,NULL,NULL),(3617,1368,12,NULL,NULL),(3618,1369,2,NULL,NULL),(3619,1369,5,NULL,NULL),(3620,1369,9,NULL,NULL),(3621,1369,10,NULL,NULL),(3622,1369,11,NULL,NULL),(3623,1369,12,NULL,NULL),(3624,1370,2,NULL,NULL),(3625,1370,5,NULL,NULL),(3626,1370,9,NULL,NULL),(3627,1370,10,NULL,NULL),(3628,1370,11,NULL,NULL),(3629,1370,12,NULL,NULL),(3630,1371,2,NULL,NULL),(3631,1371,5,NULL,NULL),(3632,1371,9,NULL,NULL),(3633,1371,10,NULL,NULL),(3634,1371,11,NULL,NULL),(3635,1371,12,NULL,NULL),(3636,1372,2,NULL,NULL),(3637,1372,5,NULL,NULL),(3638,1372,9,NULL,NULL),(3639,1372,10,NULL,NULL),(3640,1372,11,NULL,NULL),(3641,1372,12,NULL,NULL),(3642,1373,2,NULL,NULL),(3643,1373,5,NULL,NULL),(3644,1373,9,NULL,NULL),(3645,1373,10,NULL,NULL),(3646,1373,11,NULL,NULL),(3647,1373,12,NULL,NULL),(3648,1374,2,NULL,NULL),(3649,1374,5,NULL,NULL),(3650,1374,9,NULL,NULL),(3651,1374,10,NULL,NULL),(3652,1374,11,NULL,NULL),(3653,1374,12,NULL,NULL),(3654,1375,2,NULL,NULL),(3655,1375,5,NULL,NULL),(3656,1375,9,NULL,NULL),(3657,1375,10,NULL,NULL),(3658,1375,11,NULL,NULL),(3659,1375,12,NULL,NULL),(3660,1376,2,NULL,NULL),(3661,1376,5,NULL,NULL),(3662,1376,9,NULL,NULL),(3663,1376,10,NULL,NULL),(3664,1376,11,NULL,NULL),(3665,1376,12,NULL,NULL),(3666,1377,2,NULL,NULL),(3667,1377,5,NULL,NULL),(3668,1377,9,NULL,NULL),(3669,1377,10,NULL,NULL),(3670,1377,11,NULL,NULL),(3671,1377,12,NULL,NULL),(3672,1378,2,NULL,NULL),(3673,1378,5,NULL,NULL),(3674,1378,9,NULL,NULL),(3675,1378,10,NULL,NULL),(3676,1378,11,NULL,NULL),(3677,1378,12,NULL,NULL),(3678,1379,2,NULL,NULL),(3679,1379,5,NULL,NULL),(3680,1379,9,NULL,NULL),(3681,1379,10,NULL,NULL),(3682,1379,11,NULL,NULL),(3683,1379,12,NULL,NULL),(3684,1380,2,NULL,NULL),(3685,1380,5,NULL,NULL),(3686,1380,9,NULL,NULL),(3687,1380,10,NULL,NULL),(3688,1380,11,NULL,NULL),(3689,1380,12,NULL,NULL),(3690,1381,2,NULL,NULL),(3691,1381,5,NULL,NULL),(3692,1381,9,NULL,NULL),(3693,1381,10,NULL,NULL),(3694,1381,11,NULL,NULL),(3695,1381,12,NULL,NULL),(3696,1382,2,NULL,NULL),(3697,1382,5,NULL,NULL),(3698,1382,9,NULL,NULL),(3699,1382,10,NULL,NULL),(3700,1382,11,NULL,NULL),(3701,1382,12,NULL,NULL),(3702,1383,2,NULL,NULL),(3703,1383,5,NULL,NULL),(3704,1383,9,NULL,NULL),(3705,1383,10,NULL,NULL),(3706,1383,11,NULL,NULL),(3707,1383,12,NULL,NULL),(3708,1384,2,NULL,NULL),(3709,1384,5,NULL,NULL),(3710,1384,9,NULL,NULL),(3711,1384,10,NULL,NULL),(3712,1384,11,NULL,NULL),(3713,1384,12,NULL,NULL),(3714,1385,2,NULL,NULL),(3715,1385,5,NULL,NULL),(3716,1385,9,NULL,NULL),(3717,1385,10,NULL,NULL),(3718,1385,11,NULL,NULL),(3719,1385,12,NULL,NULL),(3720,1386,2,NULL,NULL),(3721,1386,5,NULL,NULL),(3722,1386,9,NULL,NULL),(3723,1386,10,NULL,NULL),(3724,1386,11,NULL,NULL),(3725,1386,12,NULL,NULL),(3726,1387,2,NULL,NULL),(3727,1387,5,NULL,NULL),(3728,1387,9,NULL,NULL),(3729,1387,10,NULL,NULL),(3730,1387,11,NULL,NULL),(3731,1387,12,NULL,NULL),(3732,1388,2,NULL,NULL),(3733,1388,5,NULL,NULL),(3734,1388,9,NULL,NULL),(3735,1388,10,NULL,NULL),(3736,1388,11,NULL,NULL),(3737,1388,12,NULL,NULL),(3738,1389,2,NULL,NULL),(3739,1389,5,NULL,NULL),(3740,1389,9,NULL,NULL),(3741,1389,10,NULL,NULL),(3742,1389,11,NULL,NULL),(3743,1389,12,NULL,NULL),(3744,1390,2,NULL,NULL),(3745,1390,5,NULL,NULL),(3746,1390,9,NULL,NULL),(3747,1390,10,NULL,NULL),(3748,1390,11,NULL,NULL),(3749,1390,12,NULL,NULL),(3750,1391,2,NULL,NULL),(3751,1391,5,NULL,NULL),(3752,1391,9,NULL,NULL),(3753,1391,10,NULL,NULL),(3754,1391,11,NULL,NULL),(3755,1391,12,NULL,NULL),(3756,1392,2,NULL,NULL),(3757,1392,5,NULL,NULL),(3758,1392,9,NULL,NULL),(3759,1392,10,NULL,NULL),(3760,1392,11,NULL,NULL),(3761,1392,12,NULL,NULL),(3762,1393,2,NULL,NULL),(3763,1393,5,NULL,NULL),(3764,1393,9,NULL,NULL),(3765,1393,10,NULL,NULL),(3766,1393,11,NULL,NULL),(3767,1393,12,NULL,NULL),(3768,1394,2,NULL,NULL),(3769,1394,5,NULL,NULL),(3770,1394,9,NULL,NULL),(3771,1394,10,NULL,NULL),(3772,1394,11,NULL,NULL),(3773,1394,12,NULL,NULL),(3774,1395,2,NULL,NULL),(3775,1395,5,NULL,NULL),(3776,1395,9,NULL,NULL),(3777,1395,10,NULL,NULL),(3778,1395,11,NULL,NULL),(3779,1395,12,NULL,NULL),(3780,1396,2,NULL,NULL),(3781,1396,5,NULL,NULL),(3782,1396,9,NULL,NULL),(3783,1396,10,NULL,NULL),(3784,1396,11,NULL,NULL),(3785,1396,12,NULL,NULL),(3786,1397,2,NULL,NULL),(3787,1397,5,NULL,NULL),(3788,1397,9,NULL,NULL),(3789,1397,10,NULL,NULL),(3790,1397,11,NULL,NULL),(3791,1397,12,NULL,NULL),(3792,1398,2,NULL,NULL),(3793,1398,5,NULL,NULL),(3794,1398,9,NULL,NULL),(3795,1398,10,NULL,NULL),(3796,1398,11,NULL,NULL),(3797,1398,12,NULL,NULL),(3798,1399,2,NULL,NULL),(3799,1399,5,NULL,NULL),(3800,1399,9,NULL,NULL),(3801,1399,10,NULL,NULL),(3802,1399,11,NULL,NULL),(3803,1399,12,NULL,NULL),(3804,1400,2,NULL,NULL),(3805,1400,5,NULL,NULL),(3806,1400,9,NULL,NULL),(3807,1400,10,NULL,NULL),(3808,1400,11,NULL,NULL),(3809,1400,12,NULL,NULL),(3810,1401,2,NULL,NULL),(3811,1401,5,NULL,NULL),(3812,1401,9,NULL,NULL),(3813,1401,10,NULL,NULL),(3814,1401,11,NULL,NULL),(3815,1401,12,NULL,NULL),(3816,1402,2,NULL,NULL),(3817,1402,5,NULL,NULL),(3818,1402,9,NULL,NULL),(3819,1402,10,NULL,NULL),(3820,1402,11,NULL,NULL),(3821,1402,12,NULL,NULL),(3822,1403,2,NULL,NULL),(3823,1403,5,NULL,NULL),(3824,1403,9,NULL,NULL),(3825,1403,10,NULL,NULL),(3826,1403,11,NULL,NULL),(3827,1403,12,NULL,NULL),(3828,1404,2,NULL,NULL),(3829,1404,5,NULL,NULL),(3830,1404,9,NULL,NULL),(3831,1404,10,NULL,NULL),(3832,1404,11,NULL,NULL),(3833,1404,12,NULL,NULL),(3834,1405,2,NULL,NULL),(3835,1405,5,NULL,NULL),(3836,1405,9,NULL,NULL),(3837,1405,10,NULL,NULL),(3838,1405,11,NULL,NULL),(3839,1405,12,NULL,NULL),(3840,1406,2,NULL,NULL),(3841,1406,5,NULL,NULL),(3842,1406,9,NULL,NULL),(3843,1406,10,NULL,NULL),(3844,1406,11,NULL,NULL),(3845,1406,12,NULL,NULL),(3846,1407,2,NULL,NULL),(3847,1407,5,NULL,NULL),(3848,1407,9,NULL,NULL),(3849,1407,10,NULL,NULL),(3850,1407,11,NULL,NULL),(3851,1407,12,NULL,NULL),(3852,1408,2,NULL,NULL),(3853,1408,5,NULL,NULL),(3854,1408,9,NULL,NULL),(3855,1408,10,NULL,NULL),(3856,1408,11,NULL,NULL),(3857,1408,12,NULL,NULL),(3858,1409,2,NULL,NULL),(3859,1409,5,NULL,NULL),(3860,1409,9,NULL,NULL),(3861,1409,10,NULL,NULL),(3862,1409,11,NULL,NULL),(3863,1409,12,NULL,NULL),(3864,1410,2,NULL,NULL),(3865,1410,5,NULL,NULL),(3866,1410,9,NULL,NULL),(3867,1410,10,NULL,NULL),(3868,1410,11,NULL,NULL),(3869,1410,12,NULL,NULL),(3870,1411,2,NULL,NULL),(3871,1411,5,NULL,NULL),(3872,1411,9,NULL,NULL),(3873,1411,10,NULL,NULL),(3874,1411,11,NULL,NULL),(3875,1411,12,NULL,NULL),(3876,1412,2,NULL,NULL),(3877,1412,5,NULL,NULL),(3878,1412,9,NULL,NULL),(3879,1412,10,NULL,NULL),(3880,1412,11,NULL,NULL),(3881,1412,12,NULL,NULL),(3882,1413,2,NULL,NULL),(3883,1413,5,NULL,NULL),(3884,1413,9,NULL,NULL),(3885,1413,10,NULL,NULL),(3886,1413,11,NULL,NULL),(3887,1413,12,NULL,NULL),(3888,1414,2,NULL,NULL),(3889,1414,5,NULL,NULL),(3890,1414,9,NULL,NULL),(3891,1414,10,NULL,NULL),(3892,1414,11,NULL,NULL),(3893,1414,12,NULL,NULL),(3894,1415,2,NULL,NULL),(3895,1415,5,NULL,NULL),(3896,1415,9,NULL,NULL),(3897,1415,10,NULL,NULL),(3898,1415,11,NULL,NULL),(3899,1415,12,NULL,NULL),(3900,1416,2,NULL,NULL),(3901,1416,5,NULL,NULL),(3902,1416,9,NULL,NULL),(3903,1416,10,NULL,NULL),(3904,1416,11,NULL,NULL),(3905,1416,12,NULL,NULL),(3906,1417,2,NULL,NULL),(3907,1417,5,NULL,NULL),(3908,1417,9,NULL,NULL),(3909,1417,10,NULL,NULL),(3910,1417,11,NULL,NULL),(3911,1417,12,NULL,NULL),(3912,1418,2,NULL,NULL),(3913,1418,5,NULL,NULL),(3914,1418,9,NULL,NULL),(3915,1418,10,NULL,NULL),(3916,1418,11,NULL,NULL),(3917,1418,12,NULL,NULL),(3918,1419,2,NULL,NULL),(3919,1419,5,NULL,NULL),(3920,1419,9,NULL,NULL),(3921,1419,10,NULL,NULL),(3922,1419,11,NULL,NULL),(3923,1419,12,NULL,NULL),(3924,1420,2,NULL,NULL),(3925,1420,5,NULL,NULL),(3926,1420,9,NULL,NULL),(3927,1420,10,NULL,NULL),(3928,1420,11,NULL,NULL),(3929,1420,12,NULL,NULL),(3930,1421,2,NULL,NULL),(3931,1421,5,NULL,NULL),(3932,1421,9,NULL,NULL),(3933,1421,10,NULL,NULL),(3934,1421,11,NULL,NULL),(3935,1421,12,NULL,NULL),(3936,1422,2,NULL,NULL),(3937,1422,5,NULL,NULL),(3938,1422,9,NULL,NULL),(3939,1422,10,NULL,NULL),(3940,1422,11,NULL,NULL),(3941,1422,12,NULL,NULL),(3942,1423,2,NULL,NULL),(3943,1423,5,NULL,NULL),(3944,1423,9,NULL,NULL),(3945,1423,10,NULL,NULL),(3946,1423,11,NULL,NULL),(3947,1423,12,NULL,NULL),(3948,1424,2,NULL,NULL),(3949,1424,5,NULL,NULL),(3950,1424,9,NULL,NULL),(3951,1424,10,NULL,NULL),(3952,1424,11,NULL,NULL),(3953,1424,12,NULL,NULL),(3954,1425,2,NULL,NULL),(3955,1425,5,NULL,NULL),(3956,1425,9,NULL,NULL),(3957,1425,10,NULL,NULL),(3958,1425,11,NULL,NULL),(3959,1425,12,NULL,NULL),(3960,1426,2,NULL,NULL),(3961,1426,5,NULL,NULL),(3962,1426,9,NULL,NULL),(3963,1426,10,NULL,NULL),(3964,1426,11,NULL,NULL),(3965,1426,12,NULL,NULL),(3966,1427,2,NULL,NULL),(3967,1427,5,NULL,NULL),(3968,1427,9,NULL,NULL),(3969,1427,10,NULL,NULL),(3970,1427,11,NULL,NULL),(3971,1427,12,NULL,NULL),(3972,1428,2,NULL,NULL),(3973,1428,5,NULL,NULL),(3974,1428,9,NULL,NULL),(3975,1428,10,NULL,NULL),(3976,1428,11,NULL,NULL),(3977,1428,12,NULL,NULL),(3978,1429,2,NULL,NULL),(3979,1429,5,NULL,NULL),(3980,1429,9,NULL,NULL),(3981,1429,10,NULL,NULL),(3982,1429,11,NULL,NULL),(3983,1429,12,NULL,NULL),(3984,1430,2,NULL,NULL),(3985,1430,5,NULL,NULL),(3986,1430,9,NULL,NULL),(3987,1430,10,NULL,NULL),(3988,1430,11,NULL,NULL),(3989,1430,12,NULL,NULL),(3990,1431,2,NULL,NULL),(3991,1431,5,NULL,NULL),(3992,1431,9,NULL,NULL),(3993,1431,10,NULL,NULL),(3994,1431,11,NULL,NULL),(3995,1431,12,NULL,NULL),(3996,1432,2,NULL,NULL),(3997,1432,5,NULL,NULL),(3998,1432,9,NULL,NULL),(3999,1432,10,NULL,NULL),(4000,1432,11,NULL,NULL),(4001,1432,12,NULL,NULL),(4002,1433,2,NULL,NULL),(4003,1433,5,NULL,NULL),(4004,1433,9,NULL,NULL),(4005,1433,10,NULL,NULL),(4006,1433,11,NULL,NULL),(4007,1433,12,NULL,NULL),(4008,1434,2,NULL,NULL),(4009,1434,5,NULL,NULL),(4010,1434,9,NULL,NULL),(4011,1434,10,NULL,NULL),(4012,1434,11,NULL,NULL),(4013,1434,12,NULL,NULL),(4014,1435,2,NULL,NULL),(4015,1435,5,NULL,NULL),(4016,1435,9,NULL,NULL),(4017,1435,10,NULL,NULL),(4018,1435,11,NULL,NULL),(4019,1435,12,NULL,NULL),(4020,1436,2,NULL,NULL),(4021,1436,5,NULL,NULL),(4022,1436,9,NULL,NULL),(4023,1436,10,NULL,NULL),(4024,1436,11,NULL,NULL),(4025,1436,12,NULL,NULL),(4026,1437,2,NULL,NULL),(4027,1437,5,NULL,NULL),(4028,1437,9,NULL,NULL),(4029,1437,10,NULL,NULL),(4030,1437,11,NULL,NULL),(4031,1437,12,NULL,NULL),(4032,1438,2,NULL,NULL),(4033,1438,5,NULL,NULL),(4034,1438,9,NULL,NULL),(4035,1438,10,NULL,NULL),(4036,1438,11,NULL,NULL),(4037,1438,12,NULL,NULL),(4038,1439,2,NULL,NULL),(4039,1439,5,NULL,NULL),(4040,1439,9,NULL,NULL),(4041,1439,10,NULL,NULL),(4042,1439,11,NULL,NULL),(4043,1439,12,NULL,NULL),(4044,1440,2,NULL,NULL),(4045,1440,5,NULL,NULL),(4046,1440,9,NULL,NULL),(4047,1440,10,NULL,NULL),(4048,1440,11,NULL,NULL),(4049,1440,12,NULL,NULL),(4050,1441,2,NULL,NULL),(4051,1441,5,NULL,NULL),(4052,1441,9,NULL,NULL),(4053,1441,10,NULL,NULL),(4054,1441,11,NULL,NULL),(4055,1441,12,NULL,NULL),(4056,1442,2,NULL,NULL),(4057,1442,5,NULL,NULL),(4058,1442,9,NULL,NULL),(4059,1442,10,NULL,NULL),(4060,1442,11,NULL,NULL),(4061,1442,12,NULL,NULL),(4062,1443,2,NULL,NULL),(4063,1443,5,NULL,NULL),(4064,1443,9,NULL,NULL),(4065,1443,10,NULL,NULL),(4066,1443,11,NULL,NULL),(4067,1443,12,NULL,NULL),(4068,1444,2,NULL,NULL),(4069,1444,5,NULL,NULL),(4070,1444,9,NULL,NULL),(4071,1444,10,NULL,NULL),(4072,1444,11,NULL,NULL),(4073,1444,12,NULL,NULL),(4074,1445,2,NULL,NULL),(4075,1445,5,NULL,NULL),(4076,1445,9,NULL,NULL),(4077,1445,10,NULL,NULL),(4078,1445,11,NULL,NULL),(4079,1445,12,NULL,NULL),(4080,1446,2,NULL,NULL),(4081,1446,5,NULL,NULL),(4082,1446,9,NULL,NULL),(4083,1446,10,NULL,NULL),(4084,1446,11,NULL,NULL),(4085,1446,12,NULL,NULL),(4086,1447,2,NULL,NULL),(4087,1447,5,NULL,NULL),(4088,1447,9,NULL,NULL),(4089,1447,10,NULL,NULL),(4090,1447,11,NULL,NULL),(4091,1447,12,NULL,NULL),(4092,1448,2,NULL,NULL),(4093,1448,5,NULL,NULL),(4094,1448,9,NULL,NULL),(4095,1448,10,NULL,NULL),(4096,1448,11,NULL,NULL),(4097,1448,12,NULL,NULL),(4098,1449,2,NULL,NULL),(4099,1449,5,NULL,NULL),(4100,1449,9,NULL,NULL),(4101,1449,10,NULL,NULL),(4102,1449,11,NULL,NULL),(4103,1449,12,NULL,NULL),(4104,1450,2,NULL,NULL),(4105,1450,5,NULL,NULL),(4106,1450,9,NULL,NULL),(4107,1450,10,NULL,NULL),(4108,1450,11,NULL,NULL),(4109,1450,12,NULL,NULL),(4110,1451,2,NULL,NULL),(4111,1451,5,NULL,NULL),(4112,1451,9,NULL,NULL),(4113,1451,10,NULL,NULL),(4114,1451,11,NULL,NULL),(4115,1451,12,NULL,NULL),(4116,1452,2,NULL,NULL),(4117,1452,5,NULL,NULL),(4118,1452,9,NULL,NULL),(4119,1452,10,NULL,NULL),(4120,1452,11,NULL,NULL),(4121,1452,12,NULL,NULL),(4122,1453,2,NULL,NULL),(4123,1453,5,NULL,NULL),(4124,1453,9,NULL,NULL),(4125,1453,10,NULL,NULL),(4126,1453,11,NULL,NULL),(4127,1453,12,NULL,NULL),(4128,1454,2,NULL,NULL),(4129,1454,5,NULL,NULL),(4130,1454,9,NULL,NULL),(4131,1454,10,NULL,NULL),(4132,1454,11,NULL,NULL),(4133,1454,12,NULL,NULL),(4134,1455,2,NULL,NULL),(4135,1455,5,NULL,NULL),(4136,1455,9,NULL,NULL),(4137,1455,10,NULL,NULL),(4138,1455,11,NULL,NULL),(4139,1455,12,NULL,NULL),(4140,1456,2,NULL,NULL),(4141,1456,5,NULL,NULL),(4142,1456,9,NULL,NULL),(4143,1456,10,NULL,NULL),(4144,1456,11,NULL,NULL),(4145,1456,12,NULL,NULL),(4146,1457,2,NULL,NULL),(4147,1457,5,NULL,NULL),(4148,1457,9,NULL,NULL),(4149,1457,10,NULL,NULL),(4150,1457,11,NULL,NULL),(4151,1457,12,NULL,NULL),(4152,1458,2,NULL,NULL),(4153,1458,5,NULL,NULL),(4154,1458,9,NULL,NULL),(4155,1458,10,NULL,NULL),(4156,1458,11,NULL,NULL),(4157,1458,12,NULL,NULL),(4158,1459,2,NULL,NULL),(4159,1459,5,NULL,NULL),(4160,1459,9,NULL,NULL),(4161,1459,10,NULL,NULL),(4162,1459,11,NULL,NULL),(4163,1459,12,NULL,NULL),(4164,1460,2,NULL,NULL),(4165,1460,5,NULL,NULL),(4166,1460,9,NULL,NULL),(4167,1460,10,NULL,NULL),(4168,1460,11,NULL,NULL),(4169,1460,12,NULL,NULL),(4170,1461,2,NULL,NULL),(4171,1461,5,NULL,NULL),(4172,1461,9,NULL,NULL),(4173,1461,10,NULL,NULL),(4174,1461,11,NULL,NULL),(4175,1461,12,NULL,NULL),(4176,1462,2,NULL,NULL),(4177,1462,5,NULL,NULL),(4178,1462,9,NULL,NULL),(4179,1462,10,NULL,NULL),(4180,1462,11,NULL,NULL),(4181,1462,12,NULL,NULL),(4182,1463,2,NULL,NULL),(4183,1463,5,NULL,NULL),(4184,1463,9,NULL,NULL),(4185,1463,10,NULL,NULL),(4186,1463,11,NULL,NULL),(4187,1463,12,NULL,NULL),(4188,1464,2,NULL,NULL),(4189,1464,5,NULL,NULL),(4190,1464,9,NULL,NULL),(4191,1464,10,NULL,NULL),(4192,1464,11,NULL,NULL),(4193,1464,12,NULL,NULL),(4194,1465,2,NULL,NULL),(4195,1465,5,NULL,NULL),(4196,1465,9,NULL,NULL),(4197,1465,10,NULL,NULL),(4198,1465,11,NULL,NULL),(4199,1465,12,NULL,NULL),(4200,1466,2,NULL,NULL),(4201,1466,5,NULL,NULL),(4202,1466,9,NULL,NULL),(4203,1466,10,NULL,NULL),(4204,1466,11,NULL,NULL),(4205,1466,12,NULL,NULL),(4206,1467,2,NULL,NULL),(4207,1467,5,NULL,NULL),(4208,1467,9,NULL,NULL),(4209,1467,10,NULL,NULL),(4210,1467,11,NULL,NULL),(4211,1467,12,NULL,NULL),(4212,1468,2,NULL,NULL),(4213,1468,5,NULL,NULL),(4214,1468,9,NULL,NULL),(4215,1468,10,NULL,NULL),(4216,1468,11,NULL,NULL),(4217,1468,12,NULL,NULL),(4218,1469,2,NULL,NULL),(4219,1469,5,NULL,NULL),(4220,1469,9,NULL,NULL),(4221,1469,10,NULL,NULL),(4222,1469,11,NULL,NULL),(4223,1469,12,NULL,NULL),(4224,1470,2,NULL,NULL),(4225,1470,5,NULL,NULL),(4226,1470,9,NULL,NULL),(4227,1470,10,NULL,NULL),(4228,1470,11,NULL,NULL),(4229,1470,12,NULL,NULL),(4230,1471,2,NULL,NULL),(4231,1471,5,NULL,NULL),(4232,1471,9,NULL,NULL),(4233,1471,10,NULL,NULL),(4234,1471,11,NULL,NULL),(4235,1471,12,NULL,NULL),(4236,1472,2,NULL,NULL),(4237,1472,5,NULL,NULL),(4238,1472,9,NULL,NULL),(4239,1472,10,NULL,NULL),(4240,1472,11,NULL,NULL),(4241,1472,12,NULL,NULL),(4242,1473,2,NULL,NULL),(4243,1473,5,NULL,NULL),(4244,1473,9,NULL,NULL),(4245,1473,10,NULL,NULL),(4246,1473,11,NULL,NULL),(4247,1473,12,NULL,NULL),(4248,1474,2,NULL,NULL),(4249,1474,5,NULL,NULL),(4250,1474,9,NULL,NULL),(4251,1474,10,NULL,NULL),(4252,1474,11,NULL,NULL),(4253,1474,12,NULL,NULL),(4254,1475,2,NULL,NULL),(4255,1475,5,NULL,NULL),(4256,1475,9,NULL,NULL),(4257,1475,10,NULL,NULL),(4258,1475,11,NULL,NULL),(4259,1475,12,NULL,NULL),(4260,1476,2,NULL,NULL),(4261,1476,5,NULL,NULL),(4262,1476,9,NULL,NULL),(4263,1476,10,NULL,NULL),(4264,1476,11,NULL,NULL),(4265,1476,12,NULL,NULL),(4266,1477,2,NULL,NULL),(4267,1477,5,NULL,NULL),(4268,1477,9,NULL,NULL),(4269,1477,10,NULL,NULL),(4270,1477,11,NULL,NULL),(4271,1477,12,NULL,NULL),(4272,1478,2,NULL,NULL),(4273,1478,5,NULL,NULL),(4274,1478,9,NULL,NULL),(4275,1478,10,NULL,NULL),(4276,1478,11,NULL,NULL),(4277,1478,12,NULL,NULL),(4278,1479,2,NULL,NULL),(4279,1479,5,NULL,NULL),(4280,1479,9,NULL,NULL),(4281,1479,10,NULL,NULL),(4282,1479,11,NULL,NULL),(4283,1479,12,NULL,NULL),(4284,1480,2,NULL,NULL),(4285,1480,5,NULL,NULL),(4286,1480,9,NULL,NULL),(4287,1480,10,NULL,NULL),(4288,1480,11,NULL,NULL),(4289,1480,12,NULL,NULL),(4290,1481,2,NULL,NULL),(4291,1481,5,NULL,NULL),(4292,1481,9,NULL,NULL),(4293,1481,10,NULL,NULL),(4294,1481,11,NULL,NULL),(4295,1481,12,NULL,NULL),(4296,1482,2,NULL,NULL),(4297,1482,5,NULL,NULL),(4298,1482,9,NULL,NULL),(4299,1482,10,NULL,NULL),(4300,1482,11,NULL,NULL),(4301,1482,12,NULL,NULL),(4302,1483,2,NULL,NULL),(4303,1483,5,NULL,NULL),(4304,1483,9,NULL,NULL),(4305,1483,10,NULL,NULL),(4306,1483,11,NULL,NULL),(4307,1483,12,NULL,NULL),(4308,1484,2,NULL,NULL),(4309,1484,5,NULL,NULL),(4310,1484,9,NULL,NULL),(4311,1484,10,NULL,NULL),(4312,1484,11,NULL,NULL),(4313,1484,12,NULL,NULL),(4314,1485,2,NULL,NULL),(4315,1485,5,NULL,NULL),(4316,1485,9,NULL,NULL),(4317,1485,10,NULL,NULL),(4318,1485,11,NULL,NULL),(4319,1485,12,NULL,NULL),(4320,1486,2,NULL,NULL),(4321,1486,5,NULL,NULL),(4322,1486,9,NULL,NULL),(4323,1486,10,NULL,NULL),(4324,1486,11,NULL,NULL),(4325,1486,12,NULL,NULL),(4326,1487,2,NULL,NULL),(4327,1487,5,NULL,NULL),(4328,1487,9,NULL,NULL),(4329,1487,10,NULL,NULL),(4330,1487,11,NULL,NULL),(4331,1487,12,NULL,NULL),(4332,1488,2,NULL,NULL),(4333,1488,5,NULL,NULL),(4334,1488,9,NULL,NULL),(4335,1488,10,NULL,NULL),(4336,1488,11,NULL,NULL),(4337,1488,12,NULL,NULL),(4338,1489,2,NULL,NULL),(4339,1489,5,NULL,NULL),(4340,1489,9,NULL,NULL),(4341,1489,10,NULL,NULL),(4342,1489,11,NULL,NULL),(4343,1489,12,NULL,NULL),(4344,1490,2,NULL,NULL),(4345,1490,5,NULL,NULL),(4346,1490,9,NULL,NULL),(4347,1490,10,NULL,NULL),(4348,1490,11,NULL,NULL),(4349,1490,12,NULL,NULL),(4350,1491,2,NULL,NULL),(4351,1491,5,NULL,NULL),(4352,1491,9,NULL,NULL),(4353,1491,10,NULL,NULL),(4354,1491,11,NULL,NULL),(4355,1491,12,NULL,NULL),(4356,1492,2,NULL,NULL),(4357,1492,5,NULL,NULL),(4358,1492,9,NULL,NULL),(4359,1492,10,NULL,NULL),(4360,1492,11,NULL,NULL),(4361,1492,12,NULL,NULL),(4362,1493,2,NULL,NULL),(4363,1493,5,NULL,NULL),(4364,1493,9,NULL,NULL),(4365,1493,10,NULL,NULL),(4366,1493,11,NULL,NULL),(4367,1493,12,NULL,NULL),(4368,1494,2,NULL,NULL),(4369,1494,5,NULL,NULL),(4370,1494,9,NULL,NULL),(4371,1494,10,NULL,NULL),(4372,1494,11,NULL,NULL),(4373,1494,12,NULL,NULL),(4374,1495,2,NULL,NULL),(4375,1495,5,NULL,NULL),(4376,1495,9,NULL,NULL),(4377,1495,10,NULL,NULL),(4378,1495,11,NULL,NULL),(4379,1495,12,NULL,NULL),(4380,1496,2,NULL,NULL),(4381,1496,5,NULL,NULL),(4382,1496,9,NULL,NULL),(4383,1496,10,NULL,NULL),(4384,1496,11,NULL,NULL),(4385,1496,12,NULL,NULL),(4386,1497,2,NULL,NULL),(4387,1497,5,NULL,NULL),(4388,1497,9,NULL,NULL),(4389,1497,10,NULL,NULL),(4390,1497,11,NULL,NULL),(4391,1497,12,NULL,NULL),(4392,1498,2,NULL,NULL),(4393,1498,5,NULL,NULL),(4394,1498,9,NULL,NULL),(4395,1498,10,NULL,NULL),(4396,1498,11,NULL,NULL),(4397,1498,12,NULL,NULL),(4398,1499,2,NULL,NULL),(4399,1499,5,NULL,NULL),(4400,1499,9,NULL,NULL),(4401,1499,10,NULL,NULL),(4402,1499,11,NULL,NULL),(4403,1499,12,NULL,NULL),(4404,1500,2,NULL,NULL),(4405,1500,5,NULL,NULL),(4406,1500,9,NULL,NULL),(4407,1500,10,NULL,NULL),(4408,1500,11,NULL,NULL),(4409,1500,12,NULL,NULL),(4410,1501,2,NULL,NULL),(4411,1501,5,NULL,NULL),(4412,1501,9,NULL,NULL),(4413,1501,10,NULL,NULL),(4414,1501,11,NULL,NULL),(4415,1501,12,NULL,NULL),(4416,1502,2,NULL,NULL),(4417,1502,5,NULL,NULL),(4418,1502,9,NULL,NULL),(4419,1502,10,NULL,NULL),(4420,1502,11,NULL,NULL),(4421,1502,12,NULL,NULL),(4422,1503,2,NULL,NULL),(4423,1503,5,NULL,NULL),(4424,1503,9,NULL,NULL),(4425,1503,10,NULL,NULL),(4426,1503,11,NULL,NULL),(4427,1503,12,NULL,NULL),(4428,1504,2,NULL,NULL),(4429,1504,5,NULL,NULL),(4430,1504,9,NULL,NULL),(4431,1504,10,NULL,NULL),(4432,1504,11,NULL,NULL),(4433,1504,12,NULL,NULL),(4434,1505,2,NULL,NULL),(4435,1505,5,NULL,NULL),(4436,1505,9,NULL,NULL),(4437,1505,10,NULL,NULL),(4438,1505,11,NULL,NULL),(4439,1505,12,NULL,NULL),(4440,1506,2,NULL,NULL),(4441,1506,5,NULL,NULL),(4442,1506,9,NULL,NULL),(4443,1506,10,NULL,NULL),(4444,1506,11,NULL,NULL),(4445,1506,12,NULL,NULL),(4446,1507,2,NULL,NULL),(4447,1507,5,NULL,NULL),(4448,1507,9,NULL,NULL),(4449,1507,10,NULL,NULL),(4450,1507,11,NULL,NULL),(4451,1507,12,NULL,NULL),(4452,1508,2,NULL,NULL),(4453,1508,5,NULL,NULL),(4454,1508,9,NULL,NULL),(4455,1508,10,NULL,NULL),(4456,1508,11,NULL,NULL),(4457,1508,12,NULL,NULL),(4458,1509,2,NULL,NULL),(4459,1509,5,NULL,NULL),(4460,1509,9,NULL,NULL),(4461,1509,10,NULL,NULL),(4462,1509,11,NULL,NULL),(4463,1509,12,NULL,NULL),(4464,1510,2,NULL,NULL),(4465,1510,5,NULL,NULL),(4466,1510,9,NULL,NULL),(4467,1510,10,NULL,NULL),(4468,1510,11,NULL,NULL),(4469,1510,12,NULL,NULL),(4470,1511,2,NULL,NULL),(4471,1511,5,NULL,NULL),(4472,1511,9,NULL,NULL),(4473,1511,10,NULL,NULL),(4474,1511,11,NULL,NULL),(4475,1511,12,NULL,NULL),(4476,1512,2,NULL,NULL),(4477,1512,5,NULL,NULL),(4478,1512,9,NULL,NULL),(4479,1512,10,NULL,NULL),(4480,1512,11,NULL,NULL),(4481,1512,12,NULL,NULL),(4482,1513,2,NULL,NULL),(4483,1513,5,NULL,NULL),(4484,1513,9,NULL,NULL),(4485,1513,10,NULL,NULL),(4486,1513,11,NULL,NULL),(4487,1513,12,NULL,NULL),(4488,1514,2,NULL,NULL),(4489,1514,5,NULL,NULL),(4490,1514,9,NULL,NULL),(4491,1514,10,NULL,NULL),(4492,1514,11,NULL,NULL),(4493,1514,12,NULL,NULL),(4494,1515,2,NULL,NULL),(4495,1515,5,NULL,NULL),(4496,1515,9,NULL,NULL),(4497,1515,10,NULL,NULL),(4498,1515,11,NULL,NULL),(4499,1515,12,NULL,NULL),(4500,1516,2,NULL,NULL),(4501,1516,5,NULL,NULL),(4502,1516,9,NULL,NULL),(4503,1516,10,NULL,NULL),(4504,1516,11,NULL,NULL),(4505,1516,12,NULL,NULL),(4506,1517,2,NULL,NULL),(4507,1517,5,NULL,NULL),(4508,1517,9,NULL,NULL),(4509,1517,10,NULL,NULL),(4510,1517,11,NULL,NULL),(4511,1517,12,NULL,NULL),(4512,1518,2,NULL,NULL),(4513,1518,5,NULL,NULL),(4514,1518,9,NULL,NULL),(4515,1518,10,NULL,NULL),(4516,1518,11,NULL,NULL),(4517,1518,12,NULL,NULL),(4518,1519,2,NULL,NULL),(4519,1519,5,NULL,NULL),(4520,1519,9,NULL,NULL),(4521,1519,10,NULL,NULL),(4522,1519,11,NULL,NULL),(4523,1519,12,NULL,NULL),(4524,1520,2,NULL,NULL),(4525,1520,5,NULL,NULL),(4526,1520,9,NULL,NULL),(4527,1520,10,NULL,NULL),(4528,1520,11,NULL,NULL),(4529,1520,12,NULL,NULL),(4530,1521,2,NULL,NULL),(4531,1521,5,NULL,NULL),(4532,1521,9,NULL,NULL),(4533,1521,10,NULL,NULL),(4534,1521,11,NULL,NULL),(4535,1521,12,NULL,NULL),(4536,1522,2,NULL,NULL),(4537,1522,5,NULL,NULL),(4538,1522,9,NULL,NULL),(4539,1522,10,NULL,NULL),(4540,1522,11,NULL,NULL),(4541,1522,12,NULL,NULL),(4542,1523,2,NULL,NULL),(4543,1523,5,NULL,NULL),(4544,1523,9,NULL,NULL),(4545,1523,10,NULL,NULL),(4546,1523,11,NULL,NULL),(4547,1523,12,NULL,NULL),(4548,1524,2,NULL,NULL),(4549,1524,5,NULL,NULL),(4550,1524,9,NULL,NULL),(4551,1524,10,NULL,NULL),(4552,1524,11,NULL,NULL),(4553,1524,12,NULL,NULL),(4554,1525,2,NULL,NULL),(4555,1525,5,NULL,NULL),(4556,1525,9,NULL,NULL),(4557,1525,10,NULL,NULL),(4558,1525,11,NULL,NULL),(4559,1525,12,NULL,NULL),(4560,1526,2,NULL,NULL),(4561,1526,5,NULL,NULL),(4562,1526,9,NULL,NULL),(4563,1526,10,NULL,NULL),(4564,1526,11,NULL,NULL),(4565,1526,12,NULL,NULL),(4566,1527,2,NULL,NULL),(4567,1527,5,NULL,NULL),(4568,1527,9,NULL,NULL),(4569,1527,10,NULL,NULL),(4570,1527,11,NULL,NULL),(4571,1527,12,NULL,NULL),(4572,1528,2,NULL,NULL),(4573,1528,5,NULL,NULL),(4574,1528,9,NULL,NULL),(4575,1528,10,NULL,NULL),(4576,1528,11,NULL,NULL),(4577,1528,12,NULL,NULL),(4578,1529,2,NULL,NULL),(4579,1529,5,NULL,NULL),(4580,1529,9,NULL,NULL),(4581,1529,10,NULL,NULL),(4582,1529,11,NULL,NULL),(4583,1529,12,NULL,NULL),(4584,1530,2,NULL,NULL),(4585,1530,5,NULL,NULL),(4586,1530,9,NULL,NULL),(4587,1530,10,NULL,NULL),(4588,1530,11,NULL,NULL),(4589,1530,12,NULL,NULL),(4590,1531,2,NULL,NULL),(4591,1531,5,NULL,NULL),(4592,1531,9,NULL,NULL),(4593,1531,10,NULL,NULL),(4594,1531,11,NULL,NULL),(4595,1531,12,NULL,NULL),(4596,1532,2,NULL,NULL),(4597,1532,5,NULL,NULL),(4598,1532,9,NULL,NULL),(4599,1532,10,NULL,NULL),(4600,1532,11,NULL,NULL),(4601,1532,12,NULL,NULL),(4602,1533,2,NULL,NULL),(4603,1533,5,NULL,NULL),(4604,1533,9,NULL,NULL),(4605,1533,10,NULL,NULL),(4606,1533,11,NULL,NULL),(4607,1533,12,NULL,NULL),(4608,1534,2,NULL,NULL),(4609,1534,5,NULL,NULL),(4610,1534,9,NULL,NULL),(4611,1534,10,NULL,NULL),(4612,1534,11,NULL,NULL),(4613,1534,12,NULL,NULL),(4614,1535,2,NULL,NULL),(4615,1535,5,NULL,NULL),(4616,1535,9,NULL,NULL),(4617,1535,10,NULL,NULL),(4618,1535,11,NULL,NULL),(4619,1535,12,NULL,NULL),(4620,1536,2,NULL,NULL),(4621,1536,5,NULL,NULL),(4622,1536,9,NULL,NULL),(4623,1536,10,NULL,NULL),(4624,1536,11,NULL,NULL),(4625,1536,12,NULL,NULL),(4626,1537,2,NULL,NULL),(4627,1537,5,NULL,NULL),(4628,1537,9,NULL,NULL),(4629,1537,10,NULL,NULL),(4630,1537,11,NULL,NULL),(4631,1537,12,NULL,NULL),(4632,1538,2,NULL,NULL),(4633,1538,5,NULL,NULL),(4634,1538,9,NULL,NULL),(4635,1538,10,NULL,NULL),(4636,1538,11,NULL,NULL),(4637,1538,12,NULL,NULL),(4638,1539,2,NULL,NULL),(4639,1539,5,NULL,NULL),(4640,1539,9,NULL,NULL),(4641,1539,10,NULL,NULL),(4642,1539,11,NULL,NULL),(4643,1539,12,NULL,NULL),(4644,1540,2,NULL,NULL),(4645,1540,5,NULL,NULL),(4646,1540,9,NULL,NULL),(4647,1540,10,NULL,NULL),(4648,1540,11,NULL,NULL),(4649,1540,12,NULL,NULL),(4650,1541,2,NULL,NULL),(4651,1541,5,NULL,NULL),(4652,1541,9,NULL,NULL),(4653,1541,10,NULL,NULL),(4654,1541,11,NULL,NULL),(4655,1541,12,NULL,NULL),(4656,1542,2,NULL,NULL),(4657,1542,5,NULL,NULL),(4658,1542,9,NULL,NULL),(4659,1542,10,NULL,NULL),(4660,1542,11,NULL,NULL),(4661,1542,12,NULL,NULL),(4662,1543,2,NULL,NULL),(4663,1543,5,NULL,NULL),(4664,1543,9,NULL,NULL),(4665,1543,10,NULL,NULL),(4666,1543,11,NULL,NULL),(4667,1543,12,NULL,NULL),(4668,1544,2,NULL,NULL),(4669,1544,5,NULL,NULL),(4670,1544,9,NULL,NULL),(4671,1544,10,NULL,NULL),(4672,1544,11,NULL,NULL),(4673,1544,12,NULL,NULL),(4674,1545,2,NULL,NULL),(4675,1545,5,NULL,NULL),(4676,1545,9,NULL,NULL),(4677,1545,10,NULL,NULL),(4678,1545,11,NULL,NULL),(4679,1545,12,NULL,NULL),(4680,1546,2,NULL,NULL),(4681,1546,5,NULL,NULL),(4682,1546,9,NULL,NULL),(4683,1546,10,NULL,NULL),(4684,1546,11,NULL,NULL),(4685,1546,12,NULL,NULL),(4686,1547,2,NULL,NULL),(4687,1547,5,NULL,NULL),(4688,1547,9,NULL,NULL),(4689,1547,10,NULL,NULL),(4690,1547,11,NULL,NULL),(4691,1547,12,NULL,NULL),(4692,1548,2,NULL,NULL),(4693,1548,5,NULL,NULL),(4694,1548,9,NULL,NULL),(4695,1548,10,NULL,NULL),(4696,1548,11,NULL,NULL),(4697,1548,12,NULL,NULL),(4698,1549,2,NULL,NULL),(4699,1549,5,NULL,NULL),(4700,1549,9,NULL,NULL),(4701,1549,10,NULL,NULL),(4702,1549,11,NULL,NULL),(4703,1549,12,NULL,NULL),(4704,1550,2,NULL,NULL),(4705,1550,5,NULL,NULL),(4706,1550,9,NULL,NULL),(4707,1550,10,NULL,NULL),(4708,1550,11,NULL,NULL),(4709,1550,12,NULL,NULL),(4710,1551,2,NULL,NULL),(4711,1551,5,NULL,NULL),(4712,1551,9,NULL,NULL),(4713,1551,10,NULL,NULL),(4714,1551,11,NULL,NULL),(4715,1551,12,NULL,NULL),(4716,1552,2,NULL,NULL),(4717,1552,5,NULL,NULL),(4718,1552,9,NULL,NULL),(4719,1552,10,NULL,NULL),(4720,1552,11,NULL,NULL),(4721,1552,12,NULL,NULL),(4722,1553,2,NULL,NULL),(4723,1553,5,NULL,NULL),(4724,1553,9,NULL,NULL),(4725,1553,10,NULL,NULL),(4726,1553,11,NULL,NULL),(4727,1553,12,NULL,NULL),(4728,1554,2,NULL,NULL),(4729,1554,5,NULL,NULL),(4730,1554,9,NULL,NULL),(4731,1554,10,NULL,NULL),(4732,1554,11,NULL,NULL),(4733,1554,12,NULL,NULL),(4734,1555,2,NULL,NULL),(4735,1555,5,NULL,NULL),(4736,1555,9,NULL,NULL),(4737,1555,10,NULL,NULL),(4738,1555,11,NULL,NULL),(4739,1555,12,NULL,NULL),(4740,1556,2,NULL,NULL),(4741,1556,5,NULL,NULL),(4742,1556,9,NULL,NULL),(4743,1556,10,NULL,NULL),(4744,1556,11,NULL,NULL),(4745,1556,12,NULL,NULL),(4746,1557,2,NULL,NULL),(4747,1557,5,NULL,NULL),(4748,1557,9,NULL,NULL),(4749,1557,10,NULL,NULL),(4750,1557,11,NULL,NULL),(4751,1557,12,NULL,NULL),(4752,1558,2,NULL,NULL),(4753,1558,5,NULL,NULL),(4754,1558,9,NULL,NULL),(4755,1558,10,NULL,NULL),(4756,1558,11,NULL,NULL),(4757,1558,12,NULL,NULL),(4758,1559,2,NULL,NULL),(4759,1559,5,NULL,NULL),(4760,1559,9,NULL,NULL),(4761,1559,10,NULL,NULL),(4762,1559,11,NULL,NULL),(4763,1559,12,NULL,NULL),(4764,1560,2,NULL,NULL),(4765,1560,5,NULL,NULL),(4766,1560,9,NULL,NULL),(4767,1560,10,NULL,NULL),(4768,1560,11,NULL,NULL),(4769,1560,12,NULL,NULL),(4770,1561,2,NULL,NULL),(4771,1561,5,NULL,NULL),(4772,1561,9,NULL,NULL),(4773,1561,10,NULL,NULL),(4774,1561,11,NULL,NULL),(4775,1561,12,NULL,NULL),(4776,1562,2,NULL,NULL),(4777,1562,5,NULL,NULL),(4778,1562,9,NULL,NULL),(4779,1562,10,NULL,NULL),(4780,1562,11,NULL,NULL),(4781,1562,12,NULL,NULL),(4782,1563,2,NULL,NULL),(4783,1563,5,NULL,NULL),(4784,1563,9,NULL,NULL),(4785,1563,10,NULL,NULL),(4786,1563,11,NULL,NULL),(4787,1563,12,NULL,NULL),(4788,1564,2,NULL,NULL),(4789,1564,5,NULL,NULL),(4790,1564,9,NULL,NULL),(4791,1564,10,NULL,NULL),(4792,1564,11,NULL,NULL),(4793,1564,12,NULL,NULL),(4794,1565,2,NULL,NULL),(4795,1565,5,NULL,NULL),(4796,1565,9,NULL,NULL),(4797,1565,10,NULL,NULL),(4798,1565,11,NULL,NULL),(4799,1565,12,NULL,NULL),(4800,1566,2,NULL,NULL),(4801,1566,5,NULL,NULL),(4802,1566,9,NULL,NULL),(4803,1566,10,NULL,NULL),(4804,1566,11,NULL,NULL),(4805,1566,12,NULL,NULL),(4806,1567,2,NULL,NULL),(4807,1567,5,NULL,NULL),(4808,1567,9,NULL,NULL),(4809,1567,10,NULL,NULL),(4810,1567,11,NULL,NULL),(4811,1567,12,NULL,NULL),(4812,1568,2,NULL,NULL),(4813,1568,5,NULL,NULL),(4814,1568,9,NULL,NULL),(4815,1568,10,NULL,NULL),(4816,1568,11,NULL,NULL),(4817,1568,12,NULL,NULL),(4818,1569,2,NULL,NULL),(4819,1569,5,NULL,NULL),(4820,1569,9,NULL,NULL),(4821,1569,10,NULL,NULL),(4822,1569,11,NULL,NULL),(4823,1569,12,NULL,NULL),(4824,1570,2,NULL,NULL),(4825,1570,5,NULL,NULL),(4826,1570,9,NULL,NULL),(4827,1570,10,NULL,NULL),(4828,1570,11,NULL,NULL),(4829,1570,12,NULL,NULL),(4830,1571,2,NULL,NULL),(4831,1571,5,NULL,NULL),(4832,1571,9,NULL,NULL),(4833,1571,10,NULL,NULL),(4834,1571,11,NULL,NULL),(4835,1571,12,NULL,NULL),(4836,1572,2,NULL,NULL),(4837,1572,5,NULL,NULL),(4838,1572,9,NULL,NULL),(4839,1572,10,NULL,NULL),(4840,1572,11,NULL,NULL),(4841,1572,12,NULL,NULL),(4842,1573,2,NULL,NULL),(4843,1573,5,NULL,NULL),(4844,1573,9,NULL,NULL),(4845,1573,10,NULL,NULL),(4846,1573,11,NULL,NULL),(4847,1573,12,NULL,NULL),(4848,1574,2,NULL,NULL),(4849,1574,5,NULL,NULL),(4850,1574,9,NULL,NULL),(4851,1574,10,NULL,NULL),(4852,1574,11,NULL,NULL),(4853,1574,12,NULL,NULL),(4854,1575,2,NULL,NULL),(4855,1575,5,NULL,NULL),(4856,1575,9,NULL,NULL),(4857,1575,10,NULL,NULL),(4858,1575,11,NULL,NULL),(4859,1575,12,NULL,NULL),(4860,1576,2,NULL,NULL),(4861,1576,5,NULL,NULL),(4862,1576,9,NULL,NULL),(4863,1576,10,NULL,NULL),(4864,1576,11,NULL,NULL),(4865,1576,12,NULL,NULL),(4866,1577,2,NULL,NULL),(4867,1577,5,NULL,NULL),(4868,1577,9,NULL,NULL),(4869,1577,10,NULL,NULL),(4870,1577,11,NULL,NULL),(4871,1577,12,NULL,NULL),(4872,1578,2,NULL,NULL),(4873,1578,5,NULL,NULL),(4874,1578,9,NULL,NULL),(4875,1578,10,NULL,NULL),(4876,1578,11,NULL,NULL),(4877,1578,12,NULL,NULL),(4878,1579,2,NULL,NULL),(4879,1579,5,NULL,NULL),(4880,1579,9,NULL,NULL),(4881,1579,10,NULL,NULL),(4882,1579,11,NULL,NULL),(4883,1579,12,NULL,NULL),(4884,1580,2,NULL,NULL),(4885,1580,5,NULL,NULL),(4886,1580,9,NULL,NULL),(4887,1580,10,NULL,NULL),(4888,1580,11,NULL,NULL),(4889,1580,12,NULL,NULL),(4890,1581,2,NULL,NULL),(4891,1581,5,NULL,NULL),(4892,1581,9,NULL,NULL),(4893,1581,10,NULL,NULL),(4894,1581,11,NULL,NULL),(4895,1581,12,NULL,NULL),(4896,1582,2,NULL,NULL),(4897,1582,5,NULL,NULL),(4898,1582,9,NULL,NULL),(4899,1582,10,NULL,NULL),(4900,1582,11,NULL,NULL),(4901,1582,12,NULL,NULL),(4902,1583,2,NULL,NULL),(4903,1583,5,NULL,NULL),(4904,1583,9,NULL,NULL),(4905,1583,10,NULL,NULL),(4906,1583,11,NULL,NULL),(4907,1583,12,NULL,NULL),(4908,1584,2,NULL,NULL),(4909,1584,5,NULL,NULL),(4910,1584,9,NULL,NULL),(4911,1584,10,NULL,NULL),(4912,1584,11,NULL,NULL),(4913,1584,12,NULL,NULL),(4914,1585,2,NULL,NULL),(4915,1585,5,NULL,NULL),(4916,1585,9,NULL,NULL),(4917,1585,10,NULL,NULL),(4918,1585,11,NULL,NULL),(4919,1585,12,NULL,NULL),(4920,1586,2,NULL,NULL),(4921,1586,5,NULL,NULL),(4922,1586,9,NULL,NULL),(4923,1586,10,NULL,NULL),(4924,1586,11,NULL,NULL),(4925,1586,12,NULL,NULL),(4926,1587,2,NULL,NULL),(4927,1587,5,NULL,NULL),(4928,1587,9,NULL,NULL),(4929,1587,10,NULL,NULL),(4930,1587,11,NULL,NULL),(4931,1587,12,NULL,NULL),(4932,1588,2,NULL,NULL),(4933,1588,5,NULL,NULL),(4934,1588,9,NULL,NULL),(4935,1588,10,NULL,NULL),(4936,1588,11,NULL,NULL),(4937,1588,12,NULL,NULL),(4938,1589,2,NULL,NULL),(4939,1589,5,NULL,NULL),(4940,1589,9,NULL,NULL),(4941,1589,10,NULL,NULL),(4942,1589,11,NULL,NULL),(4943,1589,12,NULL,NULL),(4944,1590,2,NULL,NULL),(4945,1590,5,NULL,NULL),(4946,1590,9,NULL,NULL),(4947,1590,10,NULL,NULL),(4948,1590,11,NULL,NULL),(4949,1590,12,NULL,NULL),(4950,1591,2,NULL,NULL),(4951,1591,5,NULL,NULL),(4952,1591,9,NULL,NULL),(4953,1591,10,NULL,NULL),(4954,1591,11,NULL,NULL),(4955,1591,12,NULL,NULL),(4956,1592,2,NULL,NULL),(4957,1592,5,NULL,NULL),(4958,1592,9,NULL,NULL),(4959,1592,10,NULL,NULL),(4960,1592,11,NULL,NULL),(4961,1592,12,NULL,NULL),(4962,1593,2,NULL,NULL),(4963,1593,5,NULL,NULL),(4964,1593,9,NULL,NULL),(4965,1593,10,NULL,NULL),(4966,1593,11,NULL,NULL),(4967,1593,12,NULL,NULL),(4968,1594,2,NULL,NULL),(4969,1594,5,NULL,NULL),(4970,1594,9,NULL,NULL),(4971,1594,10,NULL,NULL),(4972,1594,11,NULL,NULL),(4973,1594,12,NULL,NULL),(4974,1595,2,NULL,NULL),(4975,1595,5,NULL,NULL),(4976,1595,9,NULL,NULL),(4977,1595,10,NULL,NULL),(4978,1595,11,NULL,NULL),(4979,1595,12,NULL,NULL),(4980,1596,2,NULL,NULL),(4981,1596,5,NULL,NULL),(4982,1596,9,NULL,NULL),(4983,1596,10,NULL,NULL),(4984,1596,11,NULL,NULL),(4985,1596,12,NULL,NULL),(4986,1597,2,NULL,NULL),(4987,1597,5,NULL,NULL),(4988,1597,9,NULL,NULL),(4989,1597,10,NULL,NULL),(4990,1597,11,NULL,NULL),(4991,1597,12,NULL,NULL),(4992,1598,2,NULL,NULL),(4993,1598,5,NULL,NULL),(4994,1598,9,NULL,NULL),(4995,1598,10,NULL,NULL),(4996,1598,11,NULL,NULL),(4997,1598,12,NULL,NULL),(4998,1599,2,NULL,NULL),(4999,1599,5,NULL,NULL),(5000,1599,9,NULL,NULL),(5001,1599,10,NULL,NULL),(5002,1599,11,NULL,NULL),(5003,1599,12,NULL,NULL),(5004,1600,2,NULL,NULL),(5005,1600,5,NULL,NULL),(5006,1600,9,NULL,NULL),(5007,1600,10,NULL,NULL),(5008,1600,11,NULL,NULL),(5009,1600,12,NULL,NULL),(5010,1601,2,NULL,NULL),(5011,1601,5,NULL,NULL),(5012,1601,9,NULL,NULL),(5013,1601,10,NULL,NULL),(5014,1601,11,NULL,NULL),(5015,1601,12,NULL,NULL),(5016,1602,2,NULL,NULL),(5017,1602,5,NULL,NULL),(5018,1602,9,NULL,NULL),(5019,1602,10,NULL,NULL),(5020,1602,11,NULL,NULL),(5021,1602,12,NULL,NULL),(5022,1603,2,NULL,NULL),(5023,1603,5,NULL,NULL),(5024,1603,9,NULL,NULL),(5025,1603,10,NULL,NULL),(5026,1603,11,NULL,NULL),(5027,1603,12,NULL,NULL),(5028,1604,2,NULL,NULL),(5029,1604,5,NULL,NULL),(5030,1604,9,NULL,NULL),(5031,1604,10,NULL,NULL),(5032,1604,11,NULL,NULL),(5033,1604,12,NULL,NULL),(5034,1605,2,NULL,NULL),(5035,1605,5,NULL,NULL),(5036,1605,9,NULL,NULL),(5037,1605,10,NULL,NULL),(5038,1605,11,NULL,NULL),(5039,1605,12,NULL,NULL),(5040,1606,2,NULL,NULL),(5041,1606,5,NULL,NULL),(5042,1606,9,NULL,NULL),(5043,1606,10,NULL,NULL),(5044,1606,11,NULL,NULL),(5045,1606,12,NULL,NULL),(5046,1607,2,NULL,NULL),(5047,1607,5,NULL,NULL),(5048,1607,9,NULL,NULL),(5049,1607,10,NULL,NULL),(5050,1607,11,NULL,NULL),(5051,1607,12,NULL,NULL),(5052,1608,2,NULL,NULL),(5053,1608,5,NULL,NULL),(5054,1608,9,NULL,NULL),(5055,1608,10,NULL,NULL),(5056,1608,11,NULL,NULL),(5057,1608,12,NULL,NULL),(5058,1609,2,NULL,NULL),(5059,1609,5,NULL,NULL),(5060,1609,9,NULL,NULL),(5061,1609,10,NULL,NULL),(5062,1609,11,NULL,NULL),(5063,1609,12,NULL,NULL),(5064,1610,2,NULL,NULL),(5065,1610,5,NULL,NULL),(5066,1610,9,NULL,NULL),(5067,1610,10,NULL,NULL),(5068,1610,11,NULL,NULL),(5069,1610,12,NULL,NULL),(5070,1611,2,NULL,NULL),(5071,1611,5,NULL,NULL),(5072,1611,9,NULL,NULL),(5073,1611,10,NULL,NULL),(5074,1611,11,NULL,NULL),(5075,1611,12,NULL,NULL),(5076,1612,2,NULL,NULL),(5077,1612,5,NULL,NULL),(5078,1612,9,NULL,NULL),(5079,1612,10,NULL,NULL),(5080,1612,11,NULL,NULL),(5081,1612,12,NULL,NULL),(5082,1613,2,NULL,NULL),(5083,1613,5,NULL,NULL),(5084,1613,9,NULL,NULL),(5085,1613,10,NULL,NULL),(5086,1613,11,NULL,NULL),(5087,1613,12,NULL,NULL),(5088,1614,2,NULL,NULL),(5089,1614,5,NULL,NULL),(5090,1614,9,NULL,NULL),(5091,1614,10,NULL,NULL),(5092,1614,11,NULL,NULL),(5093,1614,12,NULL,NULL),(5094,1615,2,NULL,NULL),(5095,1615,5,NULL,NULL),(5096,1615,9,NULL,NULL),(5097,1615,10,NULL,NULL),(5098,1615,11,NULL,NULL),(5099,1615,12,NULL,NULL),(5100,1616,2,NULL,NULL),(5101,1616,5,NULL,NULL),(5102,1616,9,NULL,NULL),(5103,1616,10,NULL,NULL),(5104,1616,11,NULL,NULL),(5105,1616,12,NULL,NULL),(5106,1617,2,NULL,NULL),(5107,1617,5,NULL,NULL),(5108,1617,9,NULL,NULL),(5109,1617,10,NULL,NULL),(5110,1617,11,NULL,NULL),(5111,1617,12,NULL,NULL),(5112,1618,2,NULL,NULL),(5113,1618,5,NULL,NULL),(5114,1618,9,NULL,NULL),(5115,1618,10,NULL,NULL),(5116,1618,11,NULL,NULL),(5117,1618,12,NULL,NULL),(5118,1619,2,NULL,NULL),(5119,1619,5,NULL,NULL),(5120,1619,9,NULL,NULL),(5121,1619,10,NULL,NULL),(5122,1619,11,NULL,NULL),(5123,1619,12,NULL,NULL),(5124,1620,2,NULL,NULL),(5125,1620,5,NULL,NULL),(5126,1620,9,NULL,NULL),(5127,1620,10,NULL,NULL),(5128,1620,11,NULL,NULL),(5129,1620,12,NULL,NULL),(5130,1621,2,NULL,NULL),(5131,1621,5,NULL,NULL),(5132,1621,9,NULL,NULL),(5133,1621,10,NULL,NULL),(5134,1621,11,NULL,NULL),(5135,1621,12,NULL,NULL),(5136,1622,2,NULL,NULL),(5137,1622,5,NULL,NULL),(5138,1622,9,NULL,NULL),(5139,1622,10,NULL,NULL),(5140,1622,11,NULL,NULL),(5141,1622,12,NULL,NULL),(5142,1623,2,NULL,NULL),(5143,1623,5,NULL,NULL),(5144,1623,9,NULL,NULL),(5145,1623,10,NULL,NULL),(5146,1623,11,NULL,NULL),(5147,1623,12,NULL,NULL),(5148,1624,2,NULL,NULL),(5149,1624,5,NULL,NULL),(5150,1624,9,NULL,NULL),(5151,1624,10,NULL,NULL),(5152,1624,11,NULL,NULL),(5153,1624,12,NULL,NULL),(5154,1625,2,NULL,NULL),(5155,1625,5,NULL,NULL),(5156,1625,9,NULL,NULL),(5157,1625,10,NULL,NULL),(5158,1625,11,NULL,NULL),(5159,1625,12,NULL,NULL),(5160,1626,2,NULL,NULL),(5161,1626,5,NULL,NULL),(5162,1626,9,NULL,NULL),(5163,1626,10,NULL,NULL),(5164,1626,11,NULL,NULL),(5165,1626,12,NULL,NULL),(5166,1627,2,NULL,NULL),(5167,1627,5,NULL,NULL),(5168,1627,9,NULL,NULL),(5169,1627,10,NULL,NULL),(5170,1627,11,NULL,NULL),(5171,1627,12,NULL,NULL),(5172,1628,2,NULL,NULL),(5173,1628,5,NULL,NULL),(5174,1628,9,NULL,NULL),(5175,1628,10,NULL,NULL),(5176,1628,11,NULL,NULL),(5177,1628,12,NULL,NULL),(5178,1629,2,NULL,NULL),(5179,1629,5,NULL,NULL),(5180,1629,9,NULL,NULL),(5181,1629,10,NULL,NULL),(5182,1629,11,NULL,NULL),(5183,1629,12,NULL,NULL),(5184,1630,2,NULL,NULL),(5185,1630,5,NULL,NULL),(5186,1630,9,NULL,NULL),(5187,1630,10,NULL,NULL),(5188,1630,11,NULL,NULL),(5189,1630,12,NULL,NULL),(5190,1631,2,NULL,NULL),(5191,1631,5,NULL,NULL),(5192,1631,9,NULL,NULL),(5193,1631,10,NULL,NULL),(5194,1631,11,NULL,NULL),(5195,1631,12,NULL,NULL),(5196,1632,2,NULL,NULL),(5197,1632,5,NULL,NULL),(5198,1632,9,NULL,NULL),(5199,1632,10,NULL,NULL),(5200,1632,11,NULL,NULL),(5201,1632,12,NULL,NULL),(5202,1633,2,NULL,NULL),(5203,1633,5,NULL,NULL),(5204,1633,9,NULL,NULL),(5205,1633,10,NULL,NULL),(5206,1633,11,NULL,NULL),(5207,1633,12,NULL,NULL),(5208,1634,2,NULL,NULL),(5209,1634,5,NULL,NULL),(5210,1634,9,NULL,NULL),(5211,1634,10,NULL,NULL),(5212,1634,11,NULL,NULL),(5213,1634,12,NULL,NULL),(5214,1635,2,NULL,NULL),(5215,1635,5,NULL,NULL),(5216,1635,9,NULL,NULL),(5217,1635,10,NULL,NULL),(5218,1635,11,NULL,NULL),(5219,1635,12,NULL,NULL),(5220,1636,2,NULL,NULL),(5221,1636,5,NULL,NULL),(5222,1636,9,NULL,NULL),(5223,1636,10,NULL,NULL),(5224,1636,11,NULL,NULL),(5225,1636,12,NULL,NULL),(5226,1637,2,NULL,NULL),(5227,1637,5,NULL,NULL),(5228,1637,9,NULL,NULL),(5229,1637,10,NULL,NULL),(5230,1637,11,NULL,NULL),(5231,1637,12,NULL,NULL),(5232,1638,2,NULL,NULL),(5233,1638,5,NULL,NULL),(5234,1638,9,NULL,NULL),(5235,1638,10,NULL,NULL),(5236,1638,11,NULL,NULL),(5237,1638,12,NULL,NULL),(5238,1639,2,NULL,NULL),(5239,1639,5,NULL,NULL),(5240,1639,9,NULL,NULL),(5241,1639,10,NULL,NULL),(5242,1639,11,NULL,NULL),(5243,1639,12,NULL,NULL),(5244,1640,2,NULL,NULL),(5245,1640,5,NULL,NULL),(5246,1640,9,NULL,NULL),(5247,1640,10,NULL,NULL),(5248,1640,11,NULL,NULL),(5249,1640,12,NULL,NULL),(5250,1641,2,NULL,NULL),(5251,1641,5,NULL,NULL),(5252,1641,9,NULL,NULL),(5253,1641,10,NULL,NULL),(5254,1641,11,NULL,NULL),(5255,1641,12,NULL,NULL),(5256,1642,2,NULL,NULL),(5257,1642,5,NULL,NULL),(5258,1642,9,NULL,NULL),(5259,1642,10,NULL,NULL),(5260,1642,11,NULL,NULL),(5261,1642,12,NULL,NULL),(5262,1643,2,NULL,NULL),(5263,1643,5,NULL,NULL),(5264,1643,9,NULL,NULL),(5265,1643,10,NULL,NULL),(5266,1643,11,NULL,NULL),(5267,1643,12,NULL,NULL),(5268,1644,2,NULL,NULL),(5269,1644,5,NULL,NULL),(5270,1644,9,NULL,NULL),(5271,1644,10,NULL,NULL),(5272,1644,11,NULL,NULL),(5273,1644,12,NULL,NULL),(5274,1645,2,NULL,NULL),(5275,1645,5,NULL,NULL),(5276,1645,9,NULL,NULL),(5277,1645,10,NULL,NULL),(5278,1645,11,NULL,NULL),(5279,1645,12,NULL,NULL),(5280,1646,2,NULL,NULL),(5281,1646,5,NULL,NULL),(5282,1646,9,NULL,NULL),(5283,1646,10,NULL,NULL),(5284,1646,11,NULL,NULL),(5285,1646,12,NULL,NULL),(5286,1647,2,NULL,NULL),(5287,1647,5,NULL,NULL),(5288,1647,9,NULL,NULL),(5289,1647,10,NULL,NULL),(5290,1647,11,NULL,NULL),(5291,1647,12,NULL,NULL),(5292,1648,2,NULL,NULL),(5293,1648,5,NULL,NULL),(5294,1648,9,NULL,NULL),(5295,1648,10,NULL,NULL),(5296,1648,11,NULL,NULL),(5297,1648,12,NULL,NULL),(5298,1649,2,NULL,NULL),(5299,1649,5,NULL,NULL),(5300,1649,9,NULL,NULL),(5301,1649,10,NULL,NULL),(5302,1649,11,NULL,NULL),(5303,1649,12,NULL,NULL),(5304,1650,2,NULL,NULL),(5305,1650,5,NULL,NULL),(5306,1650,9,NULL,NULL),(5307,1650,10,NULL,NULL),(5308,1650,11,NULL,NULL),(5309,1650,12,NULL,NULL),(5310,1651,2,NULL,NULL),(5311,1651,5,NULL,NULL),(5312,1651,9,NULL,NULL),(5313,1651,10,NULL,NULL),(5314,1651,11,NULL,NULL),(5315,1651,12,NULL,NULL),(5316,1652,2,NULL,NULL),(5317,1652,5,NULL,NULL),(5318,1652,9,NULL,NULL),(5319,1652,10,NULL,NULL),(5320,1652,11,NULL,NULL),(5321,1652,12,NULL,NULL),(5322,1653,2,NULL,NULL),(5323,1653,5,NULL,NULL),(5324,1653,9,NULL,NULL),(5325,1653,10,NULL,NULL),(5326,1653,11,NULL,NULL),(5327,1653,12,NULL,NULL),(5328,1654,2,NULL,NULL),(5329,1654,5,NULL,NULL),(5330,1654,9,NULL,NULL),(5331,1654,10,NULL,NULL),(5332,1654,11,NULL,NULL),(5333,1654,12,NULL,NULL),(5334,1655,2,NULL,NULL),(5335,1655,5,NULL,NULL),(5336,1655,9,NULL,NULL),(5337,1655,10,NULL,NULL),(5338,1655,11,NULL,NULL),(5339,1655,12,NULL,NULL),(5340,1656,2,NULL,NULL),(5341,1656,5,NULL,NULL),(5342,1656,9,NULL,NULL),(5343,1656,10,NULL,NULL),(5344,1656,11,NULL,NULL),(5345,1656,12,NULL,NULL),(5346,1657,2,NULL,NULL),(5347,1657,5,NULL,NULL),(5348,1657,9,NULL,NULL),(5349,1657,10,NULL,NULL),(5350,1657,11,NULL,NULL),(5351,1657,12,NULL,NULL),(5352,1658,2,NULL,NULL),(5353,1658,5,NULL,NULL),(5354,1658,9,NULL,NULL),(5355,1658,10,NULL,NULL),(5356,1658,11,NULL,NULL),(5357,1658,12,NULL,NULL),(5358,1659,2,NULL,NULL),(5359,1659,5,NULL,NULL),(5360,1659,9,NULL,NULL),(5361,1659,10,NULL,NULL),(5362,1659,11,NULL,NULL),(5363,1659,12,NULL,NULL),(5364,1660,2,NULL,NULL),(5365,1660,5,NULL,NULL),(5366,1660,9,NULL,NULL),(5367,1660,10,NULL,NULL),(5368,1660,11,NULL,NULL),(5369,1660,12,NULL,NULL),(5370,1661,2,NULL,NULL),(5371,1661,5,NULL,NULL),(5372,1661,9,NULL,NULL),(5373,1661,10,NULL,NULL),(5374,1661,11,NULL,NULL),(5375,1661,12,NULL,NULL),(5376,1662,2,NULL,NULL),(5377,1662,5,NULL,NULL),(5378,1662,9,NULL,NULL),(5379,1662,10,NULL,NULL),(5380,1662,11,NULL,NULL),(5381,1662,12,NULL,NULL);

/*Table structure for table `chart_of_account_entry_types` */

DROP TABLE IF EXISTS `chart_of_account_entry_types`;

CREATE TABLE `chart_of_account_entry_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `chart_of_account_id` bigint(20) unsigned NOT NULL,
  `entry_type_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chart_of_account_entry_types_chart_of_account_id_foreign` (`chart_of_account_id`),
  KEY `chart_of_account_entry_types_entry_type_id_foreign` (`entry_type_id`),
  CONSTRAINT `chart_of_account_entry_types_chart_of_account_id_foreign` FOREIGN KEY (`chart_of_account_id`) REFERENCES `chart_of_accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `chart_of_account_entry_types_entry_type_id_foreign` FOREIGN KEY (`entry_type_id`) REFERENCES `entry_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2563 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `chart_of_account_entry_types` */

insert  into `chart_of_account_entry_types`(`id`,`chart_of_account_id`,`entry_type_id`,`created_at`,`updated_at`) values (1513,1313,3,NULL,NULL),(1514,1313,4,NULL,NULL),(1515,1313,5,NULL,NULL),(1516,1314,3,NULL,NULL),(1517,1314,4,NULL,NULL),(1518,1314,5,NULL,NULL),(1519,1315,3,NULL,NULL),(1520,1315,4,NULL,NULL),(1521,1315,5,NULL,NULL),(1522,1316,3,NULL,NULL),(1523,1316,4,NULL,NULL),(1524,1316,5,NULL,NULL),(1525,1317,3,NULL,NULL),(1526,1317,4,NULL,NULL),(1527,1317,5,NULL,NULL),(1528,1318,3,NULL,NULL),(1529,1318,4,NULL,NULL),(1530,1318,5,NULL,NULL),(1531,1319,3,NULL,NULL),(1532,1319,4,NULL,NULL),(1533,1319,5,NULL,NULL),(1534,1320,3,NULL,NULL),(1535,1320,4,NULL,NULL),(1536,1320,5,NULL,NULL),(1537,1321,3,NULL,NULL),(1538,1321,4,NULL,NULL),(1539,1321,5,NULL,NULL),(1540,1322,3,NULL,NULL),(1541,1322,4,NULL,NULL),(1542,1322,5,NULL,NULL),(1543,1323,3,NULL,NULL),(1544,1323,4,NULL,NULL),(1545,1323,5,NULL,NULL),(1546,1324,3,NULL,NULL),(1547,1324,4,NULL,NULL),(1548,1324,5,NULL,NULL),(1549,1325,3,NULL,NULL),(1550,1325,4,NULL,NULL),(1551,1325,5,NULL,NULL),(1552,1326,3,NULL,NULL),(1553,1326,4,NULL,NULL),(1554,1326,5,NULL,NULL),(1555,1327,3,NULL,NULL),(1556,1327,4,NULL,NULL),(1557,1327,5,NULL,NULL),(1558,1328,3,NULL,NULL),(1559,1328,4,NULL,NULL),(1560,1328,5,NULL,NULL),(1561,1329,3,NULL,NULL),(1562,1329,4,NULL,NULL),(1563,1329,5,NULL,NULL),(1564,1330,3,NULL,NULL),(1565,1330,4,NULL,NULL),(1566,1330,5,NULL,NULL),(1567,1331,3,NULL,NULL),(1568,1331,4,NULL,NULL),(1569,1331,5,NULL,NULL),(1570,1332,3,NULL,NULL),(1571,1332,4,NULL,NULL),(1572,1332,5,NULL,NULL),(1573,1333,3,NULL,NULL),(1574,1333,4,NULL,NULL),(1575,1333,5,NULL,NULL),(1576,1334,3,NULL,NULL),(1577,1334,4,NULL,NULL),(1578,1334,5,NULL,NULL),(1579,1335,3,NULL,NULL),(1580,1335,4,NULL,NULL),(1581,1335,5,NULL,NULL),(1582,1336,3,NULL,NULL),(1583,1336,4,NULL,NULL),(1584,1336,5,NULL,NULL),(1585,1337,3,NULL,NULL),(1586,1337,4,NULL,NULL),(1587,1337,5,NULL,NULL),(1588,1338,3,NULL,NULL),(1589,1338,4,NULL,NULL),(1590,1338,5,NULL,NULL),(1591,1339,3,NULL,NULL),(1592,1339,4,NULL,NULL),(1593,1339,5,NULL,NULL),(1594,1340,3,NULL,NULL),(1595,1340,4,NULL,NULL),(1596,1340,5,NULL,NULL),(1597,1341,3,NULL,NULL),(1598,1341,4,NULL,NULL),(1599,1341,5,NULL,NULL),(1600,1342,3,NULL,NULL),(1601,1342,4,NULL,NULL),(1602,1342,5,NULL,NULL),(1603,1343,3,NULL,NULL),(1604,1343,4,NULL,NULL),(1605,1343,5,NULL,NULL),(1606,1344,3,NULL,NULL),(1607,1344,4,NULL,NULL),(1608,1344,5,NULL,NULL),(1609,1345,3,NULL,NULL),(1610,1345,4,NULL,NULL),(1611,1345,5,NULL,NULL),(1612,1346,3,NULL,NULL),(1613,1346,4,NULL,NULL),(1614,1346,5,NULL,NULL),(1615,1347,3,NULL,NULL),(1616,1347,4,NULL,NULL),(1617,1347,5,NULL,NULL),(1618,1348,3,NULL,NULL),(1619,1348,4,NULL,NULL),(1620,1348,5,NULL,NULL),(1621,1349,3,NULL,NULL),(1622,1349,4,NULL,NULL),(1623,1349,5,NULL,NULL),(1624,1350,3,NULL,NULL),(1625,1350,4,NULL,NULL),(1626,1350,5,NULL,NULL),(1627,1351,3,NULL,NULL),(1628,1351,4,NULL,NULL),(1629,1351,5,NULL,NULL),(1630,1352,3,NULL,NULL),(1631,1352,4,NULL,NULL),(1632,1352,5,NULL,NULL),(1633,1353,3,NULL,NULL),(1634,1353,4,NULL,NULL),(1635,1353,5,NULL,NULL),(1636,1354,3,NULL,NULL),(1637,1354,4,NULL,NULL),(1638,1354,5,NULL,NULL),(1639,1355,3,NULL,NULL),(1640,1355,4,NULL,NULL),(1641,1355,5,NULL,NULL),(1642,1356,3,NULL,NULL),(1643,1356,4,NULL,NULL),(1644,1356,5,NULL,NULL),(1645,1357,3,NULL,NULL),(1646,1357,4,NULL,NULL),(1647,1357,5,NULL,NULL),(1648,1358,3,NULL,NULL),(1649,1358,4,NULL,NULL),(1650,1358,5,NULL,NULL),(1651,1359,3,NULL,NULL),(1652,1359,4,NULL,NULL),(1653,1359,5,NULL,NULL),(1654,1360,3,NULL,NULL),(1655,1360,4,NULL,NULL),(1656,1360,5,NULL,NULL),(1657,1361,3,NULL,NULL),(1658,1361,4,NULL,NULL),(1659,1361,5,NULL,NULL),(1660,1362,3,NULL,NULL),(1661,1362,4,NULL,NULL),(1662,1362,5,NULL,NULL),(1663,1363,3,NULL,NULL),(1664,1363,4,NULL,NULL),(1665,1363,5,NULL,NULL),(1666,1364,3,NULL,NULL),(1667,1364,4,NULL,NULL),(1668,1364,5,NULL,NULL),(1669,1365,3,NULL,NULL),(1670,1365,4,NULL,NULL),(1671,1365,5,NULL,NULL),(1672,1366,3,NULL,NULL),(1673,1366,4,NULL,NULL),(1674,1366,5,NULL,NULL),(1675,1367,3,NULL,NULL),(1676,1367,4,NULL,NULL),(1677,1367,5,NULL,NULL),(1678,1368,3,NULL,NULL),(1679,1368,4,NULL,NULL),(1680,1368,5,NULL,NULL),(1681,1369,3,NULL,NULL),(1682,1369,4,NULL,NULL),(1683,1369,5,NULL,NULL),(1684,1370,3,NULL,NULL),(1685,1370,4,NULL,NULL),(1686,1370,5,NULL,NULL),(1687,1371,3,NULL,NULL),(1688,1371,4,NULL,NULL),(1689,1371,5,NULL,NULL),(1690,1372,3,NULL,NULL),(1691,1372,4,NULL,NULL),(1692,1372,5,NULL,NULL),(1693,1373,3,NULL,NULL),(1694,1373,4,NULL,NULL),(1695,1373,5,NULL,NULL),(1696,1374,3,NULL,NULL),(1697,1374,4,NULL,NULL),(1698,1374,5,NULL,NULL),(1699,1375,3,NULL,NULL),(1700,1375,4,NULL,NULL),(1701,1375,5,NULL,NULL),(1702,1376,3,NULL,NULL),(1703,1376,4,NULL,NULL),(1704,1376,5,NULL,NULL),(1705,1377,3,NULL,NULL),(1706,1377,4,NULL,NULL),(1707,1377,5,NULL,NULL),(1708,1378,3,NULL,NULL),(1709,1378,4,NULL,NULL),(1710,1378,5,NULL,NULL),(1711,1379,3,NULL,NULL),(1712,1379,4,NULL,NULL),(1713,1379,5,NULL,NULL),(1714,1380,3,NULL,NULL),(1715,1380,4,NULL,NULL),(1716,1380,5,NULL,NULL),(1717,1381,3,NULL,NULL),(1718,1381,4,NULL,NULL),(1719,1381,5,NULL,NULL),(1720,1382,3,NULL,NULL),(1721,1382,4,NULL,NULL),(1722,1382,5,NULL,NULL),(1723,1383,3,NULL,NULL),(1724,1383,4,NULL,NULL),(1725,1383,5,NULL,NULL),(1726,1384,3,NULL,NULL),(1727,1384,4,NULL,NULL),(1728,1384,5,NULL,NULL),(1729,1385,3,NULL,NULL),(1730,1385,4,NULL,NULL),(1731,1385,5,NULL,NULL),(1732,1386,3,NULL,NULL),(1733,1386,4,NULL,NULL),(1734,1386,5,NULL,NULL),(1735,1387,3,NULL,NULL),(1736,1387,4,NULL,NULL),(1737,1387,5,NULL,NULL),(1738,1388,3,NULL,NULL),(1739,1388,4,NULL,NULL),(1740,1388,5,NULL,NULL),(1741,1389,3,NULL,NULL),(1742,1389,4,NULL,NULL),(1743,1389,5,NULL,NULL),(1744,1390,3,NULL,NULL),(1745,1390,4,NULL,NULL),(1746,1390,5,NULL,NULL),(1747,1391,3,NULL,NULL),(1748,1391,4,NULL,NULL),(1749,1391,5,NULL,NULL),(1750,1392,3,NULL,NULL),(1751,1392,4,NULL,NULL),(1752,1392,5,NULL,NULL),(1753,1393,3,NULL,NULL),(1754,1393,4,NULL,NULL),(1755,1393,5,NULL,NULL),(1756,1394,3,NULL,NULL),(1757,1394,4,NULL,NULL),(1758,1394,5,NULL,NULL),(1759,1395,3,NULL,NULL),(1760,1395,4,NULL,NULL),(1761,1395,5,NULL,NULL),(1762,1396,3,NULL,NULL),(1763,1396,4,NULL,NULL),(1764,1396,5,NULL,NULL),(1765,1397,3,NULL,NULL),(1766,1397,4,NULL,NULL),(1767,1397,5,NULL,NULL),(1768,1398,3,NULL,NULL),(1769,1398,4,NULL,NULL),(1770,1398,5,NULL,NULL),(1771,1399,3,NULL,NULL),(1772,1399,4,NULL,NULL),(1773,1399,5,NULL,NULL),(1774,1400,3,NULL,NULL),(1775,1400,4,NULL,NULL),(1776,1400,5,NULL,NULL),(1777,1401,3,NULL,NULL),(1778,1401,4,NULL,NULL),(1779,1401,5,NULL,NULL),(1780,1402,3,NULL,NULL),(1781,1402,4,NULL,NULL),(1782,1402,5,NULL,NULL),(1783,1403,3,NULL,NULL),(1784,1403,4,NULL,NULL),(1785,1403,5,NULL,NULL),(1786,1404,3,NULL,NULL),(1787,1404,4,NULL,NULL),(1788,1404,5,NULL,NULL),(1789,1405,3,NULL,NULL),(1790,1405,4,NULL,NULL),(1791,1405,5,NULL,NULL),(1792,1406,3,NULL,NULL),(1793,1406,4,NULL,NULL),(1794,1406,5,NULL,NULL),(1795,1407,3,NULL,NULL),(1796,1407,4,NULL,NULL),(1797,1407,5,NULL,NULL),(1798,1408,3,NULL,NULL),(1799,1408,4,NULL,NULL),(1800,1408,5,NULL,NULL),(1801,1409,3,NULL,NULL),(1802,1409,4,NULL,NULL),(1803,1409,5,NULL,NULL),(1804,1410,3,NULL,NULL),(1805,1410,4,NULL,NULL),(1806,1410,5,NULL,NULL),(1807,1411,3,NULL,NULL),(1808,1411,4,NULL,NULL),(1809,1411,5,NULL,NULL),(1810,1412,3,NULL,NULL),(1811,1412,4,NULL,NULL),(1812,1412,5,NULL,NULL),(1813,1413,3,NULL,NULL),(1814,1413,4,NULL,NULL),(1815,1413,5,NULL,NULL),(1816,1414,3,NULL,NULL),(1817,1414,4,NULL,NULL),(1818,1414,5,NULL,NULL),(1819,1415,3,NULL,NULL),(1820,1415,4,NULL,NULL),(1821,1415,5,NULL,NULL),(1822,1416,3,NULL,NULL),(1823,1416,4,NULL,NULL),(1824,1416,5,NULL,NULL),(1825,1417,3,NULL,NULL),(1826,1417,4,NULL,NULL),(1827,1417,5,NULL,NULL),(1828,1418,3,NULL,NULL),(1829,1418,4,NULL,NULL),(1830,1418,5,NULL,NULL),(1831,1419,3,NULL,NULL),(1832,1419,4,NULL,NULL),(1833,1419,5,NULL,NULL),(1834,1420,3,NULL,NULL),(1835,1420,4,NULL,NULL),(1836,1420,5,NULL,NULL),(1837,1421,3,NULL,NULL),(1838,1421,4,NULL,NULL),(1839,1421,5,NULL,NULL),(1840,1422,3,NULL,NULL),(1841,1422,4,NULL,NULL),(1842,1422,5,NULL,NULL),(1843,1423,3,NULL,NULL),(1844,1423,4,NULL,NULL),(1845,1423,5,NULL,NULL),(1846,1424,3,NULL,NULL),(1847,1424,4,NULL,NULL),(1848,1424,5,NULL,NULL),(1849,1425,3,NULL,NULL),(1850,1425,4,NULL,NULL),(1851,1425,5,NULL,NULL),(1852,1426,3,NULL,NULL),(1853,1426,4,NULL,NULL),(1854,1426,5,NULL,NULL),(1855,1427,3,NULL,NULL),(1856,1427,4,NULL,NULL),(1857,1427,5,NULL,NULL),(1858,1428,3,NULL,NULL),(1859,1428,4,NULL,NULL),(1860,1428,5,NULL,NULL),(1861,1429,3,NULL,NULL),(1862,1429,4,NULL,NULL),(1863,1429,5,NULL,NULL),(1864,1430,3,NULL,NULL),(1865,1430,4,NULL,NULL),(1866,1430,5,NULL,NULL),(1867,1431,3,NULL,NULL),(1868,1431,4,NULL,NULL),(1869,1431,5,NULL,NULL),(1870,1432,3,NULL,NULL),(1871,1432,4,NULL,NULL),(1872,1432,5,NULL,NULL),(1873,1433,3,NULL,NULL),(1874,1433,4,NULL,NULL),(1875,1433,5,NULL,NULL),(1876,1434,3,NULL,NULL),(1877,1434,4,NULL,NULL),(1878,1434,5,NULL,NULL),(1879,1435,3,NULL,NULL),(1880,1435,4,NULL,NULL),(1881,1435,5,NULL,NULL),(1882,1436,3,NULL,NULL),(1883,1436,4,NULL,NULL),(1884,1436,5,NULL,NULL),(1885,1437,3,NULL,NULL),(1886,1437,4,NULL,NULL),(1887,1437,5,NULL,NULL),(1888,1438,3,NULL,NULL),(1889,1438,4,NULL,NULL),(1890,1438,5,NULL,NULL),(1891,1439,3,NULL,NULL),(1892,1439,4,NULL,NULL),(1893,1439,5,NULL,NULL),(1894,1440,3,NULL,NULL),(1895,1440,4,NULL,NULL),(1896,1440,5,NULL,NULL),(1897,1441,3,NULL,NULL),(1898,1441,4,NULL,NULL),(1899,1441,5,NULL,NULL),(1900,1442,3,NULL,NULL),(1901,1442,4,NULL,NULL),(1902,1442,5,NULL,NULL),(1903,1443,3,NULL,NULL),(1904,1443,4,NULL,NULL),(1905,1443,5,NULL,NULL),(1906,1444,3,NULL,NULL),(1907,1444,4,NULL,NULL),(1908,1444,5,NULL,NULL),(1909,1445,3,NULL,NULL),(1910,1445,4,NULL,NULL),(1911,1445,5,NULL,NULL),(1912,1446,3,NULL,NULL),(1913,1446,4,NULL,NULL),(1914,1446,5,NULL,NULL),(1915,1447,3,NULL,NULL),(1916,1447,4,NULL,NULL),(1917,1447,5,NULL,NULL),(1918,1448,3,NULL,NULL),(1919,1448,4,NULL,NULL),(1920,1448,5,NULL,NULL),(1921,1449,3,NULL,NULL),(1922,1449,4,NULL,NULL),(1923,1449,5,NULL,NULL),(1924,1450,3,NULL,NULL),(1925,1450,4,NULL,NULL),(1926,1450,5,NULL,NULL),(1927,1451,3,NULL,NULL),(1928,1451,4,NULL,NULL),(1929,1451,5,NULL,NULL),(1930,1452,3,NULL,NULL),(1931,1452,4,NULL,NULL),(1932,1452,5,NULL,NULL),(1933,1453,3,NULL,NULL),(1934,1453,4,NULL,NULL),(1935,1453,5,NULL,NULL),(1936,1454,3,NULL,NULL),(1937,1454,4,NULL,NULL),(1938,1454,5,NULL,NULL),(1939,1455,3,NULL,NULL),(1940,1455,4,NULL,NULL),(1941,1455,5,NULL,NULL),(1942,1456,3,NULL,NULL),(1943,1456,4,NULL,NULL),(1944,1456,5,NULL,NULL),(1945,1457,3,NULL,NULL),(1946,1457,4,NULL,NULL),(1947,1457,5,NULL,NULL),(1948,1458,3,NULL,NULL),(1949,1458,4,NULL,NULL),(1950,1458,5,NULL,NULL),(1951,1459,3,NULL,NULL),(1952,1459,4,NULL,NULL),(1953,1459,5,NULL,NULL),(1954,1460,3,NULL,NULL),(1955,1460,4,NULL,NULL),(1956,1460,5,NULL,NULL),(1957,1461,3,NULL,NULL),(1958,1461,4,NULL,NULL),(1959,1461,5,NULL,NULL),(1960,1462,3,NULL,NULL),(1961,1462,4,NULL,NULL),(1962,1462,5,NULL,NULL),(1963,1463,3,NULL,NULL),(1964,1463,4,NULL,NULL),(1965,1463,5,NULL,NULL),(1966,1464,3,NULL,NULL),(1967,1464,4,NULL,NULL),(1968,1464,5,NULL,NULL),(1969,1465,3,NULL,NULL),(1970,1465,4,NULL,NULL),(1971,1465,5,NULL,NULL),(1972,1466,3,NULL,NULL),(1973,1466,4,NULL,NULL),(1974,1466,5,NULL,NULL),(1975,1467,3,NULL,NULL),(1976,1467,4,NULL,NULL),(1977,1467,5,NULL,NULL),(1978,1468,3,NULL,NULL),(1979,1468,4,NULL,NULL),(1980,1468,5,NULL,NULL),(1981,1469,3,NULL,NULL),(1982,1469,4,NULL,NULL),(1983,1469,5,NULL,NULL),(1984,1470,3,NULL,NULL),(1985,1470,4,NULL,NULL),(1986,1470,5,NULL,NULL),(1987,1471,3,NULL,NULL),(1988,1471,4,NULL,NULL),(1989,1471,5,NULL,NULL),(1990,1472,3,NULL,NULL),(1991,1472,4,NULL,NULL),(1992,1472,5,NULL,NULL),(1993,1473,3,NULL,NULL),(1994,1473,4,NULL,NULL),(1995,1473,5,NULL,NULL),(1996,1474,3,NULL,NULL),(1997,1474,4,NULL,NULL),(1998,1474,5,NULL,NULL),(1999,1475,3,NULL,NULL),(2000,1475,4,NULL,NULL),(2001,1475,5,NULL,NULL),(2002,1476,3,NULL,NULL),(2003,1476,4,NULL,NULL),(2004,1476,5,NULL,NULL),(2005,1477,3,NULL,NULL),(2006,1477,4,NULL,NULL),(2007,1477,5,NULL,NULL),(2008,1478,3,NULL,NULL),(2009,1478,4,NULL,NULL),(2010,1478,5,NULL,NULL),(2011,1479,3,NULL,NULL),(2012,1479,4,NULL,NULL),(2013,1479,5,NULL,NULL),(2014,1480,3,NULL,NULL),(2015,1480,4,NULL,NULL),(2016,1480,5,NULL,NULL),(2017,1481,3,NULL,NULL),(2018,1481,4,NULL,NULL),(2019,1481,5,NULL,NULL),(2020,1482,3,NULL,NULL),(2021,1482,4,NULL,NULL),(2022,1482,5,NULL,NULL),(2023,1483,3,NULL,NULL),(2024,1483,4,NULL,NULL),(2025,1483,5,NULL,NULL),(2026,1484,3,NULL,NULL),(2027,1484,4,NULL,NULL),(2028,1484,5,NULL,NULL),(2029,1485,3,NULL,NULL),(2030,1485,4,NULL,NULL),(2031,1485,5,NULL,NULL),(2032,1486,3,NULL,NULL),(2033,1486,4,NULL,NULL),(2034,1486,5,NULL,NULL),(2035,1487,3,NULL,NULL),(2036,1487,4,NULL,NULL),(2037,1487,5,NULL,NULL),(2038,1488,3,NULL,NULL),(2039,1488,4,NULL,NULL),(2040,1488,5,NULL,NULL),(2041,1489,3,NULL,NULL),(2042,1489,4,NULL,NULL),(2043,1489,5,NULL,NULL),(2044,1490,3,NULL,NULL),(2045,1490,4,NULL,NULL),(2046,1490,5,NULL,NULL),(2047,1491,3,NULL,NULL),(2048,1491,4,NULL,NULL),(2049,1491,5,NULL,NULL),(2050,1492,3,NULL,NULL),(2051,1492,4,NULL,NULL),(2052,1492,5,NULL,NULL),(2053,1493,3,NULL,NULL),(2054,1493,4,NULL,NULL),(2055,1493,5,NULL,NULL),(2056,1494,3,NULL,NULL),(2057,1494,4,NULL,NULL),(2058,1494,5,NULL,NULL),(2059,1495,3,NULL,NULL),(2060,1495,4,NULL,NULL),(2061,1495,5,NULL,NULL),(2062,1496,3,NULL,NULL),(2063,1496,4,NULL,NULL),(2064,1496,5,NULL,NULL),(2065,1497,3,NULL,NULL),(2066,1497,4,NULL,NULL),(2067,1497,5,NULL,NULL),(2068,1498,3,NULL,NULL),(2069,1498,4,NULL,NULL),(2070,1498,5,NULL,NULL),(2071,1499,3,NULL,NULL),(2072,1499,4,NULL,NULL),(2073,1499,5,NULL,NULL),(2074,1500,3,NULL,NULL),(2075,1500,4,NULL,NULL),(2076,1500,5,NULL,NULL),(2077,1501,3,NULL,NULL),(2078,1501,4,NULL,NULL),(2079,1501,5,NULL,NULL),(2080,1502,3,NULL,NULL),(2081,1502,4,NULL,NULL),(2082,1502,5,NULL,NULL),(2083,1503,3,NULL,NULL),(2084,1503,4,NULL,NULL),(2085,1503,5,NULL,NULL),(2086,1504,3,NULL,NULL),(2087,1504,4,NULL,NULL),(2088,1504,5,NULL,NULL),(2089,1505,3,NULL,NULL),(2090,1505,4,NULL,NULL),(2091,1505,5,NULL,NULL),(2092,1506,3,NULL,NULL),(2093,1506,4,NULL,NULL),(2094,1506,5,NULL,NULL),(2095,1507,3,NULL,NULL),(2096,1507,4,NULL,NULL),(2097,1507,5,NULL,NULL),(2098,1508,3,NULL,NULL),(2099,1508,4,NULL,NULL),(2100,1508,5,NULL,NULL),(2101,1509,3,NULL,NULL),(2102,1509,4,NULL,NULL),(2103,1509,5,NULL,NULL),(2104,1510,3,NULL,NULL),(2105,1510,4,NULL,NULL),(2106,1510,5,NULL,NULL),(2107,1511,3,NULL,NULL),(2108,1511,4,NULL,NULL),(2109,1511,5,NULL,NULL),(2110,1512,3,NULL,NULL),(2111,1512,4,NULL,NULL),(2112,1512,5,NULL,NULL),(2113,1513,3,NULL,NULL),(2114,1513,4,NULL,NULL),(2115,1513,5,NULL,NULL),(2116,1514,3,NULL,NULL),(2117,1514,4,NULL,NULL),(2118,1514,5,NULL,NULL),(2119,1515,3,NULL,NULL),(2120,1515,4,NULL,NULL),(2121,1515,5,NULL,NULL),(2122,1516,3,NULL,NULL),(2123,1516,4,NULL,NULL),(2124,1516,5,NULL,NULL),(2125,1517,3,NULL,NULL),(2126,1517,4,NULL,NULL),(2127,1517,5,NULL,NULL),(2128,1518,3,NULL,NULL),(2129,1518,4,NULL,NULL),(2130,1518,5,NULL,NULL),(2131,1519,3,NULL,NULL),(2132,1519,4,NULL,NULL),(2133,1519,5,NULL,NULL),(2134,1520,3,NULL,NULL),(2135,1520,4,NULL,NULL),(2136,1520,5,NULL,NULL),(2137,1521,3,NULL,NULL),(2138,1521,4,NULL,NULL),(2139,1521,5,NULL,NULL),(2140,1522,3,NULL,NULL),(2141,1522,4,NULL,NULL),(2142,1522,5,NULL,NULL),(2143,1523,3,NULL,NULL),(2144,1523,4,NULL,NULL),(2145,1523,5,NULL,NULL),(2146,1524,3,NULL,NULL),(2147,1524,4,NULL,NULL),(2148,1524,5,NULL,NULL),(2149,1525,3,NULL,NULL),(2150,1525,4,NULL,NULL),(2151,1525,5,NULL,NULL),(2152,1526,3,NULL,NULL),(2153,1526,4,NULL,NULL),(2154,1526,5,NULL,NULL),(2155,1527,3,NULL,NULL),(2156,1527,4,NULL,NULL),(2157,1527,5,NULL,NULL),(2158,1528,3,NULL,NULL),(2159,1528,4,NULL,NULL),(2160,1528,5,NULL,NULL),(2161,1529,3,NULL,NULL),(2162,1529,4,NULL,NULL),(2163,1529,5,NULL,NULL),(2164,1530,3,NULL,NULL),(2165,1530,4,NULL,NULL),(2166,1530,5,NULL,NULL),(2167,1531,3,NULL,NULL),(2168,1531,4,NULL,NULL),(2169,1531,5,NULL,NULL),(2170,1532,3,NULL,NULL),(2171,1532,4,NULL,NULL),(2172,1532,5,NULL,NULL),(2173,1533,3,NULL,NULL),(2174,1533,4,NULL,NULL),(2175,1533,5,NULL,NULL),(2176,1534,3,NULL,NULL),(2177,1534,4,NULL,NULL),(2178,1534,5,NULL,NULL),(2179,1535,3,NULL,NULL),(2180,1535,4,NULL,NULL),(2181,1535,5,NULL,NULL),(2182,1536,3,NULL,NULL),(2183,1536,4,NULL,NULL),(2184,1536,5,NULL,NULL),(2185,1537,3,NULL,NULL),(2186,1537,4,NULL,NULL),(2187,1537,5,NULL,NULL),(2188,1538,3,NULL,NULL),(2189,1538,4,NULL,NULL),(2190,1538,5,NULL,NULL),(2191,1539,3,NULL,NULL),(2192,1539,4,NULL,NULL),(2193,1539,5,NULL,NULL),(2194,1540,3,NULL,NULL),(2195,1540,4,NULL,NULL),(2196,1540,5,NULL,NULL),(2197,1541,3,NULL,NULL),(2198,1541,4,NULL,NULL),(2199,1541,5,NULL,NULL),(2200,1542,3,NULL,NULL),(2201,1542,4,NULL,NULL),(2202,1542,5,NULL,NULL),(2203,1543,3,NULL,NULL),(2204,1543,4,NULL,NULL),(2205,1543,5,NULL,NULL),(2206,1544,3,NULL,NULL),(2207,1544,4,NULL,NULL),(2208,1544,5,NULL,NULL),(2209,1545,3,NULL,NULL),(2210,1545,4,NULL,NULL),(2211,1545,5,NULL,NULL),(2212,1546,3,NULL,NULL),(2213,1546,4,NULL,NULL),(2214,1546,5,NULL,NULL),(2215,1547,3,NULL,NULL),(2216,1547,4,NULL,NULL),(2217,1547,5,NULL,NULL),(2218,1548,3,NULL,NULL),(2219,1548,4,NULL,NULL),(2220,1548,5,NULL,NULL),(2221,1549,3,NULL,NULL),(2222,1549,4,NULL,NULL),(2223,1549,5,NULL,NULL),(2224,1550,3,NULL,NULL),(2225,1550,4,NULL,NULL),(2226,1550,5,NULL,NULL),(2227,1551,3,NULL,NULL),(2228,1551,4,NULL,NULL),(2229,1551,5,NULL,NULL),(2230,1552,3,NULL,NULL),(2231,1552,4,NULL,NULL),(2232,1552,5,NULL,NULL),(2233,1553,3,NULL,NULL),(2234,1553,4,NULL,NULL),(2235,1553,5,NULL,NULL),(2236,1554,3,NULL,NULL),(2237,1554,4,NULL,NULL),(2238,1554,5,NULL,NULL),(2239,1555,3,NULL,NULL),(2240,1555,4,NULL,NULL),(2241,1555,5,NULL,NULL),(2242,1556,3,NULL,NULL),(2243,1556,4,NULL,NULL),(2244,1556,5,NULL,NULL),(2245,1557,3,NULL,NULL),(2246,1557,4,NULL,NULL),(2247,1557,5,NULL,NULL),(2248,1558,3,NULL,NULL),(2249,1558,4,NULL,NULL),(2250,1558,5,NULL,NULL),(2251,1559,3,NULL,NULL),(2252,1559,4,NULL,NULL),(2253,1559,5,NULL,NULL),(2254,1560,3,NULL,NULL),(2255,1560,4,NULL,NULL),(2256,1560,5,NULL,NULL),(2257,1561,3,NULL,NULL),(2258,1561,4,NULL,NULL),(2259,1561,5,NULL,NULL),(2260,1562,3,NULL,NULL),(2261,1562,4,NULL,NULL),(2262,1562,5,NULL,NULL),(2263,1563,3,NULL,NULL),(2264,1563,4,NULL,NULL),(2265,1563,5,NULL,NULL),(2266,1564,3,NULL,NULL),(2267,1564,4,NULL,NULL),(2268,1564,5,NULL,NULL),(2269,1565,3,NULL,NULL),(2270,1565,4,NULL,NULL),(2271,1565,5,NULL,NULL),(2272,1566,3,NULL,NULL),(2273,1566,4,NULL,NULL),(2274,1566,5,NULL,NULL),(2275,1567,3,NULL,NULL),(2276,1567,4,NULL,NULL),(2277,1567,5,NULL,NULL),(2278,1568,3,NULL,NULL),(2279,1568,4,NULL,NULL),(2280,1568,5,NULL,NULL),(2281,1569,3,NULL,NULL),(2282,1569,4,NULL,NULL),(2283,1569,5,NULL,NULL),(2284,1570,3,NULL,NULL),(2285,1570,4,NULL,NULL),(2286,1570,5,NULL,NULL),(2287,1571,3,NULL,NULL),(2288,1571,4,NULL,NULL),(2289,1571,5,NULL,NULL),(2290,1572,3,NULL,NULL),(2291,1572,4,NULL,NULL),(2292,1572,5,NULL,NULL),(2293,1573,3,NULL,NULL),(2294,1573,4,NULL,NULL),(2295,1573,5,NULL,NULL),(2296,1574,3,NULL,NULL),(2297,1574,4,NULL,NULL),(2298,1574,5,NULL,NULL),(2299,1575,3,NULL,NULL),(2300,1575,4,NULL,NULL),(2301,1575,5,NULL,NULL),(2302,1576,3,NULL,NULL),(2303,1576,4,NULL,NULL),(2304,1576,5,NULL,NULL),(2305,1577,3,NULL,NULL),(2306,1577,4,NULL,NULL),(2307,1577,5,NULL,NULL),(2308,1578,3,NULL,NULL),(2309,1578,4,NULL,NULL),(2310,1578,5,NULL,NULL),(2311,1579,3,NULL,NULL),(2312,1579,4,NULL,NULL),(2313,1579,5,NULL,NULL),(2314,1580,3,NULL,NULL),(2315,1580,4,NULL,NULL),(2316,1580,5,NULL,NULL),(2317,1581,3,NULL,NULL),(2318,1581,4,NULL,NULL),(2319,1581,5,NULL,NULL),(2320,1582,3,NULL,NULL),(2321,1582,4,NULL,NULL),(2322,1582,5,NULL,NULL),(2323,1583,3,NULL,NULL),(2324,1583,4,NULL,NULL),(2325,1583,5,NULL,NULL),(2326,1584,3,NULL,NULL),(2327,1584,4,NULL,NULL),(2328,1584,5,NULL,NULL),(2329,1585,3,NULL,NULL),(2330,1585,4,NULL,NULL),(2331,1585,5,NULL,NULL),(2332,1586,3,NULL,NULL),(2333,1586,4,NULL,NULL),(2334,1586,5,NULL,NULL),(2335,1587,3,NULL,NULL),(2336,1587,4,NULL,NULL),(2337,1587,5,NULL,NULL),(2338,1588,3,NULL,NULL),(2339,1588,4,NULL,NULL),(2340,1588,5,NULL,NULL),(2341,1589,3,NULL,NULL),(2342,1589,4,NULL,NULL),(2343,1589,5,NULL,NULL),(2344,1590,3,NULL,NULL),(2345,1590,4,NULL,NULL),(2346,1590,5,NULL,NULL),(2347,1591,3,NULL,NULL),(2348,1591,4,NULL,NULL),(2349,1591,5,NULL,NULL),(2350,1592,3,NULL,NULL),(2351,1592,4,NULL,NULL),(2352,1592,5,NULL,NULL),(2353,1593,3,NULL,NULL),(2354,1593,4,NULL,NULL),(2355,1593,5,NULL,NULL),(2356,1594,3,NULL,NULL),(2357,1594,4,NULL,NULL),(2358,1594,5,NULL,NULL),(2359,1595,3,NULL,NULL),(2360,1595,4,NULL,NULL),(2361,1595,5,NULL,NULL),(2362,1596,3,NULL,NULL),(2363,1596,4,NULL,NULL),(2364,1596,5,NULL,NULL),(2365,1597,3,NULL,NULL),(2366,1597,4,NULL,NULL),(2367,1597,5,NULL,NULL),(2368,1598,3,NULL,NULL),(2369,1598,4,NULL,NULL),(2370,1598,5,NULL,NULL),(2371,1599,3,NULL,NULL),(2372,1599,4,NULL,NULL),(2373,1599,5,NULL,NULL),(2374,1600,3,NULL,NULL),(2375,1600,4,NULL,NULL),(2376,1600,5,NULL,NULL),(2377,1601,3,NULL,NULL),(2378,1601,4,NULL,NULL),(2379,1601,5,NULL,NULL),(2380,1602,3,NULL,NULL),(2381,1602,4,NULL,NULL),(2382,1602,5,NULL,NULL),(2383,1603,3,NULL,NULL),(2384,1603,4,NULL,NULL),(2385,1603,5,NULL,NULL),(2386,1604,3,NULL,NULL),(2387,1604,4,NULL,NULL),(2388,1604,5,NULL,NULL),(2389,1605,3,NULL,NULL),(2390,1605,4,NULL,NULL),(2391,1605,5,NULL,NULL),(2392,1606,3,NULL,NULL),(2393,1606,4,NULL,NULL),(2394,1606,5,NULL,NULL),(2395,1607,3,NULL,NULL),(2396,1607,4,NULL,NULL),(2397,1607,5,NULL,NULL),(2398,1608,3,NULL,NULL),(2399,1608,4,NULL,NULL),(2400,1608,5,NULL,NULL),(2401,1609,3,NULL,NULL),(2402,1609,4,NULL,NULL),(2403,1609,5,NULL,NULL),(2404,1610,3,NULL,NULL),(2405,1610,4,NULL,NULL),(2406,1610,5,NULL,NULL),(2407,1611,3,NULL,NULL),(2408,1611,4,NULL,NULL),(2409,1611,5,NULL,NULL),(2410,1612,3,NULL,NULL),(2411,1612,4,NULL,NULL),(2412,1612,5,NULL,NULL),(2413,1613,3,NULL,NULL),(2414,1613,4,NULL,NULL),(2415,1613,5,NULL,NULL),(2416,1614,3,NULL,NULL),(2417,1614,4,NULL,NULL),(2418,1614,5,NULL,NULL),(2419,1615,3,NULL,NULL),(2420,1615,4,NULL,NULL),(2421,1615,5,NULL,NULL),(2422,1616,3,NULL,NULL),(2423,1616,4,NULL,NULL),(2424,1616,5,NULL,NULL),(2425,1617,3,NULL,NULL),(2426,1617,4,NULL,NULL),(2427,1617,5,NULL,NULL),(2428,1618,3,NULL,NULL),(2429,1618,4,NULL,NULL),(2430,1618,5,NULL,NULL),(2431,1619,3,NULL,NULL),(2432,1619,4,NULL,NULL),(2433,1619,5,NULL,NULL),(2434,1620,3,NULL,NULL),(2435,1620,4,NULL,NULL),(2436,1620,5,NULL,NULL),(2437,1621,3,NULL,NULL),(2438,1621,4,NULL,NULL),(2439,1621,5,NULL,NULL),(2440,1622,3,NULL,NULL),(2441,1622,4,NULL,NULL),(2442,1622,5,NULL,NULL),(2443,1623,3,NULL,NULL),(2444,1623,4,NULL,NULL),(2445,1623,5,NULL,NULL),(2446,1624,3,NULL,NULL),(2447,1624,4,NULL,NULL),(2448,1624,5,NULL,NULL),(2449,1625,3,NULL,NULL),(2450,1625,4,NULL,NULL),(2451,1625,5,NULL,NULL),(2452,1626,3,NULL,NULL),(2453,1626,4,NULL,NULL),(2454,1626,5,NULL,NULL),(2455,1627,3,NULL,NULL),(2456,1627,4,NULL,NULL),(2457,1627,5,NULL,NULL),(2458,1628,3,NULL,NULL),(2459,1628,4,NULL,NULL),(2460,1628,5,NULL,NULL),(2461,1629,3,NULL,NULL),(2462,1629,4,NULL,NULL),(2463,1629,5,NULL,NULL),(2464,1630,3,NULL,NULL),(2465,1630,4,NULL,NULL),(2466,1630,5,NULL,NULL),(2467,1631,3,NULL,NULL),(2468,1631,4,NULL,NULL),(2469,1631,5,NULL,NULL),(2470,1632,3,NULL,NULL),(2471,1632,4,NULL,NULL),(2472,1632,5,NULL,NULL),(2473,1633,3,NULL,NULL),(2474,1633,4,NULL,NULL),(2475,1633,5,NULL,NULL),(2476,1634,3,NULL,NULL),(2477,1634,4,NULL,NULL),(2478,1634,5,NULL,NULL),(2479,1635,3,NULL,NULL),(2480,1635,4,NULL,NULL),(2481,1635,5,NULL,NULL),(2482,1636,3,NULL,NULL),(2483,1636,4,NULL,NULL),(2484,1636,5,NULL,NULL),(2485,1637,3,NULL,NULL),(2486,1637,4,NULL,NULL),(2487,1637,5,NULL,NULL),(2488,1638,3,NULL,NULL),(2489,1638,4,NULL,NULL),(2490,1638,5,NULL,NULL),(2491,1639,3,NULL,NULL),(2492,1639,4,NULL,NULL),(2493,1639,5,NULL,NULL),(2494,1640,3,NULL,NULL),(2495,1640,4,NULL,NULL),(2496,1640,5,NULL,NULL),(2497,1641,3,NULL,NULL),(2498,1641,4,NULL,NULL),(2499,1641,5,NULL,NULL),(2500,1642,3,NULL,NULL),(2501,1642,4,NULL,NULL),(2502,1642,5,NULL,NULL),(2503,1643,3,NULL,NULL),(2504,1643,4,NULL,NULL),(2505,1643,5,NULL,NULL),(2506,1644,3,NULL,NULL),(2507,1644,4,NULL,NULL),(2508,1644,5,NULL,NULL),(2509,1645,3,NULL,NULL),(2510,1645,4,NULL,NULL),(2511,1645,5,NULL,NULL),(2512,1646,3,NULL,NULL),(2513,1646,4,NULL,NULL),(2514,1646,5,NULL,NULL),(2515,1647,3,NULL,NULL),(2516,1647,4,NULL,NULL),(2517,1647,5,NULL,NULL),(2518,1648,3,NULL,NULL),(2519,1648,4,NULL,NULL),(2520,1648,5,NULL,NULL),(2521,1649,3,NULL,NULL),(2522,1649,4,NULL,NULL),(2523,1649,5,NULL,NULL),(2524,1650,3,NULL,NULL),(2525,1650,4,NULL,NULL),(2526,1650,5,NULL,NULL),(2527,1651,3,NULL,NULL),(2528,1651,4,NULL,NULL),(2529,1651,5,NULL,NULL),(2530,1652,3,NULL,NULL),(2531,1652,4,NULL,NULL),(2532,1652,5,NULL,NULL),(2533,1653,3,NULL,NULL),(2534,1653,4,NULL,NULL),(2535,1653,5,NULL,NULL),(2536,1654,3,NULL,NULL),(2537,1654,4,NULL,NULL),(2538,1654,5,NULL,NULL),(2539,1655,3,NULL,NULL),(2540,1655,4,NULL,NULL),(2541,1655,5,NULL,NULL),(2542,1656,3,NULL,NULL),(2543,1656,4,NULL,NULL),(2544,1656,5,NULL,NULL),(2545,1657,3,NULL,NULL),(2546,1657,4,NULL,NULL),(2547,1657,5,NULL,NULL),(2548,1658,3,NULL,NULL),(2549,1658,4,NULL,NULL),(2550,1658,5,NULL,NULL),(2551,1659,3,NULL,NULL),(2552,1659,4,NULL,NULL),(2553,1659,5,NULL,NULL),(2554,1660,3,NULL,NULL),(2555,1660,4,NULL,NULL),(2556,1660,5,NULL,NULL),(2557,1661,3,NULL,NULL),(2558,1661,4,NULL,NULL),(2559,1661,5,NULL,NULL),(2560,1662,3,NULL,NULL),(2561,1662,4,NULL,NULL),(2562,1662,5,NULL,NULL);

/*Table structure for table `chart_of_account_users` */

DROP TABLE IF EXISTS `chart_of_account_users`;

CREATE TABLE `chart_of_account_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `chart_of_account_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chart_of_account_users_chart_of_account_id_foreign` (`chart_of_account_id`),
  KEY `chart_of_account_users_user_id_foreign` (`user_id`),
  CONSTRAINT `chart_of_account_users_chart_of_account_id_foreign` FOREIGN KEY (`chart_of_account_id`) REFERENCES `chart_of_accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `chart_of_account_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1914 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `chart_of_account_users` */

insert  into `chart_of_account_users`(`id`,`chart_of_account_id`,`user_id`,`created_at`,`updated_at`) values (514,1313,1,NULL,NULL),(515,1313,5,NULL,NULL),(516,1313,22,NULL,NULL),(517,1313,45,NULL,NULL),(518,1314,1,NULL,NULL),(519,1314,5,NULL,NULL),(520,1314,22,NULL,NULL),(521,1314,45,NULL,NULL),(522,1315,1,NULL,NULL),(523,1315,5,NULL,NULL),(524,1315,22,NULL,NULL),(525,1315,45,NULL,NULL),(526,1316,1,NULL,NULL),(527,1316,5,NULL,NULL),(528,1316,22,NULL,NULL),(529,1316,45,NULL,NULL),(530,1317,1,NULL,NULL),(531,1317,5,NULL,NULL),(532,1317,22,NULL,NULL),(533,1317,45,NULL,NULL),(534,1318,1,NULL,NULL),(535,1318,5,NULL,NULL),(536,1318,22,NULL,NULL),(537,1318,45,NULL,NULL),(538,1319,1,NULL,NULL),(539,1319,5,NULL,NULL),(540,1319,22,NULL,NULL),(541,1319,45,NULL,NULL),(542,1320,1,NULL,NULL),(543,1320,5,NULL,NULL),(544,1320,22,NULL,NULL),(545,1320,45,NULL,NULL),(546,1321,1,NULL,NULL),(547,1321,5,NULL,NULL),(548,1321,22,NULL,NULL),(549,1321,45,NULL,NULL),(550,1322,1,NULL,NULL),(551,1322,5,NULL,NULL),(552,1322,22,NULL,NULL),(553,1322,45,NULL,NULL),(554,1323,1,NULL,NULL),(555,1323,5,NULL,NULL),(556,1323,22,NULL,NULL),(557,1323,45,NULL,NULL),(558,1324,1,NULL,NULL),(559,1324,5,NULL,NULL),(560,1324,22,NULL,NULL),(561,1324,45,NULL,NULL),(562,1325,1,NULL,NULL),(563,1325,5,NULL,NULL),(564,1325,22,NULL,NULL),(565,1325,45,NULL,NULL),(566,1326,1,NULL,NULL),(567,1326,5,NULL,NULL),(568,1326,22,NULL,NULL),(569,1326,45,NULL,NULL),(570,1327,1,NULL,NULL),(571,1327,5,NULL,NULL),(572,1327,22,NULL,NULL),(573,1327,45,NULL,NULL),(574,1328,1,NULL,NULL),(575,1328,5,NULL,NULL),(576,1328,22,NULL,NULL),(577,1328,45,NULL,NULL),(578,1329,1,NULL,NULL),(579,1329,5,NULL,NULL),(580,1329,22,NULL,NULL),(581,1329,45,NULL,NULL),(582,1330,1,NULL,NULL),(583,1330,5,NULL,NULL),(584,1330,22,NULL,NULL),(585,1330,45,NULL,NULL),(586,1331,1,NULL,NULL),(587,1331,5,NULL,NULL),(588,1331,22,NULL,NULL),(589,1331,45,NULL,NULL),(590,1332,1,NULL,NULL),(591,1332,5,NULL,NULL),(592,1332,22,NULL,NULL),(593,1332,45,NULL,NULL),(594,1333,1,NULL,NULL),(595,1333,5,NULL,NULL),(596,1333,22,NULL,NULL),(597,1333,45,NULL,NULL),(598,1334,1,NULL,NULL),(599,1334,5,NULL,NULL),(600,1334,22,NULL,NULL),(601,1334,45,NULL,NULL),(602,1335,1,NULL,NULL),(603,1335,5,NULL,NULL),(604,1335,22,NULL,NULL),(605,1335,45,NULL,NULL),(606,1336,1,NULL,NULL),(607,1336,5,NULL,NULL),(608,1336,22,NULL,NULL),(609,1336,45,NULL,NULL),(610,1337,1,NULL,NULL),(611,1337,5,NULL,NULL),(612,1337,22,NULL,NULL),(613,1337,45,NULL,NULL),(614,1338,1,NULL,NULL),(615,1338,5,NULL,NULL),(616,1338,22,NULL,NULL),(617,1338,45,NULL,NULL),(618,1339,1,NULL,NULL),(619,1339,5,NULL,NULL),(620,1339,22,NULL,NULL),(621,1339,45,NULL,NULL),(622,1340,1,NULL,NULL),(623,1340,5,NULL,NULL),(624,1340,22,NULL,NULL),(625,1340,45,NULL,NULL),(626,1341,1,NULL,NULL),(627,1341,5,NULL,NULL),(628,1341,22,NULL,NULL),(629,1341,45,NULL,NULL),(630,1342,1,NULL,NULL),(631,1342,5,NULL,NULL),(632,1342,22,NULL,NULL),(633,1342,45,NULL,NULL),(634,1343,1,NULL,NULL),(635,1343,5,NULL,NULL),(636,1343,22,NULL,NULL),(637,1343,45,NULL,NULL),(638,1344,1,NULL,NULL),(639,1344,5,NULL,NULL),(640,1344,22,NULL,NULL),(641,1344,45,NULL,NULL),(642,1345,1,NULL,NULL),(643,1345,5,NULL,NULL),(644,1345,22,NULL,NULL),(645,1345,45,NULL,NULL),(646,1346,1,NULL,NULL),(647,1346,5,NULL,NULL),(648,1346,22,NULL,NULL),(649,1346,45,NULL,NULL),(650,1347,1,NULL,NULL),(651,1347,5,NULL,NULL),(652,1347,22,NULL,NULL),(653,1347,45,NULL,NULL),(654,1348,1,NULL,NULL),(655,1348,5,NULL,NULL),(656,1348,22,NULL,NULL),(657,1348,45,NULL,NULL),(658,1349,1,NULL,NULL),(659,1349,5,NULL,NULL),(660,1349,22,NULL,NULL),(661,1349,45,NULL,NULL),(662,1350,1,NULL,NULL),(663,1350,5,NULL,NULL),(664,1350,22,NULL,NULL),(665,1350,45,NULL,NULL),(666,1351,1,NULL,NULL),(667,1351,5,NULL,NULL),(668,1351,22,NULL,NULL),(669,1351,45,NULL,NULL),(670,1352,1,NULL,NULL),(671,1352,5,NULL,NULL),(672,1352,22,NULL,NULL),(673,1352,45,NULL,NULL),(674,1353,1,NULL,NULL),(675,1353,5,NULL,NULL),(676,1353,22,NULL,NULL),(677,1353,45,NULL,NULL),(678,1354,1,NULL,NULL),(679,1354,5,NULL,NULL),(680,1354,22,NULL,NULL),(681,1354,45,NULL,NULL),(682,1355,1,NULL,NULL),(683,1355,5,NULL,NULL),(684,1355,22,NULL,NULL),(685,1355,45,NULL,NULL),(686,1356,1,NULL,NULL),(687,1356,5,NULL,NULL),(688,1356,22,NULL,NULL),(689,1356,45,NULL,NULL),(690,1357,1,NULL,NULL),(691,1357,5,NULL,NULL),(692,1357,22,NULL,NULL),(693,1357,45,NULL,NULL),(694,1358,1,NULL,NULL),(695,1358,5,NULL,NULL),(696,1358,22,NULL,NULL),(697,1358,45,NULL,NULL),(698,1359,1,NULL,NULL),(699,1359,5,NULL,NULL),(700,1359,22,NULL,NULL),(701,1359,45,NULL,NULL),(702,1360,1,NULL,NULL),(703,1360,5,NULL,NULL),(704,1360,22,NULL,NULL),(705,1360,45,NULL,NULL),(706,1361,1,NULL,NULL),(707,1361,5,NULL,NULL),(708,1361,22,NULL,NULL),(709,1361,45,NULL,NULL),(710,1362,1,NULL,NULL),(711,1362,5,NULL,NULL),(712,1362,22,NULL,NULL),(713,1362,45,NULL,NULL),(714,1363,1,NULL,NULL),(715,1363,5,NULL,NULL),(716,1363,22,NULL,NULL),(717,1363,45,NULL,NULL),(718,1364,1,NULL,NULL),(719,1364,5,NULL,NULL),(720,1364,22,NULL,NULL),(721,1364,45,NULL,NULL),(722,1365,1,NULL,NULL),(723,1365,5,NULL,NULL),(724,1365,22,NULL,NULL),(725,1365,45,NULL,NULL),(726,1366,1,NULL,NULL),(727,1366,5,NULL,NULL),(728,1366,22,NULL,NULL),(729,1366,45,NULL,NULL),(730,1367,1,NULL,NULL),(731,1367,5,NULL,NULL),(732,1367,22,NULL,NULL),(733,1367,45,NULL,NULL),(734,1368,1,NULL,NULL),(735,1368,5,NULL,NULL),(736,1368,22,NULL,NULL),(737,1368,45,NULL,NULL),(738,1369,1,NULL,NULL),(739,1369,5,NULL,NULL),(740,1369,22,NULL,NULL),(741,1369,45,NULL,NULL),(742,1370,1,NULL,NULL),(743,1370,5,NULL,NULL),(744,1370,22,NULL,NULL),(745,1370,45,NULL,NULL),(746,1371,1,NULL,NULL),(747,1371,5,NULL,NULL),(748,1371,22,NULL,NULL),(749,1371,45,NULL,NULL),(750,1372,1,NULL,NULL),(751,1372,5,NULL,NULL),(752,1372,22,NULL,NULL),(753,1372,45,NULL,NULL),(754,1373,1,NULL,NULL),(755,1373,5,NULL,NULL),(756,1373,22,NULL,NULL),(757,1373,45,NULL,NULL),(758,1374,1,NULL,NULL),(759,1374,5,NULL,NULL),(760,1374,22,NULL,NULL),(761,1374,45,NULL,NULL),(762,1375,1,NULL,NULL),(763,1375,5,NULL,NULL),(764,1375,22,NULL,NULL),(765,1375,45,NULL,NULL),(766,1376,1,NULL,NULL),(767,1376,5,NULL,NULL),(768,1376,22,NULL,NULL),(769,1376,45,NULL,NULL),(770,1377,1,NULL,NULL),(771,1377,5,NULL,NULL),(772,1377,22,NULL,NULL),(773,1377,45,NULL,NULL),(774,1378,1,NULL,NULL),(775,1378,5,NULL,NULL),(776,1378,22,NULL,NULL),(777,1378,45,NULL,NULL),(778,1379,1,NULL,NULL),(779,1379,5,NULL,NULL),(780,1379,22,NULL,NULL),(781,1379,45,NULL,NULL),(782,1380,1,NULL,NULL),(783,1380,5,NULL,NULL),(784,1380,22,NULL,NULL),(785,1380,45,NULL,NULL),(786,1381,1,NULL,NULL),(787,1381,5,NULL,NULL),(788,1381,22,NULL,NULL),(789,1381,45,NULL,NULL),(790,1382,1,NULL,NULL),(791,1382,5,NULL,NULL),(792,1382,22,NULL,NULL),(793,1382,45,NULL,NULL),(794,1383,1,NULL,NULL),(795,1383,5,NULL,NULL),(796,1383,22,NULL,NULL),(797,1383,45,NULL,NULL),(798,1384,1,NULL,NULL),(799,1384,5,NULL,NULL),(800,1384,22,NULL,NULL),(801,1384,45,NULL,NULL),(802,1385,1,NULL,NULL),(803,1385,5,NULL,NULL),(804,1385,22,NULL,NULL),(805,1385,45,NULL,NULL),(806,1386,1,NULL,NULL),(807,1386,5,NULL,NULL),(808,1386,22,NULL,NULL),(809,1386,45,NULL,NULL),(810,1387,1,NULL,NULL),(811,1387,5,NULL,NULL),(812,1387,22,NULL,NULL),(813,1387,45,NULL,NULL),(814,1388,1,NULL,NULL),(815,1388,5,NULL,NULL),(816,1388,22,NULL,NULL),(817,1388,45,NULL,NULL),(818,1389,1,NULL,NULL),(819,1389,5,NULL,NULL),(820,1389,22,NULL,NULL),(821,1389,45,NULL,NULL),(822,1390,1,NULL,NULL),(823,1390,5,NULL,NULL),(824,1390,22,NULL,NULL),(825,1390,45,NULL,NULL),(826,1391,1,NULL,NULL),(827,1391,5,NULL,NULL),(828,1391,22,NULL,NULL),(829,1391,45,NULL,NULL),(830,1392,1,NULL,NULL),(831,1392,5,NULL,NULL),(832,1392,22,NULL,NULL),(833,1392,45,NULL,NULL),(834,1393,1,NULL,NULL),(835,1393,5,NULL,NULL),(836,1393,22,NULL,NULL),(837,1393,45,NULL,NULL),(838,1394,1,NULL,NULL),(839,1394,5,NULL,NULL),(840,1394,22,NULL,NULL),(841,1394,45,NULL,NULL),(842,1395,1,NULL,NULL),(843,1395,5,NULL,NULL),(844,1395,22,NULL,NULL),(845,1395,45,NULL,NULL),(846,1396,1,NULL,NULL),(847,1396,5,NULL,NULL),(848,1396,22,NULL,NULL),(849,1396,45,NULL,NULL),(850,1397,1,NULL,NULL),(851,1397,5,NULL,NULL),(852,1397,22,NULL,NULL),(853,1397,45,NULL,NULL),(854,1398,1,NULL,NULL),(855,1398,5,NULL,NULL),(856,1398,22,NULL,NULL),(857,1398,45,NULL,NULL),(858,1399,1,NULL,NULL),(859,1399,5,NULL,NULL),(860,1399,22,NULL,NULL),(861,1399,45,NULL,NULL),(862,1400,1,NULL,NULL),(863,1400,5,NULL,NULL),(864,1400,22,NULL,NULL),(865,1400,45,NULL,NULL),(866,1401,1,NULL,NULL),(867,1401,5,NULL,NULL),(868,1401,22,NULL,NULL),(869,1401,45,NULL,NULL),(870,1402,1,NULL,NULL),(871,1402,5,NULL,NULL),(872,1402,22,NULL,NULL),(873,1402,45,NULL,NULL),(874,1403,1,NULL,NULL),(875,1403,5,NULL,NULL),(876,1403,22,NULL,NULL),(877,1403,45,NULL,NULL),(878,1404,1,NULL,NULL),(879,1404,5,NULL,NULL),(880,1404,22,NULL,NULL),(881,1404,45,NULL,NULL),(882,1405,1,NULL,NULL),(883,1405,5,NULL,NULL),(884,1405,22,NULL,NULL),(885,1405,45,NULL,NULL),(886,1406,1,NULL,NULL),(887,1406,5,NULL,NULL),(888,1406,22,NULL,NULL),(889,1406,45,NULL,NULL),(890,1407,1,NULL,NULL),(891,1407,5,NULL,NULL),(892,1407,22,NULL,NULL),(893,1407,45,NULL,NULL),(894,1408,1,NULL,NULL),(895,1408,5,NULL,NULL),(896,1408,22,NULL,NULL),(897,1408,45,NULL,NULL),(898,1409,1,NULL,NULL),(899,1409,5,NULL,NULL),(900,1409,22,NULL,NULL),(901,1409,45,NULL,NULL),(902,1410,1,NULL,NULL),(903,1410,5,NULL,NULL),(904,1410,22,NULL,NULL),(905,1410,45,NULL,NULL),(906,1411,1,NULL,NULL),(907,1411,5,NULL,NULL),(908,1411,22,NULL,NULL),(909,1411,45,NULL,NULL),(910,1412,1,NULL,NULL),(911,1412,5,NULL,NULL),(912,1412,22,NULL,NULL),(913,1412,45,NULL,NULL),(914,1413,1,NULL,NULL),(915,1413,5,NULL,NULL),(916,1413,22,NULL,NULL),(917,1413,45,NULL,NULL),(918,1414,1,NULL,NULL),(919,1414,5,NULL,NULL),(920,1414,22,NULL,NULL),(921,1414,45,NULL,NULL),(922,1415,1,NULL,NULL),(923,1415,5,NULL,NULL),(924,1415,22,NULL,NULL),(925,1415,45,NULL,NULL),(926,1416,1,NULL,NULL),(927,1416,5,NULL,NULL),(928,1416,22,NULL,NULL),(929,1416,45,NULL,NULL),(930,1417,1,NULL,NULL),(931,1417,5,NULL,NULL),(932,1417,22,NULL,NULL),(933,1417,45,NULL,NULL),(934,1418,1,NULL,NULL),(935,1418,5,NULL,NULL),(936,1418,22,NULL,NULL),(937,1418,45,NULL,NULL),(938,1419,1,NULL,NULL),(939,1419,5,NULL,NULL),(940,1419,22,NULL,NULL),(941,1419,45,NULL,NULL),(942,1420,1,NULL,NULL),(943,1420,5,NULL,NULL),(944,1420,22,NULL,NULL),(945,1420,45,NULL,NULL),(946,1421,1,NULL,NULL),(947,1421,5,NULL,NULL),(948,1421,22,NULL,NULL),(949,1421,45,NULL,NULL),(950,1422,1,NULL,NULL),(951,1422,5,NULL,NULL),(952,1422,22,NULL,NULL),(953,1422,45,NULL,NULL),(954,1423,1,NULL,NULL),(955,1423,5,NULL,NULL),(956,1423,22,NULL,NULL),(957,1423,45,NULL,NULL),(958,1424,1,NULL,NULL),(959,1424,5,NULL,NULL),(960,1424,22,NULL,NULL),(961,1424,45,NULL,NULL),(962,1425,1,NULL,NULL),(963,1425,5,NULL,NULL),(964,1425,22,NULL,NULL),(965,1425,45,NULL,NULL),(966,1426,1,NULL,NULL),(967,1426,5,NULL,NULL),(968,1426,22,NULL,NULL),(969,1426,45,NULL,NULL),(970,1427,1,NULL,NULL),(971,1427,5,NULL,NULL),(972,1427,22,NULL,NULL),(973,1427,45,NULL,NULL),(974,1428,1,NULL,NULL),(975,1428,5,NULL,NULL),(976,1428,22,NULL,NULL),(977,1428,45,NULL,NULL),(978,1429,1,NULL,NULL),(979,1429,5,NULL,NULL),(980,1429,22,NULL,NULL),(981,1429,45,NULL,NULL),(982,1430,1,NULL,NULL),(983,1430,5,NULL,NULL),(984,1430,22,NULL,NULL),(985,1430,45,NULL,NULL),(986,1431,1,NULL,NULL),(987,1431,5,NULL,NULL),(988,1431,22,NULL,NULL),(989,1431,45,NULL,NULL),(990,1432,1,NULL,NULL),(991,1432,5,NULL,NULL),(992,1432,22,NULL,NULL),(993,1432,45,NULL,NULL),(994,1433,1,NULL,NULL),(995,1433,5,NULL,NULL),(996,1433,22,NULL,NULL),(997,1433,45,NULL,NULL),(998,1434,1,NULL,NULL),(999,1434,5,NULL,NULL),(1000,1434,22,NULL,NULL),(1001,1434,45,NULL,NULL),(1002,1435,1,NULL,NULL),(1003,1435,5,NULL,NULL),(1004,1435,22,NULL,NULL),(1005,1435,45,NULL,NULL),(1006,1436,1,NULL,NULL),(1007,1436,5,NULL,NULL),(1008,1436,22,NULL,NULL),(1009,1436,45,NULL,NULL),(1010,1437,1,NULL,NULL),(1011,1437,5,NULL,NULL),(1012,1437,22,NULL,NULL),(1013,1437,45,NULL,NULL),(1014,1438,1,NULL,NULL),(1015,1438,5,NULL,NULL),(1016,1438,22,NULL,NULL),(1017,1438,45,NULL,NULL),(1018,1439,1,NULL,NULL),(1019,1439,5,NULL,NULL),(1020,1439,22,NULL,NULL),(1021,1439,45,NULL,NULL),(1022,1440,1,NULL,NULL),(1023,1440,5,NULL,NULL),(1024,1440,22,NULL,NULL),(1025,1440,45,NULL,NULL),(1026,1441,1,NULL,NULL),(1027,1441,5,NULL,NULL),(1028,1441,22,NULL,NULL),(1029,1441,45,NULL,NULL),(1030,1442,1,NULL,NULL),(1031,1442,5,NULL,NULL),(1032,1442,22,NULL,NULL),(1033,1442,45,NULL,NULL),(1034,1443,1,NULL,NULL),(1035,1443,5,NULL,NULL),(1036,1443,22,NULL,NULL),(1037,1443,45,NULL,NULL),(1038,1444,1,NULL,NULL),(1039,1444,5,NULL,NULL),(1040,1444,22,NULL,NULL),(1041,1444,45,NULL,NULL),(1042,1445,1,NULL,NULL),(1043,1445,5,NULL,NULL),(1044,1445,22,NULL,NULL),(1045,1445,45,NULL,NULL),(1046,1446,1,NULL,NULL),(1047,1446,5,NULL,NULL),(1048,1446,22,NULL,NULL),(1049,1446,45,NULL,NULL),(1050,1447,1,NULL,NULL),(1051,1447,5,NULL,NULL),(1052,1447,22,NULL,NULL),(1053,1447,45,NULL,NULL),(1054,1448,1,NULL,NULL),(1055,1448,5,NULL,NULL),(1056,1448,22,NULL,NULL),(1057,1448,45,NULL,NULL),(1058,1449,1,NULL,NULL),(1059,1449,5,NULL,NULL),(1060,1449,22,NULL,NULL),(1061,1449,45,NULL,NULL),(1062,1450,1,NULL,NULL),(1063,1450,5,NULL,NULL),(1064,1450,22,NULL,NULL),(1065,1450,45,NULL,NULL),(1066,1451,1,NULL,NULL),(1067,1451,5,NULL,NULL),(1068,1451,22,NULL,NULL),(1069,1451,45,NULL,NULL),(1070,1452,1,NULL,NULL),(1071,1452,5,NULL,NULL),(1072,1452,22,NULL,NULL),(1073,1452,45,NULL,NULL),(1074,1453,1,NULL,NULL),(1075,1453,5,NULL,NULL),(1076,1453,22,NULL,NULL),(1077,1453,45,NULL,NULL),(1078,1454,1,NULL,NULL),(1079,1454,5,NULL,NULL),(1080,1454,22,NULL,NULL),(1081,1454,45,NULL,NULL),(1082,1455,1,NULL,NULL),(1083,1455,5,NULL,NULL),(1084,1455,22,NULL,NULL),(1085,1455,45,NULL,NULL),(1086,1456,1,NULL,NULL),(1087,1456,5,NULL,NULL),(1088,1456,22,NULL,NULL),(1089,1456,45,NULL,NULL),(1090,1457,1,NULL,NULL),(1091,1457,5,NULL,NULL),(1092,1457,22,NULL,NULL),(1093,1457,45,NULL,NULL),(1094,1458,1,NULL,NULL),(1095,1458,5,NULL,NULL),(1096,1458,22,NULL,NULL),(1097,1458,45,NULL,NULL),(1098,1459,1,NULL,NULL),(1099,1459,5,NULL,NULL),(1100,1459,22,NULL,NULL),(1101,1459,45,NULL,NULL),(1102,1460,1,NULL,NULL),(1103,1460,5,NULL,NULL),(1104,1460,22,NULL,NULL),(1105,1460,45,NULL,NULL),(1106,1461,1,NULL,NULL),(1107,1461,5,NULL,NULL),(1108,1461,22,NULL,NULL),(1109,1461,45,NULL,NULL),(1110,1462,1,NULL,NULL),(1111,1462,5,NULL,NULL),(1112,1462,22,NULL,NULL),(1113,1462,45,NULL,NULL),(1114,1463,1,NULL,NULL),(1115,1463,5,NULL,NULL),(1116,1463,22,NULL,NULL),(1117,1463,45,NULL,NULL),(1118,1464,1,NULL,NULL),(1119,1464,5,NULL,NULL),(1120,1464,22,NULL,NULL),(1121,1464,45,NULL,NULL),(1122,1465,1,NULL,NULL),(1123,1465,5,NULL,NULL),(1124,1465,22,NULL,NULL),(1125,1465,45,NULL,NULL),(1126,1466,1,NULL,NULL),(1127,1466,5,NULL,NULL),(1128,1466,22,NULL,NULL),(1129,1466,45,NULL,NULL),(1130,1467,1,NULL,NULL),(1131,1467,5,NULL,NULL),(1132,1467,22,NULL,NULL),(1133,1467,45,NULL,NULL),(1134,1468,1,NULL,NULL),(1135,1468,5,NULL,NULL),(1136,1468,22,NULL,NULL),(1137,1468,45,NULL,NULL),(1138,1469,1,NULL,NULL),(1139,1469,5,NULL,NULL),(1140,1469,22,NULL,NULL),(1141,1469,45,NULL,NULL),(1142,1470,1,NULL,NULL),(1143,1470,5,NULL,NULL),(1144,1470,22,NULL,NULL),(1145,1470,45,NULL,NULL),(1146,1471,1,NULL,NULL),(1147,1471,5,NULL,NULL),(1148,1471,22,NULL,NULL),(1149,1471,45,NULL,NULL),(1150,1472,1,NULL,NULL),(1151,1472,5,NULL,NULL),(1152,1472,22,NULL,NULL),(1153,1472,45,NULL,NULL),(1154,1473,1,NULL,NULL),(1155,1473,5,NULL,NULL),(1156,1473,22,NULL,NULL),(1157,1473,45,NULL,NULL),(1158,1474,1,NULL,NULL),(1159,1474,5,NULL,NULL),(1160,1474,22,NULL,NULL),(1161,1474,45,NULL,NULL),(1162,1475,1,NULL,NULL),(1163,1475,5,NULL,NULL),(1164,1475,22,NULL,NULL),(1165,1475,45,NULL,NULL),(1166,1476,1,NULL,NULL),(1167,1476,5,NULL,NULL),(1168,1476,22,NULL,NULL),(1169,1476,45,NULL,NULL),(1170,1477,1,NULL,NULL),(1171,1477,5,NULL,NULL),(1172,1477,22,NULL,NULL),(1173,1477,45,NULL,NULL),(1174,1478,1,NULL,NULL),(1175,1478,5,NULL,NULL),(1176,1478,22,NULL,NULL),(1177,1478,45,NULL,NULL),(1178,1479,1,NULL,NULL),(1179,1479,5,NULL,NULL),(1180,1479,22,NULL,NULL),(1181,1479,45,NULL,NULL),(1182,1480,1,NULL,NULL),(1183,1480,5,NULL,NULL),(1184,1480,22,NULL,NULL),(1185,1480,45,NULL,NULL),(1186,1481,1,NULL,NULL),(1187,1481,5,NULL,NULL),(1188,1481,22,NULL,NULL),(1189,1481,45,NULL,NULL),(1190,1482,1,NULL,NULL),(1191,1482,5,NULL,NULL),(1192,1482,22,NULL,NULL),(1193,1482,45,NULL,NULL),(1194,1483,1,NULL,NULL),(1195,1483,5,NULL,NULL),(1196,1483,22,NULL,NULL),(1197,1483,45,NULL,NULL),(1198,1484,1,NULL,NULL),(1199,1484,5,NULL,NULL),(1200,1484,22,NULL,NULL),(1201,1484,45,NULL,NULL),(1202,1485,1,NULL,NULL),(1203,1485,5,NULL,NULL),(1204,1485,22,NULL,NULL),(1205,1485,45,NULL,NULL),(1206,1486,1,NULL,NULL),(1207,1486,5,NULL,NULL),(1208,1486,22,NULL,NULL),(1209,1486,45,NULL,NULL),(1210,1487,1,NULL,NULL),(1211,1487,5,NULL,NULL),(1212,1487,22,NULL,NULL),(1213,1487,45,NULL,NULL),(1214,1488,1,NULL,NULL),(1215,1488,5,NULL,NULL),(1216,1488,22,NULL,NULL),(1217,1488,45,NULL,NULL),(1218,1489,1,NULL,NULL),(1219,1489,5,NULL,NULL),(1220,1489,22,NULL,NULL),(1221,1489,45,NULL,NULL),(1222,1490,1,NULL,NULL),(1223,1490,5,NULL,NULL),(1224,1490,22,NULL,NULL),(1225,1490,45,NULL,NULL),(1226,1491,1,NULL,NULL),(1227,1491,5,NULL,NULL),(1228,1491,22,NULL,NULL),(1229,1491,45,NULL,NULL),(1230,1492,1,NULL,NULL),(1231,1492,5,NULL,NULL),(1232,1492,22,NULL,NULL),(1233,1492,45,NULL,NULL),(1234,1493,1,NULL,NULL),(1235,1493,5,NULL,NULL),(1236,1493,22,NULL,NULL),(1237,1493,45,NULL,NULL),(1238,1494,1,NULL,NULL),(1239,1494,5,NULL,NULL),(1240,1494,22,NULL,NULL),(1241,1494,45,NULL,NULL),(1242,1495,1,NULL,NULL),(1243,1495,5,NULL,NULL),(1244,1495,22,NULL,NULL),(1245,1495,45,NULL,NULL),(1246,1496,1,NULL,NULL),(1247,1496,5,NULL,NULL),(1248,1496,22,NULL,NULL),(1249,1496,45,NULL,NULL),(1250,1497,1,NULL,NULL),(1251,1497,5,NULL,NULL),(1252,1497,22,NULL,NULL),(1253,1497,45,NULL,NULL),(1254,1498,1,NULL,NULL),(1255,1498,5,NULL,NULL),(1256,1498,22,NULL,NULL),(1257,1498,45,NULL,NULL),(1258,1499,1,NULL,NULL),(1259,1499,5,NULL,NULL),(1260,1499,22,NULL,NULL),(1261,1499,45,NULL,NULL),(1262,1500,1,NULL,NULL),(1263,1500,5,NULL,NULL),(1264,1500,22,NULL,NULL),(1265,1500,45,NULL,NULL),(1266,1501,1,NULL,NULL),(1267,1501,5,NULL,NULL),(1268,1501,22,NULL,NULL),(1269,1501,45,NULL,NULL),(1270,1502,1,NULL,NULL),(1271,1502,5,NULL,NULL),(1272,1502,22,NULL,NULL),(1273,1502,45,NULL,NULL),(1274,1503,1,NULL,NULL),(1275,1503,5,NULL,NULL),(1276,1503,22,NULL,NULL),(1277,1503,45,NULL,NULL),(1278,1504,1,NULL,NULL),(1279,1504,5,NULL,NULL),(1280,1504,22,NULL,NULL),(1281,1504,45,NULL,NULL),(1282,1505,1,NULL,NULL),(1283,1505,5,NULL,NULL),(1284,1505,22,NULL,NULL),(1285,1505,45,NULL,NULL),(1286,1506,1,NULL,NULL),(1287,1506,5,NULL,NULL),(1288,1506,22,NULL,NULL),(1289,1506,45,NULL,NULL),(1290,1507,1,NULL,NULL),(1291,1507,5,NULL,NULL),(1292,1507,22,NULL,NULL),(1293,1507,45,NULL,NULL),(1294,1508,1,NULL,NULL),(1295,1508,5,NULL,NULL),(1296,1508,22,NULL,NULL),(1297,1508,45,NULL,NULL),(1298,1509,1,NULL,NULL),(1299,1509,5,NULL,NULL),(1300,1509,22,NULL,NULL),(1301,1509,45,NULL,NULL),(1302,1510,1,NULL,NULL),(1303,1510,5,NULL,NULL),(1304,1510,22,NULL,NULL),(1305,1510,45,NULL,NULL),(1306,1511,1,NULL,NULL),(1307,1511,5,NULL,NULL),(1308,1511,22,NULL,NULL),(1309,1511,45,NULL,NULL),(1310,1512,1,NULL,NULL),(1311,1512,5,NULL,NULL),(1312,1512,22,NULL,NULL),(1313,1512,45,NULL,NULL),(1314,1513,1,NULL,NULL),(1315,1513,5,NULL,NULL),(1316,1513,22,NULL,NULL),(1317,1513,45,NULL,NULL),(1318,1514,1,NULL,NULL),(1319,1514,5,NULL,NULL),(1320,1514,22,NULL,NULL),(1321,1514,45,NULL,NULL),(1322,1515,1,NULL,NULL),(1323,1515,5,NULL,NULL),(1324,1515,22,NULL,NULL),(1325,1515,45,NULL,NULL),(1326,1516,1,NULL,NULL),(1327,1516,5,NULL,NULL),(1328,1516,22,NULL,NULL),(1329,1516,45,NULL,NULL),(1330,1517,1,NULL,NULL),(1331,1517,5,NULL,NULL),(1332,1517,22,NULL,NULL),(1333,1517,45,NULL,NULL),(1334,1518,1,NULL,NULL),(1335,1518,5,NULL,NULL),(1336,1518,22,NULL,NULL),(1337,1518,45,NULL,NULL),(1338,1519,1,NULL,NULL),(1339,1519,5,NULL,NULL),(1340,1519,22,NULL,NULL),(1341,1519,45,NULL,NULL),(1342,1520,1,NULL,NULL),(1343,1520,5,NULL,NULL),(1344,1520,22,NULL,NULL),(1345,1520,45,NULL,NULL),(1346,1521,1,NULL,NULL),(1347,1521,5,NULL,NULL),(1348,1521,22,NULL,NULL),(1349,1521,45,NULL,NULL),(1350,1522,1,NULL,NULL),(1351,1522,5,NULL,NULL),(1352,1522,22,NULL,NULL),(1353,1522,45,NULL,NULL),(1354,1523,1,NULL,NULL),(1355,1523,5,NULL,NULL),(1356,1523,22,NULL,NULL),(1357,1523,45,NULL,NULL),(1358,1524,1,NULL,NULL),(1359,1524,5,NULL,NULL),(1360,1524,22,NULL,NULL),(1361,1524,45,NULL,NULL),(1362,1525,1,NULL,NULL),(1363,1525,5,NULL,NULL),(1364,1525,22,NULL,NULL),(1365,1525,45,NULL,NULL),(1366,1526,1,NULL,NULL),(1367,1526,5,NULL,NULL),(1368,1526,22,NULL,NULL),(1369,1526,45,NULL,NULL),(1370,1527,1,NULL,NULL),(1371,1527,5,NULL,NULL),(1372,1527,22,NULL,NULL),(1373,1527,45,NULL,NULL),(1374,1528,1,NULL,NULL),(1375,1528,5,NULL,NULL),(1376,1528,22,NULL,NULL),(1377,1528,45,NULL,NULL),(1378,1529,1,NULL,NULL),(1379,1529,5,NULL,NULL),(1380,1529,22,NULL,NULL),(1381,1529,45,NULL,NULL),(1382,1530,1,NULL,NULL),(1383,1530,5,NULL,NULL),(1384,1530,22,NULL,NULL),(1385,1530,45,NULL,NULL),(1386,1531,1,NULL,NULL),(1387,1531,5,NULL,NULL),(1388,1531,22,NULL,NULL),(1389,1531,45,NULL,NULL),(1390,1532,1,NULL,NULL),(1391,1532,5,NULL,NULL),(1392,1532,22,NULL,NULL),(1393,1532,45,NULL,NULL),(1394,1533,1,NULL,NULL),(1395,1533,5,NULL,NULL),(1396,1533,22,NULL,NULL),(1397,1533,45,NULL,NULL),(1398,1534,1,NULL,NULL),(1399,1534,5,NULL,NULL),(1400,1534,22,NULL,NULL),(1401,1534,45,NULL,NULL),(1402,1535,1,NULL,NULL),(1403,1535,5,NULL,NULL),(1404,1535,22,NULL,NULL),(1405,1535,45,NULL,NULL),(1406,1536,1,NULL,NULL),(1407,1536,5,NULL,NULL),(1408,1536,22,NULL,NULL),(1409,1536,45,NULL,NULL),(1410,1537,1,NULL,NULL),(1411,1537,5,NULL,NULL),(1412,1537,22,NULL,NULL),(1413,1537,45,NULL,NULL),(1414,1538,1,NULL,NULL),(1415,1538,5,NULL,NULL),(1416,1538,22,NULL,NULL),(1417,1538,45,NULL,NULL),(1418,1539,1,NULL,NULL),(1419,1539,5,NULL,NULL),(1420,1539,22,NULL,NULL),(1421,1539,45,NULL,NULL),(1422,1540,1,NULL,NULL),(1423,1540,5,NULL,NULL),(1424,1540,22,NULL,NULL),(1425,1540,45,NULL,NULL),(1426,1541,1,NULL,NULL),(1427,1541,5,NULL,NULL),(1428,1541,22,NULL,NULL),(1429,1541,45,NULL,NULL),(1430,1542,1,NULL,NULL),(1431,1542,5,NULL,NULL),(1432,1542,22,NULL,NULL),(1433,1542,45,NULL,NULL),(1434,1543,1,NULL,NULL),(1435,1543,5,NULL,NULL),(1436,1543,22,NULL,NULL),(1437,1543,45,NULL,NULL),(1438,1544,1,NULL,NULL),(1439,1544,5,NULL,NULL),(1440,1544,22,NULL,NULL),(1441,1544,45,NULL,NULL),(1442,1545,1,NULL,NULL),(1443,1545,5,NULL,NULL),(1444,1545,22,NULL,NULL),(1445,1545,45,NULL,NULL),(1446,1546,1,NULL,NULL),(1447,1546,5,NULL,NULL),(1448,1546,22,NULL,NULL),(1449,1546,45,NULL,NULL),(1450,1547,1,NULL,NULL),(1451,1547,5,NULL,NULL),(1452,1547,22,NULL,NULL),(1453,1547,45,NULL,NULL),(1454,1548,1,NULL,NULL),(1455,1548,5,NULL,NULL),(1456,1548,22,NULL,NULL),(1457,1548,45,NULL,NULL),(1458,1549,1,NULL,NULL),(1459,1549,5,NULL,NULL),(1460,1549,22,NULL,NULL),(1461,1549,45,NULL,NULL),(1462,1550,1,NULL,NULL),(1463,1550,5,NULL,NULL),(1464,1550,22,NULL,NULL),(1465,1550,45,NULL,NULL),(1466,1551,1,NULL,NULL),(1467,1551,5,NULL,NULL),(1468,1551,22,NULL,NULL),(1469,1551,45,NULL,NULL),(1470,1552,1,NULL,NULL),(1471,1552,5,NULL,NULL),(1472,1552,22,NULL,NULL),(1473,1552,45,NULL,NULL),(1474,1553,1,NULL,NULL),(1475,1553,5,NULL,NULL),(1476,1553,22,NULL,NULL),(1477,1553,45,NULL,NULL),(1478,1554,1,NULL,NULL),(1479,1554,5,NULL,NULL),(1480,1554,22,NULL,NULL),(1481,1554,45,NULL,NULL),(1482,1555,1,NULL,NULL),(1483,1555,5,NULL,NULL),(1484,1555,22,NULL,NULL),(1485,1555,45,NULL,NULL),(1486,1556,1,NULL,NULL),(1487,1556,5,NULL,NULL),(1488,1556,22,NULL,NULL),(1489,1556,45,NULL,NULL),(1490,1557,1,NULL,NULL),(1491,1557,5,NULL,NULL),(1492,1557,22,NULL,NULL),(1493,1557,45,NULL,NULL),(1494,1558,1,NULL,NULL),(1495,1558,5,NULL,NULL),(1496,1558,22,NULL,NULL),(1497,1558,45,NULL,NULL),(1498,1559,1,NULL,NULL),(1499,1559,5,NULL,NULL),(1500,1559,22,NULL,NULL),(1501,1559,45,NULL,NULL),(1502,1560,1,NULL,NULL),(1503,1560,5,NULL,NULL),(1504,1560,22,NULL,NULL),(1505,1560,45,NULL,NULL),(1506,1561,1,NULL,NULL),(1507,1561,5,NULL,NULL),(1508,1561,22,NULL,NULL),(1509,1561,45,NULL,NULL),(1510,1562,1,NULL,NULL),(1511,1562,5,NULL,NULL),(1512,1562,22,NULL,NULL),(1513,1562,45,NULL,NULL),(1514,1563,1,NULL,NULL),(1515,1563,5,NULL,NULL),(1516,1563,22,NULL,NULL),(1517,1563,45,NULL,NULL),(1518,1564,1,NULL,NULL),(1519,1564,5,NULL,NULL),(1520,1564,22,NULL,NULL),(1521,1564,45,NULL,NULL),(1522,1565,1,NULL,NULL),(1523,1565,5,NULL,NULL),(1524,1565,22,NULL,NULL),(1525,1565,45,NULL,NULL),(1526,1566,1,NULL,NULL),(1527,1566,5,NULL,NULL),(1528,1566,22,NULL,NULL),(1529,1566,45,NULL,NULL),(1530,1567,1,NULL,NULL),(1531,1567,5,NULL,NULL),(1532,1567,22,NULL,NULL),(1533,1567,45,NULL,NULL),(1534,1568,1,NULL,NULL),(1535,1568,5,NULL,NULL),(1536,1568,22,NULL,NULL),(1537,1568,45,NULL,NULL),(1538,1569,1,NULL,NULL),(1539,1569,5,NULL,NULL),(1540,1569,22,NULL,NULL),(1541,1569,45,NULL,NULL),(1542,1570,1,NULL,NULL),(1543,1570,5,NULL,NULL),(1544,1570,22,NULL,NULL),(1545,1570,45,NULL,NULL),(1546,1571,1,NULL,NULL),(1547,1571,5,NULL,NULL),(1548,1571,22,NULL,NULL),(1549,1571,45,NULL,NULL),(1550,1572,1,NULL,NULL),(1551,1572,5,NULL,NULL),(1552,1572,22,NULL,NULL),(1553,1572,45,NULL,NULL),(1554,1573,1,NULL,NULL),(1555,1573,5,NULL,NULL),(1556,1573,22,NULL,NULL),(1557,1573,45,NULL,NULL),(1558,1574,1,NULL,NULL),(1559,1574,5,NULL,NULL),(1560,1574,22,NULL,NULL),(1561,1574,45,NULL,NULL),(1562,1575,1,NULL,NULL),(1563,1575,5,NULL,NULL),(1564,1575,22,NULL,NULL),(1565,1575,45,NULL,NULL),(1566,1576,1,NULL,NULL),(1567,1576,5,NULL,NULL),(1568,1576,22,NULL,NULL),(1569,1576,45,NULL,NULL),(1570,1577,1,NULL,NULL),(1571,1577,5,NULL,NULL),(1572,1577,22,NULL,NULL),(1573,1577,45,NULL,NULL),(1574,1578,1,NULL,NULL),(1575,1578,5,NULL,NULL),(1576,1578,22,NULL,NULL),(1577,1578,45,NULL,NULL),(1578,1579,1,NULL,NULL),(1579,1579,5,NULL,NULL),(1580,1579,22,NULL,NULL),(1581,1579,45,NULL,NULL),(1582,1580,1,NULL,NULL),(1583,1580,5,NULL,NULL),(1584,1580,22,NULL,NULL),(1585,1580,45,NULL,NULL),(1586,1581,1,NULL,NULL),(1587,1581,5,NULL,NULL),(1588,1581,22,NULL,NULL),(1589,1581,45,NULL,NULL),(1590,1582,1,NULL,NULL),(1591,1582,5,NULL,NULL),(1592,1582,22,NULL,NULL),(1593,1582,45,NULL,NULL),(1594,1583,1,NULL,NULL),(1595,1583,5,NULL,NULL),(1596,1583,22,NULL,NULL),(1597,1583,45,NULL,NULL),(1598,1584,1,NULL,NULL),(1599,1584,5,NULL,NULL),(1600,1584,22,NULL,NULL),(1601,1584,45,NULL,NULL),(1602,1585,1,NULL,NULL),(1603,1585,5,NULL,NULL),(1604,1585,22,NULL,NULL),(1605,1585,45,NULL,NULL),(1606,1586,1,NULL,NULL),(1607,1586,5,NULL,NULL),(1608,1586,22,NULL,NULL),(1609,1586,45,NULL,NULL),(1610,1587,1,NULL,NULL),(1611,1587,5,NULL,NULL),(1612,1587,22,NULL,NULL),(1613,1587,45,NULL,NULL),(1614,1588,1,NULL,NULL),(1615,1588,5,NULL,NULL),(1616,1588,22,NULL,NULL),(1617,1588,45,NULL,NULL),(1618,1589,1,NULL,NULL),(1619,1589,5,NULL,NULL),(1620,1589,22,NULL,NULL),(1621,1589,45,NULL,NULL),(1622,1590,1,NULL,NULL),(1623,1590,5,NULL,NULL),(1624,1590,22,NULL,NULL),(1625,1590,45,NULL,NULL),(1626,1591,1,NULL,NULL),(1627,1591,5,NULL,NULL),(1628,1591,22,NULL,NULL),(1629,1591,45,NULL,NULL),(1630,1592,1,NULL,NULL),(1631,1592,5,NULL,NULL),(1632,1592,22,NULL,NULL),(1633,1592,45,NULL,NULL),(1634,1593,1,NULL,NULL),(1635,1593,5,NULL,NULL),(1636,1593,22,NULL,NULL),(1637,1593,45,NULL,NULL),(1638,1594,1,NULL,NULL),(1639,1594,5,NULL,NULL),(1640,1594,22,NULL,NULL),(1641,1594,45,NULL,NULL),(1642,1595,1,NULL,NULL),(1643,1595,5,NULL,NULL),(1644,1595,22,NULL,NULL),(1645,1595,45,NULL,NULL),(1646,1596,1,NULL,NULL),(1647,1596,5,NULL,NULL),(1648,1596,22,NULL,NULL),(1649,1596,45,NULL,NULL),(1650,1597,1,NULL,NULL),(1651,1597,5,NULL,NULL),(1652,1597,22,NULL,NULL),(1653,1597,45,NULL,NULL),(1654,1598,1,NULL,NULL),(1655,1598,5,NULL,NULL),(1656,1598,22,NULL,NULL),(1657,1598,45,NULL,NULL),(1658,1599,1,NULL,NULL),(1659,1599,5,NULL,NULL),(1660,1599,22,NULL,NULL),(1661,1599,45,NULL,NULL),(1662,1600,1,NULL,NULL),(1663,1600,5,NULL,NULL),(1664,1600,22,NULL,NULL),(1665,1600,45,NULL,NULL),(1666,1601,1,NULL,NULL),(1667,1601,5,NULL,NULL),(1668,1601,22,NULL,NULL),(1669,1601,45,NULL,NULL),(1670,1602,1,NULL,NULL),(1671,1602,5,NULL,NULL),(1672,1602,22,NULL,NULL),(1673,1602,45,NULL,NULL),(1674,1603,1,NULL,NULL),(1675,1603,5,NULL,NULL),(1676,1603,22,NULL,NULL),(1677,1603,45,NULL,NULL),(1678,1604,1,NULL,NULL),(1679,1604,5,NULL,NULL),(1680,1604,22,NULL,NULL),(1681,1604,45,NULL,NULL),(1682,1605,1,NULL,NULL),(1683,1605,5,NULL,NULL),(1684,1605,22,NULL,NULL),(1685,1605,45,NULL,NULL),(1686,1606,1,NULL,NULL),(1687,1606,5,NULL,NULL),(1688,1606,22,NULL,NULL),(1689,1606,45,NULL,NULL),(1690,1607,1,NULL,NULL),(1691,1607,5,NULL,NULL),(1692,1607,22,NULL,NULL),(1693,1607,45,NULL,NULL),(1694,1608,1,NULL,NULL),(1695,1608,5,NULL,NULL),(1696,1608,22,NULL,NULL),(1697,1608,45,NULL,NULL),(1698,1609,1,NULL,NULL),(1699,1609,5,NULL,NULL),(1700,1609,22,NULL,NULL),(1701,1609,45,NULL,NULL),(1702,1610,1,NULL,NULL),(1703,1610,5,NULL,NULL),(1704,1610,22,NULL,NULL),(1705,1610,45,NULL,NULL),(1706,1611,1,NULL,NULL),(1707,1611,5,NULL,NULL),(1708,1611,22,NULL,NULL),(1709,1611,45,NULL,NULL),(1710,1612,1,NULL,NULL),(1711,1612,5,NULL,NULL),(1712,1612,22,NULL,NULL),(1713,1612,45,NULL,NULL),(1714,1613,1,NULL,NULL),(1715,1613,5,NULL,NULL),(1716,1613,22,NULL,NULL),(1717,1613,45,NULL,NULL),(1718,1614,1,NULL,NULL),(1719,1614,5,NULL,NULL),(1720,1614,22,NULL,NULL),(1721,1614,45,NULL,NULL),(1722,1615,1,NULL,NULL),(1723,1615,5,NULL,NULL),(1724,1615,22,NULL,NULL),(1725,1615,45,NULL,NULL),(1726,1616,1,NULL,NULL),(1727,1616,5,NULL,NULL),(1728,1616,22,NULL,NULL),(1729,1616,45,NULL,NULL),(1730,1617,1,NULL,NULL),(1731,1617,5,NULL,NULL),(1732,1617,22,NULL,NULL),(1733,1617,45,NULL,NULL),(1734,1618,1,NULL,NULL),(1735,1618,5,NULL,NULL),(1736,1618,22,NULL,NULL),(1737,1618,45,NULL,NULL),(1738,1619,1,NULL,NULL),(1739,1619,5,NULL,NULL),(1740,1619,22,NULL,NULL),(1741,1619,45,NULL,NULL),(1742,1620,1,NULL,NULL),(1743,1620,5,NULL,NULL),(1744,1620,22,NULL,NULL),(1745,1620,45,NULL,NULL),(1746,1621,1,NULL,NULL),(1747,1621,5,NULL,NULL),(1748,1621,22,NULL,NULL),(1749,1621,45,NULL,NULL),(1750,1622,1,NULL,NULL),(1751,1622,5,NULL,NULL),(1752,1622,22,NULL,NULL),(1753,1622,45,NULL,NULL),(1754,1623,1,NULL,NULL),(1755,1623,5,NULL,NULL),(1756,1623,22,NULL,NULL),(1757,1623,45,NULL,NULL),(1758,1624,1,NULL,NULL),(1759,1624,5,NULL,NULL),(1760,1624,22,NULL,NULL),(1761,1624,45,NULL,NULL),(1762,1625,1,NULL,NULL),(1763,1625,5,NULL,NULL),(1764,1625,22,NULL,NULL),(1765,1625,45,NULL,NULL),(1766,1626,1,NULL,NULL),(1767,1626,5,NULL,NULL),(1768,1626,22,NULL,NULL),(1769,1626,45,NULL,NULL),(1770,1627,1,NULL,NULL),(1771,1627,5,NULL,NULL),(1772,1627,22,NULL,NULL),(1773,1627,45,NULL,NULL),(1774,1628,1,NULL,NULL),(1775,1628,5,NULL,NULL),(1776,1628,22,NULL,NULL),(1777,1628,45,NULL,NULL),(1778,1629,1,NULL,NULL),(1779,1629,5,NULL,NULL),(1780,1629,22,NULL,NULL),(1781,1629,45,NULL,NULL),(1782,1630,1,NULL,NULL),(1783,1630,5,NULL,NULL),(1784,1630,22,NULL,NULL),(1785,1630,45,NULL,NULL),(1786,1631,1,NULL,NULL),(1787,1631,5,NULL,NULL),(1788,1631,22,NULL,NULL),(1789,1631,45,NULL,NULL),(1790,1632,1,NULL,NULL),(1791,1632,5,NULL,NULL),(1792,1632,22,NULL,NULL),(1793,1632,45,NULL,NULL),(1794,1633,1,NULL,NULL),(1795,1633,5,NULL,NULL),(1796,1633,22,NULL,NULL),(1797,1633,45,NULL,NULL),(1798,1634,1,NULL,NULL),(1799,1634,5,NULL,NULL),(1800,1634,22,NULL,NULL),(1801,1634,45,NULL,NULL),(1802,1635,1,NULL,NULL),(1803,1635,5,NULL,NULL),(1804,1635,22,NULL,NULL),(1805,1635,45,NULL,NULL),(1806,1636,1,NULL,NULL),(1807,1636,5,NULL,NULL),(1808,1636,22,NULL,NULL),(1809,1636,45,NULL,NULL),(1810,1637,1,NULL,NULL),(1811,1637,5,NULL,NULL),(1812,1637,22,NULL,NULL),(1813,1637,45,NULL,NULL),(1814,1638,1,NULL,NULL),(1815,1638,5,NULL,NULL),(1816,1638,22,NULL,NULL),(1817,1638,45,NULL,NULL),(1818,1639,1,NULL,NULL),(1819,1639,5,NULL,NULL),(1820,1639,22,NULL,NULL),(1821,1639,45,NULL,NULL),(1822,1640,1,NULL,NULL),(1823,1640,5,NULL,NULL),(1824,1640,22,NULL,NULL),(1825,1640,45,NULL,NULL),(1826,1641,1,NULL,NULL),(1827,1641,5,NULL,NULL),(1828,1641,22,NULL,NULL),(1829,1641,45,NULL,NULL),(1830,1642,1,NULL,NULL),(1831,1642,5,NULL,NULL),(1832,1642,22,NULL,NULL),(1833,1642,45,NULL,NULL),(1834,1643,1,NULL,NULL),(1835,1643,5,NULL,NULL),(1836,1643,22,NULL,NULL),(1837,1643,45,NULL,NULL),(1838,1644,1,NULL,NULL),(1839,1644,5,NULL,NULL),(1840,1644,22,NULL,NULL),(1841,1644,45,NULL,NULL),(1842,1645,1,NULL,NULL),(1843,1645,5,NULL,NULL),(1844,1645,22,NULL,NULL),(1845,1645,45,NULL,NULL),(1846,1646,1,NULL,NULL),(1847,1646,5,NULL,NULL),(1848,1646,22,NULL,NULL),(1849,1646,45,NULL,NULL),(1850,1647,1,NULL,NULL),(1851,1647,5,NULL,NULL),(1852,1647,22,NULL,NULL),(1853,1647,45,NULL,NULL),(1854,1648,1,NULL,NULL),(1855,1648,5,NULL,NULL),(1856,1648,22,NULL,NULL),(1857,1648,45,NULL,NULL),(1858,1649,1,NULL,NULL),(1859,1649,5,NULL,NULL),(1860,1649,22,NULL,NULL),(1861,1649,45,NULL,NULL),(1862,1650,1,NULL,NULL),(1863,1650,5,NULL,NULL),(1864,1650,22,NULL,NULL),(1865,1650,45,NULL,NULL),(1866,1651,1,NULL,NULL),(1867,1651,5,NULL,NULL),(1868,1651,22,NULL,NULL),(1869,1651,45,NULL,NULL),(1870,1652,1,NULL,NULL),(1871,1652,5,NULL,NULL),(1872,1652,22,NULL,NULL),(1873,1652,45,NULL,NULL),(1874,1653,1,NULL,NULL),(1875,1653,5,NULL,NULL),(1876,1653,22,NULL,NULL),(1877,1653,45,NULL,NULL),(1878,1654,1,NULL,NULL),(1879,1654,5,NULL,NULL),(1880,1654,22,NULL,NULL),(1881,1654,45,NULL,NULL),(1882,1655,1,NULL,NULL),(1883,1655,5,NULL,NULL),(1884,1655,22,NULL,NULL),(1885,1655,45,NULL,NULL),(1886,1656,1,NULL,NULL),(1887,1656,5,NULL,NULL),(1888,1656,22,NULL,NULL),(1889,1656,45,NULL,NULL),(1890,1657,1,NULL,NULL),(1891,1657,5,NULL,NULL),(1892,1657,22,NULL,NULL),(1893,1657,45,NULL,NULL),(1894,1658,1,NULL,NULL),(1895,1658,5,NULL,NULL),(1896,1658,22,NULL,NULL),(1897,1658,45,NULL,NULL),(1898,1659,1,NULL,NULL),(1899,1659,5,NULL,NULL),(1900,1659,22,NULL,NULL),(1901,1659,45,NULL,NULL),(1902,1660,1,NULL,NULL),(1903,1660,5,NULL,NULL),(1904,1660,22,NULL,NULL),(1905,1660,45,NULL,NULL),(1906,1661,1,NULL,NULL),(1907,1661,5,NULL,NULL),(1908,1661,22,NULL,NULL),(1909,1661,45,NULL,NULL),(1910,1662,1,NULL,NULL),(1911,1662,5,NULL,NULL),(1912,1662,22,NULL,NULL),(1913,1662,45,NULL,NULL);

/*Table structure for table `chart_of_accounts` */

DROP TABLE IF EXISTS `chart_of_accounts`;

CREATE TABLE `chart_of_accounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `account_group_id` bigint(20) unsigned NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('D','C') COLLATE utf8mb4_unicode_ci DEFAULT 'D',
  `exchange_rate_id` bigint(20) unsigned NOT NULL DEFAULT '3',
  `opening_balance` decimal(8,2) NOT NULL DEFAULT '0.00',
  `bank_or_cash` int(11) NOT NULL DEFAULT '0',
  `reconciliation` int(11) NOT NULL DEFAULT '0',
  `notes` text COLLATE utf8mb4_unicode_ci,
  `is_manual_transaction_allowed` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  `is_reviewed` enum('pending','approved','denied') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `is_assessed` enum('pending','approved','denied') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `is_approved` enum('pending','approved','denied') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chart_of_accounts_account_group_id_foreign` (`account_group_id`),
  KEY `chart_of_accounts_created_by_foreign` (`created_by`),
  KEY `chart_of_accounts_updated_by_foreign` (`updated_by`),
  KEY `chart_of_accounts_exchange_rate_id_foreign` (`exchange_rate_id`),
  CONSTRAINT `chart_of_accounts_account_group_id_foreign` FOREIGN KEY (`account_group_id`) REFERENCES `account_groups` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `chart_of_accounts_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `chart_of_accounts_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1663 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `chart_of_accounts` */

insert  into `chart_of_accounts`(`id`,`account_group_id`,`parent_id`,`code`,`name`,`type`,`exchange_rate_id`,`opening_balance`,`bank_or_cash`,`reconciliation`,`notes`,`is_manual_transaction_allowed`,`is_reviewed`,`is_assessed`,`is_approved`,`created_by`,`updated_by`,`created_at`,`updated_at`,`deleted_at`) values (1313,120,NULL,'1010100100','Land','D',3,0.00,0,0,'Land','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:53','2024-03-11 13:08:53',NULL),(1314,120,NULL,'1010100200','Building','D',3,0.00,0,0,'Building','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:53','2024-03-11 13:08:53',NULL),(1315,120,NULL,'1010100300','Air Conditioner','D',3,0.00,0,0,'Air Conditioner','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:53','2024-03-11 13:08:53',NULL),(1316,120,NULL,'1010100400','Motor Vehicle','D',3,0.00,0,0,'Motor Vehicle','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:53','2024-03-11 13:08:53',NULL),(1317,120,NULL,'1010100500','Revonation','D',3,0.00,0,0,'Revonation','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:53','2024-03-11 13:08:53',NULL),(1318,120,NULL,'1010100600','Computer Equipment','D',3,0.00,0,0,'Computer Equipment','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:53','2024-03-11 13:08:53',NULL),(1319,120,NULL,'1010100700','Fixture & Furniture','D',3,0.00,0,0,'Fixture & Furniture','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:53','2024-03-11 13:08:53',NULL),(1320,120,NULL,'1010100800','Network Equipment','D',3,0.00,0,0,'Network Equipment','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:53','2024-03-11 13:08:53',NULL),(1321,120,NULL,'1010100900','Office Equipment','D',3,0.00,0,0,'Office Equipment','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:53','2024-03-11 13:08:53',NULL),(1322,120,NULL,'1010101000','Power Equipment','D',3,0.00,0,0,'Power Equipment','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:53','2024-03-11 13:08:53',NULL),(1323,120,NULL,'1010101100','Security Equipment','D',3,0.00,0,0,'Security Equipment','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:53','2024-03-11 13:08:53',NULL),(1324,120,NULL,'1010101200','Server Equipment','D',3,0.00,0,0,'Server Equipment','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:53','2024-03-11 13:08:53',NULL),(1325,120,NULL,'1010101300','Software Spares & Accessories','D',3,0.00,0,0,'Software Spares & Accessories','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:53','2024-03-11 13:08:53',NULL),(1326,120,NULL,'1010101400','Right of Use Asset','D',3,0.00,0,0,'Right of Use Asset','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:53','2024-03-11 13:08:53',NULL),(1327,121,NULL,'1010200100','Acc. Dep. Building','D',3,0.00,0,0,'Acc. Dep. Building','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:53','2024-03-11 13:08:53',NULL),(1328,121,NULL,'1010200200','Acc. Dep. Air Conditioner','D',3,0.00,0,0,'Acc. Dep. Air Conditioner','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:53','2024-03-11 13:08:53',NULL),(1329,121,NULL,'1010200300','Acc. Dep. Motor Vehicle','D',3,0.00,0,0,'Acc. Dep. Motor Vehicle','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:53','2024-03-11 13:08:53',NULL),(1330,121,NULL,'1010200400','Acc. Dep. Revonation','D',3,0.00,0,0,'Acc. Dep. Revonation','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:53','2024-03-11 13:08:53',NULL),(1331,121,NULL,'1010200500','Acc. Dep. Computer Equipment','D',3,0.00,0,0,'Acc. Dep. Computer Equipment','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:53','2024-03-11 13:08:53',NULL),(1332,121,NULL,'1010200600','Acc. Dep. Fixture & Furniture','D',3,0.00,0,0,'Acc. Dep. Fixture & Furniture','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:53','2024-03-11 13:08:53',NULL),(1333,121,NULL,'1010200700','Acc. Dep. Network Equipment','D',3,0.00,0,0,'Acc. Dep. Network Equipment','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:53','2024-03-11 13:08:53',NULL),(1334,121,NULL,'1010200800','Acc. Dep. Office Equipment','D',3,0.00,0,0,'Acc. Dep. Office Equipment','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:53','2024-03-11 13:08:53',NULL),(1335,121,NULL,'1010200900','Acc. Dep. Power Equipment','D',3,0.00,0,0,'Acc. Dep. Power Equipment','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:53','2024-03-11 13:08:53',NULL),(1336,121,NULL,'1010201000','Acc. Dep. Security Equipment','D',3,0.00,0,0,'Acc. Dep. Security Equipment','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:53','2024-03-11 13:08:53',NULL),(1337,121,NULL,'1010201100','Acc. Dep. Server Equipment','D',3,0.00,0,0,'Acc. Dep. Server Equipment','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:53','2024-03-11 13:08:53',NULL),(1338,121,NULL,'1010201200','Acc. Dep. Software Spares & Accessories','D',3,0.00,0,0,'Acc. Dep. Software Spares & Accessories','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:53','2024-03-11 13:08:53',NULL),(1339,121,NULL,'1010201300','Acc. Dep. Right of Use Asset','D',3,0.00,0,0,'Acc. Dep. Right of Use Asset','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:53','2024-03-11 13:08:53',NULL),(1340,122,NULL,'1010300100','Investment in Fixed Deposits','D',3,0.00,0,0,'Investment in Fixed Deposits','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:53','2024-03-11 13:08:53',NULL),(1341,122,NULL,'1010300200','Investment in Shares & Securities','D',3,0.00,0,0,'Investment in Shares & Securities','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:53','2024-03-11 13:08:53',NULL),(1342,122,NULL,'1010300300','Deferred Tax Asset','D',3,0.00,0,0,'Deferred Tax Asset','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:53','2024-03-11 13:08:53',NULL),(1343,122,NULL,'1010300400','Goodwill','D',3,0.00,0,0,'Goodwill','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:53','2024-03-11 13:08:53',NULL),(1344,122,NULL,'1010300500','Investment in Subsidiaries','D',3,0.00,0,0,'Investment in Subsidiaries','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:53','2024-03-11 13:08:53',NULL),(1345,124,NULL,'1020100100','Raw Materials','D',1,0.00,0,0,'Raw Materials','yes','approved','approved','approved',1,22,'2024-03-11 13:08:53','2024-03-18 11:31:48',NULL),(1346,124,NULL,'1020100200','Packing Materials','D',1,0.00,0,0,'Packing Materials','yes','approved','approved','approved',1,22,'2024-03-11 13:08:53','2024-03-18 11:31:58',NULL),(1347,124,NULL,'1020100300','Stores & Spares','D',1,0.00,0,0,'Stores & Spares','yes','approved','approved','approved',1,22,'2024-03-11 13:08:53','2024-03-18 11:32:06',NULL),(1348,124,NULL,'1020100400','Work in Progress','D',1,0.00,0,0,'Work in Progress','yes','approved','approved','approved',1,22,'2024-03-11 13:08:53','2024-03-18 11:32:14',NULL),(1349,124,NULL,'1020100500','Finished Goods','D',1,0.00,0,0,'Finished Goods','yes','approved','approved','approved',1,22,'2024-03-11 13:08:53','2024-03-18 11:32:22',NULL),(1350,124,NULL,'1020100600','Goods in Transit','D',1,0.00,0,0,'Goods in Transit','yes','approved','approved','approved',1,22,'2024-03-11 13:08:53','2024-03-18 11:32:31',NULL),(1351,126,NULL,'1020201001','Accounts Receivable_Trade_E-COMMERZ','D',3,0.00,0,0,'Accounts Receivable_Trade_E-COMMERZ','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:53','2024-03-11 13:08:53',NULL),(1352,126,NULL,'1020201002','Accounts Receivable_Trade_mVAS','D',3,0.00,0,0,'Accounts Receivable_Trade_mVAS','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:53','2024-03-11 13:08:53',NULL),(1353,126,NULL,'1020201003','Accounts Receivable_Trade_Business development','D',3,0.00,0,0,'Accounts Receivable_Trade_Business development','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:53','2024-03-11 13:08:53',NULL),(1354,126,NULL,'1020201004','Accounts Receivable_Trade_BFSI','D',3,0.00,0,0,'Accounts Receivable_Trade_BFSI','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:53','2024-03-11 13:08:53',NULL),(1355,126,NULL,'1020201005','Accounts Receivable_Trade_Government','D',3,0.00,0,0,'Accounts Receivable_Trade_Government','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:53','2024-03-11 13:08:53',NULL),(1356,126,NULL,'1020201006','Accounts Receivable - Easy','D',3,0.00,0,0,'Accounts Receivable - Easy','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:53','2024-03-11 13:08:53',NULL),(1357,127,NULL,'1020202001','Provision for Doubtful Debts_Trade_E-COMMERZ','D',3,0.00,0,0,'Provision for Doubtful Debts_Trade_E-COMMERZ','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:53','2024-03-11 13:08:53',NULL),(1358,127,NULL,'1020202002','Provision for Doubtful Debts_Trade_mVAS','D',3,0.00,0,0,'Provision for Doubtful Debts_Trade_mVAS','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:53','2024-03-11 13:08:53',NULL),(1359,127,NULL,'1020202003','Provision for Doubtful Debts_Trade_Business development','D',3,0.00,0,0,'Provision for Doubtful Debts_Trade_Business development','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:53','2024-03-11 13:08:53',NULL),(1360,127,NULL,'1020202004','Provision for Doubtful Debts_Trade_BFSI','D',3,0.00,0,0,'Provision for Doubtful Debts_Trade_BFSI','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:53','2024-03-11 13:08:53',NULL),(1361,127,NULL,'1020202005','Provision for Doubtful Debts_Trade_Government','D',3,0.00,0,0,'Provision for Doubtful Debts_Trade_Government','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:53','2024-03-11 13:08:53',NULL),(1362,127,NULL,'1020202006','Provision for Doubtful Debts_Trade_Easy','D',3,0.00,0,0,'Provision for Doubtful Debts_Trade_Easy','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:53','2024-03-11 13:08:53',NULL),(1363,128,NULL,'1020203001','BRAC Bank Ltd.','D',3,0.00,0,0,'BRAC Bank Ltd.','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:53','2024-03-11 13:08:53',NULL),(1364,128,NULL,'1020203002','City Bank Ltd.','D',3,0.00,0,0,'City Bank Ltd.','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:53','2024-03-11 13:08:53',NULL),(1365,128,NULL,'1020203003','Dutch Bangla Bank Limited','D',3,0.00,0,0,'Dutch Bangla Bank Limited','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:53','2024-03-11 13:08:53',NULL),(1366,128,NULL,'1020203004','Eastern Bank Limited.','D',3,0.00,0,0,'Eastern Bank Limited.','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:53','2024-03-11 13:08:53',NULL),(1367,128,NULL,'1020203005','Mutual Trust Bank Ltd.','D',3,0.00,0,0,'Mutual Trust Bank Ltd.','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:53','2024-03-11 13:08:53',NULL),(1368,128,NULL,'1020203006','Prime Bank Ltd.','D',3,0.00,0,0,'Prime Bank Ltd.','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:53','2024-03-11 13:08:53',NULL),(1369,128,NULL,'1020203007','Southeast Bank Ltd.','D',3,0.00,0,0,'Southeast Bank Ltd.','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:53','2024-03-11 13:08:53',NULL),(1370,128,NULL,'1020203008','United Commercial Bank Ltd.','D',3,0.00,0,0,'United Commercial Bank Ltd.','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:53','2024-03-11 13:08:53',NULL),(1371,128,NULL,'1020203009','Standard Chartered Bank','D',3,0.00,0,0,'Standard Chartered Bank','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:53','2024-03-11 13:08:53',NULL),(1372,128,NULL,'1020203010','Jamuna Bank Ltd.','D',3,0.00,0,0,'Jamuna Bank Ltd.','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:53','2024-03-11 13:08:53',NULL),(1373,128,NULL,'1020203011','One Bank Limited','D',3,0.00,0,0,'One Bank Limited','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:53','2024-03-11 13:08:53',NULL),(1374,128,NULL,'1020203012','Islami Bank Bangladesh Limited','D',3,0.00,0,0,'Islami Bank Bangladesh Limited','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1375,128,NULL,'1020203013','Dhaka Bank Ltd.','D',3,0.00,0,0,'Dhaka Bank Ltd.','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1376,128,NULL,'1020203014','Nagad','D',3,0.00,0,0,'Nagad','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1377,128,NULL,'1020203015','Bkash','D',3,0.00,0,0,'Bkash','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1378,130,NULL,'1020301001','Biddyut Limited','D',3,0.00,0,0,'Biddyut Limited','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1379,130,NULL,'1020301002','NGAGE (Pvt.) Limited','D',3,0.00,0,0,'NGAGE (Pvt.) Limited','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1380,130,NULL,'1020301003','Travo Limited ','D',3,0.00,0,0,'Travo Limited ','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1381,130,NULL,'1020301004','SSL Commerz Limited','D',3,0.00,0,0,'SSL Commerz Limited','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1382,131,NULL,'1020302001','Biddyut Limited','D',3,0.00,0,0,'Biddyut Limited','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1383,131,NULL,'1020302002','NGAGE (Pvt.) Limited','D',3,0.00,0,0,'NGAGE (Pvt.) Limited','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1384,131,NULL,'1020302003','Travo Limited ','D',3,0.00,0,0,'Travo Limited ','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1385,131,NULL,'1020302004','SSL Commerz Limited','D',3,0.00,0,0,'SSL Commerz Limited','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1386,132,NULL,'1020401001','Receivable - Discount Campaign','D',3,0.00,0,0,'Receivable - Discount Campaign','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1387,132,NULL,'1020401002','Other Receivables','D',3,0.00,0,0,'Other Receivables','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1388,134,NULL,'1030401001','Advance to Employees (IOU)','D',3,0.00,0,0,'Advance to Employees (IOU)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1389,134,NULL,'1030401002','Advance to Suppliers','D',3,0.00,0,0,'Advance to Suppliers','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1390,135,NULL,'1030402001','Security Deposit Against Telephone','D',3,0.00,0,0,'Security Deposit Against Telephone','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1391,135,NULL,'1030402002','Vehicles Lease Deposit','D',3,0.00,0,0,'Vehicles Lease Deposit','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1392,135,NULL,'1030402003','Security Deposit For Office Rent','D',3,0.00,0,0,'Security Deposit For Office Rent','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1393,135,NULL,'1030402004','Security Deposit-Others','D',3,0.00,0,0,'Security Deposit-Others','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1394,135,NULL,'1030402005','Banglalink Security Deposit','D',3,0.00,0,0,'Banglalink Security Deposit','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1395,135,NULL,'1030402006','Banglalink Self Security Deposit','D',3,0.00,0,0,'Banglalink Self Security Deposit','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1396,135,NULL,'1030402007','Airtel Security Deposit','D',3,0.00,0,0,'Airtel Security Deposit','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1397,135,NULL,'1030402008','Robi Security Deposit','D',3,0.00,0,0,'Robi Security Deposit','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1398,135,NULL,'1030402009','Grameenphone Security Deposit','D',3,0.00,0,0,'Grameenphone Security Deposit','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1399,135,NULL,'1030402010','Earnest Money','D',3,0.00,0,0,'Earnest Money','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1400,135,NULL,'1030402011','Security Money','D',3,0.00,0,0,'Security Money','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1401,135,NULL,'1030402012','Bank Guarantee Margin','D',3,0.00,0,0,'Bank Guarantee Margin','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1402,136,NULL,'1030403001','Banglalink','D',3,0.00,0,0,'Banglalink','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1403,136,NULL,'1030403002','Grameenphone','D',3,0.00,0,0,'Grameenphone','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1404,136,NULL,'1030403003','Robi Telecom','D',3,0.00,0,0,'Robi Telecom','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1405,136,NULL,'1030403004','Airtel Bangladesh','D',3,0.00,0,0,'Airtel Bangladesh','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1406,136,NULL,'1030403005','Skitto','D',3,0.00,0,0,'Skitto','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1407,136,NULL,'1030403006','BL Mother','D',3,0.00,0,0,'BL Mother','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1408,136,NULL,'1030403007','Teletalk','D',3,0.00,0,0,'Teletalk','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1409,137,NULL,'1030404001','Banglalink','D',3,0.00,0,0,'Banglalink','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1410,137,NULL,'1030404002','Grameenphone','D',3,0.00,0,0,'Grameenphone','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1411,137,NULL,'1030404003','Robi Telecom','D',3,0.00,0,0,'Robi Telecom','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1412,137,NULL,'1030404004','Airtel Bangladesh','D',3,0.00,0,0,'Airtel Bangladesh','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1413,137,NULL,'1030404005','Skitto','D',3,0.00,0,0,'Skitto','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1414,137,NULL,'1030404006','BL Mother','D',3,0.00,0,0,'BL Mother','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1415,137,NULL,'1030404007','Teletalk','D',3,0.00,0,0,'Teletalk','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1416,138,NULL,'1030500001','Tax Deducted At Source','D',3,0.00,0,0,'Tax Deducted At Source','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1417,138,NULL,'1030500002','Advance Tax Paid','D',3,0.00,0,0,'Advance Tax Paid','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1418,139,NULL,'1030600001','Input VAT Recoverable','D',3,0.00,0,0,'Input VAT Recoverable','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1419,141,NULL,'1030701001','Cash at HO','D',3,0.00,0,0,'Cash at HO','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1420,141,NULL,'1030701002','Cash at Factory','D',3,0.00,0,0,'Cash at Factory','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1421,141,NULL,'1030701003','Bkash Wallet','D',3,0.00,0,0,'Bkash Wallet','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1422,141,NULL,'1030701004','Nagad Wallet','D',3,0.00,0,0,'Nagad Wallet','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1423,141,NULL,'1030701005','Local Credit Card Balance','D',3,0.00,0,0,'Local Credit Card Balance','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1424,141,NULL,'1030701006','Foreign Credit Card Balance','D',3,0.00,0,0,'Foreign Credit Card Balance','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1425,142,NULL,'1030702001','AB Bank Limited. (4002771777000)','D',3,0.00,0,0,'AB Bank Limited. (4002771777000)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1426,142,NULL,'1030702002','Bangladesh Commerce Bank Ltd. (00221003149)','D',3,0.00,0,0,'Bangladesh Commerce Bank Ltd. (00221003149)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1427,142,NULL,'1030702003','Bangladesh Development Bank Limited (0650200002657)','D',3,0.00,0,0,'Bangladesh Development Bank Limited (0650200002657)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1428,142,NULL,'1030702004','Bank Alfalah Ltd (07052100327988)','D',3,0.00,0,0,'Bank Alfalah Ltd (07052100327988)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1429,142,NULL,'1030702005','Bank Asia Limited. (00233011723)','D',3,0.00,0,0,'Bank Asia Limited. (00233011723)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1430,142,NULL,'1030702006','Basic Bank Limited (0210010014320)','D',3,0.00,0,0,'Basic Bank Limited (0210010014320)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1431,142,NULL,'1030702007','Bengal Commercial Bank Ltd. (1001141003686)','D',3,0.00,0,0,'Bengal Commercial Bank Ltd. (1001141003686)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1432,142,NULL,'1030702008','BRAC Bank Limited. (1520202149152001)','D',3,0.00,0,0,'BRAC Bank Limited. (1520202149152001)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1433,142,NULL,'1030702009','BRAC Bank Ltd.-02 (1520102149152001)','D',3,0.00,0,0,'BRAC Bank Ltd.-02 (1520102149152001)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1434,142,NULL,'1030702010','Citizens Bank (1001111000002)','D',3,0.00,0,0,'Citizens Bank (1001111000002)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1435,142,NULL,'1030702011','Commercial Bank of Ceylon (1818005767)','D',3,0.00,0,0,'Commercial Bank of Ceylon (1818005767)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1436,142,NULL,'1030702012','Community Bank Bangladesh Ltd (0010312595301)','D',3,0.00,0,0,'Community Bank Bangladesh Ltd (0010312595301)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1437,142,NULL,'1030702013','Community Bank Bangladesh Ltd (0010312595101)','D',3,0.00,0,0,'Community Bank Bangladesh Ltd (0010312595101)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1438,142,NULL,'1030702014','Dhaka Bank Limited- Eskaton (1051500000289)','D',3,0.00,0,0,'Dhaka Bank Limited- Eskaton (1051500000289)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1439,142,NULL,'1030702015','Dhaka Bank Limited- Kakrail (106.100.536)','D',3,0.00,0,0,'Dhaka Bank Limited- Kakrail (106.100.536)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1440,142,NULL,'1030702016','Dutch Bangla Bank Limited. (1071100008604)','D',3,0.00,0,0,'Dutch Bangla Bank Limited. (1071100008604)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1441,142,NULL,'1030702017','Eastern Bank Limited. (1051290082479)','D',3,0.00,0,0,'Eastern Bank Limited. (1051290082479)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1442,142,NULL,'1030702018','Eastern Bank Limited. -02 (1051070098652)','D',3,0.00,0,0,'Eastern Bank Limited. -02 (1051070098652)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1443,142,NULL,'1030702019','Exim Bank Ltd (0011100118189)','D',3,0.00,0,0,'Exim Bank Ltd (0011100118189)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1444,142,NULL,'1030702020','First Security Islami Bank Ltd. ( 017611100000291)','D',3,0.00,0,0,'First Security Islami Bank Ltd. ( 017611100000291)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1445,142,NULL,'1030702021','IFIC Bank Ltd. (1017773574001)','D',3,0.00,0,0,'IFIC Bank Ltd. (1017773574001)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1446,142,NULL,'1030702022','Islami Bank Bangladesh Limited. (20501020101063909)','D',3,0.00,0,0,'Islami Bank Bangladesh Limited. (20501020101063909)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1447,142,NULL,'1030702023','Jamuna Bank Ltd. (0240210013593)','D',3,0.00,0,0,'Jamuna Bank Ltd. (0240210013593)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1448,142,NULL,'1030702024','Meghna Bank Ltd. (111813500000011)','D',3,0.00,0,0,'Meghna Bank Ltd. (111813500000011)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1449,142,NULL,'1030702025','Mercantile Bank Limited (013411100007712)','D',3,0.00,0,0,'Mercantile Bank Limited (013411100007712)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1450,142,NULL,'1030702026','Midland Bank Limited. (00011050002887)','D',3,0.00,0,0,'Midland Bank Limited. (00011050002887)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1451,142,NULL,'1030702027','Modhumoti Bank Limited (112311100000304)','D',3,0.00,0,0,'Modhumoti Bank Limited (112311100000304)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1452,142,NULL,'1030702028','Mutual Trust Bank Ltd. (00030210013589)','D',3,0.00,0,0,'Mutual Trust Bank Ltd. (00030210013589)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1453,142,NULL,'1030702029','National Bank Limited. (1999001787316)','D',3,0.00,0,0,'National Bank Limited. (1999001787316)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1454,142,NULL,'1030702030','NCC Bank Limited (00020210026558)','D',3,0.00,0,0,'NCC Bank Limited (00020210026558)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1455,142,NULL,'1030702031','NRB Bank Limited. (1022010023616)','D',3,0.00,0,0,'NRB Bank Limited. (1022010023616)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1456,142,NULL,'1030702032','One Bank Limited. (0121020005322)','D',3,0.00,0,0,'One Bank Limited. (0121020005322)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1457,142,NULL,'1030702033','Padma Bank Ltd. (0111100376044)','D',3,0.00,0,0,'Padma Bank Ltd. (0111100376044)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1458,142,NULL,'1030702034','Premier Bank Limited (0011100100701)','D',3,0.00,0,0,'Premier Bank Limited (0011100100701)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1459,142,NULL,'1030702035','Premier Bank Limited - N. Ganj (0011100005135)','D',3,0.00,0,0,'Premier Bank Limited - N. Ganj (0011100005135)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1460,142,NULL,'1030702036','Prime Bank Limited. (12811080027268)','D',3,0.00,0,0,'Prime Bank Limited. (12811080027268)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1461,142,NULL,'1030702037','Pubali Bank Limited (2775901029901)','D',3,0.00,0,0,'Pubali Bank Limited (2775901029901)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1462,142,NULL,'1030702038','Rajshahi Krishi Unnayan Bank (0011100000224)','D',3,0.00,0,0,'Rajshahi Krishi Unnayan Bank (0011100000224)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1463,142,NULL,'1030702039','Shahjalal Islami Bank Limited (405711100000180)','D',3,0.00,0,0,'Shahjalal Islami Bank Limited (405711100000180)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1464,142,NULL,'1030702040','Simanto Bank Ltd. (1001241000365)','D',3,0.00,0,0,'Simanto Bank Ltd. (1001241000365)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1465,142,NULL,'1030702041','Social Islami Bank Ltd. (0551330001807)','D',3,0.00,0,0,'Social Islami Bank Ltd. (0551330001807)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1466,142,NULL,'1030702042','Sonali Bank Ltd. (1612102000307)','D',3,0.00,0,0,'Sonali Bank Ltd. (1612102000307)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1467,142,NULL,'1030702043','South Bangla Agriculture Bank Ltd. (0067111000980)','D',3,0.00,0,0,'South Bangla Agriculture Bank Ltd. (0067111000980)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1468,142,NULL,'1030702044','Southeast Bank Limited. (003111100008090)','D',3,0.00,0,0,'Southeast Bank Limited. (003111100008090)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1469,142,NULL,'1030702045','Standard Bank Ltd (0008133000238)','D',3,0.00,0,0,'Standard Bank Ltd (0008133000238)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1470,142,NULL,'1030702046','Standard Chartered Bank (01116488101)','D',3,0.00,0,0,'Standard Chartered Bank (01116488101)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1471,142,NULL,'1030702047','State Bank of India (05420501420201)','D',3,0.00,0,0,'State Bank of India (05420501420201)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1472,142,NULL,'1030702048','The City Bank Limited. (1101147641001)','D',3,0.00,0,0,'The City Bank Limited. (1101147641001)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1473,142,NULL,'1030702049','Trust Bank Limited (00220210018330)','D',3,0.00,0,0,'Trust Bank Limited (00220210018330)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1474,142,NULL,'1030702050','Union Bank Limited. (0021010005741)','D',3,0.00,0,0,'Union Bank Limited. (0021010005741)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1475,142,NULL,'1030702051','United Commercial Bank Limited. (0941101000003089)','D',3,0.00,0,0,'United Commercial Bank Limited. (0941101000003089)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1476,142,NULL,'1030702052','Uttara Bank Ltd. (0012200212492)','D',3,0.00,0,0,'Uttara Bank Ltd. (0012200212492)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1477,143,NULL,'1030703001','AB Bank Ltd. (4002780915430)','D',3,0.00,0,0,'AB Bank Ltd. (4002780915430)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1478,143,NULL,'1030703002','Bank Asia Ltd. (00233012450)','D',3,0.00,0,0,'Bank Asia Ltd. (00233012450)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1479,143,NULL,'1030703003','BRAC Bank Ltd. (1520202149152002)','D',3,0.00,0,0,'BRAC Bank Ltd. (1520202149152002)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1480,143,NULL,'1030703004','City Bank Ltd. (1221147641001)','D',3,0.00,0,0,'City Bank Ltd. (1221147641001)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1481,143,NULL,'1030703005','Dutch Bangla Bank Limited (1071080000015)','D',3,0.00,0,0,'Dutch Bangla Bank Limited (1071080000015)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1482,143,NULL,'1030703006','Eastern Bank Limited. (1051290082479)','D',3,0.00,0,0,'Eastern Bank Limited. (1051290082479)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1483,143,NULL,'1030703007','First Security Islami Bank Ltd. ( 017611100000291)','D',3,0.00,0,0,'First Security Islami Bank Ltd. ( 017611100000291)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1484,143,NULL,'1030703008','Islami Bank Bangladesh Ltd. (20504300100034405)','D',3,0.00,0,0,'Islami Bank Bangladesh Ltd. (20504300100034405)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1485,143,NULL,'1030703009','Mutual Trust Bank Ltd. (1301010001617)','D',3,0.00,0,0,'Mutual Trust Bank Ltd. (1301010001617)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1486,143,NULL,'1030703010','Prime Bank Ltd. (2128119018623)','D',3,0.00,0,0,'Prime Bank Ltd. (2128119018623)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1487,143,NULL,'1030703011','Southeast Bank Ltd. (010211100000611)','D',3,0.00,0,0,'Southeast Bank Ltd. (010211100000611)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1488,143,NULL,'1030703012','United Commercial Bank Ltd. (0941301000000414)','D',3,0.00,0,0,'United Commercial Bank Ltd. (0941301000000414)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1489,143,NULL,'1030703013','NRB Bank Ltd. (1012010159698)','D',3,0.00,0,0,'NRB Bank Ltd. (1012010159698)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1490,143,NULL,'1030703014','Standard Chartered Bank (32116488101)','D',3,0.00,0,0,'Standard Chartered Bank (32116488101)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1491,143,NULL,'1030703015','Dhaka Bank Ltd. (1051000002799)','D',3,0.00,0,0,'Dhaka Bank Ltd. (1051000002799)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1492,143,NULL,'1030703016','Premier Bank Ltd. (10713100005688)','D',3,0.00,0,0,'Premier Bank Ltd. (10713100005688)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1493,143,NULL,'1030703017','Jamuna Bank Ltd. (01560320000041)','D',3,0.00,0,0,'Jamuna Bank Ltd. (01560320000041)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1494,143,NULL,'1030703018','State Bank of India (05420501420201)','D',3,0.00,0,0,'State Bank of India (05420501420201)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1495,143,NULL,'1030703019','Woori Bank Limited (1509230943079)','D',3,0.00,0,0,'Woori Bank Limited (1509230943079)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1496,143,NULL,'1030703020','Sonali Bank Ltd. (1612102000380)','D',3,0.00,0,0,'Sonali Bank Ltd. (1612102000380)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1497,144,NULL,'1030704001','Investment in FDR','D',3,0.00,0,0,'Investment in FDR','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1498,144,NULL,'1030704002','Investment n SND','D',3,0.00,0,0,'Investment n SND','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1499,144,NULL,'1030704003','Other Short Term Investments','D',3,0.00,0,0,'Other Short Term Investments','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1500,144,NULL,'1030704004','Assets Held for Sale','D',3,0.00,0,0,'Assets Held for Sale','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1501,146,NULL,'2010100000','Ordinary Share Capital','D',3,0.00,0,0,'Ordinary Share Capital','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1502,146,NULL,'2010200000','Share Premium','D',3,0.00,0,0,'Share Premium','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1503,146,NULL,'2010300000','Revaluation Reserve','D',3,0.00,0,0,'Revaluation Reserve','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1504,146,NULL,'2010400000','Other Reserve','D',3,0.00,0,0,'Other Reserve','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1505,146,NULL,'2010500000','Share Money Deposit','D',3,0.00,0,0,'Share Money Deposit','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1506,146,NULL,'2010600000','Retained Earnings','D',3,0.00,0,0,'Retained Earnings','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1507,149,NULL,'3010100001','Dhaka Bank','D',3,0.00,0,0,'Dhaka Bank','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1508,149,NULL,'3010100002','Prime Bank','D',3,0.00,0,0,'Prime Bank','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1509,184,NULL,'3010200001','RoU Liability','D',3,0.00,0,0,'RoU Liability','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1510,150,NULL,'3010300001','Deferred Tax Liability','D',3,0.00,0,0,'Deferred Tax Liability','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1511,153,NULL,'3020101001','Vendor Payable','D',3,0.00,0,0,'Vendor Payable','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1512,154,NULL,'3020102001','Reseller Payable','D',3,0.00,0,0,'Reseller Payable','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1513,154,NULL,'3020102002','Issuer Bank Payable','D',3,0.00,0,0,'Issuer Bank Payable','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1514,154,NULL,'3020102003','Payable to Nagad','D',3,0.00,0,0,'Payable to Nagad','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1515,155,NULL,'3020200001','EMI Payable','D',3,0.00,0,0,'EMI Payable','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1516,155,NULL,'3020200002','Card Payable','D',3,0.00,0,0,'Card Payable','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1517,155,NULL,'3020200003','Merchant Payable','D',3,0.00,0,0,'Merchant Payable','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1518,156,NULL,'3020300001','Electricity Bill','D',3,0.00,0,0,'Electricity Bill','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1519,156,NULL,'3020300002','Legal & Professional Fees','D',3,0.00,0,0,'Legal & Professional Fees','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1520,156,NULL,'3020300003','Mobile Bill','D',3,0.00,0,0,'Mobile Bill','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1521,156,NULL,'3020300004','Office rental Expenses','D',3,0.00,0,0,'Office rental Expenses','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1522,156,NULL,'3020300005','Salary and Allowances','D',3,0.00,0,0,'Salary and Allowances','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1523,156,NULL,'3020300006','Telephone  Bill','D',3,0.00,0,0,'Telephone  Bill','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1524,156,NULL,'3020300007','Water Bill','D',3,0.00,0,0,'Water Bill','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1525,156,NULL,'3020300008','Withholding VAT and Tax payable','D',3,0.00,0,0,'Withholding VAT and Tax payable','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1526,156,NULL,'3020300009','Liabilities for Income Tax','D',3,0.00,0,0,'Liabilities for Income Tax','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1527,156,NULL,'3020300010','Interest Payable','D',3,0.00,0,0,'Interest Payable','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1528,157,NULL,'3020400001','Deferred Revenue_E-COMMERZ','D',3,0.00,0,0,'Deferred Revenue_E-COMMERZ','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1529,157,NULL,'3020400002','Deferred Revenue_Trade_mVAS','D',3,0.00,0,0,'Deferred Revenue_Trade_mVAS','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1530,157,NULL,'3020400003','Deferred Revenue_Business development','D',3,0.00,0,0,'Deferred Revenue_Business development','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1531,157,NULL,'3020400004','Deferred Revenue_Trade_BFSI','D',3,0.00,0,0,'Deferred Revenue_Trade_BFSI','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1532,157,NULL,'3020400005','Deferred Revenue_Trade_Govt. Project','D',3,0.00,0,0,'Deferred Revenue_Trade_Govt. Project','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1533,158,NULL,'3020500001','Concorde Garments Ltd','D',3,0.00,0,0,'Concorde Garments Ltd','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1534,158,NULL,'3020500002','Osman Interlinings Ltd.','D',3,0.00,0,0,'Osman Interlinings Ltd.','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1535,159,NULL,'3020600001','Dhaka Bank','D',3,0.00,0,0,'Dhaka Bank','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1536,159,NULL,'3020600002','City Bank','D',3,0.00,0,0,'City Bank','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1537,160,NULL,'3020700001','Eastern Bank','D',3,0.00,0,0,'Eastern Bank','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1538,160,NULL,'3020700002','Standard Chartered Bank','D',3,0.00,0,0,'Standard Chartered Bank','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1539,161,NULL,'3020800001','RoU Liability','D',3,0.00,0,0,'RoU Liability','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1540,162,NULL,'3020900001','Advance from Customers','D',3,0.00,0,0,'Advance from Customers','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1541,162,NULL,'3020900002','Refund to Customers','D',3,0.00,0,0,'Refund to Customers','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1542,162,NULL,'3020900003','Chargeback to Customers','D',3,0.00,0,0,'Chargeback to Customers','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1543,162,NULL,'3020900004','Other Payable','D',3,0.00,0,0,'Other Payable','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1544,164,NULL,'4010000001','Digital Data Processing Income (Push SMS)','D',3,0.00,0,0,'Digital Data Processing Income (Push SMS)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1545,164,NULL,'4010000002','IVR Solution','D',3,0.00,0,0,'IVR Solution','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1546,164,NULL,'4010000003','Website Development','D',3,0.00,0,0,'Website Development','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1547,164,NULL,'4010000004','Email Marketing Solution','D',3,0.00,0,0,'Email Marketing Solution','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1548,164,NULL,'4010000005','Software Maintenance','D',3,0.00,0,0,'Software Maintenance','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1549,164,NULL,'4010000006','Hosting','D',3,0.00,0,0,'Hosting','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1550,164,NULL,'4010000007','Call center solution','D',3,0.00,0,0,'Call center solution','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1551,164,NULL,'4010000008','SSL Certificate','D',3,0.00,0,0,'SSL Certificate','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1552,164,NULL,'4010000009','Chat bot','D',3,0.00,0,0,'Chat bot','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1553,164,NULL,'4010000010','Web Application','D',3,0.00,0,0,'Web Application','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1554,164,NULL,'4010000011','Digital Advertisement Placement','D',3,0.00,0,0,'Digital Advertisement Placement','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1555,164,NULL,'4010000012','VAS Service','D',3,0.00,0,0,'VAS Service','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1556,164,NULL,'4010000013','Digital Campaign','D',3,0.00,0,0,'Digital Campaign','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1557,164,NULL,'4010000014','Push Pull Service','D',3,0.00,0,0,'Push Pull Service','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1558,164,NULL,'4010000015','Data Pack','D',3,0.00,0,0,'Data Pack','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1559,164,NULL,'4010000016','Security Solution','D',3,0.00,0,0,'Security Solution','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1560,164,NULL,'4010000017','E-commerce service (SSL Commerz)','D',3,0.00,0,0,'E-commerce service (SSL Commerz)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1561,164,NULL,'4010000018','Income from Top-up commission ','D',3,0.00,0,0,'Income from Top-up commission ','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1562,164,NULL,'4010000019','EMI Commission Income','D',3,0.00,0,0,'EMI Commission Income','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1563,164,NULL,'4010000020','Card Commission Income','D',3,0.00,0,0,'Card Commission Income','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1564,164,NULL,'4010000021','Monthly Recurring Charge (MRC)','D',3,0.00,0,0,'Monthly Recurring Charge (MRC)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1565,164,NULL,'4010000022','One Time Recurring Charge (OTC)','D',3,0.00,0,0,'One Time Recurring Charge (OTC)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1566,165,NULL,'4020000001','VAT on Digital Data Processing Income (Push SMS)','D',3,0.00,0,0,'VAT on Digital Data Processing Income (Push SMS)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1567,165,NULL,'4020000002','VAT on IVR Solution','D',3,0.00,0,0,'VAT on IVR Solution','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1568,165,NULL,'4020000003','VAT on Website Development','D',3,0.00,0,0,'VAT on Website Development','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1569,165,NULL,'4020000004','VAT on Email Marketing Solution','D',3,0.00,0,0,'VAT on Email Marketing Solution','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1570,165,NULL,'4020000005','VAT on Software Maintenance','D',3,0.00,0,0,'VAT on Software Maintenance','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1571,165,NULL,'4020000006','VAT on Hosting','D',3,0.00,0,0,'VAT on Hosting','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1572,165,NULL,'4020000007','VAT on Call center solution','D',3,0.00,0,0,'VAT on Call center solution','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1573,165,NULL,'4020000008','VAT on SSL Certificate','D',3,0.00,0,0,'VAT on SSL Certificate','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1574,165,NULL,'4020000009','VAT on Chat bot','D',3,0.00,0,0,'VAT on Chat bot','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1575,165,NULL,'4020000010','VAT on Web Application','D',3,0.00,0,0,'VAT on Web Application','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1576,165,NULL,'4020000011','VAT on Digital Advertisement Placement','D',3,0.00,0,0,'VAT on Digital Advertisement Placement','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1577,165,NULL,'4020000012','VAT on onVAS Service','D',3,0.00,0,0,'VAT on onVAS Service','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1578,165,NULL,'4020000013','VAT on Digital Campaign','D',3,0.00,0,0,'VAT on Digital Campaign','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1579,165,NULL,'4020000014','VAT on Push Pull Service','D',3,0.00,0,0,'VAT on Push Pull Service','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1580,165,NULL,'4020000015','VAT on Data Pack','D',3,0.00,0,0,'VAT on Data Pack','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1581,165,NULL,'4020000016','VAT on Security Solution','D',3,0.00,0,0,'VAT on Security Solution','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1582,165,NULL,'4020000017','VAT on E-commerce service (SSL Commerz)','D',3,0.00,0,0,'VAT on E-commerce service (SSL Commerz)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1583,165,NULL,'4020000018','VAT on Income from Top-up commission ','D',3,0.00,0,0,'VAT on Income from Top-up commission ','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1584,165,NULL,'4020000019','VAT on EMI Commission Income','D',3,0.00,0,0,'VAT on EMI Commission Income','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1585,165,NULL,'4020000020','VAT on Card Commission Income','D',3,0.00,0,0,'VAT on Card Commission Income','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1586,165,NULL,'4020000021','VAT On MRC','D',3,0.00,0,0,'VAT On MRC','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1587,165,NULL,'4020000022','VAT on OTC','D',3,0.00,0,0,'VAT on OTC','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1588,167,NULL,'5010000001','Digital Data Processing Income (Push SMS)','D',3,0.00,0,0,'Digital Data Processing Income (Push SMS)','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1589,167,NULL,'5010000002','Interactive Voice Recorder Solution','D',3,0.00,0,0,'Interactive Voice Recorder Solution','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1590,167,NULL,'5010000003','Email Marketing Solution','D',3,0.00,0,0,'Email Marketing Solution','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1591,167,NULL,'5010000004','Hosting','D',3,0.00,0,0,'Hosting','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1592,167,NULL,'5010000005','Call center solution','D',3,0.00,0,0,'Call center solution','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1593,167,NULL,'5010000006','SSL Certificate','D',3,0.00,0,0,'SSL Certificate','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1594,167,NULL,'5010000007','Digital Advertisement Placement','D',3,0.00,0,0,'Digital Advertisement Placement','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1595,167,NULL,'5010000008','Digital Campaign','D',3,0.00,0,0,'Digital Campaign','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1596,167,NULL,'5010000009','Data Pack','D',3,0.00,0,0,'Data Pack','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1597,167,NULL,'5010000010','Security Solution','D',3,0.00,0,0,'Security Solution','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1598,167,NULL,'5010000011','Bandwidth Connection Charge','D',3,0.00,0,0,'Bandwidth Connection Charge','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1599,167,NULL,'5010000012','Revenue Sharing Charge','D',3,0.00,0,0,'Revenue Sharing Charge','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1600,167,NULL,'5010000013','Short Code Start Up Fee','D',3,0.00,0,0,'Short Code Start Up Fee','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1601,167,NULL,'5010000014','Top Up and Card Recharge Commission ','D',3,0.00,0,0,'Top Up and Card Recharge Commission ','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1602,169,NULL,'5020100001','Dep. Network Equipment','D',3,0.00,0,0,'Dep. Network Equipment','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1603,169,NULL,'5020100002','Dep. Server Equipment','D',3,0.00,0,0,'Dep. Server Equipment','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1604,169,NULL,'5020100003','Dep. Software Spares & Accessories','D',3,0.00,0,0,'Dep. Software Spares & Accessories','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1605,170,NULL,'5020200001','BFSI','D',3,0.00,0,0,'BFSI','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1606,170,NULL,'5020200002','BD','D',3,0.00,0,0,'BD','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1607,170,NULL,'5020200003','ESD-VAS','D',3,0.00,0,0,'ESD-VAS','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1608,170,NULL,'5020200004','ECOM','D',3,0.00,0,0,'ECOM','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1609,170,NULL,'5020200005','Government','D',3,0.00,0,0,'Government','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1610,172,NULL,'6010100001','Vehicle rent and maintenance ','D',3,0.00,0,0,'Vehicle rent and maintenance ','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1611,172,NULL,'6010100002','Cable','D',3,0.00,0,0,'Cable','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1612,172,NULL,'6010100003','Entertainment','D',3,0.00,0,0,'Entertainment','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1613,172,NULL,'6010100004','Generator fuel and maintenance ','D',3,0.00,0,0,'Generator fuel and maintenance ','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1614,172,NULL,'6010100005','Legal and Professional Fees','D',3,0.00,0,0,'Legal and Professional Fees','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1615,172,NULL,'6010100006','Membership Subscription Fees','D',3,0.00,0,0,'Membership Subscription Fees','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1616,172,NULL,'6010100007','Office Maintenance Expense','D',3,0.00,0,0,'Office Maintenance Expense','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1617,172,NULL,'6010100008','Postage, Courier and Others','D',3,0.00,0,0,'Postage, Courier and Others','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1618,172,NULL,'6010100009','Printing and Stationery','D',3,0.00,0,0,'Printing and Stationery','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1619,172,NULL,'6010100010','Rent, Rates, and Taxes Incl. Lease payment ','D',3,0.00,0,0,'Rent, Rates, and Taxes Incl. Lease payment ','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1620,172,NULL,'6010100011','Salary and Allowances Exp.','D',3,0.00,0,0,'Salary and Allowances Exp.','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1621,172,NULL,'6010100012','Telephone and Mobile bill','D',3,0.00,0,0,'Telephone and Mobile bill','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1622,172,NULL,'6010100013','Exchange (Gain)/Loss','D',3,0.00,0,0,'Exchange (Gain)/Loss','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1623,172,NULL,'6010100014','Training & Development Expenses','D',3,0.00,0,0,'Training & Development Expenses','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1624,172,NULL,'6010100015','Water, Electricity & Gas','D',3,0.00,0,0,'Water, Electricity & Gas','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1625,172,NULL,'6010100016','Welfare & Recreation','D',3,0.00,0,0,'Welfare & Recreation','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1626,172,NULL,'6010100017','Computer Expenses(Accessories)-AO','D',3,0.00,0,0,'Computer Expenses(Accessories)-AO','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1627,172,NULL,'6010100018','Medical Allowance ','D',3,0.00,0,0,'Medical Allowance ','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1628,172,NULL,'6010100019','Security Guard Expenses','D',3,0.00,0,0,'Security Guard Expenses','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1629,172,NULL,'6010100020','Audit Fee','D',3,0.00,0,0,'Audit Fee','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1630,172,NULL,'6010100021','Provision for loan receivable write-off','D',3,0.00,0,0,'Provision for loan receivable write-off','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1631,172,NULL,'6010100022','Provision for bad debts','D',3,0.00,0,0,'Provision for bad debts','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1632,172,NULL,'6010100023','Impairment of Assets','D',3,0.00,0,0,'Impairment of Assets','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1633,173,NULL,'6010200001','Dep. Building','D',3,0.00,0,0,'Dep. Building','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1634,173,NULL,'6010200002','Dep. Air Conditioner','D',3,0.00,0,0,'Dep. Air Conditioner','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1635,173,NULL,'6010200003','Dep. Motor Vehicle','D',3,0.00,0,0,'Dep. Motor Vehicle','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1636,173,NULL,'6010200004','Dep. Revonation','D',3,0.00,0,0,'Dep. Revonation','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1637,173,NULL,'6010200005','Dep. Computer Equipment','D',3,0.00,0,0,'Dep. Computer Equipment','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1638,173,NULL,'6010200006','Dep. Fixture & Furniture','D',3,0.00,0,0,'Dep. Fixture & Furniture','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1639,173,NULL,'6010200007','Dep. Office Equipment','D',3,0.00,0,0,'Dep. Office Equipment','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1640,173,NULL,'6010200008','Dep. Power Equipment','D',3,0.00,0,0,'Dep. Power Equipment','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1641,173,NULL,'6010200009','Dep. Security Equipment','D',3,0.00,0,0,'Dep. Security Equipment','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1642,173,NULL,'6010200010','Dep. Right of Use Asset','D',3,0.00,0,0,'Dep. Right of Use Asset','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1643,175,NULL,'7010000001','Advertisement & Business Promotional ','D',3,0.00,0,0,'Advertisement & Business Promotional ','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1644,175,NULL,'7010000002','Business Promotional Expenses','D',3,0.00,0,0,'Business Promotional Expenses','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1645,175,NULL,'7010000003','Salary & Allowances','D',3,0.00,0,0,'Salary & Allowances','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1646,176,NULL,'7020000001','Traveling and conveyance ','D',3,0.00,0,0,'Traveling and conveyance ','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1647,176,NULL,'7020000002','Gift and customer promotion','D',3,0.00,0,0,'Gift and customer promotion','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1648,178,NULL,'8010000001','Bank Charges','D',3,0.00,0,0,'Bank Charges','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1649,178,NULL,'8010000002','Excise Duty','D',3,0.00,0,0,'Excise Duty','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1650,179,NULL,'8020000001','Bank Interest - LTL','D',3,0.00,0,0,'Bank Interest - LTL','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1651,179,NULL,'8020000002','Bank Interest - STL','D',3,0.00,0,0,'Bank Interest - STL','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1652,179,NULL,'8020000003','Bank Interest - OD','D',3,0.00,0,0,'Bank Interest - OD','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1653,179,NULL,'8020000004','Interest - Lease Finance','D',3,0.00,0,0,'Interest - Lease Finance','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1654,181,NULL,'9010000001','Interest on FDR','D',3,0.00,0,0,'Interest on FDR','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1655,181,NULL,'9010000002','Interest on Current Account','D',3,0.00,0,0,'Interest on Current Account','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1656,181,NULL,'9010000003','Interest on TCS Account','D',3,0.00,0,0,'Interest on TCS Account','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1657,182,NULL,'9020000001','Forex Gain/Loss','D',3,0.00,0,0,'Forex Gain/Loss','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:54','2024-03-11 13:08:54',NULL),(1658,182,NULL,'9020000002','Profit/Loss on Disposal of NCA','D',3,0.00,0,0,'Profit/Loss on Disposal of NCA','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:55','2024-03-11 13:08:55',NULL),(1659,182,NULL,'9020000003','Scrap Sales','D',3,0.00,0,0,'Scrap Sales','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:55','2024-03-11 13:08:55',NULL),(1660,183,NULL,'10000000001','Current Tax Expense','D',3,0.00,0,0,'Current Tax Expense','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:55','2024-03-11 13:08:55',NULL),(1661,183,NULL,'10000000002','Deferred Tax Expense','D',3,0.00,0,0,'Deferred Tax Expense','yes','approved','approved','approved',1,NULL,'2024-03-11 13:08:55','2024-03-11 13:08:55',NULL),(1662,140,NULL,'1030705000','Default Bank Account','D',0,0.00,0,0,'Default Bank Account','yes','approved','approved','approved',22,22,'2024-03-12 10:46:29','2024-03-12 10:46:29',NULL);

/*Table structure for table `cheque_book_page_entries` */

DROP TABLE IF EXISTS `cheque_book_page_entries`;

CREATE TABLE `cheque_book_page_entries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cheque_book_page_id` bigint(20) unsigned NOT NULL,
  `entry_id` bigint(20) DEFAULT '0',
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cheque_book_page_entries_cheque_book_page_id_foreign` (`cheque_book_page_id`),
  KEY `cheque_book_page_entries_created_by_foreign` (`created_by`),
  KEY `cheque_book_page_entries_updated_by_foreign` (`updated_by`),
  CONSTRAINT `cheque_book_page_entries_cheque_book_page_id_foreign` FOREIGN KEY (`cheque_book_page_id`) REFERENCES `cheque_book_pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cheque_book_page_entries_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cheque_book_page_entries_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cheque_book_page_entries` */

/*Table structure for table `cheque_book_pages` */

DROP TABLE IF EXISTS `cheque_book_pages`;

CREATE TABLE `cheque_book_pages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cheque_book_id` bigint(20) unsigned NOT NULL,
  `page_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_damaged` int(11) NOT NULL DEFAULT '0',
  `status` enum('pending','approved') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `damaged_at` datetime DEFAULT NULL,
  `damage_reason` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cheque_book_pages_cheque_book_id_foreign` (`cheque_book_id`),
  KEY `cheque_book_pages_created_by_foreign` (`created_by`),
  KEY `cheque_book_pages_updated_by_foreign` (`updated_by`),
  CONSTRAINT `cheque_book_pages_cheque_book_id_foreign` FOREIGN KEY (`cheque_book_id`) REFERENCES `cheque_books` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cheque_book_pages_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cheque_book_pages_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cheque_book_pages` */

/*Table structure for table `cheque_books` */

DROP TABLE IF EXISTS `cheque_books`;

CREATE TABLE `cheque_books` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `bank_account_id` bigint(20) unsigned NOT NULL,
  `book_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `receiving_date` date NOT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cheque_books_bank_account_id_foreign` (`bank_account_id`),
  KEY `cheque_books_created_by_foreign` (`created_by`),
  KEY `cheque_books_updated_by_foreign` (`updated_by`),
  CONSTRAINT `cheque_books_bank_account_id_foreign` FOREIGN KEY (`bank_account_id`) REFERENCES `bank_accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cheque_books_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cheque_books_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cheque_books` */

/*Table structure for table `cheque_registers` */

DROP TABLE IF EXISTS `cheque_registers`;

CREATE TABLE `cheque_registers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `bank_account_id` bigint(20) unsigned NOT NULL,
  `entry_id` bigint(20) unsigned NOT NULL,
  `supplier_ledger_id` bigint(20) NOT NULL,
  `datetime` datetime NOT NULL,
  `source` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payee_name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cheque_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `debit_credit` enum('D','C') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'D',
  `amount` double NOT NULL DEFAULT '0',
  `narration` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cheque_registers_bank_account_id_foreign` (`bank_account_id`),
  KEY `cheque_registers_entry_id_foreign` (`entry_id`),
  KEY `cheque_registers_created_by_foreign` (`created_by`),
  KEY `cheque_registers_updated_by_foreign` (`updated_by`),
  CONSTRAINT `cheque_registers_bank_account_id_foreign` FOREIGN KEY (`bank_account_id`) REFERENCES `bank_accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cheque_registers_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cheque_registers_entry_id_foreign` FOREIGN KEY (`entry_id`) REFERENCES `entries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cheque_registers_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cheque_registers` */

/*Table structure for table `clearings` */

DROP TABLE IF EXISTS `clearings`;

CREATE TABLE `clearings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('payable','receivable') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'payable',
  `ledgers` text COLLATE utf8mb4_unicode_ci,
  `entry_id` bigint(20) unsigned NOT NULL,
  `entry_items` text COLLATE utf8mb4_unicode_ci,
  `is_cancelled` int(11) NOT NULL DEFAULT '0',
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clearings_entry_id_foreign` (`entry_id`),
  KEY `clearings_created_by_foreign` (`created_by`),
  KEY `clearings_updated_by_foreign` (`updated_by`),
  CONSTRAINT `clearings_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `clearings_entry_id_foreign` FOREIGN KEY (`entry_id`) REFERENCES `entries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `clearings_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `clearings` */

/*Table structure for table `companies` */

DROP TABLE IF EXISTS `companies`;

CREATE TABLE `companies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `logo` text COLLATE utf8mb4_unicode_ci,
  `banner` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `companies_created_by_foreign` (`created_by`),
  KEY `companies_updated_by_foreign` (`updated_by`),
  CONSTRAINT `companies_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `companies_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `companies` */

insert  into `companies`(`id`,`code`,`name`,`owner_name`,`phone`,`email`,`address`,`logo`,`banner`,`created_by`,`updated_by`,`deleted_at`,`created_at`,`updated_at`) values (2,'SSLC','SSLCOMMERZ LIMITED','SSL','01234567890','email@example.com','Dhaka','upload/company/logo/2023/12/23/768231223105152.png','upload/company/banner/2023/12/23/792231223105152.png',22,1,NULL,'2022-04-01 14:42:47','2023-12-23 10:51:52'),(5,'SSL','SOFTWARE SHOP LTD.','SSL','01234567890','info@email.com','Dhaka','upload/company/logo/2023/08/22/698220823091809.png','upload/company/banner/2023/08/22/147220823091809.png',1,1,NULL,'2023-08-22 09:18:09','2023-12-23 10:37:21'),(9,'NGA','NGAGE 360 LIMITED','SSL','01234567890','email@example.com','Dhaka','upload/company/logo/2023/12/23/934231223104658.png','upload/company/banner/2023/12/23/320231223104658.png',1,1,NULL,'2023-12-23 10:46:58','2023-12-23 10:46:58'),(10,'CGL','CONCORDE GARMENTS LIMITED','SSL','01234567890','email@example.com','Dhaka','upload/company/logo/2023/12/23/12231223104851.png','upload/company/banner/2023/12/23/266231223104851.png',1,1,NULL,'2023-12-23 10:48:51','2023-12-23 10:48:51'),(11,'OIL','OSMAN INTERLINING LIMITED','SSL','01234567890','email@example.com','Dhaka','upload/company/logo/2023/12/23/621231223104928.png','upload/company/banner/2023/12/23/304231223104928.png',1,1,NULL,'2023-12-23 10:49:28','2023-12-23 10:49:28'),(12,'OTL','OTL DOUBLEGULL MANUFACTURING CO. LTD.','SSL','01234567890','email@example.com','Dhaka','upload/company/logo/2023/12/23/51231223104947.png','upload/company/banner/2023/12/23/686231223104947.png',1,1,NULL,'2023-12-23 10:49:47','2023-12-23 10:49:47');

/*Table structure for table `control_points` */

DROP TABLE IF EXISTS `control_points`;

CREATE TABLE `control_points` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `control_points_created_by_foreign` (`created_by`),
  KEY `control_points_updated_by_foreign` (`updated_by`),
  CONSTRAINT `control_points_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `control_points_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `control_points` */

insert  into `control_points`(`id`,`code`,`name`,`description`,`created_by`,`updated_by`,`deleted_at`,`created_at`,`updated_at`) values (1,'01','Authorization',NULL,22,NULL,NULL,'2024-02-01 14:24:29','2024-02-01 14:24:29'),(2,'02','Reconciliation',NULL,22,NULL,NULL,'2024-02-01 14:24:34','2024-02-01 14:24:34'),(3,'03','Review',NULL,22,NULL,NULL,'2024-02-01 14:24:38','2024-02-01 14:24:38'),(4,'04','Observation',NULL,22,NULL,NULL,'2024-02-01 14:24:46','2024-02-01 14:24:46'),(5,'05','Validation',NULL,22,NULL,NULL,'2024-02-01 14:24:54','2024-02-01 14:24:54'),(6,'06','Physical Control',NULL,22,22,NULL,'2024-02-01 14:24:59','2024-02-01 14:25:20');

/*Table structure for table `cost_centres` */

DROP TABLE IF EXISTS `cost_centres`;

CREATE TABLE `cost_centres` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `profit_centre_id` bigint(20) unsigned DEFAULT NULL,
  `hr_unit_id` int(20) unsigned NOT NULL DEFAULT '1',
  `hr_department_id` int(20) unsigned NOT NULL DEFAULT '0',
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `logo` text COLLATE utf8mb4_unicode_ci,
  `banner` text COLLATE utf8mb4_unicode_ci,
  `chart_of_account_id` bigint(20) unsigned NOT NULL DEFAULT '184',
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cost_centres_created_by_foreign` (`created_by`),
  KEY `cost_centres_updated_by_foreign` (`updated_by`),
  KEY `cost_centres_hr_unit_id_foreign` (`hr_unit_id`),
  KEY `cost_centres_hr_department_id_foreign` (`hr_department_id`),
  KEY `cost_centres_chart_of_account_id_foreign` (`chart_of_account_id`),
  KEY `cost_centres_profit_centre_id_foreign` (`profit_centre_id`),
  CONSTRAINT `cost_centres_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cost_centres_hr_unit_id_foreign` FOREIGN KEY (`hr_unit_id`) REFERENCES `hr_unit` (`hr_unit_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cost_centres_ibfk_1` FOREIGN KEY (`chart_of_account_id`) REFERENCES `chart_of_accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cost_centres_profit_centre_id_foreign` FOREIGN KEY (`profit_centre_id`) REFERENCES `profit_centres` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cost_centres_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1662 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cost_centres` */

insert  into `cost_centres`(`id`,`profit_centre_id`,`hr_unit_id`,`hr_department_id`,`code`,`name`,`phone`,`email`,`address`,`logo`,`banner`,`chart_of_account_id`,`created_by`,`updated_by`,`deleted_at`,`created_at`,`updated_at`) values (1002,38,2,0,'SSLCBU1000SF1000','Admin ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:40','2024-03-11 15:09:40'),(1003,39,2,0,'SSLCBU2000SF1000','Admin ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:40','2024-03-11 15:09:40'),(1004,40,2,0,'SSLCBU3000SF1000','Admin ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:40','2024-03-11 15:09:40'),(1005,41,2,0,'SSLCBU4200SF1000','Admin ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1006,42,2,0,'SSLCBU5000SF1000','Admin ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1007,43,1,0,'SSLBU1000SF1000','Admin ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1008,44,1,0,'SSLBU2000SF1000','Admin ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1009,45,1,0,'SSLBU3000SF1000','Admin ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1010,46,1,0,'SSLBU4200SF1000','Admin ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1011,47,1,0,'SSLBU5000SF1000','Admin ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1012,48,3,0,'NGABU1000SF1000','Admin ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1013,49,3,0,'NGABU2000SF1000','Admin ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1014,50,3,0,'NGABU3000SF1000','Admin ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1015,51,3,0,'NGABU4200SF1000','Admin ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1016,52,3,0,'NGABU5000SF1000','Admin ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1017,53,4,0,'CGLBU1000SF1000','Admin ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1018,54,4,0,'CGLBU2000SF1000','Admin ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1019,55,4,0,'CGLBU3000SF1000','Admin ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1020,56,4,0,'CGLBU4200SF1000','Admin ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1021,57,4,0,'CGLBU5000SF1000','Admin ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1022,58,8,0,'OILBU1000SF1000','Admin ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1023,59,8,0,'OILBU2000SF1000','Admin ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1024,60,8,0,'OILBU3000SF1000','Admin ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1025,61,8,0,'OILBU4200SF1000','Admin ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1026,62,8,0,'OILBU5000SF1000','Admin ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1027,63,9,0,'OTLBU1000SF1000','Admin ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1028,64,9,0,'OTLBU2000SF1000','Admin ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1029,65,9,0,'OTLBU3000SF1000','Admin ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1030,66,9,0,'OTLBU4200SF1000','Admin ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1031,67,9,0,'OTLBU5000SF1000','Admin ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1032,38,2,0,'SSLCBU1000SF2000','Cyber & Information Security ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1033,39,2,0,'SSLCBU2000SF2000','Cyber & Information Security ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1034,40,2,0,'SSLCBU3000SF2000','Cyber & Information Security ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1035,41,2,0,'SSLCBU4200SF2000','Cyber & Information Security ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1036,42,2,0,'SSLCBU5000SF2000','Cyber & Information Security ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1037,43,1,0,'SSLBU1000SF2000','Cyber & Information Security ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1038,44,1,0,'SSLBU2000SF2000','Cyber & Information Security ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1039,45,1,0,'SSLBU3000SF2000','Cyber & Information Security ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1040,46,1,0,'SSLBU4200SF2000','Cyber & Information Security ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1041,47,1,0,'SSLBU5000SF2000','Cyber & Information Security ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1042,48,3,0,'NGABU1000SF2000','Cyber & Information Security ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1043,49,3,0,'NGABU2000SF2000','Cyber & Information Security ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1044,50,3,0,'NGABU3000SF2000','Cyber & Information Security ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1045,51,3,0,'NGABU4200SF2000','Cyber & Information Security ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1046,52,3,0,'NGABU5000SF2000','Cyber & Information Security ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1047,53,4,0,'CGLBU1000SF2000','Cyber & Information Security ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1048,54,4,0,'CGLBU2000SF2000','Cyber & Information Security ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1049,55,4,0,'CGLBU3000SF2000','Cyber & Information Security ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1050,56,4,0,'CGLBU4200SF2000','Cyber & Information Security ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1051,57,4,0,'CGLBU5000SF2000','Cyber & Information Security ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1052,58,8,0,'OILBU1000SF2000','Cyber & Information Security ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1053,59,8,0,'OILBU2000SF2000','Cyber & Information Security ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1054,60,8,0,'OILBU3000SF2000','Cyber & Information Security ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1055,61,8,0,'OILBU4200SF2000','Cyber & Information Security ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1056,62,8,0,'OILBU5000SF2000','Cyber & Information Security ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1057,63,9,0,'OTLBU1000SF2000','Cyber & Information Security ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1058,64,9,0,'OTLBU2000SF2000','Cyber & Information Security ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1059,65,9,0,'OTLBU3000SF2000','Cyber & Information Security ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1060,66,9,0,'OTLBU4200SF2000','Cyber & Information Security ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1061,67,9,0,'OTLBU5000SF2000','Cyber & Information Security ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1062,38,2,0,'SSLCBU1000SF3000','Data','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1063,39,2,0,'SSLCBU2000SF3000','Data','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1064,40,2,0,'SSLCBU3000SF3000','Data','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1065,41,2,0,'SSLCBU4200SF3000','Data','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1066,42,2,0,'SSLCBU5000SF3000','Data','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1067,43,1,0,'SSLBU1000SF3000','Data','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1068,44,1,0,'SSLBU2000SF3000','Data','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1069,45,1,0,'SSLBU3000SF3000','Data','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1070,46,1,0,'SSLBU4200SF3000','Data','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1071,47,1,0,'SSLBU5000SF3000','Data','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1072,48,3,0,'NGABU1000SF3000','Data','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1073,49,3,0,'NGABU2000SF3000','Data','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1074,50,3,0,'NGABU3000SF3000','Data','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1075,51,3,0,'NGABU4200SF3000','Data','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1076,52,3,0,'NGABU5000SF3000','Data','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1077,53,4,0,'CGLBU1000SF3000','Data','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1078,54,4,0,'CGLBU2000SF3000','Data','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1079,55,4,0,'CGLBU3000SF3000','Data','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1080,56,4,0,'CGLBU4200SF3000','Data','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1081,57,4,0,'CGLBU5000SF3000','Data','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1082,58,8,0,'OILBU1000SF3000','Data','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1083,59,8,0,'OILBU2000SF3000','Data','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1084,60,8,0,'OILBU3000SF3000','Data','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1085,61,8,0,'OILBU4200SF3000','Data','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1086,62,8,0,'OILBU5000SF3000','Data','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1087,63,9,0,'OTLBU1000SF3000','Data','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1088,64,9,0,'OTLBU2000SF3000','Data','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1089,65,9,0,'OTLBU3000SF3000','Data','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1090,66,9,0,'OTLBU4200SF3000','Data','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1091,67,9,0,'OTLBU5000SF3000','Data','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1092,38,2,0,'SSLCBU1000SF4000','Documentation & External Audit','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1093,39,2,0,'SSLCBU2000SF4000','Documentation & External Audit','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1094,40,2,0,'SSLCBU3000SF4000','Documentation & External Audit','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1095,41,2,0,'SSLCBU4200SF4000','Documentation & External Audit','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1096,42,2,0,'SSLCBU5000SF4000','Documentation & External Audit','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1097,43,1,0,'SSLBU1000SF4000','Documentation & External Audit','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1098,44,1,0,'SSLBU2000SF4000','Documentation & External Audit','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1099,45,1,0,'SSLBU3000SF4000','Documentation & External Audit','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1100,46,1,0,'SSLBU4200SF4000','Documentation & External Audit','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1101,47,1,0,'SSLBU5000SF4000','Documentation & External Audit','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1102,48,3,0,'NGABU1000SF4000','Documentation & External Audit','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1103,49,3,0,'NGABU2000SF4000','Documentation & External Audit','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1104,50,3,0,'NGABU3000SF4000','Documentation & External Audit','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1105,51,3,0,'NGABU4200SF4000','Documentation & External Audit','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1106,52,3,0,'NGABU5000SF4000','Documentation & External Audit','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1107,53,4,0,'CGLBU1000SF4000','Documentation & External Audit','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1108,54,4,0,'CGLBU2000SF4000','Documentation & External Audit','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1109,55,4,0,'CGLBU3000SF4000','Documentation & External Audit','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1110,56,4,0,'CGLBU4200SF4000','Documentation & External Audit','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1111,57,4,0,'CGLBU5000SF4000','Documentation & External Audit','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1112,58,8,0,'OILBU1000SF4000','Documentation & External Audit','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1113,59,8,0,'OILBU2000SF4000','Documentation & External Audit','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1114,60,8,0,'OILBU3000SF4000','Documentation & External Audit','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1115,61,8,0,'OILBU4200SF4000','Documentation & External Audit','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1116,62,8,0,'OILBU5000SF4000','Documentation & External Audit','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1117,63,9,0,'OTLBU1000SF4000','Documentation & External Audit','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1118,64,9,0,'OTLBU2000SF4000','Documentation & External Audit','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1119,65,9,0,'OTLBU3000SF4000','Documentation & External Audit','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1120,66,9,0,'OTLBU4200SF4000','Documentation & External Audit','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1121,67,9,0,'OTLBU5000SF4000','Documentation & External Audit','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1122,38,2,0,'SSLCBU1000SF5000','Engineering','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1123,39,2,0,'SSLCBU2000SF5000','Engineering','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1124,40,2,0,'SSLCBU3000SF5000','Engineering','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1125,41,2,0,'SSLCBU4200SF5000','Engineering','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1126,42,2,0,'SSLCBU5000SF5000','Engineering','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1127,43,1,0,'SSLBU1000SF5000','Engineering','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1128,44,1,0,'SSLBU2000SF5000','Engineering','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1129,45,1,0,'SSLBU3000SF5000','Engineering','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1130,46,1,0,'SSLBU4200SF5000','Engineering','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1131,47,1,0,'SSLBU5000SF5000','Engineering','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1132,48,3,0,'NGABU1000SF5000','Engineering','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1133,49,3,0,'NGABU2000SF5000','Engineering','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1134,50,3,0,'NGABU3000SF5000','Engineering','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1135,51,3,0,'NGABU4200SF5000','Engineering','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1136,52,3,0,'NGABU5000SF5000','Engineering','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1137,53,4,0,'CGLBU1000SF5000','Engineering','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1138,54,4,0,'CGLBU2000SF5000','Engineering','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1139,55,4,0,'CGLBU3000SF5000','Engineering','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1140,56,4,0,'CGLBU4200SF5000','Engineering','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1141,57,4,0,'CGLBU5000SF5000','Engineering','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1142,58,8,0,'OILBU1000SF5000','Engineering','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1143,59,8,0,'OILBU2000SF5000','Engineering','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1144,60,8,0,'OILBU3000SF5000','Engineering','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1145,61,8,0,'OILBU4200SF5000','Engineering','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1146,62,8,0,'OILBU5000SF5000','Engineering','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1147,63,9,0,'OTLBU1000SF5000','Engineering','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1148,64,9,0,'OTLBU2000SF5000','Engineering','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1149,65,9,0,'OTLBU3000SF5000','Engineering','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1150,66,9,0,'OTLBU4200SF5000','Engineering','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1151,67,9,0,'OTLBU5000SF5000','Engineering','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1152,38,2,0,'SSLCBU1000SF6000','External Affairs','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1153,39,2,0,'SSLCBU2000SF6000','External Affairs','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1154,40,2,0,'SSLCBU3000SF6000','External Affairs','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1155,41,2,0,'SSLCBU4200SF6000','External Affairs','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1156,42,2,0,'SSLCBU5000SF6000','External Affairs','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1157,43,1,0,'SSLBU1000SF6000','External Affairs','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1158,44,1,0,'SSLBU2000SF6000','External Affairs','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1159,45,1,0,'SSLBU3000SF6000','External Affairs','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1160,46,1,0,'SSLBU4200SF6000','External Affairs','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1161,47,1,0,'SSLBU5000SF6000','External Affairs','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1162,48,3,0,'NGABU1000SF6000','External Affairs','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1163,49,3,0,'NGABU2000SF6000','External Affairs','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1164,50,3,0,'NGABU3000SF6000','External Affairs','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1165,51,3,0,'NGABU4200SF6000','External Affairs','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1166,52,3,0,'NGABU5000SF6000','External Affairs','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1167,53,4,0,'CGLBU1000SF6000','External Affairs','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1168,54,4,0,'CGLBU2000SF6000','External Affairs','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1169,55,4,0,'CGLBU3000SF6000','External Affairs','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1170,56,4,0,'CGLBU4200SF6000','External Affairs','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1171,57,4,0,'CGLBU5000SF6000','External Affairs','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1172,58,8,0,'OILBU1000SF6000','External Affairs','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1173,59,8,0,'OILBU2000SF6000','External Affairs','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1174,60,8,0,'OILBU3000SF6000','External Affairs','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1175,61,8,0,'OILBU4200SF6000','External Affairs','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1176,62,8,0,'OILBU5000SF6000','External Affairs','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1177,63,9,0,'OTLBU1000SF6000','External Affairs','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1178,64,9,0,'OTLBU2000SF6000','External Affairs','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1179,65,9,0,'OTLBU3000SF6000','External Affairs','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1180,66,9,0,'OTLBU4200SF6000','External Affairs','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1181,67,9,0,'OTLBU5000SF6000','External Affairs','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1182,38,2,0,'SSLCBU1000SF7000','Finance & Accounts','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1183,39,2,0,'SSLCBU2000SF7000','Finance & Accounts','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1184,40,2,0,'SSLCBU3000SF7000','Finance & Accounts','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1185,41,2,0,'SSLCBU4200SF7000','Finance & Accounts','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1186,42,2,0,'SSLCBU5000SF7000','Finance & Accounts','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1187,43,1,0,'SSLBU1000SF7000','Finance & Accounts','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1188,44,1,0,'SSLBU2000SF7000','Finance & Accounts','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1189,45,1,0,'SSLBU3000SF7000','Finance & Accounts','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1190,46,1,0,'SSLBU4200SF7000','Finance & Accounts','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1191,47,1,0,'SSLBU5000SF7000','Finance & Accounts','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1192,48,3,0,'NGABU1000SF7000','Finance & Accounts','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1193,49,3,0,'NGABU2000SF7000','Finance & Accounts','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1194,50,3,0,'NGABU3000SF7000','Finance & Accounts','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1195,51,3,0,'NGABU4200SF7000','Finance & Accounts','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1196,52,3,0,'NGABU5000SF7000','Finance & Accounts','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1197,53,4,0,'CGLBU1000SF7000','Finance & Accounts','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1198,54,4,0,'CGLBU2000SF7000','Finance & Accounts','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1199,55,4,0,'CGLBU3000SF7000','Finance & Accounts','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1200,56,4,0,'CGLBU4200SF7000','Finance & Accounts','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1201,57,4,0,'CGLBU5000SF7000','Finance & Accounts','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1202,58,8,0,'OILBU1000SF7000','Finance & Accounts','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1203,59,8,0,'OILBU2000SF7000','Finance & Accounts','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1204,60,8,0,'OILBU3000SF7000','Finance & Accounts','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1205,61,8,0,'OILBU4200SF7000','Finance & Accounts','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1206,62,8,0,'OILBU5000SF7000','Finance & Accounts','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1207,63,9,0,'OTLBU1000SF7000','Finance & Accounts','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1208,64,9,0,'OTLBU2000SF7000','Finance & Accounts','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1209,65,9,0,'OTLBU3000SF7000','Finance & Accounts','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1210,66,9,0,'OTLBU4200SF7000','Finance & Accounts','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1211,67,9,0,'OTLBU5000SF7000','Finance & Accounts','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1212,38,2,0,'SSLCBU1000SF8000','Human Resources','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1213,39,2,0,'SSLCBU2000SF8000','Human Resources','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1214,40,2,0,'SSLCBU3000SF8000','Human Resources','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1215,41,2,0,'SSLCBU4200SF8000','Human Resources','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1216,42,2,0,'SSLCBU5000SF8000','Human Resources','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1217,43,1,0,'SSLBU1000SF8000','Human Resources','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1218,44,1,0,'SSLBU2000SF8000','Human Resources','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1219,45,1,0,'SSLBU3000SF8000','Human Resources','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1220,46,1,0,'SSLBU4200SF8000','Human Resources','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1221,47,1,0,'SSLBU5000SF8000','Human Resources','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1222,48,3,0,'NGABU1000SF8000','Human Resources','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1223,49,3,0,'NGABU2000SF8000','Human Resources','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1224,50,3,0,'NGABU3000SF8000','Human Resources','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1225,51,3,0,'NGABU4200SF8000','Human Resources','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1226,52,3,0,'NGABU5000SF8000','Human Resources','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1227,53,4,0,'CGLBU1000SF8000','Human Resources','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1228,54,4,0,'CGLBU2000SF8000','Human Resources','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1229,55,4,0,'CGLBU3000SF8000','Human Resources','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1230,56,4,0,'CGLBU4200SF8000','Human Resources','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1231,57,4,0,'CGLBU5000SF8000','Human Resources','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1232,58,8,0,'OILBU1000SF8000','Human Resources','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1233,59,8,0,'OILBU2000SF8000','Human Resources','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1234,60,8,0,'OILBU3000SF8000','Human Resources','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1235,61,8,0,'OILBU4200SF8000','Human Resources','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1236,62,8,0,'OILBU5000SF8000','Human Resources','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1237,63,9,0,'OTLBU1000SF8000','Human Resources','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1238,64,9,0,'OTLBU2000SF8000','Human Resources','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1239,65,9,0,'OTLBU3000SF8000','Human Resources','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1240,66,9,0,'OTLBU4200SF8000','Human Resources','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1241,67,9,0,'OTLBU5000SF8000','Human Resources','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1242,38,2,0,'SSLCBU1000SF9000','Innovation Center of Excellence','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1243,39,2,0,'SSLCBU2000SF9000','Innovation Center of Excellence','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1244,40,2,0,'SSLCBU3000SF9000','Innovation Center of Excellence','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1245,41,2,0,'SSLCBU4200SF9000','Innovation Center of Excellence','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1246,42,2,0,'SSLCBU5000SF9000','Innovation Center of Excellence','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1247,43,1,0,'SSLBU1000SF9000','Innovation Center of Excellence','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1248,44,1,0,'SSLBU2000SF9000','Innovation Center of Excellence','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1249,45,1,0,'SSLBU3000SF9000','Innovation Center of Excellence','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1250,46,1,0,'SSLBU4200SF9000','Innovation Center of Excellence','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1251,47,1,0,'SSLBU5000SF9000','Innovation Center of Excellence','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1252,48,3,0,'NGABU1000SF9000','Innovation Center of Excellence','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1253,49,3,0,'NGABU2000SF9000','Innovation Center of Excellence','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1254,50,3,0,'NGABU3000SF9000','Innovation Center of Excellence','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1255,51,3,0,'NGABU4200SF9000','Innovation Center of Excellence','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1256,52,3,0,'NGABU5000SF9000','Innovation Center of Excellence','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1257,53,4,0,'CGLBU1000SF9000','Innovation Center of Excellence','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1258,54,4,0,'CGLBU2000SF9000','Innovation Center of Excellence','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1259,55,4,0,'CGLBU3000SF9000','Innovation Center of Excellence','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1260,56,4,0,'CGLBU4200SF9000','Innovation Center of Excellence','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1261,57,4,0,'CGLBU5000SF9000','Innovation Center of Excellence','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1262,58,8,0,'OILBU1000SF9000','Innovation Center of Excellence','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1263,59,8,0,'OILBU2000SF9000','Innovation Center of Excellence','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1264,60,8,0,'OILBU3000SF9000','Innovation Center of Excellence','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1265,61,8,0,'OILBU4200SF9000','Innovation Center of Excellence','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1266,62,8,0,'OILBU5000SF9000','Innovation Center of Excellence','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1267,63,9,0,'OTLBU1000SF9000','Innovation Center of Excellence','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1268,64,9,0,'OTLBU2000SF9000','Innovation Center of Excellence','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1269,65,9,0,'OTLBU3000SF9000','Innovation Center of Excellence','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1270,66,9,0,'OTLBU4200SF9000','Innovation Center of Excellence','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1271,67,9,0,'OTLBU5000SF9000','Innovation Center of Excellence','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1272,38,2,0,'SSLCBU1000SF1100','Legal Affairs','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1273,39,2,0,'SSLCBU2000SF1100','Legal Affairs','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1274,40,2,0,'SSLCBU3000SF1100','Legal Affairs','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1275,41,2,0,'SSLCBU4200SF1100','Legal Affairs','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1276,42,2,0,'SSLCBU5000SF1100','Legal Affairs','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1277,43,1,0,'SSLBU1000SF1100','Legal Affairs','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1278,44,1,0,'SSLBU2000SF1100','Legal Affairs','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1279,45,1,0,'SSLBU3000SF1100','Legal Affairs','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1280,46,1,0,'SSLBU4200SF1100','Legal Affairs','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1281,47,1,0,'SSLBU5000SF1100','Legal Affairs','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1282,48,3,0,'NGABU1000SF1100','Legal Affairs','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1283,49,3,0,'NGABU2000SF1100','Legal Affairs','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1284,50,3,0,'NGABU3000SF1100','Legal Affairs','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1285,51,3,0,'NGABU4200SF1100','Legal Affairs','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1286,52,3,0,'NGABU5000SF1100','Legal Affairs','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1287,53,4,0,'CGLBU1000SF1100','Legal Affairs','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1288,54,4,0,'CGLBU2000SF1100','Legal Affairs','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1289,55,4,0,'CGLBU3000SF1100','Legal Affairs','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:41','2024-03-11 15:09:41'),(1290,56,4,0,'CGLBU4200SF1100','Legal Affairs','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1291,57,4,0,'CGLBU5000SF1100','Legal Affairs','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1292,58,8,0,'OILBU1000SF1100','Legal Affairs','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1293,59,8,0,'OILBU2000SF1100','Legal Affairs','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1294,60,8,0,'OILBU3000SF1100','Legal Affairs','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1295,61,8,0,'OILBU4200SF1100','Legal Affairs','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1296,62,8,0,'OILBU5000SF1100','Legal Affairs','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1297,63,9,0,'OTLBU1000SF1100','Legal Affairs','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1298,64,9,0,'OTLBU2000SF1100','Legal Affairs','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1299,65,9,0,'OTLBU3000SF1100','Legal Affairs','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1300,66,9,0,'OTLBU4200SF1100','Legal Affairs','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1301,67,9,0,'OTLBU5000SF1100','Legal Affairs','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1302,38,2,0,'SSLCBU1000SF1200','Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1303,39,2,0,'SSLCBU2000SF1200','Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1304,40,2,0,'SSLCBU3000SF1200','Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1305,41,2,0,'SSLCBU4200SF1200','Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1306,42,2,0,'SSLCBU5000SF1200','Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1307,43,1,0,'SSLBU1000SF1200','Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1308,44,1,0,'SSLBU2000SF1200','Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1309,45,1,0,'SSLBU3000SF1200','Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1310,46,1,0,'SSLBU4200SF1200','Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1311,47,1,0,'SSLBU5000SF1200','Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1312,48,3,0,'NGABU1000SF1200','Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1313,49,3,0,'NGABU2000SF1200','Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1314,50,3,0,'NGABU3000SF1200','Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1315,51,3,0,'NGABU4200SF1200','Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1316,52,3,0,'NGABU5000SF1200','Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1317,53,4,0,'CGLBU1000SF1200','Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1318,54,4,0,'CGLBU2000SF1200','Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1319,55,4,0,'CGLBU3000SF1200','Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1320,56,4,0,'CGLBU4200SF1200','Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1321,57,4,0,'CGLBU5000SF1200','Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1322,58,8,0,'OILBU1000SF1200','Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1323,59,8,0,'OILBU2000SF1200','Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1324,60,8,0,'OILBU3000SF1200','Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1325,61,8,0,'OILBU4200SF1200','Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1326,62,8,0,'OILBU5000SF1200','Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1327,63,9,0,'OTLBU1000SF1200','Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1328,64,9,0,'OTLBU2000SF1200','Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1329,65,9,0,'OTLBU3000SF1200','Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1330,66,9,0,'OTLBU4200SF1200','Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1331,67,9,0,'OTLBU5000SF1200','Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1332,38,2,0,'SSLCBU1000SF1300','MIS','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1333,39,2,0,'SSLCBU2000SF1300','MIS','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1334,40,2,0,'SSLCBU3000SF1300','MIS','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1335,41,2,0,'SSLCBU4200SF1300','MIS','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1336,42,2,0,'SSLCBU5000SF1300','MIS','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1337,43,1,0,'SSLBU1000SF1300','MIS','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1338,44,1,0,'SSLBU2000SF1300','MIS','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1339,45,1,0,'SSLBU3000SF1300','MIS','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1340,46,1,0,'SSLBU4200SF1300','MIS','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1341,47,1,0,'SSLBU5000SF1300','MIS','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1342,48,3,0,'NGABU1000SF1300','MIS','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1343,49,3,0,'NGABU2000SF1300','MIS','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1344,50,3,0,'NGABU3000SF1300','MIS','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1345,51,3,0,'NGABU4200SF1300','MIS','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1346,52,3,0,'NGABU5000SF1300','MIS','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1347,53,4,0,'CGLBU1000SF1300','MIS','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1348,54,4,0,'CGLBU2000SF1300','MIS','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1349,55,4,0,'CGLBU3000SF1300','MIS','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1350,56,4,0,'CGLBU4200SF1300','MIS','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1351,57,4,0,'CGLBU5000SF1300','MIS','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1352,58,8,0,'OILBU1000SF1300','MIS','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1353,59,8,0,'OILBU2000SF1300','MIS','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1354,60,8,0,'OILBU3000SF1300','MIS','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1355,61,8,0,'OILBU4200SF1300','MIS','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1356,62,8,0,'OILBU5000SF1300','MIS','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1357,63,9,0,'OTLBU1000SF1300','MIS','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1358,64,9,0,'OTLBU2000SF1300','MIS','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1359,65,9,0,'OTLBU3000SF1300','MIS','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1360,66,9,0,'OTLBU4200SF1300','MIS','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1361,67,9,0,'OTLBU5000SF1300','MIS','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1362,38,2,0,'SSLCBU1000SF1400','Network & Systems ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1363,39,2,0,'SSLCBU2000SF1400','Network & Systems ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1364,40,2,0,'SSLCBU3000SF1400','Network & Systems ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1365,41,2,0,'SSLCBU4200SF1400','Network & Systems ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1366,42,2,0,'SSLCBU5000SF1400','Network & Systems ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1367,43,1,0,'SSLBU1000SF1400','Network & Systems ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1368,44,1,0,'SSLBU2000SF1400','Network & Systems ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1369,45,1,0,'SSLBU3000SF1400','Network & Systems ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1370,46,1,0,'SSLBU4200SF1400','Network & Systems ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1371,47,1,0,'SSLBU5000SF1400','Network & Systems ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1372,48,3,0,'NGABU1000SF1400','Network & Systems ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1373,49,3,0,'NGABU2000SF1400','Network & Systems ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1374,50,3,0,'NGABU3000SF1400','Network & Systems ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1375,51,3,0,'NGABU4200SF1400','Network & Systems ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1376,52,3,0,'NGABU5000SF1400','Network & Systems ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1377,53,4,0,'CGLBU1000SF1400','Network & Systems ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1378,54,4,0,'CGLBU2000SF1400','Network & Systems ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1379,55,4,0,'CGLBU3000SF1400','Network & Systems ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1380,56,4,0,'CGLBU4200SF1400','Network & Systems ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1381,57,4,0,'CGLBU5000SF1400','Network & Systems ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1382,58,8,0,'OILBU1000SF1400','Network & Systems ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1383,59,8,0,'OILBU2000SF1400','Network & Systems ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1384,60,8,0,'OILBU3000SF1400','Network & Systems ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1385,61,8,0,'OILBU4200SF1400','Network & Systems ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1386,62,8,0,'OILBU5000SF1400','Network & Systems ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1387,63,9,0,'OTLBU1000SF1400','Network & Systems ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1388,64,9,0,'OTLBU2000SF1400','Network & Systems ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1389,65,9,0,'OTLBU3000SF1400','Network & Systems ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1390,66,9,0,'OTLBU4200SF1400','Network & Systems ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1391,67,9,0,'OTLBU5000SF1400','Network & Systems ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1392,38,2,0,'SSLCBU1000SF1500','Partnership Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1393,39,2,0,'SSLCBU2000SF1500','Partnership Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1394,40,2,0,'SSLCBU3000SF1500','Partnership Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1395,41,2,0,'SSLCBU4200SF1500','Partnership Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1396,42,2,0,'SSLCBU5000SF1500','Partnership Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1397,43,1,0,'SSLBU1000SF1500','Partnership Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1398,44,1,0,'SSLBU2000SF1500','Partnership Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1399,45,1,0,'SSLBU3000SF1500','Partnership Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1400,46,1,0,'SSLBU4200SF1500','Partnership Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1401,47,1,0,'SSLBU5000SF1500','Partnership Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1402,48,3,0,'NGABU1000SF1500','Partnership Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1403,49,3,0,'NGABU2000SF1500','Partnership Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1404,50,3,0,'NGABU3000SF1500','Partnership Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1405,51,3,0,'NGABU4200SF1500','Partnership Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1406,52,3,0,'NGABU5000SF1500','Partnership Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1407,53,4,0,'CGLBU1000SF1500','Partnership Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1408,54,4,0,'CGLBU2000SF1500','Partnership Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1409,55,4,0,'CGLBU3000SF1500','Partnership Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1410,56,4,0,'CGLBU4200SF1500','Partnership Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1411,57,4,0,'CGLBU5000SF1500','Partnership Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1412,58,8,0,'OILBU1000SF1500','Partnership Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1413,59,8,0,'OILBU2000SF1500','Partnership Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1414,60,8,0,'OILBU3000SF1500','Partnership Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1415,61,8,0,'OILBU4200SF1500','Partnership Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1416,62,8,0,'OILBU5000SF1500','Partnership Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1417,63,9,0,'OTLBU1000SF1500','Partnership Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1418,64,9,0,'OTLBU2000SF1500','Partnership Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1419,65,9,0,'OTLBU3000SF1500','Partnership Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1420,66,9,0,'OTLBU4200SF1500','Partnership Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1421,67,9,0,'OTLBU5000SF1500','Partnership Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1422,38,2,0,'SSLCBU1000SF1600','Procurement','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1423,39,2,0,'SSLCBU2000SF1600','Procurement','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1424,40,2,0,'SSLCBU3000SF1600','Procurement','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1425,41,2,0,'SSLCBU4200SF1600','Procurement','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1426,42,2,0,'SSLCBU5000SF1600','Procurement','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1427,43,1,0,'SSLBU1000SF1600','Procurement','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1428,44,1,0,'SSLBU2000SF1600','Procurement','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1429,45,1,0,'SSLBU3000SF1600','Procurement','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1430,46,1,0,'SSLBU4200SF1600','Procurement','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1431,47,1,0,'SSLBU5000SF1600','Procurement','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1432,48,3,0,'NGABU1000SF1600','Procurement','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1433,49,3,0,'NGABU2000SF1600','Procurement','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1434,50,3,0,'NGABU3000SF1600','Procurement','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1435,51,3,0,'NGABU4200SF1600','Procurement','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1436,52,3,0,'NGABU5000SF1600','Procurement','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1437,53,4,0,'CGLBU1000SF1600','Procurement','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1438,54,4,0,'CGLBU2000SF1600','Procurement','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1439,55,4,0,'CGLBU3000SF1600','Procurement','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1440,56,4,0,'CGLBU4200SF1600','Procurement','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1441,57,4,0,'CGLBU5000SF1600','Procurement','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1442,58,8,0,'OILBU1000SF1600','Procurement','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1443,59,8,0,'OILBU2000SF1600','Procurement','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1444,60,8,0,'OILBU3000SF1600','Procurement','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1445,61,8,0,'OILBU4200SF1600','Procurement','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1446,62,8,0,'OILBU5000SF1600','Procurement','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1447,63,9,0,'OTLBU1000SF1600','Procurement','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1448,64,9,0,'OTLBU2000SF1600','Procurement','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1449,65,9,0,'OTLBU3000SF1600','Procurement','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1450,66,9,0,'OTLBU4200SF1600','Procurement','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1451,67,9,0,'OTLBU5000SF1600','Procurement','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1452,38,2,0,'SSLCBU1000SF1700','Project Management Office','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1453,39,2,0,'SSLCBU2000SF1700','Project Management Office','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1454,40,2,0,'SSLCBU3000SF1700','Project Management Office','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1455,41,2,0,'SSLCBU4200SF1700','Project Management Office','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1456,42,2,0,'SSLCBU5000SF1700','Project Management Office','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1457,43,1,0,'SSLBU1000SF1700','Project Management Office','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1458,44,1,0,'SSLBU2000SF1700','Project Management Office','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1459,45,1,0,'SSLBU3000SF1700','Project Management Office','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1460,46,1,0,'SSLBU4200SF1700','Project Management Office','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1461,47,1,0,'SSLBU5000SF1700','Project Management Office','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1462,48,3,0,'NGABU1000SF1700','Project Management Office','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1463,49,3,0,'NGABU2000SF1700','Project Management Office','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1464,50,3,0,'NGABU3000SF1700','Project Management Office','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1465,51,3,0,'NGABU4200SF1700','Project Management Office','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1466,52,3,0,'NGABU5000SF1700','Project Management Office','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1467,53,4,0,'CGLBU1000SF1700','Project Management Office','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1468,54,4,0,'CGLBU2000SF1700','Project Management Office','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1469,55,4,0,'CGLBU3000SF1700','Project Management Office','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1470,56,4,0,'CGLBU4200SF1700','Project Management Office','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1471,57,4,0,'CGLBU5000SF1700','Project Management Office','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1472,58,8,0,'OILBU1000SF1700','Project Management Office','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1473,59,8,0,'OILBU2000SF1700','Project Management Office','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1474,60,8,0,'OILBU3000SF1700','Project Management Office','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1475,61,8,0,'OILBU4200SF1700','Project Management Office','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1476,62,8,0,'OILBU5000SF1700','Project Management Office','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1477,63,9,0,'OTLBU1000SF1700','Project Management Office','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1478,64,9,0,'OTLBU2000SF1700','Project Management Office','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1479,65,9,0,'OTLBU3000SF1700','Project Management Office','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1480,66,9,0,'OTLBU4200SF1700','Project Management Office','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1481,67,9,0,'OTLBU5000SF1700','Project Management Office','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1482,38,2,0,'SSLCBU1000SF1800','Revenue Assurance','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1483,39,2,0,'SSLCBU2000SF1800','Revenue Assurance','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1484,40,2,0,'SSLCBU3000SF1800','Revenue Assurance','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1485,41,2,0,'SSLCBU4200SF1800','Revenue Assurance','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1486,42,2,0,'SSLCBU5000SF1800','Revenue Assurance','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1487,43,1,0,'SSLBU1000SF1800','Revenue Assurance','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1488,44,1,0,'SSLBU2000SF1800','Revenue Assurance','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1489,45,1,0,'SSLBU3000SF1800','Revenue Assurance','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1490,46,1,0,'SSLBU4200SF1800','Revenue Assurance','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1491,47,1,0,'SSLBU5000SF1800','Revenue Assurance','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1492,48,3,0,'NGABU1000SF1800','Revenue Assurance','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1493,49,3,0,'NGABU2000SF1800','Revenue Assurance','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1494,50,3,0,'NGABU3000SF1800','Revenue Assurance','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1495,51,3,0,'NGABU4200SF1800','Revenue Assurance','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1496,52,3,0,'NGABU5000SF1800','Revenue Assurance','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1497,53,4,0,'CGLBU1000SF1800','Revenue Assurance','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1498,54,4,0,'CGLBU2000SF1800','Revenue Assurance','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1499,55,4,0,'CGLBU3000SF1800','Revenue Assurance','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1500,56,4,0,'CGLBU4200SF1800','Revenue Assurance','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1501,57,4,0,'CGLBU5000SF1800','Revenue Assurance','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1502,58,8,0,'OILBU1000SF1800','Revenue Assurance','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1503,59,8,0,'OILBU2000SF1800','Revenue Assurance','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1504,60,8,0,'OILBU3000SF1800','Revenue Assurance','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1505,61,8,0,'OILBU4200SF1800','Revenue Assurance','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1506,62,8,0,'OILBU5000SF1800','Revenue Assurance','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1507,63,9,0,'OTLBU1000SF1800','Revenue Assurance','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1508,64,9,0,'OTLBU2000SF1800','Revenue Assurance','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1509,65,9,0,'OTLBU3000SF1800','Revenue Assurance','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1510,66,9,0,'OTLBU4200SF1800','Revenue Assurance','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1511,67,9,0,'OTLBU5000SF1800','Revenue Assurance','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1512,38,2,0,'SSLCBU1000SF1900','Risk & Compliance','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1513,39,2,0,'SSLCBU2000SF1900','Risk & Compliance','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1514,40,2,0,'SSLCBU3000SF1900','Risk & Compliance','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1515,41,2,0,'SSLCBU4200SF1900','Risk & Compliance','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1516,42,2,0,'SSLCBU5000SF1900','Risk & Compliance','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1517,43,1,0,'SSLBU1000SF1900','Risk & Compliance','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1518,44,1,0,'SSLBU2000SF1900','Risk & Compliance','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1519,45,1,0,'SSLBU3000SF1900','Risk & Compliance','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1520,46,1,0,'SSLBU4200SF1900','Risk & Compliance','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1521,47,1,0,'SSLBU5000SF1900','Risk & Compliance','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1522,48,3,0,'NGABU1000SF1900','Risk & Compliance','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1523,49,3,0,'NGABU2000SF1900','Risk & Compliance','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1524,50,3,0,'NGABU3000SF1900','Risk & Compliance','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1525,51,3,0,'NGABU4200SF1900','Risk & Compliance','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1526,52,3,0,'NGABU5000SF1900','Risk & Compliance','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1527,53,4,0,'CGLBU1000SF1900','Risk & Compliance','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1528,54,4,0,'CGLBU2000SF1900','Risk & Compliance','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1529,55,4,0,'CGLBU3000SF1900','Risk & Compliance','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1530,56,4,0,'CGLBU4200SF1900','Risk & Compliance','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1531,57,4,0,'CGLBU5000SF1900','Risk & Compliance','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1532,58,8,0,'OILBU1000SF1900','Risk & Compliance','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1533,59,8,0,'OILBU2000SF1900','Risk & Compliance','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1534,60,8,0,'OILBU3000SF1900','Risk & Compliance','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1535,61,8,0,'OILBU4200SF1900','Risk & Compliance','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1536,62,8,0,'OILBU5000SF1900','Risk & Compliance','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1537,63,9,0,'OTLBU1000SF1900','Risk & Compliance','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1538,64,9,0,'OTLBU2000SF1900','Risk & Compliance','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1539,65,9,0,'OTLBU3000SF1900','Risk & Compliance','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1540,66,9,0,'OTLBU4200SF1900','Risk & Compliance','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1541,67,9,0,'OTLBU5000SF1900','Risk & Compliance','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1542,38,2,0,'SSLCBU1000SF2100','Security Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1543,39,2,0,'SSLCBU2000SF2100','Security Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1544,40,2,0,'SSLCBU3000SF2100','Security Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1545,41,2,0,'SSLCBU4200SF2100','Security Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1546,42,2,0,'SSLCBU5000SF2100','Security Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1547,43,1,0,'SSLBU1000SF2100','Security Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1548,44,1,0,'SSLBU2000SF2100','Security Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1549,45,1,0,'SSLBU3000SF2100','Security Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1550,46,1,0,'SSLBU4200SF2100','Security Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1551,47,1,0,'SSLBU5000SF2100','Security Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1552,48,3,0,'NGABU1000SF2100','Security Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1553,49,3,0,'NGABU2000SF2100','Security Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1554,50,3,0,'NGABU3000SF2100','Security Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1555,51,3,0,'NGABU4200SF2100','Security Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1556,52,3,0,'NGABU5000SF2100','Security Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1557,53,4,0,'CGLBU1000SF2100','Security Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1558,54,4,0,'CGLBU2000SF2100','Security Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1559,55,4,0,'CGLBU3000SF2100','Security Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1560,56,4,0,'CGLBU4200SF2100','Security Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1561,57,4,0,'CGLBU5000SF2100','Security Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1562,58,8,0,'OILBU1000SF2100','Security Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1563,59,8,0,'OILBU2000SF2100','Security Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1564,60,8,0,'OILBU3000SF2100','Security Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1565,61,8,0,'OILBU4200SF2100','Security Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1566,62,8,0,'OILBU5000SF2100','Security Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1567,63,9,0,'OTLBU1000SF2100','Security Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1568,64,9,0,'OTLBU2000SF2100','Security Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1569,65,9,0,'OTLBU3000SF2100','Security Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1570,66,9,0,'OTLBU4200SF2100','Security Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1571,67,9,0,'OTLBU5000SF2100','Security Management','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1572,38,2,0,'SSLCBU1000SF2200','Service Assurance ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1573,39,2,0,'SSLCBU2000SF2200','Service Assurance ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1574,40,2,0,'SSLCBU3000SF2200','Service Assurance ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1575,41,2,0,'SSLCBU4200SF2200','Service Assurance ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1576,42,2,0,'SSLCBU5000SF2200','Service Assurance ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1577,43,1,0,'SSLBU1000SF2200','Service Assurance ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1578,44,1,0,'SSLBU2000SF2200','Service Assurance ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1579,45,1,0,'SSLBU3000SF2200','Service Assurance ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1580,46,1,0,'SSLBU4200SF2200','Service Assurance ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1581,47,1,0,'SSLBU5000SF2200','Service Assurance ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1582,48,3,0,'NGABU1000SF2200','Service Assurance ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:42','2024-03-11 15:09:42'),(1583,49,3,0,'NGABU2000SF2200','Service Assurance ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:43','2024-03-11 15:09:43'),(1584,50,3,0,'NGABU3000SF2200','Service Assurance ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:43','2024-03-11 15:09:43'),(1585,51,3,0,'NGABU4200SF2200','Service Assurance ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:43','2024-03-11 15:09:43'),(1586,52,3,0,'NGABU5000SF2200','Service Assurance ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:43','2024-03-11 15:09:43'),(1587,53,4,0,'CGLBU1000SF2200','Service Assurance ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:43','2024-03-11 15:09:43'),(1588,54,4,0,'CGLBU2000SF2200','Service Assurance ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:43','2024-03-11 15:09:43'),(1589,55,4,0,'CGLBU3000SF2200','Service Assurance ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:43','2024-03-11 15:09:43'),(1590,56,4,0,'CGLBU4200SF2200','Service Assurance ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:43','2024-03-11 15:09:43'),(1591,57,4,0,'CGLBU5000SF2200','Service Assurance ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:43','2024-03-11 15:09:43'),(1592,58,8,0,'OILBU1000SF2200','Service Assurance ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:43','2024-03-11 15:09:43'),(1593,59,8,0,'OILBU2000SF2200','Service Assurance ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:43','2024-03-11 15:09:43'),(1594,60,8,0,'OILBU3000SF2200','Service Assurance ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:43','2024-03-11 15:09:43'),(1595,61,8,0,'OILBU4200SF2200','Service Assurance ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:43','2024-03-11 15:09:43'),(1596,62,8,0,'OILBU5000SF2200','Service Assurance ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:43','2024-03-11 15:09:43'),(1597,63,9,0,'OTLBU1000SF2200','Service Assurance ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:43','2024-03-11 15:09:43'),(1598,64,9,0,'OTLBU2000SF2200','Service Assurance ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:43','2024-03-11 15:09:43'),(1599,65,9,0,'OTLBU3000SF2200','Service Assurance ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:43','2024-03-11 15:09:43'),(1600,66,9,0,'OTLBU4200SF2200','Service Assurance ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:43','2024-03-11 15:09:43'),(1601,67,9,0,'OTLBU5000SF2200','Service Assurance ','.','.','.',NULL,NULL,1313,1,NULL,NULL,'2024-03-11 15:09:43','2024-03-11 15:09:43'),(1632,38,2,0,'SSLCBU1000BU1000','Banking and Financial Services','.','.','.',NULL,NULL,1313,22,NULL,NULL,'2024-03-13 11:25:02','2024-03-13 11:25:02'),(1633,39,2,0,'SSLCBU2000BU2000','Business Development','.','.','.',NULL,NULL,1313,22,NULL,NULL,'2024-03-13 11:25:02','2024-03-13 11:25:02'),(1634,40,2,0,'SSLCBU3000BU3000','BD-mVAS','.','.','.',NULL,NULL,1313,22,NULL,NULL,'2024-03-13 11:25:02','2024-03-13 11:25:02'),(1635,41,2,0,'SSLCBU4200BU4200','E Commerce Services','.','.','.',NULL,NULL,1313,22,NULL,NULL,'2024-03-13 11:25:02','2024-03-13 11:25:02'),(1636,42,2,0,'SSLCBU5000BU5000','Government Project','.','.','.',NULL,NULL,1313,22,NULL,NULL,'2024-03-13 11:25:02','2024-03-13 11:25:02'),(1637,43,1,0,'SSLBU1000BU1000','Banking and Financial Services','.','.','.',NULL,NULL,1313,22,NULL,NULL,'2024-03-13 11:25:02','2024-03-13 11:25:02'),(1638,44,1,0,'SSLBU2000BU2000','Business Development','.','.','.',NULL,NULL,1313,22,NULL,NULL,'2024-03-13 11:25:02','2024-03-13 11:25:02'),(1639,45,1,0,'SSLBU3000BU3000','BD-mVAS','.','.','.',NULL,NULL,1313,22,NULL,NULL,'2024-03-13 11:25:02','2024-03-13 11:25:02'),(1640,46,1,0,'SSLBU4200BU4200','E Commerce Services','.','.','.',NULL,NULL,1313,22,NULL,NULL,'2024-03-13 11:25:02','2024-03-13 11:25:02'),(1641,47,1,0,'SSLBU5000BU5000','Government Project','.','.','.',NULL,NULL,1313,22,NULL,NULL,'2024-03-13 11:25:02','2024-03-13 11:25:02'),(1642,48,3,0,'NGABU1000BU1000','Banking and Financial Services','.','.','.',NULL,NULL,1313,22,NULL,NULL,'2024-03-13 11:25:02','2024-03-13 11:25:02'),(1643,49,3,0,'NGABU2000BU2000','Business Development','.','.','.',NULL,NULL,1313,22,NULL,NULL,'2024-03-13 11:25:02','2024-03-13 11:25:02'),(1644,50,3,0,'NGABU3000BU3000','BD-mVAS','.','.','.',NULL,NULL,1313,22,NULL,NULL,'2024-03-13 11:25:02','2024-03-13 11:25:02'),(1645,51,3,0,'NGABU4200BU4200','E Commerce Services','.','.','.',NULL,NULL,1313,22,NULL,NULL,'2024-03-13 11:25:02','2024-03-13 11:25:02'),(1646,52,3,0,'NGABU5000BU5000','Government Project','.','.','.',NULL,NULL,1313,22,NULL,NULL,'2024-03-13 11:25:02','2024-03-13 11:25:02'),(1647,53,4,0,'CGLBU1000BU1000','Banking and Financial Services','.','.','.',NULL,NULL,1313,22,NULL,NULL,'2024-03-13 11:25:02','2024-03-13 11:25:02'),(1648,54,4,0,'CGLBU2000BU2000','Business Development','.','.','.',NULL,NULL,1313,22,NULL,NULL,'2024-03-13 11:25:02','2024-03-13 11:25:02'),(1649,55,4,0,'CGLBU3000BU3000','BD-mVAS','.','.','.',NULL,NULL,1313,22,NULL,NULL,'2024-03-13 11:25:02','2024-03-13 11:25:02'),(1650,56,4,0,'CGLBU4200BU4200','E Commerce Services','.','.','.',NULL,NULL,1313,22,NULL,NULL,'2024-03-13 11:25:02','2024-03-13 11:25:02'),(1651,57,4,0,'CGLBU5000BU5000','Government Project','.','.','.',NULL,NULL,1313,22,NULL,NULL,'2024-03-13 11:25:02','2024-03-13 11:25:02'),(1652,58,8,0,'OILBU1000BU1000','Banking and Financial Services','.','.','.',NULL,NULL,1313,22,NULL,NULL,'2024-03-13 11:25:02','2024-03-13 11:25:02'),(1653,59,8,0,'OILBU2000BU2000','Business Development','.','.','.',NULL,NULL,1313,22,NULL,NULL,'2024-03-13 11:25:02','2024-03-13 11:25:02'),(1654,60,8,0,'OILBU3000BU3000','BD-mVAS','.','.','.',NULL,NULL,1313,22,NULL,NULL,'2024-03-13 11:25:02','2024-03-13 11:25:02'),(1655,61,8,0,'OILBU4200BU4200','E Commerce Services','.','.','.',NULL,NULL,1313,22,NULL,NULL,'2024-03-13 11:25:02','2024-03-13 11:25:02'),(1656,62,8,0,'OILBU5000BU5000','Government Project','.','.','.',NULL,NULL,1313,22,NULL,NULL,'2024-03-13 11:25:02','2024-03-13 11:25:02'),(1657,63,9,0,'OTLBU1000BU1000','Banking and Financial Services','.','.','.',NULL,NULL,1313,22,NULL,NULL,'2024-03-13 11:25:03','2024-03-13 11:25:03'),(1658,64,9,0,'OTLBU2000BU2000','Business Development','.','.','.',NULL,NULL,1313,22,NULL,NULL,'2024-03-13 11:25:03','2024-03-13 11:25:03'),(1659,65,9,0,'OTLBU3000BU3000','BD-mVAS','.','.','.',NULL,NULL,1313,22,NULL,NULL,'2024-03-13 11:25:03','2024-03-13 11:25:03'),(1660,66,9,0,'OTLBU4200BU4200','E Commerce Services','.','.','.',NULL,NULL,1313,22,NULL,NULL,'2024-03-13 11:25:03','2024-03-13 11:25:03'),(1661,67,9,0,'OTLBU5000BU5000','Government Project','.','.','.',NULL,NULL,1313,22,NULL,NULL,'2024-03-13 11:25:03','2024-03-13 11:25:03');

/*Table structure for table `credit_note_details` */

DROP TABLE IF EXISTS `credit_note_details`;

CREATE TABLE `credit_note_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `credit_note_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `quantity` double NOT NULL DEFAULT '0',
  `price` double NOT NULL DEFAULT '0',
  `discount` double NOT NULL DEFAULT '0',
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `credit_note_details_credit_note_id_foreign` (`credit_note_id`),
  KEY `credit_note_details_product_id_foreign` (`product_id`),
  KEY `credit_note_details_created_by_foreign` (`created_by`),
  KEY `credit_note_details_updated_by_foreign` (`updated_by`),
  CONSTRAINT `credit_note_details_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `credit_note_details_credit_note_id_foreign` FOREIGN KEY (`credit_note_id`) REFERENCES `credit_notes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `credit_note_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `credit_note_details_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `credit_note_details` */

/*Table structure for table `credit_note_entries` */

DROP TABLE IF EXISTS `credit_note_entries`;

CREATE TABLE `credit_note_entries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) unsigned DEFAULT '0',
  `credit_note_id` bigint(20) unsigned NOT NULL,
  `entry_id` bigint(20) unsigned NOT NULL,
  `type` enum('credit-notes','payment') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'credit-notes',
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `credit_note_entries_credit_note_id_foreign` (`credit_note_id`),
  KEY `credit_note_entries_entry_id_foreign` (`entry_id`),
  CONSTRAINT `credit_note_entries_credit_note_id_foreign` FOREIGN KEY (`credit_note_id`) REFERENCES `credit_notes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `credit_note_entries_entry_id_foreign` FOREIGN KEY (`entry_id`) REFERENCES `entries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `credit_note_entries` */

/*Table structure for table `credit_notes` */

DROP TABLE IF EXISTS `credit_notes`;

CREATE TABLE `credit_notes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` bigint(20) unsigned NOT NULL,
  `shipper_id` bigint(20) unsigned NOT NULL,
  `sales_type_id` bigint(20) unsigned NOT NULL,
  `exchange_rate_id` bigint(20) unsigned NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datetime` datetime NOT NULL,
  `type` enum('items-returned-to-inventory-location','items-written-off') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'items-returned-to-inventory-location',
  `warehouse_id` bigint(20) unsigned DEFAULT NULL,
  `chart_of_account_id` bigint(20) unsigned DEFAULT NULL,
  `shipping_charge` double NOT NULL DEFAULT '0',
  `comments` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `credit_notes_customer_id_foreign` (`customer_id`),
  KEY `credit_notes_shipper_id_foreign` (`shipper_id`),
  KEY `credit_notes_sales_type_id_foreign` (`sales_type_id`),
  KEY `credit_notes_exchange_rate_id_foreign` (`exchange_rate_id`),
  KEY `credit_notes_created_by_foreign` (`created_by`),
  KEY `credit_notes_updated_by_foreign` (`updated_by`),
  CONSTRAINT `credit_notes_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `credit_notes_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `credit_notes_exchange_rate_id_foreign` FOREIGN KEY (`exchange_rate_id`) REFERENCES `exchange_rates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `credit_notes_sales_type_id_foreign` FOREIGN KEY (`sales_type_id`) REFERENCES `sales_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `credit_notes_shipper_id_foreign` FOREIGN KEY (`shipper_id`) REFERENCES `shippers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `credit_notes_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `credit_notes` */

/*Table structure for table `credit_statuses` */

DROP TABLE IF EXISTS `credit_statuses`;

CREATE TABLE `credit_statuses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `credit_statuses_created_by_foreign` (`created_by`),
  KEY `credit_statuses_updated_by_foreign` (`updated_by`),
  CONSTRAINT `credit_statuses_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `credit_statuses_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `credit_statuses` */

/*Table structure for table `currencies` */

DROP TABLE IF EXISTS `currencies`;

CREATE TABLE `currencies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `currency_type_id` bigint(20) unsigned NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hundreds` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `currencies_currency_type_id_foreign` (`currency_type_id`),
  KEY `currencies_created_by_foreign` (`created_by`),
  KEY `currencies_updated_by_foreign` (`updated_by`),
  CONSTRAINT `currencies_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `currencies_currency_type_id_foreign` FOREIGN KEY (`currency_type_id`) REFERENCES `currency_types` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `currencies_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `currencies` */

insert  into `currencies`(`id`,`currency_type_id`,`code`,`name`,`symbol`,`hundreds`,`country`,`desc`,`created_by`,`updated_by`,`deleted_at`,`created_at`,`updated_at`) values (1,1,'BDT','Taka','৳','Paysa','Bangladesh',NULL,22,NULL,NULL,'2022-11-27 15:23:08','2022-11-27 15:23:08'),(2,2,'USD','US Dollar','$','Cents','USA',NULL,22,NULL,NULL,'2022-11-27 15:25:55','2022-11-27 15:25:55'),(3,2,'EUR','EURO','€','Cents','Europe',NULL,22,NULL,NULL,'2022-11-27 15:26:46','2022-11-27 15:26:46'),(4,2,'GBP','Pounds','£','Pence','England',NULL,22,NULL,NULL,'2022-11-27 15:27:29','2022-11-27 15:27:29');

/*Table structure for table `currency_types` */

DROP TABLE IF EXISTS `currency_types`;

CREATE TABLE `currency_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `currency_types_created_by_foreign` (`created_by`),
  KEY `currency_types_updated_by_foreign` (`updated_by`),
  CONSTRAINT `currency_types_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `currency_types_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `currency_types` */

insert  into `currency_types`(`id`,`name`,`desc`,`created_by`,`updated_by`,`deleted_at`,`created_at`,`updated_at`) values (1,'Local Currency',NULL,22,NULL,NULL,'2022-11-27 13:37:11','2022-11-27 13:37:11'),(2,'Transaction Currency',NULL,22,NULL,NULL,'2022-11-27 13:37:29','2022-11-27 13:37:29'),(3,'Holding Currency',NULL,22,NULL,NULL,'2022-11-27 13:37:36','2022-11-27 13:37:36'),(4,'Account Currency',NULL,22,NULL,NULL,'2022-11-27 13:37:47','2022-11-27 13:37:47'),(5,'Group Currency',NULL,22,NULL,NULL,'2022-11-27 13:37:52','2022-11-27 13:37:52'),(6,'Alternate Currency',NULL,22,NULL,NULL,'2022-11-27 13:38:01','2022-11-27 13:38:01');

/*Table structure for table `customer_currencies` */

DROP TABLE IF EXISTS `customer_currencies`;

CREATE TABLE `customer_currencies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) unsigned NOT NULL,
  `currency_id` bigint(20) unsigned NOT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_currencies_customer_id_foreign` (`customer_id`),
  KEY `customer_currencies_currency_id_foreign` (`currency_id`),
  KEY `customer_currencies_created_by_foreign` (`created_by`),
  KEY `customer_currencies_updated_by_foreign` (`updated_by`),
  CONSTRAINT `customer_currencies_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customer_currencies_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customer_currencies_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customer_currencies_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `customer_currencies` */

/*Table structure for table `customer_ledgers` */

DROP TABLE IF EXISTS `customer_ledgers`;

CREATE TABLE `customer_ledgers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) unsigned DEFAULT NULL,
  `customer_payment_id` bigint(20) unsigned DEFAULT '0',
  `date` date NOT NULL,
  `exchange_rate_id` bigint(20) unsigned DEFAULT '8',
  `opening_balance` double NOT NULL DEFAULT '0',
  `debit` double NOT NULL DEFAULT '0',
  `credit` double NOT NULL DEFAULT '0',
  `closing_balance` double NOT NULL DEFAULT '0',
  `payment_type` enum('cash','cheque','debit-card','credit-card','bank-transfer','others-gl') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cash',
  `payment_details` text COLLATE utf8mb4_unicode_ci,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `bank_account_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_ledgers_customer_id_foreign` (`customer_id`),
  KEY `customer_ledgers_created_by_foreign` (`created_by`),
  KEY `customer_ledgers_updated_by_foreign` (`updated_by`),
  KEY `customer_ledgers_exchange_rate_id_foreign` (`exchange_rate_id`),
  CONSTRAINT `customer_ledgers_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customer_ledgers_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customer_ledgers_exchange_rate_id_foreign` FOREIGN KEY (`exchange_rate_id`) REFERENCES `exchange_rates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customer_ledgers_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `customer_ledgers` */

/*Table structure for table `customer_payments` */

DROP TABLE IF EXISTS `customer_payments`;

CREATE TABLE `customer_payments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` bigint(20) unsigned NOT NULL,
  `sales_order_id` bigint(20) unsigned DEFAULT '0',
  `sales_order_bill_id` bigint(20) unsigned DEFAULT '0',
  `exchange_rate_id` bigint(20) unsigned NOT NULL,
  `datetime` datetime NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `tax` double NOT NULL DEFAULT '0',
  `is_cleared` int(11) NOT NULL DEFAULT '0',
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_payments_customer_id_foreign` (`customer_id`),
  KEY `customer_payments_exchange_rate_id_foreign` (`exchange_rate_id`),
  KEY `customer_payments_created_by_foreign` (`created_by`),
  KEY `customer_payments_updated_by_foreign` (`updated_by`),
  CONSTRAINT `customer_payments_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customer_payments_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customer_payments_exchange_rate_id_foreign` FOREIGN KEY (`exchange_rate_id`) REFERENCES `exchange_rates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customer_payments_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `customer_payments` */

/*Table structure for table `customer_sales_areas` */

DROP TABLE IF EXISTS `customer_sales_areas`;

CREATE TABLE `customer_sales_areas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) unsigned NOT NULL,
  `sales_area_id` bigint(20) unsigned NOT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_sales_areas_customer_id_foreign` (`customer_id`),
  KEY `customer_sales_areas_sales_area_id_foreign` (`sales_area_id`),
  KEY `customer_sales_areas_created_by_foreign` (`created_by`),
  KEY `customer_sales_areas_updated_by_foreign` (`updated_by`),
  CONSTRAINT `customer_sales_areas_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customer_sales_areas_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customer_sales_areas_sales_area_id_foreign` FOREIGN KEY (`sales_area_id`) REFERENCES `sales_areas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customer_sales_areas_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `customer_sales_areas` */

/*Table structure for table `customer_sales_groups` */

DROP TABLE IF EXISTS `customer_sales_groups`;

CREATE TABLE `customer_sales_groups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) unsigned NOT NULL,
  `sales_group_id` bigint(20) unsigned NOT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_sales_groups_customer_id_foreign` (`customer_id`),
  KEY `customer_sales_groups_sales_group_id_foreign` (`sales_group_id`),
  KEY `customer_sales_groups_created_by_foreign` (`created_by`),
  KEY `customer_sales_groups_updated_by_foreign` (`updated_by`),
  CONSTRAINT `customer_sales_groups_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customer_sales_groups_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customer_sales_groups_sales_group_id_foreign` FOREIGN KEY (`sales_group_id`) REFERENCES `sales_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customer_sales_groups_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `customer_sales_groups` */

/*Table structure for table `customer_sales_types` */

DROP TABLE IF EXISTS `customer_sales_types`;

CREATE TABLE `customer_sales_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) unsigned NOT NULL,
  `sales_type_id` bigint(20) unsigned NOT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_sales_types_customer_id_foreign` (`customer_id`),
  KEY `customer_sales_types_sales_type_id_foreign` (`sales_type_id`),
  KEY `customer_sales_types_created_by_foreign` (`created_by`),
  KEY `customer_sales_types_updated_by_foreign` (`updated_by`),
  CONSTRAINT `customer_sales_types_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customer_sales_types_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customer_sales_types_sales_type_id_foreign` FOREIGN KEY (`sales_type_id`) REFERENCES `sales_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customer_sales_types_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `customer_sales_types` */

/*Table structure for table `customer_salesmen` */

DROP TABLE IF EXISTS `customer_salesmen`;

CREATE TABLE `customer_salesmen` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) unsigned NOT NULL,
  `salesmen_id` bigint(20) unsigned NOT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_salesmen_customer_id_foreign` (`customer_id`),
  KEY `customer_salesmen_salesmen_id_foreign` (`salesmen_id`),
  KEY `customer_salesmen_created_by_foreign` (`created_by`),
  KEY `customer_salesmen_updated_by_foreign` (`updated_by`),
  CONSTRAINT `customer_salesmen_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customer_salesmen_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customer_salesmen_salesmen_id_foreign` FOREIGN KEY (`salesmen_id`) REFERENCES `salesmen` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customer_salesmen_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `customer_salesmen` */

/*Table structure for table `customer_shippers` */

DROP TABLE IF EXISTS `customer_shippers`;

CREATE TABLE `customer_shippers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) unsigned NOT NULL,
  `shipper_id` bigint(20) unsigned NOT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_shippers_customer_id_foreign` (`customer_id`),
  KEY `customer_shippers_shipper_id_foreign` (`shipper_id`),
  KEY `customer_shippers_created_by_foreign` (`created_by`),
  KEY `customer_shippers_updated_by_foreign` (`updated_by`),
  CONSTRAINT `customer_shippers_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customer_shippers_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customer_shippers_shipper_id_foreign` FOREIGN KEY (`shipper_id`) REFERENCES `shippers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customer_shippers_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `customer_shippers` */

/*Table structure for table `customers` */

DROP TABLE IF EXISTS `customers`;

CREATE TABLE `customers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax` text COLLATE utf8mb4_unicode_ci,
  `address` text COLLATE utf8mb4_unicode_ci,
  `discount` double DEFAULT '0',
  `credit_limit` double DEFAULT '0',
  `status` enum('pending','approved','denied') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `sales_account_id` bigint(20) unsigned DEFAULT '0',
  `sales_discount_account_id` bigint(20) unsigned DEFAULT '0',
  `receivables_account_id` bigint(20) unsigned DEFAULT '0',
  `payment_discount_account_id` bigint(20) unsigned DEFAULT '0',
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customers_created_by_foreign` (`created_by`),
  KEY `customers_updated_by_foreign` (`updated_by`),
  CONSTRAINT `customers_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customers_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `customers` */

/*Table structure for table `deliverables` */

DROP TABLE IF EXISTS `deliverables`;

CREATE TABLE `deliverables` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `serial` int(11) NOT NULL DEFAULT '0',
  `weightage` int(11) DEFAULT NULL,
  `start_at` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_at` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_parallel` int(11) NOT NULL DEFAULT '0',
  `status_at` double NOT NULL DEFAULT '0' COMMENT 'This field will show at percentage value',
  `is_closed` int(11) NOT NULL DEFAULT '0',
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `budget` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `deliverables_project_id_foreign` (`project_id`),
  CONSTRAINT `deliverables_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `deliverables` */

/*Table structure for table `dependencies` */

DROP TABLE IF EXISTS `dependencies`;

CREATE TABLE `dependencies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('deliverable','sub-deliverable','task') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'deliverable',
  `parent_id` bigint(20) NOT NULL DEFAULT '0',
  `child_id` bigint(20) NOT NULL DEFAULT '0',
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `dependencies` */

/*Table structure for table `depreciation_methods` */

DROP TABLE IF EXISTS `depreciation_methods`;

CREATE TABLE `depreciation_methods` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci,
  `base_rate` double NOT NULL DEFAULT '0',
  `depreciation_rate` double NOT NULL DEFAULT '0',
  `is_yearly` int(11) NOT NULL DEFAULT '0',
  `is_onetime` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `depreciation_methods_created_by_foreign` (`created_by`),
  KEY `depreciation_methods_updated_by_foreign` (`updated_by`),
  CONSTRAINT `depreciation_methods_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `depreciation_methods_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `depreciation_methods` */

insert  into `depreciation_methods`(`id`,`code`,`name`,`desc`,`base_rate`,`depreciation_rate`,`is_yearly`,`is_onetime`,`status`,`created_by`,`updated_by`,`created_at`,`updated_at`,`deleted_at`) values (1,'D','Declining balance','Declining balance',5,0,0,0,0,1,1,'2022-09-21 10:59:43','2022-09-21 10:59:45',NULL),(2,'S','Straight line','Straight line',5,5,0,0,1,1,1,'2022-09-21 11:00:47','2022-09-21 11:00:50',NULL),(3,'N','Sum of the Year Digits','Sum of the Year Digits',0,0,1,0,0,1,1,'2022-09-21 11:01:48','2022-09-21 11:01:50',NULL),(4,'O','One-time','One-time',100,100,0,1,0,1,1,'2022-09-21 11:02:40','2022-09-21 11:02:42',NULL);

/*Table structure for table `entries` */

DROP TABLE IF EXISTS `entries`;

CREATE TABLE `entries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fiscal_year_id` bigint(20) unsigned NOT NULL,
  `entry_type_id` bigint(20) unsigned NOT NULL,
  `tag_id` bigint(20) unsigned NOT NULL,
  `number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date NOT NULL,
  `time` time DEFAULT NULL,
  `exchange_rate_id` bigint(20) unsigned NOT NULL DEFAULT '3',
  `debit` decimal(25,2) NOT NULL DEFAULT '0.00',
  `credit` decimal(25,2) NOT NULL DEFAULT '0.00',
  `reporting_debit` double NOT NULL DEFAULT '0',
  `reporting_credit` double NOT NULL DEFAULT '0',
  `is_advance` int(11) DEFAULT '0',
  `advance_category_id` bigint(20) unsigned DEFAULT '0',
  `notes` text COLLATE utf8mb4_unicode_ci,
  `is_manual` int(11) NOT NULL DEFAULT '0',
  `is_reversed` int(11) NOT NULL DEFAULT '0',
  `prepared_by` bigint(20) NOT NULL DEFAULT '0',
  `is_reviewed` enum('pending','approved','denied') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `reviewed_by` bigint(20) NOT NULL DEFAULT '0',
  `is_assessed` enum('pending','approved','denied') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `assessed_by` bigint(20) NOT NULL DEFAULT '0',
  `is_approved` enum('pending','approved','denied') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `approved_by` bigint(20) NOT NULL DEFAULT '0',
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entries_fiscal_year_id_foreign` (`fiscal_year_id`),
  KEY `entries_entry_type_id_foreign` (`entry_type_id`),
  KEY `entries_tag_id_foreign` (`tag_id`),
  KEY `entries_created_by_foreign` (`created_by`),
  KEY `entries_updated_by_foreign` (`updated_by`),
  KEY `entries_exchange_rate_id_foreign` (`exchange_rate_id`),
  CONSTRAINT `entries_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `entries_entry_type_id_foreign` FOREIGN KEY (`entry_type_id`) REFERENCES `entry_types` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `entries_exchange_rate_id_foreign` FOREIGN KEY (`exchange_rate_id`) REFERENCES `exchange_rates` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `entries_fiscal_year_id_foreign` FOREIGN KEY (`fiscal_year_id`) REFERENCES `fiscal_years` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `entries_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `entries_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `entries` */

insert  into `entries`(`id`,`code`,`fiscal_year_id`,`entry_type_id`,`tag_id`,`number`,`date`,`time`,`exchange_rate_id`,`debit`,`credit`,`reporting_debit`,`reporting_credit`,`is_advance`,`advance_category_id`,`notes`,`is_manual`,`is_reversed`,`prepared_by`,`is_reviewed`,`reviewed_by`,`is_assessed`,`assessed_by`,`is_approved`,`approved_by`,`created_by`,`updated_by`,`deleted_at`,`created_at`,`updated_at`) values (10,'JNL-240319-0001',1,5,1,'JNL-240319-0001','2024-03-19','12:32:08',1,80.00,80.00,80,80,0,0,'Product Delivery',0,0,0,'pending',0,'pending',0,'approved',0,1,NULL,NULL,'2024-03-19 12:32:09','2024-03-19 12:32:09'),(11,'JNL-240319-0002',1,5,1,'JNL-240319-0002','2024-03-19','12:32:47',1,5.00,5.00,5,5,0,0,'Product Delivery',0,0,0,'pending',0,'pending',0,'approved',0,1,NULL,NULL,'2024-03-19 12:32:48','2024-03-19 12:32:48'),(12,'JNL-240319-0003',1,5,1,'JNL-240319-0003','2024-03-19','12:34:19',1,2.50,2.50,2.5,2.5,0,0,'Product Delivery',0,0,0,'pending',0,'pending',0,'approved',0,1,NULL,NULL,'2024-03-19 12:34:19','2024-03-19 12:34:19');

/*Table structure for table `entry_approvals` */

DROP TABLE IF EXISTS `entry_approvals`;

CREATE TABLE `entry_approvals` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` bigint(20) unsigned NOT NULL,
  `approval_level_id` bigint(20) unsigned NOT NULL,
  `status` enum('pending','approved','denied') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `logs` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_approvals_entry_id_foreign` (`entry_id`),
  KEY `entry_approvals_approval_level_id_foreign` (`approval_level_id`),
  CONSTRAINT `entry_approvals_approval_level_id_foreign` FOREIGN KEY (`approval_level_id`) REFERENCES `approval_levels` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `entry_approvals_entry_id_foreign` FOREIGN KEY (`entry_id`) REFERENCES `entries` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `entry_approvals` */

insert  into `entry_approvals`(`id`,`entry_id`,`approval_level_id`,`status`,`logs`,`user_id`,`created_at`,`updated_at`) values (1,1,1,'pending','[]',0,NULL,NULL),(2,1,2,'pending','[]',0,NULL,NULL),(3,1,3,'pending','[]',0,NULL,NULL),(4,2,1,'pending','[]',0,NULL,NULL),(5,2,2,'pending','[]',0,NULL,NULL),(6,2,3,'pending','[]',0,NULL,NULL),(7,3,1,'pending','[]',0,NULL,NULL),(8,3,2,'pending','[]',0,NULL,NULL),(9,3,3,'pending','[]',0,NULL,NULL),(10,4,1,'pending','[]',0,NULL,NULL),(11,4,2,'pending','[]',0,NULL,NULL),(12,4,3,'pending','[]',0,NULL,NULL),(13,5,1,'pending','[]',0,NULL,NULL),(14,5,2,'pending','[]',0,NULL,NULL),(15,5,3,'pending','[]',0,NULL,NULL),(16,6,1,'pending','[]',0,NULL,NULL),(17,6,2,'pending','[]',0,NULL,NULL),(18,6,3,'pending','[]',0,NULL,NULL),(19,7,1,'pending','[]',0,NULL,NULL),(20,7,2,'pending','[]',0,NULL,NULL),(21,7,3,'pending','[]',0,NULL,NULL),(22,8,1,'pending','[]',0,NULL,NULL),(23,8,2,'pending','[]',0,NULL,NULL),(24,8,3,'pending','[]',0,NULL,NULL),(25,10,1,'pending','[]',0,NULL,NULL),(26,10,2,'pending','[]',0,NULL,NULL),(27,10,3,'pending','[]',0,NULL,NULL),(28,11,1,'pending','[]',0,NULL,NULL),(29,11,2,'pending','[]',0,NULL,NULL),(30,11,3,'pending','[]',0,NULL,NULL),(31,12,1,'pending','[]',0,NULL,NULL),(32,12,2,'pending','[]',0,NULL,NULL),(33,12,3,'pending','[]',0,NULL,NULL);

/*Table structure for table `entry_items` */

DROP TABLE IF EXISTS `entry_items`;

CREATE TABLE `entry_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cost_centre_id` bigint(20) unsigned NOT NULL,
  `entry_id` bigint(20) unsigned NOT NULL,
  `chart_of_account_id` bigint(20) unsigned NOT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `reporting_amount` double NOT NULL DEFAULT '0',
  `debit_credit` enum('D','C') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'D',
  `reconciliation_date` date DEFAULT NULL,
  `narration` text COLLATE utf8mb4_unicode_ci,
  `source` text COLLATE utf8mb4_unicode_ci,
  `type` text COLLATE utf8mb4_unicode_ci,
  `provisioned` int(11) NOT NULL DEFAULT '0',
  `realized` int(11) NOT NULL DEFAULT '0',
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_items_entry_id_foreign` (`entry_id`),
  KEY `entry_items_chart_of_account_id_foreign` (`chart_of_account_id`),
  KEY `entry_items_created_by_foreign` (`created_by`),
  KEY `entry_items_updated_by_foreign` (`updated_by`),
  KEY `entry_items_cost_centre_id_foreign` (`cost_centre_id`),
  CONSTRAINT `entry_items_ibfk_1` FOREIGN KEY (`cost_centre_id`) REFERENCES `cost_centres` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `entry_items_ibfk_2` FOREIGN KEY (`entry_id`) REFERENCES `entries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `entry_items_ibfk_3` FOREIGN KEY (`chart_of_account_id`) REFERENCES `chart_of_accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `entry_items` */

insert  into `entry_items`(`id`,`cost_centre_id`,`entry_id`,`chart_of_account_id`,`amount`,`reporting_amount`,`debit_credit`,`reconciliation_date`,`narration`,`source`,`type`,`provisioned`,`realized`,`created_by`,`updated_by`,`deleted_at`,`created_at`,`updated_at`) values (31,1632,10,1313,80,80,'D',NULL,'Product Delivery :: COGS Debit','14','product-delivery',0,0,0,NULL,NULL,NULL,NULL),(32,1632,10,1313,80,80,'C',NULL,'Product Delivery :: Inventory Credit','14','product-delivery',0,0,0,NULL,NULL,NULL,NULL),(33,1632,11,1313,5,5,'D',NULL,'Product Delivery :: COGS Debit','15','product-delivery',0,0,0,NULL,NULL,NULL,NULL),(34,1632,11,1313,5,5,'C',NULL,'Product Delivery :: Inventory Credit','15','product-delivery',0,0,0,NULL,NULL,NULL,NULL),(35,1632,12,1313,2.5,2.5,'D',NULL,'Product Delivery :: COGS Debit','16','product-delivery',0,0,0,NULL,NULL,NULL,NULL),(36,1632,12,1313,2.5,2.5,'C',NULL,'Product Delivery :: Inventory Credit','16','product-delivery',0,0,0,NULL,NULL,NULL,NULL);

/*Table structure for table `entry_point_ledgers` */

DROP TABLE IF EXISTS `entry_point_ledgers`;

CREATE TABLE `entry_point_ledgers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `entry_point_id` bigint(20) unsigned NOT NULL,
  `chart_of_account_id` bigint(20) unsigned NOT NULL,
  `type` enum('D','C') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'D',
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_point_ledgers_entry_point_id_foreign` (`entry_point_id`),
  KEY `entry_point_ledgers_chart_of_account_id_foreign` (`chart_of_account_id`),
  KEY `entry_point_ledgers_created_by_foreign` (`created_by`),
  KEY `entry_point_ledgers_updated_by_foreign` (`updated_by`),
  CONSTRAINT `entry_point_ledgers_chart_of_account_id_foreign` FOREIGN KEY (`chart_of_account_id`) REFERENCES `chart_of_accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `entry_point_ledgers_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `entry_point_ledgers_entry_point_id_foreign` FOREIGN KEY (`entry_point_id`) REFERENCES `entry_points` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `entry_point_ledgers_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `entry_point_ledgers` */

/*Table structure for table `entry_points` */

DROP TABLE IF EXISTS `entry_points`;

CREATE TABLE `entry_points` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_points_created_by_foreign` (`created_by`),
  KEY `entry_points_updated_by_foreign` (`updated_by`),
  CONSTRAINT `entry_points_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `entry_points_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `entry_points` */

insert  into `entry_points`(`id`,`code`,`short_name`,`name`,`description`,`created_by`,`updated_by`,`deleted_at`,`created_at`,`updated_at`) values (3,'01','Entry Point 1','Merchant Payable','Merchant Payable',1,NULL,NULL,'2024-03-11 15:39:58','2024-03-11 15:39:58'),(4,'02','Entry Point 2','Receipt from Acquirer Bank','Receipt from Acquirer Bank',1,NULL,NULL,'2024-03-11 15:42:05','2024-03-11 15:42:05'),(5,'03','Entry Point 3','Merchant Payment','Merchant Payment',1,NULL,NULL,'2024-03-11 15:42:52','2024-03-11 15:42:52'),(6,'04','Entry Point 4','Refund','Refund',1,NULL,NULL,'2024-03-11 15:43:07','2024-03-11 15:43:07'),(7,'05','Entry Point 5','Refund (2)','Refund (2)',1,NULL,NULL,'2024-03-11 15:43:37','2024-03-11 15:43:37'),(8,'06','Entry Point 6','Chargeback','Chargeback',1,NULL,NULL,'2024-03-11 15:43:49','2024-03-11 15:43:49'),(9,'07','Entry Point 7','Reseller Revenue Share','Reseller Revenue Share',1,NULL,NULL,'2024-03-11 15:43:56','2024-03-11 15:43:56'),(10,'08','Entry Point 8','Reseller Revenue Share (2)','Reseller Revenue Share (2)',1,NULL,NULL,'2024-03-11 15:45:13','2024-03-11 15:45:13'),(11,'09','Entry Point 9','EMI','EMI',1,NULL,NULL,'2024-03-11 15:45:32','2024-03-11 15:45:32'),(12,'10','Entry Point 10','EMI (2)','EMI (2)',1,NULL,NULL,'2024-03-11 15:46:00','2024-03-11 15:46:00'),(13,'11','Entry Point 11','IVAC Payment','IVAC Payment',1,NULL,NULL,'2024-03-11 15:46:08','2024-03-11 15:46:08'),(14,'12','Entry Point 12','GP Payment','GP Payment',1,NULL,NULL,'2024-03-11 15:46:16','2024-03-11 15:46:16'),(15,'13','Entry Point 13','Discount Campaign','Discount Campaign',1,NULL,NULL,'2024-03-11 15:46:28','2024-03-11 15:46:28'),(16,'14','Entry Point 14','Discount Campaign (2)','Discount Campaign (2)',1,NULL,NULL,'2024-03-11 15:46:38','2024-03-11 15:46:38'),(17,'15','Entry Point 15','Discount Campaign (3)','Discount Campaign (3)',1,NULL,NULL,'2024-03-11 15:46:51','2024-03-11 15:46:51'),(18,'16','Entry Point 16','BTCL/Alaap','BTCL/Alaap',1,NULL,NULL,'2024-03-11 15:47:05','2024-03-11 15:47:05'),(19,'17','Entry Point 17','Nagad C. Card Payment','Nagad C. Card Payment',1,NULL,NULL,'2024-03-11 15:47:18','2024-03-11 15:47:18'),(20,'18','Entry Point 18','Nagad C. Card Payment (2)','Nagad C. Card Payment (2)',1,NULL,NULL,'2024-03-11 15:47:36','2024-03-11 15:47:36'),(21,'19','Entry Point 19','Nagad C. Card Payment (3)','Nagad C. Card Payment (3)',1,NULL,NULL,'2024-03-11 15:47:50','2024-03-11 15:47:50'),(22,'20','Entry Point 20','Nagad C. Card Payment (4)','Nagad C. Card Payment (4)',1,NULL,NULL,'2024-03-11 15:48:02','2024-03-11 15:48:02'),(23,'21','Entry Point 21','Nagad C. Card Payment (5)','Nagad C. Card Payment (5)',1,NULL,NULL,'2024-03-11 15:48:15','2024-03-11 15:48:15'),(24,'22','Entry Point 22','Nagad D. Card Payment','Nagad D. Card Payment',1,1,NULL,'2024-03-11 15:48:31','2024-03-11 15:49:29'),(25,'23','Entry Point 23','Nagad D. Card Payment (2)','Nagad D. Card Payment (2)',1,1,NULL,'2024-03-11 15:48:43','2024-03-11 15:49:34'),(26,'24','Entry Point 23 (2)','Nagad D. Card Payment (3)','Nagad D. Card Payment (3)',1,NULL,NULL,'2024-03-11 15:51:31','2024-03-11 15:51:31'),(27,'25','Entry Point 23 (3)','Nagad D. Card Payment (4)','Nagad D. Card Payment (4)',1,NULL,NULL,'2024-03-11 15:51:45','2024-03-11 15:51:45'),(28,'26','Entry Point 24','Nagad D. Card Payment (5)','Nagad D. Card Payment (5)',1,NULL,NULL,'2024-03-11 15:52:03','2024-03-11 15:52:03'),(29,'27','Entry Point 25','BMDC','BMDC',1,NULL,NULL,'2024-03-11 15:52:14','2024-03-11 15:52:14');

/*Table structure for table `entry_type_companies` */

DROP TABLE IF EXISTS `entry_type_companies`;

CREATE TABLE `entry_type_companies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `entry_type_id` bigint(20) unsigned NOT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_type_companies_entry_type_id_foreign` (`entry_type_id`),
  KEY `entry_type_companies_company_id_foreign` (`company_id`),
  CONSTRAINT `entry_type_companies_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `entry_type_companies_entry_type_id_foreign` FOREIGN KEY (`entry_type_id`) REFERENCES `entry_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `entry_type_companies` */

insert  into `entry_type_companies`(`id`,`entry_type_id`,`company_id`,`created_at`,`updated_at`) values (2,5,2,NULL,NULL),(3,5,5,NULL,NULL),(4,5,9,NULL,NULL),(5,5,10,NULL,NULL),(6,5,11,NULL,NULL),(7,5,12,NULL,NULL),(8,4,2,NULL,NULL),(9,4,5,NULL,NULL),(10,4,9,NULL,NULL),(11,4,10,NULL,NULL),(12,4,11,NULL,NULL),(13,4,12,NULL,NULL),(14,3,2,NULL,NULL),(15,3,5,NULL,NULL),(16,3,9,NULL,NULL),(17,3,10,NULL,NULL),(18,3,11,NULL,NULL),(19,3,12,NULL,NULL);

/*Table structure for table `entry_types` */

DROP TABLE IF EXISTS `entry_types`;

CREATE TABLE `entry_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefix` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `suffix` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `restriction` int(11) NOT NULL DEFAULT '1',
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_types_created_by_foreign` (`created_by`),
  KEY `entry_types_updated_by_foreign` (`updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `entry_types` */

insert  into `entry_types`(`id`,`label`,`name`,`description`,`prefix`,`suffix`,`restriction`,`created_by`,`updated_by`,`deleted_at`,`created_at`,`updated_at`) values (3,'receipt','Receipt','Received in Bank account or Cash account','RPT',NULL,1,22,22,NULL,'2022-03-22 14:51:39','2022-03-23 18:34:54'),(4,'payment','Payment','Payment made from Bank account or Cash account','PAY',NULL,1,22,22,NULL,'2022-03-22 14:51:56','2022-03-23 18:35:04'),(5,'journal','Journal','Transfer between Non Bank account and Cash account','JNL',NULL,1,22,22,NULL,'2022-03-22 14:52:09','2022-03-23 18:35:13');

/*Table structure for table `exchange_rates` */

DROP TABLE IF EXISTS `exchange_rates`;

CREATE TABLE `exchange_rates` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `currency_id` bigint(20) unsigned NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `datetime` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rates` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `exchange_rates_reference_unique` (`reference`),
  KEY `exchange_rates_currency_id_foreign` (`currency_id`),
  KEY `exchange_rates_created_by_foreign` (`created_by`),
  KEY `exchange_rates_updated_by_foreign` (`updated_by`),
  CONSTRAINT `exchange_rates_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `exchange_rates_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `exchange_rates_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `exchange_rates` */

insert  into `exchange_rates`(`id`,`currency_id`,`reference`,`datetime`,`rates`,`desc`,`created_by`,`updated_by`,`deleted_at`,`created_at`,`updated_at`) values (1,1,'AVZZOUZ5','2024-03-12 11:00:21','{\"2\":{\"rate\":\"0.0091\",\"description\":null},\"3\":{\"rate\":\"0.0083\",\"description\":null},\"4\":{\"rate\":\"0.0071\",\"description\":null}}',NULL,22,NULL,NULL,'2024-03-12 11:01:02','2024-03-12 11:01:02'),(2,2,'PJAOORZH','2024-03-12 11:01:02','{\"1\":{\"rate\":\"109.82\",\"description\":null},\"3\":{\"rate\":\"0.91\",\"description\":null},\"4\":{\"rate\":\"0.78\",\"description\":null}}',NULL,22,NULL,NULL,'2024-03-12 11:02:13','2024-03-12 11:02:13'),(3,3,'CNKGEFOF','2024-03-12 11:03:58','{\"1\":{\"rate\":\"120.12\",\"description\":null},\"2\":{\"rate\":\"1.09\",\"description\":null},\"4\":{\"rate\":\"0.85\",\"description\":null}}',NULL,22,NULL,NULL,'2024-03-12 11:04:39','2024-03-12 11:04:39'),(4,4,'1QBUZKZ0','2024-03-12 11:04:41','{\"1\":{\"rate\":\"140.80\",\"description\":null},\"2\":{\"rate\":\"1.28\",\"description\":null},\"3\":{\"rate\":\"1.17\",\"description\":null}}',NULL,22,NULL,NULL,'2024-03-12 11:05:14','2024-03-12 11:05:14');

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

/*Table structure for table `faq` */

DROP TABLE IF EXISTS `faq`;

CREATE TABLE `faq` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) unsigned NOT NULL,
  `name` varchar(196) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive','cancel') COLLATE utf8mb4_unicode_ci DEFAULT 'active',
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `faq_created_by_foreign` (`created_by`),
  KEY `faq_updated_by_foreign` (`updated_by`),
  KEY `faq_category_id_foreign` (`category_id`),
  CONSTRAINT `faq_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `faq` */

insert  into `faq`(`id`,`category_id`,`name`,`status`,`created_by`,`updated_by`,`created_at`,`updated_at`,`deleted_at`) values (1,2,'Why You need to return this product?','active',1,1,'2022-02-21 18:30:08','2022-02-23 11:50:11',NULL),(2,2,'Is this product are broken?','active',1,1,'2022-02-23 11:52:05','2022-02-23 11:54:00',NULL),(7,2,'Is any product are missing?','active',1,NULL,'2022-02-23 11:54:35','2022-02-23 11:54:35',NULL),(63,4,'Why You need to return this product?','active',1,NULL,'2022-06-03 18:37:31','2022-06-03 18:37:31',NULL),(64,4,'Is this product are broken?','active',1,NULL,'2022-06-03 18:37:31','2022-06-03 18:37:31',NULL),(65,4,'Is any product are missing?','active',1,NULL,'2022-06-03 18:37:31','2022-06-03 18:37:31',NULL),(66,8,'Why You need to return this product?','active',1,NULL,'2022-06-03 18:37:31','2022-06-03 18:37:31',NULL),(67,8,'Is this product are broken?','active',1,NULL,'2022-06-03 18:37:31','2022-06-03 18:37:31',NULL),(68,8,'Is any product are missing?','active',1,NULL,'2022-06-03 18:37:31','2022-06-03 18:37:31',NULL),(69,9,'Why You need to return this product?','active',1,NULL,'2022-06-03 18:37:31','2022-06-03 18:37:31',NULL),(70,9,'Is this product are broken?','active',1,NULL,'2022-06-03 18:37:31','2022-06-03 18:37:31',NULL),(71,9,'Is any product are missing?','active',1,NULL,'2022-06-03 18:37:31','2022-06-03 18:37:31',NULL),(72,10,'Why You need to return this product?','active',1,NULL,'2022-06-03 18:37:31','2022-06-03 18:37:31',NULL),(73,10,'Is this product are broken?','active',1,NULL,'2022-06-03 18:37:31','2022-06-03 18:37:31',NULL),(74,10,'Is any product are missing?','active',1,NULL,'2022-06-03 18:37:31','2022-06-03 18:37:31',NULL),(75,11,'Why You need to return this product?','active',1,NULL,'2022-06-03 18:37:31','2022-06-03 18:37:31',NULL),(76,11,'Is this product are broken?','active',1,NULL,'2022-06-03 18:37:31','2022-06-03 18:37:31',NULL),(77,11,'Is any product are missing?','active',1,NULL,'2022-06-03 18:37:31','2022-06-03 18:37:31',NULL),(78,12,'Why You need to return this product?','active',1,NULL,'2022-06-03 18:37:31','2022-06-03 18:37:31',NULL),(79,12,'Is this product are broken?','active',1,NULL,'2022-06-03 18:37:31','2022-06-03 18:37:31',NULL),(80,12,'Is any product are missing?','active',1,NULL,'2022-06-03 18:37:31','2022-06-03 18:37:31',NULL),(81,13,'Why You need to return this product?','active',1,NULL,'2022-06-03 18:37:31','2022-06-03 18:37:31',NULL),(82,13,'Is this product are broken?','active',1,NULL,'2022-06-03 18:37:31','2022-06-03 18:37:31',NULL),(83,13,'Is any product are missing?','active',1,NULL,'2022-06-03 18:37:31','2022-06-03 18:37:31',NULL),(84,14,'Why You need to return this product?','active',1,NULL,'2022-06-03 18:37:31','2022-06-03 18:37:31',NULL),(85,14,'Is this product are broken?','active',1,NULL,'2022-06-03 18:37:31','2022-06-03 18:37:31',NULL),(86,14,'Is any product are missing?','active',1,NULL,'2022-06-03 18:37:31','2022-06-03 18:37:31',NULL),(87,16,'Why You need to return this product?','active',1,NULL,'2022-06-03 18:37:31','2022-06-03 18:37:31',NULL),(88,16,'Is this product are broken?','active',1,NULL,'2022-06-03 18:37:31','2022-06-03 18:37:31',NULL),(89,16,'Is any product are missing?','active',1,NULL,'2022-06-03 18:37:31','2022-06-03 18:37:31',NULL),(90,18,'Why You need to return this product?','active',1,NULL,'2022-06-03 18:37:31','2022-06-03 18:37:31',NULL),(91,18,'Is this product are broken?','active',1,NULL,'2022-06-03 18:37:31','2022-06-03 18:37:31',NULL),(92,18,'Is any product are missing?','active',1,NULL,'2022-06-03 18:37:31','2022-06-03 18:37:31',NULL),(93,20,'Why You need to return this product?','active',1,NULL,'2022-06-03 18:37:31','2022-06-03 18:37:31',NULL),(94,20,'Is this product are broken?','active',1,NULL,'2022-06-03 18:37:31','2022-06-03 18:37:31',NULL),(95,20,'Is any product are missing?','active',1,NULL,'2022-06-03 18:37:31','2022-06-03 18:37:31',NULL),(96,21,'Why You need to return this product?','active',1,NULL,'2022-06-03 18:37:31','2022-06-03 18:37:31',NULL),(97,21,'Is this product are broken?','active',1,NULL,'2022-06-03 18:37:31','2022-06-03 18:37:31',NULL),(99,25,'Why You need to return this product?','active',1,NULL,'2022-06-03 18:37:31','2022-06-03 18:37:31',NULL),(100,25,'Is this product are broken?','active',1,NULL,'2022-06-03 18:37:31','2022-06-03 18:37:31',NULL),(101,25,'Is any product are missing?','active',1,NULL,'2022-06-03 18:37:31','2022-06-03 18:37:31',NULL),(102,26,'Why You need to return this product?','active',1,NULL,'2022-06-03 18:37:32','2022-06-03 18:37:32',NULL),(103,26,'Is this product are broken?','active',1,NULL,'2022-06-03 18:37:32','2022-06-03 18:37:32',NULL),(104,26,'Is any product are missing?','active',1,NULL,'2022-06-03 18:37:32','2022-06-03 18:37:32',NULL),(105,27,'Why You need to return this product?','active',1,NULL,'2022-06-03 18:37:32','2022-06-03 18:37:32',NULL),(106,27,'Is this product are broken?','active',1,NULL,'2022-06-03 18:37:32','2022-06-03 18:37:32',NULL),(107,27,'Is any product are missing?','active',1,NULL,'2022-06-03 18:37:32','2022-06-03 18:37:32',NULL),(108,32,'Why You need to return this product?','active',1,NULL,'2022-06-03 18:37:32','2022-06-03 18:37:32',NULL),(109,32,'Is this product are broken?','active',1,NULL,'2022-06-03 18:37:32','2022-06-03 18:37:32',NULL),(110,32,'Is any product are missing?','active',1,NULL,'2022-06-03 18:37:32','2022-06-03 18:37:32',NULL),(111,34,'Why You need to return this product?','active',1,NULL,'2022-06-03 18:37:32','2022-06-03 18:37:32',NULL),(112,34,'Is this product are broken?','active',1,NULL,'2022-06-03 18:37:32','2022-06-03 18:37:32',NULL),(113,34,'Is any product are missing?','active',1,NULL,'2022-06-03 18:37:32','2022-06-03 18:37:32',NULL),(114,36,'Why You need to return this product?','active',1,NULL,'2022-06-03 18:37:32','2022-06-03 18:37:32',NULL),(115,36,'Is this product are broken?','active',1,NULL,'2022-06-03 18:37:32','2022-06-03 18:37:32',NULL),(116,36,'Is any product are missing?','active',1,NULL,'2022-06-03 18:37:32','2022-06-03 18:37:32',NULL);

/*Table structure for table `fiscal_year_closing_ledgers` */

DROP TABLE IF EXISTS `fiscal_year_closing_ledgers`;

CREATE TABLE `fiscal_year_closing_ledgers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fiscal_year_closing_id` bigint(20) unsigned NOT NULL,
  `chart_of_account_id` bigint(20) unsigned NOT NULL,
  `previous_balance` double DEFAULT '0',
  `carry_forwarding_amount` double DEFAULT '0',
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fiscal_year_closing_ledgers_fiscal_year_closing_id_foreign` (`fiscal_year_closing_id`),
  KEY `fiscal_year_closing_ledgers_chart_of_account_id_foreign` (`chart_of_account_id`),
  KEY `fiscal_year_closing_ledgers_created_by_foreign` (`created_by`),
  KEY `fiscal_year_closing_ledgers_updated_by_foreign` (`updated_by`),
  CONSTRAINT `fiscal_year_closing_ledgers_chart_of_account_id_foreign` FOREIGN KEY (`chart_of_account_id`) REFERENCES `chart_of_accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fiscal_year_closing_ledgers_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fiscal_year_closing_ledgers_fiscal_year_closing_id_foreign` FOREIGN KEY (`fiscal_year_closing_id`) REFERENCES `fiscal_year_closings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fiscal_year_closing_ledgers_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `fiscal_year_closing_ledgers` */

/*Table structure for table `fiscal_year_closings` */

DROP TABLE IF EXISTS `fiscal_year_closings`;

CREATE TABLE `fiscal_year_closings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `from_fiscal_year_id` bigint(20) unsigned NOT NULL,
  `to_fiscal_year_id` bigint(20) unsigned NOT NULL,
  `exchange_rate_id` bigint(20) unsigned NOT NULL,
  `balance` double DEFAULT '0',
  `profit_loss` double DEFAULT '0',
  `retained_earnings` double DEFAULT '0',
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fiscal_year_closings_from_fiscal_year_id_foreign` (`from_fiscal_year_id`),
  KEY `fiscal_year_closings_to_fiscal_year_id_foreign` (`to_fiscal_year_id`),
  KEY `fiscal_year_closings_created_by_foreign` (`created_by`),
  KEY `fiscal_year_closings_updated_by_foreign` (`updated_by`),
  KEY `fiscal_year_closings_exchange_rate_id_foreign` (`exchange_rate_id`),
  KEY `fiscal_year_closings_company_id_foreign` (`company_id`),
  CONSTRAINT `fiscal_year_closings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fiscal_year_closings_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fiscal_year_closings_exchange_rate_id_foreign` FOREIGN KEY (`exchange_rate_id`) REFERENCES `exchange_rates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fiscal_year_closings_from_fiscal_year_id_foreign` FOREIGN KEY (`from_fiscal_year_id`) REFERENCES `fiscal_years` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fiscal_year_closings_to_fiscal_year_id_foreign` FOREIGN KEY (`to_fiscal_year_id`) REFERENCES `fiscal_years` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fiscal_year_closings_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `fiscal_year_closings` */

/*Table structure for table `fiscal_year_opening_closings` */

DROP TABLE IF EXISTS `fiscal_year_opening_closings`;

CREATE TABLE `fiscal_year_opening_closings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fiscal_year_opening_id` bigint(20) unsigned NOT NULL,
  `fiscal_year_closing_id` bigint(20) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fiscal_year_opening_closings_fiscal_year_opening_id_foreign` (`fiscal_year_opening_id`),
  KEY `fiscal_year_opening_closings_fiscal_year_closing_id_foreign` (`fiscal_year_closing_id`),
  CONSTRAINT `fiscal_year_opening_closings_fiscal_year_closing_id_foreign` FOREIGN KEY (`fiscal_year_closing_id`) REFERENCES `fiscal_year_closings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fiscal_year_opening_closings_fiscal_year_opening_id_foreign` FOREIGN KEY (`fiscal_year_opening_id`) REFERENCES `fiscal_year_openings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `fiscal_year_opening_closings` */

/*Table structure for table `fiscal_year_opening_entries` */

DROP TABLE IF EXISTS `fiscal_year_opening_entries`;

CREATE TABLE `fiscal_year_opening_entries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fiscal_year_opening_id` bigint(20) unsigned NOT NULL,
  `entry_id` bigint(20) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fiscal_year_opening_entries_fiscal_year_opening_id_foreign` (`fiscal_year_opening_id`),
  KEY `fiscal_year_opening_entries_entry_id_foreign` (`entry_id`),
  CONSTRAINT `fiscal_year_opening_entries_entry_id_foreign` FOREIGN KEY (`entry_id`) REFERENCES `entries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fiscal_year_opening_entries_fiscal_year_opening_id_foreign` FOREIGN KEY (`fiscal_year_opening_id`) REFERENCES `fiscal_year_openings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `fiscal_year_opening_entries` */

/*Table structure for table `fiscal_year_opening_users` */

DROP TABLE IF EXISTS `fiscal_year_opening_users`;

CREATE TABLE `fiscal_year_opening_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fiscal_year_opening_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fiscal_year_opening_users_fiscal_year_opening_id_foreign` (`fiscal_year_opening_id`),
  KEY `fiscal_year_opening_users_user_id_foreign` (`user_id`),
  CONSTRAINT `fiscal_year_opening_users_fiscal_year_opening_id_foreign` FOREIGN KEY (`fiscal_year_opening_id`) REFERENCES `fiscal_year_openings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fiscal_year_opening_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `fiscal_year_opening_users` */

/*Table structure for table `fiscal_year_openings` */

DROP TABLE IF EXISTS `fiscal_year_openings`;

CREATE TABLE `fiscal_year_openings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `fiscal_year_id` bigint(20) unsigned NOT NULL,
  `is_approved` enum('pending','approved','denied') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `status` enum('opened','closed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'opened',
  `opened_at` datetime DEFAULT NULL,
  `closed_at` datetime DEFAULT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fiscal_year_openings_company_id_foreign` (`company_id`),
  KEY `fiscal_year_openings_fiscal_year_id_foreign` (`fiscal_year_id`),
  KEY `fiscal_year_openings_created_by_foreign` (`created_by`),
  KEY `fiscal_year_openings_updated_by_foreign` (`updated_by`),
  CONSTRAINT `fiscal_year_openings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fiscal_year_openings_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fiscal_year_openings_fiscal_year_id_foreign` FOREIGN KEY (`fiscal_year_id`) REFERENCES `fiscal_years` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fiscal_year_openings_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `fiscal_year_openings` */

/*Table structure for table `fiscal_years` */

DROP TABLE IF EXISTS `fiscal_years`;

CREATE TABLE `fiscal_years` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start` date NOT NULL,
  `end` date NOT NULL,
  `closed` int(11) NOT NULL DEFAULT '0',
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fiscal_years_created_by_foreign` (`created_by`),
  KEY `fiscal_years_updated_by_foreign` (`updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `fiscal_years` */

insert  into `fiscal_years`(`id`,`title`,`start`,`end`,`closed`,`created_by`,`updated_by`,`deleted_at`,`created_at`,`updated_at`) values (1,'2022-23','2022-07-01','2023-06-30',0,22,22,NULL,NULL,NULL),(2,'2023-24','2023-07-01','2024-06-30',0,22,22,NULL,'2023-04-30 12:03:46','2023-05-03 10:11:40'),(3,'2024-25','2024-07-01','2025-06-30',0,22,22,NULL,'2023-04-30 12:04:09','2023-05-02 10:44:14'),(4,'2025-26','2025-07-01','2026-06-30',0,22,22,NULL,'2024-02-27 14:59:31','2024-02-27 14:59:31');

/*Table structure for table `fixed_asset_batch_item_depreciations` */

DROP TABLE IF EXISTS `fixed_asset_batch_item_depreciations`;

CREATE TABLE `fixed_asset_batch_item_depreciations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fixed_asset_batch_item_id` bigint(20) unsigned NOT NULL,
  `date` date DEFAULT NULL,
  `from` date NOT NULL,
  `to` date NOT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fab_item_foreign_key` (`fixed_asset_batch_item_id`),
  KEY `fixed_asset_batch_item_depreciations_created_by_foreign` (`created_by`),
  KEY `fixed_asset_batch_item_depreciations_updated_by_foreign` (`updated_by`),
  CONSTRAINT `fab_item_foreign_key` FOREIGN KEY (`fixed_asset_batch_item_id`) REFERENCES `fixed_asset_batch_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fixed_asset_batch_item_depreciations_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fixed_asset_batch_item_depreciations_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `fixed_asset_batch_item_depreciations` */

/*Table structure for table `fixed_asset_batch_item_physical_statuses` */

DROP TABLE IF EXISTS `fixed_asset_batch_item_physical_statuses`;

CREATE TABLE `fixed_asset_batch_item_physical_statuses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fixed_asset_batch_item_id` bigint(20) unsigned NOT NULL,
  `fixed_asset_location_id` bigint(20) unsigned NOT NULL DEFAULT '1',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `inspector_id` bigint(20) unsigned NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `ratings` double NOT NULL DEFAULT '0',
  `image` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `batch_item_fk` (`fixed_asset_batch_item_id`),
  KEY `fixed_asset_batch_item_physical_statuses_user_id_foreign` (`user_id`),
  KEY `fixed_asset_batch_item_physical_statuses_inspector_id_foreign` (`inspector_id`),
  KEY `fixed_asset_batch_item_physical_statuses_created_by_foreign` (`created_by`),
  KEY `fixed_asset_batch_item_physical_statuses_updated_by_foreign` (`updated_by`),
  KEY `location_fk` (`fixed_asset_location_id`),
  CONSTRAINT `batch_item_fk` FOREIGN KEY (`fixed_asset_batch_item_id`) REFERENCES `fixed_asset_batch_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fixed_asset_batch_item_physical_statuses_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fixed_asset_batch_item_physical_statuses_inspector_id_foreign` FOREIGN KEY (`inspector_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fixed_asset_batch_item_physical_statuses_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `location_fk` FOREIGN KEY (`fixed_asset_location_id`) REFERENCES `fixed_asset_locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `fixed_asset_batch_item_physical_statuses` */

/*Table structure for table `fixed_asset_batch_item_users` */

DROP TABLE IF EXISTS `fixed_asset_batch_item_users`;

CREATE TABLE `fixed_asset_batch_item_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fixed_asset_batch_item_id` bigint(20) unsigned NOT NULL,
  `fixed_asset_location_id` bigint(20) unsigned DEFAULT '1',
  `user_id` bigint(20) unsigned NOT NULL,
  `from` date NOT NULL,
  `to` date DEFAULT NULL,
  `giving_remarks` text COLLATE utf8mb4_unicode_ci,
  `is_received` int(11) NOT NULL DEFAULT '0',
  `receiving_remarks` text COLLATE utf8mb4_unicode_ci,
  `is_taken` int(11) NOT NULL DEFAULT '0',
  `taken_remarks` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fixed_asset_batch_item_users_created_by_foreign` (`created_by`),
  KEY `fixed_asset_batch_item_users_updated_by_foreign` (`updated_by`),
  KEY `fixed_asset_batch_item_users_user_id_foreign` (`user_id`),
  KEY `fixed_asset_batch_item_users_fixed_asset_batch_item_id_foreign` (`fixed_asset_batch_item_id`),
  KEY `fixed_asset_batch_item_users_fixed_asset_location_id_foreign` (`fixed_asset_location_id`),
  CONSTRAINT `fixed_asset_batch_item_users_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fixed_asset_batch_item_users_fixed_asset_batch_item_id_foreign` FOREIGN KEY (`fixed_asset_batch_item_id`) REFERENCES `fixed_asset_batch_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fixed_asset_batch_item_users_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `fixed_asset_batch_item_users` */

/*Table structure for table `fixed_asset_batch_items` */

DROP TABLE IF EXISTS `fixed_asset_batch_items`;

CREATE TABLE `fixed_asset_batch_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fixed_asset_batch_id` bigint(20) unsigned NOT NULL,
  `final_asset_id` bigint(20) unsigned NOT NULL,
  `asset_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `asset_value` double NOT NULL DEFAULT '0',
  `is_disposed` int(11) NOT NULL DEFAULT '0',
  `disposal_type` enum('disposed','sold') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'disposed',
  `disposal_amount` double NOT NULL DEFAULT '0',
  `gain_loss` enum('gain','loss','equal') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'equal',
  `disposal_remarks` text COLLATE utf8mb4_unicode_ci,
  `disposed_at` date DEFAULT NULL,
  `disposed_by` bigint(20) unsigned NOT NULL DEFAULT '0',
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fixed_asset_batch_items_fixed_asset_batch_id_foreign` (`fixed_asset_batch_id`),
  KEY `fixed_asset_batch_items_created_by_foreign` (`created_by`),
  KEY `fixed_asset_batch_items_updated_by_foreign` (`updated_by`),
  KEY `fixed_asset_batch_items_final_asset_id_foreign` (`final_asset_id`),
  CONSTRAINT `fixed_asset_batch_items_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fixed_asset_batch_items_final_asset_id_foreign` FOREIGN KEY (`final_asset_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fixed_asset_batch_items_fixed_asset_batch_id_foreign` FOREIGN KEY (`fixed_asset_batch_id`) REFERENCES `fixed_asset_batches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fixed_asset_batch_items_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `fixed_asset_batch_items` */

/*Table structure for table `fixed_asset_batches` */

DROP TABLE IF EXISTS `fixed_asset_batches`;

CREATE TABLE `fixed_asset_batches` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `goods_received_items_stock_in_id` bigint(20) unsigned DEFAULT '5',
  `requisition_delivery_item_id` bigint(20) unsigned NOT NULL,
  `cost_centre_id` bigint(20) unsigned NOT NULL DEFAULT '2',
  `batch` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `depreciation_method_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `base_rate` double NOT NULL DEFAULT '0',
  `rate_multiplier` double NOT NULL DEFAULT '0',
  `depreciation_rate` double NOT NULL DEFAULT '0',
  `is_yearly` int(11) NOT NULL DEFAULT '0',
  `years` int(11) NOT NULL DEFAULT '0',
  `is_onetime` int(11) NOT NULL DEFAULT '0',
  `depreciation_start_date` date DEFAULT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fixed_asset_batches_requisition_delivery_item_id_foreign` (`requisition_delivery_item_id`),
  KEY `fixed_asset_batches_created_by_foreign` (`created_by`),
  KEY `fixed_asset_batches_updated_by_foreign` (`updated_by`),
  KEY `fixed_asset_batches_goods_received_items_stock_in_id_foreign` (`goods_received_items_stock_in_id`),
  KEY `fixed_asset_batches_cost_centre_id_foreign` (`cost_centre_id`),
  CONSTRAINT `fixed_asset_batches_cost_centre_id_foreign` FOREIGN KEY (`cost_centre_id`) REFERENCES `cost_centres` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fixed_asset_batches_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fixed_asset_batches_goods_received_items_stock_in_id_foreign` FOREIGN KEY (`goods_received_items_stock_in_id`) REFERENCES `goods_received_items_stock_in` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fixed_asset_batches_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `fixed_asset_batches` */

/*Table structure for table `fixed_asset_item_movements` */

DROP TABLE IF EXISTS `fixed_asset_item_movements`;

CREATE TABLE `fixed_asset_item_movements` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fixed_asset_batch_item_user_id` bigint(20) unsigned NOT NULL,
  `fixed_asset_location_id` bigint(20) unsigned NOT NULL DEFAULT '1',
  `user_id` bigint(20) unsigned NOT NULL,
  `expected_date` date NOT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `status` enum('pending','approved','moved','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `approved_by` bigint(20) unsigned DEFAULT NULL,
  `approval_remarks` text COLLATE utf8mb4_unicode_ci,
  `moved_by` bigint(20) unsigned DEFAULT NULL,
  `movement_remarks` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `batch_item_user_fk` (`fixed_asset_batch_item_user_id`),
  KEY `fixed_asset_item_movements_user_id_foreign` (`user_id`),
  KEY `fixed_asset_item_movements_created_by_foreign` (`created_by`),
  KEY `fixed_asset_item_movements_updated_by_foreign` (`updated_by`),
  KEY `fixed_asset_item_movements_fixed_asset_location_id_foreign` (`fixed_asset_location_id`),
  CONSTRAINT `batch_item_user_fk` FOREIGN KEY (`fixed_asset_batch_item_user_id`) REFERENCES `fixed_asset_batch_item_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fixed_asset_item_movements_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fixed_asset_item_movements_fixed_asset_location_id_foreign` FOREIGN KEY (`fixed_asset_location_id`) REFERENCES `fixed_asset_locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fixed_asset_item_movements_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `fixed_asset_item_movements` */

/*Table structure for table `fixed_asset_locations` */

DROP TABLE IF EXISTS `fixed_asset_locations`;

CREATE TABLE `fixed_asset_locations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `unit_id` int(10) unsigned NOT NULL DEFAULT '1',
  `category_id` bigint(20) unsigned NOT NULL DEFAULT '37',
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_for_deliveries` text COLLATE utf8mb4_unicode_ci,
  `address` text COLLATE utf8mb4_unicode_ci,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fixed_asset_locations_created_by_foreign` (`created_by`),
  KEY `fixed_asset_locations_updated_by_foreign` (`updated_by`),
  KEY `fixed_asset_locations_category_id_foreign` (`category_id`),
  KEY `fixed_asset_locations_unit_id_foreign` (`unit_id`),
  CONSTRAINT `fixed_asset_locations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fixed_asset_locations_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fixed_asset_locations_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `hr_unit` (`hr_unit_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fixed_asset_locations_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `fixed_asset_locations` */

/*Table structure for table `goods_received_items` */

DROP TABLE IF EXISTS `goods_received_items`;

CREATE TABLE `goods_received_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `goods_received_note_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `unit_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `qty` decimal(10,2) NOT NULL DEFAULT '0.00',
  `sub_total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `discount_percentage` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.00',
  `discount` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.00',
  `vat_percentage` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.00',
  `vat` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.00',
  `total_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `quality_ensure` enum('pending','approved','return','return-change') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `received_qty` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_received_items_goods_received_note_id_foreign` (`goods_received_note_id`),
  KEY `goods_received_items_product_id_foreign` (`product_id`),
  CONSTRAINT `goods_received_items_goods_received_note_id_foreign` FOREIGN KEY (`goods_received_note_id`) REFERENCES `goods_received_notes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `goods_received_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `goods_received_items` */

insert  into `goods_received_items`(`id`,`goods_received_note_id`,`product_id`,`unit_amount`,`qty`,`sub_total`,`discount_percentage`,`discount`,`vat_percentage`,`vat`,`total_amount`,`quality_ensure`,`received_qty`,`deleted_at`,`created_at`,`updated_at`) values (3,2,7,10.00,10.00,100.00,'0','0','5','5',105.00,'approved',10,NULL,NULL,'2024-03-19 12:30:52'),(4,2,8,10.00,10.00,100.00,'0','0','5','5',105.00,'approved',10,NULL,NULL,'2024-03-19 12:30:55');

/*Table structure for table `goods_received_items_stock_in` */

DROP TABLE IF EXISTS `goods_received_items_stock_in`;

CREATE TABLE `goods_received_items_stock_in` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `purchase_order_id` bigint(20) unsigned DEFAULT NULL,
  `goods_received_item_id` bigint(20) unsigned NOT NULL,
  `warehouse_id` bigint(20) unsigned DEFAULT NULL,
  `fixed_asset_location_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `reference_no` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `received_qty` int(10) unsigned NOT NULL DEFAULT '0',
  `sub_total` decimal(8,2) NOT NULL DEFAULT '0.00',
  `discount_percentage` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.00',
  `discount` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.00',
  `vat_percentage` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.00',
  `vat` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.00',
  `total_amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `is_grn_complete` enum('no','yes') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_received_items_stock_in_created_by_foreign` (`created_by`),
  KEY `goods_received_items_stock_in_updated_by_foreign` (`updated_by`),
  KEY `goods_received_items_stock_in_goods_received_item_id_foreign` (`goods_received_item_id`),
  KEY `goods_received_items_stock_in_warehouse_id_foreign` (`warehouse_id`),
  KEY `goods_received_items_stock_in_purchase_order_id_foreign` (`purchase_order_id`),
  CONSTRAINT `goods_received_items_stock_in_goods_received_item_id_foreign` FOREIGN KEY (`goods_received_item_id`) REFERENCES `goods_received_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `goods_received_items_stock_in_purchase_order_id_foreign` FOREIGN KEY (`purchase_order_id`) REFERENCES `purchase_orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `goods_received_items_stock_in` */

insert  into `goods_received_items_stock_in`(`id`,`purchase_order_id`,`goods_received_item_id`,`warehouse_id`,`fixed_asset_location_id`,`reference_no`,`unit_amount`,`received_qty`,`sub_total`,`discount_percentage`,`discount`,`vat_percentage`,`vat`,`total_amount`,`is_grn_complete`,`created_by`,`updated_by`,`created_at`,`updated_at`,`deleted_at`) values (3,2,3,10,0,'QE-AP-24-SSL-00001',10.00,10,100.00,'0','0','5','5',105.00,'yes',6,6,'2024-03-19 12:30:52','2024-03-19 12:31:12',NULL),(4,2,4,9,0,'QE-AP-24-SSL-00004',10.00,10,100.00,'0','0','5','5',105.00,'yes',6,6,'2024-03-19 12:30:55','2024-03-19 12:31:12',NULL);

/*Table structure for table `goods_received_notes` */

DROP TABLE IF EXISTS `goods_received_notes`;

CREATE TABLE `goods_received_notes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `purchase_order_id` bigint(20) unsigned NOT NULL,
  `reference_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `grn_reference_no` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_price` double(10,2) NOT NULL DEFAULT '0.00',
  `discount` double(8,2) NOT NULL DEFAULT '0.00',
  `vat` double(8,2) NOT NULL DEFAULT '0.00',
  `gross_price` double(10,2) NOT NULL DEFAULT '0.00',
  `received_status` enum('partial','full') COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_sent_to_accounts` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `is_supplier_rating` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `challan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `challan_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `received_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `delivery_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receive_by` bigint(20) unsigned NOT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_received_notes_purchase_order_id_foreign` (`purchase_order_id`),
  KEY `goods_received_notes_created_by_foreign` (`created_by`),
  KEY `goods_received_notes_updated_by_foreign` (`updated_by`),
  KEY `goods_received_notes_receive_by_foreign` (`receive_by`),
  CONSTRAINT `goods_received_notes_purchase_order_id_foreign` FOREIGN KEY (`purchase_order_id`) REFERENCES `purchase_orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `goods_received_notes` */

insert  into `goods_received_notes`(`id`,`purchase_order_id`,`reference_no`,`grn_reference_no`,`total_price`,`discount`,`vat`,`gross_price`,`received_status`,`is_sent_to_accounts`,`is_supplier_rating`,`challan`,`challan_file`,`received_date`,`delivery_by`,`receive_by`,`note`,`created_by`,`updated_by`,`deleted_at`,`created_at`,`updated_at`) values (2,2,'GATE-IN-24-SSL-00001','GRN-24-MBM-00001',200.00,0.00,10.00,210.00,'full','no','no','PO-24-SSL-000001','upload/grn/challan-file/2024/03/19/542190324123112.png','2024-03-19 12:31:12',NULL,21,NULL,21,6,NULL,'2024-03-19 12:30:21','2024-03-19 12:31:12');

/*Table structure for table `holidaies` */

DROP TABLE IF EXISTS `holidaies`;

CREATE TABLE `holidaies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `year` int(11) DEFAULT NULL,
  `special_holiday` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `holidaies` */

/*Table structure for table `hr_as_basic_info` */

DROP TABLE IF EXISTS `hr_as_basic_info`;

CREATE TABLE `hr_as_basic_info` (
  `as_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `as_designation_id` bigint(20) DEFAULT NULL,
  `as_unit_id` bigint(20) DEFAULT NULL,
  `as_location` bigint(20) DEFAULT NULL,
  `as_department_id` bigint(20) DEFAULT NULL,
  `as_section_id` bigint(20) DEFAULT NULL,
  `as_subsection_id` bigint(20) DEFAULT NULL,
  `as_doj` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `associate_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `temp_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `as_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `as_gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `as_dob` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `as_contact` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `as_ot` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `as_pic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `as_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '0-delete, 1-active, 2-resign, 3-terminate, 4-suspend, 5-left, 6-maternity',
  `as_status_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `as_remarks` text COLLATE utf8mb4_unicode_ci,
  `as_rfid_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`as_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17217 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `hr_as_basic_info` */

insert  into `hr_as_basic_info`(`as_id`,`as_designation_id`,`as_unit_id`,`as_location`,`as_department_id`,`as_section_id`,`as_subsection_id`,`as_doj`,`associate_id`,`temp_id`,`as_name`,`as_gender`,`as_dob`,`as_contact`,`as_ot`,`as_pic`,`as_status`,`as_status_date`,`as_remarks`,`as_rfid_code`,`created_by`,`updated_by`,`deleted_at`,`created_at`,`updated_at`) values (17185,543,1,17,124,274,NULL,'2023-12-01 00:00:00','bizzsol',NULL,'Bizz Solutions PLC','Male','2023-12-01 00:00:00','.',0,NULL,1,'2023-12-19 16:26:28','.',NULL,NULL,NULL,NULL,'2023-12-19 16:26:28','2024-03-18 12:28:38'),(17188,NULL,1,NULL,145,295,NULL,'2024-03-11 11:23:37','1948',NULL,'Abdullah Al Mahbub',NULL,'2024-03-11 11:23:37',NULL,0,NULL,1,'2024-03-11 11:23:37',NULL,NULL,NULL,NULL,NULL,'2024-03-11 11:23:37','2024-03-11 11:23:37'),(17189,NULL,1,NULL,145,295,NULL,'2024-03-11 11:23:38','2081',NULL,'K.M. Ashaque Shahnawaz Karim',NULL,'2024-03-11 11:23:38',NULL,0,NULL,1,'2024-03-11 11:23:38',NULL,NULL,NULL,NULL,NULL,'2024-03-11 11:23:38','2024-03-11 11:23:38'),(17190,556,1,NULL,145,295,NULL,'2024-03-11 11:23:38','1092',NULL,'Md. Omar Faruque',NULL,'2024-03-11 11:23:38',NULL,0,NULL,1,'2024-03-11 11:23:38',NULL,NULL,NULL,NULL,NULL,'2024-03-11 11:23:38','2024-03-11 11:23:38'),(17191,557,1,NULL,145,295,NULL,'2024-03-11 11:23:38','1105',NULL,'Syed Najir Hossen',NULL,'2024-03-11 11:23:38',NULL,0,NULL,1,'2024-03-11 11:23:38',NULL,NULL,NULL,NULL,NULL,'2024-03-11 11:23:38','2024-03-11 11:23:38'),(17192,557,1,NULL,145,295,NULL,'2024-03-11 11:23:38','1270',NULL,'Md. Ferdous Alam',NULL,'2024-03-11 11:23:38',NULL,0,NULL,1,'2024-03-11 11:23:38',NULL,NULL,NULL,NULL,NULL,'2024-03-11 11:23:38','2024-03-11 11:23:38'),(17193,559,1,NULL,145,295,NULL,'2024-03-11 11:23:38','1337',NULL,'Anisur Rahman',NULL,'2024-03-11 11:23:38',NULL,0,NULL,1,'2024-03-11 11:23:38',NULL,NULL,NULL,NULL,NULL,'2024-03-11 11:23:38','2024-03-11 11:23:38'),(17194,559,1,NULL,145,295,NULL,'2024-03-11 11:23:38','1437',NULL,'Liton Paul',NULL,'2024-03-11 11:23:38',NULL,0,NULL,1,'2024-03-11 11:23:38',NULL,NULL,NULL,NULL,NULL,'2024-03-11 11:23:38','2024-03-11 11:23:38'),(17195,558,1,NULL,145,295,NULL,'2024-03-11 11:23:38','1448',NULL,'Md. Tareq Salman',NULL,'2024-03-11 11:23:38',NULL,0,NULL,1,'2024-03-11 11:23:38',NULL,NULL,NULL,NULL,NULL,'2024-03-11 11:23:38','2024-03-11 11:23:38'),(17196,560,1,NULL,145,295,NULL,'2024-03-11 11:23:38','1475',NULL,'Mr. Ahmad Rayan Shamsi',NULL,'2024-03-11 11:23:38',NULL,0,NULL,1,'2024-03-11 11:23:38',NULL,NULL,NULL,NULL,NULL,'2024-03-11 11:23:38','2024-03-11 11:23:38'),(17197,560,1,NULL,145,295,NULL,'2024-03-11 11:23:38','1480',NULL,'Maref Md. Takiul Islam',NULL,'2024-03-11 11:23:38',NULL,0,NULL,1,'2024-03-11 11:23:38',NULL,NULL,NULL,NULL,NULL,'2024-03-11 11:23:38','2024-03-11 11:23:38'),(17198,561,1,NULL,145,295,NULL,'2024-03-11 11:23:38','1590',NULL,'Md. Sheikh Nasir Uddin Pronay',NULL,'2024-03-11 11:23:38',NULL,0,NULL,1,'2024-03-11 11:23:38',NULL,NULL,NULL,NULL,NULL,'2024-03-11 11:23:38','2024-03-11 11:23:38'),(17199,560,1,NULL,145,295,NULL,'2024-03-11 11:23:38','1653',NULL,'Sajjad Kader',NULL,'2024-03-11 11:23:38',NULL,0,NULL,1,'2024-03-11 11:23:38',NULL,NULL,NULL,NULL,NULL,'2024-03-11 11:23:38','2024-03-11 11:23:38'),(17200,558,1,NULL,145,295,NULL,'2024-03-11 11:23:39','1670',NULL,'Nazmul Huda',NULL,'2024-03-11 11:23:39',NULL,0,NULL,1,'2024-03-11 11:23:39',NULL,NULL,NULL,NULL,NULL,'2024-03-11 11:23:39','2024-03-11 11:23:39'),(17201,557,1,NULL,145,295,NULL,'2024-03-11 11:23:39','1671',NULL,'Md. Faridul Islam',NULL,'2024-03-11 11:23:39',NULL,0,NULL,1,'2024-03-11 11:23:39',NULL,NULL,NULL,NULL,NULL,'2024-03-11 11:23:39','2024-03-11 11:23:39'),(17202,559,1,NULL,145,295,NULL,'2024-03-11 11:23:39','1677',NULL,'Humayra Sahrin Trina',NULL,'2024-03-11 11:23:39',NULL,0,NULL,1,'2024-03-11 11:23:39',NULL,NULL,NULL,NULL,NULL,'2024-03-11 11:23:39','2024-03-11 11:23:39'),(17203,559,1,NULL,145,295,NULL,'2024-03-11 11:23:39','1818',NULL,'Akib Hossain Chowdhury',NULL,'2024-03-11 11:23:39',NULL,0,NULL,1,'2024-03-11 11:23:39',NULL,NULL,NULL,NULL,NULL,'2024-03-11 11:23:39','2024-03-11 11:23:39'),(17204,559,1,NULL,145,295,NULL,'2024-03-11 11:23:39','1819',NULL,'Md. Samiul Islam Sadi',NULL,'2024-03-11 11:23:39',NULL,0,NULL,1,'2024-03-11 11:23:39',NULL,NULL,NULL,NULL,NULL,'2024-03-11 11:23:39','2024-03-11 11:23:39'),(17205,561,1,NULL,145,295,NULL,'2024-03-11 11:23:39','1899',NULL,'Mehnur Mim',NULL,'2024-03-11 11:23:39',NULL,0,NULL,1,'2024-03-11 11:23:39',NULL,NULL,NULL,NULL,NULL,'2024-03-11 11:23:39','2024-03-11 11:23:39'),(17206,559,1,NULL,125,275,NULL,'2024-03-11 11:23:39','1010',NULL,'Ahsanul Haque Punam',NULL,'2024-03-11 11:23:39',NULL,0,NULL,1,'2024-03-11 11:23:39',NULL,NULL,NULL,NULL,NULL,'2024-03-11 11:23:39','2024-03-11 11:23:39'),(17207,557,1,NULL,125,275,NULL,'2024-03-11 11:23:39','1101',NULL,'Kaisar Ahmed',NULL,'2024-03-11 11:23:39',NULL,0,NULL,1,'2024-03-11 11:23:39',NULL,NULL,NULL,NULL,NULL,'2024-03-11 11:23:39','2024-03-11 11:23:39'),(17208,559,1,NULL,125,275,NULL,'2024-03-11 11:23:39','1841',NULL,'Md. Bayazid Bustami',NULL,'2024-03-11 11:23:39',NULL,0,NULL,1,'2024-03-11 11:23:39',NULL,NULL,NULL,NULL,NULL,'2024-03-11 11:23:39','2024-03-11 11:23:39'),(17209,NULL,1,NULL,143,293,NULL,'2024-03-11 11:23:39','1048',NULL,'Ashekur Rahman Molla',NULL,'2024-03-11 11:23:39',NULL,0,NULL,1,'2024-03-11 11:23:39',NULL,NULL,NULL,NULL,NULL,'2024-03-11 11:23:39','2024-03-11 11:23:39'),(17210,559,1,NULL,143,293,NULL,'2024-03-11 11:23:39','1141',NULL,'Khaled Akand',NULL,'2024-03-11 11:23:39',NULL,0,NULL,1,'2024-03-11 11:23:39',NULL,NULL,NULL,NULL,NULL,'2024-03-11 11:23:39','2024-03-11 11:23:39'),(17211,559,1,NULL,143,293,NULL,'2024-03-11 11:23:39','1554',NULL,'Sanjay Kumar Roy',NULL,'2024-03-11 11:23:39',NULL,0,NULL,1,'2024-03-11 11:23:39',NULL,NULL,NULL,NULL,NULL,'2024-03-11 11:23:39','2024-03-11 11:23:39'),(17212,558,1,NULL,148,298,NULL,'2024-03-11 11:23:39','1756',NULL,'Md. Taukir Hasan',NULL,'2024-03-11 11:23:39',NULL,0,NULL,1,'2024-03-11 11:23:39',NULL,NULL,NULL,NULL,NULL,'2024-03-11 11:23:39','2024-03-11 11:23:39'),(17213,559,1,NULL,154,304,NULL,'2024-03-11 11:23:39','1774',NULL,'Md. Riyad Hossain',NULL,'2024-03-11 11:23:39',NULL,0,NULL,1,'2024-03-11 11:23:39',NULL,NULL,NULL,NULL,NULL,'2024-03-11 11:23:39','2024-03-11 11:23:39'),(17214,560,1,NULL,143,293,NULL,'2024-03-11 11:23:40','1890',NULL,'Md. Moinul Hasan Khan',NULL,'2024-03-11 11:23:40',NULL,0,NULL,1,'2024-03-11 11:23:40',NULL,NULL,NULL,NULL,NULL,'2024-03-11 11:23:40','2024-03-11 11:23:40'),(17215,561,1,NULL,143,293,NULL,'2024-03-11 11:23:40','1920',NULL,'Md. Riyad Hossain',NULL,'2024-03-11 11:23:40',NULL,0,NULL,1,'2024-03-11 11:23:40',NULL,NULL,NULL,NULL,NULL,'2024-03-11 11:23:40','2024-03-11 11:23:40'),(17216,NULL,1,NULL,138,288,NULL,'2024-03-11 11:23:40','2056',NULL,'Md. Shaikh Kamran',NULL,'2024-03-11 11:23:40',NULL,0,NULL,1,'2024-03-11 11:23:40',NULL,NULL,NULL,NULL,NULL,'2024-03-11 11:23:40','2024-03-11 11:23:40');

/*Table structure for table `hr_department` */

DROP TABLE IF EXISTS `hr_department`;

CREATE TABLE `hr_department` (
  `hr_department_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `hr_department_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hr_department_name_bn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hr_department_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hr_department_min_range` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hr_department_max_range` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hr_department_status` tinyint(1) NOT NULL DEFAULT '1',
  `sequence` int(11) NOT NULL DEFAULT '10',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`hr_department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `hr_department` */

insert  into `hr_department`(`hr_department_id`,`hr_department_name`,`hr_department_name_bn`,`hr_department_code`,`hr_department_min_range`,`hr_department_max_range`,`hr_department_status`,`sequence`,`created_by`,`updated_by`,`deleted_at`,`created_at`,`updated_at`) values (113,'HR','HR','001','0','10000000.00',1,10,NULL,NULL,NULL,'2024-03-11 10:02:27','2024-03-11 10:04:49'),(114,'Power','Power','002','0','10000000',1,10,NULL,NULL,NULL,'2024-03-11 10:02:57','2024-03-11 10:02:57'),(115,'Maintenance','Maintenance','003','0','10000000',1,10,NULL,NULL,NULL,'2024-03-11 10:03:01','2024-03-11 10:03:01'),(116,'Accounts','Accounts','004','0','10000000',1,10,NULL,NULL,NULL,'2024-03-11 10:03:05','2024-03-11 10:03:05'),(117,'Store','Store','005','0','10000000',1,10,NULL,NULL,NULL,'2024-03-11 10:03:09','2024-03-11 10:03:09'),(118,'Compliance','Compliance','006','0','10000000',1,10,NULL,NULL,NULL,'2024-03-11 10:03:12','2024-03-11 10:03:12'),(119,'Quality','Quality','007','0','10000000',1,10,NULL,NULL,NULL,'2024-03-11 10:03:15','2024-03-11 10:03:15'),(120,'Merchandising','Merchandising','008','0','10000000',1,10,NULL,NULL,NULL,'2024-03-11 10:03:25','2024-03-11 10:03:25'),(121,'House keeping','House keeping','009','0','10000000',1,10,NULL,NULL,NULL,'2024-03-11 10:03:29','2024-03-11 10:03:29'),(122,'Security','Security','010','0','10000000',1,10,NULL,NULL,NULL,'2024-03-11 10:03:34','2024-03-11 10:03:34'),(123,'Fire','Fire','011','0','10000000',1,10,NULL,NULL,NULL,'2024-03-11 10:03:38','2024-03-11 10:03:38'),(124,'ICT','ICT','012','0','10000000',1,10,NULL,NULL,NULL,'2024-03-11 10:03:42','2024-03-11 10:03:42'),(125,'Procurement','Procurement','013','0','10000000',1,10,NULL,NULL,NULL,'2024-03-11 10:03:46','2024-03-11 10:03:46'),(126,'IE','IE','014','0','10000000',1,10,NULL,NULL,NULL,'2024-03-11 10:03:49','2024-03-11 10:03:49'),(127,'Accounts Finance & Inventory','Accounts Finance & Inventory','015','0','10000000',1,10,NULL,NULL,NULL,'2024-03-11 10:05:21','2024-03-11 10:05:21'),(128,'HR Admin & Compliance','HR Admin & Compliance','016','0','10000000',1,10,NULL,NULL,NULL,'2024-03-11 10:05:26','2024-03-11 10:05:26'),(129,'IT','IT','017','0','10000000',1,10,NULL,NULL,NULL,'2024-03-11 10:05:31','2024-03-11 10:05:31'),(130,'Marketing','Marketing','018','0','10000000',1,10,NULL,NULL,NULL,'2024-03-11 10:05:42','2024-03-11 10:05:42'),(131,'Product Quality & Technical','Product Quality & Technical','019','0','10000000',1,10,NULL,NULL,NULL,'2024-03-11 10:05:46','2024-03-11 10:05:46'),(132,'Production','Production','020','0','10000000',1,10,NULL,NULL,NULL,'2024-03-11 10:05:49','2024-03-11 10:05:49'),(133,'Supply Chain','Supply Chain','021','0','10000000',1,10,NULL,NULL,NULL,'2024-03-11 10:05:57','2024-03-11 10:05:57'),(134,'Admin','Admin','022','0','10000000',1,10,NULL,NULL,NULL,'2024-03-11 10:28:59','2024-03-11 10:28:59'),(135,'Banking and Financial Services','Banking and Financial Services','023','0','10000000',1,10,NULL,NULL,NULL,'2024-03-11 10:29:03','2024-03-11 10:29:03'),(136,'Business Development','Business Development','024','0','10000000',1,10,NULL,NULL,NULL,'2024-03-11 10:29:06','2024-03-11 10:29:06'),(137,'Cyber & Information Security','Cyber & Information Security','025','0','10000000',1,10,NULL,NULL,NULL,'2024-03-11 10:29:10','2024-03-11 10:29:10'),(138,'Data','Data','026','0','10000000',1,10,NULL,NULL,NULL,'2024-03-11 10:29:14','2024-03-11 10:29:14'),(139,'Digital Communications','Digital Communications','027','0','10000000',1,10,NULL,NULL,NULL,'2024-03-11 10:29:17','2024-03-11 10:29:17'),(140,'Documentation & External Audit','Documentation & External Audit','028','0','10000000',1,10,NULL,NULL,NULL,'2024-03-11 10:29:21','2024-03-11 10:29:21'),(141,'E Commerce Operations','E Commerce Operations','029','0','10000000',1,10,NULL,NULL,NULL,'2024-03-11 10:29:26','2024-03-11 10:29:26'),(142,'E Commerce Services','E Commerce Services','030','0','10000000',1,10,NULL,NULL,NULL,'2024-03-11 10:29:30','2024-03-11 10:29:30'),(143,'Engineering','Engineering','031','0','10000000',1,10,NULL,NULL,NULL,'2024-03-11 10:29:34','2024-03-11 10:29:34'),(144,'External Affairs','External Affairs','032','0','10000000',1,10,NULL,NULL,NULL,'2024-03-11 10:29:37','2024-03-11 10:29:37'),(145,'Finance & Accounts','Finance & Accounts','033','0','10000000',1,10,NULL,NULL,NULL,'2024-03-11 10:29:41','2024-03-11 10:29:41'),(146,'Government Project','Government Project','034','0','10000000',1,10,NULL,NULL,NULL,'2024-03-11 10:29:44','2024-03-11 10:29:44'),(147,'Human Resources','Human Resources','035','0','10000000',1,10,NULL,NULL,NULL,'2024-03-11 10:29:48','2024-03-11 10:29:48'),(148,'Innovation Center of Excellence','Innovation Center of Excellence','036','0','10000000',1,10,NULL,NULL,NULL,'2024-03-11 10:29:51','2024-03-11 10:29:51'),(149,'Legal Affairs','Legal Affairs','037','0','10000000',1,10,NULL,NULL,NULL,'2024-03-11 10:29:54','2024-03-11 10:29:54'),(150,'Management','Management','038','0','10000000',1,10,NULL,NULL,NULL,'2024-03-11 10:29:57','2024-03-11 10:29:57'),(151,'MIS','MIS','039','0','10000000',1,10,NULL,NULL,NULL,'2024-03-11 10:30:00','2024-03-11 10:30:00'),(152,'Network & Systems','Network & Systems','040','0','10000000',1,10,NULL,NULL,NULL,'2024-03-11 10:30:07','2024-03-11 10:30:07'),(153,'Partnership Management','Partnership Management','041','0','10000000',1,10,NULL,NULL,NULL,'2024-03-11 10:30:12','2024-03-11 10:30:12'),(154,'Project Management Office','Project Management Office','042','0','10000000',1,10,NULL,NULL,NULL,'2024-03-11 10:30:20','2024-03-11 10:30:20'),(155,'Revenue Assurance','Revenue Assurance','043','0','10000000',1,10,NULL,NULL,NULL,'2024-03-11 10:30:26','2024-03-11 10:30:26'),(156,'Risk & Compliance','Risk & Compliance','044','0','10000000',1,10,NULL,NULL,NULL,'2024-03-11 10:30:30','2024-03-11 10:30:30'),(157,'Security Management','Security Management','045','0','10000000',1,10,NULL,NULL,NULL,'2024-03-11 10:30:34','2024-03-11 10:30:34'),(158,'Service Assurance','Service Assurance','046','0','10000000',1,10,NULL,NULL,NULL,'2024-03-11 10:30:39','2024-03-11 10:30:39');

/*Table structure for table `hr_designation` */

DROP TABLE IF EXISTS `hr_designation`;

CREATE TABLE `hr_designation` (
  `hr_designation_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `hr_designation_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hr_designation_name_bn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `designation_short_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hr_designation_status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`hr_designation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=600 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `hr_designation` */

insert  into `hr_designation`(`hr_designation_id`,`hr_designation_name`,`hr_designation_name_bn`,`designation_short_name`,`hr_designation_status`,`created_by`,`updated_by`,`deleted_at`,`created_at`,`updated_at`) values (543,'Managing Director','Managing Director','MD',1,NULL,NULL,NULL,'2024-03-11 10:36:43','2024-03-11 10:36:43'),(544,'Advisor','Advisor','Advisor',1,NULL,NULL,NULL,'2024-03-11 10:36:43','2024-03-11 10:36:43'),(545,'Director','Director','Director',1,NULL,NULL,NULL,'2024-03-11 10:36:43','2024-03-11 10:36:43'),(546,'Chief Operating Officer','Chief Operating Officer','COO',1,NULL,NULL,NULL,'2024-03-11 10:36:43','2024-03-11 10:36:43'),(547,'Chief Executive Officer','Chief Executive Officer','CEO',1,NULL,NULL,NULL,'2024-03-11 10:36:43','2024-03-11 10:36:43'),(548,'Chief Growth Officer','Chief Growth Officer','CGO',1,NULL,NULL,NULL,'2024-03-11 10:36:43','2024-03-11 10:36:43'),(549,'Chief Financial Officer','Chief Financial Officer','CFO',1,NULL,NULL,NULL,'2024-03-11 10:36:43','2024-03-11 10:36:43'),(550,'Chief External Affairs Officer','Chief External Affairs Officer','CEAO',1,NULL,NULL,NULL,'2024-03-11 10:36:43','2024-03-11 10:36:43'),(551,'Chief Technical Officer','Chief Technical Officer','CTO',1,NULL,NULL,NULL,'2024-03-11 10:36:43','2024-03-11 10:36:43'),(552,'Deputy Chief Operating Officer','Deputy Chief Operating Officer','DCOO',1,NULL,NULL,NULL,'2024-03-11 10:36:43','2024-03-11 10:36:43'),(553,'General Manager','General Manager','GM',1,NULL,NULL,NULL,'2024-03-11 10:36:43','2024-03-11 10:36:43'),(554,'Deputy General Manager','Deputy General Manager','DGM',1,NULL,NULL,NULL,'2024-03-11 10:36:43','2024-03-11 10:36:43'),(555,'Assistant General Manager','Assistant General Manager','AGM',1,NULL,NULL,NULL,'2024-03-11 10:36:43','2024-03-11 10:36:43'),(556,'Senior Manager','Senior Manager','SM',1,NULL,NULL,NULL,'2024-03-11 10:36:43','2024-03-11 10:36:43'),(557,'Manager','Manager','M',1,NULL,NULL,NULL,'2024-03-11 10:36:43','2024-03-11 10:36:43'),(558,'Deputy Manager','Deputy Manager','DM',1,NULL,NULL,NULL,'2024-03-11 10:36:43','2024-03-11 10:36:43'),(559,'Assistant Manager','Assistant Manager','AM',1,NULL,NULL,NULL,'2024-03-11 10:36:43','2024-03-11 10:36:43'),(560,'Senior Executive','Senior Executive','SE',1,NULL,NULL,NULL,'2024-03-11 10:36:43','2024-03-11 10:36:43'),(561,'Executive','Executive','E',1,NULL,NULL,NULL,'2024-03-11 10:36:43','2024-03-11 10:36:43'),(562,'Junior Executive','Junior Executive','JE',1,NULL,NULL,NULL,'2024-03-11 10:36:43','2024-03-11 10:36:43'),(563,'Associate','Associate','A',1,NULL,NULL,NULL,'2024-03-11 10:36:43','2024-03-11 10:36:43'),(564,'Support Staff','Support Staff','SS',1,NULL,NULL,NULL,'2024-03-11 10:36:43','2024-03-11 10:36:43'),(565,'Executive director','Executive director','ED',1,NULL,NULL,NULL,'2024-03-11 10:45:02','2024-03-11 10:45:02'),(566,'Head of Business','Head of Business','HOB',1,NULL,NULL,NULL,'2024-03-11 10:45:02','2024-03-11 10:45:02'),(567,'Head of production','Head of production','HOP',1,NULL,NULL,NULL,'2024-03-11 10:45:02','2024-03-11 10:45:02'),(568,'Deputy Genaral Manager Production','Deputy Genaral Manager Production','DGMP',1,NULL,NULL,NULL,'2024-03-11 10:45:02','2024-03-11 10:45:02'),(569,'Deputy Genaral Manager Admin,HR & Compliance','Deputy Genaral Manager Admin,HR & Compliance','DGMAHC',1,NULL,NULL,NULL,'2024-03-11 10:45:02','2024-03-11 10:45:02'),(570,'Deputy Genaral Manager Merchandiging','Deputy Genaral Manager Merchandiging','DGMM',1,NULL,NULL,NULL,'2024-03-11 10:45:02','2024-03-11 10:45:02'),(571,'Group Power Engineer','Group Power Engineer','GPE',1,NULL,NULL,NULL,'2024-03-11 10:45:02','2024-03-11 10:45:02'),(572,'Quality Manager','Quality Manager','QM',1,NULL,NULL,NULL,'2024-03-11 10:45:02','2024-03-11 10:45:02'),(573,'Fire Safety officer','Fire Safety officer','FSO',1,NULL,NULL,NULL,'2024-03-11 10:45:02','2024-03-11 10:45:02'),(574,'Mechanical Engineer','Mechanical Engineer','ME',1,NULL,NULL,NULL,'2024-03-11 10:45:02','2024-03-11 10:45:02'),(575,'Civil Engineer','Civil Engineer','CE',1,NULL,NULL,NULL,'2024-03-11 10:45:02','2024-03-11 10:45:02'),(576,'Managing Director','Managing Director',NULL,1,NULL,NULL,'2024-03-11 10:49:12','2024-03-11 10:47:08','2024-03-11 10:49:12'),(577,'Executive - Director','Executive - Director',NULL,1,NULL,NULL,'2024-03-11 10:48:50','2024-03-11 10:47:08','2024-03-11 10:48:50'),(578,'Director -  Operation','Director -  Operation','DO',1,NULL,NULL,NULL,'2024-03-11 10:47:08','2024-03-11 10:49:38'),(579,'Director -  Factory','Director -  Factory','DF',1,NULL,NULL,NULL,'2024-03-11 10:47:08','2024-03-11 10:49:34'),(580,'Deputy Director- Factory','Deputy Director- Factory','DDF',1,NULL,NULL,NULL,'2024-03-11 10:47:08','2024-03-11 10:49:31'),(581,'General Manager-Factory','General Manager-Factory',NULL,1,NULL,NULL,NULL,'2024-03-11 10:47:08','2024-03-11 10:47:08'),(582,'Senior General Manager','Senior General Manager','SGM',1,NULL,NULL,NULL,'2024-03-11 10:47:08','2024-03-11 10:49:43'),(583,'General Manager','General Manager',NULL,1,NULL,NULL,'2024-03-11 10:48:55','2024-03-11 10:47:08','2024-03-11 10:48:55'),(584,'Deputy General Manager','Deputy General Manager',NULL,1,NULL,NULL,'2024-03-11 10:48:29','2024-03-11 10:47:08','2024-03-11 10:48:29'),(585,'Assistant General Manager','Assistant General Manager',NULL,1,NULL,NULL,'2024-03-11 10:47:50','2024-03-11 10:47:08','2024-03-11 10:47:50'),(586,'Senior Manager','Senior Manager',NULL,1,NULL,NULL,'2024-03-11 10:49:24','2024-03-11 10:47:08','2024-03-11 10:49:24'),(587,'Manager','Manager',NULL,1,NULL,NULL,'2024-03-11 10:49:08','2024-03-11 10:47:08','2024-03-11 10:49:08'),(588,'Deputy Manager','Deputy Manager',NULL,1,NULL,NULL,'2024-03-11 10:48:33','2024-03-11 10:47:08','2024-03-11 10:48:33'),(589,'Assistant Manager','Assistant Manager',NULL,1,NULL,NULL,'2024-03-11 10:47:56','2024-03-11 10:47:08','2024-03-11 10:47:56'),(590,'Senior Executive','Senior Executive',NULL,1,NULL,NULL,'2024-03-11 10:49:16','2024-03-11 10:47:08','2024-03-11 10:49:16'),(591,'Executive','Executive',NULL,1,NULL,NULL,'2024-03-11 10:48:42','2024-03-11 10:47:08','2024-03-11 10:48:42'),(592,'Assistant Executive','Assistant Executive','AE',1,NULL,NULL,NULL,'2024-03-11 10:47:08','2024-03-11 10:48:10'),(593,'Junior Executive','Junior Executive',NULL,1,NULL,NULL,'2024-03-11 10:49:03','2024-03-11 10:47:08','2024-03-11 10:49:03'),(596,'Group Chief Financial Officer','Group Chief Financial Officer','Group Chief Financial Officer',1,NULL,NULL,NULL,'2024-03-11 11:23:37','2024-03-11 11:23:37'),(597,'Financial Controller','Financial Controller','Financial Controller',1,NULL,NULL,NULL,'2024-03-11 11:23:38','2024-03-11 11:23:38'),(598,'Assistant General Manager (AGM)','Assistant General Manager (AGM)','Assistant General Manager (AGM)',1,NULL,NULL,NULL,'2024-03-11 11:23:39','2024-03-11 11:23:39'),(599,'Data Analyst','Data Analyst','Data Analyst',1,NULL,NULL,NULL,'2024-03-11 11:23:40','2024-03-11 11:23:40');

/*Table structure for table `hr_location` */

DROP TABLE IF EXISTS `hr_location`;

CREATE TABLE `hr_location` (
  `hr_location_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `hr_location_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hr_location_short_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hr_location_name_bn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hr_location_address` text COLLATE utf8mb4_unicode_ci,
  `hr_location_address_bn` text COLLATE utf8mb4_unicode_ci,
  `hr_location_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hr_location_status` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `hr_location_unit_id` bigint(20) DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`hr_location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `hr_location` */

insert  into `hr_location`(`hr_location_id`,`hr_location_name`,`hr_location_short_name`,`hr_location_name_bn`,`hr_location_address`,`hr_location_address_bn`,`hr_location_code`,`hr_location_status`,`hr_location_unit_id`,`created_by`,`updated_by`,`created_at`,`updated_at`,`deleted_at`) values (17,'Dhaka','Dhaka','Dhaka','Dhaka','Dhaka','DHK',1,1,NULL,NULL,'2024-03-11 10:51:05','2024-03-11 10:51:05',NULL),(18,'Dhaka','Dhaka','Dhaka','Dhaka','Dhaka','DHK',1,2,NULL,NULL,'2024-03-11 10:51:13','2024-03-11 10:51:13',NULL),(19,'Dhaka','Dhaka','Dhaka','Dhaka','Dhaka','DHK',1,3,NULL,NULL,'2024-03-11 10:51:20','2024-03-11 10:51:20',NULL),(20,'Dhaka','Dhaka','Dhaka','Dhaka','Dhaka','DHK',1,4,NULL,NULL,'2024-03-11 10:51:28','2024-03-11 10:51:28',NULL),(21,'Dhaka','Dhaka','Dhaka','Dhaka','Dhaka','DHK',1,8,NULL,NULL,'2024-03-11 10:51:35','2024-03-11 10:51:35',NULL),(22,'Dhaka','Dhaka','Dhaka','Dhaka','Dhaka','DHK',1,8,NULL,NULL,'2024-03-11 10:51:42','2024-03-11 10:51:42',NULL),(23,'Dhaka','Dhaka','Dhaka','Dhaka','Dhaka','DHK',1,9,NULL,NULL,'2024-03-11 10:51:49','2024-03-11 10:51:49',NULL);

/*Table structure for table `hr_section` */

DROP TABLE IF EXISTS `hr_section`;

CREATE TABLE `hr_section` (
  `hr_section_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `hr_section_department_id` int(11) DEFAULT NULL,
  `hr_section_name` varchar(128) DEFAULT NULL,
  `hr_section_name_bn` varchar(255) DEFAULT NULL,
  `hr_section_code` varchar(10) DEFAULT NULL,
  `hr_section_status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`hr_section_id`)
) ENGINE=InnoDB AUTO_INCREMENT=309 DEFAULT CHARSET=utf8;

/*Data for the table `hr_section` */

insert  into `hr_section`(`hr_section_id`,`hr_section_department_id`,`hr_section_name`,`hr_section_name_bn`,`hr_section_code`,`hr_section_status`,`created_at`,`created_by`,`updated_at`,`updated_by`,`deleted_at`) values (263,113,'HR','HR','001',1,'2024-03-11 10:57:07',NULL,'2024-03-11 10:57:07',NULL,NULL),(264,114,'Power','Power','002',1,'2024-03-11 10:57:07',NULL,'2024-03-11 10:57:07',NULL,NULL),(265,115,'Maintenance','Maintenance','003',1,'2024-03-11 10:57:07',NULL,'2024-03-11 10:57:07',NULL,NULL),(266,116,'Accounts','Accounts','004',1,'2024-03-11 10:57:07',NULL,'2024-03-11 10:57:07',NULL,NULL),(267,117,'Store','Store','005',1,'2024-03-11 10:57:07',NULL,'2024-03-11 10:57:07',NULL,NULL),(268,118,'Compliance','Compliance','006',1,'2024-03-11 10:57:07',NULL,'2024-03-11 10:57:07',NULL,NULL),(269,119,'Quality','Quality','007',1,'2024-03-11 10:57:07',NULL,'2024-03-11 10:57:07',NULL,NULL),(270,120,'Merchandising','Merchandising','008',1,'2024-03-11 10:57:07',NULL,'2024-03-11 10:57:07',NULL,NULL),(271,121,'House keeping','House keeping','009',1,'2024-03-11 10:57:07',NULL,'2024-03-11 10:57:07',NULL,NULL),(272,122,'Security','Security','010',1,'2024-03-11 10:57:07',NULL,'2024-03-11 10:57:07',NULL,NULL),(273,123,'Fire','Fire','011',1,'2024-03-11 10:57:07',NULL,'2024-03-11 10:57:07',NULL,NULL),(274,124,'ICT','ICT','012',1,'2024-03-11 10:57:07',NULL,'2024-03-11 10:57:07',NULL,NULL),(275,125,'Procurement','Procurement','013',1,'2024-03-11 10:57:07',NULL,'2024-03-11 10:57:07',NULL,NULL),(276,126,'IE','IE','014',1,'2024-03-11 10:57:07',NULL,'2024-03-11 10:57:07',NULL,NULL),(277,127,'Accounts Finance & Inventory','Accounts Finance & Inventory','015',1,'2024-03-11 10:57:07',NULL,'2024-03-11 10:57:07',NULL,NULL),(278,128,'HR Admin & Compliance','HR Admin & Compliance','016',1,'2024-03-11 10:57:07',NULL,'2024-03-11 10:57:07',NULL,NULL),(279,129,'IT','IT','017',1,'2024-03-11 10:57:07',NULL,'2024-03-11 10:57:07',NULL,NULL),(280,130,'Marketing','Marketing','018',1,'2024-03-11 10:57:07',NULL,'2024-03-11 10:57:07',NULL,NULL),(281,131,'Product Quality & Technical','Product Quality & Technical','019',1,'2024-03-11 10:57:07',NULL,'2024-03-11 10:57:07',NULL,NULL),(282,132,'Production','Production','020',1,'2024-03-11 10:57:07',NULL,'2024-03-11 10:57:07',NULL,NULL),(283,133,'Supply Chain','Supply Chain','021',1,'2024-03-11 10:57:07',NULL,'2024-03-11 10:57:07',NULL,NULL),(284,134,'Admin','Admin','022',1,'2024-03-11 10:57:07',NULL,'2024-03-11 10:57:07',NULL,NULL),(285,135,'Banking and Financial Services','Banking and Financial Services','023',1,'2024-03-11 10:57:07',NULL,'2024-03-11 10:57:07',NULL,NULL),(286,136,'Business Development','Business Development','024',1,'2024-03-11 10:57:07',NULL,'2024-03-11 10:57:07',NULL,NULL),(287,137,'Cyber & Information Security','Cyber & Information Security','025',1,'2024-03-11 10:57:07',NULL,'2024-03-11 10:57:07',NULL,NULL),(288,138,'Data','Data','026',1,'2024-03-11 10:57:08',NULL,'2024-03-11 10:57:08',NULL,NULL),(289,139,'Digital Communications','Digital Communications','027',1,'2024-03-11 10:57:08',NULL,'2024-03-11 10:57:08',NULL,NULL),(290,140,'Documentation & External Audit','Documentation & External Audit','028',1,'2024-03-11 10:57:08',NULL,'2024-03-11 10:57:08',NULL,NULL),(291,141,'E Commerce Operations','E Commerce Operations','029',1,'2024-03-11 10:57:08',NULL,'2024-03-11 10:57:08',NULL,NULL),(292,142,'E Commerce Services','E Commerce Services','030',1,'2024-03-11 10:57:08',NULL,'2024-03-11 10:57:08',NULL,NULL),(293,143,'Engineering','Engineering','031',1,'2024-03-11 10:57:08',NULL,'2024-03-11 10:57:08',NULL,NULL),(294,144,'External Affairs','External Affairs','032',1,'2024-03-11 10:57:08',NULL,'2024-03-11 10:57:08',NULL,NULL),(295,145,'Finance & Accounts','Finance & Accounts','033',1,'2024-03-11 10:57:08',NULL,'2024-03-11 10:57:08',NULL,NULL),(296,146,'Government Project','Government Project','034',1,'2024-03-11 10:57:08',NULL,'2024-03-11 10:57:08',NULL,NULL),(297,147,'Human Resources','Human Resources','035',1,'2024-03-11 10:57:08',NULL,'2024-03-11 10:57:08',NULL,NULL),(298,148,'Innovation Center of Excellence','Innovation Center of Excellence','036',1,'2024-03-11 10:57:08',NULL,'2024-03-11 10:57:08',NULL,NULL),(299,149,'Legal Affairs','Legal Affairs','037',1,'2024-03-11 10:57:08',NULL,'2024-03-11 10:57:08',NULL,NULL),(300,150,'Management','Management','038',1,'2024-03-11 10:57:08',NULL,'2024-03-11 10:57:08',NULL,NULL),(301,151,'MIS','MIS','039',1,'2024-03-11 10:57:08',NULL,'2024-03-11 10:57:08',NULL,NULL),(302,152,'Network & Systems','Network & Systems','040',1,'2024-03-11 10:57:08',NULL,'2024-03-11 10:57:08',NULL,NULL),(303,153,'Partnership Management','Partnership Management','041',1,'2024-03-11 10:57:08',NULL,'2024-03-11 10:57:08',NULL,NULL),(304,154,'Project Management Office','Project Management Office','042',1,'2024-03-11 10:57:08',NULL,'2024-03-11 10:57:08',NULL,NULL),(305,155,'Revenue Assurance','Revenue Assurance','043',1,'2024-03-11 10:57:08',NULL,'2024-03-11 10:57:08',NULL,NULL),(306,156,'Risk & Compliance','Risk & Compliance','044',1,'2024-03-11 10:57:08',NULL,'2024-03-11 10:57:08',NULL,NULL),(307,157,'Security Management','Security Management','045',1,'2024-03-11 10:57:08',NULL,'2024-03-11 10:57:08',NULL,NULL),(308,158,'Service Assurance','Service Assurance','046',1,'2024-03-11 10:57:08',NULL,'2024-03-11 10:57:08',NULL,NULL);

/*Table structure for table `hr_unit` */

DROP TABLE IF EXISTS `hr_unit`;

CREATE TABLE `hr_unit` (
  `hr_unit_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hr_unit_name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hr_unit_short_name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hr_unit_name_bn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hr_unit_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hr_unit_address_bn` text COLLATE utf8mb4_unicode_ci,
  `hr_unit_telephone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hr_unit_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hr_unit_logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hr_unit_status` tinyint(3) unsigned DEFAULT '1',
  `hr_unit_att_table` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hr_unit_reference_heading` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hr_unit_group` int(10) unsigned DEFAULT NULL,
  `hr_unit_authorized_signature` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`hr_unit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `hr_unit` */

insert  into `hr_unit`(`hr_unit_id`,`hr_unit_name`,`hr_unit_short_name`,`hr_unit_name_bn`,`hr_unit_address`,`hr_unit_address_bn`,`hr_unit_telephone`,`hr_unit_code`,`hr_unit_logo`,`hr_unit_status`,`hr_unit_att_table`,`hr_unit_reference_heading`,`hr_unit_group`,`hr_unit_authorized_signature`,`created_by`,`updated_by`,`deleted_at`,`created_at`,`updated_at`) values (1,'SOFTWARE SHOP LTD.','SSL','SOFTWARE SHOP LTD.','93 New Eskaton Road, Dhaka 1000','93 New Eskaton Road, Dhaka 1000','.','SSL',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-07-12 15:29:58','2021-03-22 06:10:53'),(2,'SSLCOMMERZ LIMITED\n','SSLC','SSLCOMMERZ LIMITED\n','93 New Eskaton Road, Dhaka 1000','93 New Eskaton Road, Dhaka 1000','.','SSLC',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-07-12 15:29:58','2021-04-09 14:34:28'),(3,'NGAGE 360 LIMITED\n','NGA','NGAGE 360 LIMITED\n','93 New Eskaton Road, Dhaka 1000','93 New Eskaton Road, Dhaka 1000','.','NGA',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-07-12 15:29:58','2021-03-22 06:10:53'),(4,'CONCORDE GARMENTS LIMITED','CGL','CONCORDE GARMENTS LIMITED','93 New Eskaton Road, Dhaka 1000','93 New Eskaton Road, Dhaka 1000','.','CGL',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-07-12 15:29:58','2023-12-18 15:06:36'),(8,'OSMAN INTERLINING LIMITED\n','OIL','OSMAN INTERLINING LIMITED\n','93 New Eskaton Road, Dhaka 1000','93 New Eskaton Road, Dhaka 1000','.','OIL',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-07-12 15:29:58','2021-03-22 06:10:53'),(9,'OTL DOUBLEGULL MANUFACTURING CO. LTD.','OTL','OTL DOUBLEGULL MANUFACTURING CO. LTD.','93 New Eskaton Road, Dhaka 1000','93 New Eskaton Road, Dhaka 1000','.','OTL',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-12-19 15:07:39');

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

/*Data for the table `inventory_details` */

insert  into `inventory_details`(`id`,`hr_unit_id`,`category_id`,`product_id`,`warehouse_id`,`unit_price`,`qty`,`total_price`,`status`,`created_by`,`updated_by`,`deleted_at`,`created_at`,`updated_at`) values (3,1,2,8,9,10.5,10,105,'active',6,NULL,NULL,'2024-03-19 12:31:12','2024-03-19 12:31:12'),(4,1,2,7,10,10.5,1.25,13.125,'active',6,6,NULL,'2024-03-19 12:31:12','2024-03-19 12:34:19');

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

/*Data for the table `inventory_logs` */

insert  into `inventory_logs`(`id`,`hr_unit_id`,`category_id`,`product_id`,`warehouse_id`,`unit_price`,`qty`,`total_price`,`reference`,`status`,`type`,`created_by`,`updated_by`,`created_at`,`updated_at`,`deleted_at`) values (16,1,2,8,9,10.5,10,105,'GRN-24-MBM-00001','active','in',6,NULL,'2024-03-19 12:31:12','2024-03-19 12:31:12',NULL),(17,1,2,7,10,10.5,10,105,'GRN-24-MBM-00001','active','in',6,NULL,'2024-03-19 12:31:12','2024-03-19 12:31:12',NULL),(18,1,2,7,10,10.5,8,84,'CD-24-MBM-0001','active','out',6,NULL,'2024-03-19 12:32:08','2024-03-19 12:32:08',NULL),(19,1,2,7,10,10.5,0.5,5.25,'CD-24-MBM-0019','active','out',6,NULL,'2024-03-19 12:32:47','2024-03-19 12:32:47',NULL),(20,1,2,7,10,10.5,0.25,2.625,'CD-24-MBM-0020','active','out',6,NULL,'2024-03-19 12:34:19','2024-03-19 12:34:19',NULL);

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

/*Data for the table `inventory_summaries` */

insert  into `inventory_summaries`(`id`,`category_id`,`product_id`,`unit_price`,`qty`,`total_price`,`status`,`created_by`,`updated_by`,`deleted_at`,`created_at`,`updated_at`,`buffer_inventory`) values (9,2,8,10.5,10,105,'active',6,NULL,NULL,'2024-03-19 12:31:12','2024-03-19 12:31:12',0),(10,2,7,10.5,1.25,13.125,'active',6,6,NULL,'2024-03-19 12:31:12','2024-03-19 12:34:19',0);

/*Table structure for table `jobs` */

DROP TABLE IF EXISTS `jobs`;

CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jobs` */

/*Table structure for table `loan_logs` */

DROP TABLE IF EXISTS `loan_logs`;

CREATE TABLE `loan_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `loan_id` bigint(20) unsigned NOT NULL,
  `loan_schedule_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `datetime` datetime NOT NULL,
  `logs` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `loan_logs_loan_id_foreign` (`loan_id`),
  KEY `loan_logs_created_by_foreign` (`created_by`),
  KEY `loan_logs_updated_by_foreign` (`updated_by`),
  CONSTRAINT `loan_logs_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `loan_logs_loan_id_foreign` FOREIGN KEY (`loan_id`) REFERENCES `loans` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `loan_logs_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `loan_logs` */

/*Table structure for table `loan_schedule_installments` */

DROP TABLE IF EXISTS `loan_schedule_installments`;

CREATE TABLE `loan_schedule_installments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `loan_schedule_id` bigint(20) unsigned NOT NULL,
  `month` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from` date NOT NULL,
  `to` date NOT NULL,
  `installment` double NOT NULL DEFAULT '0',
  `principal` double NOT NULL DEFAULT '0',
  `interest_rate` double NOT NULL DEFAULT '0',
  `interest` double NOT NULL DEFAULT '0',
  `urpa` double NOT NULL DEFAULT '0',
  `provision` int(11) NOT NULL DEFAULT '0',
  `provision_entry_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `provision_reversal` int(11) NOT NULL DEFAULT '0',
  `provision_reversal_entry_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `paid` int(11) NOT NULL DEFAULT '0',
  `loan_schedule_payment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `rescheduled` int(11) NOT NULL DEFAULT '0',
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `loan_schedule_installments_loan_schedule_id_foreign` (`loan_schedule_id`),
  KEY `loan_schedule_installments_created_by_foreign` (`created_by`),
  KEY `loan_schedule_installments_updated_by_foreign` (`updated_by`),
  CONSTRAINT `loan_schedule_installments_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `loan_schedule_installments_loan_schedule_id_foreign` FOREIGN KEY (`loan_schedule_id`) REFERENCES `loan_schedules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `loan_schedule_installments_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `loan_schedule_installments` */

/*Table structure for table `loan_schedule_payments` */

DROP TABLE IF EXISTS `loan_schedule_payments`;

CREATE TABLE `loan_schedule_payments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `loan_schedule_id` bigint(20) unsigned NOT NULL,
  `month` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from` date NOT NULL,
  `to` date NOT NULL,
  `date` date NOT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `desc` text COLLATE utf8mb4_unicode_ci,
  `entry_id` bigint(20) unsigned NOT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `loan_schedule_payments_loan_schedule_id_foreign` (`loan_schedule_id`),
  KEY `loan_schedule_payments_entry_id_foreign` (`entry_id`),
  KEY `loan_schedule_payments_created_by_foreign` (`created_by`),
  KEY `loan_schedule_payments_updated_by_foreign` (`updated_by`),
  CONSTRAINT `loan_schedule_payments_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `loan_schedule_payments_entry_id_foreign` FOREIGN KEY (`entry_id`) REFERENCES `entries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `loan_schedule_payments_loan_schedule_id_foreign` FOREIGN KEY (`loan_schedule_id`) REFERENCES `loan_schedules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `loan_schedule_payments_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `loan_schedule_payments` */

/*Table structure for table `loan_schedules` */

DROP TABLE IF EXISTS `loan_schedules`;

CREATE TABLE `loan_schedules` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `loan_id` bigint(20) unsigned NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `principal` double NOT NULL DEFAULT '0',
  `interest_rate` double NOT NULL DEFAULT '0',
  `number_of_installments` double NOT NULL DEFAULT '0',
  `installment_amount` double NOT NULL DEFAULT '0',
  `rescheduled` int(11) NOT NULL DEFAULT '0',
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `loan_schedules_loan_id_foreign` (`loan_id`),
  KEY `loan_schedules_created_by_foreign` (`created_by`),
  KEY `loan_schedules_updated_by_foreign` (`updated_by`),
  CONSTRAINT `loan_schedules_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `loan_schedules_loan_id_foreign` FOREIGN KEY (`loan_id`) REFERENCES `loans` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `loan_schedules_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `loan_schedules` */

/*Table structure for table `loan_types` */

DROP TABLE IF EXISTS `loan_types`;

CREATE TABLE `loan_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `loan_types_created_by_foreign` (`created_by`),
  KEY `loan_types_updated_by_foreign` (`updated_by`),
  CONSTRAINT `loan_types_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `loan_types_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `loan_types` */

insert  into `loan_types`(`id`,`name`,`desc`,`created_by`,`updated_by`,`deleted_at`,`created_at`,`updated_at`) values (1,'Local Loan',NULL,22,NULL,NULL,'2022-12-22 10:02:46','2022-12-22 10:02:46'),(2,'International Loan',NULL,22,NULL,NULL,'2022-12-22 10:02:55','2022-12-22 10:02:55');

/*Table structure for table `loans` */

DROP TABLE IF EXISTS `loans`;

CREATE TABLE `loans` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `loan_type_id` bigint(20) unsigned NOT NULL,
  `bank_account_id` bigint(20) unsigned NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci,
  `cycle` enum('monthly','quarterly','semianually','annually') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'monthly',
  `principal` double NOT NULL DEFAULT '0',
  `interest_rate` double NOT NULL DEFAULT '0',
  `number_of_installments` double NOT NULL DEFAULT '0',
  `installment_amount` double NOT NULL DEFAULT '0',
  `first_instalment_date` date NOT NULL,
  `interest_calculation_starts_from` date NOT NULL,
  `status` enum('pending','aprroved','denied') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `attachments` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `loans_loan_type_id_foreign` (`loan_type_id`),
  KEY `loans_bank_account_id_foreign` (`bank_account_id`),
  KEY `loans_created_by_foreign` (`created_by`),
  KEY `loans_updated_by_foreign` (`updated_by`),
  CONSTRAINT `loans_bank_account_id_foreign` FOREIGN KEY (`bank_account_id`) REFERENCES `bank_accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `loans_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `loans_loan_type_id_foreign` FOREIGN KEY (`loan_type_id`) REFERENCES `loan_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `loans_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `loans` */

/*Table structure for table `menus` */

DROP TABLE IF EXISTS `menus`;

CREATE TABLE `menus` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `module` enum('main','finance','procurement','manufacturing','inventory-management','order-management','warehouse-management','supply-chain-management','customer-relationship-management','professional-services-automation','workforce-management','human-resources-management','ecommerce','marketing-automation','merchandise','project-management','sales') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'procurement',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_bn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `big_icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serial_num` tinyint(3) unsigned NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `slug` text COLLATE utf8mb4_unicode_ci,
  `menu_for` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Menu for admin',
  `open_new_tab` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No Open New Tab',
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menus_created_by_foreign` (`created_by`),
  KEY `menus_updated_by_foreign` (`updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `menus` */

insert  into `menus`(`id`,`module`,`name`,`name_bn`,`url`,`icon_class`,`icon`,`big_icon`,`serial_num`,`status`,`slug`,`menu_for`,`open_new_tab`,`created_by`,`updated_by`,`deleted_at`,`created_at`,`updated_at`) values (1,'procurement','Dashboard',NULL,'/','las la-home',NULL,NULL,1,'Active','[\"pending\",\"halt\",\"requisition-acknowledge\"]','Menu for admin','No Open New Tab',1,1,NULL,'2021-12-23 11:24:08','2021-12-27 14:58:43'),(2,'procurement','PMS Dashbarod',NULL,'/pms','las la-home',NULL,NULL,2,'Active','[\"halt\",\"pending\",\"requisition-list\"]','Menu for admin','No Open New Tab',1,1,NULL,'2021-12-23 11:28:05','2022-04-25 15:50:03'),(3,'procurement','Requisition',NULL,'#','las la-list',NULL,NULL,3,'Active','[\"halt-requisitions\",\"requisition-delete\",\"requisition-edit\",\"requisition-create\",\"requisition-list\",\"requisition-list-view\"]','Menu for admin','No Open New Tab',1,1,NULL,'2021-12-23 11:30:03','2022-06-07 12:09:17'),(4,'procurement','Requisition Management',NULL,'#','las la-list',NULL,NULL,5,'Active','[\"rfp-list\",\"rfp-delete\",\"rfp-edit\",\"rfp-create\",\"rfp-requisitions-list\"]','Menu for admin','No Open New Tab',1,1,NULL,'2021-12-23 11:34:42','2022-06-16 11:59:04'),(5,'procurement','Inventory',NULL,'#','las la-list',NULL,NULL,6,'Active','[\"inventory-logs\",\"inventory-summery-list\"]','Menu for admin','No Open New Tab',1,1,NULL,'2021-12-23 11:36:45','2021-12-27 11:51:54'),(6,'procurement','Product Manage',NULL,'#','las la-list',NULL,NULL,7,'Active','[\"price-graph\",\"sub-category-list\",\"category-list\",\"attribute-option-delete\",\"attribute-option-edit\",\"attribute-option-create\",\"attribute-options\",\"attribute-delete\",\"attribute-edit\",\"attribute-create\",\"attributes\",\"product-list\",\"product-unit-list\"]','Menu for admin','No Open New Tab',1,1,NULL,'2021-12-23 11:37:15','2024-01-25 14:38:37'),(7,'procurement','Quotations Manage',NULL,'#','las la-file-invoice',NULL,NULL,8,'Active','[\"estimate-approval-list\",\"estimate-reject-list\",\"quotation-reject-list\",\"quotation-index\",\"cs-analysis\",\"quotations-approval-list\"]','Menu for admin','No Open New Tab',1,1,NULL,'2021-12-23 11:38:01','2022-06-22 03:14:02'),(8,'procurement','Supplier',NULL,'pms/supplier','las la-list',NULL,NULL,10,'Active','[\"supplier-delete\",\"supplier-edit\",\"supplier-create\",\"supplier-list\"]','Menu for admin','No Open New Tab',1,1,NULL,'2021-12-23 11:39:23','2022-06-03 15:34:38'),(9,'main','ACL',NULL,'#','las la-users-cog',NULL,NULL,100,'Active','[\"user-list\"]','Menu for admin','No Open New Tab',1,1,NULL,'2021-12-23 11:41:48','2023-12-18 14:54:52'),(10,'procurement','Settings',NULL,'#','las la-cogs',NULL,NULL,15,'Active','[\"range-setup\"]','Menu for admin','No Open New Tab',1,1,NULL,'2021-12-23 11:43:49','2022-07-26 18:15:11'),(11,'procurement','Store Manage',NULL,'#','las la-store-alt',NULL,NULL,4,'Active','[\"store-deliverd-requistion-list\",\"store-requisition\"]','Menu for admin','No Open New Tab',1,1,NULL,'2021-12-23 11:48:29','2022-02-16 14:18:59'),(12,'main','Users',NULL,'pms/admin/users','las la-user-secret',NULL,NULL,99,'Active','[\"user-list\"]','Menu for admin','No Open New Tab',1,1,NULL,'2021-12-23 12:25:13','2023-12-18 15:01:09'),(13,'procurement','Purchase',NULL,'#','fa fa-list',NULL,NULL,9,'Active','[\"work-order-cancel\",\"po-list\"]','Menu for admin','No Open New Tab',1,1,NULL,'2021-12-29 14:50:55','2022-06-22 10:36:43'),(14,'procurement','Gate In',NULL,'#','las la-clipboard',NULL,NULL,11,'Active','[\"gate-out-list\",\"grn-list\",\"grn-po-list\"]','Menu for admin','No Open New Tab',1,1,NULL,'2022-01-03 12:45:33','2022-06-22 03:15:47'),(15,'procurement','Quality-Ensure',NULL,'#','las la-check',NULL,NULL,12,'Active','[\"quality-ensure\"]','Menu for admin','No Open New Tab',1,1,NULL,'2022-01-18 17:04:24','2022-02-21 11:31:04'),(16,'procurement','Bill Manage',NULL,'#','las la-file',NULL,NULL,14,'Active','[\"po-advance-audit\",\"billing-wise-po-attachment-list\",\"upload-po-attachment\"]','Menu for admin','No Open New Tab',1,1,NULL,'2022-02-06 12:05:55','2022-10-12 23:32:34'),(17,'procurement','Project Menu',NULL,'pms/admin/project-menu','las la-list',NULL,NULL,14,'Active','[\"project-manage\"]','Menu for admin','No Open New Tab',1,1,'2022-02-15 18:05:41','2022-02-15 18:01:55','2022-02-15 18:05:41'),(18,'procurement','GRN',NULL,'#','las la-list',NULL,NULL,13,'Active','[\"grn-stock-in-list\"]','Menu for admin','No Open New Tab',1,1,NULL,'2022-02-21 11:21:35','2022-02-21 11:26:51'),(19,'procurement','Accounts',NULL,'#','las la-clipboard',NULL,NULL,18,'Active','[\"supplier-wise-entry-list\",\"po-wise-entry-list\",\"accounts-po-attachment-list\",\"supplier-ledger-list\",\"accounts-list\"]','Menu for admin','No Open New Tab',1,1,'2023-06-14 15:35:59','2022-03-01 12:56:56','2023-06-14 15:35:59'),(20,'procurement','Projects',NULL,'/pms/dashboard-grid','las la-project-diagram',NULL,NULL,19,'Active','[\"project-action\",\"project-manage\",\"quotations-approval-list\"]','Menu for admin','No Open New Tab',1,1,'2023-06-14 15:36:03','2022-03-02 15:37:26','2023-06-14 15:36:03'),(21,'procurement','PMO',NULL,'/pms/pmo','las la-building',NULL,NULL,20,'Active','[\"pmo\"]','Menu for admin','No Open New Tab',1,NULL,'2023-06-14 15:36:15','2022-03-21 13:12:12','2023-06-14 15:36:15'),(22,'procurement','PO Cash Approval',NULL,'pms/po-cash-approval','la la-list',NULL,NULL,17,'Active','[\"po-cash-approval-list\"]','Menu for admin','No Open New Tab',1,1,'2023-06-14 15:35:56','2022-06-07 16:59:08','2023-06-14 15:35:56'),(23,'procurement','Estimate',NULL,'pms/estimate','lar la-newspaper',NULL,NULL,5,'Active','[\"estimate-list\"]','Menu for admin','No Open New Tab',1,NULL,NULL,'2022-06-16 11:58:03','2022-06-16 11:58:03'),(24,'procurement','Accounts Settings',NULL,'#','las la-cogs',NULL,NULL,22,'Active','[\"bank-account-approve\",\"bank-account-assessment\",\"bank-account-review\",\"bank-account-request\",\"chart-of-account-approve\",\"chart-of-account-assessment\",\"chart-of-account-review\",\"accounts-default-settings\",\"companies\",\"cost-centres\",\"fiscal-years\",\"bank-account-delete\",\"bank-account-edit\",\"bank-account-create\",\"bank-accounts\",\"tags\",\"entry-types\"]','Menu for admin','No Open New Tab',1,1,'2023-06-14 15:36:36','2022-08-18 16:52:30','2023-06-14 15:36:36'),(25,'procurement','Reports',NULL,'#','las la-chart-pie',NULL,NULL,24,'Active','[\"accounts-report\"]','Menu for admin','No Open New Tab',1,1,'2023-06-14 15:36:59','2022-08-18 16:53:25','2023-06-14 15:36:59'),(26,'procurement','Entries',NULL,'accounting/entries','lar la-plus-square',NULL,NULL,22,'Active','[\"entry-view\",\"entry-delete\",\"entry-edit\",\"entry-create\",\"entry-list\"]','Menu for admin','No Open New Tab',1,1,'2023-06-14 15:36:30','2022-08-18 16:57:05','2023-06-14 15:36:30'),(27,'procurement','Chart of Accounts',NULL,'accounting/chart-of-accounts','las la-money-bill',NULL,NULL,21,'Active','[\"account-groups-delete\",\"account-groups-edit\",\"account-groups-create\",\"chart-of-accounts-delete\",\"chart-of-accounts-edit\",\"chart-of-accounts-create\",\"chart-of-accounts\"]','Menu for admin','No Open New Tab',1,NULL,'2023-06-14 15:36:21','2022-08-18 17:00:31','2023-06-14 15:36:21'),(28,'procurement','Fixed Assets Settings',NULL,'#','la la-cogs',NULL,NULL,25,'Active','[\"fixed-asset-location-delete\",\"fixed-asset-location-edit\",\"fixed-asset-location-create\",\"fixed-asset-locations\"]','Menu for admin','No Open New Tab',1,1,'2023-06-14 15:37:03','2022-09-24 08:19:04','2023-06-14 15:37:03'),(29,'procurement','Fixed Assets',NULL,'#','las la-tools',NULL,NULL,26,'Active','[\"fixed-asset-depreciation-history\",\"fixed-asset-depreciations\",\"fixed-asset-distribution-history\",\"fixed-asset-distributions\"]','Menu for admin','No Open New Tab',1,1,'2023-06-14 15:37:07','2022-09-25 12:16:19','2023-06-14 15:37:07'),(30,'procurement','Fixed Asset Reports',NULL,'#','las la-chart-pie',NULL,NULL,27,'Active','[\"fixed-asset-report\"]','Menu for admin','No Open New Tab',1,NULL,'2023-06-14 15:35:13','2022-09-27 09:11:38','2023-06-14 15:35:13'),(31,'procurement','Fixed Assets Manage',NULL,'#','las la-tools',NULL,NULL,8,'Active','[\"fixed-asstes-products\",\"fixed-asstes-subcategories\",\"fixed-assets-categories\"]','Menu for admin','No Open New Tab',1,NULL,'2023-06-14 15:35:45','2022-10-03 14:52:59','2023-06-14 15:35:45'),(32,'procurement','Depreciation',NULL,'#','las la-hourglass-half',NULL,NULL,8,'Active','[\"depreciation-history\",\"depreciation-book\",\"process-depreciation\"]','Menu for admin','No Open New Tab',1,NULL,'2023-06-14 15:35:41','2022-10-05 10:44:20','2023-06-14 15:35:41'),(33,'procurement','Asset Sale & Disposals',NULL,'#','las la-recycle',NULL,NULL,8,'Active','[\"fixed-asset-disposal-history\",\"fixed-asset-disposal\"]','Menu for admin','No Open New Tab',1,NULL,'2023-06-14 15:35:36','2022-10-06 10:27:48','2023-06-14 15:35:36'),(34,'procurement','CWIP Manage',NULL,'#','las la-recycle',NULL,NULL,8,'Active','[\"cwip-products\",\"cwip-sub-categories\",\"cwip-categories\"]','Menu for admin','No Open New Tab',1,1,'2023-06-14 15:35:31','2022-10-23 10:54:59','2023-06-14 15:35:31'),(35,'procurement','PO Closing Activities',NULL,'accounting/po-closing-activities','las la-recycle',NULL,NULL,28,'Active','[\"po-closing-activities\"]','Menu for admin','No Open New Tab',1,NULL,'2023-06-14 15:35:10','2022-11-01 14:41:26','2023-06-14 15:35:10'),(36,'procurement','Asset Costing Entries',NULL,'accounting/asset-costing-entries','las la-coins',NULL,NULL,29,'Active','[\"asset-costing-entries\"]','Menu for admin','No Open New Tab',1,NULL,'2023-06-14 15:35:07','2022-11-02 09:24:09','2023-06-14 15:35:07'),(37,'procurement','CWIP to Asset',NULL,'accounting/cwip-to-asset','las la-location-arrow',NULL,NULL,30,'Active','[\"cwit-to-asset\"]','Menu for admin','No Open New Tab',1,NULL,'2023-06-14 15:35:03','2022-11-02 14:56:23','2023-06-14 15:35:03'),(38,'procurement','Bank Reconciliation',NULL,'#','las la-balance-scale',NULL,NULL,31,'Active','[\"bank-reconciliation-history\",\"bank-reconciliation\"]','Menu for admin','No Open New Tab',1,NULL,'2023-06-14 15:34:59','2022-11-08 13:36:55','2023-06-14 15:34:59'),(39,'procurement','Currencies',NULL,'#','las la-money-bill-alt',NULL,NULL,32,'Active','[\"exchange-rates\",\"currencies\",\"currency-types\"]','Menu for admin','No Open New Tab',1,NULL,'2023-06-14 15:34:55','2022-11-27 13:13:55','2023-06-14 15:34:55'),(40,'procurement','Loans',NULL,'#','las la-hand-holding-usd',NULL,NULL,33,'Active','[\"loan-reports\",\"loan-schedule-payments\",\"loan-schedule-installments\",\"loan-schedules\",\"loans\",\"loan-types\"]','Menu for admin','No Open New Tab',1,NULL,'2023-06-14 15:34:51','2022-12-22 09:38:08','2023-06-14 15:34:51'),(41,'procurement','Cheque Register',NULL,'#','las la-money-check-alt',NULL,NULL,23,'Active','[\"cheque-book-delete\",\"cheque-book-edit\",\"cheque-book-create\",\"cheque-book-page-damage\",\"cheque-book-pages\",\"cheque-books\",\"cheque-register\"]','Menu for admin','No Open New Tab',1,1,'2023-06-14 15:36:49','2023-02-26 13:29:41','2023-06-14 15:36:49'),(42,'procurement','Service',NULL,'#','las la-code-branch',NULL,NULL,34,'Active','[\"service-confirmation\"]','Menu for admin','No Open New Tab',1,1,NULL,'2023-04-20 13:12:30','2023-04-20 13:47:20'),(43,'procurement','Fiscal Year Closings',NULL,'accounting/fiscal-year-closings','lar la-stop-circle',NULL,NULL,22,'Active','[\"fiscal-year-closing-run\",\"fiscal-year-closings\"]','Menu for admin','No Open New Tab',1,NULL,'2023-06-14 15:36:24','2023-04-30 12:16:38','2023-06-14 15:36:24'),(44,'procurement','Bank Currency Transfer',NULL,'accounting/bank-currency-transfer','las la-random',NULL,NULL,23,'Active','[\"run-bank-currency-transfer\",\"bank-currency-transfer\"]','Menu for admin','No Open New Tab',1,NULL,'2023-06-14 15:36:41','2023-05-08 13:03:08','2023-06-14 15:36:41'),(45,'procurement','Unrealized Currency Evaluation',NULL,'#','las la-balance-scale',NULL,NULL,35,'Active','[\"unrealized-currency-event-histories\",\"unrealized-currency-events\",\"unrealized-currency-settings\"]','Menu for admin','No Open New Tab',1,1,'2023-06-14 15:34:33','2023-05-25 11:50:41','2023-06-14 15:34:33'),(46,'procurement','d23d23dre3e',NULL,'2e2e2e2e2','e2e2e',NULL,NULL,36,'Active','[\"unrealized-currency-events\"]','Menu for admin','No Open New Tab',1,NULL,'2023-06-01 12:42:08','2023-06-01 12:40:09','2023-06-01 12:42:08'),(47,'project-management','Dashboard',NULL,'/pms/dashboard-grid','las la-home',NULL,NULL,2,'Active','[\"project-manage\"]','Menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:05:43','2023-06-01 13:05:43'),(48,'project-management','Add New Project',NULL,'/pms/my-project/create','las la-plus-circle',NULL,NULL,3,'Active','[\"project-manage-create\"]','Menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:05:43','2023-06-01 13:05:43'),(49,'project-management','Home',NULL,'/pms','las la-home',NULL,NULL,1,'Active','[\"requisition-list\"]','Menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:05:43','2023-06-01 13:05:43'),(50,'project-management','Settings',NULL,'javascript:void(0)','las la-cog',NULL,NULL,4,'Active','[\"day-setup\",\"department-lists\",\"holiday-setup\",\"project-settings\",\"project-objectives\",\"project-type-list\"]','Menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:05:43','2023-06-01 13:05:43'),(51,'project-management','PMO List',NULL,'pms/pmo','las la-list',NULL,NULL,5,'Active','[\"pmo\"]','Menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:05:44','2023-06-01 13:05:44'),(52,'project-management','Projects',NULL,'javascript:void(0)','las la-tasks',NULL,NULL,6,'Active','[\"project-manage-close-list\",\"project-manage-pending-list\",\"project-manage-ongoing-list\",\"project-manage-draft-list\",\"project-manage-reapproval-list\",\"project-manage-planned-list\",\"project-manage-halt-list\",\"project-manage\"]','Menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:05:44','2023-06-01 13:05:44'),(53,'project-management','Task Change Requests',NULL,'pms/task-change-requests','las la-exchange-alt',NULL,NULL,7,'Active','[\"project-task-change-request-logs\",\"project-task-change-request-action\",\"project-task-change-request-list\"]','Menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:05:44','2023-06-01 13:05:44'),(54,'finance','Chart of Accounts',NULL,'accounting/chart-of-accounts','las la-money-bill',NULL,NULL,4,'Active','[\"chart-of-account-approve\",\"chart-of-account-assessment\",\"chart-of-account-review\",\"chart-of-account-request\",\"chart-of-accounts-delete\",\"chart-of-accounts-edit\",\"chart-of-accounts-create\",\"chart-of-accounts\"]','Menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:14','2023-06-01 13:08:14'),(55,'finance','Settings',NULL,'#','las la-cogs',NULL,NULL,5,'Active','[\"bank-account-approve\",\"bank-account-assessment\",\"bank-account-review\",\"bank-account-request\",\"accounts-default-settings\",\"companies\",\"cost-centres\",\"fiscal-years\",\"bank-account-create\",\"bank-accounts\",\"tags\",\"entry-types\"]','Menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:14','2023-06-01 13:08:14'),(56,'finance','Entries',NULL,'accounting/entries','lar la-plus-square',NULL,NULL,7,'Active','[\"entry-approve\",\"entry-assessment\",\"entry-review\",\"entry-request\",\"entry-view\",\"entry-delete\",\"entry-edit\",\"entry-create\",\"entry-list\"]','Menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:14','2023-06-01 13:08:14'),(57,'finance','Reports',NULL,'#','las la-chart-pie',NULL,NULL,100,'Active','[\"accounts-report\"]','Menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:14','2023-06-01 13:08:14'),(58,'finance','Requisition',NULL,'#','las la-list',NULL,NULL,1,'Active','[\"halt-requisitions\"]','Menu for admin','No Open New Tab',1,NULL,'2023-06-14 11:30:51','2023-06-01 13:08:14','2023-06-14 11:30:51'),(59,'finance','PO Cash Approval',NULL,'pms/po-cash-approval','la la-list',NULL,NULL,2,'Active','[\"po-cash-approval-list\"]','Menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:15','2023-06-01 13:08:15'),(60,'finance','Accounts',NULL,'#','las la-clipboard',NULL,NULL,3,'Active','[\"supplier-wise-entry-list\",\"po-wise-entry-list\",\"accounts-po-attachment-list\",\"supplier-ledger-list\",\"accounts-list\"]','Menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:15','2023-06-01 13:08:15'),(61,'finance','Fixed Assets Settings',NULL,'#','la la-cogs',NULL,NULL,170,'Active','[\"fixed-asset-location-delete\",\"fixed-asset-location-edit\",\"fixed-asset-location-create\",\"fixed-asset-locations\"]','Menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:15','2023-06-01 13:08:15'),(62,'finance','Fixed Assets',NULL,'#','las la-tools',NULL,NULL,110,'Active','[\"fixed-asset-depreciation-history\",\"fixed-asset-depreciations\",\"fixed-asset-distribution-history\",\"fixed-asset-distributions\"]','Menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:15','2023-06-01 13:08:15'),(63,'finance','Fixed Asset Reports',NULL,'#','las la-chart-pie',NULL,NULL,140,'Active','[\"fixed-asset-report\"]','Menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:15','2023-06-01 13:08:15'),(64,'finance','Depreciation',NULL,'#','las la-hourglass-half',NULL,NULL,120,'Active','[\"depreciation-history\",\"depreciation-book\",\"process-depreciation\"]','Menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:15','2023-06-01 13:08:15'),(65,'finance','Asset Sale & Disposals',NULL,'#','las la-recycle',NULL,NULL,130,'Active','[\"fixed-asset-disposal-history\",\"fixed-asset-disposal\"]','Menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:15','2023-06-01 13:08:15'),(66,'finance','PO Closing Activities',NULL,'accounting/po-closing-activities','las la-recycle',NULL,NULL,250,'Active','[\"po-closing-activities\"]','Menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:15','2023-06-01 13:08:15'),(67,'finance','Asset Costing Entries',NULL,'accounting/asset-costing-entries','las la-coins',NULL,NULL,150,'Active','[\"asset-costing-entries\"]','Menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:16','2023-06-01 13:08:16'),(68,'finance','CWIP to Asset',NULL,'accounting/cwip-to-asset','las la-location-arrow',NULL,NULL,160,'Active','[\"cwit-to-asset\"]','Menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:16','2023-06-01 13:08:16'),(69,'finance','Bank Reconciliation',NULL,'#','las la-balance-scale',NULL,NULL,18,'Active','[\"bank-reconciliation-history\",\"bank-reconciliation\"]','Menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:16','2023-06-01 13:08:16'),(70,'finance','Currencies',NULL,'#','las la-money-bill-alt',NULL,NULL,19,'Active','[\"exchange-rates\",\"currencies\",\"currency-types\"]','Menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:16','2023-06-01 13:08:16'),(71,'finance','Loans',NULL,'#','las la-hand-holding-usd',NULL,NULL,20,'Active','[\"loan-reports\",\"loan-schedule-payments\",\"loan-schedule-installments\",\"loan-schedules\",\"loans\",\"loan-types\"]','Menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:16','2023-06-01 13:08:16'),(72,'finance','Cheque Register',NULL,'#','las la-money-check-alt',NULL,NULL,8,'Active','[\"cheque-book-delete\",\"cheque-book-edit\",\"cheque-book-create\",\"cheque-book-page-damage\",\"cheque-book-pages\",\"cheque-books\",\"cheque-register\"]','Menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:16','2023-06-01 13:08:16'),(73,'finance','Fiscal Year Closings',NULL,'accounting/fiscal-year-closings','lar la-stop-circle',NULL,NULL,10,'Active','[\"fiscal-year-closing-run\",\"fiscal-year-closings\"]','Menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:16','2023-06-01 13:08:16'),(74,'finance','Bank Currency Transfer',NULL,'accounting/bank-currency-transfer','las la-random',NULL,NULL,9,'Active','[\"run-bank-currency-transfer\",\"bank-currency-transfer\"]','Menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:16','2023-06-01 13:08:16'),(75,'finance','Unrealized Currency Evaluation',NULL,'#','las la-balance-scale',NULL,NULL,21,'Active','[\"unrealized-currency-event-histories\",\"unrealized-currency-events\",\"unrealized-currency-settings\"]','Menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:16','2023-06-01 13:08:16'),(77,'sales','Dashboard',NULL,'sales/dashboard','la la-home',NULL,NULL,35,'Active','[\"sale-dashboard\"]','Menu for admin','No Open New Tab',1,1,NULL,'2023-07-09 10:47:22','2023-07-09 12:04:31'),(78,'sales','Transactions',NULL,'#','las la-receipt',NULL,NULL,36,'Active','[\"direct-invoice\",\"direct-delivery\",\"sales-order-entry\",\"sales-quotation-entry\"]','Menu for admin','No Open New Tab',1,NULL,NULL,'2023-07-09 11:57:03','2023-07-09 11:57:03'),(79,'sales','Delivery & Invoices',NULL,'#','las la-truck-loading',NULL,NULL,37,'Active','[\"create-and-print-recurrent-invoices\",\"template-invoice\",\"template-delivery\",\"invoice-prepaid-orders\",\"invoice-against-sales-delivery\",\"delivery-against-sales-orders\"]','Menu for admin','No Open New Tab',1,NULL,NULL,'2023-07-09 11:58:03','2023-07-09 11:58:03'),(80,'sales','Payments',NULL,'#','las la-money-check-alt',NULL,NULL,38,'Active','[\"allocate-customer-payments-or-credit-notes\",\"customer-credit-notes\",\"customer-payments\"]','Menu for admin','No Open New Tab',1,NULL,NULL,'2023-07-09 11:58:43','2023-07-09 11:58:43'),(81,'sales','Inquiries',NULL,'#','las la-file-alt',NULL,NULL,39,'Active','[\"customer-and-sales-reports\",\"customer-allocation-inquiry\",\"customer-transaction-inquiry\",\"sales-order-inquiry\",\"sales-quotation-inquiry\"]','Menu for admin','No Open New Tab',1,NULL,NULL,'2023-07-09 12:00:14','2023-07-09 12:00:14'),(82,'sales','Maintenance',NULL,'#','las la-cogs',NULL,NULL,50,'Active','[\"sales-default-settings\",\"sales-areas\",\"sales-persons\",\"sales-types\",\"recurrent-invoices\",\"sales-groups\",\"customer-branches\",\"customers\"]','Menu for admin','No Open New Tab',1,1,NULL,'2023-07-09 12:00:51','2023-07-27 15:25:22'),(83,'sales','Reports',NULL,'#','las la-chart-bar',NULL,NULL,40,'Active','[\"item-sales-summary-report\",\"inventory-sales-report\",\"tax-report\",\"print-receipts\",\"print-sales-quotations\",\"print-sales-orders\",\"print-statements\",\"print-deliveries\",\"print-credit-notes\",\"print-invoices\",\"salesman-listing\",\"order-status-listing\",\"price-listing\",\"sales-summary-report\",\"customer-detail-listing\",\"customer-trial-balance\",\"aged-customer-analysis\",\"customer-balances\"]','Menu for admin','No Open New Tab',1,NULL,NULL,'2023-07-27 15:26:57','2023-07-27 15:26:57'),(84,'finance','Receivable Clearings',NULL,'#','las la-file-invoice-dollar',NULL,NULL,12,'Active','[\"receivable-clearing-cencellation\",\"receivable-clearings\"]','Menu for admin','No Open New Tab',1,1,NULL,'2023-09-19 13:32:24','2023-09-24 12:18:33'),(85,'finance','Payment Clearings',NULL,'#','las la-file-invoice-dollar',NULL,NULL,11,'Active','[\"payment-clearing-cencellation\",\"payment-clearings\"]','Menu for admin','No Open New Tab',1,NULL,NULL,'2023-09-24 12:18:32','2023-09-24 12:18:32'),(86,'main','System Information',NULL,'pms/system-information','las la-cogs',NULL,NULL,0,'Active','[\"system-information\"]','Menu for admin','No Open New Tab',1,1,NULL,'2023-12-11 10:12:40','2023-12-11 10:13:20'),(87,'main','Modules',NULL,'pms/modules','las la-project-diagram',NULL,NULL,1,'Active','[\"modules\"]','Menu for admin','No Open New Tab',1,1,NULL,'2023-12-11 11:13:56','2023-12-11 11:15:15'),(88,'main','SBU',NULL,'pms/sbu','las la-link',NULL,NULL,2,'Active','[\"hr-units\"]','Menu for admin','No Open New Tab',1,1,NULL,'2023-12-14 12:27:49','2023-12-16 20:20:51'),(89,'main','Departments',NULL,'pms/departments','las la-desktop',NULL,NULL,3,'Active','[\"hr-departments\"]','Menu for admin','No Open New Tab',1,NULL,NULL,'2023-12-18 14:56:25','2023-12-18 14:56:25'),(90,'main','Sections',NULL,'pms/sections','las la-sort-amount-up-alt',NULL,NULL,4,'Active','[\"hr-sections\"]','Menu for admin','No Open New Tab',1,1,NULL,'2023-12-18 14:57:02','2023-12-18 14:58:25'),(91,'main','Locations',NULL,'pms/locations','las la-location-arrow',NULL,NULL,5,'Active','[\"hr-locations\"]','Menu for admin','No Open New Tab',1,1,NULL,'2023-12-18 14:58:03','2023-12-18 16:03:09'),(92,'main','Designations',NULL,'pms/designations','las la-user-tie',NULL,NULL,7,'Active','[\"hr-designations\"]','Menu for admin','No Open New Tab',1,1,NULL,'2023-12-18 14:59:35','2024-03-11 10:58:39'),(93,'main','Employees',NULL,'pms/employees','las la-users',NULL,NULL,8,'Active','[\"hr-employees\"]','Menu for admin','No Open New Tab',1,1,NULL,'2023-12-18 15:00:16','2024-03-11 10:58:42'),(94,'main','Upload Excels',NULL,'pms/upload-excels','las la-file-upload',NULL,NULL,101,'Active','[\"upload-excels\"]','Menu for admin','No Open New Tab',1,NULL,NULL,'2023-12-19 15:18:26','2023-12-19 15:18:26'),(95,'finance','Integration',NULL,'#','las la-link',NULL,NULL,255,'Active','[\"transaction-logs\",\"transaction-entries\",\"transactions\",\"requirement\",\"entry-point\",\"control-point\",\"source\",\"sub-process\",\"process\"]','Menu for admin','No Open New Tab',1,1,NULL,'2024-02-01 13:01:31','2024-02-01 13:02:33'),(96,'finance','Bank Account',NULL,'#','las la-university',NULL,NULL,6,'Active','[\"bank-lists\",\"bank-branches\",\"bank-account-types\",\"bank-accounts\"]','Menu for admin','No Open New Tab',1,NULL,NULL,'2024-02-08 15:38:21','2024-02-08 15:38:21'),(97,'finance','Scheduled Payment',NULL,'accounting/scheduled-payment','las la-receipt',NULL,NULL,7,'Active','[\"schedule-payments\"]','Menu for admin','No Open New Tab',1,1,NULL,'2024-02-11 10:05:28','2024-02-11 10:06:18'),(98,'finance','Fiscal Year Openings',NULL,'accounting/fiscal-year-openings','las la-lock-open',NULL,NULL,10,'Active','[\"fiscal-year-opening-approval\",\"open-fiscal-year\",\"fiscal-year-openings\"]','Menu for admin','No Open New Tab',1,1,NULL,'2024-02-12 11:48:51','2024-02-12 11:49:45'),(99,'finance','Multi-Currency Transaction',NULL,'accounting/multi-currency-transaction','las la-comments-dollar',NULL,NULL,7,'Active','[\"multi-currency-transaction\"]','Menu for admin','No Open New Tab',1,NULL,NULL,'2024-02-24 10:09:12','2024-02-24 10:09:12'),(100,'finance','Approval Levels',NULL,'accounting/approval-levels','las la-user-check',NULL,NULL,254,'Active','[\"approval-level-delete\",\"approval-level-edit\",\"approval-level-create\",\"approval-levels\"]','Menu for admin','No Open New Tab',1,NULL,NULL,'2024-03-02 11:45:23','2024-03-02 11:45:23'),(101,'main','Warehouse',NULL,'pms/warehouses','las la-warehouse',NULL,NULL,6,'Active','[\"warehouses\"]','Menu for admin','No Open New Tab',1,NULL,NULL,'2024-03-11 11:00:12','2024-03-11 11:00:12');

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=912 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2014_10_12_200000_add_two_factor_columns_to_users_table',1),(4,'2017_08_24_000000_create_settings_table',2),(5,'2019_08_19_000000_create_failed_jobs_table',2),(6,'2019_12_14_000001_create_personal_access_tokens_table',2),(7,'2020_05_21_100000_create_teams_table',2),(8,'2020_05_21_200000_create_team_user_table',2),(9,'2020_05_21_300000_create_team_invitations_table',2),(10,'2021_06_08_134647_create_hr_incentive_bonus_table',2),(11,'2021_06_12_1623474340_create_hr_bill_type_table',3),(12,'2021_06_12_1623474537_create_hr_bill_settings_table',4),(13,'2021_06_12_1623474707_create_hr_bill_special_settings_table',5),(14,'2021_06_19_114841_create_hr_bonus_app_history_table',6),(15,'2021_07_29_211604_create_activity_log_table',6),(16,'2021_08_21_131536_create_bank_branch_table',7),(17,'2021_11_24_032726_create_sessions_table',7),(18,'2021_11_24_040635_create_warehouses_table',7),(19,'2021_11_24_040921_create_brands_table',7),(20,'2021_11_24_040951_create_categories_table',7),(21,'2021_11_24_041017_create_products_table',7),(22,'2021_11_24_041043_create_suppliers_table',7),(25,'2021_11_28_034322_create_permission_tables',8),(26,'2021_11_28_094409_create_products_supplier_table',8),(27,'2021_11_30_034446_create_requisition_types_table',8),(28,'2021_11_30_083948_create_requisitions_table',8),(29,'2021_11_30_084035_create_requisition_items_table',8),(30,'2021_12_04_102341_add_requisition_type_id_to_categories_table',8),(31,'2021_12_06_052514_create_add_reference_number_date_common_coloumn_to_requisitions_table',8),(32,'2021_12_06_055459_create_add_category_id_remove_type_id_to_requisition_items_table',8),(33,'2021_12_08_035946_create_request_proposals_table',9),(34,'2021_12_08_040006_create_request_proposal_details_table',9),(35,'2021_12_08_071509_create_request_proposal_define_suppliers_table',9),(36,'2021_12_08_092051_create_inventory_summaries_table',9),(37,'2021_12_08_092139_create_inventory_details_table',9),(38,'2021_12_08_094307_create_inventory_logs_table',9),(39,'2021_12_12_090926_create_users_login_activities_table',10),(40,'2021_12_12_091818_add_mbm_column_to_users_table',10),(41,'2021_12_12_104057_create_hr_unit_table',11),(42,'2021_12_13_091818_add_delivery_status_column_to_requisition_table',12),(43,'2021_12_14_091818_add_delivery_qty_column_to_requisition_items_table',13),(44,'2021_12_15_130412_add_admin_remark_to_requisitions',14),(45,'2021_12_15_164106_create_jobs_table',14),(46,'2021_11_24_050512_create_product_quotation_lists_table',15),(47,'2021_12_20_111134_create_quotations_table',15),(48,'2021_12_20_111622_create_quotations_items_table',15),(49,'2020_11_24_022623_create_menus_table',16),(50,'2020_11_24_031938_create_sub_menus_table',16),(51,'2020_11_24_032345_create_sub_sub_menus_table',16),(54,'2021_12_22_154409_create_hr_departments_table',17),(55,'2021_12_22_162608_create_hr_designations_table',17),(56,'2021_12_22_162609_create_hr_as_basic_info_table',18),(57,'2021_12_22_162610_create_hr_location_table',19),(58,'2021_12_22_162611_create_categories_department_table',20),(59,'2021_12_26_163008_create_supplier_rattings_table',21),(60,'2021_12_26_153744_add_quotation_file_to_quotations_table',22),(61,'2021_12_27_160143_create_purchase_orders_table',22),(62,'2021_12_27_162438_create_purchase_order_items_table',22),(64,'2021_12_30_153657_add_is_po_generate_to_quotations_table',24),(65,'2022_01_02_103106_add_is_send_to_purchase_orders_table',25),(69,'2022_01_02_160123_add_reference_to_inventory_logs_table',27),(72,'2022_01_06_153619_create_approval_range_setups_table',29),(73,'2022_01_06_154615_create_user_approval_range_table',29),(75,'2022_01_09_144236_create_requisition_tracking_table',30),(76,'2022_01_09_144559_create_payment_terms_table',31),(81,'2022_01_13_144435_create_purchase_returns_table',33),(82,'2022_01_18_155229_create_requisition_deliveries_table',34),(83,'2022_01_18_155353_create_requisition_delivery_items_table',34),(85,'2022_01_23_105219_create_product_units_table',35),(86,'2022_01_25_130519_add_column_to_suppliers',36),(87,'2022_01_25_161832_create_supplier_payment_terms_table',36),(91,'2022_01_27_170514_add_new_column_status_on_requisition_delivery_items',38),(92,'2022_01_29_151918_create_request_proposal_tracking_table',39),(93,'2022_01_02_111807_create_goods_received_notes_table',40),(94,'2022_01_03_112020_create_goods_received_items_table',40),(95,'2022_01_11_130211_add_is_quality_ensure_to_goods_received_items',41),(96,'2022_02_05_150714_add_discount_amount_on_quotations_items_table',42),(97,'2022_02_06_155401_create_purchase_order_attachment_table',43),(101,'2022_02_09_164214_add_status_on_purchase_order_attachment_table',45),(102,'2022_02_13_092933_add_buffer_inventory_to_inventory_summaries_table',46),(104,'2022_02_14_151227_create_users_warehouses_table',47),(108,'2022_02_15_103929_add_warehouse_id_on_requisition_delivery_items',49),(109,'2022_02_16_132912_add_supplier_payment_terms_id_on_quotations_table',50),(110,'2022_02_19_165442_create_goods_received_items_stock_in_table',51),(113,'2022_02_20_154402_create_return_faq_table',52),(114,'2022_02_20_155304_create_return_change_faq_table',52),(115,'2022_02_24_131536_create_supplier_payments_table',53),(116,'2022_02_24_131557_create_supplier_ledgers_table',53),(117,'2022_02_28_150344_add_bill_amount_on_purchase_order_attachment',54),(118,'2022_02_28_173956_add_vat_discount_percentage_on_purchase_orders',55),(119,'2022_02_28_174224_add_vat_discount_percentage_on_goods_received_items',55),(120,'2022_02_28_174300_add_vat_discount_percentage_on_goods_received_items_stock_in',55),(129,'2022_03_02_133612_add_purchase_order_id_in_goods_received_items_stock_in',57),(130,'2022_03_03_154649_add_grn_id_on_supplier_payments_table',58),(131,'2022_03_03_154806_add_grn_id_on_purchase_order_attachment_table',58),(135,'2022_03_09_100915_billing_chalan',61),(136,'2022_03_10_131115_add_bill_number_to_po_attachment_table',62),(137,'2022_03_10_163738_add_grn_id_to_billing_challan_table',63),(138,'2022_03_16_100012_account_groups',64),(139,'2022_03_16_100013_chart_of_accounts',64),(140,'2022_02_14_095428_create_accounts_menu_table',65),(141,'2022_02_14_101253_create_accounts_sub_menus_table',65),(142,'2022_02_14_102019_create_accounts_sub_sub_menus_table',65),(143,'2022_03_20_152537_add_opening_balance_to_ledger_table',65),(144,'2022_03_21_124909_create_reference_no_on_goods_received_items_stock_in',66),(145,'2022_03_21_115359_entry_types',67),(146,'2022_03_21_115407_tags',67),(147,'2022_03_21_152803_bank_accounts',67),(148,'2022_03_21_152819_fiscal_years',67),(151,'2022_03_22_152129_add_project_id_on_requisitions_table',69),(152,'2022_03_23_125843_add_is_po_generate_column_on_requisitions',70),(153,'2022_03_23_161539_add_hr_unit_id_on_requisitons_table',71),(154,'2022_03_23_123417_add_supplier_and_owner_info_into_supplier_table',72),(155,'2022_03_23_123452_supplier_addresses',72),(156,'2022_03_23_123506_supplier_contact_persons',72),(157,'2022_03_23_125531_supplier_bank_accounts',72),(158,'2022_03_24_132605_remove_address_columns_from_supplier_table',73),(159,'2022_03_24_163224_add_hr_unit_id_on_purchase_table',74),(160,'2022_03_27_121146_add_deliverable_id_on_requisitions',75),(161,'2022_03_31_142424_add_requisition_qty_on_requisition_items',76),(162,'2022_04_04_102052_attributes',76),(163,'2022_04_04_102100_attribute_options',76),(164,'2022_04_04_102133_product_models',76),(165,'2022_04_04_102542_product_model_attributes',76),(166,'2022_04_04_120513_add_request_status_on_requisition_table',76),(167,'2022_04_05_144549_product_attributes',76),(168,'2022_04_12_111204_supplier_logs',77),(169,'2022_03_22_144734_entries',78),(170,'2022_03_22_144742_entry_items',78),(171,'2022_03_31_104344_companies',78),(172,'2022_03_31_104356_cost_centres',78),(173,'2022_04_02_094525_add_code_to_company',78),(174,'2022_04_02_111918_update_chart_of_accounts',78),(175,'2022_04_02_114536_add_code_to_cost_centres',78),(176,'2022_04_03_115600_add_cost_centre_id_to_entry_items',78),(177,'2022_04_21_150310_add_searchable_to_attribute',79),(179,'2022_01_26_093424_create_notification_table',80),(181,'2022_05_22_173912_create_request_proposal_requisitions_table',81),(182,'2022_05_23_143030_add_po_generate_on_requisition_items_table',82),(183,'2022_05_23_153731_update_payment_terms',83),(185,'2022_05_25_114846_create_requisition_note_logs_table',84),(186,'2022_05_25_100120_add_columns_to_payment_terms',85),(187,'2022_05_25_164253_add_grn_reference_no_on_goods_received_notes_table',85),(188,'2022_05_30_164229_add_hr_unit_id_on_inventory_details_table',86),(189,'2022_05_30_164509_add_hr_unit_id_on_inventory_logs_table',86),(190,'2022_06_02_154814_add_category_id_to_faq_table',87),(191,'2022_06_03_201445_add_attributes_to_categories',87),(192,'2022_06_06_155457_add_cash_status_and_note_on_purchase_order',88),(193,'2022_06_06_173329_purchase_order_requisitions',89),(194,'2022_06_08_151032_add_types_to_categories',90),(195,'2022_06_09_105448_add_word_restrictions_to_roles',90),(196,'2022_06_12_104716_add_new_column_supplier_rattings_table',91),(197,'2022_06_12_144233_add_new_coulumn_on_supplier_table',92),(198,'2022_06_12_150617_add_users_to_products',93),(199,'2022_06_15_130046_supplier_deletable',94),(200,'2022_06_15_173619_purchase_return_gate_outs',95),(201,'2022_06_16_161810_update_purchase_return_gate_out_table',96),(202,'2022_06_20_154243_add_code_to_purchase_return',96),(203,'2022_06_20_154306_add_po_qc_qty_requisition_items',96),(204,'2022_06_21_103950_add_attachments_to_requisition',97),(205,'2022_02_06_163252_create_projects_table',98),(206,'2022_02_14_095428_create_project_menu_table',98),(207,'2022_02_14_101253_create_project_sub_menus_table',98),(208,'2022_02_14_102019_create_project_sub_sub_menus_table',98),(209,'2022_02_15_111137_create_deliverables_table',98),(210,'2022_02_15_111225_create_sub_deliverables_table',98),(211,'2022_02_15_111306_create_project_tasks_table',98),(212,'2022_02_15_120618_create_alignables_table',98),(213,'2022_03_06_111226_create_weekly_statuss_table',98),(214,'2022_03_06_125357_create_week_days_table',98),(215,'2022_03_07_125724_create_holidaies_table',98),(216,'2022_03_20_102220_add_budget_to_projects',98),(217,'2022_03_20_102300_add_budget_to_deliverables',98),(218,'2022_05_24_145456_add_department_id_to_project',98),(219,'2022_06_05_155830_create_project_type_table',98),(220,'2022_07_02_124258_project_objectives',99),(364,'2022_07_02_154532_add_objective_id_to_projects',100),(365,'2022_07_15_175738_add_sponsor_to_project_table',101),(366,'2022_07_15_175752_dependencies',101),(367,'2022_07_15_175840_add_budget_to_sub_deliveries_table',101),(368,'2022_07_15_175849_add_budget_to_tasks_table',101),(369,'2022_07_15_175901_project_goals',101),(370,'2022_07_21_091901_sub_deliverable_users',102),(371,'2022_07_23_111723_project_task_attachments',103),(372,'2022_07_23_153054_pause_resume_project',103),(373,'2022_07_23_153106_close_open_project',103),(374,'2022_07_23_153126_pause_resume_deliverables',103),(375,'2022_07_26_102444_project_boards',104),(376,'2022_07_26_102504_project_goal_achievements',104),(377,'2022_07_28_150556_add_unit_id_on_projects',105),(379,'2022_07_28_152601_project_board_approvals',106),(380,'2022_08_06_131920_add_phases_to_project_type',107),(381,'2022_08_06_131932_project_scopes',107),(382,'2022_08_06_131951_project_objective_rollback',107),(385,'2022_08_08_102740_account_classes',108),(386,'2022_08_08_102757_add_account_class_to_account_group',109),(387,'2022_08_13_212549_add_payment_type_to_supplier_ldgers',110),(388,'2022_08_21_145723_add_gl_to_bank_accounts',111),(389,'2022_08_21_145759_add_gl_to_suppliers',112),(390,'2022_08_21_145816_add_gl_to_products',112),(391,'2022_08_23_145805_add_gl_to_sub_categories',113),(392,'2022_08_25_082041_add_advance_gl_to_suppliers',114),(393,'2022_08_25_151158_account_default_settings',115),(395,'2022_08_27_124041_add_supplier_bank_accounts_id_on_supplier_ledgers',116),(396,'2022_08_28_110712_add_cash_account_to_default_settings',117),(400,'2022_09_07_112730_add_approval_system_to_account_groups',118),(401,'2022_09_07_112742_add_approval_system_to_chart_of_accounts',118),(402,'2022_09_07_112753_add_approval_system_to_bank_accounts',118),(403,'2022_09_07_112803_add_approval_system_to_entries',119),(404,'2022_09_07_122056_purchase_order_entries',120),(405,'2022_09_11_103932_add_supplier_id_to_supplier_ledgers',121),(406,'2022_09_13_094346_add_ledgers_to_default_settings',122),(407,'2022_09_21_100103_add_fixed_assets_options_to_categories',123),(408,'2022_09_21_100150_depreciation_methods',123),(409,'2022_09_21_101638_add_fixed_assets_options_to_products',123),(410,'2022_09_21_120257_add_fixed_assets_accounts_to_default_settings',124),(411,'2022_09_24_083747_fixed_asset_locations',125),(415,'2022_09_25_093206_fixed_asset_batches',126),(416,'2022_09_25_102104_fixed_asset_batch_items',126),(417,'2022_09_25_102126_fixed_asset_batch_item_users',126),(418,'2022_09_25_145104_taken_status_to_items',127),(419,'2022_09_26_122611_fixed_asset_item_physical_statuses',128),(420,'2022_09_27_085058_fixed_asset_movements',129),(421,'2022_09_27_083146_add_new_column_on_cost_center_table',130),(422,'2022_10_02_144535_range_setup_in_account_group',131),(423,'2022_10_04_151314_add_fixed_asset_inventory_ledger_to_default_accounts',132),(424,'2022_10_05_090421_add_depreciation_settings_to_bathes',133),(425,'2022_10_05_110146_fixed_asset_batch_item_depreciations',134),(427,'2022_10_06_105004_add_disposal_options_to_batch_items',135),(428,'2022_10_12_111446_add_grir_to_account_default_settings',136),(429,'2022_10_12_133605_add_types_to_purchase_order_entries',137),(430,'2022_10_16_075923_portfolios',138),(431,'2022_10_16_080045_programs',138),(432,'2022_10_16_080104_add_portfolio_and_program_to_projects',138),(433,'2022_10_16_080230_add_foreign_keys_to_projects',138),(434,'2022_10_16_092916_add_weightage_on_program',139),(435,'2022_10_17_092644_add_weightage_column_on_projects',140),(436,'2022_10_18_093844_program_project_types',141),(439,'2022_10_18_104938_add_category_id_in_fa_locations',142),(440,'2022_10_18_124018_add_unit_id_in_fa_locations',143),(442,'2022_10_19_100938_add_cost_centre_id_to_users',144),(443,'2022_10_19_122015_add_fa_location_to_goods_received_items_stock_in',145),(444,'2022_10_19_150705_project_task_change_requests',146),(445,'2022_10_19_152834_advance_categories',147),(446,'2022_10_20_111043_add_advance_options_to_entries',148),(447,'2022_10_19_125423_add_task_id_on_requisitions',149),(448,'2022_10_23_104400_add_cwip_to_item_master',150),(449,'2022_10_23_150400_add_cwip_account_to_account_default_settings',151),(450,'2022_10_24_082813_add_sub_asset_information_to_products',152),(451,'2022_10_30_085744_add_tolarance_to_projects',153),(452,'2022_10_30_085811_add_sub_task_info_to_project_tasks',153),(453,'2022_10_31_143501_innitial_project_info',154),(455,'2022_11_01_114928_po_closing',155),(456,'2022_11_02_090829_asset_costing_entries',156),(457,'2022_11_02_143216_add_cwip_asset_account_to_default_settings',157),(458,'2022_11_03_083751_add_cwip_to_asset_account_to_product_master',158),(460,'2022_11_15_101920_bank_reconciliation_statements',159),(461,'2022_11_14_092646_add_delivery_date_in_quotations_table',160),(462,'2022_11_22_153419_add_deleted_at_on_product',161),(463,'2022_11_27_121005_currency_types',162),(464,'2022_11_27_121012_currencies',162),(465,'2022_11_27_121022_exchange_rates',162),(466,'2022_11_29_105220_loan_types',163),(467,'2022_11_29_111121_add_bank_interest_account_to_default_settings',164),(468,'2022_11_29_111346_add_default_currency_to_default_settings',165),(469,'2022_11_29_113326_supplier_currencies',166),(470,'2022_11_29_163028_add_exchange_rate_to_quotation',167),(471,'2022_12_01_104543_add_exchange_rate_to_entries',168),(472,'2022_12_01_130931_add_time_to_entries',169),(473,'2022_12_03_124259_add_currency_to_bank_accounts',170),(474,'2022_12_04_122335_add_serial_no_product_attributes_table',171),(475,'2022_12_06_115158_add_currency_to_chart_of_accounts',172),(476,'2022_12_07_094603_add_parent_id_to_supplier_payment_terms',173),(477,'2022_12_07_110909_add_serials_to_categories_table',174),(478,'2022_12_07_125614_category_attributes',175),(479,'2022_12_14_122540_new_table',176),(480,'2022_12_18_153538_user_column_visibilities',177),(481,'2022_12_19_123556_add_approved_by_column_in_requisitions',178),(482,'2022_12_21_131232_loans',179),(483,'2022_12_21_131306_loan_schedules',179),(484,'2022_12_21_131316_loan_schedule_installments',179),(485,'2022_12_21_131343_loan_installment_payments',179),(486,'2022_12_21_150511_loan_logs',179),(487,'2022_12_25_132445_add_module_to_permissions',180),(488,'2022_12_26_152107_user_units',181),(627,'2022_12_26_155412_attributes_code',181),(628,'2022_12_26_155510_supplier_code',181),(629,'2022_12_30_041007_user_priorities',181),(638,'2023_01_01_122543_assign_foreign_keys_to_pmd',182),(655,'2023_01_01_151419_requisition_foreign_keys',183),(656,'2023_01_01_151429_store_foreign_keys',183),(657,'2023_01_01_151832_quotation_foreign_keys',183),(658,'2023_01_01_151841_master_data_foreign_keys',183),(659,'2023_01_01_151905_po_foreign_keys',183),(660,'2023_01_01_151926_accounts_foreign_keys',183),(661,'2023_01_01_151934_settings_foreign_keys',183),(662,'2023_01_02_120351_update_user_priorities',183),(665,'2023_01_08_143207_add_soft_delete_to_pms',184),(667,'2023_01_08_145354_add_soft_deletes_to_pmd',185),(669,'2023_01_08_145411_add_soft_deletes_to_finance',186),(671,'2023_01_25_140419_add_approval_to_quotation_items',187),(672,'2023_01_28_143034_user_unfinished_projects',188),(673,'2023_01_30_115507_project_holidays',189),(674,'2023_01_31_112541_parralal_trigger_in_project',190),(675,'2023_01_31_143054_add_revise_count_column_to_purchase_order',191),(676,'2023_02_05_095602_project_working_days',192),(678,'2023_02_22_092735_add_location_to_fa_users',193),(679,'2023_02_22_100051_add_location_to_fa_movements',194),(680,'2023_02_22_103018_add_location_to_fa_inspections',195),(681,'2023_02_26_095058_add_serial_to_pmd',196),(682,'2023_02_26_145215_cheque_register',197),(685,'2023_03_07_131117_add_cost_centre_to_po',198),(688,'2023_03_22_144908_add_source_to_entry_items',199),(689,'2023_03_27_125115_add_vat_tax_to_default',200),(694,'2023_03_27_151645_cheque_books',201),(695,'2023_03_27_151717_damaged_cheques',201),(696,'2023_04_05_123251_approvers_for_enrtries',202),(697,'2023_04_09_091123_add_ledger_to_cost_centre',203),(698,'2023_04_09_133047_initiate_batch_while__g_r_n',204),(700,'2023_04_15_211912_final_asset',205),(701,'2023_04_16_112013_final_asset_in_asset_code',206),(702,'2023_04_16_154017_add_cost_centre_id_to_batch',207),(703,'2023_04_16_204039_add_asset_value_to_bathc_item',208),(704,'2023_04_18_133725_service_in_item_master',209),(705,'2023_04_27_144729_add_supplier_to_asset_costing',210),(706,'2023_04_27_145956_add_supplier_po_entries',211),(707,'2023_04_29_131334_add_is_manual_to_entries',212),(716,'2023_04_29_132419_add_is_reversed_to_entries',213),(717,'2023_04_30_122154_add_retained_earnings_to_default_settings',213),(718,'2023_04_30_122212_fiscal_year_closings',213),(719,'2023_04_30_123117_fiscal_year_closing_ledgers',213),(720,'2023_05_02_095128_update_fiscal_year_closings',214),(721,'2023_05_02_154529_add_company_to_fiscal_year_closings',215),(722,'2023_05_06_115821_add_clearing_option_to_supplier_payments',216),(723,'2023_05_07_113020_add_exchange_rate_to_supplier_payments',217),(724,'2023_05_07_154648_add_currency_gain_loss_to_accounts_default_settings',218),(725,'2023_05_08_152442_add_carry_account_to_default_settings',219),(727,'2023_05_10_132432_add_bill_number_to_supplier_payments',220),(728,'2023_05_10_150607_cheque_book_page_entries',221),(729,'2023_05_11_094917_add_narration_to_cheque_register',222),(734,'2023_05_25_095432_unrealized_currency_event_settings',223),(735,'2023_05_25_095458_unrealized_currency_events',223),(736,'2023_05_25_095511_unrealized_currency_event_ledgers',223),(737,'2023_06_01_120948_update_menu',224),(738,'2023_06_20_092722_modules',225),(739,'2023_06_01_145300_sales_types',226),(740,'2023_06_01_145400_sales_groups',227),(741,'2023_06_01_145500_sales_areas',228),(742,'2023_06_01_145600_salesmans',228),(743,'2023_06_01_145758_customers',228),(744,'2023_06_01_150148_shippers',228),(745,'2023_06_01_152116_credit_statuses',228),(746,'2023_06_01_152148_customer_ledgers',228),(747,'2023_06_01_152728_sales_kits',228),(748,'2023_06_01_155941_sales_orders',228),(749,'2023_06_01_155949_sales_order_details',228),(750,'2023_06_03_092159_customer_currencies',228),(751,'2023_06_03_092213_customer_sales_types',228),(752,'2023_06_03_092302_customer_sales_areas',228),(753,'2023_06_03_092312_customer_salesmans',228),(754,'2023_06_03_092339_customer_sales_groups',228),(755,'2023_06_03_092349_customer_shippers',228),(756,'2023_07_13_103605_add_columns_to_sales_order',229),(757,'2023_07_13_104442_sales_payment_types',229),(758,'2023_07_13_104608_add_foreign_keys_to_sales_orders',229),(759,'2023_07_18_115544_remove_sales_group_id_from_customer_table',230),(760,'2023_07_20_095424_add_sales_columns_to_default_settings',231),(761,'2023_07_29_094726_update_orders',232),(762,'2023_07_30_095545_update_customer_phone',233),(763,'2023_07_30_115344_add_code_to_order',234),(766,'2023_07_30_131258_sales_order_timelines',235),(769,'2023_07_30_150143_sales_order_deliveries',236),(770,'2023_07_30_150154_sales_order_delivery_details',236),(774,'2023_07_31_095021_sales_order_bills',237),(775,'2023_07_31_095033_sales_order_bill_payments',237),(776,'2023_07_31_095444_sales_order_bill_details',237),(777,'2023_07_31_103201_update_customer_ledgers',238),(778,'2023_08_02_150328_add_columns_to_customer_payments',239),(779,'2023_08_07_125529_add_sales_to_products',240),(780,'2023_08_07_133436_sales_order_entries',241),(781,'2023_08_08_132011_add_code_to_customer_payments',242),(782,'2023_08_22_105006_standard_cost_heads',243),(783,'2023_08_22_105017_product_standard_costs',243),(784,'2023_08_22_131910_update_product_library_with_sales_details',244),(785,'2023_08_31_145534_credit_notes',245),(786,'2023_08_31_145823_credit_note_details',246),(787,'2023_08_31_150946_credit_note_entries',246),(788,'2023_09_18_152240_add_options_to_entry_items',247),(789,'2023_09_19_131858_add_realised_to_entry_items',248),(790,'2023_09_30_124919_clearings',249),(791,'2023_09_30_151757_update_clearings',250),(801,'2023_10_03_144043_sales_kit_standard_costs',251),(802,'2023_10_03_153817_update_sales_kits',251),(803,'2023_10_03_154348_sales_kit_prices',251),(804,'2023_10_04_123118_change_product_to_sales_kits',252),(805,'2023_10_26_114110_add_valid_till_to_order',253),(806,'2023_10_26_115604_add_rfq_number_to_order',254),(807,'2023_12_11_102502_system_information',255),(808,'2024_01_18_100251_requisition_explanations',256),(809,'2024_01_18_100358_add_explanation_to_requisitions',256),(810,'2024_01_18_152141_add_recommendation_to_quotation',257),(815,'2024_01_21_120743_resend_limit',258),(816,'2024_01_21_120755_add_resend_limit_to_requisitions',258),(817,'2024_01_21_120842_requisition_logs',258),(818,'2024_01_21_120852_requisition_item_logs',258),(820,'2024_01_21_150007_unit_matrix',259),(821,'2024_01_22_103840_quotation_technical_specifications',260),(822,'2024_01_22_113844_approved_quantity_to_quotation_items',261),(823,'2024_01_22_154251_add_terms_to_po',262),(824,'2024_01_23_093342_quotation_histories',263),(825,'2024_01_23_093401_quotation_history_items',263),(827,'2024_01_23_112022_unit_round_up',264),(828,'2024_01_23_123255_product_unit_conversions',265),(829,'2024_01_23_154430_add_getout_file_inpurchase_returns_table',266),(830,'2024_01_24_103946_requisition_passing',267),(851,'2024_02_01_113016_banks',269),(852,'2024_02_01_113031_bank_branches',269),(853,'2024_02_01_113040_bank_account_types',269),(854,'2024_02_01_094307_requirements',270),(855,'2024_02_01_094308_entry_points',270),(856,'2024_02_01_094326_sources',270),(857,'2024_02_01_094346_control_points',270),(858,'2024_02_01_094414_integration_processes',270),(859,'2024_02_01_094420_integration_sub_processes',270),(860,'2024_02_01_095026_integration_sub_proces_entry_points',270),(861,'2024_02_01_095047_transactions',270),(862,'2024_02_01_095112_transaction_entries',270),(863,'2024_02_01_095127_transaction_logs',270),(864,'2024_02_01_115607_update_bank_accounts',271),(865,'2024_02_01_155536_entry_point_ledgers',272),(866,'2024_02_05_124132_add_status_at_cheque_book_pages_table',273),(867,'2024_02_06_124641_coa_mapping',274),(868,'2024_02_06_124713_chart_of_account_companies',274),(869,'2024_02_06_124726_chart_of_account_entry_types',274),(870,'2024_02_06_124735_chart_of_account_users',274),(871,'2024_02_06_124811_profit_centres',274),(872,'2024_02_06_124828_schedule_payments',274),(873,'2024_02_06_124835_schedule_payment_ledgers',274),(874,'2024_02_06_125126_add_profit_centre_to_cost_centre',274),(875,'2024_02_06_150111_schedule_payment_entries',275),(876,'2024_02_07_162424_user_companies',276),(877,'2024_02_07_162600_entry_type_companies',276),(878,'2024_02_11_101749_schedules',277),(879,'2024_02_11_101803_schedule_entries',277),(881,'2024_02_11_104500_add_day_to_schedule_payment',278),(883,'2024_02_11_155827_update_schedule_payment_ledgers',279),(884,'2024_02_11_114829_add_payee_name_in_cheque_registers_table',280),(885,'2024_02_11_123733_add_status_in_bank_accounts_table',280),(895,'2024_02_12_102105_fiscal_year_openings',281),(896,'2024_02_12_102117_fiscal_year_opening_users',281),(897,'2024_02_12_102248_fiscal_year_opening_entries',281),(898,'2024_02_27_160515_fiscal_year_opening_closings',282),(899,'2024_02_28_102415_system_currency_updates',283),(904,'2024_03_02_110408_approval_levels',284),(905,'2024_03_02_110552_coa_approval_levels',284),(906,'2024_03_02_110604_entry_approvals',284),(907,'2024_03_02_110749_user_approval_levels',284),(908,'2024_03_02_150454_entry_approval_logs',285),(909,'2024_03_04_103406_entry_approval_users',286),(910,'2024_03_13_115434_add_cost_centre_to_schedule_pay',287),(911,'2024_03_19_115830_update_int_to_double_quantity',288);

/*Table structure for table `model_has_permissions` */

DROP TABLE IF EXISTS `model_has_permissions`;

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `model_has_permissions` */

insert  into `model_has_permissions`(`permission_id`,`model_type`,`model_id`) values (1,'App\\User',1),(2,'App\\User',1),(3,'App\\User',1),(4,'App\\User',1),(5,'App\\User',1),(6,'App\\User',1),(7,'App\\User',1),(8,'App\\User',1),(9,'App\\User',1),(10,'App\\User',1),(11,'App\\User',1),(12,'App\\User',1),(13,'App\\User',1),(14,'App\\User',1),(15,'App\\User',1),(16,'App\\User',1),(17,'App\\User',1),(18,'App\\User',1),(19,'App\\User',1),(20,'App\\User',1),(21,'App\\User',1),(22,'App\\User',1),(23,'App\\User',1),(24,'App\\User',1),(25,'App\\User',1),(26,'App\\User',1),(27,'App\\User',1),(28,'App\\User',1),(29,'App\\User',1),(30,'App\\User',1),(31,'App\\User',1),(32,'App\\User',1),(33,'App\\User',1),(34,'App\\User',1),(35,'App\\User',1),(39,'App\\User',1),(40,'App\\User',1),(41,'App\\User',1),(42,'App\\User',1),(43,'App\\User',1),(44,'App\\User',1),(45,'App\\User',1),(46,'App\\User',1),(47,'App\\User',1),(48,'App\\User',1),(49,'App\\User',1),(50,'App\\User',1),(51,'App\\User',1),(52,'App\\User',1),(54,'App\\User',1),(55,'App\\User',1),(56,'App\\User',1),(57,'App\\User',1),(58,'App\\User',1),(59,'App\\User',1),(60,'App\\User',1),(61,'App\\User',1),(62,'App\\User',1),(63,'App\\User',1),(64,'App\\User',1),(65,'App\\User',1),(66,'App\\User',1),(67,'App\\User',1),(68,'App\\User',1),(69,'App\\User',1),(70,'App\\User',1),(71,'App\\User',1),(72,'App\\User',1),(73,'App\\User',1),(74,'App\\User',1),(75,'App\\User',1),(76,'App\\User',1),(77,'App\\User',1),(78,'App\\User',1),(79,'App\\User',1),(80,'App\\User',1),(81,'App\\User',1),(82,'App\\User',1),(83,'App\\User',1),(84,'App\\User',1),(85,'App\\User',1),(86,'App\\User',1),(87,'App\\User',1),(88,'App\\User',1),(89,'App\\User',1),(90,'App\\User',1),(91,'App\\User',1),(92,'App\\User',1),(93,'App\\User',1),(94,'App\\User',1),(95,'App\\User',1),(96,'App\\User',1),(97,'App\\User',1),(98,'App\\User',1),(104,'App\\User',1),(105,'App\\User',1),(106,'App\\User',1),(107,'App\\User',1),(108,'App\\User',1),(109,'App\\User',1),(110,'App\\User',1),(111,'App\\User',1),(112,'App\\User',1),(113,'App\\User',1),(114,'App\\User',1),(115,'App\\User',1),(116,'App\\User',1),(117,'App\\User',1),(118,'App\\User',1),(119,'App\\User',1),(120,'App\\User',1),(121,'App\\User',1),(122,'App\\User',1),(123,'App\\User',1),(124,'App\\User',1),(125,'App\\User',1),(127,'App\\User',1),(128,'App\\User',1),(129,'App\\User',1),(130,'App\\User',1),(131,'App\\User',1),(132,'App\\User',1),(133,'App\\User',1),(134,'App\\User',1),(135,'App\\User',1),(136,'App\\User',1),(137,'App\\User',1),(138,'App\\User',1),(139,'App\\User',1),(140,'App\\User',1),(141,'App\\User',1),(142,'App\\User',1),(143,'App\\User',1),(144,'App\\User',1),(145,'App\\User',1),(146,'App\\User',1),(147,'App\\User',1),(148,'App\\User',1),(149,'App\\User',1),(150,'App\\User',1),(151,'App\\User',1),(152,'App\\User',1),(153,'App\\User',1),(154,'App\\User',1),(155,'App\\User',1),(156,'App\\User',1),(157,'App\\User',1),(158,'App\\User',1),(159,'App\\User',1),(160,'App\\User',1),(161,'App\\User',1),(162,'App\\User',1),(163,'App\\User',1),(164,'App\\User',1),(165,'App\\User',1),(166,'App\\User',1),(167,'App\\User',1),(168,'App\\User',1),(169,'App\\User',1),(170,'App\\User',1),(171,'App\\User',1),(172,'App\\User',1),(173,'App\\User',1),(174,'App\\User',1),(175,'App\\User',1),(176,'App\\User',1),(178,'App\\User',1),(179,'App\\User',1),(180,'App\\User',1),(181,'App\\User',1),(182,'App\\User',1),(183,'App\\User',1),(184,'App\\User',1),(185,'App\\User',1),(186,'App\\User',1),(187,'App\\User',1),(188,'App\\User',1),(189,'App\\User',1),(190,'App\\User',1),(191,'App\\User',1),(192,'App\\User',1),(193,'App\\User',1),(194,'App\\User',1),(195,'App\\User',1),(196,'App\\User',1),(197,'App\\User',1),(198,'App\\User',1),(199,'App\\User',1),(200,'App\\User',1),(201,'App\\User',1),(202,'App\\User',1),(203,'App\\User',1),(204,'App\\User',1),(205,'App\\User',1),(206,'App\\User',1),(207,'App\\User',1),(208,'App\\User',1),(209,'App\\User',1),(210,'App\\User',1),(211,'App\\User',1),(212,'App\\User',1),(213,'App\\User',1),(214,'App\\User',1),(215,'App\\User',1),(216,'App\\User',1),(217,'App\\User',1),(218,'App\\User',1),(219,'App\\User',1),(220,'App\\User',1),(221,'App\\User',1),(222,'App\\User',1),(223,'App\\User',1),(224,'App\\User',1),(225,'App\\User',1),(226,'App\\User',1),(227,'App\\User',1),(228,'App\\User',1),(229,'App\\User',1),(230,'App\\User',1),(231,'App\\User',1),(232,'App\\User',1),(233,'App\\User',1),(234,'App\\User',1),(235,'App\\User',1),(236,'App\\User',1),(237,'App\\User',1),(238,'App\\User',1),(239,'App\\User',1),(240,'App\\User',1),(241,'App\\User',1),(242,'App\\User',1),(243,'App\\User',1),(244,'App\\User',1),(245,'App\\User',1),(247,'App\\User',1),(248,'App\\User',1),(249,'App\\User',1),(250,'App\\User',1),(251,'App\\User',1),(252,'App\\User',1),(253,'App\\User',1),(254,'App\\User',1),(255,'App\\User',1),(256,'App\\User',1),(257,'App\\User',1),(258,'App\\User',1),(259,'App\\User',1),(260,'App\\User',1),(261,'App\\User',1),(262,'App\\User',1),(263,'App\\User',1),(264,'App\\User',1),(265,'App\\User',1),(266,'App\\User',1),(267,'App\\User',1),(268,'App\\User',1),(269,'App\\User',1),(270,'App\\User',1),(271,'App\\User',1),(272,'App\\User',1),(273,'App\\User',1),(274,'App\\User',1),(275,'App\\User',1),(276,'App\\User',1),(277,'App\\User',1),(278,'App\\User',1),(279,'App\\User',1),(280,'App\\User',1),(281,'App\\User',1),(282,'App\\User',1),(283,'App\\User',1),(284,'App\\User',1),(285,'App\\User',1),(286,'App\\User',1),(287,'App\\User',1),(288,'App\\User',1),(289,'App\\User',1),(290,'App\\User',1),(291,'App\\User',1),(292,'App\\User',1),(293,'App\\User',1),(294,'App\\User',1),(295,'App\\User',1),(296,'App\\User',1),(297,'App\\User',1),(298,'App\\User',1),(299,'App\\User',1),(300,'App\\User',1),(303,'App\\User',1),(304,'App\\User',1),(305,'App\\User',1),(306,'App\\User',1),(307,'App\\User',1),(308,'App\\User',1),(309,'App\\User',1),(310,'App\\User',1),(311,'App\\User',1),(312,'App\\User',1),(313,'App\\User',1),(314,'App\\User',1),(315,'App\\User',1),(316,'App\\User',1),(317,'App\\User',1),(318,'App\\User',1),(319,'App\\User',1),(320,'App\\User',1),(321,'App\\User',1),(322,'App\\User',1),(323,'App\\User',1),(324,'App\\User',1),(325,'App\\User',1),(326,'App\\User',1),(327,'App\\User',1),(328,'App\\User',1),(329,'App\\User',1),(330,'App\\User',1),(331,'App\\User',1),(332,'App\\User',1),(333,'App\\User',1),(334,'App\\User',1),(335,'App\\User',1),(336,'App\\User',1),(337,'App\\User',1),(338,'App\\User',1),(339,'App\\User',1),(340,'App\\User',1),(341,'App\\User',1),(342,'App\\User',1),(343,'App\\User',1),(344,'App\\User',1),(345,'App\\User',1),(346,'App\\User',1),(347,'App\\User',1),(348,'App\\User',1),(349,'App\\User',1),(350,'App\\User',1),(351,'App\\User',1),(352,'App\\User',1),(353,'App\\User',1),(354,'App\\User',1),(355,'App\\User',1),(356,'App\\User',1),(357,'App\\User',1),(358,'App\\User',1),(359,'App\\User',1),(360,'App\\User',1),(361,'App\\User',1),(362,'App\\User',1),(363,'App\\User',1),(364,'App\\User',1),(365,'App\\User',1),(366,'App\\User',1),(367,'App\\User',1),(368,'App\\User',1),(369,'App\\User',1),(370,'App\\User',1),(371,'App\\User',1),(372,'App\\User',1),(373,'App\\User',1),(374,'App\\User',1),(375,'App\\User',1),(376,'App\\User',1),(377,'App\\User',1),(378,'App\\User',1),(379,'App\\User',1),(380,'App\\User',1),(381,'App\\User',1),(382,'App\\User',1),(383,'App\\User',1),(384,'App\\User',1),(385,'App\\User',1),(386,'App\\User',1),(387,'App\\User',1),(388,'App\\User',1),(389,'App\\User',1),(390,'App\\User',1),(391,'App\\User',1),(392,'App\\User',1),(393,'App\\User',1),(394,'App\\User',1),(395,'App\\User',1),(396,'App\\User',1),(397,'App\\User',1),(398,'App\\User',1),(399,'App\\User',1),(400,'App\\User',1),(401,'App\\User',1),(402,'App\\User',1),(403,'App\\User',1),(404,'App\\User',1),(405,'App\\User',1),(406,'App\\User',1),(407,'App\\User',1),(408,'App\\User',1),(409,'App\\User',1),(410,'App\\User',1),(411,'App\\User',1),(412,'App\\User',1),(413,'App\\User',1),(414,'App\\User',1),(415,'App\\User',1),(416,'App\\User',1),(417,'App\\User',1),(418,'App\\User',1),(419,'App\\User',1),(420,'App\\User',1),(421,'App\\User',1),(422,'App\\User',1),(423,'App\\User',1),(424,'App\\User',1),(425,'App\\User',1),(426,'App\\User',1),(427,'App\\User',1),(428,'App\\User',1),(429,'App\\User',1),(430,'App\\User',1),(431,'App\\User',1),(432,'App\\User',1),(433,'App\\User',1),(434,'App\\User',1),(435,'App\\User',1),(436,'App\\User',1),(437,'App\\User',1),(438,'App\\User',1),(439,'App\\User',1),(440,'App\\User',1),(441,'App\\User',1),(442,'App\\User',1),(443,'App\\User',1),(444,'App\\User',1),(445,'App\\User',1),(446,'App\\User',1),(447,'App\\User',1),(448,'App\\User',1),(449,'App\\User',1),(450,'App\\User',1),(451,'App\\User',1),(452,'App\\User',1),(453,'App\\User',1),(454,'App\\User',1),(455,'App\\User',1),(456,'App\\User',1),(457,'App\\User',1),(458,'App\\User',1),(459,'App\\User',1),(460,'App\\User',1),(461,'App\\User',1),(462,'App\\User',1),(463,'App\\User',1),(464,'App\\User',1),(465,'App\\User',1),(466,'App\\User',1),(467,'App\\User',1),(468,'App\\User',1),(469,'App\\User',1),(470,'App\\User',1),(471,'App\\User',1),(472,'App\\User',1),(473,'App\\User',1),(474,'App\\User',1),(475,'App\\User',1),(476,'App\\User',1),(477,'App\\User',1),(478,'App\\User',1),(479,'App\\User',1),(480,'App\\User',1),(481,'App\\User',1),(482,'App\\User',1),(483,'App\\User',1),(484,'App\\User',1),(485,'App\\User',1),(486,'App\\User',1),(487,'App\\User',1),(488,'App\\User',1),(489,'App\\User',1),(490,'App\\User',1),(491,'App\\User',1),(492,'App\\User',1),(493,'App\\User',1),(494,'App\\User',1),(495,'App\\User',1),(496,'App\\User',1),(497,'App\\User',1),(498,'App\\User',1),(499,'App\\User',1),(500,'App\\User',1),(501,'App\\User',1),(502,'App\\User',1),(503,'App\\User',1),(504,'App\\User',1),(505,'App\\User',1),(506,'App\\User',1),(507,'App\\User',1),(508,'App\\User',1),(509,'App\\User',1),(510,'App\\User',1),(511,'App\\User',1),(512,'App\\User',1),(513,'App\\User',1),(514,'App\\User',1),(515,'App\\User',1),(516,'App\\User',1),(517,'App\\User',1),(518,'App\\User',1),(529,'App\\User',1),(530,'App\\User',1),(531,'App\\User',1),(532,'App\\User',1),(533,'App\\User',1),(534,'App\\User',1),(535,'App\\User',1),(536,'App\\User',1),(537,'App\\User',1),(538,'App\\User',1),(27,'App\\User',3),(28,'App\\User',3),(29,'App\\User',3),(30,'App\\User',3),(31,'App\\User',3),(50,'App\\User',3),(51,'App\\User',3),(52,'App\\User',3),(60,'App\\User',3),(66,'App\\User',3),(67,'App\\User',3),(68,'App\\User',3),(69,'App\\User',3),(74,'App\\User',3),(75,'App\\User',3),(77,'App\\User',3),(78,'App\\User',3),(79,'App\\User',3),(80,'App\\User',3),(81,'App\\User',3),(92,'App\\User',3),(93,'App\\User',3),(96,'App\\User',3),(143,'App\\User',3),(153,'App\\User',3),(166,'App\\User',3),(194,'App\\User',3),(211,'App\\User',3),(212,'App\\User',3),(219,'App\\User',3),(221,'App\\User',3),(222,'App\\User',3),(223,'App\\User',3),(224,'App\\User',3),(225,'App\\User',3),(226,'App\\User',3),(227,'App\\User',3),(231,'App\\User',3),(232,'App\\User',3),(233,'App\\User',3),(234,'App\\User',3),(235,'App\\User',3),(236,'App\\User',3),(237,'App\\User',3),(238,'App\\User',3),(390,'App\\User',3),(391,'App\\User',3),(481,'App\\User',3),(482,'App\\User',3),(483,'App\\User',3),(484,'App\\User',3),(485,'App\\User',3),(28,'App\\User',4),(29,'App\\User',4),(30,'App\\User',4),(31,'App\\User',4),(92,'App\\User',4),(93,'App\\User',4),(96,'App\\User',4),(166,'App\\User',4),(221,'App\\User',4),(224,'App\\User',4),(225,'App\\User',4),(226,'App\\User',4),(227,'App\\User',4),(232,'App\\User',4),(235,'App\\User',4),(405,'App\\User',4),(406,'App\\User',4),(407,'App\\User',4),(408,'App\\User',4),(409,'App\\User',4),(410,'App\\User',4),(411,'App\\User',4),(412,'App\\User',4),(413,'App\\User',4),(414,'App\\User',4),(415,'App\\User',4),(416,'App\\User',4),(417,'App\\User',4),(418,'App\\User',4),(419,'App\\User',4),(420,'App\\User',4),(421,'App\\User',4),(422,'App\\User',4),(423,'App\\User',4),(424,'App\\User',4),(425,'App\\User',4),(426,'App\\User',4),(427,'App\\User',4),(428,'App\\User',4),(429,'App\\User',4),(430,'App\\User',4),(431,'App\\User',4),(432,'App\\User',4),(433,'App\\User',4),(434,'App\\User',4),(435,'App\\User',4),(436,'App\\User',4),(437,'App\\User',4),(438,'App\\User',4),(439,'App\\User',4),(440,'App\\User',4),(441,'App\\User',4),(442,'App\\User',4),(443,'App\\User',4),(444,'App\\User',4),(445,'App\\User',4),(446,'App\\User',4),(447,'App\\User',4),(448,'App\\User',4),(449,'App\\User',4),(450,'App\\User',4),(451,'App\\User',4),(452,'App\\User',4),(453,'App\\User',4),(454,'App\\User',4),(455,'App\\User',4),(456,'App\\User',4),(457,'App\\User',4),(458,'App\\User',4),(459,'App\\User',4),(460,'App\\User',4),(461,'App\\User',4),(462,'App\\User',4),(463,'App\\User',4),(464,'App\\User',4),(465,'App\\User',4),(466,'App\\User',4),(467,'App\\User',4),(468,'App\\User',4),(469,'App\\User',4),(470,'App\\User',4),(471,'App\\User',4),(478,'App\\User',4),(479,'App\\User',4),(481,'App\\User',4),(482,'App\\User',4),(483,'App\\User',4),(484,'App\\User',4),(485,'App\\User',4),(28,'App\\User',5),(29,'App\\User',5),(30,'App\\User',5),(31,'App\\User',5),(34,'App\\User',5),(35,'App\\User',5),(39,'App\\User',5),(40,'App\\User',5),(41,'App\\User',5),(42,'App\\User',5),(43,'App\\User',5),(44,'App\\User',5),(45,'App\\User',5),(46,'App\\User',5),(47,'App\\User',5),(54,'App\\User',5),(57,'App\\User',5),(58,'App\\User',5),(74,'App\\User',5),(79,'App\\User',5),(80,'App\\User',5),(81,'App\\User',5),(84,'App\\User',5),(85,'App\\User',5),(86,'App\\User',5),(87,'App\\User',5),(92,'App\\User',5),(93,'App\\User',5),(94,'App\\User',5),(95,'App\\User',5),(104,'App\\User',5),(144,'App\\User',5),(145,'App\\User',5),(146,'App\\User',5),(147,'App\\User',5),(148,'App\\User',5),(149,'App\\User',5),(150,'App\\User',5),(151,'App\\User',5),(154,'App\\User',5),(155,'App\\User',5),(156,'App\\User',5),(157,'App\\User',5),(158,'App\\User',5),(163,'App\\User',5),(165,'App\\User',5),(166,'App\\User',5),(167,'App\\User',5),(169,'App\\User',5),(170,'App\\User',5),(171,'App\\User',5),(172,'App\\User',5),(173,'App\\User',5),(174,'App\\User',5),(176,'App\\User',5),(316,'App\\User',5),(317,'App\\User',5),(318,'App\\User',5),(344,'App\\User',5),(361,'App\\User',5),(362,'App\\User',5),(363,'App\\User',5),(374,'App\\User',5),(375,'App\\User',5),(472,'App\\User',5),(473,'App\\User',5),(481,'App\\User',5),(482,'App\\User',5),(497,'App\\User',5),(22,'App\\User',6),(23,'App\\User',6),(24,'App\\User',6),(25,'App\\User',6),(26,'App\\User',6),(28,'App\\User',6),(29,'App\\User',6),(30,'App\\User',6),(31,'App\\User',6),(33,'App\\User',6),(48,'App\\User',6),(49,'App\\User',6),(60,'App\\User',6),(74,'App\\User',6),(75,'App\\User',6),(77,'App\\User',6),(78,'App\\User',6),(79,'App\\User',6),(80,'App\\User',6),(81,'App\\User',6),(82,'App\\User',6),(91,'App\\User',6),(92,'App\\User',6),(93,'App\\User',6),(98,'App\\User',6),(152,'App\\User',6),(153,'App\\User',6),(166,'App\\User',6),(390,'App\\User',6),(391,'App\\User',6),(481,'App\\User',6),(482,'App\\User',6),(27,'App\\User',7),(28,'App\\User',7),(29,'App\\User',7),(30,'App\\User',7),(31,'App\\User',7),(32,'App\\User',7),(50,'App\\User',7),(51,'App\\User',7),(52,'App\\User',7),(55,'App\\User',7),(56,'App\\User',7),(58,'App\\User',7),(66,'App\\User',7),(70,'App\\User',7),(71,'App\\User',7),(72,'App\\User',7),(73,'App\\User',7),(92,'App\\User',7),(93,'App\\User',7),(104,'App\\User',7),(143,'App\\User',7),(164,'App\\User',7),(165,'App\\User',7),(166,'App\\User',7),(172,'App\\User',7),(173,'App\\User',7),(174,'App\\User',7),(481,'App\\User',7),(482,'App\\User',7),(483,'App\\User',7),(484,'App\\User',7),(485,'App\\User',7),(497,'App\\User',7),(92,'App\\User',8),(96,'App\\User',8),(221,'App\\User',8),(224,'App\\User',8),(225,'App\\User',8),(226,'App\\User',8),(227,'App\\User',8),(232,'App\\User',8),(235,'App\\User',8),(92,'App\\User',19),(96,'App\\User',19),(221,'App\\User',19),(224,'App\\User',19),(225,'App\\User',19),(226,'App\\User',19),(227,'App\\User',19),(232,'App\\User',19),(235,'App\\User',19),(28,'App\\User',21),(29,'App\\User',21),(30,'App\\User',21),(31,'App\\User',21),(59,'App\\User',21),(60,'App\\User',21),(62,'App\\User',21),(65,'App\\User',21),(92,'App\\User',21),(93,'App\\User',21),(166,'App\\User',21),(175,'App\\User',21),(481,'App\\User',21),(482,'App\\User',21),(109,'App\\User',22),(110,'App\\User',22),(111,'App\\User',22),(112,'App\\User',22),(113,'App\\User',22),(114,'App\\User',22),(115,'App\\User',22),(116,'App\\User',22),(117,'App\\User',22),(118,'App\\User',22),(119,'App\\User',22),(120,'App\\User',22),(121,'App\\User',22),(122,'App\\User',22),(123,'App\\User',22),(124,'App\\User',22),(127,'App\\User',22),(128,'App\\User',22),(129,'App\\User',22),(130,'App\\User',22),(131,'App\\User',22),(132,'App\\User',22),(133,'App\\User',22),(134,'App\\User',22),(135,'App\\User',22),(136,'App\\User',22),(137,'App\\User',22),(138,'App\\User',22),(139,'App\\User',22),(140,'App\\User',22),(141,'App\\User',22),(142,'App\\User',22),(166,'App\\User',22),(167,'App\\User',22),(168,'App\\User',22),(239,'App\\User',22),(240,'App\\User',22),(241,'App\\User',22),(242,'App\\User',22),(243,'App\\User',22),(244,'App\\User',22),(245,'App\\User',22),(247,'App\\User',22),(248,'App\\User',22),(249,'App\\User',22),(250,'App\\User',22),(251,'App\\User',22),(252,'App\\User',22),(253,'App\\User',22),(254,'App\\User',22),(255,'App\\User',22),(256,'App\\User',22),(257,'App\\User',22),(258,'App\\User',22),(259,'App\\User',22),(260,'App\\User',22),(261,'App\\User',22),(262,'App\\User',22),(263,'App\\User',22),(264,'App\\User',22),(265,'App\\User',22),(266,'App\\User',22),(267,'App\\User',22),(268,'App\\User',22),(269,'App\\User',22),(270,'App\\User',22),(271,'App\\User',22),(272,'App\\User',22),(273,'App\\User',22),(274,'App\\User',22),(275,'App\\User',22),(276,'App\\User',22),(280,'App\\User',22),(284,'App\\User',22),(288,'App\\User',22),(292,'App\\User',22),(293,'App\\User',22),(294,'App\\User',22),(295,'App\\User',22),(296,'App\\User',22),(297,'App\\User',22),(298,'App\\User',22),(299,'App\\User',22),(300,'App\\User',22),(303,'App\\User',22),(304,'App\\User',22),(305,'App\\User',22),(306,'App\\User',22),(307,'App\\User',22),(308,'App\\User',22),(309,'App\\User',22),(310,'App\\User',22),(311,'App\\User',22),(312,'App\\User',22),(313,'App\\User',22),(314,'App\\User',22),(315,'App\\User',22),(316,'App\\User',22),(317,'App\\User',22),(318,'App\\User',22),(319,'App\\User',22),(320,'App\\User',22),(321,'App\\User',22),(322,'App\\User',22),(323,'App\\User',22),(324,'App\\User',22),(334,'App\\User',22),(335,'App\\User',22),(336,'App\\User',22),(337,'App\\User',22),(341,'App\\User',22),(342,'App\\User',22),(343,'App\\User',22),(344,'App\\User',22),(345,'App\\User',22),(346,'App\\User',22),(347,'App\\User',22),(348,'App\\User',22),(349,'App\\User',22),(350,'App\\User',22),(351,'App\\User',22),(352,'App\\User',22),(353,'App\\User',22),(354,'App\\User',22),(355,'App\\User',22),(356,'App\\User',22),(357,'App\\User',22),(358,'App\\User',22),(359,'App\\User',22),(360,'App\\User',22),(365,'App\\User',22),(376,'App\\User',22),(377,'App\\User',22),(378,'App\\User',22),(381,'App\\User',22),(382,'App\\User',22),(383,'App\\User',22),(384,'App\\User',22),(385,'App\\User',22),(386,'App\\User',22),(387,'App\\User',22),(388,'App\\User',22),(389,'App\\User',22),(392,'App\\User',22),(393,'App\\User',22),(394,'App\\User',22),(395,'App\\User',22),(396,'App\\User',22),(397,'App\\User',22),(398,'App\\User',22),(399,'App\\User',22),(400,'App\\User',22),(401,'App\\User',22),(402,'App\\User',22),(403,'App\\User',22),(404,'App\\User',22),(474,'App\\User',22),(475,'App\\User',22),(476,'App\\User',22),(477,'App\\User',22),(481,'App\\User',22),(484,'App\\User',22),(498,'App\\User',22),(499,'App\\User',22),(500,'App\\User',22),(501,'App\\User',22),(502,'App\\User',22),(503,'App\\User',22),(504,'App\\User',22),(505,'App\\User',22),(506,'App\\User',22),(507,'App\\User',22),(508,'App\\User',22),(509,'App\\User',22),(510,'App\\User',22),(511,'App\\User',22),(512,'App\\User',22),(513,'App\\User',22),(514,'App\\User',22),(515,'App\\User',22),(516,'App\\User',22),(517,'App\\User',22),(518,'App\\User',22),(519,'App\\User',22),(520,'App\\User',22),(521,'App\\User',22),(522,'App\\User',22),(523,'App\\User',22),(524,'App\\User',22),(525,'App\\User',22),(526,'App\\User',22),(527,'App\\User',22),(528,'App\\User',22),(529,'App\\User',22),(530,'App\\User',22),(531,'App\\User',22),(532,'App\\User',22),(533,'App\\User',22),(534,'App\\User',22),(535,'App\\User',22),(536,'App\\User',22),(537,'App\\User',22),(27,'App\\User',24),(28,'App\\User',24),(29,'App\\User',24),(30,'App\\User',24),(31,'App\\User',24),(50,'App\\User',24),(51,'App\\User',24),(52,'App\\User',24),(60,'App\\User',24),(66,'App\\User',24),(67,'App\\User',24),(68,'App\\User',24),(69,'App\\User',24),(74,'App\\User',24),(75,'App\\User',24),(77,'App\\User',24),(78,'App\\User',24),(79,'App\\User',24),(80,'App\\User',24),(81,'App\\User',24),(92,'App\\User',24),(93,'App\\User',24),(96,'App\\User',24),(143,'App\\User',24),(153,'App\\User',24),(166,'App\\User',24),(194,'App\\User',24),(211,'App\\User',24),(212,'App\\User',24),(214,'App\\User',24),(215,'App\\User',24),(216,'App\\User',24),(217,'App\\User',24),(219,'App\\User',24),(220,'App\\User',24),(221,'App\\User',24),(222,'App\\User',24),(223,'App\\User',24),(224,'App\\User',24),(225,'App\\User',24),(226,'App\\User',24),(227,'App\\User',24),(232,'App\\User',24),(233,'App\\User',24),(234,'App\\User',24),(235,'App\\User',24),(236,'App\\User',24),(237,'App\\User',24),(238,'App\\User',24),(338,'App\\User',24),(339,'App\\User',24),(340,'App\\User',24),(28,'App\\User',84),(29,'App\\User',84),(30,'App\\User',84),(31,'App\\User',84),(92,'App\\User',84),(93,'App\\User',84),(109,'App\\User',84),(110,'App\\User',84),(111,'App\\User',84),(112,'App\\User',84),(113,'App\\User',84),(114,'App\\User',84),(115,'App\\User',84),(116,'App\\User',84),(117,'App\\User',84),(118,'App\\User',84),(119,'App\\User',84),(120,'App\\User',84),(121,'App\\User',84),(122,'App\\User',84),(123,'App\\User',84),(124,'App\\User',84),(127,'App\\User',84),(128,'App\\User',84),(129,'App\\User',84),(130,'App\\User',84),(131,'App\\User',84),(132,'App\\User',84),(133,'App\\User',84),(134,'App\\User',84),(135,'App\\User',84),(136,'App\\User',84),(137,'App\\User',84),(138,'App\\User',84),(139,'App\\User',84),(140,'App\\User',84),(141,'App\\User',84),(142,'App\\User',84),(166,'App\\User',84),(239,'App\\User',84),(240,'App\\User',84),(241,'App\\User',84),(242,'App\\User',84),(243,'App\\User',84),(244,'App\\User',84),(245,'App\\User',84),(247,'App\\User',84),(248,'App\\User',84),(249,'App\\User',84),(250,'App\\User',84),(251,'App\\User',84),(252,'App\\User',84),(253,'App\\User',84),(254,'App\\User',84),(255,'App\\User',84),(256,'App\\User',84),(257,'App\\User',84),(258,'App\\User',84),(259,'App\\User',84),(260,'App\\User',84),(261,'App\\User',84),(262,'App\\User',84),(263,'App\\User',84),(264,'App\\User',84),(265,'App\\User',84),(266,'App\\User',84),(267,'App\\User',84),(268,'App\\User',84),(269,'App\\User',84),(270,'App\\User',84),(271,'App\\User',84),(272,'App\\User',84),(273,'App\\User',84),(274,'App\\User',84),(275,'App\\User',84),(276,'App\\User',84),(279,'App\\User',84),(283,'App\\User',84),(287,'App\\User',84),(291,'App\\User',84),(292,'App\\User',84),(293,'App\\User',84),(294,'App\\User',84),(295,'App\\User',84),(296,'App\\User',84),(297,'App\\User',84),(298,'App\\User',84),(299,'App\\User',84),(300,'App\\User',84),(303,'App\\User',84),(304,'App\\User',84),(305,'App\\User',84),(306,'App\\User',84),(307,'App\\User',84),(308,'App\\User',84),(309,'App\\User',84),(310,'App\\User',84),(311,'App\\User',84),(312,'App\\User',84),(313,'App\\User',84),(314,'App\\User',84),(315,'App\\User',84),(316,'App\\User',84),(317,'App\\User',84),(318,'App\\User',84),(319,'App\\User',84),(320,'App\\User',84),(321,'App\\User',84),(322,'App\\User',84),(323,'App\\User',84),(324,'App\\User',84),(334,'App\\User',84),(335,'App\\User',84),(336,'App\\User',84),(337,'App\\User',84),(345,'App\\User',84),(346,'App\\User',84),(359,'App\\User',84),(360,'App\\User',84),(92,'App\\User',85),(96,'App\\User',85),(221,'App\\User',85),(224,'App\\User',85),(225,'App\\User',85),(226,'App\\User',85),(227,'App\\User',85),(232,'App\\User',85),(235,'App\\User',85),(481,'App\\User',85),(483,'App\\User',85),(92,'App\\User',89),(96,'App\\User',89),(221,'App\\User',89),(224,'App\\User',89),(225,'App\\User',89),(226,'App\\User',89),(227,'App\\User',89),(232,'App\\User',89),(235,'App\\User',89),(92,'App\\User',90),(96,'App\\User',90),(221,'App\\User',90),(224,'App\\User',90),(225,'App\\User',90),(226,'App\\User',90),(227,'App\\User',90),(232,'App\\User',90),(235,'App\\User',90),(92,'App\\User',91),(96,'App\\User',91),(221,'App\\User',91),(224,'App\\User',91),(225,'App\\User',91),(226,'App\\User',91),(227,'App\\User',91),(232,'App\\User',91),(235,'App\\User',91),(92,'App\\User',92),(96,'App\\User',92),(221,'App\\User',92),(224,'App\\User',92),(225,'App\\User',92),(226,'App\\User',92),(227,'App\\User',92),(232,'App\\User',92),(235,'App\\User',92),(92,'App\\User',93),(96,'App\\User',93),(221,'App\\User',93),(224,'App\\User',93),(225,'App\\User',93),(226,'App\\User',93),(227,'App\\User',93),(232,'App\\User',93),(235,'App\\User',93),(92,'App\\User',94),(96,'App\\User',94),(221,'App\\User',94),(224,'App\\User',94),(225,'App\\User',94),(226,'App\\User',94),(227,'App\\User',94),(232,'App\\User',94),(235,'App\\User',94),(92,'App\\User',95),(96,'App\\User',95),(125,'App\\User',95),(178,'App\\User',95),(179,'App\\User',95),(180,'App\\User',95),(181,'App\\User',95),(182,'App\\User',95),(183,'App\\User',95),(184,'App\\User',95),(185,'App\\User',95),(186,'App\\User',95),(187,'App\\User',95),(188,'App\\User',95),(189,'App\\User',95),(190,'App\\User',95),(191,'App\\User',95),(192,'App\\User',95),(193,'App\\User',95),(194,'App\\User',95),(195,'App\\User',95),(196,'App\\User',95),(197,'App\\User',95),(198,'App\\User',95),(199,'App\\User',95),(200,'App\\User',95),(201,'App\\User',95),(202,'App\\User',95),(203,'App\\User',95),(204,'App\\User',95),(205,'App\\User',95),(206,'App\\User',95),(207,'App\\User',95),(208,'App\\User',95),(209,'App\\User',95),(210,'App\\User',95),(211,'App\\User',95),(212,'App\\User',95),(213,'App\\User',95),(214,'App\\User',95),(215,'App\\User',95),(216,'App\\User',95),(217,'App\\User',95),(218,'App\\User',95),(219,'App\\User',95),(220,'App\\User',95),(221,'App\\User',95),(222,'App\\User',95),(223,'App\\User',95),(224,'App\\User',95),(225,'App\\User',95),(226,'App\\User',95),(227,'App\\User',95),(228,'App\\User',95),(229,'App\\User',95),(230,'App\\User',95),(231,'App\\User',95),(232,'App\\User',95),(233,'App\\User',95),(234,'App\\User',95),(235,'App\\User',95),(236,'App\\User',95),(237,'App\\User',95),(238,'App\\User',95),(326,'App\\User',95),(327,'App\\User',95),(328,'App\\User',95),(329,'App\\User',95),(330,'App\\User',95),(331,'App\\User',95),(332,'App\\User',95),(333,'App\\User',95),(338,'App\\User',95),(339,'App\\User',95),(340,'App\\User',95),(366,'App\\User',95),(367,'App\\User',95),(368,'App\\User',95),(369,'App\\User',95),(370,'App\\User',95),(371,'App\\User',95),(372,'App\\User',95),(373,'App\\User',95),(481,'App\\User',95),(483,'App\\User',95),(1,'App\\User',190),(2,'App\\User',190),(3,'App\\User',190),(4,'App\\User',190),(5,'App\\User',190),(6,'App\\User',190),(7,'App\\User',190),(8,'App\\User',190),(9,'App\\User',190),(10,'App\\User',190),(11,'App\\User',190),(12,'App\\User',190),(13,'App\\User',190),(14,'App\\User',190),(15,'App\\User',190),(16,'App\\User',190),(17,'App\\User',190),(18,'App\\User',190),(19,'App\\User',190),(20,'App\\User',190),(21,'App\\User',190),(22,'App\\User',190),(23,'App\\User',190),(24,'App\\User',190),(25,'App\\User',190),(26,'App\\User',190),(27,'App\\User',190),(28,'App\\User',190),(29,'App\\User',190),(30,'App\\User',190),(31,'App\\User',190),(32,'App\\User',190),(33,'App\\User',190),(34,'App\\User',190),(35,'App\\User',190),(39,'App\\User',190),(40,'App\\User',190),(41,'App\\User',190),(42,'App\\User',190),(43,'App\\User',190),(44,'App\\User',190),(45,'App\\User',190),(46,'App\\User',190),(47,'App\\User',190),(48,'App\\User',190),(49,'App\\User',190),(50,'App\\User',190),(51,'App\\User',190),(52,'App\\User',190),(54,'App\\User',190),(55,'App\\User',190),(56,'App\\User',190),(57,'App\\User',190),(58,'App\\User',190),(59,'App\\User',190),(60,'App\\User',190),(61,'App\\User',190),(62,'App\\User',190),(63,'App\\User',190),(64,'App\\User',190),(65,'App\\User',190),(66,'App\\User',190),(67,'App\\User',190),(68,'App\\User',190),(69,'App\\User',190),(70,'App\\User',190),(71,'App\\User',190),(72,'App\\User',190),(73,'App\\User',190),(74,'App\\User',190),(75,'App\\User',190),(76,'App\\User',190),(77,'App\\User',190),(78,'App\\User',190),(79,'App\\User',190),(80,'App\\User',190),(81,'App\\User',190),(82,'App\\User',190),(83,'App\\User',190),(84,'App\\User',190),(85,'App\\User',190),(86,'App\\User',190),(87,'App\\User',190),(88,'App\\User',190),(89,'App\\User',190),(90,'App\\User',190),(91,'App\\User',190),(92,'App\\User',190),(93,'App\\User',190),(94,'App\\User',190),(95,'App\\User',190),(96,'App\\User',190),(97,'App\\User',190),(98,'App\\User',190),(104,'App\\User',190),(105,'App\\User',190),(106,'App\\User',190),(107,'App\\User',190),(108,'App\\User',190),(109,'App\\User',190),(110,'App\\User',190),(111,'App\\User',190),(112,'App\\User',190),(113,'App\\User',190),(114,'App\\User',190),(115,'App\\User',190),(116,'App\\User',190),(117,'App\\User',190),(118,'App\\User',190),(119,'App\\User',190),(120,'App\\User',190),(121,'App\\User',190),(122,'App\\User',190),(123,'App\\User',190),(124,'App\\User',190),(125,'App\\User',190),(127,'App\\User',190),(128,'App\\User',190),(129,'App\\User',190),(130,'App\\User',190),(131,'App\\User',190),(132,'App\\User',190),(133,'App\\User',190),(134,'App\\User',190),(135,'App\\User',190),(136,'App\\User',190),(137,'App\\User',190),(138,'App\\User',190),(139,'App\\User',190),(140,'App\\User',190),(141,'App\\User',190),(142,'App\\User',190),(143,'App\\User',190),(144,'App\\User',190),(145,'App\\User',190),(146,'App\\User',190),(147,'App\\User',190),(148,'App\\User',190),(149,'App\\User',190),(150,'App\\User',190),(151,'App\\User',190),(152,'App\\User',190),(153,'App\\User',190),(154,'App\\User',190),(155,'App\\User',190),(156,'App\\User',190),(157,'App\\User',190),(158,'App\\User',190),(159,'App\\User',190),(160,'App\\User',190),(161,'App\\User',190),(162,'App\\User',190),(163,'App\\User',190),(164,'App\\User',190),(165,'App\\User',190),(166,'App\\User',190),(167,'App\\User',190),(168,'App\\User',190),(169,'App\\User',190),(170,'App\\User',190),(171,'App\\User',190),(172,'App\\User',190),(173,'App\\User',190),(174,'App\\User',190),(175,'App\\User',190),(176,'App\\User',190),(178,'App\\User',190),(179,'App\\User',190),(180,'App\\User',190),(181,'App\\User',190),(182,'App\\User',190),(183,'App\\User',190),(184,'App\\User',190),(185,'App\\User',190),(186,'App\\User',190),(187,'App\\User',190),(188,'App\\User',190),(189,'App\\User',190),(190,'App\\User',190),(191,'App\\User',190),(192,'App\\User',190),(193,'App\\User',190),(194,'App\\User',190),(195,'App\\User',190),(196,'App\\User',190),(197,'App\\User',190),(198,'App\\User',190),(199,'App\\User',190),(200,'App\\User',190),(201,'App\\User',190),(202,'App\\User',190),(203,'App\\User',190),(204,'App\\User',190),(205,'App\\User',190),(206,'App\\User',190),(207,'App\\User',190),(208,'App\\User',190),(209,'App\\User',190),(210,'App\\User',190),(211,'App\\User',190),(212,'App\\User',190),(213,'App\\User',190),(214,'App\\User',190),(215,'App\\User',190),(216,'App\\User',190),(217,'App\\User',190),(218,'App\\User',190),(219,'App\\User',190),(220,'App\\User',190),(221,'App\\User',190),(222,'App\\User',190),(223,'App\\User',190),(224,'App\\User',190),(225,'App\\User',190),(226,'App\\User',190),(227,'App\\User',190),(228,'App\\User',190),(229,'App\\User',190),(230,'App\\User',190),(231,'App\\User',190),(232,'App\\User',190),(233,'App\\User',190),(234,'App\\User',190),(235,'App\\User',190),(236,'App\\User',190),(237,'App\\User',190),(238,'App\\User',190),(239,'App\\User',190),(240,'App\\User',190),(241,'App\\User',190),(242,'App\\User',190),(243,'App\\User',190),(244,'App\\User',190),(245,'App\\User',190),(247,'App\\User',190),(248,'App\\User',190),(249,'App\\User',190),(250,'App\\User',190),(251,'App\\User',190),(252,'App\\User',190),(253,'App\\User',190),(254,'App\\User',190),(255,'App\\User',190),(256,'App\\User',190),(257,'App\\User',190),(258,'App\\User',190),(259,'App\\User',190),(260,'App\\User',190),(261,'App\\User',190),(262,'App\\User',190),(263,'App\\User',190),(264,'App\\User',190),(265,'App\\User',190),(266,'App\\User',190),(267,'App\\User',190),(268,'App\\User',190),(269,'App\\User',190),(270,'App\\User',190),(271,'App\\User',190),(272,'App\\User',190),(273,'App\\User',190),(274,'App\\User',190),(275,'App\\User',190),(276,'App\\User',190),(277,'App\\User',190),(278,'App\\User',190),(279,'App\\User',190),(280,'App\\User',190),(281,'App\\User',190),(282,'App\\User',190),(283,'App\\User',190),(284,'App\\User',190),(285,'App\\User',190),(286,'App\\User',190),(287,'App\\User',190),(288,'App\\User',190),(289,'App\\User',190),(290,'App\\User',190),(291,'App\\User',190),(292,'App\\User',190),(293,'App\\User',190),(294,'App\\User',190),(295,'App\\User',190),(296,'App\\User',190),(297,'App\\User',190),(298,'App\\User',190),(299,'App\\User',190),(300,'App\\User',190),(303,'App\\User',190),(304,'App\\User',190),(305,'App\\User',190),(306,'App\\User',190),(307,'App\\User',190),(308,'App\\User',190),(309,'App\\User',190),(310,'App\\User',190),(311,'App\\User',190),(312,'App\\User',190),(313,'App\\User',190),(314,'App\\User',190),(315,'App\\User',190),(316,'App\\User',190),(317,'App\\User',190),(318,'App\\User',190),(319,'App\\User',190),(320,'App\\User',190),(321,'App\\User',190),(322,'App\\User',190),(323,'App\\User',190),(324,'App\\User',190),(325,'App\\User',190),(326,'App\\User',190),(327,'App\\User',190),(328,'App\\User',190),(329,'App\\User',190),(330,'App\\User',190),(331,'App\\User',190),(332,'App\\User',190),(333,'App\\User',190),(334,'App\\User',190),(335,'App\\User',190),(336,'App\\User',190),(337,'App\\User',190),(338,'App\\User',190),(339,'App\\User',190),(340,'App\\User',190),(341,'App\\User',190),(342,'App\\User',190),(343,'App\\User',190),(344,'App\\User',190),(345,'App\\User',190),(346,'App\\User',190),(347,'App\\User',190),(348,'App\\User',190),(349,'App\\User',190),(350,'App\\User',190),(351,'App\\User',190),(352,'App\\User',190),(353,'App\\User',190),(354,'App\\User',190),(355,'App\\User',190),(356,'App\\User',190),(357,'App\\User',190),(358,'App\\User',190),(359,'App\\User',190),(360,'App\\User',190),(361,'App\\User',190),(362,'App\\User',190),(363,'App\\User',190),(364,'App\\User',190),(365,'App\\User',190),(366,'App\\User',190),(367,'App\\User',190),(368,'App\\User',190),(369,'App\\User',190),(370,'App\\User',190),(371,'App\\User',190),(372,'App\\User',190),(373,'App\\User',190),(374,'App\\User',190),(375,'App\\User',190),(376,'App\\User',190),(377,'App\\User',190),(378,'App\\User',190),(379,'App\\User',190),(380,'App\\User',190),(381,'App\\User',190),(382,'App\\User',190),(383,'App\\User',190),(384,'App\\User',190),(385,'App\\User',190),(386,'App\\User',190),(387,'App\\User',190),(388,'App\\User',190),(389,'App\\User',190),(390,'App\\User',190),(391,'App\\User',190),(392,'App\\User',190),(393,'App\\User',190),(394,'App\\User',190),(395,'App\\User',190),(396,'App\\User',190),(397,'App\\User',190),(398,'App\\User',190),(399,'App\\User',190),(400,'App\\User',190),(401,'App\\User',190),(402,'App\\User',190),(403,'App\\User',190),(404,'App\\User',190),(405,'App\\User',190),(406,'App\\User',190),(407,'App\\User',190),(408,'App\\User',190),(409,'App\\User',190),(410,'App\\User',190),(411,'App\\User',190),(412,'App\\User',190),(413,'App\\User',190),(414,'App\\User',190),(415,'App\\User',190),(416,'App\\User',190),(417,'App\\User',190),(418,'App\\User',190),(419,'App\\User',190),(420,'App\\User',190),(421,'App\\User',190),(422,'App\\User',190),(423,'App\\User',190),(424,'App\\User',190),(425,'App\\User',190),(426,'App\\User',190),(427,'App\\User',190),(428,'App\\User',190),(429,'App\\User',190),(430,'App\\User',190),(431,'App\\User',190),(432,'App\\User',190),(433,'App\\User',190),(434,'App\\User',190),(435,'App\\User',190),(436,'App\\User',190),(437,'App\\User',190),(438,'App\\User',190),(439,'App\\User',190),(440,'App\\User',190),(441,'App\\User',190),(442,'App\\User',190),(443,'App\\User',190),(444,'App\\User',190),(445,'App\\User',190),(446,'App\\User',190),(447,'App\\User',190),(448,'App\\User',190),(449,'App\\User',190),(450,'App\\User',190),(451,'App\\User',190),(452,'App\\User',190),(453,'App\\User',190),(454,'App\\User',190),(455,'App\\User',190),(456,'App\\User',190),(457,'App\\User',190),(458,'App\\User',190),(459,'App\\User',190),(460,'App\\User',190),(461,'App\\User',190),(462,'App\\User',190),(463,'App\\User',190),(464,'App\\User',190),(465,'App\\User',190),(466,'App\\User',190),(467,'App\\User',190),(468,'App\\User',190),(469,'App\\User',190),(470,'App\\User',190),(471,'App\\User',190),(472,'App\\User',190),(473,'App\\User',190),(474,'App\\User',190),(475,'App\\User',190),(476,'App\\User',190),(477,'App\\User',190),(478,'App\\User',190),(479,'App\\User',190),(480,'App\\User',190),(481,'App\\User',190),(482,'App\\User',190),(483,'App\\User',190),(484,'App\\User',190),(485,'App\\User',190),(486,'App\\User',190),(487,'App\\User',190),(488,'App\\User',190),(489,'App\\User',190),(490,'App\\User',190),(491,'App\\User',190),(492,'App\\User',190),(493,'App\\User',190),(494,'App\\User',190),(495,'App\\User',190),(496,'App\\User',190),(497,'App\\User',190),(498,'App\\User',190),(499,'App\\User',190),(500,'App\\User',190),(501,'App\\User',190),(502,'App\\User',190),(503,'App\\User',190),(504,'App\\User',190),(505,'App\\User',190),(506,'App\\User',190),(507,'App\\User',190),(508,'App\\User',190),(509,'App\\User',190),(510,'App\\User',190),(511,'App\\User',190),(512,'App\\User',190),(513,'App\\User',190),(514,'App\\User',190),(515,'App\\User',190),(516,'App\\User',190),(517,'App\\User',190),(518,'App\\User',190),(529,'App\\User',190),(530,'App\\User',190),(531,'App\\User',190),(532,'App\\User',190),(533,'App\\User',190),(534,'App\\User',190),(535,'App\\User',190),(536,'App\\User',190),(537,'App\\User',190),(538,'App\\User',190);

/*Table structure for table `model_has_roles` */

DROP TABLE IF EXISTS `model_has_roles`;

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `model_has_roles` */

insert  into `model_has_roles`(`role_id`,`model_type`,`model_id`) values (1,'App\\User',1),(24,'App\\User',1),(3,'App\\User',3),(20,'App\\User',3),(4,'App\\User',4),(18,'App\\User',4),(24,'App\\User',4),(5,'App\\User',5),(11,'App\\User',6),(7,'App\\User',7),(4,'App\\User',8),(7,'App\\User',10),(4,'App\\User',11),(6,'App\\User',12),(6,'App\\User',13),(5,'App\\User',14),(5,'App\\User',15),(3,'App\\User',16),(3,'App\\User',17),(8,'App\\User',18),(9,'App\\User',19),(10,'App\\User',20),(12,'App\\User',21),(13,'App\\User',22),(4,'App\\User',23),(3,'App\\User',24),(20,'App\\User',24),(11,'App\\User',34),(3,'App\\User',35),(20,'App\\User',35),(4,'App\\User',36),(12,'App\\User',37),(5,'App\\User',38),(4,'App\\User',39),(3,'App\\User',40),(20,'App\\User',40),(4,'App\\User',41),(3,'App\\User',42),(20,'App\\User',42),(4,'App\\User',43),(7,'App\\User',44),(4,'App\\User',45),(5,'App\\User',47),(4,'App\\User',48),(3,'App\\User',49),(20,'App\\User',49),(4,'App\\User',50),(3,'App\\User',51),(20,'App\\User',51),(4,'App\\User',52),(3,'App\\User',53),(20,'App\\User',53),(4,'App\\User',54),(3,'App\\User',55),(5,'App\\User',57),(4,'App\\User',58),(3,'App\\User',59),(4,'App\\User',60),(3,'App\\User',61),(4,'App\\User',62),(3,'App\\User',63),(4,'App\\User',64),(11,'App\\User',65),(4,'App\\User',66),(12,'App\\User',70),(8,'App\\User',71),(14,'App\\User',72),(3,'App\\User',73),(4,'App\\User',75),(15,'App\\User',76),(15,'App\\User',77),(15,'App\\User',78),(19,'App\\User',79),(16,'App\\User',80),(17,'App\\User',81),(4,'App\\User',82),(21,'App\\User',82),(4,'App\\User',83),(22,'App\\User',83),(4,'App\\User',84),(23,'App\\User',84),(17,'App\\User',96),(1,'App\\User',132),(1,'App\\User',133),(1,'App\\User',134),(13,'App\\User',135),(1,'App\\User',136),(13,'App\\User',137),(13,'App\\User',138),(13,'App\\User',139),(13,'App\\User',140),(13,'App\\User',141),(13,'App\\User',142),(13,'App\\User',143),(13,'App\\User',144),(1,'App\\User',145),(13,'App\\User',146),(13,'App\\User',147),(13,'App\\User',148),(13,'App\\User',149),(5,'App\\User',150),(5,'App\\User',151),(5,'App\\User',152),(1,'App\\User',153),(1,'App\\User',154),(1,'App\\User',155),(1,'App\\User',156),(1,'App\\User',157),(1,'App\\User',158),(1,'App\\User',159),(1,'App\\User',160),(1,'App\\User',162),(1,'App\\User',163),(1,'App\\User',164),(13,'App\\User',165),(1,'App\\User',166),(13,'App\\User',167),(13,'App\\User',168),(13,'App\\User',169),(13,'App\\User',170),(13,'App\\User',171),(13,'App\\User',172),(13,'App\\User',173),(13,'App\\User',174),(1,'App\\User',175),(13,'App\\User',176),(13,'App\\User',177),(13,'App\\User',178),(13,'App\\User',179),(5,'App\\User',180),(5,'App\\User',181),(5,'App\\User',182),(1,'App\\User',183),(1,'App\\User',184),(1,'App\\User',185),(1,'App\\User',186),(1,'App\\User',187),(1,'App\\User',188),(1,'App\\User',189),(1,'App\\User',190);

/*Table structure for table `modules` */

DROP TABLE IF EXISTS `modules`;

CREATE TABLE `modules` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `dashboard` text COLLATE utf8mb4_unicode_ci,
  `icon` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `modules` */

insert  into `modules`(`id`,`slug`,`name`,`url`,`dashboard`,`icon`,`description`,`created_at`,`updated_at`) values (1,'main','Main','http://sslz-main.test','http://sslz-main.test','las la-home','BizzPack Main',NULL,'2024-01-17 10:14:46'),(2,'pms','PMS','http://sslz-pms.test','http://sslz-pms.test','las la-shopping-bag','BizzPack Procurement',NULL,'2024-01-17 10:15:24'),(3,'finance','Finance','http://sslz-finance.test','http://sslz-finance.test/accounting','las la-coins','BizzPack Finance',NULL,'2024-01-17 10:15:33');

/*Table structure for table `notifications` */

DROP TABLE IF EXISTS `notifications`;

CREATE TABLE `notifications` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `requisition_item_id` bigint(20) unsigned NOT NULL,
  `messages` text COLLATE utf8mb4_unicode_ci,
  `type` enum('unread','read') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `status` enum('requisition','send-to-department-head','send-to-store','sent-to-purchase','send-to-manager','send-to-gate-manager','send-to-quality-manager','send-to-billing','send-to-audit','send-to-accounts','send-to-sponsor') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_user_id_foreign` (`user_id`),
  CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `notifications` */

insert  into `notifications`(`id`,`user_id`,`requisition_item_id`,`messages`,`type`,`status`,`read_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) values (36,3,0,'<span class=\"notification-links\" data-src=\"http://sslz-pms.test/pms/requisition/list-view-show/2\" data-title=\"Requisition Details\">Reference No:RQ-24-SSL-000001. Watting for approval.</span>','unread','send-to-department-head',NULL,'4',NULL,'2024-03-19 12:13:35','2024-03-19 12:13:35'),(37,6,0,'<span class=\"notification-links\" data-src=\"http://sslz-pms.test/pms/store-manage/store-inventory-compare/2\" data-title=\"Requisition Details\">Reference No:RQ-24-SSL-000001.Watting for Procurement/Delivery.</span>','unread','send-to-store',NULL,'3',NULL,'2024-03-19 12:23:46','2024-03-19 12:23:46'),(38,5,0,'<span class=\"notification-links\" data-src=\"http://sslz-pms.test/pms/store-manage/store-inventory-compare/2\" data-title=\"Requisition Details\">Reference No:RQ-24-SSL-000001.Watting for Procurement/Purchase.</span>','unread','sent-to-purchase',NULL,'6',NULL,'2024-03-19 12:27:52','2024-03-19 12:27:52'),(39,7,0,'<span class=\"notification-links\" data-src=\"http://sslz-pms.test/pms/quotation/cs-compare-view-notification/2\" data-title=\"Quotation CS\">Reference No:QG-24-SSL-00001. Watting for Management Approval.</span>','unread','send-to-manager',NULL,'5',NULL,'2024-03-19 12:28:58','2024-03-19 12:28:58'),(40,5,0,'<span class=\"notification-links\" data-src=\"http://sslz-pms.test/pms/quotation/cs-compare-view-notification/2\" data-title=\"Quotation CS\">References (QG-24-SSL-00001, QG-24-SSL-00001) Approved By Management.</span>','unread','sent-to-purchase',NULL,'7',NULL,'2024-03-19 12:29:19','2024-03-19 12:29:19'),(41,22,0,'<span class=\"notification-links\"  data-title=\"Purchase Order Details\">Reference No:PO-24-SSL-000001. A PO has been submitted with an advance amount of TK 21</span>','unread','send-to-accounts',NULL,'5',NULL,'2024-03-19 12:29:51','2024-03-19 12:29:51'),(42,4,0,'<span class=\"notification-links\"  data-title=\"Purchase Order Details\">PO Reference No #PO-24-SSL-000001. A PO has been Issued against your requisition #RQ-24-SSL-000001</span>','unread','requisition',NULL,'5',NULL,'2024-03-19 12:29:51','2024-03-19 12:29:51'),(43,6,0,'<span class=\"notification-links\" data-src=\"http://sslz-pms.test/pms/grn/grn-process/2?view\" data-title=\"Gate-In Details\">Reference No:GATE-IN-24-SSL-00001. Waiting for the Quality Ensure.</span>','unread','send-to-store',NULL,'21',NULL,'2024-03-19 12:30:21','2024-03-19 12:30:21'),(44,6,0,'<span class=\"notification-links\" data-src=\"http://sslz-pms.test/pms/grn/grn-process/2?view\" data-title=\"Gate-In Details\">Reference No:GATE-IN-24-SSL-00001. Waiting for the GRN.</span>','unread','send-to-store',NULL,'6',NULL,'2024-03-19 12:30:52','2024-03-19 12:30:52'),(45,5,0,'<span class=\"notification-links\" data-src=\"http://sslz-pms.test/pms/grn/grn-process/2?view\" data-title=\"Gate-In Details\">Reference No:GATE-IN-24-SSL-00001. Waiting for the GRN.</span>','unread','sent-to-purchase',NULL,'6',NULL,'2024-03-19 12:30:52','2024-03-19 12:30:52'),(46,6,0,'<span class=\"notification-links\" data-src=\"http://sslz-pms.test/pms/grn/grn-process/2?view\" data-title=\"Gate-In Details\">Reference No:GATE-IN-24-SSL-00001. Waiting for the GRN.</span>','unread','send-to-store',NULL,'6',NULL,'2024-03-19 12:30:55','2024-03-19 12:30:55'),(47,5,0,'<span class=\"notification-links\" data-src=\"http://sslz-pms.test/pms/grn/grn-process/2?view\" data-title=\"Gate-In Details\">Reference No:GATE-IN-24-SSL-00001. Waiting for the GRN.</span>','unread','sent-to-purchase',NULL,'6',NULL,'2024-03-19 12:30:55','2024-03-19 12:30:55'),(48,5,0,'<span class=\"notification-links\" data-src=\"http://sslz-pms.test/pms/purchase/order-list/2/show?view\" data-title=\"Purchase Order Details\">Reference No:PO-24-SSL-000001. Waiting for the Billing.</span>','unread','send-to-billing',NULL,'6',NULL,'2024-03-19 12:31:13','2024-03-19 12:31:13'),(49,4,3,'<span class=\"notification-links\" data-src=\"http://sslz-pms.test/pms/requisition/list-view-show/2?view\" data-title=\"Requisition Details\">Reference No:RQ-24-SSL-000001 And Item Name: Pen. Successfully delivered your product.Please acknowledge it</span>','unread',NULL,NULL,'6',NULL,'2024-03-19 12:32:08','2024-03-19 12:32:08'),(50,4,3,'<span class=\"notification-links\" data-src=\"http://sslz-pms.test/pms/requisition/list-view-show/2?view\" data-title=\"Requisition Details\">Reference No:RQ-24-SSL-000001 And Item Name: Pen. Successfully delivered your product.Please acknowledge it</span>','unread',NULL,NULL,'6',NULL,'2024-03-19 12:32:47','2024-03-19 12:32:47'),(51,4,3,'<span class=\"notification-links\" data-src=\"http://sslz-pms.test/pms/requisition/list-view-show/2?view\" data-title=\"Requisition Details\">Reference No:RQ-24-SSL-000001 And Item Name: Pen. Successfully delivered your product.Please acknowledge it</span>','unread',NULL,NULL,'6',NULL,'2024-03-19 12:34:19','2024-03-19 12:34:19');

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `payment_terms` */

DROP TABLE IF EXISTS `payment_terms`;

CREATE TABLE `payment_terms` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `percentage` double NOT NULL DEFAULT '0',
  `days` int(32) NOT NULL DEFAULT '0',
  `type` enum('paid','due') COLLATE utf8mb4_unicode_ci DEFAULT 'paid',
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci DEFAULT 'Active',
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_terms_created_by_foreign` (`created_by`),
  KEY `payment_terms_updated_by_foreign` (`updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `payment_terms` */

insert  into `payment_terms`(`id`,`term`,`percentage`,`days`,`type`,`remarks`,`status`,`created_by`,`updated_by`,`deleted_at`,`created_at`,`updated_at`) values (1,'Advance Payment',100,30,'paid','N/A','Active',1,1,NULL,'2022-01-11 11:35:44','2022-05-27 13:04:29'),(2,'Cash Purchase',100,20,'paid','N/A','Active',1,1,NULL,'2022-01-11 11:36:03','2022-05-27 13:04:37'),(3,'Cash on Delivery',100,0,'paid','N/A','Active',1,1,NULL,'2022-01-11 11:36:17','2022-05-25 14:05:02'),(4,'Full Credit',100,0,'paid',NULL,'Active',1,1,NULL,'2022-05-19 17:30:09','2022-05-25 14:05:13'),(5,'Full Credit with PDC',100,0,'paid',NULL,'Active',1,1,NULL,'2022-05-19 17:31:11','2022-05-25 14:05:26'),(6,'Partial Cash & Partial Credit',100,0,'paid',NULL,'Active',1,1,NULL,'2022-05-19 17:32:09','2022-05-25 14:05:34');

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
) ENGINE=InnoDB AUTO_INCREMENT=539 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `permissions` */

insert  into `permissions`(`id`,`name`,`guard_name`,`module`,`created_at`,`updated_at`) values (1,'general-permission','web','ACL','2021-12-23 11:21:47','2021-12-23 11:21:47'),(2,'user-list','web','ACL','2021-12-23 11:51:50','2021-12-23 12:52:28'),(3,'user-create','web','ACL','2021-12-23 12:53:01','2021-12-23 12:53:01'),(4,'user-edit','web','ACL','2021-12-23 12:53:09','2021-12-23 12:53:09'),(5,'user-delete','web','ACL','2021-12-23 12:53:16','2022-12-25 11:56:15'),(6,'menu-list','web','ACL','2021-12-23 12:53:40','2021-12-23 12:53:40'),(7,'menu-create','web','ACL','2021-12-23 12:53:50','2021-12-23 12:53:50'),(8,'menu-edit','web','ACL','2021-12-23 12:53:57','2021-12-23 12:53:57'),(9,'menu-delete','web','ACL','2021-12-23 12:54:04','2021-12-23 12:54:04'),(10,'sub-menu-list','web','ACL','2021-12-23 12:54:23','2021-12-23 12:54:23'),(11,'sub-menu-create','web','ACL','2021-12-23 12:54:31','2021-12-23 12:54:31'),(12,'sub-menu-edit','web','ACL','2021-12-23 12:54:37','2021-12-23 12:54:37'),(13,'sub-menu-delete','web','ACL','2021-12-23 12:54:44','2021-12-23 12:54:44'),(14,'role-list','web','ACL','2021-12-23 12:54:59','2021-12-23 12:54:59'),(15,'role-create','web','ACL','2021-12-23 12:55:06','2021-12-23 12:55:06'),(16,'role-edit','web','ACL','2021-12-23 12:55:13','2021-12-23 12:55:13'),(17,'role-delete','web','ACL','2021-12-23 12:55:25','2021-12-23 12:55:25'),(18,'permission-list','web','ACL','2021-12-23 12:55:40','2021-12-23 12:55:40'),(19,'permission-create','web','ACL','2021-12-23 12:55:52','2021-12-23 12:55:52'),(20,'permission-edit','web','ACL','2021-12-23 12:55:59','2021-12-23 12:55:59'),(21,'permission-delete','web','ACL','2021-12-23 12:56:06','2021-12-23 12:56:06'),(22,'inventory-summary-list','web','Inventory','2021-12-23 12:56:27','2021-12-28 11:46:09'),(23,'inventory-summary-create','web','Inventory','2021-12-23 12:56:32','2021-12-28 11:45:57'),(24,'inventory-summary-edit','web','Inventory','2021-12-23 12:56:42','2021-12-28 11:45:40'),(25,'inventory-summary-delete','web','Inventory','2021-12-23 12:56:50','2021-12-28 11:45:29'),(26,'store-requisition','web','Requisition','2021-12-23 12:59:27','2021-12-23 12:59:27'),(27,'requisition-list-view','web','Requisition','2021-12-24 11:26:35','2021-12-24 11:26:35'),(28,'requisition-list','web','Requisition','2021-12-24 11:28:07','2021-12-24 11:28:07'),(29,'requisition-create','web','Requisition','2021-12-24 11:28:18','2021-12-24 11:28:18'),(30,'requisition-edit','web','Requisition','2021-12-24 11:28:27','2021-12-24 11:28:27'),(31,'requisition-delete','web','Requisition','2021-12-24 11:28:36','2021-12-24 11:28:36'),(32,'quotations-approval-list','web','Quotation','2021-12-24 16:45:37','2021-12-24 16:45:37'),(33,'inventory-logs','web','Inventory','2021-12-26 12:21:12','2021-12-26 12:21:12'),(34,'rfp-requisitions-list','web','RFP','2021-12-27 11:17:37','2021-12-27 11:17:37'),(35,'rfp-create','web','RFP','2021-12-27 11:18:30','2021-12-27 11:18:30'),(39,'rfp-edit','web','RFP','2021-12-27 11:26:48',NULL),(40,'rfp-delete','web','RFP','2021-12-27 11:27:31',NULL),(41,'rfp-list','web','RFP','2021-12-27 11:27:34',NULL),(42,'quotations-list','web','Quotation','2021-12-27 11:32:11',NULL),(43,'quotations-create','web','Quotation','2021-12-27 11:32:13',NULL),(44,'quotations-edit','web','Quotation','2021-12-27 11:32:30',NULL),(45,'quotations-delete','web','Quotation','2021-12-27 11:32:51',NULL),(46,'cs-analysis','web','Finance Reprots','2021-12-27 11:36:17','2021-12-27 11:36:17'),(47,'quotation-index','web','Quotation','2021-12-27 11:39:08','2021-12-27 11:39:08'),(48,'confirm-delivery','web','Inventory','2021-12-27 14:49:34','2021-12-27 14:49:34'),(49,'send-to-rfp','web','RFP','2021-12-27 14:52:13','2021-12-27 14:52:13'),(50,'pending','web','Requisition','2021-12-27 14:58:43','2021-12-27 14:58:43'),(51,'halt','web','Requisition','2021-12-27 14:58:43','2021-12-27 14:58:43'),(52,'requisition-acknowledge','web','Requisition','2021-12-27 14:58:43','2021-12-27 14:58:43'),(54,'po-list','web','PO','2021-12-28 13:42:20','2021-12-28 13:42:20'),(55,'quotation-approved','web','Quotation','2021-12-29 18:47:53','2021-12-29 18:47:53'),(56,'quotation-halt','web','Requisition','2021-12-29 18:47:53','2021-12-29 18:47:53'),(57,'generate-po','web','PO','2021-12-29 18:47:53','2021-12-29 18:47:53'),(58,'generate-po-list','web','PO','2021-12-30 18:18:20','2021-12-30 18:18:20'),(59,'grn-po-list','web','GRN','2022-01-03 12:45:14','2022-01-03 12:45:14'),(60,'grn-list','web','GRN','2022-01-03 12:45:15','2022-01-03 12:45:15'),(61,'grn-generate','web','GRN','2022-01-03 12:45:15','2022-01-03 12:45:15'),(62,'grn-add','web','GRN','2022-01-03 12:45:15','2022-01-03 12:45:15'),(63,'grn-edit','web','GRN','2022-01-03 12:45:15','2022-01-03 12:45:15'),(64,'grn-delete','web','GRN','2022-01-03 12:45:15','2022-01-03 12:45:15'),(65,'grn-search','web','GRN','2022-01-03 12:45:15','2022-01-03 12:45:15'),(66,'range-setup','web','Setup','2022-01-11 01:30:50','2022-01-11 01:30:50'),(67,'range-setup-create','web','Setup','2022-01-11 01:34:55','2022-01-11 01:34:55'),(68,'range-setup-edit','web','Setup','2022-01-11 01:34:55','2022-01-11 01:34:55'),(69,'range-setup-delete','web','Setup','2022-01-11 01:34:55','2022-01-11 01:34:55'),(70,'payment-terms-list','web','Setup','2022-01-11 01:34:55','2022-01-11 01:34:55'),(71,'payment-terms-create','web','Setup','2022-01-11 01:34:55','2022-01-11 01:34:55'),(72,'payment-terms-edit','web','Setup','2022-01-11 01:34:55','2022-01-11 01:34:55'),(73,'payment-terms-delete','web','Setup','2022-01-11 01:34:55','2022-01-11 01:34:55'),(74,'quality-ensure','web','Quality Ensure','2022-01-11 13:58:02','2022-01-11 13:58:02'),(75,'quality-ensure-approved','web','Quality Ensure','2022-01-11 13:58:03','2022-01-11 13:58:03'),(76,'po-wise-grn-list','web','GRN','2022-01-14 14:53:34','2022-01-14 14:53:34'),(77,'quality-ensure-return','web','Quality Ensure','2022-01-18 16:57:06','2022-01-18 16:57:06'),(78,'quality-ensure-return-change','web','Quality Ensure','2022-01-18 16:57:06','2022-01-18 16:57:06'),(79,'quality-ensure-return-list','web','Quality Ensure','2022-01-18 16:57:06','2022-01-18 17:46:46'),(80,'quality-ensure-return-change-list','web','Quality Ensure','2022-01-18 16:57:06','2022-01-18 16:57:06'),(81,'quality-ensure-approval-list','web','Quality Ensure','2022-01-18 16:57:06','2022-01-18 16:57:06'),(82,'delivered-requisition','web','Requisition','2022-01-21 12:20:47','2022-01-21 17:39:58'),(83,'product-unit-list','web','Product','2022-01-24 12:30:50','2022-01-24 16:17:37'),(84,'product-list','web','Product','2022-01-24 12:39:59','2022-01-24 12:39:59'),(85,'product-add','web','Product','2022-01-24 12:39:59','2022-01-24 12:39:59'),(86,'product-edit','web','Product','2022-01-24 12:39:59','2022-01-24 12:39:59'),(87,'product-delete','web','Product','2022-01-24 12:39:59','2022-01-24 12:39:59'),(88,'product-unit-create','web','Product','2022-01-24 12:43:14','2022-01-24 16:17:04'),(89,'product-unit-edit','web','Product','2022-01-24 12:43:14','2022-01-24 16:17:15'),(90,'product-unit-delete','web','Product','2022-01-24 12:43:14','2022-01-24 16:17:22'),(91,'store-rfp-requistion-list','web','Requistion','2022-01-26 18:25:57','2022-01-26 18:25:57'),(92,'notification-list','web','Setup','2022-01-27 19:09:52','2022-01-27 19:09:52'),(93,'requisition-delivered-list','web','Requisition','2022-01-28 18:04:56','2022-01-28 18:08:10'),(94,'upload-po-attachment','web','PO','2022-02-06 12:05:16','2022-02-06 12:05:16'),(95,'billing-wise-po-attachment-list','web','PO','2022-02-06 12:10:33','2022-02-06 12:10:33'),(96,'project-manage','web','PMD','2022-02-15 18:01:36','2022-02-15 18:01:36'),(97,'store-deliverd-requistion-list','web','Requistion','2022-02-16 14:06:44','2022-02-16 14:06:44'),(98,'grn-stock-in-list','web','GRN','2022-02-21 11:21:05','2022-02-21 11:21:05'),(104,'supplier-list','web','Supplier','2022-02-21 11:23:54','2022-02-21 11:23:54'),(105,'faq-list','web','Setup','2022-02-21 17:47:33','2022-02-21 17:47:33'),(106,'faq-create','web','Setup','2022-02-21 17:47:33','2022-02-21 17:47:33'),(107,'faq-edit','web','Setup','2022-02-21 17:47:33','2022-02-21 17:47:33'),(108,'faq-delete','web','Setup','2022-02-21 17:47:33','2022-02-21 17:47:33'),(109,'accounts-list','web','Finance','2022-03-01 12:56:19','2022-03-01 12:56:19'),(110,'accounts-create','web','Finance','2022-03-01 12:56:19','2022-03-01 12:56:19'),(111,'accounts-edit','web','Finance','2022-03-01 12:56:19','2022-03-01 12:56:19'),(112,'accounts-delete','web','Finance','2022-03-01 12:56:19','2022-03-01 12:56:19'),(113,'supplier-ledger-list','web','Supplier','2022-03-01 13:00:07','2022-03-01 13:00:15'),(114,'supplier-ledger-create','web','Supplier','2022-03-01 13:00:07','2022-03-01 13:00:07'),(115,'supplier-ledger-edit','web','Supplier','2022-03-01 13:00:07','2022-03-01 13:00:07'),(116,'supplier-ledger-delete','web','Supplier','2022-03-01 13:00:07','2022-03-01 13:00:07'),(117,'accounts-po-attachment-list','web','Finance','2022-03-03 18:27:00','2022-03-03 18:27:00'),(118,'chart-of-accounts','web','Finance','2022-03-17 11:16:24','2022-03-17 11:16:24'),(119,'chart-of-accounts-create','web','Finance','2022-03-17 11:16:25','2022-03-17 12:29:27'),(120,'chart-of-accounts-edit','web','Finance','2022-03-17 11:16:25','2022-03-17 11:16:25'),(121,'chart-of-accounts-delete','web','Finance','2022-03-17 11:16:25','2022-03-17 11:16:25'),(122,'account-groups-create','web','Finance','2022-03-17 12:29:13','2022-03-17 13:46:15'),(123,'account-groups-edit','web','Finance','2022-03-17 12:29:13','2022-03-17 13:46:05'),(124,'account-groups-delete','web','Finance','2022-03-17 12:29:13','2022-03-17 13:45:54'),(125,'pmo','web','PMD','2022-03-21 13:07:27','2022-03-21 13:07:27'),(127,'entry-types','web','Finance','2022-03-23 14:31:55','2022-03-23 14:31:55'),(128,'entry-type-create','web','Finance','2022-03-23 14:31:56','2022-03-23 14:31:56'),(129,'entry-type-edit','web','Finance','2022-03-23 14:31:56','2022-03-23 14:31:56'),(130,'entry-type-delete','web','Finance','2022-03-23 14:31:56','2022-03-23 14:31:56'),(131,'tags','web','Finance','2022-03-23 14:31:56','2022-03-23 14:31:56'),(132,'tag-create','web','Finance','2022-03-23 14:31:56','2022-03-23 14:31:56'),(133,'tag-edit','web','Finance','2022-03-23 14:31:56','2022-03-23 14:31:56'),(134,'tag-delete','web','Finance','2022-03-23 14:31:56','2022-03-23 14:31:56'),(135,'bank-accounts','web','Finance','2022-03-23 14:31:56','2022-03-23 14:31:56'),(136,'bank-account-create','web','Finance','2022-03-23 14:31:56','2022-03-23 14:31:56'),(137,'bank-account-edit','web','Finance','2022-03-23 14:31:56','2022-03-23 14:31:56'),(138,'bank-account-delete','web','Finance','2022-03-23 14:31:56','2022-03-23 14:31:56'),(139,'fiscal-years','web','Finance','2022-03-23 14:31:56','2022-03-23 14:31:56'),(140,'fiscal-year-create','web','Finance','2022-03-23 14:31:56','2022-03-23 14:31:56'),(141,'fiscal-year-edit','web','Finance','2022-03-23 14:31:56','2022-03-23 14:31:56'),(142,'fiscal-year-delete','web','Finance','2022-03-23 14:31:56','2022-03-23 14:31:56'),(143,'department-requisition-edit','web','Master Data','2022-04-03 15:38:42','2022-04-03 15:38:42'),(144,'attributes','web','Product Library','2022-04-08 14:06:09','2022-04-08 14:06:09'),(145,'attribute-create','web','Product Library','2022-04-08 14:06:10','2022-04-08 14:06:10'),(146,'attribute-edit','web','Product Library','2022-04-08 14:06:10','2022-04-08 14:06:10'),(147,'attribute-delete','web','Product Library','2022-04-08 14:06:10','2022-04-08 14:06:10'),(148,'attribute-options','web','Product Library','2022-04-08 14:06:10','2022-04-08 14:06:10'),(149,'attribute-option-create','web','Product Library','2022-04-08 14:06:10','2022-04-08 14:06:10'),(150,'attribute-option-edit','web','Product Library','2022-04-08 14:06:10','2022-04-08 14:06:10'),(151,'attribute-option-delete','web','Product Library','2022-04-08 14:06:10','2022-04-08 14:06:10'),(152,'inventory-stock-report','web','PO','2022-04-25 15:37:45','2022-04-25 15:37:45'),(153,'quality-ensure-return-change-received-list','web','Quality Ensure','2022-05-25 12:02:19','2022-05-25 12:02:19'),(154,'category-list','web','Product Library','2022-06-03 14:20:15','2022-06-03 14:20:15'),(155,'category-create','web','Product Library','2022-06-03 14:20:15','2022-06-03 14:45:14'),(156,'category-edit','web','Product Library','2022-06-03 14:20:15','2022-06-03 14:20:15'),(157,'category-delete','web','Product Library','2022-06-03 14:20:15','2022-06-03 14:20:15'),(158,'sub-category-list','web','Product Library','2022-06-03 14:20:15','2022-06-03 14:20:15'),(159,'brand-list','web','Product Library','2022-06-03 14:20:15','2022-06-03 14:20:15'),(160,'brand-create','web','Product Library','2022-06-03 14:20:15','2022-06-03 14:45:33'),(161,'brand-edit','web','Product Library','2022-06-03 14:20:15','2022-06-03 14:20:15'),(162,'brand-delete','web','Product Library','2022-06-03 14:20:15','2022-06-03 14:20:15'),(163,'supplier-create','web','Supplier','2022-06-03 14:22:15','2022-06-03 14:46:22'),(164,'supplier-edit','web','Supplier','2022-06-03 14:22:15','2022-06-03 14:22:15'),(165,'supplier-delete','web','Supplier','2022-06-03 14:22:15','2022-06-03 14:22:15'),(166,'halt-requisitions','web','Requisition','2022-06-07 12:07:37','2022-06-07 12:07:37'),(167,'po-cash-approval-list','web','PO','2022-06-07 16:57:32','2022-06-07 19:28:16'),(168,'po-cash-permission','web','PO','2022-06-07 19:29:21','2022-06-07 19:29:21'),(169,'estimate-list','web','PO','2022-06-16 11:55:29','2022-06-16 11:55:29'),(170,'category-upload-csv','web','Product Library','2022-06-16 12:06:15','2022-06-16 12:06:15'),(171,'product-upload-csv','web','Product','2022-06-16 12:06:44','2022-06-16 12:06:44'),(172,'quotation-reject-list','web','Quotation','2022-06-22 03:12:39','2022-06-22 03:12:39'),(173,'estimate-reject-list','web','PO','2022-06-22 03:12:39','2022-06-22 03:12:39'),(174,'estimate-approval-list','web','PO','2022-06-22 03:12:39','2022-06-22 03:12:39'),(175,'gate-out-list','web','Gate Operations','2022-06-22 03:12:39','2022-06-22 03:12:39'),(176,'work-order-cancel','web','Finance Reprots','2022-06-22 10:35:59','2022-06-22 10:35:59'),(178,'departments','web','Master Data','2022-07-01 18:52:42','2022-07-01 18:52:42'),(179,'department-add','web','Master Data','2022-07-01 18:52:42','2022-07-01 18:52:42'),(180,'department-edit','web','Master Data','2022-07-01 18:52:43','2022-07-01 18:52:43'),(181,'department-delete','web','Master Data','2022-07-01 18:52:43','2022-07-01 18:52:43'),(182,'project-type-list','web','PMD','2022-07-01 18:52:43','2022-07-01 18:52:43'),(183,'project-type-create','web','PMD','2022-07-01 18:52:43','2022-07-01 18:52:43'),(184,'project-type-edit','web','PMD','2022-07-01 18:52:43','2022-07-01 18:52:43'),(185,'project-type-delete','web','PMD','2022-07-01 18:52:44','2022-07-01 18:52:44'),(186,'project-objectives','web','PMD','2022-07-03 14:34:46','2022-07-03 14:34:46'),(187,'project-objective-add','web','PMD','2022-07-03 14:34:47','2022-07-03 14:34:47'),(188,'project-objective-edit','web','PMD','2022-07-03 14:34:47','2022-07-03 14:34:47'),(189,'project-objective-delete','web','PMD','2022-07-03 14:34:47','2022-07-03 14:34:47'),(190,'project-settings','web','PMD','2022-07-18 13:23:54','2022-07-18 13:23:54'),(191,'project-manage-create','web','PMD','2022-07-18 13:25:31','2022-07-18 13:25:31'),(192,'project-manage-edit','web','PMD','2022-07-18 13:25:31','2022-07-18 13:25:31'),(193,'project-manage-delete','web','PMD','2022-07-18 13:25:31','2022-07-18 13:25:31'),(194,'project-manage-halt-list','web','Requisition','2022-07-18 13:25:31','2022-07-18 13:25:31'),(195,'project-manage-assign-to','web','PMD','2022-07-18 16:37:36','2022-07-18 16:37:36'),(196,'holiday-setup','web','Setup','2022-07-26 12:05:54','2022-07-26 12:05:54'),(197,'holiday-setup-create','web','Setup','2022-07-26 12:05:55','2022-07-26 12:05:55'),(198,'holiday-setup-edit','web','Setup','2022-07-26 12:05:55','2022-07-26 12:05:55'),(199,'holiday-setup-delete','web','Setup','2022-07-26 12:05:55','2022-07-26 12:05:55'),(200,'holiday-setup-update','web','Setup','2022-07-26 12:05:55','2022-07-26 12:05:55'),(201,'department-lists','web','Master Data','2022-07-26 12:05:55','2022-07-26 12:05:55'),(202,'day-setup','web','Setup','2022-07-26 12:05:55','2022-07-26 12:05:55'),(203,'day-setup-create','web','Setup','2022-07-26 12:07:02','2022-07-26 12:07:02'),(204,'day-setup-edit','web','Setup','2022-07-26 12:07:02','2022-07-26 12:07:02'),(205,'day-setup-update','web','Setup','2022-07-26 12:07:02','2022-07-26 12:07:02'),(206,'day-setup-delete','web','Setup','2022-07-26 12:07:02','2022-07-26 12:07:02'),(207,'project-manage-approval','web','PMD','2022-07-26 12:14:48','2022-07-26 12:14:48'),(208,'project-manage-phase-list','web','PMD','2022-07-26 12:14:48','2022-07-26 12:14:48'),(209,'project-manage-phase-action','web','PMD','2022-07-26 12:14:48','2022-07-26 12:14:48'),(210,'project-manage-action','web','PMD','2022-07-26 12:14:48','2022-07-26 12:14:48'),(211,'project-manage-planned-list','web','PMD','2022-07-26 12:14:48','2022-07-26 12:14:48'),(212,'project-manage-reapproval-list','web','PMD','2022-07-26 12:14:48','2022-07-26 12:14:48'),(213,'phase-manage-store','web','PMD','2022-07-26 12:17:13','2022-07-26 12:18:54'),(214,'milestone-manage-store','web','PMD','2022-07-26 12:17:13','2022-07-26 12:18:41'),(215,'task-manage-store','web','PMD','2022-07-26 12:17:13','2022-07-26 12:18:28'),(216,'task-manage-delete','web','PMD','2022-07-26 12:19:29','2022-07-26 12:19:29'),(217,'milestone-manage-delete','web','PMD','2022-07-26 12:19:29','2022-07-26 12:19:29'),(218,'phase-manage-delete','web','PMD','2022-07-26 12:19:29','2022-07-26 12:19:29'),(219,'project-manage-file-manage','web','PMD','2022-07-26 12:20:24','2022-07-26 12:20:24'),(220,'project-manage-file-upload','web','PMD','2022-07-26 12:21:21','2022-07-26 12:21:21'),(221,'project-manage-show','web','PMD','2022-07-26 12:25:24','2022-07-26 12:25:24'),(222,'project-manage-gantt-chart','web','PMD','2022-07-26 12:25:24','2022-07-26 12:25:24'),(223,'project-manage-report','web','PMD','2022-07-26 12:25:24','2022-07-26 12:25:24'),(224,'task-attachment-create','web','PMD','2022-07-26 12:41:35','2022-07-26 12:41:35'),(225,'task-attachment-edit','web','PMD','2022-07-26 12:41:36','2022-07-26 12:41:36'),(226,'task-attachment-delete','web','PMD','2022-07-26 12:41:36','2022-07-26 12:41:36'),(227,'task-attachment-show','web','PMD','2022-07-26 12:41:36','2022-07-26 12:41:36'),(228,'project-manage-close','web','PMD','2022-07-26 12:44:57','2022-07-26 12:44:57'),(229,'project-manage-phase-review','web','PMD','2022-07-26 12:44:57','2022-07-26 12:44:57'),(230,'project-manage-phase-close','web','PMD','2022-07-26 12:44:57','2022-07-26 12:44:57'),(231,'project-manage-draft-list','web','PMD','2022-07-26 13:05:18','2022-07-26 13:05:18'),(232,'project-manage-ongoing-list','web','PMD','2022-07-26 13:05:18','2022-07-26 13:05:18'),(233,'project-manage-pending-list','web','Requisition','2022-07-26 13:05:18','2022-07-26 13:05:18'),(234,'project-manage-close-list','web','PMD','2022-07-26 13:19:16','2022-07-26 13:19:16'),(235,'project-manage-task-action','web','PMD','2022-07-26 13:28:03','2022-07-26 13:28:03'),(236,'project-manage-phase-ack','web','PMD','2022-07-26 13:47:53','2022-07-26 13:47:53'),(237,'project-manage-task-ack','web','PMD','2022-07-26 13:47:53','2022-07-26 13:47:53'),(238,'project-manage-close-ack','web','PMD','2022-07-26 13:47:53','2022-07-26 13:47:53'),(239,'entry-list','web','Finance','2022-08-18 17:22:29','2022-08-18 18:02:41'),(240,'accounts-report','web','Finance','2022-08-18 17:45:29','2022-08-18 17:45:29'),(241,'balance-sheet','web','Finance Reprots','2022-08-18 17:50:27','2022-08-18 17:50:27'),(242,'profit-loss','web','Finance Reprots','2022-08-18 17:50:27','2022-08-18 17:50:27'),(243,'trial-balance','web','Finance Reprots','2022-08-18 17:50:27','2022-08-18 17:50:27'),(244,'ledger-statement','web','Finance Reprots','2022-08-18 17:50:27','2022-08-18 17:52:32'),(245,'ledger-entries','web','Finance Reprots','2022-08-18 17:50:27','2022-08-18 17:50:27'),(247,'entry-create','web','Finance','2022-08-18 18:03:26','2022-08-18 18:03:26'),(248,'entry-edit','web','Finance','2022-08-18 18:03:26','2022-08-18 18:03:26'),(249,'entry-delete','web','Finance','2022-08-18 18:03:26','2022-08-18 18:03:26'),(250,'entry-view','web','Finance','2022-08-18 18:03:26','2022-08-18 18:03:26'),(251,'entry-report-xls-file','web','Finance','2022-08-19 11:41:32','2022-08-19 11:41:32'),(252,'cost-centre-create','web','Finance','2022-08-19 12:02:17','2022-08-19 12:02:17'),(253,'cost-centre-profile','web','Finance','2022-08-19 12:02:17','2022-08-19 12:02:17'),(254,'cost-centre-edit','web','Finance','2022-08-19 12:02:17','2022-08-19 12:02:17'),(255,'cost-centre-delete','web','Finance','2022-08-19 12:02:17','2022-08-19 12:02:17'),(256,'cost-centres','web','Finance','2022-08-19 12:02:17','2022-08-19 12:02:17'),(257,'companies','web','Finance','2022-08-19 12:03:54','2022-08-19 12:03:54'),(258,'company-create','web','Finance','2022-08-19 12:03:54','2022-08-19 12:03:54'),(259,'company-edit','web','Finance','2022-08-19 12:03:54','2022-08-19 12:03:54'),(260,'company-delete','web','Finance','2022-08-19 12:03:55','2022-08-19 12:03:55'),(261,'balance-sheet-print','web','Finance Reprots','2022-08-19 12:17:58','2022-08-19 12:17:58'),(262,'balance-sheet-pdf','web','Finance Reprots','2022-08-19 12:17:58','2022-08-19 12:17:58'),(263,'balance-sheet-excel','web','Finance Reprots','2022-08-19 12:17:58','2022-08-19 12:17:58'),(264,'profit-loss-print','web','Finance Reprots','2022-08-19 12:17:58','2022-08-19 12:17:58'),(265,'profit-loss-pdf','web','Finance Reprots','2022-08-19 12:17:58','2022-08-19 12:17:58'),(266,'profit-loss-excel','web','Finance Reprots','2022-08-19 12:17:58','2022-08-19 12:17:58'),(267,'trial-balance-print','web','Finance Reprots','2022-08-19 12:17:58','2022-08-19 12:17:58'),(268,'trial-balance-pdf','web','Finance Reprots','2022-08-19 12:17:58','2022-08-19 12:17:58'),(269,'trial-balance-excel','web','Finance Reprots','2022-08-19 12:17:58','2022-08-19 12:17:58'),(270,'ledger-statement-print','web','Finance Reprots','2022-08-19 12:17:58','2022-08-19 12:17:58'),(271,'ledger-statement-pdf','web','Finance Reprots','2022-08-19 12:17:59','2022-08-19 12:17:59'),(272,'ledger-statement-excel','web','Finance Reprots','2022-08-19 12:17:59','2022-08-19 12:17:59'),(273,'ledger-entries-print','web','Finance Reprots','2022-08-19 12:17:59','2022-08-19 12:17:59'),(274,'ledger-entries-pdf','web','Finance Reprots','2022-08-19 12:17:59','2022-08-19 12:17:59'),(275,'ledger-entries-excel','web','Finance Reprots','2022-08-19 12:17:59','2022-08-19 12:17:59'),(276,'accounts-default-settings','web','Finance','2022-08-26 04:40:09','2022-08-26 04:40:09'),(277,'group-request','web','Finance Reprots','2022-09-07 10:24:57','2022-09-07 10:24:57'),(278,'group-review','web','Finance Reprots','2022-09-07 10:24:57','2022-09-07 10:24:57'),(279,'group-assessment','web','Finance Reprots','2022-09-07 10:24:57','2022-09-07 10:24:57'),(280,'group-approve','web','Finance Reprots','2022-09-07 10:24:57','2022-09-07 10:24:57'),(281,'chart-of-account-request','web','Finance','2022-09-07 10:24:58','2022-09-07 10:24:58'),(282,'chart-of-account-review','web','Finance','2022-09-07 10:24:58','2022-09-07 10:24:58'),(283,'chart-of-account-assessment','web','Finance','2022-09-07 10:24:58','2022-09-07 10:24:58'),(284,'chart-of-account-approve','web','Finance','2022-09-07 10:24:58','2022-09-07 10:24:58'),(285,'bank-account-request','web','Finance','2022-09-07 10:24:58','2022-09-07 10:24:58'),(286,'bank-account-review','web','Finance','2022-09-07 10:24:58','2022-09-07 10:24:58'),(287,'bank-account-assessment','web','Finance','2022-09-07 10:24:58','2022-09-07 10:24:58'),(288,'bank-account-approve','web','Finance','2022-09-07 10:24:58','2022-09-07 10:24:58'),(289,'entry-request','web','Finance','2022-09-07 10:26:21','2022-09-07 10:26:21'),(290,'entry-review','web','Finance','2022-09-07 10:26:21','2022-09-07 10:26:21'),(291,'entry-assessment','web','Finance','2022-09-07 10:26:21','2022-09-07 10:26:21'),(292,'entry-approve','web','Finance','2022-09-07 10:26:21','2022-09-07 10:26:21'),(293,'po-wise-entry-list','web','Finance','2022-09-08 15:03:00','2022-09-08 15:03:00'),(294,'supplier-wise-entry-list','web','Finance','2022-09-08 15:03:00','2022-09-08 15:03:00'),(295,'fixed-asset-locations','web','Finance','2022-09-24 08:17:24','2022-09-24 08:17:24'),(296,'fixed-asset-location-create','web','Finance','2022-09-24 08:17:24','2022-09-24 08:17:24'),(297,'fixed-asset-location-edit','web','Finance','2022-09-24 08:17:24','2022-09-24 08:17:24'),(298,'fixed-asset-location-delete','web','Finance','2022-09-24 08:17:25','2022-09-24 08:17:25'),(299,'fixed-asset-distributions','web','Finance','2022-09-25 12:13:11','2022-09-25 12:13:11'),(300,'fixed-asset-distribution-history','web','Finance','2022-09-25 12:13:11','2022-09-25 12:13:11'),(303,'my-assets','web','Finance','2022-09-26 08:21:38','2022-09-26 08:21:38'),(304,'receive-assets','web','Finance','2022-09-26 08:21:38','2022-09-26 08:21:38'),(305,'fixed-asset-barcode','web','Finance','2022-09-26 10:13:24','2022-09-26 10:13:24'),(306,'fixed-asset-physical-status','web','Finance','2022-09-26 12:54:13','2022-09-26 12:54:13'),(307,'fixed-asset-physical-status-update','web','Finance','2022-09-26 12:54:13','2022-09-26 12:54:13'),(308,'fixed-asset-physical-status-history','web','Finance','2022-09-26 12:54:13','2022-09-26 12:54:13'),(309,'fixed-asset-report','web','Finance','2022-09-26 15:21:45','2022-09-26 15:21:45'),(310,'fixed-asset-movements','web','Finance','2022-09-27 09:09:45','2022-09-27 09:09:45'),(311,'fixed-asset-movement-approval','web','Finance','2022-09-27 09:09:46','2022-09-27 09:09:46'),(312,'fixed-asset-move','web','Finance','2022-09-27 09:09:46','2022-09-27 09:09:46'),(313,'cost-center-wise-fixed-asset-report','web','Finance','2022-10-03 14:51:39','2022-10-03 14:51:39'),(314,'fixed-asset-physical-status-report','web','Finance','2022-10-03 14:51:39','2022-10-03 14:51:39'),(315,'posted-fixed-asset-movement-status-report','web','Finance','2022-10-03 14:51:39','2022-10-03 14:51:39'),(316,'fixed-assets-categories','web','Finance','2022-10-03 14:51:40','2022-10-03 14:51:40'),(317,'fixed-asstes-subcategories','web','Finance','2022-10-03 14:51:40','2022-10-03 14:51:40'),(318,'fixed-asstes-products','web','Finance','2022-10-03 14:51:40','2022-10-03 14:51:40'),(319,'process-depreciation','web','Finance','2022-10-05 10:42:27','2022-10-05 10:42:27'),(320,'depreciation-book','web','Finance','2022-10-05 10:42:28','2022-10-05 10:42:28'),(321,'depreciation-history','web','Finance','2022-10-05 10:42:28','2022-10-05 10:42:28'),(322,'depreciation-valuations','web','Finance','2022-10-06 09:29:38','2022-10-06 09:29:38'),(323,'fixed-asset-disposal','web','Finance','2022-10-06 10:24:37','2022-10-06 10:24:37'),(324,'fixed-asset-disposal-history','web','Finance','2022-10-06 10:24:37','2022-10-06 10:24:37'),(325,'po-advance-audit','web','PO','2022-10-12 23:29:53','2022-10-12 23:29:53'),(326,'portfolios','web','PO','2022-10-17 14:51:26','2022-10-17 14:51:26'),(327,'portfolio-add','web','PO','2022-10-17 14:51:26','2022-10-17 14:51:26'),(328,'portfolio-edit','web','PO','2022-10-17 14:51:26','2022-10-17 14:51:26'),(329,'portfolio-delete','web','PO','2022-10-17 14:51:27','2022-10-17 14:51:27'),(330,'programs','web','PMD','2022-10-17 14:51:27','2022-10-17 14:51:27'),(331,'program-add','web','PMD','2022-10-17 14:51:27','2022-10-17 14:51:27'),(332,'program-edit','web','PMD','2022-10-17 14:51:27','2022-10-17 14:51:27'),(333,'program-delete','web','PMD','2022-10-17 14:51:27','2022-10-17 14:51:27'),(334,'advance-categories','web','Finance','2022-10-19 15:48:59','2022-10-19 15:48:59'),(335,'advance-category-create','web','Finance','2022-10-19 15:48:59','2022-10-19 15:48:59'),(336,'advance-category-edit','web','Finance','2022-10-19 15:48:59','2022-10-19 15:48:59'),(337,'advance-category-delete','web','Finance','2022-10-19 15:49:00','2022-10-19 15:49:00'),(338,'project-task-change-request-list','web','PMD','2022-10-20 12:19:52','2022-10-20 12:19:52'),(339,'project-task-change-request-action','web','PMD','2022-10-20 12:19:52','2022-10-20 12:19:52'),(340,'project-task-change-request-logs','web','PMD','2022-10-20 12:19:53','2022-10-20 12:19:53'),(341,'cwip-categories','web','Finance','2022-10-23 10:53:59','2022-10-23 10:53:59'),(342,'cwip-sub-categories','web','Finance','2022-10-23 10:53:59','2022-10-23 10:53:59'),(343,'cwip-products','web','Finance','2022-10-23 10:53:59','2022-10-23 10:53:59'),(344,'po-closing-activities','web','PO','2022-11-01 14:37:14','2022-11-01 14:37:14'),(345,'asset-costing-entries','web','Finance','2022-11-02 09:19:50','2022-11-02 09:19:50'),(346,'cwit-to-asset','web','Finance','2022-11-02 14:52:15','2022-11-02 14:52:15'),(347,'bank-reconciliation','web','Finance Reprots','2022-11-08 13:33:56','2022-11-08 13:33:56'),(348,'bank-reconciliation-history','web','Finance Reprots','2022-11-08 13:33:56','2022-11-08 13:33:56'),(349,'asset-history-report','web','Finance','2022-11-09 10:51:18','2022-11-09 10:51:18'),(350,'bank-reconciliation-statements','web','Finance Reprots','2022-11-15 11:30:12','2022-11-15 11:30:12'),(351,'trial-balance-with-balance','web','Finance Reprots','2022-11-27 10:58:38','2022-11-27 10:58:38'),(352,'currency-types','web','Finance','2022-11-27 13:09:38','2022-11-27 13:09:38'),(353,'currencies','web','Finance','2022-11-27 13:09:38','2022-11-27 13:09:38'),(354,'exchange-rates','web','Finance','2022-11-27 13:09:38','2022-11-27 13:09:38'),(355,'loan-types','web','Finance','2022-12-22 09:34:36','2022-12-22 09:34:36'),(356,'loans','web','Finance','2022-12-22 09:34:36','2022-12-22 09:34:36'),(357,'loan-schedules','web','Finance','2022-12-22 09:34:36','2022-12-22 09:34:36'),(358,'loan-schedule-installments','web','Finance','2022-12-22 09:34:36','2022-12-22 09:34:36'),(359,'loan-schedule-payments','web','Finance','2022-12-22 09:34:36','2022-12-25 15:22:06'),(360,'loan-reports','web','Finance','2022-12-22 09:34:36','2022-12-25 15:20:26'),(361,'po-cancel','web','PO','2023-01-12 13:32:13','2023-01-12 13:32:13'),(362,'send-po-to-supplier','web','PO','2023-01-12 13:32:13','2023-01-12 13:32:13'),(363,'restore-po','web','PO','2023-01-12 13:32:13','2023-01-12 13:32:13'),(364,'billing-audit-history','web','Audit','2023-01-12 13:32:29','2023-01-12 13:32:29'),(365,'supplier-ledger-generate','web','Finance','2023-01-12 13:32:42','2023-01-12 13:32:42'),(366,'project-task-change-request-approved-deny','web','PMD','2023-01-12 13:32:56','2023-01-12 13:32:56'),(367,'project-task-redo-action','web','PMD','2023-01-17 09:08:07','2023-01-17 09:08:07'),(368,'project-task-redo-store','web','PMD','2023-01-17 09:08:07','2023-01-17 09:08:07'),(369,'sub-tasks','web','PMD','2023-01-17 09:08:07','2023-01-17 09:08:07'),(370,'sub-task-store','web','PMD','2023-01-17 09:08:07','2023-01-17 09:08:07'),(371,'sub-task-destroy','web','PMD','2023-01-17 09:08:08','2023-01-17 09:08:08'),(372,'sub-task-action','web','PMD','2023-01-17 09:08:08','2023-01-17 09:08:08'),(373,'phase-actions','web','PMD','2023-01-18 16:01:54','2023-01-18 16:01:54'),(374,'quotation-generate','web','Quotation','2023-01-24 14:44:49','2023-01-24 14:44:49'),(375,'quotation-complete','web','Quotation','2023-01-24 14:44:49','2023-01-24 14:44:49'),(376,'fixed-asset-register','web','Finance','2023-02-22 11:29:17','2023-02-22 11:29:17'),(377,'cheque-register','web','Finance','2023-02-26 13:24:45','2023-02-26 13:24:45'),(378,'supplier-balance','web','Finance','2023-03-07 10:27:50','2023-03-07 10:27:50'),(379,'transaction-review','web','Finance','2023-03-12 11:05:42','2023-03-12 11:05:42'),(380,'transaction-assessment','web','Finance','2023-03-12 11:05:42','2023-03-12 11:05:42'),(381,'transaction-approval','web','Finance','2023-03-12 11:05:42','2023-03-12 11:05:42'),(382,'cheque-books','web','Finance','2023-03-28 11:36:02','2023-03-28 11:36:02'),(383,'cheque-book-pages','web','Finance','2023-03-28 11:36:02','2023-03-28 11:36:02'),(384,'cheque-book-page-damage','web','Finance','2023-03-28 11:36:02','2023-03-28 11:36:02'),(385,'cheque-book-create','web','Finance','2023-03-28 12:00:33','2023-03-28 12:00:33'),(386,'cheque-book-edit','web','Finance','2023-03-28 12:00:33','2023-03-28 12:00:33'),(387,'cheque-book-delete','web','Finance','2023-03-28 12:00:33','2023-03-28 12:00:33'),(388,'category-wise-asset-register','web','Finance','2023-04-11 11:43:45','2023-04-11 11:43:45'),(389,'sub-category-wise-asset-register','web','Finance','2023-04-11 11:43:45','2023-04-11 11:43:45'),(390,'service-confirmation','web','Service','2023-04-20 12:58:28','2023-04-20 12:58:28'),(391,'confirmed-services','web','Service','2023-04-26 14:49:59','2023-04-26 14:49:59'),(392,'asset-cost-breakdown','web','Finance','2023-04-29 09:57:46','2023-04-29 09:57:46'),(393,'reverse-finance-posting','web','Finance','2023-04-29 13:26:23','2023-04-29 13:26:23'),(394,'company-profile','web','Finance','2023-04-30 12:01:29','2023-04-30 12:01:29'),(395,'fiscal-year-closings','web','Finance','2023-04-30 12:12:58','2023-04-30 12:12:58'),(396,'fiscal-year-closing-run','web','Finance','2023-04-30 12:12:58','2023-04-30 12:12:58'),(397,'advance-clearing','web','Finance','2023-05-06 11:45:30','2023-05-06 11:45:30'),(398,'advance-clearing-posting','web','Finance','2023-05-06 11:45:30','2023-05-06 11:45:30'),(399,'bank-currency-transfer','web','Finance','2023-05-08 12:59:27','2023-05-08 12:59:27'),(400,'run-bank-currency-transfer','web','Finance','2023-05-08 12:59:27','2023-05-08 12:59:27'),(401,'cheque-book-tag-transactions','web','Finance','2023-05-11 12:06:59','2023-05-11 12:06:59'),(402,'unrealized-currency-settings','web','Finance','2023-05-25 11:47:25','2023-05-25 11:47:25'),(403,'unrealized-currency-events','web','Finance','2023-05-25 11:47:25','2023-05-25 11:47:25'),(404,'unrealized-currency-event-histories','web','Finance','2023-05-25 11:47:25','2023-05-25 11:47:25'),(405,'sale-dashboard','web','Sales','2023-07-09 10:46:51','2023-07-09 10:46:51'),(406,'sales-quotation-entry','web','Sales','2023-07-09 11:45:34','2023-07-09 11:45:34'),(407,'sales-order-entry','web','Sales','2023-07-09 11:45:34','2023-07-09 11:45:34'),(408,'direct-delivery','web','Sales','2023-07-09 11:45:35','2023-07-09 11:45:35'),(409,'direct-invoice','web','Sales','2023-07-09 11:45:35','2023-07-09 11:45:35'),(410,'delivery-against-sales-orders','web','Sales','2023-07-09 11:45:35','2023-07-09 11:45:35'),(411,'invoice-against-sales-delivery','web','Sales','2023-07-09 11:45:35','2023-07-09 11:45:35'),(412,'invoice-prepaid-orders','web','Sales','2023-07-09 11:45:35','2023-07-09 11:45:35'),(413,'template-delivery','web','Sales','2023-07-09 11:45:35','2023-07-09 11:45:35'),(414,'template-invoice','web','Sales','2023-07-09 11:49:47','2023-07-09 11:49:47'),(415,'create-and-print-recurrent-invoices','web','Sales','2023-07-09 11:49:47','2023-07-09 11:49:47'),(416,'customer-payments','web','Sales','2023-07-09 11:49:47','2023-07-09 11:49:47'),(417,'customer-credit-notes','web','Sales','2023-07-09 11:49:47','2023-07-09 11:49:47'),(418,'allocate-customer-payments-or-credit-notes','web','Sales','2023-07-09 11:49:47','2023-07-09 11:49:47'),(419,'sales-quotation-inquiry','web','Sales','2023-07-09 11:51:39','2023-07-09 11:51:39'),(420,'sales-order-inquiry','web','Sales','2023-07-09 11:51:39','2023-07-09 11:51:39'),(421,'customer-transaction-inquiry','web','Sales','2023-07-09 11:51:39','2023-07-09 11:51:39'),(422,'customer-allocation-inquiry','web','Sales','2023-07-09 11:51:39','2023-07-09 11:51:39'),(423,'customer-and-sales-reports','web','Sales','2023-07-09 11:51:39','2023-07-09 11:51:39'),(424,'customers','web','Sales','2023-07-09 11:53:40','2023-07-09 11:53:40'),(425,'customer-branches','web','Sales','2023-07-09 11:53:40','2023-07-09 11:53:40'),(426,'sales-groups','web','Sales','2023-07-09 11:53:40','2023-07-09 11:53:40'),(427,'recurrent-invoices','web','Sales','2023-07-09 11:53:40','2023-07-09 11:53:40'),(428,'sales-types','web','Sales','2023-07-09 11:53:42','2023-07-09 11:53:42'),(429,'sales-persons','web','Sales','2023-07-09 11:53:42','2023-07-09 11:53:42'),(430,'sales-areas','web','Sales','2023-07-09 11:53:42','2023-07-09 11:53:42'),(431,'sales-default-settings','web','Sales','2023-07-09 11:53:42','2023-07-09 11:53:42'),(432,'sales-types-create','web','Sales','2023-07-13 09:37:14','2023-07-13 09:37:14'),(433,'sales-types-edit','web','Sales','2023-07-13 09:37:14','2023-07-13 09:37:14'),(434,'sales-types-delete','web','Sales','2023-07-13 09:37:14','2023-07-13 09:37:14'),(435,'sales-area-create','web','Sales','2023-07-13 03:54:02','2023-07-13 03:54:02'),(436,'sales-area-edit','web','Sales','2023-07-13 03:54:02','2023-07-13 03:54:02'),(437,'sales-area-delete','web','Sales','2023-07-13 03:54:02','2023-07-13 03:54:02'),(438,'sales-group-create','web','Sales','2023-07-13 04:46:58','2023-07-13 04:46:58'),(439,'sales-group-edit','web','Sales','2023-07-13 04:46:58','2023-07-13 04:46:58'),(440,'sales-group-delete','web','Sales','2023-07-13 04:46:58','2023-07-13 04:46:58'),(441,'sales-person-create','web','Sales','2023-07-13 06:25:46','2023-07-13 06:25:46'),(442,'sales-person-edit','web','Sales','2023-07-13 06:25:46','2023-07-13 06:25:46'),(443,'sales-person-delete','web','Sales','2023-07-13 06:25:46','2023-07-13 06:25:46'),(444,'customer-create','web','Sales','2023-07-17 04:35:13','2023-07-17 04:35:13'),(445,'customer-edit','web','Sales','2023-07-17 04:35:13','2023-07-17 04:35:13'),(446,'customer-delete','web','Sales','2023-07-17 04:35:13','2023-07-17 04:35:13'),(447,'shippers-create','web','Sales','2023-07-17 06:44:36','2023-07-17 06:44:36'),(448,'shippers-edit','web','Sales','2023-07-17 06:44:36','2023-07-17 06:44:36'),(449,'shippers-delete','web','Sales','2023-07-17 06:44:36','2023-07-17 06:44:36'),(450,'sales-payment-types','web','Sales','2023-07-20 13:09:28','2023-07-20 13:09:28'),(451,'sales-payment-types-create','web','Sales','2023-07-20 13:09:29','2023-07-20 13:09:29'),(452,'sales-payment-types-edit','web','Sales','2023-07-20 13:09:29','2023-07-20 13:09:29'),(453,'sales-payment-types-delete','web','Sales','2023-07-20 13:09:29','2023-07-20 13:09:29'),(454,'customer-balances','web','Sales','2023-07-27 15:24:59','2023-07-27 15:24:59'),(455,'aged-customer-analysis','web','Sales','2023-07-27 15:24:59','2023-07-27 15:24:59'),(456,'customer-trial-balance','web','Sales','2023-07-27 15:24:59','2023-07-27 15:24:59'),(457,'customer-detail-listing','web','Sales','2023-07-27 15:24:59','2023-07-27 15:24:59'),(458,'sales-summary-report','web','Sales','2023-07-27 15:24:59','2023-07-27 15:24:59'),(459,'price-listing','web','Sales','2023-07-27 15:25:00','2023-07-27 15:25:00'),(460,'order-status-listing','web','Sales','2023-07-27 15:25:00','2023-07-27 15:25:00'),(461,'salesman-listing','web','Sales','2023-07-27 15:25:00','2023-07-27 15:25:00'),(462,'print-invoices','web','Sales','2023-07-27 15:25:00','2023-07-27 15:25:00'),(463,'print-credit-notes','web','Sales','2023-07-27 15:25:00','2023-07-27 15:25:00'),(464,'print-deliveries','web','Sales','2023-07-27 15:25:00','2023-07-27 15:25:00'),(465,'print-statements','web','Sales','2023-07-27 15:25:00','2023-07-27 15:25:00'),(466,'print-sales-orders','web','Sales','2023-07-27 15:25:01','2023-07-27 15:25:01'),(467,'print-sales-quotations','web','Sales','2023-07-27 15:25:01','2023-07-27 15:25:01'),(468,'print-receipts','web','Sales','2023-07-27 15:25:01','2023-07-27 15:25:01'),(469,'tax-report','web','Sales','2023-07-27 15:25:01','2023-07-27 15:25:01'),(470,'inventory-sales-report','web','Sales','2023-07-27 15:25:01','2023-07-27 15:25:01'),(471,'item-sales-summary-report','web','Sales','2023-07-27 15:25:01','2023-07-27 15:25:01'),(472,'standard-costs','web','Product Library','2023-08-22 11:09:27','2023-08-22 11:09:27'),(473,'product-standard-costs','web','Product Library','2023-08-22 11:09:27','2023-08-22 11:09:27'),(474,'receivable-clearings','web','Finance','2023-09-19 13:30:32','2023-09-24 12:15:35'),(475,'payment-clearings','web','Finance','2023-09-24 12:16:32','2023-09-24 12:16:32'),(476,'receivable-clearing-cencellation','web','Finance','2023-09-24 12:16:33','2023-09-24 12:16:33'),(477,'payment-clearing-cencellation','web','Finance','2023-09-24 12:16:33','2023-09-24 12:16:33'),(478,'sales-kits','web','Sales','2023-10-03 14:56:59','2023-10-03 14:56:59'),(479,'sales-kit-standard-costs','web','Sales','2023-10-03 14:56:59','2023-10-03 14:56:59'),(480,'print-sales-order','web','Sales','2023-10-26 12:57:08','2023-10-26 12:57:08'),(481,'module-main','web','System','2023-12-11 09:26:49','2023-12-11 09:26:49'),(482,'module-pms','web','System','2023-12-11 09:26:49','2023-12-11 09:26:49'),(483,'module-pmd','web','System','2023-12-11 09:26:49','2023-12-11 09:26:49'),(484,'module-finance','web','System','2023-12-11 09:26:49','2023-12-11 09:26:49'),(485,'module-sales','web','System','2023-12-11 09:26:49','2023-12-11 09:26:49'),(486,'system-information','web','System','2023-12-11 10:13:01','2023-12-11 10:13:01'),(487,'modules','web','System','2023-12-11 11:13:06','2023-12-11 11:13:06'),(488,'libraries','web','System','2023-12-14 12:26:45','2023-12-14 12:26:45'),(489,'hr-units','web','System','2023-12-16 20:19:55','2023-12-16 20:19:55'),(490,'hr-departments','web','System','2023-12-18 14:51:22','2023-12-18 14:51:22'),(491,'hr-designations','web','System','2023-12-18 14:51:22','2023-12-18 14:51:22'),(492,'hr-locations','web','System','2023-12-18 14:51:22','2023-12-18 14:51:22'),(493,'hr-sections','web','System','2023-12-18 14:51:22','2023-12-18 14:51:22'),(494,'hr-employees','web','System','2023-12-18 14:51:22','2023-12-18 14:51:22'),(495,'upload-excels','web','System','2023-12-19 15:15:13','2023-12-19 15:15:13'),(496,'requisition-explanations','web','Settings','2024-01-18 10:10:21','2024-01-18 10:10:21'),(497,'price-graph','web','Product Library','2024-01-25 14:36:07','2024-01-25 14:36:07'),(498,'process','web','Finance Integration','2024-02-01 12:59:14','2024-02-01 12:59:14'),(499,'sub-process','web','Finance Integration','2024-02-01 12:59:14','2024-02-01 12:59:14'),(500,'source','web','Finance Integration','2024-02-01 12:59:14','2024-02-01 12:59:14'),(501,'control-point','web','Finance Integration','2024-02-01 12:59:14','2024-02-01 12:59:14'),(502,'entry-point','web','Finance Integration','2024-02-01 12:59:14','2024-02-01 12:59:14'),(503,'requirement','web','Finance Integration','2024-02-01 12:59:14','2024-02-01 12:59:14'),(504,'transactions','web','Finance Integration','2024-02-01 13:02:14','2024-02-01 13:02:14'),(505,'transaction-entries','web','Finance Integration','2024-02-01 13:02:15','2024-02-01 13:02:15'),(506,'transaction-logs','web','Finance Integration','2024-02-01 13:02:15','2024-02-01 13:02:15'),(507,'bank-account-types','web','Finance','2024-02-04 10:51:45','2024-02-04 10:51:45'),(508,'bank-account-type-create','web','Finance','2024-02-04 10:51:45','2024-02-04 10:51:45'),(509,'bank-account-type-edit','web','Finance','2024-02-04 10:51:45','2024-02-04 10:51:45'),(510,'bank-account-type-delete','web','Finance','2024-02-04 10:51:45','2024-02-04 10:51:45'),(511,'bank-branches','web','Finance','2024-02-04 10:52:11','2024-02-04 10:52:11'),(512,'bank-branch-create','web','Finance','2024-02-04 10:52:11','2024-02-04 10:52:11'),(513,'bank-branch-edit','web','Finance','2024-02-04 10:52:11','2024-02-04 10:52:11'),(514,'bank-branch-delete','web','Finance','2024-02-04 10:52:11','2024-02-04 10:52:11'),(515,'bank-lists','web','Finance','2024-02-04 10:52:35','2024-02-04 10:52:35'),(516,'bank-create','web','Finance','2024-02-04 10:52:36','2024-02-04 10:52:36'),(517,'bank-edit','web','Finance','2024-02-04 10:52:36','2024-02-04 10:52:36'),(518,'bank-delete','web','Finance','2024-02-04 10:52:36','2024-02-04 10:52:36'),(519,'profit-centres','web','Finance','2024-02-07 15:02:26','2024-02-07 15:02:26'),(520,'profit-centre-create','web','Finance','2024-02-07 15:02:26','2024-02-07 15:02:26'),(521,'profit-centre-edit','web','Finance','2024-02-07 15:02:26','2024-02-07 15:02:26'),(522,'profit-centre-delete','web','Finance','2024-02-07 15:02:26','2024-02-07 15:02:26'),(523,'payment-schedules','web','Finance','2024-02-11 10:02:31','2024-02-11 10:02:31'),(524,'payment-schedules-create','web','Finance','2024-02-11 10:02:31','2024-02-11 10:02:31'),(525,'payment-schedules-edit','web','Finance','2024-02-11 10:02:32','2024-02-11 10:02:32'),(526,'payment-schedules-delete','web','Finance','2024-02-11 10:02:32','2024-02-11 10:02:32'),(527,'schedule-payments','web','Finance','2024-02-11 10:02:32','2024-02-11 10:02:32'),(528,'fiscal-year-openings','web','Finance','2024-02-12 11:41:48','2024-02-12 11:41:48'),(529,'open-fiscal-year','web','Finance','2024-02-12 11:41:48','2024-02-12 11:41:48'),(530,'fiscal-year-opening-approval','web','Finance','2024-02-12 11:41:49','2024-02-12 11:41:49'),(531,'close-opened-fiscal-year','web','Finance','2024-02-13 10:42:11','2024-02-13 10:42:11'),(532,'opened-fiscal-year-closing-approval','web','Finance','2024-02-13 10:42:11','2024-02-13 10:42:11'),(533,'multi-currency-transaction','web','Finance','2024-02-24 10:06:25','2024-02-24 10:06:25'),(534,'approval-levels','web','Finance','2024-03-02 11:38:29','2024-03-02 11:38:29'),(535,'approval-level-create','web','Finance','2024-03-02 11:38:29','2024-03-02 11:38:29'),(536,'approval-level-edit','web','Finance','2024-03-02 11:38:29','2024-03-02 11:38:29'),(537,'approval-level-delete','web','Finance','2024-03-02 11:38:29','2024-03-02 11:38:29'),(538,'warehouses','web','System','2024-03-11 10:58:11','2024-03-11 10:58:11');

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2976 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `personal_access_tokens` */

insert  into `personal_access_tokens`(`id`,`tokenable_type`,`tokenable_id`,`name`,`token`,`abilities`,`last_used_at`,`created_at`,`updated_at`) values (2942,'App\\User',4,'bizz-erp-finance-api','2c10e1f3b41d181c8b9efb3a292b83ad310b3305eb85a2bdb1b587a1902513dc','[\"*\"]',NULL,'2024-03-19 12:13:03','2024-03-19 12:13:03'),(2943,'App\\User',3,'bizz-erp-finance-api','30a5c89ce19cd0230ecbbc28786c428011cfb548476f763fe416ef33465873d9','[\"*\"]',NULL,'2024-03-19 12:23:36','2024-03-19 12:23:36'),(2951,'App\\User',7,'bizz-erp-finance-api','6b782e5f694b1517e604530cbb15e28d7bf9f276a091a3beaffc6b8f75de8482','[\"*\"]',NULL,'2024-03-19 12:29:08','2024-03-19 12:29:08'),(2954,'App\\User',5,'bizz-erp-finance-api','1410eef1d5c01dc3489b66601a6a94719dfc11751ddd62b8c6ff9f15312029e0','[\"*\"]',NULL,'2024-03-19 12:29:33','2024-03-19 12:29:33'),(2957,'App\\User',21,'bizz-erp-finance-api','2ec27145292634b6709cbf8e4476831ec267ca93712d060bedb0688b8b7e21e4','[\"*\"]',NULL,'2024-03-19 12:30:12','2024-03-19 12:30:12'),(2958,'App\\User',6,'bizz-erp-finance-api','3fd126fec6d9c83812eed781394b3cfa1088fd8cc02f628975fc1f76fcd5f517','[\"*\"]',NULL,'2024-03-19 12:30:33','2024-03-19 12:30:33'),(2975,'App\\User',1,'bizz-erp-finance-api','02551ecf4c2114e382bc4512fbea7ec80d116249419568ba8b7f058db82772fa','[\"*\"]',NULL,'2024-03-19 12:34:20','2024-03-19 12:34:20');

/*Table structure for table `portfolios` */

DROP TABLE IF EXISTS `portfolios`;

CREATE TABLE `portfolios` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` longtext COLLATE utf8mb4_unicode_ci,
  `start_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_at` double NOT NULL DEFAULT '0' COMMENT 'This field will show at percentage value',
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `portfolios` */

/*Table structure for table `processes` */

DROP TABLE IF EXISTS `processes`;

CREATE TABLE `processes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `processes_created_by_foreign` (`created_by`),
  KEY `processes_updated_by_foreign` (`updated_by`),
  CONSTRAINT `processes_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `processes_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `processes` */

insert  into `processes`(`id`,`code`,`name`,`description`,`created_by`,`updated_by`,`deleted_at`,`created_at`,`updated_at`) values (3,'01','Merchant Payable',NULL,1,1,NULL,'2024-03-11 15:59:26','2024-03-11 16:05:05'),(4,'02','Receipt of Payment',NULL,1,NULL,NULL,'2024-03-11 15:59:33','2024-03-11 15:59:33'),(5,'03','Merchant Payment',NULL,1,NULL,NULL,'2024-03-11 15:59:39','2024-03-11 15:59:39'),(6,'04','Refund',NULL,1,NULL,NULL,'2024-03-11 15:59:43','2024-03-11 15:59:43'),(7,'05','Chargeback',NULL,1,NULL,NULL,'2024-03-11 15:59:47','2024-03-11 15:59:47'),(8,'06','Reseller Revenue Share',NULL,1,NULL,NULL,'2024-03-11 15:59:50','2024-03-11 15:59:50'),(9,'07','EMI',NULL,1,NULL,NULL,'2024-03-11 15:59:54','2024-03-11 15:59:54'),(10,'08','IVAC Payments',NULL,1,NULL,NULL,'2024-03-11 15:59:57','2024-03-11 15:59:57'),(11,'09','GP Payment',NULL,1,NULL,NULL,'2024-03-11 16:00:01','2024-03-11 16:00:01'),(12,'10','Discount Campaign',NULL,1,NULL,NULL,'2024-03-11 16:00:04','2024-03-11 16:00:04'),(13,'11','BTCL/Alaap Payments',NULL,1,NULL,NULL,'2024-03-11 16:00:09','2024-03-11 16:00:09'),(14,'12','Credit Card Payment through Nagad',NULL,1,NULL,NULL,'2024-03-11 16:00:12','2024-03-11 16:00:12'),(15,'13','Debit Card Fund Transfer',NULL,1,NULL,NULL,'2024-03-11 16:00:16','2024-03-11 16:00:16'),(16,'14','BMDC',NULL,1,NULL,NULL,'2024-03-11 16:00:20','2024-03-11 16:00:20'),(17,'15','Top-up Purchase & Payment',NULL,1,NULL,NULL,'2024-03-11 16:01:34','2024-03-11 16:01:34'),(18,'16','SMS Purchase & Payment (Top-up from GP & BL)',NULL,1,NULL,NULL,'2024-03-11 16:01:38','2024-03-11 16:01:38'),(19,'17','SMS Purchase & Payment - Postpaid (Robi)',NULL,1,NULL,NULL,'2024-03-11 16:01:42','2024-03-11 16:01:42'),(20,'18','SMS Purchase & Payment - Prepaid (Teletalk)',NULL,1,NULL,NULL,'2024-03-11 16:01:46','2024-03-11 16:01:46'),(21,'19','Foreign SMS',NULL,1,NULL,NULL,'2024-03-11 16:01:51','2024-03-11 16:01:51'),(22,'20','Location Based SMS',NULL,1,NULL,NULL,'2024-03-11 16:01:56','2024-03-11 16:01:56'),(23,'21','Voice SMS',NULL,1,NULL,NULL,'2024-03-11 16:02:00','2024-03-11 16:02:00'),(24,'22','Vendor Payment (Local)',NULL,1,NULL,NULL,'2024-03-11 16:02:04','2024-03-11 16:02:04'),(25,'23','Vendor Payment (Foreign)',NULL,1,NULL,NULL,'2024-03-11 16:02:07','2024-03-11 16:02:07'),(26,'24','Petty Cash Payment',NULL,1,NULL,NULL,'2024-03-11 16:02:11','2024-03-11 16:02:11'),(27,'25','IOUs',NULL,1,NULL,NULL,'2024-03-11 16:02:15','2024-03-11 16:02:15'),(28,'26','Non Vendor Payments',NULL,1,NULL,NULL,'2024-03-11 16:02:18','2024-03-11 16:02:18'),(29,'27','Salary & Allowance Payment',NULL,1,NULL,NULL,'2024-03-11 16:02:22','2024-03-11 16:02:22'),(30,'28','Telco Push Pull SMS',NULL,1,NULL,NULL,'2024-03-11 16:03:09','2024-03-11 16:03:09'),(31,'29','Top-up Comission (postpaid)',NULL,1,NULL,NULL,'2024-03-11 16:03:16','2024-03-11 16:03:16'),(32,'30','SMS Commission (postpaid)',NULL,1,NULL,NULL,'2024-03-11 16:03:26','2024-03-11 16:03:26'),(33,'31','SSL Certificate',NULL,1,NULL,NULL,'2024-03-11 16:03:29','2024-03-11 16:03:29'),(34,'32','Monthly Recurring Charge',NULL,1,NULL,NULL,'2024-03-11 16:03:33','2024-03-11 16:03:33'),(35,'33','One Time Charge',NULL,1,NULL,NULL,'2024-03-11 16:03:38','2024-03-11 16:03:38'),(36,'34','Media Management',NULL,1,NULL,NULL,'2024-03-11 16:03:42','2024-03-11 16:03:42'),(37,'35','Top-up Commission (Prepaid)',NULL,1,NULL,NULL,'2024-03-11 16:03:45','2024-03-11 16:03:45'),(38,'36','SMS Commission (Prepaid)',NULL,1,NULL,NULL,'2024-03-11 16:03:49','2024-03-11 16:03:49'),(39,'37','Top-up Commission (Real Time)',NULL,1,NULL,NULL,'2024-03-11 16:03:57','2024-03-11 16:03:57'),(40,'38','Bill Collection',NULL,1,NULL,NULL,'2024-03-11 16:04:00','2024-03-11 16:04:00'),(41,'39','Top-up Commission (Easy App)',NULL,1,NULL,NULL,'2024-03-11 16:04:04','2024-03-11 16:04:04');

/*Table structure for table `product_attributes` */

DROP TABLE IF EXISTS `product_attributes`;

CREATE TABLE `product_attributes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `attribute_option_id` bigint(20) unsigned NOT NULL,
  `serial_no` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_attributes_product_id_foreign` (`product_id`),
  KEY `product_attributes_attribute_option_id_foreign` (`attribute_option_id`),
  CONSTRAINT `product_attributes_attribute_option_id_foreign` FOREIGN KEY (`attribute_option_id`) REFERENCES `attribute_options` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `product_attributes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `product_attributes` */

/*Table structure for table `product_quotation_lists` */

DROP TABLE IF EXISTS `product_quotation_lists`;

CREATE TABLE `product_quotation_lists` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `supplier_product_id` bigint(20) NOT NULL,
  `unit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tex` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `product_quotation_lists` */

/*Table structure for table `product_standard_costs` */

DROP TABLE IF EXISTS `product_standard_costs`;

CREATE TABLE `product_standard_costs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `standard_cost_id` bigint(20) unsigned NOT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_standard_costs_product_id_foreign` (`product_id`),
  KEY `product_standard_costs_standard_cost_id_foreign` (`standard_cost_id`),
  KEY `product_standard_costs_created_by_foreign` (`created_by`),
  KEY `product_standard_costs_updated_by_foreign` (`updated_by`),
  CONSTRAINT `product_standard_costs_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `product_standard_costs_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `product_standard_costs_standard_cost_id_foreign` FOREIGN KEY (`standard_cost_id`) REFERENCES `standard_costs` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `product_standard_costs_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `product_standard_costs` */

/*Table structure for table `product_unit_conversions` */

DROP TABLE IF EXISTS `product_unit_conversions`;

CREATE TABLE `product_unit_conversions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `product_unit_id` bigint(20) unsigned NOT NULL,
  `conversion_unit_id` bigint(20) unsigned NOT NULL,
  `conversion_rate` double NOT NULL DEFAULT '1',
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_unit_conversions_product_id_foreign` (`product_id`),
  KEY `product_unit_conversions_product_unit_id_foreign` (`product_unit_id`),
  KEY `product_unit_conversions_conversion_unit_id_foreign` (`conversion_unit_id`),
  KEY `product_unit_conversions_created_by_foreign` (`created_by`),
  KEY `product_unit_conversions_updated_by_foreign` (`updated_by`),
  CONSTRAINT `product_unit_conversions_conversion_unit_id_foreign` FOREIGN KEY (`conversion_unit_id`) REFERENCES `product_units` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `product_unit_conversions_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `product_unit_conversions_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `product_unit_conversions_product_unit_id_foreign` FOREIGN KEY (`product_unit_id`) REFERENCES `product_units` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `product_unit_conversions_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `product_unit_conversions` */

insert  into `product_unit_conversions`(`id`,`product_id`,`product_unit_id`,`conversion_unit_id`,`conversion_rate`,`created_by`,`updated_by`,`deleted_at`,`created_at`,`updated_at`) values (1,8,2,1,1000,1,NULL,NULL,'2024-03-18 12:03:37','2024-03-18 12:03:37'),(2,8,2,3,2.204,1,NULL,NULL,'2024-03-18 12:03:37','2024-03-18 12:03:37'),(3,8,2,4,0,1,NULL,NULL,'2024-03-18 12:03:37','2024-03-18 12:03:37'),(4,8,2,5,0,1,NULL,NULL,'2024-03-18 12:03:37','2024-03-18 12:03:37'),(5,8,2,6,0,1,NULL,NULL,'2024-03-18 12:03:37','2024-03-18 12:03:37'),(6,8,2,7,0,1,NULL,NULL,'2024-03-18 12:03:37','2024-03-18 12:03:37'),(7,8,2,8,0,1,NULL,NULL,'2024-03-18 12:03:37','2024-03-18 12:03:37'),(8,8,2,9,0,1,NULL,NULL,'2024-03-18 12:03:37','2024-03-18 12:03:37'),(9,7,5,1,0,1,NULL,NULL,'2024-03-18 12:03:56','2024-03-18 12:03:56'),(10,7,5,2,0,1,NULL,NULL,'2024-03-18 12:03:56','2024-03-18 12:03:56'),(11,7,5,3,0,1,NULL,NULL,'2024-03-18 12:03:56','2024-03-18 12:03:56'),(12,7,5,4,24,1,NULL,NULL,'2024-03-18 12:03:56','2024-03-18 12:03:56'),(13,7,5,6,2,1,NULL,NULL,'2024-03-18 12:03:56','2024-03-18 12:03:56'),(14,7,5,7,2,1,NULL,NULL,'2024-03-18 12:03:56','2024-03-18 12:03:56'),(15,7,5,8,0,1,NULL,NULL,'2024-03-18 12:03:56','2024-03-18 12:03:56'),(16,7,5,9,0,1,NULL,NULL,'2024-03-18 12:03:56','2024-03-18 12:03:56');

/*Table structure for table `product_unit_matrixes` */

DROP TABLE IF EXISTS `product_unit_matrixes`;

CREATE TABLE `product_unit_matrixes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_unit_id` bigint(20) unsigned NOT NULL,
  `conversion_unit_id` bigint(20) unsigned NOT NULL,
  `conversion_rate` double NOT NULL DEFAULT '1',
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_unit_matrixes_product_unit_id_foreign` (`product_unit_id`),
  KEY `product_unit_matrixes_conversion_unit_id_foreign` (`conversion_unit_id`),
  KEY `product_unit_matrixes_created_by_foreign` (`created_by`),
  KEY `product_unit_matrixes_updated_by_foreign` (`updated_by`),
  CONSTRAINT `product_unit_matrixes_conversion_unit_id_foreign` FOREIGN KEY (`conversion_unit_id`) REFERENCES `product_units` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `product_unit_matrixes_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `product_unit_matrixes_product_unit_id_foreign` FOREIGN KEY (`product_unit_id`) REFERENCES `product_units` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `product_unit_matrixes_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `product_unit_matrixes` */

/*Table structure for table `product_units` */

DROP TABLE IF EXISTS `product_units`;

CREATE TABLE `product_units` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `unit_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_code` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `round_policy` enum('round-up','round','round-down') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'round-up',
  `status` enum('active','inactive','cancel') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `product_units` */

insert  into `product_units`(`id`,`unit_name`,`unit_code`,`round_policy`,`status`,`created_by`,`updated_by`,`created_at`,`updated_at`,`deleted_at`) values (1,'Gram','PU-22-MBM-0001','round-up','active',1,0,'2022-01-24 16:19:31','2022-01-24 16:19:31',NULL),(2,'KG','PU-22-MBM-0002','round-up','active',1,0,'2022-01-24 16:19:37','2022-01-24 16:19:37',NULL),(3,'Pound','PU-22-MBM-0003','round-up','active',1,0,'2022-01-24 16:19:44','2022-01-24 16:19:44',NULL),(4,'Piece','PU-22-MBM-0004','round-up','active',1,1,'2022-01-24 17:13:15','2022-05-16 12:30:01',NULL),(5,'Box','PU-22-MBM-0005','round-up','active',1,0,'2022-01-24 17:13:23','2022-01-24 17:13:23',NULL),(6,'Packet','PU-22-MBM-0006','round-up','active',1,0,'2022-05-30 03:15:44','2022-05-30 03:15:44',NULL),(7,'Dozen','PU-22-MBM-0007','round-up','active',1,0,'2022-05-30 03:16:23','2022-05-30 03:16:23',NULL),(8,'Yds','PU-22-MBM-0008','round-up','active',1,0,'2022-08-14 17:45:54','2022-08-14 17:45:54',NULL),(9,'Month','PU-23-MBM-0009','round-up','active',1,1,'2023-05-13 11:39:17','2024-01-23 12:04:41',NULL);

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `category_id` bigint(20) unsigned NOT NULL,
  `brand_id` bigint(20) NOT NULL,
  `product_unit_id` bigint(20) unsigned NOT NULL,
  `sku` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `sales_price` double NOT NULL DEFAULT '0',
  `tax` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vat` double NOT NULL DEFAULT '0',
  `is_final_asset` int(11) NOT NULL DEFAULT '0',
  `is_service` int(11) DEFAULT '0',
  `is_sale_item` int(11) NOT NULL DEFAULT '0',
  `depreciation_method_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `base_rate` double NOT NULL DEFAULT '0',
  `rate_multiplier` double NOT NULL DEFAULT '0',
  `depreciation_rate` double NOT NULL DEFAULT '0',
  `is_yearly` int(11) NOT NULL DEFAULT '0',
  `years` int(11) NOT NULL DEFAULT '0',
  `is_onetime` int(11) NOT NULL DEFAULT '0',
  `depreciation_start_date` date DEFAULT NULL,
  `inventory_account_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cwip_asset_account_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cogs_account_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `inventory_adjustments_account_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `sales_account_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `depreciation_cost_account_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `depreciation_disposal_account_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `status` enum('pending','approved') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '1',
  `updated_by` bigint(20) unsigned DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_created_by_foreign` (`created_by`),
  KEY `products_updated_by_foreign` (`updated_by`),
  KEY `products_inventory_account_id_foreign` (`inventory_account_id`),
  KEY `products_cogs_account_id_foreign` (`cogs_account_id`),
  KEY `products_inventory_adjustments_account_id_foreign` (`inventory_adjustments_account_id`),
  KEY `products_category_id_foreign` (`category_id`),
  KEY `products_product_unit_id_foreign` (`product_unit_id`),
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `products_product_unit_id_foreign` FOREIGN KEY (`product_unit_id`) REFERENCES `product_units` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `products` */

insert  into `products`(`id`,`parent_id`,`category_id`,`brand_id`,`product_unit_id`,`sku`,`name`,`unit_price`,`sales_price`,`tax`,`vat`,`is_final_asset`,`is_service`,`is_sale_item`,`depreciation_method_id`,`base_rate`,`rate_multiplier`,`depreciation_rate`,`is_yearly`,`years`,`is_onetime`,`depreciation_start_date`,`inventory_account_id`,`cwip_asset_account_id`,`cogs_account_id`,`inventory_adjustments_account_id`,`sales_account_id`,`depreciation_cost_account_id`,`depreciation_disposal_account_id`,`status`,`created_by`,`updated_by`,`created_at`,`updated_at`,`deleted_at`) values (7,0,2,0,5,'P-24-MBM-00001','Pen',10.00,100,'5.00',5,0,0,0,2,0,0,5,0,20,0,NULL,1313,1313,1313,1313,1313,1313,1313,'approved',1,5,'2024-03-18 12:01:19','2024-03-19 12:29:51',NULL),(8,0,2,0,2,'P-24-MBM-00008','Ink',10.00,100,'5.00',5,0,0,0,2,0,0,5,0,20,0,NULL,1313,1313,1313,1313,1313,1313,1313,'approved',1,5,'2024-03-18 12:02:25','2024-03-19 12:29:51',NULL);

/*Table structure for table `products_supplier` */

DROP TABLE IF EXISTS `products_supplier`;

CREATE TABLE `products_supplier` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `supplier_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_supplier_product_id_foreign` (`product_id`),
  KEY `products_supplier_supplier_id_foreign` (`supplier_id`),
  CONSTRAINT `products_supplier_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `products_supplier_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `products_supplier` */

insert  into `products_supplier`(`id`,`product_id`,`supplier_id`,`created_at`,`updated_at`) values (7,7,1,NULL,NULL),(8,8,1,NULL,NULL);

/*Table structure for table `profit_centres` */

DROP TABLE IF EXISTS `profit_centres`;

CREATE TABLE `profit_centres` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `logo` text COLLATE utf8mb4_unicode_ci,
  `banner` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `profit_centres_company_id_foreign` (`company_id`),
  KEY `profit_centres_created_by_foreign` (`created_by`),
  KEY `profit_centres_updated_by_foreign` (`updated_by`),
  CONSTRAINT `profit_centres_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `profit_centres_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `profit_centres_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `profit_centres` */

insert  into `profit_centres`(`id`,`company_id`,`code`,`name`,`phone`,`email`,`address`,`logo`,`banner`,`created_by`,`updated_by`,`deleted_at`,`created_at`,`updated_at`) values (38,2,'SSLCBU1000','Banking and Financial Services','.','.','.',NULL,NULL,1,NULL,NULL,'2024-03-11 15:03:01','2024-03-11 15:03:01'),(39,2,'SSLCBU2000','Business Development','.','.','.',NULL,NULL,1,NULL,NULL,'2024-03-11 15:03:01','2024-03-11 15:03:01'),(40,2,'SSLCBU3000','BD-mVAS','.','.','.',NULL,NULL,1,NULL,NULL,'2024-03-11 15:03:01','2024-03-11 15:03:01'),(41,2,'SSLCBU4200','E Commerce Services','.','.','.',NULL,NULL,1,NULL,NULL,'2024-03-11 15:03:01','2024-03-11 15:03:01'),(42,2,'SSLCBU5000','Government Project','.','.','.',NULL,NULL,1,NULL,NULL,'2024-03-11 15:03:01','2024-03-11 15:03:01'),(43,5,'SSLBU1000','Banking and Financial Services','.','.','.',NULL,NULL,1,NULL,NULL,'2024-03-11 15:03:01','2024-03-11 15:03:01'),(44,5,'SSLBU2000','Business Development','.','.','.',NULL,NULL,1,NULL,NULL,'2024-03-11 15:03:01','2024-03-11 15:03:01'),(45,5,'SSLBU3000','BD-mVAS','.','.','.',NULL,NULL,1,NULL,NULL,'2024-03-11 15:03:01','2024-03-11 15:03:01'),(46,5,'SSLBU4200','E Commerce Services','.','.','.',NULL,NULL,1,NULL,NULL,'2024-03-11 15:03:01','2024-03-11 15:03:01'),(47,5,'SSLBU5000','Government Project','.','.','.',NULL,NULL,1,NULL,NULL,'2024-03-11 15:03:01','2024-03-11 15:03:01'),(48,9,'NGABU1000','Banking and Financial Services','.','.','.',NULL,NULL,1,NULL,NULL,'2024-03-11 15:03:01','2024-03-11 15:03:01'),(49,9,'NGABU2000','Business Development','.','.','.',NULL,NULL,1,NULL,NULL,'2024-03-11 15:03:01','2024-03-11 15:03:01'),(50,9,'NGABU3000','BD-mVAS','.','.','.',NULL,NULL,1,NULL,NULL,'2024-03-11 15:03:01','2024-03-11 15:03:01'),(51,9,'NGABU4200','E Commerce Services','.','.','.',NULL,NULL,1,NULL,NULL,'2024-03-11 15:03:01','2024-03-11 15:03:01'),(52,9,'NGABU5000','Government Project','.','.','.',NULL,NULL,1,NULL,NULL,'2024-03-11 15:03:01','2024-03-11 15:03:01'),(53,10,'CGLBU1000','Banking and Financial Services','.','.','.',NULL,NULL,1,NULL,NULL,'2024-03-11 15:03:01','2024-03-11 15:03:01'),(54,10,'CGLBU2000','Business Development','.','.','.',NULL,NULL,1,NULL,NULL,'2024-03-11 15:03:01','2024-03-11 15:03:01'),(55,10,'CGLBU3000','BD-mVAS','.','.','.',NULL,NULL,1,NULL,NULL,'2024-03-11 15:03:01','2024-03-11 15:03:01'),(56,10,'CGLBU4200','E Commerce Services','.','.','.',NULL,NULL,1,NULL,NULL,'2024-03-11 15:03:01','2024-03-11 15:03:01'),(57,10,'CGLBU5000','Government Project','.','.','.',NULL,NULL,1,NULL,NULL,'2024-03-11 15:03:01','2024-03-11 15:03:01'),(58,11,'OILBU1000','Banking and Financial Services','.','.','.',NULL,NULL,1,NULL,NULL,'2024-03-11 15:03:01','2024-03-11 15:03:01'),(59,11,'OILBU2000','Business Development','.','.','.',NULL,NULL,1,NULL,NULL,'2024-03-11 15:03:01','2024-03-11 15:03:01'),(60,11,'OILBU3000','BD-mVAS','.','.','.',NULL,NULL,1,NULL,NULL,'2024-03-11 15:03:01','2024-03-11 15:03:01'),(61,11,'OILBU4200','E Commerce Services','.','.','.',NULL,NULL,1,NULL,NULL,'2024-03-11 15:03:01','2024-03-11 15:03:01'),(62,11,'OILBU5000','Government Project','.','.','.',NULL,NULL,1,NULL,NULL,'2024-03-11 15:03:01','2024-03-11 15:03:01'),(63,12,'OTLBU1000','Banking and Financial Services','.','.','.',NULL,NULL,1,NULL,NULL,'2024-03-11 15:03:01','2024-03-11 15:03:01'),(64,12,'OTLBU2000','Business Development','.','.','.',NULL,NULL,1,NULL,NULL,'2024-03-11 15:03:01','2024-03-11 15:03:01'),(65,12,'OTLBU3000','BD-mVAS','.','.','.',NULL,NULL,1,NULL,NULL,'2024-03-11 15:03:01','2024-03-11 15:03:01'),(66,12,'OTLBU4200','E Commerce Services','.','.','.',NULL,NULL,1,NULL,NULL,'2024-03-11 15:03:01','2024-03-11 15:03:01'),(67,12,'OTLBU5000','Government Project','.','.','.',NULL,NULL,1,NULL,NULL,'2024-03-11 15:03:01','2024-03-11 15:03:01');

/*Table structure for table `program_project_types` */

DROP TABLE IF EXISTS `program_project_types`;

CREATE TABLE `program_project_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `program_id` bigint(20) unsigned NOT NULL,
  `project_type_id` bigint(20) unsigned NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `program_project_types_program_id_foreign` (`program_id`),
  KEY `program_project_types_project_type_id_foreign` (`project_type_id`),
  CONSTRAINT `program_project_types_program_id_foreign` FOREIGN KEY (`program_id`) REFERENCES `programs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `program_project_types_project_type_id_foreign` FOREIGN KEY (`project_type_id`) REFERENCES `project_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `program_project_types` */

/*Table structure for table `programs` */

DROP TABLE IF EXISTS `programs`;

CREATE TABLE `programs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `portfolio_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` longtext COLLATE utf8mb4_unicode_ci,
  `start_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `budget` double NOT NULL DEFAULT '0',
  `weightage` int(11) NOT NULL,
  `status_at` double NOT NULL DEFAULT '0' COMMENT 'This field will show at percentage value',
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `programs_portfolio_id_foreign` (`portfolio_id`),
  CONSTRAINT `programs_portfolio_id_foreign` FOREIGN KEY (`portfolio_id`) REFERENCES `portfolios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `programs` */

/*Table structure for table `project_boards` */

DROP TABLE IF EXISTS `project_boards`;

CREATE TABLE `project_boards` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` bigint(20) unsigned NOT NULL,
  `member_id` bigint(20) unsigned NOT NULL,
  `is_approved` int(11) NOT NULL DEFAULT '0',
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_boards_project_id_foreign` (`project_id`),
  KEY `project_boards_member_id_foreign` (`member_id`),
  CONSTRAINT `project_boards_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `project_boards_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `project_boards` */

/*Table structure for table `project_goal_achievements` */

DROP TABLE IF EXISTS `project_goal_achievements`;

CREATE TABLE `project_goal_achievements` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `project_goal_id` bigint(20) unsigned NOT NULL,
  `reviewer_id` bigint(20) unsigned NOT NULL,
  `achievement` text COLLATE utf8mb4_unicode_ci,
  `ratings` decimal(8,2) NOT NULL DEFAULT '0.00',
  `reviews` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_goal_achievements_project_goal_id_foreign` (`project_goal_id`),
  KEY `project_goal_achievements_reviewer_id_foreign` (`reviewer_id`),
  CONSTRAINT `project_goal_achievements_project_goal_id_foreign` FOREIGN KEY (`project_goal_id`) REFERENCES `project_goals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `project_goal_achievements` */

/*Table structure for table `project_goals` */

DROP TABLE IF EXISTS `project_goals`;

CREATE TABLE `project_goals` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` bigint(20) unsigned NOT NULL,
  `goal` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `expectation` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_goals_project_id_foreign` (`project_id`),
  CONSTRAINT `project_goals_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `project_goals` */

/*Table structure for table `project_holidays` */

DROP TABLE IF EXISTS `project_holidays`;

CREATE TABLE `project_holidays` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` bigint(20) unsigned NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `from` date NOT NULL,
  `to` date NOT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_holidays_project_id_foreign` (`project_id`),
  CONSTRAINT `project_holidays_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `project_holidays` */

/*Table structure for table `project_objectives` */

DROP TABLE IF EXISTS `project_objectives`;

CREATE TABLE `project_objectives` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) DEFAULT '1',
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `project_objectives` */

/*Table structure for table `project_scopes` */

DROP TABLE IF EXISTS `project_scopes`;

CREATE TABLE `project_scopes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` bigint(20) unsigned NOT NULL,
  `scope` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_scopes_project_id_foreign` (`project_id`),
  CONSTRAINT `project_scopes_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `project_scopes` */

/*Table structure for table `project_task_attachments` */

DROP TABLE IF EXISTS `project_task_attachments`;

CREATE TABLE `project_task_attachments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `project_task_id` bigint(20) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `attachment` text COLLATE utf8mb4_unicode_ci,
  `attachment_info` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_task_attachments_project_task_id_foreign` (`project_task_id`),
  CONSTRAINT `project_task_attachments_project_task_id_foreign` FOREIGN KEY (`project_task_id`) REFERENCES `project_tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `project_task_attachments` */

/*Table structure for table `project_task_changes` */

DROP TABLE IF EXISTS `project_task_changes`;

CREATE TABLE `project_task_changes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `project_task_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','processing','done','approved','halt') COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `initiate_time_line` datetime DEFAULT NULL,
  `end_time_line` datetime DEFAULT NULL,
  `remarks` longtext COLLATE utf8mb4_unicode_ci,
  `weightage` int(11) DEFAULT '0',
  `budget` int(11) DEFAULT '0',
  `change_status` enum('pending','approved','denied') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_task_changes_project_task_id_foreign` (`project_task_id`),
  CONSTRAINT `project_task_changes_project_task_id_foreign` FOREIGN KEY (`project_task_id`) REFERENCES `project_tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `project_task_changes` */

/*Table structure for table `project_tasks` */

DROP TABLE IF EXISTS `project_tasks`;

CREATE TABLE `project_tasks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned DEFAULT '0',
  `sub_deliverable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `serial` int(11) NOT NULL DEFAULT '0',
  `status` enum('pending','processing','done','approved','halt') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `hour` double NOT NULL,
  `initiate_time_line` datetime NOT NULL,
  `end_time_line` datetime NOT NULL,
  `remarks` longtext COLLATE utf8mb4_unicode_ci,
  `weightage` int(11) NOT NULL,
  `budget` bigint(20) NOT NULL DEFAULT '0',
  `is_parallel` int(11) NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_tasks_sub_deliverable_id_foreign` (`sub_deliverable_id`),
  KEY `project_tasks_user_id_foreign` (`user_id`),
  CONSTRAINT `project_tasks_sub_deliverable_id_foreign` FOREIGN KEY (`sub_deliverable_id`) REFERENCES `sub_deliverables` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `project_tasks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `project_tasks` */

/*Table structure for table `project_type` */

DROP TABLE IF EXISTS `project_type`;

CREATE TABLE `project_type` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `risks` text COLLATE utf8mb4_unicode_ci,
  `phases` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `project_type` */

insert  into `project_type`(`id`,`type`,`risks`,`phases`,`status`,`created_by`,`updated_by`,`created_at`,`updated_at`,`deleted_at`) values (1,'Trading','[\"Trading\",\"s\"]','[\"Research\",\"Design\",\"Development\",\"Implementation\",\"PMS\",\"PMD\",\"Budget\",\"Accounting\"]',1,'1','80','2022-07-01 19:11:56','2023-01-30 15:55:53',NULL),(2,'Manufacture','[\"Manufacture\"]','[\"Research\",\"Design\",\"Development\",\"Implementation\"]',1,'1','80','2022-07-01 19:12:11','2023-01-30 14:41:31',NULL),(3,'Automation','[\"Automation\"]','[\"Research\",\"Design\",\"Development\",\"Implementation\"]',1,'1','1','2022-07-01 19:12:25','2022-08-07 18:40:48',NULL),(4,'Infrastructure','[\"Budget\",\"Scope Changes\"]','[\"Research\",\"Design\",\"Development\",\"Implementation\"]',1,'1','1','2022-07-01 19:12:44','2022-08-07 18:40:42',NULL),(5,'Inhouse','[\"Cost Margination\"]','[\"Research\",\"Design\",\"Development\",\"Implementation\"]',1,'1','1','2022-07-01 19:12:44','2022-08-07 18:40:35',NULL),(6,'Contractual','[\"Cost Mergination\",\"Risk Management\"]','[\"Research\",\"Design\",\"Development\",\"Implementation\",\"PMS\",\"PMD\",\"Budget\",\"Accounting\"]',1,'1','80','2022-07-01 19:12:44','2022-10-31 15:09:28',NULL),(7,'Sewing Plant','[\"Approval from govt authority\",\"Construction related Accidents\",\"Machine Delivery delayed\",\"Supply chain Issues\"]','[\"Research\",\"Design\",\"Development\",\"Implementation\"]',1,'80','80','2022-07-27 18:25:49','2022-08-23 14:42:56',NULL),(8,'ERP','[\"Server Managment\",\"Bug & Issues\",\"Hack\"]','[\"Requirement Analysis\",\"Database Design\",\"Development\",\"UAT\",\"Deployment\",\"Procurement to Pay\",\"Inventory\",\"Finance & Accounting\",\"Asset Management\",\"Integration\"]',1,'80','1','2022-10-17 15:25:52','2023-12-17 09:01:34',NULL);

/*Table structure for table `project_working_days` */

DROP TABLE IF EXISTS `project_working_days`;

CREATE TABLE `project_working_days` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` bigint(20) unsigned NOT NULL,
  `day` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_working_days_project_id_foreign` (`project_id`),
  CONSTRAINT `project_working_days_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `project_working_days` */

/*Table structure for table `projects` */

DROP TABLE IF EXISTS `projects`;

CREATE TABLE `projects` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `final_asset_id` bigint(20) unsigned DEFAULT '0',
  `portfolio_id` bigint(20) unsigned DEFAULT '0',
  `program_id` bigint(20) unsigned DEFAULT '0',
  `sponsor_id` bigint(20) unsigned NOT NULL DEFAULT '1',
  `indent_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `work_location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_objective` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('waiting_for_submit','pending','approved','halt','planned','reapproval') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'waiting_for_submit',
  `project_weightage` int(11) NOT NULL DEFAULT '100',
  `items_dimension` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` longtext COLLATE utf8mb4_unicode_ci,
  `sponsors` longtext COLLATE utf8mb4_unicode_ci,
  `terms` longtext COLLATE utf8mb4_unicode_ci,
  `risk` longtext COLLATE utf8mb4_unicode_ci,
  `initial_start_date` date NOT NULL,
  `initial_end_date` date NOT NULL,
  `start_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `requisition_tolerance` double NOT NULL DEFAULT '5',
  `days_tolerance` int(11) NOT NULL DEFAULT '180',
  `status_at` double NOT NULL DEFAULT '0' COMMENT 'This field will show at percentage value',
  `approved_by` bigint(20) DEFAULT NULL,
  `assign_to` bigint(20) NOT NULL,
  `is_paused` int(11) NOT NULL DEFAULT '0',
  `is_closed` int(11) NOT NULL DEFAULT '0',
  `close_acknowledges` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `initial_budget` bigint(20) NOT NULL,
  `budget` bigint(20) NOT NULL DEFAULT '0',
  `department_id` int(11) unsigned DEFAULT NULL,
  `unit_id` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `projects_indent_no_unique` (`indent_no`),
  KEY `projects_sponsor_id_foreign` (`sponsor_id`),
  KEY `projects_department_id_foreign` (`department_id`),
  KEY `projects_unit_id_foreign` (`unit_id`),
  CONSTRAINT `projects_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `hr_department` (`hr_department_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `projects_sponsor_id_foreign` FOREIGN KEY (`sponsor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `projects_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `hr_unit` (`hr_unit_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `projects` */

/*Table structure for table `purchase_order_attachment` */

DROP TABLE IF EXISTS `purchase_order_attachment`;

CREATE TABLE `purchase_order_attachment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `purchase_order_id` bigint(20) unsigned NOT NULL,
  `goods_received_note_id` bigint(20) unsigned DEFAULT NULL,
  `bill_amount` decimal(10,2) DEFAULT '0.00',
  `bill_type` enum('po','grn') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'po',
  `bill_number` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','approved','halt') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `invoice_file` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat_challan_file` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_order_attachment_purchase_order_id_foreign` (`purchase_order_id`),
  KEY `purchase_order_attachment_created_by_foreign` (`created_by`),
  KEY `purchase_order_attachment_updated_by_foreign` (`updated_by`),
  KEY `purchase_order_attachment_goods_received_note_id_foreign` (`goods_received_note_id`),
  CONSTRAINT `purchase_order_attachment_purchase_order_id_foreign` FOREIGN KEY (`purchase_order_id`) REFERENCES `purchase_orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `purchase_order_attachment` */

/*Table structure for table `purchase_order_entries` */

DROP TABLE IF EXISTS `purchase_order_entries`;

CREATE TABLE `purchase_order_entries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `supplier_id` bigint(20) unsigned DEFAULT '0',
  `purchase_order_id` bigint(20) unsigned NOT NULL,
  `type` enum('grn','supplier-payment','product-delivery','bill-approval','advance','advance-clearing','asset-cost-entry','cwip-to-asset','currency-gain','currency-loss') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'grn',
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `entry_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_order_entries_purchase_order_id_foreign` (`purchase_order_id`),
  KEY `purchase_order_entries_entry_id_foreign` (`entry_id`),
  CONSTRAINT `purchase_order_entries_entry_id_foreign` FOREIGN KEY (`entry_id`) REFERENCES `entries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchase_order_entries_purchase_order_id_foreign` FOREIGN KEY (`purchase_order_id`) REFERENCES `purchase_orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `purchase_order_entries` */

/*Table structure for table `purchase_order_items` */

DROP TABLE IF EXISTS `purchase_order_items`;

CREATE TABLE `purchase_order_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `po_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `unit_price` decimal(65,0) NOT NULL,
  `qty` decimal(65,0) NOT NULL,
  `sub_total_price` decimal(65,0) NOT NULL,
  `discount_percentage` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `discount` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `vat_percentage` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `vat` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `total_price` decimal(65,0) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_order_items_po_id_foreign` (`po_id`),
  KEY `purchase_order_items_product_id_foreign` (`product_id`),
  CONSTRAINT `purchase_order_items_po_id_foreign` FOREIGN KEY (`po_id`) REFERENCES `purchase_orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchase_order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `purchase_order_items` */

insert  into `purchase_order_items`(`id`,`po_id`,`product_id`,`unit_price`,`qty`,`sub_total_price`,`discount_percentage`,`discount`,`vat_percentage`,`vat`,`total_price`,`created_at`,`updated_at`,`deleted_at`) values (3,2,7,10,10,100,'0','0','5','5',105,'2024-03-19 12:29:51','2024-03-19 12:29:51',NULL),(4,2,8,10,10,100,'0','0','5','5',105,'2024-03-19 12:29:51','2024-03-19 12:29:51',NULL);

/*Table structure for table `purchase_order_requisitions` */

DROP TABLE IF EXISTS `purchase_order_requisitions`;

CREATE TABLE `purchase_order_requisitions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `purchase_order_id` bigint(20) unsigned NOT NULL,
  `requisition_id` bigint(20) unsigned NOT NULL,
  `hr_department_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_order_requisitions_purchase_order_id_foreign` (`purchase_order_id`),
  KEY `purchase_order_requisitions_requisition_id_foreign` (`requisition_id`),
  CONSTRAINT `purchase_order_requisitions_purchase_order_id_foreign` FOREIGN KEY (`purchase_order_id`) REFERENCES `purchase_orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchase_order_requisitions_requisition_id_foreign` FOREIGN KEY (`requisition_id`) REFERENCES `requisitions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `purchase_order_requisitions` */

insert  into `purchase_order_requisitions`(`id`,`purchase_order_id`,`requisition_id`,`hr_department_id`,`created_at`,`updated_at`,`deleted_at`) values (2,2,2,0,'2024-03-19 12:29:51','2024-03-19 12:29:51',NULL);

/*Table structure for table `purchase_orders` */

DROP TABLE IF EXISTS `purchase_orders`;

CREATE TABLE `purchase_orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `quotation_id` bigint(20) unsigned NOT NULL,
  `hr_unit_id` int(10) unsigned DEFAULT NULL,
  `cost_centre_id` bigint(20) unsigned NOT NULL DEFAULT '2',
  `reference_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `po_date` datetime NOT NULL,
  `total_price` double NOT NULL,
  `discount_percentage` double NOT NULL DEFAULT '0',
  `discount` double NOT NULL,
  `vat_percentage` double NOT NULL DEFAULT '0',
  `vat` double NOT NULL,
  `gross_price` double NOT NULL,
  `remarks` longtext COLLATE utf8mb4_unicode_ci,
  `terms` longtext COLLATE utf8mb4_unicode_ci,
  `is_send` enum('yes','no','halt') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `is_closed` int(11) NOT NULL DEFAULT '0',
  `revise_count` int(11) DEFAULT NULL,
  `closing_remarks` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cash_status` enum('pending','approved','halt') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `cash_note` text COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_orders_quotation_id_foreign` (`quotation_id`),
  KEY `purchase_orders_hr_unit_id_foreign` (`hr_unit_id`),
  KEY `purchase_orders_cost_centre_id_foreign` (`cost_centre_id`),
  CONSTRAINT `purchase_orders_cost_centre_id_foreign` FOREIGN KEY (`cost_centre_id`) REFERENCES `cost_centres` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchase_orders_hr_unit_id_foreign` FOREIGN KEY (`hr_unit_id`) REFERENCES `hr_unit` (`hr_unit_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchase_orders_quotation_id_foreign` FOREIGN KEY (`quotation_id`) REFERENCES `quotations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `purchase_orders` */

insert  into `purchase_orders`(`id`,`quotation_id`,`hr_unit_id`,`cost_centre_id`,`reference_no`,`po_date`,`total_price`,`discount_percentage`,`discount`,`vat_percentage`,`vat`,`gross_price`,`remarks`,`terms`,`is_send`,`is_closed`,`revise_count`,`closing_remarks`,`created_by`,`updated_by`,`created_at`,`updated_at`,`cash_status`,`cash_note`,`deleted_at`) values (2,2,1,1007,'PO-24-SSL-000001','2024-03-19 00:00:00',200,0,0,0,10,210,NULL,'<p>.</p>','yes',0,NULL,NULL,5,5,'2024-03-19 12:29:51','2024-03-19 12:29:55','pending',NULL,NULL);

/*Table structure for table `purchase_return_gate_outs` */

DROP TABLE IF EXISTS `purchase_return_gate_outs`;

CREATE TABLE `purchase_return_gate_outs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `purchase_return_id` bigint(20) unsigned NOT NULL,
  `batch` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `qty` int(11) NOT NULL DEFAULT '0',
  `get_out_file` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_return_gate_outs_created_by_foreign` (`created_by`),
  KEY `purchase_return_gate_outs_updated_by_foreign` (`updated_by`),
  KEY `purchase_return_gate_outs_purchase_return_id_foreign` (`purchase_return_id`),
  CONSTRAINT `purchase_return_gate_outs_purchase_return_id_foreign` FOREIGN KEY (`purchase_return_id`) REFERENCES `purchase_returns` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `purchase_return_gate_outs` */

/*Table structure for table `purchase_returns` */

DROP TABLE IF EXISTS `purchase_returns`;

CREATE TABLE `purchase_returns` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `goods_received_item_id` bigint(20) unsigned NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `return_note` text COLLATE utf8mb4_unicode_ci,
  `return_qty` int(10) unsigned NOT NULL DEFAULT '0',
  `received_qty` int(20) NOT NULL DEFAULT '0',
  `status` enum('return','return-change','received') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_returns_created_by_foreign` (`created_by`),
  KEY `purchase_returns_updated_by_foreign` (`updated_by`),
  KEY `purchase_returns_goods_received_item_id_foreign` (`goods_received_item_id`),
  CONSTRAINT `purchase_returns_goods_received_item_id_foreign` FOREIGN KEY (`goods_received_item_id`) REFERENCES `goods_received_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `purchase_returns` */

/*Table structure for table `quotation_histories` */

DROP TABLE IF EXISTS `quotation_histories`;

CREATE TABLE `quotation_histories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `quotation_id` bigint(20) unsigned NOT NULL,
  `supplier_payment_terms_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `quotation_date` datetime NOT NULL,
  `exchange_rate_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `total_price` double NOT NULL DEFAULT '0',
  `discount` double NOT NULL DEFAULT '0',
  `vat` double NOT NULL DEFAULT '0',
  `gross_price` double NOT NULL DEFAULT '0',
  `status` enum('active','inactive','cancel') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('manual','online','direct-purchase') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'manual',
  `quotation_file` text COLLATE utf8mb4_unicode_ci,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `note` text COLLATE utf8mb4_unicode_ci,
  `delivery_date` date DEFAULT NULL,
  `technical_specification_file` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quotation_histories_quotation_id_foreign` (`quotation_id`),
  KEY `quotation_histories_created_by_foreign` (`created_by`),
  KEY `quotation_histories_updated_by_foreign` (`updated_by`),
  CONSTRAINT `quotation_histories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `quotation_histories_quotation_id_foreign` FOREIGN KEY (`quotation_id`) REFERENCES `quotations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `quotation_histories_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `quotation_histories` */

/*Table structure for table `quotation_history_items` */

DROP TABLE IF EXISTS `quotation_history_items`;

CREATE TABLE `quotation_history_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `quotation_history_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `unit_price` double NOT NULL DEFAULT '0',
  `qty` double NOT NULL DEFAULT '0',
  `sub_total_price` double NOT NULL DEFAULT '0',
  `discount` double NOT NULL DEFAULT '0',
  `discount_amount` double NOT NULL DEFAULT '0',
  `vat_percentage` double NOT NULL DEFAULT '0',
  `vat` double NOT NULL DEFAULT '0',
  `total_price` double NOT NULL DEFAULT '0',
  `technical_specification_file` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quotation_history_items_quotation_history_id_foreign` (`quotation_history_id`),
  KEY `quotation_history_items_created_by_foreign` (`created_by`),
  KEY `quotation_history_items_updated_by_foreign` (`updated_by`),
  CONSTRAINT `quotation_history_items_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `quotation_history_items_quotation_history_id_foreign` FOREIGN KEY (`quotation_history_id`) REFERENCES `quotation_histories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `quotation_history_items_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `quotation_history_items` */

/*Table structure for table `quotations` */

DROP TABLE IF EXISTS `quotations`;

CREATE TABLE `quotations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `supplier_id` bigint(20) unsigned NOT NULL,
  `request_proposal_id` bigint(20) unsigned NOT NULL,
  `supplier_payment_terms_id` bigint(20) unsigned DEFAULT NULL,
  `reference_no` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quotation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `exchange_rate_id` bigint(20) unsigned NOT NULL DEFAULT '3',
  `total_price` double NOT NULL DEFAULT '0',
  `discount` double NOT NULL DEFAULT '0',
  `vat` double NOT NULL DEFAULT '0',
  `gross_price` double NOT NULL DEFAULT '0',
  `status` enum('active','inactive','cancel') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('manual','online','direct-purchase') COLLATE utf8mb4_unicode_ci DEFAULT 'manual',
  `recommendation` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `is_approved` enum('pending','processing','approved','halt','pre-processing') COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `is_po_generate` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `quotation_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `technical_specification_file` text COLLATE utf8mb4_unicode_ci,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `note` text COLLATE utf8mb4_unicode_ci,
  `delivery_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `quotations_reference_no_unique` (`reference_no`),
  KEY `quotations_created_by_foreign` (`created_by`),
  KEY `quotations_updated_by_foreign` (`updated_by`),
  KEY `quotations_supplier_id_foreign` (`supplier_id`),
  KEY `quotations_request_proposal_id_foreign` (`request_proposal_id`),
  KEY `quotations_supplier_payment_terms_id_foreign` (`supplier_payment_terms_id`),
  KEY `quotations_exchange_rate_id_foreign` (`exchange_rate_id`),
  CONSTRAINT `quotations_exchange_rate_id_foreign` FOREIGN KEY (`exchange_rate_id`) REFERENCES `exchange_rates` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `quotations_request_proposal_id_foreign` FOREIGN KEY (`request_proposal_id`) REFERENCES `request_proposals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `quotations_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `quotations` */

insert  into `quotations`(`id`,`supplier_id`,`request_proposal_id`,`supplier_payment_terms_id`,`reference_no`,`quotation_date`,`exchange_rate_id`,`total_price`,`discount`,`vat`,`gross_price`,`status`,`type`,`recommendation`,`is_approved`,`is_po_generate`,`quotation_file`,`technical_specification_file`,`remarks`,`note`,`delivery_date`,`created_by`,`updated_by`,`deleted_at`,`created_at`,`updated_at`) values (2,1,2,1,'QG-24-SSL-00001','2024-03-19 00:00:00',1,200,0,10,210,'active','manual','yes','approved','no',NULL,NULL,NULL,NULL,'2024-03-19',5,7,NULL,'2024-03-19 12:28:46','2024-03-19 12:29:19');

/*Table structure for table `quotations_items` */

DROP TABLE IF EXISTS `quotations_items`;

CREATE TABLE `quotations_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `quotation_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `unit_price` double NOT NULL DEFAULT '0',
  `qty` int(10) unsigned NOT NULL DEFAULT '0',
  `sub_total_price` double NOT NULL DEFAULT '0',
  `discount` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `discount_amount` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `vat_percentage` double NOT NULL DEFAULT '0',
  `vat` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `total_price` double NOT NULL DEFAULT '0' COMMENT 'total_price=(subtotal-discount)+vat',
  `technical_specification_file` text COLLATE utf8mb4_unicode_ci,
  `is_approved` enum('pending','processing','approved','halt','pre-processing') COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `approved_qty` int(11) NOT NULL DEFAULT '0',
  `is_po_generate` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quotations_items_quotation_id_foreign` (`quotation_id`),
  KEY `quotations_items_product_id_foreign` (`product_id`),
  CONSTRAINT `quotations_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `quotations_items_quotation_id_foreign` FOREIGN KEY (`quotation_id`) REFERENCES `quotations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `quotations_items` */

insert  into `quotations_items`(`id`,`quotation_id`,`product_id`,`unit_price`,`qty`,`sub_total_price`,`discount`,`discount_amount`,`vat_percentage`,`vat`,`total_price`,`technical_specification_file`,`is_approved`,`approved_qty`,`is_po_generate`,`created_at`,`updated_at`,`deleted_at`) values (3,2,7,10,10,100,'0','0.00',5,'5.00',105,NULL,'approved',10,'yes','2024-03-19 12:28:00','2024-03-19 12:29:51',NULL),(4,2,8,10,10,100,'0','0.00',5,'5.00',105,NULL,'approved',10,'yes','2024-03-19 12:28:00','2024-03-19 12:29:51',NULL);

/*Table structure for table `request_proposal_define_suppliers` */

DROP TABLE IF EXISTS `request_proposal_define_suppliers`;

CREATE TABLE `request_proposal_define_suppliers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `request_proposal_id` bigint(20) unsigned NOT NULL,
  `supplier_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `request_proposal_define_suppliers_request_proposal_id_foreign` (`request_proposal_id`),
  KEY `request_proposal_define_suppliers_supplier_id_foreign` (`supplier_id`),
  CONSTRAINT `request_proposal_define_suppliers_request_proposal_id_foreign` FOREIGN KEY (`request_proposal_id`) REFERENCES `request_proposals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `request_proposal_define_suppliers_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `request_proposal_define_suppliers` */

insert  into `request_proposal_define_suppliers`(`id`,`request_proposal_id`,`supplier_id`,`created_at`,`updated_at`) values (2,2,1,NULL,NULL);

/*Table structure for table `request_proposal_details` */

DROP TABLE IF EXISTS `request_proposal_details`;

CREATE TABLE `request_proposal_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `request_proposal_id` bigint(20) unsigned NOT NULL,
  `requisition_id` bigint(20) unsigned DEFAULT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `request_qty` int(10) NOT NULL DEFAULT '0',
  `qty` int(10) NOT NULL DEFAULT '0',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `request_proposal_details_request_proposal_id_foreign` (`request_proposal_id`),
  KEY `request_proposal_details_requisition_id_foreign` (`requisition_id`),
  KEY `request_proposal_details_product_id_foreign` (`product_id`),
  KEY `request_proposal_details_created_by_foreign` (`created_by`),
  KEY `request_proposal_details_updated_by_foreign` (`updated_by`),
  CONSTRAINT `request_proposal_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `request_proposal_details_request_proposal_id_foreign` FOREIGN KEY (`request_proposal_id`) REFERENCES `request_proposals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `request_proposal_details` */

insert  into `request_proposal_details`(`id`,`request_proposal_id`,`requisition_id`,`product_id`,`request_qty`,`qty`,`status`,`created_by`,`updated_by`,`deleted_at`,`created_at`,`updated_at`) values (3,2,NULL,7,10,10,'Active',5,NULL,NULL,'2024-03-19 12:28:00',NULL),(4,2,NULL,8,10,10,'Active',5,NULL,NULL,'2024-03-19 12:28:00',NULL);

/*Table structure for table `request_proposal_requisitions` */

DROP TABLE IF EXISTS `request_proposal_requisitions`;

CREATE TABLE `request_proposal_requisitions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `requisition_id` bigint(20) unsigned NOT NULL,
  `request_proposal_id` bigint(20) unsigned NOT NULL,
  `status` enum('active','inactive','cancel') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `request_proposal_requisitions_requisition_id_foreign` (`requisition_id`),
  KEY `request_proposal_requisitions_request_proposal_id_foreign` (`request_proposal_id`),
  CONSTRAINT `request_proposal_requisitions_request_proposal_id_foreign` FOREIGN KEY (`request_proposal_id`) REFERENCES `request_proposals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `request_proposal_requisitions_requisition_id_foreign` FOREIGN KEY (`requisition_id`) REFERENCES `requisitions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `request_proposal_requisitions` */

insert  into `request_proposal_requisitions`(`id`,`requisition_id`,`request_proposal_id`,`status`,`created_by`,`updated_by`,`created_at`,`updated_at`) values (2,2,2,'active',5,NULL,'2024-03-19 12:28:32','2024-03-19 12:28:32');

/*Table structure for table `request_proposal_tracking` */

DROP TABLE IF EXISTS `request_proposal_tracking`;

CREATE TABLE `request_proposal_tracking` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `request_proposal_id` bigint(20) unsigned NOT NULL,
  `status` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `request_proposal_tracking_request_proposal_id_foreign` (`request_proposal_id`),
  CONSTRAINT `request_proposal_tracking_request_proposal_id_foreign` FOREIGN KEY (`request_proposal_id`) REFERENCES `request_proposals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `request_proposal_tracking` */

insert  into `request_proposal_tracking`(`id`,`request_proposal_id`,`status`,`note`,`created_by`,`updated_by`,`created_at`,`updated_at`,`deleted_at`) values (2,2,'RFP','','5',NULL,'2024-03-19 12:28:32','2024-03-19 12:28:32',NULL);

/*Table structure for table `request_proposals` */

DROP TABLE IF EXISTS `request_proposals`;

CREATE TABLE `request_proposals` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `type` enum('manual','online','direct-purchase') COLLATE utf8mb4_unicode_ci DEFAULT 'manual',
  `quotation_generate_type` enum('incomplete','complete') COLLATE utf8mb4_unicode_ci DEFAULT 'incomplete',
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `request_proposals_reference_no_unique` (`reference_no`),
  KEY `request_proposals_created_by_foreign` (`created_by`),
  KEY `request_proposals_updated_by_foreign` (`updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `request_proposals` */

insert  into `request_proposals`(`id`,`reference_no`,`request_date`,`remarks`,`status`,`type`,`quotation_generate_type`,`created_by`,`updated_by`,`deleted_at`,`created_at`,`updated_at`) values (2,'RP-24-GRP-00001','2024-03-19 00:00:00',NULL,'Active','manual','incomplete',5,NULL,NULL,'2024-03-19 12:28:32','2024-03-19 12:28:32');

/*Table structure for table `requirements` */

DROP TABLE IF EXISTS `requirements`;

CREATE TABLE `requirements` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `requirements_created_by_foreign` (`created_by`),
  KEY `requirements_updated_by_foreign` (`updated_by`),
  CONSTRAINT `requirements_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `requirements_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `requirements` */

insert  into `requirements`(`id`,`code`,`name`,`description`,`created_by`,`updated_by`,`deleted_at`,`created_at`,`updated_at`) values (6,'01','Upload/Download','Upload/Download',1,NULL,NULL,'2024-03-11 15:37:30','2024-03-11 15:37:30'),(7,'02','Reconciliation','Reconciliation',1,NULL,NULL,'2024-03-11 15:37:36','2024-03-11 15:37:36'),(8,'03','Authorization','Authorization',1,NULL,NULL,'2024-03-11 15:37:41','2024-03-11 15:37:41'),(9,'04','Calculation','Calculation',1,NULL,NULL,'2024-03-11 15:37:46','2024-03-11 15:37:46'),(10,'05','Accounting entry','Accounting entry',1,NULL,NULL,'2024-03-11 15:37:51','2024-03-11 15:37:51');

/*Table structure for table `requisition_deliveries` */

DROP TABLE IF EXISTS `requisition_deliveries`;

CREATE TABLE `requisition_deliveries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `requisition_id` bigint(20) unsigned NOT NULL,
  `reference_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_by` bigint(20) unsigned NOT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `requisition_deliveries_requisition_id_foreign` (`requisition_id`),
  KEY `requisition_deliveries_created_by_foreign` (`created_by`),
  KEY `requisition_deliveries_updated_by_foreign` (`updated_by`),
  KEY `requisition_deliveries_delivery_by_foreign` (`delivery_by`),
  CONSTRAINT `requisition_deliveries_requisition_id_foreign` FOREIGN KEY (`requisition_id`) REFERENCES `requisitions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `requisition_deliveries` */

insert  into `requisition_deliveries`(`id`,`requisition_id`,`reference_no`,`delivery_date`,`note`,`delivery_by`,`created_by`,`updated_by`,`deleted_at`,`created_at`,`updated_at`) values (18,2,'CD-24-MBM-0001','2024-03-19 00:00:00',NULL,6,6,NULL,NULL,'2024-03-19 12:32:08','2024-03-19 12:32:08'),(19,2,'CD-24-MBM-0019','2024-03-19 00:00:00',NULL,6,6,NULL,NULL,'2024-03-19 12:32:47','2024-03-19 12:32:47'),(20,2,'CD-24-MBM-0020','2024-03-19 00:00:00',NULL,6,6,NULL,NULL,'2024-03-19 12:34:18','2024-03-19 12:34:18');

/*Table structure for table `requisition_delivery_items` */

DROP TABLE IF EXISTS `requisition_delivery_items`;

CREATE TABLE `requisition_delivery_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `requisition_delivery_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `warehouse_id` bigint(20) unsigned DEFAULT NULL,
  `delivery_qty` decimal(8,2) NOT NULL DEFAULT '0.00',
  `status` enum('pending','acknowledge','delivered') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_by` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `requisition_delivery_items_requisition_delivery_id_foreign` (`requisition_delivery_id`),
  KEY `requisition_delivery_items_product_id_foreign` (`product_id`),
  KEY `requisition_delivery_items_warehouse_id_foreign` (`warehouse_id`),
  CONSTRAINT `requisition_delivery_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `requisition_delivery_items_requisition_delivery_id_foreign` FOREIGN KEY (`requisition_delivery_id`) REFERENCES `requisition_deliveries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `requisition_delivery_items_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `requisition_delivery_items` */

insert  into `requisition_delivery_items`(`id`,`requisition_delivery_id`,`product_id`,`warehouse_id`,`delivery_qty`,`status`,`deleted_at`,`created_by`,`created_at`,`updated_by`,`updated_at`) values (14,18,7,10,8.00,'pending',NULL,'6','2024-03-19 12:32:08',NULL,'2024-03-19 12:32:08'),(15,19,7,10,0.50,'pending',NULL,'6','2024-03-19 12:32:47',NULL,'2024-03-19 12:32:47'),(16,20,7,10,0.25,'pending',NULL,'6','2024-03-19 12:34:18',NULL,'2024-03-19 12:34:18');

/*Table structure for table `requisition_explanations` */

DROP TABLE IF EXISTS `requisition_explanations`;

CREATE TABLE `requisition_explanations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `explanation` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `requisition_explanations_created_by_foreign` (`created_by`),
  KEY `requisition_explanations_updated_by_foreign` (`updated_by`),
  CONSTRAINT `requisition_explanations_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `requisition_explanations_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `requisition_explanations` */

/*Table structure for table `requisition_item_logs` */

DROP TABLE IF EXISTS `requisition_item_logs`;

CREATE TABLE `requisition_item_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `requisition_log_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `requisition_qty` double DEFAULT NULL,
  `delivery_qty` double DEFAULT NULL,
  `purchase_qty` double DEFAULT NULL,
  `qc_qty` double DEFAULT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci,
  `is_send` text COLLATE utf8mb4_unicode_ci,
  `po_generate` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `requisition_item_logs_requisition_log_id_foreign` (`requisition_log_id`),
  KEY `requisition_item_logs_created_by_foreign` (`created_by`),
  KEY `requisition_item_logs_updated_by_foreign` (`updated_by`),
  CONSTRAINT `requisition_item_logs_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `requisition_item_logs_requisition_log_id_foreign` FOREIGN KEY (`requisition_log_id`) REFERENCES `requisition_logs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `requisition_item_logs_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `requisition_item_logs` */

/*Table structure for table `requisition_items` */

DROP TABLE IF EXISTS `requisition_items`;

CREATE TABLE `requisition_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `requisition_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `qty` double NOT NULL,
  `requisition_qty` decimal(10,2) NOT NULL DEFAULT '0.00',
  `delivery_qty` double DEFAULT '0',
  `purchase_qty` double DEFAULT '0',
  `qc_qty` double DEFAULT '0',
  `comment` longtext COLLATE utf8mb4_unicode_ci,
  `is_send` enum('no','yes') COLLATE utf8mb4_unicode_ci DEFAULT 'no',
  `po_generate` enum('no','yes','','') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `requisition_items_requisition_id_foreign` (`requisition_id`),
  KEY `requisition_items_product_id_foreign` (`product_id`),
  CONSTRAINT `requisition_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `requisition_items_requisition_id_foreign` FOREIGN KEY (`requisition_id`) REFERENCES `requisitions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `requisition_items` */

insert  into `requisition_items`(`id`,`requisition_id`,`product_id`,`qty`,`requisition_qty`,`delivery_qty`,`purchase_qty`,`qc_qty`,`comment`,`is_send`,`po_generate`,`created_at`,`updated_at`,`created_by`,`updated_by`,`deleted_at`) values (3,2,7,10,10.00,8.75,10,10,NULL,'yes','yes','2024-03-19 12:13:00','2024-03-19 12:34:18',4,6,NULL),(4,2,8,10,10.00,0,10,10,NULL,'yes','yes','2024-03-19 12:13:00','2024-03-19 12:30:55',4,6,NULL);

/*Table structure for table `requisition_logs` */

DROP TABLE IF EXISTS `requisition_logs`;

CREATE TABLE `requisition_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `requisition_id` bigint(20) unsigned NOT NULL,
  `reference_no` text COLLATE utf8mb4_unicode_ci,
  `requisition_date` text COLLATE utf8mb4_unicode_ci,
  `author_id` bigint(20) unsigned DEFAULT NULL,
  `project_id` bigint(20) unsigned DEFAULT NULL,
  `deliverable_id` bigint(20) unsigned DEFAULT NULL,
  `project_task_id` bigint(20) unsigned DEFAULT NULL,
  `hr_unit_id` int(11) DEFAULT NULL,
  `requisition` text COLLATE utf8mb4_unicode_ci,
  `status` text COLLATE utf8mb4_unicode_ci,
  `is_passed` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `passed_by` bigint(20) unsigned NOT NULL DEFAULT '0',
  `approved_id` int(11) DEFAULT NULL,
  `is_send_to_rfp` text COLLATE utf8mb4_unicode_ci,
  `delivery_status` text COLLATE utf8mb4_unicode_ci,
  `request_status` text COLLATE utf8mb4_unicode_ci,
  `is_po_generate` text COLLATE utf8mb4_unicode_ci,
  `explanations` text COLLATE utf8mb4_unicode_ci,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `delivery_note` text COLLATE utf8mb4_unicode_ci,
  `admin_remark` text COLLATE utf8mb4_unicode_ci,
  `attachment` text COLLATE utf8mb4_unicode_ci,
  `approved_by` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `requisition_logs_requisition_id_foreign` (`requisition_id`),
  KEY `requisition_logs_created_by_foreign` (`created_by`),
  KEY `requisition_logs_updated_by_foreign` (`updated_by`),
  CONSTRAINT `requisition_logs_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `requisition_logs_requisition_id_foreign` FOREIGN KEY (`requisition_id`) REFERENCES `requisitions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `requisition_logs_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `requisition_logs` */

/*Table structure for table `requisition_note_logs` */

DROP TABLE IF EXISTS `requisition_note_logs`;

CREATE TABLE `requisition_note_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `requisition_id` bigint(20) unsigned NOT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `type` enum('requisition','department-head','store','purchase') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'requisition',
  `status` enum('active','inactive','cancel') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `requisition_note_logs_requisition_id_foreign` (`requisition_id`),
  CONSTRAINT `requisition_note_logs_requisition_id_foreign` FOREIGN KEY (`requisition_id`) REFERENCES `requisitions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `requisition_note_logs` */

insert  into `requisition_note_logs`(`id`,`requisition_id`,`notes`,`type`,`status`,`created_by`,`updated_by`,`created_at`,`updated_at`,`deleted_at`) values (2,2,'Urgent','requisition','active',4,NULL,'2024-03-19 12:13:30','2024-03-19 12:13:30',NULL);

/*Table structure for table `requisition_tracking` */

DROP TABLE IF EXISTS `requisition_tracking`;

CREATE TABLE `requisition_tracking` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `requisition_id` bigint(20) unsigned NOT NULL,
  `status` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `requisition_tracking_requisition_id_foreign` (`requisition_id`),
  CONSTRAINT `requisition_tracking_requisition_id_foreign` FOREIGN KEY (`requisition_id`) REFERENCES `requisitions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `requisition_tracking` */

insert  into `requisition_tracking`(`id`,`requisition_id`,`status`,`note`,`created_by`,`updated_by`,`created_at`,`updated_at`,`deleted_at`) values (19,2,'pending','','4',NULL,'2024-03-19 12:13:30','2024-03-19 12:13:30',NULL),(20,2,'pending','','4',NULL,'2024-03-19 12:13:35','2024-03-19 12:13:35',NULL),(21,2,'approved','','3',NULL,'2024-03-19 12:23:46','2024-03-19 12:23:46',NULL),(22,2,'processing','','6',NULL,'2024-03-19 12:27:52','2024-03-19 12:27:52',NULL),(23,2,'PO-Issue','','5',NULL,'2024-03-19 12:29:51','2024-03-19 12:29:51',NULL),(24,2,'delivered','','6',NULL,'2024-03-19 12:32:08','2024-03-19 12:32:08',NULL),(25,2,'delivered','','6',NULL,'2024-03-19 12:32:47','2024-03-19 12:32:47',NULL),(26,2,'delivered','','6',NULL,'2024-03-19 12:34:19','2024-03-19 12:34:19',NULL);

/*Table structure for table `requisition_types` */

DROP TABLE IF EXISTS `requisition_types`;

CREATE TABLE `requisition_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `requisition_types` */

/*Table structure for table `requisitions` */

DROP TABLE IF EXISTS `requisitions`;

CREATE TABLE `requisitions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `requisition_date` timestamp NULL DEFAULT NULL,
  `author_id` bigint(20) unsigned NOT NULL,
  `project_id` bigint(20) unsigned DEFAULT NULL,
  `deliverable_id` bigint(20) unsigned DEFAULT NULL,
  `project_task_id` bigint(20) unsigned DEFAULT '0',
  `hr_unit_id` int(10) unsigned DEFAULT NULL,
  `requisition` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '3' COMMENT '0 for pending, 1 for acknowledge, 2 for halt, 3 for draft',
  `is_passed` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `passed_by` bigint(20) unsigned NOT NULL DEFAULT '0',
  `approved_id` int(11) DEFAULT NULL,
  `is_send_to_rfp` enum('no','yes') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no' COMMENT 'Request for proposal',
  `delivery_status` enum('processing','confirmed','store','rfp','purchase','delivered','partial-delivered','received','delivery-failed','returned','failed','cancel') COLLATE utf8mb4_unicode_ci DEFAULT 'processing',
  `request_status` enum('rfp','send_rfp','rfp_ack') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_po_generate` enum('no','yes') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `explanations` longtext COLLATE utf8mb4_unicode_ci,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `delivery_note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_remark` text COLLATE utf8mb4_unicode_ci,
  `attachment` text COLLATE utf8mb4_unicode_ci,
  `resend_count` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `approved_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `requisitions_requisition_unique` (`requisition`),
  KEY `requisitions_project_id_foreign` (`project_id`),
  KEY `requisitions_approved_by_foreign` (`approved_by`),
  KEY `requisitions_author_id_foreign` (`author_id`),
  KEY `requisitions_hr_unit_id_foreign` (`hr_unit_id`),
  CONSTRAINT `requisitions_approved_by_foreign` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `requisitions_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `requisitions_hr_unit_id_foreign` FOREIGN KEY (`hr_unit_id`) REFERENCES `hr_unit` (`hr_unit_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `requisitions` */

insert  into `requisitions`(`id`,`reference_no`,`requisition_date`,`author_id`,`project_id`,`deliverable_id`,`project_task_id`,`hr_unit_id`,`requisition`,`status`,`is_passed`,`passed_by`,`approved_id`,`is_send_to_rfp`,`delivery_status`,`request_status`,`is_po_generate`,`explanations`,`remarks`,`delivery_note`,`admin_remark`,`attachment`,`resend_count`,`created_at`,`created_by`,`updated_at`,`updated_by`,`approved_by`,`deleted_at`) values (2,'RQ-24-SSL-000001','2024-03-19 12:13:00',4,NULL,NULL,NULL,1,'5682314079_ZUoa1710828810','1','no',0,1,'yes','partial-delivered',NULL,'no','[]','Urgent',NULL,NULL,NULL,0,'2024-03-19 12:13:30',4,'2024-03-19 12:32:08',6,3,NULL);

/*Table structure for table `return_change_faq` */

DROP TABLE IF EXISTS `return_change_faq`;

CREATE TABLE `return_change_faq` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `faq_id` bigint(20) unsigned DEFAULT NULL,
  `goods_received_item_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `return_change_faq_faq_id_foreign` (`faq_id`),
  KEY `return_change_faq_goods_received_item_id_foreign` (`goods_received_item_id`),
  CONSTRAINT `return_change_faq_faq_id_foreign` FOREIGN KEY (`faq_id`) REFERENCES `faq` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `return_change_faq_goods_received_item_id_foreign` FOREIGN KEY (`goods_received_item_id`) REFERENCES `goods_received_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `return_change_faq` */

/*Table structure for table `role_has_permissions` */

DROP TABLE IF EXISTS `role_has_permissions`;

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `role_has_permissions` */

insert  into `role_has_permissions`(`permission_id`,`role_id`) values (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(39,1),(40,1),(41,1),(42,1),(43,1),(44,1),(45,1),(46,1),(47,1),(48,1),(49,1),(50,1),(51,1),(52,1),(54,1),(55,1),(56,1),(57,1),(58,1),(59,1),(60,1),(61,1),(62,1),(63,1),(64,1),(65,1),(66,1),(67,1),(68,1),(69,1),(70,1),(71,1),(72,1),(73,1),(74,1),(75,1),(76,1),(77,1),(78,1),(79,1),(80,1),(81,1),(82,1),(83,1),(84,1),(85,1),(86,1),(87,1),(88,1),(89,1),(90,1),(91,1),(92,1),(93,1),(94,1),(95,1),(96,1),(97,1),(98,1),(104,1),(105,1),(106,1),(107,1),(108,1),(109,1),(110,1),(111,1),(112,1),(113,1),(114,1),(115,1),(116,1),(117,1),(118,1),(119,1),(120,1),(121,1),(122,1),(123,1),(124,1),(125,1),(127,1),(128,1),(129,1),(130,1),(131,1),(132,1),(133,1),(134,1),(135,1),(136,1),(137,1),(138,1),(139,1),(140,1),(141,1),(142,1),(143,1),(144,1),(145,1),(146,1),(147,1),(148,1),(149,1),(150,1),(151,1),(152,1),(153,1),(154,1),(155,1),(156,1),(157,1),(158,1),(159,1),(160,1),(161,1),(162,1),(163,1),(164,1),(165,1),(166,1),(167,1),(168,1),(169,1),(170,1),(171,1),(172,1),(173,1),(174,1),(175,1),(176,1),(178,1),(179,1),(180,1),(181,1),(182,1),(183,1),(184,1),(185,1),(186,1),(187,1),(188,1),(189,1),(190,1),(191,1),(192,1),(193,1),(194,1),(195,1),(196,1),(197,1),(198,1),(199,1),(200,1),(201,1),(202,1),(203,1),(204,1),(205,1),(206,1),(207,1),(208,1),(209,1),(210,1),(211,1),(212,1),(213,1),(214,1),(215,1),(216,1),(217,1),(218,1),(219,1),(220,1),(221,1),(222,1),(223,1),(224,1),(225,1),(226,1),(227,1),(228,1),(229,1),(230,1),(231,1),(232,1),(233,1),(234,1),(235,1),(236,1),(237,1),(238,1),(239,1),(240,1),(241,1),(242,1),(243,1),(244,1),(245,1),(247,1),(248,1),(249,1),(250,1),(251,1),(252,1),(253,1),(254,1),(255,1),(256,1),(257,1),(258,1),(259,1),(260,1),(261,1),(262,1),(263,1),(264,1),(265,1),(266,1),(267,1),(268,1),(269,1),(270,1),(271,1),(272,1),(273,1),(274,1),(275,1),(276,1),(277,1),(278,1),(279,1),(280,1),(281,1),(282,1),(283,1),(284,1),(285,1),(286,1),(287,1),(288,1),(289,1),(290,1),(291,1),(292,1),(293,1),(294,1),(295,1),(296,1),(297,1),(298,1),(299,1),(300,1),(303,1),(304,1),(305,1),(306,1),(307,1),(308,1),(309,1),(310,1),(311,1),(312,1),(313,1),(314,1),(315,1),(316,1),(317,1),(318,1),(319,1),(320,1),(321,1),(322,1),(323,1),(324,1),(325,1),(326,1),(327,1),(328,1),(329,1),(330,1),(331,1),(332,1),(333,1),(334,1),(335,1),(336,1),(337,1),(338,1),(339,1),(340,1),(341,1),(342,1),(343,1),(344,1),(345,1),(346,1),(347,1),(348,1),(349,1),(350,1),(351,1),(352,1),(353,1),(354,1),(355,1),(356,1),(357,1),(358,1),(359,1),(360,1),(361,1),(362,1),(363,1),(364,1),(365,1),(366,1),(367,1),(368,1),(369,1),(370,1),(371,1),(372,1),(373,1),(374,1),(375,1),(376,1),(377,1),(378,1),(379,1),(380,1),(381,1),(382,1),(383,1),(384,1),(385,1),(386,1),(387,1),(388,1),(389,1),(390,1),(391,1),(392,1),(393,1),(394,1),(395,1),(396,1),(397,1),(398,1),(399,1),(400,1),(401,1),(402,1),(403,1),(404,1),(405,1),(406,1),(407,1),(408,1),(409,1),(410,1),(411,1),(412,1),(413,1),(414,1),(415,1),(416,1),(417,1),(418,1),(419,1),(420,1),(421,1),(422,1),(423,1),(424,1),(425,1),(426,1),(427,1),(428,1),(429,1),(430,1),(431,1),(432,1),(433,1),(434,1),(435,1),(436,1),(437,1),(438,1),(439,1),(440,1),(441,1),(442,1),(443,1),(444,1),(445,1),(446,1),(447,1),(448,1),(449,1),(450,1),(451,1),(452,1),(453,1),(454,1),(455,1),(456,1),(457,1),(458,1),(459,1),(460,1),(461,1),(462,1),(463,1),(464,1),(465,1),(466,1),(467,1),(468,1),(469,1),(470,1),(471,1),(472,1),(473,1),(474,1),(475,1),(476,1),(477,1),(478,1),(479,1),(480,1),(481,1),(482,1),(483,1),(484,1),(485,1),(486,1),(487,1),(488,1),(489,1),(490,1),(491,1),(492,1),(493,1),(494,1),(495,1),(496,1),(497,1),(498,1),(499,1),(500,1),(501,1),(502,1),(503,1),(504,1),(505,1),(506,1),(507,1),(508,1),(509,1),(510,1),(511,1),(512,1),(513,1),(514,1),(515,1),(516,1),(517,1),(518,1),(529,1),(530,1),(531,1),(532,1),(533,1),(534,1),(535,1),(536,1),(537,1),(538,1),(1,2),(2,2),(3,2),(4,2),(5,2),(6,2),(7,2),(8,2),(9,2),(10,2),(11,2),(12,2),(13,2),(14,2),(15,2),(16,2),(17,2),(18,2),(19,2),(20,2),(21,2),(22,2),(23,2),(24,2),(25,2),(26,2),(27,2),(28,2),(29,2),(30,2),(31,2),(32,2),(33,2),(35,2),(39,2),(40,2),(41,2),(42,2),(43,2),(44,2),(45,2),(46,2),(47,2),(48,2),(49,2),(50,2),(51,2),(52,2),(54,2),(92,2),(166,2),(481,2),(482,2),(483,2),(484,2),(485,2),(498,2),(499,2),(500,2),(501,2),(502,2),(503,2),(504,2),(505,2),(506,2),(27,3),(28,3),(29,3),(30,3),(31,3),(50,3),(51,3),(52,3),(60,3),(66,3),(67,3),(68,3),(69,3),(74,3),(75,3),(77,3),(78,3),(79,3),(80,3),(81,3),(92,3),(93,3),(143,3),(153,3),(166,3),(390,3),(391,3),(481,3),(482,3),(483,3),(484,3),(485,3),(28,4),(29,4),(30,4),(31,4),(92,4),(93,4),(166,4),(481,4),(482,4),(483,4),(484,4),(485,4),(28,5),(29,5),(30,5),(31,5),(34,5),(35,5),(39,5),(40,5),(41,5),(42,5),(43,5),(44,5),(45,5),(46,5),(47,5),(54,5),(57,5),(58,5),(74,5),(79,5),(80,5),(81,5),(84,5),(85,5),(86,5),(87,5),(92,5),(93,5),(94,5),(95,5),(104,5),(144,5),(145,5),(146,5),(147,5),(148,5),(149,5),(150,5),(151,5),(154,5),(155,5),(156,5),(157,5),(158,5),(163,5),(165,5),(166,5),(167,5),(169,5),(170,5),(171,5),(172,5),(173,5),(174,5),(176,5),(316,5),(317,5),(318,5),(344,5),(361,5),(362,5),(363,5),(374,5),(375,5),(472,5),(473,5),(481,5),(482,5),(497,5),(22,6),(23,6),(24,6),(25,6),(28,6),(29,6),(30,6),(31,6),(33,6),(97,6),(166,6),(481,6),(482,6),(497,6),(27,7),(28,7),(29,7),(30,7),(31,7),(32,7),(50,7),(51,7),(52,7),(55,7),(56,7),(58,7),(66,7),(70,7),(71,7),(72,7),(73,7),(92,7),(93,7),(104,7),(143,7),(164,7),(165,7),(166,7),(172,7),(173,7),(174,7),(481,7),(482,7),(483,7),(484,7),(485,7),(497,7),(28,8),(29,8),(30,8),(31,8),(60,8),(74,8),(75,8),(77,8),(78,8),(79,8),(80,8),(81,8),(92,8),(93,8),(153,8),(166,8),(481,8),(482,8),(28,9),(29,9),(30,9),(31,9),(92,9),(93,9),(94,9),(166,9),(481,9),(482,9),(484,9),(28,10),(29,10),(30,10),(31,10),(92,10),(93,10),(95,10),(166,10),(325,10),(481,10),(482,10),(484,10),(22,11),(23,11),(24,11),(25,11),(26,11),(28,11),(29,11),(30,11),(31,11),(33,11),(48,11),(49,11),(60,11),(74,11),(75,11),(77,11),(78,11),(79,11),(80,11),(81,11),(82,11),(91,11),(92,11),(93,11),(98,11),(152,11),(153,11),(166,11),(390,11),(391,11),(481,11),(482,11),(28,12),(29,12),(30,12),(31,12),(59,12),(60,12),(62,12),(65,12),(92,12),(93,12),(166,12),(175,12),(481,12),(482,12),(109,13),(110,13),(111,13),(112,13),(113,13),(114,13),(115,13),(116,13),(117,13),(118,13),(119,13),(120,13),(121,13),(122,13),(123,13),(124,13),(127,13),(128,13),(129,13),(130,13),(131,13),(132,13),(133,13),(134,13),(135,13),(136,13),(137,13),(138,13),(139,13),(140,13),(141,13),(142,13),(166,13),(167,13),(168,13),(239,13),(240,13),(241,13),(242,13),(243,13),(244,13),(245,13),(247,13),(248,13),(249,13),(250,13),(251,13),(252,13),(253,13),(254,13),(255,13),(256,13),(257,13),(258,13),(259,13),(260,13),(261,13),(262,13),(263,13),(264,13),(265,13),(266,13),(267,13),(268,13),(269,13),(270,13),(271,13),(272,13),(273,13),(274,13),(275,13),(276,13),(280,13),(284,13),(288,13),(292,13),(293,13),(294,13),(295,13),(296,13),(297,13),(298,13),(299,13),(300,13),(303,13),(304,13),(305,13),(306,13),(307,13),(308,13),(309,13),(310,13),(311,13),(312,13),(313,13),(314,13),(315,13),(316,13),(317,13),(318,13),(319,13),(320,13),(321,13),(322,13),(323,13),(324,13),(334,13),(335,13),(336,13),(337,13),(341,13),(342,13),(343,13),(344,13),(345,13),(346,13),(347,13),(348,13),(349,13),(350,13),(351,13),(352,13),(353,13),(354,13),(355,13),(356,13),(357,13),(358,13),(359,13),(360,13),(365,13),(376,13),(377,13),(378,13),(381,13),(382,13),(383,13),(384,13),(385,13),(386,13),(387,13),(388,13),(389,13),(392,13),(393,13),(394,13),(395,13),(396,13),(397,13),(398,13),(399,13),(400,13),(401,13),(402,13),(403,13),(404,13),(474,13),(475,13),(476,13),(477,13),(481,13),(484,13),(498,13),(499,13),(500,13),(501,13),(502,13),(503,13),(504,13),(505,13),(506,13),(507,13),(508,13),(509,13),(510,13),(511,13),(512,13),(513,13),(514,13),(515,13),(516,13),(517,13),(518,13),(519,13),(520,13),(521,13),(522,13),(523,13),(524,13),(525,13),(526,13),(527,13),(528,13),(529,13),(530,13),(531,13),(532,13),(533,13),(534,13),(535,13),(536,13),(537,13),(28,14),(29,14),(30,14),(31,14),(34,14),(35,14),(39,14),(40,14),(41,14),(42,14),(43,14),(44,14),(45,14),(46,14),(47,14),(54,14),(57,14),(58,14),(83,14),(84,14),(85,14),(86,14),(87,14),(88,14),(89,14),(90,14),(92,14),(93,14),(94,14),(95,14),(104,14),(144,14),(145,14),(146,14),(147,14),(148,14),(149,14),(155,14),(156,14),(157,14),(158,14),(163,14),(164,14),(165,14),(166,14),(167,14),(169,14),(170,14),(171,14),(172,14),(173,14),(174,14),(176,14),(316,14),(317,14),(318,14),(344,14),(361,14),(362,14),(363,14),(374,14),(375,14),(481,14),(482,14),(27,15),(28,15),(29,15),(30,15),(31,15),(50,15),(51,15),(52,15),(92,15),(93,15),(143,15),(166,15),(481,15),(482,15),(92,16),(96,16),(125,16),(178,16),(179,16),(180,16),(181,16),(182,16),(183,16),(184,16),(185,16),(186,16),(187,16),(188,16),(189,16),(190,16),(191,16),(192,16),(193,16),(194,16),(195,16),(196,16),(197,16),(198,16),(199,16),(200,16),(201,16),(202,16),(203,16),(204,16),(205,16),(206,16),(207,16),(208,16),(209,16),(210,16),(211,16),(212,16),(213,16),(214,16),(215,16),(216,16),(217,16),(218,16),(219,16),(220,16),(221,16),(222,16),(223,16),(224,16),(225,16),(226,16),(227,16),(228,16),(229,16),(230,16),(231,16),(232,16),(233,16),(234,16),(235,16),(236,16),(237,16),(238,16),(326,16),(327,16),(328,16),(329,16),(330,16),(331,16),(332,16),(333,16),(338,16),(339,16),(340,16),(366,16),(367,16),(368,16),(369,16),(370,16),(371,16),(372,16),(373,16),(481,16),(483,16),(92,17),(96,17),(214,17),(215,17),(216,17),(217,17),(219,17),(220,17),(221,17),(222,17),(223,17),(224,17),(225,17),(226,17),(227,17),(232,17),(234,17),(338,17),(339,17),(340,17),(481,17),(483,17),(92,18),(96,18),(221,18),(224,18),(225,18),(226,18),(227,18),(232,18),(235,18),(481,18),(483,18),(92,19),(96,19),(192,19),(194,19),(195,19),(207,19),(208,19),(209,19),(210,19),(211,19),(212,19),(219,19),(221,19),(222,19),(223,19),(224,19),(225,19),(226,19),(227,19),(228,19),(229,19),(230,19),(231,19),(232,19),(233,19),(234,19),(481,19),(483,19),(92,20),(96,20),(194,20),(211,20),(212,20),(219,20),(221,20),(222,20),(223,20),(224,20),(225,20),(226,20),(227,20),(231,20),(232,20),(233,20),(234,20),(235,20),(236,20),(237,20),(238,20),(481,20),(483,20),(109,21),(110,21),(111,21),(112,21),(113,21),(114,21),(115,21),(116,21),(117,21),(118,21),(119,21),(120,21),(121,21),(122,21),(123,21),(124,21),(127,21),(128,21),(129,21),(130,21),(131,21),(132,21),(133,21),(134,21),(135,21),(136,21),(137,21),(138,21),(139,21),(140,21),(141,21),(142,21),(239,21),(240,21),(241,21),(242,21),(243,21),(244,21),(245,21),(247,21),(248,21),(249,21),(250,21),(251,21),(252,21),(253,21),(254,21),(255,21),(256,21),(257,21),(258,21),(259,21),(260,21),(261,21),(262,21),(263,21),(264,21),(265,21),(266,21),(267,21),(268,21),(269,21),(270,21),(271,21),(272,21),(273,21),(274,21),(275,21),(276,21),(280,21),(281,21),(284,21),(285,21),(288,21),(289,21),(292,21),(293,21),(294,21),(295,21),(296,21),(297,21),(298,21),(299,21),(300,21),(303,21),(304,21),(305,21),(306,21),(307,21),(308,21),(309,21),(310,21),(311,21),(312,21),(313,21),(314,21),(315,21),(316,21),(317,21),(318,21),(319,21),(320,21),(321,21),(322,21),(323,21),(324,21),(334,21),(335,21),(336,21),(337,21),(345,21),(346,21),(481,21),(484,21),(28,22),(92,22),(93,22),(109,22),(110,22),(111,22),(112,22),(113,22),(114,22),(115,22),(116,22),(117,22),(118,22),(119,22),(120,22),(121,22),(122,22),(123,22),(124,22),(127,22),(128,22),(129,22),(130,22),(131,22),(132,22),(133,22),(134,22),(135,22),(136,22),(137,22),(138,22),(139,22),(140,22),(141,22),(142,22),(239,22),(240,22),(241,22),(242,22),(243,22),(244,22),(245,22),(247,22),(248,22),(249,22),(250,22),(251,22),(252,22),(253,22),(254,22),(255,22),(256,22),(257,22),(258,22),(259,22),(260,22),(261,22),(262,22),(263,22),(264,22),(265,22),(266,22),(267,22),(268,22),(269,22),(270,22),(271,22),(272,22),(273,22),(274,22),(275,22),(276,22),(278,22),(280,22),(282,22),(286,22),(288,22),(290,22),(292,22),(293,22),(294,22),(295,22),(296,22),(297,22),(298,22),(299,22),(300,22),(303,22),(304,22),(305,22),(306,22),(307,22),(308,22),(309,22),(310,22),(311,22),(312,22),(313,22),(314,22),(315,22),(316,22),(317,22),(318,22),(319,22),(320,22),(321,22),(322,22),(323,22),(324,22),(334,22),(335,22),(336,22),(337,22),(345,22),(346,22),(379,22),(481,22),(484,22),(109,23),(110,23),(111,23),(112,23),(113,23),(114,23),(115,23),(116,23),(117,23),(118,23),(119,23),(120,23),(121,23),(122,23),(123,23),(124,23),(127,23),(128,23),(129,23),(130,23),(131,23),(132,23),(133,23),(134,23),(135,23),(136,23),(137,23),(138,23),(139,23),(140,23),(141,23),(142,23),(239,23),(240,23),(241,23),(242,23),(243,23),(244,23),(245,23),(247,23),(248,23),(249,23),(250,23),(251,23),(252,23),(253,23),(254,23),(255,23),(256,23),(257,23),(258,23),(259,23),(260,23),(261,23),(262,23),(263,23),(264,23),(265,23),(266,23),(267,23),(268,23),(269,23),(270,23),(271,23),(272,23),(273,23),(274,23),(275,23),(276,23),(279,23),(283,23),(287,23),(291,23),(292,23),(293,23),(294,23),(295,23),(296,23),(297,23),(298,23),(299,23),(300,23),(303,23),(304,23),(305,23),(306,23),(307,23),(308,23),(309,23),(310,23),(311,23),(312,23),(313,23),(314,23),(315,23),(316,23),(317,23),(318,23),(319,23),(320,23),(321,23),(322,23),(323,23),(324,23),(334,23),(335,23),(336,23),(337,23),(345,23),(346,23),(380,23),(481,23),(482,23),(484,23),(405,24),(406,24),(407,24),(408,24),(409,24),(410,24),(411,24),(412,24),(413,24),(414,24),(415,24),(416,24),(417,24),(418,24),(419,24),(420,24),(421,24),(422,24),(423,24),(424,24),(425,24),(426,24),(427,24),(428,24),(429,24),(430,24),(431,24),(432,24),(433,24),(434,24),(435,24),(436,24),(437,24),(438,24),(439,24),(440,24),(441,24),(442,24),(443,24),(444,24),(445,24),(446,24),(447,24),(448,24),(449,24),(450,24),(451,24),(452,24),(453,24),(454,24),(455,24),(456,24),(457,24),(458,24),(459,24),(460,24),(461,24),(462,24),(463,24),(464,24),(465,24),(466,24),(467,24),(468,24),(469,24),(470,24),(471,24),(478,24),(479,24),(481,24),(482,24),(485,24);

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `word_restrictions` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `roles` */

insert  into `roles`(`id`,`name`,`word_restrictions`,`guard_name`,`created_at`,`updated_at`) values (1,'Super Admin','[\"\"]','web',NULL,'2022-10-23 11:02:10'),(2,'Developers','[\"\"]','web','2021-12-23 19:20:42','2023-12-11 09:32:33'),(3,'Department-Head','[\"\"]','web','2021-12-24 11:27:01','2023-04-20 13:00:36'),(4,'Employee','[\"please\",\"asap\"]','web','2021-12-26 17:27:24','2022-06-13 16:53:14'),(5,'Purchase-Department','[\"\"]','web','2021-12-27 11:43:57','2022-06-13 19:12:45'),(6,'Store-Department','[\"\"]','web','2021-12-27 11:45:45','2023-12-11 09:32:04'),(7,'Management','[\"!\"]','web','2021-12-29 14:42:44','2022-06-13 17:52:42'),(8,'Quality-Ensure','[\"\"]','web','2022-01-11 13:58:17','2023-12-11 09:31:45'),(9,'Billing','[\"\"]','web','2022-02-06 12:28:46','2023-12-11 09:31:38'),(10,'Audit','[\"\"]','web','2022-02-06 12:28:55','2022-10-12 23:31:53'),(11,'Store-Manager','[\"\"]','web','2022-02-16 11:59:40','2023-04-20 13:00:23'),(12,'Gate Permission','[\"\"]','web','2022-02-24 12:51:03','2022-06-16 12:25:29'),(13,'Accounts','[\"\"]','web','2022-03-01 13:04:12','2022-08-18 17:22:53'),(14,'Purchase-Employee','[\"\"]','web','2022-06-03 16:53:20','2022-06-16 12:00:35'),(15,'SBU Head','[\"\"]','web','2022-06-25 06:59:36','2022-06-25 06:59:36'),(16,'PMO','[\"\"]','web','2022-07-01 18:54:37','2022-07-01 18:54:37'),(17,'PM','[\"\"]','web','2022-07-01 18:55:30','2022-07-01 18:55:30'),(18,'Primary-User','[\"\"]','web','2022-07-01 18:56:00','2022-07-01 18:56:00'),(19,'Sponsor','[\"\"]','web','2022-07-17 18:03:01','2022-07-17 18:03:01'),(20,'Project-Board','[\"\"]','web','2022-07-24 13:58:01','2022-07-24 13:58:01'),(21,'Accounts-Requester','[\"\"]','web','2022-09-07 10:27:20','2022-09-07 10:27:20'),(22,'Accounts-Reviewer','[\"\"]','web','2022-09-07 10:27:46','2022-09-07 10:27:46'),(23,'Accounts-Assessment','[\"\"]','web','2022-09-07 10:28:59','2022-09-07 10:28:59'),(24,'Sales','[\"\"]','web','2023-07-09 10:47:44','2023-07-09 10:47:44');

/*Table structure for table `sales_areas` */

DROP TABLE IF EXISTS `sales_areas`;

CREATE TABLE `sales_areas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sales_areas_created_by_foreign` (`created_by`),
  KEY `sales_areas_updated_by_foreign` (`updated_by`),
  CONSTRAINT `sales_areas_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sales_areas_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sales_areas` */

/*Table structure for table `sales_groups` */

DROP TABLE IF EXISTS `sales_groups`;

CREATE TABLE `sales_groups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sales_groups_created_by_foreign` (`created_by`),
  KEY `sales_groups_updated_by_foreign` (`updated_by`),
  CONSTRAINT `sales_groups_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sales_groups_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sales_groups` */

/*Table structure for table `sales_kit_prices` */

DROP TABLE IF EXISTS `sales_kit_prices`;

CREATE TABLE `sales_kit_prices` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sales_kit_id` bigint(20) unsigned DEFAULT NULL,
  `sales_type_id` bigint(20) unsigned NOT NULL,
  `price` double NOT NULL DEFAULT '0',
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sales_kit_prices_sales_kit_id_foreign` (`sales_kit_id`),
  KEY `sales_kit_prices_sales_type_id_foreign` (`sales_type_id`),
  KEY `sales_kit_prices_created_by_foreign` (`created_by`),
  KEY `sales_kit_prices_updated_by_foreign` (`updated_by`),
  CONSTRAINT `sales_kit_prices_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sales_kit_prices_sales_kit_id_foreign` FOREIGN KEY (`sales_kit_id`) REFERENCES `sales_kits` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sales_kit_prices_sales_type_id_foreign` FOREIGN KEY (`sales_type_id`) REFERENCES `sales_types` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `sales_kit_prices_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sales_kit_prices` */

/*Table structure for table `sales_kit_standard_costs` */

DROP TABLE IF EXISTS `sales_kit_standard_costs`;

CREATE TABLE `sales_kit_standard_costs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sales_kit_id` bigint(20) unsigned DEFAULT NULL,
  `standard_cost_id` bigint(20) unsigned NOT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sales_kit_standard_costs_sales_kit_id_foreign` (`sales_kit_id`),
  KEY `sales_kit_standard_costs_standard_cost_id_foreign` (`standard_cost_id`),
  KEY `sales_kit_standard_costs_created_by_foreign` (`created_by`),
  KEY `sales_kit_standard_costs_updated_by_foreign` (`updated_by`),
  CONSTRAINT `sales_kit_standard_costs_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sales_kit_standard_costs_sales_kit_id_foreign` FOREIGN KEY (`sales_kit_id`) REFERENCES `sales_kits` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sales_kit_standard_costs_standard_cost_id_foreign` FOREIGN KEY (`standard_cost_id`) REFERENCES `standard_costs` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `sales_kit_standard_costs_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sales_kit_standard_costs` */

/*Table structure for table `sales_kits` */

DROP TABLE IF EXISTS `sales_kits`;

CREATE TABLE `sales_kits` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `quantity` double NOT NULL DEFAULT '0',
  `product_unit_id` bigint(20) unsigned NOT NULL,
  `tax` double NOT NULL DEFAULT '0',
  `vat` double NOT NULL DEFAULT '0',
  `inventory_account_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cogs_account_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `sales_account_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sales_kits_product_id_foreign` (`product_id`),
  KEY `sales_kits_created_by_foreign` (`created_by`),
  KEY `sales_kits_updated_by_foreign` (`updated_by`),
  KEY `sales_kits_product_unit_id_foreign` (`product_unit_id`),
  CONSTRAINT `sales_kits_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sales_kits_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sales_kits_product_unit_id_foreign` FOREIGN KEY (`product_unit_id`) REFERENCES `product_units` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `sales_kits_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sales_kits` */

/*Table structure for table `sales_order_bill_details` */

DROP TABLE IF EXISTS `sales_order_bill_details`;

CREATE TABLE `sales_order_bill_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sales_order_bill_id` bigint(20) unsigned NOT NULL,
  `sales_order_delivery_id` bigint(20) unsigned NOT NULL,
  `sales_order_delivery_detail_id` bigint(20) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sales_order_bill_details_sales_order_bill_id_foreign` (`sales_order_bill_id`),
  KEY `sales_order_bill_details_sales_order_delivery_id_foreign` (`sales_order_delivery_id`),
  CONSTRAINT `sales_order_bill_details_sales_order_bill_id_foreign` FOREIGN KEY (`sales_order_bill_id`) REFERENCES `sales_order_bills` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sales_order_bill_details_sales_order_delivery_id_foreign` FOREIGN KEY (`sales_order_delivery_id`) REFERENCES `sales_order_deliveries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sales_order_bill_details` */

/*Table structure for table `sales_order_bills` */

DROP TABLE IF EXISTS `sales_order_bills`;

CREATE TABLE `sales_order_bills` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sales_order_id` bigint(20) unsigned NOT NULL,
  `datetime` datetime NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `type` enum('delivery','delivery-item') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'delivery',
  `status` enum('pending','approved','denied','hold','partial-paid','paid') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `invoice` text COLLATE utf8mb4_unicode_ci,
  `tax` text COLLATE utf8mb4_unicode_ci,
  `comments` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sales_order_bills_sales_order_id_foreign` (`sales_order_id`),
  KEY `sales_order_bills_created_by_foreign` (`created_by`),
  KEY `sales_order_bills_updated_by_foreign` (`updated_by`),
  CONSTRAINT `sales_order_bills_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sales_order_bills_sales_order_id_foreign` FOREIGN KEY (`sales_order_id`) REFERENCES `sales_orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sales_order_bills_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sales_order_bills` */

/*Table structure for table `sales_order_deliveries` */

DROP TABLE IF EXISTS `sales_order_deliveries`;

CREATE TABLE `sales_order_deliveries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sales_order_id` bigint(20) unsigned NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `datetime` datetime NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comments` text COLLATE utf8mb4_unicode_ci,
  `delivered_by` bigint(20) unsigned NOT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sales_order_deliveries_sales_order_id_foreign` (`sales_order_id`),
  KEY `sales_order_deliveries_delivered_by_foreign` (`delivered_by`),
  KEY `sales_order_deliveries_created_by_foreign` (`created_by`),
  KEY `sales_order_deliveries_updated_by_foreign` (`updated_by`),
  CONSTRAINT `sales_order_deliveries_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sales_order_deliveries_delivered_by_foreign` FOREIGN KEY (`delivered_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sales_order_deliveries_sales_order_id_foreign` FOREIGN KEY (`sales_order_id`) REFERENCES `sales_orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sales_order_deliveries_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sales_order_deliveries` */

/*Table structure for table `sales_order_delivery_details` */

DROP TABLE IF EXISTS `sales_order_delivery_details`;

CREATE TABLE `sales_order_delivery_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sales_order_delivery_id` bigint(20) unsigned NOT NULL,
  `sales_kit_id` bigint(20) unsigned NOT NULL,
  `warehouse_id` bigint(20) unsigned NOT NULL,
  `quantity` double NOT NULL DEFAULT '0',
  `status` enum('delivered','gate-out','received','returned') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'delivered',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sales_order_delivery_details_sales_order_delivery_id_foreign` (`sales_order_delivery_id`),
  KEY `sales_order_delivery_details_warehouse_id_foreign` (`warehouse_id`),
  KEY `sales_order_delivery_details_sales_kit_id_foreign` (`sales_kit_id`),
  CONSTRAINT `sales_order_delivery_details_sales_kit_id_foreign` FOREIGN KEY (`sales_kit_id`) REFERENCES `sales_kits` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sales_order_delivery_details_sales_order_delivery_id_foreign` FOREIGN KEY (`sales_order_delivery_id`) REFERENCES `sales_order_deliveries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sales_order_delivery_details_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sales_order_delivery_details` */

/*Table structure for table `sales_order_details` */

DROP TABLE IF EXISTS `sales_order_details`;

CREATE TABLE `sales_order_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sales_order_id` bigint(20) unsigned NOT NULL,
  `sales_kit_id` bigint(20) unsigned NOT NULL,
  `quantity` double NOT NULL DEFAULT '0',
  `price` double NOT NULL DEFAULT '0',
  `discount` double NOT NULL DEFAULT '0',
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sales_order_details_sales_order_id_foreign` (`sales_order_id`),
  KEY `sales_order_details_created_by_foreign` (`created_by`),
  KEY `sales_order_details_updated_by_foreign` (`updated_by`),
  KEY `sales_order_details_sales_kit_id_foreign` (`sales_kit_id`),
  CONSTRAINT `sales_order_details_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sales_order_details_sales_kit_id_foreign` FOREIGN KEY (`sales_kit_id`) REFERENCES `sales_kits` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sales_order_details_sales_order_id_foreign` FOREIGN KEY (`sales_order_id`) REFERENCES `sales_orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sales_order_details_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sales_order_details` */

/*Table structure for table `sales_order_entries` */

DROP TABLE IF EXISTS `sales_order_entries`;

CREATE TABLE `sales_order_entries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) unsigned DEFAULT '0',
  `sales_order_id` bigint(20) unsigned NOT NULL,
  `entry_id` bigint(20) unsigned NOT NULL,
  `type` enum('delivery','invoice','advance','payment','advance-clearing') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'delivery',
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sales_order_entries_entry_id_foreign` (`entry_id`),
  KEY `sales_order_entries_sales_order_id_foreign` (`sales_order_id`),
  CONSTRAINT `sales_order_entries_entry_id_foreign` FOREIGN KEY (`entry_id`) REFERENCES `entries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sales_order_entries_sales_order_id_foreign` FOREIGN KEY (`sales_order_id`) REFERENCES `sales_orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sales_order_entries` */

/*Table structure for table `sales_order_timelines` */

DROP TABLE IF EXISTS `sales_order_timelines`;

CREATE TABLE `sales_order_timelines` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sales_order_id` bigint(20) unsigned NOT NULL,
  `type` enum('quotation','order','delivery','invoice') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'quotation',
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sales_order_timelines_sales_order_id_foreign` (`sales_order_id`),
  KEY `sales_order_timelines_created_by_foreign` (`created_by`),
  KEY `sales_order_timelines_updated_by_foreign` (`updated_by`),
  CONSTRAINT `sales_order_timelines_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sales_order_timelines_sales_order_id_foreign` FOREIGN KEY (`sales_order_id`) REFERENCES `sales_orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sales_order_timelines_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sales_order_timelines` */

/*Table structure for table `sales_orders` */

DROP TABLE IF EXISTS `sales_orders`;

CREATE TABLE `sales_orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` bigint(20) unsigned NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rfq_no` datetime DEFAULT NULL,
  `datetime` datetime NOT NULL,
  `sales_payment_type_id` bigint(20) unsigned NOT NULL,
  `sales_type_id` bigint(20) unsigned NOT NULL,
  `exchange_rate_id` bigint(20) unsigned NOT NULL,
  `warehouse_id` bigint(20) unsigned NOT NULL,
  `valid_till` datetime NOT NULL,
  `valid_until` date DEFAULT NULL,
  `pre_payment_required` double DEFAULT NULL,
  `deliver_to` text COLLATE utf8mb4_unicode_ci,
  `address` text COLLATE utf8mb4_unicode_ci,
  `contact_phone` text COLLATE utf8mb4_unicode_ci,
  `customer_reference` text COLLATE utf8mb4_unicode_ci,
  `shipper_id` bigint(20) unsigned DEFAULT NULL,
  `shipping_charge` double NOT NULL DEFAULT '0',
  `comments` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sales_orders_customer_id_foreign` (`customer_id`),
  KEY `sales_orders_created_by_foreign` (`created_by`),
  KEY `sales_orders_updated_by_foreign` (`updated_by`),
  KEY `sales_orders_sales_type_id_foreign` (`sales_type_id`),
  KEY `sales_orders_sales_payment_type_id_foreign` (`sales_payment_type_id`),
  KEY `sales_orders_exchange_rate_id_foreign` (`exchange_rate_id`),
  KEY `sales_orders_warehouse_id_foreign` (`warehouse_id`),
  CONSTRAINT `sales_orders_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sales_orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sales_orders_exchange_rate_id_foreign` FOREIGN KEY (`exchange_rate_id`) REFERENCES `exchange_rates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sales_orders_sales_payment_type_id_foreign` FOREIGN KEY (`sales_payment_type_id`) REFERENCES `sales_payment_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sales_orders_sales_type_id_foreign` FOREIGN KEY (`sales_type_id`) REFERENCES `sales_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sales_orders_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sales_orders_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sales_orders` */

/*Table structure for table `sales_payment_types` */

DROP TABLE IF EXISTS `sales_payment_types`;

CREATE TABLE `sales_payment_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sales_payment_types_created_by_foreign` (`created_by`),
  KEY `sales_payment_types_updated_by_foreign` (`updated_by`),
  CONSTRAINT `sales_payment_types_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sales_payment_types_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sales_payment_types` */

/*Table structure for table `sales_types` */

DROP TABLE IF EXISTS `sales_types`;

CREATE TABLE `sales_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `factor` double NOT NULL DEFAULT '0',
  `tax` int(11) NOT NULL DEFAULT '0',
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sales_types_created_by_foreign` (`created_by`),
  KEY `sales_types_updated_by_foreign` (`updated_by`),
  CONSTRAINT `sales_types_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sales_types_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sales_types` */

/*Table structure for table `salesmen` */

DROP TABLE IF EXISTS `salesmen`;

CREATE TABLE `salesmen` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sales_area_id` bigint(20) unsigned NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `salesmen_sales_area_id_foreign` (`sales_area_id`),
  KEY `salesmen_created_by_foreign` (`created_by`),
  KEY `salesmen_updated_by_foreign` (`updated_by`),
  CONSTRAINT `salesmen_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salesmen_sales_area_id_foreign` FOREIGN KEY (`sales_area_id`) REFERENCES `sales_areas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salesmen_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `salesmen` */

/*Table structure for table `schedule_entries` */

DROP TABLE IF EXISTS `schedule_entries`;

CREATE TABLE `schedule_entries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `schedule_id` bigint(20) unsigned NOT NULL,
  `entry_id` bigint(20) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `schedule_entries_schedule_id_foreign` (`schedule_id`),
  KEY `schedule_entries_entry_id_foreign` (`entry_id`),
  CONSTRAINT `schedule_entries_entry_id_foreign` FOREIGN KEY (`entry_id`) REFERENCES `entries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `schedule_entries_schedule_id_foreign` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `schedule_entries` */

/*Table structure for table `schedule_payment_ledgers` */

DROP TABLE IF EXISTS `schedule_payment_ledgers`;

CREATE TABLE `schedule_payment_ledgers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `schedule_payment_id` bigint(20) unsigned NOT NULL,
  `cost_centre_id` bigint(20) unsigned NOT NULL DEFAULT '1002',
  `chart_of_account_id` bigint(20) unsigned NOT NULL,
  `type` enum('D','C') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'D',
  `amount` double NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `schedule_payment_ledgers_schedule_payment_id_foreign` (`schedule_payment_id`),
  KEY `schedule_payment_ledgers_chart_of_account_id_foreign` (`chart_of_account_id`),
  KEY `schedule_payment_ledgers_cost_centre_id_foreign` (`cost_centre_id`),
  CONSTRAINT `schedule_payment_ledgers_chart_of_account_id_foreign` FOREIGN KEY (`chart_of_account_id`) REFERENCES `chart_of_accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `schedule_payment_ledgers_cost_centre_id_foreign` FOREIGN KEY (`cost_centre_id`) REFERENCES `cost_centres` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `schedule_payment_ledgers_schedule_payment_id_foreign` FOREIGN KEY (`schedule_payment_id`) REFERENCES `schedule_payments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `schedule_payment_ledgers` */

insert  into `schedule_payment_ledgers`(`id`,`schedule_payment_id`,`cost_centre_id`,`chart_of_account_id`,`type`,`amount`,`deleted_at`,`created_at`,`updated_at`) values (7,1,1637,1313,'D',100,NULL,NULL,NULL),(8,1,1007,1314,'C',100,NULL,NULL,NULL);

/*Table structure for table `schedule_payments` */

DROP TABLE IF EXISTS `schedule_payments`;

CREATE TABLE `schedule_payments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `day` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '01',
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `schedule_payments_company_id_foreign` (`company_id`),
  KEY `schedule_payments_created_by_foreign` (`created_by`),
  KEY `schedule_payments_updated_by_foreign` (`updated_by`),
  CONSTRAINT `schedule_payments_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `schedule_payments_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `schedule_payments_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `schedule_payments` */

insert  into `schedule_payments`(`id`,`company_id`,`code`,`name`,`day`,`description`,`created_by`,`updated_by`,`deleted_at`,`created_at`,`updated_at`) values (1,5,'d8Fq592U','wde23d32','01','wd32wed32de32ed32e',22,22,NULL,'2024-03-13 11:59:00','2024-03-13 12:00:23');

/*Table structure for table `schedules` */

DROP TABLE IF EXISTS `schedules`;

CREATE TABLE `schedules` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `schedule_payment_id` bigint(20) unsigned NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `purpose` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `schedules_schedule_payment_id_foreign` (`schedule_payment_id`),
  KEY `schedules_created_by_foreign` (`created_by`),
  KEY `schedules_updated_by_foreign` (`updated_by`),
  CONSTRAINT `schedules_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `schedules_schedule_payment_id_foreign` FOREIGN KEY (`schedule_payment_id`) REFERENCES `schedule_payments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `schedules_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `schedules` */

/*Table structure for table `sessions` */

DROP TABLE IF EXISTS `sessions`;

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sessions` */

/*Table structure for table `settings` */

DROP TABLE IF EXISTS `settings`;

CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `settings_key_index` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `settings` */

/*Table structure for table `shippers` */

DROP TABLE IF EXISTS `shippers`;

CREATE TABLE `shippers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax` text COLLATE utf8mb4_unicode_ci,
  `address` text COLLATE utf8mb4_unicode_ci,
  `status` enum('pending','approved','denied') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shippers_created_by_foreign` (`created_by`),
  KEY `shippers_updated_by_foreign` (`updated_by`),
  CONSTRAINT `shippers_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `shippers_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `shippers` */

/*Table structure for table `sources` */

DROP TABLE IF EXISTS `sources`;

CREATE TABLE `sources` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sources_created_by_foreign` (`created_by`),
  KEY `sources_updated_by_foreign` (`updated_by`),
  CONSTRAINT `sources_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sources_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sources` */

insert  into `sources`(`id`,`code`,`name`,`description`,`created_by`,`updated_by`,`deleted_at`,`created_at`,`updated_at`) values (12,'01','SSL Commerze Panel','SSL Commerze Panel',1,NULL,NULL,'2024-03-11 15:34:57','2024-03-11 15:34:57'),(13,'02','IVAC MIS Panel','IVAC MIS Panel',1,NULL,NULL,'2024-03-11 15:35:06','2024-03-11 15:35:06'),(14,'03','VR Panel','VR Panel',1,NULL,NULL,'2024-03-11 15:35:16','2024-03-11 15:35:16'),(15,'04','SMS/ISMS Panel','SMS/ISMS Panel',1,NULL,NULL,'2024-03-11 15:35:23','2024-03-11 15:35:23'),(16,'05','PMS','PMS',1,NULL,NULL,'2024-03-11 15:35:28','2024-03-11 15:35:28'),(17,'06','Visa/Master Card Payment','Visa/Master Card Payment',1,NULL,NULL,'2024-03-11 15:35:36','2024-03-11 15:35:36'),(18,'07','Billing Panel','Billing Panel',1,NULL,NULL,'2024-03-11 15:35:41','2024-03-11 15:35:41'),(19,'08','Bank Portal','Bank Portal',1,NULL,NULL,'2024-03-11 15:35:46','2024-03-11 15:35:46'),(20,'09','Bank Statement','Bank Statement',1,NULL,NULL,'2024-03-11 15:35:52','2024-03-11 15:35:52'),(21,'10','Excel','Excel',1,NULL,NULL,'2024-03-11 15:35:57','2024-03-11 15:35:57'),(22,'11','Email','Email',1,NULL,NULL,'2024-03-11 15:36:02','2024-03-11 15:36:02');

/*Table structure for table `standard_costs` */

DROP TABLE IF EXISTS `standard_costs`;

CREATE TABLE `standard_costs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `standard_costs_created_by_foreign` (`created_by`),
  KEY `standard_costs_updated_by_foreign` (`updated_by`),
  CONSTRAINT `standard_costs_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `standard_costs_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `standard_costs` */

/*Table structure for table `sub_deliverable_users` */

DROP TABLE IF EXISTS `sub_deliverable_users`;

CREATE TABLE `sub_deliverable_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sub_deliverable_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sub_deliverable_users_sub_deliverable_id_foreign` (`sub_deliverable_id`),
  KEY `sub_deliverable_users_user_id_foreign` (`user_id`),
  CONSTRAINT `sub_deliverable_users_sub_deliverable_id_foreign` FOREIGN KEY (`sub_deliverable_id`) REFERENCES `sub_deliverables` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sub_deliverable_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sub_deliverable_users` */

/*Table structure for table `sub_deliverables` */

DROP TABLE IF EXISTS `sub_deliverables`;

CREATE TABLE `sub_deliverables` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `deliverable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `serial` int(11) NOT NULL DEFAULT '0',
  `weightage` int(11) NOT NULL,
  `budget` bigint(20) NOT NULL DEFAULT '0',
  `start_at` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_at` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_parallel` int(11) NOT NULL DEFAULT '0',
  `status_at` double NOT NULL DEFAULT '0' COMMENT 'This field will show at percentage value',
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sub_deliverables_deliverable_id_foreign` (`deliverable_id`),
  CONSTRAINT `sub_deliverables_deliverable_id_foreign` FOREIGN KEY (`deliverable_id`) REFERENCES `deliverables` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sub_deliverables` */

/*Table structure for table `sub_menus` */

DROP TABLE IF EXISTS `sub_menus`;

CREATE TABLE `sub_menus` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `module` enum('finance','procurement','manufacturing','inventory-management','order-management','warehouse-management','supply-chain-management','customer-relationship-management','professional-services-automation','workforce-management','human-resources-management','ecommerce','marketing-automation','merchandise','project-management','sales') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'procurement',
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
  KEY `sub_menus_updated_by_foreign` (`updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=267 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sub_menus` */

insert  into `sub_menus`(`id`,`module`,`menu_id`,`name`,`name_bn`,`url`,`icon_class`,`icon`,`big_icon`,`serial_num`,`status`,`slug`,`menu_for`,`open_new_tab`,`created_by`,`updated_by`,`deleted_at`,`created_at`,`updated_at`) values (1,'procurement',3,'Requisitions',NULL,'pms/requisition/requisition',NULL,NULL,NULL,0,'Active','[\"requisition-delete\",\"requisition-edit\",\"requisition-create\",\"requisition-list\"]','Sub menu for admin','No Open New Tab',1,1,NULL,'2021-12-23 11:32:23','2022-06-07 12:08:49'),(2,'procurement',3,'User Requisitions',NULL,'pms/requisition/list-view',NULL,NULL,NULL,2,'Active','[\"requisition-list-view\"]','Sub menu for admin','No Open New Tab',1,1,NULL,'2021-12-23 11:33:16','2022-02-09 13:47:57'),(3,'procurement',4,'Requisition',NULL,'pms/store-manage/store-requisition',NULL,NULL,NULL,1,'Active','[\"General Permission\"]','Sub menu for admin','No Open New Tab',1,NULL,'2021-12-23 12:02:13','2021-12-23 12:00:23','2021-12-23 12:02:13'),(4,'procurement',11,'Requisition',NULL,'pms/store-manage/store-requisition',NULL,NULL,NULL,1,'Active','[\"store-requisition\"]','Sub menu for admin','No Open New Tab',1,1,NULL,'2021-12-23 12:02:52','2021-12-27 11:54:26'),(5,'procurement',4,'Requisitions List',NULL,'pms/rfp/requisitions',NULL,NULL,NULL,1,'Active','[\"rfp-requisitions-list\"]','Sub menu for admin','No Open New Tab',1,1,NULL,'2021-12-23 12:04:45','2021-12-27 11:29:12'),(6,'procurement',4,'Combine Proposal',NULL,'pms/rfp/request-proposal/create',NULL,NULL,NULL,2,'Active','[\"rfp-create\"]','Sub menu for admin','No Open New Tab',1,1,NULL,'2021-12-23 12:05:07','2024-01-18 11:16:01'),(7,'procurement',4,'Request Proposal List',NULL,'pms/rfp/request-proposal',NULL,NULL,NULL,4,'Active','[\"rfp-list\",\"rfp-delete\",\"rfp-edit\",\"rfp-create\"]','Sub menu for admin','No Open New Tab',1,1,NULL,'2021-12-23 12:07:38','2024-01-18 11:16:15'),(8,'procurement',4,'Inventory Summery',NULL,'pms/inventory/inventory-summery',NULL,NULL,NULL,4,'Active','[\"General Permission\"]','Sub menu for admin','No Open New Tab',1,NULL,'2021-12-23 12:08:24','2021-12-23 12:08:13','2021-12-23 12:08:24'),(9,'procurement',5,'Summary',NULL,'pms/inventory/inventory-summary',NULL,NULL,NULL,1,'Active','[\"inventory-summary-delete\",\"inventory-summary-edit\",\"inventory-summary-create\",\"inventory-summary-list\"]','Sub menu for admin','No Open New Tab',1,1,NULL,'2021-12-23 12:08:41','2022-01-24 12:20:19'),(10,'procurement',5,'Log/Transection',NULL,'pms/inventory/inventory-logs',NULL,NULL,NULL,2,'Active','[\"inventory-logs\"]','Sub menu for admin','No Open New Tab',1,1,NULL,'2021-12-23 12:09:15','2022-01-24 12:20:33'),(11,'procurement',6,'Brand',NULL,'pms/product-management/brand',NULL,NULL,NULL,1,'Inactive','[\"brand-delete\",\"brand-edit\",\"brand-add\",\"brand-list\"]','Sub menu for admin','No Open New Tab',1,1,NULL,'2021-12-23 12:09:54','2022-06-03 14:32:51'),(12,'procurement',6,'Requisition Type',NULL,'pms/requisition/type',NULL,NULL,NULL,2,'Active','[\"General Permission\"]','Sub menu for admin','No Open New Tab',1,1,'2022-05-25 12:05:31','2021-12-23 12:11:09','2022-05-25 12:05:31'),(13,'procurement',6,'Category',NULL,'pms/product-management/category',NULL,NULL,NULL,2,'Active','[\"category-delete\",\"category-edit\",\"category-create\",\"category-list\"]','Sub menu for admin','No Open New Tab',1,1,NULL,'2021-12-23 12:11:34','2022-06-03 15:08:17'),(14,'procurement',6,'Product',NULL,'pms/product-management/product',NULL,NULL,NULL,5,'Active','[\"product-delete\",\"product-edit\",\"product-add\",\"product-list\"]','Sub menu for admin','No Open New Tab',1,1,NULL,'2021-12-23 12:12:39','2022-06-03 15:24:27'),(15,'procurement',7,'Quotations',NULL,'pms/quotation/index',NULL,NULL,NULL,1,'Active','[\"quotation-index\"]','Sub menu for admin','No Open New Tab',1,1,NULL,'2021-12-23 12:17:08','2021-12-29 17:45:27'),(16,'procurement',7,'Quotations CS',NULL,'pms/quotation/cs-analysis',NULL,NULL,NULL,2,'Active','[\"cs-analysis\"]','Sub menu for admin','No Open New Tab',1,1,NULL,'2021-12-23 12:17:40','2022-02-09 14:15:53'),(17,'procurement',10,'Project',NULL,'#',NULL,NULL,NULL,1,'Active','[\"General Permission\"]','Sub menu for admin','No Open New Tab',1,NULL,'2022-05-16 12:41:31','2021-12-23 12:21:19','2022-05-16 12:41:31'),(18,'procurement',10,'Location',NULL,'pms/warehouse',NULL,NULL,NULL,2,'Active','[\"General Permission\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2021-12-23 12:21:43','2021-12-23 12:21:43'),(19,'procurement',10,'Settings',NULL,'#',NULL,NULL,NULL,3,'Active','[\"General Permission\"]','Sub menu for admin','No Open New Tab',1,NULL,'2022-05-16 12:41:37','2021-12-23 12:21:57','2022-05-16 12:41:37'),(20,'procurement',9,'Roles',NULL,'pms/acl/roles',NULL,NULL,NULL,1,'Active','[\"role-delete\",\"role-edit\",\"role-create\",\"role-list\"]','Sub menu for admin','No Open New Tab',1,1,NULL,'2021-12-23 12:22:50','2022-06-03 17:01:01'),(21,'procurement',9,'Permission',NULL,'pms/acl/permission',NULL,NULL,NULL,2,'Active','[\"General Permission\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2021-12-23 12:24:44','2021-12-23 12:24:44'),(22,'procurement',12,'Users',NULL,'pms/admin/users',NULL,NULL,NULL,1,'Active','[\"General Permission\"]','Sub menu for admin','No Open New Tab',1,NULL,'2021-12-23 12:29:02','2021-12-23 12:26:03','2021-12-23 12:29:02'),(23,'procurement',12,'Users',NULL,'pms/admin/users',NULL,NULL,NULL,1,'Active','[\"General Permission\"]','Sub menu for admin','No Open New Tab',1,1,'2023-12-18 14:52:27','2021-12-23 12:26:44','2023-12-18 14:52:27'),(24,'procurement',9,'Menu',NULL,'pms/acl/menu',NULL,NULL,NULL,3,'Active','[\"menu-delete\",\"menu-edit\",\"menu-create\",\"menu-list\"]','Sub menu for admin','No Open New Tab',1,1,NULL,'2021-12-23 12:30:14','2022-05-25 12:03:50'),(25,'procurement',9,'Sub Menu',NULL,'pms/admin/sub-menu',NULL,NULL,NULL,4,'Active','[\"General Permission\"]','Sub menu for admin','No Open New Tab',1,NULL,'2021-12-23 13:03:00','2021-12-23 12:30:40','2021-12-23 13:03:00'),(26,'procurement',7,'Quotation Requests',NULL,'pms/quotation/approval-list',NULL,NULL,NULL,3,'Active','[\"quotations-approval-list\"]','Sub menu for admin','No Open New Tab',1,1,NULL,'2021-12-24 16:46:12','2021-12-29 17:45:07'),(27,'procurement',13,'PO List',NULL,'pms/purchase/order-list',NULL,NULL,NULL,1,'Active','[\"po-list\"]','Sub menu for admin','No Open New Tab',1,1,NULL,'2021-12-29 14:51:33','2022-02-09 14:44:08'),(28,'procurement',7,'Quotation Approved',NULL,'pms/quotation/generate-po-list',NULL,NULL,NULL,4,'Active','[\"generate-po-list\"]','Sub menu for admin','No Open New Tab',1,1,NULL,'2021-12-30 18:18:44','2022-02-09 14:35:06'),(29,'procurement',14,'PO List',NULL,'pms/grn/po-list',NULL,NULL,NULL,1,'Active','[\"grn-po-list\"]','Sub menu for admin','No Open New Tab',1,1,NULL,'2022-01-03 12:47:45','2022-01-14 14:49:08'),(30,'procurement',14,'Gate In List',NULL,'pms/grn/grn-process',NULL,NULL,NULL,2,'Active','[\"grn-list\"]','Sub menu for admin','No Open New Tab',1,1,NULL,'2022-01-03 12:48:12','2022-02-20 18:34:35'),(31,'procurement',10,'Range Setup',NULL,'pms/range-setup',NULL,NULL,NULL,4,'Active','[\"range-setup-delete\",\"range-setup-edit\",\"range-setup-create\",\"range-setup\"]','Sub menu for admin','No Open New Tab',1,1,NULL,'2022-01-11 01:31:23','2022-01-11 01:36:06'),(32,'procurement',10,'Payment Terms',NULL,'pms/payment-terms',NULL,NULL,NULL,5,'Active','[\"payment-terms-delete\",\"payment-terms-edit\",\"payment-terms-create\",\"payment-terms-list\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2022-01-11 01:35:48','2022-01-11 01:35:48'),(33,'procurement',14,'PO Wise Gate In List',NULL,'pms/grn/po-wise-grn-list',NULL,NULL,NULL,3,'Active','[\"po-wise-grn-list\"]','Sub menu for admin','No Open New Tab',1,1,NULL,'2022-01-14 14:54:09','2022-02-20 18:34:17'),(34,'procurement',15,'Approved List',NULL,'pms/quality-ensure/approved-list',NULL,NULL,NULL,1,'Active','[\"quality-ensure-approval-list\"]','Sub menu for admin','No Open New Tab',1,1,NULL,'2022-01-18 17:13:25','2022-05-16 13:16:16'),(35,'procurement',15,'Return List',NULL,'pms/quality-ensure/return-list',NULL,NULL,NULL,2,'Active','[\"quality-ensure-return-list\"]','Sub menu for admin','No Open New Tab',1,1,NULL,'2022-01-18 17:14:08','2022-05-16 13:16:04'),(36,'procurement',15,'Return Replace List',NULL,'pms/quality-ensure/return-change-list',NULL,NULL,NULL,3,'Active','[\"quality-ensure-return-change-list\"]','Sub menu for admin','No Open New Tab',1,1,NULL,'2022-01-18 17:14:52','2022-05-16 13:15:47'),(37,'procurement',11,'Pending Delivery',NULL,'pms/store-manage/delivered-requisition',NULL,NULL,NULL,3,'Active','[\"delivered-requisition\"]','Sub menu for admin','No Open New Tab',1,1,NULL,'2022-01-21 12:23:16','2022-02-09 13:49:23'),(38,'procurement',11,'Complete Delivery',NULL,'pms/store-manage/delivered-requisition/delivered',NULL,NULL,NULL,4,'Active','[\"delivered-requisition\"]','Sub menu for admin','No Open New Tab',1,1,NULL,'2022-01-21 17:53:13','2022-01-26 18:14:04'),(39,'procurement',6,'Product Unit',NULL,'pms/product-management/product-unit',NULL,NULL,NULL,4,'Active','[\"product-unit-delete\",\"product-unit-edit\",\"product-unit-create\",\"product-unit-list\"]','Sub menu for admin','No Open New Tab',1,1,NULL,'2022-01-24 12:41:05','2022-01-24 16:18:58'),(40,'procurement',11,'RFP Requisition List',NULL,'pms/store-manage/store-rfp-requistion-list',NULL,NULL,NULL,2,'Active','[\"store-rfp-requistion-list\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2022-01-26 18:26:44','2022-01-26 18:26:44'),(41,'procurement',3,'Notification List',NULL,'pms/requisition/notification-all',NULL,NULL,NULL,3,'Active','[\"notification-list\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2022-01-27 19:11:11','2022-01-27 19:11:11'),(42,'procurement',3,'Delivered Requisition List',NULL,'pms/requisition/delivered-requistion-list',NULL,NULL,NULL,4,'Active','[\"requisition-delivered-list\"]','Sub menu for admin','No Open New Tab',1,1,NULL,'2022-01-28 18:06:01','2022-01-28 18:08:18'),(43,'procurement',16,'PO List',NULL,'pms/billing-audit/po-list',NULL,NULL,NULL,1,'Active','[\"upload-po-attachment\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2022-02-06 12:09:00','2022-02-06 12:09:00'),(44,'procurement',16,'Billing Attachment List',NULL,'pms/billing-audit/billing-po-attachment-list',NULL,NULL,NULL,2,'Active','[\"billing-wise-po-attachment-list\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2022-02-06 12:11:53','2022-02-06 12:11:53'),(45,'procurement',9,'Project Manage',NULL,'pms/acl/project-menu',NULL,NULL,NULL,4,'Active','[\"project-manage\"]','Sub menu for admin','No Open New Tab',1,1,'2023-06-14 11:31:10','2022-02-15 18:06:12','2023-06-14 11:31:10'),(46,'procurement',11,'Delivered List',NULL,'pms/store-manage/delivered-list',NULL,NULL,NULL,5,'Active','[\"store-deliverd-requistion-list\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2022-02-16 14:10:15','2022-02-16 14:10:15'),(47,'procurement',18,'GRN Waiting List',NULL,'pms/qce-list',NULL,NULL,NULL,1,'Active','[\"grn-stock-in-list\"]','Sub menu for admin','No Open New Tab',1,1,NULL,'2022-02-21 11:36:29','2022-06-22 07:10:13'),(48,'procurement',10,'FAQ',NULL,'pms/return-faq',NULL,NULL,NULL,6,'Active','[\"faq-delete\",\"faq-edit\",\"faq-create\",\"faq-list\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2022-02-21 17:47:55','2022-02-21 17:47:55'),(49,'procurement',18,'GRN List',NULL,'pms/grn-list',NULL,NULL,NULL,2,'Active','[\"grn-stock-in-list\"]','Sub menu for admin','No Open New Tab',1,1,NULL,'2022-02-25 12:50:01','2022-05-16 13:15:22'),(50,'procurement',19,'Supplier Payments',NULL,'pms/accounts/supplier-payments',NULL,NULL,NULL,2,'Active','[\"accounts-delete\",\"accounts-edit\",\"accounts-create\",\"accounts-list\"]','Sub menu for admin','No Open New Tab',1,1,'2023-06-14 15:35:59','2022-03-01 12:58:08','2023-06-14 15:35:59'),(51,'procurement',19,'Supplier Ledger',NULL,'pms/accounts/supplier-ledgers',NULL,NULL,NULL,3,'Active','[\"supplier-ledger-delete\",\"supplier-ledger-edit\",\"supplier-ledger-create\",\"supplier-ledger-list\"]','Sub menu for admin','No Open New Tab',1,1,'2023-06-14 15:35:59','2022-03-01 12:59:15','2023-06-14 15:35:59'),(52,'procurement',19,'Billing List',NULL,'pms/accounts/billing-list',NULL,NULL,NULL,1,'Active','[\"accounts-po-attachment-list\"]','Sub menu for admin','No Open New Tab',1,NULL,'2023-06-14 15:35:59','2022-03-03 18:28:28','2023-06-14 15:35:59'),(53,'procurement',19,'Chart Of Accounts',NULL,'pms/accounts/chart-of-accounts',NULL,NULL,NULL,4,'Active','[\"account-groups-delete\",\"account-groups-edit\",\"account-groups-create\",\"chart-of-accounts-delete\",\"chart-of-accounts-edit\",\"chart-of-accounts-create\",\"chart-of-accounts\"]','Sub menu for admin','No Open New Tab',1,1,'2022-03-25 17:10:16','2022-03-17 11:17:20','2022-03-25 17:10:16'),(54,'procurement',9,'Accounting Manage',NULL,'pms/acl/accounting-menu','las la-money-alt',NULL,NULL,5,'Active','[\"account-groups-delete\",\"account-groups-edit\",\"account-groups-create\",\"chart-of-accounts-delete\",\"chart-of-accounts-edit\",\"chart-of-accounts-create\",\"chart-of-accounts\"]','Sub menu for admin','No Open New Tab',1,1,'2023-06-14 11:31:03','2022-03-21 18:00:08','2023-06-14 11:31:03'),(55,'procurement',6,'Attributes',NULL,'pms/product-management/attributes','las la-sitemap',NULL,NULL,6,'Active','[\"attribute-delete\",\"attribute-edit\",\"attribute-create\",\"attributes\"]','Sub menu for admin','No Open New Tab',1,NULL,'2022-05-11 11:28:36','2022-04-08 14:07:39','2022-05-11 11:28:36'),(56,'procurement',6,'Attributes',NULL,'pms/product-management/attribute-options','las la-clipboard-list',NULL,NULL,6,'Active','[\"attribute-option-delete\",\"attribute-option-edit\",\"attribute-option-create\",\"attribute-options\",\"attribute-delete\",\"attribute-edit\",\"attribute-create\",\"attributes\",\"product-list\"]','Sub menu for admin','No Open New Tab',1,1,NULL,'2022-04-08 14:08:41','2022-06-03 15:32:09'),(57,'procurement',5,'Inventory Stock Report',NULL,'pms/inventory/inventory-stock-report','las la-warehouse',NULL,NULL,3,'Active','[\"inventory-stock-report\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2022-04-25 15:38:26','2022-04-25 15:38:26'),(58,'procurement',6,'Sub Category',NULL,'pms/product-management/sub-category',NULL,NULL,NULL,3,'Active','[\"sub-category-list\",\"category-delete\",\"category-edit\",\"category-create\"]','Sub menu for admin','No Open New Tab',1,1,NULL,'2022-05-27 13:00:21','2022-06-16 12:03:59'),(59,'procurement',3,'Halt Requisitions',NULL,'pms/requisition/halt-requisition','la la-ban',NULL,NULL,1,'Active','[\"halt-requisitions\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2022-06-07 12:08:33','2022-06-07 12:08:33'),(60,'procurement',7,'Quotation Reject List',NULL,'pms/quotation/reject-list',NULL,NULL,NULL,5,'Active','[\"quotation-reject-list\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2022-06-22 03:14:35','2022-06-22 03:14:35'),(61,'procurement',7,'Estimate List',NULL,'pms/quotation/estimate-approval-list',NULL,NULL,NULL,6,'Active','[\"estimate-approval-list\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2022-06-22 03:15:01','2022-06-22 03:15:01'),(62,'procurement',7,'Estimate Reject List',NULL,'pms/quotation/estimate-reject-list',NULL,NULL,NULL,7,'Active','[\"estimate-reject-list\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2022-06-22 03:15:18','2022-06-22 03:15:18'),(63,'procurement',14,'Gate Out List',NULL,'pms/grn/gate-out-list',NULL,NULL,NULL,3,'Active','[\"gate-out-list\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2022-06-22 03:16:27','2022-06-22 03:16:27'),(64,'procurement',13,'PO Cancelled List',NULL,'pms/purchase/po-cancelled-list',NULL,NULL,NULL,2,'Active','[\"work-order-cancel\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2022-06-22 10:37:42','2022-06-22 10:37:42'),(65,'procurement',24,'Entry Types',NULL,'accounting/entry-types','las la-journal-whills',NULL,NULL,1,'Active','[\"entry-type-delete\",\"entry-type-edit\",\"entry-type-create\",\"entry-types\"]','Sub menu for admin','No Open New Tab',1,NULL,'2023-06-14 15:36:36','2022-08-18 17:01:50','2023-06-14 15:36:36'),(66,'procurement',24,'Tags',NULL,'accounting/tags','las la-tags',NULL,NULL,2,'Active','[\"tag-delete\",\"tag-edit\",\"tag-create\",\"tags\"]','Sub menu for admin','No Open New Tab',1,NULL,'2023-06-14 15:36:36','2022-08-18 17:02:25','2023-06-14 15:36:36'),(67,'procurement',24,'Bank Accounts',NULL,'accounting/bank-accounts','las la-money-check-alt',NULL,NULL,3,'Active','[\"supplier-wise-entry-list\",\"bank-account-approve\",\"bank-account-assessment\",\"bank-account-review\",\"bank-account-request\",\"bank-account-delete\",\"bank-account-edit\",\"bank-account-create\",\"bank-accounts\",\"accounts-list\"]','Sub menu for admin','No Open New Tab',1,1,'2023-06-14 15:36:36','2022-08-18 17:03:03','2023-06-14 15:36:36'),(68,'procurement',24,'Fiscal Years',NULL,'accounting/fiscal-years','las la-calendar-alt',NULL,NULL,4,'Active','[\"fiscal-year-delete\",\"fiscal-year-edit\",\"fiscal-year-create\",\"fiscal-years\"]','Sub menu for admin','No Open New Tab',1,NULL,'2023-06-14 15:36:36','2022-08-18 17:03:52','2023-06-14 15:36:36'),(69,'procurement',24,'Companies',NULL,'accounting/companies','las la-building',NULL,NULL,5,'Active','null','Sub menu for admin','No Open New Tab',1,NULL,'2023-06-14 15:36:36','2022-08-18 17:09:00','2023-06-14 15:36:36'),(70,'procurement',24,'Cost Centre\'s',NULL,'accounting/cost-centres','lab la-sourcetree',NULL,NULL,6,'Active','null','Sub menu for admin','No Open New Tab',1,NULL,'2023-06-14 15:36:36','2022-08-18 17:09:45','2023-06-14 15:36:36'),(71,'procurement',25,'Trial Balance (Balance)',NULL,'accounting/trial-balance-with-balance','las la-sitemap',NULL,NULL,6,'Active','[\"trial-balance-with-balance\"]','Sub menu for admin','No Open New Tab',1,1,'2023-06-14 15:36:59','2022-08-18 17:11:29','2023-06-14 15:36:59'),(72,'procurement',25,'Balance Sheet',NULL,'accounting/balance-sheet','las la-balance-scale',NULL,NULL,1,'Active','null','Sub menu for admin','No Open New Tab',1,NULL,'2023-06-14 15:36:59','2022-08-18 17:13:26','2023-06-14 15:36:59'),(73,'procurement',25,'Profit & Loss',NULL,'accounting/profit-loss','las la-hand-holding-usd',NULL,NULL,2,'Active','null','Sub menu for admin','No Open New Tab',1,NULL,'2023-06-14 15:36:59','2022-08-18 17:14:02','2023-06-14 15:36:59'),(74,'procurement',25,'Trial Balance',NULL,'accounting/trial-balance','las la-sitemap',NULL,NULL,3,'Active','null','Sub menu for admin','No Open New Tab',1,NULL,'2023-06-14 15:36:59','2022-08-18 17:14:31','2023-06-14 15:36:59'),(75,'procurement',25,'Ledger Statement',NULL,'accounting/ledger-statement','lar la-file-alt',NULL,NULL,4,'Active','null','Sub menu for admin','No Open New Tab',1,1,'2023-06-14 15:36:59','2022-08-18 17:15:10','2023-06-14 15:36:59'),(76,'procurement',25,'Ledger Entries',NULL,'accounting/ledger-entries','las la-sort-amount-up-alt',NULL,NULL,5,'Active','null','Sub menu for admin','No Open New Tab',1,NULL,'2023-06-14 15:36:59','2022-08-18 17:16:12','2023-06-14 15:36:59'),(77,'procurement',24,'Accounts Default Settings',NULL,'accounting/accounts-default-settings',NULL,NULL,NULL,7,'Active','[\"accounts-default-settings\"]','Sub menu for admin','No Open New Tab',1,NULL,'2023-06-14 15:36:36','2022-08-26 04:42:08','2023-06-14 15:36:36'),(78,'procurement',19,'PO Wise Entry List',NULL,'pms/accounts/po-wise-entry-list',NULL,NULL,NULL,4,'Active','[\"po-wise-entry-list\"]','Sub menu for admin','No Open New Tab',1,NULL,'2023-06-14 15:35:59','2022-09-08 15:47:37','2023-06-14 15:35:59'),(79,'procurement',19,'Supplier Wise Entry List',NULL,'pms/accounts/supplier-wise-entry-list',NULL,NULL,NULL,5,'Active','[\"supplier-wise-entry-list\"]','Sub menu for admin','No Open New Tab',1,NULL,'2023-06-14 15:35:59','2022-09-08 15:48:05','2023-06-14 15:35:59'),(80,'procurement',28,'Fixed Assets Locations',NULL,'accounting/fixed-asset-locations',NULL,NULL,NULL,1,'Active','[\"fixed-asset-location-delete\",\"fixed-asset-location-edit\",\"fixed-asset-location-create\",\"fixed-asset-locations\"]','Sub menu for admin','No Open New Tab',1,NULL,'2023-06-14 15:37:03','2022-09-24 08:20:13','2023-06-14 15:37:03'),(81,'procurement',29,'Fixed Asset Distributions',NULL,'accounting/fixed-asset-distributions','las la-user-tag',NULL,NULL,1,'Active','[\"fixed-asset-distribution-history\",\"fixed-asset-distributions\"]','Sub menu for admin','No Open New Tab',1,NULL,'2023-06-14 15:37:07','2022-09-25 12:19:11','2023-06-14 15:37:07'),(82,'procurement',29,'Fixed Asset Depreciations',NULL,'accounting/fixed-asset-depreciations','las la-hand-holding-usd',NULL,NULL,2,'Active','[\"fixed-asset-depreciation-history\",\"fixed-asset-depreciations\"]','Sub menu for admin','No Open New Tab',1,NULL,'2022-10-05 11:21:30','2022-09-25 12:20:50','2022-10-05 11:21:30'),(83,'procurement',29,'My Assets',NULL,'accounting/my-assets','las la-cart-arrow-down',NULL,NULL,0,'Active','[\"receive-assets\",\"my-assets\"]','Sub menu for admin','No Open New Tab',1,NULL,'2023-06-14 15:37:07','2022-09-26 08:23:43','2023-06-14 15:37:07'),(84,'procurement',29,'Print Barcodes',NULL,'accounting/print-fixed-asset-barcodes','las la-barcode',NULL,NULL,3,'Active','[\"fixed-asset-barcode\"]','Sub menu for admin','No Open New Tab',1,NULL,'2023-06-14 15:37:07','2022-09-26 10:15:06','2023-06-14 15:37:07'),(85,'procurement',29,'Fixed Asset Inspections',NULL,'accounting/fixed-asset-inspections','las la-check-double',NULL,NULL,4,'Active','[\"fixed-asset-physical-status-history\",\"fixed-asset-physical-status-update\",\"fixed-asset-physical-status\"]','Sub menu for admin','No Open New Tab',1,NULL,'2023-06-14 15:37:07','2022-09-26 12:55:59','2023-06-14 15:37:07'),(86,'procurement',30,'Fixed Asset Report',NULL,'accounting/fixed-asset-report',NULL,NULL,NULL,1,'Active','[\"fixed-asset-report\"]','Sub menu for admin','No Open New Tab',1,NULL,'2023-06-14 15:35:13','2022-09-27 09:12:21','2023-06-14 15:35:13'),(87,'procurement',29,'Fixed Asset Movements',NULL,'accounting/fixed-asset-movements','las la-people-carry',NULL,NULL,5,'Active','[\"fixed-asset-move\",\"fixed-asset-movement-approval\",\"fixed-asset-movements\"]','Sub menu for admin','No Open New Tab',1,NULL,'2023-06-14 15:37:07','2022-09-27 09:14:10','2023-06-14 15:37:07'),(88,'procurement',31,'Category',NULL,'pms/fixed-assets/category?fixed-assets',NULL,NULL,NULL,1,'Active','[\"fixed-assets-categories\"]','Sub menu for admin','No Open New Tab',1,1,'2023-06-14 15:35:45','2022-10-03 14:54:30','2023-06-14 15:35:45'),(89,'procurement',31,'Sub Category',NULL,'pms/fixed-assets/sub-category?fixed-assets',NULL,NULL,NULL,2,'Active','[\"fixed-asstes-subcategories\"]','Sub menu for admin','No Open New Tab',1,1,'2023-06-14 15:35:45','2022-10-03 14:54:51','2023-06-14 15:35:45'),(90,'procurement',31,'Fixed Assets',NULL,'pms/fixed-assets/product?fixed-assets',NULL,NULL,NULL,3,'Active','[\"fixed-asstes-products\"]','Sub menu for admin','No Open New Tab',1,1,'2023-06-14 15:35:45','2022-10-03 14:55:35','2023-06-14 15:35:45'),(91,'procurement',32,'Depreciation Book',NULL,'accounting/depreciation-book','las la-book',NULL,NULL,1,'Active','[\"depreciation-history\",\"depreciation-book\"]','Sub menu for admin','No Open New Tab',1,NULL,'2023-06-14 15:35:41','2022-10-05 10:45:47','2023-06-14 15:35:41'),(92,'procurement',32,'Process Depreciation',NULL,'accounting/process-depreciation','las la-hourglass-start',NULL,NULL,2,'Active','[\"process-depreciation\"]','Sub menu for admin','No Open New Tab',1,NULL,'2023-06-14 15:35:41','2022-10-05 10:46:54','2023-06-14 15:35:41'),(93,'procurement',32,'Fixed Assets Valuations',NULL,'accounting/fixed-assets-valuations','las la-coins',NULL,NULL,3,'Active','[\"depreciation-valuations\"]','Sub menu for admin','No Open New Tab',1,NULL,'2023-06-14 15:35:41','2022-10-06 09:33:09','2023-06-14 15:35:41'),(94,'procurement',33,'Fixed Asset Disposal',NULL,'accounting/fixed-asset-disposal','las la-trash-alt',NULL,NULL,1,'Active','[\"fixed-asset-disposal\"]','Sub menu for admin','No Open New Tab',1,NULL,'2023-06-14 15:35:36','2022-10-06 10:30:38','2023-06-14 15:35:36'),(95,'procurement',33,'Disposed Fixed Assets',NULL,'accounting/disposed-fixed-assets','las la-dumpster',NULL,NULL,2,'Active','[\"fixed-asset-disposal-history\"]','Sub menu for admin','No Open New Tab',1,NULL,'2023-06-14 15:35:36','2022-10-06 10:32:06','2023-06-14 15:35:36'),(96,'procurement',16,'PO Advance',NULL,'pms/billing-audit/po-advance',NULL,NULL,NULL,3,'Active','[\"po-advance-audit\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2022-10-12 23:30:12','2022-10-12 23:30:12'),(97,'procurement',24,'Advance categories',NULL,'accounting/advance-categories',NULL,NULL,NULL,8,'Active','[\"advance-category-delete\",\"advance-category-edit\",\"advance-category-create\",\"advance-categories\"]','Sub menu for admin','No Open New Tab',1,NULL,'2023-06-14 15:36:36','2022-10-19 15:51:10','2023-06-14 15:36:36'),(98,'procurement',34,'Category',NULL,'pms/cwip/category?cwip',NULL,NULL,NULL,1,'Active','[\"cwip-categories\"]','Sub menu for admin','No Open New Tab',1,1,'2023-06-14 15:35:31','2022-10-23 10:59:33','2023-06-14 15:35:31'),(99,'procurement',34,'Sub Category',NULL,'pms/cwip/sub-category?cwip',NULL,NULL,NULL,2,'Active','[\"cwip-sub-categories\"]','Sub menu for admin','No Open New Tab',1,1,'2023-06-14 15:35:31','2022-10-23 11:00:29','2023-06-14 15:35:31'),(100,'procurement',34,'CWIP',NULL,'pms/cwip/product?cwip',NULL,NULL,NULL,3,'Active','[\"cwip-products\"]','Sub menu for admin','No Open New Tab',1,1,'2023-06-14 15:35:31','2022-10-23 11:01:00','2023-06-14 15:35:31'),(101,'procurement',30,'Cost Center\'s Wise Report',NULL,'accounting/cost-center-wise-fixed-asset-report',NULL,NULL,NULL,2,'Active','[\"cost-center-wise-fixed-asset-report\"]','Sub menu for admin','No Open New Tab',1,NULL,'2023-06-14 15:35:13','2022-11-03 09:54:41','2023-06-14 15:35:13'),(102,'procurement',30,'Fixed Asset Physical Status Report',NULL,'accounting/fixed-asset-physical-status-report',NULL,NULL,NULL,3,'Active','[\"fixed-asset-physical-status-report\"]','Sub menu for admin','No Open New Tab',1,NULL,'2023-06-14 15:35:13','2022-11-03 09:55:07','2023-06-14 15:35:13'),(103,'procurement',30,'Posted Fixed Asset Movement Status Report',NULL,'accounting/posted-fixed-asset-movement-status-report',NULL,NULL,NULL,4,'Active','[\"posted-fixed-asset-movement-status-report\"]','Sub menu for admin','No Open New Tab',1,NULL,'2023-06-14 15:35:13','2022-11-03 10:00:27','2023-06-14 15:35:13'),(104,'procurement',38,'Reconcile Bank Account',NULL,'accounting/reconcile-bank-account','las la-balance-scale-left',NULL,NULL,1,'Active','[\"bank-reconciliation\"]','Sub menu for admin','No Open New Tab',1,NULL,'2023-06-14 15:34:59','2022-11-08 13:39:31','2023-06-14 15:34:59'),(105,'procurement',38,'BR  History',NULL,'accounting/bank-reconciliation-history','las la-book-open',NULL,NULL,2,'Active','[\"bank-reconciliation-history\"]','Sub menu for admin','No Open New Tab',1,1,'2023-06-14 15:34:59','2022-11-08 13:40:52','2023-06-14 15:34:59'),(106,'procurement',30,'Asset History Report',NULL,'accounting/asset-history-report',NULL,NULL,NULL,5,'Active','[\"asset-history-report\"]','Sub menu for admin','No Open New Tab',1,NULL,'2023-06-14 15:35:13','2022-11-09 10:53:51','2023-06-14 15:35:13'),(107,'procurement',38,'BR Statements',NULL,'accounting/bank-reconciliation-statements','lar la-file-alt',NULL,NULL,3,'Active','[\"bank-reconciliation-statements\"]','Sub menu for admin','No Open New Tab',1,1,'2023-06-14 15:34:59','2022-11-15 11:37:11','2023-06-14 15:34:59'),(108,'procurement',39,'Exchange Rates',NULL,'accounting/exchange-rates','las la-hand-holding-usd',NULL,NULL,1,'Active','[\"exchange-rates\"]','Sub menu for admin','No Open New Tab',1,NULL,'2023-06-14 15:34:55','2022-11-27 13:15:23','2023-06-14 15:34:55'),(109,'procurement',39,'Currencies',NULL,'accounting/currencies','las la-dollar-sign',NULL,NULL,2,'Active','[\"currencies\"]','Sub menu for admin','No Open New Tab',1,1,'2023-06-14 15:34:55','2022-11-27 13:16:59','2023-06-14 15:34:55'),(110,'procurement',39,'Currency Types',NULL,'accounting/currency-types','las la-coins',NULL,NULL,3,'Active','[\"currency-types\"]','Sub menu for admin','No Open New Tab',1,NULL,'2023-06-14 15:34:55','2022-11-27 13:18:13','2023-06-14 15:34:55'),(111,'procurement',40,'Loan Types',NULL,'accounting/loan-types',NULL,NULL,NULL,1,'Active','[\"loan-types\"]','Sub menu for admin','No Open New Tab',1,NULL,'2023-06-14 15:34:51','2022-12-22 09:39:53','2023-06-14 15:34:51'),(112,'procurement',40,'Loans',NULL,'accounting/loans','las la-hand-holding-usd',NULL,NULL,2,'Active','[\"loan-schedule-installments\",\"loan-schedules\",\"loans\"]','Sub menu for admin','No Open New Tab',1,NULL,'2023-06-14 15:34:51','2022-12-22 09:42:55','2023-06-14 15:34:51'),(113,'procurement',40,'Loan Payments',NULL,'accounting/loan-payments','las la-coins',NULL,NULL,3,'Active','[\"loan-schedule-payments\"]','Sub menu for admin','No Open New Tab',1,NULL,'2023-06-14 15:34:51','2022-12-22 09:58:47','2023-06-14 15:34:51'),(114,'procurement',30,'Fixed Asset Register',NULL,'accounting/fixed-asset-register','las la-book-open',NULL,NULL,0,'Active','[\"fixed-asset-register\"]','Sub menu for admin','No Open New Tab',1,NULL,'2023-06-14 15:35:13','2023-02-22 11:31:57','2023-06-14 15:35:13'),(115,'procurement',19,'Supplier Balance',NULL,'accounting/supplier-balance','las la-balance-scale',NULL,NULL,6,'Active','null','Sub menu for admin','No Open New Tab',1,NULL,'2023-06-14 15:35:59','2023-03-07 10:33:54','2023-06-14 15:35:59'),(116,'procurement',41,'Cheque Books',NULL,'accounting/cheque-books','las la-money-check',NULL,NULL,1,'Active','[\"cheque-book-delete\",\"cheque-book-edit\",\"cheque-book-create\",\"cheque-book-page-damage\",\"cheque-book-pages\",\"cheque-books\"]','Sub menu for admin','No Open New Tab',1,1,'2023-06-14 15:36:49','2023-03-28 11:40:07','2023-06-14 15:36:49'),(117,'procurement',41,'Cheque Register',NULL,'accounting/cheque-register','las la-money-check-alt',NULL,NULL,2,'Active','[\"cheque-register\"]','Sub menu for admin','No Open New Tab',1,NULL,'2023-06-14 15:36:49','2023-03-28 11:41:27','2023-06-14 15:36:49'),(118,'procurement',30,'Category wise Asset Register',NULL,'accounting/category-wise-asset-register',NULL,NULL,NULL,6,'Active','[\"category-wise-asset-register\"]','Sub menu for admin','No Open New Tab',1,NULL,'2023-06-14 15:35:13','2023-04-11 11:45:08','2023-06-14 15:35:13'),(119,'procurement',30,'Sub Category wise Asset Register',NULL,'accounting/sub-category-wise-asset-register',NULL,NULL,NULL,7,'Active','[\"sub-category-wise-asset-register\"]','Sub menu for admin','No Open New Tab',1,NULL,'2023-06-14 15:35:13','2023-04-11 11:46:04','2023-06-14 15:35:13'),(120,'procurement',42,'Service Confirmation',NULL,'pms/grn/service-confirmation','las la-code-branch',NULL,NULL,1,'Active','[\"service-confirmation\"]','Sub menu for admin','No Open New Tab',1,1,NULL,'2023-04-20 13:15:45','2023-04-20 13:48:16'),(121,'procurement',42,'Confirmed Services',NULL,'pms/grn/confirmed-services','las la-check',NULL,NULL,2,'Active','[\"confirmed-services\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-04-26 14:52:51','2023-04-26 14:52:51'),(122,'procurement',30,'Asset cost breakdown',NULL,'accounting/asset-cost-breakdown','las la-dollar-sign',NULL,NULL,8,'Active','[\"asset-cost-breakdown\"]','Sub menu for admin','No Open New Tab',1,NULL,'2023-06-14 15:35:13','2023-04-29 10:00:09','2023-06-14 15:35:13'),(123,'procurement',19,'Advance Clearings',NULL,'accounting/advance-clearings','las la-receipt',NULL,NULL,3,'Active','[\"advance-clearing-posting\",\"advance-clearing\"]','Sub menu for admin','No Open New Tab',1,NULL,'2023-06-14 15:35:59','2023-05-06 11:51:17','2023-06-14 15:35:59'),(124,'procurement',45,'Unrealized Currency Settings',NULL,'accounting/unrealized-currency-settings','las la-cogs',NULL,NULL,1,'Active','[\"unrealized-currency-settings\"]','Sub menu for admin','No Open New Tab',1,NULL,'2023-06-14 15:34:33','2023-05-25 11:53:08','2023-06-14 15:34:33'),(125,'procurement',45,'Unrealized Currency Evaluation',NULL,'accounting/unrealized-currency-evaluation','las la-balance-scale',NULL,NULL,2,'Active','[\"unrealized-currency-events\"]','Sub menu for admin','No Open New Tab',1,NULL,'2023-06-14 15:34:33','2023-05-25 11:54:44','2023-06-14 15:34:33'),(126,'procurement',45,'Unrealized Currency Histories',NULL,'accounting/unrealized-currency-histories','las la-history',NULL,NULL,3,'Active','[\"unrealized-currency-event-histories\"]','Sub menu for admin','No Open New Tab',1,NULL,'2023-06-14 15:34:33','2023-05-25 11:56:16','2023-06-14 15:34:33'),(127,'procurement',45,'edr32dr',NULL,'23re23er3e','3re3',NULL,NULL,4,'Active','[\"unrealized-currency-event-histories\"]','Sub menu for admin','No Open New Tab',1,NULL,'2023-06-14 15:34:33','2023-06-01 12:55:15','2023-06-14 15:34:33'),(128,'project-management',50,'Day Setup',NULL,'/pms/day-setup','las la-calendar',NULL,NULL,1,'Active','[\"day-setup-delete\",\"day-setup-update\",\"day-setup-edit\",\"day-setup-create\",\"day-setup\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:05:43','2023-06-01 13:05:43'),(129,'project-management',50,'Holiday Setup',NULL,'/pms/holiday-setup','las la-list',NULL,NULL,2,'Active','[\"holiday-setup-update\",\"holiday-setup-delete\",\"holiday-setup-edit\",\"holiday-setup-create\",\"holiday-setup\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:05:43','2023-06-01 13:05:43'),(130,'project-management',50,'Departments',NULL,'pms/departments',NULL,NULL,NULL,3,'Active','[\"department-delete\",\"department-edit\",\"department-add\",\"departments\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:05:44','2023-06-01 13:05:44'),(131,'project-management',50,'Project Type',NULL,'pms/project-type',NULL,NULL,NULL,4,'Active','[\"project-type-delete\",\"project-type-edit\",\"project-type-create\",\"project-type-list\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:05:44','2023-06-01 13:05:44'),(132,'project-management',50,'Project Objective',NULL,'pms/project-objective','las la-list',NULL,NULL,5,'Inactive','[\"project-objective-delete\",\"project-objective-edit\",\"project-objective-add\",\"project-objectives\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:05:44','2023-06-01 13:05:44'),(133,'project-management',50,'Portfolios',NULL,'pms/portfolio',NULL,NULL,NULL,6,'Active','[\"portfolio-delete\",\"portfolio-edit\",\"portfolio-add\",\"portfolios\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:05:44','2023-06-01 13:05:44'),(134,'project-management',50,'Programs',NULL,'pms/program',NULL,NULL,NULL,7,'Active','[\"program-delete\",\"program-edit\",\"program-add\",\"programs\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:05:44','2023-06-01 13:05:44'),(135,'project-management',52,'Draft List',NULL,'pms/draft-list',NULL,NULL,NULL,1,'Active','[\"project-manage-draft-list\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:05:44','2023-06-01 13:05:44'),(136,'project-management',52,'Waiting For Approval List',NULL,'pms/my-project',NULL,NULL,NULL,2,'Active','[\"project-manage-pending-list\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:05:44','2023-06-01 13:05:44'),(137,'project-management',52,'Ongoing List',NULL,'pms/ongoing-list',NULL,NULL,NULL,3,'Active','[\"project-manage-ongoing-list\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:05:44','2023-06-01 13:05:44'),(138,'project-management',52,'Reapproval List',NULL,'pms/reapproval-list',NULL,NULL,NULL,4,'Active','[\"project-manage-reapproval-list\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:05:44','2023-06-01 13:05:44'),(139,'project-management',52,'Halt List',NULL,'pms/halt-list',NULL,NULL,NULL,5,'Active','[\"project-manage-halt-list\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:05:44','2023-06-01 13:05:44'),(140,'project-management',52,'Closed List',NULL,'pms/close-list',NULL,NULL,NULL,6,'Active','[\"project-manage-close-list\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:05:44','2023-06-01 13:05:44'),(141,'project-management',52,'Planned List',NULL,'pms/planned-list',NULL,NULL,NULL,7,'Active','[\"project-manage-planned-list\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:05:44','2023-06-01 13:05:44'),(142,'finance',55,'Entry Types',NULL,'accounting/entry-types','las la-journal-whills',NULL,NULL,1,'Active','[\"entry-types\",\"entry-type-delete\",\"entry-type-edit\",\"entry-type-create\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:14','2023-06-01 13:08:14'),(143,'finance',55,'Tags',NULL,'accounting/tags','las la-tags',NULL,NULL,2,'Active','[\"tags\",\"tag-delete\",\"tag-edit\",\"tag-create\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:14','2023-06-01 13:08:14'),(144,'finance',96,'Bank Accounts',NULL,'accounting/bank-accounts','las la-money-check-alt',NULL,NULL,1,'Active','[\"bank-account-approve\",\"bank-account-assessment\",\"bank-account-review\",\"bank-account-request\",\"bank-account-delete\",\"bank-account-edit\",\"bank-account-create\",\"bank-accounts\",\"accounts-list\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:14','2023-06-01 13:08:14'),(145,'finance',55,'Fiscal Years',NULL,'accounting/fiscal-years','las la-calendar-alt',NULL,NULL,4,'Active','[\"fiscal-year-delete\",\"fiscal-year-edit\",\"fiscal-year-create\",\"fiscal-years\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:14','2023-06-01 13:08:14'),(146,'finance',55,'Companies',NULL,'accounting/companies','las la-building',NULL,NULL,5,'Active','[\"company-delete\",\"company-edit\",\"company-create\",\"companies\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:14','2023-06-01 13:08:14'),(147,'finance',55,'Cost Centre',NULL,'accounting/cost-centres','lab la-sourcetree',NULL,NULL,7,'Active','[\"cost-centres\",\"cost-centre-delete\",\"cost-centre-edit\",\"cost-centre-create\"]','Sub menu for admin','No Open New Tab',1,1,NULL,'2023-06-01 13:08:14','2024-02-07 15:04:37'),(148,'finance',55,'Accounts Default Settings',NULL,'accounting/accounts-default-settings',NULL,NULL,NULL,8,'Active','[\"accounts-default-settings\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:14','2023-06-01 13:08:14'),(149,'finance',55,'Advance categories',NULL,'accounting/advance-categories',NULL,NULL,NULL,9,'Active','[\"advance-category-delete\",\"advance-category-edit\",\"advance-category-create\",\"advance-categories\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:14','2023-06-01 13:08:14'),(150,'finance',57,'Balance Sheet',NULL,'accounting/balance-sheet','las la-balance-scale',NULL,NULL,1,'Active','[\"balance-sheet\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:14','2023-06-01 13:08:14'),(151,'finance',57,'Profit & Loss',NULL,'accounting/profit-loss','las la-hand-holding-usd',NULL,NULL,2,'Active','[\"profit-loss\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:14','2023-06-01 13:08:14'),(152,'finance',57,'Trial Balance',NULL,'accounting/trial-balance','las la-sitemap',NULL,NULL,3,'Active','[\"trial-balance\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:14','2023-06-01 13:08:14'),(153,'finance',57,'Ledger Statement',NULL,'accounting/ledger-statement','lar la-file-alt',NULL,NULL,4,'Active','[\"ledger-statement\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:14','2023-06-01 13:08:14'),(154,'finance',57,'Ledger Entries',NULL,'accounting/ledger-entries','las la-sort-amount-up-alt',NULL,NULL,5,'Active','[\"ledger-entries\"]','Sub menu for admin','No Open New Tab',1,NULL,'2024-02-29 10:43:33','2023-06-01 13:08:14','2024-02-29 10:43:33'),(155,'finance',57,'Trial Balance (Balance)',NULL,'accounting/trial-balance-with-balance','las la-sitemap',NULL,NULL,6,'Active','[\"trial-balance-with-balance\"]','Sub menu for admin','No Open New Tab',1,NULL,'2024-02-29 10:43:29','2023-06-01 13:08:14','2024-02-29 10:43:29'),(156,'finance',58,'Requisitions',NULL,'pms/requisition/requisition',NULL,NULL,NULL,1,'Active','[\"requisition-list\"]','Sub menu for admin','No Open New Tab',1,NULL,'2023-06-14 11:30:51','2023-06-01 13:08:15','2023-06-14 11:30:51'),(157,'finance',58,'Halt Requisitions',NULL,'pms/requisition/halt-requisition','la la-ban',NULL,NULL,2,'Active','[\"halt-requisitions\"]','Sub menu for admin','No Open New Tab',1,NULL,'2023-06-14 11:30:51','2023-06-01 13:08:15','2023-06-14 11:30:51'),(158,'finance',58,'Notification List',NULL,'pms/requisition/notification-all',NULL,NULL,NULL,3,'Active','[\"notification-list\"]','Sub menu for admin','No Open New Tab',1,NULL,'2023-06-14 11:30:51','2023-06-01 13:08:15','2023-06-14 11:30:51'),(159,'finance',58,'Delivered Requisition  List',NULL,'pms/requisition/delivered-requistion-list',NULL,NULL,NULL,4,'Active','[\"requisition-delivered-list\"]','Sub menu for admin','No Open New Tab',1,NULL,'2023-06-14 11:30:51','2023-06-01 13:08:15','2023-06-14 11:30:51'),(160,'finance',60,'Billing List',NULL,'pms/accounts/billing-list',NULL,NULL,NULL,1,'Active','[\"accounts-po-attachment-list\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:15','2023-06-01 13:08:15'),(161,'finance',60,'Supplier Payments',NULL,'pms/accounts/supplier-payments',NULL,NULL,NULL,2,'Active','[\"accounts-delete\",\"accounts-edit\",\"accounts-create\",\"accounts-list\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:15','2023-06-01 13:08:15'),(162,'finance',60,'Supplier Ledger',NULL,'pms/accounts/supplier-ledgers',NULL,NULL,NULL,3,'Active','[\"supplier-ledger-delete\",\"supplier-ledger-edit\",\"supplier-ledger-create\",\"supplier-ledger-list\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:15','2023-06-01 13:08:15'),(163,'finance',60,'Advance Clearings',NULL,'accounting/advance-clearings','las la-receipt',NULL,NULL,3,'Active','[\"advance-clearing-posting\",\"advance-clearing\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:15','2023-06-01 13:08:15'),(164,'finance',60,'PO Wise Entry List',NULL,'pms/accounts/po-wise-entry-list',NULL,NULL,NULL,4,'Active','[\"po-wise-entry-list\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:15','2023-06-01 13:08:15'),(165,'finance',60,'Supplier Wise Entry List',NULL,'pms/accounts/supplier-wise-entry-list',NULL,NULL,NULL,5,'Active','[\"supplier-wise-entry-list\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:15','2023-06-01 13:08:15'),(166,'finance',60,'Supplier Balance',NULL,'accounting/supplier-balance','las la-balance-scale',NULL,NULL,6,'Active','[\"supplier-balance\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:15','2023-06-01 13:08:15'),(167,'finance',61,'Fixed Assets Locations',NULL,'accounting/fixed-asset-locations',NULL,NULL,NULL,1,'Active','[\"fixed-asset-location-delete\",\"fixed-asset-location-edit\",\"fixed-asset-location-create\",\"fixed-asset-locations\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:15','2023-06-01 13:08:15'),(168,'finance',62,'My Assets',NULL,'accounting/my-assets','las la-cart-arrow-down',NULL,NULL,0,'Active','[\"receive-assets\",\"my-assets\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:15','2023-06-01 13:08:15'),(169,'finance',62,'Fixed Asset Distributions',NULL,'accounting/fixed-asset-distributions','las la-user-tag',NULL,NULL,1,'Active','[\"fixed-asset-distribution-history\",\"fixed-asset-distributions\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:15','2023-06-01 13:08:15'),(170,'finance',62,'Print Barcodes',NULL,'accounting/print-fixed-asset-barcodes','las la-barcode',NULL,NULL,3,'Active','[\"fixed-asset-barcode\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:15','2023-06-01 13:08:15'),(171,'finance',62,'Fixed Asset Inspections',NULL,'accounting/fixed-asset-inspections','las la-check-double',NULL,NULL,4,'Active','[\"fixed-asset-physical-status-history\",\"fixed-asset-physical-status-update\",\"fixed-asset-physical-status\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:15','2023-06-01 13:08:15'),(172,'finance',62,'Fixed Asset Movements',NULL,'accounting/fixed-asset-movements','las la-people-carry',NULL,NULL,5,'Active','[\"fixed-asset-move\",\"fixed-asset-movement-approval\",\"fixed-asset-movements\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:15','2023-06-01 13:08:15'),(173,'finance',63,'Fixed Asset Register',NULL,'accounting/fixed-asset-register','las la-book-open',NULL,NULL,0,'Active','[\"fixed-asset-register\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:15','2023-06-01 13:08:15'),(174,'finance',63,'Fixed Asset Report',NULL,'accounting/fixed-asset-report',NULL,NULL,NULL,1,'Active','[\"fixed-asset-report\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:15','2023-06-01 13:08:15'),(175,'finance',63,'Cost Center\'s Wise Report',NULL,'accounting/cost-center-wise-fixed-asset-report',NULL,NULL,NULL,2,'Active','[\"cost-center-wise-fixed-asset-report\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:15','2023-06-01 13:08:15'),(176,'finance',63,'Fixed Asset Physical Status Report',NULL,'accounting/fixed-asset-physical-status-report',NULL,NULL,NULL,3,'Active','[\"fixed-asset-physical-status-report\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:15','2023-06-01 13:08:15'),(177,'finance',63,'Posted Fixed Asset Movement Status Report',NULL,'accounting/posted-fixed-asset-movement-status-report',NULL,NULL,NULL,4,'Active','[\"posted-fixed-asset-movement-status-report\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:15','2023-06-01 13:08:15'),(178,'finance',63,'Asset History Report',NULL,'accounting/asset-history-report',NULL,NULL,NULL,5,'Active','[\"asset-history-report\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:15','2023-06-01 13:08:15'),(179,'finance',63,'Category wise Asset Register',NULL,'accounting/category-wise-asset-register',NULL,NULL,NULL,6,'Active','[\"category-wise-asset-register\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:15','2023-06-01 13:08:15'),(180,'finance',63,'Sub Category wise Asset Register',NULL,'accounting/sub-category-wise-asset-register',NULL,NULL,NULL,7,'Active','[\"sub-category-wise-asset-register\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:15','2023-06-01 13:08:15'),(181,'finance',63,'Asset cost breakdown',NULL,'accounting/asset-cost-breakdown','las la-dollar-sign',NULL,NULL,8,'Active','[\"asset-cost-breakdown\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:15','2023-06-01 13:08:15'),(182,'finance',64,'Depreciation Book',NULL,'accounting/depreciation-book','las la-book',NULL,NULL,1,'Active','[\"depreciation-history\",\"depreciation-book\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:15','2023-06-01 13:08:15'),(183,'finance',64,'Process Depreciation',NULL,'accounting/process-depreciation','las la-hourglass-start',NULL,NULL,2,'Active','[\"process-depreciation\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:15','2023-06-01 13:08:15'),(184,'finance',64,'Fixed Asset Book Value',NULL,'accounting/fixed-assets-valuations','las la-coins',NULL,NULL,3,'Active','[\"depreciation-valuations\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:15','2023-06-01 13:08:15'),(185,'finance',65,'Fixed Asset Disposal',NULL,'accounting/fixed-asset-disposal','las la-trash-alt',NULL,NULL,1,'Active','[\"fixed-asset-disposal\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:15','2023-06-01 13:08:15'),(186,'finance',65,'Disposed Fixed Assets',NULL,'accounting/disposed-fixed-assets','las la-dumpster',NULL,NULL,2,'Active','[\"fixed-asset-disposal-history\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:15','2023-06-01 13:08:15'),(187,'finance',69,'Reconcile Bank Account',NULL,'accounting/reconcile-bank-account','las la-balance-scale-left',NULL,NULL,1,'Active','[\"bank-reconciliation\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:16','2023-06-01 13:08:16'),(188,'finance',69,'BR  History',NULL,'accounting/bank-reconciliation-history','las la-book-open',NULL,NULL,2,'Active','[\"bank-reconciliation-history\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:16','2023-06-01 13:08:16'),(189,'finance',69,'BR  Statements',NULL,'accounting/bank-reconciliation-statements','lar la-file-alt',NULL,NULL,3,'Active','[\"bank-reconciliation-statements\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:16','2023-06-01 13:08:16'),(190,'finance',70,'Exchange Rates',NULL,'accounting/exchange-rates','las la-hand-holding-usd',NULL,NULL,1,'Active','[\"exchange-rates\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:16','2023-06-01 13:08:16'),(191,'finance',70,'Currencies',NULL,'accounting/currencies','las la-dollar-sign',NULL,NULL,2,'Active','[\"currencies\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:16','2023-06-01 13:08:16'),(192,'finance',70,'Currency Types',NULL,'accounting/currency-types','las la-coins',NULL,NULL,3,'Active','[\"currency-types\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:16','2023-06-01 13:08:16'),(193,'finance',71,'Loan Types',NULL,'accounting/loan-types',NULL,NULL,NULL,1,'Active','[\"loan-types\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:16','2023-06-01 13:08:16'),(194,'finance',71,'Loans',NULL,'accounting/loans','las la-hand-holding-usd',NULL,NULL,2,'Active','[\"loan-schedule-installments\",\"loan-schedules\",\"loans\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:16','2023-06-01 13:08:16'),(195,'finance',71,'Loan Payments',NULL,'accounting/loan-payments','las la-coins',NULL,NULL,3,'Active','[\"loan-schedule-payments\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:16','2023-06-01 13:08:16'),(196,'finance',72,'Cheque Books',NULL,'accounting/cheque-books','las la-money-check',NULL,NULL,1,'Active','[\"cheque-book-delete\",\"cheque-book-edit\",\"cheque-book-create\",\"cheque-book-page-damage\",\"cheque-book-pages\",\"cheque-books\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:16','2023-06-01 13:08:16'),(197,'finance',72,'Cheque Register',NULL,'accounting/cheque-register','las la-money-check-alt',NULL,NULL,2,'Active','[\"cheque-register\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:16','2023-06-01 13:08:16'),(198,'finance',75,'Settings',NULL,'accounting/unrealized-currency-settings','las la-cogs',NULL,NULL,1,'Active','[\"unrealized-currency-settings\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:16','2023-06-01 13:08:16'),(199,'finance',75,'Evaluation',NULL,'accounting/unrealized-currency-evaluation','las la-balance-scale',NULL,NULL,2,'Active','[\"unrealized-currency-events\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:16','2023-06-01 13:08:16'),(200,'finance',75,'Histories',NULL,'accounting/unrealized-currency-histories','las la-history',NULL,NULL,3,'Active','[\"unrealized-currency-event-histories\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-06-01 13:08:16','2023-06-01 13:08:16'),(201,'sales',78,'Sales Quotation Entry',NULL,'sales/sales-quotation-entry','las la-receipt',NULL,NULL,1,'Active','[\"sales-quotation-entry\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-07-09 12:06:26','2023-07-09 12:06:26'),(202,'sales',78,'Sales Order Entry',NULL,'sales/sales-order-entry','las la-file-invoice',NULL,NULL,2,'Active','[\"sales-order-entry\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-07-09 12:07:02','2023-07-09 12:07:02'),(203,'sales',78,'Direct Delivery',NULL,'sales/direct-delivery',NULL,NULL,NULL,3,'Active','[\"direct-delivery\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-07-09 12:07:40','2023-07-09 12:07:40'),(204,'sales',78,'Direct Invoice',NULL,'sales/direct-invoice','las la-file-invoice-dollar',NULL,NULL,4,'Active','[\"direct-invoice\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-07-09 12:08:13','2023-07-09 12:08:13'),(205,'sales',79,'Delivery Against Sales Orders',NULL,'sales/delivery-against-sales-orders','las la-truck-loading',NULL,NULL,1,'Active','[\"delivery-against-sales-orders\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-07-09 12:09:33','2023-07-09 12:09:33'),(206,'sales',79,'Invoice Against Sales Delivery',NULL,'sales/invoice-against-sales-delivery','las la-file-invoice-dollar',NULL,NULL,2,'Active','[\"invoice-against-sales-delivery\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-07-09 12:10:15','2023-07-09 12:10:15'),(207,'sales',79,'Invoice Prepaid Orders',NULL,'sales/invoice-prepaid-orders',NULL,NULL,NULL,3,'Active','[\"invoice-prepaid-orders\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-07-09 12:10:37','2023-07-09 12:10:37'),(208,'sales',79,'Template Delivery',NULL,'sales/template-delivery',NULL,NULL,NULL,4,'Active','[\"template-delivery\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-07-09 12:10:53','2023-07-09 12:10:53'),(209,'sales',79,'Template Invoice',NULL,'sales/template-invoice',NULL,NULL,NULL,5,'Active','[\"template-invoice\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-07-09 12:11:08','2023-07-09 12:11:08'),(210,'sales',79,'Create Recurrent Invoices',NULL,'sales/create-print-recurrent-invoices',NULL,NULL,NULL,6,'Active','[\"create-and-print-recurrent-invoices\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-07-09 12:11:22','2023-07-09 12:11:22'),(211,'sales',80,'Customer Payments',NULL,'sales/customer-payments',NULL,NULL,NULL,1,'Active','[\"customer-payments\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-07-09 12:12:10','2023-07-09 12:12:10'),(212,'sales',80,'Customer Credit Notes',NULL,'sales/customer-credit-notes',NULL,NULL,NULL,2,'Active','[\"customer-credit-notes\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-07-09 12:12:24','2023-07-09 12:12:24'),(213,'sales',80,'Allocate Customer Payments',NULL,'sales/allocate-customer-payments',NULL,NULL,NULL,3,'Active','[\"allocate-customer-payments-or-credit-notes\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-07-09 12:12:42','2023-07-09 12:12:42'),(214,'sales',81,'Sales Quotation Inquiry',NULL,'sales/sales-quotation-inquiry',NULL,NULL,NULL,1,'Active','[\"sales-quotation-inquiry\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-07-09 12:13:18','2023-07-09 12:13:18'),(215,'sales',81,'Sales Order Inquiry',NULL,'sales/sales-order-inquiry',NULL,NULL,NULL,2,'Active','[\"sales-order-inquiry\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-07-09 12:13:34','2023-07-09 12:13:34'),(216,'sales',81,'Customer Transactions',NULL,'sales/customer-transaction-inquiry',NULL,NULL,NULL,3,'Active','[\"customer-transaction-inquiry\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-07-09 12:13:50','2023-07-09 12:13:50'),(217,'sales',81,'Customer Allocations',NULL,'sales/customer-allocation-inquiry',NULL,NULL,NULL,4,'Active','[\"customer-allocation-inquiry\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-07-09 12:14:02','2023-07-09 12:14:02'),(219,'sales',82,'Manage Customers',NULL,'sales/customers',NULL,NULL,NULL,1,'Active','[\"customers\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-07-09 12:14:59','2023-07-09 12:14:59'),(220,'sales',82,'Customer Branches',NULL,'sales/customer-branches',NULL,NULL,NULL,2,'Active','[\"customer-branches\"]','Sub menu for admin','No Open New Tab',1,NULL,'2023-07-20 12:15:31','2023-07-09 12:15:14','2023-07-20 12:15:31'),(221,'sales',82,'Sales Groups',NULL,'sales/sales-groups',NULL,NULL,NULL,3,'Active','[\"sales-groups\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-07-09 12:15:30','2023-07-09 12:15:30'),(222,'sales',82,'Recurrent Invoices',NULL,'sales/recurrent-invoices',NULL,NULL,NULL,4,'Active','[\"recurrent-invoices\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-07-09 12:15:44','2023-07-09 12:15:44'),(223,'sales',82,'Sales Types',NULL,'sales/sales-types',NULL,NULL,NULL,5,'Active','[\"sales-types\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-07-09 12:15:59','2023-07-09 12:15:59'),(224,'sales',82,'Sales Persons',NULL,'sales/sales-persons',NULL,NULL,NULL,6,'Active','[\"sales-persons\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-07-09 12:16:11','2023-07-09 12:16:11'),(225,'sales',82,'Sales Areas',NULL,'sales/sales-areas',NULL,NULL,NULL,7,'Active','[\"sales-areas\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-07-09 12:16:27','2023-07-09 12:16:27'),(226,'sales',82,'Sales Default Settings',NULL,'sales/sales-default-settings',NULL,NULL,NULL,8,'Active','null','Sub menu for admin','No Open New Tab',1,NULL,'2023-07-20 12:15:26','2023-07-09 12:16:44','2023-07-20 12:15:26'),(227,'sales',82,'Payment Types',NULL,'sales/sales-payment-types',NULL,NULL,NULL,8,'Active','[\"sales-payment-types-delete\",\"sales-payment-types-edit\",\"sales-payment-types-create\",\"sales-payment-types\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-07-20 13:10:04','2023-07-20 13:10:04'),(228,'sales',83,'Customer Balances',NULL,'sales/customer-balances',NULL,NULL,NULL,1,'Active','[\"customer-balances\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-07-27 15:31:48','2023-07-27 15:31:48'),(229,'sales',83,'Aged Customer Analysis',NULL,'sales/aged-customer-analysis',NULL,NULL,NULL,2,'Active','[\"aged-customer-analysis\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-07-27 15:32:16','2023-07-27 15:32:16'),(230,'sales',83,'Customer Trial Balance',NULL,'sales/customer-trial-balance',NULL,NULL,NULL,3,'Active','[\"customer-trial-balance\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-07-27 15:32:38','2023-07-27 15:32:38'),(231,'sales',83,'Customer Detail Listing',NULL,'sales/customer-detail-listing',NULL,NULL,NULL,4,'Active','[\"customer-detail-listing\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-07-27 15:33:02','2023-07-27 15:33:02'),(232,'sales',83,'Sales Summary Report',NULL,'sales/sales-summary-report',NULL,NULL,NULL,5,'Active','[\"sales-summary-report\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-07-27 15:33:27','2023-07-27 15:33:27'),(233,'sales',83,'Price Listing',NULL,'sales/price-listing',NULL,NULL,NULL,6,'Active','[\"price-listing\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-07-27 15:33:42','2023-07-27 15:33:42'),(234,'sales',83,'Order Status Listing',NULL,'sales/order-status-listing',NULL,NULL,NULL,7,'Active','[\"order-status-listing\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-07-27 15:34:05','2023-07-27 15:34:05'),(235,'sales',83,'Salesman Listing',NULL,'sales/salesman-listing',NULL,NULL,NULL,8,'Active','[\"salesman-listing\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-07-27 15:34:18','2023-07-27 15:34:18'),(236,'sales',83,'Print Invoices',NULL,'sales/print-invoices',NULL,NULL,NULL,9,'Active','[\"print-invoices\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-07-27 15:34:36','2023-07-27 15:34:36'),(237,'sales',83,'Print Credit Notes',NULL,'sales/print-credit-notes',NULL,NULL,NULL,10,'Active','[\"print-credit-notes\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-07-27 15:35:01','2023-07-27 15:35:01'),(238,'sales',83,'Print Deliveries',NULL,'sales/print-deliveries',NULL,NULL,NULL,11,'Active','[\"print-deliveries\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-07-27 15:35:16','2023-07-27 15:35:16'),(239,'sales',83,'Print Statements',NULL,'sales/print-statements',NULL,NULL,NULL,12,'Active','[\"print-statements\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-07-27 15:35:33','2023-07-27 15:35:33'),(240,'sales',83,'Print Sales Orders',NULL,'sales/print-sales-orders',NULL,NULL,NULL,13,'Active','[\"print-sales-orders\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-07-27 15:35:48','2023-07-27 15:35:48'),(241,'sales',83,'Print Sales Quotations',NULL,'sales/print-sales-quotations',NULL,NULL,NULL,14,'Active','[\"print-sales-quotations\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-07-27 15:36:10','2023-07-27 15:36:10'),(242,'sales',83,'Print Receipts',NULL,'sales/print-receipts',NULL,NULL,NULL,15,'Active','[\"print-receipts\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-07-27 15:36:26','2023-07-27 15:36:26'),(243,'sales',83,'TAX Report',NULL,'sales/tax-report',NULL,NULL,NULL,16,'Active','[\"tax-report\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-07-27 15:36:40','2023-07-27 15:36:40'),(244,'sales',83,'Inventory Sales Report',NULL,'sales/inventory-sales-report',NULL,NULL,NULL,17,'Active','[\"inventory-sales-report\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-07-27 15:37:01','2023-07-27 15:37:01'),(245,'sales',83,'Item Sales Summary Report',NULL,'sales/item-sales-summary-report',NULL,NULL,NULL,18,'Active','[\"item-sales-summary-report\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-07-27 15:37:28','2023-07-27 15:37:28'),(246,'procurement',6,'Standard Costs',NULL,'pms/product-management/standard-costs','las la-wizards-of-the-coast',NULL,NULL,7,'Active','[\"standard-costs\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-08-22 11:20:47','2023-08-22 11:20:47'),(247,'finance',84,'Receivable Clearing',NULL,'accounting/receivable-clearings',NULL,NULL,NULL,1,'Active','[\"receivable-clearings\"]','Sub menu for admin','No Open New Tab',1,1,NULL,'2023-09-24 12:19:50','2023-09-24 12:20:42'),(248,'finance',84,'Clearing Cancellation',NULL,'accounting/receivable-clearing-cancellation',NULL,NULL,NULL,2,'Active','[\"receivable-clearing-cencellation\"]','Sub menu for admin','No Open New Tab',1,1,NULL,'2023-09-24 12:20:34','2023-09-24 12:22:41'),(249,'finance',85,'Payment Clearings',NULL,'accounting/payment-clearings',NULL,NULL,NULL,1,'Active','[\"payment-clearings\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-09-24 12:21:10','2023-09-24 12:21:10'),(250,'finance',85,'Clearing Cancellation',NULL,'accounting/payment-clearing-cancellation',NULL,NULL,NULL,2,'Active','[\"payment-clearing-cencellation\"]','Sub menu for admin','No Open New Tab',1,1,NULL,'2023-09-24 12:21:56','2023-09-24 12:22:45'),(251,'sales',82,'Sales Kits',NULL,'sales/sales-kits','las la-cart-plus',NULL,NULL,2,'Active','[\"sales-kit-standard-costs\",\"sales-kits\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2023-10-03 14:58:35','2023-10-03 14:58:35'),(252,'procurement',10,'Requisition Explanations',NULL,'pms/requisition-explanations',NULL,NULL,NULL,7,'Active','[\"requisition-explanations\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2024-01-18 10:12:04','2024-01-18 10:12:04'),(253,'procurement',4,'Separate Proposal',NULL,'pms/rfp/request-proposal/create/separate',NULL,NULL,NULL,3,'Active','[\"rfp-create\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2024-01-18 11:19:38','2024-01-18 11:19:38'),(254,'procurement',6,'Price Graph',NULL,'pms/price-graph','las la-chart-bar',NULL,NULL,8,'Active','[\"price-graph\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2024-01-25 14:37:17','2024-01-25 14:37:17'),(255,'finance',95,'Source',NULL,'accounting/sources','las la-mouse',NULL,NULL,1,'Active','[\"source\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2024-02-01 13:03:30','2024-02-01 13:03:30'),(256,'finance',95,'Control Points',NULL,'accounting/control-points','las la-keyboard',NULL,NULL,2,'Active','[\"control-point\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2024-02-01 13:05:08','2024-02-01 13:05:08'),(257,'finance',95,'Requirements',NULL,'accounting/requirements','las la-file-signature',NULL,NULL,4,'Active','[\"requirement\"]','Sub menu for admin','No Open New Tab',1,1,NULL,'2024-02-01 13:05:53','2024-02-01 13:10:21'),(258,'finance',95,'Process',NULL,'accounting/processes','las la-microchip',NULL,NULL,5,'Active','[\"process\"]','Sub menu for admin','No Open New Tab',1,1,NULL,'2024-02-01 13:06:30','2024-02-01 13:10:36'),(259,'finance',95,'Sub-Process',NULL,'accounting/sub-processes','las la-project-diagram',NULL,NULL,6,'Active','[\"sub-process\"]','Sub menu for admin','No Open New Tab',1,1,NULL,'2024-02-01 13:07:05','2024-02-01 13:10:46'),(260,'finance',95,'Entry Points',NULL,'accounting/entry-points','las la-sign-in-alt',NULL,NULL,3,'Active','[\"entry-point\"]','Sub menu for admin','No Open New Tab',1,1,NULL,'2024-02-01 13:09:40','2024-02-01 13:09:59'),(261,'finance',95,'Transactions',NULL,'accounting/transactions','las la-clipboard-list',NULL,NULL,7,'Active','[\"transaction-logs\",\"transaction-entries\",\"transactions\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2024-02-01 13:11:36','2024-02-01 13:11:36'),(262,'finance',96,'Bank Account Types',NULL,'accounting/bank-account-types','la la-tasks',NULL,NULL,4,'Active','[\"bank-account-type-delete\",\"bank-account-type-edit\",\"bank-account-type-create\",\"bank-account-types\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2024-02-04 10:54:06','2024-02-04 10:54:06'),(263,'finance',96,'Banks',NULL,'accounting/banks','la la-tasks',NULL,NULL,2,'Active','[\"bank-delete\",\"bank-edit\",\"bank-create\",\"bank-lists\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2024-02-04 10:54:39','2024-02-04 10:54:39'),(264,'finance',96,'Bank Branches',NULL,'accounting/bank-branches','la la-tasks',NULL,NULL,3,'Active','[\"bank-branch-delete\",\"bank-branch-edit\",\"bank-branch-create\",\"bank-branches\"]','Sub menu for admin','No Open New Tab',1,NULL,NULL,'2024-02-04 10:55:12','2024-02-04 10:55:12'),(265,'finance',55,'Profit Centre',NULL,'accounting/profit-centres','las la-money-check-alt',NULL,NULL,6,'Active','[\"profit-centre-delete\",\"profit-centre-edit\",\"profit-centre-create\",\"profit-centres\"]','Sub menu for admin','No Open New Tab',1,1,NULL,'2024-02-07 15:03:23','2024-02-07 15:04:07'),(266,'finance',55,'Payment Schedules',NULL,'accounting/payment-schedules','las la-coins',NULL,NULL,10,'Active','[\"payment-schedules-delete\",\"payment-schedules-edit\",\"payment-schedules-create\",\"payment-schedules\"]','Sub menu for admin','No Open New Tab',1,1,NULL,'2024-02-11 10:03:46','2024-02-11 10:11:06');

/*Table structure for table `sub_process_ledgers` */

DROP TABLE IF EXISTS `sub_process_ledgers`;

CREATE TABLE `sub_process_ledgers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sub_process_id` bigint(20) unsigned NOT NULL,
  `chart_of_account_id` bigint(20) unsigned NOT NULL,
  `type` enum('D','C') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'D',
  `percentage` double NOT NULL DEFAULT '0',
  `priority` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sub_process_ledgers_sub_process_id_foreign` (`sub_process_id`),
  KEY `sub_process_ledgers_chart_of_account_id_foreign` (`chart_of_account_id`),
  KEY `sub_process_ledgers_created_by_foreign` (`created_by`),
  KEY `sub_process_ledgers_updated_by_foreign` (`updated_by`),
  CONSTRAINT `sub_process_ledgers_chart_of_account_id_foreign` FOREIGN KEY (`chart_of_account_id`) REFERENCES `chart_of_accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sub_process_ledgers_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sub_process_ledgers_sub_process_id_foreign` FOREIGN KEY (`sub_process_id`) REFERENCES `sub_processes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sub_process_ledgers_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sub_process_ledgers` */

/*Table structure for table `sub_processes` */

DROP TABLE IF EXISTS `sub_processes`;

CREATE TABLE `sub_processes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `process_id` bigint(20) unsigned NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('automatic','manual') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'automatic',
  `description` text COLLATE utf8mb4_unicode_ci,
  `source_id` bigint(20) unsigned NOT NULL,
  `control_point_id` bigint(20) unsigned NOT NULL,
  `entry_point_id` bigint(20) unsigned NOT NULL,
  `requirement_id` bigint(20) unsigned NOT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sub_processes_process_id_foreign` (`process_id`),
  KEY `sub_processes_source_id_foreign` (`source_id`),
  KEY `sub_processes_control_point_id_foreign` (`control_point_id`),
  KEY `sub_processes_entry_point_id_foreign` (`entry_point_id`),
  KEY `sub_processes_requirement_id_foreign` (`requirement_id`),
  KEY `sub_processes_created_by_foreign` (`created_by`),
  KEY `sub_processes_updated_by_foreign` (`updated_by`),
  CONSTRAINT `sub_processes_control_point_id_foreign` FOREIGN KEY (`control_point_id`) REFERENCES `control_points` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `sub_processes_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sub_processes_entry_point_id_foreign` FOREIGN KEY (`entry_point_id`) REFERENCES `entry_points` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `sub_processes_process_id_foreign` FOREIGN KEY (`process_id`) REFERENCES `processes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sub_processes_requirement_id_foreign` FOREIGN KEY (`requirement_id`) REFERENCES `requirements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sub_processes_source_id_foreign` FOREIGN KEY (`source_id`) REFERENCES `sources` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `sub_processes_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sub_processes` */

insert  into `sub_processes`(`id`,`process_id`,`code`,`name`,`type`,`description`,`source_id`,`control_point_id`,`entry_point_id`,`requirement_id`,`created_by`,`updated_by`,`deleted_at`,`created_at`,`updated_at`) values (1,3,'001','Merchant payable recognized','automatic','Merchant payable recognized',12,1,3,6,1,NULL,NULL,'2024-03-12 09:35:39','2024-03-12 09:35:39');

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
  KEY `sub_sub_menus_updated_by_foreign` (`updated_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sub_sub_menus` */

/*Table structure for table `supplier_addresses` */

DROP TABLE IF EXISTS `supplier_addresses`;

CREATE TABLE `supplier_addresses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `supplier_id` bigint(20) unsigned NOT NULL,
  `type` enum('corporate','factory') COLLATE utf8mb4_unicode_ci DEFAULT 'corporate',
  `road` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `village` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `supplier_addresses_supplier_id_foreign` (`supplier_id`),
  CONSTRAINT `supplier_addresses_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `supplier_addresses` */

/*Table structure for table `supplier_bank_accounts` */

DROP TABLE IF EXISTS `supplier_bank_accounts`;

CREATE TABLE `supplier_bank_accounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `supplier_id` bigint(20) unsigned NOT NULL,
  `account_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `swift_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` enum('USD','BDT','EURO','YEN') COLLATE utf8mb4_unicode_ci DEFAULT 'BDT',
  `security_check` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `supplier_bank_accounts_supplier_id_foreign` (`supplier_id`),
  CONSTRAINT `supplier_bank_accounts_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `supplier_bank_accounts` */

/*Table structure for table `supplier_contact_persons` */

DROP TABLE IF EXISTS `supplier_contact_persons`;

CREATE TABLE `supplier_contact_persons` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `supplier_id` bigint(20) unsigned NOT NULL,
  `type` enum('general','sales','after-sales') COLLATE utf8mb4_unicode_ci DEFAULT 'sales',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `designation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `supplier_contact_persons_supplier_id_foreign` (`supplier_id`),
  CONSTRAINT `supplier_contact_persons_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `supplier_contact_persons` */

/*Table structure for table `supplier_currencies` */

DROP TABLE IF EXISTS `supplier_currencies`;

CREATE TABLE `supplier_currencies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `supplier_id` bigint(20) unsigned NOT NULL,
  `currency_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `supplier_currencies_supplier_id_foreign` (`supplier_id`),
  KEY `supplier_currencies_currency_id_foreign` (`currency_id`),
  CONSTRAINT `supplier_currencies_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `supplier_currencies_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `supplier_currencies` */

insert  into `supplier_currencies`(`id`,`supplier_id`,`currency_id`,`created_at`,`updated_at`) values (1,1,1,NULL,NULL),(2,1,2,NULL,NULL),(3,1,3,NULL,NULL),(4,1,4,NULL,NULL);

/*Table structure for table `supplier_ledgers` */

DROP TABLE IF EXISTS `supplier_ledgers`;

CREATE TABLE `supplier_ledgers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `supplier_id` bigint(20) unsigned NOT NULL,
  `supplier_payment_id` bigint(20) unsigned DEFAULT '0',
  `date` date DEFAULT NULL,
  `exchange_rate_id` bigint(20) unsigned DEFAULT '8',
  `opening_balance` decimal(10,2) NOT NULL DEFAULT '0.00',
  `debit` decimal(10,2) NOT NULL DEFAULT '0.00',
  `credit` decimal(10,2) NOT NULL DEFAULT '0.00',
  `closing_balance` decimal(10,2) NOT NULL DEFAULT '0.00',
  `payment_type` enum('cash','cheque','debit-card','credit-card','bank-transfer','others-gl') COLLATE utf8mb4_unicode_ci DEFAULT 'cash',
  `bank_account_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `payment_details` text COLLATE utf8mb4_unicode_ci,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `supplier_ledgers_created_by_foreign` (`created_by`),
  KEY `supplier_ledgers_updated_by_foreign` (`updated_by`),
  KEY `supplier_ledgers_supplier_id_foreign` (`supplier_id`),
  KEY `supplier_ledgers_exchange_rate_id_foreign` (`exchange_rate_id`),
  CONSTRAINT `supplier_ledgers_exchange_rate_id_foreign` FOREIGN KEY (`exchange_rate_id`) REFERENCES `exchange_rates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `supplier_ledgers_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `supplier_ledgers` */

/*Table structure for table `supplier_logs` */

DROP TABLE IF EXISTS `supplier_logs`;

CREATE TABLE `supplier_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `supplier_id` bigint(20) unsigned DEFAULT NULL,
  `date` date NOT NULL,
  `topic` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `log` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `supplier_logs_supplier_id_foreign` (`supplier_id`),
  KEY `supplier_logs_created_by_foreign` (`created_by`),
  KEY `supplier_logs_updated_by_foreign` (`updated_by`),
  CONSTRAINT `supplier_logs_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `supplier_logs` */

/*Table structure for table `supplier_payment_terms` */

DROP TABLE IF EXISTS `supplier_payment_terms`;

CREATE TABLE `supplier_payment_terms` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT '0',
  `supplier_id` bigint(20) unsigned NOT NULL,
  `payment_term_id` bigint(20) unsigned NOT NULL,
  `payment_percent` double(4,1) NOT NULL DEFAULT '0.0',
  `remarks` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `day_duration` int(11) NOT NULL DEFAULT '0',
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Due',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `supplier_payment_terms_supplier_id_foreign` (`supplier_id`),
  KEY `supplier_payment_terms_payment_term_id_foreign` (`payment_term_id`),
  CONSTRAINT `supplier_payment_terms_payment_term_id_foreign` FOREIGN KEY (`payment_term_id`) REFERENCES `payment_terms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `supplier_payment_terms_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `supplier_payment_terms` */

insert  into `supplier_payment_terms`(`id`,`parent_id`,`supplier_id`,`payment_term_id`,`payment_percent`,`remarks`,`day_duration`,`type`,`deleted_at`,`created_at`,`updated_at`) values (1,0,1,6,10.0,NULL,1,'paid',NULL,'2024-03-18 11:44:51','2024-03-18 11:44:51'),(2,1,1,6,90.0,NULL,7,'due',NULL,'2024-03-18 11:44:51','2024-03-18 11:44:51');

/*Table structure for table `supplier_payments` */

DROP TABLE IF EXISTS `supplier_payments`;

CREATE TABLE `supplier_payments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `supplier_id` bigint(20) unsigned DEFAULT NULL,
  `purchase_order_id` bigint(20) unsigned DEFAULT NULL,
  `goods_received_note_id` bigint(20) unsigned DEFAULT NULL,
  `transection_type` enum('purchase','payment') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exchange_rate_id` bigint(20) unsigned DEFAULT '8',
  `bill_number` text COLLATE utf8mb4_unicode_ci,
  `bill_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `pay_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `bill_type` enum('po','grn','po-advance','asset-costing-entries') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'po',
  `is_cleared` int(11) NOT NULL DEFAULT '1',
  `status` enum('pending','approved','canceled','audited') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `transection_date` datetime DEFAULT NULL,
  `pay_date` datetime DEFAULT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `supplier_payments_supplier_id_foreign` (`supplier_id`),
  KEY `supplier_payments_purchase_order_id_foreign` (`purchase_order_id`),
  KEY `supplier_payments_created_by_foreign` (`created_by`),
  KEY `supplier_payments_updated_by_foreign` (`updated_by`),
  KEY `supplier_payments_goods_received_note_id_foreign` (`goods_received_note_id`),
  KEY `supplier_payments_exchange_rate_id_foreign` (`exchange_rate_id`),
  CONSTRAINT `supplier_payments_exchange_rate_id_foreign` FOREIGN KEY (`exchange_rate_id`) REFERENCES `exchange_rates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `supplier_payments_purchase_order_id_foreign` FOREIGN KEY (`purchase_order_id`) REFERENCES `purchase_orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `supplier_payments_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `supplier_payments` */

insert  into `supplier_payments`(`id`,`supplier_id`,`purchase_order_id`,`goods_received_note_id`,`transection_type`,`exchange_rate_id`,`bill_number`,`bill_amount`,`pay_amount`,`bill_type`,`is_cleared`,`status`,`transection_date`,`pay_date`,`created_by`,`updated_by`,`created_at`,`updated_at`,`deleted_at`) values (2,1,2,NULL,'purchase',1,'PO-24-SSL-000001',0.00,21.00,'po-advance',1,'pending','2024-03-19 12:29:51','2024-03-20 12:00:00',5,NULL,'2024-03-19 12:29:51','2024-03-19 12:29:51',NULL);

/*Table structure for table `supplier_rattings` */

DROP TABLE IF EXISTS `supplier_rattings`;

CREATE TABLE `supplier_rattings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `supplier_id` bigint(20) unsigned NOT NULL,
  `communication` double(10,2) unsigned DEFAULT '0.00',
  `on_time_delivery` double(10,2) unsigned DEFAULT '0.00',
  `quality` double(10,2) unsigned DEFAULT '0.00',
  `price` double(10,2) unsigned DEFAULT '0.00',
  `working_year` double(10,2) unsigned DEFAULT '0.00',
  `incident` double(10,2) unsigned DEFAULT '0.00',
  `company_established` double(10,2) unsigned DEFAULT '0.00',
  `total_score` double(10,2) DEFAULT '0.00',
  `status` enum('active','inactive','cancel') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `key` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('qc','grn','billing') COLLATE utf8mb4_unicode_ci DEFAULT 'qc',
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `supplier_rattings_created_by_foreign` (`created_by`),
  KEY `supplier_rattings_updated_by_foreign` (`updated_by`),
  KEY `supplier_rattings_supplier_id_foreign` (`supplier_id`),
  CONSTRAINT `supplier_rattings_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `supplier_rattings` */

/*Table structure for table `suppliers` */

DROP TABLE IF EXISTS `suppliers`;

CREATE TABLE `suppliers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trade` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `owner_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `owner_nid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `owner_photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `owner_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `owner_contact_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auth_person_letter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payable_account_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `payable_purchase_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `payable_discount_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `advance_account_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `term_condition` longtext COLLATE utf8mb4_unicode_ci,
  `deletable` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `approved_by` enum('sent-to-purchase','purchase-approved','purchase-declined','management-approved','management-declined') COLLATE utf8mb4_unicode_ci DEFAULT 'sent-to-purchase',
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `suppliers_payable_account_id_foreign` (`payable_account_id`),
  KEY `suppliers_payable_purchase_id_foreign` (`payable_purchase_id`),
  KEY `suppliers_payable_discount_id_foreign` (`payable_discount_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `suppliers` */

insert  into `suppliers`(`id`,`code`,`name`,`email`,`phone`,`mobile_no`,`tin`,`trade`,`bin`,`vat`,`website`,`owner_name`,`owner_nid`,`owner_photo`,`owner_email`,`owner_contact_no`,`auth_person_letter`,`payable_account_id`,`payable_purchase_id`,`payable_discount_id`,`advance_account_id`,`created_at`,`updated_at`,`term_condition`,`deletable`,`status`,`approved_by`,`created_by`,`updated_by`,`deleted_at`) values (1,'240001','Bizz Solutions PLC',NULL,'01754148869','01754148869','123','123','123','123','bizzsol.com.bd','Bizz Solutions PLC',NULL,NULL,NULL,NULL,NULL,1313,0,0,1313,'2024-03-18 11:44:51','2024-03-18 11:46:57','<p>.</p>','yes','Active','purchase-approved',1,1,NULL);

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

/*Table structure for table `tags` */

DROP TABLE IF EXISTS `tags`;

CREATE TABLE `tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `background` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tags_created_by_foreign` (`created_by`),
  KEY `tags_updated_by_foreign` (`updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tags` */

insert  into `tags`(`id`,`title`,`color`,`background`,`created_by`,`updated_by`,`deleted_at`,`created_at`,`updated_at`) values (1,'Important','#FF0000','#ccc',22,22,NULL,'2022-03-22 15:07:11','2022-04-18 14:39:30'),(2,'Approved','#00FF00','#bbb',22,22,NULL,'2022-03-22 15:10:29','2022-04-18 14:39:41'),(3,'Pending','#0000FF','#eee',22,22,NULL,'2022-03-22 15:10:44','2022-04-18 14:39:50');

/*Table structure for table `team_invitations` */

DROP TABLE IF EXISTS `team_invitations`;

CREATE TABLE `team_invitations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `team_id` bigint(20) unsigned NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `team_invitations_team_id_email_unique` (`team_id`,`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `team_invitations` */

/*Table structure for table `team_user` */

DROP TABLE IF EXISTS `team_user`;

CREATE TABLE `team_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `team_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `team_user_team_id_user_id_unique` (`team_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `team_user` */

/*Table structure for table `teams` */

DROP TABLE IF EXISTS `teams`;

CREATE TABLE `teams` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_team` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `teams_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `teams` */

insert  into `teams`(`id`,`user_id`,`name`,`personal_team`,`created_at`,`updated_at`) values (1,1,'SSG Team',1,'2021-11-25 07:20:52','2021-11-25 07:20:52');

/*Table structure for table `transaction_entries` */

DROP TABLE IF EXISTS `transaction_entries`;

CREATE TABLE `transaction_entries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` bigint(20) unsigned NOT NULL,
  `entry_id` bigint(20) unsigned NOT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transaction_entries_transaction_id_foreign` (`transaction_id`),
  KEY `transaction_entries_entry_id_foreign` (`entry_id`),
  KEY `transaction_entries_created_by_foreign` (`created_by`),
  KEY `transaction_entries_updated_by_foreign` (`updated_by`),
  CONSTRAINT `transaction_entries_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `transaction_entries_entry_id_foreign` FOREIGN KEY (`entry_id`) REFERENCES `entries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `transaction_entries_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `transaction_entries_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `transaction_entries` */

/*Table structure for table `transaction_logs` */

DROP TABLE IF EXISTS `transaction_logs`;

CREATE TABLE `transaction_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` bigint(20) unsigned NOT NULL,
  `request` longtext COLLATE utf8mb4_unicode_ci,
  `response` longtext COLLATE utf8mb4_unicode_ci,
  `logs` longtext COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transaction_logs_transaction_id_foreign` (`transaction_id`),
  CONSTRAINT `transaction_logs_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `transaction_logs` */

/*Table structure for table `transactions` */

DROP TABLE IF EXISTS `transactions`;

CREATE TABLE `transactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sub_process_id` bigint(20) unsigned NOT NULL,
  `datetime` datetime NOT NULL,
  `exchange_rate_id` bigint(20) unsigned NOT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transactions_sub_process_id_foreign` (`sub_process_id`),
  KEY `transactions_exchange_rate_id_foreign` (`exchange_rate_id`),
  KEY `transactions_created_by_foreign` (`created_by`),
  KEY `transactions_updated_by_foreign` (`updated_by`),
  CONSTRAINT `transactions_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `transactions_exchange_rate_id_foreign` FOREIGN KEY (`exchange_rate_id`) REFERENCES `exchange_rates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `transactions_sub_process_id_foreign` FOREIGN KEY (`sub_process_id`) REFERENCES `sub_processes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `transactions_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `transactions` */

/*Table structure for table `unrealized_currency_event_ledgers` */

DROP TABLE IF EXISTS `unrealized_currency_event_ledgers`;

CREATE TABLE `unrealized_currency_event_ledgers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `currency_event_id` bigint(20) unsigned NOT NULL,
  `chart_of_account_id` bigint(20) unsigned NOT NULL,
  `transaction_currency_id` bigint(20) unsigned NOT NULL,
  `reporting_currency_id` bigint(20) unsigned NOT NULL,
  `transaction_amount` double NOT NULL DEFAULT '0',
  `transaction_exchange_rate` double NOT NULL DEFAULT '0',
  `reporting_amount` double NOT NULL DEFAULT '0',
  `run_date_exchange_rate` double NOT NULL DEFAULT '0',
  `unrealized_amount` double NOT NULL DEFAULT '0',
  `gain` double NOT NULL DEFAULT '0',
  `loss` double NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `unrealized_currency_event_ledgers_currency_event_id_foreign` (`currency_event_id`),
  KEY `unrealized_currency_event_ledgers_chart_of_account_id_foreign` (`chart_of_account_id`),
  KEY `transaction_currency_foreign` (`transaction_currency_id`),
  KEY `reporting_currency_foreign` (`reporting_currency_id`),
  CONSTRAINT `reporting_currency_foreign` FOREIGN KEY (`reporting_currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `transaction_currency_foreign` FOREIGN KEY (`transaction_currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `unrealized_currency_event_ledgers_chart_of_account_id_foreign` FOREIGN KEY (`chart_of_account_id`) REFERENCES `chart_of_accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `unrealized_currency_event_ledgers_currency_event_id_foreign` FOREIGN KEY (`currency_event_id`) REFERENCES `unrealized_currency_events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `unrealized_currency_event_ledgers` */

/*Table structure for table `unrealized_currency_event_settings` */

DROP TABLE IF EXISTS `unrealized_currency_event_settings`;

CREATE TABLE `unrealized_currency_event_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `asset_ledgers` longtext COLLATE utf8mb4_unicode_ci,
  `liability_ledgers` longtext COLLATE utf8mb4_unicode_ci,
  `pnl_asset_ledger_id` bigint(20) unsigned DEFAULT '0',
  `pnl_liability_ledger_id` bigint(20) unsigned DEFAULT '0',
  `provision_asset_ledger_id` bigint(20) unsigned DEFAULT '0',
  `provision_liability_ledger_id` bigint(20) unsigned DEFAULT '0',
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `unrealized_currency_event_settings_created_by_foreign` (`created_by`),
  KEY `unrealized_currency_event_settings_updated_by_foreign` (`updated_by`),
  CONSTRAINT `unrealized_currency_event_settings_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `unrealized_currency_event_settings_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `unrealized_currency_event_settings` */

insert  into `unrealized_currency_event_settings`(`id`,`asset_ledgers`,`liability_ledgers`,`pnl_asset_ledger_id`,`pnl_liability_ledger_id`,`provision_asset_ledger_id`,`provision_liability_ledger_id`,`created_by`,`updated_by`,`deleted_at`,`created_at`,`updated_at`) values (1,'[\"131\",\"135\",\"133\"]','[\"21\",\"201\"]',214,214,215,216,22,1,NULL,NULL,'2023-09-18 13:02:50');

/*Table structure for table `unrealized_currency_events` */

DROP TABLE IF EXISTS `unrealized_currency_events`;

CREATE TABLE `unrealized_currency_events` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `run_date` date NOT NULL,
  `reversal_date` date NOT NULL,
  `payable` int(11) NOT NULL DEFAULT '0',
  `receivable` int(11) NOT NULL DEFAULT '0',
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `unrealized_currency_events_created_by_foreign` (`created_by`),
  KEY `unrealized_currency_events_updated_by_foreign` (`updated_by`),
  CONSTRAINT `unrealized_currency_events_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `unrealized_currency_events_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `unrealized_currency_events` */

/*Table structure for table `user_approval_levels` */

DROP TABLE IF EXISTS `user_approval_levels`;

CREATE TABLE `user_approval_levels` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `approval_level_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_approval_levels_user_id_foreign` (`user_id`),
  KEY `user_approval_levels_approval_level_id_foreign` (`approval_level_id`),
  CONSTRAINT `user_approval_levels_approval_level_id_foreign` FOREIGN KEY (`approval_level_id`) REFERENCES `approval_levels` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `user_approval_levels_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `user_approval_levels` */

insert  into `user_approval_levels`(`id`,`user_id`,`approval_level_id`,`created_at`,`updated_at`) values (4,22,1,NULL,NULL),(5,22,2,NULL,NULL),(6,22,3,NULL,NULL),(7,21,1,NULL,NULL),(8,21,2,NULL,NULL),(9,21,3,NULL,NULL),(10,7,1,NULL,NULL),(11,7,2,NULL,NULL),(12,7,3,NULL,NULL),(13,6,1,NULL,NULL),(14,6,2,NULL,NULL),(15,6,3,NULL,NULL),(16,5,1,NULL,NULL),(17,5,2,NULL,NULL),(18,5,3,NULL,NULL),(19,4,1,NULL,NULL),(20,4,3,NULL,NULL),(21,3,1,NULL,NULL),(22,3,2,NULL,NULL);

/*Table structure for table `user_approval_range` */

DROP TABLE IF EXISTS `user_approval_range`;

CREATE TABLE `user_approval_range` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `approval_range_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_approval_range_approval_range_id_foreign` (`approval_range_id`),
  KEY `user_approval_range_user_id_foreign` (`user_id`),
  CONSTRAINT `user_approval_range_approval_range_id_foreign` FOREIGN KEY (`approval_range_id`) REFERENCES `approval_range_setups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_approval_range_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `user_approval_range` */

insert  into `user_approval_range`(`id`,`approval_range_id`,`user_id`,`created_at`,`updated_at`) values (4,2,5,NULL,NULL),(6,3,7,NULL,NULL),(9,4,6,NULL,NULL);

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

/*Table structure for table `user_companies` */

DROP TABLE IF EXISTS `user_companies`;

CREATE TABLE `user_companies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_companies_user_id_foreign` (`user_id`),
  KEY `user_companies_company_id_foreign` (`company_id`),
  CONSTRAINT `user_companies_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_companies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `user_companies` */

insert  into `user_companies`(`id`,`user_id`,`company_id`,`created_at`,`updated_at`) values (13,22,2,NULL,NULL),(14,22,5,NULL,NULL),(15,22,9,NULL,NULL),(16,22,10,NULL,NULL),(17,22,11,NULL,NULL),(18,22,12,NULL,NULL),(19,1,2,NULL,NULL),(20,1,10,NULL,NULL),(21,21,2,NULL,NULL),(22,21,5,NULL,NULL),(23,21,9,NULL,NULL),(24,21,10,NULL,NULL),(25,21,11,NULL,NULL),(26,21,12,NULL,NULL),(27,7,2,NULL,NULL),(28,7,5,NULL,NULL),(29,7,9,NULL,NULL),(30,7,10,NULL,NULL),(31,7,11,NULL,NULL),(32,7,12,NULL,NULL),(33,6,2,NULL,NULL),(34,6,5,NULL,NULL),(35,6,9,NULL,NULL),(36,6,10,NULL,NULL),(37,6,11,NULL,NULL),(38,6,12,NULL,NULL),(39,5,2,NULL,NULL),(40,5,5,NULL,NULL),(41,5,9,NULL,NULL),(42,5,10,NULL,NULL),(43,5,11,NULL,NULL),(44,5,12,NULL,NULL),(45,4,2,NULL,NULL),(46,4,5,NULL,NULL),(47,4,9,NULL,NULL),(48,4,10,NULL,NULL),(49,4,11,NULL,NULL),(50,4,12,NULL,NULL),(51,3,2,NULL,NULL),(52,3,5,NULL,NULL),(53,3,9,NULL,NULL),(54,3,10,NULL,NULL),(55,3,11,NULL,NULL),(56,3,12,NULL,NULL);

/*Table structure for table `user_priorities` */

DROP TABLE IF EXISTS `user_priorities`;

CREATE TABLE `user_priorities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `hr_unit_id` int(10) unsigned NOT NULL,
  `hr_department_id` int(10) unsigned NOT NULL,
  `hr_section_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_priorities_user_id_foreign` (`user_id`),
  KEY `user_priorities_hr_unit_id_foreign` (`hr_unit_id`),
  KEY `user_priorities_hr_department_id_foreign` (`hr_department_id`),
  KEY `user_priorities_hr_section_id_foreign` (`hr_section_id`),
  CONSTRAINT `user_priorities_hr_department_id_foreign` FOREIGN KEY (`hr_department_id`) REFERENCES `hr_department` (`hr_department_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_priorities_hr_section_id_foreign` FOREIGN KEY (`hr_section_id`) REFERENCES `hr_section` (`hr_section_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_priorities_hr_unit_id_foreign` FOREIGN KEY (`hr_unit_id`) REFERENCES `hr_unit` (`hr_unit_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_priorities_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `user_priorities` */

insert  into `user_priorities`(`id`,`user_id`,`hr_unit_id`,`hr_department_id`,`hr_section_id`,`created_at`,`updated_at`) values (82,162,1,145,295,'2024-03-11 11:23:38','2024-03-11 11:23:38'),(83,163,1,145,295,'2024-03-11 11:23:38','2024-03-11 11:23:38'),(84,164,1,145,295,'2024-03-11 11:23:38','2024-03-11 11:23:38'),(85,165,1,145,295,'2024-03-11 11:23:38','2024-03-11 11:23:38'),(86,166,1,145,295,'2024-03-11 11:23:38','2024-03-11 11:23:38'),(87,167,1,145,295,'2024-03-11 11:23:38','2024-03-11 11:23:38'),(88,168,1,145,295,'2024-03-11 11:23:38','2024-03-11 11:23:38'),(89,169,1,145,295,'2024-03-11 11:23:38','2024-03-11 11:23:38'),(90,170,1,145,295,'2024-03-11 11:23:38','2024-03-11 11:23:38'),(91,171,1,145,295,'2024-03-11 11:23:38','2024-03-11 11:23:38'),(92,172,1,145,295,'2024-03-11 11:23:38','2024-03-11 11:23:38'),(93,173,1,145,295,'2024-03-11 11:23:39','2024-03-11 11:23:39'),(94,174,1,145,295,'2024-03-11 11:23:39','2024-03-11 11:23:39'),(95,175,1,145,295,'2024-03-11 11:23:39','2024-03-11 11:23:39'),(96,176,1,145,295,'2024-03-11 11:23:39','2024-03-11 11:23:39'),(97,177,1,145,295,'2024-03-11 11:23:39','2024-03-11 11:23:39'),(98,178,1,145,295,'2024-03-11 11:23:39','2024-03-11 11:23:39'),(99,179,1,145,295,'2024-03-11 11:23:39','2024-03-11 11:23:39'),(100,180,1,125,275,'2024-03-11 11:23:39','2024-03-11 11:23:39'),(101,181,1,125,275,'2024-03-11 11:23:39','2024-03-11 11:23:39'),(102,182,1,125,275,'2024-03-11 11:23:39','2024-03-11 11:23:39'),(103,183,1,143,293,'2024-03-11 11:23:39','2024-03-11 11:23:39'),(104,184,1,143,293,'2024-03-11 11:23:39','2024-03-11 11:23:39'),(105,185,1,143,293,'2024-03-11 11:23:39','2024-03-11 11:23:39'),(106,186,1,148,298,'2024-03-11 11:23:39','2024-03-11 11:23:39'),(107,187,1,154,304,'2024-03-11 11:23:40','2024-03-11 11:23:40'),(108,188,1,143,293,'2024-03-11 11:23:40','2024-03-11 11:23:40'),(109,189,1,143,293,'2024-03-11 11:23:40','2024-03-11 11:23:40'),(111,190,1,138,288,'2024-03-13 12:43:31','2024-03-13 12:43:31'),(112,21,1,124,274,'2024-03-18 12:31:21','2024-03-18 12:31:21'),(113,21,2,124,274,'2024-03-18 12:31:21','2024-03-18 12:31:21'),(114,21,3,124,274,'2024-03-18 12:31:21','2024-03-18 12:31:21'),(115,21,4,124,274,'2024-03-18 12:31:21','2024-03-18 12:31:21'),(116,21,8,124,274,'2024-03-18 12:31:21','2024-03-18 12:31:21'),(117,21,9,124,274,'2024-03-18 12:31:21','2024-03-18 12:31:21'),(118,7,1,124,274,'2024-03-18 12:31:52','2024-03-18 12:31:52'),(119,7,2,124,274,'2024-03-18 12:31:52','2024-03-18 12:31:52'),(120,7,3,124,274,'2024-03-18 12:31:52','2024-03-18 12:31:52'),(121,7,4,124,274,'2024-03-18 12:31:52','2024-03-18 12:31:52'),(122,7,8,124,274,'2024-03-18 12:31:52','2024-03-18 12:31:52'),(123,7,9,124,274,'2024-03-18 12:31:52','2024-03-18 12:31:52'),(124,6,1,124,274,'2024-03-18 12:32:22','2024-03-18 12:32:22'),(125,6,2,124,274,'2024-03-18 12:32:22','2024-03-18 12:32:22'),(126,6,3,124,274,'2024-03-18 12:32:22','2024-03-18 12:32:22'),(127,6,4,124,274,'2024-03-18 12:32:22','2024-03-18 12:32:22'),(128,6,8,124,274,'2024-03-18 12:32:22','2024-03-18 12:32:22'),(129,6,9,124,274,'2024-03-18 12:32:22','2024-03-18 12:32:22'),(130,5,1,124,274,'2024-03-18 12:32:47','2024-03-18 12:32:47'),(131,5,2,124,274,'2024-03-18 12:32:47','2024-03-18 12:32:47'),(132,5,3,124,274,'2024-03-18 12:32:47','2024-03-18 12:32:47'),(133,5,4,124,274,'2024-03-18 12:32:47','2024-03-18 12:32:47'),(134,5,8,124,274,'2024-03-18 12:32:47','2024-03-18 12:32:47'),(135,5,9,124,274,'2024-03-18 12:32:47','2024-03-18 12:32:47'),(136,4,1,124,274,'2024-03-18 12:33:14','2024-03-18 12:33:14'),(137,4,2,124,274,'2024-03-18 12:33:14','2024-03-18 12:33:14'),(138,4,3,124,274,'2024-03-18 12:33:14','2024-03-18 12:33:14'),(139,4,4,124,274,'2024-03-18 12:33:14','2024-03-18 12:33:14'),(140,4,8,124,274,'2024-03-18 12:33:14','2024-03-18 12:33:14'),(141,4,9,124,274,'2024-03-18 12:33:14','2024-03-18 12:33:14'),(142,3,1,124,274,'2024-03-18 12:33:47','2024-03-18 12:33:47'),(143,3,2,124,274,'2024-03-18 12:33:47','2024-03-18 12:33:47'),(144,3,3,124,274,'2024-03-18 12:33:47','2024-03-18 12:33:47'),(145,3,4,124,274,'2024-03-18 12:33:47','2024-03-18 12:33:47'),(146,3,8,124,274,'2024-03-18 12:33:47','2024-03-18 12:33:47'),(147,3,9,124,274,'2024-03-18 12:33:47','2024-03-18 12:33:47');

/*Table structure for table `user_unfinished_projects` */

DROP TABLE IF EXISTS `user_unfinished_projects`;

CREATE TABLE `user_unfinished_projects` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `project` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_unfinished_projects_user_id_foreign` (`user_id`),
  CONSTRAINT `user_unfinished_projects_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `user_unfinished_projects` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `associate_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) unsigned DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_request` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `unit_permissions` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `buyer_permissions` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `management_restriction` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `buyer_template_permission` int(10) unsigned DEFAULT NULL,
  `location_permission` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cost_centre_id` bigint(20) unsigned NOT NULL DEFAULT '2',
  `token` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_cost_centre_id_foreign` (`cost_centre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`associate_id`,`user_id`,`phone`,`email`,`email_verified_at`,`password`,`two_factor_secret`,`two_factor_recovery_codes`,`remember_token`,`current_team_id`,`profile_photo_path`,`password_request`,`unit_permissions`,`buyer_permissions`,`management_restriction`,`buyer_template_permission`,`location_permission`,`cost_centre_id`,`token`,`created_at`,`updated_at`,`deleted_at`,`created_by`,`updated_by`) values (1,'Admin','bizzsol',NULL,'123232323','admin@bizzsol.com.bd',NULL,'$2a$12$M8fo7KQD7MfmLGKaCOSSjOjA1KqgSvyq34d8a3ADJkWLNN26.KHEu',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,1002,'QscxaIFjopin26Uta0y54kzisDxCFcxM',NULL,'2024-03-12 13:17:22',NULL,NULL,NULL),(3,'Department Head','bizzsol',NULL,'9876543213232','department-head-1@bizzsol.com.bd',NULL,'$2a$12$M8fo7KQD7MfmLGKaCOSSjOjA1KqgSvyq34d8a3ADJkWLNN26.KHEu',NULL,NULL,NULL,NULL,'images/user-images/2021/12/25/avatar125-12-2021-13-43.jpg',0,NULL,NULL,NULL,NULL,NULL,1632,'MSkDmxUDmZOKacUauXvtTM0j8DLzvuIk','2021-12-23 16:33:22','2024-03-18 12:33:47',NULL,NULL,NULL),(4,'Employee 2','bizzsol',NULL,'121212112121','employee-2@bizzsol.com.bd',NULL,'$2a$12$M8fo7KQD7MfmLGKaCOSSjOjA1KqgSvyq34d8a3ADJkWLNN26.KHEu',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,1632,'7M22WBc3NMkR89oPdBTQwj5u3by1XsGv','2021-12-25 22:29:24','2024-03-18 12:33:13',NULL,NULL,NULL),(5,'Purchase Head','bizzsol',NULL,'232323232323','purchase-head@bizzsol.com.bd',NULL,'$2a$12$M8fo7KQD7MfmLGKaCOSSjOjA1KqgSvyq34d8a3ADJkWLNN26.KHEu',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,1632,'WG4FjfiZw7qs2B6TuBcg4YXPZYG4CnXK','2021-12-26 16:48:03','2024-03-18 12:32:47',NULL,NULL,NULL),(6,'Store','bizzsol',NULL,'9876543213','store@bizzsol.com.bd',NULL,'$2a$12$M8fo7KQD7MfmLGKaCOSSjOjA1KqgSvyq34d8a3ADJkWLNN26.KHEu',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,1632,'52Iu4tkTFC0D4ptNPFjAOP5K630gUS2y','2021-12-26 16:49:30','2024-03-18 12:32:22',NULL,NULL,NULL),(7,'Management','bizzsol',NULL,'123456782','management@bizzsol.com.bd',NULL,'$2a$12$M8fo7KQD7MfmLGKaCOSSjOjA1KqgSvyq34d8a3ADJkWLNN26.KHEu',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,1632,'DkYXsFKLXRK3kYPAk4CL4MDlUO4UIJFB','2021-12-28 19:43:36','2024-03-18 12:31:52',NULL,NULL,NULL),(8,'Employee 1','bizzsol',NULL,'01539892697','employee-1@bizzsol.com.bd',NULL,'$2a$12$M8fo7KQD7MfmLGKaCOSSjOjA1KqgSvyq34d8a3ADJkWLNN26.KHEu',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,2,'HTPWMbAifV9P1Yde9HGoytPANMnKN9Z3','2021-12-29 19:51:05','2023-07-29 15:45:17',NULL,NULL,NULL),(19,'Billing','bizzsol',NULL,'098765432122','billing@bizzsol.com.bd',NULL,'$2a$12$M8fo7KQD7MfmLGKaCOSSjOjA1KqgSvyq34d8a3ADJkWLNN26.KHEu',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,2,'yKFmXRkDKmHdW2l1C0a8XKNo5PAa3EeD','2022-02-05 17:29:58','2023-07-29 15:45:17',NULL,NULL,NULL),(20,'Audit','bizzsol',NULL,'0987232654321','audit@bizzsol.com.bd',NULL,'$2a$12$M8fo7KQD7MfmLGKaCOSSjOjA1KqgSvyq34d8a3ADJkWLNN26.KHEu',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,2,'FOANdTpwbasXnIjcu86eUBQ1mpbV5wK9','2022-02-05 17:31:09','2023-07-29 15:45:18',NULL,NULL,NULL),(21,'Gate Manager','bizzsol',NULL,'3487809098','gate-manager@bizzsol.com.bd',NULL,'$2a$12$M8fo7KQD7MfmLGKaCOSSjOjA1KqgSvyq34d8a3ADJkWLNN26.KHEu',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,1632,'c3aV6ZgGAGbBXx6z4gG5hPkZ67qUpWB4','2022-02-23 17:52:36','2024-03-18 12:31:21',NULL,NULL,NULL),(22,'Accounts Manager','bizzsol',NULL,'01589984944','accounts-manager@bizzsol.com.bd',NULL,'$2a$12$M8fo7KQD7MfmLGKaCOSSjOjA1KqgSvyq34d8a3ADJkWLNN26.KHEu',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,1002,'tq9Li2bmeLvNcJRDV0vC3DtRt6tVBI2Z','2022-02-28 18:05:36','2024-03-11 15:11:11',NULL,NULL,NULL),(45,'Purchase User','bizzsol',NULL,'GRP_PMD_USR','purchase-user@bizzsol.com.bd',NULL,'$2a$12$M8fo7KQD7MfmLGKaCOSSjOjA1KqgSvyq34d8a3ADJkWLNN26.KHEu',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,2,'Ns8KMWsriOVmulJ06Xl3mx1KxPDxMuWm','2022-05-29 01:36:00','2023-07-29 15:45:19',NULL,NULL,NULL),(76,'SBU Head','bizzsol',NULL,'01234567890','sbu-head@bizzsol.com.bd',NULL,'$2a$12$M8fo7KQD7MfmLGKaCOSSjOjA1KqgSvyq34d8a3ADJkWLNN26.KHEu',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,2,'Er820LGk3uXb3qmOHiP4XvxFXDMQKRSj','2022-06-24 18:02:41','2023-07-29 15:45:22',NULL,NULL,NULL),(162,'Abdullah Al Mahbub','1948',NULL,'','abdullah.mahbub@sslwireless.com',NULL,'$2y$10$sUTmgRkyRURikDnYcTk9auOdqb00OdiC4E.614x7tR/9Tgs9.xUv.',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,2,'gp9S5WI3Cr73Ji8cGy84UaxZivplt234','2024-03-11 11:23:38','2024-03-12 14:48:58',NULL,NULL,NULL),(163,'K.M. Ashaque Shahnawaz Karim','2081',NULL,'','ashaque.shahnawaz@sslwireless.com',NULL,'$2y$10$lRycFGfdvFYfq/F1w7NV0e6cruPgAqC/g3HNXqivjRZjt85/lpYue',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,2,'ItXY57SURkBkzdWrZRMK5uClmDqcfZwk','2024-03-11 11:23:38','2024-03-12 14:48:58',NULL,NULL,NULL),(164,'Md. Omar Faruque','1092',NULL,'','omar.faruque@sslwireless.com',NULL,'$2y$10$iMSQpgcoDKVEZQH5AQXI.elxuApVCE7PR1LEvcU2dvsn8S.ayrGq2',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,2,'XxwXxEfrm8Fqa6HLIvq8lBkNxfPFLLiT','2024-03-11 11:23:38','2024-03-12 14:48:58',NULL,NULL,NULL),(165,'Syed Najir Hossen','1105',NULL,'','najir.hossen@sslwireless.com',NULL,'$2y$10$mebMA87Inh/l4a.1Ssiew.oZ2.Ps8b5FAHzojgFSEZ9FoTwI9m/Oe',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,2,'PDxOKJmGxUxy5yqOqv7ldk4tnGqZ5NuR','2024-03-11 11:23:38','2024-03-12 14:48:58',NULL,NULL,NULL),(166,'Md. Ferdous Alam','1270',NULL,'','ferdous.alam@sslwireless.com',NULL,'$2y$10$E9tPCe5SCkhcVVvfHdrXkexafn8fKjkG6sw/qZcj4jplYCdsMVVUK',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,2,'V1jZXkEIKOXEbmpOfqr6RbYSXVzZsYBo','2024-03-11 11:23:38','2024-03-12 14:48:58',NULL,NULL,NULL),(167,'Anisur Rahman','1337',NULL,'','anisur.rahman@sslwireless.com',NULL,'$2y$10$EL5fSbwXTpji9HNP1mzBA.PZU7F1yt2n7qPpFKEXDYreu6aKloExq',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,2,'1fYs6HjwMM59EQRkcTiyeatdvfachj29','2024-03-11 11:23:38','2024-03-12 14:48:58',NULL,NULL,NULL),(168,'Liton Paul','1437',NULL,'','liton.paul@sslwireless.com',NULL,'$2y$10$O9YWGY626FYv1WZApTy6X.Z.9nP3D6KJ0i9H/ab5mNT0YXBKsi.NG',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,2,'N84HA27una6VGwBeFu6GC9xxZB2EXiVC','2024-03-11 11:23:38','2024-03-12 14:48:58',NULL,NULL,NULL),(169,'Md. Tareq Salman','1448',NULL,'','tareq.salman@sslwireless.com',NULL,'$2y$10$lZz6pEcK1RYMymXgRBlHi.ZwbxLKnnJZXDF68KcST1TpZ0lRC5w1i',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,2,'KeUCE8FvmrAVMu66aueyTAHgqqqL1ETp','2024-03-11 11:23:38','2024-03-12 14:48:58',NULL,NULL,NULL),(170,'Mr. Ahmad Rayan Shamsi','1475',NULL,'','rayan.shamsi@sslwireless.com',NULL,'$2y$10$E35GwwAQ/F5T19fBB8/6wuKYaqh5ywh78/q5j4navPHEmoTZbYY1u',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,2,'ex4PZN6yV0dw5no4Fek39nHvBeufCIlm','2024-03-11 11:23:38','2024-03-12 14:48:58',NULL,NULL,NULL),(171,'Maref Md. Takiul Islam','1480',NULL,'','takiul.islam@sslwireless.com',NULL,'$2y$10$Yr3Vk0RJ/mxo0Lc3WeJjcO5gQsIhHdvkc5L0z00wgALRgmL9Gt/B6',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,2,'WsyRbqkycpPDkFShz3aMs1zLrlXovhzC','2024-03-11 11:23:38','2024-03-12 14:48:58',NULL,NULL,NULL),(172,'Md. Sheikh Nasir Uddin Pronay','1590',NULL,'','sheikh.pronay@sslwireless.com',NULL,'$2y$10$izG7COGmBehqskBMebgaiewcOTBVyoO/QGljt/mjQREFHRu4Ni.Bq',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,2,'aytfdQ8Kfo4quCmD5ufYaI1kE1nCXjQf','2024-03-11 11:23:38','2024-03-12 14:48:58',NULL,NULL,NULL),(173,'Sajjad Kader','1653',NULL,'','sajjad.kader@sslwireless.com',NULL,'$2y$10$4WkMIxFf7opjyPFCUtbFAuSRVBngWh4z8vYUlws2.P7dWfYRmJm.y',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,2,'ad7EtFD6OBAKZiNDgqoDMHHX4szzcOgh','2024-03-11 11:23:39','2024-03-12 14:48:59',NULL,NULL,NULL),(174,'Nazmul Huda','1670',NULL,'','nazmul.huda@sslwireless.com',NULL,'$2y$10$e75IPwe2NPOBOL5c8THZFe22wCzg/.sHSQno8eFFs6blMcJ/Jc3tu',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,2,'aI9iP0ZGoALTC6aiVhVwfowIeCtUmGjV','2024-03-11 11:23:39','2024-03-12 14:48:59',NULL,NULL,NULL),(175,'Md. Faridul Islam','1671',NULL,'','faridul.islam@sslwireless.com',NULL,'$2y$10$zbP79OttiPU.8qsn/xHv..MECRQygBUyV10sz682JuoBQ5tewCCSy',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,2,'KlstYvVYjeG8vzTUevRd6lcfaLRNILtn','2024-03-11 11:23:39','2024-03-12 14:48:59',NULL,NULL,NULL),(176,'Humayra Sahrin Trina','1677',NULL,'','humayra.sahrin@sslwireless.com',NULL,'$2y$10$zQbuPWbcPrhk7l5VU1QaNOX8pnAwTYkE/FZFHhxSh6tTF1sXhWSfW',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,2,'vdLbRG436iR6rWtMYU7e30n4hAyzZhzp','2024-03-11 11:23:39','2024-03-12 14:48:59',NULL,NULL,NULL),(177,'Akib Hossain Chowdhury','1818',NULL,'','akib.hossain@sslwireless.com',NULL,'$2y$10$LiT.L7RwDn6saAiEOpcin.tqW0S5Aei/q/GkC3u4YZ8OOu/g9TjTq',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,2,'ljEYvJk5OEe38LaPtpc9xJcYBKNNOnWU','2024-03-11 11:23:39','2024-03-12 14:48:59',NULL,NULL,NULL),(178,'Md. Samiul Islam Sadi','1819',NULL,'','samiul.sadi@sslwireless.com',NULL,'$2y$10$NMDJ1l4hG3uCkzX5LkwMIOkli/4KArc2Q0dsvPO18oF0/IWTxXYt.',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,2,'SsZPJvJWNen3yavfHpks4ckOlCKgaiyt','2024-03-11 11:23:39','2024-03-12 14:48:59',NULL,NULL,NULL),(179,'Mehnur Mim','1899',NULL,'','mehnur.mim@sslwireless.com',NULL,'$2y$10$GjE8cdD.5QCOy2AFR3KMa.LKWtZyt/N0Y2VfOVr6Lu0f1WLB3fVnK',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,2,'SbpxuTovMqB3dKjL62Vb7fAmugIbCECO','2024-03-11 11:23:39','2024-03-12 14:48:59',NULL,NULL,NULL),(180,'Ahsanul Haque Punam','1010',NULL,'','ahsanul@sslwireless.com',NULL,'$2y$10$.2f08ZthMIJZwUHnqCmASuCKwXhXGOOD88iqrjyrmizeBYQa5N4eS',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,2,'MiejLY0ZArV99KEBTmwVrt0gBX8DiKbc','2024-03-11 11:23:39','2024-03-12 14:48:59',NULL,NULL,NULL),(181,'Kaisar Ahmed','1101',NULL,'','kaisar.ahmed@sslwireless.com',NULL,'$2y$10$vI8MRub2LTpiylzLNE3W6Os8yrI4MQrB5VZxfrf/YHlTE9poyg8ci',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,2,'iirpKQ4CJoQmO3dYhpLQohPUYE5pZ324','2024-03-11 11:23:39','2024-03-12 14:48:59',NULL,NULL,NULL),(182,'Md. Bayazid Bustami','1841',NULL,'','bayazid.bustami@sslwireless.com',NULL,'$2y$10$p/mzpIFAC5PDPFC5s0JFZejKz.bZIEkZ7b/gffiq9bhiuMa8nn1du',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,2,'awagFLIWnuIl3FZJoeTBv8NMd3QjYwWb','2024-03-11 11:23:39','2024-03-12 14:48:59',NULL,NULL,NULL),(183,'Ashekur Rahman Molla','1048',NULL,'','ashekur.rahman@sslwireless.com',NULL,'$2y$10$SVm.tMK0gAb1dhoCRMkgF.AWVjio9OYW92OWTuAbRU30tXpVLzJle',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,2,'2hUMrUxClmk3Un16L1KyyhufCw8Ci6vA','2024-03-11 11:23:39','2024-03-12 14:48:59',NULL,NULL,NULL),(184,'Khaled Akand','1141',NULL,'','khaled.akand@sslwireless.com',NULL,'$2y$10$eDcYMqcCfAbeRLH57Y/cE.4cVlCa.yBvrxddP0Y3uhcQ2c.NzFqOS',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,2,'jpWLNyiYmi8NcGzKlJa9f9rKWs93tZcH','2024-03-11 11:23:39','2024-03-12 14:48:59',NULL,NULL,NULL),(185,'Sanjay Kumar Roy','1554',NULL,'','sanjay.kumar@sslwireless.com',NULL,'$2y$10$OmGOK21gDPJGeKLv16ApOuY4U4zPxoyavZp0Ts7.0s5G.lkXFnup6',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,2,'0w6fhexr9vFVoQlBEkJ1VvriPAPJXr0u','2024-03-11 11:23:39','2024-03-12 14:48:59',NULL,NULL,NULL),(186,'Md. Taukir Hasan','1756',NULL,'','taukir.hasan@sslwireless.com',NULL,'$2y$10$lZ2nKaIiOkdQN7D5KxDtbeUy1WKc4IKZ0UsxAjLjgHSr2k0jVCt7y',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,2,'haIughIhjniIjbaavThLqT0zHNjXP7ib','2024-03-11 11:23:39','2024-03-12 14:48:59',NULL,NULL,NULL),(187,'Md. Riyad Hossain','1774',NULL,'','riyad.hossain@sslwireless.com',NULL,'$2y$10$H.YamXyqvZtO0o5rYRoC2OQpQI.1eWjZeW.KAMXInR8YY2rrCTX3e',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,2,'9LDqaBIfS5V95EKLPkbUr64nAOAacVZX','2024-03-11 11:23:40','2024-03-12 14:48:59',NULL,NULL,NULL),(188,'Md. Moinul Hasan Khan','1890',NULL,'','moinul.khan@sslwireless.com',NULL,'$2y$10$JZUkWRYHnZuPx/2VI9LoA.k73fkDQdF05V9U14vWnJ1rxBvIScgG2',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,2,'4r7Lmn836quVRJKTQvq815OVWHauf9nS','2024-03-11 11:23:40','2024-03-12 14:48:59',NULL,NULL,NULL),(189,'Md. Riyad Hossain','1920',NULL,'','hossain.riyad@sslwireless.com',NULL,'$2y$10$2st/ibg9hxmSrwHE2RLJOuBm0EzgEIxJN4mwucbZXMD2cPv92.aQS',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,2,'Fsv4nMW2bKiabv2t18zSjdE3le0WT8HZ','2024-03-11 11:23:40','2024-03-12 14:48:59',NULL,NULL,NULL),(190,'Md. Shaikh Kamran','2056',NULL,'.','shaikh.kamran@sslwireless.com',NULL,'$2y$10$mI9s3C9/YMiJ7fswOLzwZ.pVmgpX/Vj76HWDWrifWGc2f0Tcw2eFa',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,1632,'7P2IxX0e9q7MTkaGHGj7DJRIn0cck0R9','2024-03-11 11:23:40','2024-03-13 12:43:30',NULL,NULL,NULL);

/*Table structure for table `users_login_activities` */

DROP TABLE IF EXISTS `users_login_activities`;

CREATE TABLE `users_login_activities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `user_agent` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `platform` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mac_address` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_at` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logout_at` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_login_activities_user_id_foreign` (`user_id`),
  CONSTRAINT `users_login_activities_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users_login_activities` */

/*Table structure for table `users_warehouses` */

DROP TABLE IF EXISTS `users_warehouses`;

CREATE TABLE `users_warehouses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `warehouse_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_warehouses_users_id_foreign` (`user_id`),
  KEY `users_warehouses_warehouse_id_foreign` (`warehouse_id`),
  CONSTRAINT `users_warehouses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `users_warehouses_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users_warehouses` */

insert  into `users_warehouses`(`id`,`user_id`,`warehouse_id`,`created_at`,`updated_at`) values (1,21,9,NULL,NULL),(2,21,10,NULL,NULL),(3,21,11,NULL,NULL),(4,7,9,NULL,NULL),(5,7,10,NULL,NULL),(6,7,11,NULL,NULL),(7,6,9,NULL,NULL),(8,6,10,NULL,NULL),(9,6,11,NULL,NULL),(10,5,9,NULL,NULL),(11,5,10,NULL,NULL),(12,5,11,NULL,NULL),(13,4,9,NULL,NULL),(14,4,10,NULL,NULL),(15,4,11,NULL,NULL),(16,3,9,NULL,NULL),(17,3,10,NULL,NULL),(18,3,11,NULL,NULL);

/*Table structure for table `warehouses` */

DROP TABLE IF EXISTS `warehouses`;

CREATE TABLE `warehouses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `warehouses_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `warehouses` */

insert  into `warehouses`(`id`,`code`,`name`,`phone`,`email`,`location`,`address`,`created_at`,`updated_at`) values (9,'001','SSL Old Office','01718410996','ahsanul@sslwireless.com','Dhaka','93B, New Eskaton, Dhaka-1000','2024-03-11 11:11:35','2024-03-11 11:11:35'),(10,'002','SSL New Office','01718410997','ahsanul@sslwireless.com','Dhaka','27/1 Standard Center, New Eskaton, Dhaka-1001','2024-03-11 11:11:58','2024-03-11 11:11:58'),(11,'003','Concorde Garments ltd','02-58055453','HR@concordegarments.com','Dhaka','Road-5,sec-7,mirpur 11','2024-03-11 11:12:52','2024-03-11 11:12:52');

/*Table structure for table `week_days` */

DROP TABLE IF EXISTS `week_days`;

CREATE TABLE `week_days` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `work_on` bigint(20) NOT NULL DEFAULT '0',
  `report_on` bigint(20) NOT NULL DEFAULT '0',
  `hour` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `week_days` */

insert  into `week_days`(`id`,`name`,`work_on`,`report_on`,`hour`,`created_by`,`updated_by`,`created_at`,`updated_at`) values (1,'Sat',1,0,'7',NULL,1,NULL,'2022-03-07 18:24:45'),(2,'Sun',1,0,'7',NULL,1,NULL,'2023-12-11 14:10:41'),(3,'Mon',1,0,'7',NULL,1,NULL,'2023-12-11 14:10:41'),(4,'Tue',1,0,'7',NULL,1,NULL,'2023-12-11 14:10:41'),(5,'Wed',1,0,'7',NULL,1,NULL,'2023-12-11 14:10:41'),(6,'Thu',1,1,'7',NULL,1,NULL,'2023-12-11 14:10:41'),(7,'Fri',0,0,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `weekly_statuss` */

DROP TABLE IF EXISTS `weekly_statuss`;

CREATE TABLE `weekly_statuss` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` bigint(20) NOT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `day` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_at` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `week_no` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `weekly_statuss` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
