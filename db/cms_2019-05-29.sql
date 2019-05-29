-- MySQL dump 10.13  Distrib 8.0.12, for osx10.12 (x86_64)
--
-- Host: 192.168.1.153    Database: cms
-- ------------------------------------------------------
-- Server version	5.7.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
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
-- Table structure for table `jo_ftp`
--

DROP TABLE IF EXISTS `jo_ftp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `jo_ftp` (
  `ftp_id` int(11) NOT NULL AUTO_INCREMENT,
  `ftp_name` varchar(100) NOT NULL COMMENT '名称',
  `ip` varchar(50) NOT NULL COMMENT 'IP',
  `port` int(11) NOT NULL DEFAULT '21' COMMENT '端口号',
  `username` varchar(100) DEFAULT NULL COMMENT '登录名',
  `password` varchar(100) DEFAULT NULL COMMENT '登陆密码',
  `encoding` varchar(20) NOT NULL DEFAULT 'UTF-8' COMMENT '编码',
  `timeout` int(11) DEFAULT NULL COMMENT '超时时间',
  `ftp_path` varchar(255) DEFAULT NULL COMMENT '路径',
  `url` varchar(255) NOT NULL COMMENT '访问URL',
  PRIMARY KEY (`ftp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='FTP表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jo_ftp`
--

LOCK TABLES `jo_ftp` WRITE;
/*!40000 ALTER TABLE `jo_ftp` DISABLE KEYS */;
/*!40000 ALTER TABLE `jo_ftp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_access`
--

DROP TABLE IF EXISTS `tb_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
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
-- Table structure for table `tb_advertising`
--

DROP TABLE IF EXISTS `tb_advertising`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_advertising` (
  `advertising_id` int(11) NOT NULL AUTO_INCREMENT,
  `adspace_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `ad_name` varchar(100) NOT NULL COMMENT '广告名称',
  `category` varchar(50) NOT NULL COMMENT '广告类型',
  `ad_code` longtext COMMENT '广告代码',
  `ad_weight` int(11) NOT NULL DEFAULT '1' COMMENT '广告权重',
  `display_count` bigint(20) NOT NULL DEFAULT '0' COMMENT '展现次数',
  `click_count` bigint(20) NOT NULL DEFAULT '0' COMMENT '点击次数',
  `start_time` date DEFAULT NULL COMMENT '开始时间',
  `end_time` date DEFAULT NULL COMMENT '结束时间',
  `is_enabled` char(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  PRIMARY KEY (`advertising_id`),
  KEY `fk_tb_advertising_site` (`site_id`),
  KEY `fk_tb_space_advertising` (`adspace_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='CMS广告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_advertising`
--

LOCK TABLES `tb_advertising` WRITE;
/*!40000 ALTER TABLE `tb_advertising` DISABLE KEYS */;
INSERT INTO `tb_advertising` VALUES (1,1,1,'www.chenxun.org','text',NULL,1,0,0,NULL,NULL,'1');
/*!40000 ALTER TABLE `tb_advertising` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_api_account`
--

DROP TABLE IF EXISTS `tb_api_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_api_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` varchar(255) NOT NULL DEFAULT '' COMMENT 'appId',
  `app_key` varchar(255) NOT NULL DEFAULT '' COMMENT 'appKey',
  `aes_key` varchar(100) NOT NULL DEFAULT '' COMMENT 'AES加解密密钥',
  `disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用',
  `iv_key` varchar(50) NOT NULL DEFAULT '' COMMENT 'AES iv key',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否默认管理后台API账户',
  `limit_single_device` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否限制单设备同时登陆',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='API应用账户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_api_account`
--

LOCK TABLES `tb_api_account` WRITE;
/*!40000 ALTER TABLE `tb_api_account` DISABLE KEYS */;
INSERT INTO `tb_api_account` VALUES (1,'1580387213331704','Sd6qkHm9o4LaVluYRX5pUFyNuiu2a8oi','S9u978Q31NGPGc5H',0,'X83yESM9iShLxfwS',1,0);
/*!40000 ALTER TABLE `tb_api_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_api_info`
--

DROP TABLE IF EXISTS `tb_api_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_api_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `api_name` varchar(255) NOT NULL DEFAULT '' COMMENT '接口名称',
  `api_url` varchar(255) NOT NULL DEFAULT '' COMMENT '接口URL',
  `api_code` varchar(50) NOT NULL DEFAULT '' COMMENT '接口代码',
  `disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用',
  `limit_call_day` int(11) NOT NULL DEFAULT '0' COMMENT '每日限制调用次数(0无限制)',
  `call_total_count` int(11) NOT NULL DEFAULT '0' COMMENT '总调用次数',
  `call_month_count` int(11) NOT NULL DEFAULT '0' COMMENT '月调用次数',
  `call_week_count` int(11) NOT NULL DEFAULT '0' COMMENT '周调用次数',
  `call_day_count` int(11) NOT NULL DEFAULT '0' COMMENT '日调用次数',
  `last_call_time` timestamp NULL DEFAULT NULL COMMENT '最后一次调用时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COMMENT='API接口信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_api_info`
--

LOCK TABLES `tb_api_info` WRITE;
/*!40000 ALTER TABLE `tb_api_info` DISABLE KEYS */;
INSERT INTO `tb_api_info` VALUES (1,'栏目列表','/api/channel/list.jspx','010101',0,0,0,0,0,0,NULL),(2,'单个栏目','/api/channel/get.jspx','010102',0,0,0,0,0,0,NULL),(3,'新增栏目','/api/channel/save.jspx','010103',0,0,0,0,0,0,NULL),(4,'修改栏目','/api/channel/update.jspx','010104',0,0,0,0,0,0,NULL),(5,'内容列表','/api/content/list.jspx','010201',0,0,0,0,0,0,NULL),(6,'内容获取','/api/content/get.jspx','010202',0,0,0,0,0,0,NULL),(7,'我的内容','/api/content/mycontents.jspx','010203',0,0,0,0,0,0,NULL),(8,'新增内容','/api/content/save.jspx','010204',0,0,0,0,0,0,NULL),(9,'修改内容','/api/content/update.jspx','010205',0,0,0,0,0,0,NULL),(10,'删除内容到回收站','/api/content/del.jspx','010206',0,0,0,0,0,0,NULL),(11,'还原内容','/api/content/recycle.jspx','010207',0,0,0,0,0,0,NULL),(12,'审核内容','/api/content/check.jspx','010208',0,0,0,0,0,0,NULL),(13,'退回内容','/api/content/reject.jspx','010209',0,0,0,0,0,0,NULL),(14,'顶内容','/api/content/up.jspx','010210',0,0,0,0,0,0,NULL),(15,'踩内容','/api/content/down.jspx','010211',0,0,0,0,0,0,NULL),(16,'内容购买','/api/content/buy.jspx','010212',0,0,0,0,0,0,NULL),(17,'内容打赏','/api/content/reward.jspx','010213',0,0,0,0,0,0,NULL),(18,'内容收藏','/api/content/collect.jspx','010301',0,0,0,0,0,0,NULL),(19,'我的收藏','/api/content/mycollect.jspx','010302',0,0,0,0,0,0,NULL),(20,'专题列表','/api/topic/list.jspx','010401',0,0,0,0,0,0,NULL),(21,'专题获取','/api/topic/get.jspx','010402',0,0,0,0,0,0,NULL),(22,'专题保存','/api/topic/save.jspx','010403',0,0,0,0,0,0,NULL),(23,'专题修改','/api/topic/update.jspx','040404',0,0,0,0,0,0,NULL),(24,'全文检索','/api/content/search.jspx','010501',0,0,0,0,0,0,NULL),(25,'Tag列表','/api/contenttag/list.jspx','010601',0,0,0,0,0,0,NULL),(26,'热词列表','/api/searchword/list.jspx','010701',0,0,0,0,0,0,NULL),(27,'友情链接列表','/api/friendlink/list.jspx','010801',0,0,0,0,0,0,NULL),(28,'友情链接分类列表','/api/friendlinkctg/list.jspx','010802',0,0,0,0,0,0,NULL),(29,'广告列表','/api/ad/list.jspx','010901',0,0,0,0,0,0,NULL),(30,'广告分类列表','/api/adctg/list.jspx','010902',0,0,0,0,0,0,NULL),(31,'单广告获取','/api/ad/get.jspx','010903',0,0,0,0,0,0,NULL),(32,'评论列表','/api/comment/list.jspx','011001',0,0,0,0,0,0,NULL),(33,'单评论获取','/api/comment/get.jspx','011002',0,0,0,0,0,0,NULL),(34,'发布评论','/api/comment/save.jspx','011003',0,0,0,0,0,0,NULL),(35,'评论顶','/comment_up.jspx','011004',0,0,0,0,0,0,NULL),(36,'评论踩','/comment_down.jspx','011005',0,0,0,0,0,0,NULL),(37,'我的评论','/api/comment/mylist.jspx','011006',0,0,0,0,0,0,NULL),(38,'留言列表','/api/guestbook/list.jspx','011101',0,0,0,0,0,0,NULL),(39,'我的留言','/api/guestbook/mylist.jspx','011102',0,0,0,0,0,0,NULL),(40,'留言分类列表','/api/guestbookctg/list.jspx','011103',0,0,0,0,0,0,NULL),(41,'单留言获取','/api/guestbook/get.jspx','011104',0,0,0,0,0,0,NULL),(42,'发布留言','/api/guestbook/save.jspx','011105',0,0,0,0,0,0,NULL),(43,'投票列表','/api/vote/list.jspx','011201',0,0,0,0,0,0,NULL),(44,'单个投票','/api/vote/get.jspx','011202',0,0,0,0,0,0,NULL),(45,'投票','/api/vote/save.jspx','011203',0,0,0,0,0,0,NULL),(46,'新增会员','/api/user/add.jspx','011301',0,0,0,0,0,0,NULL),(47,'会员修改资料','/api/user/edit.jspx','011302',0,0,0,0,0,0,NULL),(48,'用户修改密码','/api/user/pwd.jspx','011303',0,0,0,0,0,0,NULL),(49,'读取用户信息','/api/user/get.jspx','011304',0,0,0,0,0,0,NULL),(50,'用户名唯一性检查','/username_unique.jspx','011305',0,0,0,0,0,0,NULL),(51,'字典列表','/api/dictionary/list.jspx','011401',0,0,0,0,0,0,NULL),(52,'我的职位申请','/api/resume/myapplys.jspx','011501',0,0,0,0,0,0,NULL),(53,'申请职位','/api/resume/apply.jspx','011502',0,0,0,0,0,0,NULL),(54,'撤销申请','/api/resume/cancelApply.jspx','011503',0,0,0,0,0,0,NULL),(55,'查看我的简历','/api/resume/get.jspx','011601',0,0,0,0,0,0,NULL),(56,'修改简历','/api/resume/update.jspx','011602',0,0,0,0,0,0,NULL),(57,'站内信列表','/api/message/list.jspx','011701',0,0,0,0,0,0,NULL),(58,'站内信单信息获取','/api/message/get.jspx','011702',0,0,0,0,0,0,NULL),(59,'站内信息发送','/api/message/send.jspx','011703',0,0,0,0,0,0,NULL),(60,'站内信草稿修改','/api/message/draftUpdate.jspx','011703',0,0,0,0,0,0,NULL),(61,'站内信草稿发送','/api/message/draftToSend.jspx','011704',0,0,0,0,0,0,NULL),(62,'删除站内信到回收站','/api/message/trash.jspx','011705',0,0,0,0,0,0,NULL),(63,'还原站内信息','/api/message/revert.jspx','011706',0,0,0,0,0,0,NULL),(64,'删除站内信','/api/message/delete.jspx','011707',0,0,0,0,0,0,NULL),(65,'上传文件','/api/upload/o_upload.jspx','011801',0,0,0,0,0,0,NULL),(66,'上传文库文档','/api/upload/o_upload_doc.jspx','011802',0,0,0,0,0,0,NULL),(67,'内容打赏记录','/api/order/getByContent.jspx','011901',0,0,0,0,0,0,NULL),(68,'我的消费记录和我的订单','/api/order/myorders.jspx','011902',0,0,0,0,0,0,NULL),(69,'收益统计','/api/order/chargelist.jspx','011903',0,0,0,0,0,0,NULL),(70,'提现申请','/api/draw/apply.jspx','011904',0,0,0,0,0,0,NULL),(71,'删除提现申请','/api/draw/delete.jspx','011905',0,0,0,0,0,0,NULL),(72,'提现申请列表','/api/draw/list.jspx','011906',0,0,0,0,0,0,NULL),(73,'个人账户信息获取','/api/account/get.jspx','011907',0,0,0,0,0,0,NULL),(74,'登陆','/api/user/login.jspx','012001',0,0,0,0,0,0,NULL),(75,'退出','/api/user/logout.jspx','012002',0,0,0,0,0,0,NULL),(76,'用户状态检查','/api/user/getStatus.jspx','012003',0,0,0,0,0,0,NULL);
/*!40000 ALTER TABLE `tb_api_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_api_record`
--

DROP TABLE IF EXISTS `tb_api_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_api_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `api_account` int(11) NOT NULL DEFAULT '0' COMMENT '调用的账户',
  `call_ip` varchar(255) DEFAULT '' COMMENT '调用的IP',
  `api_info_id` int(11) DEFAULT '0' COMMENT '接口',
  `api_call_time` datetime NOT NULL COMMENT '调用时间',
  `call_time_stamp` bigint(20) NOT NULL DEFAULT '0' COMMENT '调用的时间戳',
  `sign` varchar(100) NOT NULL DEFAULT '' COMMENT '签名数据(不允许重复调用)',
  PRIMARY KEY (`id`),
  KEY `fk_api_record_account` (`api_account`),
  KEY `fk_api_info` (`api_info_id`),
  KEY `index_tb_api_record_sign` (`sign`)
) ENGINE=InnoDB AUTO_INCREMENT=326 DEFAULT CHARSET=utf8 COMMENT='API调用记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_api_record`
--

LOCK TABLES `tb_api_record` WRITE;
/*!40000 ALTER TABLE `tb_api_record` DISABLE KEYS */;
INSERT INTO `tb_api_record` VALUES (323,1,'192.168.0.158',NULL,'2017-12-26 18:44:45',1514285085291,'7275DAC8E171E5E8175A26E8ED094610'),(324,1,'192.168.0.158',NULL,'2017-12-26 18:44:51',1514285091195,'46D8F2E55648D13BAA08A2F69E165D0E'),(325,1,'192.168.0.158',NULL,'2017-12-26 18:44:54',1514285094160,'A0C2BBA82433473A0AF1A24E407B7C75');
/*!40000 ALTER TABLE `tb_api_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_channel`
--

DROP TABLE IF EXISTS `tb_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_channel` (
  `channel_id` int(11) NOT NULL AUTO_INCREMENT,
  `model_id` int(11) NOT NULL COMMENT '模型ID',
  `site_id` int(11) NOT NULL COMMENT '站点ID',
  `parent_id` int(11) DEFAULT '0' COMMENT '父栏目ID',
  `channel_path` varchar(30) DEFAULT NULL COMMENT '访问路径',
  `lft` int(11) NOT NULL DEFAULT '1' COMMENT '树左边',
  `rgt` int(11) NOT NULL DEFAULT '2' COMMENT '树右边',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  `has_content` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有内容',
  `is_display` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示',
  PRIMARY KEY (`channel_id`),
  KEY `fk_tb_channel_model` (`model_id`),
  KEY `fk_tb_channel_parent` (`parent_id`),
  KEY `fk_tb_channel_site` (`site_id`),
  KEY `index_tb_channel_lft` (`lft`),
  KEY `index_tb_channel_rgt` (`rgt`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8 COMMENT='CMS栏目表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_channel`
--

LOCK TABLES `tb_channel` WRITE;
/*!40000 ALTER TABLE `tb_channel` DISABLE KEYS */;
INSERT INTO `tb_channel` VALUES (75,1,1,0,'news',1,2,1,1,1),(76,5,1,0,'pic',3,4,2,1,1),(77,6,1,0,'video',5,6,3,1,1),(78,4,1,0,'download',7,16,7,1,1),(79,8,1,0,'job',17,18,4,1,1),(80,2,1,0,'survey',19,20,5,0,1),(82,2,1,0,'message',21,22,6,0,1),(90,4,1,78,'xtrj',8,9,10,1,1),(91,4,1,78,'mtzs',10,11,10,1,1),(92,4,1,78,'jptj',12,13,9,1,1),(93,4,1,78,'yxyl',14,15,10,1,1);
/*!40000 ALTER TABLE `tb_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_channel_attr`
--

DROP TABLE IF EXISTS `tb_channel_attr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_channel_attr` (
  `channel_id` int(11) NOT NULL,
  `attr_name` varchar(30) NOT NULL COMMENT '名称',
  `attr_value` varchar(255) DEFAULT NULL COMMENT '值',
  KEY `fk_tb_attr_channel` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS栏目扩展属性表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_channel_attr`
--

LOCK TABLES `tb_channel_attr` WRITE;
/*!40000 ALTER TABLE `tb_channel_attr` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_channel_attr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_channel_count`
--

DROP TABLE IF EXISTS `tb_channel_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_channel_count` (
  `channel_id` int(11) NOT NULL,
  `views` int(11) NOT NULL DEFAULT '0' COMMENT '总访问数',
  `views_month` int(11) NOT NULL DEFAULT '0' COMMENT '月访问数',
  `views_week` int(11) NOT NULL DEFAULT '0' COMMENT '周访问数',
  `views_day` int(11) NOT NULL DEFAULT '0' COMMENT '日访问数',
  `content_count_total` int(11) NOT NULL DEFAULT '0' COMMENT '内容发布数',
  `content_count_day` int(11) NOT NULL DEFAULT '0' COMMENT '内容今日发布数',
  `content_count_week` int(11) NOT NULL DEFAULT '0' COMMENT '内容本周发布数',
  `content_count_month` int(11) NOT NULL DEFAULT '0' COMMENT '内容本月发布数',
  `content_count_year` int(11) NOT NULL DEFAULT '0' COMMENT '内容今年发布数',
  PRIMARY KEY (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS栏目访问量计数表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_channel_count`
--

LOCK TABLES `tb_channel_count` WRITE;
/*!40000 ALTER TABLE `tb_channel_count` DISABLE KEYS */;
INSERT INTO `tb_channel_count` VALUES (75,443,126,126,0,24,18,18,18,24),(76,203,18,17,1,11,0,0,0,11),(77,38,24,24,0,15,0,0,0,15),(78,25,5,5,0,14,0,0,0,14),(79,49,19,19,0,10,0,0,0,10),(80,33,6,6,0,0,0,0,0,0),(82,6,0,0,0,0,0,0,0,0),(90,12,1,1,0,4,0,0,0,4),(91,2,2,2,0,8,0,0,0,8),(92,12,7,7,0,0,0,0,0,0),(93,2,0,0,0,2,0,0,0,2);
/*!40000 ALTER TABLE `tb_channel_count` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_channel_ext`
--

DROP TABLE IF EXISTS `tb_channel_ext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_channel_ext` (
  `channel_id` int(11) NOT NULL,
  `channel_name` varchar(100) NOT NULL COMMENT '名称',
  `final_step` tinyint(4) DEFAULT '2' COMMENT '终审级别',
  `after_check` tinyint(4) DEFAULT NULL COMMENT '审核后(1:不能修改删除;2:修改后退回;3:修改后不变)',
  `is_static_channel` char(1) NOT NULL DEFAULT '0' COMMENT '是否栏目静态化',
  `is_static_content` char(1) NOT NULL DEFAULT '0' COMMENT '是否内容静态化',
  `is_access_by_dir` char(1) NOT NULL DEFAULT '1' COMMENT '是否使用目录访问',
  `is_list_child` char(1) NOT NULL DEFAULT '0' COMMENT '是否使用子栏目列表',
  `page_size` int(11) NOT NULL DEFAULT '20' COMMENT '每页多少条记录',
  `channel_rule` varchar(150) DEFAULT NULL COMMENT '栏目页生成规则',
  `content_rule` varchar(150) DEFAULT NULL COMMENT '内容页生成规则',
  `link` varchar(255) DEFAULT NULL COMMENT '外部链接',
  `tpl_channel` varchar(100) DEFAULT NULL COMMENT '栏目页模板',
  `tpl_content` varchar(100) DEFAULT NULL COMMENT '内容页模板',
  `title_img` varchar(100) DEFAULT NULL COMMENT '缩略图',
  `content_img` varchar(100) DEFAULT NULL COMMENT '内容图',
  `has_title_img` tinyint(1) NOT NULL DEFAULT '0' COMMENT '内容是否有缩略图',
  `has_content_img` tinyint(1) NOT NULL DEFAULT '0' COMMENT '内容是否有内容图',
  `title_img_width` int(11) NOT NULL DEFAULT '139' COMMENT '内容标题图宽度',
  `title_img_height` int(11) NOT NULL DEFAULT '139' COMMENT '内容标题图高度',
  `content_img_width` int(11) NOT NULL DEFAULT '310' COMMENT '内容内容图宽度',
  `content_img_height` int(11) NOT NULL DEFAULT '310' COMMENT '内容内容图高度',
  `comment_control` int(11) NOT NULL DEFAULT '0' COMMENT '评论(0:匿名;1:会员一次;2:关闭,3会员多次)',
  `allow_updown` tinyint(1) NOT NULL DEFAULT '1' COMMENT '顶踩(true:开放;false:关闭)',
  `is_blank` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否新窗口打开',
  `title` varchar(255) DEFAULT NULL COMMENT 'TITLE',
  `keywords` varchar(255) DEFAULT NULL COMMENT 'KEYWORDS',
  `description` varchar(255) DEFAULT NULL COMMENT 'DESCRIPTION',
  `allow_share` tinyint(1) NOT NULL DEFAULT '0' COMMENT '分享(true:开放;false:关闭)',
  `allow_score` tinyint(1) NOT NULL DEFAULT '0' COMMENT '评分(true:开放;false:关闭)',
  `tpl_mobile_channel` varchar(100) DEFAULT NULL COMMENT '手机栏目页模板',
  PRIMARY KEY (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS栏目内容表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_channel_ext`
--

LOCK TABLES `tb_channel_ext` WRITE;
/*!40000 ALTER TABLE `tb_channel_ext` DISABLE KEYS */;
INSERT INTO `tb_channel_ext` VALUES (75,'新闻',NULL,NULL,'0','0','0','0',10,NULL,NULL,NULL,'/WEB-INF/t/cms/www/default/channel/news.html',NULL,NULL,NULL,0,0,510,288,310,310,0,1,0,NULL,NULL,NULL,1,1,'/WEB-INF/t/cms/www/mobile/channel/news.html'),(76,'图库',NULL,NULL,'0','0','0','0',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,510,288,310,310,0,1,0,NULL,NULL,NULL,0,0,''),(77,'视频',NULL,NULL,'0','0','0','0',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,510,288,310,310,0,1,0,NULL,NULL,NULL,0,0,''),(78,'下载',NULL,NULL,'0','0','0','0',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,139,139,310,310,0,1,0,NULL,NULL,NULL,0,0,''),(79,'招聘',NULL,NULL,'0','0','0','0',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,139,139,310,310,0,1,0,NULL,NULL,NULL,0,0,''),(80,'网络调查',NULL,NULL,'0','0','0','0',10,NULL,NULL,NULL,'/WEB-INF/t/cms/www/default/alone/alone_survey.html',NULL,NULL,NULL,0,0,139,139,310,310,0,1,0,NULL,NULL,NULL,0,0,'/WEB-INF/t/cms/www/mobile/alone/alone_survey.html.html'),(82,'留言板',NULL,NULL,'0','0','0','0',10,NULL,NULL,'/guestbook.jspx',NULL,NULL,NULL,NULL,0,0,139,139,310,310,0,1,0,NULL,NULL,NULL,0,0,''),(90,'系统软件',NULL,NULL,'0','0','0','0',10,NULL,NULL,NULL,'/WEB-INF/t/cms/www/default/channel/download_child.html',NULL,NULL,NULL,1,1,139,139,310,310,0,1,0,NULL,NULL,NULL,0,0,''),(91,'媒体助手',NULL,NULL,'0','0','0','0',10,NULL,NULL,NULL,'/WEB-INF/t/cms/www/default/channel/download_child.html',NULL,NULL,NULL,1,1,139,139,310,310,0,1,0,NULL,NULL,NULL,0,0,''),(92,'精品推荐',NULL,NULL,'0','0','0','0',10,NULL,NULL,NULL,'/WEB-INF/t/cms/www/default/channel/download_recommend.html',NULL,NULL,NULL,0,0,139,139,310,310,0,1,0,NULL,NULL,NULL,0,0,''),(93,'游戏娱乐',NULL,NULL,'0','0','0','0',10,NULL,NULL,NULL,'/WEB-INF/t/cms/www/default/channel/download_child.html',NULL,NULL,NULL,1,1,139,139,310,310,0,1,0,NULL,NULL,NULL,0,0,'');
/*!40000 ALTER TABLE `tb_channel_ext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_channel_txt`
--

DROP TABLE IF EXISTS `tb_channel_txt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_channel_txt` (
  `channel_id` int(11) NOT NULL,
  `txt` longtext COMMENT '栏目内容',
  `txt1` longtext COMMENT '扩展内容1',
  `txt2` longtext COMMENT '扩展内容2',
  `txt3` longtext COMMENT '扩展内容3',
  PRIMARY KEY (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS栏目文本表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_channel_txt`
--

LOCK TABLES `tb_channel_txt` WRITE;
/*!40000 ALTER TABLE `tb_channel_txt` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_channel_txt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_comment`
--

DROP TABLE IF EXISTS `tb_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_user_id` int(11) DEFAULT NULL COMMENT '评论用户ID',
  `reply_user_id` int(11) DEFAULT NULL COMMENT '回复用户ID',
  `content_id` int(11) NOT NULL COMMENT '内容ID',
  `site_id` int(11) NOT NULL COMMENT '站点ID',
  `create_time` datetime NOT NULL COMMENT '评论时间',
  `reply_time` datetime DEFAULT NULL COMMENT '回复时间',
  `ups` smallint(6) NOT NULL DEFAULT '0' COMMENT '支持数',
  `downs` smallint(6) NOT NULL DEFAULT '0' COMMENT '反对数',
  `is_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `is_checked` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否审核',
  `score` int(11) DEFAULT NULL COMMENT '评分',
  `parent_id` int(11) DEFAULT NULL COMMENT '父级评论',
  `reply_count` int(11) DEFAULT '0' COMMENT '回复数',
  PRIMARY KEY (`comment_id`),
  KEY `fk_tb_comment_content` (`content_id`),
  KEY `fk_tb_comment_reply` (`reply_user_id`),
  KEY `fk_tb_comment_site` (`site_id`),
  KEY `fk_tb_comment_user` (`comment_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='CMS评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_comment`
--

LOCK TABLES `tb_comment` WRITE;
/*!40000 ALTER TABLE `tb_comment` DISABLE KEYS */;
INSERT INTO `tb_comment` VALUES (11,NULL,NULL,30,1,'2016-10-10 08:50:25',NULL,0,0,1,1,NULL,NULL,0),(13,NULL,NULL,39,1,'2016-10-10 08:56:21',NULL,0,0,1,1,NULL,NULL,0),(14,NULL,NULL,130,1,'2016-10-10 14:00:12',NULL,0,0,1,1,NULL,NULL,0),(15,NULL,NULL,132,1,'2016-10-10 14:01:13',NULL,0,0,1,1,NULL,NULL,0);
/*!40000 ALTER TABLE `tb_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_comment_ext`
--

DROP TABLE IF EXISTS `tb_comment_ext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_comment_ext` (
  `comment_id` int(11) NOT NULL,
  `ip` varchar(50) DEFAULT NULL COMMENT 'IP地址',
  `text` longtext COMMENT '评论内容',
  `reply` longtext COMMENT '回复内容',
  KEY `fk_tb_ext_comment` (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS评论扩展表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_comment_ext`
--

LOCK TABLES `tb_comment_ext` WRITE;
/*!40000 ALTER TABLE `tb_comment_ext` DISABLE KEYS */;
INSERT INTO `tb_comment_ext` VALUES (11,'117.41.152.66','早就该这样了，不知道多少不法分子利用不实名手机号进行诈骗。',''),(13,'117.41.152.66','四川人民伤不起，忘国家加紧开展救援以及灾后重建工作。',''),(14,'117.41.152.66','保持定力：坚持走中国特色解决民族问题的正确道路',''),(15,'117.41.152.66','燃烧吧小宇宙，中国大妈征服世界，哈哈哈哈...','');
/*!40000 ALTER TABLE `tb_comment_ext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_config`
--

DROP TABLE IF EXISTS `tb_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_config` (
  `config_id` int(11) NOT NULL,
  `context_path` varchar(20) DEFAULT '/JeeCms' COMMENT '部署路径',
  `servlet_point` varchar(20) DEFAULT NULL COMMENT 'Servlet挂载点',
  `port` int(11) DEFAULT NULL COMMENT '端口',
  `db_file_uri` varchar(50) NOT NULL DEFAULT '/dbfile.svl?n=' COMMENT '数据库附件访问地址',
  `is_upload_to_db` tinyint(1) NOT NULL DEFAULT '0' COMMENT '上传附件至数据库',
  `def_img` varchar(255) NOT NULL DEFAULT '/JeeCms/r/cms/www/default/no_picture.gif' COMMENT '图片不存在时默认图片',
  `login_url` varchar(255) NOT NULL DEFAULT '/login.jspx' COMMENT '登录地址',
  `process_url` varchar(255) DEFAULT NULL COMMENT '登录后处理地址',
  `mark_on` tinyint(1) NOT NULL DEFAULT '1' COMMENT '开启图片水印',
  `mark_width` int(11) NOT NULL DEFAULT '120' COMMENT '图片最小宽度',
  `mark_height` int(11) NOT NULL DEFAULT '120' COMMENT '图片最小高度',
  `mark_image` varchar(100) DEFAULT '/r/cms/www/watermark.png' COMMENT '图片水印',
  `mark_content` varchar(100) NOT NULL DEFAULT 'www.jeecms.com' COMMENT '文字水印内容',
  `mark_size` int(11) NOT NULL DEFAULT '20' COMMENT '文字水印大小',
  `mark_color` varchar(10) NOT NULL DEFAULT '#FF0000' COMMENT '文字水印颜色',
  `mark_alpha` int(11) NOT NULL DEFAULT '50' COMMENT '水印透明度（0-100）',
  `mark_position` int(11) NOT NULL DEFAULT '1' COMMENT '水印位置(0-5)',
  `mark_offset_x` int(11) NOT NULL DEFAULT '0' COMMENT 'x坐标偏移量',
  `mark_offset_y` int(11) NOT NULL DEFAULT '0' COMMENT 'y坐标偏移量',
  `count_clear_time` date NOT NULL COMMENT '计数器清除时间',
  `count_copy_time` datetime NOT NULL COMMENT '计数器拷贝时间',
  `download_code` varchar(32) NOT NULL DEFAULT 'jeecms' COMMENT '下载防盗链md5混淆码',
  `download_time` int(11) NOT NULL DEFAULT '12' COMMENT '下载有效时间（小时）',
  `email_host` varchar(50) DEFAULT NULL COMMENT '邮件发送服务器',
  `email_encoding` varchar(20) DEFAULT NULL COMMENT '邮件发送编码',
  `email_username` varchar(100) DEFAULT NULL COMMENT '邮箱用户名',
  `email_password` varchar(100) DEFAULT NULL COMMENT '邮箱密码',
  `email_personal` varchar(100) DEFAULT NULL COMMENT '邮箱发件人',
  `email_validate` tinyint(1) DEFAULT '0' COMMENT '开启邮箱验证',
  `view_only_checked` tinyint(1) NOT NULL DEFAULT '0' COMMENT '只有终审才能浏览内容页',
  `flow_clear_time` date NOT NULL COMMENT '流量统计清除时间',
  `channel_count_clear_time` date NOT NULL COMMENT '栏目发布内容计数器清除时间',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_config`
--

LOCK TABLES `tb_config` WRITE;
/*!40000 ALTER TABLE `tb_config` DISABLE KEYS */;
INSERT INTO `tb_config` VALUES (1,'/jeecmsv8f',NULL,8080,'/dbfile.svl?n=',0,'/r/cms/www/no_picture.gif','/login.jspx',NULL,0,120,120,'/r/cms/www/watermark.png','www.jeecms.com',40,'#FF0000',100,1,0,0,'2016-10-14','2016-10-14 09:56:20','jeecms',12,NULL,NULL,NULL,NULL,NULL,0,0,'2016-10-14','2016-10-13');
/*!40000 ALTER TABLE `tb_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_content`
--

DROP TABLE IF EXISTS `tb_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_content` (
  `content_id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_id` int(11) NOT NULL COMMENT '栏目ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `type_id` int(11) NOT NULL COMMENT '属性ID',
  `model_id` int(11) NOT NULL COMMENT '模型ID',
  `site_id` int(11) NOT NULL COMMENT '站点ID',
  `sort_date` datetime NOT NULL COMMENT '排序日期',
  `top_level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '固顶级别',
  `has_title_img` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有标题图',
  `is_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `status` tinyint(4) NOT NULL DEFAULT '2' COMMENT '状态(0:草稿;1:审核中;2:审核通过;3:回收站;4:投稿;5:归档)',
  `views_day` int(11) NOT NULL DEFAULT '0' COMMENT '日访问数',
  `comments_day` smallint(6) NOT NULL DEFAULT '0' COMMENT '日评论数',
  `downloads_day` smallint(6) NOT NULL DEFAULT '0' COMMENT '日下载数',
  `ups_day` smallint(6) NOT NULL DEFAULT '0' COMMENT '日顶数',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '得分',
  `recommend_level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '推荐级别',
  PRIMARY KEY (`content_id`),
  KEY `fk_tb_content_site` (`site_id`),
  KEY `fk_tb_content_type` (`type_id`),
  KEY `fk_tb_content_user` (`user_id`),
  KEY `fk_tb_contentchannel` (`channel_id`),
  KEY `fk_tb_content_model` (`model_id`),
  KEY `index_tb_content_top_level_sort` (`top_level`,`sort_date`),
  KEY `index_tb_content_status` (`status`),
  KEY `index_tb_content_sort_date` (`sort_date`),
  KEY `index_tb_content_is_recommend` (`is_recommend`),
  KEY `index_tb_content_recommend_level` (`recommend_level`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8 COMMENT='CMS内容表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_content`
--

LOCK TABLES `tb_content` WRITE;
/*!40000 ALTER TABLE `tb_content` DISABLE KEYS */;
INSERT INTO `tb_content` VALUES (2,76,1,2,5,1,'2016-07-15 14:47:24',0,0,0,2,1,0,0,0,0,0),(7,76,1,2,5,1,'2016-07-15 15:33:26',0,0,1,2,17,0,0,0,0,0),(11,75,1,1,1,1,'2016-07-15 16:23:32',0,0,0,2,1,0,0,0,0,0),(12,75,1,1,1,1,'2016-07-15 17:22:47',0,0,0,2,1,0,0,0,1,0),(13,76,1,2,5,1,'2016-07-19 14:12:48',1,0,1,2,3,0,0,0,0,0),(14,75,1,2,1,1,'2016-07-19 14:26:30',0,0,0,2,21,0,0,14,13,0),(23,75,1,1,1,1,'2016-09-13 17:16:04',0,0,0,2,16,0,0,12,11,1),(27,75,1,2,1,1,'2016-09-22 16:30:13',0,0,0,2,1,0,0,2,2,1),(28,75,1,2,1,1,'2016-09-22 16:56:46',0,0,0,2,4,0,0,2,2,1),(29,75,1,1,1,1,'2016-09-23 09:07:33',0,0,0,2,1,0,0,1,1,1),(30,75,1,1,1,1,'2016-09-23 09:09:41',0,0,0,2,54,1,0,44,41,1),(32,75,1,2,1,1,'2016-09-23 09:19:38',0,0,0,2,2,0,0,1,2,1),(33,75,1,2,1,1,'2016-09-23 09:23:39',0,0,0,2,18,0,0,18,18,1),(36,75,1,2,1,1,'2016-09-23 09:40:21',0,0,0,2,0,0,0,0,0,1),(37,75,1,2,1,1,'2016-09-23 09:43:34',0,0,0,2,2,0,0,1,0,1),(39,75,1,2,1,1,'2016-09-23 09:54:17',0,0,0,2,27,1,0,17,18,1),(43,79,1,1,8,1,'2016-09-26 09:33:15',0,0,0,2,2,0,0,0,0,1),(44,79,1,1,8,1,'2016-09-26 09:34:35',0,0,0,2,1,0,0,0,0,1),(45,79,1,1,8,1,'2016-09-26 09:38:39',0,0,0,2,17,0,0,0,0,1),(46,79,1,1,8,1,'2016-09-26 09:45:02',0,0,0,2,17,0,0,0,0,1),(47,79,1,1,8,1,'2016-09-26 09:47:54',0,0,0,2,16,0,0,0,0,1),(48,79,1,1,8,1,'2016-09-26 09:50:04',0,0,0,2,2,0,0,0,0,1),(49,79,1,1,8,1,'2016-09-26 09:51:13',0,0,0,2,16,0,0,0,0,1),(50,79,1,1,8,1,'2016-09-26 09:54:56',0,0,0,2,16,0,0,0,0,1),(51,79,1,1,8,1,'2016-09-26 09:56:01',0,0,0,2,5,0,0,0,0,1),(53,77,1,2,6,1,'2016-09-26 10:19:13',0,0,0,2,1,0,0,0,0,1),(55,77,1,2,6,1,'2016-09-26 10:20:11',0,0,0,2,0,0,0,0,0,1),(57,77,1,2,6,1,'2016-09-26 10:21:19',0,0,0,2,4,0,0,0,0,1),(59,77,1,2,6,1,'2016-09-26 10:22:24',0,0,0,2,2,0,0,0,0,1),(61,77,1,2,6,1,'2016-09-26 10:29:06',0,0,0,2,1,0,0,0,0,1),(63,77,1,2,6,1,'2016-09-26 10:30:05',0,0,0,2,2,0,0,0,0,1),(69,90,1,1,4,1,'2016-09-26 16:37:28',0,1,1,2,16,0,1,0,0,1),(71,91,1,1,4,1,'2016-09-27 09:47:27',0,1,1,2,1,0,0,0,0,1),(72,90,1,2,4,1,'2016-09-27 10:18:46',0,1,1,2,4,0,0,0,0,1),(100,93,1,2,4,1,'2016-10-10 11:09:06',0,1,1,2,1,0,0,0,0,1),(101,91,1,2,4,1,'2016-10-10 11:16:31',0,1,1,2,1,0,0,0,0,1),(102,90,1,1,4,1,'2016-10-10 11:19:18',0,1,1,2,16,0,39,0,0,1),(103,90,1,1,4,1,'2016-10-10 11:21:37',0,1,1,2,1,0,0,0,0,1),(104,93,1,1,4,1,'2016-10-10 11:27:17',0,1,1,2,1,0,0,0,0,1),(105,91,1,1,4,1,'2016-10-10 11:28:52',0,1,1,2,1,0,0,0,0,1),(106,91,1,1,4,1,'2016-10-10 11:30:54',0,1,1,2,1,0,0,0,0,1),(107,91,1,1,4,1,'2016-10-10 11:32:35',0,1,1,2,1,0,0,0,0,1),(108,91,1,1,4,1,'2016-10-10 11:34:05',0,1,1,2,1,0,0,0,0,1),(109,91,1,1,4,1,'2016-10-10 11:35:26',0,1,1,2,16,0,21,0,0,1),(110,91,1,1,4,1,'2016-10-10 11:36:32',0,1,1,2,4,0,1,0,0,1),(111,75,1,2,1,1,'2016-10-10 11:45:47',0,0,0,2,16,0,0,12,12,1),(112,75,1,2,1,1,'2016-10-10 11:48:08',0,0,0,2,17,0,0,16,18,1),(113,75,1,4,1,1,'2016-10-10 11:50:03',0,0,0,2,29,0,0,13,11,1),(114,76,1,2,5,1,'2016-10-10 13:11:12',0,0,1,2,18,0,0,0,0,1),(115,76,1,2,5,1,'2016-10-10 13:15:37',0,0,1,2,1,0,0,0,0,1),(116,76,1,2,5,1,'2016-10-10 13:19:22',0,0,1,2,1,0,0,0,0,1),(117,76,1,2,5,1,'2016-10-10 13:22:07',0,0,0,2,18,0,0,0,0,1),(118,76,1,2,5,1,'2016-10-10 13:23:50',0,0,0,2,1,0,0,0,0,1),(119,76,1,2,5,1,'2016-10-10 13:26:38',0,0,0,2,2,0,0,0,0,1),(120,76,1,2,5,1,'2016-10-10 13:35:17',0,0,0,2,1,0,0,0,0,1),(121,77,1,2,6,1,'2016-10-10 13:38:11',1,1,1,2,2,0,0,0,0,1),(122,77,1,2,6,1,'2016-10-10 13:40:05',0,1,1,2,1,0,0,0,0,1),(123,77,1,2,6,1,'2016-10-10 13:41:03',0,1,1,2,1,0,0,0,0,1),(124,77,1,2,6,1,'2016-10-10 13:42:48',0,0,0,2,2,0,0,0,0,1),(125,77,1,2,6,1,'2016-10-10 13:44:47',0,0,0,2,1,0,0,0,0,1),(126,77,1,2,6,1,'2016-10-10 13:46:01',0,0,0,2,2,0,0,0,0,1),(127,77,1,2,6,1,'2016-10-10 13:46:26',0,0,0,2,1,0,0,0,0,1),(128,77,1,2,6,1,'2016-10-10 13:46:52',0,0,0,1,1,0,0,0,0,1),(129,77,1,2,6,1,'2016-10-10 13:47:24',0,0,0,2,18,0,0,0,0,1),(130,75,1,1,1,1,'2016-10-10 13:51:07',1,0,0,2,22,1,0,12,12,1),(131,75,1,1,1,1,'2016-10-10 13:54:05',0,0,0,1,17,0,0,15,13,1),(132,75,1,1,1,1,'2016-10-10 13:55:46',0,0,0,1,7,2,0,1,1,1),(140,79,1,1,8,1,'2016-10-10 14:27:44',0,0,0,2,18,0,0,0,0,1),(141,76,1,2,5,1,'2016-10-11 09:44:23',0,0,0,0,2,0,0,0,0,1);
/*!40000 ALTER TABLE `tb_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_content_attachment`
--

DROP TABLE IF EXISTS `tb_content_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_content_attachment` (
  `content_id` int(11) NOT NULL,
  `priority` int(11) NOT NULL COMMENT '排列顺序',
  `attachment_path` varchar(255) NOT NULL COMMENT '附件路径',
  `attachment_name` varchar(100) NOT NULL COMMENT '附件名称',
  `filename` varchar(100) DEFAULT NULL COMMENT '文件名',
  `download_count` int(11) NOT NULL DEFAULT '0' COMMENT '下载次数',
  KEY `fk_tb_attachment_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容附件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_content_attachment`
--

LOCK TABLES `tb_content_attachment` WRITE;
/*!40000 ALTER TABLE `tb_content_attachment` DISABLE KEYS */;
INSERT INTO `tb_content_attachment` VALUES (69,0,'/u/cms/www/201609/261635496465.zip','演示.zip',NULL,0),(71,0,'/u/cms/www/201609/271002022fag.zip','演示.zip',NULL,0),(72,0,'/u/cms/www/201609/27102743993k.zip','演示.zip',NULL,0),(100,0,'/u/cms/www/201610/10110756cg7o.zip','演示.zip',NULL,0),(101,0,'/u/cms/www/201610/10111518cqda.zip','演示.zip',NULL,0),(102,0,'/u/cms/www/201610/10111758q1kj.zip','演示.zip',NULL,0),(103,0,'/u/cms/www/201610/101120397iez.zip','演示.zip',NULL,0),(104,0,'/u/cms/www/201610/10112554wirt.zip','演示.zip',NULL,0),(105,0,'/u/cms/www/201610/10112814u17l.zip','演示.zip',NULL,0),(106,0,'/u/cms/www/201610/101130257966.zip','演示.zip',NULL,0),(107,0,'/u/cms/www/201610/101131571wkz.zip','演示.zip',NULL,0),(108,0,'/u/cms/www/201610/101133341nc3.zip','演示.zip',NULL,0),(109,0,'/u/cms/www/201610/10113459gvbx.zip','演示.zip',NULL,0),(110,0,'/u/cms/www/201610/101136270k36.zip','演示.zip',NULL,0);
/*!40000 ALTER TABLE `tb_content_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_content_buy`
--

DROP TABLE IF EXISTS `tb_content_buy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_content_buy` (
  `content_buy_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_number` varchar(50) NOT NULL DEFAULT '' COMMENT '订单号',
  `content_id` int(11) NOT NULL COMMENT '内容ID',
  `buy_user_id` int(11) DEFAULT NULL COMMENT '购买用户ID',
  `author_user_id` int(11) NOT NULL COMMENT '笔者ID',
  `charge_amount` double(11,2) NOT NULL DEFAULT '0.00' COMMENT '成交金额',
  `author_amount` double(11,4) NOT NULL DEFAULT '0.0000' COMMENT '笔者所得',
  `plat_amount` double(11,4) NOT NULL DEFAULT '0.0000' COMMENT '平台所得',
  `buy_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '成交时间',
  `has_paid_author` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已经结算给作者(0未结算 1已经结算)',
  `order_num_weixin` varchar(255) DEFAULT NULL COMMENT '微信支付订单号',
  `order_num_alipay` varchar(100) DEFAULT NULL COMMENT '支付宝订单号',
  `charge_reward` tinyint(1) NOT NULL DEFAULT '1' COMMENT '模式 1收费 2打赏',
  PRIMARY KEY (`content_buy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收费文章购买记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_content_buy`
--

LOCK TABLES `tb_content_buy` WRITE;
/*!40000 ALTER TABLE `tb_content_buy` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_content_buy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_content_channel`
--

DROP TABLE IF EXISTS `tb_content_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_content_channel` (
  `channel_id` int(11) NOT NULL,
  `content_id` int(11) NOT NULL,
  PRIMARY KEY (`channel_id`,`content_id`),
  KEY `fk_tb_channel_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容栏目关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_content_channel`
--

LOCK TABLES `tb_content_channel` WRITE;
/*!40000 ALTER TABLE `tb_content_channel` DISABLE KEYS */;
INSERT INTO `tb_content_channel` VALUES (76,2),(76,7),(75,11),(75,12),(76,13),(75,14),(75,23),(75,27),(75,28),(75,29),(75,30),(75,32),(75,33),(75,36),(75,37),(75,39),(79,43),(79,44),(79,45),(79,46),(79,47),(79,48),(79,49),(79,50),(79,51),(77,53),(77,55),(77,57),(77,59),(77,61),(77,63),(90,69),(91,71),(90,72),(93,100),(91,101),(90,102),(90,103),(93,104),(91,105),(91,106),(91,107),(91,108),(91,109),(91,110),(75,111),(75,112),(75,113),(76,114),(76,115),(76,116),(76,117),(76,118),(76,119),(76,120),(77,121),(77,122),(77,123),(77,124),(77,125),(77,126),(77,127),(77,128),(77,129),(75,130),(75,131),(75,132),(79,140),(76,141);
/*!40000 ALTER TABLE `tb_content_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_content_charge`
--

DROP TABLE IF EXISTS `tb_content_charge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_content_charge` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `charge_amount` double(11,2) NOT NULL DEFAULT '0.00' COMMENT '收费金额',
  `total_amount` double(11,2) NOT NULL DEFAULT '0.00' COMMENT '已累计收费',
  `year_amount` double(11,2) NOT NULL DEFAULT '0.00' COMMENT '年金额',
  `month_amount` double(11,2) NOT NULL DEFAULT '0.00' COMMENT '月金额',
  `day_amount` double(11,2) NOT NULL DEFAULT '0.00' COMMENT '日金额',
  `last_buy_time` timestamp NULL DEFAULT NULL COMMENT '最后购买时间',
  `charge_reward` tinyint(1) NOT NULL DEFAULT '0' COMMENT '模式，1收费 2打赏',
  `reward_random_min` double(11,2) NOT NULL DEFAULT '0.00' COMMENT '随机 最小值',
  `reward_random_max` double(11,2) NOT NULL DEFAULT '0.00' COMMENT '随机 最大值',
  `reward_pattern` tinyint(1) NOT NULL DEFAULT '0' COMMENT '打赏模式(0随机 1固定)',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收费内容配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_content_charge`
--

LOCK TABLES `tb_content_charge` WRITE;
/*!40000 ALTER TABLE `tb_content_charge` DISABLE KEYS */;
INSERT INTO `tb_content_charge` VALUES (130,0.01,0.00,0.00,0.00,0.00,NULL,1,0.00,0.00,0);
/*!40000 ALTER TABLE `tb_content_charge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_content_count`
--

DROP TABLE IF EXISTS `tb_content_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_content_count` (
  `content_id` int(11) NOT NULL,
  `views` int(11) NOT NULL DEFAULT '0' COMMENT '总访问数',
  `views_month` int(11) NOT NULL DEFAULT '0' COMMENT '月访问数',
  `views_week` int(11) NOT NULL DEFAULT '0' COMMENT '周访问数',
  `views_day` int(11) NOT NULL DEFAULT '0' COMMENT '日访问数',
  `comments` int(11) NOT NULL DEFAULT '0' COMMENT '总评论数',
  `comments_month` int(11) NOT NULL DEFAULT '0' COMMENT '月评论数',
  `comments_week` smallint(6) NOT NULL DEFAULT '0' COMMENT '周评论数',
  `comments_day` smallint(6) NOT NULL DEFAULT '0' COMMENT '日评论数',
  `downloads` int(11) NOT NULL DEFAULT '0' COMMENT '总下载数',
  `downloads_month` int(11) NOT NULL DEFAULT '0' COMMENT '月下载数',
  `downloads_week` smallint(6) NOT NULL DEFAULT '0' COMMENT '周下载数',
  `downloads_day` smallint(6) NOT NULL DEFAULT '0' COMMENT '日下载数',
  `ups` int(11) NOT NULL DEFAULT '0' COMMENT '总顶数',
  `ups_month` int(11) NOT NULL DEFAULT '0' COMMENT '月顶数',
  `ups_week` smallint(6) NOT NULL DEFAULT '0' COMMENT '周顶数',
  `ups_day` smallint(6) NOT NULL DEFAULT '0' COMMENT '日顶数',
  `downs` int(11) NOT NULL DEFAULT '0' COMMENT '总踩数',
  PRIMARY KEY (`content_id`),
  KEY `index_tb_content_count_views_day` (`views_day`),
  KEY `index_tb_content_count_views_week` (`views_week`),
  KEY `index_tb_content_count_views_month` (`views_month`),
  KEY `index_tb_content_count_views` (`views`),
  KEY `index_tb_content_count_comments_day` (`comments_day`),
  KEY `index_tb_content_count_comments_month` (`comments_month`),
  KEY `index_tb_content_count_comments_week` (`comments_week`),
  KEY `index_tb_content_count_comments` (`comments`),
  KEY `index_tb_content_count_downloads_day` (`downloads_day`),
  KEY `index_tb_content_count_downloads_month` (`downloads_month`),
  KEY `index_tb_content_count_downloads_week` (`downloads_week`),
  KEY `index_tb_content_count_downloads` (`downloads`),
  KEY `index_tb_content_count_ups_day` (`ups_day`),
  KEY `index_tb_content_count_ups_week` (`ups_week`),
  KEY `index_tb_content_count_ups_month` (`ups_month`),
  KEY `index_tb_content_count_ups` (`ups`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容计数表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_content_count`
--

LOCK TABLES `tb_content_count` WRITE;
/*!40000 ALTER TABLE `tb_content_count` DISABLE KEYS */;
INSERT INTO `tb_content_count` VALUES (2,14,13,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0),(7,38,33,17,17,0,0,0,0,0,0,0,0,0,0,0,0,0),(11,21,20,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0),(12,10,10,1,1,0,0,0,0,0,0,0,0,1,1,0,0,0),(13,20,15,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0),(14,58,44,21,21,0,0,0,0,0,0,0,0,14,14,14,14,0),(23,16,16,16,16,0,0,0,0,0,0,0,0,12,12,12,12,0),(27,9,9,1,1,0,0,0,0,0,0,0,0,2,2,2,2,0),(28,9,9,4,4,0,0,0,0,0,0,0,0,2,2,2,2,0),(29,3,3,1,1,0,0,0,0,0,0,0,0,1,1,1,1,0),(30,63,63,54,54,1,1,1,1,0,0,0,0,44,44,44,44,0),(32,5,5,2,2,0,0,0,0,0,0,0,0,2,2,1,1,1),(33,54,54,18,18,0,0,0,0,0,0,0,0,18,18,18,18,0),(36,4,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(37,12,12,2,2,0,0,0,0,0,0,0,0,2,2,1,1,0),(39,34,34,27,27,1,1,1,1,0,0,0,0,17,17,17,17,0),(43,3,3,2,2,0,0,0,0,0,0,0,0,0,0,0,0,0),(44,2,2,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0),(45,19,19,17,17,0,0,0,0,0,0,0,0,0,0,0,0,0),(46,19,19,17,17,0,0,0,0,0,0,0,0,0,0,0,0,0),(47,16,16,16,16,0,0,0,0,0,0,0,0,0,0,0,0,0),(48,3,3,2,2,0,0,0,0,0,0,0,0,0,0,0,0,0),(49,18,18,16,16,0,0,0,0,0,0,0,0,0,0,0,0,0),(50,16,16,16,16,0,0,0,0,0,0,0,0,0,0,0,0,0),(51,17,17,5,5,0,0,0,0,0,0,0,0,0,0,0,0,0),(53,3,3,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0),(55,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(57,4,4,4,4,0,0,0,0,0,0,0,0,0,0,0,0,0),(59,2,2,2,2,0,0,0,0,0,0,0,0,0,0,0,0,0),(61,2,2,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0),(63,2,2,2,2,0,0,0,0,0,0,0,0,0,0,0,0,0),(69,48,48,16,16,0,0,0,0,1,1,1,1,0,0,0,0,0),(71,5,5,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0),(72,6,6,4,4,0,0,0,0,0,0,0,0,0,0,0,0,0),(100,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0),(101,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0),(102,16,16,16,16,0,0,0,0,39,39,1,39,0,0,0,0,0),(103,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0),(104,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0),(105,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0),(106,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0),(107,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0),(108,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0),(109,16,16,16,16,0,0,0,0,21,21,1,21,0,0,0,0,0),(110,4,4,4,4,0,0,0,0,1,1,1,1,0,0,0,0,0),(111,16,16,16,16,0,0,0,0,0,0,0,0,12,12,12,12,0),(112,17,17,17,17,0,0,0,0,0,0,0,0,16,16,16,16,0),(113,29,29,29,29,0,0,0,0,0,0,0,0,13,13,13,13,0),(114,18,18,18,18,0,0,0,0,0,0,0,0,0,0,0,0,0),(115,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0),(116,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0),(117,18,18,18,18,0,0,0,0,0,0,0,0,0,0,0,0,0),(118,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0),(119,2,2,2,2,0,0,0,0,0,0,0,0,0,0,0,0,0),(120,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0),(121,2,2,2,2,0,0,0,0,0,0,0,0,0,0,0,0,0),(122,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0),(123,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0),(124,2,2,2,2,0,0,0,0,0,0,0,0,0,0,0,0,0),(125,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0),(126,2,2,2,2,0,0,0,0,0,0,0,0,0,0,0,0,0),(127,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0),(128,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0),(129,18,18,18,18,0,0,0,0,0,0,0,0,0,0,0,0,0),(130,22,22,22,22,1,1,1,1,0,0,0,0,12,12,12,12,0),(131,17,17,17,17,0,0,0,0,0,0,0,0,15,15,15,15,0),(132,7,7,7,7,2,2,2,2,0,0,0,0,1,1,1,1,0),(140,18,18,18,18,0,0,0,0,0,0,0,0,0,0,0,0,0),(141,2,2,2,2,0,0,0,0,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `tb_content_count` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_content_ext`
--

DROP TABLE IF EXISTS `tb_content_ext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_content_ext` (
  `content_id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL COMMENT '标题',
  `short_title` varchar(150) DEFAULT NULL COMMENT '简短标题',
  `author` varchar(100) DEFAULT NULL COMMENT '作者',
  `origin` varchar(100) DEFAULT NULL COMMENT '来源',
  `origin_url` varchar(255) DEFAULT NULL COMMENT '来源链接',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `release_date` datetime NOT NULL COMMENT '发布日期',
  `media_path` varchar(255) DEFAULT NULL COMMENT '媒体路径',
  `media_type` varchar(20) DEFAULT NULL COMMENT '媒体类型',
  `title_color` varchar(10) DEFAULT NULL COMMENT '标题颜色',
  `is_bold` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否加粗',
  `title_img` varchar(100) DEFAULT NULL COMMENT '标题图片',
  `content_img` varchar(100) DEFAULT NULL COMMENT '内容图片',
  `type_img` varchar(100) DEFAULT NULL COMMENT '类型图片',
  `link` varchar(255) DEFAULT NULL COMMENT '外部链接',
  `tpl_content` varchar(100) DEFAULT NULL COMMENT '指定模板',
  `need_regenerate` tinyint(1) NOT NULL DEFAULT '1' COMMENT '需要重新生成静态页',
  `tpl_mobile_content` varchar(100) DEFAULT NULL COMMENT '手机内容页模板',
  `toplevel_date` datetime DEFAULT NULL COMMENT '固顶到期日期',
  `pigeonhole_date` datetime DEFAULT NULL COMMENT '归档日期',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容扩展表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_content_ext`
--

LOCK TABLES `tb_content_ext` WRITE;
/*!40000 ALTER TABLE `tb_content_ext` DISABLE KEYS */;
INSERT INTO `tb_content_ext` VALUES (2,'法国尼斯发生汽车冲撞事故 已致75人死上百人伤',NULL,NULL,NULL,NULL,NULL,'2016-07-15 14:47:24',NULL,NULL,NULL,0,NULL,NULL,'/u/cms/www/201607/15154249ucra.jpg',NULL,NULL,1,NULL,NULL,NULL),(7,'震撼的视角！2016年度无人机摄影大赛佳作大赏',NULL,NULL,NULL,NULL,NULL,'2016-07-15 15:33:26',NULL,NULL,NULL,0,NULL,NULL,'/u/cms/www/201607/151530033koq.jpg',NULL,NULL,1,NULL,NULL,NULL),(11,'全国28省遭灾 已投入抗洪抢险777万人次','全国28省遭灾 已投入抗洪抢险777万人次',NULL,NULL,NULL,'据初步统计，截至7月13日，长江中下游湖北、湖南、江西、安徽、江苏等5省堤防巡查防守和抢险共投入62.2万人(含部队3.08万人)，6月30日以来已累计投入抗洪抢险777万人次。','2016-07-15 16:23:32',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,1,'',NULL,NULL),(12,'习近平就法国尼斯恐袭事件向法总统致慰问电',NULL,NULL,NULL,NULL,'当地时间2016年7月14日，法国国庆日，据法国媒体报道，法国尼斯一辆货车突然冲击人群发动恐怖袭击，据最新消息称，有84人丧生，目前事故原因仍在进一步调查之中。','2016-07-15 17:22:47',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,1,'',NULL,NULL),(13,'中国空军航空兵赴南海常态化战斗巡航',NULL,NULL,NULL,NULL,NULL,'2016-07-19 14:12:48',NULL,NULL,NULL,0,NULL,NULL,'/u/cms/www/201607/19141129f6g4.jpg',NULL,NULL,1,NULL,NULL,NULL),(14,'习近平宁夏考察第一天：长征永远在路上',NULL,NULL,NULL,NULL,'习近平考察宁夏首站到固原，冒雨向红军长征会师纪念碑敬献花篮。','2016-07-19 14:26:30',NULL,NULL,NULL,0,NULL,NULL,'/u/cms/www/201607/19142033fu5h.jpg',NULL,NULL,0,'',NULL,NULL),(23,'“十一”黄金周凯里地区文化旅游活动精彩纷呈',NULL,NULL,'黔东南新闻网','http://qdnrbs.cn/htmls/shzh/20160913/137451.html',NULL,'2016-09-13 17:16:04',NULL,'CK',NULL,0,NULL,NULL,NULL,NULL,NULL,1,'',NULL,NULL),(27,'“一带一路”：习近平打开的“筑梦空间”',NULL,NULL,NULL,NULL,'【学习进行时】在不久前举行的推进“一带一路”建设工作座谈会上，习近平要求：“以钉钉子精神抓下去，一步一步把‘一带一路’建设推向前进，让‘一带一路’建设造福沿线各国人民。”','2016-09-22 16:30:13',NULL,'CK',NULL,0,NULL,NULL,'/u/cms/www/201609/23150119m7z0.jpg',NULL,NULL,1,'',NULL,NULL),(28,'加拿大同意与中国协商引渡条约 转变抵制态度',NULL,NULL,NULL,NULL,'该项目声明，“中国专家将被邀请协助核查不被允许从中国内地来加拿大的人员的身份，”以便将他们遣返回国。','2016-09-22 16:56:46',NULL,'CK',NULL,0,NULL,NULL,'/u/cms/www/201609/22165418ezkw.jpg',NULL,NULL,1,'',NULL,NULL),(29,'深圳二手房卖主悔约不服判决 纠集60余人冲击法院',NULL,NULL,NULL,NULL,'新华社深圳9月22日专电（记者孙飞）记者22日从深圳市公安局福田分局获悉，深圳数名二手房卖主，因房价上涨不愿履行协议与买家发生纠纷，并对深圳市中院相关判决不满，聚集60余人前往深圳市中院闹访。','2016-09-23 09:07:33',NULL,'CK',NULL,0,NULL,NULL,NULL,NULL,NULL,1,'',NULL,NULL),(30,'不实名手机号停机在即 移动：不对任何社会渠道授权网络售卡',NULL,NULL,NULL,NULL,'中新网北京9月23日电 (吴涛)中新网从三大运营商处获悉，此前传北京地区未实名手机用户10月15日将被停机，实际是分批执行，10月15日开始，最晚至10月31日截止。','2016-09-23 09:09:41',NULL,'CK',NULL,0,NULL,NULL,NULL,NULL,NULL,1,'',NULL,NULL),(32,'台北故宫将拆除成龙所捐12兽首复制品 成龙回应',NULL,NULL,NULL,NULL,'成龙捐给台北故宫(微博)南院的12生肖兽首，面临斩首命运。','2016-09-23 09:19:38',NULL,'CK',NULL,0,NULL,NULL,'/u/cms/www/201609/23091850z61y.jpg',NULL,NULL,1,'',NULL,NULL),(33,'亚马逊股价首破800美元大关 市值稳居全球上市公司第四',NULL,NULL,NULL,NULL,'亚马逊的股价在纽约当地时间周四上午首次突破每股800美元大关。亚马逊以3860亿美元的市值稳居全球上市公司第四的位置，仅次于苹果、谷歌(微博)母公司Alphabet和微软','2016-09-23 09:23:39',NULL,'CK',NULL,0,NULL,NULL,'/u/cms/www/201609/23092240hxg8.jpg',NULL,NULL,1,'',NULL,NULL),(36,'海银系接盘匹凸匹谜局待解：P2P业务惨淡收场 多次被调查',NULL,NULL,NULL,NULL,'9月20日，匹凸匹投资者索赔案开庭，有十多位投资者向匹凸匹发起索赔。今年3月，匹凸匹公告，因未及时披露多项对外重大担保、重大诉讼事项及2013年年报中未披露对外重大事项，证监会对匹凸匹处40万元罚款，对鲜言处30万元罚款。前述投资者认为因虚假陈述行为而受到损失。','2016-09-23 09:40:21',NULL,'CK',NULL,0,NULL,NULL,'/u/cms/www/201609/23093922giys.jpg',NULL,NULL,1,'',NULL,NULL),(37,'苹果研发神秘新设备：体积类似Apple TV 支持NFC蓝牙',NULL,NULL,NULL,NULL,'近日，美国联邦通信委员会意外曝光了苹果正在研发的一款新设备，其体积类似于苹果机顶盒（Apple TV），具体的用途尚不得而知。','2016-09-23 09:43:34',NULL,'CK',NULL,0,NULL,NULL,'/u/cms/www/201609/230942139uh5.jpg',NULL,NULL,1,'',NULL,NULL),(39,'四川理塘县发生4.9级地震 震源深度19千米',NULL,NULL,NULL,NULL,'中国地震台网正式测定：09月23日00时47分在四川甘孜州理塘县（北纬30.09度，东经99.64度）发生4.9级地震，震源深度19千米。','2016-09-23 09:54:17',NULL,'CK',NULL,0,NULL,NULL,'/u/cms/www/201609/23095358y6s6.jpg',NULL,NULL,1,'',NULL,NULL),(43,'web前端开发人员',NULL,NULL,NULL,NULL,NULL,'2016-09-26 09:33:15',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,1,'',NULL,NULL),(44,'asp.net开发工程师',NULL,NULL,NULL,NULL,NULL,'2016-09-26 09:34:35',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,1,'',NULL,NULL),(45,'文案编辑',NULL,NULL,NULL,NULL,NULL,'2016-09-26 09:38:39',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,1,'',NULL,NULL),(46,'项目经理',NULL,NULL,NULL,NULL,NULL,'2016-09-26 09:45:02',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,1,'',NULL,NULL),(47,'3k计算机实习生双休',NULL,NULL,NULL,NULL,NULL,'2016-09-26 09:47:54',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,1,'',NULL,NULL),(48,'急聘Android开发',NULL,NULL,NULL,NULL,NULL,'2016-09-26 09:50:04',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,1,'',NULL,NULL),(49,'IT公司招软件工程师助理',NULL,NULL,NULL,NULL,NULL,'2016-09-26 09:51:13',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,1,'',NULL,NULL),(50,'聘网页前端设计3K双休',NULL,NULL,NULL,NULL,NULL,'2016-09-26 09:54:56',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,1,'',NULL,NULL),(51,'诚聘微信推广专员',NULL,NULL,NULL,NULL,NULL,'2016-09-26 09:56:01',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,1,'',NULL,NULL),(53,'北京天安门广场“祝福祖国”大花篮吊装完毕',NULL,NULL,NULL,NULL,NULL,'2016-09-26 10:19:13','/u/cms/www/201610/08150638q3zr.mp4','CK',NULL,0,NULL,NULL,'/u/cms/www/201609/26101908i5ds.jpg',NULL,NULL,1,NULL,NULL,NULL),(55,'墨西哥一油轮失火',NULL,NULL,NULL,NULL,NULL,'2016-09-26 10:20:11','/u/cms/www/201610/08150638q3zr.mp4','CK',NULL,0,NULL,NULL,'/u/cms/www/201609/26102008qcao.jpg',NULL,NULL,1,NULL,NULL,NULL),(57,'本网记者体验360行之【183】另类“复制”',NULL,NULL,NULL,NULL,NULL,'2016-09-26 10:21:19','/u/cms/www/201610/08150638q3zr.mp4','CK',NULL,0,NULL,NULL,'/u/cms/www/201609/26102115joze.jpg',NULL,NULL,1,NULL,NULL,NULL),(59,'旅比大熊猫宝宝取名“天宝”',NULL,NULL,NULL,NULL,NULL,'2016-09-26 10:22:24','/u/cms/www/201610/08150638q3zr.mp4','CK',NULL,0,NULL,NULL,'/u/cms/www/201609/261022192w54.jpg',NULL,NULL,1,NULL,NULL,NULL),(61,'莫斯科举办国际灯光节',NULL,NULL,NULL,NULL,NULL,'2016-09-26 10:29:06','/u/cms/www/201610/08150638q3zr.mp4','CK',NULL,0,NULL,NULL,'/u/cms/www/201609/26102904f2l8.jpg',NULL,NULL,1,NULL,NULL,NULL),(63,'宇航员拍摄地球夜景：灯火辉煌灿烂 海水平滑如镜',NULL,NULL,NULL,NULL,NULL,'2016-09-26 10:30:05','/u/cms/www/201610/08150638q3zr.mp4','CK',NULL,0,NULL,NULL,'/u/cms/www/201609/26103003hrib.jpg',NULL,NULL,1,NULL,NULL,NULL),(69,'腾讯QQ',NULL,NULL,NULL,NULL,NULL,'2016-09-26 16:37:28',NULL,NULL,NULL,0,'/u/cms/www/201609/26164039i3uv.jpg','/u/cms/www/201609/261640457r2n.jpg',NULL,NULL,NULL,1,'',NULL,NULL),(71,'百度云管家',NULL,NULL,NULL,NULL,'百度公司推出的一款云服务产品。支持便捷地查看、上传、下载百度云端各类数据。通过百度云管家存入的文件，不会占用本地空间。上传、下载文件过程更稳定。','2016-09-27 09:47:27',NULL,NULL,NULL,0,'/u/cms/www/201609/27095816s3y8.jpg','/u/cms/www/201609/270958122ljv.jpg',NULL,NULL,NULL,1,'',NULL,NULL),(72,'360杀毒 5.0.0.7092 官方正式版','360杀毒',NULL,NULL,NULL,'专业防护，专心为您。\r\n增强敲诈者病毒查杀，最新木马一网打尽;\r\n优化白名单机制，减少打扰;\r\n完善文件实时防护用户体验。','2016-09-27 10:18:46',NULL,NULL,NULL,0,'/u/cms/www/201609/27101524dxj7.jpg','/u/cms/www/201609/27101514u0i9.jpg','/u/cms/www/201609/27101510bh0o.jpg',NULL,NULL,1,'',NULL,NULL),(100,'诺亚传说','诺亚传说',NULL,NULL,NULL,'《诺亚传说》是尚游游戏自主研发的大型角色扮演网游，新资料片《诺亚传说前传-亚特兰蒂斯》火爆发布。','2016-10-10 11:09:06',NULL,NULL,NULL,0,'/u/cms/www/201610/10110634gxcz.jpg','/u/cms/www/201610/10110628vfwz.jpg','/u/cms/www/201610/10110654vib6.jpg',NULL,NULL,1,'',NULL,NULL),(101,'迅雷9',NULL,NULL,NULL,NULL,'迅雷9是“深圳市迅雷网络技术有限公司”于2016年推出的“迅雷”系列下载软件的最新换代产品。迅雷9采用全新下载引擎，对百兆光纤宽带网络环境进行诸多针对性的优化，让用户获得更卓越的下载体验；全新的界面功能布局，承载了更丰富的内容，打造找、下、用的一站式娱乐消费平台。','2016-10-10 11:16:31',NULL,NULL,NULL,0,'/u/cms/www/201610/10111618rhdk.jpg','/u/cms/www/201610/10111549rupn.jpg','/u/cms/www/201610/101116034e14.jpg',NULL,NULL,1,'',NULL,NULL),(102,'360安全卫士',NULL,NULL,NULL,NULL,NULL,'2016-10-10 11:19:18',NULL,NULL,NULL,0,'/u/cms/www/201610/101119092w8r.jpg','/u/cms/www/201610/101119026ukx.jpg',NULL,NULL,NULL,1,'',NULL,NULL),(103,'搜狗输入法',NULL,NULL,NULL,NULL,NULL,'2016-10-10 11:21:37',NULL,NULL,NULL,0,'/u/cms/www/201610/101120330mpz.jpg','/u/cms/www/201610/10112023kqfp.jpg',NULL,NULL,NULL,1,'',NULL,NULL),(104,'YY语音',NULL,NULL,NULL,NULL,NULL,'2016-10-10 11:27:17',NULL,NULL,NULL,0,'/u/cms/www/201610/10112706jiii.jpg','/u/cms/www/201610/10112657zklb.jpg',NULL,NULL,NULL,1,'',NULL,NULL),(105,'阿里旺旺',NULL,NULL,NULL,NULL,NULL,'2016-10-10 11:28:52',NULL,NULL,NULL,0,'/u/cms/www/201610/10112845wryq.jpg','/u/cms/www/201610/10112839cvwx.jpg',NULL,NULL,NULL,1,'',NULL,NULL),(106,'爱奇艺视频',NULL,NULL,NULL,NULL,NULL,'2016-10-10 11:30:54',NULL,NULL,NULL,0,'/u/cms/www/201610/101130399dbt.jpg','/u/cms/www/201610/10113032zu0k.jpg',NULL,NULL,NULL,1,'',NULL,NULL),(107,'谷歌浏览器',NULL,NULL,NULL,NULL,NULL,'2016-10-10 11:32:35',NULL,NULL,NULL,0,'/u/cms/www/201610/10113226knhj.jpg','/u/cms/www/201610/10113218ya2p.jpg',NULL,NULL,NULL,1,'',NULL,NULL),(108,'360浏览器',NULL,NULL,NULL,NULL,NULL,'2016-10-10 11:34:05',NULL,NULL,NULL,0,'/u/cms/www/201610/10113400utfn.jpg','/u/cms/www/201610/10113354g71e.jpg',NULL,NULL,NULL,1,'',NULL,NULL),(109,'PPTV聚力',NULL,NULL,NULL,NULL,NULL,'2016-10-10 11:35:26',NULL,NULL,NULL,0,'/u/cms/www/201610/1011351336l0.jpg','/u/cms/www/201610/10113506jz07.jpg',NULL,NULL,NULL,1,'',NULL,NULL),(110,'腾讯视频',NULL,NULL,NULL,NULL,NULL,'2016-10-10 11:36:32',NULL,NULL,NULL,0,'/u/cms/www/201610/101135560ne4.jpg','/u/cms/www/201610/10113551yru8.jpg',NULL,NULL,NULL,1,'',NULL,NULL),(111,'专访百度科学家徐伟：百度比谷歌的人工智能平台更易上手',NULL,NULL,NULL,NULL,'“开发者在使用时，学习成本较低，这是我们平台易用性的体现。”负责搭建百度深度学习平台PaddlePaddle的百度美国研究院科学家徐伟22日在接受腾讯科技专访时表示。','2016-10-10 11:45:47',NULL,'CK',NULL,0,NULL,NULL,'/u/cms/www/201610/10114452yjhh.jpg',NULL,NULL,1,'',NULL,NULL),(112,'电信诈骗多发产生“蝴蝶效应”虚拟运营商融资受波及',NULL,NULL,NULL,NULL,'自2013年12月首批企业获牌以来，虚拟运营商发展迅速，目前已有42家企业获得牌照。9月22日，在“ICT中国· 2016高层论坛”移动转售分论坛上，中国通信企业协会披露，目前移动转售业务用户数已超3500万，占全国移动用户人数2.67%。','2016-10-10 11:48:08',NULL,'CK',NULL,0,NULL,NULL,'/u/cms/www/201610/10114704dsba.jpg',NULL,NULL,1,'',NULL,NULL),(113,'李克强联合国承诺援助难民：这是责任和道义的担当',NULL,NULL,NULL,NULL,'李克强总理首赴联合国，首场活动便是出席由联合国倡议举行的联大解决难移民大规模流动问题高级别会议。','2016-10-10 11:50:03',NULL,'CK',NULL,0,NULL,NULL,NULL,NULL,NULL,1,'',NULL,NULL),(114,'科学家研制“隐身潜水服” 跟鲨鱼同游也不怕被发现',NULL,NULL,NULL,NULL,NULL,'2016-10-10 13:11:12',NULL,NULL,NULL,0,NULL,NULL,'/u/cms/www/201610/101308178wzr.jpg',NULL,NULL,1,NULL,NULL,NULL),(115,'四川石渠发现至少30万公顷珍贵泥炭湿地资源',NULL,NULL,NULL,NULL,NULL,'2016-10-10 13:15:37',NULL,NULL,NULL,0,NULL,NULL,'/u/cms/www/201610/101314450fs1.jpg',NULL,NULL,1,NULL,NULL,NULL),(116,'全世界最孤独的咖啡馆：海拔4860米 达古冰川之巅',NULL,NULL,NULL,NULL,NULL,'2016-10-10 13:19:22',NULL,NULL,NULL,0,NULL,NULL,'/u/cms/www/201610/10131742wzhv.jpg',NULL,NULL,1,NULL,NULL,NULL),(117,'中俄“合作－2016”联合反恐训练圆满结束',NULL,NULL,NULL,NULL,NULL,'2016-10-10 13:22:07',NULL,NULL,NULL,0,NULL,NULL,'/u/cms/www/201610/101320442qbi.jpg',NULL,NULL,1,NULL,NULL,NULL),(118,'探访燕城监狱：蔬菜自己种 午餐两菜一汤',NULL,NULL,NULL,NULL,NULL,'2016-10-10 13:23:50',NULL,NULL,NULL,0,NULL,NULL,'/u/cms/www/201610/10132253w0rj.jpg',NULL,NULL,1,NULL,NULL,NULL),(119,'摄影师拍摄巨鳄破水而出吞食猎物 上演一箭双雕',NULL,NULL,NULL,NULL,NULL,'2016-10-10 13:26:38',NULL,NULL,NULL,0,NULL,NULL,'/u/cms/www/201610/101326014zdc.jpg',NULL,NULL,1,NULL,NULL,NULL),(120,'宛如置身黑客帝国 “啤酒丛林”惊艳青岛海滨夜空',NULL,NULL,NULL,NULL,NULL,'2016-10-10 13:35:17',NULL,NULL,NULL,0,NULL,NULL,'/u/cms/www/201610/10133449hwwr.jpg',NULL,NULL,1,NULL,NULL,NULL),(121,'《半妖倾城》爱与恨，追与逃，人与妖再一次掀起一段的惊人的倾城传奇',NULL,NULL,NULL,NULL,'清末，八国联军攻入北京，聂如风带着妻子应蝶和二个女儿躲避追杀，应蝶策马将如风和女儿赶走，独自迎敌，应蝶突然长出雪白的翅膀飞了起来——原来她竟然是妖.','2016-10-10 13:38:11','/u/cms/www/201610/101338015yhf.mp4','CK',NULL,0,'/u/cms/www/201610/10133842aiyf.png',NULL,'/u/cms/www/201610/10133710to3f.jpg',NULL,NULL,1,NULL,NULL,NULL),(122,'《那年青春我们正好》刘诗诗、种丹妮演绎闺蜜',NULL,NULL,NULL,NULL,'《那年青春我们正好》在浙江卫视、东方卫视热播。种丹妮饰演的韩露“花痴”肖小军（郑恺），与闺蜜刘婷（刘诗诗）同爱一人而“掰面”。','2016-10-10 13:40:05','/u/cms/www/201610/101338015yhf.mp4','CK',NULL,0,'/u/cms/www/201610/101340004te2.png',NULL,'/u/cms/www/201610/10133954jfoc.jpg',NULL,NULL,1,NULL,NULL,NULL),(123,'《奔跑吧兄弟》收官对决一触即发 邓超被岳云鹏压垮惨叫',NULL,NULL,NULL,NULL,'跑男搭档助阵勇士,力争宇宙最强者称号,究竟“跑男团们都有着怎样神奇的能力？最终谁又将在“助力勇士”的帮助下赢得本季“宇宙最强者”的称号呢？','2016-10-10 13:41:03','/u/cms/www/201610/101338015yhf.mp4','CK',NULL,0,'/u/cms/www/201610/101340393eav.png',NULL,'/u/cms/www/201610/10134048htcl.jpg',NULL,NULL,1,NULL,NULL,NULL),(124,'李克强出席加拿大总理家宴 小小特鲁多表演后空翻',NULL,NULL,NULL,NULL,NULL,'2016-10-10 13:42:48','/u/cms/www/201610/101338015yhf.mp4','CK',NULL,0,NULL,NULL,'/u/cms/www/201610/10134238qppo.jpg',NULL,NULL,1,NULL,NULL,NULL),(125,'习主席和中央军委领导推进军队战斗力建设纪实',NULL,NULL,NULL,NULL,NULL,'2016-10-10 13:44:47','/u/cms/www/201610/101338015yhf.mp4','CK',NULL,0,NULL,NULL,'/u/cms/www/201610/10134440wmng.jpg',NULL,NULL,1,NULL,NULL,NULL),(126,'西北第一村白哈巴的早秋',NULL,NULL,NULL,NULL,NULL,'2016-10-10 13:46:01','/u/cms/www/201610/101338015yhf.mp4','CK',NULL,0,NULL,NULL,'/u/cms/www/201610/101345564pok.jpg',NULL,NULL,1,NULL,NULL,NULL),(127,'美国金秋不止红叶',NULL,NULL,NULL,NULL,NULL,'2016-10-10 13:46:26','/u/cms/www/201610/101338015yhf.mp4','CK',NULL,0,NULL,NULL,'/u/cms/www/201610/101346227ayf.jpg',NULL,NULL,1,NULL,NULL,NULL),(128,'德国举行南瓜称重比赛 763公斤南瓜获得加冕',NULL,NULL,NULL,NULL,NULL,'2016-10-10 13:46:52','/u/cms/www/201610/101338015yhf.mp4','CK',NULL,0,NULL,NULL,'/u/cms/www/201610/101346473kic.jpg',NULL,NULL,1,NULL,NULL,NULL),(129,'北京特战队员魔鬼周训练 挑战50项最严苛极限项目',NULL,NULL,NULL,NULL,NULL,'2016-10-10 13:47:24','/u/cms/www/201610/101338015yhf.mp4','CK',NULL,0,NULL,NULL,'/u/cms/www/201610/10134720z8a5.jpg',NULL,NULL,1,NULL,NULL,NULL),(130,'党中央推进民族工作创新发展纪实',NULL,NULL,NULL,NULL,'奏响新形势下民族工作新乐章（治国理政新思想新实践）党的十八大以来以习近平同志为总书记的党中央推进民族工作创新发展纪实。','2016-10-10 13:51:07',NULL,'CK',NULL,0,NULL,NULL,NULL,NULL,NULL,1,'',NULL,NULL),(131,'楼市调控应跳出周期性怪圈',NULL,NULL,NULL,NULL,'每一轮调控政策都是为稳定住房价格，但调控过后，总有一轮快速上涨行情，越让普通百姓感叹房子越来越买不起了。显然，目前楼市调控实质已陷入越调越高和政府“助涨”的尴尬局面。','2016-10-10 13:54:05',NULL,'CK',NULL,0,NULL,NULL,NULL,NULL,NULL,1,'',NULL,NULL),(132,'黄金接连下跌难道又等大妈来托盘',NULL,NULL,NULL,NULL,'三年前，中国大妈们抢购黄金的记忆还历历在目，没想到如今的黄金又开始了一轮又一轮的下跌。','2016-10-10 13:55:46',NULL,'CK',NULL,0,NULL,NULL,NULL,NULL,NULL,1,'',NULL,NULL),(140,'安卓游戏开发5险1金',NULL,NULL,NULL,NULL,NULL,'2016-10-10 14:27:44',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,1,'',NULL,NULL),(141,'乌兰布统牧歌秋韵',NULL,NULL,NULL,NULL,NULL,'2016-10-11 09:44:23',NULL,NULL,NULL,0,NULL,NULL,'/u/cms/www/201610/11093237z5e8.jpg',NULL,NULL,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tb_content_ext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_content_picture`
--

DROP TABLE IF EXISTS `tb_content_picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_content_picture` (
  `content_id` int(11) NOT NULL,
  `priority` int(11) NOT NULL COMMENT '排列顺序',
  `img_path` varchar(100) NOT NULL COMMENT '图片地址',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`content_id`,`priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容图片表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_content_picture`
--

LOCK TABLES `tb_content_picture` WRITE;
/*!40000 ALTER TABLE `tb_content_picture` DISABLE KEYS */;
INSERT INTO `tb_content_picture` VALUES (7,0,'/assets/images/15153012bpfd.jpg','旅行类冠军：浓雾中的意大利阿西西圣弗兰西斯大教堂。摄影：Francesco Cattuto'),(7,1,'/assets/images/15153034m1rr.jpg','旅行类亚军：澳大利亚凯布尔海滩上的一队骆驼。摄影：Todd Kennedy'),(7,2,'/assets/images/15153052j190.jpg','旅行类季军：大加纳利岛上色彩斑斓的Playa de Amadores海滩。 摄影：Karolis Janulis'),(7,3,'/assets/images/15153110yn2c.jpg','自然与野生动物类冠军：丹麦Kalbyris森林。摄影：Michael Bernholdt'),(7,4,'/assets/images/15153127qs41.jpg','自然与野生动物类亚军：罗马尼亚Marpod公路旁的一大群羊。摄影：Szabolcs Ignacz'),(7,5,'/assets/images/15153212rjvo.jpg','自然与野生动物类季军：留尼旺岛富尔奈斯活火山喷发的壮观景象。摄影：Jonathan Payet'),(7,6,'/assets/images/1515325323eh.jpg','体育冒险类冠军：攀登者在美国犹他州莫泊峡谷120米处攀爬。摄影：Max Seigal'),(7,7,'/assets/images/15153307441e.jpg','体育冒险类亚军：在哥伦比亚库库塔举行的游泳比赛。摄影：Juan Pablo Bayona'),(7,8,'/assets/images/15153321t1g3.jpg','体育冒险类季军：在美国阿拉斯加州科尔多瓦沙滩上玩滑板。摄影：Tj Balon'),(13,0,'/assets/images/19141216070j.jpg','7月18日，中国空军新闻发言人申进科大校在北京宣布：中国空军近日组织了航空兵赴南海战斗巡航。这次南海战巡，空军出动轰-6K飞机赴黄岩岛等岛礁附近空域进行了巡航。'),(13,1,'/assets/images/19141242pppk.jpg','申进科介绍，中国空军航空兵此次赴南海例行性战斗巡航，紧贴使命任务和实战准备，轰-6K和歼击机、侦察机、空中加油机等遂行战巡任务，以空中侦察、对抗空战和岛礁巡航为主要样式组织行动，达成了战斗巡航目的。\r\n申进科表示：“根据有效履行空军使命任务的需要，空军航空兵赴南海战斗巡航，将继续常态化进行。”'),(115,0,'/assets/images/10131516fhw7.jpg','四川石渠发现至少30万公顷珍贵泥炭湿地资源'),(115,1,'/assets/images/101315235s7b.jpg','四川石渠发现至少30万公顷珍贵泥炭湿地资源'),(115,2,'/assets/images/101315314qdt.jpg','四川石渠发现至少30万公顷珍贵泥炭湿地资源'),(116,0,'/assets/images/10131759kpti.jpg','/u/cms/www/201610/10131742wzhv.jpg'),(116,1,'/assets/images/10131811udfh.jpg','/u/cms/www/201610/10131742wzhv.jpg'),(117,1,'/assets/images/10132108kvcd.jpg','中俄“合作－2016”联合反恐训练圆满结束'),(117,2,'/assets/images/10132117q0se.jpg','中俄“合作－2016”联合反恐训练圆满结束'),(117,3,'/assets/images/10132128e9mz.jpg','中俄“合作－2016”联合反恐训练圆满结束'),(117,4,'/assets/images/101321427ybi.jpg','中俄“合作－2016”联合反恐训练圆满结束'),(118,0,'/assets/images/10132256evzu.jpg','探访燕城监狱：蔬菜自己种 午餐两菜一汤'),(118,1,'/assets/images/10132301wue2.jpg','探访燕城监狱：蔬菜自己种 午餐两菜一汤'),(118,2,'/assets/images/101323052xt2.jpg','探访燕城监狱：蔬菜自己种 午餐两菜一汤'),(118,3,'/assets/images/10132310d08y.jpg','探访燕城监狱：蔬菜自己种 午餐两菜一汤'),(118,4,'/assets/images/10132315avlw.jpg','探访燕城监狱：蔬菜自己种 午餐两菜一汤'),(118,5,'/assets/images/10132322exj1.jpg','探访燕城监狱：蔬菜自己种 午餐两菜一汤'),(118,6,'/assets/images/10132327lk40.jpg','探访燕城监狱：蔬菜自己种 午餐两菜一汤'),(118,7,'/assets/images/10132336658k.jpg','探访燕城监狱：蔬菜自己种 午餐两菜一汤'),(118,8,'/assets/images/10132342mxeq.jpg','探访燕城监狱：蔬菜自己种 午餐两菜一汤'),(118,9,'/assets/images/10132347qr6a.jpg','探访燕城监狱：蔬菜自己种 午餐两菜一汤'),(119,1,'/assets/images/10132629r00n.jpg','摄影师拍摄巨鳄破水而出吞食猎物 上演一箭双雕'),(119,2,'/assets/images/10132635f63e.jpg','摄影师拍摄巨鳄破水而出吞食猎物 上演一箭双雕'),(120,0,'/assets/images/10133454sydj.jpg','宛如置身黑客帝国 “啤酒丛林”惊艳青岛海滨夜空'),(120,1,'/assets/images/10133506taqx.jpg','宛如置身黑客帝国 “啤酒丛林”惊艳青岛海滨夜空'),(120,2,'/assets/images/10133511s7r1.jpg','宛如置身黑客帝国 “啤酒丛林”惊艳青岛海滨夜空'),(120,3,'/assets/images/101335147ye6.jpg','宛如置身黑客帝国 “啤酒丛林”惊艳青岛海滨夜空'),(141,0,'/assets/images/11094215kqsv.jpg','乌兰布统牧歌秋韵'),(141,1,'/assets/images/11094229szn0.jpg','乌兰布统牧歌秋韵'),(141,2,'/assets/images/11094234lj78.jpg','乌兰布统牧歌秋韵'),(141,3,'/assets/images/11094239ard1.jpg','乌兰布统牧歌秋韵'),(141,4,'/assets/images/11094243v534.jpg','乌兰布统牧歌秋韵'),(141,5,'/assets/images/11094246016h.jpg','乌兰布统牧歌秋韵'),(141,6,'/assets/images/11094250fq4t.jpg','乌兰布统牧歌秋韵'),(141,7,'/assets/images/11094254usxs.jpg','乌兰布统牧歌秋韵'),(141,8,'/assets/images/11094257nm5d.jpg','乌兰布统牧歌秋韵'),(141,9,'/assets/images/11094309iwnb.jpg','乌兰布统牧歌秋韵'),(141,10,'/assets/images/11094419duy6.jpg','乌兰布统牧歌秋韵');
/*!40000 ALTER TABLE `tb_content_picture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_content_topic`
--

DROP TABLE IF EXISTS `tb_content_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_content_topic` (
  `content_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  PRIMARY KEY (`content_id`,`topic_id`),
  KEY `fk_tb_content_topic` (`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS专题内容关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_content_topic`
--

LOCK TABLES `tb_content_topic` WRITE;
/*!40000 ALTER TABLE `tb_content_topic` DISABLE KEYS */;
INSERT INTO `tb_content_topic` VALUES (2,1),(7,1),(11,1),(12,1),(13,1),(14,1),(27,1),(28,1),(32,1),(112,1),(113,1),(114,1),(115,1),(116,1),(117,1),(118,1),(119,1),(120,1),(130,1),(131,1),(132,1),(141,1),(2,2),(7,2),(11,2),(12,2),(13,2),(14,2),(27,2),(28,2),(32,2),(112,2),(113,2),(114,2),(115,2),(116,2),(117,2),(118,2),(119,2),(120,2),(131,2),(132,2),(2,3),(7,3),(11,3),(12,3),(13,3),(14,3),(27,3),(28,3),(32,3),(112,3),(113,3),(114,3),(115,3),(116,3),(117,3),(118,3),(119,3),(120,3),(131,3),(132,3);
/*!40000 ALTER TABLE `tb_content_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_content_txt`
--

DROP TABLE IF EXISTS `tb_content_txt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_content_txt` (
  `content_id` int(11) NOT NULL,
  `txt` longtext COMMENT '文章内容',
  `txt1` longtext COMMENT '扩展内容1',
  `txt2` longtext COMMENT '扩展内容2',
  `txt3` longtext COMMENT '扩展内容3',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容文本表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_content_txt`
--

LOCK TABLES `tb_content_txt` WRITE;
/*!40000 ALTER TABLE `tb_content_txt` DISABLE KEYS */;
INSERT INTO `tb_content_txt` VALUES (11,'<p style=\"text-indent: 2em;\">记者从国家防总、水利部14日召开的新闻发布会上获悉：据初步统计，截至7月13日，长江中下游湖北、湖南、江西、安徽、江苏等5省堤防巡查防守和抢险共投入62.2万人(含部队3.08万人)，6月30日以来已累计投入抗洪抢险777万人次。</p><p><br/></p><p style=\"text-indent: 2em;\">截至7月13日，今年以来全国已有28省(区、市)1508县遭受洪灾，农作物受灾面积5460.66千公顷，受灾人口6074.67万人，因灾死亡237人、失踪93人，倒塌房屋14.72万间，直接经济损失约1469.80亿元。与2000年以来同期均值相比，今年受灾人口、死亡人口、倒塌房屋分别偏少6%、49%、55%，受灾面积、直接经济损失分别偏多26%、213%。</p><p><br/></p><p style=\"text-indent: 2em;\">此外，中央气象台14日继续发布暴雨蓝色预警，未来3天，强降雨将自西向东影响四川盆地、江汉、江淮、江南北部及黄淮南部，上述地区将有大到暴雨，部分地区有大暴雨，局部伴有短时雷雨大风等强对流天气。</p>',NULL,NULL,NULL),(12,'<p style=\"text-indent: 2em;\">央视新闻：【习近平就#法国尼斯袭击事件#向法国总统致慰问电】习近平对这一骇人听闻的野蛮行径表示强烈谴责，向不幸遇难者表示深切的哀悼，向伤者和遇难者家属表示诚挚的慰问。习近平指出，中方坚决反对一切形式的恐怖主义，愿同法方深化反恐合作，共同维护中法两国和世界安全和平。</p>',NULL,NULL,NULL),(14,'<p style=\"text-indent: 2em;\">【习近平考察宁夏首站到固原，冒雨向红军长征会师纪念碑敬献花篮】7月18日，习近平总书记到宁夏回族自治区考察。从北京直飞固原，驱车70多公里到将台堡，向红军长征会师纪念碑敬献花篮并参观三军会师纪念馆。1936年10月，红军三大主力在会宁和将台堡会师，标志二万五千里长征胜利结束。</p><p><br/></p><p style=\"text-align: center\"><img src=\"/u/cms/www/201607/19142227i3ee.jpg\" title=\"16464387039280572236.jpg\"/></p><p><br/></p><p style=\"text-align: center;\">新华社记者鞠鹏、李涛摄</p><p><br/></p><p style=\"text-align: center\"><img src=\"/u/cms/www/201607/1914230968h5.jpg\" title=\"9093755211529617012.jpg\"/></p><p><br/></p><p style=\"text-indent: 2em;\">【习近平：缅怀先烈、不忘初心，走好新的长征路】参观三军会师纪念馆时，习近平说，红军长征创造了中外历史的奇迹。革命理想高于天，不怕牺牲、排除万难去争取胜利，面对形形色色的敌人决一死战、克敌制胜，这些都是长征精神的内涵。我们要继承和弘扬好伟大的长征精神。有了这样的精神，没有什么克服不了的困难。我们完全有信心有决心有恒心实现中华民族伟大复兴的中国梦。</p><p><br/></p><p style=\"text-indent: 2em;\">习近平说，长征永远在路上。这次专程来这里，就是缅怀先烈、不忘初心，走新的长征路。今天是实现“两个一百年”奋斗目标的新长征。我们这一代人要走好我们这一代人的长征路。</p><p><br/></p><p style=\"text-align: center\"><img src=\"/u/cms/www/201607/19142342h33w.jpg\" title=\"13099311371353179840.jpg\"/></p><p><br/></p><p style=\"text-align: center;\">新华社记者鞠鹏、李涛摄</p><p><br/></p><p style=\"text-indent: 2em;\">【习近平：革命传统教育基地不要贪大求洋】习近平说，革命传统和爱国主义教育基地建设一定不要追求高大全，搞得很洋气、很现代化，花很多钱，那就不是革命传统了，革命传统就变味了。可以通过传统教育带动旅游业，但不能失去红色旅游的底色。只有体会到革命年代的艰苦，才能使人们真正受到教育。</p><p><br/></p><p style=\"text-align: center\"><img src=\"/u/cms/www/201607/19142414bvfg.jpg\" title=\"7973019827669232390.jpg\"/></p><p><br/></p><p style=\"text-align: center;\">新华社记者鞠鹏、李涛摄</p><p><br/></p><p><br/></p><p style=\"text-indent: 2em;\">【习近平：我是来看扶贫落实情况的】18日下午，习近平总书记来到泾源县大湾乡杨岭村看望父老乡亲，实地考察精准扶贫情况。总书记察看村容村貌，向当地干部了解村子脱贫情况。走进回族群众马科的家，习近平察看屋内陈设，掀开褥子看炕垒得好不好，问屋顶上铺没铺油毡、会不会漏雨，电视能看多少台。来到厨房，打开灶上的大锅盖，看里面做着什么好吃的。厨房一角有个淋浴的地方，听说安了太阳能热水器，习近平说“挺好”，关心地问家里的小男孩：“你常洗澡吗？”</p><p><br/></p><p style=\"text-indent: 2em;\">墙上张贴着的“建档立卡贫困户精准脱贫信息卡”引起总书记注意。“6口人、劳动力2人，养牛6头，种玉米15亩，牛出栏2头收入7000，劳务输出收入21500，综合收入47000……”习近平逐项察看，一笔一笔算着马科家的收入账。习近平说，信息登记挺细致，关键要抓好落实，我就是来看落实情况的。马科说，我一定努力让今年计划落到口袋里，实现脱贫摘帽的目标。习近平希望马科把孩子教育搞好，学知识、有文化，决不能让他们输在起跑线上。</p><p><br/></p><p style=\"text-align: center\"><img src=\"/u/cms/www/201607/19142446ch8y.jpg\" title=\"2231079109511926610.jpg\"/></p><p><br/></p><p style=\"text-align: center;\">新华社记者鞠鹏、李涛摄</p><p><br/></p><p style=\"text-indent: 2em;\">【习近平：固原的发展脱胎换骨，增强了我们打赢脱贫攻坚战的信心】习近平坐在杨岭村村民马克俊家的炕上，同村干部、党员代表、养牛大户和贫困户代表拉起家常。总书记说，我听你们说说心里话，咱们唠一唠。大家向总书记汇报近几年脱贫攻坚的情况，说党的政策确实确实太好太好了。习近平拉着马克俊的手说，你年纪比我小，是我老弟。看着你和乡亲们的生活越来越好我很高兴。西海固曾经“苦瘠甲天下”。这是我第3次到固原来。我提出再到比较艰苦的农村看一看。通过走访，了解到村里已经解决了饮水问题，住房等生活条件有了明显改善，还开始找到了产业脱贫的路子。全国还有5000万贫困人口，到2020年一定要实现全部脱贫目标。这是我当前最关心的事情。</p><p><br/></p><p style=\"text-align: center\"><img src=\"/u/cms/www/201607/19142513not2.jpg\" title=\"4804757052710294014.jpg\"/></p><p><br/></p><p style=\"text-align: center;\">新华社记者鞠鹏、李涛摄</p><p><br/></p><p style=\"text-indent: 2em;\">【习近平：农村脱贫奔小康，支部很重要】习近平称赞大湾乡杨岭村党支部第一书记兰竹林对村里的情况门儿清，说明工作比较扎实。他说，一个村子建设得好，关键要有一个好党支部。村党支部带领村民脱贫奔小康，只要有规划，有措施，真抓实干，群众拥护，就一定能把工作做好。希望你们把基层党组织和基层政权建设好，团结带领广大群众奔小康。我们还要更上一层楼!</p><p><br/></p><p style=\"text-indent: 2em;\">【总书记为村民算养牛收支账】宁夏固原市大湾乡杨岭村，习近平走进贫困户马克俊家，首先来到小院一角的牛棚。养牛是杨岭村产业脱贫的重要途径，村里的贫困户在政府帮扶下，每家饲养2头安格斯基础母牛、3头育肥牛。习近平询问肉牛出栏育肥、贷款等情况。“过去都是养大黄牛，如今养上了进口牛”，马克俊给总书记详细算起了现在的养牛收支明细账。养牛大户马全龙也来到了小院里，他告诉总书记，自家过去养了5头牛，如今有了10多头，还准备增加到20头。习近平勉励他说：“要发挥好示范带头作用，把好的经验传授给村民。”</p><p><br/></p><p style=\"text-indent: 2em;\">【习近平：防范市场风险，政府要做好信息服务】细雨绵绵，沃野千里。宁夏原州区彭堡镇姚磨村，习近平冒雨视察万亩冷凉蔬菜基地。蔬菜展台前，新鲜采摘的西兰花、紫甘蓝、辣椒、马铃薯等，整齐“列队”。边走边看，习近平问得仔细。“检测标准怎么样？”“一亩地收入多少？”“农活有技术员指导吗？”“喷灌设施一亩地成本多少？”村里的党员干部、种植大户簇拥在总书记身边。习近平和他们聊起土地承包费、务农打工费、入股分红等，询问他们生产中遇到的困难。一位农民说，感觉市场还不大稳定，想更好了解市场需求。习近平表示，防范市场风险，既需要经营个体敏锐把握，也需要政府加强服务，尤其要做好信息服务工作。</p><p><br/></p><p style=\"text-align: center\"><img src=\"/u/cms/www/201607/19142548un62.jpg\" title=\"2176556949782138032.jpg\"/></p><p><br/></p><p style=\"text-align: center;\">新华社记者鞠鹏、李涛摄</p><p><br/></p><p style=\"text-align: center\"><img src=\"/u/cms/www/201607/19142605p9xl.jpg\" title=\"17322238994688503995.jpg\"/></p><p><br/></p><p style=\"text-align: center;\">新华社记者鞠鹏、李涛摄</p><p><br/></p><p><br/></p>',NULL,NULL,NULL),(23,'<p>　　为了贯彻落实贵州省委、省政府关于构建全域旅游、推动旅游“井喷式”增长和黔东南州委、州政府“用好生态文化两个宝贝，打造国内外知名的民族文化旅游目的地”的战略部署，凯里市委、市政府突出建设国际旅游城市、国家园林城市、国家创新型城市的功能定位，以“节庆搭台，旅游唱戏”的超常规举措，着力推动凯里旅游从初级阶段快速向中高级阶段演化。2016年“十一”黄金周推出了文化旅游系列活动。</p><p>　　1、一赛一节</p><p>　　“一赛”即“牛霸天下”2016首届中国•凯里斗牛国际标准赛，“一节”即2016中国•凯里牛崇拜文化艺术节。</p><p>　　活动共分为四个场地：(1)斗牛国际标准赛场：凯里市民族文化活动中心(民族体育场)。(2)牛崇拜文化艺术节第一会场：凯里市民族文化活动中心(民族体育场)场外。(3)牛崇拜文化艺术节第二会场：凯里苗侗风情园。(4)牛崇拜文化艺术节第三会场：凯里民族文化园。举办时间：“牛霸天下”2016首届中国•凯里斗牛国际标准赛10月1日至10月6日，每日下午一点开始。2016中国•凯里牛崇拜文化艺术节10月1日至3日，每天白天和晚上在三个会场均有不同活动。</p><p>　　2、“弘扬民族文化，共筑中国梦”苗族刺绣体验</p><p>　　活动时间：10月1日至10月9日。地点：苗妹非遗博物馆。活动内容：游客现场体验、设计、制作自己心仪的作品。</p><p>　　3、2016“国庆节”南花村约你做客</p><p>　　活动时间：10月1日至10月7日。地点：南花苗寨。活动内容：观原生态山水风光、赏苗族歌舞、学苗族刺绣、饮百年神泉、品苗家米酒、体验传统打糍粑。</p><p>　　4、“李宁红双喜杯”2016中国乒乓球协会会员联赛</p><p>　　活动时间：10月1日至10月7日。地点：凯里学院体育馆。来自全国各地600多名中国乒乓球协会会员参赛，世界乒乓球冠军马琳、国家乒乓球队金牌教练吴敬平亲临凯里为比赛开赛。</p><p>　　5、云谷田园观光康体系列活动</p><p>　　活动时间：10月1日至10月7日。地点：舟溪云谷田园生态农业观光园。活动内容：农业观光采摘和钓鱼比赛等趣味体验活动。</p><p>　　2016“十一”黄金周凯里地区文化旅游系列活动内容丰富，时间长、规模大，亮点多、参与性强，欢迎中外游客和广大市民积极参与体验。</p><p><br/></p>',NULL,NULL,NULL),(27,'<p style=\"text-indent: 2em; text-align: center;\"><img src=\"/u/cms/www/201609/23140225zalw.jpg\" title=\"641-(1).jpg\" alt=\"641-(1).jpg\"/></p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">【学习进行时】在不久前举行的推进“一带一路”建设工作座谈会上，习近平要求：“以钉钉子精神抓下去，一步一步把‘一带一路’建设推向前进，让‘一带一路’建设造福沿线各国人民。”</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">习近平为何如此看重“一带一路”建设？自他发出沿线国家和地区共建“一带一路”倡议三年来，都取得了哪些进展？</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">6月22日，国家主席习近平在塔什干乌兹别克斯坦最高会议立法院发表题为《携手共创丝绸之路新辉煌》的重要演讲。 新华社记者马占成摄</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">2013年9月7日，习近平在出访中亚国家期间，首次提出共建“丝绸之路经济带”。同年10月，他又提出共同建设21世纪“海上丝绸之路”，二者共同构成了“一带一路”重大倡议。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">而今，三年了。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\"><strong>“一带一路”这三年</strong></p><p style=\"text-indent: 2em;\"><strong><br/></strong></p><p style=\"text-indent: 2em;\">三年，筚路蓝缕，春华秋实。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">在“一带一路”倡议提出的当年11月，十八届三中全会通过的《中共中央关于全面深化改革若干重大问题的决定》明确指出：“加快同周边国家和区域基础设施互联互通建设，推进丝绸之路经济带、海上丝绸之路建设，形成全方位开放新格局。”</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">2014年11月的中央财经领导小组第八次会议专门研究了丝绸之路经济带和21世纪海上丝绸之路规划，发起建立亚洲基础设施投资银行和设立丝路基金。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">在博鳌亚洲论坛2015年年会上，习近平呼吁各国积极参与“一带一路”建设。随后，中国政府发布《推动共建丝绸之路经济带和21世纪海上丝绸之路的愿景与行动》，明确了“一带一路”的共建原则、框架思路、合作重点、合作机制等。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">2016年3月，国家“十三五”规划纲要正式发布，“推进‘一带一路’建设”成为其中专门一章。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">2016年8月，习近平在推进“一带一路”建设工作座谈会上，进一步提出8项要求。从统一思想到统筹落实，从金融创新到人文合作，从话语体系建设到安全保障，面面俱到。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">三年，蓝图由草创到一步步展开、一笔笔绘就。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">目前，已有100多个国家和国际组织参与到“一带一路”建设中来，中国同30多个沿线国家签署了共建合作协议、同20多个国家开展了国际产能合作，联合国等国际组织也态度积极，以亚投行、丝路基金为代表的金融合作不断深入，一批有影响力的标志性项目逐步落地。“一带一路”建设从无到有、由点及面，进度和成果超出预期。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">“一带一路”东联亚太经济圈，西接欧洲经济圈，跨越高山深海，正在逐步构建世界上最壮美的经济走廊。</p>',NULL,NULL,NULL),(28,'<p style=\"text-indent: 2em;\">9月21日，上海浦东机场，犯罪嫌疑人刘某被上海警方从马来西亚押送回沪。警方供图</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">骗税3400万，潜逃境外3100多天，辗转日本、马来西亚等地。经过上海警方漫长的追捕，2016年9月21日上午，国际红色通缉令出逃人员刘某被缉捕归案，押送回沪。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">澎湃新闻从上海警方获悉，近期“猎狐”行动捷报频传。8月22日，涉嫌巨额诈骗的国际红通犯罪嫌疑人钱某潜逃17年后被警方从南美国家苏里南劝返；8月31日，利用证券账户开设“老鼠仓”牟利、涉案金额高达1.2亿元的犯罪嫌疑人刘某被警方从美国劝返。至此，今年上海警方已经成功缉捕或劝返境外在逃人员71人。</p>',NULL,NULL,NULL),(29,'<p style=\"text-align: center;\"><img src=\"/u/cms/www/201609/230906198i4y.jpeg\" title=\"qe.jpeg\" alt=\"qe.jpeg\"/></p><p><br/></p><p style=\"text-indent: 2em;\">新华社深圳9月22日专电（记者孙飞）记者22日从深圳市公安局福田分局获悉，深圳数名二手房卖主，因房价上涨不愿履行协议与买家发生纠纷，并对深圳市中院相关判决不满，聚集60余人前往深圳市中院闹访。目前，5人因涉嫌聚众冲击国家机关罪被福田警方依法刑事拘留，并于9月14日由福田区人民检察院批准逮捕。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">深圳福田警方介绍，今年8月22日上午，在马某某（男，31岁，江西吉安人）、郑某某（男，47岁，广东深圳人）等人带领下，60余人拒不接受现场工作人员安检的要求，冲入深圳市中级人民法院一楼东大厅，扰乱深圳市中级人民法院的单位秩序。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">深圳福田警方接报后，组织警力赶到现场。在深圳市公安局统一指挥下，罗湖区、南山区公安分局警力也赶到现场支援处置工作。通过多方合力，62人被带离深圳中院。民警在现场收缴了大量标语横幅及文化衫等物品。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">深圳福田警方通报称，经查，该案系马某某、郑某某等二手房卖主，在签订二手房买卖协议后因房价上涨不愿履行协议引发纠纷，并对深圳市中院的相关判决不满，带领从东莞雁田等地雇佣的40余人前往深圳中院闹访。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">当日，深圳警方对这62人给予行政处罚，其中，56人分别被处以5至15日行政拘留，6人被处以罚款。后经进一步侦查，马某某、郑某某等5人因涉嫌聚众冲击国家机关罪被深圳福田警方依法刑事拘留，并于9月14日由福田区人民检察院批准逮捕。目前，该案尚在进一步侦办中。</p><p><br/></p>',NULL,NULL,NULL),(30,'<p style=\"text-indent: 2em;\">中新网北京9月23日电 (吴涛)中新网从三大运营商处获悉，此前传北京地区未实名手机用户10月15日将被停机，实际是分批执行，10月15日开始，最晚至10月31日截止。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">其实，多地已开始执行不实名就停机政策，中新网(微信公众号：cns2012)对此进行了梳理，大部分地区都是分批执行，如用户在规定时间内未实名，将面临被停机甚至销号的处理。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\"><strong>北京10月底前手机全部实名 否则停机</strong></p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">最近不少手机用户都收到通知，未实名手机用户将被停机。以北京为例，提示短信显示，10月15日起，未实名手机用户将被暂停通信服务。三大运营商相关负责人分别对中新网表示，在北京地区，10月15日起将执行非实名就停机政策，分批执行，最晚至10月底，非实名手机用户全部停机。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">至于其他省份，三大运营商表示，电信运营商省公司可以结合本地实际情况确定执行不实名就停机政策的具体日期。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">中国电信强调，地方分公司提出执行不实名就停机政策的时间节点，不得晚于集团提出的时间节点；中国移动表示，各省通信管理局或当地政府有规定的，优先按当地的规定执行。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">一些地方对手机实名补登记早就出了要求，江苏三家运营商按照省通信管理局要求，于7月22日发布公告称，自11月起暂停未实名手机用户的部分通信服务，12月起，停止仍未实名用户的全部通信服务。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">7月份，山东省公安厅和省通信管理局联合发布通告，自10月起暂停未实名用户的部分通信服务，2017年6月30日前，停止仍未实名用户的全部通信服务。</p>',NULL,NULL,NULL),(32,'<p style=\"text-align: center;\"><img src=\"/u/cms/www/201609/230919031knf.jpg\" title=\"138678572.jpg\" alt=\"138678572.jpg\"/></p><p><br/></p><p style=\"text-indent: 2em;\">成龙捐给台北故宫(微博)南院的12生肖兽首，面临斩首命运。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">中国台湾网9月22日讯 据台湾《联合报》报道，台北故宫院长林正仪今天（22日）表示，9月底将移除影星成龙捐赠台北故宫南院的12生肖兽首。对此，成龙经纪人EMMA傍晚传达成龙的意见表示，当初捐兽首给台北故宫，是因为台北故宫是一个“尊重文明，保护文化”的单位，若台北故宫对于“尊重文明，保护文化”有不同态度，“那我们也尊重”。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">成龙捐赠给台北故宫南院的12生肖兽首复制品，目前放置在台北故宫南院主建筑物外广场。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">EMMA指出，成龙将兽首捐给台北故宫时，想表达的“尊重文明 保护文化”的态度已经完成，“这整件事是一个态度传达的艺术行为”。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">据报道，成龙也曾捐赠一组相同的兽首给新加坡国立亚洲文明博物馆。EMMA指出，成龙捐赠兽首，捐给台北故宫和捐给新加坡国立亚洲文明博物馆，传达的态度是一样的，就是“尊重文明，保护文化”。“我们捐的不是艺术品或工艺品，而是传达一个态度。”捐给台北故宫，是因为它是一个“尊重文明，保护文化”的单位。若台北故宫对于“尊重文明，保护文化”有不同态度，“那我们也尊重”。</p>',NULL,NULL,NULL),(33,'<p style=\"text-align: center;\"><img src=\"/u/cms/www/201609/23092247x1xp.jpg\" title=\"138679618.jpg\" alt=\"138679618.jpg\"/></p><p><br/></p><p style=\"text-indent: 2em;\">亚马逊季度利润连续三个财季创下新纪录。随之而来的是，亚马逊股价也打破了记录。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">亚马逊的股价在纽约当地时间周四上午首次突破每股800美元大关。亚马逊以3860亿美元的市值稳居全球上市公司第四的位置，仅次于苹果、谷歌(微博)母公司Alphabet和微软。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">在过去的仅仅七个月时间里，亚马逊的股价大涨了40%。推动亚马逊股价增长的主要原因是亚马逊云计算业务AWS的增长及其带来的惊人利润。另外，亚马逊数千万Prime会员也贡献颇多，这些会员要比非会员更经常购物，而且购物支出也比非会员要多得多。</p>',NULL,NULL,NULL),(36,'<p style=\"text-align: center;\"><img src=\"/u/cms/www/201609/230939278x02.jpg\" title=\"138679965.jpg\" alt=\"138679965.jpg\"/></p><p><br/></p><p style=\"text-indent: 2em;\">9月20日，匹凸匹投资者索赔案开庭，有十多位投资者向匹凸匹发起索赔。今年3月，匹凸匹公告，因未及时披露多项对外重大担保、重大诉讼事项及2013年年报中未披露对外重大事项，证监会对匹凸匹处40万元罚款，对鲜言处30万元罚款。前述投资者认为因虚假陈述行为而受到损失。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">事实上，这也是匹凸匹原实际控制人鲜言给“海银系”掌门人韩宏伟的遗留问题。去年底，“海银系”以五牛基金为主力从鲜言手中接盘饱受争议的匹凸匹。韩宏伟与韩啸系父子关系。大半年过去，韩氏父子与鲜言的关系也从起初的甜蜜期走到如今对簿公堂。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">对于有着同窗情谊的两者是真翻脸还是另有图谋，投资者更为关心的是，韩氏父子掌控的“海银系”对匹凸匹未来发展有怎样的考虑，是否会注入资产让匹凸匹改头换面，而不是再次陷入“资本漩涡”。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\"><strong>实控人背后关联重重</strong><br/></p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">在资本市场叱咤风云的“海银系”为何要染指匹凸匹。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">近三年来，匹凸匹（原多伦股份）及鲜言在资本市场可谓劣迹斑斑，先后被证监会两次立案调查、两次公开谴责，1次警告、1次罚款，1次行政监管，并多次收到上交所的问询函。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">对于上海一中院开庭审理的十多位投资者诉匹凸匹案，上述投资者的代理律师上海市华荣律师事务所许峰对中国证券报记者表示，通过庭审判断，投资者最终获赔概率较大。其法律依据主要是，去年年底证监会针对匹凸匹未及时披露多项对外重大担保、重大诉讼事项做出了处罚。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">事实上，7月份，中证中小投资者服务中心代理散户起诉匹凸匹，将鲜言及原其他七名高管及匹凸匹公司作为共同被告诉至法院，诉请判令鲜言赔偿经济损失37万余元，其余八被告承担连带赔偿责任。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">有投行人士还对中国证券报记者透露，2014年11月底，鲜言拟将上市公司实际控制权转让给自然人殷群，最终因对方未付款而夭折。在五牛基金入主匹凸匹之前，资本大鳄吴鸣霄也与鲜言谈过买壳，但最终不知为何没有谈拢。值得注意的是，目前颇受关注的ST慧球(13.300, 0.01, 0.08%)第一大自然人股东就是吴鸣霄，而ST慧球被指背后的实际控制人是鲜言。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">上述人士指出，在历经陈隆基、李勇鸿、鲜言的多次进进出出。多伦股份主营业务变更不断，从房地产、金融又回到房产，唯一不变的是业绩不见起色，并一步步走向“空壳”状态。</p>',NULL,NULL,NULL),(37,'<p style=\"text-align: center;\"><img src=\"/u/cms/www/201609/23094218axhy.jpg\" title=\"138679463.jpg\" alt=\"138679463.jpg\"/></p><p><br/></p><p style=\"text-indent: 2em;\">近日，美国联邦通信委员会意外曝光了苹果正在研发的一款新设备，其体积类似于苹果机顶盒（Apple TV），具体的用途尚不得而知。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">据美国科技新闻网站AppleInsider报道，联邦通信委员会的数据库中出现了这款苹果尚未对外宣布的新产品，其螺丝位置和设备外壳的大小，类似于第四代苹果机顶盒。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">苹果一直拥有对外保密的传统，而在这款新设备中，苹果也要求不对外泄漏相关信息，因此媒体无法判断到底作何用途。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">这款设备使用的型号A1844，目前并未被苹果发售的商品使用过。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">据称，该设备的电源参数为5.5V到13.2V,输出电流为100毫安，峰值为700毫安。这些参数有别于苹果最新的机顶盒，其电源参数为12V、920毫安。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">这款设备还具有蓝牙通信和NFC（近场通信）功能，美国联邦通信委员会也对这些通信功能进行了测试，相关的无线电通信功能也是这款设备提交到该机构进行测试的原因。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">这一设备没有进行Wi-Fi通信测试，可能意味着会采用目前某个设备的Wi-Fi通信技术，或者根本就不具备Wi-Fi通信功能。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">此前，外部机构曾经对苹果第四代机顶盒进行过拆解，相关的螺丝位置，和此次对外披露的设备有类似之处。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">近些年，苹果的研发资源集中在了智能手机、平板电脑等领域，传统的机顶盒似乎受到了冷落。去年，在长期不更新之后，苹果推出了全新第四代的机顶盒，苹果推出了专有的机顶盒操作系统，在遥控器中植入了语音操控工具Siri。库克也表示，电视的未来是应用软件。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">苹果也围绕机顶盒构建了一个客厅互联网的生态系统，许多第三方开发商正在为苹果机顶盒开发电视端的应用软件。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em; text-align: center;\"><img src=\"/u/cms/www/201609/230943156ihf.jpg\" title=\"138679317.jpg\" alt=\"138679317.jpg\"/></p><p style=\"text-indent: 2em; text-align: center;\">第四代苹果机顶盒</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">此次披露的设备，是否是未来第五代的苹果机顶盒，仍无法判断。</p>',NULL,NULL,NULL),(39,'<p style=\"text-align: center;\"><img src=\"/u/cms/www/201609/230954058tco.jpg\" title=\"138678243.jpg\" alt=\"138678243.jpg\"/></p><p><br/></p><p style=\"text-indent: 2em;\">中国地震台网正式测定：09月23日00时47分在四川甘孜州理塘县（北纬30.09度，东经99.64度）发生4.9级地震，震源深度19千米。</p>',NULL,NULL,NULL),(43,'<p>工作职责：<br/>1、负责Web前端多终端产品的整体框架设计；<br/>2、引导前沿技术的预研与实施，通用模块的搭建与维护；<br/>3、负责Web前端开发规范与流程的指定；<br/>4、负责团队成员的技术发展方向及成长；<br/>5、与相关业务部门沟通，协调内部资源，管理前端外包团队。<br/><br/>任职资格：<br/>1、计算机科学或相关专毕业，5年以上工作经验；<br/>2、精通JavaScript、Html5、Css3、NodeJS等Web开发技术；<br/>3、关注Web前端前沿技术发展，具有根据项目情况进行技术选型的能力；<br/>4、熟悉W3C标准，对表现与数据分离、Web语义化等有深刻理解；<br/>5、具有软件工程意识，对数据结构和算法设计有充分理解；<br/>6、具有良好的沟通能力和团队合作精神、优秀的分析问题和解决问题的能力；<br/>7、熟悉Linux平台，掌握一种后端开发语言（PHPJavaCC++Python等）。</p>',NULL,NULL,NULL),(44,'<p>基本要求：&nbsp;<br/>1、精通ASP.NET（C#），熟悉三层架构，精通Web　Services开发，良好的面向对象开发经验；&nbsp;<br/>2、精通AJAX技术运用；<br/>3、精通SqlServer，熟练编写存储过程；&nbsp;<br/>4、精通div,css前端布局；&nbsp;<br/>5、必须有一年以上ASP.NET开发经验，有3个以上完整div＋css、asp.net网站制作或系统研发作品。</p>',NULL,NULL,NULL),(45,'<p>岗位职责：</p><p>1、大专及以上学历，新闻采编相关专业毕业；</p><p>2、1年以上工作经历，有较好的文字功底；</p><p>3、认真务实，态度端正。</p><p><br/></p>',NULL,NULL,NULL),(46,'<p>岗位职责：<br/>1、负责电信天网工程项目；<br/>2、负责施工小队工程进度、质量管理<br/>3、负责甲方、监理及相关方协调；<br/><br/>任职资格：<br/>1、专科以上学历，有工程管理经验者优先，熟悉电信流程者优先</p><p>2、良好的理解和表达能力，善于沟通，很好的团队合作意识。<br/></p><p><br/></p>',NULL,NULL,NULL),(47,'<p>1、大专或大专以上应往届毕业生&nbsp;</p><p>2、理工类毕业生，计算机相关专业优先<br/></p><p>3、对软件行业有强烈的兴趣<br/></p><p>4、有良好的执行力，致力于软件行业发展<br/></p><p>5、后期发展从事网页设计，网站美工，网站开发，互联网系统开发等方向</p><p><br/></p>',NULL,NULL,NULL),(48,'<p>岗位职责：<br/>1、负责Android互联网应用的开发及维护；<br/>2、根据项目需要快速学习并掌握新技术；<br/><br/>职位描述：<br/>1、具有扎实的Java基础，熟练掌握J2ME、J2SE等相关技术及代码优化技巧（容量、内存、速度）；<br/>2、熟悉TCP/IP通信机制，对Socket通信和HTTP通信有较深刻的理解和经验，有网络编程经验；<br/>3、熟悉Android操作系统和AndirodSDK,有一年以上Andriod开发经验优先&nbsp;<br/>4、具备良好的沟通能力和优秀的团队协作能力；<br/>5、优秀的文档编写和语言表达能力，良好的中英文阅读水平；<br/>6、诚恳、踏实、谨慎细致，对工作充满热情，优秀的学习能力，具有良好的自律意识和上进心；<br/>7、有嵌入式LinuxC/C++开发经验优先 ；<br/>8、熟悉MS SQL数据库开发。</p>',NULL,NULL,NULL),(49,'<p>岗位条件：<br/>1、年龄18-28周岁；<br/>2、学历大专及以上，理工科专业毕业优先录用；<br/>3、对互联网行业感兴趣（非销售、非保险岗位），懂编程语言优先考虑，但是也可以接收零基础求职者，有项目经理带团队；<br/>4、工作认真、细致、敬业，责任心强；<br/>5、想获得一份有长远发展、稳定、有晋升空间的工作。</p><p><br/>待遇：<br/>1、转正基本薪资3500起，另有项目奖金和提成；<br/>2、五险一金，双休、法定节假日，正常休息；<br/>3、公司工作环境优雅、氛围好，同事关系融洽，生日派对、聚餐等活动丰富；<br/>4、公司注重员工培养，给予晋升机会，管理层主要员工中培养、提拔；</p>',NULL,NULL,NULL),(50,'<p>岗位要求：</p><p>1、喜欢从事计算机设计行业；</p><p>2、想获得一份稳定的工作；</p><p>3、好学、细心，喜欢发现事物当中的不足，责任心强。</p><p><br/></p><p>任职要求：</p><p>1、能够尽快入职、长期稳定工作。</p><p>2、大专及大专以上学历。</p>',NULL,NULL,NULL),(51,'<p>岗位职责：<br/>1.熟悉微信的各项功能应用，擅长企业微信的日常操作以及维护<br/>2.根据企业的受众群体可以养成数据分析能力，善于通过数据分析掌握时间段与顾客互动.更新及维护公司企业微信内容，提高各项关注度，提升转化率。&nbsp;<br/>3.负责企业微信的运营策略、活动、话题的制定及策划方案和活动创意、活动宣传，完成微信营销。&nbsp;<br/>4.挖掘和分析粉丝使用习惯，情感及体验感受，及时掌握新闻热点，与用户进行互动。&nbsp;<br/>5.具有一定的市场分析及判断能力，具有良好的客户服务意识，具有亲和力。&nbsp;<br/>6.跟踪微信推广效果，分析数据并反馈，分享微信推广经验，推动及提高团队的网络推广能力。</p>',NULL,NULL,NULL),(69,'<p>腾讯推出的即时通讯工具。支持在线聊天、视频电话、点对点断点续传文件、共享文件、网络硬盘、自定义面板、QQ邮箱等多种功能。免费的通讯平台，QQ2015年给您带来更多沟通乐趣。</p><p><br/></p><p>开发商：腾讯</p><p><br/></p><p>新版特征</p><p>1.文件共享，便捷分享本地文件；</p><p>2.群组通话管理，有序发言，掌控全场；</p><p>3.团队通讯录，快速查看群成员电话。</p><p><br/></p><p><strong>下载说明</strong></p><p><br/></p><p>1、推荐使用迅雷等下载工具下载本站软件，使用 WinRAR v3.10 以上版本解压本站软件。<br/></p><p>2、如果该软件不能下载，请留言报告错误,谢谢合作。</p><p>3、下载本站资源时，如果遇到服务器忙暂不能下载的情况，请过一段时间重试。</p><p>4、如果您有任何意见或建议，欢迎给我们留言，我们将提供更多 、更好的资源。</p><p>5、本站提供的一些商业软件是供学习研究之用，如用于商业用途，请购买正版。</p><p><strong><br/></strong><br/></p>',NULL,NULL,NULL),(71,'<p>百度公司推出的一款云服务产品。支持便捷地查看、上传、下载百度云端各类数据。通过百度云管家存入的文件，不会占用本地空间。上传、下载文件过程更稳定。</p>',NULL,NULL,NULL),(72,'<p>360杀毒软件下载2016官方下载版是永久免费杀毒软件,360杀毒软件下载免费版开创了杀毒软件免费杀毒的先河.本站提供360杀毒软件下载2016官方下载.360杀毒通过对用户反馈的持续关注与分析，我们进一步改进了针对浏览器不能上网的问题的扫描和自动修复逻辑。您通过快速或是全盘扫描就能够对该类问题进行快速修复!还有大幅优化了开机过程中对CPU和IO的占用，大大减少了对系统开机过程的影响。</p>',NULL,NULL,NULL),(100,'<p>《诺亚传说》是尚游游戏自主研发的大型角色扮演网游，新资料片《诺亚传说前传-亚特兰蒂斯》火爆发布。</p>',NULL,NULL,NULL),(101,'<p>迅雷9是“深圳市迅雷网络技术有限公司”于2016年推出的“迅雷”系列下载软件的最新换代产品。迅雷9采用全新下载引擎，对百兆光纤宽带网络环境进行诸多针对性的优化，让用户获得更卓越的下载体验；全新的界面功能布局，承载了更丰富的内容，打造找、下、用的一站式娱乐消费平台。</p><p>开发商：深圳市迅雷网络技术有限公司</p><p>软件官网：&nbsp;http://xl9.xunlei.com</p><p>新版特征</p><p>1、全新上线资源评论功能，进入资源详情页，参与精彩讨论；<br/>2、新增磁盘缓存设置功能；<br/>3、个性化中心新增“人气”“精品”“超级会员”提示，帮你找到个性化皮肤和头像。</p><p><br/></p>',NULL,NULL,NULL),(102,'<p>软件介绍：<br/>&nbsp; 1.360安全卫士是一款由奇虎360公司推出的功能强、效果好、受用户欢迎的安全杀毒软件<br/>&nbsp; 2.目前4.2亿中国网民中，首选安装360的已超过3亿<br/>&nbsp; 3.拥有查杀木马、清理插件、修复漏洞、电脑体检、电脑救援、保护隐私，电脑专家，清理垃圾，清理痕迹多种功能<br/>&nbsp; 4.独创了&amp;ldquo;木马防火墙&quot;&amp;ldquo;360密盘&amp;rdquo;等功能<br/>&nbsp; 5.依靠抢先侦测和云端鉴别，可全面、智能地拦截各类木马，保护用户的帐号、隐私等重要信息<br/>&nbsp; 6.内含的360软件管家还可帮助用户轻松下载、升级和强力卸载各种应用软件</p>',NULL,NULL,NULL),(103,'<p>搜狗（sougou）拼音输入法是一款Windows平台下的汉字拼音输入法。搜狗拼音输入法是基于搜索引擎技术的、特别适合网民使用的、新一代的输入法产品，用户可以通过互联网备份自己的个性化词库和配置信息。</p><p>开发商：搜狗</p><p>软件官网：&nbsp;http://pinyin.sogou.com/</p><p>新版特征</p><p>升级日志：<br/>1、标点补全：对（）、“”等成对的符号自动补全；<br/>2、图片表情：<br/>a）更新emoji资源和候选位置；<br/>b）支持表情包名搜索；<br/>3、拆分输入：增加更多拆分输入数据；<br/>4、网址直达：增加更多的网址数据；<br/>5、工具箱：更新工具箱图标，界面更美观；<br/>6、解决自定义短语、固定首位等删除之后同步又出现的问题。</p><p><br/></p>',NULL,NULL,NULL),(104,'<p>歪歪语音是广州多玩信息技术有限公司研发的一款基于Internet 团队语音通信平台，功能强大、音质清晰、安全稳定、不占资源、适应游戏玩家的免费语音软件。在网络上通常用YY表示。</p><p>开发商：多玩游戏</p><p>软件官网：&nbsp;http://www.yy.com/index/t/download</p><p>新版特征</p><p>优化了部分内容。</p><p><br/></p>',NULL,NULL,NULL),(105,'<p>阿里旺旺专为淘宝会员量身定做的个人交易沟通软件，方便买家和卖家在交易过程实时进行沟通。可以进行文字聊天、语音聊天、视频聊天、文件传输、发送离线文件等。有了它，用户就算有万水千山阻隔亦可零距离地与卖家交流宝贝细节，尽情“砍价”了！</p><p>开发商：阿里巴巴</p><p>软件官网：&nbsp;http://www.taobao.com/wangwang/</p><p>新版特征</p><p>1. 全新界面，清晰的圆形头像、轻薄的图标设计、界面结构更加简洁；<br/>2. 全新会话面板，汇总各类消息提醒，处理更高效；&nbsp;<br/>3. 皮肤设置升级，新增多款皮肤主题，带给你全新感觉；<br/>4. 拟物化登陆动画，简洁、灵动，一试难忘；<br/>5. 新增”星标好友“分组，方便找到重要联系人；<br/>6. 主面板新增快捷店铺入口，快速访问好友店铺；<br/>7. 消息管理器优化，重新梳理消息类型和菜单项，分类清晰.查找便捷；<br/>8. 旺旺个人资料和名片全新设计，支持设置个性背景图；<br/>9. 软件升级优化，让您第一时间了解新版本的功能；<br/>10. 文件发送完成后自动关闭发送框，在聊天窗口中实时穿透传输结果；<br/>11. 聊天窗口合并优化，同时和多人聊天更方便；<br/>12. 应用平台全新升级，访问更便捷，应用消息更直观。</p><p><br/></p>',NULL,NULL,NULL),(106,'<p>爱奇艺视频桌面版3.0是一款专注视频播放的客户端软件，免费下载安装，观看高清正版影视，可在线享受爱奇艺网站内全部免费高清正版视频、最新影视大片、最独家的综艺、旅游、纪录片，支持全网搜索，是最个性化、时尚化的视频客户端。</p><p>开发商：北京爱奇艺科技有限公司</p><p>软件官网：&nbsp;http://www.iqiyi.com/</p><p>新版特征</p><p>1. 提升系统稳定性。</p><p><br/></p>',NULL,NULL,NULL),(107,'<p>谷歌浏览器稳定版（Chrome）是一个由Google（谷歌）公司开发的开放原始码网页浏览器。该浏览器是基于其他开放原始码软件所撰写，包括WebKit和Mozilla，目标是提升稳定性、速度和安全性，并创造出简单且有效率的使用者界面。</p><p>开发商：谷歌</p><p>软件官网：&nbsp;http://www.google.cn/intl/zh-CN/chrome/browser/desktop/index.html</p><p>新版特征</p><p>1. 修复了部分bug问题。</p><p><br/></p>',NULL,NULL,NULL),(108,'<p>360浏览器是互联网上最好用、最安全的新一代浏览器，和360安全卫士、360杀毒等软件等产品一同成为360安全中心的系列产品。木马已经取代病毒成为当前互联网上最大的威胁，90%的木马用挂马网站通过普通浏览器入侵，每天有200万用户访问挂马网站中毒。360安全浏览器拥有全国最大的恶意网址库，采用恶意网址拦截技术，可自动拦截挂马、欺诈、网银仿冒等恶意网址。独创沙箱技术，在隔离模式即使访问木马也不会感染。除了在安全方面的特性，360安全浏览器在速度、资源占用、防假死不崩溃等基础特性上表现同样优异，在功能方面拥有翻译、截图、鼠标手势、广告过滤等几十种实用功能，在外观上设计典雅精致，是外观设计最好的浏览器，已成为广大网民使用浏览器的第一选择。</p>',NULL,NULL,NULL),(109,'<p>PPTV网络电视是PPLive旗下产品，一款安装量大的P2P网络电视软件，支持对海量高清影视内容的直播+点播功能。可在线观看电影、电视剧、动漫、综艺、体育直播、游戏竞技、财经资讯等丰富视频娱乐节目。P2P传输，越多人看越流畅、完全免费，是广受网友推崇的上网装机必备软件。</p><p>开发商：上海聚力传媒技术有限公司</p><p>软件官网：&nbsp;http://www.pptv.com</p><p>新版特征</p><p>1、直播回看无限制，想看哪里看哪里；<br/>2、调整注册方式，手机注册更方便；<br/>3、程序猿们日夜兼程，保证您观影更流畅</p><p><br/></p>',NULL,NULL,NULL),(110,'<p>腾讯视频播放器是腾讯视频旗下的客户端产品，是一款支持丰富内容的在线点播及电视台直播的软件。它采用了先进的P2P流媒体播放技术，可以确保在大量用户同时观看节目的情况下，节目依然流畅清晰；同时具有很强的防火墙穿透能力，为用户在任何网络环境下收看流畅的视频节目提供了有力保障。</p><p>开发商：腾讯</p><p>软件官网：&nbsp;http://v.qq.com/index.html</p><p>新版特征</p><p>1. 客户端专享1080P蓝光画质，全员免费观看和下载；<br/>2. 鼠标停留在播放进度条上可看到预览画面；<br/>3. 启动时提示上次观看内容；<br/>4. 优化了搜索的体验；<br/>5. 精选频道点击栏目标题可跳转；<br/>6. 优化了VIP会员频道的分类筛选。</p><p><br/></p>',NULL,NULL,NULL),(111,'<p style=\"text-align: center;\"><img src=\"/u/cms/www/201610/10114510l7x1.jpg\" title=\"138683743.jpg\" alt=\"138683743.jpg\"/></p><p><br/></p><p style=\"text-indent: 2em;\">本月初的百度世界大会上，百度正式对外宣布，开源其深度学习平台PaddlePaddle，这也让百度成为国内首家开放深度学习技术平台的科技公司。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">徐伟表示，百度希望通过开放深度学习平台的方式，营造开发者社区，推动人工智能行业的发展。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">据徐伟介绍，该平台最初是百度研发的深度学习内部平台，项目于2013年启动，主要用于支持的百度产品，目前百度有超过30个产品应用到该深度学习平台，包括预测外卖送达时间、图文问答、商家好感度模型等。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">在行业开放的大趋势下，百度决定将这一平台开源，现在所有的从事深度学习开发的开发人员均可以下载安装并使用百度的这一深度学习工具。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">除了百度以外，谷歌(微博)在去年底宣布开放其深度学习平台Tensorflow，此外，业内主流的深度学习平台还包括Facebook的Torch，加州伯克利大学的Caffe等。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">徐伟说，百度的PaddlePaddle平台具备易用、高效、灵活、可伸缩等特点，能够满足多种不同的应用开发需求。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">在接受采访时，徐伟重点强调了该平台的易用性特征，他表示，相比谷歌的Tensorflow来说，开发者在使用PaddlePaddle时更容易上手，尤其是对于序列输入、稀疏输入和大规模数据的模型训练有着良好的支持，支持GPU运算、数据并行和模型并行，仅需少量代码就能训练深度学习模型，大大降低了用户使用深度学习技术的成本。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">徐伟说，让开发者决定使用哪个平台进行开发的决定因素主要包含几个方面，首先是该平台能否实现自己想实现的功能，其次是使用某平台实现起来的难度有多大，最后是效率有多高。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">本月底，PaddlePaddle将迎来开源后的首次重大更新，徐伟介绍称，此次更新主要是进一步完善对不同操作系统的支持、进一步完善说明文档以及解决不同安全环境下的问题等。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">百度开源人工智能技术引起了开发者社区的关注，Facebook深度学习研究员、曾参与谷歌Tensorflow研发的贾扬清评价称，PaddlePaddle有高质量的GPU代码、非常好的RNN（回归神经网络）设计，并且设计很干净，没有太多的抽象表达，这一点比Tensorflow好很多。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">徐伟表示，正式开源后，下一步的目标是进一步完善平台的易用性和性能，并增强与开发者群体的沟通，了解他们的需求。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">在谈到人工智能行业的发展时，他认为，人工智能行业这两年出现爆发式增长，主要在语音识别、图像识别等领域出现了显著的突破。在谈到人工智能未来发展时，他表示乐观，并认为，未来可能的突破点在于自然语言识别、理解和处理以及机器翻译等方面，另外基于人工智能的”人工助手”的智能化程度也有望进一步加强。</p><p><br/></p>',NULL,NULL,NULL),(112,'<p style=\"text-align: center;\"><img src=\"/u/cms/www/201610/10114715p0as.jpg\" title=\"138679801.jpg\" alt=\"138679801.jpg\"/></p><p><br/></p><p style=\"text-indent: 2em;\">自2013年12月首批企业获牌以来，虚拟运营商发展迅速，目前已有42家企业获得牌照。9月22日，在“ICT中国· 2016高层论坛”移动转售分论坛上，中国通信企业协会披露，目前移动转售业务用户数已超3500万，占全国移动用户人数2.67%。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">不过，移动转售行业也因实名制未落实到位出现诸多“乱象”，尤其“170”号段诈骗多发遭诟病，在“徐玉玉受骗致死”案等多个热点事件的舆论声讨中，虚拟运营商声誉受到重大打击，其融资也受到影响。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\"><strong>虚拟运营商“很受伤”</strong></p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">3年前，第一批企业获得牌照进入试点，中国移动(微博)虚拟运营业方缓缓起步，而经过几年的发展，这一行业已小有规模，不过“成长的烦恼”也使其备受困扰。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">中国通信企业协会披露的数据显示，移动转售业的发展速度有所下降。自2015年3月起，移动通信转售业务月净增超过100万户，其中2015年10月起连续6个月净增达到200万，然而自2016年1月以来，增速有所放缓，甚至出现“停滞”。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">增速降低与行业乱象不无关联。女大学生徐玉玉被骗后昏聩致死使得社会的目光投向虚拟运营商，尤其是因为“实名制”再次被推上风口浪尖。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">据央广网2016年8月报道，工信部网络安全管理局对虚拟运营商新入网电话用户实名登记工作暗访，暗访的26家转售企业的109个营销网点中，37个网点存在违规行为，违规占比超三成。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">虚拟运营商“实名制”漏洞也成了舆论谴责的“靶子”。中兴视通显然备受折磨，其CEO邓慕超向与会者“倒苦水”，称自己有时“夜不能寐、梦不能求”。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">巴士在线CEO王献蜀在业内摸爬滚打多年，也叫苦不迭，“170贴了一个标签，就是诈骗，虚商也变成了诈骗公司。”王献蜀表示，这让虚拟运营商要“很受伤”，并呼吁业内外应给予虚拟运营商“容错空间”。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\"><strong>声誉受损融资受波及</strong></p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">中国虚拟运营业起步晚于发达国家，而虚拟运营商们盈利困难早已不是新闻，而今，命途多舛的它们又遇“拦路虎”，这也让资本市场对其发展前景打了个问号，虚拟运营商直接受到冲击。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">王献蜀称，“170”号段的问题影响了虚拟运营的融资。“我们很少听到说哪一家虚商拿了多少融资，然后怎么样，多么风光，虚商这个行业几乎都是每一家虚商，每一个老板，每一个企业真金白银自己从口袋里面往外掏钱。”王献蜀表示，从业几年来，他自己已经投入了1.8亿元。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">蜗牛移动CEO陈艳也深有体会，在她看来，虚拟运营商还是个“婴儿”，她表示，英国发展虚拟运营已有18年，虚拟运营的比例占到全行业的12%，而中国发展2、3年达到2.67%，未来还有很大发展空间，但她却感受到了行业内的恐慌。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">融资困境及舆论压力促进了虚拟运营商的反思。9月22日的论坛上，虚拟运营企业代表均坦承，虚拟运营商也是诈骗案的受害者，落实实名制可促使虚拟运营业健康发展。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">今年4月份，工信部发布了《关于加强规范管理，促进移动通信转售业务健康发展》的通知，向移动转售企业提出了落实移动用户实名登记要求的有关具体规定。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">据中国通信企业协会常务副会长兼秘书长苗建华介绍，整治以来，虚拟运营商采用系统整改、完善手段、有奖举报等一系列措施取得了一定的成效。</p><p><br/></p>',NULL,NULL,NULL),(113,'<p style=\"text-align: center;\"><img src=\"/u/cms/www/201610/10114919rtom.jpg\" title=\"641.jpg\" alt=\"641.jpg\"/></p><p><br/></p><p style=\"text-indent: 2em;\">李克强总理首赴联合国，首场活动便是出席由联合国倡议举行的联大解决难移民大规模流动问题高级别会议。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">这是自联合国成立以来，首次召开的应对难移民问题的高级别会议。同时尤其值得注意的是，这也是中国领导人首次在此种国际场合阐述对于难移民问题的主张。总理的首场与联合国的首次，两者碰撞出怎样的火花?</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">人道主义的价值观，这是李克强主张的要旨。在联合国的讲台上，中国总理的视野超越国别和地域。他将难民和移民问题视为一场“拷问人类社会良知”的人道主义危机，因此郑重向国际社会发出呼吁：“每一个人的生命都是宝贵的，每一个人的尊严都应得到维护，人道主义精神必须弘扬。”中国传统政治伦理中有着人道主义的丰沛思想资源，李克强将其带到联合国讲台上，从而丰富了中国当代外交与政治的实践。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">与此相应，在联合国这个庄严的讲台上，李克强代表中国宣布的3项举措，实打实地彰显了基于人道主义的国际政治理念。中国将这样做：在原有援助规模的基础上，向有关国家和国际组织提供1亿美元的人道主义援助;积极研究把中国-联合国和平与发展基金的部分资金用于支持发展中国家难民移民工作;积极探讨同有关国际机构和发展中国家开展三方合作。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">怎么做，真金白银，某种意义上比怎么说更触及实质。然而这里面有一个厘清“责任观”的问题。中国作为联合国常任理事国，在难移民这一全球性议题上当然有义不容辞的责任。该出手时就出手，正如李克强在当天会议上所言，中国把人道主义援助视为“道义之举”。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">同时，中国经济虽有了很大发展，但仍是发展中国家，愿意承担与自身能力相适应的责任。李克强在联合国所承诺的援助资金，是中国的量力而为，我们决不放空炮;所承诺的援助方式，比如使用和平与发展基金的部分资金、开展三方合作等，也是真正的“务实之举”。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">更关键的是，李克强的“说”与“做”，在一个更高层面上实现了统一，那就是发展。战乱冲突、贫穷落后是难移民问题的主要根源，实现真正的包容性增长方为治本之策。中国的主张和举措，牢牢把握住了解决问题最关键点——长远和根本地看，出路还蕴藏在发展这一主题中。这也是李克强一直以来在国际外交舞台上所强调的，以发展弥合伤痕、促进平衡、共同向前。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">在联合国的首场活动，阐述理念、承诺硬招，李克强总理在这个最高的国际场合，展示了中国“软实力”。</p><p><br/></p>',NULL,NULL,NULL),(130,'<p style=\"text-indent: 2em;\">细心的人会观察到，在发表2016年新年贺词的镜头中，习近平总书记办公室有了新变化：新添的7张照片中，有3张记录着总书记和民族地区各族干部群众一起谋发展、话小康的难忘瞬间。</p><p style=\"text-indent: 2em;\"><br/></p><p>　　民族工作关乎大局。党的十八大以来，以习近平同志为总书记的党中央高度重视民族工作，多次深入民族地区调研，体察少数民族群众冷暖。先后召开第二次中央新疆工作座谈会、中央民族工作会议、中央第六次西藏工作座谈会等，对民族工作作出全面部署，力度之大、频次之高、涉面之广、阐述之深，前所未有，一曲新形势下民族工作新乐章在中华大地奏响。</p><p><br/></p><p>　　保持定力：坚持走中国特色解决民族问题的正确道路</p><p><br/></p><p>　　2014年9月，中央民族工作会议在京召开。会上，习近平总书记在坚持党的民族理论政策基本原则的基础上，提出了一系列新思想新观点新举措，为新形势下民族工作提供了行动指南和基本遵循：</p><p><br/></p><p>　　——我国历史演进的这个特点，造就了我国各民族在分布上的交错杂居、文化上的兼收并蓄、经济上的相互依存、情感上的相互亲近，形成了你中有我、我中有你、谁也离不开谁的多元一体格局。</p><p><br/></p><p>　　——新中国成立65年来，党的民族理论和方针政策是正确的，中国特色解决民族问题的道路是正确的，我国民族关系总体是和谐的。</p><p><br/></p><p>　　——同世界上其他国家相比，我国民族工作做得都是最成功的。</p><p><br/></p><p>　　——中华民族和各民族的关系，形象地说，是一个大家庭和家庭成员的关系，各民族的关系是一个大家庭里不同成员的关系。</p><p><br/></p><p>　　——坚持中国特色解决民族问题的正确道路。</p><p><br/></p><p>　　——坚持和完善民族区域自治制度，要做到坚持统一和自治相结合，坚持民族因素和区域因素相结合。</p><p><br/></p><p>　　——做好民族工作，最关键的是搞好民族团结，最管用的是争取人心。</p><p><br/></p><p>　　——城市民族工作要把着力点放在社区，推动建立相互嵌入式的社会结构和社区环境。</p><p><br/></p><p>　　——加强中华民族大团结，长远和根本的是增强文化认同，建设各民族共有精神家园，积极培养中华民族共同体意识。</p><p><br/></p><p>　　——尊重差异、包容多样，通过扩大交往交流交融，创造各族群众共居、共学、共事、共乐的社会条件，让各民族在中华民族大家庭中手足相亲、守望相助。</p><p>　　……</p><p>　　中央民族工作会议的召开，统一思想、坚定信心，在新的历史起点上推动民族团结进步事业踏上新的时代征程。</p><p><br/></p><p>　　大政方针已定，关键就在落实。中央民族工作会议以来，以理论创新为先导，民族工作的政策创新、制度创新、实践创新不断推进。</p><p><br/></p><p>　　——出台贯彻落实《中共中央、国务院关于加强和改进新形势下民族工作的意见》的重要举措分工方案，包括16项47条，条条都是硬举措。相关部委组成联合督查组督促中央民族工作会议精神的贯彻落实。</p><p><br/></p><p>　　——时隔13年召开全国民族教育工作会议，首次召开全国城市民族工作会议……中央民族工作会议精神逐一贯彻，渐次落实。</p><p><br/></p><p>　　——全国31个省、自治区、直辖市和新疆生产建设兵团相继召开贯彻落实中央民族工作会议精神的会议，出台了相关配套文件。</p><p><br/></p><p>　　——为支持民族地区加快发展，输送“真金白银”，研究制定差别化政策：第一次对川甘青交界地区，对南疆四地州，对怒江、凉山、临夏等三个特困自治州，专门制定政策举措。</p><p><br/></p><p>　　——明确少数民族学生高考加分政策，对国家通用语言文字已经普及、教育水平大体相同的地区，逐步缩小差距，逐步做到一律平等；对语言文化差异较大、教育质量还不高的一些地区少数民族学生，除大力普及双语教育、调整专业设置、提高教学质量外，仍是实行高考加分政策，支持少数民族学生取得较好教育水平。</p><p><br/></p><p>　　两年来，中央民族工作会议精神在各地生根发芽、开花结果。</p><p><br/></p>',NULL,NULL,NULL),(131,'<p style=\"text-align: center;\"><img src=\"/u/cms/www/201610/101353469a1k.jpg\" title=\"3c6d55fbb2fb43161e70f38528a4462308f7d3e6.jpg\" alt=\"3c6d55fbb2fb43161e70f38528a4462308f7d3e6.jpg\"/></p><p><br/></p><p style=\"text-indent: 2em;\">今年的国庆节注定是个不平凡的节日，北京、广州、深圳、苏州、合肥等20个一二线城市相继出台楼市限购限贷政策，“深八条”、“沪六条”等严厉调控措施相继出笼，犹豫在中国大地上引爆了无数颗原子弹，看得人眼花缭乱、心惊肉跳，让人感受到了中国楼市调控“变脸术”之快、之严。&nbsp;</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">社会各界姑且会猜测，这些调控措施付诸实施之后能否成为医治楼市癫狂的灵丹妙药？房地产业服了这些调控药之后是否能走上理性、健康发展轨道？中国民众是否从此不再有楼市猛涨带来的恐慌之虞？回答无疑是否定的。因为这些调控之“药”依然没有摆脱行政窠臼，其结局也就很难跳出行政调控怪圈：“严格管制房价暂时趋缓—放松管制房价暴涨”。也就是说，出台调控措施的这些城市，楼市价格上涨趋势可能暂时会缓一缓，但过后可能又将迎来新一轮量价齐涨周期。因为中国从2005年3月底的“国八条”算起，短短十年间，中国房地产市场虽经历过无数次调控，无论是国务院的各项“通知”，还是九部委、七部委的各种“意见”，都没能阻挡住房价上涨的步伐；不少城市的房价比2005年翻了几番甚至十番都不止。每一轮调控政策都是为稳定住房价格，但调控过后，总有一轮快速上涨行情，越让普通百姓感叹房子越来越买不起了。显然，目前楼市调控实质已陷入越调越高和政府“助涨”的尴尬局面。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">这是为什么呢？道理其实很简单，因为我们楼市调控政策存在严重问题：一是没有理顺楼市调控的目的到底是什么，是控制住房价让老百姓买得起房，还是不要过于严厉让房地产开发商能有钱赚和地方财政有收入可进？正因为楼市调控政策总是处于摇摆不定状态，忽而严厉、忽而放松，缺乏长久可持续调控政策措施，让房地产开发商及各级地方政府形成了“耐药性”，使调控功效被抵消。二是没有割断地方政府与房地产业发展之间的各种利益关系，是让楼市调控步入市场运行机制、让市场充分发挥自发调节作用，还是继续伸出行政权力之手来生硬地管制房价或分割利益？由于这种利益关系没理顺，使一些地方政府难下决心认真调控，致使调控政策得不到认真落实走形变样；同时也会更加诱发一些地方政府竭力追求土地财政、推高房价获得足够收入搞高楼房、宽马路等城市形象政绩工程建设，使调控陷入了“死胡同”。三是没有足够底牌或也不愿意拿出有效手段来对冲楼市上涨带来的压力，使楼市调控政策软弱无力。比如保障房、经济适用房等建设速度缓慢、数量严重短缺，把一大批城市中低收入人群也逼向商品房购买行列，更加剧了楼市非理性上涨；也让政府对楼市非正常上涨现象缺乏必要平抑措施，只能望楼市价格上涨兴叹。四是对楼市上涨失控城市政府调控不力、楼市中存在各种违规行为及投机炒作行为缺乏必要法治惩治手段，使楼市失常状况难得到及时扭转。如调控政策出台之后，没有一个地方政府领导因楼市调控措施落实不力受到严肃问责，丢下官帽；没有一个开发商因弄虚作假、违规开发而被罚得倾家荡产；更没有一个楼市投机炒作者被追究刑责入狱。于是地方政府调控措施执行不力已司空见惯，开发商违规行为让人熟视无睹，投机商哄抬房价打乱楼市现象更是让人见怪不怪。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">由此，目前中国一二线城市楼市调控政策不能只求一时轰动效应，而应把追求实实在在的长久调控效果放在首位，推动楼市调控彻底走出“屡涨屡调，屡调屡涨”怪圈：首先，制定富有弹性的楼市调控政策，确立楼市调控近期目标、中期目标和长远目标，分阶段实施，消除狂风暴雨式调控模式；把楼市调控政策制定要交给各级地方政府，建立目标考核责任制，将其纳入施政目标，让民众来打分评价，对民众不满意或房价涨幅过大的地方政府领导实施行政降级、行政记过、诫勉谈话等问责处罚，增强楼市调控政策的严肃性。其次，进一步厘清行政干预与市场调节的界限，确立地方政府在房地产市场中的责任；将房地产市场纳入法治监管轨道，对楼市调控不力的地方政府、违法违规的房地产开发及哄抬房价扰乱楼市秩序的投机商追究刑事责任，增强楼市调控的法治威慑力。再次，应尽快终结土地财政，加快税收制度改革步伐，将中央政府与地方政府事权与财权改革到位，消除地方政府对土地财政的依赖，楼市疯狂暴涨和挤泡沫才真正有希望。</p><p><br/></p>',NULL,NULL,NULL),(132,'<p style=\"text-align: center;\"><img src=\"/u/cms/www/201610/10135526bcqb.jpg\" title=\"908fa0ec08fa513da2f6fc21356d55fbb3fbd9f5.jpg\" alt=\"908fa0ec08fa513da2f6fc21356d55fbb3fbd9f5.jpg\"/></p><p><br/></p><p style=\"text-indent: 2em;\">三年前，中国大妈们抢购黄金的记忆还历历在目，没想到如今的黄金又开始了一轮又一轮的下跌。接连的破位下跌，再次有人开始蠢蠢欲动，想着投资抄底，再加上中国房地产市场的调控力度不断加大，那么会不会有一部分投资热钱也会进入到黄金市场呢？其实，投资市场历来有句名言是买涨不买跌。不过，对于黄金这种相对常见的避险投资工具来说，很多人买了就是资产配置和“囤货”，并不是简单的投资或者快速的出手，她们持有的耐心和时间更长，因此任何一个低价的出现，都有可能成为触发市场投资的一种诱惑。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">连续下跌，何时是个头？</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">今年的“十一黄金周”期间，黄金价格已经跌破1,300美元/盎司的重要支撑。10月1日～7日，纽约商业交易所（COMEX）黄金大跌4.5%，创下一年来最大单周跌幅，其中上周二跌幅超过3.3%，也创下了2013年12月以来单日最大跌幅。10月4日，现货金价一度跌破1270美元/盎司关口，白银一度跌破18美元关口，跌幅超过5%，多次刷新英国脱欧公投以来最低。市场对欧佩克限产协议不断炒作，原油看涨情绪升温。这都使黄金的价格不被看好。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">市场对全球央行货币政策转向，担忧流动性逆转是黄金下跌的主要原因。其实在8月份之后，全球资本市场人士普遍猜测，各国将统一行动，主要在结构性改革、财政政策上发力，货币政策可能接近极限，全球的流动性将很快出现逆转。黄金价格的剧烈波动，就是对这一猜测的又一次市场反应。如果全球货币宽松走到尽头，那么利率将缓慢上升，全球的债券牛市也将终结。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">摩根大通统计的数据显示，今年英国退欧公投后，欧英日三大央行的季度资产购买规模连创新高。目前美欧英日四大央行的资产负债表已高达13万亿美元之巨，已占全球GDP的40%。预计在今年最后一个季度，欧英日三大央行将“加印”5060亿美元在市场上购买资产，创2009年美联储首推QE以来的最大季度规模。高盛表示，基于全球经济增长仍面临持续下行风险，同时市场可能仍在质疑货币政策应对任何经济潜在冲击的能力。因此，金价跌破每盎司1250美元可能是一个战略性的购买机会。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">值得关注的是，中国央行一直是购买黄金的主力。最新数据显示，截至9月末，国内黄金储备从2014年6月的1054.1吨大幅增加74%至1838.53吨。据中国黄金协会报导，2015年中国生产黄金515.88吨，黄金产量连续九年保持世界第一，黄金消费量连续三年保持世界第一。今年有望继续保持这一势头。不过，今年的黄金需求较往年有明显的回落。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">来自Wind数据统计显示，目前，共有4家拥有黄金业务的上市公司发布了公司的前三季度业绩预报，而从预报结果来看，金价的变化，让这些公司的投资者暂时松了口气。“预计前三季度归属于上市公司股东的净利润变动幅度为增长350.00%至400.00%；同期归属于上市公司股东的净利润变动区间为9847.85万元至10942.05万元；业绩变动的原因是成本下降，黄金价格上升。”</p><p><br/></p>',NULL,NULL,NULL),(140,'<p>任职资格:<br/>1、大专及以上学历，计算机相关专业<br/>2、有一年及以上Java或者安卓开发经验者优先考虑<br/>3、有责任心，能独立思考问题</p>',NULL,NULL,NULL);
/*!40000 ALTER TABLE `tb_content_txt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_content_type`
--

DROP TABLE IF EXISTS `tb_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_content_type` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(20) NOT NULL COMMENT '名称',
  `img_width` int(11) DEFAULT NULL COMMENT '图片宽',
  `img_height` int(11) DEFAULT NULL COMMENT '图片高',
  `has_image` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有图片',
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_content_type`
--

LOCK TABLES `tb_content_type` WRITE;
/*!40000 ALTER TABLE `tb_content_type` DISABLE KEYS */;
INSERT INTO `tb_content_type` VALUES (1,'普通',100,100,0,0),(2,'图文',510,288,1,0),(3,'焦点',280,200,1,0),(4,'头条',0,0,0,0);
/*!40000 ALTER TABLE `tb_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_department`
--

DROP TABLE IF EXISTS `tb_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_department` (
  `depart_id` int(11) NOT NULL AUTO_INCREMENT,
  `depart_name` varchar(255) NOT NULL DEFAULT '' COMMENT '部门名称',
  `site_id` int(11) DEFAULT '0' COMMENT '站点',
  `priority` int(11) NOT NULL DEFAULT '1' COMMENT '排序',
  `weights` int(11) NOT NULL DEFAULT '1' COMMENT '权重(值越大，级别越高)',
  `parent_id` int(11) DEFAULT NULL COMMENT '父级部门ID',
  PRIMARY KEY (`depart_id`),
  KEY `fk_tb_department_site` (`site_id`),
  KEY `fk_tb_tb_department_parent` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='部门';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_department`
--

LOCK TABLES `tb_department` WRITE;
/*!40000 ALTER TABLE `tb_department` DISABLE KEYS */;
INSERT INTO `tb_department` VALUES (1,'一级部门',NULL,1,1,NULL);
/*!40000 ALTER TABLE `tb_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_employee`
--

DROP TABLE IF EXISTS `tb_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
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
-- Table structure for table `tb_file`
--

DROP TABLE IF EXISTS `tb_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_file` (
  `file_path` varchar(255) NOT NULL DEFAULT '' COMMENT '文件路径',
  `file_name` varchar(255) DEFAULT '' COMMENT '文件名字',
  `file_isvalid` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有效',
  `content_id` int(11) DEFAULT NULL COMMENT '内容id',
  PRIMARY KEY (`file_path`),
  KEY `fk_tb_file_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_file`
--

LOCK TABLES `tb_file` WRITE;
/*!40000 ALTER TABLE `tb_file` DISABLE KEYS */;
INSERT INTO `tb_file` VALUES ('/jeecmsv8/u/cms/www/201606/30094553q0uo.jpg','Koala.jpg',0,NULL),('/jeecmsv8f/u/cms/www/201610/13165317n9v8.jpg','1.jpg',0,NULL),('/u/cms/bj/201505/15163118hoig.jpg','mv1.jpg',0,NULL),('/u/cms/www/09093632txyy.jpg','09093632txyy.jpg',1,NULL),('/u/cms/www/090938248x1c.jpg','090938248x1c.jpg',1,NULL),('/u/cms/www/090940173zaj.jpg','090940173zaj.jpg',1,NULL),('/u/cms/www/09094140f562.jpg','09094140f562.jpg',1,NULL),('/u/cms/www/09094302sldg.jpg','09094302sldg.jpg',1,NULL),('/u/cms/www/09094430w0xt.jpg','09094430w0xt.jpg',1,NULL),('/u/cms/www/09151507n6i1.jpg','09151507n6i1.jpg',1,NULL),('/u/cms/www/09152518pzoq.jpg','09152518pzoq.jpg',1,NULL),('/u/cms/www/09152931cgps.jpg','09152931cgps.jpg',1,NULL),('/u/cms/www/091552426die.jpg','091552426die.jpg',1,NULL),('/u/cms/www/0915541140xt.jpg','0915541140xt.jpg',1,NULL),('/u/cms/www/09160120meel.jpg','09160120meel.jpg',1,NULL),('/u/cms/www/091602465aop.jpg','091602465aop.jpg',1,NULL),('/u/cms/www/09165026tk5e.jpg','09165026tk5e.jpg',1,NULL),('/u/cms/www/091655240woj.jpg','091655240woj.jpg',1,NULL),('/u/cms/www/09165821s06r.jpg','09165821s06r.jpg',1,NULL),('/u/cms/www/09170006n0hs.jpg','09170006n0hs.jpg',1,NULL),('/u/cms/www/09174523xkvt.jpg','09174523xkvt.jpg',1,NULL),('/u/cms/www/09174527lkok.jpg','09174527lkok.jpg',1,NULL),('/u/cms/www/10092229195q.jpg','10092229195q.jpg',1,NULL),('/u/cms/www/100950366ij3.jpg','100950366ij3.jpg',1,NULL),('/u/cms/www/100953460bvo.jpg','100953460bvo.jpg',1,NULL),('/u/cms/www/10103806oifr.jpg','10103806oifr.jpg',1,NULL),('/u/cms/www/10104531ukj5.jpg','10104531ukj5.jpg',1,NULL),('/u/cms/www/10144918u244.jpg','10144918u244.jpg',1,NULL),('/u/cms/www/11165619lkm8.jpg','11165619lkm8.jpg',1,NULL),('/u/cms/www/11165624319n.jpg','11165624319n.jpg',1,NULL),('/u/cms/www/111656292jx9.jpg','111656292jx9.jpg',1,NULL),('/u/cms/www/11165633po01.jpg','11165633po01.jpg',1,NULL),('/u/cms/www/111656366w4b.jpg','111656366w4b.jpg',1,NULL),('/u/cms/www/11165640djk4.jpg','11165640djk4.jpg',1,NULL),('/u/cms/www/11165849ahx1.jpg','11165849ahx1.jpg',1,NULL),('/u/cms/www/11170224nw94.jpg','11170224nw94.jpg',1,NULL),('/u/cms/www/11170651qc2f.jpg','11170651qc2f.jpg',1,NULL),('/u/cms/www/11170656zz9b.jpg','11170656zz9b.jpg',1,NULL),('/u/cms/www/111707001w2k.jpg','111707001w2k.jpg',1,NULL),('/u/cms/www/11170703j2h2.jpg','11170703j2h2.jpg',1,NULL),('/u/cms/www/111707071tn0.jpg','111707071tn0.jpg',1,NULL),('/u/cms/www/11170712hp37.jpg','11170712hp37.jpg',1,NULL),('/u/cms/www/111707541g63.jpg','111707541g63.jpg',1,NULL),('/u/cms/www/11171054ja61.jpg','11171054ja61.jpg',1,NULL),('/u/cms/www/11171058td8f.jpg','11171058td8f.jpg',1,NULL),('/u/cms/www/11171102ae78.jpg','11171102ae78.jpg',1,NULL),('/u/cms/www/11171106qaui.jpg','11171106qaui.jpg',1,NULL),('/u/cms/www/11171109m2sr.jpg','11171109m2sr.jpg',1,NULL),('/u/cms/www/11171211kmih.jpg','11171211kmih.jpg',1,NULL),('/u/cms/www/11171546aux9.jpg','11171546aux9.jpg',1,NULL),('/u/cms/www/111715499z6t.jpg','111715499z6t.jpg',1,NULL),('/u/cms/www/11171553t5kf.jpg','11171553t5kf.jpg',1,NULL),('/u/cms/www/11171558kiit.jpg','11171558kiit.jpg',1,NULL),('/u/cms/www/11171603em6o.jpg','11171603em6o.jpg',1,NULL),('/u/cms/www/11171606wnmy.jpg','11171606wnmy.jpg',1,NULL),('/u/cms/www/1117164754x7.jpg','1117164754x7.jpg',1,NULL),('/u/cms/www/11172127ltqx.jpg','11172127ltqx.jpg',1,NULL),('/u/cms/www/111721308eyj.jpg','111721308eyj.jpg',1,NULL),('/u/cms/www/11172134wikw.jpg','11172134wikw.jpg',1,NULL),('/u/cms/www/11172137nwy5.jpg','11172137nwy5.jpg',1,NULL),('/u/cms/www/11172219hw2t.jpg','11172219hw2t.jpg',1,NULL),('/u/cms/www/11173208w8ji.jpg','11173208w8ji.jpg',1,NULL),('/u/cms/www/11173213qlec.jpg','11173213qlec.jpg',1,NULL),('/u/cms/www/111732181p5u.jpg','111732181p5u.jpg',1,NULL),('/u/cms/www/11173222qknp.jpg','11173222qknp.jpg',1,NULL),('/u/cms/www/1117323496nx.jpg','1117323496nx.jpg',1,NULL),('/u/cms/www/11173244ggfv.jpg','11173244ggfv.jpg',1,NULL),('/u/cms/www/11173334yvdd.jpg','11173334yvdd.jpg',1,NULL),('/u/cms/www/111737053v9i.jpg','111737053v9i.jpg',1,NULL),('/u/cms/www/11173708ffx2.jpg','11173708ffx2.jpg',1,NULL),('/u/cms/www/11173711toqx.jpg','11173711toqx.jpg',1,NULL),('/u/cms/www/11173718do4k.jpg','11173718do4k.jpg',1,NULL),('/u/cms/www/11173719ykxk.jpg','11173719ykxk.jpg',1,NULL),('/u/cms/www/11173724ul7o.jpg','11173724ul7o.jpg',1,NULL),('/u/cms/www/11173804j6hj.jpg','11173804j6hj.jpg',1,NULL),('/u/cms/www/11174436pnoi.jpg','11174436pnoi.jpg',1,NULL),('/u/cms/www/11174439eb3l.jpg','11174439eb3l.jpg',1,NULL),('/u/cms/www/1117444317kg.jpg','1117444317kg.jpg',1,NULL),('/u/cms/www/111744466aux.jpg','111744466aux.jpg',1,NULL),('/u/cms/www/111745157ps9.jpg','111745157ps9.jpg',1,NULL),('/u/cms/www/12105715powr.jpg','12105715powr.jpg',1,NULL),('/u/cms/www/12105715u0i2.jpg','12105715u0i2.jpg',1,NULL),('/u/cms/www/12105716avso.jpg','12105716avso.jpg',1,NULL),('/u/cms/www/12105716f0ks.jpg','12105716f0ks.jpg',1,NULL),('/u/cms/www/12105716u081.jpg','12105716u081.jpg',1,NULL),('/u/cms/www/12105717rgdv.jpg','12105717rgdv.jpg',1,NULL),('/u/cms/www/12105908yuqz.jpg','12105908yuqz.jpg',1,NULL),('/u/cms/www/121101457hlo.jpg','121101457hlo.jpg',1,NULL),('/u/cms/www/121101459s0t.jpg','121101459s0t.jpg',1,NULL),('/u/cms/www/12110145r34m.jpg','12110145r34m.jpg',1,NULL),('/u/cms/www/12110146fexh.jpg','12110146fexh.jpg',1,NULL),('/u/cms/www/12110146v1cq.jpg','12110146v1cq.jpg',1,NULL),('/u/cms/www/12110146ynj3.jpg','12110146ynj3.jpg',1,NULL),('/u/cms/www/12110240hrzh.jpg','12110240hrzh.jpg',1,NULL),('/u/cms/www/121104013vts.jpg','121104013vts.jpg',1,NULL),('/u/cms/www/12110726kcxc.jpg','12110726kcxc.jpg',1,NULL),('/u/cms/www/12110726rqp4.jpg','12110726rqp4.jpg',1,NULL),('/u/cms/www/121107270owq.jpg','121107270owq.jpg',1,NULL),('/u/cms/www/1211072762wj.jpg','1211072762wj.jpg',1,NULL),('/u/cms/www/12110728cz8z.jpg','12110728cz8z.jpg',1,NULL),('/u/cms/www/12110728hvna.jpg','12110728hvna.jpg',1,NULL),('/u/cms/www/12110817ejy1.jpg','12110817ejy1.jpg',1,NULL),('/u/cms/www/12111106jy1l.jpg','12111106jy1l.jpg',1,NULL),('/u/cms/www/12111106lobh.jpg','12111106lobh.jpg',1,NULL),('/u/cms/www/12111106zad3.jpg','12111106zad3.jpg',1,NULL),('/u/cms/www/12111106zedy.jpg','12111106zedy.jpg',1,NULL),('/u/cms/www/12111107ctqg.jpg','12111107ctqg.jpg',1,NULL),('/u/cms/www/12111107l4wg.jpg','12111107l4wg.jpg',1,NULL),('/u/cms/www/1211124392sy.jpg','1211124392sy.jpg',1,NULL),('/u/cms/www/12111518igwr.jpg','12111518igwr.jpg',1,NULL),('/u/cms/www/12111518kvd2.jpg','12111518kvd2.jpg',1,NULL),('/u/cms/www/12111518l3p5.jpg','12111518l3p5.jpg',1,NULL),('/u/cms/www/12111518vk7v.jpg','12111518vk7v.jpg',1,NULL),('/u/cms/www/121115195muw.jpg','121115195muw.jpg',1,NULL),('/u/cms/www/12111519tyc2.jpg','12111519tyc2.jpg',1,NULL),('/u/cms/www/1211190051if.jpg','1211190051if.jpg',1,NULL),('/u/cms/www/12112124imh5.jpg','12112124imh5.jpg',1,NULL),('/u/cms/www/121121253f1z.jpg','121121253f1z.jpg',1,NULL),('/u/cms/www/121121265tk1.jpg','121121265tk1.jpg',1,NULL),('/u/cms/www/121121267h0z.jpg','121121267h0z.jpg',1,NULL),('/u/cms/www/12112127795n.jpg','12112127795n.jpg',1,NULL),('/u/cms/www/12112128ltfy.jpg','12112128ltfy.jpg',1,NULL),('/u/cms/www/12112247lfhe.jpg','12112247lfhe.jpg',1,NULL),('/u/cms/www/12120435rmvm.jpg','12120435rmvm.jpg',1,NULL),('/u/cms/www/12120436on4w.jpg','12120436on4w.jpg',1,NULL),('/u/cms/www/121204384v5d.jpg','121204384v5d.jpg',1,NULL),('/u/cms/www/121204408a3o.jpg','121204408a3o.jpg',1,NULL),('/u/cms/www/1212044200gm.jpg','1212044200gm.jpg',1,NULL),('/u/cms/www/121207389dlf.jpg','121207389dlf.jpg',1,NULL),('/u/cms/www/12134158q84h.jpg','12134158q84h.jpg',1,NULL),('/u/cms/www/12134158qzrx.jpg','12134158qzrx.jpg',1,NULL),('/u/cms/www/121341597c2x.jpg','121341597c2x.jpg',1,NULL),('/u/cms/www/12134159kbxa.jpg','12134159kbxa.jpg',1,NULL),('/u/cms/www/12134159robe.jpg','12134159robe.jpg',1,NULL),('/u/cms/www/12134200cwyl.jpg','12134200cwyl.jpg',1,NULL),('/u/cms/www/12134300ap1h.jpg','12134300ap1h.jpg',1,NULL),('/u/cms/www/12134450lo6n.jpg','12134450lo6n.jpg',1,NULL),('/u/cms/www/12134450mwvm.jpg','12134450mwvm.jpg',1,NULL),('/u/cms/www/12134451j9p9.jpg','12134451j9p9.jpg',1,NULL),('/u/cms/www/12134451k1zj.jpg','12134451k1zj.jpg',1,NULL),('/u/cms/www/12134452b2g1.jpg','12134452b2g1.jpg',1,NULL),('/u/cms/www/12134452bb5z.jpg','12134452bb5z.jpg',1,NULL),('/u/cms/www/12134552bk69.jpg','12134552bk69.jpg',1,NULL),('/u/cms/www/121348103ux5.jpg','121348103ux5.jpg',1,NULL),('/u/cms/www/121348109k92.jpg','121348109k92.jpg',1,NULL),('/u/cms/www/121348110tfi.jpg','121348110tfi.jpg',1,NULL),('/u/cms/www/12134811y9du.jpg','12134811y9du.jpg',1,NULL),('/u/cms/www/12134812unit.jpg','12134812unit.jpg',1,NULL),('/u/cms/www/12134933sxsx.jpg','12134933sxsx.jpg',1,NULL),('/u/cms/www/12135148im9s.jpg','12135148im9s.jpg',1,NULL),('/u/cms/www/12135149ar88.jpg','12135149ar88.jpg',1,NULL),('/u/cms/www/12135149bhlg.jpg','12135149bhlg.jpg',1,NULL),('/u/cms/www/12135149s2wm.jpg','12135149s2wm.jpg',1,NULL),('/u/cms/www/12135243x57l.jpg','12135243x57l.jpg',1,NULL),('/u/cms/www/12135606e58j.jpg','12135606e58j.jpg',1,NULL),('/u/cms/www/12135607ftvv.jpg','12135607ftvv.jpg',1,NULL),('/u/cms/www/12135607vqhp.jpg','12135607vqhp.jpg',1,NULL),('/u/cms/www/12135608ad8p.jpg','12135608ad8p.jpg',1,NULL),('/u/cms/www/12135608l3ai.jpg','12135608l3ai.jpg',1,NULL),('/u/cms/www/12135609wexl.jpg','12135609wexl.jpg',1,NULL),('/u/cms/www/12135827xy0y.jpg','12135827xy0y.jpg',1,NULL),('/u/cms/www/12135944xk9f.jpg','12135944xk9f.jpg',1,NULL),('/u/cms/www/12140033b5mx.jpg','12140033b5mx.jpg',1,NULL),('/u/cms/www/12140434ixtu.jpg','12140434ixtu.jpg',1,NULL),('/u/cms/www/12140434n4th.jpg','12140434n4th.jpg',1,NULL),('/u/cms/www/12140435relm.jpg','12140435relm.jpg',1,NULL),('/u/cms/www/12140436rua8.jpg','12140436rua8.jpg',1,NULL),('/u/cms/www/12140436wwsc.jpg','12140436wwsc.jpg',1,NULL),('/u/cms/www/12140851yp14.jpg','12140851yp14.jpg',1,NULL),('/u/cms/www/12141311nuua.jpg','12141311nuua.jpg',1,NULL),('/u/cms/www/12141311xxbj.jpg','12141311xxbj.jpg',1,NULL),('/u/cms/www/12141312d3p6.jpg','12141312d3p6.jpg',1,NULL),('/u/cms/www/12141312r6eb.jpg','12141312r6eb.jpg',1,NULL),('/u/cms/www/1214131399h0.jpg','1214131399h0.jpg',1,NULL),('/u/cms/www/12141313ndlq.jpg','12141313ndlq.jpg',1,NULL),('/u/cms/www/121414505xah.jpg','121414505xah.jpg',1,NULL),('/u/cms/www/12142118fe7p.jpg','12142118fe7p.jpg',1,NULL),('/u/cms/www/121421197sla.jpg','121421197sla.jpg',1,NULL),('/u/cms/www/12142119m8y5.jpg','12142119m8y5.jpg',1,NULL),('/u/cms/www/12142120loqu.jpg','12142120loqu.jpg',1,NULL),('/u/cms/www/12142120u2tx.jpg','12142120u2tx.jpg',1,NULL),('/u/cms/www/1214212172bk.jpg','1214212172bk.jpg',1,NULL),('/u/cms/www/12142322wa0z.jpg','12142322wa0z.jpg',1,NULL),('/u/cms/www/12142734jwmh.jpg','12142734jwmh.jpg',1,NULL),('/u/cms/www/12142735jqmu.jpg','12142735jqmu.jpg',1,NULL),('/u/cms/www/12142735rhib.jpg','12142735rhib.jpg',1,NULL),('/u/cms/www/1214273617d5.jpg','1214273617d5.jpg',1,NULL),('/u/cms/www/12142736ue6c.jpg','12142736ue6c.jpg',1,NULL),('/u/cms/www/12142737cr9y.jpg','12142737cr9y.jpg',1,NULL),('/u/cms/www/12142830poeb.jpg','12142830poeb.jpg',1,NULL),('/u/cms/www/1214325480ue.jpg','1214325480ue.jpg',1,NULL),('/u/cms/www/12143254y1wh.jpg','12143254y1wh.jpg',1,NULL),('/u/cms/www/121432556ttu.jpg','121432556ttu.jpg',1,NULL),('/u/cms/www/12143255ryzh.jpg','12143255ryzh.jpg',1,NULL),('/u/cms/www/12143255ukxu.jpg','12143255ukxu.jpg',1,NULL),('/u/cms/www/12143256g1bo.jpg','12143256g1bo.jpg',1,NULL),('/u/cms/www/12143342sfmg.jpg','12143342sfmg.jpg',1,NULL),('/u/cms/www/121454345gdz.jpg','121454345gdz.jpg',1,NULL),('/u/cms/www/12145434959z.jpg','12145434959z.jpg',1,NULL),('/u/cms/www/12145434qkiz.jpg','12145434qkiz.jpg',1,NULL),('/u/cms/www/12145435lmi6.jpg','12145435lmi6.jpg',1,NULL),('/u/cms/www/12145435u9c1.jpg','12145435u9c1.jpg',1,NULL),('/u/cms/www/121456599tnd.jpg','121456599tnd.jpg',1,NULL),('/u/cms/www/12150556da16.jpg','12150556da16.jpg',1,NULL),('/u/cms/www/12150556inf7.jpg','12150556inf7.jpg',1,NULL),('/u/cms/www/12150557dzrz.jpg','12150557dzrz.jpg',1,NULL),('/u/cms/www/12150557etcp.jpg','12150557etcp.jpg',1,NULL),('/u/cms/www/12150701tmkd.jpg','12150701tmkd.jpg',1,NULL),('/u/cms/www/12150936264i.jpg','12150936264i.jpg',1,NULL),('/u/cms/www/121509368460.jpg','121509368460.jpg',1,NULL),('/u/cms/www/12150936cnpa.jpg','12150936cnpa.jpg',1,NULL),('/u/cms/www/121509371kyv.jpg','121509371kyv.jpg',1,NULL),('/u/cms/www/12150937xe3g.jpg','12150937xe3g.jpg',1,NULL),('/u/cms/www/12151139jrv6.jpg','12151139jrv6.jpg',1,NULL),('/u/cms/www/1215211539ic.jpg','1215211539ic.jpg',1,NULL),('/u/cms/www/12152115dymp.jpg','12152115dymp.jpg',1,NULL),('/u/cms/www/12152115n7ee.jpg','12152115n7ee.jpg',1,NULL),('/u/cms/www/12152115oqbj.jpg','12152115oqbj.jpg',1,NULL),('/u/cms/www/12152116am9n.jpg','12152116am9n.jpg',1,NULL),('/u/cms/www/12152257va9g.jpg','12152257va9g.jpg',1,NULL),('/u/cms/www/12153550461x.jpg','12153550461x.jpg',1,NULL),('/u/cms/www/12153550ryso.jpg','12153550ryso.jpg',1,NULL),('/u/cms/www/12153551fflz.jpg','12153551fflz.jpg',1,NULL),('/u/cms/www/12153551igy5.jpg','12153551igy5.jpg',1,NULL),('/u/cms/www/12153551r5kz.jpg','12153551r5kz.jpg',1,NULL),('/u/cms/www/121535526foq.jpg','121535526foq.jpg',1,NULL),('/u/cms/www/121536505s2h.jpg','121536505s2h.jpg',1,NULL),('/u/cms/www/121542148jkc.jpg','121542148jkc.jpg',1,NULL),('/u/cms/www/121542158t1n.jpg','121542158t1n.jpg',1,NULL),('/u/cms/www/121542159xil.jpg','121542159xil.jpg',1,NULL),('/u/cms/www/12154215ryyk.jpg','12154215ryyk.jpg',1,NULL),('/u/cms/www/12154215y02n.jpg','12154215y02n.jpg',1,NULL),('/u/cms/www/12154216egtt.jpg','12154216egtt.jpg',1,NULL),('/u/cms/www/121543059cct.jpg','121543059cct.jpg',1,NULL),('/u/cms/www/12154708kkn6.jpg','12154708kkn6.jpg',1,NULL),('/u/cms/www/12154708nsye.jpg','12154708nsye.jpg',1,NULL),('/u/cms/www/12154708we6w.jpg','12154708we6w.jpg',1,NULL),('/u/cms/www/12154709iod3.jpg','12154709iod3.jpg',1,NULL),('/u/cms/www/12154709ypkl.jpg','12154709ypkl.jpg',1,NULL),('/u/cms/www/121547582f5t.jpg','121547582f5t.jpg',1,NULL),('/u/cms/www/1311420498g8.jpg','1311420498g8.jpg',1,NULL),('/u/cms/www/131203117zrn.jpg','131203117zrn.jpg',1,NULL),('/u/cms/www/131257327chh.jpg','131257327chh.jpg',1,NULL),('/u/cms/www/13141220dfer.jpg','13141220dfer.jpg',1,NULL),('/u/cms/www/131423399l1z.jpg','131423399l1z.jpg',1,NULL),('/u/cms/www/13142927kzr3.jpg','13142927kzr3.jpg',1,NULL),('/u/cms/www/1316285322ks.jpg','1316285322ks.jpg',1,NULL),('/u/cms/www/13162904gqxm.jpg','13162904gqxm.jpg',1,NULL),('/u/cms/www/13162913da42.jpg','13162913da42.jpg',1,NULL),('/u/cms/www/131629222u39.jpg','131629222u39.jpg',1,NULL),('/u/cms/www/13162931ofsn.jpg','13162931ofsn.jpg',1,NULL),('/u/cms/www/13162941ipg2.jpg','13162941ipg2.jpg',1,NULL),('/u/cms/www/13163101ccd3.jpg','13163101ccd3.jpg',1,NULL),('/u/cms/www/13163113pd3s.jpg','13163113pd3s.jpg',1,NULL),('/u/cms/www/13163306pqvc.jpg','13163306pqvc.jpg',1,NULL),('/u/cms/www/13165112t47d.jpg','13165112t47d.jpg',1,NULL),('/u/cms/www/13165118lr7r.jpg','13165118lr7r.jpg',1,NULL),('/u/cms/www/13165348xokj.jpg','13165348xokj.jpg',1,NULL),('/u/cms/www/131656557m43.jpg','131656557m43.jpg',1,NULL),('/u/cms/www/13165702cchp.jpg','13165702cchp.jpg',1,NULL),('/u/cms/www/13170123ywvv.jpg','13170123ywvv.jpg',1,NULL),('/u/cms/www/13170129mx9q.jpg','13170129mx9q.jpg',1,NULL),('/u/cms/www/13170427k084.jpg','13170427k084.jpg',1,NULL),('/u/cms/www/131706089h4w.jpg','131706089h4w.jpg',1,NULL),('/u/cms/www/13170759d8ow.jpg','13170759d8ow.jpg',1,NULL),('/u/cms/www/13170940lu1h.jpg','13170940lu1h.jpg',1,NULL),('/u/cms/www/19110822fin2.jpg','19110822fin2.jpg',1,NULL),('/u/cms/www/19112623820c.jpg','19112623820c.jpg',1,NULL),('/u/cms/www/19112700bypf.jpg','19112700bypf.jpg',1,NULL),('/u/cms/www/19114043tp85.jpg','19114043tp85.jpg',1,NULL),('/u/cms/www/19114201tdir.jpg','19114201tdir.jpg',1,NULL),('/u/cms/www/191201449moh.jpg','191201449moh.jpg',1,NULL),('/u/cms/www/191203538tdp.jpg','191203538tdp.jpg',1,NULL),('/u/cms/www/19131809acqm.jpg','19131809acqm.jpg',1,NULL),('/u/cms/www/19131949r2ge.jpg','19131949r2ge.jpg',1,NULL),('/u/cms/www/191342393mlg.jpg','191342393mlg.jpg',1,NULL),('/u/cms/www/19134448qvza.jpg','19134448qvza.jpg',1,NULL),('/u/cms/www/191351590e53.jpg','191351590e53.jpg',1,NULL),('/u/cms/www/19135642zjak.jpg','19135642zjak.jpg',1,NULL),('/u/cms/www/19135645ge7r.jpg','19135645ge7r.jpg',1,NULL),('/u/cms/www/19135821ij0m.jpg','19135821ij0m.jpg',1,NULL),('/u/cms/www/19140340fri2.jpg','19140340fri2.jpg',1,NULL),('/u/cms/www/19140601kgid.jpg','19140601kgid.jpg',1,NULL),('/u/cms/www/19140803w9fg.jpg','19140803w9fg.jpg',1,NULL),('/u/cms/www/191408471iyj.jpg','191408471iyj.jpg',1,NULL),('/u/cms/www/19141200ip5c.jpg','19141200ip5c.jpg',1,NULL),('/u/cms/www/19141318apz1.jpg','19141318apz1.jpg',1,NULL),('/u/cms/www/19141700opui.jpg','19141700opui.jpg',1,NULL),('/u/cms/www/19141756u9sa.jpg','19141756u9sa.jpg',1,NULL),('/u/cms/www/19142041eu8x.jpg','19142041eu8x.jpg',1,NULL),('/u/cms/www/19142206y73m.jpg','19142206y73m.jpg',1,NULL),('/u/cms/www/19142430589t.jpg','19142430589t.jpg',1,NULL),('/u/cms/www/19142451945q.jpg','19142451945q.jpg',1,NULL),('/u/cms/www/19142818yvty.jpg','19142818yvty.jpg',1,NULL),('/u/cms/www/19142840ycm6.jpg','19142840ycm6.jpg',1,NULL),('/u/cms/www/201139137vu6.jpg','201139137vu6.jpg',1,NULL),('/u/cms/www/20114003od1n.jpg','20114003od1n.jpg',1,NULL),('/u/cms/www/201140399nrc.jpg','201140399nrc.jpg',1,NULL),('/u/cms/www/201143116bd3.jpg','201143116bd3.jpg',1,NULL),('/u/cms/www/20114348t1z8.jpg','20114348t1z8.jpg',1,NULL),('/u/cms/www/20114520rqti.jpg','20114520rqti.jpg',1,NULL),('/u/cms/www/20114607jim6.jpg','20114607jim6.jpg',1,NULL),('/u/cms/www/20114824s9bf.jpg','20114824s9bf.jpg',1,NULL),('/u/cms/www/20115532h8tv.jpg','20115532h8tv.jpg',1,NULL),('/u/cms/www/201159459afm.jpg','201159459afm.jpg',1,NULL),('/u/cms/www/20120531bbei.jpg','20120531bbei.jpg',1,NULL),('/u/cms/www/20120732ybv8.jpg','20120732ybv8.jpg',1,NULL),('/u/cms/www/201308','201308',1,NULL),('/u/cms/www/201308//mv.jpg','mv.jpg',0,NULL),('/u/cms/www/201309','201309',1,NULL),('/u/cms/www/201312/301119254w80.flv','/u/cms/www/201312/301119254w80.flv',0,NULL),('/u/cms/www/201505/08115215axo2.jpg','mv1.jpg',0,NULL),('/u/cms/www/201505/08115420e3qq.jpg','mv1.jpg',0,NULL),('/u/cms/www/201505/08115602zbpp.jpg','mv1.jpg',0,NULL),('/u/cms/www/201505/0814345226bf.png','屏幕截图(1).png',0,NULL),('/u/cms/www/201505/081435107c1f.png','QQ图片20150417172121.png',0,NULL),('/u/cms/www/201505/08143510hn5q.jpg','mv1.jpg',0,NULL),('/u/cms/www/201505/19101000895y.jpg','2.jpg',0,NULL),('/u/cms/www/201505/19102214sw7g.jpg','2.jpg',0,NULL),('/u/cms/www/201505/28153507v3si.jpg','2.jpg',0,NULL),('/u/cms/www/201505/28153820xz3s.jpg','2.jpg',0,NULL),('/u/cms/www/201505/28155213xbnf.jpg','2.jpg',0,NULL),('/u/cms/www/201505/28155257lfcw.jpg','2.jpg',0,NULL),('/u/cms/www/201505/28155304ool6.jpg','2.jpg',0,NULL),('/u/cms/www/201508/10104142j87z.jpg','2.jpg',0,NULL),('/u/cms/www/201508/101104049u6a.jpg','2.jpg',0,NULL),('/u/cms/www/201508/10110750eroe.jpg','2.jpg',0,NULL),('/u/cms/www/201508/101109584374.jpg','3.jpg',0,NULL),('/u/cms/www/201508/10112023agt7.jpg','3.jpg',0,NULL),('/u/cms/www/201508/10163704n0m7.jpg','2.jpg',0,NULL),('/u/cms/www/201508/10172037p56n.jpg','3.jpg',0,NULL),('/u/cms/www/201508/271405251vsw.jpg','2.jpg',0,NULL),('/u/cms/www/201508/27141715ku66.jpg','2.jpg',0,NULL),('/u/cms/www/201508/271419260xl6.jpg','2.jpg',0,NULL),('/u/cms/www/201510/08103133dosc.jpg','1.jpg',0,NULL),('/u/cms/www/201510/08104832360a.jpg','1.jpg',0,NULL),('/u/cms/www/201510/08105041f9xd.jpg','1.jpg',0,NULL),('/u/cms/www/201510/081613140y6j.jpg','1.jpg',0,NULL),('/u/cms/www/201510/08161359pv1d.jpg','2.jpg',0,NULL),('/u/cms/www/201510/08161538j0sn.png','logo.png',0,NULL),('/u/cms/www/201510/08162637wfpl.png','logo.png',0,NULL),('/u/cms/www/201510/08172019lz4w.png','logo.png',0,NULL),('/u/cms/www/201510/27142936gt6k.jpg','131423399l1z.jpg',0,NULL),('/u/cms/www/201607/15144722d5ed.jpg','banner02.jpg',0,2),('/u/cms/www/201607/151530033koq.jpg','xZ.jpg',1,7),('/u/cms/www/201607/15154001xgx4.jpg','banner04.jpg',0,NULL),('/u/cms/www/201607/15154249ucra.jpg','banner05.jpg',1,2),('/u/cms/www/201607/15154302mvu4.jpg','MAIN201607051346000203081566005.jpg',1,2),('/u/cms/www/201607/15154338b6h9.jpg','MAIN201607051346000202770265284.jpg',1,2),('/u/cms/www/201607/19141129f6g4.jpg','qweq.jpg',1,13),('/u/cms/www/201607/19141205t5d9.jpg','MAIN201607190815465375224112529.jpg',0,NULL),('/u/cms/www/201607/19142033fu5h.jpg','zxc.jpg',1,14),('/u/cms/www/201608/30174757ffr0.jpg','255901999.jpg',0,NULL),('/u/cms/www/201609/13103353l0rl.png','small-prev-page-on.png',0,NULL),('/u/cms/www/201609/131035049a54.png','m-sj.png',0,NULL),('/u/cms/www/201609/13103723gjne.png','small-prev-page-on.png',0,NULL),('/u/cms/www/201609/13103724lwp5.png','small-next-page.png',0,NULL),('/u/cms/www/201609/13103724wi3l.png','small-next-page-on.png',0,NULL),('/u/cms/www/201609/1310372501bw.png','small-prev-page.png',0,NULL),('/u/cms/www/201609/13103813zfv9.png','member-nav.png',0,NULL),('/u/cms/www/201609/13103824db3u.png','m-sj.png',0,NULL),('/u/cms/www/201609/19152319tjq4.png','zsr.png',0,NULL),('/u/cms/www/201609/19152412hzzi.png','zsr.png',0,NULL),('/u/cms/www/201609/191535032l85.png','zhye.png',0,NULL),('/u/cms/www/201609/19153503qjwl.png','zsr.png',0,NULL),('/u/cms/www/201609/19153920h4eu.png','zhye.png',0,NULL),('/u/cms/www/201609/19154055s1o7.png','zhye.png',0,NULL),('/u/cms/www/201609/191544366efu.png','gmcs.png',0,NULL),('/u/cms/www/201609/19154641z4av.png','gmcs.png',0,NULL),('/u/cms/www/201609/191547450q92.png','gmcs.png',0,NULL),('/u/cms/www/201609/19154854sed0.png','gmcs.png',0,NULL),('/u/cms/www/201609/19155012rfja.png','gmcs.png',0,NULL),('/u/cms/www/201609/19155535g178.png','gmcs.png',0,NULL),('/u/cms/www/201609/191556168oxh.png','zhye.png',0,NULL),('/u/cms/www/201609/191557592avc.png','zsr.png',0,NULL),('/u/cms/www/201609/19155839xtw8.png','zhye.png',0,NULL),('/u/cms/www/201609/191559127g8a.png','gmcs.png',0,NULL),('/u/cms/www/201609/19155948ohk3.png','gmcs.png',0,NULL),('/u/cms/www/201609/191601382uqh.png','txsj.png',0,NULL),('/u/cms/www/201609/19160214xqcz.png','gmcs.png',0,NULL),('/u/cms/www/201609/19160256yti4.png','txcs.png',0,NULL),('/u/cms/www/201609/22165418ezkw.jpg','vs.jpg',1,28),('/u/cms/www/201609/23091850z61y.jpg','ttsf.jpg',1,32),('/u/cms/www/201609/23092240hxg8.jpg','adff.jpg',1,33),('/u/cms/www/201609/23093922giys.jpg','bc.jpg',1,36),('/u/cms/www/201609/230942139uh5.jpg','xcv.jpg',1,37),('/u/cms/www/201609/23095358y6s6.jpg','qw.jpg',1,39),('/u/cms/www/201609/23100710845n.jpg','sf.jpg',0,NULL),('/u/cms/www/201609/23150119m7z0.jpg','zsf.jpg',1,27),('/u/cms/www/201609/26101908i5ds.jpg','video02.jpg',1,53),('/u/cms/www/201609/26102008qcao.jpg','video04.jpg',1,55),('/u/cms/www/201609/26102115joze.jpg','video06.jpg',1,57),('/u/cms/www/201609/261022192w54.jpg','video08.jpg',1,59),('/u/cms/www/201609/26102904f2l8.jpg','video12.jpg',1,61),('/u/cms/www/201609/26103003hrib.jpg','video11.jpg',1,63),('/u/cms/www/201609/261635496465.zip','演示.zip',1,69),('/u/cms/www/201609/26164039i3uv.jpg','dl-QQ.jpg',1,69),('/u/cms/www/201609/261640457r2n.jpg','dl_top.jpg',1,69),('/u/cms/www/201609/27094715plsz.jpg','download02.jpg',0,71),('/u/cms/www/201609/270953566xxw.jpg','content-bdy.jpg',0,NULL),('/u/cms/www/201609/27095528bd43.jpg','download02.jpg',0,NULL),('/u/cms/www/201609/270958122ljv.jpg','content-bdy.jpg',1,71),('/u/cms/www/201609/27095816s3y8.jpg','dl-bdy.jpg',1,71),('/u/cms/www/201609/271002022fag.zip','演示.zip',1,71),('/u/cms/www/201609/27101510bh0o.jpg','download03.jpg',1,72),('/u/cms/www/201609/27101514u0i9.jpg','content-360sd.jpg',1,72),('/u/cms/www/201609/27101524dxj7.jpg','dl-360shadu.jpg',1,72),('/u/cms/www/201609/27102743993k.zip','演示.zip',1,72),('/u/cms/www/201609/27103024lgp2.jpg','download02.jpg',0,71),('/u/cms/www/201609/271031297jwc.jpg','download02.jpg',0,71),('/u/cms/www/201609/27103421zh99.jpg','download04.jpg',0,71),('/u/cms/www/201609/27103503tm30.jpg','download04.jpg',0,71),('/u/cms/www/201610/08153906dmjk.jpg','wenku_item05.jpg',0,NULL),('/u/cms/www/201610/081540214khn.jpg','wenku_item05.jpg',0,NULL),('/u/cms/www/201610/08154224b4zl.jpg','wenku_item05.jpg',0,NULL),('/u/cms/www/201610/08155845dhts.jpg','wenku_item05.jpg',0,NULL),('/u/cms/www/201610/08160110rjjx.jpg','wenku_item05.jpg',0,NULL),('/u/cms/www/201610/081602097gfq.jpg','wenku_item05.jpg',0,NULL),('/u/cms/www/201610/08162230t0wf.jpg','wenku_item05.jpg',0,NULL),('/u/cms/www/201610/08162651u5t0.jpg','wenku_item05.jpg',0,NULL),('/u/cms/www/201610/10100842hqdk.jpg','topic_title03.jpg',1,NULL),('/u/cms/www/201610/10100850mssf.jpg','topic03.jpg',0,NULL),('/u/cms/www/201610/10100951y2xy.jpg','topic_title02.jpg',1,NULL),('/u/cms/www/201610/1010095517rc.jpg','topic02.jpg',0,NULL),('/u/cms/www/201610/101010021q7v.jpg','topic_title01.jpg',1,NULL),('/u/cms/www/201610/10101006fqv3.jpg','topic01.jpg',0,NULL),('/u/cms/www/201610/10110628vfwz.jpg','content-nycs.jpg',1,100),('/u/cms/www/201610/10110634gxcz.jpg','dl-nycs.jpg',1,100),('/u/cms/www/201610/10110654vib6.jpg','download01.jpg',1,100),('/u/cms/www/201610/10110756cg7o.zip','演示.zip',1,100),('/u/cms/www/201610/10111518cqda.zip','演示.zip',1,101),('/u/cms/www/201610/10111549rupn.jpg','content-xunlei.jpg',1,101),('/u/cms/www/201610/101116034e14.jpg','download05.jpg',1,101),('/u/cms/www/201610/10111618rhdk.jpg','dl-xunlei7.jpg',1,101),('/u/cms/www/201610/10111758q1kj.zip','演示.zip',1,102),('/u/cms/www/201610/101119026ukx.jpg','content-360safe.jpg',1,102),('/u/cms/www/201610/101119092w8r.jpg','dl-360safe.jpg',1,102),('/u/cms/www/201610/10112023kqfp.jpg','content-sougou.jpg',1,103),('/u/cms/www/201610/101120330mpz.jpg','dl-sougou.jpg',1,103),('/u/cms/www/201610/101120397iez.zip','演示.zip',1,103),('/u/cms/www/201610/10112554wirt.zip','演示.zip',1,104),('/u/cms/www/201610/10112657zklb.jpg','content-yy.jpg',1,104),('/u/cms/www/201610/10112706jiii.jpg','dl-YY.jpg',1,104),('/u/cms/www/201610/10112814u17l.zip','演示.zip',1,105),('/u/cms/www/201610/10112839cvwx.jpg','content-ali.jpg',1,105),('/u/cms/www/201610/10112845wryq.jpg','dl-aliwwmaijia.jpg',1,105),('/u/cms/www/201610/101130257966.zip','演示.zip',1,106),('/u/cms/www/201610/10113032zu0k.jpg','content-iqy.jpg',1,106),('/u/cms/www/201610/101130399dbt.jpg','dl-QIY.jpg',1,106),('/u/cms/www/201610/101131571wkz.zip','演示.zip',1,107),('/u/cms/www/201610/10113218ya2p.jpg','content-google.jpg',1,107),('/u/cms/www/201610/10113226knhj.jpg','dl-google.jpg',1,107),('/u/cms/www/201610/101133341nc3.zip','演示.zip',1,108),('/u/cms/www/201610/10113354g71e.jpg','content-360exp.jpg',1,108),('/u/cms/www/201610/10113400utfn.jpg','dl-360exp.jpg',1,108),('/u/cms/www/201610/10113459gvbx.zip','演示.zip',1,109),('/u/cms/www/201610/10113506jz07.jpg','content-pptv.jpg',1,109),('/u/cms/www/201610/1011351336l0.jpg','dl-PPTV.jpg',1,109),('/u/cms/www/201610/10113551yru8.jpg','content-txsp.jpg',1,110),('/u/cms/www/201610/101135560ne4.jpg','dl-txsp.jpg',1,110),('/u/cms/www/201610/101136270k36.zip','演示.zip',1,110),('/u/cms/www/201610/10114452yjhh.jpg','zxcvx.jpg',1,111),('/u/cms/www/201610/10114704dsba.jpg','cb.jpg',1,112),('/u/cms/www/201610/101308178wzr.jpg','df.jpg',1,114),('/u/cms/www/201610/101314450fs1.jpg','banner02.jpg',1,115),('/u/cms/www/201610/101317064t3l.jpg','xZ.jpg',0,NULL),('/u/cms/www/201610/10131759kpti.jpg','5672662427112447485.jpg',1,116),('/u/cms/www/201610/101320442qbi.jpg','zdsad.jpg',1,117),('/u/cms/www/201610/10132253w0rj.jpg','sf.jpg',1,118),('/u/cms/www/201610/101326014zdc.jpg','banner02.jpg',1,119),('/u/cms/www/201610/10133449hwwr.jpg','vjkhk.jpg',1,120),('/u/cms/www/201610/10133710to3f.jpg','video_banner02.jpg',1,121),('/u/cms/www/201610/10133842aiyf.png','video_Btn02.png',1,121),('/u/cms/www/201610/10133954jfoc.jpg','video_banner01.jpg',1,122),('/u/cms/www/201610/101340004te2.png','video_Btn01.png',1,122),('/u/cms/www/201610/101340393eav.png','video_Btn03.png',1,123),('/u/cms/www/201610/10134048htcl.jpg','video_banner03.jpg',1,123),('/u/cms/www/201610/10134238qppo.jpg','video10.jpg',1,124),('/u/cms/www/201610/10134440wmng.jpg','video01.jpg',1,125),('/u/cms/www/201610/101345564pok.jpg','video09.jpg',1,126),('/u/cms/www/201610/101346227ayf.jpg','video07.jpg',1,127),('/u/cms/www/201610/101346473kic.jpg','video05.jpg',1,128),('/u/cms/www/201610/10134720z8a5.jpg','zdsad.jpg',1,129),('/u/cms/www/201610/110911592mxa.jpg','hlwjia.jpg',1,NULL),('/u/cms/www/201610/110919049wkh.jpg','qglh.jpg',0,NULL),('/u/cms/www/201610/11092148co74.jpg','qglh.jpg',1,NULL),('/u/cms/www/201610/11092540p27t.jpg','zph.jpg',1,NULL),('/u/cms/www/201610/11092701sxi4.jpg','zph.jpg',0,NULL),('/u/cms/www/201610/11093237z5e8.jpg','fghj.jpg',1,141),('/u/cms/www/201610/11111659rnpb.mp4','/u/cms/www/201610/11111659rnpb.mp4',0,NULL),('/u/cms/www/201610/11111729glis.docx','测试.docx',0,NULL),('/u/cms/www/201610/11111806t1hj.mp4','/u/cms/www/201610/11111806t1hj.mp4',0,NULL),('/u/cms/www/201610/111118456g3w.docx','测试.docx',0,NULL),('/u/cms/www/201610/111118588poy.mp4','/u/cms/www/201610/111118588poy.mp4',0,NULL),('/u/cms/www/201610/11112051yx2x.mp4','/u/cms/www/201610/11112051yx2x.mp4',0,NULL),('/u/cms/www/201610/111121133pnh.mp4','/u/cms/www/201610/111121133pnh.mp4',0,NULL),('/u/cms/www/201610/111121213xss.docx','测试.docx',0,NULL),('/u/cms/www/201610/11112910l4qa.jpg','3c6d55fbb2fb43161e70f38528a4462308f7d3e6.jpg',0,NULL),('/u/cms/www/201610/11113157dh9e.jpg','0.jpg',0,NULL),('/u/cms/www/22093458gynd.jpg','22093458gynd.jpg',1,NULL),('/u/cms/www/22093502mmft.jpg','22093502mmft.jpg',1,NULL),('/u/cms/www/22093506l8pv.jpg','22093506l8pv.jpg',1,NULL),('/u/cms/www/22093509qm3l.jpg','22093509qm3l.jpg',1,NULL),('/u/cms/www/22093513srmf.jpg','22093513srmf.jpg',1,NULL),('/u/cms/www/22094752xoxd.jpg','22094752xoxd.jpg',1,NULL),('/u/cms/www/22094906lrj8.jpg','22094906lrj8.jpg',1,NULL),('/u/cms/www/22094911xe9x.jpg','22094911xe9x.jpg',1,NULL),('/u/cms/www/22094915t8h1.jpg','22094915t8h1.jpg',1,NULL),('/u/cms/www/22094918gnze.jpg','22094918gnze.jpg',1,NULL),('/u/cms/www/22100555lytj.jpg','22100555lytj.jpg',1,NULL),('/u/cms/www/22100558gfsb.jpg','22100558gfsb.jpg',1,NULL),('/u/cms/www/22100601l1us.jpg','22100601l1us.jpg',1,NULL),('/u/cms/www/22100606t8mw.jpg','22100606t8mw.jpg',1,NULL),('/u/cms/www/22100611o2gl.jpg','22100611o2gl.jpg',1,NULL),('/u/cms/www/23172935t4sb.jpg','23172935t4sb.jpg',1,NULL),('/u/cms/www/23172936acob.jpg','23172936acob.jpg',1,NULL),('/u/cms/www/23172937bli1.jpg','23172937bli1.jpg',1,NULL),('/u/cms/www/23172937r23n.jpg','23172937r23n.jpg',1,NULL),('/u/cms/www/23172939ln5a.jpg','23172939ln5a.jpg',1,NULL),('/u/cms/www/231729407e1v.jpg','231729407e1v.jpg',1,NULL),('/u/cms/www/231729434x7h.jpg','231729434x7h.jpg',1,NULL),('/u/cms/www/23172944o38x.jpg','23172944o38x.jpg',1,NULL),('/u/cms/www/23172944vvdh.jpg','23172944vvdh.jpg',1,NULL),('/u/cms/www/23172946mzqx.jpg','23172946mzqx.jpg',1,NULL),('/u/cms/www/23172947nrrl.jpg','23172947nrrl.jpg',1,NULL),('/u/cms/www/24102446b7al.jpg','24102446b7al.jpg',1,NULL),('/u/cms/www/24102503z9wj.jpg','24102503z9wj.jpg',1,NULL),('/u/cms/www/2416455972ro.jpg','2416455972ro.jpg',1,NULL),('/u/cms/www/241646340nq6.jpg','241646340nq6.jpg',1,NULL),('/u/cms/www/24164707ksjq.jpg','24164707ksjq.jpg',1,NULL),('/u/cms/www/26115537aper.jpg','26115537aper.jpg',1,NULL),('/u/cms/www/26115537rs0f.jpg','26115537rs0f.jpg',1,NULL),('/u/cms/www/26150136kryi.txt','26150136kryi.txt',1,NULL),('/u/cms/www/Thumbs.db','Thumbs.db',1,NULL),('/v6/u/cms/www/201401/13135536pnt2.jpg','mv1.jpg',0,NULL),('/v6/u/cms/www/201401/131359296e9c.jpg','mv1.jpg',0,NULL),('/v6/u/cms/www/201401/1314055350gc.jpg','mv1.jpg',0,NULL),('/v6/u/cms/www/201401/13140606bjte.jpg','mv1.jpg',0,NULL),('/v6/u/cms/www/201401/13140635xydz.jpg','mv1.jpg',0,NULL),('/v6/u/cms/www/201401/13140702pfne.jpg','mv1.jpg',0,NULL),('/v6/u/cms/www/201401/13140909s64p.jpg','mv1.jpg',0,NULL),('/v6/u/cms/www/201401/13141723ywh0.jpg','mv1.jpg',0,NULL),('/v6/u/cms/www/201401/13142644qpdm.jpg','mv1.jpg',0,NULL),('/v6/u/cms/www/201401/131429269ikl.jpg','mv1.jpg',0,NULL),('/v6/u/cms/www/201401/131431450xia.jpg','mv1.jpg',0,NULL),('/v6/u/cms/www/201401/131431578u9o.jpg','mv1.jpg',0,NULL),('/v6/u/cms/www/201403/1316123792p0.docx','0_開發需求_.docx',0,NULL),('/v6/u/cms/www/201403/13163251c8d5.docx','0_開發需求_.docx',0,NULL),('/v6/u/cms/www/201403/131634322gqg.docx','0_開發需求_.docx',0,NULL),('/v6/u/cms/www/201403/131636277cxi.docx','0_開發需求_.docx',0,NULL),('/v6/u/cms/www/201403/13163934xmp0.docx','0_開發需求_.docx',0,NULL),('/v6/u/cms/www/201403/13164248ng73.docx','0_開發需求_.docx',0,NULL),('/v6/u/cms/www/201403/13165347xxty.docx','0_開發需求_.docx',0,NULL),('/v6/u/cms/www/201403/13170503bwpw.jpg','1.jpg',0,NULL),('/v6/u/cms/www/201403/13170603q1bw.jpg','1.jpg',0,NULL),('/v6/u/cms/www/201403/131706463pqt.jpg','1.jpg',0,NULL),('/v6/u/cms/www/201403/13172446osvy.jpg','1.jpg',0,NULL),('/v6/u/cms/www/201403/13172626x71c.docx','0_開發需求_.docx',0,NULL),('/v6/u/cms/www/201403/13173752etj3.zip','ChromeSetup.zip',0,NULL),('/v6/u/cms/www/201403/13173805fii8.zip','ChromeSetup.zip',0,NULL),('/v6/u/cms/www/201403/14091703u57k.docx','0_開發需求_.docx',0,NULL),('/v6/u/cms/www/201403/14091741h0w0.zip','ChromeSetup.zip',0,NULL),('/v6/u/cms/www/201403/14092030cnyx.mp4','18183451i5bi.mp4',0,NULL),('/v6/u/cms/www/201403/14092835ljai.docx','0_開發需求_.docx',0,NULL),('/v6/u/cms/www/201403/14095531y5tg.zip','ChromeSetup.zip',0,NULL),('/v6/u/cms/www/201403/14095543za61.docx','0_開發需求_.docx',0,NULL),('/v6/u/cms/www/201403/14095551kk1a.docx','0_開發需求_.docx',0,NULL),('/v6/u/cms/www/201403/14095759mdqw.docx','0_開發需求_.docx',0,NULL),('/v6/u/cms/www/201403/14102936l7gw.txt','freemarker.txt',0,NULL),('/v6/u/cms/www/201403/14104521p9ey.zip','bbs-update-2012-11-2.zip',0,NULL),('/v6/u/cms/www/201403/14105137jxtn.mp4','/v6/u/cms/www/201403/14105137jxtn.mp4',0,NULL),('/v6/u/cms/www/201403/14112725dsar.zip','/v6/u/cms/www/201403/14112725dsar.zip',0,NULL),('/v6/u/cms/www/201403/14130702z3xz.png','/v6/u/cms/www/201403/14130702z3xz.png',0,NULL),('/v6/u/cms/www/201403/14165746s64i.pdf','1.pdf',0,NULL),('/v6/u/cms/www/201403/1914315903bj.jpg','1.jpg',0,NULL),('/v6/u/cms/www/201404/20151821gj8y.jpg','1.jpg',0,NULL),('/v6/u/cms/www/201404/2015202141s0.jpg','1.jpg',0,NULL),('/v6/u/cms/www/201404/211128348kuw.jpg','1.jpg',0,NULL),('/v6/u/cms/www/201404/2111305770l1.jpg','1.jpg',0,NULL),('/v6/u/cms/www/201404/21113452hsxh.jpg','mv1.jpg',0,NULL),('/v6/u/cms/www/201404/211137096eif.jpg','mv.jpg',0,NULL),('/v6/u/cms/www/201404/211149148tx0.jpg','mv1.jpg',0,NULL),('/v6/u/cms/www/201404/21115759y8sm.jpg','mv1.jpg',0,NULL),('/v6/u/cms/www/201404/211511276v74.jpg','mv1.jpg',0,NULL),('/v6/u/cms/www/201404/21151948k1fh.jpg','mv1.jpg',0,NULL),('/v6/u/cms/www/201404/21154820xtfs.jpg','mv1.jpg',0,NULL),('/v6/u/cms/www/201404/2115485050rw.jpg','mv1.jpg',0,NULL),('/v6/u/cms/www/201404/21155236mk9b.jpg','mv1.jpg',0,NULL),('/v6/u/cms/www/201404/22084701xqxy.doc','/v6/u/cms/www/201404/22084701xqxy.doc',0,NULL),('/v6/u/cms/www/201404/22084833ys27.doc','/v6/u/cms/www/201404/22084833ys27.doc',0,NULL),('/v6/u/cms/www/201404/22111217hftv.doc','Linux开启mysql远程连接.doc',0,NULL),('/v6/u/cms/www/201404/22111332dwt3.doc','Linux开启mysql远程连接.doc',0,NULL),('/v6/u/cms/www/201404/22114143pw1a.doc','Linux开启mysql远程连接.doc',0,NULL),('/v6/u/cms/www/201404/22132355vqdf.txt','IBM LDAP.txt',0,NULL),('/v6/u/cms/www/201404/22133304pnoh.txt','/v6/u/cms/www/201404/22133304pnoh.txt',0,NULL),('/v6/u/cms/www/201404/22133312pz3j.exe','wpp.exe',0,NULL),('/v6/u/cms/www/201404/22135235m1m1.txt','cmstop.txt',0,NULL),('/v6/u/cms/www/201404/22135348pbqp.swf','2.swf',0,NULL),('/v6/u/cms/www/201404/221353537d0o.doc','discuz_2.doc',0,NULL),('/v6/u/cms/www/201404/22140446zkgv.txt','jeecms新bug.txt',0,NULL),('/v6/u/cms/www/201404/22140629jx27.txt','360检测.txt',0,NULL),('/v6/u/cms/www/201404/22140634er4n.doc','Discuz_X2.0数据字典(数据库表作用解释).doc',0,NULL),('/v6/u/cms/www/201404/22140716e5bk.flv','/v6/u/cms/www/201404/22140716e5bk.flv',0,NULL),('/v6/u/cms/www/201404/22141101f9tv.txt','360检测.txt',0,NULL),('/v6/u/cms/www/201404/22141404irh6.docx','Apache_Shiro_使用手册.docx',0,NULL),('/v6/u/cms/www/201404/22142207xrqx.doc','Discuz_X2.0数据字典(数据库表作用解释).doc',0,NULL),('/v6/u/cms/www/201404/22145137jigp.docx','Apache_Shiro_使用手册.docx',0,NULL),('/v6/u/cms/www/201404/22145142drkb.docx','Apache_Shiro_使用手册.docx',0,NULL),('/v6/u/cms/www/201404/221501301rkt.docx','Apache_Shiro_使用手册.docx',0,NULL),('/v6/u/cms/www/201404/22151702mcwi.docx','Apache_Shiro_使用手册.docx',0,NULL),('/v6/u/cms/www/201404/22152145c9do.doc','Linux开启mysql远程连接.doc',0,NULL),('/v6/u/cms/www/201404/22152231wfrv.mp4','/v6/u/cms/www/201404/22152231wfrv.mp4',0,NULL),('/v6/u/cms/www/201404/22155743mgws.txt','bug平台推荐.txt',0,NULL),('/v6/u/cms/www/201404/22155756p9of.txt','flot柱状图.txt',0,NULL),('/v6/u/cms/www/201404/22155756scdn.txt','flot使用笔记.txt',0,NULL),('/v6/u/cms/www/201404/28134316erf3.jpg','mv1.jpg',0,NULL),('/v6/u/cms/www/201404/281402505i20.jpg','mv.jpg',0,NULL),('/v6/u/cms/www/201404/28140346452f.jpg','mv.jpg',0,NULL),('/v6/u/cms/www/201404/30140543hzlx.gif','webLogo.gif',0,NULL),('/v6/u/cms/www/201405/08091845sh2l.jpg','1.JPG',0,NULL),('/v6/u/cms/www/201405/08092143cyap.jpg','1.JPG',0,NULL),('/v6/u/cms/www/201405/08092249ype2.jpg','1.JPG',0,NULL),('/v6/u/cms/www/201405/08092924h3fr.jpg','1.JPG',0,NULL),('/v6/u/cms/www/201405/08093111b3jm.jpg','1.JPG',0,NULL),('/v6/u/cms/www/201405/09083819wiab.jpg','mv.jpg',0,NULL),('/v6/u/cms/www/201405/090840146ik7.jpg','mv.jpg',0,NULL),('/v6/u/cms/www/201405/090918028k13.jpg','mv.jpg',0,NULL),('/v6/u/cms/www/201406/09144419786f.txt','bbs好的功能.txt',0,NULL),('/v6/u/cms/www/201406/09145849ap2u.docx','1.docx',0,NULL),('/v6/u/cms/www/201406/09151219pj5s.doc','2.doc',0,NULL),('/v6/u/cms/www/201406/0915215434ij.txt','cmstop.txt',0,NULL),('/v6/u/cms/www/201407/121650299xv9.doc','DiscuzX2文件说明,目录说明.doc',0,NULL),('/v6/u/cms/www/201407/12165642273e.doc','Discuz_X2.0数据字典(数据库表作用解释).doc',0,NULL),('/v6/u/cms/www/201407/12170522j2ct.jpg','1.jpg',0,NULL),('/v6/u/cms/www/201407/30093714q9ic.mp4','/v6/u/cms/www/201407/30093714q9ic.mp4',0,NULL),('/v6/u/cms/www/201407/30130947bmm3.jpg','mv1.jpg',0,NULL),('/v6/u/cms/www/201407/30170627hj1m.jpg','mv.jpg',0,NULL),('/v6/u/cms/www/201407/31114444inln.jpg','mv1.jpg',0,NULL),('/v6/u/cms/www/201407/31114945lp9t.jpg','mv.jpg',0,NULL),('/v6/u/cms/www/201407/31115246futn.jpg','mv1.jpg',0,NULL),('/v6/u/cms/www/201407/31115423u7e6.jpg','mv1.jpg',0,NULL),('/v6/u/cms/www/201407/31132254zdh7.jpg','mv.jpg',0,NULL),('/v6/u/cms/www/201409/03105035q9em.mp4','/v6/u/cms/www/201409/03105035q9em.mp4',0,NULL),('/v6/u/cms/www/201409/03105050xcbs.txt','bug平台推荐.txt',0,NULL),('/v6/wenku/www/201312/241031214kys.txt','/v6/wenku/www/201312/241031214kys.txt',0,NULL),('/v6/wenku/www/201401/16164720tu2n.doc','/v6/wenku/www/201401/16164720tu2n.doc',0,NULL),('/v6/wenku/www/201401/17083718btie.doc','/v6/wenku/www/201401/17083718btie.doc',0,NULL),('/v6/wenku/www/201401/17084032522j.doc','/v6/wenku/www/201401/17084032522j.doc',0,NULL),('/v6/wenku/www/201401/170842070sy2.doc','/v6/wenku/www/201401/170842070sy2.doc',0,NULL),('/v6/wenku/www/201401/17084442fd08.doc','/v6/wenku/www/201401/17084442fd08.doc',0,NULL),('/v6/wenku/www/201401/17085101zvcg.doc','/v6/wenku/www/201401/17085101zvcg.doc',0,NULL),('/v6/wenku/www/201401/25095002cniq.doc','/v6/wenku/www/201401/25095002cniq.doc',0,NULL),('/v6/wenku/www/201403/10115402nl6c.docx','/v6/wenku/www/201403/10115402nl6c.docx',0,NULL),('/v6/wenku/www/201403/1011550974pv.docx','/v6/wenku/www/201403/1011550974pv.docx',0,NULL),('/v6/wenku/www/201403/101155409soa.txt','/v6/wenku/www/201403/101155409soa.txt',0,NULL),('/v6/wenku/www/201403/10115750uxwh.txt','/v6/wenku/www/201403/10115750uxwh.txt',0,NULL),('/v6/wenku/www/201406/04132656esvy.pdf','/v6/wenku/www/201406/04132656esvy.pdf',0,NULL),('/v6/wenku/www/201406/04133131ky4f.pdf','/v6/wenku/www/201406/04133131ky4f.pdf',0,NULL),('/v6/wenku/www/201406/04133159jryy.pdf','/v6/wenku/www/201406/04133159jryy.pdf',0,NULL),('/v6/wenku/www/201406/04133312rszg.pdf','/v6/wenku/www/201406/04133312rszg.pdf',0,NULL),('/v6/wenku/www/201406/04133437555h.pdf','/v6/wenku/www/201406/04133437555h.pdf',0,NULL),('/v6/wenku/www/201406/04133611h3sa.pdf','/v6/wenku/www/201406/04133611h3sa.pdf',0,NULL),('/v6/wenku/www/201406/041340029cmx.pdf','/v6/wenku/www/201406/041340029cmx.pdf',0,NULL),('/v6/wenku/www/201406/0413413473t5.pdf','/v6/wenku/www/201406/0413413473t5.pdf',0,NULL),('/v6/wenku/www/201406/041353368k3b.doc','/v6/wenku/www/201406/041353368k3b.doc',0,NULL),('/v6/wenku/www/201406/04135541s2ay.doc','/v6/wenku/www/201406/04135541s2ay.doc',0,NULL),('/v6/wenku/www/201408/08112543cj83.pdf','/v6/wenku/www/201408/08112543cj83.pdf',0,NULL),('/v6/wenku/www/201408/08131514njo0.pdf','/v6/wenku/www/201408/08131514njo0.pdf',0,NULL),('/v6/wenku/www/201411/061426416ze3.doc','/v6/wenku/www/201411/061426416ze3.doc',0,NULL),('/v6/wenku/www/201411/07142936mhzk.docx','/v6/wenku/www/201411/07142936mhzk.docx',0,NULL),('/v6/wenku/www/201411/07143112x1tn.docx','/v6/wenku/www/201411/07143112x1tn.docx',0,NULL);
/*!40000 ALTER TABLE `tb_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_friendlink`
--

DROP TABLE IF EXISTS `tb_friendlink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_friendlink` (
  `friendlink_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `friendlinkctg_id` int(11) NOT NULL,
  `site_name` varchar(150) NOT NULL COMMENT '网站名称',
  `domain` varchar(255) NOT NULL COMMENT '网站地址',
  `logo` varchar(150) DEFAULT NULL COMMENT '图标',
  `email` varchar(100) DEFAULT NULL COMMENT '站长邮箱',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `views` int(11) NOT NULL DEFAULT '0' COMMENT '点击次数',
  `is_enabled` char(1) NOT NULL DEFAULT '1' COMMENT '是否显示',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  PRIMARY KEY (`friendlink_id`),
  KEY `fk_tb_ctg_friendlink` (`friendlinkctg_id`),
  KEY `fk_tb_friendlink_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='CMS友情链接';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_friendlink`
--

LOCK TABLES `tb_friendlink` WRITE;
/*!40000 ALTER TABLE `tb_friendlink` DISABLE KEYS */;
INSERT INTO `tb_friendlink` VALUES (1,1,1,'JEECMS官网','http://www.jeecms.com',NULL,'jeecms@163.com','JEECMS是JavaEE版网站管理系统（Java Enterprise Edition Content Manage System）的简称。Java凭借其强大、稳定、安全、高效等多方面的优势，一直是企业级应用的首选。',35,'1',1),(2,1,1,'JEEBBS论坛','http://bbs.jeecms.com',NULL,'jeecms@163.com','JEEBBS论坛',5,'1',10),(3,1,2,'京东商城','http://www.360buy.com/','/u/cms/www/201112/1910271036lr.gif','','',4,'1',10),(4,1,2,'当当网','http://www.dangdang.com/','/u/cms/www/201112/191408344rwj.gif','','',1,'1',10),(5,1,2,'亚马逊','http://www.amazon.cn/','/u/cms/www/201112/19141012lh2q.gif','','',2,'1',10),(6,1,2,'ihush','http://www.ihush.com/','/u/cms/www/201112/19141255yrfb.gif','','',1,'1',10);
/*!40000 ALTER TABLE `tb_friendlink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_hook`
--

DROP TABLE IF EXISTS `tb_hook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
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
 SET character_set_client = utf8mb4 ;
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
INSERT INTO `tb_hook_module` VALUES (1,8,1),(3,1,1),(3,4,1),(4,1,3),(5,14,5),(6,1,2),(6,4,2),(8,2,1),(8,6,2),(8,19,1),(9,6,1),(10,7,4),(19,14,2),(20,7,7),(21,7,3),(23,21,1),(25,11,1),(25,21,2),(25,25,1),(26,32,1),(27,32,2),(28,32,3),(30,32,4),(31,32,5),(32,32,6),(33,32,7),(34,33,1),(35,33,2),(36,33,3),(37,33,4),(38,36,1),(39,37,1),(40,32,8),(41,20,2),(41,32,9),(42,14,1),(42,32,10),(43,32,11),(44,32,12),(45,32,13),(46,32,15),(47,32,14),(48,32,16),(49,32,17),(50,32,18),(51,32,19),(51,45,1),(53,7,6),(54,14,3),(55,14,4),(55,50,1),(56,6,3),(57,8,2),(58,14,1),(59,7,1),(60,7,2),(61,7,3);
/*!40000 ALTER TABLE `tb_hook_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_log`
--

DROP TABLE IF EXISTS `tb_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `category` int(11) NOT NULL COMMENT '日志类型',
  `log_time` datetime NOT NULL COMMENT '日志时间',
  `ip` varchar(50) DEFAULT NULL COMMENT 'IP地址',
  `url` varchar(255) DEFAULT NULL COMMENT 'URL地址',
  `title` varchar(255) DEFAULT NULL COMMENT '日志标题',
  `content` varchar(255) DEFAULT NULL COMMENT '日志内容',
  PRIMARY KEY (`log_id`),
  KEY `fk_tb_log_site` (`site_id`),
  KEY `fk_tb_log_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='CMS日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_log`
--

LOCK TABLES `tb_log` WRITE;
/*!40000 ALTER TABLE `tb_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_module`
--

DROP TABLE IF EXISTS `tb_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_module` (
  `id_module` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_module`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_module`
--

LOCK TABLES `tb_module` WRITE;
/*!40000 ALTER TABLE `tb_module` DISABLE KEYS */;
INSERT INTO `tb_module` VALUES (1,'homefeatured',1),(2,'gsitemap',1),(3,'cheque',1),(4,'paypal',1),(5,'editorial',1),(6,'bankwire',1),(7,'blockadvertising',1),(8,'blockbestsellers',1),(9,'blockcart',1),(10,'blockcategories',1),(11,'blockcurrencies',1),(12,'blockinfos',1),(13,'blocklanguages',1),(14,'blockmanufacturer',1),(15,'blockmyaccount',1),(16,'blocknewproducts',1),(17,'blockpaymentlogo',1),(18,'blockpermanentlinks',1),(19,'blocksearch',1),(20,'blockspecials',1),(21,'blocktags',1),(22,'blockuserinfo',1),(23,'blockvariouslinks',1),(24,'blockviewed',1),(25,'statsdata',1),(26,'statsvisits',1),(27,'statssales',1),(28,'statsregistrations',1),(30,'statspersonalinfos',1),(31,'statslive',1),(32,'statsequipment',1),(33,'statscatalog',1),(34,'graphvisifire',1),(35,'graphxmlswfcharts',1),(36,'graphgooglechart',1),(37,'graphartichow',1),(38,'statshome',1),(39,'gridextjs',1),(40,'statsbestcustomers',1),(41,'statsorigin',1),(42,'pagesnotfound',1),(43,'sekeywords',1),(44,'statsproduct',1),(45,'statsbestproducts',1),(46,'statsbestcategories',1),(47,'statsbestvouchers',1),(48,'statsbestsuppliers',1),(49,'statscarrier',1),(50,'statsnewsletter',1),(51,'statssearch',1),(52,'blockspecials1',1),(53,'blocknewproducts1',1),(54,'blocklangcurr',1),(55,'wiznav',1),(56,'blocknewproducts2',1),(57,'carouselnc',1),(58,'blockchannels',1),(59,'blockhottopics',1),(60,'blocknews',1),(61,'blockcarousel',1);
/*!40000 ALTER TABLE `tb_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_profile`
--

DROP TABLE IF EXISTS `tb_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
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
-- Table structure for table `tb_role`
--

DROP TABLE IF EXISTS `tb_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `role_name` varchar(100) NOT NULL COMMENT '角色名称',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  `is_super` char(1) NOT NULL DEFAULT '0' COMMENT '拥有所有权限',
  `role_level` int(11) NOT NULL DEFAULT '10' COMMENT '角色等级',
  PRIMARY KEY (`role_id`),
  KEY `fk_tb_role_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='CMS角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_role`
--

LOCK TABLES `tb_role` WRITE;
/*!40000 ALTER TABLE `tb_role` DISABLE KEYS */;
INSERT INTO `tb_role` VALUES (1,NULL,'管理员',10,'1',10),(2,NULL,'测试 ',10,'0',10);
/*!40000 ALTER TABLE `tb_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_role_permission`
--

DROP TABLE IF EXISTS `tb_role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_role_permission` (
  `role_id` int(11) NOT NULL,
  `uri` varchar(100) NOT NULL,
  KEY `fk_tb_permission_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS角色授权表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_role_permission`
--

LOCK TABLES `tb_role_permission` WRITE;
/*!40000 ALTER TABLE `tb_role_permission` DISABLE KEYS */;
INSERT INTO `tb_role_permission` VALUES (2,'topic:v_edit'),(2,'accountPay:v_list'),(2,'content:v_view'),(2,'config:v_content_charge'),(2,'channel:v_list'),(2,'content_cycle:v_list'),(2,'department:depart_main'),(2,'admin_local:v_channels_add'),(2,'log:o_delete_login_success'),(2,'content:v_list'),(2,'data:o_rename'),(2,'admin_global:v_add'),(2,'role:v_tree'),(2,'weixinMessage:v_edit'),(2,'scoregroup:v_edit'),(2,'dictionary:v_list'),(2,'guestbook_ctg:v_list'),(2,'template:v_add'),(2,'type:v_list'),(2,'admin_local:v_edit'),(2,'task:v_add'),(2,'frame:user_right'),(2,'group:v_channels_edit'),(2,'task:v_list'),(2,'resource:v_list'),(2,'friendlink:v_add'),(2,'content:o_check_share'),(2,'flow:pv:v_list'),(2,'acquisition:v_list'),(2,'dictionary:v_add'),(2,'content:v_send_to_weixin'),(2,'log:v_list_login_success'),(2,'content:share_list'),(2,'admin_global:v_depart_add'),(2,'member:v_add'),(2,'account:v_list'),(2,'group:v_add'),(2,'left'),(2,'advertising:v_add'),(2,'content:v_tree_share'),(2,'content:v_tree_radio'),(2,'acquisition:v_history'),(2,'webservice:v_list'),(2,'webserviceAuth:v_edit'),(2,'config:v_login'),(2,'topic:v_add'),(2,'contentBuy:user_order_list'),(2,'message:v_read'),(2,'statistic:comment:v_list'),(2,'log:o_delete_operating_batch'),(2,'lucene:o_create'),(2,'content:v_tree_channels'),(2,'content:v_send_to_topic'),(2,'group:v_channels_add'),(2,'template:v_list'),(2,'directive:module'),(2,'guestbook:v_list'),(2,'contentBuy:commissionStatic'),(2,'data:v_revert'),(2,'weixinMenu:v_edit'),(2,'file:v_list'),(2,'directive:v_list'),(2,'ftp:v_list'),(2,'accountPay:draw_apply_list'),(2,'channel:v_create_path'),(2,'workflow:v_edit'),(2,'right'),(2,'department:v_list'),(2,'frame:user_main'),(2,'advertising:v_edit'),(2,'scoreitem:v_edit'),(2,'guestbook_ctg:v_add'),(2,'workloadstatistic:v_list'),(2,'config:register_item_list'),(2,'store:center'),(2,'admin_global:v_site_edit'),(2,'static:o_index'),(2,'content:v_check'),(2,'scoregroup:v_list'),(2,'statistic:channel:v_list'),(2,'message:v_findUser'),(2,'weixinMessage:v_list'),(2,'content:v_delete'),(2,'config:register_item_add'),(2,'admin_global:v_check_username'),(2,'role:v_add'),(2,'resource:v_left'),(2,'resource:v_edit'),(2,'advertising_space:v_add'),(2,'origin:v_list'),(2,'admin_local:v_check_username'),(2,'frame:maintain_left'),(2,'item:v_add'),(2,'vote_topic:v_add'),(2,'frame:statistic_left'),(2,'frame:content_main'),(2,'keyword:v_list'),(2,'template:o_def_template'),(2,'static:o_content'),(2,'content:v_unpigeonhole'),(2,'tag:v_check_tag'),(2,'flow:area:v_list'),(2,'advertising_space:v_ajax_edit'),(2,'config:o_login'),(2,'guestbook_ctg:v_edit'),(2,'admin_local:v_list'),(2,'weixinMessage:v_add'),(2,'department:v_site_list'),(2,'static:o_channel'),(2,'content:v_share'),(2,'template:v_edit'),(2,'content:v_left'),(2,'content:v_reject'),(2,'comment:v_list'),(2,'content:v_edit'),(2,'template:v_left'),(2,'site:v_checkMaster'),(2,'resource:resource_main'),(2,'config:v_mark_edit'),(2,'guestbook_ctg:v_ajax_edit'),(2,'message:v_add'),(2,'statistic:guestbook:v_list'),(2,'group:v_list'),(2,'workflow:v_list'),(2,'config:register_item_edit'),(2,'admin_local:v_channels_edit'),(2,'admin_local:v_check_email'),(2,'personal:v_checkPwd'),(2,'tag:v_ajax_edit'),(2,'model:v_edit'),(2,'site:site_main'),(2,'workflow:v_add'),(2,'webserviceCallRecord:v_list'),(2,'topic:o_priority'),(2,'config:v_attr_edit'),(2,'site_config:v_company_edit'),(2,'department:v_left'),(2,'department:v_edit'),(2,'frame:maintain_main'),(2,'advertising:v_list'),(2,'content:v_add'),(2,'tag:v_add'),(2,'role:v_edit'),(2,'sensitivity:v_list'),(2,'item:v_list'),(2,'acquisition:v_progress_data'),(2,'ftp:v_add'),(2,'content_reuse:v_list'),(2,'site:v_checkDomain'),(2,'admin_global:v_edit'),(2,'plug:v_list'),(2,'ftp:v_edit'),(2,'site:v_add'),(2,'config:v_member_edit'),(2,'webservice:v_add'),(2,'weixinMessage:o_default_save'),(2,'data:o_export'),(2,'content:v_move'),(2,'guestbook:v_edit'),(2,'site:v_list'),(2,'content:v_tree'),(2,'data:v_listfields'),(2,'group:v_site_contri_list'),(2,'channel:v_tree'),(2,'data:v_rename'),(2,'friendlink:v_list'),(2,'site:v_checkAccessPath'),(2,'content_reuse:v_tree'),(2,'weixinMenu:v_list'),(2,'site_config:v_base_edit'),(2,'personal:o_profile'),(2,'channel:v_check_path'),(2,'dictionary:v_ajax_edit'),(2,'directive:v_getcode'),(2,'role:v_list'),(2,'flow:source:v_list'),(2,'admin_global:v_site_add'),(2,'flow:pages:v_list'),(2,'advertising_space:v_edit'),(2,'content:o_static'),(2,'webserviceAuth:v_add'),(2,'resource:v_tree'),(2,'admin_global:v_check_email'),(2,'frame:config_main'),(2,'index'),(2,'special:v_create_dimensioncode'),(2,'log:v_list_operating'),(2,'template:template_main'),(2,'frame:config_right'),(2,'origin:v_ajax_edit'),(2,'frame:statistic_main'),(2,'channel:v_add'),(2,'member:v_list'),(2,'message:v_countUnreadMsg'),(2,'content:o_delete_share'),(2,'channel:channel_main'),(2,'log:v_list_login_failure'),(2,'log:o_delete_login_failure'),(2,'content_cycle:o_recycle'),(2,'content:o_generateTags'),(2,'plug:v_edit'),(2,'flow:visitor:v_list'),(2,'directive:v_add'),(2,'model:v_add'),(2,'template:v_tree'),(2,'admin_local:v_add'),(2,'guestbook:v_add'),(2,'directive:v_ajax_edit'),(2,'top'),(2,'message:v_list'),(2,'model:v_list'),(2,'webservice:v_edit'),(2,'content:v_copy'),(2,'scoreitem:v_add'),(2,'plug:v_add'),(2,'map'),(2,'static:v_channel'),(2,'vote_topic:v_list'),(2,'admin_global:v_channels_add'),(2,'comment:v_edit'),(2,'config:v_sso_edit'),(2,'frame:expand_right'),(2,'config:v_system_edit'),(2,'site:v_edit'),(2,'storeConfig:v_edit'),(2,'model:v_check_id'),(2,'searchwords:v_ajax_edit'),(2,'site:v_left'),(2,'tag:v_list'),(2,'jobapply:v_view'),(2,'data:v_selectfile'),(2,'department:v_tree'),(2,'content:v_pigeonhole'),(2,'group:v_edit'),(2,'scoregroup:v_add'),(2,'admin_local:v_depart_add'),(2,'static:o_reset_generate'),(2,'static:v_reset_generate'),(2,'config:v_login_edit'),(2,'frame:config_left'),(2,'department:v_check_name'),(2,'weixinMessage:v_default_set'),(2,'jobapply:v_list'),(2,'type:v_edit'),(2,'static:v_index'),(2,'member:v_edit'),(2,'content_reuse:v_left'),(2,'type:v_add'),(2,'main'),(2,'content:v_push'),(2,'statistic:content:v_list'),(2,'directive:v_edit'),(2,'static:o_index_remove'),(2,'topic:v_list'),(2,'log:o_delete_login_success_batch'),(2,'content:v_submit'),(2,'channel:v_left'),(2,'frame:maintain_right'),(2,'admin_global:v_list'),(2,'item:v_edit'),(2,'channel:v_edit'),(2,'contentBuy:user_account_list'),(2,'accountPay:payByWeiXin'),(2,'frame:expand_main'),(2,'log:o_delete_login_failure_batch'),(2,'webserviceAuth:v_list'),(2,'dictionary:v_edit'),(2,'dictionary:v_check_value'),(2,'group:v_site_list'),(2,'admin_global:v_channels_edit'),(2,'tag:v_edit'),(2,'searchwords:v_list'),(2,'acquisition:v_edit'),(2,'content:rank_list'),(2,'weixin:v_edit'),(2,'advertising_space:v_list'),(2,'config:v_firewall'),(2,'friendlink:v_edit'),(2,'content_cycle:o_delete'),(2,'static:v_content'),(2,'content:v_check_records'),(2,'frame:user_left'),(2,'flow:enterpage:v_list'),(2,'template:v_setting'),(2,'department:v_add'),(2,'content:v_view_share'),(2,'acquisition:v_add'),(2,'personal:v_profile'),(2,'special:o_create_dimensioncode'),(2,'message:v_edit'),(2,'type:v_check_id'),(2,'content_reuse:v_main'),(2,'log:o_delete_operating'),(2,'topic:by_channel'),(2,'accountPay:goToPay'),(2,'data:v_listfiles'),(2,'lucene:v_index'),(2,'department:v_channels_list'),(2,'frame:statistic_right'),(2,'scoreitem:v_list'),(2,'accountPay:payLogin'),(2,'content:v_priority'),(2,'vote_topic:v_edit'),(2,'acquisition:v_progress'),(2,'content:v_origin_list'),(2,'friendlink_ctg:v_list'),(2,'weixinMenu:v_add'),(2,'data:v_list'),(2,'member:v_check_username'),(2,'resource:v_add'),(2,'statistic:member:v_list'),(2,'contentBuy:charge_list'),(2,'frame:expand_left'),(2,'site:v_tree'),(2,'task:v_edit');
/*!40000 ALTER TABLE `tb_role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_tab`
--

DROP TABLE IF EXISTS `tb_tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
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
-- Table structure for table `tb_topic`
--

DROP TABLE IF EXISTS `tb_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_topic` (
  `topic_id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_id` int(11) DEFAULT NULL,
  `topic_name` varchar(150) NOT NULL COMMENT '名称',
  `short_name` varchar(150) DEFAULT NULL COMMENT '简称',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `title_img` varchar(100) DEFAULT NULL COMMENT '标题图',
  `content_img` varchar(100) DEFAULT NULL COMMENT '内容图',
  `tpl_content` varchar(100) DEFAULT NULL COMMENT '专题模板',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  `is_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推??',
  `initials` varchar(150) DEFAULT NULL COMMENT '首字母拼音简写',
  PRIMARY KEY (`topic_id`),
  KEY `fk_tb_topic_channel` (`channel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='CMS专题表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_topic`
--

LOCK TABLES `tb_topic` WRITE;
/*!40000 ALTER TABLE `tb_topic` DISABLE KEYS */;
INSERT INTO `tb_topic` VALUES (1,NULL,' 2016饲料英才网络招聘会','饲料英才网络招聘会','','','/u/cms/www/201610/10100951y2xy.jpg','/u/cms/www/201610/11092540p27t.jpg','',11,1,NULL),(2,NULL,'互联网+与传统产业升级之道','互联网+','','','/u/cms/www/201610/10100842hqdk.jpg','/u/cms/www/201610/110911592mxa.jpg','',10,1,NULL),(3,NULL,'2015全国两会','2015全国两会','','','/u/cms/www/201610/101010021q7v.jpg','/u/cms/www/201610/11092148co74.jpg','',10,1,NULL);
/*!40000 ALTER TABLE `tb_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_topic_channel`
--

DROP TABLE IF EXISTS `tb_topic_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_topic_channel` (
  `topic_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL,
  PRIMARY KEY (`topic_id`,`channel_id`),
  KEY `fk_tb_topic_channel_channel` (`channel_id`),
  KEY `fk_tb_topic_channel_topic` (`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_topic_channel`
--

LOCK TABLES `tb_topic_channel` WRITE;
/*!40000 ALTER TABLE `tb_topic_channel` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_topic_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user`
--

DROP TABLE IF EXISTS `tb_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_user` (
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `register_time` datetime NOT NULL COMMENT '注册时间',
  `register_ip` varchar(50) NOT NULL DEFAULT '127.0.0.1' COMMENT '注册IP',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(50) NOT NULL DEFAULT '127.0.0.1' COMMENT '最后登录IP',
  `login_count` int(11) NOT NULL DEFAULT '0' COMMENT '登录次数',
  `rank` int(11) NOT NULL DEFAULT '0' COMMENT '管理员级别',
  `upload_total` bigint(20) NOT NULL DEFAULT '0' COMMENT '上传总大小',
  `upload_size` int(11) NOT NULL DEFAULT '0' COMMENT '上传大小',
  `upload_date` date DEFAULT NULL COMMENT '上传日期',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否管理员',
  `is_self_admin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否只管理自己的数据',
  `statu` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0审核通过  1禁用  2待审核',
  `session_id` varchar(255) DEFAULT NULL,
  `is_viewonly_admin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否只读管理员',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `ak_username` (`username`),
  KEY `fk_tb_user_group` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user`
--

LOCK TABLES `tb_user` WRITE;
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` VALUES (1,1,'admin','aa@qq.com','2011-01-03 00:00:00','127.0.0.1','2017-12-26 18:44:45','192.168.0.158',2281,9,334182,18,'2016-10-13',1,0,0,'EFF9F6ADE387F76F04638010D93E2AFC',0);
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user_role`
--

DROP TABLE IF EXISTS `tb_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_user_role` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`,`user_id`),
  KEY `fk_tb_role_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS用户角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_role`
--

LOCK TABLES `tb_user_role` WRITE;
/*!40000 ALTER TABLE `tb_user_role` DISABLE KEYS */;
INSERT INTO `tb_user_role` VALUES (1,1);
/*!40000 ALTER TABLE `tb_user_role` ENABLE KEYS */;
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

-- Dump completed on 2019-05-29 19:14:52
