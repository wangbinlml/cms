-- MySQL dump 10.13  Distrib 5.7.22, for macos10.13 (x86_64)
--
-- Host: 192.168.1.6    Database: cms
-- ------------------------------------------------------
-- Server version	5.7.25

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
-- Current Database: `cms`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `cms` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `cms`;

--
-- Table structure for table `tb_access`
--

DROP TABLE IF EXISTS `tb_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_access` (
  `id_profile` int(10) unsigned NOT NULL,
  `id_tab` int(10) unsigned NOT NULL,
  `view` int(11) NOT NULL,
  `add` int(11) NOT NULL,
  `edit` int(11) NOT NULL,
  `delete` int(11) NOT NULL,
  PRIMARY KEY (`id_profile`,`id_tab`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_access`
--

LOCK TABLES `tb_access` WRITE;
/*!40000 ALTER TABLE `tb_access` DISABLE KEYS */;
INSERT INTO `tb_access` VALUES (1,1,1,1,1,1),(1,2,1,1,1,1),(1,3,1,1,1,1),(1,4,1,1,1,1),(1,5,1,1,1,1),(1,6,1,1,1,1),(1,7,1,1,1,1),(1,8,1,1,1,1),(1,9,1,1,1,1),(1,10,1,1,1,1),(1,11,1,1,1,1),(1,12,1,1,1,1),(1,13,1,1,1,1),(1,14,1,1,1,1),(1,15,1,1,1,1),(1,16,1,1,1,1),(1,17,1,1,1,1),(1,18,1,1,1,1),(1,19,1,1,1,1),(1,20,1,1,1,1),(1,21,1,1,1,1),(1,22,1,1,1,1),(1,23,1,1,1,1),(1,24,1,1,1,1),(1,26,1,1,1,1),(1,27,1,1,1,1),(1,28,1,1,1,1),(1,29,1,1,1,1),(1,30,1,1,1,1),(1,31,1,1,1,1),(1,32,1,1,1,1),(1,33,1,1,1,1),(1,34,1,1,1,1),(1,35,1,1,1,1),(1,36,1,1,1,1),(1,37,1,1,1,1),(1,38,1,1,1,1),(1,39,1,1,1,1),(1,40,1,1,1,1),(1,41,1,1,1,1),(1,42,1,1,1,1),(1,43,1,1,1,1),(1,44,1,1,1,1),(1,46,1,1,1,1),(1,47,1,1,1,1),(1,48,1,1,1,1),(1,49,1,1,1,1),(1,50,1,1,1,1),(1,51,1,1,1,1),(1,52,1,1,1,1),(1,53,1,1,1,1),(1,54,1,1,1,1),(1,55,1,1,1,1),(1,56,1,1,1,1),(1,57,1,1,1,1),(1,58,1,1,1,1),(1,59,1,1,1,1),(1,60,1,1,1,1),(1,61,1,1,1,1),(1,62,1,1,1,1),(1,63,1,1,1,1),(1,64,1,1,1,1),(1,65,1,1,1,1),(1,66,1,1,1,1),(1,67,1,1,1,1),(1,68,1,1,1,1);
/*!40000 ALTER TABLE `tb_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_category`
--

DROP TABLE IF EXISTS `tb_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `description` text,
  `link_rewrite` varchar(128) NOT NULL,
  `meta_title` varchar(128) DEFAULT NULL,
  `meta_keywords` varchar(128) DEFAULT NULL,
  `meta_description` varchar(128) DEFAULT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_upd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_parent` int(10) unsigned NOT NULL,
  `level_depth` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `category_parent` (`id_parent`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_category`
--

LOCK TABLES `tb_category` WRITE;
/*!40000 ALTER TABLE `tb_category` DISABLE KEYS */;
INSERT INTO `tb_category` VALUES (1,'Home','','home',NULL,NULL,NULL,'2019-05-24 17:21:06','2019-05-24 17:21:06',1,0,0),(2,'Accueil','','home',NULL,NULL,NULL,'2019-05-24 17:21:06','2019-05-24 17:21:06',2,0,0),(3,'iPods','Now that you can buy movies from the iTunes Store and sync them to your iPod, the whole world is your theater.','music-ipods','','','','2019-05-24 17:21:06','2019-05-24 17:21:06',1,0,0),(4,'iPods','Il est temps, pour le meilleur lecteur de musique, de remonter sur scène pour un rappel. Avec le nouvel iPod, le monde est votre scène.','musique-ipods','','','','2019-05-24 17:21:07','2019-05-24 17:21:07',2,0,0),(5,'Accessories','Wonderful accessories for your iPod','accessories-ipod','','','','2019-05-24 17:21:07','2019-05-24 17:21:07',0,0,0),(6,'Accessoires','Tous les accessoires à la mode pour votre iPod','accessoires-ipod','','','','2019-05-24 17:21:07','2019-05-24 17:21:07',0,0,0),(7,'Laptops','The latest Intel processor, a bigger hard drive, plenty of memory, and even more new features all fit inside just one liberating inch. The new Mac laptops have the performance, power, and connectivity of a desktop computer. Without the desk part.','laptops','Apple laptops','Apple laptops MacBook Air','Powerful and chic Apple laptops','2019-05-24 17:21:07','2019-05-24 17:21:07',0,0,0),(8,'Portables','Le tout dernier processeur Intel, un disque dur plus spacieux, de la mémoire à profusion et d\'autres nouveautés. Le tout, dans à peine 2,59 cm qui vous libèrent de toute entrave. Les nouveaux portables Mac réunissent les performances, la puissance et la connectivité d\'un ordinateur de bureau. Sans la partie bureau.','portables-apple','Portables Apple','portables apple macbook air','portables apple puissants et design','2019-05-24 17:21:07','2019-05-24 17:21:07',0,0,0);
/*!40000 ALTER TABLE `tb_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cms`
--

DROP TABLE IF EXISTS `tb_cms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_cms` (
  `id_cms` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `meta_title` varchar(128) NOT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `content` longtext,
  `link_rewrite` varchar(128) NOT NULL,
  PRIMARY KEY (`id_cms`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cms`
--

LOCK TABLES `tb_cms` WRITE;
/*!40000 ALTER TABLE `tb_cms` DISABLE KEYS */;
INSERT INTO `tb_cms` VALUES (1,'Delivery','Our terms and conditions of delivery','conditions, delivery, delay, shipment, pack','<h2>Shipments and returns</h2><h3>Your pack shipment</h3><p>Packages are generally dispatched within 2 days after receipt of payment and are shipped via Colissimo with tracking and drop-off without signature. If you prefer delivery by Colissimo Extra with required signature, an additional cost will be applied, so please contact us before choosing this method. Whichever shipment choice you make, we will provide you with a link to track your package online.</p><p>Shipping fees include handling and packing fees as well as postage costs. Handling fees are fixed, whereas transport fees vary according to total weight of the shipment. We advise you to group your items in one order. We cannot group two distinct orders placed separately, and shipping fees will apply to each of them. Your package will be dispatched at your own risk, but special care is taken to protect fragile objects.<br /><br />Boxes are amply sized and your items are well-protected.</p>','delivery'),(2,'Livraison','Nos conditions générales de livraison','conditions, livraison, délais, transport, colis','<h2>Livraisons et retours</h2><h3>Le transport de votre colis</h3><p>Les colis sont g&eacute;n&eacute;ralement exp&eacute;di&eacute;s en 48h apr&egrave;s r&eacute;ception de votre paiement. Le mode d\'expédidition standard est le Colissimo suivi, remis sans signature. Si vous souhaitez une remise avec signature, un co&ucirc;t suppl&eacute;mentaire s\'applique, merci de nous contacter. Quel que soit le mode d\'expédition choisi, nous vous fournirons d&egrave;s que possible un lien qui vous permettra de suivre en ligne la livraison de votre colis.</p><p>Les frais d\'exp&eacute;dition comprennent l\'emballage, la manutention et les frais postaux. Ils peuvent contenir une partie fixe et une partie variable en fonction du prix ou du poids de votre commande. Nous vous conseillons de regrouper vos achats en une unique commande. Nous ne pouvons pas grouper deux commandes distinctes et vous devrez vous acquitter des frais de port pour chacune d\'entre elles. Votre colis est exp&eacute;di&eacute; &agrave; vos propres risques, un soin particulier est apport&eacute; au colis contenant des produits fragiles..<br /><br />Les colis sont surdimensionn&eacute;s et prot&eacute;g&eacute;s.</p>','livraison'),(3,'Legal Notice','Legal notice','notice, legal, credits','<h2>Legal</h2><h3>Credits</h3><p>Concept and production:</p><p>This Web site was created using <a href=\"http://www.prestashop.com\">PrestaShop</a>&trade; open-source software.</p>','legal-notice'),(4,'Mentions légales','Mentions légales','mentions, légales, crédits','<h2>Mentions l&eacute;gales</h2><h3>Cr&eacute;dits</h3><p>Concept et production :</p><p>Ce site internet a &eacute;t&eacute; r&eacute;alis&eacute; en utilisant la solution open-source <a href=\"http://www.prestashop.com\">PrestaShop</a>&trade; .</p>','mentions-legales'),(5,'Terms and conditions of use','Our terms and conditions of use','conditions, terms, use, sell','<h2>Your terms and conditions of use</h2><h3>Rule 1</h3><p>Here is the rule 1 content</p>\n<h3>Rule 2</h3><p>Here is the rule 2 content</p>\n<h3>Rule 3</h3><p>Here is the rule 3 content</p>','terms-and-conditions-of-use'),(6,'Conditions d\'utilisation','Nos conditions générales de ventes','conditions, utilisation, générales, ventes','<h2>Vos conditions de ventes</h2><h3>Règle n°1</h3><p>Contenu de la règle numéro 1</p>\n<h3>Règle n°2</h3><p>Contenu de la règle numéro 2</p>\n<h3>Règle n°3</h3><p>Contenu de la règle numéro 3</p>','conditions-generales-de-ventes'),(7,'About us','Learn more about us','about us, informations','<h2>About us</h2>\n<h3>Our company</h3><p>Our company</p>\n<h3>Our team</h3><p>Our team</p>\n<h3>Informations</h3><p>Informations</p>','about-us'),(8,'A propos','Apprenez-en d\'avantage sur nous','à propos, informations','<h2>A propos</h2>\n<h3>Notre entreprise</h3><p>Notre entreprise</p>\n<h3>Notre équipe</h3><p>Notre équipe</p>\n<h3>Informations</h3><p>Informations</p>','a-propos'),(9,'Secure payment','Our secure payment mean','secure payment, ssl, visa, mastercard, paypal','<h2>Secure payment</h2>\n<h3>Our secure payment</h3><p>With SSL</p>\n<h3>Using Visa/Mastercard/Paypal</h3><p>About this services</p>','secure-payment'),(10,'Paiement sécurisé','Notre offre de paiement sécurisé','paiement sécurisé, ssl, visa, mastercard, paypal','<h2>Paiement sécurisé</h2>\n<h3>Notre offre de paiement sécurisé</h3><p>Avec SSL</p>\n<h3>Utilisation de Visa/Mastercard/Paypal</h3><p>A propos de ces services</p>','paiement-securise');
/*!40000 ALTER TABLE `tb_cms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_employee`
--

DROP TABLE IF EXISTS `tb_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_employee` (
  `id_employee` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_profile` int(10) unsigned NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `email` varchar(128) NOT NULL,
  `passwd` varchar(32) NOT NULL,
  `last_passwd_gen` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `stats_date_from` date DEFAULT NULL,
  `stats_date_to` date DEFAULT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_employee`),
  KEY `employee_login` (`email`,`passwd`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_employee`
--

LOCK TABLES `tb_employee` WRITE;
/*!40000 ALTER TABLE `tb_employee` DISABLE KEYS */;
INSERT INTO `tb_employee` VALUES (1,1,'WANG','Bin','wangbin@prestaworks.se','df9ab6fdb68d4f3b425f2c1b19ce704b','2009-12-21 08:17:27','2009-01-01','2009-12-31',1);
/*!40000 ALTER TABLE `tb_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_hook`
--

DROP TABLE IF EXISTS `tb_hook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_hook` (
  `id_hook` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text,
  `position` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_hook`),
  UNIQUE KEY `hook_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_hook`
--

LOCK TABLES `tb_hook` WRITE;
/*!40000 ALTER TABLE `tb_hook` DISABLE KEYS */;
INSERT INTO `tb_hook` VALUES (1,'payment','Payment',NULL,1),(2,'newOrder','New orders',NULL,0),(3,'paymentConfirm','Payment confirmation',NULL,0),(4,'paymentReturn','Payment return',NULL,0),(5,'updateQuantity','Quantity update','Quantity is updated only when the customer effectively <b>place</b> his order.',0),(6,'rightColumn','Right column blocks',NULL,1),(7,'leftColumn','Left column blocks',NULL,1),(8,'home','Homepage content',NULL,1),(9,'header','Header of pages','A hook which allow you to do things in the header of each pages',1),(10,'cart','Cart creation and update',NULL,0),(11,'authentication','Successful customer authentication',NULL,0),(12,'addproduct','Product creation',NULL,0),(13,'updateproduct','Product Update',NULL,0),(14,'top','Top of pages','A hook which allow you to do things a the top of each pages.',1),(15,'extraRight','Extra actions on the product page (right column).',NULL,0),(16,'deleteproduct','Product deletion','This hook is called when a product is deleted',0),(17,'productfooter','Product footer','Add new blocks under the product description',1),(18,'invoice','Invoice','Add blocks to invoice (order)',1),(19,'updateOrderStatus','Order\'s status update event','Launch modules when the order\'s status of an order change.',0),(20,'adminOrder','Display in Back-Office, tab AdminOrder','Launch modules when the tab AdminOrder is displayed on back-office.',0),(21,'footer','Footer','Add block in footer',1),(22,'PDFInvoice','PDF Invoice','Allow the display of extra informations into the PDF invoice',0),(23,'adminCustomers','Display in Back-Office, tab AdminCustomers','Launch modules when the tab AdminCustomers is displayed on back-office.',0),(24,'orderConfirmation','Order confirmation page','Called on order confirmation page',0),(25,'createAccount','Successful customer create account','Called when new customer create account successfuled',0),(26,'customerAccount','Customer account page display in front office','Display on page account of the customer',1),(27,'orderSlip','Called when a order slip is created','Called when a quantity of one product change in an order.',0),(28,'productTab','Tabs on product page','Called on order product page tabs',0),(29,'productTabContent','Content of tabs on product page','Called on order product page tabs',0),(30,'shoppingCart','Shopping cart footer','Display some specific informations on the shopping cart page',0),(31,'createAccountForm','Customer account creation form','Display some information on the form to create a customer account',1),(32,'AdminStatsModules','Stats - Modules',NULL,1),(33,'GraphEngine','Graph Engines',NULL,0),(34,'orderReturn','Product returned',NULL,0),(35,'productActions','Product actions','Put new action buttons on product page',1),(36,'backOfficeHome','Administration panel homepage',NULL,1),(37,'GridEngine','Grid Engines',NULL,0),(38,'watermark','Watermark',NULL,0),(39,'cancelProduct','Product cancelled','This hook is called when you cancel a product in an order',0),(40,'extraLeft','Extra actions on the product page (left column).',NULL,0),(41,'productOutOfStock','Product out of stock','Make action while product is out of stock',1),(42,'updateProductAttribute','Product attribute update',NULL,0),(43,'extraCarrier','Extra carrier (module mode)',NULL,0),(44,'shoppingCartExtra','Shopping cart extra button','Display some specific informations',1),(45,'search','Search',NULL,0),(46,'backBeforePayment','Redirect in order process','Redirect user to the module instead of displaying payment modules',0),(47,'updateCarrier','Carrier Update','This hook is called when a carrier is updated',0),(48,'postUpdateOrderStatus','Post update of order status',NULL,0),(49,'myAccountBlock','My account block','Display extra informations inside the \"my account\" block',1),(50,'wiznav','Wiznav Hook',NULL,1);
/*!40000 ALTER TABLE `tb_hook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_hook_module`
--

DROP TABLE IF EXISTS `tb_hook_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_hook_module` (
  `id_module` int(10) unsigned NOT NULL,
  `id_hook` int(10) unsigned NOT NULL,
  `position` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`id_module`,`id_hook`),
  KEY `id_hook` (`id_hook`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_hook_module`
--

LOCK TABLES `tb_hook_module` WRITE;
/*!40000 ALTER TABLE `tb_hook_module` DISABLE KEYS */;
INSERT INTO `tb_hook_module` VALUES (1,8,1),(3,1,1),(3,4,1),(4,1,3),(5,14,5),(6,1,2),(6,4,2),(8,2,1),(8,6,2),(8,19,1),(9,6,1),(10,7,4),(19,9,1),(20,7,7),(21,7,3),(23,21,1),(25,11,1),(25,21,2),(25,25,1),(26,32,1),(27,32,2),(28,32,3),(30,32,4),(31,32,5),(32,32,6),(33,32,7),(34,33,1),(35,33,2),(36,33,3),(37,33,4),(38,36,1),(39,37,1),(40,32,8),(41,20,2),(41,32,9),(42,14,1),(42,32,10),(43,32,11),(44,32,12),(45,32,13),(46,32,15),(47,32,14),(48,32,16),(49,32,17),(50,32,18),(51,32,19),(51,45,1),(53,7,6),(54,14,3),(55,14,4),(55,50,1),(56,6,3),(57,8,2);
/*!40000 ALTER TABLE `tb_hook_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_module`
--

DROP TABLE IF EXISTS `tb_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_module` (
  `id_module` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_module`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_module`
--

LOCK TABLES `tb_module` WRITE;
/*!40000 ALTER TABLE `tb_module` DISABLE KEYS */;
INSERT INTO `tb_module` VALUES (1,'homefeatured',1),(2,'gsitemap',1),(3,'cheque',1),(4,'paypal',1),(5,'editorial',1),(6,'bankwire',1),(7,'blockadvertising',1),(8,'blockbestsellers',1),(9,'blockcart',1),(10,'blockcategories',1),(11,'blockcurrencies',1),(12,'blockinfos',1),(13,'blocklanguages',1),(14,'blockmanufacturer',1),(15,'blockmyaccount',1),(16,'blocknewproducts',1),(17,'blockpaymentlogo',1),(18,'blockpermanentlinks',1),(19,'blocksearch',1),(20,'blockspecials',1),(21,'blocktags',1),(22,'blockuserinfo',1),(23,'blockvariouslinks',1),(24,'blockviewed',1),(25,'statsdata',1),(26,'statsvisits',1),(27,'statssales',1),(28,'statsregistrations',1),(30,'statspersonalinfos',1),(31,'statslive',1),(32,'statsequipment',1),(33,'statscatalog',1),(34,'graphvisifire',1),(35,'graphxmlswfcharts',1),(36,'graphgooglechart',1),(37,'graphartichow',1),(38,'statshome',1),(39,'gridextjs',1),(40,'statsbestcustomers',1),(41,'statsorigin',1),(42,'pagesnotfound',1),(43,'sekeywords',1),(44,'statsproduct',1),(45,'statsbestproducts',1),(46,'statsbestcategories',1),(47,'statsbestvouchers',1),(48,'statsbestsuppliers',1),(49,'statscarrier',1),(50,'statsnewsletter',1),(51,'statssearch',1),(52,'blockspecials1',1),(53,'blocknewproducts1',1),(54,'blocklangcurr',1),(55,'wiznav',1),(56,'blocknewproducts2',1),(57,'carouselnc',1);
/*!40000 ALTER TABLE `tb_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_profile`
--

DROP TABLE IF EXISTS `tb_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_profile` (
  `id_profile` int(10) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id_profile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_profile`
--

LOCK TABLES `tb_profile` WRITE;
/*!40000 ALTER TABLE `tb_profile` DISABLE KEYS */;
INSERT INTO `tb_profile` VALUES (1,'Administrator');
/*!40000 ALTER TABLE `tb_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_tab`
--

DROP TABLE IF EXISTS `tb_tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_tab` (
  `id_tab` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_parent` int(11) NOT NULL,
  `class_name` varchar(64) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `module` varchar(64) DEFAULT NULL,
  `position` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_tab`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tab`
--

LOCK TABLES `tb_tab` WRITE;
/*!40000 ALTER TABLE `tb_tab` DISABLE KEYS */;
INSERT INTO `tb_tab` VALUES (1,0,'AdminCatalog','Catalog',NULL,1),(2,0,'AdminCustomers','Catalogue',NULL,2),(3,0,'AdminOrders','Customers',NULL,3),(4,0,'AdminPayment','Clients',NULL,4),(5,0,'AdminShipping','Orders',NULL,5),(6,0,'AdminStats','Commandes',NULL,6),(7,0,'AdminModules','Payment',NULL,7),(8,0,'AdminPreferences','Paiement',NULL,9),(9,0,'AdminTools','Shipping',NULL,10),(10,1,'AdminManufacturers','Transport',NULL,2),(11,1,'AdminAttributesGroups','Stats',NULL,4),(12,2,'AdminAddresses','Stats',NULL,1),(13,3,'AdminStatuses','Modules',NULL,6),(14,4,'AdminDiscounts','Modules',NULL,3),(15,4,'AdminCurrencies','Preferences',NULL,1),(16,4,'AdminTaxes','Préférences',NULL,2),(17,5,'AdminCarriers','Tools',NULL,1),(18,5,'AdminCountries','Outils',NULL,3),(19,5,'AdminZones','Manufacturers',NULL,4),(20,5,'AdminRangePrice','Fabricants',NULL,5),(21,5,'AdminRangeWeight','Attributes and groups',NULL,6),(22,7,'AdminModulesPositions','Attributs et groupes',NULL,1),(23,8,'AdminDb','Addresses',NULL,7),(24,8,'AdminEmails','Adresses',NULL,5),(26,8,'AdminImages','Statuses',NULL,6),(27,8,'AdminPPreferences','Statuts',NULL,4),(28,29,'AdminContacts','Vouchers',NULL,3),(29,0,'AdminEmployees','Bons de réduction',NULL,8),(30,29,'AdminProfiles','Currencies',NULL,1),(31,29,'AdminAccess','Devises',NULL,2),(32,9,'AdminLanguages','Taxes',NULL,1),(33,9,'AdminTranslations','Taxes',NULL,2),(34,1,'AdminSuppliers','Carriers',NULL,3),(35,9,'AdminTabs','Transporteurs',NULL,3),(36,1,'AdminFeatures','Countries',NULL,5),(37,9,'AdminQuickAccesses','Pays',NULL,4),(38,8,'AdminAppearance','Zones',NULL,2),(39,8,'AdminContact','Zones',NULL,1),(40,9,'AdminAliases','Price ranges',NULL,5),(41,9,'AdminImport','Tranches de prix',NULL,6),(42,3,'AdminInvoices','Weight ranges',NULL,1),(43,-1,'AdminSearch','Tranches de poids',NULL,0),(44,8,'AdminLocalization','Positions',NULL,9),(46,5,'AdminStates','Positions',NULL,2),(47,3,'AdminReturn','Database',NULL,3),(48,8,'AdminPDF','Base de données',NULL,8),(49,3,'AdminSlip','Email',NULL,4),(50,6,'AdminStatsModules','Emails',NULL,1),(51,6,'AdminStatsConf','Image',NULL,2),(52,9,'AdminSubDomains','Images',NULL,7),(53,9,'AdminBackup','Products',NULL,8),(54,3,'AdminOrderMessage','Produits',NULL,7),(55,3,'AdminDeliverySlip','Contacts',NULL,2),(56,8,'AdminMeta','Contacts',NULL,3),(57,9,'AdminCMS','Employees',NULL,9),(58,1,'AdminScenes','Employés',NULL,6),(59,3,'AdminMessages','Profiles',NULL,5),(60,1,'AdminTracking','Profils',NULL,1),(61,6,'AdminSearchEngines','Permissions',NULL,3),(62,6,'AdminReferrers','Permissions',NULL,4),(63,2,'AdminGroups','Languages',NULL,2),(64,9,'AdminGenerator','Langues',NULL,10),(65,2,'AdminCarts','Translations',NULL,3),(66,1,'AdminTags','Traductions',NULL,7),(67,8,'AdminSearchConf','Suppliers',NULL,10),(68,1,'AdminAttachments','Fournisseurs',NULL,7);
/*!40000 ALTER TABLE `tb_tab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'cms'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-27  1:50:59
