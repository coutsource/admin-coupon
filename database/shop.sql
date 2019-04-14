-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: localhost    Database: shop
-- ------------------------------------------------------
-- Server version	5.7.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `shop`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `shop` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `shop`;

--
-- Table structure for table `admin_menu`
--

DROP TABLE IF EXISTS `admin_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_menu`
--

LOCK TABLES `admin_menu` WRITE;
/*!40000 ALTER TABLE `admin_menu` DISABLE KEYS */;
INSERT INTO `admin_menu` VALUES (1,0,1,'首页','fa-bar-chart','/',NULL,'2018-05-31 23:30:13'),(2,0,8,'系统管理','fa-tasks',NULL,NULL,'2019-04-14 07:22:56'),(3,2,9,'管理员','fa-users','auth/users',NULL,'2019-04-14 07:22:56'),(4,2,10,'角色','fa-user','auth/roles',NULL,'2019-04-14 07:22:56'),(5,2,11,'权限','fa-ban','auth/permissions',NULL,'2019-04-14 07:22:56'),(6,2,12,'菜单','fa-bars','auth/menu',NULL,'2019-04-14 07:22:56'),(7,2,13,'操作日志','fa-history','auth/logs',NULL,'2019-04-14 07:22:56'),(8,0,2,'用户管理','fa-users','/users','2018-05-31 23:54:14','2018-05-31 23:55:10'),(9,0,6,'商品管理','fa-cubes','/products','2018-06-01 00:28:19','2019-04-14 07:22:56'),(10,0,7,'订单管理','fa-rmb','/orders','2018-06-05 02:45:54','2019-04-14 07:22:56'),(12,0,3,'类别管理','fa-bars','/categories','2019-04-14 07:20:31','2019-04-14 07:22:56'),(13,0,4,'兑换卡管理','fa-bars','/conversion_codes','2019-04-14 07:21:34','2019-04-14 07:22:56'),(14,0,5,'轮播图管理','fa-bars','/banners','2019-04-14 07:22:35','2019-04-14 07:22:56');
/*!40000 ALTER TABLE `admin_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_operation_log`
--

DROP TABLE IF EXISTS `admin_operation_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_operation_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_operation_log_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_operation_log`
--

LOCK TABLES `admin_operation_log` WRITE;
/*!40000 ALTER TABLE `admin_operation_log` DISABLE KEYS */;
INSERT INTO `admin_operation_log` VALUES (1,1,'admin/conversion_codes','GET','127.0.0.1','[]','2019-04-14 07:16:28','2019-04-14 07:16:28'),(2,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:16:31','2019-04-14 07:16:31'),(3,1,'admin/products','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:16:34','2019-04-14 07:16:34'),(4,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:16:34','2019-04-14 07:16:34'),(5,1,'admin/orders','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:16:35','2019-04-14 07:16:35'),(6,1,'admin/products','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:16:36','2019-04-14 07:16:36'),(7,1,'admin/orders','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:16:37','2019-04-14 07:16:37'),(8,1,'admin/coupon_codes','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:16:38','2019-04-14 07:16:38'),(9,1,'admin/coupon_codes','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:16:39','2019-04-14 07:16:39'),(10,1,'admin/products','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:16:40','2019-04-14 07:16:40'),(11,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:16:40','2019-04-14 07:16:40'),(12,1,'admin/products','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:16:41','2019-04-14 07:16:41'),(13,1,'admin/orders','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:16:42','2019-04-14 07:16:42'),(14,1,'admin/coupon_codes','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:16:42','2019-04-14 07:16:42'),(15,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:16:45','2019-04-14 07:16:45'),(16,1,'admin/products','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:16:45','2019-04-14 07:16:45'),(17,1,'admin/orders','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:16:46','2019-04-14 07:16:46'),(18,1,'admin/orders','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:16:47','2019-04-14 07:16:47'),(19,1,'admin/products','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:16:52','2019-04-14 07:16:52'),(20,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:16:53','2019-04-14 07:16:53'),(21,1,'admin/orders','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:16:54','2019-04-14 07:16:54'),(22,1,'admin/coupon_codes','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:16:56','2019-04-14 07:16:56'),(23,1,'admin/orders','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:16:59','2019-04-14 07:16:59'),(24,1,'admin/products','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:16:59','2019-04-14 07:16:59'),(25,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:17:00','2019-04-14 07:17:00'),(26,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:17:03','2019-04-14 07:17:03'),(27,1,'admin/orders','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:17:13','2019-04-14 07:17:13'),(28,1,'admin/products','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:17:17','2019-04-14 07:17:17'),(29,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:17:19','2019-04-14 07:17:19'),(30,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:17:24','2019-04-14 07:17:24'),(31,1,'admin/products','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:17:25','2019-04-14 07:17:25'),(32,1,'admin/products','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:18:38','2019-04-14 07:18:38'),(33,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:19:47','2019-04-14 07:19:47'),(34,1,'admin/auth/menu','POST','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"\\u7c7b\\u522b\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"\\/admin\\/categories\",\"roles\":[\"1\",null],\"_token\":\"ROT5O9YwaZBygNfhlIKJ7BT0ytv2pfctMEyspYoT\"}','2019-04-14 07:20:31','2019-04-14 07:20:31'),(35,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-04-14 07:20:31','2019-04-14 07:20:31'),(36,1,'admin/auth/menu/12/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:20:55','2019-04-14 07:20:55'),(37,1,'admin/auth/menu/12','PUT','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"\\u7c7b\\u522b\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"\\/categories\",\"roles\":[\"1\",null],\"_token\":\"ROT5O9YwaZBygNfhlIKJ7BT0ytv2pfctMEyspYoT\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/auth\\/menu\"}','2019-04-14 07:21:02','2019-04-14 07:21:02'),(38,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-04-14 07:21:02','2019-04-14 07:21:02'),(39,1,'admin/auth/menu','POST','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"\\u5151\\u6362\\u5361\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"\\/conversion_codes\",\"roles\":[\"1\",null],\"_token\":\"ROT5O9YwaZBygNfhlIKJ7BT0ytv2pfctMEyspYoT\"}','2019-04-14 07:21:34','2019-04-14 07:21:34'),(40,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-04-14 07:21:34','2019-04-14 07:21:34'),(41,1,'admin/auth/menu/11','DELETE','127.0.0.1','{\"_method\":\"delete\",\"_token\":\"ROT5O9YwaZBygNfhlIKJ7BT0ytv2pfctMEyspYoT\"}','2019-04-14 07:22:09','2019-04-14 07:22:09'),(42,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:22:10','2019-04-14 07:22:10'),(43,1,'admin/auth/menu','POST','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"\\u8f6e\\u64ad\\u56fe\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"\\/banners\",\"roles\":[\"1\",null],\"_token\":\"ROT5O9YwaZBygNfhlIKJ7BT0ytv2pfctMEyspYoT\"}','2019-04-14 07:22:35','2019-04-14 07:22:35'),(44,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-04-14 07:22:35','2019-04-14 07:22:35'),(45,1,'admin/auth/menu','POST','127.0.0.1','{\"_token\":\"ROT5O9YwaZBygNfhlIKJ7BT0ytv2pfctMEyspYoT\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":8},{\\\"id\\\":12},{\\\"id\\\":13},{\\\"id\\\":14},{\\\"id\\\":9},{\\\"id\\\":10},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}','2019-04-14 07:22:56','2019-04-14 07:22:56'),(46,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:22:57','2019-04-14 07:22:57'),(47,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-04-14 07:23:02','2019-04-14 07:23:02'),(48,1,'admin/categories','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:23:05','2019-04-14 07:23:05'),(49,1,'admin/conversion_codes','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:23:07','2019-04-14 07:23:07'),(50,1,'admin/banners','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:23:09','2019-04-14 07:23:09'),(51,1,'admin/products','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:23:10','2019-04-14 07:23:10'),(52,1,'admin/categories','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:23:13','2019-04-14 07:23:13'),(53,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:23:21','2019-04-14 07:23:21'),(54,1,'admin/categories','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:23:22','2019-04-14 07:23:22'),(55,1,'admin/conversion_codes','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:23:24','2019-04-14 07:23:24'),(56,1,'admin/banners','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:23:26','2019-04-14 07:23:26'),(57,1,'admin/products','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:23:30','2019-04-14 07:23:30'),(58,1,'admin/orders','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:23:32','2019-04-14 07:23:32'),(59,1,'admin/categories','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:23:33','2019-04-14 07:23:33'),(60,1,'admin/categories','POST','127.0.0.1','{\"title\":\"\\u6c34\\u679c\\u5361\",\"icon\":\"fa-pencil\",\"order\":\"0\",\"parent_id\":\"0\",\"_token\":\"ROT5O9YwaZBygNfhlIKJ7BT0ytv2pfctMEyspYoT\"}','2019-04-14 07:23:52','2019-04-14 07:23:52'),(61,1,'admin/categories','GET','127.0.0.1','[]','2019-04-14 07:23:52','2019-04-14 07:23:52'),(62,1,'admin/categories','POST','127.0.0.1','{\"title\":\"\\u96f6\\u98df\\u5361\",\"icon\":\"fa-pencil\",\"order\":\"0\",\"parent_id\":\"0\",\"_token\":\"ROT5O9YwaZBygNfhlIKJ7BT0ytv2pfctMEyspYoT\"}','2019-04-14 07:24:12','2019-04-14 07:24:12'),(63,1,'admin/categories','GET','127.0.0.1','[]','2019-04-14 07:24:12','2019-04-14 07:24:12'),(64,1,'admin/categories','POST','127.0.0.1','{\"title\":\"\\u82f9\\u679c\\u5361\",\"icon\":\"fa-pencil\",\"order\":\"0\",\"parent_id\":\"1\",\"_token\":\"ROT5O9YwaZBygNfhlIKJ7BT0ytv2pfctMEyspYoT\"}','2019-04-14 07:24:20','2019-04-14 07:24:20'),(65,1,'admin/categories','GET','127.0.0.1','[]','2019-04-14 07:24:21','2019-04-14 07:24:21'),(66,1,'admin/categories','POST','127.0.0.1','{\"title\":\"\\u8292\\u679c\\u5361\",\"icon\":\"fa-pencil\",\"order\":\"0\",\"parent_id\":\"1\",\"_token\":\"ROT5O9YwaZBygNfhlIKJ7BT0ytv2pfctMEyspYoT\"}','2019-04-14 07:24:35','2019-04-14 07:24:35'),(67,1,'admin/categories','GET','127.0.0.1','[]','2019-04-14 07:24:35','2019-04-14 07:24:35'),(68,1,'admin/categories','POST','127.0.0.1','{\"_token\":\"ROT5O9YwaZBygNfhlIKJ7BT0ytv2pfctMEyspYoT\",\"_order\":\"[{\\\"id\\\":1,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4}]},{\\\"id\\\":2}]\"}','2019-04-14 07:24:38','2019-04-14 07:24:38'),(69,1,'admin/categories','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:24:38','2019-04-14 07:24:38'),(70,1,'admin/conversion_codes','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:24:39','2019-04-14 07:24:39'),(71,1,'admin/banners','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:24:41','2019-04-14 07:24:41'),(72,1,'admin/banners/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:24:43','2019-04-14 07:24:43'),(73,1,'admin/banners','POST','127.0.0.1','{\"title\":\"\\u6c34\\u679c\",\"category_id\":\"0\",\"_token\":\"ROT5O9YwaZBygNfhlIKJ7BT0ytv2pfctMEyspYoT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/banners\"}','2019-04-14 07:25:25','2019-04-14 07:25:25'),(74,1,'admin/banners/create','GET','127.0.0.1','[]','2019-04-14 07:25:28','2019-04-14 07:25:28'),(75,1,'admin/banners','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:25:44','2019-04-14 07:25:44'),(76,1,'admin/banners','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:25:45','2019-04-14 07:25:45'),(77,1,'admin/conversion_codes','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:25:47','2019-04-14 07:25:47'),(78,1,'admin/banners','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:25:48','2019-04-14 07:25:48'),(79,1,'admin/banners','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:26:16','2019-04-14 07:26:16'),(80,1,'admin/banners/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:26:19','2019-04-14 07:26:19'),(81,1,'admin/banners','POST','127.0.0.1','{\"title\":\"\\u6c34\\u679c\",\"category_id\":\"0\",\"_token\":\"ROT5O9YwaZBygNfhlIKJ7BT0ytv2pfctMEyspYoT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/banners\"}','2019-04-14 07:26:42','2019-04-14 07:26:42'),(82,1,'admin/banners/create','GET','127.0.0.1','[]','2019-04-14 07:26:43','2019-04-14 07:26:43'),(83,1,'admin/conversion_codes','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:29:10','2019-04-14 07:29:10'),(84,1,'admin/conversion_codes/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:29:13','2019-04-14 07:29:13'),(85,1,'admin/conversion_codes','POST','127.0.0.1','{\"name\":\"root_1\",\"count\":\"0\",\"not_before\":\"2019-04-14 00:00:00\",\"not_after\":\"2019-04-30 00:00:00\",\"category_id\":\"0\",\"actived\":\"1\",\"_token\":\"ROT5O9YwaZBygNfhlIKJ7BT0ytv2pfctMEyspYoT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/conversion_codes\"}','2019-04-14 07:29:42','2019-04-14 07:29:42'),(86,1,'admin/conversion_codes/create','GET','127.0.0.1','[]','2019-04-14 07:29:42','2019-04-14 07:29:42'),(87,1,'admin/conversion_codes','POST','127.0.0.1','{\"name\":\"root_1\",\"count\":\"1\",\"not_before\":\"2019-04-14 00:00:00\",\"not_after\":\"2019-04-30 00:00:00\",\"category_id\":\"0\",\"actived\":\"1\",\"_token\":\"ROT5O9YwaZBygNfhlIKJ7BT0ytv2pfctMEyspYoT\"}','2019-04-14 07:29:55','2019-04-14 07:29:55'),(88,1,'admin/conversion_codes','GET','127.0.0.1','[]','2019-04-14 07:29:55','2019-04-14 07:29:55'),(89,1,'admin/conversion_codes/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:30:00','2019-04-14 07:30:00'),(90,1,'admin/conversion_codes','POST','127.0.0.1','{\"name\":\"\\u6c34\\u679c\\u5361_1\",\"count\":\"1\",\"not_before\":\"2019-04-14 00:00:00\",\"not_after\":\"2019-04-30 00:00:00\",\"category_id\":\"1\",\"actived\":\"1\",\"_token\":\"ROT5O9YwaZBygNfhlIKJ7BT0ytv2pfctMEyspYoT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/conversion_codes\"}','2019-04-14 07:30:23','2019-04-14 07:30:23'),(91,1,'admin/conversion_codes','GET','127.0.0.1','[]','2019-04-14 07:30:23','2019-04-14 07:30:23'),(92,1,'admin/banners','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:30:28','2019-04-14 07:30:28'),(93,1,'admin/conversion_codes','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:30:31','2019-04-14 07:30:31'),(94,1,'admin/banners','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:30:33','2019-04-14 07:30:33'),(95,1,'admin/categories','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:30:34','2019-04-14 07:30:34'),(96,1,'admin/conversion_codes','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:30:37','2019-04-14 07:30:37'),(97,1,'admin/banners','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:30:39','2019-04-14 07:30:39'),(98,1,'admin/banners/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:30:43','2019-04-14 07:30:43'),(99,1,'admin/banners','POST','127.0.0.1','{\"title\":\"\\u6c34\\u679c\",\"category_id\":\"0\",\"_token\":\"ROT5O9YwaZBygNfhlIKJ7BT0ytv2pfctMEyspYoT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/banners\"}','2019-04-14 07:31:57','2019-04-14 07:31:57'),(100,1,'admin/banners/create','GET','127.0.0.1','[]','2019-04-14 07:31:58','2019-04-14 07:31:58'),(101,1,'admin/banners','POST','127.0.0.1','{\"title\":\"\\u6c34\\u679c\",\"category_id\":\"0\",\"_token\":\"ROT5O9YwaZBygNfhlIKJ7BT0ytv2pfctMEyspYoT\"}','2019-04-14 07:33:59','2019-04-14 07:33:59'),(102,1,'admin/banners','GET','127.0.0.1','[]','2019-04-14 07:34:02','2019-04-14 07:34:02'),(103,1,'admin/banners','GET','127.0.0.1','[]','2019-04-14 07:34:39','2019-04-14 07:34:39'),(104,1,'admin/banners/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:34:43','2019-04-14 07:34:43'),(105,1,'admin/banners','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:34:51','2019-04-14 07:34:51'),(106,1,'admin/banners/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:39:40','2019-04-14 07:39:40'),(107,1,'admin/banners','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:39:43','2019-04-14 07:39:43'),(108,1,'admin/banners','GET','127.0.0.1','[]','2019-04-14 07:43:54','2019-04-14 07:43:54'),(109,1,'admin/banners/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:44:09','2019-04-14 07:44:09'),(110,1,'admin/banners','POST','127.0.0.1','{\"title\":\"\\u8354\\u679d\",\"category_id\":\"0\",\"_token\":\"ROT5O9YwaZBygNfhlIKJ7BT0ytv2pfctMEyspYoT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/banners\"}','2019-04-14 07:44:51','2019-04-14 07:44:51'),(111,1,'admin/banners','GET','127.0.0.1','[]','2019-04-14 07:44:55','2019-04-14 07:44:55'),(112,1,'admin/banners/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:44:59','2019-04-14 07:44:59'),(113,1,'admin/banners/1','PUT','127.0.0.1','{\"title\":\"\\u6c34\\u679c\\u5408\\u96c6\",\"category_id\":\"0\",\"_token\":\"ROT5O9YwaZBygNfhlIKJ7BT0ytv2pfctMEyspYoT\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/banners\"}','2019-04-14 07:45:09','2019-04-14 07:45:09'),(114,1,'admin/banners','GET','127.0.0.1','[]','2019-04-14 07:45:09','2019-04-14 07:45:09'),(115,1,'admin/banners/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:45:11','2019-04-14 07:45:11'),(116,1,'admin/banners','POST','127.0.0.1','{\"title\":\"\\u6a58\\u5b50\",\"category_id\":\"0\",\"_token\":\"ROT5O9YwaZBygNfhlIKJ7BT0ytv2pfctMEyspYoT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/banners\"}','2019-04-14 07:45:22','2019-04-14 07:45:22'),(117,1,'admin/banners','GET','127.0.0.1','[]','2019-04-14 07:45:22','2019-04-14 07:45:22'),(118,1,'admin/conversion_codes','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:45:36','2019-04-14 07:45:36'),(119,1,'admin/banners','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:48:58','2019-04-14 07:48:58'),(120,1,'admin/banners/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:49:00','2019-04-14 07:49:00'),(121,1,'admin/banners/1','PUT','127.0.0.1','{\"title\":\"banner_1\",\"category_id\":\"0\",\"_token\":\"ROT5O9YwaZBygNfhlIKJ7BT0ytv2pfctMEyspYoT\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/banners\"}','2019-04-14 07:49:26','2019-04-14 07:49:26'),(122,1,'admin/banners','GET','127.0.0.1','[]','2019-04-14 07:49:27','2019-04-14 07:49:27'),(123,1,'admin/banners/2/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:49:29','2019-04-14 07:49:29'),(124,1,'admin/banners/2','PUT','127.0.0.1','{\"title\":\"banner_2\",\"category_id\":\"0\",\"_token\":\"ROT5O9YwaZBygNfhlIKJ7BT0ytv2pfctMEyspYoT\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/banners\"}','2019-04-14 07:49:44','2019-04-14 07:49:44'),(125,1,'admin/banners','GET','127.0.0.1','[]','2019-04-14 07:49:47','2019-04-14 07:49:47'),(126,1,'admin/banners/3/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:49:49','2019-04-14 07:49:49'),(127,1,'admin/banners/3','PUT','127.0.0.1','{\"title\":\"banner_3\",\"category_id\":\"0\",\"_token\":\"ROT5O9YwaZBygNfhlIKJ7BT0ytv2pfctMEyspYoT\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/banners\"}','2019-04-14 07:50:02','2019-04-14 07:50:02'),(128,1,'admin/banners','GET','127.0.0.1','[]','2019-04-14 07:50:03','2019-04-14 07:50:03'),(129,1,'admin/banners/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 07:50:49','2019-04-14 07:50:49'),(130,1,'admin/banners/1','PUT','127.0.0.1','{\"title\":\"banner_1\",\"category_id\":\"0\",\"_token\":\"ROT5O9YwaZBygNfhlIKJ7BT0ytv2pfctMEyspYoT\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/banners\"}','2019-04-14 07:50:57','2019-04-14 07:50:57'),(131,1,'admin/banners','GET','127.0.0.1','[]','2019-04-14 07:50:58','2019-04-14 07:50:58'),(132,1,'admin/products','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 08:12:21','2019-04-14 08:12:21'),(133,1,'admin/products/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 08:12:28','2019-04-14 08:12:28'),(134,1,'admin/products','POST','127.0.0.1','{\"title\":\"\\u9999\\u8549\",\"description\":\"<p>\\u7528\\u6c34\\u679c\\u5361\\u53ef\\u4ee5\\u514d\\u8d39\\u5151\\u63625\\u4e2a\\u9999\\u8549<\\/p>\",\"on_sale\":\"1\",\"category_id\":\"1\",\"brand\":\"\\u9999\\u8549\",\"provider\":\"\\u4f9b\\u5e94\\u5546_1\",\"stock\":\"100\",\"price\":\"0\",\"_token\":\"ROT5O9YwaZBygNfhlIKJ7BT0ytv2pfctMEyspYoT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/products\"}','2019-04-14 08:14:08','2019-04-14 08:14:08'),(135,1,'admin/products','GET','127.0.0.1','[]','2019-04-14 08:14:13','2019-04-14 08:14:13'),(136,1,'admin/products/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 08:14:15','2019-04-14 08:14:15'),(137,1,'admin/products','POST','127.0.0.1','{\"title\":\"\\u6a58\\u5b50\",\"description\":\"<p>\\u7528\\u6c34\\u679c\\u5361\\u53ef\\u4ee5\\u514d\\u8d39\\u5151\\u6362\\u4e00\\u65a4\\u6a58\\u5b50<\\/p>\",\"on_sale\":\"1\",\"category_id\":\"1\",\"brand\":\"\\u6a58\\u5b50\",\"provider\":\"\\u4f9b\\u5e94\\u5546_1\",\"stock\":\"100\",\"price\":\"0\",\"_token\":\"ROT5O9YwaZBygNfhlIKJ7BT0ytv2pfctMEyspYoT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/products\"}','2019-04-14 08:15:04','2019-04-14 08:15:04'),(138,1,'admin/products','GET','127.0.0.1','[]','2019-04-14 08:15:05','2019-04-14 08:15:05'),(139,1,'admin/products/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 08:15:07','2019-04-14 08:15:07'),(140,1,'admin/products','POST','127.0.0.1','{\"title\":\"\\u8354\\u679d\",\"description\":\"<p>\\u7528\\u6c34\\u679c\\u5361\\u53ef\\u4ee5\\u514d\\u8d39\\u5151\\u6362\\u4e00\\u65a4\\u8354\\u679d<\\/p>\",\"on_sale\":\"1\",\"category_id\":\"1\",\"brand\":\"\\u8354\\u679d\",\"provider\":\"\\u4f9b\\u5e94\\u5546_1\",\"stock\":\"100\",\"price\":\"0\",\"_token\":\"ROT5O9YwaZBygNfhlIKJ7BT0ytv2pfctMEyspYoT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/products\"}','2019-04-14 08:15:44','2019-04-14 08:15:44'),(141,1,'admin/products','GET','127.0.0.1','[]','2019-04-14 08:15:44','2019-04-14 08:15:44'),(142,1,'admin/conversion_codes','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 08:16:10','2019-04-14 08:16:10'),(143,1,'admin/products','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 08:16:28','2019-04-14 08:16:28'),(144,1,'admin/products','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 08:17:16','2019-04-14 08:17:16'),(145,1,'admin/products/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 08:17:18','2019-04-14 08:17:18'),(146,1,'admin/products','POST','127.0.0.1','{\"title\":\"\\u82f9\\u679c_1\",\"description\":\"<p>\\u7ea2\\u5bcc\\u58eb\\u82f9\\u679c<br\\/><\\/p>\",\"on_sale\":\"1\",\"category_id\":\"3\",\"brand\":\"\\u82f9\\u679c\",\"provider\":\"\\u4f9b\\u5e94\\u5546_2\",\"stock\":\"100\",\"price\":\"0\",\"_token\":\"ROT5O9YwaZBygNfhlIKJ7BT0ytv2pfctMEyspYoT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/products\"}','2019-04-14 08:21:09','2019-04-14 08:21:09'),(147,1,'admin/products','GET','127.0.0.1','[]','2019-04-14 08:21:11','2019-04-14 08:21:11'),(148,1,'admin/products/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 08:21:14','2019-04-14 08:21:14'),(149,1,'admin/products','POST','127.0.0.1','{\"title\":\"\\u82f9\\u679c_2\",\"description\":\"<p>\\u9752\\u82f9\\u679c<\\/p>\",\"on_sale\":\"1\",\"category_id\":\"3\",\"brand\":\"\\u82f9\\u679c\",\"provider\":\"\\u4f9b\\u5e94\\u5546_2\",\"stock\":\"100\",\"price\":\"0\",\"_token\":\"ROT5O9YwaZBygNfhlIKJ7BT0ytv2pfctMEyspYoT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/products\"}','2019-04-14 08:21:47','2019-04-14 08:21:47'),(150,1,'admin/products','GET','127.0.0.1','[]','2019-04-14 08:21:48','2019-04-14 08:21:48'),(151,1,'admin/products/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 08:21:50','2019-04-14 08:21:50'),(152,1,'admin/products','POST','127.0.0.1','{\"title\":\"\\u8292\\u679c_1\",\"description\":\"<p>\\u8292\\u679c\\u79cd\\u7c7b\\u4e00<\\/p>\",\"on_sale\":\"1\",\"category_id\":\"4\",\"brand\":\"\\u8292\\u679c\",\"provider\":\"\\u4f9b\\u5e94\\u5546_2\",\"stock\":\"100\",\"price\":\"0\",\"_token\":\"ROT5O9YwaZBygNfhlIKJ7BT0ytv2pfctMEyspYoT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/products\"}','2019-04-14 08:22:19','2019-04-14 08:22:19'),(153,1,'admin/products','GET','127.0.0.1','[]','2019-04-14 08:22:20','2019-04-14 08:22:20'),(154,1,'admin/products/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 08:22:21','2019-04-14 08:22:21'),(155,1,'admin/products','POST','127.0.0.1','{\"title\":\"\\u8292\\u679c_2\",\"description\":\"<p>\\u8292\\u679c\\u79cd\\u7c7b2<\\/p>\",\"on_sale\":\"1\",\"category_id\":\"4\",\"brand\":\"\\u8292\\u679c\",\"provider\":\"\\u4f9b\\u5e94\\u5546_2\",\"stock\":\"100\",\"price\":\"0\",\"_token\":\"ROT5O9YwaZBygNfhlIKJ7BT0ytv2pfctMEyspYoT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/products\"}','2019-04-14 08:22:56','2019-04-14 08:22:56'),(156,1,'admin/products','GET','127.0.0.1','[]','2019-04-14 08:22:57','2019-04-14 08:22:57'),(157,1,'admin/products','GET','127.0.0.1','[]','2019-04-14 08:32:47','2019-04-14 08:32:47'),(158,1,'admin/conversion_codes','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 08:32:50','2019-04-14 08:32:50'),(159,1,'admin/orders','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 08:45:23','2019-04-14 08:45:23'),(160,1,'admin/orders/1','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 08:45:34','2019-04-14 08:45:34'),(161,1,'admin/orders','GET','127.0.0.1','[]','2019-04-14 08:45:34','2019-04-14 08:45:34'),(162,1,'admin/orders','GET','127.0.0.1','[]','2019-04-14 08:45:37','2019-04-14 08:45:37'),(163,1,'admin/orders','GET','127.0.0.1','[]','2019-04-14 08:48:41','2019-04-14 08:48:41'),(164,1,'admin/orders/1','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 08:53:29','2019-04-14 08:53:29'),(165,1,'admin/orders','GET','127.0.0.1','[]','2019-04-14 08:53:30','2019-04-14 08:53:30'),(166,1,'admin/orders','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 08:53:42','2019-04-14 08:53:42'),(167,1,'admin/orders','GET','127.0.0.1','[]','2019-04-14 10:11:00','2019-04-14 10:11:00'),(168,1,'admin/orders','GET','127.0.0.1','[]','2019-04-14 10:15:11','2019-04-14 10:15:11'),(169,1,'admin/orders','GET','127.0.0.1','[]','2019-04-14 10:18:04','2019-04-14 10:18:04'),(170,1,'admin/order_logistics/1','GET','127.0.0.1','[]','2019-04-14 10:18:53','2019-04-14 10:18:53'),(171,1,'admin/order_logistics/1','GET','127.0.0.1','[]','2019-04-14 10:19:40','2019-04-14 10:19:40'),(172,1,'admin/orders','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 10:19:59','2019-04-14 10:19:59'),(173,1,'admin/order_logistics/1','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-04-14 10:20:12','2019-04-14 10:20:12'),(174,1,'admin/order_logistics/1','GET','127.0.0.1','[]','2019-04-14 10:22:52','2019-04-14 10:22:52'),(175,1,'admin/order_logistics/1','GET','127.0.0.1','[]','2019-04-14 10:24:01','2019-04-14 10:24:01'),(176,1,'admin/order_logistics/1','GET','127.0.0.1','[]','2019-04-14 10:25:31','2019-04-14 10:25:31');
/*!40000 ALTER TABLE `admin_operation_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_permissions`
--

DROP TABLE IF EXISTS `admin_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_permissions_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_permissions`
--

LOCK TABLES `admin_permissions` WRITE;
/*!40000 ALTER TABLE `admin_permissions` DISABLE KEYS */;
INSERT INTO `admin_permissions` VALUES (1,'All permission','*','','*',NULL,NULL),(2,'Dashboard','dashboard','GET','/',NULL,NULL),(3,'Login','auth.login','','/auth/login\r\n/auth/logout',NULL,NULL),(4,'User setting','auth.setting','GET,PUT','/auth/setting',NULL,NULL),(5,'Auth management','auth.management','','/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs',NULL,NULL),(6,'用户管理','users','','/users*','2018-05-31 23:57:45','2018-05-31 23:58:55'),(7,'商品管理','products','','/products*','2018-06-05 21:07:20','2018-06-05 21:07:20'),(8,'订单管理','orders','','/orders*','2018-06-05 21:07:36','2018-06-05 21:07:36'),(9,'优惠券管理','coupon_codes','','/coupon_codes*','2018-06-05 21:07:52','2018-06-05 21:07:52');
/*!40000 ALTER TABLE `admin_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_role_menu`
--

DROP TABLE IF EXISTS `admin_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_role_menu`
--

LOCK TABLES `admin_role_menu` WRITE;
/*!40000 ALTER TABLE `admin_role_menu` DISABLE KEYS */;
INSERT INTO `admin_role_menu` VALUES (1,2,NULL,NULL),(1,12,NULL,NULL),(1,13,NULL,NULL),(1,14,NULL,NULL);
/*!40000 ALTER TABLE `admin_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_role_permissions`
--

DROP TABLE IF EXISTS `admin_role_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_role_permissions`
--

LOCK TABLES `admin_role_permissions` WRITE;
/*!40000 ALTER TABLE `admin_role_permissions` DISABLE KEYS */;
INSERT INTO `admin_role_permissions` VALUES (1,1,NULL,NULL),(2,2,NULL,NULL),(2,3,NULL,NULL),(2,4,NULL,NULL),(2,6,NULL,NULL),(2,7,NULL,NULL),(2,8,NULL,NULL),(2,9,NULL,NULL);
/*!40000 ALTER TABLE `admin_role_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_role_users`
--

DROP TABLE IF EXISTS `admin_role_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_role_users`
--

LOCK TABLES `admin_role_users` WRITE;
/*!40000 ALTER TABLE `admin_role_users` DISABLE KEYS */;
INSERT INTO `admin_role_users` VALUES (1,1,NULL,NULL),(2,2,NULL,NULL);
/*!40000 ALTER TABLE `admin_role_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_roles`
--

DROP TABLE IF EXISTS `admin_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_roles`
--

LOCK TABLES `admin_roles` WRITE;
/*!40000 ALTER TABLE `admin_roles` DISABLE KEYS */;
INSERT INTO `admin_roles` VALUES (1,'Administrator','administrator','2018-05-31 23:27:29','2018-05-31 23:27:29'),(2,'运营','operator','2018-06-01 00:13:12','2018-06-01 00:13:12');
/*!40000 ALTER TABLE `admin_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_user_permissions`
--

DROP TABLE IF EXISTS `admin_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_user_permissions`
--

LOCK TABLES `admin_user_permissions` WRITE;
/*!40000 ALTER TABLE `admin_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_users`
--

DROP TABLE IF EXISTS `admin_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_users`
--

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;
INSERT INTO `admin_users` VALUES (1,'admin','$2y$10$OznUPzz7OoiDZ/l4/qS1HeUULZUt20z7gxnHD8t5SIVHJK/kgINES','Administrator',NULL,'T0Z0y7MHmNNjw0r8NvnOmOLL4tKg4GGUziYtjYOoabrzhuTLs1JWEO1QRjuZ','2018-05-31 23:27:29','2018-05-31 23:27:29'),(2,'operator','$2y$10$YcmXJVEVHFAERGt14fjM6.IHDKdUEuNRhRjuYAZ39qoRBD9g29I8q','运营',NULL,'miIX5uwGont5AjaGsu84n2iMnzJLONPmYpmtb0Qhe7dgvgFgiJp52VpMxNSO','2018-06-01 00:13:51','2018-06-01 00:13:51');
/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banners`
--

DROP TABLE IF EXISTS `banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banners` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `href` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'img',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banners`
--

LOCK TABLES `banners` WRITE;
/*!40000 ALTER TABLE `banners` DISABLE KEYS */;
INSERT INTO `banners` VALUES (1,0,'banner_1','images/88ef082c48d18c8de8c3fa5a655b4b57.jpg',NULL,NULL,'img','2019-04-14 07:34:02','2019-04-14 07:50:58'),(2,0,'banner_2','images/banner2.jpg',NULL,NULL,'img','2019-04-14 07:44:55','2019-04-14 07:49:46'),(3,0,'banner_3','images/banner3.jpg',NULL,NULL,'img','2019-04-14 07:45:22','2019-04-14 07:50:02');
/*!40000 ALTER TABLE `banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `product_sku_id` int(10) unsigned NOT NULL,
  `amount` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_items_user_id_foreign` (`user_id`),
  KEY `cart_items_product_sku_id_foreign` (`product_sku_id`),
  CONSTRAINT `cart_items_product_sku_id_foreign` FOREIGN KEY (`product_sku_id`) REFERENCES `product_skus` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_items_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,0,'水果卡',1,'fa-pencil','2019-04-14 07:23:52','2019-04-14 07:24:38'),(2,0,'零食卡',4,'fa-pencil','2019-04-14 07:24:12','2019-04-14 07:24:38'),(3,1,'苹果卡',2,'fa-pencil','2019-04-14 07:24:20','2019-04-14 07:24:38'),(4,1,'芒果卡',3,'fa-pencil','2019-04-14 07:24:35','2019-04-14 07:24:38');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conversion_codes`
--

DROP TABLE IF EXISTS `conversion_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conversion_codes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `passwd` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `actived` tinyint(1) NOT NULL,
  `used` tinyint(1) NOT NULL,
  `not_before` datetime DEFAULT NULL,
  `not_after` datetime DEFAULT NULL,
  `category_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `conversion_codes_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversion_codes`
--

LOCK TABLES `conversion_codes` WRITE;
/*!40000 ALTER TABLE `conversion_codes` DISABLE KEYS */;
INSERT INTO `conversion_codes` VALUES (1,'root_1','LEXGKA','e3Op',1,0,'2019-04-14 00:00:00','2019-04-30 00:00:00',0,'2019-04-14 07:29:55','2019-04-14 07:29:55'),(2,'水果卡_1','CR8OOW','GKpf',1,1,'2019-04-14 00:00:00','2019-04-30 00:00:00',1,'2019-04-14 07:30:23','2019-04-14 08:29:05');
/*!40000 ALTER TABLE `conversion_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon_codes`
--

DROP TABLE IF EXISTS `coupon_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupon_codes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(8,2) NOT NULL,
  `total` int(10) unsigned NOT NULL,
  `used` int(10) unsigned NOT NULL DEFAULT '0',
  `min_amount` decimal(10,2) NOT NULL,
  `not_before` datetime DEFAULT NULL,
  `not_after` datetime DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `coupon_codes_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon_codes`
--

LOCK TABLES `coupon_codes` WRITE;
/*!40000 ALTER TABLE `coupon_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupon_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2016_01_04_173148_create_admin_tables',1),(4,'2018_06_11_085012_users_add_email_verified',1),(5,'2018_06_11_090519_create_user_addresses_table',1),(6,'2018_06_11_094304_create_products_table',1),(7,'2018_06_11_094315_create_product_skus_table',1),(8,'2018_06_11_100605_create_user_favorite_products_table',1),(9,'2018_06_11_100849_create_cart_items_table',1),(10,'2018_06_11_102325_create_orders_table',1),(11,'2018_06_11_102339_create_order_items_table',1),(12,'2018_06_12_040849_create_coupon_codes_table',1),(13,'2018_06_12_040935_orders_add_coupon_code_id',1),(14,'2018_09_02_130235_create_conversion_codes_table',1),(15,'2018_09_03_151744_create_categories_table',1),(16,'2018_09_04_141236_conversion_codes_add_categroy_id',1),(17,'2018_09_04_145001_products_add_category_id',1),(18,'2018_09_04_172229_create_banners_table',1),(19,'2018_09_05_143317_banners_add_category_id',1),(20,'2018_09_06_134906_create_user_conversion_codes_table',1),(21,'2018_09_06_160633_users_add_api_token',1),(22,'2018_11_18_132200_user_address_add_area_code',1),(23,'2019_01_13_084221_alter_table_products_add_stock',1),(24,'2019_01_27_093209_alter_table_orders_column',1),(25,'2019_01_27_191213_alter_table_order_items_column',1),(26,'2019_03_24_084221_alter_table_products_add_column',1),(27,'2019_04_14_085953_create_order_logistics_table',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `product_sku_id` int(10) unsigned DEFAULT NULL,
  `amount` int(10) unsigned NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `rating` int(10) unsigned DEFAULT NULL,
  `review` text COLLATE utf8mb4_unicode_ci,
  `reviewed_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  KEY `order_items_product_id_foreign` (`product_id`),
  KEY `order_items_product_sku_id_foreign` (`product_sku_id`),
  CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_product_sku_id_foreign` FOREIGN KEY (`product_sku_id`) REFERENCES `product_skus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,4,NULL,0,0.00,NULL,NULL,NULL);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_logistics`
--

DROP TABLE IF EXISTS `order_logistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_logistics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `logistics_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logistics_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_logistics_order_id_foreign` (`order_id`),
  CONSTRAINT `order_logistics_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_logistics`
--

LOCK TABLES `order_logistics` WRITE;
/*!40000 ALTER TABLE `order_logistics` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_logistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_amount` decimal(8,2) NOT NULL,
  `remark` text COLLATE utf8mb4_unicode_ci,
  `paid_at` datetime DEFAULT NULL,
  `coupon_code_id` int(10) unsigned DEFAULT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `refund_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `refund_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `reviewed` tinyint(1) NOT NULL DEFAULT '0',
  `ship_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `ship_data` text COLLATE utf8mb4_unicode_ci,
  `extra` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `buyer_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `buyer_phone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `conversion_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `conversion_code_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_no_unique` (`no`),
  KEY `orders_user_id_foreign` (`user_id`),
  KEY `orders_coupon_code_id_foreign` (`coupon_code_id`),
  CONSTRAINT `orders_coupon_code_id_foreign` FOREIGN KEY (`coupon_code_id`) REFERENCES `coupon_codes` (`id`) ON DELETE SET NULL,
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'20190414082905632833',1,'\"\\u5317\\u4eac\\u5e02\\u5317\\u4eac\\u5e02\\u4e1c\\u57ce\\u533a\\u7acb\\u6c34\\u6865\"',0.00,'苹果要大点的','2019-04-14 08:29:05',NULL,'CONVERSION_CODE',NULL,'pending',NULL,0,0,'pending',NULL,NULL,'2019-04-14 08:29:05','2019-04-14 08:29:05','','','',0);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_skus`
--

DROP TABLE IF EXISTS `product_skus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_skus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_skus_product_id_foreign` (`product_id`),
  CONSTRAINT `product_skus_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_skus`
--

LOCK TABLES `product_skus` WRITE;
/*!40000 ALTER TABLE `product_skus` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_skus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `on_sale` tinyint(1) NOT NULL DEFAULT '1',
  `rating` double(8,2) NOT NULL DEFAULT '5.00',
  `sold_count` int(10) unsigned NOT NULL DEFAULT '0',
  `review_count` int(10) unsigned NOT NULL DEFAULT '0',
  `price` decimal(10,2) NOT NULL,
  `stock` int(10) unsigned NOT NULL DEFAULT '0',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `brand` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '品牌',
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '供应商',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'香蕉','<p>用水果卡可以免费兑换5个香蕉</p>','images/shuiguo.jpg',1,5.00,0,0,0.00,100,1,'2019-04-14 08:14:13','2019-04-14 08:14:13','香蕉','供应商_1'),(2,'橘子','<p>用水果卡可以免费兑换一斤橘子</p>','images/huangdigan.jpeg',1,5.00,0,0,0.00,100,1,'2019-04-14 08:15:05','2019-04-14 08:15:05','橘子','供应商_1'),(3,'荔枝','<p>用水果卡可以免费兑换一斤荔枝</p>','images/lizhi.jpg',1,5.00,0,0,0.00,100,1,'2019-04-14 08:15:44','2019-04-14 08:15:44','荔枝','供应商_1'),(4,'苹果_1','<p>红富士苹果<br/></p>','images/pinguo.jpeg',1,5.00,0,0,0.00,100,3,'2019-04-14 08:21:11','2019-04-14 08:21:11','苹果','供应商_2'),(5,'苹果_2','<p>青苹果</p>','images/pinguo2.jpeg',1,5.00,0,0,0.00,100,3,'2019-04-14 08:21:48','2019-04-14 08:21:48','苹果','供应商_2'),(6,'芒果_1','<p>芒果种类一</p>','images/manguo.jpeg',1,5.00,0,0,0.00,100,4,'2019-04-14 08:22:19','2019-04-14 08:22:19','芒果','供应商_2'),(7,'芒果_2','<p>芒果种类2</p>','images/manguo2.jpeg',1,5.00,0,0,0.00,100,4,'2019-04-14 08:22:57','2019-04-14 08:22:57','芒果','供应商_2');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_addresses`
--

DROP TABLE IF EXISTS `user_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_addresses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `province` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `district` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip` int(10) unsigned NOT NULL,
  `contact_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_used_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `area_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_addresses_user_id_foreign` (`user_id`),
  CONSTRAINT `user_addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_addresses`
--

LOCK TABLES `user_addresses` WRITE;
/*!40000 ALTER TABLE `user_addresses` DISABLE KEYS */;
INSERT INTO `user_addresses` VALUES (1,1,'北京市','北京市','东城区','立水桥',0,'蔡金海','15927471480',NULL,'2019-04-14 08:28:22','2019-04-14 08:28:22','110101');
/*!40000 ALTER TABLE `user_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_conversion_codes`
--

DROP TABLE IF EXISTS `user_conversion_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_conversion_codes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `conversion_code_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_conversion_codes`
--

LOCK TABLES `user_conversion_codes` WRITE;
/*!40000 ALTER TABLE `user_conversion_codes` DISABLE KEYS */;
INSERT INTO `user_conversion_codes` VALUES (1,2,1,'2019-04-14 07:45:55','2019-04-14 07:45:55');
/*!40000 ALTER TABLE `user_conversion_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_favorite_products`
--

DROP TABLE IF EXISTS `user_favorite_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_favorite_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_favorite_products_user_id_foreign` (`user_id`),
  KEY `user_favorite_products_product_id_foreign` (`product_id`),
  CONSTRAINT `user_favorite_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_favorite_products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_favorite_products`
--

LOCK TABLES `user_favorite_products` WRITE;
/*!40000 ALTER TABLE `user_favorite_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_favorite_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `api_token` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_api_token_unique` (`api_token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'user2oTV0c','example2oTV0c@qq.com','a09b44454dca515e13cbb4e9f42fec75',NULL,0,'2019-04-14 07:45:55','2019-04-14 07:45:55','gXGQix2teUUdrCsDtAQSYO59BcCAmAwTGWvMrgLWHOAoOWS6gJyALS4ynNCg');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-14 10:28:16
