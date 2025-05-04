-- MySQL dump 10.13  Distrib 8.0.41, for Linux (x86_64)
--
-- Host: localhost    Database: db_food_delivery
-- ------------------------------------------------------
-- Server version	8.0.41-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_address`
--

DROP TABLE IF EXISTS `tb_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_address` (
  `id_address` int NOT NULL AUTO_INCREMENT,
  `id_customer` int NOT NULL,
  `nm_street` varchar(100) DEFAULT NULL,
  `nr_address` varchar(10) DEFAULT NULL,
  `nm_district` varchar(50) DEFAULT NULL,
  `nm_city` varchar(50) DEFAULT NULL,
  `sg_state` char(2) DEFAULT NULL,
  `cd_postal_code` varchar(10) DEFAULT NULL,
  `ds_complement` varchar(100) DEFAULT NULL,
  `fl_default` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_address`),
  KEY `fk_customer_address` (`id_customer`),
  CONSTRAINT `fk_customer_address` FOREIGN KEY (`id_customer`) REFERENCES `tb_customer` (`id_customer`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_address`
--

LOCK TABLES `tb_address` WRITE;
/*!40000 ALTER TABLE `tb_address` DISABLE KEYS */;
INSERT INTO `tb_address` VALUES (1,1,'Rua das Açaizeiras','100','Centro','Santos','SP','11000000','',1);
/*!40000 ALTER TABLE `tb_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_category`
--

DROP TABLE IF EXISTS `tb_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_category` (
  `id_category` int NOT NULL AUTO_INCREMENT,
  `nm_category` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_category`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_category`
--

LOCK TABLES `tb_category` WRITE;
/*!40000 ALTER TABLE `tb_category` DISABLE KEYS */;
INSERT INTO `tb_category` VALUES (1,'Açaí Tradicional'),(2,'Açaí com Fruta');
/*!40000 ALTER TABLE `tb_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_customer`
--

DROP TABLE IF EXISTS `tb_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_customer` (
  `id_customer` int NOT NULL AUTO_INCREMENT,
  `nm_customer` varchar(100) DEFAULT NULL,
  `ds_email` varchar(100) DEFAULT NULL,
  `nr_phone` varchar(20) DEFAULT NULL,
  `tx_password` varchar(120) DEFAULT NULL,
  `dt_created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `dt_updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_customer`),
  UNIQUE KEY `ds_email` (`ds_email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_customer`
--

LOCK TABLES `tb_customer` WRITE;
/*!40000 ALTER TABLE `tb_customer` DISABLE KEYS */;
INSERT INTO `tb_customer` VALUES (1,'Lucas Silva','lucas@email.com','13999999999','HASH123','2025-05-04 00:41:43','2025-05-04 00:41:43');
/*!40000 ALTER TABLE `tb_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_order`
--

DROP TABLE IF EXISTS `tb_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_order` (
  `id_order` int NOT NULL AUTO_INCREMENT,
  `id_customer` int NOT NULL,
  `id_address` int NOT NULL,
  `ds_status` enum('pendente','preparando','enviado','entregue','cancelado') NOT NULL,
  `vl_total` decimal(10,2) DEFAULT NULL,
  `dt_created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `dt_updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_order`),
  KEY `fk_customer_order` (`id_customer`),
  KEY `fk_address_order` (`id_address`),
  CONSTRAINT `fk_address_order` FOREIGN KEY (`id_address`) REFERENCES `tb_address` (`id_address`),
  CONSTRAINT `fk_customer_order` FOREIGN KEY (`id_customer`) REFERENCES `tb_customer` (`id_customer`),
  CONSTRAINT `tb_order_chk_1` CHECK ((`vl_total` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_order`
--

LOCK TABLES `tb_order` WRITE;
/*!40000 ALTER TABLE `tb_order` DISABLE KEYS */;
INSERT INTO `tb_order` VALUES (1,1,1,'pendente',19.00,'2025-05-04 00:41:47','2025-05-04 00:41:47');
/*!40000 ALTER TABLE `tb_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_order_item`
--

DROP TABLE IF EXISTS `tb_order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_order_item` (
  `id_order_item` int NOT NULL AUTO_INCREMENT,
  `id_order` int NOT NULL,
  `id_product` int NOT NULL,
  `nr_quantity` int NOT NULL,
  `ds_notes` text,
  `vl_subtotal` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_order_item`),
  KEY `fk_order_order_item` (`id_order`),
  KEY `fk_product_order_item` (`id_product`),
  CONSTRAINT `fk_order_order_item` FOREIGN KEY (`id_order`) REFERENCES `tb_order` (`id_order`),
  CONSTRAINT `fk_product_order_item` FOREIGN KEY (`id_product`) REFERENCES `tb_product` (`id_product`),
  CONSTRAINT `tb_order_item_chk_1` CHECK ((`nr_quantity` > 0)),
  CONSTRAINT `tb_order_item_chk_2` CHECK ((`vl_subtotal` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_order_item`
--

LOCK TABLES `tb_order_item` WRITE;
/*!40000 ALTER TABLE `tb_order_item` DISABLE KEYS */;
INSERT INTO `tb_order_item` VALUES (1,1,1,1,'Sem açúcar',12.00);
/*!40000 ALTER TABLE `tb_order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_order_item_topping`
--

DROP TABLE IF EXISTS `tb_order_item_topping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_order_item_topping` (
  `id_order_item` int NOT NULL,
  `id_topping` int NOT NULL,
  PRIMARY KEY (`id_order_item`,`id_topping`),
  KEY `fk_topping_order_item_topping` (`id_topping`),
  CONSTRAINT `fk_order_item_order_item_topping` FOREIGN KEY (`id_order_item`) REFERENCES `tb_order_item` (`id_order_item`),
  CONSTRAINT `fk_topping_order_item_topping` FOREIGN KEY (`id_topping`) REFERENCES `tb_topping` (`id_topping`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_order_item_topping`
--

LOCK TABLES `tb_order_item_topping` WRITE;
/*!40000 ALTER TABLE `tb_order_item_topping` DISABLE KEYS */;
INSERT INTO `tb_order_item_topping` VALUES (1,1),(1,2);
/*!40000 ALTER TABLE `tb_order_item_topping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_payment`
--

DROP TABLE IF EXISTS `tb_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_payment` (
  `id_payment` int NOT NULL AUTO_INCREMENT,
  `id_order` int NOT NULL,
  `ds_method` varchar(30) DEFAULT NULL,
  `ds_status` varchar(30) DEFAULT NULL,
  `vl_amount` decimal(10,2) DEFAULT NULL,
  `dt_created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_payment`),
  KEY `fk_order_payment` (`id_order`),
  CONSTRAINT `fk_order_payment` FOREIGN KEY (`id_order`) REFERENCES `tb_order` (`id_order`),
  CONSTRAINT `tb_payment_chk_1` CHECK ((`vl_amount` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_payment`
--

LOCK TABLES `tb_payment` WRITE;
/*!40000 ALTER TABLE `tb_payment` DISABLE KEYS */;
INSERT INTO `tb_payment` VALUES (1,1,'cartao_credito','pendente',19.00,'2025-05-04 00:41:53');
/*!40000 ALTER TABLE `tb_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_product`
--

DROP TABLE IF EXISTS `tb_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_product` (
  `id_product` int NOT NULL AUTO_INCREMENT,
  `nm_product` varchar(100) DEFAULT NULL,
  `ds_description` text,
  `vl_price` decimal(10,2) DEFAULT NULL,
  `ds_image_url` text,
  `id_category` int NOT NULL,
  `fl_active` tinyint(1) DEFAULT '1',
  `dt_updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_product`),
  KEY `fk_category_product` (`id_category`),
  CONSTRAINT `fk_category_product` FOREIGN KEY (`id_category`) REFERENCES `tb_category` (`id_category`),
  CONSTRAINT `tb_product_chk_1` CHECK ((`vl_price` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_product`
--

LOCK TABLES `tb_product` WRITE;
/*!40000 ALTER TABLE `tb_product` DISABLE KEYS */;
INSERT INTO `tb_product` VALUES (1,'Açaí 300ml','Açaí tradicional de 300ml',12.00,'img/300ml.jpg',1,1,'2025-05-04 00:41:37'),(2,'Açaí 500ml','Açaí tradicional de 500ml',18.00,'img/500ml.jpg',1,1,'2025-05-04 00:41:37');
/*!40000 ALTER TABLE `tb_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_topping`
--

DROP TABLE IF EXISTS `tb_topping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_topping` (
  `id_topping` int NOT NULL AUTO_INCREMENT,
  `nm_topping` varchar(100) DEFAULT NULL,
  `ds_type` varchar(50) DEFAULT NULL,
  `vl_price` decimal(10,2) DEFAULT NULL,
  `ds_image_url` text,
  `fl_active` tinyint(1) DEFAULT '1',
  `dt_updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_topping`),
  CONSTRAINT `tb_topping_chk_1` CHECK ((`vl_price` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_topping`
--

LOCK TABLES `tb_topping` WRITE;
/*!40000 ALTER TABLE `tb_topping` DISABLE KEYS */;
INSERT INTO `tb_topping` VALUES (1,'Banana','fruta',0.00,'img/banana.jpg',1,'2025-05-04 00:41:41'),(2,'Leite condensado','calda',1.00,'img/leite.jpg',1,'2025-05-04 00:41:41'),(3,'Granola','adicional',1.50,'img/granola.jpg',1,'2025-05-04 00:41:41');
/*!40000 ALTER TABLE `tb_topping` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-03 22:35:25
