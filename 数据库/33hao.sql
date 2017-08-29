-- MySQL dump 10.13  Distrib 5.5.53, for Win32 (AMD64)
--
-- Host: localhost    Database: 33hao
-- ------------------------------------------------------
-- Server version	5.5.53

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
-- Table structure for table `te_activity`
--

DROP TABLE IF EXISTS `te_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_activity` (
  `activity_id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `activity_title` varchar(255) NOT NULL COMMENT '标题',
  `activity_type` enum('1','2') DEFAULT NULL COMMENT '活动类型 1:商品 2:抢购',
  `activity_banner` varchar(255) NOT NULL COMMENT '活动横幅大图片',
  `activity_style` varchar(255) NOT NULL COMMENT '活动页面模板样式标识码',
  `activity_desc` varchar(1000) DEFAULT NULL COMMENT '描述',
  `activity_start_date` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  `activity_end_date` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `activity_sort` tinyint(1) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  `activity_state` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '活动状态 0为关闭 1为开启',
  PRIMARY KEY (`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='活动表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_activity`
--

LOCK TABLES `te_activity` WRITE;
/*!40000 ALTER TABLE `te_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_activity_detail`
--

DROP TABLE IF EXISTS `te_activity_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_activity_detail` (
  `activity_detail_id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `activity_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '活动编号',
  `item_id` int(11) NOT NULL COMMENT '商品或抢购的编号',
  `item_name` varchar(255) NOT NULL COMMENT '商品或抢购名称',
  `store_id` int(11) NOT NULL COMMENT '店铺编号',
  `store_name` varchar(255) NOT NULL COMMENT '店铺名称',
  `activity_detail_state` enum('0','1','2','3') NOT NULL DEFAULT '0' COMMENT '审核状态 0:(默认)待审核 1:通过 2:未通过 3:再次申请',
  `activity_detail_sort` tinyint(1) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  PRIMARY KEY (`activity_detail_id`),
  KEY `activity_id` (`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='活动细节表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_activity_detail`
--

LOCK TABLES `te_activity_detail` WRITE;
/*!40000 ALTER TABLE `te_activity_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_activity_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_address`
--

DROP TABLE IF EXISTS `te_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_address` (
  `address_id` mediumint(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '地址ID',
  `member_id` mediumint(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `true_name` varchar(50) NOT NULL COMMENT '会员姓名',
  `area_id` mediumint(10) unsigned NOT NULL DEFAULT '0' COMMENT '地区ID',
  `city_id` mediumint(9) DEFAULT NULL COMMENT '市级ID',
  `area_info` varchar(255) NOT NULL DEFAULT '' COMMENT '地区内容',
  `address` varchar(255) NOT NULL COMMENT '地址',
  `tel_phone` varchar(20) DEFAULT NULL COMMENT '座机电话',
  `mob_phone` varchar(15) DEFAULT NULL COMMENT '手机电话',
  `is_default` enum('0','1') NOT NULL DEFAULT '0' COMMENT '1默认收货地址',
  `dlyp_id` int(11) DEFAULT '0' COMMENT '自提点ID',
  PRIMARY KEY (`address_id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='买家地址信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_address`
--

LOCK TABLES `te_address` WRITE;
/*!40000 ALTER TABLE `te_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_admin`
--

DROP TABLE IF EXISTS `te_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_admin` (
  `admin_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `admin_name` varchar(20) NOT NULL COMMENT '管理员名称',
  `admin_avatar` varchar(100) DEFAULT NULL COMMENT '管理员头像',
  `admin_password` varchar(32) NOT NULL DEFAULT '' COMMENT '管理员密码',
  `admin_login_time` int(10) NOT NULL DEFAULT '0' COMMENT '登录时间',
  `admin_login_num` int(11) NOT NULL DEFAULT '0' COMMENT '登录次数',
  `admin_is_super` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否超级管理员',
  `admin_gid` smallint(6) DEFAULT '0' COMMENT '权限组ID',
  `admin_quick_link` varchar(400) DEFAULT NULL COMMENT '管理员常用操作',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_admin`
--

LOCK TABLES `te_admin` WRITE;
/*!40000 ALTER TABLE `te_admin` DISABLE KEYS */;
INSERT INTO `te_admin` VALUES (1,'admin',NULL,'8a712ac42cb12f582b07e796fc4fceea',1495643274,2,1,0,NULL);
/*!40000 ALTER TABLE `te_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_admin_log`
--

DROP TABLE IF EXISTS `te_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_admin_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content` varchar(50) NOT NULL COMMENT '操作内容',
  `createtime` int(10) unsigned DEFAULT NULL COMMENT '发生时间',
  `admin_name` char(20) NOT NULL COMMENT '管理员',
  `admin_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `ip` char(15) NOT NULL COMMENT 'IP',
  `url` varchar(50) NOT NULL DEFAULT '' COMMENT '来源URL',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='管理员操作日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_admin_log`
--

LOCK TABLES `te_admin_log` WRITE;
/*!40000 ALTER TABLE `te_admin_log` DISABLE KEYS */;
INSERT INTO `te_admin_log` VALUES (1,'登录',1495643211,'admin',1,'127.0.0.1','login&login'),(2,'清理缓存',1495643262,'admin',1,'127.0.0.1','cache&'),(3,'登录',1495643274,'admin',1,'127.0.0.1','login&login'),(4,'清理缓存',1495643279,'admin',1,'127.0.0.1','cache&');
/*!40000 ALTER TABLE `te_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_adv`
--

DROP TABLE IF EXISTS `te_adv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_adv` (
  `adv_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '广告自增标识编号',
  `ap_id` mediumint(8) unsigned NOT NULL COMMENT '广告位id',
  `adv_title` varchar(255) NOT NULL COMMENT '广告内容描述',
  `adv_content` varchar(1000) NOT NULL COMMENT '广告内容',
  `adv_start_date` int(10) DEFAULT NULL COMMENT '广告开始时间',
  `adv_end_date` int(10) DEFAULT NULL COMMENT '广告结束时间',
  `slide_sort` int(10) unsigned NOT NULL COMMENT '幻灯片排序',
  `member_id` int(11) NOT NULL COMMENT '会员ID',
  `member_name` varchar(50) NOT NULL COMMENT '会员用户名',
  `click_num` int(10) unsigned NOT NULL COMMENT '广告点击率',
  `is_allow` smallint(1) unsigned NOT NULL COMMENT '会员购买的广告是否通过审核0未审核1审核已通过2审核未通过',
  `buy_style` varchar(10) NOT NULL COMMENT '购买方式',
  `goldpay` int(10) unsigned NOT NULL COMMENT '购买所支付的金币',
  PRIMARY KEY (`adv_id`)
) ENGINE=InnoDB AUTO_INCREMENT=937 DEFAULT CHARSET=utf8 COMMENT='广告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_adv`
--

LOCK TABLES `te_adv` WRITE;
/*!40000 ALTER TABLE `te_adv` DISABLE KEYS */;
INSERT INTO `te_adv` VALUES (15,9,'首页通栏','a:2:{s:7:\"adv_pic\";s:21:\"04716538681718544.png\";s:11:\"adv_pic_url\";s:13:\"www.33hao.com\";}',1388505600,1577721600,0,0,'',0,1,'',0),(915,1037,'闲置首页幻灯片1','a:2:{s:13:\"adv_slide_pic\";s:36:\"008a76ccc9449d92b529c2d7dd1ddbb4.png\";s:13:\"adv_slide_url\";s:14:\"www.33hao.com\";}',1325347200,1622476800,1,0,'',0,1,'',0),(916,1037,'闲置首页幻灯片2','a:2:{s:13:\"adv_slide_pic\";s:36:\"fe79d67a363cc0e37ccd65896fea52bd.png\";s:13:\"adv_slide_url\";s:14:\"www.33hao.com\";}',1325347200,1622476800,2,0,'',1,1,'',0),(917,1037,'闲置首页幻灯片3','a:2:{s:13:\"adv_slide_pic\";s:36:\"07085e616fbbd0b2750edb70221ca536.jpg\";s:13:\"adv_slide_url\";s:14:\"www.33hao.com\";}',1325347200,1622476800,3,0,'',1,1,'',0),(918,1037,'闲置首页幻灯片4','a:2:{s:13:\"adv_slide_pic\";s:36:\"42d613f281b21845783e22b2d12ca607.png\";s:13:\"adv_slide_url\";s:14:\"www.33hao.com\";}',1325347200,1622476800,4,0,'',0,1,'',0),(919,1037,'闲置首页幻灯片5','a:2:{s:13:\"adv_slide_pic\";s:36:\"70fa9bcbdd0affe3b4c6832613299f52.png\";s:13:\"adv_slide_url\";s:14:\"www.33hao.com\";}',1325347200,1622476800,5,0,'',0,1,'',0),(920,1038,'闲置横栏广告1','a:2:{s:7:\"adv_pic\";s:36:\"62583bd76a71da66a1259da1d8050b39.jpg\";s:11:\"adv_pic_url\";s:14:\"www.33hao.com\";}',1325347200,1622476800,0,0,'',1,1,'',0),(921,1038,'闲置横栏广告2','a:2:{s:7:\"adv_pic\";s:36:\"d6751364a7e32bcebbfee859e60f62c4.jpg\";s:11:\"adv_pic_url\";s:14:\"www.33hao.com\";}',1325347200,1622476800,0,0,'',2,1,'',0),(931,1043,'闲置首页中部短栏广告1','a:2:{s:7:\"adv_pic\";s:36:\"90189662e6a7a5e8b2f5992485462cdd.png\";s:11:\"adv_pic_url\";s:14:\"www.33hao.com\";}',1328025600,1622476800,0,0,'',1,1,'',0),(932,1044,'闲置首页中部短栏广告2','a:2:{s:7:\"adv_pic\";s:36:\"2cfee9543caaafeccb1b5d69d814a0fe.png\";s:11:\"adv_pic_url\";s:14:\"www.33hao.com\";}',1328025600,1622476800,0,0,'',0,1,'',0),(933,1045,'闲置首页中部短栏广告3','a:2:{s:7:\"adv_pic\";s:36:\"9297917ba3be7b0790d69bb700b93436.jpg\";s:11:\"adv_pic_url\";s:14:\"www.33hao.com\";}',1328025600,1622476800,0,0,'',0,1,'',0),(934,1046,'闲置首页中部短栏广告4','a:2:{s:7:\"adv_pic\";s:36:\"a18f85f81e845a1055726388334df19f.jpg\";s:11:\"adv_pic_url\";s:14:\"www.33hao.com\";}',1328025600,1622476800,0,0,'',0,1,'',0),(935,11,'首页物流自提banner','a:2:{s:7:\"adv_pic\";s:21:\"04876370813599010.gif\";s:11:\"adv_pic_url\";s:41:\"v5.33hao.com/delivery/index.php?act=login\";}',1434211200,1749312000,0,0,'',0,1,'',0),(936,1047,'好商城V5','a:2:{s:7:\"adv_pic\";s:21:\"04891676111561966.png\";s:11:\"adv_pic_url\";s:13:\"www.33hao.com\";}',1435766400,1753891200,0,0,'',0,1,'',0);
/*!40000 ALTER TABLE `te_adv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_adv_position`
--

DROP TABLE IF EXISTS `te_adv_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_adv_position` (
  `ap_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '广告位置id',
  `ap_name` varchar(100) NOT NULL COMMENT '广告位置名',
  `ap_class` smallint(1) unsigned NOT NULL COMMENT '广告类别：0图片1文字2幻灯3Flash',
  `ap_display` smallint(1) unsigned NOT NULL COMMENT '广告展示方式：0幻灯片1多广告展示2单广告展示',
  `is_use` smallint(1) unsigned NOT NULL COMMENT '广告位是否启用：0不启用1启用',
  `ap_width` int(10) NOT NULL COMMENT '广告位宽度',
  `ap_height` int(10) NOT NULL COMMENT '广告位高度',
  `adv_num` int(10) unsigned NOT NULL COMMENT '拥有的广告数',
  `click_num` int(10) unsigned NOT NULL COMMENT '广告位点击率',
  `default_content` varchar(100) NOT NULL COMMENT '广告位默认内容',
  PRIMARY KEY (`ap_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1051 DEFAULT CHARSET=utf8 COMMENT='广告位表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_adv_position`
--

LOCK TABLES `te_adv_position` WRITE;
/*!40000 ALTER TABLE `te_adv_position` DISABLE KEYS */;
INSERT INTO `te_adv_position` VALUES (9,'首页底部通栏图片广告',0,2,1,1200,90,1,0,'04418235791378401.jpg'),(11,'首页中上部banner',0,2,1,1200,100,1,0,'banner.gif'),(35,'积分列表页中部广告位',0,2,1,900,368,0,0,'f448e48ee0deb06707480d46a2a360ae.gif'),(37,'商品列表页左侧广告位',0,1,1,206,300,0,0,'7a4832d109ee46fe7677c1d3c30e067f.gif'),(1037,'闲置幻灯片',2,0,1,240,217,5,0,''),(1038,'闲置首页中部横栏广告',0,1,1,1000,61,2,0,'c861866014826de9d2a85cb9b592007c.jpg'),(1043,'闲置首页中部短栏广告1',0,2,1,240,100,1,0,'e2e3047e7d942c0239752c47a11aeceb.png'),(1044,'闲置首页中部短栏广告2',0,2,1,240,100,1,0,'52fca98cac39ab7071019ab55ca9b520.png'),(1045,'闲置首页中部短栏广告3',0,2,1,240,100,1,0,'41e9b62413294eae29073f4d57fdccb4.jpg'),(1046,'闲置首页中部短栏广告4',0,2,1,240,100,1,0,'4ab14bb8de01d777f45a1c0c29507c15.jpg'),(1047,'首页顶部banner',0,2,1,1200,90,1,0,'04891676111561966.png'),(1048,'顶部logo边广告',0,2,1,100,70,0,0,'05048168915006375.gif'),(1049,'首页右侧广告1',0,1,1,180,194,0,0,'05193052323128277.jpg'),(1050,'首页右侧广告2',0,1,1,180,194,0,0,'05193052753284411.jpg');
/*!40000 ALTER TABLE `te_adv_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_album_class`
--

DROP TABLE IF EXISTS `te_album_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_album_class` (
  `aclass_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '相册id',
  `aclass_name` varchar(100) NOT NULL COMMENT '相册名称',
  `store_id` int(10) unsigned NOT NULL COMMENT '所属店铺id',
  `aclass_des` varchar(255) NOT NULL COMMENT '相册描述',
  `aclass_sort` tinyint(3) unsigned NOT NULL COMMENT '排序',
  `aclass_cover` varchar(255) NOT NULL COMMENT '相册封面',
  `upload_time` int(10) unsigned NOT NULL COMMENT '图片上传时间',
  `is_default` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为默认相册,1代表默认',
  PRIMARY KEY (`aclass_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='相册表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_album_class`
--

LOCK TABLES `te_album_class` WRITE;
/*!40000 ALTER TABLE `te_album_class` DISABLE KEYS */;
INSERT INTO `te_album_class` VALUES (1,'商品库默认相册',0,'商品库使用，请勿删除',255,'',1432544056,1);
/*!40000 ALTER TABLE `te_album_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_album_pic`
--

DROP TABLE IF EXISTS `te_album_pic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_album_pic` (
  `apic_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '相册图片表id',
  `apic_name` varchar(100) NOT NULL COMMENT '图片名称',
  `apic_tag` varchar(255) DEFAULT '' COMMENT '图片标签',
  `aclass_id` int(10) unsigned NOT NULL COMMENT '相册id',
  `apic_cover` varchar(255) NOT NULL COMMENT '图片路径',
  `apic_size` int(10) unsigned NOT NULL COMMENT '图片大小',
  `apic_spec` varchar(100) NOT NULL COMMENT '图片规格',
  `store_id` int(10) unsigned NOT NULL COMMENT '所属店铺id',
  `upload_time` int(10) unsigned NOT NULL COMMENT '图片上传时间',
  PRIMARY KEY (`apic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='相册图片表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_album_pic`
--

LOCK TABLES `te_album_pic` WRITE;
/*!40000 ALTER TABLE `te_album_pic` DISABLE KEYS */;
INSERT INTO `te_album_pic` VALUES (1,'21161DF6BD5E592D3A94A5E3557544FF','',1,'1_04752627678636481.jpg',31775,'355x355',1,1421918767),(2,'53783C85E1E735D11B50B8E6AADBF93B','',1,'1_04752627707766698.png',119422,'346x346',1,1421918770),(3,'C0EF26E1C1A949A552A145320C65DF23','',1,'1_04752627711844438.png',96959,'353x354',1,1421918771),(4,'3B82CCA070CD05DCC9A3C2A81630DEF4','',1,'1_04752627715984525.png',78921,'351x352',1,1421918771),(5,'68AE93347F0D5394B7EFE21A0C8A373F','',1,'1_04752627723007356.png',135521,'352x355',1,1421918772),(6,'D918F56D5F825D6A8D9C8C64AC7CF481','',1,'1_04752627731269795.png',79988,'351x354',1,1421918773),(7,'D9455B27C5AB258315753731F4A65EBE','',1,'1_04752627750479728.png',131574,'348x348',1,1421918774),(8,'A858B04E66C8E5041843F5B3D1D31FC7','',1,'1_04752627769865296.jpg',109093,'708x708',1,1421918776),(9,'7545A11A1387E79B48ED63959297688E','',1,'1_04752627779656765.png',121396,'338x352',1,1421918777),(10,'B1DCBB12C64F675422E8D38C82C21AF4','',1,'1_04752627799921979.jpg',33080,'353x353',1,1421918779),(11,'2281C356CDEA385A184F07A2052272E4','',1,'1_04752627802778337.jpg',27744,'350x355',1,1421918780),(12,'741DBFA4AD9D9A2BBF4E9CEC777D0000','',1,'1_04752627805681085.jpg',19598,'350x356',1,1421918780),(13,'6392478718BEF002ABFCF21FC3A3091A','',1,'1_04752627809660767.jpg',19799,'352x356',1,1421918780),(14,'090AC252A32402FF8FD00BC27550E1B9','',1,'1_04752627813773082.jpg',29187,'351x354',1,1421918781),(15,'EBD42647EFE0107599D93446FC61EC2D','',1,'1_04752627843241680.jpg',26620,'354x354',1,1421918784),(16,'1D9FD4F9D477A5A40150C2CACF9481B8','',1,'1_04752627871532105.png',166345,'353x353',1,1421918786),(17,'9F27851370384CC9E0ED9A8771973FF9','',1,'1_04752627900055146.png',162404,'347x347',1,1421918789),(18,'C7CCFC6BAC471D6594C8A96C04FAC364','',1,'1_04752627931531971.jpg',160319,'888x888',1,1421918793),(19,'87C70FD81710F085D764AD4C68D8C974','',1,'1_04752627958339099.jpg',25604,'342x342',1,1421918795);
/*!40000 ALTER TABLE `te_album_pic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_apiseccode`
--

DROP TABLE IF EXISTS `te_apiseccode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_apiseccode` (
  `sec_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `sec_key` varchar(50) NOT NULL COMMENT '验证码标识',
  `sec_val` varchar(100) NOT NULL COMMENT '验证码值',
  `sec_addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`sec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_apiseccode`
--

LOCK TABLES `te_apiseccode` WRITE;
/*!40000 ALTER TABLE `te_apiseccode` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_apiseccode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_area`
--

DROP TABLE IF EXISTS `te_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_area` (
  `area_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '索引ID',
  `area_name` varchar(50) NOT NULL COMMENT '地区名称',
  `area_parent_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '地区父ID',
  `area_sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `area_deep` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '地区深度，从1开始',
  `area_region` varchar(3) DEFAULT NULL COMMENT '大区名称',
  PRIMARY KEY (`area_id`),
  KEY `area_parent_id` (`area_parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45056 DEFAULT CHARSET=utf8 COMMENT='地区表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_area`
--

LOCK TABLES `te_area` WRITE;
/*!40000 ALTER TABLE `te_area` DISABLE KEYS */;
INSERT INTO `te_area` VALUES (1,'北京',0,0,1,'华北'),(2,'天津',0,0,1,'华北'),(3,'河北',0,0,1,'华北'),(4,'山西',0,0,1,'华北'),(5,'内蒙古',0,0,1,'华北'),(6,'辽宁',0,0,1,'东北'),(7,'吉林',0,0,1,'东北'),(8,'黑龙江',0,0,1,'东北'),(9,'上海',0,0,1,'华东'),(10,'江苏',0,0,1,'华东'),(11,'浙江',0,0,1,'华东'),(12,'安徽',0,0,1,'华东'),(13,'福建',0,0,1,'华南'),(14,'江西',0,0,1,'华东'),(15,'山东',0,0,1,'华东'),(16,'河南',0,0,1,'华中'),(17,'湖北',0,0,1,'华中'),(18,'湖南',0,0,1,'华中'),(19,'广东',0,0,1,'华南'),(20,'广西',0,0,1,'华南'),(21,'海南',0,0,1,'华南'),(22,'重庆',0,0,1,'西南'),(23,'四川',0,0,1,'西南'),(24,'贵州',0,0,1,'西南'),(25,'云南',0,0,1,'西南'),(26,'西藏',0,0,1,'西南'),(27,'陕西',0,0,1,'西北'),(28,'甘肃',0,0,1,'西北'),(29,'青海',0,0,1,'西北'),(30,'宁夏',0,0,1,'西北'),(31,'新疆',0,0,1,'西北'),(32,'台湾',0,0,1,'港澳台'),(33,'香港',0,0,1,'港澳台'),(34,'澳门',0,0,1,'港澳台'),(35,'海外',0,0,1,'海外'),(36,'北京市',1,0,2,NULL),(37,'东城区',36,0,3,NULL),(38,'西城区',36,0,3,NULL),(39,'上海市',9,0,2,NULL),(40,'天津市',2,0,2,NULL),(41,'朝阳区',36,0,3,NULL),(42,'丰台区',36,0,3,NULL),(43,'石景山区',36,0,3,NULL),(44,'海淀区',36,0,3,NULL),(45,'门头沟区',36,0,3,NULL),(46,'房山区',36,0,3,NULL),(47,'通州区',36,0,3,NULL),(48,'顺义区',36,0,3,NULL),(49,'昌平区',36,0,3,NULL),(50,'大兴区',36,0,3,NULL),(51,'怀柔区',36,0,3,NULL),(52,'平谷区',36,0,3,NULL),(53,'密云县',36,0,3,NULL),(54,'延庆县',36,0,3,NULL),(55,'和平区',40,0,3,NULL),(56,'河东区',40,0,3,NULL),(57,'河西区',40,0,3,NULL),(58,'南开区',40,0,3,NULL),(59,'河北区',40,0,3,NULL),(60,'红桥区',40,0,3,NULL),(61,'塘沽区',40,0,3,NULL),(62,'重庆市',22,0,2,NULL),(64,'东丽区',40,0,3,NULL),(65,'西青区',40,0,3,NULL),(66,'津南区',40,0,3,NULL),(67,'北辰区',40,0,3,NULL),(68,'武清区',40,0,3,NULL),(69,'宝坻区',40,0,3,NULL),(70,'宁河县',40,0,3,NULL),(71,'静海县',40,0,3,NULL),(72,'蓟县',40,0,3,NULL),(73,'石家庄市',3,0,2,NULL),(74,'唐山市',3,0,2,NULL),(75,'秦皇岛市',3,0,2,NULL),(76,'邯郸市',3,0,2,NULL),(77,'邢台市',3,0,2,NULL),(78,'保定市',3,0,2,NULL),(79,'张家口市',3,0,2,NULL),(80,'承德市',3,0,2,NULL),(81,'衡水市',3,0,2,NULL),(82,'廊坊市',3,0,2,NULL),(83,'沧州市',3,0,2,NULL),(84,'太原市',4,0,2,NULL),(85,'大同市',4,0,2,NULL),(86,'阳泉市',4,0,2,NULL),(87,'长治市',4,0,2,NULL),(88,'晋城市',4,0,2,NULL),(89,'朔州市',4,0,2,NULL),(90,'晋中市',4,0,2,NULL),(91,'运城市',4,0,2,NULL),(92,'忻州市',4,0,2,NULL),(93,'临汾市',4,0,2,NULL),(94,'吕梁市',4,0,2,NULL),(95,'呼和浩特市',5,0,2,NULL),(96,'包头市',5,0,2,NULL),(97,'乌海市',5,0,2,NULL),(98,'赤峰市',5,0,2,NULL),(99,'通辽市',5,0,2,NULL),(100,'鄂尔多斯市',5,0,2,NULL),(101,'呼伦贝尔市',5,0,2,NULL),(102,'巴彦淖尔市',5,0,2,NULL),(103,'乌兰察布市',5,0,2,NULL),(104,'兴安盟',5,0,2,NULL),(105,'锡林郭勒盟',5,0,2,NULL),(106,'阿拉善盟',5,0,2,NULL),(107,'沈阳市',6,0,2,NULL),(108,'大连市',6,0,2,NULL),(109,'鞍山市',6,0,2,NULL),(110,'抚顺市',6,0,2,NULL),(111,'本溪市',6,0,2,NULL),(112,'丹东市',6,0,2,NULL),(113,'锦州市',6,0,2,NULL),(114,'营口市',6,0,2,NULL),(115,'阜新市',6,0,2,NULL),(116,'辽阳市',6,0,2,NULL),(117,'盘锦市',6,0,2,NULL),(118,'铁岭市',6,0,2,NULL),(119,'朝阳市',6,0,2,NULL),(120,'葫芦岛市',6,0,2,NULL),(121,'长春市',7,0,2,NULL),(122,'吉林市',7,0,2,NULL),(123,'四平市',7,0,2,NULL),(124,'辽源市',7,0,2,NULL),(125,'通化市',7,0,2,NULL),(126,'白山市',7,0,2,NULL),(127,'松原市',7,0,2,NULL),(128,'白城市',7,0,2,NULL),(129,'延边朝鲜族自治州',7,0,2,NULL),(130,'哈尔滨市',8,0,2,NULL),(131,'齐齐哈尔市',8,0,2,NULL),(132,'鸡西市',8,0,2,NULL),(133,'鹤岗市',8,0,2,NULL),(134,'双鸭山市',8,0,2,NULL),(135,'大庆市',8,0,2,NULL),(136,'伊春市',8,0,2,NULL),(137,'佳木斯市',8,0,2,NULL),(138,'七台河市',8,0,2,NULL),(139,'牡丹江市',8,0,2,NULL),(140,'黑河市',8,0,2,NULL),(141,'绥化市',8,0,2,NULL),(142,'大兴安岭地区',8,0,2,NULL),(143,'黄浦区',39,0,3,NULL),(144,'卢湾区',39,0,3,NULL),(145,'徐汇区',39,0,3,NULL),(146,'长宁区',39,0,3,NULL),(147,'静安区',39,0,3,NULL),(148,'普陀区',39,0,3,NULL),(149,'闸北区',39,0,3,NULL),(150,'虹口区',39,0,3,NULL),(151,'杨浦区',39,0,3,NULL),(152,'闵行区',39,0,3,NULL),(153,'宝山区',39,0,3,NULL),(154,'嘉定区',39,0,3,NULL),(155,'浦东新区',39,0,3,NULL),(156,'金山区',39,0,3,NULL),(157,'松江区',39,0,3,NULL),(158,'青浦区',39,0,3,NULL),(159,'南汇区',39,0,3,NULL),(160,'奉贤区',39,0,3,NULL),(161,'崇明县',39,0,3,NULL),(162,'南京市',10,0,2,NULL),(163,'无锡市',10,0,2,NULL),(164,'徐州市',10,0,2,NULL),(165,'常州市',10,0,2,NULL),(166,'苏州市',10,0,2,NULL),(167,'南通市',10,0,2,NULL),(168,'连云港市',10,0,2,NULL),(169,'淮安市',10,0,2,NULL),(170,'盐城市',10,0,2,NULL),(171,'扬州市',10,0,2,NULL),(172,'镇江市',10,0,2,NULL),(173,'泰州市',10,0,2,NULL),(174,'宿迁市',10,0,2,NULL),(175,'杭州市',11,0,2,NULL),(176,'宁波市',11,0,2,NULL),(177,'温州市',11,0,2,NULL),(178,'嘉兴市',11,0,2,NULL),(179,'湖州市',11,0,2,NULL),(180,'绍兴市',11,0,2,NULL),(181,'舟山市',11,0,2,NULL),(182,'衢州市',11,0,2,NULL),(183,'金华市',11,0,2,NULL),(184,'台州市',11,0,2,NULL),(185,'丽水市',11,0,2,NULL),(186,'合肥市',12,0,2,NULL),(187,'芜湖市',12,0,2,NULL),(188,'蚌埠市',12,0,2,NULL),(189,'淮南市',12,0,2,NULL),(190,'马鞍山市',12,0,2,NULL),(191,'淮北市',12,0,2,NULL),(192,'铜陵市',12,0,2,NULL),(193,'安庆市',12,0,2,NULL),(194,'黄山市',12,0,2,NULL),(195,'滁州市',12,0,2,NULL),(196,'阜阳市',12,0,2,NULL),(197,'宿州市',12,0,2,NULL),(198,'巢湖市',12,0,2,NULL),(199,'六安市',12,0,2,NULL),(200,'亳州市',12,0,2,NULL),(201,'池州市',12,0,2,NULL),(202,'宣城市',12,0,2,NULL),(203,'福州市',13,0,2,NULL),(204,'厦门市',13,0,2,NULL),(205,'莆田市',13,0,2,NULL),(206,'三明市',13,0,2,NULL),(207,'泉州市',13,0,2,NULL),(208,'漳州市',13,0,2,NULL),(209,'南平市',13,0,2,NULL),(210,'龙岩市',13,0,2,NULL),(211,'宁德市',13,0,2,NULL),(212,'南昌市',14,0,2,NULL),(213,'景德镇市',14,0,2,NULL),(214,'萍乡市',14,0,2,NULL),(215,'九江市',14,0,2,NULL),(216,'新余市',14,0,2,NULL),(217,'鹰潭市',14,0,2,NULL),(218,'赣州市',14,0,2,NULL),(219,'吉安市',14,0,2,NULL),(220,'宜春市',14,0,2,NULL),(221,'抚州市',14,0,2,NULL),(222,'上饶市',14,0,2,NULL),(223,'济南市',15,0,2,NULL),(224,'青岛市',15,0,2,NULL),(225,'淄博市',15,0,2,NULL),(226,'枣庄市',15,0,2,NULL),(227,'东营市',15,0,2,NULL),(228,'烟台市',15,0,2,NULL),(229,'潍坊市',15,0,2,NULL),(230,'济宁市',15,0,2,NULL),(231,'泰安市',15,0,2,NULL),(232,'威海市',15,0,2,NULL),(233,'日照市',15,0,2,NULL),(234,'莱芜市',15,0,2,NULL),(235,'临沂市',15,0,2,NULL),(236,'德州市',15,0,2,NULL),(237,'聊城市',15,0,2,NULL),(238,'滨州市',15,0,2,NULL),(239,'菏泽市',15,0,2,NULL),(240,'郑州市',16,0,2,NULL),(241,'开封市',16,0,2,NULL),(242,'洛阳市',16,0,2,NULL),(243,'平顶山市',16,0,2,NULL),(244,'安阳市',16,0,2,NULL),(245,'鹤壁市',16,0,2,NULL),(246,'新乡市',16,0,2,NULL),(247,'焦作市',16,0,2,NULL),(248,'濮阳市',16,0,2,NULL),(249,'许昌市',16,0,2,NULL),(250,'漯河市',16,0,2,NULL),(251,'三门峡市',16,0,2,NULL),(252,'南阳市',16,0,2,NULL),(253,'商丘市',16,0,2,NULL),(254,'信阳市',16,0,2,NULL),(255,'周口市',16,0,2,NULL),(256,'驻马店市',16,0,2,NULL),(257,'济源市',16,0,2,NULL),(258,'武汉市',17,0,2,NULL),(259,'黄石市',17,0,2,NULL),(260,'十堰市',17,0,2,NULL),(261,'宜昌市',17,0,2,NULL),(262,'襄樊市',17,0,2,NULL),(263,'鄂州市',17,0,2,NULL),(264,'荆门市',17,0,2,NULL),(265,'孝感市',17,0,2,NULL),(266,'荆州市',17,0,2,NULL),(267,'黄冈市',17,0,2,NULL),(268,'咸宁市',17,0,2,NULL),(269,'随州市',17,0,2,NULL),(270,'恩施土家族苗族自治州',17,0,2,NULL),(271,'仙桃市',17,0,2,NULL),(272,'潜江市',17,0,2,NULL),(273,'天门市',17,0,2,NULL),(274,'神农架林区',17,0,2,NULL),(275,'长沙市',18,0,2,NULL),(276,'株洲市',18,0,2,NULL),(277,'湘潭市',18,0,2,NULL),(278,'衡阳市',18,0,2,NULL),(279,'邵阳市',18,0,2,NULL),(280,'岳阳市',18,0,2,NULL),(281,'常德市',18,0,2,NULL),(282,'张家界市',18,0,2,NULL),(283,'益阳市',18,0,2,NULL),(284,'郴州市',18,0,2,NULL),(285,'永州市',18,0,2,NULL),(286,'怀化市',18,0,2,NULL),(287,'娄底市',18,0,2,NULL),(288,'湘西土家族苗族自治州',18,0,2,NULL),(289,'广州市',19,0,2,NULL),(290,'韶关市',19,0,2,NULL),(291,'深圳市',19,0,2,NULL),(292,'珠海市',19,0,2,NULL),(293,'汕头市',19,0,2,NULL),(294,'佛山市',19,0,2,NULL),(295,'江门市',19,0,2,NULL),(296,'湛江市',19,0,2,NULL),(297,'茂名市',19,0,2,NULL),(298,'肇庆市',19,0,2,NULL),(299,'惠州市',19,0,2,NULL),(300,'梅州市',19,0,2,NULL),(301,'汕尾市',19,0,2,NULL),(302,'河源市',19,0,2,NULL),(303,'阳江市',19,0,2,NULL),(304,'清远市',19,0,2,NULL),(305,'东莞市',19,0,2,NULL),(306,'中山市',19,0,2,NULL),(307,'潮州市',19,0,2,NULL),(308,'揭阳市',19,0,2,NULL),(309,'云浮市',19,0,2,NULL),(310,'南宁市',20,0,2,NULL),(311,'柳州市',20,0,2,NULL),(312,'桂林市',20,0,2,NULL),(313,'梧州市',20,0,2,NULL),(314,'北海市',20,0,2,NULL),(315,'防城港市',20,0,2,NULL),(316,'钦州市',20,0,2,NULL),(317,'贵港市',20,0,2,NULL),(318,'玉林市',20,0,2,NULL),(319,'百色市',20,0,2,NULL),(320,'贺州市',20,0,2,NULL),(321,'河池市',20,0,2,NULL),(322,'来宾市',20,0,2,NULL),(323,'崇左市',20,0,2,NULL),(324,'海口市',21,0,2,NULL),(325,'三亚市',21,0,2,NULL),(326,'五指山市',21,0,2,NULL),(327,'琼海市',21,0,2,NULL),(328,'儋州市',21,0,2,NULL),(329,'文昌市',21,0,2,NULL),(330,'万宁市',21,0,2,NULL),(331,'东方市',21,0,2,NULL),(332,'定安县',21,0,2,NULL),(333,'屯昌县',21,0,2,NULL),(334,'澄迈县',21,0,2,NULL),(335,'临高县',21,0,2,NULL),(336,'白沙黎族自治县',21,0,2,NULL),(337,'昌江黎族自治县',21,0,2,NULL),(338,'乐东黎族自治县',21,0,2,NULL),(339,'陵水黎族自治县',21,0,2,NULL),(340,'保亭黎族苗族自治县',21,0,2,NULL),(341,'琼中黎族苗族自治县',21,0,2,NULL),(342,'西沙群岛',21,0,2,NULL),(343,'南沙群岛',21,0,2,NULL),(344,'中沙群岛的岛礁及其海域',21,0,2,NULL),(345,'万州区',62,0,3,NULL),(346,'涪陵区',62,0,3,NULL),(347,'渝中区',62,0,3,NULL),(348,'大渡口区',62,0,3,NULL),(349,'江北区',62,0,3,NULL),(350,'沙坪坝区',62,0,3,NULL),(351,'九龙坡区',62,0,3,NULL),(352,'南岸区',62,0,3,NULL),(353,'北碚区',62,0,3,NULL),(354,'双桥区',62,0,3,NULL),(355,'万盛区',62,0,3,NULL),(356,'渝北区',62,0,3,NULL),(357,'巴南区',62,0,3,NULL),(358,'黔江区',62,0,3,NULL),(359,'长寿区',62,0,3,NULL),(360,'綦江县',62,0,3,NULL),(361,'潼南县',62,0,3,NULL),(362,'铜梁县',62,0,3,NULL),(363,'大足县',62,0,3,NULL),(364,'荣昌县',62,0,3,NULL),(365,'璧山县',62,0,3,NULL),(366,'梁平县',62,0,3,NULL),(367,'城口县',62,0,3,NULL),(368,'丰都县',62,0,3,NULL),(369,'垫江县',62,0,3,NULL),(370,'武隆县',62,0,3,NULL),(371,'忠县',62,0,3,NULL),(372,'开县',62,0,3,NULL),(373,'云阳县',62,0,3,NULL),(374,'奉节县',62,0,3,NULL),(375,'巫山县',62,0,3,NULL),(376,'巫溪县',62,0,3,NULL),(377,'石柱土家族自治县',62,0,3,NULL),(378,'秀山土家族苗族自治县',62,0,3,NULL),(379,'酉阳土家族苗族自治县',62,0,3,NULL),(380,'彭水苗族土家族自治县',62,0,3,NULL),(381,'江津市',62,0,3,NULL),(382,'合川市',62,0,3,NULL),(383,'永川市',62,0,3,NULL),(384,'南川市',62,0,3,NULL),(385,'成都市',23,0,2,NULL),(386,'自贡市',23,0,2,NULL),(387,'攀枝花市',23,0,2,NULL),(388,'泸州市',23,0,2,NULL),(389,'德阳市',23,0,2,NULL),(390,'绵阳市',23,0,2,NULL),(391,'广元市',23,0,2,NULL),(392,'遂宁市',23,0,2,NULL),(393,'内江市',23,0,2,NULL),(394,'乐山市',23,0,2,NULL),(395,'南充市',23,0,2,NULL),(396,'眉山市',23,0,2,NULL),(397,'宜宾市',23,0,2,NULL),(398,'广安市',23,0,2,NULL),(399,'达州市',23,0,2,NULL),(400,'雅安市',23,0,2,NULL),(401,'巴中市',23,0,2,NULL),(402,'资阳市',23,0,2,NULL),(403,'阿坝藏族羌族自治州',23,0,2,NULL),(404,'甘孜藏族自治州',23,0,2,NULL),(405,'凉山彝族自治州',23,0,2,NULL),(406,'贵阳市',24,0,2,NULL),(407,'六盘水市',24,0,2,NULL),(408,'遵义市',24,0,2,NULL),(409,'安顺市',24,0,2,NULL),(410,'铜仁地区',24,0,2,NULL),(411,'黔西南布依族苗族自治州',24,0,2,NULL),(412,'毕节地区',24,0,2,NULL),(413,'黔东南苗族侗族自治州',24,0,2,NULL),(414,'黔南布依族苗族自治州',24,0,2,NULL),(415,'昆明市',25,0,2,NULL),(416,'曲靖市',25,0,2,NULL),(417,'玉溪市',25,0,2,NULL),(418,'保山市',25,0,2,NULL),(419,'昭通市',25,0,2,NULL),(420,'丽江市',25,0,2,NULL),(421,'思茅市',25,0,2,NULL),(422,'临沧市',25,0,2,NULL),(423,'楚雄彝族自治州',25,0,2,NULL),(424,'红河哈尼族彝族自治州',25,0,2,NULL),(425,'文山壮族苗族自治州',25,0,2,NULL),(426,'西双版纳傣族自治州',25,0,2,NULL),(427,'大理白族自治州',25,0,2,NULL),(428,'德宏傣族景颇族自治州',25,0,2,NULL),(429,'怒江傈僳族自治州',25,0,2,NULL),(430,'迪庆藏族自治州',25,0,2,NULL),(431,'拉萨市',26,0,2,NULL),(432,'昌都地区',26,0,2,NULL),(433,'山南地区',26,0,2,NULL),(434,'日喀则地区',26,0,2,NULL),(435,'那曲地区',26,0,2,NULL),(436,'阿里地区',26,0,2,NULL),(437,'林芝地区',26,0,2,NULL),(438,'西安市',27,0,2,NULL),(439,'铜川市',27,0,2,NULL),(440,'宝鸡市',27,0,2,NULL),(441,'咸阳市',27,0,2,NULL),(442,'渭南市',27,0,2,NULL),(443,'延安市',27,0,2,NULL),(444,'汉中市',27,0,2,NULL),(445,'榆林市',27,0,2,NULL),(446,'安康市',27,0,2,NULL),(447,'商洛市',27,0,2,NULL),(448,'兰州市',28,0,2,NULL),(449,'嘉峪关市',28,0,2,NULL),(450,'金昌市',28,0,2,NULL),(451,'白银市',28,0,2,NULL),(452,'天水市',28,0,2,NULL),(453,'武威市',28,0,2,NULL),(454,'张掖市',28,0,2,NULL),(455,'平凉市',28,0,2,NULL),(456,'酒泉市',28,0,2,NULL),(457,'庆阳市',28,0,2,NULL),(458,'定西市',28,0,2,NULL),(459,'陇南市',28,0,2,NULL),(460,'临夏回族自治州',28,0,2,NULL),(461,'甘南藏族自治州',28,0,2,NULL),(462,'西宁市',29,0,2,NULL),(463,'海东地区',29,0,2,NULL),(464,'海北藏族自治州',29,0,2,NULL),(465,'黄南藏族自治州',29,0,2,NULL),(466,'海南藏族自治州',29,0,2,NULL),(467,'果洛藏族自治州',29,0,2,NULL),(468,'玉树藏族自治州',29,0,2,NULL),(469,'海西蒙古族藏族自治州',29,0,2,NULL),(470,'银川市',30,0,2,NULL),(471,'石嘴山市',30,0,2,NULL),(472,'吴忠市',30,0,2,NULL),(473,'固原市',30,0,2,NULL),(474,'中卫市',30,0,2,NULL),(475,'乌鲁木齐市',31,0,2,NULL),(476,'克拉玛依市',31,0,2,NULL),(477,'吐鲁番地区',31,0,2,NULL),(478,'哈密地区',31,0,2,NULL),(479,'昌吉回族自治州',31,0,2,NULL),(480,'博尔塔拉蒙古自治州',31,0,2,NULL),(481,'巴音郭楞蒙古自治州',31,0,2,NULL),(482,'阿克苏地区',31,0,2,NULL),(483,'克孜勒苏柯尔克孜自治州',31,0,2,NULL),(484,'喀什地区',31,0,2,NULL),(485,'和田地区',31,0,2,NULL),(486,'伊犁哈萨克自治州',31,0,2,NULL),(487,'塔城地区',31,0,2,NULL),(488,'阿勒泰地区',31,0,2,NULL),(489,'石河子市',31,0,2,NULL),(490,'阿拉尔市',31,0,2,NULL),(491,'图木舒克市',31,0,2,NULL),(492,'五家渠市',31,0,2,NULL),(493,'台北市',32,0,2,NULL),(494,'高雄市',32,0,2,NULL),(495,'基隆市',32,0,2,NULL),(496,'台中市',32,0,2,NULL),(497,'台南市',32,0,2,NULL),(498,'新竹市',32,0,2,NULL),(499,'嘉义市',32,0,2,NULL),(500,'台北县',32,0,2,NULL),(501,'宜兰县',32,0,2,NULL),(502,'桃园县',32,0,2,NULL),(503,'新竹县',32,0,2,NULL),(504,'苗栗县',32,0,2,NULL),(505,'台中县',32,0,2,NULL),(506,'彰化县',32,0,2,NULL),(507,'南投县',32,0,2,NULL),(508,'云林县',32,0,2,NULL),(509,'嘉义县',32,0,2,NULL),(510,'台南县',32,0,2,NULL),(511,'高雄县',32,0,2,NULL),(512,'屏东县',32,0,2,NULL),(513,'澎湖县',32,0,2,NULL),(514,'台东县',32,0,2,NULL),(515,'花莲县',32,0,2,NULL),(516,'中西区',33,0,2,NULL),(517,'东区',33,0,2,NULL),(518,'九龙城区',33,0,2,NULL),(519,'观塘区',33,0,2,NULL),(520,'南区',33,0,2,NULL),(521,'深水埗区',33,0,2,NULL),(522,'黄大仙区',33,0,2,NULL),(523,'湾仔区',33,0,2,NULL),(524,'油尖旺区',33,0,2,NULL),(525,'离岛区',33,0,2,NULL),(526,'葵青区',33,0,2,NULL),(527,'北区',33,0,2,NULL),(528,'西贡区',33,0,2,NULL),(529,'沙田区',33,0,2,NULL),(530,'屯门区',33,0,2,NULL),(531,'大埔区',33,0,2,NULL),(532,'荃湾区',33,0,2,NULL),(533,'元朗区',33,0,2,NULL),(534,'澳门特别行政区',34,0,2,NULL),(535,'美国',45055,0,3,NULL),(536,'加拿大',45055,0,3,NULL),(537,'澳大利亚',45055,0,3,NULL),(538,'新西兰',45055,0,3,NULL),(539,'英国',45055,0,3,NULL),(540,'法国',45055,0,3,NULL),(541,'德国',45055,0,3,NULL),(542,'捷克',45055,0,3,NULL),(543,'荷兰',45055,0,3,NULL),(544,'瑞士',45055,0,3,NULL),(545,'希腊',45055,0,3,NULL),(546,'挪威',45055,0,3,NULL),(547,'瑞典',45055,0,3,NULL),(548,'丹麦',45055,0,3,NULL),(549,'芬兰',45055,0,3,NULL),(550,'爱尔兰',45055,0,3,NULL),(551,'奥地利',45055,0,3,NULL),(552,'意大利',45055,0,3,NULL),(553,'乌克兰',45055,0,3,NULL),(554,'俄罗斯',45055,0,3,NULL),(555,'西班牙',45055,0,3,NULL),(556,'韩国',45055,0,3,NULL),(557,'新加坡',45055,0,3,NULL),(558,'马来西亚',45055,0,3,NULL),(559,'印度',45055,0,3,NULL),(560,'泰国',45055,0,3,NULL),(561,'日本',45055,0,3,NULL),(562,'巴西',45055,0,3,NULL),(563,'阿根廷',45055,0,3,NULL),(564,'南非',45055,0,3,NULL),(565,'埃及',45055,0,3,NULL),(566,'其他',36,0,3,NULL),(1126,'井陉县',73,0,3,NULL),(1127,'井陉矿区',73,0,3,NULL),(1128,'元氏县',73,0,3,NULL),(1129,'平山县',73,0,3,NULL),(1130,'新乐市',73,0,3,NULL),(1131,'新华区',73,0,3,NULL),(1132,'无极县',73,0,3,NULL),(1133,'晋州市',73,0,3,NULL),(1134,'栾城县',73,0,3,NULL),(1135,'桥东区',73,0,3,NULL),(1136,'桥西区',73,0,3,NULL),(1137,'正定县',73,0,3,NULL),(1138,'深泽县',73,0,3,NULL),(1139,'灵寿县',73,0,3,NULL),(1140,'藁城市',73,0,3,NULL),(1141,'行唐县',73,0,3,NULL),(1142,'裕华区',73,0,3,NULL),(1143,'赞皇县',73,0,3,NULL),(1144,'赵县',73,0,3,NULL),(1145,'辛集市',73,0,3,NULL),(1146,'长安区',73,0,3,NULL),(1147,'高邑县',73,0,3,NULL),(1148,'鹿泉市',73,0,3,NULL),(1149,'丰南区',74,0,3,NULL),(1150,'丰润区',74,0,3,NULL),(1151,'乐亭县',74,0,3,NULL),(1152,'古冶区',74,0,3,NULL),(1153,'唐海县',74,0,3,NULL),(1154,'开平区',74,0,3,NULL),(1155,'滦南县',74,0,3,NULL),(1156,'滦县',74,0,3,NULL),(1157,'玉田县',74,0,3,NULL),(1158,'路北区',74,0,3,NULL),(1159,'路南区',74,0,3,NULL),(1160,'迁安市',74,0,3,NULL),(1161,'迁西县',74,0,3,NULL),(1162,'遵化市',74,0,3,NULL),(1163,'北戴河区',75,0,3,NULL),(1164,'卢龙县',75,0,3,NULL),(1165,'山海关区',75,0,3,NULL),(1166,'抚宁县',75,0,3,NULL),(1167,'昌黎县',75,0,3,NULL),(1168,'海港区',75,0,3,NULL),(1169,'青龙满族自治县',75,0,3,NULL),(1170,'丛台区',76,0,3,NULL),(1171,'临漳县',76,0,3,NULL),(1172,'复兴区',76,0,3,NULL),(1173,'大名县',76,0,3,NULL),(1174,'峰峰矿区',76,0,3,NULL),(1175,'广平县',76,0,3,NULL),(1176,'成安县',76,0,3,NULL),(1177,'曲周县',76,0,3,NULL),(1178,'武安市',76,0,3,NULL),(1179,'永年县',76,0,3,NULL),(1180,'涉县',76,0,3,NULL),(1181,'磁县',76,0,3,NULL),(1182,'肥乡县',76,0,3,NULL),(1183,'邯山区',76,0,3,NULL),(1184,'邯郸县',76,0,3,NULL),(1185,'邱县',76,0,3,NULL),(1186,'馆陶县',76,0,3,NULL),(1187,'魏县',76,0,3,NULL),(1188,'鸡泽县',76,0,3,NULL),(1189,'临城县',77,0,3,NULL),(1190,'临西县',77,0,3,NULL),(1191,'任县',77,0,3,NULL),(1192,'内丘县',77,0,3,NULL),(1193,'南和县',77,0,3,NULL),(1194,'南宫市',77,0,3,NULL),(1195,'威县',77,0,3,NULL),(1196,'宁晋县',77,0,3,NULL),(1197,'巨鹿县',77,0,3,NULL),(1198,'平乡县',77,0,3,NULL),(1199,'广宗县',77,0,3,NULL),(1200,'新河县',77,0,3,NULL),(1201,'柏乡县',77,0,3,NULL),(1202,'桥东区',77,0,3,NULL),(1203,'桥西区',77,0,3,NULL),(1204,'沙河市',77,0,3,NULL),(1205,'清河县',77,0,3,NULL),(1206,'邢台县',77,0,3,NULL),(1207,'隆尧县',77,0,3,NULL),(1208,'北市区',78,0,3,NULL),(1209,'南市区',78,0,3,NULL),(1210,'博野县',78,0,3,NULL),(1211,'唐县',78,0,3,NULL),(1212,'安国市',78,0,3,NULL),(1213,'安新县',78,0,3,NULL),(1214,'定兴县',78,0,3,NULL),(1215,'定州市',78,0,3,NULL),(1216,'容城县',78,0,3,NULL),(1217,'徐水县',78,0,3,NULL),(1218,'新市区',78,0,3,NULL),(1219,'易县',78,0,3,NULL),(1220,'曲阳县',78,0,3,NULL),(1221,'望都县',78,0,3,NULL),(1222,'涞水县',78,0,3,NULL),(1223,'涞源县',78,0,3,NULL),(1224,'涿州市',78,0,3,NULL),(1225,'清苑县',78,0,3,NULL),(1226,'满城县',78,0,3,NULL),(1227,'蠡县',78,0,3,NULL),(1228,'阜平县',78,0,3,NULL),(1229,'雄县',78,0,3,NULL),(1230,'顺平县',78,0,3,NULL),(1231,'高碑店市',78,0,3,NULL),(1232,'高阳县',78,0,3,NULL),(1233,'万全县',79,0,3,NULL),(1234,'下花园区',79,0,3,NULL),(1235,'宣化区',79,0,3,NULL),(1236,'宣化县',79,0,3,NULL),(1237,'尚义县',79,0,3,NULL),(1238,'崇礼县',79,0,3,NULL),(1239,'康保县',79,0,3,NULL),(1240,'张北县',79,0,3,NULL),(1241,'怀安县',79,0,3,NULL),(1242,'怀来县',79,0,3,NULL),(1243,'桥东区',79,0,3,NULL),(1244,'桥西区',79,0,3,NULL),(1245,'沽源县',79,0,3,NULL),(1246,'涿鹿县',79,0,3,NULL),(1247,'蔚县',79,0,3,NULL),(1248,'赤城县',79,0,3,NULL),(1249,'阳原县',79,0,3,NULL),(1250,'丰宁满族自治县',80,0,3,NULL),(1251,'兴隆县',80,0,3,NULL),(1252,'双桥区',80,0,3,NULL),(1253,'双滦区',80,0,3,NULL),(1254,'围场满族蒙古族自治县',80,0,3,NULL),(1255,'宽城满族自治县',80,0,3,NULL),(1256,'平泉县',80,0,3,NULL),(1257,'承德县',80,0,3,NULL),(1258,'滦平县',80,0,3,NULL),(1259,'隆化县',80,0,3,NULL),(1260,'鹰手营子矿区',80,0,3,NULL),(1261,'冀州市',81,0,3,NULL),(1262,'安平县',81,0,3,NULL),(1263,'故城县',81,0,3,NULL),(1264,'景县',81,0,3,NULL),(1265,'枣强县',81,0,3,NULL),(1266,'桃城区',81,0,3,NULL),(1267,'武强县',81,0,3,NULL),(1268,'武邑县',81,0,3,NULL),(1269,'深州市',81,0,3,NULL),(1270,'阜城县',81,0,3,NULL),(1271,'饶阳县',81,0,3,NULL),(1272,'三河市',82,0,3,NULL),(1273,'固安县',82,0,3,NULL),(1274,'大厂回族自治县',82,0,3,NULL),(1275,'大城县',82,0,3,NULL),(1276,'安次区',82,0,3,NULL),(1277,'广阳区',82,0,3,NULL),(1278,'文安县',82,0,3,NULL),(1279,'永清县',82,0,3,NULL),(1280,'霸州市',82,0,3,NULL),(1281,'香河县',82,0,3,NULL),(1282,'东光县',83,0,3,NULL),(1283,'任丘市',83,0,3,NULL),(1284,'南皮县',83,0,3,NULL),(1285,'吴桥县',83,0,3,NULL),(1286,'孟村回族自治县',83,0,3,NULL),(1287,'新华区',83,0,3,NULL),(1288,'沧县',83,0,3,NULL),(1289,'河间市',83,0,3,NULL),(1290,'泊头市',83,0,3,NULL),(1291,'海兴县',83,0,3,NULL),(1292,'献县',83,0,3,NULL),(1293,'盐山县',83,0,3,NULL),(1294,'肃宁县',83,0,3,NULL),(1295,'运河区',83,0,3,NULL),(1296,'青县',83,0,3,NULL),(1297,'黄骅市',83,0,3,NULL),(1298,'万柏林区',84,0,3,NULL),(1299,'古交市',84,0,3,NULL),(1300,'娄烦县',84,0,3,NULL),(1301,'小店区',84,0,3,NULL),(1302,'尖草坪区',84,0,3,NULL),(1303,'晋源区',84,0,3,NULL),(1304,'杏花岭区',84,0,3,NULL),(1305,'清徐县',84,0,3,NULL),(1306,'迎泽区',84,0,3,NULL),(1307,'阳曲县',84,0,3,NULL),(1308,'南郊区',85,0,3,NULL),(1309,'城区',85,0,3,NULL),(1310,'大同县',85,0,3,NULL),(1311,'天镇县',85,0,3,NULL),(1312,'左云县',85,0,3,NULL),(1313,'广灵县',85,0,3,NULL),(1314,'新荣区',85,0,3,NULL),(1315,'浑源县',85,0,3,NULL),(1316,'灵丘县',85,0,3,NULL),(1317,'矿区',85,0,3,NULL),(1318,'阳高县',85,0,3,NULL),(1319,'城区',86,0,3,NULL),(1320,'平定县',86,0,3,NULL),(1321,'盂县',86,0,3,NULL),(1322,'矿区',86,0,3,NULL),(1323,'郊区',86,0,3,NULL),(1324,'城区',87,0,3,NULL),(1325,'壶关县',87,0,3,NULL),(1326,'屯留县',87,0,3,NULL),(1327,'平顺县',87,0,3,NULL),(1328,'武乡县',87,0,3,NULL),(1329,'沁县',87,0,3,NULL),(1330,'沁源县',87,0,3,NULL),(1331,'潞城市',87,0,3,NULL),(1332,'襄垣县',87,0,3,NULL),(1333,'郊区',87,0,3,NULL),(1334,'长子县',87,0,3,NULL),(1335,'长治县',87,0,3,NULL),(1336,'黎城县',87,0,3,NULL),(1337,'城区',88,0,3,NULL),(1338,'沁水县',88,0,3,NULL),(1339,'泽州县',88,0,3,NULL),(1340,'阳城县',88,0,3,NULL),(1341,'陵川县',88,0,3,NULL),(1342,'高平市',88,0,3,NULL),(1343,'右玉县',89,0,3,NULL),(1344,'山阴县',89,0,3,NULL),(1345,'平鲁区',89,0,3,NULL),(1346,'应县',89,0,3,NULL),(1347,'怀仁县',89,0,3,NULL),(1348,'朔城区',89,0,3,NULL),(1349,'介休市',90,0,3,NULL),(1350,'和顺县',90,0,3,NULL),(1351,'太谷县',90,0,3,NULL),(1352,'寿阳县',90,0,3,NULL),(1353,'左权县',90,0,3,NULL),(1354,'平遥县',90,0,3,NULL),(1355,'昔阳县',90,0,3,NULL),(1356,'榆次区',90,0,3,NULL),(1357,'榆社县',90,0,3,NULL),(1358,'灵石县',90,0,3,NULL),(1359,'祁县',90,0,3,NULL),(1360,'万荣县',91,0,3,NULL),(1361,'临猗县',91,0,3,NULL),(1362,'垣曲县',91,0,3,NULL),(1363,'夏县',91,0,3,NULL),(1364,'平陆县',91,0,3,NULL),(1365,'新绛县',91,0,3,NULL),(1366,'永济市',91,0,3,NULL),(1367,'河津市',91,0,3,NULL),(1368,'盐湖区',91,0,3,NULL),(1369,'稷山县',91,0,3,NULL),(1370,'绛县',91,0,3,NULL),(1371,'芮城县',91,0,3,NULL),(1372,'闻喜县',91,0,3,NULL),(1373,'五台县',92,0,3,NULL),(1374,'五寨县',92,0,3,NULL),(1375,'代县',92,0,3,NULL),(1376,'保德县',92,0,3,NULL),(1377,'偏关县',92,0,3,NULL),(1378,'原平市',92,0,3,NULL),(1379,'宁武县',92,0,3,NULL),(1380,'定襄县',92,0,3,NULL),(1381,'岢岚县',92,0,3,NULL),(1382,'忻府区',92,0,3,NULL),(1383,'河曲县',92,0,3,NULL),(1384,'神池县',92,0,3,NULL),(1385,'繁峙县',92,0,3,NULL),(1386,'静乐县',92,0,3,NULL),(1387,'乡宁县',93,0,3,NULL),(1388,'侯马市',93,0,3,NULL),(1389,'古县',93,0,3,NULL),(1390,'吉县',93,0,3,NULL),(1391,'大宁县',93,0,3,NULL),(1392,'安泽县',93,0,3,NULL),(1393,'尧都区',93,0,3,NULL),(1394,'曲沃县',93,0,3,NULL),(1395,'永和县',93,0,3,NULL),(1396,'汾西县',93,0,3,NULL),(1397,'洪洞县',93,0,3,NULL),(1398,'浮山县',93,0,3,NULL),(1399,'翼城县',93,0,3,NULL),(1400,'蒲县',93,0,3,NULL),(1401,'襄汾县',93,0,3,NULL),(1402,'隰县',93,0,3,NULL),(1403,'霍州市',93,0,3,NULL),(1404,'中阳县',94,0,3,NULL),(1405,'临县',94,0,3,NULL),(1406,'交口县',94,0,3,NULL),(1407,'交城县',94,0,3,NULL),(1408,'兴县',94,0,3,NULL),(1409,'孝义市',94,0,3,NULL),(1410,'岚县',94,0,3,NULL),(1411,'文水县',94,0,3,NULL),(1412,'方山县',94,0,3,NULL),(1413,'柳林县',94,0,3,NULL),(1414,'汾阳市',94,0,3,NULL),(1415,'石楼县',94,0,3,NULL),(1416,'离石区',94,0,3,NULL),(1417,'和林格尔县',95,0,3,NULL),(1418,'回民区',95,0,3,NULL),(1419,'土默特左旗',95,0,3,NULL),(1420,'托克托县',95,0,3,NULL),(1421,'新城区',95,0,3,NULL),(1422,'武川县',95,0,3,NULL),(1423,'清水河县',95,0,3,NULL),(1424,'玉泉区',95,0,3,NULL),(1425,'赛罕区',95,0,3,NULL),(1426,'东河区',96,0,3,NULL),(1427,'九原区',96,0,3,NULL),(1428,'固阳县',96,0,3,NULL),(1429,'土默特右旗',96,0,3,NULL),(1430,'昆都仑区',96,0,3,NULL),(1431,'白云矿区',96,0,3,NULL),(1432,'石拐区',96,0,3,NULL),(1433,'达尔罕茂明安联合旗',96,0,3,NULL),(1434,'青山区',96,0,3,NULL),(1435,'乌达区',97,0,3,NULL),(1436,'海勃湾区',97,0,3,NULL),(1437,'海南区',97,0,3,NULL),(1438,'元宝山区',98,0,3,NULL),(1439,'克什克腾旗',98,0,3,NULL),(1440,'喀喇沁旗',98,0,3,NULL),(1441,'宁城县',98,0,3,NULL),(1442,'巴林右旗',98,0,3,NULL),(1443,'巴林左旗',98,0,3,NULL),(1444,'敖汉旗',98,0,3,NULL),(1445,'松山区',98,0,3,NULL),(1446,'林西县',98,0,3,NULL),(1447,'红山区',98,0,3,NULL),(1448,'翁牛特旗',98,0,3,NULL),(1449,'阿鲁科尔沁旗',98,0,3,NULL),(1450,'奈曼旗',99,0,3,NULL),(1451,'库伦旗',99,0,3,NULL),(1452,'开鲁县',99,0,3,NULL),(1453,'扎鲁特旗',99,0,3,NULL),(1454,'科尔沁区',99,0,3,NULL),(1455,'科尔沁左翼中旗',99,0,3,NULL),(1456,'科尔沁左翼后旗',99,0,3,NULL),(1457,'霍林郭勒市',99,0,3,NULL),(1458,'东胜区',100,0,3,NULL),(1459,'乌审旗',100,0,3,NULL),(1460,'伊金霍洛旗',100,0,3,NULL),(1461,'准格尔旗',100,0,3,NULL),(1462,'杭锦旗',100,0,3,NULL),(1463,'达拉特旗',100,0,3,NULL),(1464,'鄂东胜区',100,0,3,NULL),(1465,'鄂托克前旗',100,0,3,NULL),(1466,'鄂托克旗',100,0,3,NULL),(1467,'扎兰屯市',101,0,3,NULL),(1468,'新巴尔虎右旗',101,0,3,NULL),(1469,'新巴尔虎左旗',101,0,3,NULL),(1470,'根河市',101,0,3,NULL),(1471,'海拉尔区',101,0,3,NULL),(1472,'满洲里市',101,0,3,NULL),(1473,'牙克石市',101,0,3,NULL),(1474,'莫力达瓦达斡尔族自治旗',101,0,3,NULL),(1475,'鄂伦春自治旗',101,0,3,NULL),(1476,'鄂温克族自治旗',101,0,3,NULL),(1477,'阿荣旗',101,0,3,NULL),(1478,'陈巴尔虎旗',101,0,3,NULL),(1479,'额尔古纳市',101,0,3,NULL),(1480,'临河区',102,0,3,NULL),(1481,'乌拉特中旗',102,0,3,NULL),(1482,'乌拉特前旗',102,0,3,NULL),(1483,'乌拉特后旗',102,0,3,NULL),(1484,'五原县',102,0,3,NULL),(1485,'杭锦后旗',102,0,3,NULL),(1486,'磴口县',102,0,3,NULL),(1487,'丰镇市',103,0,3,NULL),(1488,'兴和县',103,0,3,NULL),(1489,'凉城县',103,0,3,NULL),(1490,'化德县',103,0,3,NULL),(1491,'卓资县',103,0,3,NULL),(1492,'商都县',103,0,3,NULL),(1493,'四子王旗',103,0,3,NULL),(1494,'察哈尔右翼中旗',103,0,3,NULL),(1495,'察哈尔右翼前旗',103,0,3,NULL),(1496,'察哈尔右翼后旗',103,0,3,NULL),(1497,'集宁区',103,0,3,NULL),(1498,'乌兰浩特市',104,0,3,NULL),(1499,'扎赉特旗',104,0,3,NULL),(1500,'科尔沁右翼中旗',104,0,3,NULL),(1501,'科尔沁右翼前旗',104,0,3,NULL),(1502,'突泉县',104,0,3,NULL),(1503,'阿尔山市',104,0,3,NULL),(1504,'东乌珠穆沁旗',105,0,3,NULL),(1505,'二连浩特市',105,0,3,NULL),(1506,'多伦县',105,0,3,NULL),(1507,'太仆寺旗',105,0,3,NULL),(1508,'正蓝旗',105,0,3,NULL),(1509,'正镶白旗',105,0,3,NULL),(1510,'苏尼特右旗',105,0,3,NULL),(1511,'苏尼特左旗',105,0,3,NULL),(1512,'西乌珠穆沁旗',105,0,3,NULL),(1513,'锡林浩特市',105,0,3,NULL),(1514,'镶黄旗',105,0,3,NULL),(1515,'阿巴嘎旗',105,0,3,NULL),(1516,'阿拉善右旗',106,0,3,NULL),(1517,'阿拉善左旗',106,0,3,NULL),(1518,'额济纳旗',106,0,3,NULL),(1519,'东陵区',107,0,3,NULL),(1520,'于洪区',107,0,3,NULL),(1521,'和平区',107,0,3,NULL),(1522,'大东区',107,0,3,NULL),(1523,'康平县',107,0,3,NULL),(1524,'新民市',107,0,3,NULL),(1525,'沈北新区',107,0,3,NULL),(1526,'沈河区',107,0,3,NULL),(1527,'法库县',107,0,3,NULL),(1528,'皇姑区',107,0,3,NULL),(1529,'苏家屯区',107,0,3,NULL),(1530,'辽中县',107,0,3,NULL),(1531,'铁西区',107,0,3,NULL),(1532,'中山区',108,0,3,NULL),(1533,'庄河市',108,0,3,NULL),(1534,'旅顺口区',108,0,3,NULL),(1535,'普兰店市',108,0,3,NULL),(1536,'沙河口区',108,0,3,NULL),(1537,'瓦房店市',108,0,3,NULL),(1538,'甘井子区',108,0,3,NULL),(1539,'西岗区',108,0,3,NULL),(1540,'金州区',108,0,3,NULL),(1541,'长海县',108,0,3,NULL),(1542,'千山区',109,0,3,NULL),(1543,'台安县',109,0,3,NULL),(1544,'岫岩满族自治县',109,0,3,NULL),(1545,'海城市',109,0,3,NULL),(1546,'立山区',109,0,3,NULL),(1547,'铁东区',109,0,3,NULL),(1548,'铁西区',109,0,3,NULL),(1549,'东洲区',110,0,3,NULL),(1550,'抚顺县',110,0,3,NULL),(1551,'新宾满族自治县',110,0,3,NULL),(1552,'新抚区',110,0,3,NULL),(1553,'望花区',110,0,3,NULL),(1554,'清原满族自治县',110,0,3,NULL),(1555,'顺城区',110,0,3,NULL),(1556,'南芬区',111,0,3,NULL),(1557,'平山区',111,0,3,NULL),(1558,'明山区',111,0,3,NULL),(1559,'本溪满族自治县',111,0,3,NULL),(1560,'桓仁满族自治县',111,0,3,NULL),(1561,'溪湖区',111,0,3,NULL),(1562,'东港市',112,0,3,NULL),(1563,'元宝区',112,0,3,NULL),(1564,'凤城市',112,0,3,NULL),(1565,'宽甸满族自治县',112,0,3,NULL),(1566,'振兴区',112,0,3,NULL),(1567,'振安区',112,0,3,NULL),(1568,'义县',113,0,3,NULL),(1569,'凌河区',113,0,3,NULL),(1570,'凌海市',113,0,3,NULL),(1571,'北镇市',113,0,3,NULL),(1572,'古塔区',113,0,3,NULL),(1573,'太和区',113,0,3,NULL),(1574,'黑山县',113,0,3,NULL),(1575,'大石桥市',114,0,3,NULL),(1576,'盖州市',114,0,3,NULL),(1577,'站前区',114,0,3,NULL),(1578,'老边区',114,0,3,NULL),(1579,'西市区',114,0,3,NULL),(1580,'鲅鱼圈区',114,0,3,NULL),(1581,'太平区',115,0,3,NULL),(1582,'彰武县',115,0,3,NULL),(1583,'新邱区',115,0,3,NULL),(1584,'海州区',115,0,3,NULL),(1585,'清河门区',115,0,3,NULL),(1586,'细河区',115,0,3,NULL),(1587,'蒙古族自治县',115,0,3,NULL),(1588,'太子河区',116,0,3,NULL),(1589,'宏伟区',116,0,3,NULL),(1590,'弓长岭区',116,0,3,NULL),(1591,'文圣区',116,0,3,NULL),(1592,'灯塔市',116,0,3,NULL),(1593,'白塔区',116,0,3,NULL),(1594,'辽阳县',116,0,3,NULL),(1595,'兴隆台区',117,0,3,NULL),(1596,'双台子区',117,0,3,NULL),(1597,'大洼县',117,0,3,NULL),(1598,'盘山县',117,0,3,NULL),(1599,'开原市',118,0,3,NULL),(1600,'昌图县',118,0,3,NULL),(1601,'清河区',118,0,3,NULL),(1602,'西丰县',118,0,3,NULL),(1603,'调兵山市',118,0,3,NULL),(1604,'铁岭县',118,0,3,NULL),(1605,'银州区',118,0,3,NULL),(1606,'凌源市',119,0,3,NULL),(1607,'北票市',119,0,3,NULL),(1608,'双塔区',119,0,3,NULL),(1609,'喀喇沁左翼蒙古族自治县',119,0,3,NULL),(1610,'建平县',119,0,3,NULL),(1611,'朝阳县',119,0,3,NULL),(1612,'龙城区',119,0,3,NULL),(1613,'兴城市',120,0,3,NULL),(1614,'南票区',120,0,3,NULL),(1615,'建昌县',120,0,3,NULL),(1616,'绥中县',120,0,3,NULL),(1617,'连山区',120,0,3,NULL),(1618,'龙港区',120,0,3,NULL),(1619,'九台市',121,0,3,NULL),(1620,'二道区',121,0,3,NULL),(1621,'农安县',121,0,3,NULL),(1622,'南关区',121,0,3,NULL),(1623,'双阳区',121,0,3,NULL),(1624,'宽城区',121,0,3,NULL),(1625,'德惠市',121,0,3,NULL),(1626,'朝阳区',121,0,3,NULL),(1627,'榆树市',121,0,3,NULL),(1628,'绿园区',121,0,3,NULL),(1629,'丰满区',122,0,3,NULL),(1630,'昌邑区',122,0,3,NULL),(1631,'桦甸市',122,0,3,NULL),(1632,'永吉县',122,0,3,NULL),(1633,'磐石市',122,0,3,NULL),(1634,'舒兰市',122,0,3,NULL),(1635,'船营区',122,0,3,NULL),(1636,'蛟河市',122,0,3,NULL),(1637,'龙潭区',122,0,3,NULL),(1638,'伊通满族自治县',123,0,3,NULL),(1639,'公主岭市',123,0,3,NULL),(1640,'双辽市',123,0,3,NULL),(1641,'梨树县',123,0,3,NULL),(1642,'铁东区',123,0,3,NULL),(1643,'铁西区',123,0,3,NULL),(1644,'东丰县',124,0,3,NULL),(1645,'东辽县',124,0,3,NULL),(1646,'西安区',124,0,3,NULL),(1647,'龙山区',124,0,3,NULL),(1648,'东昌区',125,0,3,NULL),(1649,'二道江区',125,0,3,NULL),(1650,'柳河县',125,0,3,NULL),(1651,'梅河口市',125,0,3,NULL),(1652,'辉南县',125,0,3,NULL),(1653,'通化县',125,0,3,NULL),(1654,'集安市',125,0,3,NULL),(1655,'临江市',126,0,3,NULL),(1656,'八道江区',126,0,3,NULL),(1657,'抚松县',126,0,3,NULL),(1658,'江源区',126,0,3,NULL),(1659,'长白朝鲜族自治县',126,0,3,NULL),(1660,'靖宇县',126,0,3,NULL),(1661,'干安县',127,0,3,NULL),(1662,'前郭尔罗斯蒙古族自治县',127,0,3,NULL),(1663,'宁江区',127,0,3,NULL),(1664,'扶余县',127,0,3,NULL),(1665,'长岭县',127,0,3,NULL),(1666,'大安市',128,0,3,NULL),(1667,'洮北区',128,0,3,NULL),(1668,'洮南市',128,0,3,NULL),(1669,'通榆县',128,0,3,NULL),(1670,'镇赉县',128,0,3,NULL),(1671,'和龙市',129,0,3,NULL),(1672,'图们市',129,0,3,NULL),(1673,'安图县',129,0,3,NULL),(1674,'延吉市',129,0,3,NULL),(1675,'敦化市',129,0,3,NULL),(1676,'汪清县',129,0,3,NULL),(1677,'珲春市',129,0,3,NULL),(1678,'龙井市',129,0,3,NULL),(1679,'五常市',130,0,3,NULL),(1680,'依兰县',130,0,3,NULL),(1681,'南岗区',130,0,3,NULL),(1682,'双城市',130,0,3,NULL),(1683,'呼兰区',130,0,3,NULL),(1684,'哈尔滨市道里区',130,0,3,NULL),(1685,'宾县',130,0,3,NULL),(1686,'尚志市',130,0,3,NULL),(1687,'巴彦县',130,0,3,NULL),(1688,'平房区',130,0,3,NULL),(1689,'延寿县',130,0,3,NULL),(1690,'方正县',130,0,3,NULL),(1691,'木兰县',130,0,3,NULL),(1692,'松北区',130,0,3,NULL),(1693,'通河县',130,0,3,NULL),(1694,'道外区',130,0,3,NULL),(1695,'阿城区',130,0,3,NULL),(1696,'香坊区',130,0,3,NULL),(1697,'依安县',131,0,3,NULL),(1698,'克东县',131,0,3,NULL),(1699,'克山县',131,0,3,NULL),(1700,'富拉尔基区',131,0,3,NULL),(1701,'富裕县',131,0,3,NULL),(1702,'建华区',131,0,3,NULL),(1703,'拜泉县',131,0,3,NULL),(1704,'昂昂溪区',131,0,3,NULL),(1705,'梅里斯达斡尔族区',131,0,3,NULL),(1706,'泰来县',131,0,3,NULL),(1707,'甘南县',131,0,3,NULL),(1708,'碾子山区',131,0,3,NULL),(1709,'讷河市',131,0,3,NULL),(1710,'铁锋区',131,0,3,NULL),(1711,'龙江县',131,0,3,NULL),(1712,'龙沙区',131,0,3,NULL),(1713,'城子河区',132,0,3,NULL),(1714,'密山市',132,0,3,NULL),(1715,'恒山区',132,0,3,NULL),(1716,'梨树区',132,0,3,NULL),(1717,'滴道区',132,0,3,NULL),(1718,'虎林市',132,0,3,NULL),(1719,'鸡东县',132,0,3,NULL),(1720,'鸡冠区',132,0,3,NULL),(1721,'麻山区',132,0,3,NULL),(1722,'东山区',133,0,3,NULL),(1723,'兴安区',133,0,3,NULL),(1724,'兴山区',133,0,3,NULL),(1725,'南山区',133,0,3,NULL),(1726,'向阳区',133,0,3,NULL),(1727,'工农区',133,0,3,NULL),(1728,'绥滨县',133,0,3,NULL),(1729,'萝北县',133,0,3,NULL),(1730,'友谊县',134,0,3,NULL),(1731,'四方台区',134,0,3,NULL),(1732,'宝山区',134,0,3,NULL),(1733,'宝清县',134,0,3,NULL),(1734,'尖山区',134,0,3,NULL),(1735,'岭东区',134,0,3,NULL),(1736,'集贤县',134,0,3,NULL),(1737,'饶河县',134,0,3,NULL),(1738,'大同区',135,0,3,NULL),(1739,'杜尔伯特蒙古族自治县',135,0,3,NULL),(1740,'林甸县',135,0,3,NULL),(1741,'红岗区',135,0,3,NULL),(1742,'肇州县',135,0,3,NULL),(1743,'肇源县',135,0,3,NULL),(1744,'胡路区',135,0,3,NULL),(1745,'萨尔图区',135,0,3,NULL),(1746,'龙凤区',135,0,3,NULL),(1747,'上甘岭区',136,0,3,NULL),(1748,'乌伊岭区',136,0,3,NULL),(1749,'乌马河区',136,0,3,NULL),(1750,'五营区',136,0,3,NULL),(1751,'伊春区',136,0,3,NULL),(1752,'南岔区',136,0,3,NULL),(1753,'友好区',136,0,3,NULL),(1754,'嘉荫县',136,0,3,NULL),(1755,'带岭区',136,0,3,NULL),(1756,'新青区',136,0,3,NULL),(1757,'汤旺河区',136,0,3,NULL),(1758,'红星区',136,0,3,NULL),(1759,'美溪区',136,0,3,NULL),(1760,'翠峦区',136,0,3,NULL),(1761,'西林区',136,0,3,NULL),(1762,'金山屯区',136,0,3,NULL),(1763,'铁力市',136,0,3,NULL),(1764,'东风区',137,0,3,NULL),(1765,'前进区',137,0,3,NULL),(1766,'同江市',137,0,3,NULL),(1767,'向阳区',137,0,3,NULL),(1768,'富锦市',137,0,3,NULL),(1769,'抚远县',137,0,3,NULL),(1770,'桦南县',137,0,3,NULL),(1771,'桦川县',137,0,3,NULL),(1772,'汤原县',137,0,3,NULL),(1773,'郊区',137,0,3,NULL),(1774,'勃利县',138,0,3,NULL),(1775,'新兴区',138,0,3,NULL),(1776,'桃山区',138,0,3,NULL),(1777,'茄子河区',138,0,3,NULL),(1778,'东宁县',139,0,3,NULL),(1779,'东安区',139,0,3,NULL),(1780,'宁安市',139,0,3,NULL),(1781,'林口县',139,0,3,NULL),(1782,'海林市',139,0,3,NULL),(1783,'爱民区',139,0,3,NULL),(1784,'穆棱市',139,0,3,NULL),(1785,'绥芬河市',139,0,3,NULL),(1786,'西安区',139,0,3,NULL),(1787,'阳明区',139,0,3,NULL),(1788,'五大连池市',140,0,3,NULL),(1789,'北安市',140,0,3,NULL),(1790,'嫩江县',140,0,3,NULL),(1791,'孙吴县',140,0,3,NULL),(1792,'爱辉区',140,0,3,NULL),(1793,'车逊克县',140,0,3,NULL),(1794,'逊克县',140,0,3,NULL),(1795,'兰西县',141,0,3,NULL),(1796,'安达市',141,0,3,NULL),(1797,'庆安县',141,0,3,NULL),(1798,'明水县',141,0,3,NULL),(1799,'望奎县',141,0,3,NULL),(1800,'海伦市',141,0,3,NULL),(1801,'绥化市北林区',141,0,3,NULL),(1802,'绥棱县',141,0,3,NULL),(1803,'肇东市',141,0,3,NULL),(1804,'青冈县',141,0,3,NULL),(1805,'呼玛县',142,0,3,NULL),(1806,'塔河县',142,0,3,NULL),(1807,'大兴安岭地区加格达奇区',142,0,3,NULL),(1808,'大兴安岭地区呼中区',142,0,3,NULL),(1809,'大兴安岭地区新林区',142,0,3,NULL),(1810,'大兴安岭地区松岭区',142,0,3,NULL),(1811,'漠河县',142,0,3,NULL),(2027,'下关区',162,0,3,NULL),(2028,'六合区',162,0,3,NULL),(2029,'建邺区',162,0,3,NULL),(2030,'栖霞区',162,0,3,NULL),(2031,'江宁区',162,0,3,NULL),(2032,'浦口区',162,0,3,NULL),(2033,'溧水县',162,0,3,NULL),(2034,'玄武区',162,0,3,NULL),(2035,'白下区',162,0,3,NULL),(2036,'秦淮区',162,0,3,NULL),(2037,'雨花台区',162,0,3,NULL),(2038,'高淳县',162,0,3,NULL),(2039,'鼓楼区',162,0,3,NULL),(2040,'北塘区',163,0,3,NULL),(2041,'南长区',163,0,3,NULL),(2042,'宜兴市',163,0,3,NULL),(2043,'崇安区',163,0,3,NULL),(2044,'惠山区',163,0,3,NULL),(2045,'江阴市',163,0,3,NULL),(2046,'滨湖区',163,0,3,NULL),(2047,'锡山区',163,0,3,NULL),(2048,'丰县',164,0,3,NULL),(2049,'九里区',164,0,3,NULL),(2050,'云龙区',164,0,3,NULL),(2051,'新沂市',164,0,3,NULL),(2052,'沛县',164,0,3,NULL),(2053,'泉山区',164,0,3,NULL),(2054,'睢宁县',164,0,3,NULL),(2055,'贾汪区',164,0,3,NULL),(2056,'邳州市',164,0,3,NULL),(2057,'铜山县',164,0,3,NULL),(2058,'鼓楼区',164,0,3,NULL),(2059,'天宁区',165,0,3,NULL),(2060,'戚墅堰区',165,0,3,NULL),(2061,'新北区',165,0,3,NULL),(2062,'武进区',165,0,3,NULL),(2063,'溧阳市',165,0,3,NULL),(2064,'金坛市',165,0,3,NULL),(2065,'钟楼区',165,0,3,NULL),(2066,'吴中区',166,0,3,NULL),(2067,'吴江市',166,0,3,NULL),(2068,'太仓市',166,0,3,NULL),(2069,'常熟市',166,0,3,NULL),(2070,'平江区',166,0,3,NULL),(2071,'张家港市',166,0,3,NULL),(2072,'昆山市',166,0,3,NULL),(2073,'沧浪区',166,0,3,NULL),(2074,'相城区',166,0,3,NULL),(2075,'苏州工业园区',166,0,3,NULL),(2076,'虎丘区',166,0,3,NULL),(2077,'金阊区',166,0,3,NULL),(2078,'启东市',167,0,3,NULL),(2079,'如东县',167,0,3,NULL),(2080,'如皋市',167,0,3,NULL),(2081,'崇川区',167,0,3,NULL),(2082,'海安县',167,0,3,NULL),(2083,'海门市',167,0,3,NULL),(2084,'港闸区',167,0,3,NULL),(2085,'通州市',167,0,3,NULL),(2086,'东海县',168,0,3,NULL),(2087,'新浦区',168,0,3,NULL),(2088,'海州区',168,0,3,NULL),(2089,'灌云县',168,0,3,NULL),(2090,'灌南县',168,0,3,NULL),(2091,'赣榆县',168,0,3,NULL),(2092,'连云区',168,0,3,NULL),(2093,'楚州区',169,0,3,NULL),(2094,'洪泽县',169,0,3,NULL),(2095,'涟水县',169,0,3,NULL),(2096,'淮阴区',169,0,3,NULL),(2097,'清河区',169,0,3,NULL),(2098,'清浦区',169,0,3,NULL),(2099,'盱眙县',169,0,3,NULL),(2100,'金湖县',169,0,3,NULL),(2101,'东台市',170,0,3,NULL),(2102,'亭湖区',170,0,3,NULL),(2103,'响水县',170,0,3,NULL),(2104,'大丰市',170,0,3,NULL),(2105,'射阳县',170,0,3,NULL),(2106,'建湖县',170,0,3,NULL),(2107,'滨海县',170,0,3,NULL),(2108,'盐都区',170,0,3,NULL),(2109,'阜宁县',170,0,3,NULL),(2110,'仪征市',171,0,3,NULL),(2111,'宝应县',171,0,3,NULL),(2112,'广陵区',171,0,3,NULL),(2113,'江都市',171,0,3,NULL),(2114,'维扬区',171,0,3,NULL),(2115,'邗江区',171,0,3,NULL),(2116,'高邮市',171,0,3,NULL),(2117,'丹徒区',172,0,3,NULL),(2118,'丹阳市',172,0,3,NULL),(2119,'京口区',172,0,3,NULL),(2120,'句容市',172,0,3,NULL),(2121,'扬中市',172,0,3,NULL),(2122,'润州区',172,0,3,NULL),(2123,'兴化市',173,0,3,NULL),(2124,'姜堰市',173,0,3,NULL),(2125,'泰兴市',173,0,3,NULL),(2126,'海陵区',173,0,3,NULL),(2127,'靖江市',173,0,3,NULL),(2128,'高港区',173,0,3,NULL),(2129,'宿城区',174,0,3,NULL),(2130,'宿豫区',174,0,3,NULL),(2131,'沭阳县',174,0,3,NULL),(2132,'泗洪县',174,0,3,NULL),(2133,'泗阳县',174,0,3,NULL),(2134,'上城区',175,0,3,NULL),(2135,'下城区',175,0,3,NULL),(2136,'临安市',175,0,3,NULL),(2137,'余杭区',175,0,3,NULL),(2138,'富阳市',175,0,3,NULL),(2139,'建德市',175,0,3,NULL),(2140,'拱墅区',175,0,3,NULL),(2141,'桐庐县',175,0,3,NULL),(2142,'江干区',175,0,3,NULL),(2143,'淳安县',175,0,3,NULL),(2144,'滨江区',175,0,3,NULL),(2145,'萧山区',175,0,3,NULL),(2146,'西湖区',175,0,3,NULL),(2147,'余姚市',176,0,3,NULL),(2148,'北仑区',176,0,3,NULL),(2149,'奉化市',176,0,3,NULL),(2150,'宁海县',176,0,3,NULL),(2151,'慈溪市',176,0,3,NULL),(2152,'江东区',176,0,3,NULL),(2153,'江北区',176,0,3,NULL),(2154,'海曙区',176,0,3,NULL),(2155,'象山县',176,0,3,NULL),(2156,'鄞州区',176,0,3,NULL),(2157,'镇海区',176,0,3,NULL),(2158,'乐清市',177,0,3,NULL),(2159,'平阳县',177,0,3,NULL),(2160,'文成县',177,0,3,NULL),(2161,'永嘉县',177,0,3,NULL),(2162,'泰顺县',177,0,3,NULL),(2163,'洞头县',177,0,3,NULL),(2164,'瑞安市',177,0,3,NULL),(2165,'瓯海区',177,0,3,NULL),(2166,'苍南县',177,0,3,NULL),(2167,'鹿城区',177,0,3,NULL),(2168,'龙湾区',177,0,3,NULL),(2169,'南湖区',178,0,3,NULL),(2170,'嘉善县',178,0,3,NULL),(2171,'平湖市',178,0,3,NULL),(2172,'桐乡市',178,0,3,NULL),(2173,'海宁市',178,0,3,NULL),(2174,'海盐县',178,0,3,NULL),(2175,'秀洲区',178,0,3,NULL),(2176,'南浔区',179,0,3,NULL),(2177,'吴兴区',179,0,3,NULL),(2178,'安吉县',179,0,3,NULL),(2179,'德清县',179,0,3,NULL),(2180,'长兴县',179,0,3,NULL),(2181,'上虞市',180,0,3,NULL),(2182,'嵊州市',180,0,3,NULL),(2183,'新昌县',180,0,3,NULL),(2184,'绍兴县',180,0,3,NULL),(2185,'诸暨市',180,0,3,NULL),(2186,'越城区',180,0,3,NULL),(2187,'定海区',181,0,3,NULL),(2188,'岱山县',181,0,3,NULL),(2189,'嵊泗县',181,0,3,NULL),(2190,'普陀区',181,0,3,NULL),(2191,'常山县',182,0,3,NULL),(2192,'开化县',182,0,3,NULL),(2193,'柯城区',182,0,3,NULL),(2194,'江山市',182,0,3,NULL),(2195,'衢江区',182,0,3,NULL),(2196,'龙游县',182,0,3,NULL),(2197,'东阳市',183,0,3,NULL),(2198,'义乌市',183,0,3,NULL),(2199,'兰溪市',183,0,3,NULL),(2200,'婺城区',183,0,3,NULL),(2201,'武义县',183,0,3,NULL),(2202,'永康市',183,0,3,NULL),(2203,'浦江县',183,0,3,NULL),(2204,'磐安县',183,0,3,NULL),(2205,'金东区',183,0,3,NULL),(2206,'三门县',184,0,3,NULL),(2207,'临海市',184,0,3,NULL),(2208,'仙居县',184,0,3,NULL),(2209,'天台县',184,0,3,NULL),(2210,'椒江区',184,0,3,NULL),(2211,'温岭市',184,0,3,NULL),(2212,'玉环县',184,0,3,NULL),(2213,'路桥区',184,0,3,NULL),(2214,'黄岩区',184,0,3,NULL),(2215,'云和县',185,0,3,NULL),(2216,'庆元县',185,0,3,NULL),(2217,'景宁畲族自治县',185,0,3,NULL),(2218,'松阳县',185,0,3,NULL),(2219,'缙云县',185,0,3,NULL),(2220,'莲都区',185,0,3,NULL),(2221,'遂昌县',185,0,3,NULL),(2222,'青田县',185,0,3,NULL),(2223,'龙泉市',185,0,3,NULL),(2224,'包河区',186,0,3,NULL),(2225,'庐阳区',186,0,3,NULL),(2226,'瑶海区',186,0,3,NULL),(2227,'肥东县',186,0,3,NULL),(2228,'肥西县',186,0,3,NULL),(2229,'蜀山区',186,0,3,NULL),(2230,'长丰县',186,0,3,NULL),(2231,'三山区',187,0,3,NULL),(2232,'南陵县',187,0,3,NULL),(2233,'弋江区',187,0,3,NULL),(2234,'繁昌县',187,0,3,NULL),(2235,'芜湖县',187,0,3,NULL),(2236,'镜湖区',187,0,3,NULL),(2237,'鸠江区',187,0,3,NULL),(2238,'五河县',188,0,3,NULL),(2239,'固镇县',188,0,3,NULL),(2240,'怀远县',188,0,3,NULL),(2241,'淮上区',188,0,3,NULL),(2242,'禹会区',188,0,3,NULL),(2243,'蚌山区',188,0,3,NULL),(2244,'龙子湖区',188,0,3,NULL),(2245,'八公山区',189,0,3,NULL),(2246,'凤台县',189,0,3,NULL),(2247,'大通区',189,0,3,NULL),(2248,'潘集区',189,0,3,NULL),(2249,'田家庵区',189,0,3,NULL),(2250,'谢家集区',189,0,3,NULL),(2251,'当涂县',190,0,3,NULL),(2252,'花山区',190,0,3,NULL),(2253,'金家庄区',190,0,3,NULL),(2254,'雨山区',190,0,3,NULL),(2255,'杜集区',191,0,3,NULL),(2256,'濉溪县',191,0,3,NULL),(2257,'烈山区',191,0,3,NULL),(2258,'相山区',191,0,3,NULL),(2259,'狮子山区',192,0,3,NULL),(2260,'郊区',192,0,3,NULL),(2261,'铜官山区',192,0,3,NULL),(2262,'铜陵县',192,0,3,NULL),(2263,'大观区',193,0,3,NULL),(2264,'太湖县',193,0,3,NULL),(2265,'宜秀区',193,0,3,NULL),(2266,'宿松县',193,0,3,NULL),(2267,'岳西县',193,0,3,NULL),(2268,'怀宁县',193,0,3,NULL),(2269,'望江县',193,0,3,NULL),(2270,'枞阳县',193,0,3,NULL),(2271,'桐城市',193,0,3,NULL),(2272,'潜山县',193,0,3,NULL),(2273,'迎江区',193,0,3,NULL),(2274,'休宁县',194,0,3,NULL),(2275,'屯溪区',194,0,3,NULL),(2276,'徽州区',194,0,3,NULL),(2277,'歙县',194,0,3,NULL),(2278,'祁门县',194,0,3,NULL),(2279,'黄山区',194,0,3,NULL),(2280,'黟县',194,0,3,NULL),(2281,'全椒县',195,0,3,NULL),(2282,'凤阳县',195,0,3,NULL),(2283,'南谯区',195,0,3,NULL),(2284,'天长市',195,0,3,NULL),(2285,'定远县',195,0,3,NULL),(2286,'明光市',195,0,3,NULL),(2287,'来安县',195,0,3,NULL),(2288,'琅玡区',195,0,3,NULL),(2289,'临泉县',196,0,3,NULL),(2290,'太和县',196,0,3,NULL),(2291,'界首市',196,0,3,NULL),(2292,'阜南县',196,0,3,NULL),(2293,'颍东区',196,0,3,NULL),(2294,'颍州区',196,0,3,NULL),(2295,'颍泉区',196,0,3,NULL),(2296,'颖上县',196,0,3,NULL),(2297,'埇桥区',197,0,3,NULL),(2298,'泗县辖',197,0,3,NULL),(2299,'灵璧县',197,0,3,NULL),(2300,'砀山县',197,0,3,NULL),(2301,'萧县',197,0,3,NULL),(2302,'含山县',198,0,3,NULL),(2303,'和县',198,0,3,NULL),(2304,'居巢区',198,0,3,NULL),(2305,'庐江县',198,0,3,NULL),(2306,'无为县',198,0,3,NULL),(2307,'寿县',199,0,3,NULL),(2308,'舒城县',199,0,3,NULL),(2309,'裕安区',199,0,3,NULL),(2310,'金安区',199,0,3,NULL),(2311,'金寨县',199,0,3,NULL),(2312,'霍山县',199,0,3,NULL),(2313,'霍邱县',199,0,3,NULL),(2314,'利辛县',200,0,3,NULL),(2315,'涡阳县',200,0,3,NULL),(2316,'蒙城县',200,0,3,NULL),(2317,'谯城区',200,0,3,NULL),(2318,'东至县',201,0,3,NULL),(2319,'石台县',201,0,3,NULL),(2320,'贵池区',201,0,3,NULL),(2321,'青阳县',201,0,3,NULL),(2322,'宁国市',202,0,3,NULL),(2323,'宣州区',202,0,3,NULL),(2324,'广德县',202,0,3,NULL),(2325,'旌德县',202,0,3,NULL),(2326,'泾县',202,0,3,NULL),(2327,'绩溪县',202,0,3,NULL),(2328,'郎溪县',202,0,3,NULL),(2329,'仓山区',203,0,3,NULL),(2330,'台江区',203,0,3,NULL),(2331,'平潭县',203,0,3,NULL),(2332,'晋安区',203,0,3,NULL),(2333,'永泰县',203,0,3,NULL),(2334,'福清市',203,0,3,NULL),(2335,'罗源县',203,0,3,NULL),(2336,'连江县',203,0,3,NULL),(2337,'长乐市',203,0,3,NULL),(2338,'闽侯县',203,0,3,NULL),(2339,'闽清县',203,0,3,NULL),(2340,'马尾区',203,0,3,NULL),(2341,'鼓楼区',203,0,3,NULL),(2342,'同安区',204,0,3,NULL),(2343,'思明区',204,0,3,NULL),(2344,'海沧区',204,0,3,NULL),(2345,'湖里区',204,0,3,NULL),(2346,'翔安区',204,0,3,NULL),(2347,'集美区',204,0,3,NULL),(2348,'仙游县',205,0,3,NULL),(2349,'城厢区',205,0,3,NULL),(2350,'涵江区',205,0,3,NULL),(2351,'秀屿区',205,0,3,NULL),(2352,'荔城区',205,0,3,NULL),(2353,'三元区',206,0,3,NULL),(2354,'大田县',206,0,3,NULL),(2355,'宁化县',206,0,3,NULL),(2356,'将乐县',206,0,3,NULL),(2357,'尤溪县',206,0,3,NULL),(2358,'建宁县',206,0,3,NULL),(2359,'明溪县',206,0,3,NULL),(2360,'梅列区',206,0,3,NULL),(2361,'永安市',206,0,3,NULL),(2362,'沙县',206,0,3,NULL),(2363,'泰宁县',206,0,3,NULL),(2364,'清流县',206,0,3,NULL),(2365,'丰泽区',207,0,3,NULL),(2366,'南安市',207,0,3,NULL),(2367,'安溪县',207,0,3,NULL),(2368,'德化县',207,0,3,NULL),(2369,'惠安县',207,0,3,NULL),(2370,'晋江市',207,0,3,NULL),(2371,'永春县',207,0,3,NULL),(2372,'泉港区',207,0,3,NULL),(2373,'洛江区',207,0,3,NULL),(2374,'石狮市',207,0,3,NULL),(2375,'金门县',207,0,3,NULL),(2376,'鲤城区',207,0,3,NULL),(2377,'东山县',208,0,3,NULL),(2378,'云霄县',208,0,3,NULL),(2379,'华安县',208,0,3,NULL),(2380,'南靖县',208,0,3,NULL),(2381,'平和县',208,0,3,NULL),(2382,'漳浦县',208,0,3,NULL),(2383,'芗城区',208,0,3,NULL),(2384,'诏安县',208,0,3,NULL),(2385,'长泰县',208,0,3,NULL),(2386,'龙文区',208,0,3,NULL),(2387,'龙海市',208,0,3,NULL),(2388,'光泽县',209,0,3,NULL),(2389,'延平区',209,0,3,NULL),(2390,'建瓯市',209,0,3,NULL),(2391,'建阳市',209,0,3,NULL),(2392,'政和县',209,0,3,NULL),(2393,'松溪县',209,0,3,NULL),(2394,'武夷山市',209,0,3,NULL),(2395,'浦城县',209,0,3,NULL),(2396,'邵武市',209,0,3,NULL),(2397,'顺昌县',209,0,3,NULL),(2398,'上杭县',210,0,3,NULL),(2399,'新罗区',210,0,3,NULL),(2400,'武平县',210,0,3,NULL),(2401,'永定县',210,0,3,NULL),(2402,'漳平市',210,0,3,NULL),(2403,'连城县',210,0,3,NULL),(2404,'长汀县',210,0,3,NULL),(2405,'古田县',211,0,3,NULL),(2406,'周宁县',211,0,3,NULL),(2407,'寿宁县',211,0,3,NULL),(2408,'屏南县',211,0,3,NULL),(2409,'柘荣县',211,0,3,NULL),(2410,'福安市',211,0,3,NULL),(2411,'福鼎市',211,0,3,NULL),(2412,'蕉城区',211,0,3,NULL),(2413,'霞浦县',211,0,3,NULL),(2414,'东湖区',212,0,3,NULL),(2415,'南昌县',212,0,3,NULL),(2416,'安义县',212,0,3,NULL),(2417,'新建县',212,0,3,NULL),(2418,'湾里区',212,0,3,NULL),(2419,'西湖区',212,0,3,NULL),(2420,'进贤县',212,0,3,NULL),(2421,'青云谱区',212,0,3,NULL),(2422,'青山湖区',212,0,3,NULL),(2423,'乐平市',213,0,3,NULL),(2424,'昌江区',213,0,3,NULL),(2425,'浮梁县',213,0,3,NULL),(2426,'珠山区',213,0,3,NULL),(2427,'上栗县',214,0,3,NULL),(2428,'安源区',214,0,3,NULL),(2429,'湘东区',214,0,3,NULL),(2430,'芦溪县',214,0,3,NULL),(2431,'莲花县',214,0,3,NULL),(2432,'九江县',215,0,3,NULL),(2433,'修水县',215,0,3,NULL),(2434,'庐山区',215,0,3,NULL),(2435,'彭泽县',215,0,3,NULL),(2436,'德安县',215,0,3,NULL),(2437,'星子县',215,0,3,NULL),(2438,'武宁县',215,0,3,NULL),(2439,'永修县',215,0,3,NULL),(2440,'浔阳区',215,0,3,NULL),(2441,'湖口县',215,0,3,NULL),(2442,'瑞昌市',215,0,3,NULL),(2443,'都昌县',215,0,3,NULL),(2444,'分宜县',216,0,3,NULL),(2445,'渝水区',216,0,3,NULL),(2446,'余江县',217,0,3,NULL),(2447,'月湖区',217,0,3,NULL),(2448,'贵溪市',217,0,3,NULL),(2449,'上犹县',218,0,3,NULL),(2450,'于都县',218,0,3,NULL),(2451,'会昌县',218,0,3,NULL),(2452,'信丰县',218,0,3,NULL),(2453,'全南县',218,0,3,NULL),(2454,'兴国县',218,0,3,NULL),(2455,'南康市',218,0,3,NULL),(2456,'大余县',218,0,3,NULL),(2457,'宁都县',218,0,3,NULL),(2458,'安远县',218,0,3,NULL),(2459,'定南县',218,0,3,NULL),(2460,'寻乌县',218,0,3,NULL),(2461,'崇义县',218,0,3,NULL),(2462,'瑞金市',218,0,3,NULL),(2463,'石城县',218,0,3,NULL),(2464,'章贡区',218,0,3,NULL),(2465,'赣县',218,0,3,NULL),(2466,'龙南县',218,0,3,NULL),(2467,'万安县',219,0,3,NULL),(2468,'井冈山市',219,0,3,NULL),(2469,'吉安县',219,0,3,NULL),(2470,'吉州区',219,0,3,NULL),(2471,'吉水县',219,0,3,NULL),(2472,'安福县',219,0,3,NULL),(2473,'峡江县',219,0,3,NULL),(2474,'新干县',219,0,3,NULL),(2475,'永丰县',219,0,3,NULL),(2476,'永新县',219,0,3,NULL),(2477,'泰和县',219,0,3,NULL),(2478,'遂川县',219,0,3,NULL),(2479,'青原区',219,0,3,NULL),(2480,'万载县',220,0,3,NULL),(2481,'上高县',220,0,3,NULL),(2482,'丰城市',220,0,3,NULL),(2483,'奉新县',220,0,3,NULL),(2484,'宜丰县',220,0,3,NULL),(2485,'樟树市',220,0,3,NULL),(2486,'袁州区',220,0,3,NULL),(2487,'铜鼓县',220,0,3,NULL),(2488,'靖安县',220,0,3,NULL),(2489,'高安市',220,0,3,NULL),(2490,'东乡县',221,0,3,NULL),(2491,'临川区',221,0,3,NULL),(2492,'乐安县',221,0,3,NULL),(2493,'南丰县',221,0,3,NULL),(2494,'南城县',221,0,3,NULL),(2495,'宜黄县',221,0,3,NULL),(2496,'崇仁县',221,0,3,NULL),(2497,'广昌县',221,0,3,NULL),(2498,'资溪县',221,0,3,NULL),(2499,'金溪县',221,0,3,NULL),(2500,'黎川县',221,0,3,NULL),(2501,'万年县',222,0,3,NULL),(2502,'上饶县',222,0,3,NULL),(2503,'余干县',222,0,3,NULL),(2504,'信州区',222,0,3,NULL),(2505,'婺源县',222,0,3,NULL),(2506,'广丰县',222,0,3,NULL),(2507,'弋阳县',222,0,3,NULL),(2508,'德兴市',222,0,3,NULL),(2509,'横峰县',222,0,3,NULL),(2510,'玉山县',222,0,3,NULL),(2511,'鄱阳县',222,0,3,NULL),(2512,'铅山县',222,0,3,NULL),(2513,'历下区',223,0,3,NULL),(2514,'历城区',223,0,3,NULL),(2515,'商河县',223,0,3,NULL),(2516,'天桥区',223,0,3,NULL),(2517,'市中区',223,0,3,NULL),(2518,'平阴县',223,0,3,NULL),(2519,'槐荫区',223,0,3,NULL),(2520,'济阳县',223,0,3,NULL),(2521,'章丘市',223,0,3,NULL),(2522,'长清区',223,0,3,NULL),(2523,'即墨市',224,0,3,NULL),(2524,'四方区',224,0,3,NULL),(2525,'城阳区',224,0,3,NULL),(2526,'崂山区',224,0,3,NULL),(2527,'市北区',224,0,3,NULL),(2528,'市南区',224,0,3,NULL),(2529,'平度市',224,0,3,NULL),(2530,'李沧区',224,0,3,NULL),(2531,'胶南市',224,0,3,NULL),(2532,'胶州市',224,0,3,NULL),(2533,'莱西市',224,0,3,NULL),(2534,'黄岛区',224,0,3,NULL),(2535,'临淄区',225,0,3,NULL),(2536,'博山区',225,0,3,NULL),(2537,'周村区',225,0,3,NULL),(2538,'张店区',225,0,3,NULL),(2539,'桓台县',225,0,3,NULL),(2540,'沂源县',225,0,3,NULL),(2541,'淄川区',225,0,3,NULL),(2542,'高青县',225,0,3,NULL),(2543,'台儿庄区',226,0,3,NULL),(2544,'山亭区',226,0,3,NULL),(2545,'峄城区',226,0,3,NULL),(2546,'市中区',226,0,3,NULL),(2547,'滕州市',226,0,3,NULL),(2548,'薛城区',226,0,3,NULL),(2549,'东营区',227,0,3,NULL),(2550,'利津县',227,0,3,NULL),(2551,'垦利县',227,0,3,NULL),(2552,'广饶县',227,0,3,NULL),(2553,'河口区',227,0,3,NULL),(2554,'招远市',228,0,3,NULL),(2555,'栖霞市',228,0,3,NULL),(2556,'海阳市',228,0,3,NULL),(2557,'牟平区',228,0,3,NULL),(2558,'福山区',228,0,3,NULL),(2559,'芝罘区',228,0,3,NULL),(2560,'莱山区',228,0,3,NULL),(2561,'莱州市',228,0,3,NULL),(2562,'莱阳市',228,0,3,NULL),(2563,'蓬莱市',228,0,3,NULL),(2564,'长岛县',228,0,3,NULL),(2565,'龙口市',228,0,3,NULL),(2566,'临朐县',229,0,3,NULL),(2567,'坊子区',229,0,3,NULL),(2568,'奎文区',229,0,3,NULL),(2569,'安丘市',229,0,3,NULL),(2570,'寒亭区',229,0,3,NULL),(2571,'寿光市',229,0,3,NULL),(2572,'昌乐县',229,0,3,NULL),(2573,'昌邑市',229,0,3,NULL),(2574,'潍城区',229,0,3,NULL),(2575,'诸城市',229,0,3,NULL),(2576,'青州市',229,0,3,NULL),(2577,'高密市',229,0,3,NULL),(2578,'任城区',230,0,3,NULL),(2579,'兖州市',230,0,3,NULL),(2580,'嘉祥县',230,0,3,NULL),(2581,'市中区',230,0,3,NULL),(2582,'微山县',230,0,3,NULL),(2583,'曲阜市',230,0,3,NULL),(2584,'梁山县',230,0,3,NULL),(2585,'汶上县',230,0,3,NULL),(2586,'泗水县',230,0,3,NULL),(2587,'邹城市',230,0,3,NULL),(2588,'金乡县',230,0,3,NULL),(2589,'鱼台县',230,0,3,NULL),(2590,'东平县',231,0,3,NULL),(2591,'宁阳县',231,0,3,NULL),(2592,'岱岳区',231,0,3,NULL),(2593,'新泰市',231,0,3,NULL),(2594,'泰山区',231,0,3,NULL),(2595,'肥城市',231,0,3,NULL),(2596,'乳山市',232,0,3,NULL),(2597,'文登市',232,0,3,NULL),(2598,'环翠区',232,0,3,NULL),(2599,'荣成市',232,0,3,NULL),(2600,'东港区',233,0,3,NULL),(2601,'五莲县',233,0,3,NULL),(2602,'岚山区',233,0,3,NULL),(2603,'莒县',233,0,3,NULL),(2604,'莱城区',234,0,3,NULL),(2605,'钢城区',234,0,3,NULL),(2606,'临沭县',235,0,3,NULL),(2607,'兰山区',235,0,3,NULL),(2608,'平邑县',235,0,3,NULL),(2609,'沂南县',235,0,3,NULL),(2610,'沂水县',235,0,3,NULL),(2611,'河东区',235,0,3,NULL),(2612,'罗庄区',235,0,3,NULL),(2613,'苍山县',235,0,3,NULL),(2614,'莒南县',235,0,3,NULL),(2615,'蒙阴县',235,0,3,NULL),(2616,'费县',235,0,3,NULL),(2617,'郯城县',235,0,3,NULL),(2618,'临邑县',236,0,3,NULL),(2619,'乐陵市',236,0,3,NULL),(2620,'夏津县',236,0,3,NULL),(2621,'宁津县',236,0,3,NULL),(2622,'平原县',236,0,3,NULL),(2623,'庆云县',236,0,3,NULL),(2624,'德城区',236,0,3,NULL),(2625,'武城县',236,0,3,NULL),(2626,'禹城市',236,0,3,NULL),(2627,'陵县',236,0,3,NULL),(2628,'齐河县',236,0,3,NULL),(2629,'东昌府区',237,0,3,NULL),(2630,'东阿县',237,0,3,NULL),(2631,'临清市',237,0,3,NULL),(2632,'冠县',237,0,3,NULL),(2633,'茌平县',237,0,3,NULL),(2634,'莘县',237,0,3,NULL),(2635,'阳谷县',237,0,3,NULL),(2636,'高唐县',237,0,3,NULL),(2637,'博兴县',238,0,3,NULL),(2638,'惠民县',238,0,3,NULL),(2639,'无棣县',238,0,3,NULL),(2640,'沾化县',238,0,3,NULL),(2641,'滨城区',238,0,3,NULL),(2642,'邹平县',238,0,3,NULL),(2643,'阳信县',238,0,3,NULL),(2644,'东明县',239,0,3,NULL),(2645,'单县',239,0,3,NULL),(2646,'定陶县',239,0,3,NULL),(2647,'巨野县',239,0,3,NULL),(2648,'成武县',239,0,3,NULL),(2649,'曹县',239,0,3,NULL),(2650,'牡丹区',239,0,3,NULL),(2651,'郓城县',239,0,3,NULL),(2652,'鄄城县',239,0,3,NULL),(2653,'上街区',240,0,3,NULL),(2654,'中原区',240,0,3,NULL),(2655,'中牟县',240,0,3,NULL),(2656,'二七区',240,0,3,NULL),(2657,'巩义市',240,0,3,NULL),(2658,'惠济区',240,0,3,NULL),(2659,'新密市',240,0,3,NULL),(2660,'新郑市',240,0,3,NULL),(2661,'登封市',240,0,3,NULL),(2662,'管城回族区',240,0,3,NULL),(2663,'荥阳市',240,0,3,NULL),(2664,'金水区',240,0,3,NULL),(2665,'兰考县',241,0,3,NULL),(2666,'尉氏县',241,0,3,NULL),(2667,'开封县',241,0,3,NULL),(2668,'杞县',241,0,3,NULL),(2669,'禹王台区',241,0,3,NULL),(2670,'通许县',241,0,3,NULL),(2671,'金明区',241,0,3,NULL),(2672,'顺河回族区',241,0,3,NULL),(2673,'鼓楼区',241,0,3,NULL),(2674,'龙亭区',241,0,3,NULL),(2675,'伊川县',242,0,3,NULL),(2676,'偃师市',242,0,3,NULL),(2677,'吉利区',242,0,3,NULL),(2678,'孟津县',242,0,3,NULL),(2679,'宜阳县',242,0,3,NULL),(2680,'嵩县',242,0,3,NULL),(2681,'新安县',242,0,3,NULL),(2682,'栾川县',242,0,3,NULL),(2683,'汝阳县',242,0,3,NULL),(2684,'洛宁县',242,0,3,NULL),(2685,'洛龙区',242,0,3,NULL),(2686,'涧西区',242,0,3,NULL),(2687,'瀍河回族区',242,0,3,NULL),(2688,'老城区',242,0,3,NULL),(2689,'西工区',242,0,3,NULL),(2690,'卫东区',243,0,3,NULL),(2691,'叶县',243,0,3,NULL),(2692,'宝丰县',243,0,3,NULL),(2693,'新华区',243,0,3,NULL),(2694,'汝州市',243,0,3,NULL),(2695,'湛河区',243,0,3,NULL),(2696,'石龙区',243,0,3,NULL),(2697,'舞钢市',243,0,3,NULL),(2698,'郏县',243,0,3,NULL),(2699,'鲁山县',243,0,3,NULL),(2700,'内黄县',244,0,3,NULL),(2701,'北关区',244,0,3,NULL),(2702,'安阳县',244,0,3,NULL),(2703,'文峰区',244,0,3,NULL),(2704,'林州市',244,0,3,NULL),(2705,'殷都区',244,0,3,NULL),(2706,'汤阴县',244,0,3,NULL),(2707,'滑县',244,0,3,NULL),(2708,'龙安区',244,0,3,NULL),(2709,'山城区',245,0,3,NULL),(2710,'浚县',245,0,3,NULL),(2711,'淇县',245,0,3,NULL),(2712,'淇滨区',245,0,3,NULL),(2713,'鹤山区',245,0,3,NULL),(2714,'凤泉区',246,0,3,NULL),(2715,'卫滨区',246,0,3,NULL),(2716,'卫辉市',246,0,3,NULL),(2717,'原阳县',246,0,3,NULL),(2718,'封丘县',246,0,3,NULL),(2719,'延津县',246,0,3,NULL),(2720,'新乡县',246,0,3,NULL),(2721,'牧野区',246,0,3,NULL),(2722,'红旗区',246,0,3,NULL),(2723,'获嘉县',246,0,3,NULL),(2724,'辉县市',246,0,3,NULL),(2725,'长垣县',246,0,3,NULL),(2726,'中站区',247,0,3,NULL),(2727,'修武县',247,0,3,NULL),(2728,'博爱县',247,0,3,NULL),(2729,'孟州市',247,0,3,NULL),(2730,'山阳区',247,0,3,NULL),(2731,'武陟县',247,0,3,NULL),(2732,'沁阳市',247,0,3,NULL),(2733,'温县',247,0,3,NULL),(2734,'解放区',247,0,3,NULL),(2735,'马村区',247,0,3,NULL),(2736,'华龙区',248,0,3,NULL),(2737,'南乐县',248,0,3,NULL),(2738,'台前县',248,0,3,NULL),(2739,'清丰县',248,0,3,NULL),(2740,'濮阳县',248,0,3,NULL),(2741,'范县',248,0,3,NULL),(2742,'禹州市',249,0,3,NULL),(2743,'襄城县',249,0,3,NULL),(2744,'许昌县',249,0,3,NULL),(2745,'鄢陵县',249,0,3,NULL),(2746,'长葛市',249,0,3,NULL),(2747,'魏都区',249,0,3,NULL),(2748,'临颍县',250,0,3,NULL),(2749,'召陵区',250,0,3,NULL),(2750,'源汇区',250,0,3,NULL),(2751,'舞阳县',250,0,3,NULL),(2752,'郾城区',250,0,3,NULL),(2753,'义马市',251,0,3,NULL),(2754,'卢氏县',251,0,3,NULL),(2755,'渑池县',251,0,3,NULL),(2756,'湖滨区',251,0,3,NULL),(2757,'灵宝市',251,0,3,NULL),(2758,'陕县',251,0,3,NULL),(2759,'内乡县',252,0,3,NULL),(2760,'南召县',252,0,3,NULL),(2761,'卧龙区',252,0,3,NULL),(2762,'唐河县',252,0,3,NULL),(2763,'宛城区',252,0,3,NULL),(2764,'新野县',252,0,3,NULL),(2765,'方城县',252,0,3,NULL),(2766,'桐柏县',252,0,3,NULL),(2767,'淅川县',252,0,3,NULL),(2768,'社旗县',252,0,3,NULL),(2769,'西峡县',252,0,3,NULL),(2770,'邓州市',252,0,3,NULL),(2771,'镇平县',252,0,3,NULL),(2772,'夏邑县',253,0,3,NULL),(2773,'宁陵县',253,0,3,NULL),(2774,'柘城县',253,0,3,NULL),(2775,'民权县',253,0,3,NULL),(2776,'永城市',253,0,3,NULL),(2777,'睢县',253,0,3,NULL),(2778,'睢阳区',253,0,3,NULL),(2779,'粱园区',253,0,3,NULL),(2780,'虞城县',253,0,3,NULL),(2781,'光山县',254,0,3,NULL),(2782,'商城县',254,0,3,NULL),(2783,'固始县',254,0,3,NULL),(2784,'平桥区',254,0,3,NULL),(2785,'息县',254,0,3,NULL),(2786,'新县',254,0,3,NULL),(2787,'浉河区',254,0,3,NULL),(2788,'淮滨县',254,0,3,NULL),(2789,'潢川县',254,0,3,NULL),(2790,'罗山县',254,0,3,NULL),(2791,'商水县',255,0,3,NULL),(2792,'太康县',255,0,3,NULL),(2793,'川汇区',255,0,3,NULL),(2794,'扶沟县',255,0,3,NULL),(2795,'沈丘县',255,0,3,NULL),(2796,'淮阳县',255,0,3,NULL),(2797,'西华县',255,0,3,NULL),(2798,'郸城县',255,0,3,NULL),(2799,'项城市',255,0,3,NULL),(2800,'鹿邑县',255,0,3,NULL),(2801,'上蔡县',256,0,3,NULL),(2802,'平舆县',256,0,3,NULL),(2803,'新蔡县',256,0,3,NULL),(2804,'正阳县',256,0,3,NULL),(2805,'汝南县',256,0,3,NULL),(2806,'泌阳县',256,0,3,NULL),(2807,'确山县',256,0,3,NULL),(2808,'西平县',256,0,3,NULL),(2809,'遂平县',256,0,3,NULL),(2810,'驿城区',256,0,3,NULL),(2811,'济源市',257,0,3,NULL),(2812,'东西湖区',258,0,3,NULL),(2813,'新洲区',258,0,3,NULL),(2814,'武昌区',258,0,3,NULL),(2815,'汉南区',258,0,3,NULL),(2816,'汉阳区',258,0,3,NULL),(2817,'江夏区',258,0,3,NULL),(2818,'江岸区',258,0,3,NULL),(2819,'江汉区',258,0,3,NULL),(2820,'洪山区',258,0,3,NULL),(2821,'硚口区',258,0,3,NULL),(2822,'蔡甸区',258,0,3,NULL),(2823,'青山区',258,0,3,NULL),(2824,'黄陂区',258,0,3,NULL),(2825,'下陆区',259,0,3,NULL),(2826,'大冶市',259,0,3,NULL),(2827,'西塞山区',259,0,3,NULL),(2828,'铁山区',259,0,3,NULL),(2829,'阳新县',259,0,3,NULL),(2830,'黄石港区',259,0,3,NULL),(2831,'丹江口市',260,0,3,NULL),(2832,'张湾区',260,0,3,NULL),(2833,'房县',260,0,3,NULL),(2834,'竹山县',260,0,3,NULL),(2835,'竹溪县',260,0,3,NULL),(2836,'茅箭区',260,0,3,NULL),(2837,'郧县',260,0,3,NULL),(2838,'郧西县',260,0,3,NULL),(2839,'五峰土家族自治县',261,0,3,NULL),(2840,'伍家岗区',261,0,3,NULL),(2841,'兴山县',261,0,3,NULL),(2842,'夷陵区',261,0,3,NULL),(2843,'宜都市',261,0,3,NULL),(2844,'当阳市',261,0,3,NULL),(2845,'枝江市',261,0,3,NULL),(2846,'点军区',261,0,3,NULL),(2847,'秭归县',261,0,3,NULL),(2848,'虢亭区',261,0,3,NULL),(2849,'西陵区',261,0,3,NULL),(2850,'远安县',261,0,3,NULL),(2851,'长阳土家族自治县',261,0,3,NULL),(2852,'保康县',262,0,3,NULL),(2853,'南漳县',262,0,3,NULL),(2854,'宜城市',262,0,3,NULL),(2855,'枣阳市',262,0,3,NULL),(2856,'樊城区',262,0,3,NULL),(2857,'老河口市',262,0,3,NULL),(2858,'襄城区',262,0,3,NULL),(2859,'襄阳区',262,0,3,NULL),(2860,'谷城县',262,0,3,NULL),(2861,'华容区',263,0,3,NULL),(2862,'粱子湖',263,0,3,NULL),(2863,'鄂城区',263,0,3,NULL),(2864,'东宝区',264,0,3,NULL),(2865,'京山县',264,0,3,NULL),(2866,'掇刀区',264,0,3,NULL),(2867,'沙洋县',264,0,3,NULL),(2868,'钟祥市',264,0,3,NULL),(2869,'云梦县',265,0,3,NULL),(2870,'大悟县',265,0,3,NULL),(2871,'孝南区',265,0,3,NULL),(2872,'孝昌县',265,0,3,NULL),(2873,'安陆市',265,0,3,NULL),(2874,'应城市',265,0,3,NULL),(2875,'汉川市',265,0,3,NULL),(2876,'公安县',266,0,3,NULL),(2877,'松滋市',266,0,3,NULL),(2878,'江陵县',266,0,3,NULL),(2879,'沙市区',266,0,3,NULL),(2880,'洪湖市',266,0,3,NULL),(2881,'监利县',266,0,3,NULL),(2882,'石首市',266,0,3,NULL),(2883,'荆州区',266,0,3,NULL),(2884,'团风县',267,0,3,NULL),(2885,'武穴市',267,0,3,NULL),(2886,'浠水县',267,0,3,NULL),(2887,'红安县',267,0,3,NULL),(2888,'罗田县',267,0,3,NULL),(2889,'英山县',267,0,3,NULL),(2890,'蕲春县',267,0,3,NULL),(2891,'麻城市',267,0,3,NULL),(2892,'黄州区',267,0,3,NULL),(2893,'黄梅县',267,0,3,NULL),(2894,'咸安区',268,0,3,NULL),(2895,'嘉鱼县',268,0,3,NULL),(2896,'崇阳县',268,0,3,NULL),(2897,'赤壁市',268,0,3,NULL),(2898,'通城县',268,0,3,NULL),(2899,'通山县',268,0,3,NULL),(2900,'广水市',269,0,3,NULL),(2901,'曾都区',269,0,3,NULL),(2902,'利川市',270,0,3,NULL),(2903,'咸丰县',270,0,3,NULL),(2904,'宣恩县',270,0,3,NULL),(2905,'巴东县',270,0,3,NULL),(2906,'建始县',270,0,3,NULL),(2907,'恩施市',270,0,3,NULL),(2908,'来凤县',270,0,3,NULL),(2909,'鹤峰县',270,0,3,NULL),(2910,'仙桃市',271,0,3,NULL),(2911,'潜江市',272,0,3,NULL),(2912,'天门市',273,0,3,NULL),(2913,'神农架林区',274,0,3,NULL),(2914,'天心区',275,0,3,NULL),(2915,'宁乡县',275,0,3,NULL),(2916,'岳麓区',275,0,3,NULL),(2917,'开福区',275,0,3,NULL),(2918,'望城县',275,0,3,NULL),(2919,'浏阳市',275,0,3,NULL),(2920,'芙蓉区',275,0,3,NULL),(2921,'长沙县',275,0,3,NULL),(2922,'雨花区',275,0,3,NULL),(2923,'天元区',276,0,3,NULL),(2924,'攸县',276,0,3,NULL),(2925,'株洲县',276,0,3,NULL),(2926,'炎陵县',276,0,3,NULL),(2927,'石峰区',276,0,3,NULL),(2928,'芦淞区',276,0,3,NULL),(2929,'茶陵县',276,0,3,NULL),(2930,'荷塘区',276,0,3,NULL),(2931,'醴陵市',276,0,3,NULL),(2932,'岳塘区',277,0,3,NULL),(2933,'湘乡市',277,0,3,NULL),(2934,'湘潭县',277,0,3,NULL),(2935,'雨湖区',277,0,3,NULL),(2936,'韶山市',277,0,3,NULL),(2937,'南岳区',278,0,3,NULL),(2938,'常宁市',278,0,3,NULL),(2939,'珠晖区',278,0,3,NULL),(2940,'石鼓区',278,0,3,NULL),(2941,'祁东县',278,0,3,NULL),(2942,'耒阳市',278,0,3,NULL),(2943,'蒸湘区',278,0,3,NULL),(2944,'衡东县',278,0,3,NULL),(2945,'衡南县',278,0,3,NULL),(2946,'衡山县',278,0,3,NULL),(2947,'衡阳县',278,0,3,NULL),(2948,'雁峰区',278,0,3,NULL),(2949,'北塔区',279,0,3,NULL),(2950,'双清区',279,0,3,NULL),(2951,'城步苗族自治县',279,0,3,NULL),(2952,'大祥区',279,0,3,NULL),(2953,'新宁县',279,0,3,NULL),(2954,'新邵县',279,0,3,NULL),(2955,'武冈市',279,0,3,NULL),(2956,'洞口县',279,0,3,NULL),(2957,'绥宁县',279,0,3,NULL),(2958,'邵东县',279,0,3,NULL),(2959,'邵阳县',279,0,3,NULL),(2960,'隆回县',279,0,3,NULL),(2961,'临湘市',280,0,3,NULL),(2962,'云溪区',280,0,3,NULL),(2963,'华容县',280,0,3,NULL),(2964,'君山区',280,0,3,NULL),(2965,'岳阳县',280,0,3,NULL),(2966,'岳阳楼区',280,0,3,NULL),(2967,'平江县',280,0,3,NULL),(2968,'汨罗市',280,0,3,NULL),(2969,'湘阴县',280,0,3,NULL),(2970,'临澧县',281,0,3,NULL),(2971,'安乡县',281,0,3,NULL),(2972,'桃源县',281,0,3,NULL),(2973,'武陵区',281,0,3,NULL),(2974,'汉寿县',281,0,3,NULL),(2975,'津市市',281,0,3,NULL),(2976,'澧县',281,0,3,NULL),(2977,'石门县',281,0,3,NULL),(2978,'鼎城区',281,0,3,NULL),(2979,'慈利县',282,0,3,NULL),(2980,'桑植县',282,0,3,NULL),(2981,'武陵源区',282,0,3,NULL),(2982,'永定区',282,0,3,NULL),(2983,'南县',283,0,3,NULL),(2984,'安化县',283,0,3,NULL),(2985,'桃江县',283,0,3,NULL),(2986,'沅江市',283,0,3,NULL),(2987,'资阳区',283,0,3,NULL),(2988,'赫山区',283,0,3,NULL),(2989,'临武县',284,0,3,NULL),(2990,'北湖区',284,0,3,NULL),(2991,'嘉禾县',284,0,3,NULL),(2992,'安仁县',284,0,3,NULL),(2993,'宜章县',284,0,3,NULL),(2994,'桂东县',284,0,3,NULL),(2995,'桂阳县',284,0,3,NULL),(2996,'永兴县',284,0,3,NULL),(2997,'汝城县',284,0,3,NULL),(2998,'苏仙区',284,0,3,NULL),(2999,'资兴市',284,0,3,NULL),(3000,'东安县',285,0,3,NULL),(3001,'冷水滩区',285,0,3,NULL),(3002,'双牌县',285,0,3,NULL),(3003,'宁远县',285,0,3,NULL),(3004,'新田县',285,0,3,NULL),(3005,'江华瑶族自治县',285,0,3,NULL),(3006,'江永县',285,0,3,NULL),(3007,'祁阳县',285,0,3,NULL),(3008,'蓝山县',285,0,3,NULL),(3009,'道县',285,0,3,NULL),(3010,'零陵区',285,0,3,NULL),(3011,'中方县',286,0,3,NULL),(3012,'会同县',286,0,3,NULL),(3013,'新晃侗族自治县',286,0,3,NULL),(3014,'沅陵县',286,0,3,NULL),(3015,'洪江市/洪江区',286,0,3,NULL),(3016,'溆浦县',286,0,3,NULL),(3017,'芷江侗族自治县',286,0,3,NULL),(3018,'辰溪县',286,0,3,NULL),(3019,'通道侗族自治县',286,0,3,NULL),(3020,'靖州苗族侗族自治县',286,0,3,NULL),(3021,'鹤城区',286,0,3,NULL),(3022,'麻阳苗族自治县',286,0,3,NULL),(3023,'冷水江市',287,0,3,NULL),(3024,'双峰县',287,0,3,NULL),(3025,'娄星区',287,0,3,NULL),(3026,'新化县',287,0,3,NULL),(3027,'涟源市',287,0,3,NULL),(3028,'保靖县',288,0,3,NULL),(3029,'凤凰县',288,0,3,NULL),(3030,'古丈县',288,0,3,NULL),(3031,'吉首市',288,0,3,NULL),(3032,'永顺县',288,0,3,NULL),(3033,'泸溪县',288,0,3,NULL),(3034,'花垣县',288,0,3,NULL),(3035,'龙山县',288,0,3,NULL),(3036,'萝岗区',289,0,3,NULL),(3037,'南沙区',289,0,3,NULL),(3038,'从化市',289,0,3,NULL),(3039,'增城市',289,0,3,NULL),(3040,'天河区',289,0,3,NULL),(3041,'海珠区',289,0,3,NULL),(3042,'番禺区',289,0,3,NULL),(3043,'白云区',289,0,3,NULL),(3044,'花都区',289,0,3,NULL),(3045,'荔湾区',289,0,3,NULL),(3046,'越秀区',289,0,3,NULL),(3047,'黄埔区',289,0,3,NULL),(3048,'乐昌市',290,0,3,NULL),(3049,'乳源瑶族自治县',290,0,3,NULL),(3050,'仁化县',290,0,3,NULL),(3051,'南雄市',290,0,3,NULL),(3052,'始兴县',290,0,3,NULL),(3053,'新丰县',290,0,3,NULL),(3054,'曲江区',290,0,3,NULL),(3055,'武江区',290,0,3,NULL),(3056,'浈江区',290,0,3,NULL),(3057,'翁源县',290,0,3,NULL),(3058,'南山区',291,0,3,NULL),(3059,'宝安区',291,0,3,NULL),(3060,'盐田区',291,0,3,NULL),(3061,'福田区',291,0,3,NULL),(3062,'罗湖区',291,0,3,NULL),(3063,'龙岗区',291,0,3,NULL),(3064,'斗门区',292,0,3,NULL),(3065,'金湾区',292,0,3,NULL),(3066,'香洲区',292,0,3,NULL),(3067,'南澳县',293,0,3,NULL),(3068,'潮南区',293,0,3,NULL),(3069,'潮阳区',293,0,3,NULL),(3070,'澄海区',293,0,3,NULL),(3071,'濠江区',293,0,3,NULL),(3072,'金平区',293,0,3,NULL),(3073,'龙湖区',293,0,3,NULL),(3074,'三水区',294,0,3,NULL),(3075,'南海区',294,0,3,NULL),(3076,'禅城区',294,0,3,NULL),(3077,'顺德区',294,0,3,NULL),(3078,'高明区',294,0,3,NULL),(3079,'台山市',295,0,3,NULL),(3080,'开平市',295,0,3,NULL),(3081,'恩平市',295,0,3,NULL),(3082,'新会区',295,0,3,NULL),(3083,'江海区',295,0,3,NULL),(3084,'蓬江区',295,0,3,NULL),(3085,'鹤山市',295,0,3,NULL),(3086,'吴川市',296,0,3,NULL),(3087,'坡头区',296,0,3,NULL),(3088,'廉江市',296,0,3,NULL),(3089,'徐闻县',296,0,3,NULL),(3090,'赤坎区',296,0,3,NULL),(3091,'遂溪县',296,0,3,NULL),(3092,'雷州市',296,0,3,NULL),(3093,'霞山区',296,0,3,NULL),(3094,'麻章区',296,0,3,NULL),(3095,'信宜市',297,0,3,NULL),(3096,'化州市',297,0,3,NULL),(3097,'电白县',297,0,3,NULL),(3098,'茂南区',297,0,3,NULL),(3099,'茂港区',297,0,3,NULL),(3100,'高州市',297,0,3,NULL),(3101,'四会市',298,0,3,NULL),(3102,'封开县',298,0,3,NULL),(3103,'广宁县',298,0,3,NULL),(3104,'德庆县',298,0,3,NULL),(3105,'怀集县',298,0,3,NULL),(3106,'端州区',298,0,3,NULL),(3107,'高要市',298,0,3,NULL),(3108,'鼎湖区',298,0,3,NULL),(3109,'博罗县',299,0,3,NULL),(3110,'惠东县',299,0,3,NULL),(3111,'惠城区',299,0,3,NULL),(3112,'惠阳区',299,0,3,NULL),(3113,'龙门县',299,0,3,NULL),(3114,'丰顺县',300,0,3,NULL),(3115,'五华县',300,0,3,NULL),(3116,'兴宁市',300,0,3,NULL),(3117,'大埔县',300,0,3,NULL),(3118,'平远县',300,0,3,NULL),(3119,'梅县',300,0,3,NULL),(3120,'梅江区',300,0,3,NULL),(3121,'蕉岭县',300,0,3,NULL),(3122,'城区',301,0,3,NULL),(3123,'海丰县',301,0,3,NULL),(3124,'陆丰市',301,0,3,NULL),(3125,'陆河县',301,0,3,NULL),(3126,'东源县',302,0,3,NULL),(3127,'和平县',302,0,3,NULL),(3128,'源城区',302,0,3,NULL),(3129,'紫金县',302,0,3,NULL),(3130,'连平县',302,0,3,NULL),(3131,'龙川县',302,0,3,NULL),(3132,'江城区',303,0,3,NULL),(3133,'阳东县',303,0,3,NULL),(3134,'阳春市',303,0,3,NULL),(3135,'阳西县',303,0,3,NULL),(3136,'佛冈县',304,0,3,NULL),(3137,'清城区',304,0,3,NULL),(3138,'清新县',304,0,3,NULL),(3139,'英德市',304,0,3,NULL),(3140,'连南瑶族自治县',304,0,3,NULL),(3141,'连山壮族瑶族自治县',304,0,3,NULL),(3142,'连州市',304,0,3,NULL),(3143,'阳山县',304,0,3,NULL),(3144,'东莞市',305,0,3,NULL),(3145,'中山市',306,0,3,NULL),(3146,'湘桥区',307,0,3,NULL),(3147,'潮安县',307,0,3,NULL),(3148,'饶平县',307,0,3,NULL),(3149,'惠来县',308,0,3,NULL),(3150,'揭东县',308,0,3,NULL),(3151,'揭西县',308,0,3,NULL),(3152,'普宁市',308,0,3,NULL),(3153,'榕城区',308,0,3,NULL),(3154,'云城区',309,0,3,NULL),(3155,'云安县',309,0,3,NULL),(3156,'新兴县',309,0,3,NULL),(3157,'罗定市',309,0,3,NULL),(3158,'郁南县',309,0,3,NULL),(3159,'上林县',310,0,3,NULL),(3160,'兴宁区',310,0,3,NULL),(3161,'宾阳县',310,0,3,NULL),(3162,'横县',310,0,3,NULL),(3163,'武鸣县',310,0,3,NULL),(3164,'江南区',310,0,3,NULL),(3165,'良庆区',310,0,3,NULL),(3166,'西乡塘区',310,0,3,NULL),(3167,'邕宁区',310,0,3,NULL),(3168,'隆安县',310,0,3,NULL),(3169,'青秀区',310,0,3,NULL),(3170,'马山县',310,0,3,NULL),(3171,'三江侗族自治县',311,0,3,NULL),(3172,'城中区',311,0,3,NULL),(3173,'柳北区',311,0,3,NULL),(3174,'柳南区',311,0,3,NULL),(3175,'柳城县',311,0,3,NULL),(3176,'柳江县',311,0,3,NULL),(3177,'融安县',311,0,3,NULL),(3178,'融水苗族自治县',311,0,3,NULL),(3179,'鱼峰区',311,0,3,NULL),(3180,'鹿寨县',311,0,3,NULL),(3181,'七星区',312,0,3,NULL),(3182,'临桂县',312,0,3,NULL),(3183,'全州县',312,0,3,NULL),(3184,'兴安县',312,0,3,NULL),(3185,'叠彩区',312,0,3,NULL),(3186,'平乐县',312,0,3,NULL),(3187,'恭城瑶族自治县',312,0,3,NULL),(3188,'永福县',312,0,3,NULL),(3189,'灌阳县',312,0,3,NULL),(3190,'灵川县',312,0,3,NULL),(3191,'秀峰区',312,0,3,NULL),(3192,'荔浦县',312,0,3,NULL),(3193,'象山区',312,0,3,NULL),(3194,'资源县',312,0,3,NULL),(3195,'阳朔县',312,0,3,NULL),(3196,'雁山区',312,0,3,NULL),(3197,'龙胜各族自治县',312,0,3,NULL),(3198,'万秀区',313,0,3,NULL),(3199,'岑溪市',313,0,3,NULL),(3200,'苍梧县',313,0,3,NULL),(3201,'蒙山县',313,0,3,NULL),(3202,'藤县',313,0,3,NULL),(3203,'蝶山区',313,0,3,NULL),(3204,'长洲区',313,0,3,NULL),(3205,'合浦县',314,0,3,NULL),(3206,'海城区',314,0,3,NULL),(3207,'铁山港区',314,0,3,NULL),(3208,'银海区',314,0,3,NULL),(3209,'上思县',315,0,3,NULL),(3210,'东兴市',315,0,3,NULL),(3211,'港口区',315,0,3,NULL),(3212,'防城区',315,0,3,NULL),(3213,'浦北县',316,0,3,NULL),(3214,'灵山县',316,0,3,NULL),(3215,'钦北区',316,0,3,NULL),(3216,'钦南区',316,0,3,NULL),(3217,'平南县',317,0,3,NULL),(3218,'桂平市',317,0,3,NULL),(3219,'港北区',317,0,3,NULL),(3220,'港南区',317,0,3,NULL),(3221,'覃塘区',317,0,3,NULL),(3222,'兴业县',318,0,3,NULL),(3223,'北流市',318,0,3,NULL),(3224,'博白县',318,0,3,NULL),(3225,'容县',318,0,3,NULL),(3226,'玉州区',318,0,3,NULL),(3227,'陆川县',318,0,3,NULL),(3228,'乐业县',319,0,3,NULL),(3229,'凌云县',319,0,3,NULL),(3230,'右江区',319,0,3,NULL),(3231,'平果县',319,0,3,NULL),(3232,'德保县',319,0,3,NULL),(3233,'田东县',319,0,3,NULL),(3234,'田林县',319,0,3,NULL),(3235,'田阳县',319,0,3,NULL),(3236,'西林县',319,0,3,NULL),(3237,'那坡县',319,0,3,NULL),(3238,'隆林各族自治县',319,0,3,NULL),(3239,'靖西县',319,0,3,NULL),(3240,'八步区',320,0,3,NULL),(3241,'富川瑶族自治县',320,0,3,NULL),(3242,'昭平县',320,0,3,NULL),(3243,'钟山县',320,0,3,NULL),(3244,'东兰县',321,0,3,NULL),(3245,'凤山县',321,0,3,NULL),(3246,'南丹县',321,0,3,NULL),(3247,'大化瑶族自治县',321,0,3,NULL),(3248,'天峨县',321,0,3,NULL),(3249,'宜州市',321,0,3,NULL),(3250,'巴马瑶族自治县',321,0,3,NULL),(3251,'环江毛南族自治县',321,0,3,NULL),(3252,'罗城仫佬族自治县',321,0,3,NULL),(3253,'都安瑶族自治县',321,0,3,NULL),(3254,'金城江区',321,0,3,NULL),(3255,'兴宾区',322,0,3,NULL),(3256,'合山市',322,0,3,NULL),(3257,'忻城县',322,0,3,NULL),(3258,'武宣县',322,0,3,NULL),(3259,'象州县',322,0,3,NULL),(3260,'金秀瑶族自治县',322,0,3,NULL),(3261,'凭祥市',323,0,3,NULL),(3262,'大新县',323,0,3,NULL),(3263,'天等县',323,0,3,NULL),(3264,'宁明县',323,0,3,NULL),(3265,'扶绥县',323,0,3,NULL),(3266,'江州区',323,0,3,NULL),(3267,'龙州县',323,0,3,NULL),(3268,'琼山区',324,0,3,NULL),(3269,'秀英区',324,0,3,NULL),(3270,'美兰区',324,0,3,NULL),(3271,'龙华区',324,0,3,NULL),(3272,'三亚市',325,0,3,NULL),(3273,'五指山市',326,0,3,NULL),(3274,'琼海市',327,0,3,NULL),(3275,'儋州市',328,0,3,NULL),(3276,'文昌市',329,0,3,NULL),(3277,'万宁市',330,0,3,NULL),(3278,'东方市',331,0,3,NULL),(3279,'定安县',332,0,3,NULL),(3280,'屯昌县',333,0,3,NULL),(3281,'澄迈县',334,0,3,NULL),(3282,'临高县',335,0,3,NULL),(3283,'白沙黎族自治县',336,0,3,NULL),(3284,'昌江黎族自治县',337,0,3,NULL),(3285,'乐东黎族自治县',338,0,3,NULL),(3286,'陵水黎族自治县',339,0,3,NULL),(3287,'保亭黎族苗族自治县',340,0,3,NULL),(3288,'琼中黎族苗族自治县',341,0,3,NULL),(4209,'双流县',385,0,3,NULL),(4210,'大邑县',385,0,3,NULL),(4211,'崇州市',385,0,3,NULL),(4212,'彭州市',385,0,3,NULL),(4213,'成华区',385,0,3,NULL),(4214,'新津县',385,0,3,NULL),(4215,'新都区',385,0,3,NULL),(4216,'武侯区',385,0,3,NULL),(4217,'温江区',385,0,3,NULL),(4218,'蒲江县',385,0,3,NULL),(4219,'邛崃市',385,0,3,NULL),(4220,'郫县',385,0,3,NULL),(4221,'都江堰市',385,0,3,NULL),(4222,'金堂县',385,0,3,NULL),(4223,'金牛区',385,0,3,NULL),(4224,'锦江区',385,0,3,NULL),(4225,'青白江区',385,0,3,NULL),(4226,'青羊区',385,0,3,NULL),(4227,'龙泉驿区',385,0,3,NULL),(4228,'大安区',386,0,3,NULL),(4229,'富顺县',386,0,3,NULL),(4230,'沿滩区',386,0,3,NULL),(4231,'自流井区',386,0,3,NULL),(4232,'荣县',386,0,3,NULL),(4233,'贡井区',386,0,3,NULL),(4234,'东区',387,0,3,NULL),(4235,'仁和区',387,0,3,NULL),(4236,'盐边县',387,0,3,NULL),(4237,'米易县',387,0,3,NULL),(4238,'西区',387,0,3,NULL),(4239,'叙永县',388,0,3,NULL),(4240,'古蔺县',388,0,3,NULL),(4241,'合江县',388,0,3,NULL),(4242,'江阳区',388,0,3,NULL),(4243,'泸县',388,0,3,NULL),(4244,'纳溪区',388,0,3,NULL),(4245,'龙马潭区',388,0,3,NULL),(4246,'中江县',389,0,3,NULL),(4247,'什邡市',389,0,3,NULL),(4248,'广汉市',389,0,3,NULL),(4249,'旌阳区',389,0,3,NULL),(4250,'绵竹市',389,0,3,NULL),(4251,'罗江县',389,0,3,NULL),(4252,'三台县',390,0,3,NULL),(4253,'北川羌族自治县',390,0,3,NULL),(4254,'安县',390,0,3,NULL),(4255,'平武县',390,0,3,NULL),(4256,'梓潼县',390,0,3,NULL),(4257,'江油市',390,0,3,NULL),(4258,'涪城区',390,0,3,NULL),(4259,'游仙区',390,0,3,NULL),(4260,'盐亭县',390,0,3,NULL),(4261,'元坝区',391,0,3,NULL),(4262,'利州区',391,0,3,NULL),(4263,'剑阁县',391,0,3,NULL),(4264,'旺苍县',391,0,3,NULL),(4265,'朝天区',391,0,3,NULL),(4266,'苍溪县',391,0,3,NULL),(4267,'青川县',391,0,3,NULL),(4268,'大英县',392,0,3,NULL),(4269,'安居区',392,0,3,NULL),(4270,'射洪县',392,0,3,NULL),(4271,'船山区',392,0,3,NULL),(4272,'蓬溪县',392,0,3,NULL),(4273,'东兴区',393,0,3,NULL),(4274,'威远县',393,0,3,NULL),(4275,'市中区',393,0,3,NULL),(4276,'资中县',393,0,3,NULL),(4277,'隆昌县',393,0,3,NULL),(4278,'五通桥区',394,0,3,NULL),(4279,'井研县',394,0,3,NULL),(4280,'夹江县',394,0,3,NULL),(4281,'峨眉山市',394,0,3,NULL),(4282,'峨边彝族自治县',394,0,3,NULL),(4283,'市中区',394,0,3,NULL),(4284,'沐川县',394,0,3,NULL),(4285,'沙湾区',394,0,3,NULL),(4286,'犍为县',394,0,3,NULL),(4287,'金口河区',394,0,3,NULL),(4288,'马边彝族自治县',394,0,3,NULL),(4289,'仪陇县',395,0,3,NULL),(4290,'南充市嘉陵区',395,0,3,NULL),(4291,'南部县',395,0,3,NULL),(4292,'嘉陵区',395,0,3,NULL),(4293,'营山县',395,0,3,NULL),(4294,'蓬安县',395,0,3,NULL),(4295,'西充县',395,0,3,NULL),(4296,'阆中市',395,0,3,NULL),(4297,'顺庆区',395,0,3,NULL),(4298,'高坪区',395,0,3,NULL),(4299,'东坡区',396,0,3,NULL),(4300,'丹棱县',396,0,3,NULL),(4301,'仁寿县',396,0,3,NULL),(4302,'彭山县',396,0,3,NULL),(4303,'洪雅县',396,0,3,NULL),(4304,'青神县',396,0,3,NULL),(4305,'兴文县',397,0,3,NULL),(4306,'南溪县',397,0,3,NULL),(4307,'宜宾县',397,0,3,NULL),(4308,'屏山县',397,0,3,NULL),(4309,'江安县',397,0,3,NULL),(4310,'珙县',397,0,3,NULL),(4311,'筠连县',397,0,3,NULL),(4312,'翠屏区',397,0,3,NULL),(4313,'长宁县',397,0,3,NULL),(4314,'高县',397,0,3,NULL),(4315,'华蓥市',398,0,3,NULL),(4316,'岳池县',398,0,3,NULL),(4317,'广安区',398,0,3,NULL),(4318,'武胜县',398,0,3,NULL),(4319,'邻水县',398,0,3,NULL),(4320,'万源市',399,0,3,NULL),(4321,'大竹县',399,0,3,NULL),(4322,'宣汉县',399,0,3,NULL),(4323,'开江县',399,0,3,NULL),(4324,'渠县',399,0,3,NULL),(4325,'达县',399,0,3,NULL),(4326,'通川区',399,0,3,NULL),(4327,'名山县',400,0,3,NULL),(4328,'天全县',400,0,3,NULL),(4329,'宝兴县',400,0,3,NULL),(4330,'汉源县',400,0,3,NULL),(4331,'石棉县',400,0,3,NULL),(4332,'芦山县',400,0,3,NULL),(4333,'荥经县',400,0,3,NULL),(4334,'雨城区',400,0,3,NULL),(4335,'南江县',401,0,3,NULL),(4336,'巴州区',401,0,3,NULL),(4337,'平昌县',401,0,3,NULL),(4338,'通江县',401,0,3,NULL),(4339,'乐至县',402,0,3,NULL),(4340,'安岳县',402,0,3,NULL),(4341,'简阳市',402,0,3,NULL),(4342,'雁江区',402,0,3,NULL),(4343,'九寨沟县',403,0,3,NULL),(4344,'壤塘县',403,0,3,NULL),(4345,'小金县',403,0,3,NULL),(4346,'松潘县',403,0,3,NULL),(4347,'汶川县',403,0,3,NULL),(4348,'理县',403,0,3,NULL),(4349,'红原县',403,0,3,NULL),(4350,'若尔盖县',403,0,3,NULL),(4351,'茂县',403,0,3,NULL),(4352,'金川县',403,0,3,NULL),(4353,'阿坝县',403,0,3,NULL),(4354,'马尔康县',403,0,3,NULL),(4355,'黑水县',403,0,3,NULL),(4356,'丹巴县',404,0,3,NULL),(4357,'乡城县',404,0,3,NULL),(4358,'巴塘县',404,0,3,NULL),(4359,'康定县',404,0,3,NULL),(4360,'得荣县',404,0,3,NULL),(4361,'德格县',404,0,3,NULL),(4362,'新龙县',404,0,3,NULL),(4363,'泸定县',404,0,3,NULL),(4364,'炉霍县',404,0,3,NULL),(4365,'理塘县',404,0,3,NULL),(4366,'甘孜县',404,0,3,NULL),(4367,'白玉县',404,0,3,NULL),(4368,'石渠县',404,0,3,NULL),(4369,'稻城县',404,0,3,NULL),(4370,'色达县',404,0,3,NULL),(4371,'道孚县',404,0,3,NULL),(4372,'雅江县',404,0,3,NULL),(4373,'会东县',405,0,3,NULL),(4374,'会理县',405,0,3,NULL),(4375,'冕宁县',405,0,3,NULL),(4376,'喜德县',405,0,3,NULL),(4377,'宁南县',405,0,3,NULL),(4378,'布拖县',405,0,3,NULL),(4379,'德昌县',405,0,3,NULL),(4380,'昭觉县',405,0,3,NULL),(4381,'普格县',405,0,3,NULL),(4382,'木里藏族自治县',405,0,3,NULL),(4383,'甘洛县',405,0,3,NULL),(4384,'盐源县',405,0,3,NULL),(4385,'美姑县',405,0,3,NULL),(4386,'西昌',405,0,3,NULL),(4387,'越西县',405,0,3,NULL),(4388,'金阳县',405,0,3,NULL),(4389,'雷波县',405,0,3,NULL),(4390,'乌当区',406,0,3,NULL),(4391,'云岩区',406,0,3,NULL),(4392,'修文县',406,0,3,NULL),(4393,'南明区',406,0,3,NULL),(4394,'小河区',406,0,3,NULL),(4395,'开阳县',406,0,3,NULL),(4396,'息烽县',406,0,3,NULL),(4397,'清镇市',406,0,3,NULL),(4398,'白云区',406,0,3,NULL),(4399,'花溪区',406,0,3,NULL),(4400,'六枝特区',407,0,3,NULL),(4401,'水城县',407,0,3,NULL),(4402,'盘县',407,0,3,NULL),(4403,'钟山区',407,0,3,NULL),(4404,'习水县',408,0,3,NULL),(4405,'仁怀市',408,0,3,NULL),(4406,'余庆县',408,0,3,NULL),(4407,'凤冈县',408,0,3,NULL),(4408,'务川仡佬族苗族自治县',408,0,3,NULL),(4409,'桐梓县',408,0,3,NULL),(4410,'正安县',408,0,3,NULL),(4411,'汇川区',408,0,3,NULL),(4412,'湄潭县',408,0,3,NULL),(4413,'红花岗区',408,0,3,NULL),(4414,'绥阳县',408,0,3,NULL),(4415,'赤水市',408,0,3,NULL),(4416,'道真仡佬族苗族自治县',408,0,3,NULL),(4417,'遵义县',408,0,3,NULL),(4418,'关岭布依族苗族自治县',409,0,3,NULL),(4419,'平坝县',409,0,3,NULL),(4420,'普定县',409,0,3,NULL),(4421,'紫云苗族布依族自治县',409,0,3,NULL),(4422,'西秀区',409,0,3,NULL),(4423,'镇宁布依族苗族自治县',409,0,3,NULL),(4424,'万山特区',410,0,3,NULL),(4425,'印江土家族苗族自治县',410,0,3,NULL),(4426,'德江县',410,0,3,NULL),(4427,'思南县',410,0,3,NULL),(4428,'松桃苗族自治县',410,0,3,NULL),(4429,'江口县',410,0,3,NULL),(4430,'沿河土家族自治县',410,0,3,NULL),(4431,'玉屏侗族自治县',410,0,3,NULL),(4432,'石阡县',410,0,3,NULL),(4433,'铜仁市',410,0,3,NULL),(4434,'兴义市',411,0,3,NULL),(4435,'兴仁县',411,0,3,NULL),(4436,'册亨县',411,0,3,NULL),(4437,'安龙县',411,0,3,NULL),(4438,'普安县',411,0,3,NULL),(4439,'晴隆县',411,0,3,NULL),(4440,'望谟县',411,0,3,NULL),(4441,'贞丰县',411,0,3,NULL),(4442,'大方县',412,0,3,NULL),(4443,'威宁彝族回族苗族自治县',412,0,3,NULL),(4444,'毕节市',412,0,3,NULL),(4445,'纳雍县',412,0,3,NULL),(4446,'织金县',412,0,3,NULL),(4447,'赫章县',412,0,3,NULL),(4448,'金沙县',412,0,3,NULL),(4449,'黔西县',412,0,3,NULL),(4450,'三穗县',413,0,3,NULL),(4451,'丹寨县',413,0,3,NULL),(4452,'从江县',413,0,3,NULL),(4453,'凯里市',413,0,3,NULL),(4454,'剑河县',413,0,3,NULL),(4455,'台江县',413,0,3,NULL),(4456,'天柱县',413,0,3,NULL),(4457,'岑巩县',413,0,3,NULL),(4458,'施秉县',413,0,3,NULL),(4459,'榕江县',413,0,3,NULL),(4460,'锦屏县',413,0,3,NULL),(4461,'镇远县',413,0,3,NULL),(4462,'雷山县',413,0,3,NULL),(4463,'麻江县',413,0,3,NULL),(4464,'黄平县',413,0,3,NULL),(4465,'黎平县',413,0,3,NULL),(4466,'三都水族自治县',414,0,3,NULL),(4467,'平塘县',414,0,3,NULL),(4468,'惠水县',414,0,3,NULL),(4469,'独山县',414,0,3,NULL),(4470,'瓮安县',414,0,3,NULL),(4471,'福泉市',414,0,3,NULL),(4472,'罗甸县',414,0,3,NULL),(4473,'荔波县',414,0,3,NULL),(4474,'贵定县',414,0,3,NULL),(4475,'都匀市',414,0,3,NULL),(4476,'长顺县',414,0,3,NULL),(4477,'龙里县',414,0,3,NULL),(4478,'东川区',415,0,3,NULL),(4479,'五华区',415,0,3,NULL),(4480,'呈贡县',415,0,3,NULL),(4481,'安宁市',415,0,3,NULL),(4482,'官渡区',415,0,3,NULL),(4483,'宜良县',415,0,3,NULL),(4484,'富民县',415,0,3,NULL),(4485,'寻甸回族彝族自治县',415,0,3,NULL),(4486,'嵩明县',415,0,3,NULL),(4487,'晋宁县',415,0,3,NULL),(4488,'盘龙区',415,0,3,NULL),(4489,'石林彝族自治县',415,0,3,NULL),(4490,'禄劝彝族苗族自治县',415,0,3,NULL),(4491,'西山区',415,0,3,NULL),(4492,'会泽县',416,0,3,NULL),(4493,'宣威市',416,0,3,NULL),(4494,'富源县',416,0,3,NULL),(4495,'师宗县',416,0,3,NULL),(4496,'沾益县',416,0,3,NULL),(4497,'罗平县',416,0,3,NULL),(4498,'陆良县',416,0,3,NULL),(4499,'马龙县',416,0,3,NULL),(4500,'麒麟区',416,0,3,NULL),(4501,'元江哈尼族彝族傣族自治县',417,0,3,NULL),(4502,'华宁县',417,0,3,NULL),(4503,'峨山彝族自治县',417,0,3,NULL),(4504,'新平彝族傣族自治县',417,0,3,NULL),(4505,'易门县',417,0,3,NULL),(4506,'江川县',417,0,3,NULL),(4507,'澄江县',417,0,3,NULL),(4508,'红塔区',417,0,3,NULL),(4509,'通海县',417,0,3,NULL),(4510,'施甸县',418,0,3,NULL),(4511,'昌宁县',418,0,3,NULL),(4512,'腾冲县',418,0,3,NULL),(4513,'隆阳区',418,0,3,NULL),(4514,'龙陵县',418,0,3,NULL),(4515,'大关县',419,0,3,NULL),(4516,'威信县',419,0,3,NULL),(4517,'巧家县',419,0,3,NULL),(4518,'彝良县',419,0,3,NULL),(4519,'昭阳区',419,0,3,NULL),(4520,'水富县',419,0,3,NULL),(4521,'永善县',419,0,3,NULL),(4522,'盐津县',419,0,3,NULL),(4523,'绥江县',419,0,3,NULL),(4524,'镇雄县',419,0,3,NULL),(4525,'鲁甸县',419,0,3,NULL),(4526,'华坪县',420,0,3,NULL),(4527,'古城区',420,0,3,NULL),(4528,'宁蒗彝族自治县',420,0,3,NULL),(4529,'永胜县',420,0,3,NULL),(4530,'玉龙纳西族自治县',420,0,3,NULL),(4531,'临翔区',422,0,3,NULL),(4532,'云县',422,0,3,NULL),(4533,'凤庆县',422,0,3,NULL),(4534,'双江拉祜族佤族布朗族傣族自治县',422,0,3,NULL),(4535,'永德县',422,0,3,NULL),(4536,'沧源佤族自治县',422,0,3,NULL),(4537,'耿马傣族佤族自治县',422,0,3,NULL),(4538,'镇康县',422,0,3,NULL),(4539,'元谋县',423,0,3,NULL),(4540,'南华县',423,0,3,NULL),(4541,'双柏县',423,0,3,NULL),(4542,'大姚县',423,0,3,NULL),(4543,'姚安县',423,0,3,NULL),(4544,'楚雄市',423,0,3,NULL),(4545,'武定县',423,0,3,NULL),(4546,'永仁县',423,0,3,NULL),(4547,'牟定县',423,0,3,NULL),(4548,'禄丰县',423,0,3,NULL),(4549,'个旧市',424,0,3,NULL),(4550,'元阳县',424,0,3,NULL),(4551,'屏边苗族自治县',424,0,3,NULL),(4552,'建水县',424,0,3,NULL),(4553,'开远市',424,0,3,NULL),(4554,'弥勒县',424,0,3,NULL),(4555,'河口瑶族自治县',424,0,3,NULL),(4556,'泸西县',424,0,3,NULL),(4557,'石屏县',424,0,3,NULL),(4558,'红河县',424,0,3,NULL),(4559,'绿春县',424,0,3,NULL),(4560,'蒙自县',424,0,3,NULL),(4561,'金平苗族瑶族傣族自治县',424,0,3,NULL),(4562,'丘北县',425,0,3,NULL),(4563,'富宁县',425,0,3,NULL),(4564,'广南县',425,0,3,NULL),(4565,'文山县',425,0,3,NULL),(4566,'砚山县',425,0,3,NULL),(4567,'西畴县',425,0,3,NULL),(4568,'马关县',425,0,3,NULL),(4569,'麻栗坡县',425,0,3,NULL),(4570,'勐海县',426,0,3,NULL),(4571,'勐腊县',426,0,3,NULL),(4572,'景洪市',426,0,3,NULL),(4573,'云龙县',427,0,3,NULL),(4574,'剑川县',427,0,3,NULL),(4575,'南涧彝族自治县',427,0,3,NULL),(4576,'大理市',427,0,3,NULL),(4577,'宾川县',427,0,3,NULL),(4578,'巍山彝族回族自治县',427,0,3,NULL),(4579,'弥渡县',427,0,3,NULL),(4580,'永平县',427,0,3,NULL),(4581,'洱源县',427,0,3,NULL),(4582,'漾濞彝族自治县',427,0,3,NULL),(4583,'祥云县',427,0,3,NULL),(4584,'鹤庆县',427,0,3,NULL),(4585,'梁河县',428,0,3,NULL),(4586,'潞西市',428,0,3,NULL),(4587,'瑞丽市',428,0,3,NULL),(4588,'盈江县',428,0,3,NULL),(4589,'陇川县',428,0,3,NULL),(4590,'德钦县',430,0,3,NULL),(4591,'维西傈僳族自治县',430,0,3,NULL),(4592,'香格里拉县',430,0,3,NULL),(4593,'城关区',431,0,3,NULL),(4594,'堆龙德庆县',431,0,3,NULL),(4595,'墨竹工卡县',431,0,3,NULL),(4596,'尼木县',431,0,3,NULL),(4597,'当雄县',431,0,3,NULL),(4598,'曲水县',431,0,3,NULL),(4599,'林周县',431,0,3,NULL),(4600,'达孜县',431,0,3,NULL),(4601,'丁青县',432,0,3,NULL),(4602,'八宿县',432,0,3,NULL),(4603,'察雅县',432,0,3,NULL),(4604,'左贡县',432,0,3,NULL),(4605,'昌都县',432,0,3,NULL),(4606,'江达县',432,0,3,NULL),(4607,'洛隆县',432,0,3,NULL),(4608,'类乌齐县',432,0,3,NULL),(4609,'芒康县',432,0,3,NULL),(4610,'贡觉县',432,0,3,NULL),(4611,'边坝县',432,0,3,NULL),(4612,'乃东县',433,0,3,NULL),(4613,'加查县',433,0,3,NULL),(4614,'扎囊县',433,0,3,NULL),(4615,'措美县',433,0,3,NULL),(4616,'曲松县',433,0,3,NULL),(4617,'桑日县',433,0,3,NULL),(4618,'洛扎县',433,0,3,NULL),(4619,'浪卡子县',433,0,3,NULL),(4620,'琼结县',433,0,3,NULL),(4621,'贡嘎县',433,0,3,NULL),(4622,'错那县',433,0,3,NULL),(4623,'隆子县',433,0,3,NULL),(4624,'亚东县',434,0,3,NULL),(4625,'仁布县',434,0,3,NULL),(4626,'仲巴县',434,0,3,NULL),(4627,'南木林县',434,0,3,NULL),(4628,'吉隆县',434,0,3,NULL),(4629,'定日县',434,0,3,NULL),(4630,'定结县',434,0,3,NULL),(4631,'岗巴县',434,0,3,NULL),(4632,'康马县',434,0,3,NULL),(4633,'拉孜县',434,0,3,NULL),(4634,'日喀则市',434,0,3,NULL),(4635,'昂仁县',434,0,3,NULL),(4636,'江孜县',434,0,3,NULL),(4637,'白朗县',434,0,3,NULL),(4638,'聂拉木县',434,0,3,NULL),(4639,'萨嘎县',434,0,3,NULL),(4640,'萨迦县',434,0,3,NULL),(4641,'谢通门县',434,0,3,NULL),(4642,'嘉黎县',435,0,3,NULL),(4643,'安多县',435,0,3,NULL),(4644,'尼玛县',435,0,3,NULL),(4645,'巴青县',435,0,3,NULL),(4646,'比如县',435,0,3,NULL),(4647,'班戈县',435,0,3,NULL),(4648,'申扎县',435,0,3,NULL),(4649,'索县',435,0,3,NULL),(4650,'聂荣县',435,0,3,NULL),(4651,'那曲县',435,0,3,NULL),(4652,'噶尔县',436,0,3,NULL),(4653,'措勤县',436,0,3,NULL),(4654,'改则县',436,0,3,NULL),(4655,'日土县',436,0,3,NULL),(4656,'普兰县',436,0,3,NULL),(4657,'札达县',436,0,3,NULL),(4658,'革吉县',436,0,3,NULL),(4659,'墨脱县',437,0,3,NULL),(4660,'察隅县',437,0,3,NULL),(4661,'工布江达县',437,0,3,NULL),(4662,'朗县',437,0,3,NULL),(4663,'林芝县',437,0,3,NULL),(4664,'波密县',437,0,3,NULL),(4665,'米林县',437,0,3,NULL),(4666,'临潼区',438,0,3,NULL),(4667,'周至县',438,0,3,NULL),(4668,'户县',438,0,3,NULL),(4669,'新城区',438,0,3,NULL),(4670,'未央区',438,0,3,NULL),(4671,'灞桥区',438,0,3,NULL),(4672,'碑林区',438,0,3,NULL),(4673,'莲湖区',438,0,3,NULL),(4674,'蓝田县',438,0,3,NULL),(4675,'长安区',438,0,3,NULL),(4676,'阎良区',438,0,3,NULL),(4677,'雁塔区',438,0,3,NULL),(4678,'高陵县',438,0,3,NULL),(4679,'印台区',439,0,3,NULL),(4680,'宜君县',439,0,3,NULL),(4681,'王益区',439,0,3,NULL),(4682,'耀州区',439,0,3,NULL),(4683,'凤县',440,0,3,NULL),(4684,'凤翔县',440,0,3,NULL),(4685,'千阳县',440,0,3,NULL),(4686,'太白县',440,0,3,NULL),(4687,'岐山县',440,0,3,NULL),(4688,'扶风县',440,0,3,NULL),(4689,'渭滨区',440,0,3,NULL),(4690,'眉县',440,0,3,NULL),(4691,'金台区',440,0,3,NULL),(4692,'陇县',440,0,3,NULL),(4693,'陈仓区',440,0,3,NULL),(4694,'麟游县',440,0,3,NULL),(4695,'三原县',441,0,3,NULL),(4696,'干县',441,0,3,NULL),(4697,'兴平市',441,0,3,NULL),(4698,'彬县',441,0,3,NULL),(4699,'旬邑县',441,0,3,NULL),(4700,'杨陵区',441,0,3,NULL),(4701,'武功县',441,0,3,NULL),(4702,'永寿县',441,0,3,NULL),(4703,'泾阳县',441,0,3,NULL),(4704,'淳化县',441,0,3,NULL),(4705,'渭城区',441,0,3,NULL),(4706,'礼泉县',441,0,3,NULL),(4707,'秦都区',441,0,3,NULL),(4708,'长武县',441,0,3,NULL),(4709,'临渭区',442,0,3,NULL),(4710,'华县',442,0,3,NULL),(4711,'华阴市',442,0,3,NULL),(4712,'合阳县',442,0,3,NULL),(4713,'大荔县',442,0,3,NULL),(4714,'富平县',442,0,3,NULL),(4715,'潼关县',442,0,3,NULL),(4716,'澄城县',442,0,3,NULL),(4717,'白水县',442,0,3,NULL),(4718,'蒲城县',442,0,3,NULL),(4719,'韩城市',442,0,3,NULL),(4720,'吴起县',443,0,3,NULL),(4721,'子长县',443,0,3,NULL),(4722,'安塞县',443,0,3,NULL),(4723,'宜川县',443,0,3,NULL),(4724,'宝塔区',443,0,3,NULL),(4725,'富县',443,0,3,NULL),(4726,'延川县',443,0,3,NULL),(4727,'延长县',443,0,3,NULL),(4728,'志丹县',443,0,3,NULL),(4729,'洛川县',443,0,3,NULL),(4730,'甘泉县',443,0,3,NULL),(4731,'黄陵县',443,0,3,NULL),(4732,'黄龙县',443,0,3,NULL),(4733,'佛坪县',444,0,3,NULL),(4734,'勉县',444,0,3,NULL),(4735,'南郑县',444,0,3,NULL),(4736,'城固县',444,0,3,NULL),(4737,'宁强县',444,0,3,NULL),(4738,'汉台区',444,0,3,NULL),(4739,'洋县',444,0,3,NULL),(4740,'留坝县',444,0,3,NULL),(4741,'略阳县',444,0,3,NULL),(4742,'西乡县',444,0,3,NULL),(4743,'镇巴县',444,0,3,NULL),(4744,'佳县',445,0,3,NULL),(4745,'吴堡县',445,0,3,NULL),(4746,'子洲县',445,0,3,NULL),(4747,'定边县',445,0,3,NULL),(4748,'府谷县',445,0,3,NULL),(4749,'榆林市榆阳区',445,0,3,NULL),(4750,'横山县',445,0,3,NULL),(4751,'清涧县',445,0,3,NULL),(4752,'神木县',445,0,3,NULL),(4753,'米脂县',445,0,3,NULL),(4754,'绥德县',445,0,3,NULL),(4755,'靖边县',445,0,3,NULL),(4756,'宁陕县',446,0,3,NULL),(4757,'岚皋县',446,0,3,NULL),(4758,'平利县',446,0,3,NULL),(4759,'旬阳县',446,0,3,NULL),(4760,'汉滨区',446,0,3,NULL),(4761,'汉阴县',446,0,3,NULL),(4762,'白河县',446,0,3,NULL),(4763,'石泉县',446,0,3,NULL),(4764,'紫阳县',446,0,3,NULL),(4765,'镇坪县',446,0,3,NULL),(4766,'丹凤县',447,0,3,NULL),(4767,'商南县',447,0,3,NULL),(4768,'商州区',447,0,3,NULL),(4769,'山阳县',447,0,3,NULL),(4770,'柞水县',447,0,3,NULL),(4771,'洛南县',447,0,3,NULL),(4772,'镇安县',447,0,3,NULL),(4773,'七里河区',448,0,3,NULL),(4774,'城关区',448,0,3,NULL),(4775,'安宁区',448,0,3,NULL),(4776,'榆中县',448,0,3,NULL),(4777,'永登县',448,0,3,NULL),(4778,'皋兰县',448,0,3,NULL),(4779,'红古区',448,0,3,NULL),(4780,'西固区',448,0,3,NULL),(4781,'嘉峪关市',449,0,3,NULL),(4782,'永昌县',450,0,3,NULL),(4783,'金川区',450,0,3,NULL),(4784,'会宁县',451,0,3,NULL),(4785,'平川区',451,0,3,NULL),(4786,'景泰县',451,0,3,NULL),(4787,'白银区',451,0,3,NULL),(4788,'靖远县',451,0,3,NULL),(4789,'张家川回族自治县',452,0,3,NULL),(4790,'武山县',452,0,3,NULL),(4791,'清水县',452,0,3,NULL),(4792,'甘谷县',452,0,3,NULL),(4793,'秦安县',452,0,3,NULL),(4794,'秦州区',452,0,3,NULL),(4795,'麦积区',452,0,3,NULL),(4796,'凉州区',453,0,3,NULL),(4797,'古浪县',453,0,3,NULL),(4798,'天祝藏族自治县',453,0,3,NULL),(4799,'民勤县',453,0,3,NULL),(4800,'临泽县',454,0,3,NULL),(4801,'山丹县',454,0,3,NULL),(4802,'民乐县',454,0,3,NULL),(4803,'甘州区',454,0,3,NULL),(4804,'肃南裕固族自治县',454,0,3,NULL),(4805,'高台县',454,0,3,NULL),(4806,'华亭县',455,0,3,NULL),(4807,'崆峒区',455,0,3,NULL),(4808,'崇信县',455,0,3,NULL),(4809,'庄浪县',455,0,3,NULL),(4810,'泾川县',455,0,3,NULL),(4811,'灵台县',455,0,3,NULL),(4812,'静宁县',455,0,3,NULL),(4813,'敦煌市',456,0,3,NULL),(4814,'玉门市',456,0,3,NULL),(4815,'瓜州县（原安西县）',456,0,3,NULL),(4816,'肃北蒙古族自治县',456,0,3,NULL),(4817,'肃州区',456,0,3,NULL),(4818,'金塔县',456,0,3,NULL),(4819,'阿克塞哈萨克族自治县',456,0,3,NULL),(4820,'华池县',457,0,3,NULL),(4821,'合水县',457,0,3,NULL),(4822,'宁县',457,0,3,NULL),(4823,'庆城县',457,0,3,NULL),(4824,'正宁县',457,0,3,NULL),(4825,'环县',457,0,3,NULL),(4826,'西峰区',457,0,3,NULL),(4827,'镇原县',457,0,3,NULL),(4828,'临洮县',458,0,3,NULL),(4829,'安定区',458,0,3,NULL),(4830,'岷县',458,0,3,NULL),(4831,'渭源县',458,0,3,NULL),(4832,'漳县',458,0,3,NULL),(4833,'通渭县',458,0,3,NULL),(4834,'陇西县',458,0,3,NULL),(4835,'两当县',459,0,3,NULL),(4836,'宕昌县',459,0,3,NULL),(4837,'康县',459,0,3,NULL),(4838,'徽县',459,0,3,NULL),(4839,'成县',459,0,3,NULL),(4840,'文县',459,0,3,NULL),(4841,'武都区',459,0,3,NULL),(4842,'礼县',459,0,3,NULL),(4843,'西和县',459,0,3,NULL),(4844,'东乡族自治县',460,0,3,NULL),(4845,'临夏县',460,0,3,NULL),(4846,'临夏市',460,0,3,NULL),(4847,'和政县',460,0,3,NULL),(4848,'广河县',460,0,3,NULL),(4849,'康乐县',460,0,3,NULL),(4850,'永靖县',460,0,3,NULL),(4851,'积石山保安族东乡族撒拉族自治县',460,0,3,NULL),(4852,'临潭县',461,0,3,NULL),(4853,'卓尼县',461,0,3,NULL),(4854,'合作市',461,0,3,NULL),(4855,'夏河县',461,0,3,NULL),(4856,'玛曲县',461,0,3,NULL),(4857,'碌曲县',461,0,3,NULL),(4858,'舟曲县',461,0,3,NULL),(4859,'迭部县',461,0,3,NULL),(4860,'城东区',462,0,3,NULL),(4861,'城中区',462,0,3,NULL),(4862,'城北区',462,0,3,NULL),(4863,'城西区',462,0,3,NULL),(4864,'大通回族土族自治县',462,0,3,NULL),(4865,'湟中县',462,0,3,NULL),(4866,'湟源县',462,0,3,NULL),(4867,'乐都县',463,0,3,NULL),(4868,'互助土族自治县',463,0,3,NULL),(4869,'化隆回族自治县',463,0,3,NULL),(4870,'平安县',463,0,3,NULL),(4871,'循化撒拉族自治县',463,0,3,NULL),(4872,'民和回族土族自治县',463,0,3,NULL),(4873,'刚察县',464,0,3,NULL),(4874,'海晏县',464,0,3,NULL),(4875,'祁连县',464,0,3,NULL),(4876,'门源回族自治县',464,0,3,NULL),(4877,'同仁县',465,0,3,NULL),(4878,'尖扎县',465,0,3,NULL),(4879,'河南蒙古族自治县',465,0,3,NULL),(4880,'泽库县',465,0,3,NULL),(4881,'共和县',466,0,3,NULL),(4882,'兴海县',466,0,3,NULL),(4883,'同德县',466,0,3,NULL),(4884,'贵南县',466,0,3,NULL),(4885,'贵德县',466,0,3,NULL),(4886,'久治县',467,0,3,NULL),(4887,'玛多县',467,0,3,NULL),(4888,'玛沁县',467,0,3,NULL),(4889,'班玛县',467,0,3,NULL),(4890,'甘德县',467,0,3,NULL),(4891,'达日县',467,0,3,NULL),(4892,'囊谦县',468,0,3,NULL),(4893,'曲麻莱县',468,0,3,NULL),(4894,'杂多县',468,0,3,NULL),(4895,'治多县',468,0,3,NULL),(4896,'玉树县',468,0,3,NULL),(4897,'称多县',468,0,3,NULL),(4898,'乌兰县',469,0,3,NULL),(4899,'冷湖行委',469,0,3,NULL),(4900,'大柴旦行委',469,0,3,NULL),(4901,'天峻县',469,0,3,NULL),(4902,'德令哈市',469,0,3,NULL),(4903,'格尔木市',469,0,3,NULL),(4904,'茫崖行委',469,0,3,NULL),(4905,'都兰县',469,0,3,NULL),(4906,'兴庆区',470,0,3,NULL),(4907,'永宁县',470,0,3,NULL),(4908,'灵武市',470,0,3,NULL),(4909,'西夏区',470,0,3,NULL),(4910,'贺兰县',470,0,3,NULL),(4911,'金凤区',470,0,3,NULL),(4912,'大武口区',471,0,3,NULL),(4913,'平罗县',471,0,3,NULL),(4914,'惠农区',471,0,3,NULL),(4915,'利通区',472,0,3,NULL),(4916,'同心县',472,0,3,NULL),(4917,'盐池县',472,0,3,NULL),(4918,'青铜峡市',472,0,3,NULL),(4919,'原州区',473,0,3,NULL),(4920,'彭阳县',473,0,3,NULL),(4921,'泾源县',473,0,3,NULL),(4922,'西吉县',473,0,3,NULL),(4923,'隆德县',473,0,3,NULL),(4924,'中宁县',474,0,3,NULL),(4925,'沙坡头区',474,0,3,NULL),(4926,'海原县',474,0,3,NULL),(4927,'东山区',475,0,3,NULL),(4928,'乌鲁木齐县',475,0,3,NULL),(4929,'天山区',475,0,3,NULL),(4930,'头屯河区',475,0,3,NULL),(4931,'新市区',475,0,3,NULL),(4932,'水磨沟区',475,0,3,NULL),(4933,'沙依巴克区',475,0,3,NULL),(4934,'达坂城区',475,0,3,NULL),(4935,'乌尔禾区',476,0,3,NULL),(4936,'克拉玛依区',476,0,3,NULL),(4937,'独山子区',476,0,3,NULL),(4938,'白碱滩区',476,0,3,NULL),(4939,'吐鲁番市',477,0,3,NULL),(4940,'托克逊县',477,0,3,NULL),(4941,'鄯善县',477,0,3,NULL),(4942,'伊吾县',478,0,3,NULL),(4943,'哈密市',478,0,3,NULL),(4944,'巴里坤哈萨克自治县',478,0,3,NULL),(4945,'吉木萨尔县',479,0,3,NULL),(4946,'呼图壁县',479,0,3,NULL),(4947,'奇台县',479,0,3,NULL),(4948,'昌吉市',479,0,3,NULL),(4949,'木垒哈萨克自治县',479,0,3,NULL),(4950,'玛纳斯县',479,0,3,NULL),(4951,'米泉市',479,0,3,NULL),(4952,'阜康市',479,0,3,NULL),(4953,'博乐市',480,0,3,NULL),(4954,'温泉县',480,0,3,NULL),(4955,'精河县',480,0,3,NULL),(4956,'博湖县',481,0,3,NULL),(4957,'和硕县',481,0,3,NULL),(4958,'和静县',481,0,3,NULL),(4959,'尉犁县',481,0,3,NULL),(4960,'库尔勒市',481,0,3,NULL),(4961,'焉耆回族自治县',481,0,3,NULL),(4962,'若羌县',481,0,3,NULL),(4963,'轮台县',481,0,3,NULL),(4964,'乌什县',482,0,3,NULL),(4965,'库车县',482,0,3,NULL),(4966,'拜城县',482,0,3,NULL),(4967,'新和县',482,0,3,NULL),(4968,'柯坪县',482,0,3,NULL),(4969,'沙雅县',482,0,3,NULL),(4970,'温宿县',482,0,3,NULL),(4971,'阿克苏市',482,0,3,NULL),(4972,'阿瓦提县',482,0,3,NULL),(4973,'乌恰县',483,0,3,NULL),(4974,'阿克陶县',483,0,3,NULL),(4975,'阿合奇县',483,0,3,NULL),(4976,'阿图什市',483,0,3,NULL),(4977,'伽师县',484,0,3,NULL),(4978,'叶城县',484,0,3,NULL),(4979,'喀什市',484,0,3,NULL),(4980,'塔什库尔干塔吉克自治县',484,0,3,NULL),(4981,'岳普湖县',484,0,3,NULL),(4982,'巴楚县',484,0,3,NULL),(4983,'泽普县',484,0,3,NULL),(4984,'疏勒县',484,0,3,NULL),(4985,'疏附县',484,0,3,NULL),(4986,'英吉沙县',484,0,3,NULL),(4987,'莎车县',484,0,3,NULL),(4988,'麦盖提县',484,0,3,NULL),(4989,'于田县',485,0,3,NULL),(4990,'和田县',485,0,3,NULL),(4991,'和田市',485,0,3,NULL),(4992,'墨玉县',485,0,3,NULL),(4993,'民丰县',485,0,3,NULL),(4994,'洛浦县',485,0,3,NULL),(4995,'皮山县',485,0,3,NULL),(4996,'策勒县',485,0,3,NULL),(4997,'伊宁县',486,0,3,NULL),(4998,'伊宁市',486,0,3,NULL),(4999,'奎屯市',486,0,3,NULL),(5000,'察布查尔锡伯自治县',486,0,3,NULL),(5001,'尼勒克县',486,0,3,NULL),(5002,'巩留县',486,0,3,NULL),(5003,'新源县',486,0,3,NULL),(5004,'昭苏县',486,0,3,NULL),(5005,'特克斯县',486,0,3,NULL),(5006,'霍城县',486,0,3,NULL),(5007,'乌苏市',487,0,3,NULL),(5008,'和布克赛尔蒙古自治县',487,0,3,NULL),(5009,'塔城市',487,0,3,NULL),(5010,'托里县',487,0,3,NULL),(5011,'沙湾县',487,0,3,NULL),(5012,'裕民县',487,0,3,NULL),(5013,'额敏县',487,0,3,NULL),(5014,'吉木乃县',488,0,3,NULL),(5015,'哈巴河县',488,0,3,NULL),(5016,'富蕴县',488,0,3,NULL),(5017,'布尔津县',488,0,3,NULL),(5018,'福海县',488,0,3,NULL),(5019,'阿勒泰市',488,0,3,NULL),(5020,'青河县',488,0,3,NULL),(5021,'石河子市',489,0,3,NULL),(5022,'阿拉尔市',490,0,3,NULL),(5023,'图木舒克市',491,0,3,NULL),(5024,'五家渠市',492,0,3,NULL),(45055,'海外',35,0,2,NULL);
/*!40000 ALTER TABLE `te_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_arrival_notice`
--

DROP TABLE IF EXISTS `te_arrival_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_arrival_notice` (
  `an_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '通知id',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品id',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称',
  `member_id` int(10) unsigned NOT NULL COMMENT '会员id',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺id',
  `an_addtime` int(10) unsigned NOT NULL COMMENT '添加时间',
  `an_email` varchar(100) NOT NULL COMMENT '邮箱',
  `an_mobile` varchar(11) NOT NULL COMMENT '手机号',
  `an_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态 1到货通知，2预售',
  PRIMARY KEY (`an_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品到货通知表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_arrival_notice`
--

LOCK TABLES `te_arrival_notice` WRITE;
/*!40000 ALTER TABLE `te_arrival_notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_arrival_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_article`
--

DROP TABLE IF EXISTS `te_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_article` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '索引id',
  `ac_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `article_url` varchar(100) DEFAULT NULL COMMENT '跳转链接',
  `article_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示，0为否，1为是，默认为1',
  `article_position` tinyint(4) NOT NULL DEFAULT '1' COMMENT '显示位置:1默认网站前台,2买家,3卖家,4全站',
  `article_sort` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  `article_title` varchar(100) DEFAULT NULL COMMENT '标题',
  `article_content` text COMMENT '内容',
  `article_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  PRIMARY KEY (`article_id`),
  KEY `ac_id` (`ac_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COMMENT='文章表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_article`
--

LOCK TABLES `te_article` WRITE;
/*!40000 ALTER TABLE `te_article` DISABLE KEYS */;
INSERT INTO `te_article` VALUES (6,2,'',1,1,255,'如何注册成为会员','如何注册成为会员',1449242303),(7,2,'',1,1,255,'如何搜索','如何搜索',1449242303),(8,2,'',1,1,255,'忘记密码','忘记密码',1449242303),(9,2,'',1,1,255,'我要买','我要买',1449242303),(10,2,'',1,1,255,'查看已购买商品','查看已购买商品',1449242303),(11,3,'',1,1,255,'如何管理店铺','如何管理店铺',1449242303),(12,3,'',1,1,255,'查看售出商品','查看售出商品',1449242303),(13,3,'',1,1,255,'如何发货','如何发货',1449242303),(14,3,'',1,1,255,'商城商品推荐','商城商品推荐',1449242303),(15,3,'',1,1,255,'如何申请开店','如何申请开店',1449242303),(16,4,'',1,1,255,'如何注册支付宝','如何注册支付宝',1449242303),(17,4,'',1,1,255,'在线支付','在线支付',1449242303),(18,6,'',1,1,255,'会员修改密码','会员修改密码',1449242303),(19,6,'',1,1,255,'会员修改个人资料','会员修改个人资料',1449242303),(20,6,'',1,1,255,'商品发布','商品发布',1449242303),(21,6,'',1,1,255,'修改收货地址','修改收货地址',1449242303),(22,7,'',1,1,255,'关于我们','<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 好商城是由一批青年为网店经营者提供技术支持及二次开发业务！立足于为人民服务为标准化管理模式！促进客户成交转化！为客户谋取丰厚利益！好商城交流中心网址http://www.33hao.com </p>',1449242303),(23,7,'',1,1,255,'联系我们','<p>欢迎您对我们的站点、工作、产品和服务提出自己宝贵的意见或建议。我们将给予您及时答复。同时也欢迎您到我们公司来洽商业务。</p>\r\n<p><br />\r\n<strong>公司名称</strong>： 好商城交流中心 <br />\r\n<strong>通信地址</strong>： http://www.33hao.com <br />\r\n<strong>邮政编码</strong>： 300121 <br />\r\n<strong>电话</strong>： 400-800-8888 <br />\r\n<strong>商务Q群</strong>： 138182377 <br />\r\n<strong>软件著作权登记号</strong>： 好商城V5.3 <br />\r\n<strong>ICP备案号</strong>： 33hao00125 </p>',1449242303),(24,7,'',1,1,255,'招聘英才','<dl> <h3>PHP程序员</h3>\r\n<dt>职位要求： <dd>熟悉PHP5开发语言；<br />\r\n熟悉MySQL5数据库，同时熟悉sqlserver，oracle者优先；<br />\r\n熟悉面向对象思想，MVC三层体系，至少使用过目前已知PHP框架其中一种；<br />\r\n熟悉SERVER2003/Linux操作系统，熟悉常用Linux操作命令；<br />\r\n熟悉Mysql数据库应用开发，了解Mysql的数据库配置管理、性能优化等基本操作技能；<br />\r\n熟悉jquery，smarty等常用开源软件；<br />\r\n具备良好的代码编程习惯及较强的文档编写能力；<br />\r\n具备良好的团队合作能力；<br />\r\n熟悉设计模式者优先；<br />\r\n熟悉java，c++,c#,python其中一种者优先； </dd> <dt>学历要求： <dd>大本 </dd> <dt>工作经验： <dd>一年以上 </dd> <dt>工作地点： <dd>深圳 </dd></dl> <dl> <h3>网页设计（2名）</h3>\r\n<dt>岗位职责： <dd>网站UI设计、 切片以及HTML制作。 </dd> <dt>职位要求： <dd>有大型网站设计经验；有网站改版、频道建设经验者优先考虑； <br />\r\n熟练掌握photoshop,fireworks,dreamwaver等设计软件； <br />\r\n熟练运用Div+Css制作网页，符合CSS2.0-W3C标准，并掌握不同浏览器下，不同版本下CSS元素的区别；<br />\r\n熟悉网站制作流程，能运用并修改简单JavaScript类程序； <br />\r\n积极向上，有良好的人际沟通能力，良好的工作协调能力，踏实肯干的工作精神；具有良好的沟通表达能力，<br />\r\n需求判断力，团队协作能力； <br />\r\n请应聘者在简历中提供个人近期作品连接。 </dd> <dt>学历要求： <dd>专科 </dd> <dt>工作经验： <dd>一年以上 </dd> <dt>工作地点： <dd>深圳 </dd></dl> <dl> <h3>方案策划（1名）</h3>\r\n<dt>职位要求： <dd>2年以上的文案编辑类相关工作经验，具备一定的文字功底，有极强的语言表达和逻辑思维能力， 能独立完成项目方案的编写，拟草各种协议。熟悉使用办公软件。 </dd> <dt>学历要求： <dd>大专以上 </dd> <dt>工作经验： <dd>一年以上 </dd> <dt>工作地点： <dd>深圳 </dd></dl>',1449242303),(25,7,'',1,1,255,'合作及洽谈','<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 33hao希望与服务代理商、合作伙伴并肩合作，携手开拓日益广阔的网络购物软件市场。如果您拥有好的建议，拥有丰富渠道资源、拥有众多目标客户、拥有相应的市场资源，并希望与33hao进行深度业务合作， 欢迎成为33hao业务合作伙伴，请联系。</p>\r\n<p>&nbsp;</p>\r\n<p><strong>公司名称</strong>： 好商城交流中心 <br />\r\n<strong>通信地址</strong>： http://www.33hao.com <br />\r\n<strong>邮政编码</strong>： 300121 <br />\r\n<strong>QQ群</strong>： 138182377 <br />\r\n<strong>商务洽谈</strong>： 138182377 <br />\r\n</p>',1449242303),(26,5,'',1,1,255,'联系卖家','联系卖家',1449242303),(28,4,'',1,1,255,'分期付款','分期付款<br />',1449242303),(29,4,'',1,1,255,'邮局汇款','邮局汇款<br />',1449242303),(30,4,'',1,1,255,'公司转账','公司转账<br />',1449242303),(31,5,'',1,1,255,'退换货政策','退换货政策',1449242303),(32,5,'',1,1,255,'退换货流程','退换货流程',1449242303),(33,5,'',1,1,255,'返修/退换货','返修/退换货',1449242303),(34,5,'',1,1,255,'退款申请','退款申请',1449242303),(35,1,'http://www.33hao.com/',1,1,1,'好商城热销中','好商城热销中<br />',1449242303),(36,1,'',1,1,255,'管理功能说明','管理功能说明',1449242303),(37,1,'',1,1,255,'如何扩充水印字体库','如何扩充水印字体库',1449242303),(38,1,'',1,1,255,'提示信息','提示信息',1449242303),(39,2,'',1,1,255,'积分细则','积分细则积分细则',1449242303),(40,2,'',1,1,255,'积分兑换说明','积分兑换说明',1449242303),(41,1,'',1,1,255,'功能使用说明','功能使用说明',1449242303);
/*!40000 ALTER TABLE `te_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_article_class`
--

DROP TABLE IF EXISTS `te_article_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_article_class` (
  `ac_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '索引ID',
  `ac_code` varchar(20) DEFAULT NULL COMMENT '分类标识码',
  `ac_name` varchar(100) NOT NULL COMMENT '分类名称',
  `ac_parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `ac_sort` tinyint(1) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  PRIMARY KEY (`ac_id`),
  KEY `ac_parent_id` (`ac_parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='文章分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_article_class`
--

LOCK TABLES `te_article_class` WRITE;
/*!40000 ALTER TABLE `te_article_class` DISABLE KEYS */;
INSERT INTO `te_article_class` VALUES (1,'notice','商城公告',0,1),(2,'member','新手上路',0,2),(3,'store','商家中心',0,3),(4,'payment','支付方式',0,4),(5,'sold','售后服务',0,5),(6,'service','购物指南',0,6),(7,'about','关于我们',0,7);
/*!40000 ALTER TABLE `te_article_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_attribute`
--

DROP TABLE IF EXISTS `te_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_attribute` (
  `attr_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '属性id',
  `attr_name` varchar(100) NOT NULL COMMENT '属性名称',
  `type_id` int(10) unsigned NOT NULL COMMENT '所属类型id',
  `attr_value` text NOT NULL COMMENT '属性值列',
  `attr_show` tinyint(1) unsigned NOT NULL COMMENT '是否显示。0为不显示、1为显示',
  `attr_sort` tinyint(1) unsigned NOT NULL COMMENT '排序',
  PRIMARY KEY (`attr_id`),
  KEY `attr_id` (`attr_id`,`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品属性表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_attribute`
--

LOCK TABLES `te_attribute` WRITE;
/*!40000 ALTER TABLE `te_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_attribute_value`
--

DROP TABLE IF EXISTS `te_attribute_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_attribute_value` (
  `attr_value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '属性值id',
  `attr_value_name` varchar(100) DEFAULT '' COMMENT '属性值名称',
  `attr_id` int(10) unsigned NOT NULL COMMENT '所属属性id',
  `type_id` int(10) unsigned NOT NULL COMMENT '类型id',
  `attr_value_sort` tinyint(1) unsigned NOT NULL COMMENT '属性值排序',
  PRIMARY KEY (`attr_value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品属性值表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_attribute_value`
--

LOCK TABLES `te_attribute_value` WRITE;
/*!40000 ALTER TABLE `te_attribute_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_attribute_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_bill_create`
--

DROP TABLE IF EXISTS `te_bill_create`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_bill_create` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT '0',
  `os_month` int(11) DEFAULT '0',
  `os_type` int(11) DEFAULT '0' COMMENT '0实物1虚拟',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='结算生成辅助表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_bill_create`
--

LOCK TABLES `te_bill_create` WRITE;
/*!40000 ALTER TABLE `te_bill_create` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_bill_create` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_brand`
--

DROP TABLE IF EXISTS `te_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_brand` (
  `brand_id` mediumint(11) NOT NULL AUTO_INCREMENT COMMENT '索引ID',
  `brand_name` varchar(100) DEFAULT NULL COMMENT '品牌名称',
  `brand_initial` varchar(1) NOT NULL COMMENT '品牌首字母',
  `brand_class` varchar(50) DEFAULT NULL COMMENT '类别名称',
  `brand_pic` varchar(100) DEFAULT NULL COMMENT '图片',
  `brand_sort` tinyint(3) unsigned DEFAULT '0' COMMENT '排序',
  `brand_recommend` tinyint(1) DEFAULT '0' COMMENT '推荐，0为否，1为是，默认为0',
  `store_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `brand_apply` tinyint(1) NOT NULL DEFAULT '1' COMMENT '品牌申请，0为申请中，1为通过，默认为1，申请功能是会员使用，系统后台默认为1',
  `class_id` int(10) unsigned DEFAULT '0' COMMENT '所属分类id',
  `show_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '品牌展示类型 0表示图片 1表示文字 ',
  `brand_bgpic` varchar(100) DEFAULT 'brand_default_max.jpg' COMMENT '品牌大图',
  `brand_xbgpic` varchar(100) DEFAULT 'brand_default_small.jpg' COMMENT '品牌小图',
  `brand_tjstore` varchar(100) DEFAULT '' COMMENT '品牌副标题',
  `brand_introduction` varchar(300) DEFAULT '好商城提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改' COMMENT '品牌介绍',
  `brand_view` int(10) NOT NULL COMMENT '品牌单页浏览量',
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=361 DEFAULT CHARSET=utf8 COMMENT='品牌表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_brand`
--

LOCK TABLES `te_brand` WRITE;
/*!40000 ALTER TABLE `te_brand` DISABLE KEYS */;
INSERT INTO `te_brand` VALUES (79,'justyle','J','服饰鞋帽','04397468710494742_sm.jpg',0,0,0,1,1,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(80,'享爱.','H','服饰鞋帽','04397468934349942_sm.jpg',0,0,0,1,1,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(81,'派丽蒙','P','女装','04397469152627878_sm.jpg',0,0,0,1,4,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(82,'康妮雅','K','女装','04397471448679692_sm.jpg',0,0,0,1,4,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(83,'秀秀美','X','女装','04397471716977022_sm.jpg',0,0,0,1,4,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(84,'阿迪达斯','A','服饰鞋帽','04397471910652190_sm.jpg',0,1,0,1,1,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(85,'猫人','M','内衣','04397472152849925_sm.jpg',0,0,0,1,6,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(86,'茵曼（INMAN）','Y','T恤','04397472336312422_sm.jpg',0,0,0,1,12,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(87,'Hanes恒适','H','服饰鞋帽','04397472577467506_sm.jpg',0,0,0,1,1,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(88,'缪诗','M','休闲鞋','04397472716852803_sm.jpg',0,0,0,1,74,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(89,'真维斯','Z','服饰鞋帽','04397472838086984_sm.jpg',0,1,0,1,1,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(90,'金利来','J','西服','04397473042647991_sm.jpg',0,0,0,1,47,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(91,'其乐','Q','休闲鞋','04397473331842699_sm.jpg',0,1,0,1,109,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(92,'Newbalance','N','功能鞋','04397473633585549_sm.jpg',0,1,0,1,112,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(93,'百丽','B','女鞋','04398088925179484_sm.png',0,1,0,1,8,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(94,'七匹狼','Q','服饰鞋帽','04398089136939537_sm.jpg',0,1,0,1,1,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(95,'李宁','L','运动','04398089270610035_sm.jpg',0,0,0,1,7,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(96,'佐丹奴','Z','服饰鞋帽','04398089412399747_sm.jpg',0,1,0,1,1,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(97,'百思图','B','休闲鞋','04398089574801901_sm.jpg',0,0,0,1,93,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(98,'斯波帝卡','S','男装','04398089726299223_sm.jpg',0,0,0,1,5,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(99,'梦特娇','M','男装','04398089942879365_sm.jpg',0,1,0,1,5,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(100,'宝姿','B','服饰鞋帽','04398090061006740_sm.jpg',0,1,0,1,1,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(101,'爱帝','A','服饰鞋帽','04398090218578648_sm.jpg',0,0,0,1,1,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(102,'她他/tata','T','高跟鞋','04398090459092275_sm.jpg',0,0,0,1,91,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(103,'ELLE HOME','E','服饰鞋帽','04398090611386532_sm.jpg',0,1,0,1,1,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(104,'esprit','E','女装','04398090828687339_sm.jpg',0,1,0,1,4,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(105,'westside','W','服饰鞋帽','04398090975832253_sm.jpg',0,0,0,1,1,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(106,'RDK','P','睡衣','04398091763582415_sm.jpg',0,0,0,1,62,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(107,'皮尔卡丹','P','风衣','04398091877500105_sm.jpg',0,0,0,1,43,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(108,'挪巍','N','服饰鞋帽','04398091973797599_sm.jpg',0,0,0,1,1,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(113,'波斯顿','B','个护化妆','04398099293923325_sm.jpg',0,0,0,1,470,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(114,'薇姿','W','个护化妆','04398099463167230_sm.jpg',0,0,0,1,470,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(115,'相宜本草','X','个护化妆','04398099611242673_sm.jpg',0,1,0,1,470,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(116,'Dior','D','个护化妆','04398099738566948_sm.jpg',0,1,0,1,470,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(117,'苏菲','S','个护化妆','04398099870651075_sm.jpg',0,0,0,1,470,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(118,'faceshop','F','个护化妆','04398100051941493_sm.jpg',0,0,0,1,470,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(119,'芙丽芳丝','F','个护化妆','04398100178308363_sm.jpg',0,0,0,1,470,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(120,'娇爽','J','个护化妆','04398100362129645_sm.jpg',0,0,0,1,470,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(121,'卡尼尔','K','个护化妆','04398100483927289_sm.jpg',0,0,0,1,470,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(122,'纪梵希','J','个护化妆','04398100614445814_sm.jpg',0,1,0,1,470,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(123,'护舒宝','H','个护化妆','04398100738554064_sm.jpg',0,0,0,1,470,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(124,'兰蔻','L','个护化妆','04398100899214207_sm.jpg',0,1,0,1,470,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(125,'娇兰','J','个护化妆','04398101035858820_sm.jpg',0,1,0,1,470,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(126,'高丝洁','G','个护化妆','04398101363358081_sm.jpg',0,0,0,1,470,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(127,'妮维雅','N','个护化妆','04398101539246004_sm.jpg',0,1,0,1,470,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(128,'高丝','G','个护化妆','04398101708424765_sm.jpg',0,0,0,1,470,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(129,'狮王','S','个护化妆','04398101929845854_sm.jpg',0,0,0,1,470,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(130,'雅顿','Y','个护化妆','04398102086535787_sm.jpg',0,1,0,1,470,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(131,'M.A.C','M','个护化妆','04398102231196519_sm.jpg',0,0,0,1,470,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(132,'李施德林','L','个护化妆','04398102411008632_sm.jpg',0,0,0,1,470,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(133,'雅诗兰黛','Y','个护化妆','04398102581821577_sm.jpg',0,1,0,1,470,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(134,'MISS FACE','M','个护化妆','04398102756025036_sm.jpg',0,0,0,1,470,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(135,'佳洁士','J','个护化妆','04398102918746492_sm.jpg',0,0,0,1,470,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(136,'资生堂','X','个护化妆','04398103163925153_sm.jpg',0,1,0,1,470,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(137,'倩碧','Q','个护化妆','04398103335196758_sm.jpg',0,0,0,1,470,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(138,'benefit','B','个护化妆','04398103525876196_sm.jpg',0,0,0,1,470,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(139,'SISLEY','S','个护化妆','04398103731155516_sm.jpg',0,0,0,1,470,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(140,'爱丽','A','个护化妆','04398103883736888_sm.jpg',0,0,0,1,470,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(141,'BOBBI BROWN','B','个护化妆','04398104034802420_sm.jpg',0,0,0,1,470,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(142,'SK-ll','S','个护化妆','04398104206717960_sm.jpg',0,1,0,1,470,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(143,'施华洛世奇','S','珠宝手表','04398116735872287_sm.jpg',0,1,0,1,530,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(144,'万宝龙','W','珠宝手表','04398116855649611_sm.jpg',0,0,0,1,530,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(145,'CK','C','珠宝手表','04398116986166995_sm.jpg',0,1,0,1,530,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(146,'Disney','D','珠宝手表','04398117134560677_sm.jpg',0,1,0,1,530,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(147,'佐卡伊','Z','珠宝手表','04398117259027285_sm.jpg',0,0,0,1,530,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(148,'ZIPPO','Z','','04398117390207814_sm.gif',0,0,0,1,0,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(149,'梅花','M','珠宝手表','04398117504203345_sm.jpg',0,1,0,1,530,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(150,'高仕','G','珠宝手表','04398117735732690_sm.jpg',0,0,0,1,530,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(151,'宝玑','B','珠宝手表','04398117910949174_sm.jpg',0,0,0,1,530,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(152,'一生一石','Y','珠宝手表','04398118118206423_sm.jpg',0,0,0,1,530,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(153,'IDee','I','珠宝手表','04398118344918440_sm.jpg',0,0,0,1,530,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(154,'elle','E','珠宝手表','04398118494505137_sm.jpg',0,0,0,1,530,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(155,'卡西欧','K','珠宝手表','04398118617326698_sm.jpg',0,1,0,1,530,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(156,'爱卡','A','珠宝手表','04398118792328978_sm.jpg',0,0,0,1,530,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(157,'帝舵','D','珠宝手表','04398118894311290_sm.jpg',0,1,0,1,530,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(158,'新秀','X','珠宝手表','04398119032319322_sm.jpg',0,0,0,1,530,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(159,'九钻','J','珠宝手表','04398119151718735_sm.jpg',0,0,0,1,530,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(160,'卡地亚','K','珠宝手表','04398119311706852_sm.jpg',0,0,0,1,530,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(161,'蓝色多瑙河','L','珠宝手表','04398119501897486_sm.jpg',0,0,0,1,530,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(162,'浪琴','L','珠宝手表','04398119677440904_sm.jpg',0,0,0,1,530,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(163,'百利恒','B','珠宝手表','04398119859319840_sm.jpg',0,0,0,1,530,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(164,'欧米茄','O','珠宝手表','04398119996858692_sm.jpg',0,1,0,1,530,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(165,'tissot','T','珠宝手表','04398120131178815_sm.jpg',0,1,0,1,530,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(166,'新光饰品','X','珠宝手表','04398120247306694_sm.jpg',0,0,0,1,530,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(167,'英雄','Y','珠宝手表','04398120419590838_sm.jpg',0,0,0,1,530,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(168,'瑞士军刀','R','珠宝手表','04398120584040229_sm.gif',0,0,0,1,530,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(169,'斯沃琪','S','珠宝手表','04398121090096799_sm.jpg',0,1,0,1,530,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(170,'阿玛尼','A','珠宝手表','04398121209932680_sm.jpg',0,1,0,1,530,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(171,'亨得利','H','珠宝手表','04398125089603514_sm.jpg',0,0,0,1,530,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(172,'lux-women','L','珠宝手表','04398125296052150_sm.jpg',0,0,0,1,530,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(173,'ooh Dear','O','珠宝手表','04398125473712411_sm.jpg',0,0,0,1,530,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(174,'acer','A','数码办公','04398155389308089_sm.jpg',0,0,0,1,256,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(175,'清华同方','Q','数码办公','04398155613517981_sm.jpg',0,0,0,1,256,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(176,'富士通','F','数码办公','04398155751072786_sm.jpg',0,0,0,1,256,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(177,'微软','W','数码办公','04398155862912765_sm.jpg',0,0,0,1,256,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(178,'得力','D','数码办公','04398156045665837_sm.jpg',0,0,0,1,256,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(179,'DELL','D','数码办公','04398156232757027_sm.jpg',0,1,0,1,256,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(180,'ThinkPad','T','数码办公','04398156358858442_sm.jpg',0,0,0,1,256,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(181,'联想打印机','L','数码办公','04398156503421310_sm.jpg',0,0,0,1,256,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(182,'金士顿','J','数码办公','04398156705753579_sm.jpg',0,1,0,1,256,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(183,'TP-LINK','T','数码办公','04398156873572761_sm.jpg',0,1,0,1,256,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(184,'华硕','H','数码办公','04398157012150899_sm.jpg',0,0,0,1,256,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(185,'罗技','L','数码办公','04398157235673753_sm.jpg',0,1,0,1,256,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(186,'D-Link','D','数码办公','04398157356404105_sm.jpg',0,0,0,1,256,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(187,'雷蛇','L','数码办公','04398157472174891_sm.jpg',0,1,0,1,256,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(188,'IT-CEO','I','数码办公','04398157595321784_sm.jpg',0,0,0,1,256,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(189,'hyundri','H','数码办公','04398157712394024_sm.jpg',0,0,0,1,256,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(190,'惠普','H','数码办公','04398157881561725_sm.jpg',0,0,0,1,256,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(191,'迈乐','M','数码办公','04398158065769057_sm.jpg',0,0,0,1,256,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(192,'爱普生','A','数码办公','04398158266047493_sm.jpg',0,1,0,1,256,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(193,'三木','S','数码办公','04398158379932048_sm.jpg',0,0,0,1,256,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(194,'忆捷','Y','数码办公','04398158508475720_sm.jpg',0,0,0,1,256,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(195,'佰科','B','数码办公','04398158666713881_sm.jpg',0,0,0,1,256,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(196,'飞利浦','F','数码办公','04398158808225051_sm.jpg',0,1,0,1,256,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(197,'雷柏','L','数码办公','04398158987559915_sm.jpg',0,0,0,1,256,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(198,'双飞燕','S','数码办公','04398159147857437_sm.jpg',0,0,0,1,256,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(199,'网件','W','数码办公','04398159314915358_sm.jpg',0,0,0,1,256,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(200,'山泽','S','数码办公','04398159479959395_sm.jpg',0,0,0,1,256,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(201,'松下','S','数码办公','04398159595550035_sm.jpg',0,1,0,1,256,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(202,'TPOS','T','数码办公','04398159795526441_sm.jpg',0,0,0,1,256,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(203,'富勒','F','数码办公','04398159927301628_sm.jpg',0,0,0,1,256,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(204,'北通','B','数码办公','04398160061664664_sm.jpg',0,0,0,1,256,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(205,'romoss','R','数码办公','04398160187629402_sm.jpg',0,0,0,1,256,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(206,'索爱','S','数码办公','04398160348310562_sm.gif',0,1,0,1,256,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(207,'台电','T','数码办公','04398160575221477_sm.jpg',0,0,0,1,256,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(208,'三星','S','数码办公','04398160720944823_sm.jpg',0,1,0,1,256,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(209,'理光','L','数码办公','04398160857676307_sm.gif',0,0,0,1,256,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(210,'飞毛腿','F','数码办公','04398161023292593_sm.jpg',0,0,0,1,256,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(211,'阿尔卡特','A','数码办公','04398161143888870_sm.jpg',0,0,0,1,256,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(212,'诺基亚','N','数码办公','04398161259006857_sm.gif',0,0,0,1,256,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(213,'摩托罗拉','M','数码办公','04398161410885588_sm.gif',0,0,0,1,256,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(214,'苹果','P','数码办公','04398168923750202_sm.png',0,1,0,1,256,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(215,'HTC','H','数码办公','04398169850955399_sm.jpg',0,0,0,1,256,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(216,'九阳','J','家用电器','04399844516657174_sm.jpg',0,0,0,1,308,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(217,'索尼','S','家用电器','04399833099806870_sm.gif',0,0,0,1,308,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(218,'格力','G','家用电器','04399833262328490_sm.jpg',0,0,0,1,308,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(219,'夏普','H','家用电器','04399833425234004_sm.jpg',0,0,0,1,308,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(220,'美的','M','家用电器','04399833601121412_sm.jpg',0,0,0,1,308,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(221,'博朗','B','家用电器','04399833768343488_sm.gif',0,0,0,1,308,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(222,'TCL','T','家用电器','04399833953558287_sm.jpg',0,0,0,1,308,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(223,'欧姆龙','O','家用电器','04399834117653152_sm.gif',0,0,0,1,308,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(224,'苏泊尔','S','家用电器','04399834427362760_sm.jpg',0,0,0,1,308,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(225,'伊莱克斯','Y','家用电器','04399834676870929_sm.gif',0,0,0,1,308,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(226,'艾力斯特','A','家用电器','04399835435836906_sm.jpg',0,0,0,1,308,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(227,'西门子','X','家用电器','04399835594337307_sm.gif',0,0,0,1,308,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(228,'三菱电机','S','家用电器','04399835807315767_sm.gif',0,0,0,1,308,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(229,'奔腾','S','家用电器','04399836030618924_sm.jpg',0,0,0,1,308,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(230,'三洋','S','家用电器','04399836185660687_sm.gif',0,0,0,1,308,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(231,'大金','D','家用电器','04399836403301996_sm.jpg',0,0,0,1,308,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(232,'三星电器','S','家用电器','04399836619819860_sm.jpg',0,0,0,1,308,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(233,'海尔','H','家用电器','04399837024444210_sm.jpg',0,0,0,1,308,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(234,'格兰仕','G','家用电器','04399837873721609_sm.jpg',0,0,0,1,308,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(235,'海信','H','家用电器','04399838032416433_sm.jpg',0,0,0,1,308,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(236,'博世','B','家用电器','04399838243363042_sm.jpg',0,0,0,1,308,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(237,'老板','L','家用电器','04399838473427197_sm.jpg',0,0,0,1,308,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(238,'奥克斯','A','家用电器','04399838633002147_sm.jpg',0,0,0,1,308,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(239,'LG','L','家用电器','04399838782976323_sm.jpg',0,0,0,1,308,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(240,'创维','C','家用电器','04399839110204841_sm.jpg',0,0,0,1,308,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(241,'松下电器','S','家用电器','04399839604098052_sm.gif',0,0,0,1,308,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(242,'中国联通','Z','虚拟充值','04399847297781057_sm.jpg',0,0,0,1,1037,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(243,'中国电信','Z','虚拟充值','04399847472066981_sm.jpg',0,0,0,1,1037,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(244,'中国移动','Z','虚拟充值','04399847612667714_sm.jpg',0,0,0,1,1037,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(245,'一品玉','Y','食品饮料','04399854316938195_sm.jpg',0,0,0,1,593,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(246,'金奥力','J','食品饮料','04399854503149255_sm.jpg',0,0,0,1,593,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(247,'北大荒','B','食品饮料','04399854638913791_sm.jpg',0,0,0,1,593,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(248,'健安喜','J','食品饮料','04399854806939714_sm.jpg',0,0,0,1,593,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(249,'屯河','T','食品饮料','04399854945115195_sm.jpg',0,0,0,1,593,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(250,'养生堂','Y','食品饮料','04399855140966866_sm.jpg',0,0,0,1,593,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(251,'同庆和堂','T','食品饮料','04399855332734276_sm.jpg',0,0,0,1,593,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(252,'黄飞红','H','食品饮料','04399855513686549_sm.jpg',0,0,0,1,593,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(253,'乐力','L','食品饮料','04399855699218750_sm.jpg',0,0,0,1,593,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(254,'汤臣倍健','T','食品饮料','04399855941379731_sm.jpg',0,0,0,1,593,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(255,'康比特','K','食品饮料','04399856135110739_sm.jpg',0,0,0,1,593,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(256,'喜瑞','X','食品饮料','04399856323294870_sm.jpg',0,0,0,1,593,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(257,'同仁堂','T','食品饮料','04399856454919811_sm.jpg',0,0,0,1,593,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(258,'白兰氏','B','食品饮料','04399856638765013_sm.jpg',0,0,0,1,593,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(259,'Lumi','L','食品饮料','04399856804968818_sm.jpg',0,0,0,1,593,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(260,'新西兰十一坊','X','食品饮料','04399856948519746_sm.jpg',0,0,0,1,593,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(261,'自然之宝','Z','食品饮料','04399857092677752_sm.jpg',0,0,0,1,593,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(262,'善存','S','食品饮料','04399857246559825_sm.jpg',0,0,0,1,593,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(263,'长城葡萄酒','C','食品饮料','04399857399887704_sm.jpg',0,0,0,1,593,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(264,'凯镛','K','食品饮料','04399857579422195_sm.jpg',0,0,0,1,593,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(267,'惠氏','H','母婴用品','04399878077210018_sm.jpg',0,0,0,1,959,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(268,'lala布书','L','母婴用品','04399878481448839_sm.jpg',0,0,0,1,959,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(269,'美赞臣','M','母婴用品','04399878617014779_sm.jpg',0,0,0,1,959,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(270,'好奇','H','母婴用品','04399878791943342_sm.jpg',0,0,0,1,959,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(271,'多美','D','母婴用品','04399878980307860_sm.jpg',0,0,0,1,959,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(272,'嘉宝','J','母婴用品','04399879383821119_sm.jpg',0,0,0,1,959,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(273,'孩之宝','H','母婴用品','04399879573077116_sm.jpg',0,0,0,1,959,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(274,'嗳呵','A','母婴用品','04399879712252398_sm.jpg',0,0,0,1,959,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(275,'美斯特伦','M','母婴用品','04399879861821747_sm.jpg',0,0,0,1,959,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(276,'乐高','L','母婴用品','04399880083330972_sm.jpg',0,0,0,1,959,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(277,'芭比','B','母婴用品','04399880244694286_sm.jpg',0,0,0,1,959,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(278,'NUK','N','母婴用品','04399880420786755_sm.jpg',0,0,0,1,959,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(279,'魔法玉米','M','母婴用品','04399880604749242_sm.jpg',0,0,0,1,959,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(280,'宝贝第一','B','母婴用品','04399880757446523_sm.jpg',0,0,0,1,959,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(281,'强生','Q','母婴用品','04399880892528550_sm.jpg',0,0,0,1,959,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(282,'澳优','A','母婴用品','04399881087936122_sm.jpg',0,0,0,1,959,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(283,'木马智慧','M','母婴用品','04399881246572965_sm.jpg',0,0,0,1,959,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(284,'百立乐','B','母婴用品','04399881709264364_sm.jpg',0,0,0,1,959,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(285,'雀巢','Q','母婴用品','04399881950170970_sm.jpg',0,0,0,1,959,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(286,'帮宝适','B','母婴用品','04399882134949479_sm.jpg',0,0,0,1,959,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(287,'万代','W','母婴用品','04399882291234767_sm.jpg',0,0,0,1,959,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(288,'亲贝','Q','母婴用品','04399882442124015_sm.jpg',0,0,0,1,959,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(289,'十月天使','S','母婴用品','04399882581513663_sm.jpg',0,0,0,1,959,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(290,'多美滋','D','母婴用品','04399882826616164_sm.jpg',0,0,0,1,959,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(291,'星辉','X','母婴用品','04399882966084988_sm.jpg',0,0,0,1,959,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(292,'布朗博士','B','母婴用品','04399883157641690_sm.jpg',0,0,0,1,959,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(293,'新安怡','X','母婴用品','04399883297614786_sm.jpg',0,0,0,1,959,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(294,'费雪','F','母婴用品','04399883534332035_sm.jpg',0,0,0,1,959,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(295,'Hipp','H','母婴用品','04399883690219411_sm.jpg',0,0,0,1,959,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(296,'新大王','X','母婴用品','04399883855598553_sm.jpg',0,0,0,1,959,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(297,'雅培','Y','母婴用品','04399884035362889_sm.jpg',0,0,0,1,959,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(298,'亨氏','H','母婴用品','04399884182772511_sm.jpg',0,0,0,1,959,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(299,'十月妈咪','S','母婴用品','04399884360526483_sm.jpg',0,0,0,1,959,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(300,'好孩子','H','母婴用品','04399884512865285_sm.jpg',0,0,0,1,959,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(301,'婴姿坊','Y','母婴用品','04399884644632532_sm.jpg',0,0,0,1,959,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(302,'妈咪宝贝','M','母婴用品','04399884799920935_sm.jpg',0,0,0,1,959,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(303,'直觉','Z','运动健康','04399889262024650_sm.jpg',0,0,0,1,662,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(304,'世达球','S','运动健康','04399889410183423_sm.jpg',0,0,0,1,662,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(305,'悠度','Y','运动健康','04399889744222357_sm.jpg',0,0,0,1,662,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(306,'威尔胜','W','运动健康','04399889941968796_sm.jpg',0,0,0,1,662,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(307,'远洋瑜伽','Y','运动健康','04399890266352034_sm.jpg',0,0,0,1,662,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(308,'信乐','X','运动健康','04399890429362085_sm.jpg',0,0,0,1,662,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(309,'诺可文','N','运动健康','04399890643925803_sm.jpg',0,0,0,1,662,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(310,'艾威','A','运动健康','04399890796771131_sm.jpg',0,0,0,1,662,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(311,'LELO','L','运动健康','04399890952734102_sm.jpg',0,0,0,1,662,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(312,'乔山','Q','运动健康','04399891122713199_sm.jpg',0,0,0,1,662,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(313,'皮克朋','P','运动健康','04399891285897466_sm.jpg',0,0,0,1,662,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(314,'捷安特','J','运动健康','04399891438458842_sm.jpg',0,0,0,1,662,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(315,'开普特','K','运动健康','04399891598799644_sm.jpg',0,0,0,1,662,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(316,'火枫','H','运动健康','04399891771381530_sm.jpg',0,0,0,1,662,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(317,'INDEED','I','运动健康','04399891911058029_sm.jpg',0,0,0,1,662,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(318,'欧亚马','O','运动健康','04399892067310657_sm.jpg',0,0,0,1,662,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(319,'李斯特','L','运动健康','04399892199751417_sm.jpg',0,0,0,1,662,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(320,'乐美福','L','运动健康','04399892359082323_sm.jpg',0,0,0,1,662,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(321,'以比赞','Y','运动健康','04399892526357198_sm.jpg',0,0,0,1,662,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(322,'皮尔瑜伽','P','运动健康','04399893307910546_sm.jpg',0,0,0,1,662,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(323,'以诗萜','Y','运动健康','04399893452531024_sm.jpg',0,0,0,1,662,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(324,'斯伯丁','S','运动健康','04399893596931049_sm.jpg',0,0,0,1,662,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(326,'玛克','M','','04399902137097199_sm.jpg',0,0,0,1,0,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(327,'美好家','M','','04399902244747580_sm.jpg',0,0,0,1,0,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(328,'溢彩年华','Y','','04399902391635130_sm.jpg',0,0,0,1,0,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(329,'欧司朗','O','','04399902537418591_sm.jpg',0,0,0,1,0,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(330,'世家洁具','S','','04399902668760247_sm.jpg',0,0,0,1,0,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(331,'天堂伞','T','','04399902780394855_sm.jpg',0,0,0,1,0,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(332,'慧乐家','H','','04399902896835151_sm.jpg',0,0,0,1,0,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(333,'希格','X','','04399903024936544_sm.jpg',0,0,0,1,0,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(334,'生活诚品','S','','04399903153847612_sm.jpg',0,0,0,1,0,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(335,'爱仕达','A','','04399903259361371_sm.jpg',0,0,0,1,0,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(336,'罗莱','L','','04399903404912119_sm.jpg',0,0,0,1,0,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(337,'索客','S','','04399903541756673_sm.jpg',0,0,0,1,0,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(338,'好事达','H','','04399903715622158_sm.jpg',0,0,0,1,0,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(339,'安睡宝','A','','04399903832203331_sm.jpg',0,0,0,1,0,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(340,'博洋家纺','B','','04399903956723469_sm.jpg',0,0,0,1,0,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(341,'空间大师','K','','04399904058344749_sm.jpg',0,0,0,1,0,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(342,'富安娜','F','','04399904168163421_sm.jpg',0,0,0,1,0,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(343,'三光云彩','S','','04399904279499345_sm.jpg',0,0,0,1,0,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(344,'乔曼帝','Q','','04399904423386126_sm.jpg',0,0,0,1,0,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(345,'乐扣乐扣','L','','04399904614221217_sm.jpg',0,0,0,1,0,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(348,'奥唯嘉（Ovega）','A','文胸','04431812331259168_sm.jpg',0,0,0,1,58,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(351,'曼妮芬（ManniForm）','M','内衣','04431810033957836_sm.jpg',0,0,0,1,6,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(352,'婷美（TINGMEI）','T','内衣','04431809546541815_sm.png',0,0,0,1,6,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(353,'古今','G','内衣','04431807497959652_sm.jpg',0,0,0,1,6,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(358,'金史密斯（KINGSMITH）','J','运动健康','04420592440315393_small.gif',0,0,4,1,691,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(359,'周大福','Z','珠宝手表','04420650490304114_sm.jpg',0,0,0,1,532,0,'brand_default_max.jpg','brand_default_small.jpg','','',0),(360,'周生生','Z','珠宝手表','04420650201635924_sm.jpg',0,0,0,1,532,0,'brand_default_max.jpg','brand_default_small.jpg','','',0);
/*!40000 ALTER TABLE `te_brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_cart`
--

DROP TABLE IF EXISTS `te_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '购物车id',
  `buyer_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '买家id',
  `store_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '店铺id',
  `store_name` varchar(50) NOT NULL DEFAULT '' COMMENT '店铺名称',
  `goods_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `goods_name` varchar(100) NOT NULL COMMENT '商品名称',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品价格',
  `goods_num` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '购买商品数量',
  `goods_image` varchar(100) NOT NULL COMMENT '商品图片',
  `bl_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '组合套装ID',
  PRIMARY KEY (`cart_id`),
  KEY `member_id` (`buyer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='购物车数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_cart`
--

LOCK TABLES `te_cart` WRITE;
/*!40000 ALTER TABLE `te_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_chain`
--

DROP TABLE IF EXISTS `te_chain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_chain` (
  `chain_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '门店id',
  `store_id` int(10) unsigned NOT NULL COMMENT '所属店铺id',
  `chain_user` varchar(50) NOT NULL COMMENT '登录名',
  `chain_pwd` char(32) NOT NULL COMMENT '登录密码',
  `chain_name` varchar(50) NOT NULL COMMENT '门店名称',
  `chain_img` varchar(50) NOT NULL COMMENT '门店图片',
  `area_id_1` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '一级地区id',
  `area_id_2` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '二级地区id',
  `area_id_3` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '三级地区id',
  `area_id_4` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '四级地区id',
  `area_id` int(10) unsigned NOT NULL COMMENT '地区id',
  `area_info` varchar(50) NOT NULL COMMENT '地区详情',
  `chain_address` varchar(50) NOT NULL COMMENT '详细地址',
  `chain_phone` varchar(100) NOT NULL COMMENT '联系方式',
  `chain_opening_hours` varchar(100) NOT NULL COMMENT '营业时间',
  `chain_traffic_line` varchar(100) NOT NULL COMMENT '交通线路',
  PRIMARY KEY (`chain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺门店表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_chain`
--

LOCK TABLES `te_chain` WRITE;
/*!40000 ALTER TABLE `te_chain` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_chain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_chain_stock`
--

DROP TABLE IF EXISTS `te_chain_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_chain_stock` (
  `chain_id` int(10) unsigned NOT NULL COMMENT '门店id',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品id',
  `goods_commonid` int(10) unsigned NOT NULL COMMENT '商品SPU',
  `stock` int(10) NOT NULL COMMENT '库存',
  PRIMARY KEY (`chain_id`,`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='门店商品库存表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_chain_stock`
--

LOCK TABLES `te_chain_stock` WRITE;
/*!40000 ALTER TABLE `te_chain_stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_chain_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_chat_log`
--

DROP TABLE IF EXISTS `te_chat_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_chat_log` (
  `m_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `f_id` int(10) unsigned NOT NULL COMMENT '会员ID',
  `f_name` varchar(50) NOT NULL COMMENT '会员名',
  `f_ip` varchar(15) NOT NULL COMMENT '发自IP',
  `t_id` int(10) unsigned NOT NULL COMMENT '接收会员ID',
  `t_name` varchar(50) NOT NULL COMMENT '接收会员名',
  `t_msg` varchar(300) DEFAULT NULL COMMENT '消息内容',
  `add_time` int(10) unsigned DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_chat_log`
--

LOCK TABLES `te_chat_log` WRITE;
/*!40000 ALTER TABLE `te_chat_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_chat_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_chat_msg`
--

DROP TABLE IF EXISTS `te_chat_msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_chat_msg` (
  `m_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `f_id` int(10) unsigned NOT NULL COMMENT '会员ID',
  `f_name` varchar(50) NOT NULL COMMENT '会员名',
  `f_ip` varchar(15) NOT NULL COMMENT '发自IP',
  `t_id` int(10) unsigned NOT NULL COMMENT '接收会员ID',
  `t_name` varchar(50) NOT NULL COMMENT '接收会员名',
  `t_msg` varchar(300) DEFAULT NULL COMMENT '消息内容',
  `r_state` tinyint(1) unsigned DEFAULT '2' COMMENT '状态:1为已读,2为未读,默认为2',
  `add_time` int(10) unsigned DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_chat_msg`
--

LOCK TABLES `te_chat_msg` WRITE;
/*!40000 ALTER TABLE `te_chat_msg` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_chat_msg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_circle`
--

DROP TABLE IF EXISTS `te_circle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_circle` (
  `circle_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '圈子id',
  `circle_name` varchar(12) NOT NULL COMMENT '圈子名称',
  `circle_desc` varchar(255) DEFAULT NULL COMMENT '圈子描述',
  `circle_masterid` int(11) unsigned NOT NULL COMMENT '圈主id',
  `circle_mastername` varchar(50) NOT NULL COMMENT '圈主名称',
  `circle_img` varchar(50) DEFAULT NULL COMMENT '圈子图片',
  `class_id` int(11) unsigned NOT NULL COMMENT '圈子分类',
  `circle_mcount` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '圈子成员数',
  `circle_thcount` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '圈子主题数',
  `circle_gcount` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '圈子商品数',
  `circle_pursuereason` varchar(255) DEFAULT NULL COMMENT '圈子申请理由',
  `circle_notice` varchar(255) DEFAULT NULL COMMENT '圈子公告',
  `circle_status` tinyint(3) unsigned NOT NULL COMMENT '圈子状态，0关闭，1开启，2审核中，3审核失败',
  `circle_statusinfo` varchar(255) DEFAULT NULL COMMENT '关闭或审核失败原因',
  `circle_joinaudit` tinyint(3) unsigned NOT NULL COMMENT '加入圈子时候需要审核，0不需要，1需要',
  `circle_addtime` varchar(10) NOT NULL COMMENT '圈子创建时间',
  `circle_noticetime` varchar(10) DEFAULT NULL COMMENT '圈子公告更新时间',
  `is_recommend` tinyint(3) unsigned NOT NULL COMMENT '是否推荐 0未推荐，1已推荐',
  `is_hot` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否为热门圈子 1是 0否',
  `circle_tag` varchar(60) DEFAULT NULL COMMENT '圈子标签',
  `new_verifycount` int(5) unsigned NOT NULL DEFAULT '0' COMMENT '等待审核成员数',
  `new_informcount` int(5) unsigned NOT NULL DEFAULT '0' COMMENT '等待处理举报数',
  `mapply_open` tinyint(4) NOT NULL DEFAULT '0' COMMENT '申请管理是否开启 0关闭，1开启',
  `mapply_ml` tinyint(4) NOT NULL DEFAULT '0' COMMENT '成员级别',
  `new_mapplycount` int(5) unsigned NOT NULL DEFAULT '0' COMMENT '管理申请数量',
  PRIMARY KEY (`circle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='圈子表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_circle`
--

LOCK TABLES `te_circle` WRITE;
/*!40000 ALTER TABLE `te_circle` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_circle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_circle_affix`
--

DROP TABLE IF EXISTS `te_circle_affix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_circle_affix` (
  `affix_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '附件id',
  `affix_filename` varchar(100) NOT NULL COMMENT '文件名称',
  `affix_filethumb` varchar(100) NOT NULL COMMENT '缩略图名称',
  `affix_filesize` int(10) unsigned NOT NULL COMMENT '文件大小，单位字节',
  `affix_addtime` varchar(10) NOT NULL COMMENT '上传时间',
  `affix_type` tinyint(3) unsigned NOT NULL COMMENT '文件类型 0无 1主题 2评论',
  `member_id` int(11) unsigned NOT NULL COMMENT '会员id',
  `theme_id` int(11) unsigned NOT NULL COMMENT '主题id',
  `reply_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论id',
  `circle_id` int(11) unsigned NOT NULL COMMENT '圈子id',
  PRIMARY KEY (`affix_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='附件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_circle_affix`
--

LOCK TABLES `te_circle_affix` WRITE;
/*!40000 ALTER TABLE `te_circle_affix` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_circle_affix` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_circle_class`
--

DROP TABLE IF EXISTS `te_circle_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_circle_class` (
  `class_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '圈子分类id',
  `class_name` varchar(50) NOT NULL COMMENT '圈子分类名称',
  `class_addtime` varchar(10) NOT NULL COMMENT '圈子分类创建时间',
  `class_sort` tinyint(3) unsigned NOT NULL COMMENT '圈子分类排序',
  `class_status` tinyint(3) unsigned NOT NULL COMMENT '圈子分类状态 0不显示，1显示',
  `is_recommend` tinyint(3) unsigned NOT NULL COMMENT '是否推荐 0未推荐，1已推荐',
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='圈子分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_circle_class`
--

LOCK TABLES `te_circle_class` WRITE;
/*!40000 ALTER TABLE `te_circle_class` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_circle_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_circle_explog`
--

DROP TABLE IF EXISTS `te_circle_explog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_circle_explog` (
  `el_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '经验日志id',
  `circle_id` int(11) unsigned NOT NULL COMMENT '圈子id',
  `member_id` int(11) unsigned NOT NULL COMMENT '成员id',
  `member_name` varchar(50) NOT NULL COMMENT '成员名称',
  `el_exp` int(10) NOT NULL COMMENT '获得经验',
  `el_time` varchar(10) NOT NULL COMMENT '获得时间',
  `el_type` tinyint(3) unsigned NOT NULL COMMENT '类型 1管理员操作 2发表话题 3发表回复 4话题被回复 5话题被删除 6回复被删除',
  `el_itemid` varchar(100) NOT NULL COMMENT '信息id',
  `el_desc` varchar(255) NOT NULL COMMENT '描述',
  PRIMARY KEY (`el_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='经验日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_circle_explog`
--

LOCK TABLES `te_circle_explog` WRITE;
/*!40000 ALTER TABLE `te_circle_explog` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_circle_explog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_circle_expmember`
--

DROP TABLE IF EXISTS `te_circle_expmember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_circle_expmember` (
  `member_id` int(11) NOT NULL COMMENT '成员id',
  `circle_id` int(11) unsigned NOT NULL COMMENT '圈子id',
  `em_exp` int(10) NOT NULL COMMENT '获得经验',
  `em_time` varchar(10) NOT NULL COMMENT '获得时间',
  PRIMARY KEY (`member_id`,`circle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='成员每天获得经验表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_circle_expmember`
--

LOCK TABLES `te_circle_expmember` WRITE;
/*!40000 ALTER TABLE `te_circle_expmember` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_circle_expmember` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_circle_exptheme`
--

DROP TABLE IF EXISTS `te_circle_exptheme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_circle_exptheme` (
  `theme_id` int(11) unsigned NOT NULL COMMENT '主题id',
  `et_exp` int(10) NOT NULL COMMENT '获得经验',
  `et_time` varchar(10) NOT NULL COMMENT '获得时间',
  PRIMARY KEY (`theme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='主题每天获得经验表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_circle_exptheme`
--

LOCK TABLES `te_circle_exptheme` WRITE;
/*!40000 ALTER TABLE `te_circle_exptheme` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_circle_exptheme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_circle_fs`
--

DROP TABLE IF EXISTS `te_circle_fs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_circle_fs` (
  `circle_id` int(11) unsigned NOT NULL COMMENT '圈子id',
  `friendship_id` int(11) unsigned NOT NULL COMMENT '友情圈子id',
  `friendship_name` varchar(11) NOT NULL COMMENT '友情圈子名称',
  `friendship_sort` tinyint(4) unsigned NOT NULL COMMENT '友情圈子排序',
  `friendship_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '友情圈子名称 1显示 0隐藏',
  PRIMARY KEY (`circle_id`,`friendship_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='友情圈子表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_circle_fs`
--

LOCK TABLES `te_circle_fs` WRITE;
/*!40000 ALTER TABLE `te_circle_fs` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_circle_fs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_circle_inform`
--

DROP TABLE IF EXISTS `te_circle_inform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_circle_inform` (
  `inform_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '举报id',
  `circle_id` int(11) unsigned NOT NULL COMMENT '圈子id',
  `circle_name` varchar(12) NOT NULL COMMENT '圈子名称',
  `theme_id` int(11) unsigned NOT NULL COMMENT '话题id',
  `theme_name` varchar(50) NOT NULL COMMENT '主题名称',
  `reply_id` int(11) unsigned NOT NULL COMMENT '回复id',
  `member_id` int(11) unsigned NOT NULL COMMENT '会员id',
  `member_name` varchar(50) NOT NULL COMMENT '会员名称',
  `inform_content` varchar(255) NOT NULL COMMENT '举报内容',
  `inform_time` varchar(10) NOT NULL COMMENT '举报时间',
  `inform_type` tinyint(4) NOT NULL COMMENT '类型 0话题、1回复',
  `inform_state` tinyint(4) NOT NULL COMMENT '状态 0未处理、1已处理',
  `inform_opid` int(11) unsigned DEFAULT '0' COMMENT '操作人id',
  `inform_opname` varchar(50) DEFAULT '' COMMENT '操作人名称',
  `inform_opexp` tinyint(4) DEFAULT '0' COMMENT '操作经验',
  `inform_opresult` varchar(255) DEFAULT '' COMMENT '处理结果',
  PRIMARY KEY (`inform_id`),
  KEY `circle_id` (`circle_id`,`theme_id`,`reply_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='圈子举报表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_circle_inform`
--

LOCK TABLES `te_circle_inform` WRITE;
/*!40000 ALTER TABLE `te_circle_inform` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_circle_inform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_circle_like`
--

DROP TABLE IF EXISTS `te_circle_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_circle_like` (
  `theme_id` int(11) unsigned NOT NULL COMMENT '主题id',
  `member_id` int(11) unsigned NOT NULL COMMENT '会员id',
  `circle_id` int(11) unsigned NOT NULL COMMENT '圈子id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='主题赞表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_circle_like`
--

LOCK TABLES `te_circle_like` WRITE;
/*!40000 ALTER TABLE `te_circle_like` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_circle_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_circle_mapply`
--

DROP TABLE IF EXISTS `te_circle_mapply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_circle_mapply` (
  `mapply_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '申请id',
  `circle_id` int(11) unsigned NOT NULL COMMENT '圈子id',
  `member_id` int(11) unsigned NOT NULL COMMENT '成员id',
  `mapply_reason` varchar(255) NOT NULL COMMENT '申请理由',
  `mapply_time` varchar(10) NOT NULL COMMENT '申请时间',
  PRIMARY KEY (`mapply_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='申请管理表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_circle_mapply`
--

LOCK TABLES `te_circle_mapply` WRITE;
/*!40000 ALTER TABLE `te_circle_mapply` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_circle_mapply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_circle_member`
--

DROP TABLE IF EXISTS `te_circle_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_circle_member` (
  `member_id` int(11) unsigned NOT NULL COMMENT '会员id',
  `circle_id` int(11) unsigned NOT NULL COMMENT '圈子id',
  `circle_name` varchar(12) DEFAULT NULL COMMENT '圈子名称',
  `member_name` varchar(50) NOT NULL COMMENT '会员名称',
  `cm_applycontent` varchar(255) DEFAULT '' COMMENT '申请内容',
  `cm_applytime` varchar(10) DEFAULT NULL COMMENT '申请时间',
  `cm_state` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态 0申请中 1通过 2未通过',
  `cm_intro` varchar(255) DEFAULT '' COMMENT '自我介绍',
  `cm_jointime` varchar(10) NOT NULL COMMENT '加入时间',
  `cm_level` int(11) NOT NULL DEFAULT '1' COMMENT '成员级别',
  `cm_levelname` varchar(10) NOT NULL DEFAULT '初级粉丝' COMMENT '成员头衔',
  `cm_exp` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '会员经验',
  `cm_nextexp` int(10) NOT NULL DEFAULT '5' COMMENT '下一级所需经验',
  `is_identity` tinyint(3) unsigned DEFAULT NULL COMMENT '1圈主 2管理 3成员',
  `is_allowspeak` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否允许发言 1允许 0禁止',
  `is_star` tinyint(4) NOT NULL DEFAULT '0' COMMENT '明星成员 1是 0否',
  `cm_thcount` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '主题数',
  `cm_comcount` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '回复数',
  `cm_lastspeaktime` varchar(10) DEFAULT '' COMMENT '最后发言时间',
  `is_recommend` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否推荐 1是 0否',
  PRIMARY KEY (`member_id`,`circle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='圈子会员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_circle_member`
--

LOCK TABLES `te_circle_member` WRITE;
/*!40000 ALTER TABLE `te_circle_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_circle_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_circle_ml`
--

DROP TABLE IF EXISTS `te_circle_ml`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_circle_ml` (
  `circle_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '圈子id',
  `mlref_id` int(10) DEFAULT NULL COMMENT '参考头衔id 0为默认 null为自定义',
  `ml_1` varchar(10) NOT NULL COMMENT '1级头衔名称',
  `ml_2` varchar(10) NOT NULL COMMENT '2级头衔名称',
  `ml_3` varchar(10) NOT NULL COMMENT '3级头衔名称',
  `ml_4` varchar(10) NOT NULL COMMENT '4级头衔名称',
  `ml_5` varchar(10) NOT NULL COMMENT '5级头衔名称',
  `ml_6` varchar(10) NOT NULL COMMENT '6级头衔名称',
  `ml_7` varchar(10) NOT NULL COMMENT '7级头衔名称',
  `ml_8` varchar(10) NOT NULL COMMENT '8级头衔名称',
  `ml_9` varchar(10) NOT NULL COMMENT '9级头衔名称',
  `ml_10` varchar(10) NOT NULL COMMENT '10级头衔名称',
  `ml_11` varchar(10) NOT NULL COMMENT '11级头衔名称',
  `ml_12` varchar(10) NOT NULL COMMENT '12级头衔名称',
  `ml_13` varchar(10) NOT NULL COMMENT '13级头衔名称',
  `ml_14` varchar(10) NOT NULL COMMENT '14级头衔名称',
  `ml_15` varchar(10) NOT NULL COMMENT '15级头衔名称',
  `ml_16` varchar(10) NOT NULL COMMENT '16级头衔名称',
  PRIMARY KEY (`circle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员头衔表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_circle_ml`
--

LOCK TABLES `te_circle_ml` WRITE;
/*!40000 ALTER TABLE `te_circle_ml` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_circle_ml` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_circle_mldefault`
--

DROP TABLE IF EXISTS `te_circle_mldefault`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_circle_mldefault` (
  `mld_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '头衔等级',
  `mld_name` varchar(10) NOT NULL COMMENT '头衔名称',
  `mld_exp` int(10) NOT NULL COMMENT '所需经验值',
  PRIMARY KEY (`mld_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='成员头衔默认设置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_circle_mldefault`
--

LOCK TABLES `te_circle_mldefault` WRITE;
/*!40000 ALTER TABLE `te_circle_mldefault` DISABLE KEYS */;
INSERT INTO `te_circle_mldefault` VALUES (1,'初级粉丝',1),(2,'中级粉丝',5),(3,'高级粉丝',15),(4,'正式会员',30),(5,'正式会员',50),(6,'核心会员',100),(7,'核心会员',200),(8,'铁杆会员',500),(9,'铁杆会员',1000),(10,'知名人士',2000),(11,'知名人士',3000),(12,'人气楷模',6000),(13,'人气楷模',10000),(14,'意见领袖',18000),(15,'资深元老',30000),(16,'荣耀元老',60000);
/*!40000 ALTER TABLE `te_circle_mldefault` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_circle_mlref`
--

DROP TABLE IF EXISTS `te_circle_mlref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_circle_mlref` (
  `mlref_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '参考头衔id',
  `mlref_name` varchar(10) NOT NULL COMMENT '参考头衔名称',
  `mlref_addtime` varchar(10) NOT NULL COMMENT '创建时间',
  `mlref_status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  `mlref_1` varchar(10) NOT NULL COMMENT '1级头衔名称',
  `mlref_2` varchar(10) NOT NULL COMMENT '2级头衔名称',
  `mlref_3` varchar(10) NOT NULL COMMENT '3级头衔名称',
  `mlref_4` varchar(10) NOT NULL COMMENT '4级头衔名称',
  `mlref_5` varchar(10) NOT NULL COMMENT '5级头衔名称',
  `mlref_6` varchar(10) NOT NULL COMMENT '6级头衔名称',
  `mlref_7` varchar(10) NOT NULL COMMENT '7级头衔名称',
  `mlref_8` varchar(10) NOT NULL COMMENT '8级头衔名称',
  `mlref_9` varchar(10) NOT NULL COMMENT '9级头衔名称',
  `mlref_10` varchar(10) NOT NULL COMMENT '10级头衔名称',
  `mlref_11` varchar(10) NOT NULL COMMENT '11级头衔名称',
  `mlref_12` varchar(10) NOT NULL COMMENT '12级头衔名称',
  `mlref_13` varchar(10) NOT NULL COMMENT '13级头衔名称',
  `mlref_14` varchar(10) NOT NULL COMMENT '14级头衔名称',
  `mlref_15` varchar(10) NOT NULL COMMENT '15级头衔名称',
  `mlref_16` varchar(10) NOT NULL COMMENT '16级头衔名称',
  PRIMARY KEY (`mlref_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='会员参考头衔表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_circle_mlref`
--

LOCK TABLES `te_circle_mlref` WRITE;
/*!40000 ALTER TABLE `te_circle_mlref` DISABLE KEYS */;
INSERT INTO `te_circle_mlref` VALUES (1,'校园系列','1371784037',1,'托儿所','幼儿园','学前班','一年级','二年级','三年级','四年级','五年级','六年级','初一','初二','初三','高一','高二','高三','大学'),(2,'名气系列','1371797598',1,'默默无闻','崭露头角','锋芒毕露','小有名气','小有美名','颇具名气','颇具盛名','富有名气','富有美誉','远近闻名','崭露头角','声名远扬','赫赫有名','大名鼎鼎','如雷贯耳','名扬四海'),(3,'内涵系列','1371884423',1,'1L喂熊','抢个沙发','自带板凳','路人甲君','打酱油的','华丽飘过','前来围观','我勒个去','亮了瞎了','兰州烧饼','鸭梨山大','笑而不语','内牛满面','虎躯一震','霸气外露','此贴必火'),(4,'军衔系列','1371884788',1,'下士','中士','上士','少尉','中尉','上尉','大尉','少校','中校','上校','大校','少将','中将','上将','大将','元帅'),(5,'书生系列','1371884953',1,'白丁','童生','秀才','举人','举人','贡士','进士','进士','进士','探花','探花','榜眼','榜眼','状元','状元','圣贤'),(6,'武侠系列','1371885047',1,'初涉江湖','无名之辈','仗剑天涯','人海孤鸿','四方游侠','江湖少侠','后起之秀','武林新贵','武林高手','英雄豪杰','人中龙凤','自成一派','名震江湖','武林盟主','一代宗师','笑傲江湖');
/*!40000 ALTER TABLE `te_circle_mlref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_circle_recycle`
--

DROP TABLE IF EXISTS `te_circle_recycle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_circle_recycle` (
  `recycle_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '回收站id',
  `member_id` int(11) NOT NULL COMMENT '会员id',
  `member_name` varchar(50) NOT NULL COMMENT '会员名称',
  `circle_id` int(11) unsigned NOT NULL COMMENT '圈子id',
  `circle_name` varchar(12) NOT NULL COMMENT '圈子名称',
  `theme_name` varchar(50) NOT NULL COMMENT '主题名称',
  `recycle_content` text NOT NULL COMMENT '内容',
  `recycle_opid` int(11) unsigned NOT NULL COMMENT '操作人id',
  `recycle_opname` varchar(50) NOT NULL COMMENT '操作人名称',
  `recycle_type` tinyint(3) unsigned NOT NULL COMMENT '类型 1话题，2回复',
  `recycle_time` varchar(10) NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`recycle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='圈子回收站表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_circle_recycle`
--

LOCK TABLES `te_circle_recycle` WRITE;
/*!40000 ALTER TABLE `te_circle_recycle` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_circle_recycle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_circle_thclass`
--

DROP TABLE IF EXISTS `te_circle_thclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_circle_thclass` (
  `thclass_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主题分类id',
  `thclass_name` varchar(20) NOT NULL COMMENT '主题名称',
  `thclass_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '主题状态 1开启，0关闭',
  `is_moderator` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '管理专属 1是，0否',
  `thclass_sort` tinyint(3) unsigned NOT NULL COMMENT '分类排序',
  `circle_id` int(11) unsigned NOT NULL COMMENT '所属圈子id',
  PRIMARY KEY (`thclass_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='圈子主题分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_circle_thclass`
--

LOCK TABLES `te_circle_thclass` WRITE;
/*!40000 ALTER TABLE `te_circle_thclass` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_circle_thclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_circle_theme`
--

DROP TABLE IF EXISTS `te_circle_theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_circle_theme` (
  `theme_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主题id',
  `theme_name` varchar(50) NOT NULL COMMENT '主题名称',
  `theme_content` text NOT NULL COMMENT '主题内容',
  `circle_id` int(11) unsigned NOT NULL COMMENT '圈子id',
  `circle_name` varchar(12) NOT NULL COMMENT '圈子名称',
  `thclass_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '主题分类id',
  `thclass_name` varchar(20) DEFAULT '' COMMENT '主题分类名称',
  `member_id` int(11) unsigned NOT NULL COMMENT '会员id',
  `member_name` varchar(50) NOT NULL COMMENT '会员名称',
  `is_identity` tinyint(3) unsigned NOT NULL COMMENT '1圈主 2管理 3成员',
  `theme_addtime` varchar(10) NOT NULL COMMENT '主题发表时间',
  `theme_editname` varchar(50) DEFAULT NULL COMMENT '编辑人名称',
  `theme_edittime` varchar(10) DEFAULT NULL COMMENT '主题编辑时间',
  `theme_likecount` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '喜欢数量',
  `theme_commentcount` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论数量',
  `theme_browsecount` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '浏览数量',
  `theme_sharecount` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '分享数量',
  `is_stick` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否置顶 1是  0否',
  `is_digest` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否加精 1是 0否',
  `lastspeak_id` int(11) unsigned DEFAULT NULL COMMENT '最后发言人id',
  `lastspeak_name` varchar(50) DEFAULT NULL COMMENT '最后发言人名称',
  `lastspeak_time` varchar(10) DEFAULT NULL COMMENT '最后发言时间',
  `has_goods` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '商品标记 1是 0否',
  `has_affix` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件标记 1是 0 否',
  `is_closed` tinyint(4) NOT NULL DEFAULT '0' COMMENT '屏蔽 1是 0否',
  `is_recommend` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否推荐 1是 0否',
  `is_shut` tinyint(4) NOT NULL DEFAULT '0' COMMENT '主题是否关闭 1是 0否',
  `theme_exp` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '获得经验',
  `theme_readperm` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '阅读权限',
  `theme_special` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '特殊话题 0普通 1投票',
  PRIMARY KEY (`theme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='圈子主题表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_circle_theme`
--

LOCK TABLES `te_circle_theme` WRITE;
/*!40000 ALTER TABLE `te_circle_theme` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_circle_theme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_circle_thg`
--

DROP TABLE IF EXISTS `te_circle_thg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_circle_thg` (
  `themegoods_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主题商品id',
  `theme_id` int(11) NOT NULL COMMENT '主题id',
  `reply_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '回复id',
  `circle_id` int(11) unsigned NOT NULL COMMENT '圈子id',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `goods_name` varchar(100) NOT NULL COMMENT '商品名称',
  `goods_price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `goods_image` varchar(1000) NOT NULL COMMENT '商品图片',
  `store_id` int(11) NOT NULL COMMENT '店铺id',
  `thg_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '商品类型 0为本商城、1为淘宝 默认为0',
  `thg_url` varchar(1000) DEFAULT NULL COMMENT '商品链接',
  PRIMARY KEY (`themegoods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='主题商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_circle_thg`
--

LOCK TABLES `te_circle_thg` WRITE;
/*!40000 ALTER TABLE `te_circle_thg` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_circle_thg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_circle_thpoll`
--

DROP TABLE IF EXISTS `te_circle_thpoll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_circle_thpoll` (
  `theme_id` int(11) unsigned NOT NULL COMMENT '话题id',
  `poll_multiple` tinyint(3) unsigned NOT NULL COMMENT '单/多选 0单选、1多选',
  `poll_startime` varchar(10) NOT NULL COMMENT '开始时间',
  `poll_endtime` varchar(10) NOT NULL COMMENT '结束时间',
  `poll_days` tinyint(3) unsigned NOT NULL COMMENT '投票天数',
  `poll_voters` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '投票参与人数',
  PRIMARY KEY (`theme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='投票表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_circle_thpoll`
--

LOCK TABLES `te_circle_thpoll` WRITE;
/*!40000 ALTER TABLE `te_circle_thpoll` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_circle_thpoll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_circle_thpolloption`
--

DROP TABLE IF EXISTS `te_circle_thpolloption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_circle_thpolloption` (
  `pollop_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '投票选项id',
  `theme_id` int(11) unsigned NOT NULL COMMENT '话题id',
  `pollop_option` varchar(80) NOT NULL COMMENT '投票选项',
  `pollop_votes` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '得票数',
  `pollop_sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `pollop_votername` mediumtext COMMENT '投票者名称',
  PRIMARY KEY (`pollop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='投票选项表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_circle_thpolloption`
--

LOCK TABLES `te_circle_thpolloption` WRITE;
/*!40000 ALTER TABLE `te_circle_thpolloption` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_circle_thpolloption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_circle_thpollvoter`
--

DROP TABLE IF EXISTS `te_circle_thpollvoter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_circle_thpollvoter` (
  `theme_id` int(11) unsigned NOT NULL COMMENT '话题id',
  `member_id` int(11) unsigned NOT NULL COMMENT '成员id',
  `member_name` varchar(50) NOT NULL COMMENT '成员名称',
  `pollvo_options` mediumtext NOT NULL COMMENT '投票选项',
  `pollvo_time` varchar(10) NOT NULL COMMENT '投票选项',
  KEY `theme_id` (`theme_id`,`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='成员投票信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_circle_thpollvoter`
--

LOCK TABLES `te_circle_thpollvoter` WRITE;
/*!40000 ALTER TABLE `te_circle_thpollvoter` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_circle_thpollvoter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_circle_threply`
--

DROP TABLE IF EXISTS `te_circle_threply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_circle_threply` (
  `theme_id` int(11) unsigned NOT NULL COMMENT '主题id',
  `reply_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `circle_id` int(11) unsigned NOT NULL COMMENT '圈子id',
  `member_id` int(11) unsigned NOT NULL COMMENT '会员id',
  `member_name` varchar(50) NOT NULL COMMENT '会员名称',
  `reply_content` text NOT NULL COMMENT '评论内容',
  `reply_addtime` varchar(10) NOT NULL COMMENT '发表时间',
  `reply_replyid` int(11) unsigned DEFAULT NULL COMMENT '回复楼层id',
  `reply_replyname` varchar(50) DEFAULT NULL COMMENT '回复楼层会员名称',
  `is_closed` tinyint(4) NOT NULL DEFAULT '0' COMMENT '屏蔽 1是 0否',
  `reply_exp` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '获得经验',
  PRIMARY KEY (`theme_id`,`reply_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='主题评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_circle_threply`
--

LOCK TABLES `te_circle_threply` WRITE;
/*!40000 ALTER TABLE `te_circle_threply` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_circle_threply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_cms_article`
--

DROP TABLE IF EXISTS `te_cms_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_cms_article` (
  `article_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章编号',
  `article_title` varchar(50) NOT NULL COMMENT '文章标题',
  `article_class_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章分类编号',
  `article_origin` varchar(50) DEFAULT NULL COMMENT '文章来源',
  `article_origin_address` varchar(255) DEFAULT NULL COMMENT '文章来源链接',
  `article_author` varchar(50) NOT NULL COMMENT '文章作者',
  `article_abstract` varchar(140) DEFAULT NULL COMMENT '文章摘要',
  `article_content` text COMMENT '文章正文',
  `article_image` varchar(255) DEFAULT NULL COMMENT '文章图片',
  `article_keyword` varchar(255) DEFAULT NULL COMMENT '文章关键字',
  `article_link` varchar(255) DEFAULT NULL COMMENT '相关文章',
  `article_goods` text COMMENT '相关商品',
  `article_start_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章有效期开始时间',
  `article_end_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章有效期结束时间',
  `article_publish_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章发布时间',
  `article_click` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章点击量',
  `article_sort` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '文章排序0-255',
  `article_commend_flag` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '文章推荐标志0-未推荐，1-已推荐',
  `article_comment_flag` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '文章是否允许评论1-允许，0-不允许',
  `article_verify_admin` varchar(50) DEFAULT NULL COMMENT '文章审核管理员',
  `article_verify_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章审核时间',
  `article_state` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1-草稿、2-待审核、3-已发布、4-回收站',
  `article_publisher_name` varchar(50) NOT NULL COMMENT '发布者用户名 ',
  `article_publisher_id` int(10) unsigned NOT NULL COMMENT '发布者编号',
  `article_type` tinyint(1) unsigned NOT NULL COMMENT '文章类型1-管理员发布，2-用户投稿',
  `article_attachment_path` varchar(50) NOT NULL COMMENT '文章附件路径',
  `article_image_all` text COMMENT '文章全部图片',
  `article_modify_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章修改时间',
  `article_tag` varchar(255) DEFAULT NULL COMMENT '文章标签',
  `article_comment_count` int(10) unsigned DEFAULT '0' COMMENT '文章评论数',
  `article_attitude_1` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章心情1',
  `article_attitude_2` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章心情2',
  `article_attitude_3` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章心情3',
  `article_attitude_4` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章心情4',
  `article_attitude_5` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章心情5',
  `article_attitude_6` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章心情6',
  `article_title_short` varchar(50) NOT NULL DEFAULT '' COMMENT '文章短标题',
  `article_attitude_flag` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '文章态度开关1-允许，0-不允许',
  `article_commend_image_flag` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '文章推荐标志(图文)',
  `article_share_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章分享数',
  `article_verify_reason` varchar(255) DEFAULT NULL COMMENT '审核失败原因',
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS文章表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_cms_article`
--

LOCK TABLES `te_cms_article` WRITE;
/*!40000 ALTER TABLE `te_cms_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_cms_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_cms_article_attitude`
--

DROP TABLE IF EXISTS `te_cms_article_attitude`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_cms_article_attitude` (
  `attitude_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '心情编号',
  `attitude_article_id` int(10) unsigned NOT NULL COMMENT '文章编号',
  `attitude_member_id` int(10) unsigned NOT NULL COMMENT '用户编号',
  `attitude_time` int(10) unsigned NOT NULL COMMENT '发布心情时间',
  PRIMARY KEY (`attitude_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS文章心情表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_cms_article_attitude`
--

LOCK TABLES `te_cms_article_attitude` WRITE;
/*!40000 ALTER TABLE `te_cms_article_attitude` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_cms_article_attitude` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_cms_article_class`
--

DROP TABLE IF EXISTS `te_cms_article_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_cms_article_class` (
  `class_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类编号 ',
  `class_name` varchar(50) NOT NULL COMMENT '分类名称',
  `class_sort` tinyint(1) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='cms文章分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_cms_article_class`
--

LOCK TABLES `te_cms_article_class` WRITE;
/*!40000 ALTER TABLE `te_cms_article_class` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_cms_article_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_cms_comment`
--

DROP TABLE IF EXISTS `te_cms_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_cms_comment` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论编号',
  `comment_type` tinyint(1) NOT NULL COMMENT '评论类型编号',
  `comment_object_id` int(10) unsigned NOT NULL COMMENT '推荐商品编号',
  `comment_message` varchar(2000) NOT NULL COMMENT '评论内容',
  `comment_member_id` int(10) unsigned NOT NULL COMMENT '评论人编号',
  `comment_time` int(10) unsigned NOT NULL COMMENT '评论时间',
  `comment_quote` varchar(255) DEFAULT NULL COMMENT '评论引用',
  `comment_up` int(10) unsigned DEFAULT '0' COMMENT '顶数量',
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_cms_comment`
--

LOCK TABLES `te_cms_comment` WRITE;
/*!40000 ALTER TABLE `te_cms_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_cms_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_cms_comment_up`
--

DROP TABLE IF EXISTS `te_cms_comment_up`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_cms_comment_up` (
  `up_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '顶编号',
  `comment_id` int(10) unsigned NOT NULL COMMENT '评论编号',
  `up_member_id` int(10) unsigned NOT NULL COMMENT '用户编号',
  `up_time` int(10) unsigned NOT NULL COMMENT '评论时间',
  PRIMARY KEY (`up_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS评论顶表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_cms_comment_up`
--

LOCK TABLES `te_cms_comment_up` WRITE;
/*!40000 ALTER TABLE `te_cms_comment_up` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_cms_comment_up` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_cms_index_module`
--

DROP TABLE IF EXISTS `te_cms_index_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_cms_index_module` (
  `module_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模块编号',
  `module_title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `module_name` varchar(50) NOT NULL COMMENT '模板名称',
  `module_type` varchar(50) DEFAULT '' COMMENT '模块类型，index-固定内容、article1-文章模块1、article2-文章模块2、micro-微商城、adv-通栏广告',
  `module_sort` tinyint(1) unsigned DEFAULT '255' COMMENT '排序',
  `module_state` tinyint(1) unsigned DEFAULT '1' COMMENT '状态1-显示、0-不显示',
  `module_content` text COMMENT '模块内容',
  `module_style` varchar(50) NOT NULL DEFAULT 'style1' COMMENT '模块主题',
  `module_view` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '后台列表显示样式 1-展开 2-折叠',
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS首页模块表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_cms_index_module`
--

LOCK TABLES `te_cms_index_module` WRITE;
/*!40000 ALTER TABLE `te_cms_index_module` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_cms_index_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_cms_module`
--

DROP TABLE IF EXISTS `te_cms_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_cms_module` (
  `module_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模板模块编号',
  `module_title` varchar(50) NOT NULL DEFAULT '' COMMENT '模板模块标题',
  `module_name` varchar(50) NOT NULL DEFAULT '' COMMENT '模板名称',
  `module_type` varchar(50) NOT NULL DEFAULT '' COMMENT '模板模块类型，index-固定内容、article1-文章模块1、article2-文章模块2、micro-微商城、adv-通栏广告',
  `module_class` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '模板模块种类1-系统自带 2-用户自定义',
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='CMS模板模块表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_cms_module`
--

LOCK TABLES `te_cms_module` WRITE;
/*!40000 ALTER TABLE `te_cms_module` DISABLE KEYS */;
INSERT INTO `te_cms_module` VALUES (1,'综合模块','index','index',1),(2,'微商城模块','micro','micro',1),(3,'文章模块1','article1','article1',1),(4,'文章模块2','article2','article2',1),(5,'通栏广告模块','adv','adv',1);
/*!40000 ALTER TABLE `te_cms_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_cms_module_assembly`
--

DROP TABLE IF EXISTS `te_cms_module_assembly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_cms_module_assembly` (
  `assembly_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '组件编号',
  `assembly_title` varchar(50) NOT NULL COMMENT '组件标题',
  `assembly_name` varchar(50) NOT NULL COMMENT '组件名称',
  `assembly_explain` varchar(255) NOT NULL COMMENT '组件说明',
  PRIMARY KEY (`assembly_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='cms模块组件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_cms_module_assembly`
--

LOCK TABLES `te_cms_module_assembly` WRITE;
/*!40000 ALTER TABLE `te_cms_module_assembly` DISABLE KEYS */;
INSERT INTO `te_cms_module_assembly` VALUES (1,'文章','article','文章组件'),(2,'图片','picture','图片组件'),(3,'商品','goods','商品组件'),(4,'品牌','brand','品牌组件'),(5,'图文','article_image','图文'),(6,'店铺','store','店铺'),(7,'会员','member','会员'),(8,'FLASH','flash','FLASH'),(9,'自定义','html','自定义');
/*!40000 ALTER TABLE `te_cms_module_assembly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_cms_module_frame`
--

DROP TABLE IF EXISTS `te_cms_module_frame`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_cms_module_frame` (
  `frame_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '框架编号',
  `frame_title` varchar(50) NOT NULL COMMENT '框架标题',
  `frame_name` varchar(50) NOT NULL COMMENT '框架名称',
  `frame_explain` varchar(255) NOT NULL COMMENT '框架说明',
  `frame_structure` varchar(255) NOT NULL COMMENT '框架结构',
  PRIMARY KEY (`frame_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='cms模块框架表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_cms_module_frame`
--

LOCK TABLES `te_cms_module_frame` WRITE;
/*!40000 ALTER TABLE `te_cms_module_frame` DISABLE KEYS */;
INSERT INTO `te_cms_module_frame` VALUES (1,'右边栏三列结构','2_2_1','右边栏三列结构','{\"block1\":{\"type\":\"block\",\"name\":\"w2\"},\"block2\":{\"type\":\"block\",\"name\":\"w2\"},\"block3\":{\"type\":\"block\",\"name\":\"w1\"}}'),(2,'左边栏三列结构','1_2_2','左边栏三列结构','{\"block1\":{\"type\":\"block\",\"name\":\"w1\"},\"block2\":{\"type\":\"block\",\"name\":\"w2\"},\"block3\":{\"type\":\"block\",\"name\":\"w2\"}}'),(3,'左右宽边栏结构','2_1_2','左右宽边栏结构','{\"block1\":{\"type\":\"block\",\"name\":\"w2\"},\"block2\":{\"type\":\"block\",\"name\":\"w1\"},\"block3\":{\"type\":\"block\",\"name\":\"w2\"}}'),(4,'左边栏两列结构','1_4','左边栏两列结构','{\"block1\":{\"type\":\"block\",\"name\":\"w1\"},\"block2\":{\"type\":\"block\",\"name\":\"w4\"}} '),(5,'右边栏两列结构','4_1','右边栏两列结构','{\"block1\":{\"type\":\"block\",\"name\":\"w4\"},\"block2\":{\"type\":\"block\",\"name\":\"w1\"}} '),(6,'右边栏混合结构','2x2_2_1','右边栏混合结构','{\"block1\":{\"type\":\"content\",\"name\":\"w2\",\"child\":{\"block2\":{\"type\":\"block\",\"name\":\"w22\"},\"block3\":{\"type\":\"block\",\"name\":\"w22\"}}},\"block4\":{\"type\":\"block\",\"name\":\"w2\"},\"block5\":{\"type\":\"block\",\"name\":\"w1\"}} '),(7,'左边栏混合结构','1_2_2x2','左边栏混合结构','{\"block1\":{\"type\":\"block\",\"name\":\"w1\"},\"block2\":{\"type\":\"block\",\"name\":\"w2\"},\"block3\":{\"type\":\"content\",\"name\":\"w2\",\"child\":{\"block4\":{\"type\":\"block\",\"name\":\"w22\"},\"block5\":{\"type\":\"block\",\"name\":\"w22\"}}}}'),(8,'一体化结构','1','一体化结构','{\"block1\":{\"type\":\"block\",\"name\":\"w5\"}}');
/*!40000 ALTER TABLE `te_cms_module_frame` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_cms_navigation`
--

DROP TABLE IF EXISTS `te_cms_navigation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_cms_navigation` (
  `navigation_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '导航编号',
  `navigation_title` varchar(50) NOT NULL COMMENT '导航标题',
  `navigation_link` varchar(255) NOT NULL COMMENT '导航链接',
  `navigation_sort` tinyint(1) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  `navigation_open_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '导航打开方式1-本页打开，2-新页打开',
  PRIMARY KEY (`navigation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='CMS导航表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_cms_navigation`
--

LOCK TABLES `te_cms_navigation` WRITE;
/*!40000 ALTER TABLE `te_cms_navigation` DISABLE KEYS */;
INSERT INTO `te_cms_navigation` VALUES (1,'商城','http://it.hnlichaung.com/',255,1),(2,'圈子','http://it.hnlichaung.com/circle',255,1),(3,'微商城','http://it.hnlichaung.com/microshop',255,1),(4,'品牌','http://it.hnlichaung.com/shop/index.php?act=brand',255,1);
/*!40000 ALTER TABLE `te_cms_navigation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_cms_picture`
--

DROP TABLE IF EXISTS `te_cms_picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_cms_picture` (
  `picture_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '画报编号',
  `picture_title` varchar(50) NOT NULL COMMENT '画报标题',
  `picture_class_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '画报分类编号',
  `picture_author` varchar(50) NOT NULL COMMENT '画报作者',
  `picture_abstract` varchar(140) DEFAULT NULL COMMENT '画报摘要',
  `picture_image` varchar(255) DEFAULT NULL COMMENT '画报图片',
  `picture_keyword` varchar(255) DEFAULT NULL COMMENT '画报关键字',
  `picture_publish_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '画报发布时间',
  `picture_click` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '画报点击量',
  `picture_sort` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '画报排序0-255',
  `picture_commend_flag` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '画报推荐标志1-未推荐，2-已推荐',
  `picture_comment_flag` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '画报是否允许评论1-允许，2-不允许',
  `picture_verify_admin` varchar(50) DEFAULT NULL COMMENT '画报审核管理员',
  `picture_verify_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '画报审核时间',
  `picture_state` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1-草稿、2-待审核、3-已发布、4-回收站、5-已关闭',
  `picture_publisher_name` varchar(50) NOT NULL COMMENT '发布人用户名',
  `picture_publisher_id` int(10) unsigned NOT NULL COMMENT '发布人编号',
  `picture_type` tinyint(1) unsigned NOT NULL COMMENT '画报类型1-管理员发布，2-用户投稿',
  `picture_attachment_path` varchar(50) NOT NULL DEFAULT '',
  `picture_modify_time` int(10) unsigned NOT NULL COMMENT '画报修改时间',
  `picture_tag` varchar(255) DEFAULT NULL COMMENT '画报标签',
  `picture_comment_count` int(10) unsigned DEFAULT '0' COMMENT '画报评论数',
  `picture_title_short` varchar(50) DEFAULT '' COMMENT '画报短标题',
  `picture_image_count` tinyint(1) unsigned DEFAULT '0' COMMENT '画报图片总数',
  `picture_share_count` int(10) unsigned DEFAULT '0' COMMENT '画报分享数',
  `picture_verify_reason` varchar(255) DEFAULT NULL COMMENT '审核失败原因',
  PRIMARY KEY (`picture_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS画报表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_cms_picture`
--

LOCK TABLES `te_cms_picture` WRITE;
/*!40000 ALTER TABLE `te_cms_picture` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_cms_picture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_cms_picture_class`
--

DROP TABLE IF EXISTS `te_cms_picture_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_cms_picture_class` (
  `class_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类编号 ',
  `class_name` varchar(50) NOT NULL COMMENT '分类名称',
  `class_sort` tinyint(1) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='cms画报分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_cms_picture_class`
--

LOCK TABLES `te_cms_picture_class` WRITE;
/*!40000 ALTER TABLE `te_cms_picture_class` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_cms_picture_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_cms_picture_image`
--

DROP TABLE IF EXISTS `te_cms_picture_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_cms_picture_image` (
  `image_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '图片编号',
  `image_name` varchar(255) NOT NULL COMMENT '图片地址',
  `image_abstract` varchar(200) DEFAULT NULL COMMENT '图片摘要',
  `image_goods` text COMMENT '相关商品',
  `image_store` varchar(255) DEFAULT NULL COMMENT '相关店铺',
  `image_width` int(10) unsigned DEFAULT NULL COMMENT '图片宽度',
  `image_height` int(10) unsigned DEFAULT NULL COMMENT '图片高度',
  `image_picture_id` int(10) unsigned NOT NULL COMMENT '画报编号',
  `image_path` varchar(50) DEFAULT NULL COMMENT '图片路径',
  PRIMARY KEY (`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS画报图片表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_cms_picture_image`
--

LOCK TABLES `te_cms_picture_image` WRITE;
/*!40000 ALTER TABLE `te_cms_picture_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_cms_picture_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_cms_special`
--

DROP TABLE IF EXISTS `te_cms_special`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_cms_special` (
  `special_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '专题编号',
  `special_title` varchar(50) NOT NULL COMMENT '专题标题',
  `special_stitle` varchar(200) NOT NULL COMMENT '专题副标题',
  `special_margin_top` int(10) DEFAULT '0' COMMENT '正文距顶部距离',
  `special_background` varchar(255) DEFAULT NULL COMMENT '专题背景',
  `special_image` varchar(255) DEFAULT NULL COMMENT '专题封面图',
  `special_image_all` text COMMENT '专题图片',
  `special_content` text COMMENT '专题内容',
  `special_modify_time` int(10) unsigned NOT NULL COMMENT '专题修改时间',
  `special_publish_id` int(10) unsigned NOT NULL COMMENT '专题发布者编号',
  `special_state` tinyint(1) unsigned NOT NULL COMMENT '专题状态1-草稿、2-已发布',
  `special_background_color` varchar(10) NOT NULL DEFAULT '#FFFFFF' COMMENT '专题背景色',
  `special_repeat` varchar(10) NOT NULL DEFAULT 'no-repeat' COMMENT '背景重复方式',
  `special_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '专题类型(1-cms专题 2-商城专题)',
  PRIMARY KEY (`special_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS专题表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_cms_special`
--

LOCK TABLES `te_cms_special` WRITE;
/*!40000 ALTER TABLE `te_cms_special` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_cms_special` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_cms_tag`
--

DROP TABLE IF EXISTS `te_cms_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_cms_tag` (
  `tag_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '标签编号',
  `tag_name` varchar(50) NOT NULL COMMENT '标签名称',
  `tag_sort` tinyint(1) unsigned NOT NULL COMMENT '标签排序',
  `tag_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '标签使用计数',
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS标签表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_cms_tag`
--

LOCK TABLES `te_cms_tag` WRITE;
/*!40000 ALTER TABLE `te_cms_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_cms_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_cms_tag_relation`
--

DROP TABLE IF EXISTS `te_cms_tag_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_cms_tag_relation` (
  `relation_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '关系编号',
  `relation_type` tinyint(1) unsigned NOT NULL COMMENT '关系类型1-文章，2-画报',
  `relation_tag_id` int(10) unsigned NOT NULL COMMENT '标签编号',
  `relation_object_id` int(10) unsigned NOT NULL COMMENT '对象编号',
  PRIMARY KEY (`relation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS标签关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_cms_tag_relation`
--

LOCK TABLES `te_cms_tag_relation` WRITE;
/*!40000 ALTER TABLE `te_cms_tag_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_cms_tag_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_complain`
--

DROP TABLE IF EXISTS `te_complain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_complain` (
  `complain_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '投诉id',
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `order_goods_id` int(10) unsigned DEFAULT '0' COMMENT '订单商品ID',
  `accuser_id` int(11) NOT NULL COMMENT '原告id',
  `accuser_name` varchar(50) NOT NULL COMMENT '原告名称',
  `accused_id` int(11) NOT NULL COMMENT '被告id',
  `accused_name` varchar(50) NOT NULL COMMENT '被告名称',
  `complain_subject_content` varchar(50) NOT NULL COMMENT '投诉主题',
  `complain_subject_id` int(11) NOT NULL COMMENT '投诉主题id',
  `complain_content` varchar(255) DEFAULT NULL COMMENT '投诉内容',
  `complain_pic1` varchar(100) DEFAULT NULL COMMENT '投诉图片1',
  `complain_pic2` varchar(100) DEFAULT NULL COMMENT '投诉图片2',
  `complain_pic3` varchar(100) DEFAULT NULL COMMENT '投诉图片3',
  `complain_datetime` int(11) NOT NULL COMMENT '投诉时间',
  `complain_handle_datetime` int(11) DEFAULT NULL COMMENT '投诉处理时间',
  `complain_handle_member_id` int(11) DEFAULT NULL COMMENT '投诉处理人id',
  `appeal_message` varchar(255) DEFAULT NULL COMMENT '申诉内容',
  `appeal_datetime` int(11) DEFAULT NULL COMMENT '申诉时间',
  `appeal_pic1` varchar(100) DEFAULT NULL COMMENT '申诉图片1',
  `appeal_pic2` varchar(100) DEFAULT NULL COMMENT '申诉图片2',
  `appeal_pic3` varchar(100) DEFAULT NULL COMMENT '申诉图片3',
  `final_handle_message` varchar(255) DEFAULT NULL COMMENT '最终处理意见',
  `final_handle_datetime` int(11) DEFAULT NULL COMMENT '最终处理时间',
  `final_handle_member_id` int(11) DEFAULT NULL COMMENT '最终处理人id',
  `complain_state` tinyint(4) NOT NULL COMMENT '投诉状态(10-新投诉/20-投诉通过转给被投诉人/30-被投诉人已申诉/40-提交仲裁/99-已关闭)',
  `complain_active` tinyint(4) NOT NULL DEFAULT '1' COMMENT '投诉是否通过平台审批(1未通过/2通过)',
  PRIMARY KEY (`complain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='投诉表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_complain`
--

LOCK TABLES `te_complain` WRITE;
/*!40000 ALTER TABLE `te_complain` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_complain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_complain_subject`
--

DROP TABLE IF EXISTS `te_complain_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_complain_subject` (
  `complain_subject_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '投诉主题id',
  `complain_subject_content` varchar(50) NOT NULL COMMENT '投诉主题',
  `complain_subject_desc` varchar(100) NOT NULL COMMENT '投诉主题描述',
  `complain_subject_state` tinyint(4) NOT NULL COMMENT '投诉主题状态(1-有效/2-失效)',
  PRIMARY KEY (`complain_subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='投诉主题表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_complain_subject`
--

LOCK TABLES `te_complain_subject` WRITE;
/*!40000 ALTER TABLE `te_complain_subject` DISABLE KEYS */;
INSERT INTO `te_complain_subject` VALUES (1,'商家不同意退款','买家申请退款被拒绝。',2),(2,'未收到货','交易成功，未收到货，钱已经付给商家，可进行维权。',1),(3,'售后保障服务','交易完成后30天内，在使用商品过程中，发现商品有质量问题或无法正常使用，可进行维权。',1);
/*!40000 ALTER TABLE `te_complain_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_complain_talk`
--

DROP TABLE IF EXISTS `te_complain_talk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_complain_talk` (
  `talk_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '投诉对话id',
  `complain_id` int(11) NOT NULL COMMENT '投诉id',
  `talk_member_id` int(11) NOT NULL COMMENT '发言人id',
  `talk_member_name` varchar(50) NOT NULL COMMENT '发言人名称',
  `talk_member_type` varchar(10) NOT NULL COMMENT '发言人类型(1-投诉人/2-被投诉人/3-平台)',
  `talk_content` varchar(255) NOT NULL COMMENT '发言内容',
  `talk_state` tinyint(4) NOT NULL COMMENT '发言状态(1-显示/2-不显示)',
  `talk_admin` int(11) NOT NULL DEFAULT '0' COMMENT '对话管理员，屏蔽对话人的id',
  `talk_datetime` int(11) NOT NULL COMMENT '对话发表时间',
  PRIMARY KEY (`talk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='投诉对话表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_complain_talk`
--

LOCK TABLES `te_complain_talk` WRITE;
/*!40000 ALTER TABLE `te_complain_talk` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_complain_talk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_consult`
--

DROP TABLE IF EXISTS `te_consult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_consult` (
  `consult_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '咨询编号',
  `goods_id` int(11) unsigned DEFAULT '0' COMMENT '商品编号',
  `goods_name` varchar(100) NOT NULL COMMENT '商品名称',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '咨询发布者会员编号(0：游客)',
  `member_name` varchar(100) DEFAULT NULL COMMENT '会员名称',
  `store_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '店铺编号',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `ct_id` int(10) unsigned NOT NULL COMMENT '咨询类型',
  `consult_content` varchar(255) DEFAULT NULL COMMENT '咨询内容',
  `consult_addtime` int(10) DEFAULT NULL COMMENT '咨询发布时间',
  `consult_reply` varchar(255) DEFAULT '' COMMENT '咨询回复内容',
  `consult_reply_time` int(10) DEFAULT NULL COMMENT '咨询回复时间',
  `isanonymous` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0表示不匿名 1表示匿名',
  PRIMARY KEY (`consult_id`),
  KEY `goods_id` (`goods_id`),
  KEY `seller_id` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品咨询表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_consult`
--

LOCK TABLES `te_consult` WRITE;
/*!40000 ALTER TABLE `te_consult` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_consult` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_consult_type`
--

DROP TABLE IF EXISTS `te_consult_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_consult_type` (
  `ct_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '咨询类型id',
  `ct_name` varchar(10) NOT NULL COMMENT '咨询类型名称',
  `ct_introduce` text NOT NULL COMMENT '咨询类型详细介绍',
  `ct_sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '咨询类型排序',
  PRIMARY KEY (`ct_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='咨询类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_consult_type`
--

LOCK TABLES `te_consult_type` WRITE;
/*!40000 ALTER TABLE `te_consult_type` DISABLE KEYS */;
INSERT INTO `te_consult_type` VALUES (1,'商品咨询','&lt;strong&gt;商城承诺&lt;/strong&gt;：商品均为原装正品行货，自带机打发票，严格执行国家三包政策，享受全国联保服务。&lt;br /&gt;\r\n&lt;strong&gt;功能咨询&lt;/strong&gt;：咨询商品功能建议您拨打各品牌的官方客服电话，以便获得更准确的信息。',1),(2,'支付问题','&lt;strong&gt;大额支付&lt;/strong&gt;：线上支付中的招行、工行、建行、农行、广发支持大额支付，最高单笔一次支付10000元。&lt;br /&gt;\r\n&lt;strong&gt;货到付款&lt;/strong&gt;：只有官方店铺支持货到付款功能。&lt;br /&gt;',2),(3,'发票及保修','&lt;strong&gt;商城承诺&lt;/strong&gt;：商品均为原装正品行货，自带机打发票，严格执行国家三包政策，享受全国联保服务。&lt;br /&gt;\r\n&lt;strong&gt;发票类型&lt;/strong&gt;：商城所售商品均自带机打发票，在提供相关企业资料证明后，可申请开取增值税发票。&lt;br /&gt;\r\n&lt;strong&gt;退 换 货&lt;/strong&gt;：商城为您提供完善的退换货服务。',3),(4,'促销及赠品','',4);
/*!40000 ALTER TABLE `te_consult_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_consume`
--

DROP TABLE IF EXISTS `te_consume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_consume` (
  `consume_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '消费表',
  `member_id` int(10) unsigned NOT NULL COMMENT '会员id',
  `member_name` varchar(50) NOT NULL COMMENT '会员名称',
  `consume_amount` decimal(10,2) NOT NULL COMMENT '金额',
  `consume_time` int(10) unsigned NOT NULL COMMENT '时间',
  `consume_remark` varchar(200) NOT NULL COMMENT '备注',
  PRIMARY KEY (`consume_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消费记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_consume`
--

LOCK TABLES `te_consume` WRITE;
/*!40000 ALTER TABLE `te_consume` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_consume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_contract`
--

DROP TABLE IF EXISTS `te_contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_contract` (
  `ct_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `ct_storeid` int(11) NOT NULL COMMENT '店铺ID',
  `ct_storename` varchar(500) NOT NULL COMMENT '店铺名称',
  `ct_itemid` int(11) NOT NULL COMMENT '服务项目ID',
  `ct_auditstate` tinyint(1) NOT NULL DEFAULT '0' COMMENT '申请审核状态0未审核1审核通过2审核失败3已支付保证金4保证金审核通过5保证金审核失败',
  `ct_joinstate` tinyint(1) NOT NULL DEFAULT '0' COMMENT '加入状态 0未申请 1已申请 2已加入',
  `ct_cost` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '保证金余额',
  `ct_closestate` tinyint(1) NOT NULL DEFAULT '1' COMMENT '永久关闭 0永久关闭 1开启',
  `ct_quitstate` tinyint(1) NOT NULL DEFAULT '0' COMMENT '退出申请状态0未申请 1已申请 2申请失败',
  PRIMARY KEY (`ct_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺消费者保障服务加入情况表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_contract`
--

LOCK TABLES `te_contract` WRITE;
/*!40000 ALTER TABLE `te_contract` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_contract_apply`
--

DROP TABLE IF EXISTS `te_contract_apply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_contract_apply` (
  `cta_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '申请ID',
  `cta_itemid` int(11) NOT NULL COMMENT '保障项目ID',
  `cta_storeid` int(11) NOT NULL COMMENT '店铺ID',
  `cta_storename` varchar(500) NOT NULL COMMENT '店铺名称',
  `cta_addtime` int(11) NOT NULL COMMENT '申请时间',
  `cta_auditstate` tinyint(1) NOT NULL DEFAULT '0' COMMENT '审核状态 0未审核 1审核通过 2审核失败 3保证金待审核 4保证金审核通过 5保证金审核失败',
  `cta_cost` decimal(10,2) DEFAULT '0.00' COMMENT '保证金金额',
  `cta_costimg` varchar(500) DEFAULT NULL COMMENT '保证金付款凭证图片',
  PRIMARY KEY (`cta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺加入消费者保障服务申请表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_contract_apply`
--

LOCK TABLES `te_contract_apply` WRITE;
/*!40000 ALTER TABLE `te_contract_apply` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_contract_apply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_contract_costlog`
--

DROP TABLE IF EXISTS `te_contract_costlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_contract_costlog` (
  `clog_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `clog_itemid` int(11) NOT NULL COMMENT '保障项目ID',
  `clog_itemname` varchar(100) NOT NULL COMMENT '保障项目名称',
  `clog_storeid` int(11) NOT NULL COMMENT '店铺ID',
  `clog_storename` varchar(500) NOT NULL COMMENT '店铺名称',
  `clog_adminid` int(11) DEFAULT NULL COMMENT '操作管理员ID',
  `clog_adminname` varchar(200) DEFAULT NULL COMMENT '操作管理员名称',
  `clog_price` decimal(10,2) NOT NULL COMMENT '金额',
  `clog_addtime` int(11) NOT NULL COMMENT '添加时间',
  `clog_desc` varchar(2000) NOT NULL COMMENT '描述',
  PRIMARY KEY (`clog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺消费者保障服务保证金日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_contract_costlog`
--

LOCK TABLES `te_contract_costlog` WRITE;
/*!40000 ALTER TABLE `te_contract_costlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_contract_costlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_contract_item`
--

DROP TABLE IF EXISTS `te_contract_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_contract_item` (
  `cti_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `cti_name` varchar(100) NOT NULL COMMENT '保障项目名称',
  `cti_describe` varchar(2000) NOT NULL COMMENT '保障项目描述',
  `cti_cost` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '保证金',
  `cti_icon` varchar(500) NOT NULL COMMENT '图标',
  `cti_descurl` varchar(500) DEFAULT NULL COMMENT '内容介绍文章地址',
  `cti_state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 0关闭 1开启',
  `cti_sort` int(11) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`cti_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='消费者保障服务项目表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_contract_item`
--

LOCK TABLES `te_contract_item` WRITE;
/*!40000 ALTER TABLE `te_contract_item` DISABLE KEYS */;
INSERT INTO `te_contract_item` VALUES (1,'7天退货','卖家就该商品退货服务向买家作出承诺，自商品签收之日起至卖家承诺保障时间内，商品符合卖家约定状态的情况下，如买家对购买的商品不满意可无理由申请退货。',1000.00,'7day.gif','',1,1),(2,'品质承诺','卖家就该商品品质向买家作出承诺，承诺商品为正品。',1000.00,'pz.gif','',1,2),(3,'破损补寄','卖家就该商品签收状态作出承诺，自商品签收之日起至卖家承诺保障时间内，如发现商品在运输途中出现破损，买家可申请破损部分商品补寄。',1000.00,'psbf.gif','',1,3),(4,'急速物流','与优秀快递公司合作，快速送达买家手中，保障买家良好的购物物流体验。',1000.00,'jswl.gif','',1,4),(5,'','',0.00,'','',0,0),(6,'','',0.00,'','',0,0),(7,'','',0.00,'','',0,0),(8,'','',0.00,'','',0,0),(9,'','',0.00,'','',0,0),(10,'','',0.00,'','',0,0);
/*!40000 ALTER TABLE `te_contract_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_contract_log`
--

DROP TABLE IF EXISTS `te_contract_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_contract_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `log_storeid` int(11) NOT NULL COMMENT '店铺ID',
  `log_storename` varchar(500) NOT NULL COMMENT '店铺名称',
  `log_itemid` int(11) NOT NULL COMMENT '服务项目ID',
  `log_itemname` varchar(100) NOT NULL COMMENT '服务项目名称',
  `log_msg` varchar(1000) NOT NULL COMMENT '操作描述',
  `log_addtime` int(11) NOT NULL COMMENT '添加时间',
  `log_role` varchar(100) NOT NULL COMMENT '操作者角色 管理员为admin 商家为seller',
  `log_userid` int(11) NOT NULL COMMENT '操作者ID',
  `log_username` varchar(200) NOT NULL COMMENT '操作者名称',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺消费者保障服务日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_contract_log`
--

LOCK TABLES `te_contract_log` WRITE;
/*!40000 ALTER TABLE `te_contract_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_contract_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_contract_quitapply`
--

DROP TABLE IF EXISTS `te_contract_quitapply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_contract_quitapply` (
  `ctq_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '退出申请ID',
  `ctq_itemid` int(11) NOT NULL COMMENT '项目ID',
  `ctq_itemname` varchar(200) NOT NULL COMMENT '项目名称',
  `ctq_storeid` int(11) NOT NULL COMMENT '店铺ID',
  `ctq_storename` varchar(500) NOT NULL COMMENT '店铺名称',
  `ctq_addtime` int(11) NOT NULL COMMENT '添加时间',
  `ctq_auditstate` tinyint(4) NOT NULL COMMENT '审核状态0未审核1审核通过2审核失败',
  PRIMARY KEY (`ctq_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺消费者保障服务退出申请表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_contract_quitapply`
--

LOCK TABLES `te_contract_quitapply` WRITE;
/*!40000 ALTER TABLE `te_contract_quitapply` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_contract_quitapply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_cron`
--

DROP TABLE IF EXISTS `te_cron`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_cron` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned DEFAULT NULL COMMENT '任务类型 1商品上架 2根据商品id更新商品促销价格 3优惠套装过期 4推荐展位过期 5抢购开始更新商品促销价格 6抢购过期 7限时折扣过期 8加价购过期 9商品消费者保障服务开启状态更新 10手机专享过期',
  `exeid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联任务的ID[如商品ID,会员ID]',
  `exetime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '执行时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='任务队列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_cron`
--

LOCK TABLES `te_cron` WRITE;
/*!40000 ALTER TABLE `te_cron` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_cron` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_daddress`
--

DROP TABLE IF EXISTS `te_daddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_daddress` (
  `address_id` mediumint(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '地址ID',
  `store_id` mediumint(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `seller_name` varchar(50) NOT NULL DEFAULT '' COMMENT '联系人',
  `area_id` mediumint(10) unsigned NOT NULL DEFAULT '0' COMMENT '地区ID',
  `city_id` mediumint(9) DEFAULT NULL COMMENT '市级ID',
  `area_info` varchar(100) DEFAULT NULL COMMENT '省市县',
  `address` varchar(100) NOT NULL COMMENT '地址',
  `telphone` varchar(40) DEFAULT NULL COMMENT '电话',
  `company` varchar(50) DEFAULT '' COMMENT '公司',
  `is_default` enum('0','1') NOT NULL DEFAULT '0' COMMENT '是否默认1是',
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='卖家发货地址信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_daddress`
--

LOCK TABLES `te_daddress` WRITE;
/*!40000 ALTER TABLE `te_daddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_daddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_delivery_order`
--

DROP TABLE IF EXISTS `te_delivery_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_delivery_order` (
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `addtime` int(11) DEFAULT '0' COMMENT '订单生成时间',
  `order_sn` bigint(20) DEFAULT NULL COMMENT '订单号',
  `dlyp_id` int(11) DEFAULT NULL COMMENT '自提点ID',
  `shipping_code` varchar(50) DEFAULT NULL COMMENT '物流单号',
  `express_code` varchar(30) DEFAULT NULL COMMENT '快递公司编码',
  `express_name` varchar(30) DEFAULT NULL COMMENT '快递公司名称',
  `reciver_name` varchar(20) DEFAULT NULL COMMENT '收货人',
  `reciver_telphone` varchar(20) DEFAULT NULL COMMENT '电话',
  `reciver_mobphone` varchar(11) DEFAULT NULL COMMENT '手机',
  `dlyo_state` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '订单状态 10(默认)未到站，20已到站，30已提取',
  `dlyo_pickup_code` varchar(6) DEFAULT NULL COMMENT '提货码',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单自提点表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_delivery_order`
--

LOCK TABLES `te_delivery_order` WRITE;
/*!40000 ALTER TABLE `te_delivery_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_delivery_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_delivery_point`
--

DROP TABLE IF EXISTS `te_delivery_point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_delivery_point` (
  `dlyp_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '提货站id',
  `dlyp_name` varchar(50) NOT NULL COMMENT '提货站登录名',
  `dlyp_passwd` varchar(32) NOT NULL COMMENT '提货站登录密码',
  `dlyp_truename` varchar(20) NOT NULL COMMENT '真实姓名',
  `dlyp_mobile` varchar(11) DEFAULT '' COMMENT '手机号码',
  `dlyp_telephony` varchar(20) DEFAULT '' COMMENT '座机号码',
  `dlyp_address_name` varchar(20) NOT NULL COMMENT '服务站名称',
  `dlyp_area_1` int(10) unsigned NOT NULL COMMENT '一级地区id',
  `dlyp_area_2` int(10) unsigned NOT NULL COMMENT '二级地区id',
  `dlyp_area_3` int(10) unsigned NOT NULL COMMENT '三级地区id',
  `dlyp_area_4` int(10) unsigned NOT NULL COMMENT '四级地区id',
  `dlyp_area` int(10) unsigned NOT NULL COMMENT '地区id',
  `dlyp_area_info` varchar(255) NOT NULL COMMENT '地区内容',
  `dlyp_address` varchar(255) NOT NULL COMMENT '详细地址',
  `dlyp_idcard` varchar(18) NOT NULL COMMENT '身份证号码',
  `dlyp_idcard_image` varchar(255) NOT NULL COMMENT '身份证照片',
  `dlyp_addtime` int(10) unsigned NOT NULL COMMENT '添加时间',
  `dlyp_state` tinyint(3) unsigned NOT NULL COMMENT '提货站状态 0关闭，1开启，10等待审核, 20审核失败',
  `dlyp_fail_reason` varchar(255) DEFAULT NULL COMMENT '失败原因',
  PRIMARY KEY (`dlyp_id`),
  UNIQUE KEY `dlyp_name` (`dlyp_name`),
  UNIQUE KEY `dlyp_idcard` (`dlyp_idcard`),
  UNIQUE KEY `dlyp_mobile` (`dlyp_mobile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='提货站表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_delivery_point`
--

LOCK TABLES `te_delivery_point` WRITE;
/*!40000 ALTER TABLE `te_delivery_point` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_delivery_point` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_document`
--

DROP TABLE IF EXISTS `te_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_document` (
  `doc_id` mediumint(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `doc_code` varchar(255) NOT NULL COMMENT '调用标识码',
  `doc_title` varchar(255) NOT NULL COMMENT '标题',
  `doc_content` text NOT NULL COMMENT '内容',
  `doc_time` int(10) unsigned NOT NULL COMMENT '添加时间/修改时间',
  PRIMARY KEY (`doc_id`),
  UNIQUE KEY `doc_code` (`doc_code`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='系统文章表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_document`
--

LOCK TABLES `te_document` WRITE;
/*!40000 ALTER TABLE `te_document` DISABLE KEYS */;
INSERT INTO `te_document` VALUES (1,'agreement','用户服务协议','<p>特别提醒用户认真阅读本《用户服务协议》(下称《协议》) 中各条款。除非您接受本《协议》条款，否则您无权使用本网站提供的相关服务。您的使用行为将视为对本《协议》的接受，并同意接受本《协议》各项条款的约束。 <br /> <br /> <strong>一、定义</strong><br /></p>\r\n<ol>\r\n<li>\"用户\"指符合本协议所规定的条件，同意遵守本网站各种规则、条款（包括但不限于本协议），并使用本网站的个人或机构。</li>\r\n<li>\"卖家\"是指在本网站上出售物品的用户。\"买家\"是指在本网站购买物品的用户。</li>\r\n<li>\"成交\"指买家根据卖家所刊登的交易要求，在特定时间内提出最优的交易条件，因而取得依其提出的条件购买该交易物品的权利。</li>\r\n</ol>\r\n<p><br /> <br /> <strong>二、用户资格</strong><br /> <br /> 只有符合下列条件之一的人员或实体才能申请成为本网站用户，可以使用本网站的服务。</p>\r\n<ol>\r\n<li>年满十八岁，并具有民事权利能力和民事行为能力的自然人；</li>\r\n<li>未满十八岁，但监护人（包括但不仅限于父母）予以书面同意的自然人；</li>\r\n<li>根据中国法律或设立地法律、法规和/或规章成立并合法存在的公司、企事业单位、社团组织和其他组织。</li>\r\n</ol>\r\n<p><br /> 无民事行为能力人、限制民事行为能力人以及无经营或特定经营资格的组织不当注册为本网站用户或超过其民事权利或行为能力范围从事交易的，其与本网站之间的协议自始无效，本网站一经发现，有权立即注销该用户，并追究其使用本网站\"服务\"的一切法律责任。<br /> <br /> <strong>三.用户的权利和义务</strong><br /></p>\r\n<ol>\r\n<li>用户有权根据本协议的规定及本网站发布的相关规则，利用本网站网上交易平台登录物品、发布交易信息、查询物品信息、购买物品、与其他用户订立物品买卖合同、在本网站社区发帖、参加本网站的有关活动及有权享受本网站提供的其他的有关资讯及信息服务。</li>\r\n<li>用户有权根据需要更改密码和交易密码。用户应对以该用户名进行的所有活动和事件负全部责任。</li>\r\n<li>用户有义务确保向本网站提供的任何资料、注册信息真实准确，包括但不限于真实姓名、身份证号、联系电话、地址、邮政编码等。保证本网站及其他用户可以通过上述联系方式与自己进行联系。同时，用户也有义务在相关资料实际变更时及时更新有关注册资料。</li>\r\n<li>用户不得以任何形式擅自转让或授权他人使用自己在本网站的用户账号。</li>\r\n<li>用户有义务确保在本网站网上交易平台上登录物品、发布的交易信息真实、准确，无误导性。</li>\r\n<li>用户不得在本网站网上交易平台买卖国家禁止销售的或限制销售的物品、不得买卖侵犯他人知识产权或其他合法权益的物品，也不得买卖违背社会公共利益或公共道德的物品。</li>\r\n<li>用户不得在本网站发布各类违法或违规信息。包括但不限于物品信息、交易信息、社区帖子、物品留言，店铺留言，评价内容等。</li>\r\n<li>用户在本网站交易中应当遵守诚实信用原则，不得以干预或操纵物品价格等不正当竞争方式扰乱网上交易秩序，不得从事与网上交易无关的不当行为，不得在交易平台上发布任何违法信息。</li>\r\n<li>用户不应采取不正当手段（包括但不限于虚假交易、互换好评等方式）提高自身或他人信用度，或采用不正当手段恶意评价其他用户，降低其他用户信用度。</li>\r\n<li>用户承诺自己在使用本网站网上交易平台实施的所有行为遵守国家法律、法规和本网站的相关规定以及各种社会公共利益或公共道德。对于任何法律后果的发生，用户将以自己的名义独立承担所有相应的法律责任。</li>\r\n<li>用户在本网站网上交易过程中如与其他用户因交易产生纠纷，可以请求本网站从中予以协调。用户如发现其他用户有违法或违反本协议的行为，可以向本网站举报。如用户因网上交易与其他用户产生诉讼的，用户有权通过司法部门要求本网站提供相关资料。</li>\r\n<li>用户应自行承担因交易产生的相关费用，并依法纳税。</li>\r\n<li>未经本网站书面允许，用户不得将本网站资料以及在交易平台上所展示的任何信息以复制、修改、翻译等形式制作衍生作品、分发或公开展示。</li>\r\n<li>用户同意接收来自本网站的信息，包括但不限于活动信息、交易信息、促销信息等。</li>\r\n</ol>\r\n<p><br /> <br /> <strong>四、 本网站的权利和义务</strong><br /></p>\r\n<ol>\r\n<li>本网站不是传统意义上的\"拍卖商\"，仅为用户提供一个信息交流、进行物品买卖的平台，充当买卖双方之间的交流媒介，而非买主或卖主的代理商、合伙  人、雇员或雇主等经营关系人。公布在本网站上的交易物品是用户自行上传进行交易的物品，并非本网站所有。对于用户刊登物品、提供的信息或参与竞标的过程，  本网站均不加以监视或控制，亦不介入物品的交易过程，包括运送、付款、退款、瑕疵担保及其它交易事项，且不承担因交易物品存在品质、权利上的瑕疵以及交易  方履行交易协议的能力而产生的任何责任，对于出现在拍卖上的物品品质、安全性或合法性，本网站均不予保证。</li>\r\n<li>本网站有义务在现有技术水平的基础上努力确保整个网上交易平台的正常运行，尽力避免服务中断或将中断时间限制在最短时间内，保证用户网上交易活动的顺利进行。</li>\r\n<li>本网站有义务对用户在注册使用本网站网上交易平台中所遇到的问题及反映的情况及时作出回复。 </li>\r\n<li>本网站有权对用户的注册资料进行查阅，对存在任何问题或怀疑的注册资料，本网站有权发出通知询问用户并要求用户做出解释、改正，或直接做出处罚、删除等处理。</li>\r\n<li>用  户因在本网站网上交易与其他用户产生纠纷的，用户通过司法部门或行政部门依照法定程序要求本网站提供相关资料，本网站将积极配合并提供有关资料；用户将纠  纷告知本网站，或本网站知悉纠纷情况的，经审核后，本网站有权通过电子邮件及电话联系向纠纷双方了解纠纷情况，并将所了解的情况通过电子邮件互相通知对  方。 </li>\r\n<li>因网上交易平台的特殊性，本网站没有义务对所有用户的注册资料、所有的交易行为以及与交易有关的其他事项进行事先审查，但如发生以下情形，本网站有权限制用户的活动、向用户核实有关资料、发出警告通知、暂时中止、无限期地中止及拒绝向该用户提供服务：         \r\n<ul>\r\n<li>用户违反本协议或因被提及而纳入本协议的文件；</li>\r\n<li>存在用户或其他第三方通知本网站，认为某个用户或具体交易事项存在违法或不当行为，并提供相关证据，而本网站无法联系到该用户核证或验证该用户向本网站提供的任何资料；</li>\r\n<li>存在用户或其他第三方通知本网站，认为某个用户或具体交易事项存在违法或不当行为，并提供相关证据。本网站以普通非专业交易者的知识水平标准对相关内容进行判别，可以明显认为这些内容或行为可能对本网站用户或本网站造成财务损失或法律责任。 </li>\r\n</ul>\r\n</li>\r\n<li>在反网络欺诈行动中，本着保护广大用户利益的原则，当用户举报自己交易可能存在欺诈而产生交易争议时，本网站有权通过表面判断暂时冻结相关用户账号，并有权核对当事人身份资料及要求提供交易相关证明材料。</li>\r\n<li>根据国家法律法规、本协议的内容和本网站所掌握的事实依据，可以认定用户存在违法或违反本协议行为以及在本网站交易平台上的其他不当行为，本网站有权在本网站交易平台及所在网站上以网络发布形式公布用户的违法行为，并有权随时作出删除相关信息，而无须征得用户的同意。</li>\r\n<li>本  网站有权在不通知用户的前提下删除或采取其他限制性措施处理下列信息：包括但不限于以规避费用为目的；以炒作信用为目的；存在欺诈等恶意或虚假内容；与网  上交易无关或不是以交易为目的；存在恶意竞价或其他试图扰乱正常交易秩序因素；该信息违反公共利益或可能严重损害本网站和其他用户合法利益的。</li>\r\n<li>用  户授予本网站独家的、全球通用的、永久的、免费的信息许可使用权利，本网站有权对该权利进行再授权，依此授权本网站有权(全部或部份地)  使用、复制、修订、改写、发布、翻译、分发、执行和展示用户公示于网站的各类信息或制作其派生作品，以现在已知或日后开发的任何形式、媒体或技术，将上述  信息纳入其他作品内。</li>\r\n</ol>\r\n<p><br /> <br /> <strong>五、服务的中断和终止</strong><br /></p>\r\n<ol>\r\n<li>在  本网站未向用户收取相关服务费用的情况下，本网站可自行全权决定以任何理由  (包括但不限于本网站认为用户已违反本协议的字面意义和精神，或用户在超过180天内未登录本网站等)  终止对用户的服务，并不再保存用户在本网站的全部资料（包括但不限于用户信息、商品信息、交易信息等）。同时本网站可自行全权决定，在发出通知或不发出通  知的情况下，随时停止提供全部或部分服务。服务终止后，本网站没有义务为用户保留原用户资料或与之相关的任何信息，或转发任何未曾阅读或发送的信息给用户  或第三方。此外，本网站不就终止对用户的服务而对用户或任何第三方承担任何责任。 </li>\r\n<li>如用户向本网站提出注销本网站注册用户身份，需经本网站审核同意，由本网站注销该注册用户，用户即解除与本网站的协议关系，但本网站仍保留下列权利：         \r\n<ul>\r\n<li>用户注销后，本网站有权保留该用户的资料,包括但不限于以前的用户资料、店铺资料、商品资料和交易记录等。 </li>\r\n<li>用户注销后，如用户在注销前在本网站交易平台上存在违法行为或违反本协议的行为，本网站仍可行使本协议所规定的权利。 </li>\r\n</ul>\r\n</li>\r\n<li>如存在下列情况，本网站可以通过注销用户的方式终止服务：         \r\n<ul>\r\n<li>在用户违反本协议相关规定时，本网站有权终止向该用户提供服务。本网站将在中断服务时通知用户。但如该用户在被本网站终止提供服务后，再一次直接或间接或以他人名义注册为本网站用户的，本网站有权再次单方面终止为该用户提供服务；</li>\r\n<li>一旦本网站发现用户注册资料中主要内容是虚假的，本网站有权随时终止为该用户提供服务； </li>\r\n<li>本协议终止或更新时，用户未确认新的协议的。 </li>\r\n<li>其它本网站认为需终止服务的情况。 </li>\r\n</ul>\r\n</li>\r\n<li>因用户违反相关法律法规或者违反本协议规定等原因而致使本网站中断、终止对用户服务的，对于服务中断、终止之前用户交易行为依下列原则处理：         \r\n<ul>\r\n<li>本网站有权决定是否在中断、终止对用户服务前将用户被中断或终止服务的情况和原因通知用户交易关系方，包括但不限于对该交易有意向但尚未达成交易的用户,参与该交易竞价的用户，已达成交易要约用户。</li>\r\n<li>服务中断、终止之前，用户已经上传至本网站的物品尚未交易或交易尚未完成的，本网站有权在中断、终止服务的同时删除此项物品的相关信息。 </li>\r\n<li>服务中断、终止之前，用户已经就其他用户出售的具体物品作出要约，但交易尚未结束，本网站有权在中断或终止服务的同时删除该用户的相关要约和信息。</li>\r\n</ul>\r\n</li>\r\n<li>本网站若因用户的行为（包括但不限于刊登的商品、在本网站社区发帖等）侵害了第三方的权利或违反了相关规定，而受到第三方的追偿或受到主管机关的处分时，用户应赔偿本网站因此所产生的一切损失及费用。</li>\r\n<li>对违反相关法律法规或者违反本协议规定，且情节严重的用户，本网站有权终止该用户的其它服务。</li>\r\n</ol>\r\n<p><br /> <br /> <strong>六、协议的修订</strong><br /> <br /> 本协议可由本网站随时修订，并将修订后的协议公告于本网站之上，修订后的条款内容自公告时起生效，并成为本协议的一部分。用户若在本协议修改之后，仍继续使用本网站，则视为用户接受和自愿遵守修订后的协议。本网站行使修改或中断服务时，不需对任何第三方负责。<br /> <br /> <strong>七、 本网站的责任范围 </strong><br /> <br /> 当用户接受该协议时，用户应明确了解并同意∶</p>\r\n<ol>\r\n<li>是否经由本网站下载或取得任何资料，由用户自行考虑、衡量并且自负风险，因下载任何资料而导致用户电脑系统的任何损坏或资料流失，用户应负完全责任。</li>\r\n<li>用户经由本网站取得的建议和资讯，无论其形式或表现，绝不构成本协议未明示规定的任何保证。</li>\r\n<li>基于以下原因而造成的利润、商誉、使用、资料损失或其它无形损失，本网站不承担任何直接、间接、附带、特别、衍生性或惩罚性赔偿（即使本网站已被告知前款赔偿的可能性）：         \r\n<ul>\r\n<li>本网站的使用或无法使用。</li>\r\n<li>经由或通过本网站购买或取得的任何物品，或接收之信息，或进行交易所随之产生的替代物品及服务的购买成本。</li>\r\n<li>用户的传输或资料遭到未获授权的存取或变更。</li>\r\n<li>本网站中任何第三方之声明或行为。</li>\r\n<li>本网站其它相关事宜。</li>\r\n</ul>\r\n</li>\r\n<li>本网站只是为用户提供一个交易的平台，对于用户所刊登的交易物品的合法性、真实性及其品质，以及用户履行交易的能力等，本网站一律不负任何担保责任。用户如果因使用本网站，或因购买刊登于本网站的任何物品，而受有损害时，本网站不负任何补偿或赔偿责任。</li>\r\n<li>本  网站提供与其它互联网上的网站或资源的链接，用户可能会因此连结至其它运营商经营的网站，但不表示本网站与这些运营商有任何关系。其它运营商经营的网站均  由各经营者自行负责，不属于本网站控制及负责范围之内。对于存在或来源于此类网站或资源的任何内容、广告、产品或其它资料，本网站亦不予保证或负责。因使  用或依赖任何此类网站或资源发布的或经由此类网站或资源获得的任何内容、物品或服务所产生的任何损害或损失，本网站不负任何直接或间接的责任。</li>\r\n</ol>\r\n<p><br /> <br /> <strong>八.、不可抗力</strong><br /> <br /> 因不可抗力或者其他意外事件，使得本协议的履行不可能、不必要或者无意义的，双方均不承担责任。本合同所称之不可抗力意指不能预见、不能避免并不能克服的  客观情况，包括但不限于战争、台风、水灾、火灾、雷击或地震、罢工、暴动、法定疾病、黑客攻击、网络病毒、电信部门技术管制、政府行为或任何其它自然或人  为造成的灾难等客观情况。<br /> <br /> <strong>九、争议解决方式</strong><br /></p>\r\n<ol>\r\n<li>本协议及其修订本的有效性、履行和与本协议及其修订本效力有关的所有事宜，将受中华人民共和国法律管辖，任何争议仅适用中华人民共和国法律。</li>\r\n<li>因  使用本网站服务所引起与本网站的任何争议，均应提交深圳仲裁委员会按照该会届时有效的仲裁规则进行仲裁。相关争议应单独仲裁，不得与任何其它方的争议在任  何仲裁中合并处理，该仲裁裁决是终局，对各方均有约束力。如果所涉及的争议不适于仲裁解决，用户同意一切争议由人民法院管辖。</li>\r\n</ol>',1449242303),(4,'open_store','开店协议','<p>使用本公司服务所须遵守的条款和条件。<br /><br />1.用户资格<br />本公司的服务仅向适用法律下能够签订具有法律约束力的合同的个人提供并仅由其使用。在不限制前述规定的前提下，本公司的服务不向18周岁以下或被临时或无限期中止的用户提供。如您不合资格，请勿使用本公司的服务。此外，您的账户（包括信用评价）和用户名不得向其他方转让或出售。另外，本公司保留根据其意愿中止或终止您的账户的权利。<br /><br />2.您的资料（包括但不限于所添加的任何商品）不得：<br />*具有欺诈性、虚假、不准确或具误导性；<br />*侵犯任何第三方著作权、专利权、商标权、商业秘密或其他专有权利或发表权或隐私权；<br />*违反任何适用的法律或法规（包括但不限于有关出口管制、消费者保护、不正当竞争、刑法、反歧视或贸易惯例/公平贸易法律的法律或法规）；<br />*有侮辱或者诽谤他人，侵害他人合法权益的内容；<br />*有淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的内容；<br />*包含可能破坏、改变、删除、不利影响、秘密截取、未经授权而接触或征用任何系统、数据或个人资料的任何病毒、特洛依木马、蠕虫、定时炸弹、删除蝇、复活节彩蛋、间谍软件或其他电脑程序；<br /><br />3.违约<br />如发生以下情形，本公司可能限制您的活动、立即删除您的商品、向本公司社区发出有关您的行为的警告、发出警告通知、暂时中止、无限期地中止或终止您的用户资格及拒绝向您提供服务：<br />(a)您违反本协议或纳入本协议的文件；<br />(b)本公司无法核证或验证您向本公司提供的任何资料；<br />(c)本公司相信您的行为可能对您、本公司用户或本公司造成损失或法律责任。<br /><br />4.责任限制<br />本公司、本公司的关联公司和相关实体或本公司的供应商在任何情况下均不就因本公司的网站、本公司的服务或本协议而产生或与之有关的利润损失或任何特别、间接或后果性的损害（无论以何种方式产生，包括疏忽）承担任何责任。您同意您就您自身行为之合法性单独承担责任。您同意，本公司和本公司的所有关联公司和相关实体对本公司用户的行为的合法性及产生的任何结果不承担责任。<br /><br />5.无代理关系<br />用户和本公司是独立的合同方，本协议无意建立也没有创立任何代理、合伙、合营、雇员与雇主或特许经营关系。本公司也不对任何用户及其网上交易行为做出明示或默许的推荐、承诺或担保。<br /><br />6.一般规定<br />本协议在所有方面均受中华人民共和国法律管辖。本协议的规定是可分割的，如本协议任何规定被裁定为无效或不可执行，该规定可被删除而其余条款应予以执行。</p>',1449242303),(5,'groupbuy','抢购活动协议','<p>\r\n  一、抢购的所有权和运作权归本公司。\r\n</p>\r\n<p>\r\n    二、本公司有权在必要时修改本协议，本协议一旦发生变更，将会在相关页面上公布。如果您不同意所改动的内容，您应主动停止使用抢购服务。如果您继续使用服务，则视为接受本协议的变更。\r\n</p>\r\n<p>\r\n   三、如发生下列任何一种情形，本公司有权中断或终止向您提供的服务而无需通知您：\r\n</p>\r\n1、 您提供的个人资料不真实；<br />\r\n2、您违反本协议的规定；<br />\r\n3、 按照政府主管部门的监管要求；<br />\r\n4、本公司认为您的行为违反抢购服务性质或需求的特殊情形。\r\n<p>\r\n 四、尽管本协议可能另有其他规定，本公司仍然可以随时终止本协议。\r\n</p>\r\n<p>\r\n  五、本公司终止本协议的权利不会妨害本公司可能拥有的在本协议终止前因您违反本协议或本公司本应享有的任何其他权利。\r\n</p>\r\n<p>\r\n  六、您理解并完全接受，本公司有权自行对抢购资源作下线处理。\r\n</p>',1449242303),(6,'create_circle','圈子使用须知','&nbsp;&nbsp; 请您仔细阅读本须知的全部内容（特别是以<strong><span style=\"text-decoration:underline;\">粗体下划线</span></strong>标注的内容）。如果您不同意本须知的任意内容，您应当停止使用本产品。\r\n<p>\r\n  1、“圈子”是本公司开设的一个供商城用户（以下简称“用户”或“您”）交流购物体验等信息的网络社区。<strong><span style=\"text-decoration:underline;\">您使用“圈子”产品需遵守本须知，并遵守本公司公布的操作流程和规则。</span></strong>\r\n</p>\r\n<p>\r\n  2、“圈子”产品的功能和产品提供方式由本公司自行决定，后续本公司可能调整产品名称和产品运行的域名等。<strong><span style=\"text-decoration:underline;\">本须知适用于“圈子”产品的调整、改进版本和附加功能。</span></strong>\r\n</p>\r\n<p>\r\n    3、您可以通过本产品创建网络关系圈子，其他感兴趣的用户可以加入您创建的圈子。您应当遵守任何适用的法律之规定，并自觉尊重和维护其他参与者的合法权利。您不得以任何形式开展违法活动、侵犯他人合法权益、损害本公司或其他公司的合法利益，否则您需为此自行承担法律责任。<strong><span style=\"text-decoration:underline;\">您同意本公司无需为产品使用者的违法或侵权等行为承担任何责任。</span></strong>\r\n</p>\r\n<p>\r\n  4、您同意并保证通过本产品上传、发布的文字、图片等全部信息素材符合相关法律的规定。您保证素材内容以及素材所含链接指向的内容的合法性和正当性，不侵犯他人的肖像权、名誉权、知识产权、隐私权等合法权益，也不会侵犯法人或其他团体的商业秘密等合法权益。\r\n</p>\r\n<p>\r\n    5、<strong><span style=\"text-decoration:underline;\">您使用本产品可能需要提供关于您的个人资料、肖像、联系方式等个人信息。您了解并同意，在使用本产品过程中关于您的个人信息可能会通过网络等渠道进行传播。</span></strong>\r\n</p>\r\n<p>\r\n 6、您通过本产品上传、发布素材，即意味着<strong><span style=\"text-decoration:underline;\">您同意向本公司提供免费的、永久性的、不可撤销的权利和许可，使本公司可以在全球范围内复制、发行、展示、演绎和通过信息网络等渠道使用您上传的素材和信息</span></strong>，例如将您提供的图片发布于活动页面或平面媒体中。\r\n</p>\r\n<p>\r\n   7、本公司无法事先了解您上传素材的真实性和合法性。如您上传的素材被发现不适宜展示或遭受他人举报或投诉的，本公司有权立即删除或进行屏蔽从而停止该素材的继续传播。<strong><span style=\"text-decoration:underline;\">如果您违反本须知的内容、有关协议或规则等的，本公司有权删除相关素材并有权拒绝您继续使用产品，届时您无权要求本公司进行补偿或赔偿。</span></strong>\r\n</p>\r\n<p>\r\n 8、您使用本产品应同时遵守《用户服务协议》、本公司公布的各项规则以及本公司发布的关于本产品的特别规则和制度。\r\n</p>\r\n<p>\r\n   9、第三方可能通过分公司其他产品或本产品知悉并使用您上传的素材、个人信息或进而侵犯您的合法权利。<strong><span style=\"text-decoration:underline;\">本公司提醒您注意和谨防网络诈骗以及其他可能对您不利的行动和信息，但本公司对第三方的侵权、违法等行为不承担赔偿等法律责任。</span></strong>您承诺合法使用并善待其他用户上传的素材和信息。\r\n</p>\r\n<p>\r\n 10、您应自行对上传的素材进行备份。本公司可能按照本须知删除或屏蔽素材，相关系统亦可能遭受网络攻击或网络故障，类似或其他情况均可能使您上传的素材丢失或故障，对此本公司将尽力避免但不做任何保证。\r\n</p>\r\n<p>\r\n 11、<strong><span style=\"text-decoration:underline;\">如您因使用本产品与本公司发生纠纷的，您同意由本公司住所地人民法院管辖审理。</span></strong> \r\n</p>\r\n<p>\r\n   12、<strong><span style=\"text-decoration:underline;\">本公司有权更新、修改本须知以及有关规则、流程等相关文件的内容，本公司在法律允许的范围内负责对本须知进行说明和解释</span></strong>。如您对修改存有异议，您有权选择不再继续使用本产品，但您在此前的行为仍受本须知以及相关文件最新的修改版本的约束。\r\n</p>',1449242303);
/*!40000 ALTER TABLE `te_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_evaluate_goods`
--

DROP TABLE IF EXISTS `te_evaluate_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_evaluate_goods` (
  `geval_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评价ID',
  `geval_orderid` int(11) NOT NULL COMMENT '订单表自增ID',
  `geval_orderno` bigint(20) unsigned NOT NULL COMMENT '订单编号',
  `geval_ordergoodsid` int(11) NOT NULL COMMENT '订单商品表编号',
  `geval_goodsid` int(11) NOT NULL COMMENT '商品表编号',
  `geval_goodsname` varchar(100) NOT NULL COMMENT '商品名称',
  `geval_goodsprice` decimal(10,2) DEFAULT NULL COMMENT '商品价格',
  `geval_goodsimage` varchar(255) DEFAULT NULL COMMENT '商品图片',
  `geval_scores` tinyint(1) NOT NULL COMMENT '1-5分',
  `geval_content` varchar(255) DEFAULT NULL COMMENT '信誉评价内容',
  `geval_isanonymous` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0表示不是 1表示是匿名评价',
  `geval_addtime` int(11) NOT NULL COMMENT '评价时间',
  `geval_storeid` int(11) NOT NULL COMMENT '店铺编号',
  `geval_storename` varchar(100) NOT NULL COMMENT '店铺名称',
  `geval_frommemberid` int(11) NOT NULL COMMENT '评价人编号',
  `geval_frommembername` varchar(100) NOT NULL COMMENT '评价人名称',
  `geval_explain` varchar(255) DEFAULT NULL COMMENT '解释内容',
  `geval_image` varchar(255) DEFAULT NULL COMMENT '晒单图片',
  `geval_content_again` varchar(255) NOT NULL COMMENT '追加评价内容',
  `geval_addtime_again` int(10) unsigned NOT NULL COMMENT '追加评价时间',
  `geval_image_again` varchar(255) NOT NULL COMMENT '追加评价图片',
  `geval_explain_again` varchar(255) NOT NULL COMMENT '追加解释内容',
  PRIMARY KEY (`geval_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='信誉评价表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_evaluate_goods`
--

LOCK TABLES `te_evaluate_goods` WRITE;
/*!40000 ALTER TABLE `te_evaluate_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_evaluate_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_evaluate_store`
--

DROP TABLE IF EXISTS `te_evaluate_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_evaluate_store` (
  `seval_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评价ID',
  `seval_orderid` int(11) unsigned NOT NULL COMMENT '订单ID',
  `seval_orderno` varchar(100) NOT NULL COMMENT '订单编号',
  `seval_addtime` int(11) unsigned NOT NULL COMMENT '评价时间',
  `seval_storeid` int(11) unsigned NOT NULL COMMENT '店铺编号',
  `seval_storename` varchar(100) NOT NULL COMMENT '店铺名称',
  `seval_memberid` int(11) unsigned NOT NULL COMMENT '买家编号',
  `seval_membername` varchar(100) NOT NULL COMMENT '买家名称',
  `seval_desccredit` tinyint(1) unsigned NOT NULL DEFAULT '5' COMMENT '描述相符评分',
  `seval_servicecredit` tinyint(1) unsigned NOT NULL DEFAULT '5' COMMENT '服务态度评分',
  `seval_deliverycredit` tinyint(1) unsigned NOT NULL DEFAULT '5' COMMENT '发货速度评分',
  PRIMARY KEY (`seval_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺评分表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_evaluate_store`
--

LOCK TABLES `te_evaluate_store` WRITE;
/*!40000 ALTER TABLE `te_evaluate_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_evaluate_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_exppoints_log`
--

DROP TABLE IF EXISTS `te_exppoints_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_exppoints_log` (
  `exp_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '经验值日志编号',
  `exp_memberid` int(11) NOT NULL COMMENT '会员编号',
  `exp_membername` varchar(100) NOT NULL COMMENT '会员名称',
  `exp_points` int(11) NOT NULL DEFAULT '0' COMMENT '经验值负数表示扣除',
  `exp_addtime` int(11) NOT NULL COMMENT '添加时间',
  `exp_desc` varchar(100) NOT NULL COMMENT '操作描述',
  `exp_stage` varchar(50) NOT NULL COMMENT '操作阶段',
  PRIMARY KEY (`exp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='经验值日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_exppoints_log`
--

LOCK TABLES `te_exppoints_log` WRITE;
/*!40000 ALTER TABLE `te_exppoints_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_exppoints_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_express`
--

DROP TABLE IF EXISTS `te_express`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_express` (
  `id` tinyint(1) unsigned NOT NULL AUTO_INCREMENT COMMENT '索引ID',
  `e_name` varchar(50) NOT NULL COMMENT '公司名称',
  `e_state` enum('0','1') NOT NULL DEFAULT '1' COMMENT '状态',
  `e_code` varchar(50) NOT NULL COMMENT '编号',
  `e_letter` char(1) NOT NULL COMMENT '首字母',
  `e_order` enum('1','2') NOT NULL DEFAULT '2' COMMENT '1常用2不常用',
  `e_url` varchar(100) NOT NULL COMMENT '公司网址',
  `e_zt_state` tinyint(4) DEFAULT '0' COMMENT '是否支持服务站配送0否1是',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT='快递公司';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_express`
--

LOCK TABLES `te_express` WRITE;
/*!40000 ALTER TABLE `te_express` DISABLE KEYS */;
INSERT INTO `te_express` VALUES (1,'安信达','0','anxindakuaixi','A','2','http://www.anxinda.com',0),(2,'包裹平邮','1','youzhengguonei','B','2','http://yjcx.chinapost.com.cn',0),(3,'CCES','1','cces','C','2','http://www.cces.com.cn',0),(4,'传喜物流','1','chuanxiwuliu','C','2','http://www.cxcod.com',0),(5,'DHL快递','1','dhl','D','2','http://www.cn.dhl.com',0),(6,'大田物流','1','datianwuliu','D','2','http://www.dtw.com.cn',0),(7,'德邦物流','1','debangwuliu','D','2','http://www.deppon.com',0),(8,'EMS','1','ems','E','2','http://www.ems.com.cn',0),(9,'EMS国际','1','emsguoji','E','2','###',0),(10,'飞康达','1','feikangda','F','2','http://www.fkd.com.cn',0),(11,'FedEx(国际)','1','fedex','F','2','http://fedex.com/cn',0),(12,'凡客如风达','1','rufengda','F','2','http://www.rufengda.com',0),(13,'港中能达','1','ganzhongnengda','G','2','http://www.nd56.com',0),(14,'挂号信','1','youzhengguonei','G','2','http://yjcx.chinapost.com.cn',0),(15,'共速达','1','gongsuda','G','2','http://www.gongsuda.com/mall/Search.aspx',0),(16,'汇通快递','1','huitongkuaidi','H','2','http://www.htky365.com',0),(17,'华宇物流','1','tiandihuayu','H','2','http://www.hoau.net',0),(18,'佳吉快运','1','jiajiwuliu','J','2','http://www.jiaji.com',0),(19,'佳怡物流','1','jiayiwuliu','J','2','http://www.jiayi56.com',0),(20,'急先达','1','jixianda','J','2','http://www.joust.cn',0),(21,'快捷速递','1','kuaijiesudi','K','2','http://www.fastexpress.com.cn',0),(22,'龙邦快递','1','longbanwuliu','L','2','http://www.lbex.com.cn',0),(23,'联邦快递','1','lianbangkuaidi','L','2','http://cndxp.apac.fedex.com/dxp.html',0),(24,'联昊通','1','lianhaowuliu','L','2','http://www.lhtex.com.cn',0),(25,'全一快递','1','quanyikuaidi','Q','2','http://www.apex100.com',0),(26,'全峰快递','1','quanfengkuaidi','Q','2','http://www.qfkd.com.cn',0),(27,'全日通','1','quanritongkuaidi','Q','2','http://www.at-express.com',0),(28,'申通快递','1','shentong','S','2','http://www.sto.cn',0),(29,'顺丰快递','1','shunfeng','S','1','http://www.sf-express.com',0),(30,'速尔快递','1','suer','S','2','http://www.sure56.com',0),(31,'TNT快递','1','tnt','T','2','http://www.tnt.com.cn',0),(32,'天天快递','1','tiantian','T','2','http://www.ttkdex.com',0),(33,'天地华宇','1','tiandihuayu','T','2','http://www.hoau.net',0),(34,'UPS快递','1','ups','U','2','http://www.ups.com/cn',0),(35,'USPS','1','usps','U','2','http://www.kuaidi100.com/all/usps.shtml',0),(36,'新邦物流','1','xinbangwuliu','X','2','http://www.xbwl.cn',0),(37,'信丰物流','1','xinfengwuliu','X','2','http://www.xf-express.com.cn',0),(38,'希伊艾斯','1','cces','X','2','http://www.cces.com.cn',0),(39,'新蛋物流','1','neweggozzo','X','2','http://www.ozzo.com.cn',0),(40,'圆通快递','1','yuantong','Y','1','http://www.yto.net.cn',0),(41,'韵达快递','1','yunda','Y','1','http://www.yundaex.com',0),(42,'邮政包裹','1','youzhengguonei','Y','2','http://yjcx.chinapost.com.cn',0),(43,'优速快递','1','youshuwuliu','Y','2','http://www.uc56.com',0),(44,'中通快递','1','zhongtong','Z','1','http://www.zto.cn',0),(45,'中铁快运','1','zhongtiewuliu','Z','2','http://www.cre.cn',0),(46,'宅急送','1','zhaijisong','Z','2','http://www.zjs.com.cn',0),(47,'中邮物流','1','zhongyouwuliu','Z','2','http://www.cnpl.com.cn',0);
/*!40000 ALTER TABLE `te_express` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_favorites`
--

DROP TABLE IF EXISTS `te_favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_favorites` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `member_id` int(10) unsigned NOT NULL COMMENT '会员ID',
  `member_name` varchar(50) NOT NULL COMMENT '会员名',
  `fav_id` int(10) unsigned NOT NULL COMMENT '商品或店铺ID',
  `fav_type` char(5) NOT NULL DEFAULT 'goods' COMMENT '类型:goods为商品,store为店铺,默认为商品',
  `fav_time` int(10) unsigned NOT NULL COMMENT '收藏时间',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺ID',
  `store_name` varchar(20) NOT NULL COMMENT '店铺名称',
  `sc_id` int(10) unsigned DEFAULT '0' COMMENT '店铺分类ID',
  `goods_name` varchar(50) DEFAULT NULL COMMENT '商品名称',
  `goods_image` varchar(100) DEFAULT NULL COMMENT '商品图片',
  `gc_id` int(10) unsigned DEFAULT '0' COMMENT '商品分类ID',
  `log_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品收藏时价格',
  `log_msg` varchar(20) DEFAULT NULL COMMENT '收藏备注',
  PRIMARY KEY (`log_id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收藏表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_favorites`
--

LOCK TABLES `te_favorites` WRITE;
/*!40000 ALTER TABLE `te_favorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_flowstat`
--

DROP TABLE IF EXISTS `te_flowstat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_flowstat` (
  `stattime` int(11) unsigned NOT NULL COMMENT '访问日期',
  `clicknum` int(11) unsigned NOT NULL COMMENT '访问量',
  `store_id` int(11) unsigned NOT NULL COMMENT '店铺ID',
  `type` varchar(10) NOT NULL COMMENT '类型',
  `goods_id` int(11) unsigned NOT NULL COMMENT '商品ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='访问量统计表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_flowstat`
--

LOCK TABLES `te_flowstat` WRITE;
/*!40000 ALTER TABLE `te_flowstat` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_flowstat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_flowstat_1`
--

DROP TABLE IF EXISTS `te_flowstat_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_flowstat_1` (
  `stattime` int(11) unsigned NOT NULL COMMENT '访问日期',
  `clicknum` int(11) unsigned NOT NULL COMMENT '访问量',
  `store_id` int(11) unsigned NOT NULL COMMENT '店铺ID',
  `type` varchar(10) NOT NULL COMMENT '类型',
  `goods_id` int(11) unsigned NOT NULL COMMENT '商品ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='访问量统计表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_flowstat_1`
--

LOCK TABLES `te_flowstat_1` WRITE;
/*!40000 ALTER TABLE `te_flowstat_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_flowstat_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_flowstat_2`
--

DROP TABLE IF EXISTS `te_flowstat_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_flowstat_2` (
  `stattime` int(11) unsigned NOT NULL COMMENT '访问日期',
  `clicknum` int(11) unsigned NOT NULL COMMENT '访问量',
  `store_id` int(11) unsigned NOT NULL COMMENT '店铺ID',
  `type` varchar(10) NOT NULL COMMENT '类型',
  `goods_id` int(11) unsigned NOT NULL COMMENT '商品ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='访问量统计表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_flowstat_2`
--

LOCK TABLES `te_flowstat_2` WRITE;
/*!40000 ALTER TABLE `te_flowstat_2` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_flowstat_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_gadmin`
--

DROP TABLE IF EXISTS `te_gadmin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_gadmin` (
  `gid` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `gname` varchar(50) DEFAULT NULL COMMENT '组名',
  `limits` text COMMENT '权限内容',
  PRIMARY KEY (`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限组';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_gadmin`
--

LOCK TABLES `te_gadmin` WRITE;
/*!40000 ALTER TABLE `te_gadmin` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_gadmin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_goods`
--

DROP TABLE IF EXISTS `te_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_goods` (
  `goods_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品id(SKU)',
  `goods_commonid` int(10) unsigned NOT NULL COMMENT '商品公共表id',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称（+规格名称）',
  `goods_jingle` varchar(150) DEFAULT '' COMMENT '商品广告词',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺id',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `gc_id` int(10) unsigned NOT NULL COMMENT '商品分类id',
  `gc_id_1` int(10) unsigned NOT NULL COMMENT '一级分类id',
  `gc_id_2` int(10) unsigned NOT NULL COMMENT '二级分类id',
  `gc_id_3` int(10) unsigned NOT NULL COMMENT '三级分类id',
  `brand_id` int(10) unsigned DEFAULT '0' COMMENT '品牌id',
  `goods_price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `goods_promotion_price` decimal(10,2) NOT NULL COMMENT '商品促销价格',
  `goods_promotion_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '促销类型 0无促销，1抢购，2限时折扣',
  `goods_marketprice` decimal(10,2) NOT NULL COMMENT '市场价',
  `goods_serial` varchar(50) DEFAULT '' COMMENT '商品货号',
  `goods_storage_alarm` tinyint(3) unsigned NOT NULL COMMENT '库存报警值',
  `goods_barcode` varchar(20) DEFAULT '' COMMENT '商品条形码',
  `goods_click` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品点击数量',
  `goods_salenum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '销售数量',
  `goods_collect` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数量',
  `spec_name` varchar(255) NOT NULL COMMENT '规格名称',
  `goods_spec` text NOT NULL COMMENT '商品规格序列化',
  `goods_storage` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品库存',
  `goods_image` varchar(100) NOT NULL DEFAULT '' COMMENT '商品主图',
  `goods_body` text NOT NULL COMMENT '商品描述',
  `mobile_body` text NOT NULL COMMENT '手机端商品描述',
  `goods_state` tinyint(3) unsigned NOT NULL COMMENT '商品状态 0下架，1正常，10违规（禁售）',
  `goods_verify` tinyint(3) unsigned NOT NULL COMMENT '商品审核 1通过，0未通过，10审核中',
  `goods_addtime` int(10) unsigned NOT NULL COMMENT '商品添加时间',
  `goods_edittime` int(10) unsigned NOT NULL COMMENT '商品编辑时间',
  `areaid_1` int(10) unsigned NOT NULL COMMENT '一级地区id',
  `areaid_2` int(10) unsigned NOT NULL COMMENT '二级地区id',
  `areaid_3` int(10) unsigned NOT NULL COMMENT '三级地区id',
  `color_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '颜色规格id',
  `transport_id` mediumint(8) unsigned NOT NULL COMMENT '运费模板id',
  `goods_freight` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '运费 0为免运费',
  `goods_vat` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否开具增值税发票 1是，0否',
  `goods_commend` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '商品推荐 1是，0否 默认0',
  `goods_stcids` varchar(255) DEFAULT '' COMMENT '店铺分类id 首尾用,隔开',
  `evaluation_good_star` tinyint(3) unsigned NOT NULL DEFAULT '5' COMMENT '好评星级',
  `evaluation_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评价数',
  `is_virtual` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否为虚拟商品 1是，0否',
  `virtual_indate` int(10) unsigned NOT NULL COMMENT '虚拟商品有效期',
  `virtual_limit` tinyint(3) unsigned NOT NULL COMMENT '虚拟商品购买上限',
  `virtual_invalid_refund` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否允许过期退款， 1是，0否',
  `is_fcode` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否为F码商品 1是，0否',
  `is_presell` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否是预售商品 1是，0否',
  `presell_deliverdate` int(11) NOT NULL DEFAULT '0' COMMENT '预售商品发货时间',
  `is_book` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否为预定商品，1是，0否',
  `book_down_payment` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '定金金额',
  `book_final_payment` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '尾款金额',
  `book_down_time` int(11) NOT NULL DEFAULT '0' COMMENT '预定结束时间',
  `book_buyers` mediumint(9) DEFAULT '0' COMMENT '预定人数',
  `have_gift` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否拥有赠品',
  `is_own_shop` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否为平台自营',
  `contract_1` tinyint(1) NOT NULL DEFAULT '0' COMMENT '消费者保障服务状态 0关闭 1开启',
  `contract_2` tinyint(1) NOT NULL DEFAULT '0' COMMENT '消费者保障服务状态 0关闭 1开启',
  `contract_3` tinyint(1) NOT NULL DEFAULT '0' COMMENT '消费者保障服务状态 0关闭 1开启',
  `contract_4` tinyint(1) NOT NULL DEFAULT '0' COMMENT '消费者保障服务状态 0关闭 1开启',
  `contract_5` tinyint(1) NOT NULL DEFAULT '0' COMMENT '消费者保障服务状态 0关闭 1开启',
  `contract_6` tinyint(1) NOT NULL DEFAULT '0' COMMENT '消费者保障服务状态 0关闭 1开启',
  `contract_7` tinyint(1) NOT NULL DEFAULT '0' COMMENT '消费者保障服务状态 0关闭 1开启',
  `contract_8` tinyint(1) NOT NULL DEFAULT '0' COMMENT '消费者保障服务状态 0关闭 1开启',
  `contract_9` tinyint(1) NOT NULL DEFAULT '0' COMMENT '消费者保障服务状态 0关闭 1开启',
  `contract_10` tinyint(1) NOT NULL DEFAULT '0' COMMENT '消费者保障服务状态 0关闭 1开启',
  `is_chain` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否为门店商品 1是，0否',
  `invite_rate` decimal(10,2) DEFAULT '0.00' COMMENT '分销佣金',
  PRIMARY KEY (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100000 DEFAULT CHARSET=utf8 COMMENT='商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_goods`
--

LOCK TABLES `te_goods` WRITE;
/*!40000 ALTER TABLE `te_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_goods_attr_index`
--

DROP TABLE IF EXISTS `te_goods_attr_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_goods_attr_index` (
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品id',
  `goods_commonid` int(10) unsigned NOT NULL COMMENT '商品公共表id',
  `gc_id` int(10) unsigned NOT NULL COMMENT '商品分类id',
  `type_id` int(10) unsigned NOT NULL COMMENT '类型id',
  `attr_id` int(10) unsigned NOT NULL COMMENT '属性id',
  `attr_value_id` int(10) unsigned NOT NULL COMMENT '属性值id',
  PRIMARY KEY (`goods_id`,`gc_id`,`attr_value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品与属性对应表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_goods_attr_index`
--

LOCK TABLES `te_goods_attr_index` WRITE;
/*!40000 ALTER TABLE `te_goods_attr_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_goods_attr_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_goods_browse`
--

DROP TABLE IF EXISTS `te_goods_browse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_goods_browse` (
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `member_id` int(11) NOT NULL COMMENT '会员ID',
  `browsetime` int(11) NOT NULL COMMENT '浏览时间',
  `gc_id` int(11) NOT NULL COMMENT '商品分类',
  `gc_id_1` int(11) NOT NULL COMMENT '商品一级分类',
  `gc_id_2` int(11) NOT NULL COMMENT '商品二级分类',
  `gc_id_3` int(11) NOT NULL COMMENT '商品三级分类',
  PRIMARY KEY (`goods_id`,`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品浏览历史表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_goods_browse`
--

LOCK TABLES `te_goods_browse` WRITE;
/*!40000 ALTER TABLE `te_goods_browse` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_goods_browse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_goods_class`
--

DROP TABLE IF EXISTS `te_goods_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_goods_class` (
  `gc_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '索引ID',
  `gc_name` varchar(100) NOT NULL COMMENT '分类名称',
  `type_id` int(10) unsigned DEFAULT '0' COMMENT '类型id',
  `type_name` varchar(100) DEFAULT '' COMMENT '类型名称',
  `gc_parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `commis_rate` float unsigned NOT NULL DEFAULT '0' COMMENT '佣金比例',
  `gc_sort` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `gc_virtual` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许发布虚拟商品，1是，0否',
  `gc_title` varchar(200) DEFAULT '' COMMENT '名称',
  `gc_keywords` varchar(255) DEFAULT '' COMMENT '关键词',
  `gc_description` varchar(255) DEFAULT '' COMMENT '描述',
  `show_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '商品展示方式，1按颜色，2按SPU',
  PRIMARY KEY (`gc_id`),
  KEY `store_id` (`gc_parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1057 DEFAULT CHARSET=utf8 COMMENT='商品分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_goods_class`
--

LOCK TABLES `te_goods_class` WRITE;
/*!40000 ALTER TABLE `te_goods_class` DISABLE KEYS */;
INSERT INTO `te_goods_class` VALUES (1,'服饰鞋帽',0,'',0,0,255,0,'','','',1),(2,'礼品箱包',0,'',0,0,255,0,'','','',1),(3,'家居家装',0,'',0,0,255,0,'','','',1),(4,'女装',0,'',1,0,255,0,'','','',1),(5,'男装',0,'',1,0,255,0,'','','',1),(6,'内衣',0,'',1,0,255,0,'','','',1),(7,'运动',0,'',1,0,255,0,'','','',1),(8,'女鞋',0,'',1,0,255,0,'','','',1),(9,'男鞋',0,'',1,0,255,0,'','','',1),(10,'配饰',0,'',1,0,255,0,'','','',1),(11,'童装',0,'',1,0,255,0,'','','',1),(12,'T恤',0,'',4,0,255,0,'','','',1),(13,'衬衫',0,'',4,0,255,0,'','','',1),(14,'针织衫',0,'',4,0,255,0,'','','',1),(15,'雪纺衫',0,'',4,0,255,0,'','','',1),(16,'卫衣',0,'',4,0,255,0,'','','',1),(17,'马甲',0,'',4,0,255,0,'','','',1),(18,'连衣裙',0,'',4,0,255,0,'','','',1),(19,'半身裙',0,'',4,0,255,0,'','','',1),(20,'牛仔裤',0,'',4,0,255,0,'','','',1),(21,'休闲裤',0,'',4,0,255,0,'','','',1),(22,'打底裤',0,'',4,0,255,0,'','','',1),(23,'正装裤',0,'',4,0,255,0,'','','',1),(24,'西服',0,'',4,0,255,0,'','','',1),(25,'短外套',0,'',4,0,255,0,'','','',1),(26,'风衣',0,'',4,0,255,0,'','','',1),(27,'大衣',0,'',4,0,255,0,'','','',1),(28,'皮衣皮草',0,'',4,0,255,0,'','','',1),(29,'棉服',0,'',4,0,255,0,'','','',1),(30,'羽绒服',0,'',4,0,255,0,'','','',1),(31,'孕妇装',0,'',4,0,255,0,'','','',1),(32,'大码装',0,'',4,0,255,0,'','','',1),(33,'中老年装',0,'',4,0,255,0,'','','',1),(34,'婚纱礼服',0,'',4,0,255,0,'','','',1),(35,'衬衫',0,'',5,0,255,0,'','','',1),(36,'T恤',0,'',5,0,255,0,'','','',1),(37,'POLO衫',0,'',5,0,255,0,'','','',1),(38,'针织衫',0,'',5,0,255,0,'','','',1),(39,'羊绒衫',0,'',5,0,255,0,'','','',1),(40,'卫衣',0,'',5,0,255,0,'','','',1),(41,'马甲／背心',0,'',5,0,255,0,'','','',1),(42,'夹克',0,'',5,0,255,0,'','','',1),(43,'风衣',0,'',5,0,255,0,'','','',1),(44,'大衣',0,'',5,0,255,0,'','','',1),(45,'皮衣',0,'',5,0,255,0,'','','',1),(46,'外套',0,'',5,0,255,0,'','','',1),(47,'西服',0,'',5,0,255,0,'','','',1),(48,'棉服',0,'',5,0,255,0,'','','',1),(49,'羽绒服',0,'',5,0,255,0,'','','',1),(50,'牛仔裤',0,'',5,0,255,0,'','','',1),(51,'休闲裤',0,'',5,0,255,0,'','','',1),(52,'西裤',0,'',5,0,255,0,'','','',1),(53,'西服套装',0,'',5,0,255,0,'','','',1),(54,'大码装',0,'',5,0,255,0,'','','',1),(55,'中老年装',0,'',5,0,255,0,'','','',1),(56,'唐装',0,'',5,0,255,0,'','','',1),(57,'工装',0,'',5,0,255,0,'','','',1),(58,'文胸',0,'',6,0,255,0,'','','',1),(59,'女式内裤',0,'',6,0,255,0,'','','',1),(60,'男式内裤',0,'',6,0,255,0,'','','',1),(61,'家居',0,'',6,0,255,0,'','','',1),(62,'睡衣',0,'',6,0,255,0,'','','',1),(63,'塑身衣',0,'',6,0,255,0,'','','',1),(64,'睡袍／浴袍',0,'',6,0,255,0,'','','',1),(65,'泳衣',0,'',6,0,255,0,'','','',1),(66,'背心',0,'',6,0,255,0,'','','',1),(67,'抹胸',0,'',6,0,255,0,'','','',1),(68,'连裤袜',0,'',6,0,255,0,'','','',1),(69,'美腿袜',0,'',6,0,255,0,'','','',1),(70,'男袜',0,'',6,0,255,0,'','','',1),(71,'女袜',0,'',6,0,255,0,'','','',1),(72,'情趣内衣',0,'',6,0,255,0,'','','',1),(73,'保暖内衣',0,'',6,0,255,0,'','','',1),(74,'休闲鞋',0,'',7,0,255,0,'','','',1),(75,'帆布鞋',0,'',7,0,255,0,'','','',1),(76,'跑步鞋',0,'',7,0,255,0,'','','',1),(77,'篮球鞋',0,'',7,0,255,0,'','','',1),(78,'足球鞋',0,'',7,0,255,0,'','','',1),(79,'训练鞋',0,'',7,0,255,0,'','','',1),(80,'乒羽鞋',0,'',7,0,255,0,'','','',1),(81,'拖鞋',0,'',7,0,255,0,'','','',1),(82,'卫衣',0,'',7,0,255,0,'','','',1),(83,'夹克',0,'',7,0,255,0,'','','',1),(84,'T恤',0,'',7,0,255,0,'','','',1),(85,'棉服／羽绒服',0,'',7,0,255,0,'','','',1),(86,'运动裤',0,'',7,0,255,0,'','','',1),(87,'套装',0,'',7,0,255,0,'','','',1),(88,'运动包',0,'',7,0,255,0,'','','',1),(89,'运动配件',0,'',7,0,255,0,'','','',1),(90,'平底鞋',0,'',8,0,255,0,'','','',1),(91,'高跟鞋',0,'',8,0,255,0,'','','',1),(92,'单鞋',0,'',8,0,255,0,'','','',1),(93,'休闲鞋',0,'',8,0,255,0,'','','',1),(94,'凉鞋',0,'',8,0,255,0,'','','',1),(95,'女靴',0,'',8,0,255,0,'','','',1),(96,'雪地靴',0,'',8,0,255,0,'','','',1),(97,'拖鞋',0,'',8,0,255,0,'','','',1),(98,'裸靴',0,'',8,0,255,0,'','','',1),(99,'筒靴',0,'',8,0,255,0,'','','',1),(100,'帆布鞋',0,'',8,0,255,0,'','','',1),(101,'雨鞋／雨靴',0,'',8,0,255,0,'','','',1),(102,'妈妈鞋',0,'',8,0,255,0,'','','',1),(103,'鞋配件',0,'',8,0,255,0,'','','',1),(104,'特色鞋',0,'',8,0,255,0,'','','',1),(105,'鱼嘴鞋',0,'',8,0,255,0,'','','',1),(106,'布鞋／绣花鞋',0,'',8,0,255,0,'','','',1),(107,'商务休闲鞋',0,'',9,0,255,0,'','','',1),(108,'正装鞋',0,'',9,0,255,0,'','','',1),(109,'休闲鞋',0,'',9,0,255,0,'','','',1),(110,'凉鞋／沙滩鞋',0,'',9,0,255,0,'','','',1),(111,'男靴',0,'',9,0,255,0,'','','',1),(112,'功能鞋',0,'',9,0,255,0,'','','',1),(113,'拖鞋',0,'',9,0,255,0,'','','',1),(114,'传统布鞋',0,'',9,0,255,0,'','','',1),(115,'鞋配件',0,'',9,0,255,0,'','','',1),(116,'帆布鞋',0,'',9,0,255,0,'','','',1),(117,'豆豆鞋',0,'',9,0,255,0,'','','',1),(118,'驾车鞋',0,'',9,0,255,0,'','','',1),(119,'太阳镜',0,'',10,0,255,0,'','','',1),(120,'框镜',0,'',10,0,255,0,'','','',1),(121,'皮带',0,'',10,0,255,0,'','','',1),(122,'围巾',0,'',10,0,255,0,'','','',1),(123,'手套',0,'',10,0,255,0,'','','',1),(124,'帽子',0,'',10,0,255,0,'','','',1),(125,'领带',0,'',10,0,255,0,'','','',1),(126,'袖扣',0,'',10,0,255,0,'','','',1),(127,'其他配件',0,'',10,0,255,0,'','','',1),(128,'丝巾',0,'',10,0,255,0,'','','',1),(129,'披肩',0,'',10,0,255,0,'','','',1),(130,'腰带',0,'',10,0,255,0,'','','',1),(131,'腰链／腰封',0,'',10,0,255,0,'','','',1),(132,'棒球帽',0,'',10,0,255,0,'','','',1),(133,'毛线',0,'',10,0,255,0,'','','',1),(134,'遮阳帽',0,'',10,0,255,0,'','','',1),(135,'防紫外线手套',0,'',10,0,255,0,'','','',1),(136,'草帽',0,'',10,0,255,0,'','','',1),(137,'套装',0,'',11,0,255,0,'','','',1),(138,'上衣',0,'',11,0,255,0,'','','',1),(139,'裤子',0,'',11,0,255,0,'','','',1),(140,'裙子',0,'',11,0,255,0,'','','',1),(141,'内衣／家居服',0,'',11,0,255,0,'','','',1),(142,'羽绒服／棉服',0,'',11,0,255,0,'','','',1),(143,'亲子装',0,'',11,0,255,0,'','','',1),(144,'儿童配饰',0,'',11,0,255,0,'','','',1),(145,'礼服／演出服',0,'',11,0,255,0,'','','',1),(146,'运动鞋',0,'',11,0,255,0,'','','',1),(147,'单鞋',0,'',11,0,255,0,'','','',1),(148,'靴子',0,'',11,0,255,0,'','','',1),(149,'凉鞋',0,'',11,0,255,0,'','','',1),(150,'功能鞋',0,'',11,0,255,0,'','','',1),(151,'潮流女包',0,'',2,0,255,0,'','','',1),(152,'时尚男包',0,'',2,0,255,0,'','','',1),(153,'功能箱包',0,'',2,0,255,0,'','','',1),(154,'礼品',0,'',2,0,255,0,'','','',1),(155,'奢侈品',0,'',2,0,255,0,'','','',1),(156,'钱包/卡包',0,'',151,0,255,0,'','','',1),(157,'手拿包',0,'',151,0,255,0,'','','',1),(158,'单肩包',0,'',151,0,255,0,'','','',1),(159,'双肩包',0,'',151,0,255,0,'','','',1),(160,'手提包',0,'',151,0,255,0,'','','',1),(161,'斜挎包',0,'',151,0,255,0,'','','',1),(162,'钱包/卡包',0,'',152,0,255,0,'','','',1),(163,'男士手包',0,'',152,0,255,0,'','','',1),(164,'腰带／礼盒',0,'',152,0,255,0,'','','',1),(165,'商务公文包',0,'',152,0,255,0,'','','',1),(166,'电脑数码包',0,'',153,0,255,0,'','','',1),(167,'拉杆箱',0,'',153,0,255,0,'','','',1),(168,'旅行包',0,'',153,0,255,0,'','','',1),(169,'旅行配件',0,'',153,0,255,0,'','','',1),(170,'休闲运动包',0,'',153,0,255,0,'','','',1),(171,'登山包',0,'',153,0,255,0,'','','',1),(172,'妈咪包',0,'',153,0,255,0,'','','',1),(173,'书包',0,'',153,0,255,0,'','','',1),(174,'火机烟具',0,'',154,0,255,0,'','','',1),(175,'礼品文具',0,'',154,0,255,0,'','','',1),(176,'瑞士军刀',0,'',154,0,255,0,'','','',1),(177,'收藏品',0,'',154,0,255,0,'','','',1),(178,'工艺礼品',0,'',154,0,255,0,'','','',1),(179,'创意礼品',0,'',154,0,255,0,'','','',1),(180,'礼卡礼卷',0,'',154,0,255,0,'','','',1),(181,'鲜花速递',0,'',154,0,255,0,'','','',1),(182,'婚庆用品',0,'',154,0,255,0,'','','',1),(184,'奢侈品箱包',0,'',155,0,255,0,'','','',1),(185,'钱包',0,'',155,0,255,0,'','','',1),(186,'服饰',0,'',155,0,255,0,'','','',1),(187,'腰带',0,'',155,0,255,0,'','','',1),(188,'太阳镜眼镜',0,'',155,0,255,0,'','','',1),(189,'配件',0,'',155,0,255,0,'','','',1),(190,'GUCCI',0,'',155,0,255,0,'','','',1),(191,'PRADA',0,'',155,0,255,0,'','','',1),(192,'FENDI',0,'',155,0,255,0,'','','',1),(193,'BURBERRY',0,'',155,0,255,0,'','','',1),(194,'MONTBLANC',0,'',155,0,255,0,'','','',1),(195,'ARMANI',0,'',155,0,255,0,'','','',1),(196,'RIMOWA',0,'',155,0,255,0,'','','',1),(197,'RAY-BAN',0,'',155,0,255,0,'','','',1),(198,'COACH',0,'',155,0,255,0,'','','',1),(199,'更多品牌',0,'',155,0,255,0,'','','',1),(200,'家纺',0,'',3,0,255,0,'','','',1),(201,'灯具',0,'',3,0,255,0,'','','',1),(202,'生活日用',0,'',3,0,255,0,'','','',1),(203,'家装软饰',0,'',3,0,255,0,'','','',1),(204,'清洁日用',0,'',3,0,255,0,'','','',1),(205,'宠物生活',0,'',3,0,255,0,'','','',1),(206,'床品件套',0,'',200,0,255,0,'','','',1),(207,'被子',0,'',200,0,255,0,'','','',1),(208,'枕芯枕套',0,'',200,0,255,0,'','','',1),(209,'床单被罩',0,'',200,0,255,0,'','','',1),(210,'毛巾被/毯',0,'',200,0,255,0,'','','',1),(211,'床垫/床褥',0,'',200,0,255,0,'','','',1),(212,'蚊帐/凉席',0,'',200,0,255,0,'','','',1),(213,'抱枕坐垫',0,'',200,0,255,0,'','','',1),(214,'毛巾家纺',0,'',200,0,255,0,'','','',1),(215,'电热毯',0,'',200,0,255,0,'','','',1),(216,'窗帘/窗纱',0,'',200,0,255,0,'','','',1),(217,'酒店用品',0,'',200,0,255,0,'','','',1),(218,'台灯',0,'',201,0,255,0,'','','',1),(219,'节能灯',0,'',201,0,255,0,'','','',1),(220,'装饰灯',0,'',201,0,255,0,'','','',1),(221,'落地灯',0,'',201,0,255,0,'','','',1),(222,'应急灯/手电',0,'',201,0,255,0,'','','',1),(223,'LED灯',0,'',201,0,255,0,'','','',1),(224,'吸顶灯',0,'',201,0,255,0,'','','',1),(225,'五金电器',0,'',201,0,255,0,'','','',1),(226,'吊灯',0,'',201,0,255,0,'','','',1),(227,'氛围照明',0,'',201,0,255,0,'','','',1),(228,'收纳用品',0,'',202,0,255,0,'','','',1),(229,'雨伞雨具',0,'',202,0,255,0,'','','',1),(230,'浴室用品',0,'',202,0,255,0,'','','',1),(231,'缝纫用品',0,'',202,0,255,0,'','','',1),(232,'洗晒用品',0,'',202,0,255,0,'','','',1),(233,'净化除味',0,'',202,0,255,0,'','','',1),(234,'桌布/罩件',0,'',203,0,255,0,'','','',1),(235,'地毯地垫',0,'',203,0,255,0,'','','',1),(236,'沙发垫套',0,'',203,0,255,0,'','','',1),(237,'相框/相片墙',0,'',203,0,255,0,'','','',1),(238,'墙画墙贴',0,'',203,0,255,0,'','','',1),(239,'节庆饰品',0,'',203,0,255,0,'','','',1),(240,'手工/十字绣',0,'',203,0,255,0,'','','',1),(241,'工艺摆件',0,'',203,0,255,0,'','','',1),(242,'其他',0,'',203,0,255,0,'','','',1),(243,'纸品湿巾',0,'',204,0,255,0,'','','',1),(244,'衣物清洁',0,'',204,0,255,0,'','','',1),(245,'清洁工具',0,'',204,0,255,0,'','','',1),(246,'驱虫用品',0,'',204,0,255,0,'','','',1),(247,'居室清洁',0,'',204,0,255,0,'','','',1),(248,'皮具护理',0,'',204,0,255,0,'','','',1),(249,'宠物主粮',0,'',205,0,255,0,'','','',1),(250,'宠物零食',0,'',205,0,255,0,'','','',1),(251,'营养品',0,'',205,0,255,0,'','','',1),(252,'家居日用',0,'',205,0,255,0,'','','',1),(253,'玩具服饰',0,'',205,0,255,0,'','','',1),(254,'出行装备',0,'',205,0,255,0,'','','',1),(255,'医护美容',0,'',205,0,255,0,'','','',1),(256,'数码办公',0,'',0,0,255,0,'','','',1),(258,'手机配件',0,'',256,0,255,0,'','','',1),(259,'摄影摄像',0,'',256,0,255,0,'','','',1),(260,'数码配件',0,'',256,0,255,0,'','','',1),(261,'时尚影音',0,'',256,0,255,0,'','','',1),(262,'手机',0,'',257,0,255,0,'','','',1),(263,'对讲机',0,'',257,0,255,0,'','','',1),(264,'手机电池',0,'',258,0,255,0,'','','',1),(265,'蓝牙耳机',0,'',258,0,255,0,'','','',1),(266,'充电器/数据线',0,'',258,0,255,0,'','','',1),(267,'手机耳机',0,'',258,0,255,0,'','','',1),(268,'手机贴膜',0,'',258,0,255,0,'','','',1),(269,'手机存储卡',0,'',258,0,255,0,'','','',1),(270,'手机保护套',0,'',258,0,255,0,'','','',1),(271,'车载配件',0,'',258,0,255,0,'','','',1),(272,'iPhone 配件',0,'',258,0,255,0,'','','',1),(273,'创意配件',0,'',258,0,255,0,'','','',1),(274,'便携/无线音响',0,'',258,0,255,0,'','','',1),(275,'手机饰品',0,'',258,0,255,0,'','','',1),(276,'数码相机',0,'',259,0,255,0,'','','',1),(277,'单电/微单相机',0,'',259,0,255,0,'','','',1),(278,'单反相机',0,'',259,0,255,0,'','','',1),(279,'摄像机',0,'',259,0,255,0,'','','',1),(280,'拍立得',0,'',259,0,255,0,'','','',1),(281,'镜头',0,'',259,0,255,0,'','','',1),(282,'存储卡',0,'',260,0,255,0,'','','',1),(283,'读卡器',0,'',260,0,255,0,'','','',1),(284,'滤镜',0,'',260,0,255,0,'','','',1),(285,'闪光灯/手柄',0,'',260,0,255,0,'','','',1),(286,'相机包',0,'',260,0,255,0,'','','',1),(287,'三脚架/云台',0,'',260,0,255,0,'','','',1),(288,'相机清洁',0,'',260,0,255,0,'','','',1),(289,'相机贴膜',0,'',260,0,255,0,'','','',1),(290,'机身附件',0,'',260,0,255,0,'','','',1),(291,'镜头附件',0,'',260,0,255,0,'','','',1),(292,'电池/充电器',0,'',260,0,255,0,'','','',1),(293,'移动电源',0,'',260,0,255,0,'','','',1),(294,'MP3/MP4',0,'',261,0,255,0,'','','',1),(295,'智能设备',0,'',261,0,255,0,'','','',1),(296,'耳机/耳麦',0,'',261,0,255,0,'','','',1),(297,'音箱',0,'',261,0,255,0,'','','',1),(298,'高清播放器',0,'',261,0,255,0,'','','',1),(299,'电子书',0,'',261,0,255,0,'','','',1),(300,'电子词典',0,'',261,0,255,0,'','','',1),(301,'MP3/MP4配件',0,'',261,0,255,0,'','','',1),(302,'录音笔',0,'',261,0,255,0,'','','',1),(303,'麦克风',0,'',261,0,255,0,'','','',1),(304,'专业音频',0,'',261,0,255,0,'','','',1),(305,'电子教育',0,'',261,0,255,0,'','','',1),(306,'数码相框',0,'',261,0,255,0,'','','',1),(307,'苹果配件',0,'',261,0,255,0,'','','',1),(308,'家用电器',0,'',0,0,255,0,'','','',1),(309,'大家电',0,'',308,0,255,0,'','','',1),(310,'生活电器',0,'',308,0,255,0,'','','',1),(311,'厨房电器',0,'',308,0,255,0,'','','',1),(312,'个护健康',0,'',308,0,255,0,'','','',1),(313,'五金家装',0,'',308,0,255,0,'','','',1),(314,'平板电视',0,'',309,0,255,0,'','','',1),(315,'空调',0,'',309,0,255,0,'','','',1),(316,'冰箱',0,'',309,0,255,0,'','','',1),(317,'洗衣机',0,'',309,0,255,0,'','','',1),(318,'家庭影院',0,'',309,0,255,0,'','','',1),(319,'DVD播放机',0,'',309,0,255,0,'','','',1),(320,'迷你音响',0,'',309,0,255,0,'','','',1),(321,'烟机/灶具',0,'',309,0,255,0,'','','',1),(322,'热水器',0,'',309,0,255,0,'','','',1),(323,'消毒柜/洗碗机',0,'',309,0,255,0,'','','',1),(324,'酒柜/冰吧/冷柜',0,'',309,0,255,0,'','','',1),(325,'家电配件',0,'',309,0,255,0,'','','',1),(326,'净化器',0,'',310,0,255,0,'','','',1),(327,'电风扇',0,'',310,0,255,0,'','','',1),(328,'吸尘器',0,'',310,0,255,0,'','','',1),(329,'加湿器',0,'',310,0,255,0,'','','',1),(330,'净水设备',0,'',310,0,255,0,'','','',1),(331,'饮水机',0,'',310,0,255,0,'','','',1),(332,'冷风扇',0,'',310,0,255,0,'','','',1),(333,'挂烫机/熨斗',0,'',310,0,255,0,'','','',1),(334,'电话机',0,'',310,0,255,0,'','','',1),(335,'插座',0,'',310,0,255,0,'','','',1),(336,'收录/音机',0,'',310,0,255,0,'','','',1),(337,'除湿/干衣机',0,'',310,0,255,0,'','','',1),(338,'清洁机',0,'',310,0,255,0,'','','',1),(339,'取暖电器',0,'',310,0,255,0,'','','',1),(340,'其它生活电器',0,'',310,0,255,0,'','','',1),(341,'料理/榨汁机',0,'',311,0,255,0,'','','',1),(342,'豆浆机',0,'',311,0,255,0,'','','',1),(343,'电饭煲',0,'',311,0,255,0,'','','',1),(344,'电压力锅',0,'',311,0,255,0,'','','',1),(345,'面包机',0,'',311,0,255,0,'','','',1),(346,'咖啡机',0,'',311,0,255,0,'','','',1),(347,'微波炉',0,'',311,0,255,0,'','','',1),(348,'电烤箱',0,'',311,0,255,0,'','','',1),(349,'电磁炉',0,'',311,0,255,0,'','','',1),(350,'电饼铛/烧烤盘',0,'',311,0,255,0,'','','',1),(351,'煮蛋器',0,'',311,0,255,0,'','','',1),(352,'酸奶机',0,'',311,0,255,0,'','','',1),(353,'电炖锅',0,'',311,0,255,0,'','','',1),(354,'电水壶/热水瓶',0,'',311,0,255,0,'','','',1),(355,'多用途锅',0,'',311,0,255,0,'','','',1),(356,'果蔬解毒机',0,'',311,0,255,0,'','','',1),(357,'其它厨房电器',0,'',311,0,255,0,'','','',1),(358,'剃须刀',0,'',312,0,255,0,'','','',1),(359,'剃/脱毛器',0,'',312,0,255,0,'','','',1),(360,'口腔护理',0,'',312,0,255,0,'','','',1),(361,'电吹风',0,'',312,0,255,0,'','','',1),(362,'美容器',0,'',312,0,255,0,'','','',1),(363,'美发器',0,'',312,0,255,0,'','','',1),(364,'按摩椅',0,'',312,0,255,0,'','','',1),(365,'按摩器',0,'',312,0,255,0,'','','',1),(366,'足浴盆',0,'',312,0,255,0,'','','',1),(367,'血压计',0,'',312,0,255,0,'','','',1),(368,'健康秤/厨房秤',0,'',312,0,255,0,'','','',1),(369,'血糖仪',0,'',312,0,255,0,'','','',1),(370,'体温计',0,'',312,0,255,0,'','','',1),(371,'计步器/脂肪检测仪',0,'',312,0,255,0,'','','',1),(372,'其它健康电器',0,'',312,0,255,0,'','','',1),(373,'电动工具',0,'',313,0,255,0,'','','',1),(374,'手动工具',0,'',313,0,255,0,'','','',1),(375,'仪器仪表',0,'',313,0,255,0,'','','',1),(376,'浴霸/排气扇',0,'',313,0,255,0,'','','',1),(377,'灯具',0,'',313,0,255,0,'','','',1),(378,'LED灯',0,'',313,0,255,0,'','','',1),(379,'洁身器',0,'',313,0,255,0,'','','',1),(380,'水槽',0,'',313,0,255,0,'','','',1),(381,'龙头',0,'',313,0,255,0,'','','',1),(382,'淋浴花洒',0,'',313,0,255,0,'','','',1),(383,'厨卫五金',0,'',313,0,255,0,'','','',1),(384,'家具五金',0,'',313,0,255,0,'','','',1),(385,'门铃',0,'',313,0,255,0,'','','',1),(386,'电气开关',0,'',313,0,255,0,'','','',1),(387,'插座',0,'',313,0,255,0,'','','',1),(388,'电工电料',0,'',313,0,255,0,'','','',1),(389,'监控安防',0,'',313,0,255,0,'','','',1),(390,'电脑整机',0,'',256,0,255,0,'','','',1),(391,'电脑配件',0,'',256,0,255,0,'','','',1),(392,'外设产品',0,'',256,0,255,0,'','','',1),(393,'网络产品',0,'',256,0,255,0,'','','',1),(394,'办公打印',0,'',256,0,255,0,'','','',1),(395,'办公文仪',0,'',256,0,255,0,'','','',1),(398,'笔记本',0,'',390,0,255,0,'','','',1),(399,'超极本',0,'',390,0,255,0,'','','',1),(400,'游戏本',0,'',390,0,255,0,'','','',1),(401,'平板电脑',0,'',390,0,255,0,'','','',1),(402,'平板电脑配件',0,'',390,0,255,0,'','','',1),(403,'台式机',0,'',390,0,255,0,'','','',1),(404,'服务器',0,'',390,0,255,0,'','','',1),(405,'笔记本配件',0,'',390,0,255,0,'','','',1),(406,'CPU',0,'',391,0,255,0,'','','',1),(407,'主板',0,'',391,0,255,0,'','','',1),(408,'显卡',0,'',391,0,255,0,'','','',1),(409,'硬盘',0,'',391,0,255,0,'','','',1),(410,'SSD固态硬盘',0,'',391,0,255,0,'','','',1),(411,'内存',0,'',391,0,255,0,'','','',1),(412,'机箱',0,'',391,0,255,0,'','','',1),(413,'电源',0,'',391,0,255,0,'','','',1),(414,'显示器',0,'',391,0,255,0,'','','',1),(415,'刻录机/光驱',0,'',391,0,255,0,'','','',1),(416,'散热器',0,'',391,0,255,0,'','','',1),(417,'声卡/扩展卡',0,'',391,0,255,0,'','','',1),(418,'装机配件',0,'',391,0,255,0,'','','',1),(419,'鼠标',0,'',392,0,255,0,'','','',1),(420,'键盘',0,'',392,0,255,0,'','','',1),(421,'移动硬盘',0,'',392,0,255,0,'','','',1),(422,'U盘',0,'',392,0,255,0,'','','',1),(423,'摄像头',0,'',392,0,255,0,'','','',1),(424,'外置盒',0,'',392,0,255,0,'','','',1),(425,'游戏设备',0,'',392,0,255,0,'','','',1),(426,'电视盒',0,'',392,0,255,0,'','','',1),(427,'手写板',0,'',392,0,255,0,'','','',1),(428,'鼠标垫',0,'',392,0,255,0,'','','',1),(429,'插座',0,'',392,0,255,0,'','','',1),(430,'UPS电源',0,'',392,0,255,0,'','','',1),(431,'线缆',0,'',392,0,255,0,'','','',1),(432,'电脑工具',0,'',392,0,255,0,'','','',1),(433,'电脑清洁',0,'',392,0,255,0,'','','',1),(434,'路由器',0,'',393,0,255,0,'','','',1),(435,'网卡',0,'',393,0,255,0,'','','',1),(436,'交换机',0,'',393,0,255,0,'','','',1),(437,'网络存储',0,'',393,0,255,0,'','','',1),(438,'3G上网',0,'',393,0,255,0,'','','',1),(439,'网络盒子',0,'',393,0,255,0,'','','',1),(440,'打印机',0,'',394,0,255,0,'','','',1),(441,'一体机',0,'',394,0,255,0,'','','',1),(442,'投影机',0,'',394,0,255,0,'','','',1),(443,'投影配件',0,'',394,0,255,0,'','','',1),(444,'传真机',0,'',394,0,255,0,'','','',1),(445,'复合机',0,'',394,0,255,0,'','','',1),(446,'碎纸机',0,'',394,0,255,0,'','','',1),(447,'扫描仪',0,'',394,0,255,0,'','','',1),(448,'墨盒',0,'',394,0,255,0,'','','',1),(449,'硒鼓',0,'',394,0,255,0,'','','',1),(450,'墨粉',0,'',394,0,255,0,'','','',1),(451,'色带',0,'',394,0,255,0,'','','',1),(452,'办公文具',0,'',395,0,255,0,'','','',1),(453,'文件管理',0,'',395,0,255,0,'','','',1),(454,'笔类',0,'',395,0,255,0,'','','',1),(455,'纸类',0,'',395,0,255,0,'','','',1),(456,'本册/便签',0,'',395,0,255,0,'','','',1),(457,'学生文具',0,'',395,0,255,0,'','','',1),(458,'财务用品',0,'',395,0,255,0,'','','',1),(459,'计算器',0,'',395,0,255,0,'','','',1),(460,'激光笔',0,'',395,0,255,0,'','','',1),(461,'白板/封装',0,'',395,0,255,0,'','','',1),(462,'考勤机',0,'',395,0,255,0,'','','',1),(463,'刻录碟片/附件',0,'',395,0,255,0,'','','',1),(464,'点钞机',0,'',395,0,255,0,'','','',1),(465,'支付设备/POS机',0,'',395,0,255,0,'','','',1),(466,'安防监控',0,'',395,0,255,0,'','','',1),(467,'呼叫/会议设备',0,'',395,0,255,0,'','','',1),(468,'保险柜',0,'',395,0,255,0,'','','',1),(469,'办公家具',0,'',395,0,255,0,'','','',1),(470,'个护化妆',0,'',0,0,255,0,'','','',1),(471,'面部护理',0,'',470,0,255,0,'','','',1),(472,'身体护理',0,'',470,0,255,0,'','','',1),(473,'口腔护理',0,'',470,0,255,0,'','','',1),(474,'女性护理',0,'',470,0,255,0,'','','',1),(475,'男士护理',0,'',470,0,255,0,'','','',1),(476,'魅力彩妆',0,'',470,0,255,0,'','','',1),(477,'香水SPA',0,'',470,0,255,0,'','','',1),(478,'洁面乳',0,'',471,0,255,0,'','','',1),(479,'爽肤水',0,'',471,0,255,0,'','','',1),(480,'精华露',0,'',471,0,255,0,'','','',1),(481,'乳液面霜',0,'',471,0,255,0,'','','',1),(482,'面膜面贴',0,'',471,0,255,0,'','','',1),(483,'眼部护理',0,'',471,0,255,0,'','','',1),(484,'颈部护理',0,'',471,0,255,0,'','','',1),(485,'T区护理',0,'',471,0,255,0,'','','',1),(486,'护肤套装',0,'',471,0,255,0,'','','',1),(487,'防晒隔离',0,'',471,0,255,0,'','','',1),(488,'洗发护发',0,'',472,0,255,0,'','','',1),(489,'染发/造型',0,'',472,0,255,0,'','','',1),(490,'沐浴',0,'',472,0,255,0,'','','',1),(491,'磨砂/浴盐',0,'',472,0,255,0,'','','',1),(492,'身体乳',0,'',472,0,255,0,'','','',1),(493,'手工/香皂',0,'',472,0,255,0,'','','',1),(494,'香薰精油',0,'',472,0,255,0,'','','',1),(495,'纤体瘦身',0,'',472,0,255,0,'','','',1),(496,'脱毛膏',0,'',472,0,255,0,'','','',1),(497,'手足护理',0,'',472,0,255,0,'','','',1),(498,'洗护套装',0,'',472,0,255,0,'','','',1),(499,'牙膏/牙粉',0,'',473,0,255,0,'','','',1),(500,'牙刷/牙线',0,'',473,0,255,0,'','','',1),(501,'漱口水',0,'',473,0,255,0,'','','',1),(502,'卫生巾',0,'',474,0,255,0,'','','',1),(503,'卫生护垫',0,'',474,0,255,0,'','','',1),(504,'洗液',0,'',474,0,255,0,'','','',1),(505,'美容食品',0,'',474,0,255,0,'','','',1),(506,'其他',0,'',474,0,255,0,'','','',1),(507,'脸部护理',0,'',475,0,255,0,'','','',1),(508,'眼部护理',0,'',475,0,255,0,'','','',1),(509,'身体护理',0,'',475,0,255,0,'','','',1),(510,'男士香水',0,'',475,0,255,0,'','','',1),(511,'剃须护理',0,'',475,0,255,0,'','','',1),(512,'防脱洗护',0,'',475,0,255,0,'','','',1),(513,'男士唇膏',0,'',475,0,255,0,'','','',1),(514,'粉底/遮瑕',0,'',476,0,255,0,'','','',1),(515,'腮红',0,'',476,0,255,0,'','','',1),(516,'眼影/眼线',0,'',476,0,255,0,'','','',1),(517,'眉笔',0,'',476,0,255,0,'','','',1),(518,'睫毛膏',0,'',476,0,255,0,'','','',1),(519,'唇膏唇彩',0,'',476,0,255,0,'','','',1),(520,'彩妆组合',0,'',476,0,255,0,'','','',1),(521,'卸妆',0,'',476,0,255,0,'','','',1),(522,'美甲',0,'',476,0,255,0,'','','',1),(523,'彩妆工具',0,'',476,0,255,0,'','','',1),(524,'假发',0,'',476,0,255,0,'','','',1),(525,'女士香水',0,'',477,0,255,0,'','','',1),(526,'男士香水',0,'',477,0,255,0,'','','',1),(527,'组合套装',0,'',477,0,255,0,'','','',1),(528,'迷你香水',0,'',477,0,255,0,'','','',1),(529,'香体走珠',0,'',477,0,255,0,'','','',1),(530,'珠宝手表',0,'',0,0,255,0,'','','',1),(531,'时尚饰品',0,'',530,0,255,0,'','','',1),(532,'纯金K金饰品',0,'',530,0,255,0,'','','',1),(533,'金银投资',0,'',530,0,255,0,'','','',1),(534,'银饰',0,'',530,0,255,0,'','','',1),(535,'钻石饰品',0,'',530,0,255,0,'','','',1),(536,'翡翠玉石',0,'',530,0,255,0,'','','',1),(537,'水晶玛瑙',0,'',530,0,255,0,'','','',1),(538,'宝石珍珠',0,'',530,0,255,0,'','','',1),(539,'婚庆',0,'',530,0,255,0,'','','',1),(540,'钟表手表',0,'',530,0,255,0,'','','',1),(541,'项链',0,'',531,0,255,0,'','','',1),(542,'手链/脚链',0,'',531,0,255,0,'','','',1),(543,'戒指',0,'',531,0,255,0,'','','',1),(544,'耳饰',0,'',531,0,255,0,'','','',1),(545,'头饰',0,'',531,0,255,0,'','','',1),(546,'胸针',0,'',531,0,255,0,'','','',1),(547,'婚庆饰品',0,'',531,0,255,0,'','','',1),(548,'饰品配件',0,'',531,0,255,0,'','','',1),(549,'吊坠/项链',0,'',532,0,255,0,'','','',1),(550,'手镯/手链/脚链',0,'',532,0,255,0,'','','',1),(551,'戒指',0,'',532,0,255,0,'','','',1),(552,'耳饰',0,'',532,0,255,0,'','','',1),(553,'工艺金',0,'',533,0,255,0,'','','',1),(554,'工艺银',0,'',533,0,255,0,'','','',1),(555,'吊坠/项链',0,'',534,0,255,0,'','','',1),(556,'手镯/手链/脚链',0,'',534,0,255,0,'','','',1),(557,'戒指/耳饰',0,'',534,0,255,0,'','','',1),(558,'宝宝金银',0,'',534,0,255,0,'','','',1),(559,'千足银',0,'',534,0,255,0,'','','',1),(560,'裸钻',0,'',535,0,255,0,'','','',1),(561,'戒指',0,'',535,0,255,0,'','','',1),(563,'项链/吊坠',0,'',535,0,255,0,'','','',1),(564,'耳饰',0,'',535,0,255,0,'','','',1),(565,'手镯/手链',0,'',535,0,255,0,'','','',1),(566,'项链/吊坠',0,'',536,0,255,0,'','','',1),(567,'手镯/手串',0,'',536,0,255,0,'','','',1),(568,'戒指',0,'',536,0,255,0,'','','',1),(569,'耳饰',0,'',536,0,255,0,'','','',1),(570,'挂件/摆件/把件',0,'',536,0,255,0,'','','',1),(571,'高值收藏',0,'',536,0,255,0,'','','',1),(572,'耳饰',0,'',537,0,255,0,'','','',1),(573,'手镯/手链/脚链',0,'',537,0,255,0,'','','',1),(574,'戒指',0,'',537,0,255,0,'','','',1),(575,'头饰/胸针',0,'',537,0,255,0,'','','',1),(576,'摆件/挂件',0,'',537,0,255,0,'','','',1),(577,'项链/吊坠',0,'',538,0,255,0,'','','',1),(578,'耳饰',0,'',538,0,255,0,'','','',1),(579,'手镯/手链',0,'',538,0,255,0,'','','',1),(580,'戒指',0,'',538,0,255,0,'','','',1),(581,'婚嫁首饰',0,'',539,0,255,0,'','','',1),(582,'婚纱摄影',0,'',539,0,255,0,'','','',1),(583,'婚纱礼服',0,'',539,0,255,0,'','','',1),(584,'婚庆服务',0,'',539,0,255,0,'','','',1),(585,'婚庆礼品/用品',0,'',539,0,255,0,'','','',1),(586,'婚宴',0,'',539,0,255,0,'','','',1),(587,'瑞士品牌',0,'',540,0,255,0,'','','',1),(588,'国产品牌',0,'',540,0,255,0,'','','',1),(589,'日本品牌',0,'',540,0,255,0,'','','',1),(590,'时尚品牌',0,'',540,0,255,0,'','','',1),(591,'闹钟挂钟',0,'',540,0,255,0,'','','',1),(592,'儿童手表',0,'',540,0,255,0,'','','',1),(593,'食品饮料',0,'',0,0,255,0,'','','',1),(594,'进口食品',0,'',593,0,255,0,'','','',1),(595,'地方特产',0,'',593,0,255,0,'','','',1),(596,'休闲食品',0,'',593,0,255,0,'','','',1),(597,'粮油调味',0,'',593,0,255,0,'','','',1),(598,'中外名酒',0,'',593,0,255,0,'','','',1),(599,'饮料冲调',0,'',593,0,255,0,'','','',1),(600,'营养健康',0,'',593,0,255,0,'','','',1),(601,'亚健康调理',0,'',593,0,255,0,'','','',1),(602,'健康礼品',0,'',593,0,255,0,'','','',1),(603,'生鲜食品',0,'',593,0,255,0,'','','',1),(604,'饼干蛋糕',0,'',594,0,255,0,'','','',1),(605,'糖果巧克力',0,'',594,0,255,0,'','','',1),(606,'休闲零食',0,'',594,0,255,0,'','','',1),(607,'冲调饮品',0,'',594,0,255,0,'','','',1),(608,'粮油调味',0,'',594,0,255,0,'','','',1),(609,'华北',0,'',595,0,255,0,'','','',1),(610,'西北',0,'',595,0,255,0,'','','',1),(611,'西南',0,'',595,0,255,0,'','','',1),(612,'东北',0,'',595,0,255,0,'','','',1),(613,'华南',0,'',595,0,255,0,'','','',1),(614,'华东',0,'',595,0,255,0,'','','',1),(615,'华中',0,'',595,0,255,0,'','','',1),(616,'休闲零食',0,'',596,0,255,0,'','','',1),(617,'坚果炒货',0,'',596,0,255,0,'','','',1),(618,'肉干肉松',0,'',596,0,255,0,'','','',1),(619,'蜜饯果脯',0,'',596,0,255,0,'','','',1),(620,'糖果/巧克力',0,'',596,0,255,0,'','','',1),(621,'饼干蛋糕',0,'',596,0,255,0,'','','',1),(622,'米面杂粮',0,'',597,0,255,0,'','','',1),(623,'食用油',0,'',597,0,255,0,'','','',1),(624,'调味品',0,'',597,0,255,0,'','','',1),(625,'南北干货',0,'',597,0,255,0,'','','',1),(626,'方便食品',0,'',597,0,255,0,'','','',1),(627,'有机食品',0,'',597,0,255,0,'','','',1),(628,'白酒',0,'',598,0,255,0,'','','',1),(629,'洋酒',0,'',598,0,255,0,'','','',1),(630,'葡萄酒',0,'',598,0,255,0,'','','',1),(631,'啤酒',0,'',598,0,255,0,'','','',1),(632,'黄酒',0,'',598,0,255,0,'','','',1),(633,'水',0,'',599,0,255,0,'','','',1),(634,'饮料',0,'',599,0,255,0,'','','',1),(635,'牛奶',0,'',599,0,255,0,'','','',1),(636,'茶叶',0,'',599,0,255,0,'','','',1),(637,'咖啡/奶茶',0,'',599,0,255,0,'','','',1),(638,'冲饮谷物',0,'',599,0,255,0,'','','',1),(639,'基础营养',0,'',600,0,255,0,'','','',1),(640,'美体养颜',0,'',600,0,255,0,'','','',1),(641,'滋补调养',0,'',600,0,255,0,'','','',1),(642,'骨骼健康',0,'',600,0,255,0,'','','',1),(643,'保健茶饮',0,'',600,0,255,0,'','','',1),(644,'成分保健',0,'',600,0,255,0,'','','',1),(645,'无糖食品',0,'',600,0,255,0,'','','',1),(646,'调节三高',0,'',601,0,255,0,'','','',1),(647,'心脑养护',0,'',601,0,255,0,'','','',1),(648,'改善睡眠',0,'',601,0,255,0,'','','',1),(649,'肝肾养护',0,'',601,0,255,0,'','','',1),(650,'免疫调节',0,'',601,0,255,0,'','','',1),(651,'更多调理',0,'',601,0,255,0,'','','',1),(652,'参茸礼品',0,'',602,0,255,0,'','','',1),(653,'更多礼品',0,'',602,0,255,0,'','','',1),(654,'水果',0,'',603,0,255,0,'','','',1),(655,'蔬菜',0,'',603,0,255,0,'','','',1),(656,'海鲜水产',0,'',603,0,255,0,'','','',1),(657,'禽蛋',0,'',603,0,255,0,'','','',1),(658,'鲜肉',0,'',603,0,255,0,'','','',1),(659,'加工类肉食',0,'',603,0,255,0,'','','',1),(660,'冻品',0,'',603,0,255,0,'','','',1),(661,'半成品',0,'',603,0,255,0,'','','',1),(662,'运动健康',0,'',0,0,255,0,'','','',1),(663,'户外鞋服',0,'',662,0,255,0,'','','',1),(664,'户外装备',0,'',662,0,255,0,'','','',1),(665,'运动器械',0,'',662,0,255,0,'','','',1),(666,'纤体瑜伽',0,'',662,0,255,0,'','','',1),(667,'体育娱乐',0,'',662,0,255,0,'','','',1),(668,'成人用品',0,'',662,0,255,0,'','','',1),(669,'保健器械',0,'',662,0,255,0,'','','',1),(670,'急救卫生',0,'',662,0,255,0,'','','',1),(671,'户外服装',0,'',663,0,255,0,'','','',1),(672,'户外鞋袜',0,'',663,0,255,0,'','','',1),(673,'户外配饰',0,'',663,0,255,0,'','','',1),(674,'帐篷',0,'',664,0,255,0,'','','',1),(675,'睡袋',0,'',664,0,255,0,'','','',1),(676,'登山攀岩',0,'',664,0,255,0,'','','',1),(677,'户外背包',0,'',664,0,255,0,'','','',1),(678,'户外照明',0,'',664,0,255,0,'','','',1),(679,'户外垫子',0,'',664,0,255,0,'','','',1),(680,'户外仪表',0,'',664,0,255,0,'','','',1),(681,'户外工具',0,'',664,0,255,0,'','','',1),(682,'望远镜',0,'',664,0,255,0,'','','',1),(683,'垂钓用品',0,'',664,0,255,0,'','','',1),(684,'旅游用品',0,'',664,0,255,0,'','','',1),(685,'便携桌椅床',0,'',664,0,255,0,'','','',1),(686,'烧烤用品',0,'',664,0,255,0,'','','',1),(687,'野餐炊具',0,'',664,0,255,0,'','','',1),(688,'军迷用品',0,'',664,0,255,0,'','','',1),(689,'游泳用具',0,'',664,0,255,0,'','','',1),(690,'泳衣',0,'',664,0,255,0,'','','',1),(691,'健身器械',0,'',665,0,255,0,'','','',1),(692,'运动器材',0,'',665,0,255,0,'','','',1),(693,'极限轮滑',0,'',665,0,255,0,'','','',1),(694,'骑行运动',0,'',665,0,255,0,'','','',1),(695,'运动护具',0,'',665,0,255,0,'','','',1),(696,'武术搏击',0,'',665,0,255,0,'','','',1),(697,'瑜伽垫',0,'',666,0,255,0,'','','',1),(698,'瑜伽服',0,'',666,0,255,0,'','','',1),(699,'瑜伽配件',0,'',666,0,255,0,'','','',1),(700,'瑜伽套装',0,'',666,0,255,0,'','','',1),(701,'舞蹈鞋服',0,'',666,0,255,0,'','','',1),(702,'羽毛球',0,'',667,0,255,0,'','','',1),(703,'乒乓球',0,'',667,0,255,0,'','','',1),(704,'篮球',0,'',667,0,255,0,'','','',1),(705,'足球',0,'',667,0,255,0,'','','',1),(706,'网球',0,'',667,0,255,0,'','','',1),(707,'排球',0,'',667,0,255,0,'','','',1),(708,'高尔夫球',0,'',667,0,255,0,'','','',1),(709,'棋牌麻将',0,'',667,0,255,0,'','','',1),(710,'其他',0,'',667,0,255,0,'','','',1),(711,'安全避孕',0,'',668,0,255,0,'','','',1),(712,'验孕测孕',0,'',668,0,255,0,'','','',1),(713,'人体润滑',0,'',668,0,255,0,'','','',1),(714,'情爱玩具',0,'',668,0,255,0,'','','',1),(715,'情趣内衣',0,'',668,0,255,0,'','','',1),(716,'组合套装',0,'',668,0,255,0,'','','',1),(717,'养生器械',0,'',669,0,255,0,'','','',1),(718,'保健用品',0,'',669,0,255,0,'','','',1),(719,'康复辅助',0,'',669,0,255,0,'','','',1),(720,'家庭护理',0,'',669,0,255,0,'','','',1),(721,'跌打损伤',0,'',670,0,255,0,'','','',1),(722,'烫伤止痒',0,'',670,0,255,0,'','','',1),(723,'防裂抗冻',0,'',670,0,255,0,'','','',1),(724,'口腔咽部',0,'',670,0,255,0,'','','',1),(725,'眼部保健',0,'',670,0,255,0,'','','',1),(726,'鼻炎健康',0,'',670,0,255,0,'','','',1),(727,'风湿骨痛',0,'',670,0,255,0,'','','',1),(728,'生殖泌尿',0,'',670,0,255,0,'','','',1),(729,'美体塑身',0,'',670,0,255,0,'','','',1),(730,'汽车用品',0,'',0,0,255,0,'','','',1),(731,'电子电器',0,'',730,0,255,0,'','','',1),(732,'系统养护',0,'',730,0,255,0,'','','',1),(733,'改装配件',0,'',730,0,255,0,'','','',1),(734,'汽车美容',0,'',730,0,255,0,'','','',1),(735,'座垫脚垫',0,'',730,0,255,0,'','','',1),(736,'内饰精品',0,'',730,0,255,0,'','','',1),(737,'安全自驾',0,'',730,0,255,0,'','','',1),(738,'便携GPS导航',0,'',731,0,255,0,'','','',1),(739,'嵌入式导航',0,'',731,0,255,0,'','','',1),(740,'安全预警仪',0,'',731,0,255,0,'','','',1),(741,'行车记录仪',0,'',731,0,255,0,'','','',1),(742,'跟踪防盗器',0,'',731,0,255,0,'','','',1),(743,'倒车雷达',0,'',731,0,255,0,'','','',1),(744,'车载电源',0,'',731,0,255,0,'','','',1),(745,'车载蓝牙',0,'',731,0,255,0,'','','',1),(746,'车载影音',0,'',731,0,255,0,'','','',1),(747,'车载净化器',0,'',731,0,255,0,'','','',1),(748,'车载冰箱',0,'',731,0,255,0,'','','',1),(749,'车载吸尘器',0,'',731,0,255,0,'','','',1),(750,'充气泵',0,'',731,0,255,0,'','','',1),(751,'胎压监测',0,'',731,0,255,0,'','','',1),(752,'车载生活电器',0,'',731,0,255,0,'','','',1),(753,'机油',0,'',732,0,255,0,'','','',1),(754,'添加剂',0,'',732,0,255,0,'','','',1),(755,'防冻冷却液',0,'',732,0,255,0,'','','',1),(756,'附属油',0,'',732,0,255,0,'','','',1),(757,'底盘装甲',0,'',732,0,255,0,'','','',1),(758,'空调清洗剂',0,'',732,0,255,0,'','','',1),(759,'金属养护',0,'',732,0,255,0,'','','',1),(760,'雨刷',0,'',733,0,255,0,'','','',1),(761,'车灯',0,'',733,0,255,0,'','','',1),(762,'轮胎',0,'',733,0,255,0,'','','',1),(763,'贴膜',0,'',733,0,255,0,'','','',1),(764,'装饰贴',0,'',733,0,255,0,'','','',1),(765,'后视镜',0,'',733,0,255,0,'','','',1),(766,'机油滤',0,'',733,0,255,0,'','','',1),(767,'空气滤',0,'',733,0,255,0,'','','',1),(768,'空调滤',0,'',733,0,255,0,'','','',1),(769,'燃油滤',0,'',733,0,255,0,'','','',1),(770,'火花塞',0,'',733,0,255,0,'','','',1),(771,'喇叭',0,'',733,0,255,0,'','','',1),(772,'刹车片',0,'',733,0,255,0,'','','',1),(773,'刹车盘',0,'',733,0,255,0,'','','',1),(774,'减震器',0,'',733,0,255,0,'','','',1),(775,'车身装饰',0,'',733,0,255,0,'','','',1),(776,'尾喉/排气管',0,'',733,0,255,0,'','','',1),(777,'踏板',0,'',733,0,255,0,'','','',1),(778,'蓄电池',0,'',733,0,255,0,'','','',1),(779,'其他配件',0,'',733,0,255,0,'','','',1),(780,'漆面美容',0,'',734,0,255,0,'','','',1),(781,'漆面修复',0,'',734,0,255,0,'','','',1),(782,'内饰清洁',0,'',734,0,255,0,'','','',1),(783,'玻璃美容',0,'',734,0,255,0,'','','',1),(784,'补漆笔',0,'',734,0,255,0,'','','',1),(785,'轮胎轮毂清洗',0,'',734,0,255,0,'','','',1),(786,'洗车器',0,'',734,0,255,0,'','','',1),(787,'洗车水枪',0,'',734,0,255,0,'','','',1),(788,'洗车配件',0,'',734,0,255,0,'','','',1),(789,'洗车液',0,'',734,0,255,0,'','','',1),(790,'车掸',0,'',734,0,255,0,'','','',1),(791,'擦车巾/海绵',0,'',734,0,255,0,'','','',1),(792,'凉垫',0,'',735,0,255,0,'','','',1),(793,'四季垫',0,'',735,0,255,0,'','','',1),(794,'毛垫',0,'',735,0,255,0,'','','',1),(795,'专车专用座垫',0,'',735,0,255,0,'','','',1),(796,'专车专用座套',0,'',735,0,255,0,'','','',1),(797,'通用座套',0,'',735,0,255,0,'','','',1),(798,'多功能垫',0,'',735,0,255,0,'','','',1),(799,'专车专用脚垫',0,'',735,0,255,0,'','','',1),(800,'通用脚垫',0,'',735,0,255,0,'','','',1),(801,'后备箱垫',0,'',735,0,255,0,'','','',1),(802,'车用香水',0,'',736,0,255,0,'','','',1),(803,'车用炭包',0,'',736,0,255,0,'','','',1),(804,'空气净化',0,'',736,0,255,0,'','','',1),(805,'颈枕/头枕',0,'',736,0,255,0,'','','',1),(806,'抱枕/腰靠',0,'',736,0,255,0,'','','',1),(807,'方向盘套',0,'',736,0,255,0,'','','',1),(808,'挂件',0,'',736,0,255,0,'','','',1),(809,'摆件',0,'',736,0,255,0,'','','',1),(810,'布艺软饰',0,'',736,0,255,0,'','','',1),(811,'功能用品',0,'',736,0,255,0,'','','',1),(812,'整理收纳',0,'',736,0,255,0,'','','',1),(813,'CD夹',0,'',736,0,255,0,'','','',1),(814,'儿童安全座椅',0,'',737,0,255,0,'','','',1),(815,'应急救援',0,'',737,0,255,0,'','','',1),(816,'汽修工具',0,'',737,0,255,0,'','','',1),(817,'自驾野营',0,'',737,0,255,0,'','','',1),(818,'自驾照明',0,'',737,0,255,0,'','','',1),(819,'保温箱',0,'',737,0,255,0,'','','',1),(820,'置物箱',0,'',737,0,255,0,'','','',1),(821,'车衣',0,'',737,0,255,0,'','','',1),(822,'遮阳挡雪挡',0,'',737,0,255,0,'','','',1),(823,'车锁地锁',0,'',737,0,255,0,'','','',1),(824,'摩托车装备',0,'',737,0,255,0,'','','',1),(825,'玩具乐器',0,'',0,0,255,0,'','','',1),(826,'适用年龄',0,'',825,0,255,0,'','','',1),(827,'遥控/电动',0,'',825,0,255,0,'','','',1),(828,'毛绒布艺',0,'',825,0,255,0,'','','',1),(829,'娃娃玩具',0,'',825,0,255,0,'','','',1),(830,'模型玩具',0,'',825,0,255,0,'','','',1),(831,'健身玩具',0,'',825,0,255,0,'','','',1),(832,'动漫玩具',0,'',825,0,255,0,'','','',1),(833,'益智玩具',0,'',825,0,255,0,'','','',1),(834,'积木拼插',0,'',825,0,255,0,'','','',1),(835,'DIY玩具',0,'',825,0,255,0,'','','',1),(836,'创意减压',0,'',825,0,255,0,'','','',1),(837,'乐器相关',0,'',825,0,255,0,'','','',1),(838,'0-6个月',0,'',826,0,255,0,'','','',1),(839,'6-12个月',0,'',826,0,255,0,'','','',1),(840,'1-3岁',0,'',826,0,255,0,'','','',1),(841,'3-6岁',0,'',826,0,255,0,'','','',1),(842,'6-14岁',0,'',826,0,255,0,'','','',1),(843,'14岁以上',0,'',826,0,255,0,'','','',1),(844,'遥控车',0,'',827,0,255,0,'','','',1),(845,'遥控飞机',0,'',827,0,255,0,'','','',1),(846,'遥控船',0,'',827,0,255,0,'','','',1),(847,'机器人/电动',0,'',827,0,255,0,'','','',1),(848,'轨道/助力',0,'',827,0,255,0,'','','',1),(849,'毛绒/布艺',0,'',828,0,255,0,'','','',1),(850,'靠垫/抱枕',0,'',828,0,255,0,'','','',1),(851,'芭比娃娃',0,'',829,0,255,0,'','','',1),(852,'卡通娃娃',0,'',829,0,255,0,'','','',1),(853,'智能娃娃',0,'',829,0,255,0,'','','',1),(854,'仿真模型',0,'',830,0,255,0,'','','',1),(855,'拼插模型',0,'',830,0,255,0,'','','',1),(856,'收藏爱好',0,'',830,0,255,0,'','','',1),(857,'炫舞毯',0,'',831,0,255,0,'','','',1),(858,'爬行垫/毯',0,'',831,0,255,0,'','','',1),(859,'户外玩具',0,'',831,0,255,0,'','','',1),(860,'戏水玩具',0,'',831,0,255,0,'','','',1),(861,'电影周边',0,'',832,0,255,0,'','','',1),(862,'卡通周边',0,'',832,0,255,0,'','','',1),(863,'网游周边',0,'',832,0,255,0,'','','',1),(864,'摇铃/床铃',0,'',833,0,255,0,'','','',1),(865,'健身架',0,'',833,0,255,0,'','','',1),(866,'早教启智',0,'',833,0,255,0,'','','',1),(867,'拖拉玩具',0,'',833,0,255,0,'','','',1),(868,'积木',0,'',834,0,255,0,'','','',1),(869,'拼图',0,'',834,0,255,0,'','','',1),(870,'磁力棒',0,'',834,0,255,0,'','','',1),(871,'立体拼插',0,'',834,0,255,0,'','','',1),(872,'手工彩泥',0,'',835,0,255,0,'','','',1),(873,'绘画工具',0,'',835,0,255,0,'','','',1),(874,'情景玩具',0,'',835,0,255,0,'','','',1),(875,'减压玩具',0,'',836,0,255,0,'','','',1),(876,'创意玩具',0,'',836,0,255,0,'','','',1),(877,'钢琴',0,'',837,0,255,0,'','','',1),(878,'电子琴',0,'',837,0,255,0,'','','',1),(879,'手风琴',0,'',837,0,255,0,'','','',1),(880,'吉他/贝斯',0,'',837,0,255,0,'','','',1),(881,'民族管弦乐器',0,'',837,0,255,0,'','','',1),(882,'西洋管弦乐',0,'',837,0,255,0,'','','',1),(883,'口琴/口风琴/竖笛',0,'',837,0,255,0,'','','',1),(884,'西洋打击乐器',0,'',837,0,255,0,'','','',1),(885,'各式乐器配件',0,'',837,0,255,0,'','','',1),(886,'电脑音乐',0,'',837,0,255,0,'','','',1),(887,'工艺礼品乐器',0,'',837,0,255,0,'','','',1),(888,'厨具',0,'',0,0,255,0,'','','',1),(889,'烹饪锅具',0,'',888,0,255,0,'','','',1),(890,'刀剪菜板',0,'',888,0,255,0,'','','',1),(891,'收纳保鲜',0,'',888,0,255,0,'','','',1),(892,'水具酒具',0,'',888,0,255,0,'','','',1),(893,'餐具',0,'',888,0,255,0,'','','',1),(895,'炒锅',0,'',889,0,255,0,'','','',1),(896,'煎锅',0,'',889,0,255,0,'','','',1),(897,'压力锅',0,'',889,0,255,0,'','','',1),(898,'蒸锅',0,'',889,0,255,0,'','','',1),(899,'汤锅',0,'',889,0,255,0,'','','',1),(900,'奶锅',0,'',889,0,255,0,'','','',1),(901,'套锅',0,'',889,0,255,0,'','','',1),(902,'煲类',0,'',889,0,255,0,'','','',1),(903,'水壶',0,'',889,0,255,0,'','','',1),(904,'厨用杂件',0,'',889,0,255,0,'','','',1),(905,'单刀',0,'',890,0,255,0,'','','',1),(906,'剪刀',0,'',890,0,255,0,'','','',1),(907,'套刀',0,'',890,0,255,0,'','','',1),(908,'砧板',0,'',890,0,255,0,'','','',1),(909,'刀具配件',0,'',890,0,255,0,'','','',1),(910,'保鲜盒',0,'',891,0,255,0,'','','',1),(911,'保鲜膜/袋',0,'',891,0,255,0,'','','',1),(912,'调料器皿',0,'',891,0,255,0,'','','',1),(913,'饭盒/提锅',0,'',891,0,255,0,'','','',1),(914,'塑料杯',0,'',892,0,255,0,'','','',1),(915,'运动水壶',0,'',892,0,255,0,'','','',1),(916,'玻璃杯',0,'',892,0,255,0,'','','',1),(917,'陶瓷杯',0,'',892,0,255,0,'','','',1),(918,'保温杯',0,'',892,0,255,0,'','','',1),(919,'保温壶',0,'',892,0,255,0,'','','',1),(920,'酒杯/套装',0,'',892,0,255,0,'','','',1),(921,'酒具配件',0,'',892,0,255,0,'','','',1),(922,'餐具套装',0,'',893,0,255,0,'','','',1),(923,'碗/碟/盘',0,'',893,0,255,0,'','','',1),(924,'筷勺/刀叉',0,'',893,0,255,0,'','','',1),(925,'一次性餐具',0,'',893,0,255,0,'','','',1),(935,'茶具/咖啡具',0,'',888,0,255,0,'','','',1),(936,'整套茶具',0,'',935,0,255,0,'','','',1),(937,'茶杯',0,'',935,0,255,0,'','','',1),(938,'茶壶',0,'',935,0,255,0,'','','',1),(939,'茶盘茶托',0,'',935,0,255,0,'','','',1),(940,'茶叶罐',0,'',935,0,255,0,'','','',1),(941,'茶具配件',0,'',935,0,255,0,'','','',1),(942,'茶宠摆件',0,'',935,0,255,0,'','','',1),(943,'咖啡具',0,'',935,0,255,0,'','','',1),(944,'其他',0,'',935,0,255,0,'','','',1),(959,'母婴用品',0,'',0,0,255,0,'','','',1),(960,'奶粉',0,'',959,0,255,0,'','','',1),(961,'营养辅食',0,'',959,0,255,0,'','','',1),(962,'尿裤湿巾',0,'',959,0,255,0,'','','',1),(963,'喂养用品',0,'',959,0,255,0,'','','',1),(964,'洗护用品',0,'',959,0,255,0,'','','',1),(965,'童车童床',0,'',959,0,255,0,'','','',1),(966,'服饰寝居',0,'',959,0,255,0,'','','',1),(967,'妈妈专区',0,'',959,0,255,0,'','','',1),(968,'品牌奶粉',0,'',960,0,255,0,'','','',1),(969,'妈妈奶粉',0,'',960,0,255,0,'','','',1),(970,'1段奶粉',0,'',960,0,255,0,'','','',1),(971,'2段奶粉',0,'',960,0,255,0,'','','',1),(972,'3段奶粉',0,'',960,0,255,0,'','','',1),(973,'4段奶粉',0,'',960,0,255,0,'','','',1),(974,'羊奶粉',0,'',960,0,255,0,'','','',1),(975,'特殊配方',0,'',960,0,255,0,'','','',1),(976,'成人奶粉',0,'',960,0,255,0,'','','',1),(977,'婴幼营养',0,'',961,0,255,0,'','','',1),(978,'初乳',0,'',961,0,255,0,'','','',1),(979,'米粉/菜粉',0,'',961,0,255,0,'','','',1),(980,'果泥/果汁',0,'',961,0,255,0,'','','',1),(981,'肉松/饼干',0,'',961,0,255,0,'','','',1),(982,'辅食',0,'',961,0,255,0,'','','',1),(983,'孕期营养',0,'',961,0,255,0,'','','',1),(984,'清火/开胃',0,'',961,0,255,0,'','','',1),(985,'面条/粥',0,'',961,0,255,0,'','','',1),(986,'品牌尿裤',0,'',962,0,255,0,'','','',1),(987,'新生儿',0,'',962,0,255,0,'','','',1),(988,'S号',0,'',962,0,255,0,'','','',1),(989,'M号',0,'',962,0,255,0,'','','',1),(990,'L号',0,'',962,0,255,0,'','','',1),(991,'XL/XXL号',0,'',962,0,255,0,'','','',1),(992,'裤型尿裤',0,'',962,0,255,0,'','','',1),(993,'湿巾',0,'',962,0,255,0,'','','',1),(994,'尿布/尿垫',0,'',962,0,255,0,'','','',1),(995,'成人尿裤',0,'',962,0,255,0,'','','',1),(996,'奶瓶',0,'',963,0,255,0,'','','',1),(997,'奶嘴',0,'',963,0,255,0,'','','',1),(998,'吸奶器',0,'',963,0,255,0,'','','',1),(999,'暖奶/消毒',0,'',963,0,255,0,'','','',1),(1000,'餐具',0,'',963,0,255,0,'','','',1),(1001,'水具',0,'',963,0,255,0,'','','',1),(1002,'牙胶/安抚',0,'',963,0,255,0,'','','',1),(1003,'辅助用品',0,'',963,0,255,0,'','','',1),(1004,'宝宝护肤',0,'',964,0,255,0,'','','',1),(1005,'洗浴用品',0,'',964,0,255,0,'','','',1),(1006,'洗发沐浴',0,'',964,0,255,0,'','','',1),(1007,'清洁用品',0,'',964,0,255,0,'','','',1),(1008,'护理用品',0,'',964,0,255,0,'','','',1),(1009,'妈妈护肤',0,'',964,0,255,0,'','','',1),(1010,'婴儿推车',0,'',965,0,255,0,'','','',1),(1011,'餐椅摇椅',0,'',965,0,255,0,'','','',1),(1012,'婴儿床',0,'',965,0,255,0,'','','',1),(1013,'学步车',0,'',965,0,255,0,'','','',1),(1014,'三轮车',0,'',965,0,255,0,'','','',1),(1015,'自行车',0,'',965,0,255,0,'','','',1),(1016,'电动车',0,'',965,0,255,0,'','','',1),(1017,'健身车',0,'',965,0,255,0,'','','',1),(1018,'安全座椅',0,'',965,0,255,0,'','','',1),(1019,'婴儿外出服',0,'',966,0,255,0,'','','',1),(1020,'婴儿内衣',0,'',966,0,255,0,'','','',1),(1021,'婴儿礼盒',0,'',966,0,255,0,'','','',1),(1022,'婴儿鞋帽袜',0,'',966,0,255,0,'','','',1),(1023,'安全防护',0,'',966,0,255,0,'','','',1),(1024,'家居床品',0,'',966,0,255,0,'','','',1),(1025,'其他',0,'',966,0,255,0,'','','',1),(1026,'包/背婴带',0,'',967,0,255,0,'','','',1),(1027,'妈妈护理',0,'',967,0,255,0,'','','',1),(1028,'产后塑身',0,'',967,0,255,0,'','','',1),(1029,'孕妇内衣',0,'',967,0,255,0,'','','',1),(1030,'防辐射服',0,'',967,0,255,0,'','','',1),(1031,'孕妇装',0,'',967,0,255,0,'','','',1),(1032,'孕妇食品',0,'',967,0,255,0,'','','',1),(1033,'妈妈美容',0,'',967,0,255,0,'','','',1),(1034,'手机通讯',0,'',256,0,255,0,'','','',1),(1035,'手机',0,'',1034,0,255,0,'','','',1),(1036,'对讲机',0,'',1034,0,255,0,'','','',1),(1037,'虚拟充值',0,'',0,0,255,1,'','','',1),(1041,'充值',0,'',1037,0,255,1,'','','',1),(1042,'游戏',0,'',1037,0,255,1,'','','',1),(1043,'票务',0,'',1037,0,255,1,'','','',1),(1044,'手机充值',0,'',1041,0,255,1,'','','',1),(1045,'游戏点卡',0,'',1042,0,255,1,'','','',1),(1046,'QQ充值',0,'',1042,0,255,1,'','','',1),(1047,'电影票',0,'',1043,0,255,1,'','','',1),(1048,'演唱会',0,'',1043,0,255,1,'','','',1),(1049,'话剧/歌剧/音乐剧',0,'',1043,0,255,1,'','','',1),(1050,'体育赛事',0,'',1043,0,255,1,'','','',1),(1051,'舞蹈芭蕾',0,'',1043,0,255,1,'','','',1),(1052,'戏曲综艺',0,'',1043,0,255,1,'','','',1),(1053,'女装',0,'',4,0,255,0,'','','',1),(1054,'整车',0,'',730,0,255,0,'','','',1),(1055,'新车',0,'',1054,0,255,0,'','','',1),(1056,'二手车',0,'',1054,0,255,0,'','','',1);
/*!40000 ALTER TABLE `te_goods_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_goods_class_nav`
--

DROP TABLE IF EXISTS `te_goods_class_nav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_goods_class_nav` (
  `cn_adv2_link` varchar(100) NOT NULL COMMENT '广告2链接',
  `gc_id` int(10) unsigned NOT NULL COMMENT '商品分类id',
  `cn_alias` varchar(100) DEFAULT '' COMMENT '商品分类别名',
  `cn_classids` varchar(100) DEFAULT '' COMMENT '推荐子级分类',
  `cn_brandids` varchar(100) DEFAULT '' COMMENT '推荐的品牌',
  `cn_pic` varchar(100) DEFAULT '' COMMENT '分类图片',
  `cn_adv1` varchar(100) DEFAULT '' COMMENT '广告图1',
  `cn_adv1_link` varchar(100) DEFAULT '' COMMENT '广告1链接',
  `cn_adv2` varchar(100) DEFAULT '' COMMENT '广告图2',
  PRIMARY KEY (`gc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分类导航表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_goods_class_nav`
--

LOCK TABLES `te_goods_class_nav` WRITE;
/*!40000 ALTER TABLE `te_goods_class_nav` DISABLE KEYS */;
INSERT INTO `te_goods_class_nav` VALUES ('',1,'','12,19,26,33,35,42,49,56','108,105,101,96,89,80,83,352','04849343852775378.png','04849383096194771.jpg','','04849383096284687.jpg'),('',2,'','156,163,168,170,186,192,193,198','342,341,336,335,334,330,329,328','04849344505821846.png','04849386427434184.jpg','','04849386427492123.jpg'),('',3,'','206,210,213,216,220,227,231','344,342,341,338,336,335,330,329','04849345975757419.png','04849387912371887.jpg','','04849387912422255.jpg'),('',256,'','278,279,398,399,437,1035,1036','215,214,208,202,196,190,184','04849346415545755.png','04849389240497918.jpg','','04849389240540796.jpg'),('',308,'','314,317,318,321,326,327,328,329','241,240,235,234,229,228,223,217','04849346837120218.png','04849391321812920.jpg','','04849391321877848.jpg'),('',470,'','478,479,485,486,490,491,497,498','142,136,135,130,128,124,123,117','04849347515759481.png','04849392722316549.jpg','','04849392722363907.jpg'),('',530,'','557,563,566,567,570,571,572,575,576','171,165,159,153,152,146,360,359','04849347913383394.png','04849399151585529.jpg','','04849399151680886.jpg'),('',593,'','605,617,623,629,630,632,636,637','264,263,258,257,252,251,246,245','04849348133390475.png','04849400285934568.jpg','','04849400285991819.jpg'),('',662,'','671,675,676,677,681,682,683,684,690','324,323,318,317,312,311,306,305','04849348436546686.png','04849401365781256.jpg','','04849401365834473.jpg'),('',730,'','738,740,744,746,752,753,754','241,240,234,228,227,222,221,216','04849348664379344.png','04849404510419498.jpg','','04849404510472921.jpg'),('',825,'','844,847,848,849,850,851,855,857','344,343,338,337,332,331,326,148','04849352366294406.png','04849405508671552.jpg','','04849405508723529.jpg'),('',888,'','895,902,918,936,939,942,943','322,321,316,315,310,309,304,303','04849352648636017.png','04849408123501895.jpg','','04849408123559604.jpg'),('',959,'','968,970,975,981,982,986,994,996','302,301,296,295,290,284,278,272','04849353182209090.png','04849409796241200.jpg','','04849409796289293.jpg'),('',1037,'','1044,1047,1048,1049,1050,1051,1052','244,243,242','04849353042725089.png','04849412911666956.jpg','','04849412911723098.jpg');
/*!40000 ALTER TABLE `te_goods_class_nav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_goods_class_staple`
--

DROP TABLE IF EXISTS `te_goods_class_staple`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_goods_class_staple` (
  `staple_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '常用分类id',
  `staple_name` varchar(255) NOT NULL COMMENT '常用分类名称',
  `gc_id_1` int(10) unsigned NOT NULL COMMENT '一级分类id',
  `gc_id_2` int(10) unsigned NOT NULL COMMENT '二级商品分类',
  `gc_id_3` int(10) unsigned NOT NULL COMMENT '三级商品分类',
  `type_id` int(10) unsigned NOT NULL COMMENT '类型id',
  `member_id` int(10) unsigned NOT NULL COMMENT '会员id',
  `counter` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '计数器',
  PRIMARY KEY (`staple_id`),
  KEY `store_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺常用分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_goods_class_staple`
--

LOCK TABLES `te_goods_class_staple` WRITE;
/*!40000 ALTER TABLE `te_goods_class_staple` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_goods_class_staple` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_goods_class_tag`
--

DROP TABLE IF EXISTS `te_goods_class_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_goods_class_tag` (
  `gc_tag_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'TAGid',
  `gc_id_1` int(10) unsigned NOT NULL COMMENT '一级分类id',
  `gc_id_2` int(10) unsigned NOT NULL COMMENT '二级分类id',
  `gc_id_3` int(10) unsigned NOT NULL COMMENT '三级分类id',
  `gc_tag_name` varchar(255) NOT NULL COMMENT '分类TAG名称',
  `gc_tag_value` text NOT NULL COMMENT '分类TAG值',
  `gc_id` int(10) unsigned NOT NULL COMMENT '商品分类id',
  `type_id` int(10) unsigned NOT NULL COMMENT '类型id',
  PRIMARY KEY (`gc_tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品分类TAG表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_goods_class_tag`
--

LOCK TABLES `te_goods_class_tag` WRITE;
/*!40000 ALTER TABLE `te_goods_class_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_goods_class_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_goods_common`
--

DROP TABLE IF EXISTS `te_goods_common`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_goods_common` (
  `goods_commonid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品公共表id',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称',
  `goods_jingle` varchar(150) DEFAULT '' COMMENT '商品广告词',
  `gc_id` int(10) unsigned NOT NULL COMMENT '商品分类',
  `gc_id_1` int(10) unsigned NOT NULL COMMENT '一级分类id',
  `gc_id_2` int(10) unsigned NOT NULL COMMENT '二级分类id',
  `gc_id_3` int(10) unsigned NOT NULL COMMENT '三级分类id',
  `gc_name` varchar(200) NOT NULL COMMENT '商品分类',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺id',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `spec_name` varchar(255) NOT NULL COMMENT '规格名称',
  `spec_value` text NOT NULL COMMENT '规格值',
  `brand_id` int(10) unsigned DEFAULT '0' COMMENT '品牌id',
  `brand_name` varchar(100) DEFAULT '' COMMENT '品牌名称',
  `type_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '类型id',
  `goods_image` varchar(100) NOT NULL COMMENT '商品主图',
  `goods_attr` text NOT NULL COMMENT '商品属性',
  `goods_custom` text NOT NULL COMMENT '商品自定义属性',
  `goods_body` text NOT NULL COMMENT '商品内容',
  `mobile_body` text NOT NULL COMMENT '手机端商品描述',
  `goods_state` tinyint(3) unsigned NOT NULL COMMENT '商品状态 0下架，1正常，10违规（禁售）',
  `goods_stateremark` varchar(255) DEFAULT NULL COMMENT '违规原因',
  `goods_verify` tinyint(3) unsigned NOT NULL COMMENT '商品审核 1通过，0未通过，10审核中',
  `goods_verifyremark` varchar(255) DEFAULT NULL COMMENT '审核失败原因',
  `goods_lock` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '商品锁定 0未锁，1已锁',
  `goods_addtime` int(10) unsigned NOT NULL COMMENT '商品添加时间',
  `goods_selltime` int(10) unsigned NOT NULL COMMENT '上架时间',
  `goods_price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `goods_marketprice` decimal(10,2) NOT NULL COMMENT '市场价',
  `goods_costprice` decimal(10,2) NOT NULL COMMENT '成本价',
  `goods_discount` float unsigned NOT NULL COMMENT '折扣',
  `goods_serial` varchar(50) DEFAULT '' COMMENT '商品货号',
  `goods_storage_alarm` tinyint(3) unsigned NOT NULL COMMENT '库存报警值',
  `goods_barcode` varchar(20) DEFAULT '' COMMENT '商品条形码',
  `transport_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '运费模板',
  `transport_title` varchar(60) DEFAULT '' COMMENT '运费模板名称',
  `goods_commend` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '商品推荐 1是，0否，默认为0',
  `goods_freight` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '运费 0为免运费',
  `goods_vat` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否开具增值税发票 1是，0否',
  `areaid_1` int(10) unsigned NOT NULL COMMENT '一级地区id',
  `areaid_2` int(10) unsigned NOT NULL COMMENT '二级地区id',
  `areaid_3` int(10) unsigned NOT NULL COMMENT '三级地区id',
  `goods_stcids` varchar(255) DEFAULT '' COMMENT '店铺分类id 首尾用,隔开',
  `plateid_top` int(10) unsigned DEFAULT NULL COMMENT '顶部关联板式',
  `plateid_bottom` int(10) unsigned DEFAULT NULL COMMENT '底部关联板式',
  `is_virtual` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否为虚拟商品 1是，0否',
  `virtual_indate` int(10) unsigned DEFAULT NULL COMMENT '虚拟商品有效期',
  `virtual_limit` tinyint(3) unsigned DEFAULT NULL COMMENT '虚拟商品购买上限',
  `virtual_invalid_refund` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否允许过期退款， 1是，0否',
  `sup_id` int(11) NOT NULL COMMENT '供应商id',
  `is_own_shop` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否为平台自营',
  PRIMARY KEY (`goods_commonid`)
) ENGINE=InnoDB AUTO_INCREMENT=100000 DEFAULT CHARSET=utf8 COMMENT='商品公共内容表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_goods_common`
--

LOCK TABLES `te_goods_common` WRITE;
/*!40000 ALTER TABLE `te_goods_common` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_goods_common` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_goods_fcode`
--

DROP TABLE IF EXISTS `te_goods_fcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_goods_fcode` (
  `fc_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'F码id',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品sku',
  `fc_code` varchar(20) NOT NULL COMMENT 'F码',
  `fc_state` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态 0未使用，1已使用',
  PRIMARY KEY (`fc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品F码';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_goods_fcode`
--

LOCK TABLES `te_goods_fcode` WRITE;
/*!40000 ALTER TABLE `te_goods_fcode` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_goods_fcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_goods_gift`
--

DROP TABLE IF EXISTS `te_goods_gift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_goods_gift` (
  `gift_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '赠品id ',
  `goods_id` int(10) unsigned NOT NULL COMMENT '主商品id',
  `goods_commonid` int(10) unsigned NOT NULL COMMENT '主商品公共id',
  `gift_goodsid` int(10) unsigned NOT NULL COMMENT '赠品商品id ',
  `gift_goodsname` varchar(50) NOT NULL COMMENT '主商品名称',
  `gift_goodsimage` varchar(100) NOT NULL COMMENT '主商品图片',
  `gift_amount` tinyint(3) unsigned NOT NULL COMMENT '赠品数量',
  PRIMARY KEY (`gift_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品赠品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_goods_gift`
--

LOCK TABLES `te_goods_gift` WRITE;
/*!40000 ALTER TABLE `te_goods_gift` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_goods_gift` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_goods_images`
--

DROP TABLE IF EXISTS `te_goods_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_goods_images` (
  `goods_image_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品图片id',
  `goods_commonid` int(10) unsigned NOT NULL COMMENT '商品公共内容id',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺id',
  `color_id` int(10) unsigned NOT NULL COMMENT '颜色规格值id',
  `goods_image` varchar(1000) NOT NULL COMMENT '商品图片',
  `goods_image_sort` tinyint(3) unsigned NOT NULL COMMENT '排序',
  `is_default` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '默认主题，1是，0否',
  PRIMARY KEY (`goods_image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品图片';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_goods_images`
--

LOCK TABLES `te_goods_images` WRITE;
/*!40000 ALTER TABLE `te_goods_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_goods_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_goods_recommend`
--

DROP TABLE IF EXISTS `te_goods_recommend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_goods_recommend` (
  `rec_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rec_gc_id` mediumint(9) DEFAULT NULL COMMENT '最底级商品分类ID',
  `rec_goods_id` int(11) DEFAULT NULL COMMENT '商品goods_id',
  `rec_gc_name` varchar(150) DEFAULT NULL COMMENT '商品分类名称',
  PRIMARY KEY (`rec_id`),
  KEY `rec_gc_id` (`rec_gc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品推荐表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_goods_recommend`
--

LOCK TABLES `te_goods_recommend` WRITE;
/*!40000 ALTER TABLE `te_goods_recommend` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_goods_recommend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_groupbuy`
--

DROP TABLE IF EXISTS `te_groupbuy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_groupbuy` (
  `groupbuy_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '抢购ID',
  `groupbuy_name` varchar(255) NOT NULL COMMENT '活动名称',
  `start_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `goods_commonid` int(10) unsigned NOT NULL COMMENT '商品公共表ID',
  `goods_name` varchar(200) NOT NULL COMMENT '商品名称',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `goods_price` decimal(10,2) NOT NULL COMMENT '商品原价',
  `groupbuy_price` decimal(10,2) NOT NULL COMMENT '抢购价格',
  `groupbuy_rebate` decimal(10,2) NOT NULL COMMENT '折扣',
  `virtual_quantity` int(10) unsigned NOT NULL COMMENT '虚拟购买数量',
  `upper_limit` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '购买上限',
  `buyer_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '已购买人数',
  `buy_quantity` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '购买数量',
  `groupbuy_intro` text COMMENT '本团介绍',
  `state` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '抢购状态 10-审核中 20-正常 30-审核失败 31-管理员关闭 32-已结束',
  `recommended` tinyint(1) unsigned NOT NULL COMMENT '是否推荐 0.未推荐 1.已推荐',
  `views` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '查看次数',
  `class_id` int(10) unsigned NOT NULL COMMENT '抢购类别编号',
  `s_class_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '抢购2级分类id',
  `groupbuy_image` varchar(100) NOT NULL COMMENT '抢购图片',
  `groupbuy_image1` varchar(100) DEFAULT NULL COMMENT '抢购图片1',
  `remark` varchar(255) DEFAULT '' COMMENT '备注',
  `is_vr` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否虚拟抢购 1是0否',
  `vr_city_id` int(11) DEFAULT NULL COMMENT '虚拟抢购城市id',
  `vr_area_id` int(11) DEFAULT NULL COMMENT '虚拟抢购区域id',
  `vr_mall_id` int(11) DEFAULT NULL COMMENT '虚拟抢购商区id',
  `vr_class_id` int(11) DEFAULT NULL COMMENT '虚拟抢购大分类id',
  `vr_s_class_id` int(11) DEFAULT NULL COMMENT '虚拟抢购小分类id',
  PRIMARY KEY (`groupbuy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='抢购商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_groupbuy`
--

LOCK TABLES `te_groupbuy` WRITE;
/*!40000 ALTER TABLE `te_groupbuy` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_groupbuy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_groupbuy_class`
--

DROP TABLE IF EXISTS `te_groupbuy_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_groupbuy_class` (
  `class_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '类别编号',
  `class_name` varchar(20) NOT NULL COMMENT '类别名称',
  `class_parent_id` int(10) unsigned NOT NULL COMMENT '父类别编号',
  `sort` tinyint(1) unsigned NOT NULL COMMENT '排序',
  `deep` tinyint(1) unsigned DEFAULT '0' COMMENT '深度',
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='抢购类别表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_groupbuy_class`
--

LOCK TABLES `te_groupbuy_class` WRITE;
/*!40000 ALTER TABLE `te_groupbuy_class` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_groupbuy_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_groupbuy_price_range`
--

DROP TABLE IF EXISTS `te_groupbuy_price_range`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_groupbuy_price_range` (
  `range_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '价格区间编号',
  `range_name` varchar(20) NOT NULL COMMENT '区间名称',
  `range_start` int(10) unsigned NOT NULL COMMENT '区间下限',
  `range_end` int(10) unsigned NOT NULL COMMENT '区间上限',
  PRIMARY KEY (`range_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='抢购价格区间表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_groupbuy_price_range`
--

LOCK TABLES `te_groupbuy_price_range` WRITE;
/*!40000 ALTER TABLE `te_groupbuy_price_range` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_groupbuy_price_range` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_groupbuy_quota`
--

DROP TABLE IF EXISTS `te_groupbuy_quota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_groupbuy_quota` (
  `quota_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '抢购套餐编号',
  `member_id` int(10) unsigned NOT NULL COMMENT '用户编号',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺编号',
  `member_name` varchar(50) NOT NULL COMMENT '用户名',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `start_time` int(10) unsigned NOT NULL COMMENT '套餐开始时间',
  `end_time` int(10) unsigned NOT NULL COMMENT '套餐结束时间',
  PRIMARY KEY (`quota_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='抢购套餐表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_groupbuy_quota`
--

LOCK TABLES `te_groupbuy_quota` WRITE;
/*!40000 ALTER TABLE `te_groupbuy_quota` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_groupbuy_quota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_help`
--

DROP TABLE IF EXISTS `te_help`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_help` (
  `help_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '帮助ID',
  `help_sort` tinyint(1) unsigned DEFAULT '255' COMMENT '排序',
  `help_title` varchar(100) NOT NULL COMMENT '标题',
  `help_info` text COMMENT '帮助内容',
  `help_url` varchar(100) DEFAULT '' COMMENT '跳转链接',
  `update_time` int(10) unsigned NOT NULL COMMENT '更新时间',
  `type_id` int(10) unsigned NOT NULL COMMENT '帮助类型',
  `page_show` tinyint(1) unsigned DEFAULT '1' COMMENT '页面类型:1为店铺,2为会员,默认为1',
  PRIMARY KEY (`help_id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8 COMMENT='帮助内容表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_help`
--

LOCK TABLES `te_help` WRITE;
/*!40000 ALTER TABLE `te_help` DISABLE KEYS */;
INSERT INTO `te_help` VALUES (96,1,'入驻流程','<div class=\"right\">\r\n        <ul class=\"right-top\">\r\n                <li class=\"single\">\r\n                        <p class=\"first\">\r\n                                了解入驻相关要求\r\n                        </p>\r\n                </li>\r\n                <li class=\"double\">\r\n                        <span>入驻标准</span> \r\n                </li>\r\n                <li class=\"single\">\r\n                        <p>\r\n                                入驻申请\r\n                        </p>\r\n                </li>\r\n                <li class=\"double\">\r\n                        <span>马上入驻</span> \r\n                </li>\r\n                <li class=\"single\">\r\n                        <p>\r\n                                等待审核\r\n                        </p>\r\n                </li>\r\n                <li class=\"double\">\r\n                        <span>查看审核进度</span> \r\n                </li>\r\n                <li class=\"single\">\r\n                        <p>\r\n                                入驻成功\r\n                        </p>\r\n                </li>\r\n        </ul>\r\n        <div class=\"t-1\">\r\n                <p class=\"title\">\r\n                        注册本站账号\r\n                </p>\r\n                <p>\r\n                        点击网站右上方的“免费注册”按钮进行注册，成为本站会员\r\n                </p>\r\n        </div>\r\n        <div class=\"bg-icon\">\r\n        </div>\r\n        <div class=\"t-2\">\r\n                <p class=\"title\">\r\n                        基本资料填写\r\n                </p>\r\n                <p>\r\n                        进入“商家中心”，点击“立即入驻”即可进行资料填写\r\n                </p>\r\n        </div>\r\n        <div class=\"bg-icon\">\r\n        </div>\r\n        <div class=\"t-3\">\r\n                <p class=\"title\">\r\n                        资质证明上传\r\n                </p>\r\n                <p>\r\n                        将营业执照原件的彩色扫描件（或彩照形式）及盖公章的申请人身份证正反面复印件上传\r\n                </p>\r\n        </div>\r\n        <div class=\"bg-icon\">\r\n        </div>\r\n        <div class=\"t-4\">\r\n                <p class=\"title\">\r\n                        等候审核\r\n                </p>\r\n                <p>\r\n                        本站会在3个工作日内审核您的入驻申请\r\n                </p>\r\n        </div>\r\n        <div class=\"bg-icon\">\r\n        </div>\r\n        <div class=\"t-5\">\r\n                <p class=\"title\">\r\n                        签署协议\r\n                </p>\r\n                <p>\r\n                        审核通过后即可在线签署《神爸入驻合同》\r\n                </p>\r\n        </div>\r\n        <div class=\"bg-icon\">\r\n        </div>\r\n        <div class=\"t-6\">\r\n                <p class=\"title\">\r\n                        提交保证金\r\n                </p>\r\n                <p>\r\n                        商家在活动上线前须交纳 ¥10000 元商品质量和服务保证金\r\n                </p>\r\n                <p>\r\n                        数码类目商家保证金为 ¥50000（等其他类目\r\n                </p>\r\n                <p>\r\n                        $8500，手续费需自行承担）\r\n                </p>\r\n        </div>\r\n</div>','',1455720010,1,1),(97,2,'招商标准','<div class=\"text\">\r\n	<p>\r\n		<span>1</span>商家需具有一般纳税人或者小额纳税人资质；注册资本50万元及以上。\r\n	</p>\r\n</div>\r\n<div class=\"text\">\r\n	<p class=\"more\">\r\n		<span>2</span>我们接受各行业有一定知名度的品牌入驻，入驻企业须是品牌所有者或授权渠道商，并且确保所提供的商品\r\n          为品牌正品，价格足够有竞争力。\r\n	</p>\r\n</div>\r\n<div class=\"text\">\r\n	<span>3</span>入驻商家经营类目需是以下类目的一种或几种 <span class=\"sign\">箱包</span> <span class=\"sign\">服饰</span> <span class=\"sign\">电器</span> <span class=\"sign\">家居</span> <span class=\"sign\">办公</span> \r\n</div>\r\n<div class=\"text last-text\">\r\n	<p>\r\n		<span>4</span>入驻商家成立时间需大于1年，即商家营业执照有效期起始时间至商家提交入驻审核时间大于1年。\r\n	</p>\r\n</div>\r\n<div class=\"c-request\">\r\n	<div class=\"title\">\r\n		<span></span>公司资质要求\r\n	</div>\r\n	<table>\r\n		<tbody>\r\n			<tr>\r\n				<td class=\"col1\">\r\n					证件名称\r\n				</td>\r\n				<td>\r\n					资质要求\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n		<tbody>\r\n			<tr>\r\n				<td class=\"col1\">\r\n					1.营业执照\r\n				</td>\r\n				<td>\r\n					必须具有法人资格，如为分支机构不具有法人资格的需提供总公司营业执照及其授权书；\r\n                    完成有效年检，复印件需加盖公司公章。 \r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td class=\"col1\">\r\n					2.税务登记证\r\n				</td>\r\n				<td>\r\n					国税、地税均可，复印件需加盖公司公章。 \r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td class=\"col1\">\r\n					3.组织机构代码证\r\n				</td>\r\n				<td>\r\n					复印件需加盖公司公章。 \r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td class=\"col1\">\r\n					4.法人身份证\r\n				</td>\r\n				<td>\r\n					需提供法人正反面身份证扫描件或复印件，并加盖公司公章。 \r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div class=\"b-request\">\r\n	<div class=\"title\">\r\n		<span></span>品牌资质要求\r\n	</div>\r\n	<table>\r\n		<tbody>\r\n			<tr>\r\n				<td class=\"col1\">\r\n					证件名称\r\n				</td>\r\n				<td>\r\n					资质要求\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n		<tbody>\r\n			<tr>\r\n				<td class=\"col1\">\r\n					1.商标注册证\r\n				</td>\r\n				<td>\r\n					需提供有效期内的商标注册证，仅接受R标。\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td class=\"col1\">\r\n					2.品牌授权书\r\n				</td>\r\n				<td>\r\n					若品牌申请人为代理商，需提供满足以下条件的品牌授权书：\r\n					<p>\r\n						(1) 需授权在本站销售\r\n					</p>\r\n					<p>\r\n						(2) 授权书需注明授权期限、落款\r\n					</p>\r\n					<p>\r\n						(3) 若商标注册人是个人，需提供商标注册人身份证正反面复印件\r\n					</p>\r\n					<p>\r\n						(4) 需要确保授权链条的完整，即申请入驻企业拿到的授权能够逐级逆推回品牌商。\r\n					</p>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td class=\"col1\">\r\n					3.质检报告或3C认证证书\r\n				</td>\r\n				<td>\r\n					每个品牌须提供一份由权威质检机构出具的最近2年内的质检报告\r\n或者有效期内的3C认证证书。\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td class=\"col1\">\r\n					4.报关单和检验检疫证明\r\n				</td>\r\n				<td>\r\n					若为进口产品，须提交近一年内海关进口报关单和检验检疫合格证明\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>','',1455720054,1,1),(98,3,'合作细则','<div class=\"fee\">\r\n        <div class=\"title\">\r\n                <span></span>收费标准\r\n        </div>\r\n        <p>\r\n                *本站于2015年2月1日起，邀请部分品牌商家体验平台合作，暂时不收佣金。\r\n        </p>\r\n        <p>\r\n                *本站有权根据市场情况及自身经营情况调整佣金比例，但调整需至少提前30天通知商家。\r\n        </p>\r\n</div>\r\n<div class=\"fee-rule\">\r\n        <div class=\"title\">\r\n                <span></span>保证金\r\n        </div>\r\n        <p>\r\n                *商家在本站参与抢购活动必须交商品质量服务保证金（保证金主要用于保证商家按照神爸网的规则进行抢购活动，并且在商家有违规行为时\r\n根据相关规则用于向本站及消费者支付违约金）。\r\n        </p>\r\n        <p>\r\n                *商家在申请入驻获得批准时需一次性缴纳保证金，统一为人民币壹万元，食品类目商家、海外购国内商家为伍万元人民币（海外购国外商家需\r\n缴纳捌仟伍佰元美元，手续费需自行承担）\r\n        </p>\r\n        <p>\r\n                *本站有权根据商家的业务变化及实际违约赔付情况通知商家调整保证金金额，商家应在收到本站通知后的10天内补足保证金，如果没有及\r\n时补足保证金金额的，本站有权中止合作。\r\n        </p>\r\n        <p>\r\n                *由于保证金并非本站收取的费用，一直存在于您的本站企业账户中做冻结，所以不提供收据或发票，敬请谅解。\r\n        </p>\r\n        <p>\r\n                *商家如果要退出本站，终止合作，可以向本站提出保证金退还申请，本站审核通过后会在1个月内将保证金解冻至商家的本站账户内。\r\n商家同意该保证金不计算利息。\r\n        </p>\r\n        <p>\r\n                *商家有违规行为时，如根据相关规则需从已冻结保证金中支付违约金的，本站根据商家申请，按照商家实际支付金额向商家开具合法票据。\r\n开具日期为商家提交申请后的15个工作日内。\r\n        </p>\r\n        <p>\r\n                *因资质造假被清退的商家将不返还保证金，因违规行为扣取的保证金不返还，具体保证金扣取情况参见《本站合作商家违规处罚管理规定》。\r\n        </p>\r\n        <p>\r\n                *本站将根据国家经济情况、市场状况及神爸网经营情况适时适当调整保证金制度。保证金制度的调整会提前1个月公布并通知所有商家。\r\n        </p>\r\n</div>\r\n<div class=\"fee services\">\r\n        <div class=\"title\">\r\n                <span></span>48小时发货服务\r\n        </div>\r\n        <p>\r\n                *您的订单将在付款后48小时内发货。\r\n        </p>\r\n</div>\r\n<div class=\"fee baoyou\">\r\n        <div class=\"title\">\r\n                <span></span>全场包邮\r\n        </div>\r\n        <p>\r\n                *配送：本站支持偏远地区除外的下单即包邮（偏远地区包括新疆、西藏、内蒙古、宁夏、青海），特定地区按每笔最小订单加收25元运费，\r\n部分类目（一般指大件商品）因供应商原因不支持包邮送货。\r\n        </p>\r\n</div>\r\n<div class=\"fee qianshou\">\r\n        <div class=\"title\">\r\n                <span></span>验货签收\r\n        </div>\r\n        <p>\r\n                *货物当面交付的，收货人接受货物后，视为对表面一致的确认；\r\n收货人不能亲自签收，委托第三人签收时，第三人应当提供收货人的授权文件并出示收货人及第三人本人身份证原件。\r\n        </p>\r\n        <p>\r\n                对于需要先签收再打开包装查看的货物，收货人应当要求承运人当场监督并打开包装查看。如发现表面不一致，应当直接退货或者要求在签收单\r\n（收货人联和承运人联）上加注详细情况并让承运人签字确认。\r\n        </p>\r\n        <p>\r\n                收货人签字确认表面一致后，不得就表面一致的问题提出异议并要求退款。但如收货人能够提供相关证据，如物流公司证明商品签收时即存在表面\r\n一致问题的除外。\r\n        </p>\r\n        <p>\r\n                表面一致的定义：表面一致指凭肉眼或简单计量工具即可判断所收到的货物表面状况良好且与网页上的商品图片或者文字描述一致。表面一致的判\r\n断范围可参考但不限于货物的形状、大小、重量、颜色、型号、新旧程度。\r\n        </p>\r\n</div>\r\n<div class=\"fee meiliyou\">\r\n        <div class=\"title\">\r\n                <span></span>15天无理由退货服务\r\n        </div>\r\n        <h3>\r\n                一、15天无理由退货\r\n        </h3>\r\n        <p>\r\n                *本站郑重承诺：如商品未经使用或穿着，商品及外包装保持出售时的原状，商品吊牌及配件齐全，将享受15天无理由退货服务。即如果您对商\r\n品不满意，在不影响二次销售的前提下，可在收货后15天之内申请无理由退货。退回运费由您自行承担。\r\n退货金额将在供应商确认收货1个工作日内退至您的本站账户\r\n        </p>\r\n        <p>\r\n                *温馨提示：以下情况均不享受15天无理由退货服务\r\n        </p>\r\n        <p>\r\n                1、任何非本站出售的商品；\r\n        </p>\r\n        <p>\r\n                2、申请退货日期距商品签收日期超过7天的；\r\n        </p>\r\n        <p>\r\n                3、任何因非正常使用、保管或买家个人原因造成商品损坏的，包括但不限于自行修改尺寸，洗涤，皮具表面刮花、打油，刺绣，水洗、碰酸、碱、\r\n     油或者触硬物，雨天穿着，长时间穿着等；\r\n        </p>\r\n        <p>\r\n                4、未经网上申请，自行寄回至本站或供应商仓库的；\r\n        </p>\r\n        <p>\r\n                5、使用快递到付、平邮或未将商品寄至正确地址的；\r\n        </p>\r\n        <p>\r\n                6、鉴于食品安全问题，食品类商品不支持无理由退货；\r\n        </p>\r\n        <p>\r\n                7、海外购某些特殊情况不办理退货的，但仍可与商家协商；\r\n        </p>\r\n        <h3>\r\n                二、退货运费条款\r\n        </h3>\r\n        <p>\r\n                （一）15天无理由退货产生的运费由买家承担\r\n        </p>\r\n        <p>\r\n                （二）由于商品问题导致的退货，本站将提供运费补贴。同省补贴不超过10元，非同省不超过20元，特定地区不超过25元（特定地区指：新疆、\r\n          西藏、内蒙古、宁夏、青海）。\r\n        </p>\r\n        <p>\r\n                （三）、本站是限时抢购模式，商品在线时间均不超过7天，不支持换货。\r\n        </p>\r\n</div>\r\n<div class=\"fee tuihuo\">\r\n        <div class=\"title\">\r\n                <span></span>退货流程\r\n        </div>\r\n        <p>\r\n                第一步，申请退货：进入“我的神爸—我的订单”找到对应的订单，点击“售后”，填写及上传相关的信息提交退货申请。\r\n        </p>\r\n        <p>\r\n                第二步，本站审核：退货申请提交后，本站将对售后理由、图片凭证进行审核。\r\n        </p>\r\n        <p>\r\n                第三步，寄回商品：审核通过后，根据页面的退货地址退货商品，并填写有效的退货物流单号（部分退货原因无需此操作）\r\n        </p>\r\n        <p>\r\n                第四步，供应商签收：供应商签收商品后，同意退款申请。\r\n        </p>\r\n        <p>\r\n                第五步，退款完成：退款款项将在1个工作日内打款至神爸网账户。\r\n        </p>\r\n</div>\r\n<div class=\"fee peifu\">\r\n        <div class=\"title\">\r\n                <span></span>非正品赔付\r\n        </div>\r\n        <p>\r\n                本站承诺，在线销售的所有商品均为品牌正品。您在本站购买的每件商品，均由中国人民财产保险公司（PICC）承保。如您对商品是否正品\r\n存在怀疑，可到品牌专柜或有资质的机构进行鉴定，并及时通知神爸网。如鉴定结果为非正品，请提供相关证明，并在收件后90天内申请赔付。\r\n本站将按商品实付金额的三倍进行赔偿。\r\n        </p>\r\n</div>','',1455720086,1,1),(99,4,'合作品牌','<div class=\"brand_img\">\r\n	<img alt=\"image\" src=\"../data/upload/shop/article/help_store_05090420267966612.png\" /> \r\n</div>','',1455720125,1,1),(101,155,'签署入驻协议','签署入驻协议','',143549932,99,1),(102,156,'商家信息提交','商家信息提交','',143549961,99,1),(103,157,'平台审核资质','平台审核资质','',143549991,99,1),(104,158,'商家缴纳费用','商家缴纳费用','',143550031,99,1),(105,159,'店铺开通','店铺开通','',143550076,99,1),(106,255,'商品发布规则','商品发布规则','',143550396,91,1),(107,255,'商品规格及属性','商品规格及属性','',143550481,92,1),(108,255,'限时折扣说明','限时折扣说明','',143550523,93,1),(109,255,'订单商品退款','订单商品退款','',143550670,94,1),(110,255,'续约流程及费用','续约流程及费用','',143550739,95,1);
/*!40000 ALTER TABLE `te_help` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_help_type`
--

DROP TABLE IF EXISTS `te_help_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_help_type` (
  `type_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '类型ID',
  `type_name` varchar(50) NOT NULL COMMENT '类型名称',
  `type_sort` tinyint(1) unsigned DEFAULT '255' COMMENT '排序',
  `help_code` varchar(10) DEFAULT 'auto' COMMENT '调用编号(auto的可删除)',
  `help_show` tinyint(1) unsigned DEFAULT '1' COMMENT '是否显示,0为否,1为是,默认为1',
  `page_show` tinyint(1) unsigned DEFAULT '1' COMMENT '页面类型:1为店铺,2为会员,默认为1',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='帮助类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_help_type`
--

LOCK TABLES `te_help_type` WRITE;
/*!40000 ALTER TABLE `te_help_type` DISABLE KEYS */;
INSERT INTO `te_help_type` VALUES (91,'规则体系',91,'sys_rules',1,1),(92,'商品管理',92,'sys_goods',1,1),(93,'促销方式',93,'sys_sales',1,1),(94,'订单及售后',94,'sys_order',1,1),(95,'店铺续约',95,'sys_renew',1,1),(99,'入驻流程',99,'store_in',1,1);
/*!40000 ALTER TABLE `te_help_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_inform`
--

DROP TABLE IF EXISTS `te_inform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_inform` (
  `inform_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '举报id',
  `inform_member_id` int(11) NOT NULL COMMENT '举报人id',
  `inform_member_name` varchar(50) NOT NULL COMMENT '举报人会员名',
  `inform_goods_id` int(11) NOT NULL COMMENT '被举报的商品id',
  `inform_goods_name` varchar(100) NOT NULL COMMENT '被举报的商品名称',
  `inform_subject_id` int(11) NOT NULL COMMENT '举报主题id',
  `inform_subject_content` varchar(50) NOT NULL COMMENT '举报主题',
  `inform_content` varchar(100) NOT NULL COMMENT '举报信息',
  `inform_pic1` varchar(100) DEFAULT NULL COMMENT '图片1',
  `inform_pic2` varchar(100) DEFAULT NULL COMMENT '图片2',
  `inform_pic3` varchar(100) DEFAULT NULL COMMENT '图片3',
  `inform_datetime` int(11) NOT NULL COMMENT '举报时间',
  `inform_store_id` int(11) NOT NULL COMMENT '被举报商品的店铺id',
  `inform_state` tinyint(4) NOT NULL COMMENT '举报状态(1未处理/2已处理)',
  `inform_handle_type` tinyint(4) NOT NULL COMMENT '举报处理结果(1无效举报/2恶意举报/3有效举报)',
  `inform_handle_message` varchar(100) DEFAULT '' COMMENT '举报处理信息',
  `inform_handle_datetime` int(11) DEFAULT '0' COMMENT '举报处理时间',
  `inform_handle_member_id` int(11) DEFAULT '0' COMMENT '管理员id',
  `inform_goods_image` varchar(150) DEFAULT NULL COMMENT '商品图',
  `inform_store_name` varchar(100) DEFAULT NULL COMMENT '店铺名',
  PRIMARY KEY (`inform_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='举报表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_inform`
--

LOCK TABLES `te_inform` WRITE;
/*!40000 ALTER TABLE `te_inform` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_inform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_inform_subject`
--

DROP TABLE IF EXISTS `te_inform_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_inform_subject` (
  `inform_subject_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '举报主题id',
  `inform_subject_content` varchar(100) NOT NULL COMMENT '举报主题内容',
  `inform_subject_type_id` int(11) NOT NULL COMMENT '举报类型id',
  `inform_subject_type_name` varchar(50) NOT NULL COMMENT '举报类型名称 ',
  `inform_subject_state` tinyint(11) NOT NULL COMMENT '举报主题状态(1可用/2失效)',
  PRIMARY KEY (`inform_subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='举报主题表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_inform_subject`
--

LOCK TABLES `te_inform_subject` WRITE;
/*!40000 ALTER TABLE `te_inform_subject` DISABLE KEYS */;
INSERT INTO `te_inform_subject` VALUES (1,'管制刀具、弓弩类、其他武器等',1,'出售禁售品',1),(2,'赌博用具类',1,'出售禁售品',1),(3,'枪支弹药',1,'出售禁售品',1),(4,'毒品及吸毒工具',1,'出售禁售品',1),(5,'色差大，质量差。',2,'产品质量问题',1);
/*!40000 ALTER TABLE `te_inform_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_inform_subject_type`
--

DROP TABLE IF EXISTS `te_inform_subject_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_inform_subject_type` (
  `inform_type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '举报类型id',
  `inform_type_name` varchar(50) NOT NULL COMMENT '举报类型名称 ',
  `inform_type_desc` varchar(100) NOT NULL COMMENT '举报类型描述',
  `inform_type_state` tinyint(4) NOT NULL COMMENT '举报类型状态(1有效/2失效)',
  PRIMARY KEY (`inform_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='举报类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_inform_subject_type`
--

LOCK TABLES `te_inform_subject_type` WRITE;
/*!40000 ALTER TABLE `te_inform_subject_type` DISABLE KEYS */;
INSERT INTO `te_inform_subject_type` VALUES (1,'出售禁售品','销售商城禁止和限制交易规则下所规定的所有商品。',1),(2,'产品质量问题','产品质量差，与描述严重不相符。',1);
/*!40000 ALTER TABLE `te_inform_subject_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_invoice`
--

DROP TABLE IF EXISTS `te_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_invoice` (
  `inv_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '索引id',
  `member_id` int(10) unsigned NOT NULL COMMENT '会员ID',
  `inv_state` enum('1','2') DEFAULT NULL COMMENT '1普通发票2增值税发票',
  `inv_title` varchar(50) DEFAULT '' COMMENT '发票抬头[普通发票]',
  `inv_content` varchar(10) DEFAULT '' COMMENT '发票内容[普通发票]',
  `inv_company` varchar(50) DEFAULT '' COMMENT '单位名称',
  `inv_code` varchar(50) DEFAULT '' COMMENT '纳税人识别号',
  `inv_reg_addr` varchar(50) DEFAULT '' COMMENT '注册地址',
  `inv_reg_phone` varchar(30) DEFAULT '' COMMENT '注册电话',
  `inv_reg_bname` varchar(30) DEFAULT '' COMMENT '开户银行',
  `inv_reg_baccount` varchar(30) DEFAULT '' COMMENT '银行账户',
  `inv_rec_name` varchar(20) DEFAULT '' COMMENT '收票人姓名',
  `inv_rec_mobphone` varchar(15) DEFAULT '' COMMENT '收票人手机号',
  `inv_rec_province` varchar(30) DEFAULT '' COMMENT '收票人省份',
  `inv_goto_addr` varchar(50) DEFAULT '' COMMENT '送票地址',
  PRIMARY KEY (`inv_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='买家发票信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_invoice`
--

LOCK TABLES `te_invoice` WRITE;
/*!40000 ALTER TABLE `te_invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_link`
--

DROP TABLE IF EXISTS `te_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_link` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '索引id',
  `link_title` varchar(100) DEFAULT NULL COMMENT '标题',
  `link_url` varchar(100) DEFAULT NULL COMMENT '链接',
  `link_pic` varchar(100) DEFAULT NULL COMMENT '图片',
  `link_sort` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  PRIMARY KEY (`link_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='合作伙伴表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_link`
--

LOCK TABLES `te_link` WRITE;
/*!40000 ALTER TABLE `te_link` DISABLE KEYS */;
INSERT INTO `te_link` VALUES (1,'好商城','http://www.33hao.com','33haologo.png',0),(2,'演示站点','http://v5.33hao.com','33haologo.png',1),(3,'支持论坛','http://bbs.33hao.com','',1),(4,'淘宝店','http://33haocom.taobao.com','',0);
/*!40000 ALTER TABLE `te_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_lock`
--

DROP TABLE IF EXISTS `te_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_lock` (
  `pid` bigint(20) unsigned NOT NULL COMMENT 'IP+TYPE',
  `pvalue` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '次数',
  `expiretime` int(11) NOT NULL DEFAULT '0' COMMENT '锁定截止时间',
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='防灌水表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_lock`
--

LOCK TABLES `te_lock` WRITE;
/*!40000 ALTER TABLE `te_lock` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_lock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_mail_cron`
--

DROP TABLE IF EXISTS `te_mail_cron`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_mail_cron` (
  `mail_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '消息任务计划id',
  `mail` varchar(100) NOT NULL COMMENT '邮箱地址',
  `subject` varchar(255) NOT NULL COMMENT '邮件标题',
  `contnet` text NOT NULL COMMENT '邮件内容',
  PRIMARY KEY (`mail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='邮件任务计划表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_mail_cron`
--

LOCK TABLES `te_mail_cron` WRITE;
/*!40000 ALTER TABLE `te_mail_cron` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_mail_cron` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_mail_msg_temlates`
--

DROP TABLE IF EXISTS `te_mail_msg_temlates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_mail_msg_temlates` (
  `name` varchar(100) NOT NULL COMMENT '模板名称',
  `title` varchar(100) DEFAULT NULL COMMENT '模板标题',
  `code` varchar(30) NOT NULL COMMENT '模板调用代码',
  `content` text NOT NULL COMMENT '模板内容',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='邮件模板表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_mail_msg_temlates`
--

LOCK TABLES `te_mail_msg_temlates` WRITE;
/*!40000 ALTER TABLE `te_mail_msg_temlates` DISABLE KEYS */;
INSERT INTO `te_mail_msg_temlates` VALUES ('<strong>[用户]</strong>身份验证通知','账户安全认证 - {$site_name}','authenticate','【{$site_name}】您于{$send_time}提交账户安全验证，验证码是：{$verify_code}。'),('<strong>[用户]</strong>邮箱验证通知','邮箱验证通知 - {$site_name}','bind_email','<p>您好！</p>\r\n<p>请在24小时内点击以下链接完成邮箱验证</p>\r\n<p><a href=\"{$verify_url}\" target=\"_blank\">马上验证</a></p>\r\n<p>如果您不能点击上面链接，还可以将以下链接复制到浏览器地址栏中访问</p>\r\n<p>{$verify_url}</p>'),('<strong>[用户]</strong>手机验证通知','手机验证通知 - {$site_name}','modify_mobile','【{$site_name}】您于{$send_time}绑定手机号，验证码是：{$verify_code}。'),('<strong>[用户]</strong>重置密码通知','重置密码通知 - {$site_name}','reset_pwd','<p>您好！</p>\r\n<p>您刚才在{$site_name}重置了密码，新密码为：{$new_password}。</p>\r\n<p>请尽快登录 <a href=\"{$site_url}\" target=\"_blank\">{$site_url}</a> 修改密码。</p>'),('<strong>[用户]</strong>门店提货通知','门店提货通知 - {$site_name}','send_chain_code','【{$site_name}】您已成功下单，订单号：{$order_sn}，提货码：{$chain_code}，请持以上信息及时到门店取货。'),('<strong>[用户]</strong>自提通知','用户自提通知 - {$site_name}','send_pickup_code','【{$site_name}】您的订单已到达自提点，请上门取货！提货时请提供手机号/订单号/运单号及提货码：{$pickup_code}。'),('<strong>[用户]</strong>虚拟兑换码通知','虚拟兑换码通知 - {$site_name}','send_vr_code','【{$site_name}】您的虚拟兑换码是：{$vr_code}。');
/*!40000 ALTER TABLE `te_mail_msg_temlates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_mall_consult`
--

DROP TABLE IF EXISTS `te_mall_consult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_mall_consult` (
  `mc_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '平台客服咨询id',
  `mct_id` int(10) unsigned NOT NULL COMMENT '咨询类型id',
  `member_id` int(10) unsigned NOT NULL COMMENT '会员id',
  `member_name` varchar(50) NOT NULL COMMENT '会员名称',
  `mc_content` varchar(500) NOT NULL COMMENT '咨询内容',
  `mc_addtime` int(10) unsigned NOT NULL COMMENT '咨询时间',
  `is_reply` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否回复，1是，0否，默认0',
  `mc_reply` varchar(500) DEFAULT '' COMMENT '回复内容',
  `mc_reply_time` int(10) unsigned DEFAULT '0' COMMENT '回复时间',
  `admin_id` int(10) unsigned DEFAULT '0' COMMENT '管理员id',
  `admin_name` varchar(50) DEFAULT '' COMMENT '管理员名称',
  PRIMARY KEY (`mc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='平台客服咨询表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_mall_consult`
--

LOCK TABLES `te_mall_consult` WRITE;
/*!40000 ALTER TABLE `te_mall_consult` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_mall_consult` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_mall_consult_type`
--

DROP TABLE IF EXISTS `te_mall_consult_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_mall_consult_type` (
  `mct_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '平台客服咨询类型id',
  `mct_name` varchar(50) NOT NULL COMMENT '咨询类型名称',
  `mct_introduce` text NOT NULL COMMENT '平台客服咨询类型备注',
  `mct_sort` tinyint(3) unsigned DEFAULT '255' COMMENT '咨询类型排序',
  PRIMARY KEY (`mct_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='平台客服咨询类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_mall_consult_type`
--

LOCK TABLES `te_mall_consult_type` WRITE;
/*!40000 ALTER TABLE `te_mall_consult_type` DISABLE KEYS */;
INSERT INTO `te_mall_consult_type` VALUES (1,'商品咨询','&lt;p&gt;\r\n  请写明商品链接，或平台货号。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n   如果您对商品规格、介绍等有疑问，可以在商品详情页“购买咨询”处发起咨询，会得到及时专业的回复。\r\n&lt;/p&gt;',255),(2,'订单咨询','&lt;p&gt;\r\n  请写明要咨询的订单编号。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n 如需处理交易中产生的纠纷，请选择投诉。\r\n&lt;/p&gt;',255);
/*!40000 ALTER TABLE `te_mall_consult_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_mb_category`
--

DROP TABLE IF EXISTS `te_mb_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_mb_category` (
  `gc_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '商城系统的分类ID',
  `gc_thumb` varchar(150) DEFAULT NULL COMMENT '缩略图',
  PRIMARY KEY (`gc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='一级分类缩略图[手机端]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_mb_category`
--

LOCK TABLES `te_mb_category` WRITE;
/*!40000 ALTER TABLE `te_mb_category` DISABLE KEYS */;
INSERT INTO `te_mb_category` VALUES (1,'05015381809285330.png'),(2,'05015381349504237.png'),(3,'05015381681266734.png'),(256,'05015381190111257.png'),(308,'05015382063902705.png'),(470,'05015382211209809.png'),(530,'05015382869763762.png'),(593,'05015382413708016.png'),(730,'05015382972892418.png'),(825,'05015383078446336.png'),(888,'05015382679643040.png'),(959,'05015383177958780.png'),(1037,'05015383410379550.png');
/*!40000 ALTER TABLE `te_mb_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_mb_feedback`
--

DROP TABLE IF EXISTS `te_mb_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_mb_feedback` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content` varchar(500) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL COMMENT '1来自手机端2来自PC端',
  `ftime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '反馈时间',
  `member_id` int(10) unsigned NOT NULL COMMENT '用户编号',
  `member_name` varchar(50) NOT NULL COMMENT '用户名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='意见反馈';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_mb_feedback`
--

LOCK TABLES `te_mb_feedback` WRITE;
/*!40000 ALTER TABLE `te_mb_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_mb_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_mb_payment`
--

DROP TABLE IF EXISTS `te_mb_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_mb_payment` (
  `payment_id` tinyint(1) unsigned NOT NULL COMMENT '支付索引id',
  `payment_code` char(20) NOT NULL COMMENT '支付代码名称',
  `payment_name` char(10) NOT NULL COMMENT '支付名称',
  `payment_config` varchar(255) DEFAULT NULL COMMENT '支付接口配置信息',
  `payment_state` enum('0','1') NOT NULL DEFAULT '0' COMMENT '接口状态0禁用1启用',
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='手机支付方式表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_mb_payment`
--

LOCK TABLES `te_mb_payment` WRITE;
/*!40000 ALTER TABLE `te_mb_payment` DISABLE KEYS */;
INSERT INTO `te_mb_payment` VALUES (1,'alipay','支付宝','a:3:{s:14:\"alipay_account\";s:1:\"1\";s:10:\"alipay_key\";s:1:\"1\";s:14:\"alipay_partner\";s:1:\"1\";}','1'),(2,'wxpay','微信支付','','0'),(3,'wxpay_jsapi','微信支付JSAPI','a:4:{s:5:\"appId\";s:1:\"1\";s:9:\"appSecret\";s:1:\"1\";s:9:\"partnerId\";s:1:\"1\";s:6:\"apiKey\";s:1:\"1\";}','1'),(4,'alipay_native','支付宝移动支付','','0');
/*!40000 ALTER TABLE `te_mb_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_mb_seller_token`
--

DROP TABLE IF EXISTS `te_mb_seller_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_mb_seller_token` (
  `token_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '令牌编号',
  `seller_id` int(10) unsigned NOT NULL COMMENT '用户编号',
  `seller_name` varchar(50) NOT NULL COMMENT '用户名',
  `token` varchar(50) NOT NULL COMMENT '登录令牌',
  `openid` varchar(50) DEFAULT NULL COMMENT '微信支付jsapi的openid缓存',
  `login_time` int(10) unsigned NOT NULL COMMENT '登录时间',
  `client_type` varchar(10) NOT NULL COMMENT '客户端类型 windows',
  PRIMARY KEY (`token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户端商家登录令牌表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_mb_seller_token`
--

LOCK TABLES `te_mb_seller_token` WRITE;
/*!40000 ALTER TABLE `te_mb_seller_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_mb_seller_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_mb_special`
--

DROP TABLE IF EXISTS `te_mb_special`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_mb_special` (
  `special_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '专题编号',
  `special_desc` varchar(20) NOT NULL COMMENT '专题描述',
  PRIMARY KEY (`special_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='手机专题表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_mb_special`
--

LOCK TABLES `te_mb_special` WRITE;
/*!40000 ALTER TABLE `te_mb_special` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_mb_special` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_mb_special_item`
--

DROP TABLE IF EXISTS `te_mb_special_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_mb_special_item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '专题项目编号',
  `special_id` int(10) unsigned NOT NULL COMMENT '专题编号',
  `item_type` varchar(50) NOT NULL COMMENT '项目类型',
  `item_data` varchar(2000) NOT NULL COMMENT '项目内容',
  `item_usable` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '项目是否可用 0-不可用 1-可用',
  `item_sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '项目排序',
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='手机专题项目表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_mb_special_item`
--

LOCK TABLES `te_mb_special_item` WRITE;
/*!40000 ALTER TABLE `te_mb_special_item` DISABLE KEYS */;
INSERT INTO `te_mb_special_item` VALUES (1,0,'adv_list','a:1:{s:4:\"item\";a:2:{s:24:\"s0_05434213368822693.jpg\";a:3:{s:5:\"image\";s:24:\"s0_05434213368822693.jpg\";s:4:\"type\";s:7:\"keyword\";s:4:\"data\";s:9:\"好商城\";}s:24:\"s0_05434213567585352.jpg\";a:3:{s:5:\"image\";s:24:\"s0_05434213567585352.jpg\";s:4:\"type\";s:7:\"keyword\";s:4:\"data\";s:9:\"好商城\";}}}',1,255),(2,0,'home1','a:4:{s:5:\"title\";s:0:\"\";s:5:\"image\";s:24:\"s0_05434214098334221.jpg\";s:4:\"type\";s:3:\"url\";s:4:\"data\";s:13:\"www.33hao.com\";}',1,255),(3,0,'home2','a:10:{s:5:\"title\";s:0:\"\";s:12:\"square_image\";s:24:\"s0_05434214858250254.jpg\";s:11:\"square_type\";s:0:\"\";s:11:\"square_data\";s:0:\"\";s:16:\"rectangle1_image\";s:24:\"s0_05434214927137495.jpg\";s:15:\"rectangle1_type\";s:0:\"\";s:15:\"rectangle1_data\";s:0:\"\";s:16:\"rectangle2_image\";s:24:\"s0_05434214977734076.jpg\";s:15:\"rectangle2_type\";s:0:\"\";s:15:\"rectangle2_data\";s:0:\"\";}',1,255),(4,0,'home2','',0,255);
/*!40000 ALTER TABLE `te_mb_special_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_mb_user_token`
--

DROP TABLE IF EXISTS `te_mb_user_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_mb_user_token` (
  `token_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '令牌编号',
  `member_id` int(10) unsigned NOT NULL COMMENT '用户编号',
  `member_name` varchar(50) NOT NULL COMMENT '用户名',
  `token` varchar(50) NOT NULL COMMENT '登录令牌',
  `openid` varchar(50) DEFAULT NULL COMMENT '微信支付jsapi的openid缓存',
  `login_time` int(10) unsigned NOT NULL COMMENT '登录时间',
  `client_type` varchar(10) NOT NULL COMMENT '客户端类型 android wap',
  PRIMARY KEY (`token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='移动端登录令牌表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_mb_user_token`
--

LOCK TABLES `te_mb_user_token` WRITE;
/*!40000 ALTER TABLE `te_mb_user_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_mb_user_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_member`
--

DROP TABLE IF EXISTS `te_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_member` (
  `member_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '会员id',
  `member_name` varchar(50) NOT NULL COMMENT '会员名称',
  `member_truename` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `member_avatar` varchar(50) DEFAULT NULL COMMENT '会员头像',
  `member_sex` tinyint(1) DEFAULT NULL COMMENT '会员性别',
  `member_birthday` date DEFAULT NULL COMMENT '生日',
  `member_passwd` varchar(32) NOT NULL COMMENT '会员密码',
  `member_paypwd` char(32) DEFAULT NULL COMMENT '支付密码',
  `member_email` varchar(100) NOT NULL COMMENT '会员邮箱',
  `member_email_bind` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0未绑定1已绑定',
  `member_mobile` varchar(11) DEFAULT NULL COMMENT '手机号',
  `member_mobile_bind` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0未绑定1已绑定',
  `member_qq` varchar(100) DEFAULT NULL COMMENT 'qq',
  `member_ww` varchar(100) DEFAULT NULL COMMENT '阿里旺旺',
  `member_login_num` int(11) NOT NULL DEFAULT '1' COMMENT '登录次数',
  `member_time` varchar(10) NOT NULL COMMENT '会员注册时间',
  `member_login_time` varchar(10) NOT NULL COMMENT '当前登录时间',
  `member_old_login_time` varchar(10) NOT NULL COMMENT '上次登录时间',
  `member_login_ip` varchar(20) DEFAULT NULL COMMENT '当前登录ip',
  `member_old_login_ip` varchar(20) DEFAULT NULL COMMENT '上次登录ip',
  `member_qqopenid` varchar(100) DEFAULT NULL COMMENT 'qq互联id',
  `member_qqinfo` text COMMENT 'qq账号相关信息',
  `member_sinaopenid` varchar(100) DEFAULT NULL COMMENT '新浪微博登录id',
  `member_sinainfo` text COMMENT '新浪账号相关信息序列化值',
  `weixin_unionid` varchar(50) DEFAULT NULL COMMENT '微信用户统一标识',
  `weixin_info` varchar(255) DEFAULT NULL COMMENT '微信用户相关信息',
  `member_points` int(11) NOT NULL DEFAULT '0' COMMENT '会员积分',
  `available_predeposit` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '预存款可用金额',
  `freeze_predeposit` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '预存款冻结金额',
  `available_rc_balance` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '可用充值卡余额',
  `freeze_rc_balance` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '冻结充值卡余额',
  `inform_allow` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否允许举报(1可以/2不可以)',
  `is_buy` tinyint(1) NOT NULL DEFAULT '1' COMMENT '会员是否有购买权限 1为开启 0为关闭',
  `is_allowtalk` tinyint(1) NOT NULL DEFAULT '1' COMMENT '会员是否有咨询和发送站内信的权限 1为开启 0为关闭',
  `member_state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '会员的开启状态 1为开启 0为关闭',
  `member_snsvisitnum` int(11) NOT NULL DEFAULT '0' COMMENT 'sns空间访问次数',
  `member_areaid` int(11) DEFAULT NULL COMMENT '地区ID',
  `member_cityid` int(11) DEFAULT NULL COMMENT '城市ID',
  `member_provinceid` int(11) DEFAULT NULL COMMENT '省份ID',
  `member_areainfo` varchar(255) DEFAULT NULL COMMENT '地区内容',
  `member_privacy` text COMMENT '隐私设定',
  `member_exppoints` int(11) NOT NULL DEFAULT '0' COMMENT '会员经验值',
  `invite_one` int(10) DEFAULT '0' COMMENT '一级会员',
  `invite_two` int(10) DEFAULT '0' COMMENT '二级会员',
  `invite_three` int(10) DEFAULT '0' COMMENT '三级会员',
  `inviter_id` int(11) DEFAULT NULL COMMENT '邀请人ID',
  PRIMARY KEY (`member_id`),
  KEY `member_name` (`member_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='会员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_member`
--

LOCK TABLES `te_member` WRITE;
/*!40000 ALTER TABLE `te_member` DISABLE KEYS */;
INSERT INTO `te_member` VALUES (1,'admin',NULL,NULL,NULL,NULL,'8a712ac42cb12f582b07e796fc4fceea',NULL,'',0,NULL,0,NULL,NULL,1,'1495643163','1495643163','1495643163',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0.00,0.00,0.00,0.00,1,1,1,1,0,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL);
/*!40000 ALTER TABLE `te_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_member_common`
--

DROP TABLE IF EXISTS `te_member_common`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_member_common` (
  `member_id` int(11) NOT NULL COMMENT '会员ID',
  `auth_code` char(6) DEFAULT NULL COMMENT '短信/邮件验证码',
  `send_acode_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '短信/邮件验证码发送时间',
  `send_mb_time` int(11) DEFAULT NULL COMMENT '发送短信验证码时间',
  `send_email_time` int(11) DEFAULT NULL COMMENT '发送邮件验证码时间',
  `send_mb_times` tinyint(4) NOT NULL DEFAULT '0' COMMENT '发送手机验证码次数',
  `send_acode_times` tinyint(4) NOT NULL DEFAULT '0' COMMENT '发送验证码次数',
  `auth_code_check_times` tinyint(4) NOT NULL DEFAULT '0' COMMENT '验证码验证次数[目前wap使用]',
  `auth_modify_pwd_time` int(11) NOT NULL DEFAULT '0' COMMENT '修改密码授权时间[目前wap使用]',
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员扩展表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_member_common`
--

LOCK TABLES `te_member_common` WRITE;
/*!40000 ALTER TABLE `te_member_common` DISABLE KEYS */;
INSERT INTO `te_member_common` VALUES (1,NULL,0,NULL,NULL,0,0,0,0);
/*!40000 ALTER TABLE `te_member_common` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_member_msg_setting`
--

DROP TABLE IF EXISTS `te_member_msg_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_member_msg_setting` (
  `mmt_code` varchar(50) NOT NULL COMMENT '用户消息模板编号',
  `member_id` int(10) unsigned NOT NULL COMMENT '会员id',
  `is_receive` tinyint(3) unsigned NOT NULL COMMENT '是否接收 1是，0否',
  PRIMARY KEY (`mmt_code`,`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户消息接收设置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_member_msg_setting`
--

LOCK TABLES `te_member_msg_setting` WRITE;
/*!40000 ALTER TABLE `te_member_msg_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_member_msg_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_member_msg_tpl`
--

DROP TABLE IF EXISTS `te_member_msg_tpl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_member_msg_tpl` (
  `mmt_code` varchar(50) NOT NULL COMMENT '用户消息模板编号',
  `mmt_name` varchar(50) NOT NULL COMMENT '模板名称',
  `mmt_message_switch` tinyint(3) unsigned NOT NULL COMMENT '站内信接收开关',
  `mmt_message_content` varchar(255) NOT NULL COMMENT '站内信消息内容',
  `mmt_short_switch` tinyint(3) unsigned NOT NULL COMMENT '短信接收开关',
  `mmt_short_content` varchar(255) NOT NULL COMMENT '短信接收内容',
  `mmt_mail_switch` tinyint(3) unsigned NOT NULL COMMENT '邮件接收开关',
  `mmt_mail_subject` varchar(255) NOT NULL COMMENT '邮件标题',
  `mmt_mail_content` text NOT NULL COMMENT '邮件内容',
  PRIMARY KEY (`mmt_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户消息模板';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_member_msg_tpl`
--

LOCK TABLES `te_member_msg_tpl` WRITE;
/*!40000 ALTER TABLE `te_member_msg_tpl` DISABLE KEYS */;
INSERT INTO `te_member_msg_tpl` VALUES ('arrival_notice','到货通知提醒',1,'您关注的商品 “{$goods_name}” 已经到货。<a href=\"{$goods_url}\" target=\"_blank\">点击查看商品</a>',0,'【{$site_name}】您关注的商品 “{$goods_name}” 已经到货。',0,'{$site_name}提醒：您关注的商品  “{$goods_name}” 已经到货。','<p>\r\n   {$site_name}提醒：\r\n</p>\r\n<p>\r\n  您关注的商品 “{$goods_name}” 已经到货。\r\n</p>\r\n<p>\r\n <a href=\"{$goods_url}\" target=\"_blank\">点击查看商品</a> \r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n {$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n   {$mail_send_time}\r\n</p>'),('consult_goods_reply','商品咨询回复提醒',1,'您关于商品 “{$goods_name}”的咨询，商家已经回复。<a href=\"{$consult_url}\" target=\"_blank\">点击查看回复</a>',0,'【{$site_name}】您关于商品 “{$goods_name}” 的咨询，商家已经回复。',0,'{$site_name}提醒：您关于商品 “{$goods_name}”的咨询，商家已经回复。','<p>\r\n  {$site_name}提醒：\r\n</p>\r\n<p>\r\n  您关注的商品“{$goods_name}” 已经到货。\r\n</p>\r\n<p>\r\n  <a href=\"{$consult_url}\" target=\"_blank\">点击查看回复</a> \r\n</p>\r\n<p>\r\n <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n {$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n   {$mail_send_time}\r\n</p>\r\n<br />\r\n<div class=\"firebugResetStyles firebugBlockBackgroundColor\">\r\n <div style=\"background-color:transparent ! important;\" class=\"firebugResetStyles\">\r\n  </div>\r\n</div>'),('consult_mall_reply','平台客服回复提醒',1,'您的平台客服咨询已经回复。<a href=\"{$consult_url}\" target=\"_blank\">点击查看回复</a>',0,'【{$site_name}】您的平台客服咨询已经回复。',0,'{$site_name}提醒：您的平台客服咨询已经回复。','<p>\r\n {$site_name}提醒：\r\n</p>\r\n<p>\r\n  您的平台客服咨询已经回复。\r\n</p>\r\n<p>\r\n    <a href=\"{$consult_url}\" target=\"_blank\">点击查看回复</a> \r\n</p>\r\n<p>\r\n <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n {$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n   {$mail_send_time}\r\n</p>'),('order_book_end_pay','预定订单尾款支付提醒',1,'您的订单已经进入支付尾款时间。<a href=\"{$order_url}\" target=\"_blank\">点击支付尾款</a>',0,'【{$site_name}】您的订单已经进入支付尾款时间。订单编号 {$order_sn}。',0,'{$site_name}提醒：您的订单已经进入支付尾款时间。订单编号 {$order_sn}。','<p>\r\n    {$site_name}提醒：\r\n</p>\r\n<p>\r\n  您的订单已经进入支付尾款时间。订单编号 {$order_sn}。<br />\r\n<a href=\"{$order_url}\" target=\"_blank\">点击支付尾款</a>\r\n</p>\r\n<p>\r\n    <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n {$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n   {$mail_send_time}\r\n</p>\r\n<br />'),('order_deliver_success','商品出库提醒',1,'您的订单已经出库。<a href=\"{$order_url}\" target=\"_blank\">点击查看订单</a>',0,'【{$site_name}】您的订单已经出库。订单编号 {$order_sn}。',0,'{$site_name}提醒：您的订单已经出库。订单编号 {$order_sn}。','<p>\r\n    {$site_name}提醒：\r\n</p>\r\n<p>\r\n  您的订单已经出库。订单编号 {$order_sn}。<br />\r\n<a href=\"{$order_url}\" target=\"_blank\">点击查看订单</a>\r\n</p>\r\n<p>\r\n    <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n {$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n   {$mail_send_time}\r\n</p>\r\n<br />'),('order_payment_success','付款成功提醒',1,'关于订单：{$order_sn}的款项已经收到，请留意出库通知。<a href=\"{$order_url}\" target=\"_blank\">点击查看订单详情</a>',0,'【{$site_name}】{$order_sn}的款项已经收到，请留意出库通知。',0,'{$site_name}提醒：{$order_sn}的款项已经收到，请留意出库通知。','<p>\r\n {$site_name}提醒：\r\n</p>\r\n<p>\r\n  {$order_sn}的款项已经收到，请留意出库通知。\r\n</p>\r\n<p>\r\n  <a href=\"{$order_url}\" target=\"_blank\">点击查看订单详情</a>\r\n</p>\r\n<p>\r\n  <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n {$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n   {$mail_send_time}\r\n</p>\r\n<br />'),('predeposit_change','余额变动提醒',1,'你的账户于 {$time} 账户资金有变化，描述：{$desc}，可用金额变化 ：{$av_amount}元，冻结金额变化：{$freeze_amount}元。<a href=\"{$pd_url}\" target=\"_blank\">点击查看余额</a>',0,'【{$site_name}】你的账户于 {$time} 账户资金有变化，描述：{$desc}，可用金额变化： {$av_amount}元，冻结金额变化：{$freeze_amount}元。',0,'{$site_name}提醒：你的账户于 {$time} 账户资金有变化，描述：{$desc}，可用金额变化： {$av_amount}元，冻结金额变化：{$freeze_amount}元。','<p>\r\n    {$site_name}提醒：\r\n</p>\r\n<p>\r\n  你的账户于 {$time} 账户资金有变化，描述：{$desc}，可用金额变化：{$av_amount}元，冻结金额变化：{$freeze_amount}元。\r\n</p>\r\n<p>\r\n  <a href=\"{$pd_url}\" target=\"_blank\">点击查看余额</a> \r\n</p>\r\n<p>\r\n  <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n {$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n   {$mail_send_time}\r\n</p>'),('recharge_card_balance_change','充值卡余额变动提醒',1,'你的账户于 {$time} 充值卡余额有变化，描述：{$description}，可用充值卡余额变化 ：{$available_amount}元，冻结充值卡余额变化：{$freeze_amount}元。<a href=\"{$url}\" target=\"_blank\">点击查看充值卡余额</a>',0,'【{$site_name}】你的账户于 {$time} 充值卡余额有变化，描述：{$description}，可用充值卡余额变化： {$available_amount}元，冻结充值卡余额变化：{$freeze_amount}元。',0,'{$site_name}提醒：你的账户于 {$time} 充值卡余额有变化，描述：{$description}，可用充值卡余额变化： {$available_amount}元，冻结充值卡余额变化：{$freeze_amount}元。','<p>\r\n    {$site_name}提醒：\r\n</p>\r\n<p>\r\n  你的账户于 {$time} 充值卡余额有变化，描述：{$description}，可用充值卡余额变化：{$available_amount}元，冻结充值卡余额变化：{$freeze_amount}元。\r\n</p>\r\n<p>\r\n  <a href=\"{$url}\" target=\"_blank\">点击查看余额</a> \r\n</p>\r\n<p>\r\n  <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n {$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n   {$mail_send_time}\r\n</p>'),('refund_return_notice','退款退货提醒',1,'您的退款退货单有了变化。<a href=\"{$refund_url}\" target=\"_blank\">点击查看</a>',0,'【{$site_name}】您的退款退货单有了变化。退款退货单编号：{$refund_sn}。',0,'{$site_name}提醒：您的退款退货单有了变化。','<p>\r\n  {$site_name}提醒：\r\n</p>\r\n<p>\r\n  您的退款退货单有了变化。退款退货单编号：{$refund_sn}。\r\n</p>\r\n<p>\r\n    &lt;a href=\"{$refund_url}\" target=\"_blank\"&gt;点击查看&lt;/a&gt;\r\n</p>\r\n<p>\r\n <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n {$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n   {$mail_send_time}\r\n</p>\r\n<br />'),('rpt_use','红包使用提醒',1,'您有红包已经使用，编号：{$rpacket_code}。<a href=\"{$rpacket_url}\" target=\"_blank\">点击查看</a>',0,'【{$site_name}】您有红包已经使用，编号：{$rpacket_code}。',0,'{$site_name}提醒：您有红包已经使用，编号：{$rpacket_code}。','<p>\n  {$site_name}提醒：\n</p>\n<p>\n  您有红包已经使用，编号：{$rpacket_code}。\n</p>\n<p>\n &lt;a href=\"{$rpacket_url}\" target=\"_blank\"&gt;点击查看&lt;/a&gt;\n</p>\n<p>\n    <br />\n</p>\n<p>\n   <br />\n</p>\n<p>\n   <br />\n</p>\n<p style=\"text-align:right;\">\n {$site_name}\n</p>\n<p style=\"text-align:right;\">\n   {$mail_send_time}\n</p>\n<p>\n    <br />\n</p>\n<p>\n   <br />\n</p>'),('voucher_use','代金券使用提醒',1,'您有代金券已经使用，代金券编号：{$voucher_code}。<a href=\"{$voucher_url}\" target=\"_blank\">点击查看</a>',0,'【{$site_name}】您有代金券已经使用，代金券编号：{$voucher_code}。',0,'{$site_name}提醒：您有代金券已经使用，代金券编号：{$voucher_code}。','<p>\r\n  {$site_name}提醒：\r\n</p>\r\n<p>\r\n  您有代金券已经使用，代金券编号：{$voucher_code}。\r\n</p>\r\n<p>\r\n &lt;a href=\"{$voucher_url}\" target=\"_blank\"&gt;点击查看&lt;/a&gt;\r\n</p>\r\n<p>\r\n    <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n {$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n   {$mail_send_time}\r\n</p>\r\n<p>\r\n    <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>'),('voucher_will_expire','代金券即将到期提醒',1,'您有一个代金券即将在{$indate}过期，请记得使用。<a href=\"{$voucher_url}\" target=\"_blank\">点击查看</a>',0,'【{$site_name}】您有一个代金券即将在{$indate}过期，请记得使用。',0,'{$site_name}提醒：您有一个代金券即将在{$indate}过期，请记得使用。','<p>\r\n	{$site_name}提醒：\r\n</p>\r\n<p>\r\n	您有一个代金券即将在{$indate}过期，请记得使用。\r\n</p>\r\n<p>\r\n	<a href=\"{$voucher_url}\" target=\"_blank\">点击查看</a> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	{$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	{$mail_send_time}\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>'),('vr_code_will_expire','兑换码即将到期提醒',1,'您有一组兑换码即将在{$indate}过期，请记得使用。<a href=\"{$vr_order_url}\" target=\"_blank\">点击查看</a>',0,'【{$site_name}】您有一组兑换码即将在{$indate}过期，请记得使用。',0,'{$site_name}提醒：您有一组兑换码即将在{$indate}过期，请记得使用。','<p>\r\n	{$site_name}提醒：\r\n</p>\r\n<p>\r\n	您有一组兑换码即将在{$indate}过期，请记得使用。\r\n</p>\r\n<p>\r\n	&lt;a href=\"{$vr_order_url}\" target=\"_blank\"&gt;点击查看&lt;/a&gt;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	{$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	{$mail_send_time}\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>');
/*!40000 ALTER TABLE `te_member_msg_tpl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_message`
--

DROP TABLE IF EXISTS `te_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '短消息索引id',
  `message_parent_id` int(11) NOT NULL COMMENT '回复短消息message_id',
  `from_member_id` int(11) NOT NULL COMMENT '短消息发送人',
  `to_member_id` varchar(1000) NOT NULL COMMENT '短消息接收人',
  `message_title` varchar(50) DEFAULT NULL COMMENT '短消息标题',
  `message_body` varchar(255) NOT NULL COMMENT '短消息内容',
  `message_time` varchar(10) NOT NULL COMMENT '短消息发送时间',
  `message_update_time` varchar(10) DEFAULT NULL COMMENT '短消息回复更新时间',
  `message_open` tinyint(1) NOT NULL DEFAULT '0' COMMENT '短消息打开状态',
  `message_state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '短消息状态，0为正常状态，1为发送人删除状态，2为接收人删除状态',
  `message_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0为私信、1为系统消息、2为留言',
  `read_member_id` varchar(1000) DEFAULT NULL COMMENT '已经读过该消息的会员id',
  `del_member_id` varchar(1000) DEFAULT NULL COMMENT '已经删除该消息的会员id',
  `message_ismore` tinyint(1) NOT NULL DEFAULT '0' COMMENT '站内信是否为一条发给多个用户 0为否 1为多条 ',
  `from_member_name` varchar(100) DEFAULT NULL COMMENT '发信息人用户名',
  `to_member_name` varchar(100) DEFAULT NULL COMMENT '接收人用户名',
  PRIMARY KEY (`message_id`),
  KEY `from_member_id` (`from_member_id`),
  KEY `to_member_id` (`to_member_id`(255)),
  KEY `message_ismore` (`message_ismore`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='短消息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_message`
--

LOCK TABLES `te_message` WRITE;
/*!40000 ALTER TABLE `te_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_micro_adv`
--

DROP TABLE IF EXISTS `te_micro_adv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_micro_adv` (
  `adv_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '广告编号',
  `adv_type` varchar(50) DEFAULT '' COMMENT '广告类型',
  `adv_name` varchar(255) DEFAULT '' COMMENT '广告名称',
  `adv_image` varchar(255) NOT NULL DEFAULT '' COMMENT '广告图片',
  `adv_url` varchar(255) DEFAULT '' COMMENT '广告链接',
  `adv_sort` tinyint(1) unsigned NOT NULL DEFAULT '255' COMMENT '广告排序',
  PRIMARY KEY (`adv_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微商城广告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_micro_adv`
--

LOCK TABLES `te_micro_adv` WRITE;
/*!40000 ALTER TABLE `te_micro_adv` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_micro_adv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_micro_comment`
--

DROP TABLE IF EXISTS `te_micro_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_micro_comment` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论编号',
  `comment_type` tinyint(1) NOT NULL COMMENT '评论类型编号',
  `comment_object_id` int(10) unsigned NOT NULL COMMENT '推荐商品编号',
  `comment_message` varchar(255) NOT NULL COMMENT '评论内容',
  `comment_member_id` int(10) unsigned NOT NULL COMMENT '评论人编号',
  `comment_time` int(10) unsigned NOT NULL COMMENT '评论时间',
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微商城商品评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_micro_comment`
--

LOCK TABLES `te_micro_comment` WRITE;
/*!40000 ALTER TABLE `te_micro_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_micro_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_micro_goods`
--

DROP TABLE IF EXISTS `te_micro_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_micro_goods` (
  `commend_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '推荐编号',
  `commend_member_id` int(10) unsigned NOT NULL COMMENT '推荐人用户编号',
  `commend_goods_id` int(10) unsigned NOT NULL COMMENT '推荐商品编号',
  `commend_goods_commonid` int(10) unsigned NOT NULL COMMENT '商品公共表id',
  `commend_goods_store_id` int(10) unsigned NOT NULL COMMENT '推荐商品店铺编号',
  `commend_goods_name` varchar(100) NOT NULL COMMENT '推荐商品名称',
  `commend_goods_price` decimal(11,2) NOT NULL COMMENT '推荐商品价格',
  `commend_goods_image` varchar(100) NOT NULL COMMENT '推荐商品图片',
  `commend_message` varchar(1000) NOT NULL COMMENT '推荐信息',
  `commend_time` int(10) unsigned NOT NULL COMMENT '推荐时间',
  `class_id` int(10) unsigned NOT NULL,
  `like_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '喜欢数',
  `comment_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `click_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击数',
  `microshop_commend` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '首页推荐 0-否 1-推荐',
  `microshop_sort` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  PRIMARY KEY (`commend_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微商城推荐商品表随心看';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_micro_goods`
--

LOCK TABLES `te_micro_goods` WRITE;
/*!40000 ALTER TABLE `te_micro_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_micro_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_micro_goods_class`
--

DROP TABLE IF EXISTS `te_micro_goods_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_micro_goods_class` (
  `class_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类编号 ',
  `class_name` varchar(50) NOT NULL COMMENT '分类名称',
  `class_parent_id` int(11) unsigned DEFAULT '0' COMMENT '父级分类编号',
  `class_sort` tinyint(4) unsigned NOT NULL COMMENT '排序',
  `class_keyword` varchar(500) DEFAULT '' COMMENT '分类关键字',
  `class_image` varchar(100) DEFAULT '' COMMENT '分类图片',
  `class_commend` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '推荐标志0-不推荐 1-推荐到首页',
  `class_default` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '默认标志，0-非默认 1-默认',
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微商城商品随心看分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_micro_goods_class`
--

LOCK TABLES `te_micro_goods_class` WRITE;
/*!40000 ALTER TABLE `te_micro_goods_class` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_micro_goods_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_micro_goods_relation`
--

DROP TABLE IF EXISTS `te_micro_goods_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_micro_goods_relation` (
  `relation_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '关系编号',
  `class_id` int(10) unsigned NOT NULL COMMENT '微商城商品分类编号',
  `shop_class_id` int(10) unsigned NOT NULL COMMENT '商城商品分类编号',
  PRIMARY KEY (`relation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微商城商品分类和商城商品分类对应关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_micro_goods_relation`
--

LOCK TABLES `te_micro_goods_relation` WRITE;
/*!40000 ALTER TABLE `te_micro_goods_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_micro_goods_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_micro_like`
--

DROP TABLE IF EXISTS `te_micro_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_micro_like` (
  `like_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '喜欢编号',
  `like_type` tinyint(1) NOT NULL COMMENT '喜欢类型编号',
  `like_object_id` int(10) unsigned NOT NULL COMMENT '喜欢对象编号',
  `like_member_id` int(10) unsigned NOT NULL COMMENT '喜欢人编号',
  `like_time` int(10) unsigned NOT NULL COMMENT '喜欢时间',
  PRIMARY KEY (`like_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微商城喜欢表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_micro_like`
--

LOCK TABLES `te_micro_like` WRITE;
/*!40000 ALTER TABLE `te_micro_like` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_micro_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_micro_member_info`
--

DROP TABLE IF EXISTS `te_micro_member_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_micro_member_info` (
  `member_id` int(11) unsigned NOT NULL COMMENT '用户编号',
  `visit_count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '个人中心访问计数',
  `personal_count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '已发布个人秀数量',
  `goods_count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '已发布随心看数量',
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微商城用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_micro_member_info`
--

LOCK TABLES `te_micro_member_info` WRITE;
/*!40000 ALTER TABLE `te_micro_member_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_micro_member_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_micro_personal`
--

DROP TABLE IF EXISTS `te_micro_personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_micro_personal` (
  `personal_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '推荐编号',
  `commend_member_id` int(10) unsigned NOT NULL COMMENT '推荐人用户编号',
  `commend_image` text NOT NULL COMMENT '推荐图片',
  `commend_buy` text NOT NULL COMMENT '购买信息',
  `commend_message` varchar(1000) NOT NULL COMMENT '推荐信息',
  `commend_time` int(10) unsigned NOT NULL COMMENT '推荐时间',
  `class_id` int(10) unsigned NOT NULL,
  `like_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '喜欢数',
  `comment_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `click_count` int(10) unsigned NOT NULL DEFAULT '0',
  `microshop_commend` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '首页推荐 0-否 1-推荐',
  `microshop_sort` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  PRIMARY KEY (`personal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微商城个人秀表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_micro_personal`
--

LOCK TABLES `te_micro_personal` WRITE;
/*!40000 ALTER TABLE `te_micro_personal` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_micro_personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_micro_personal_class`
--

DROP TABLE IF EXISTS `te_micro_personal_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_micro_personal_class` (
  `class_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类编号 ',
  `class_name` varchar(50) NOT NULL COMMENT '分类名称',
  `class_sort` tinyint(4) unsigned NOT NULL COMMENT '排序',
  `class_image` varchar(100) DEFAULT '' COMMENT '分类图片',
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微商城个人秀分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_micro_personal_class`
--

LOCK TABLES `te_micro_personal_class` WRITE;
/*!40000 ALTER TABLE `te_micro_personal_class` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_micro_personal_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_micro_store`
--

DROP TABLE IF EXISTS `te_micro_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_micro_store` (
  `microshop_store_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '店铺街店铺编号',
  `shop_store_id` int(11) unsigned NOT NULL COMMENT '商城店铺编号',
  `microshop_sort` tinyint(1) unsigned DEFAULT '255' COMMENT '排序',
  `microshop_commend` tinyint(1) unsigned DEFAULT '1' COMMENT '推荐首页标志 1-正常 2-推荐',
  `like_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '喜欢数',
  `comment_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `click_count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`microshop_store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微商城店铺街表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_micro_store`
--

LOCK TABLES `te_micro_store` WRITE;
/*!40000 ALTER TABLE `te_micro_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_micro_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_navigation`
--

DROP TABLE IF EXISTS `te_navigation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_navigation` (
  `nav_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '索引ID',
  `nav_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '类别，0自定义导航，1商品分类，2文章导航，3活动导航，默认为0',
  `nav_title` varchar(100) DEFAULT NULL COMMENT '导航标题',
  `nav_url` varchar(255) DEFAULT NULL COMMENT '导航链接',
  `nav_location` tinyint(1) NOT NULL DEFAULT '0' COMMENT '导航位置，0头部，1中部，2底部，默认为0',
  `nav_new_open` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否以新窗口打开，0为否，1为是，默认为0',
  `nav_sort` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  `item_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '类别ID，对应着nav_type中的内容，默认为0',
  PRIMARY KEY (`nav_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='页面导航表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_navigation`
--

LOCK TABLES `te_navigation` WRITE;
/*!40000 ALTER TABLE `te_navigation` DISABLE KEYS */;
INSERT INTO `te_navigation` VALUES (6,0,'关于我们','http://it.hnlichaung.com/member/index.php?act=article&article_id=22',2,0,255,0),(7,0,'联系我们','http://it.hnlichaung.com/member/index.php?act=article&article_id=23',2,0,240,0),(8,0,'合作及洽谈','http://it.hnlichaung.com/member/index.php?act=article&article_id=25',2,0,220,0),(9,0,'招聘英才','http://it.hnlichaung.com/member/index.php?act=article&article_id=24',2,0,210,0),(10,0,'店铺','http://it.hnlichaung.com/index.php?act=store_list&op=index',1,0,5,0),(11,0,'门户','http://it.hnlichaung.com/cms',1,0,6,0),(12,0,'圈子','http://it.hnlichaung.com/circle',1,0,7,0),(13,0,'微商城','http://it.hnlichaung.com/microshop',1,0,8,0),(15,0,'物流自取','http://it.hnlichaung.com/delivery',2,0,255,0),(16,0,'友情链接','http://it.hnlichaung.com/index.php?act=link',2,0,255,0),(17,0,'抢购','http://it.hnlichaung.com/index.php?act=show_groupbuy&op=index',1,0,1,0),(18,0,'品牌','http://it.hnlichaung.com/index.php?act=brand&op=index',1,0,2,0),(19,0,'积分中心','http://it.hnlichaung.com/index.php?act=promotion&op=index',1,0,4,0),(20,0,'专题','http://it.hnlichaung.com/index.php?act=special&op=special_list',1,0,3,0);
/*!40000 ALTER TABLE `te_navigation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_offpay_area`
--

DROP TABLE IF EXISTS `te_offpay_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_offpay_area` (
  `store_id` int(8) unsigned NOT NULL COMMENT '商家ID',
  `area_id` text COMMENT '县ID组合',
  PRIMARY KEY (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='货到付款支持地区表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_offpay_area`
--

LOCK TABLES `te_offpay_area` WRITE;
/*!40000 ALTER TABLE `te_offpay_area` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_offpay_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_order_bill`
--

DROP TABLE IF EXISTS `te_order_bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_order_bill` (
  `ob_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID作为新结算单编号',
  `ob_no` int(11) DEFAULT '0' COMMENT '结算单编号(年月店铺ID)',
  `ob_start_date` int(11) NOT NULL COMMENT '开始日期',
  `ob_end_date` int(11) NOT NULL COMMENT '结束日期',
  `ob_order_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单金额',
  `ob_shipping_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '运费',
  `ob_order_return_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '退单金额',
  `ob_commis_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '佣金金额',
  `ob_commis_return_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '退还佣金',
  `ob_store_cost_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '店铺促销活动费用',
  `ob_result_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '应结金额',
  `ob_create_date` int(11) DEFAULT '0' COMMENT '生成结算单日期',
  `os_month` mediumint(6) unsigned DEFAULT NULL COMMENT '出账单应结时间,ob_end_date+1所在月(年月份)',
  `ob_state` enum('1','2','3','4') DEFAULT '1' COMMENT '1默认2店家已确认3平台已审核4结算完成',
  `ob_pay_date` int(11) DEFAULT '0' COMMENT '付款日期',
  `ob_pay_content` varchar(200) DEFAULT '' COMMENT '支付备注',
  `ob_store_id` int(11) NOT NULL COMMENT '店铺ID',
  `ob_store_name` varchar(50) DEFAULT NULL COMMENT '店铺名',
  `ob_order_book_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '被关闭的预定订单的实收总金额',
  `ob_rpt_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '下单时使用的红包值',
  `ob_rf_rpt_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '全部退款时红包值',
  PRIMARY KEY (`ob_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='结算表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_order_bill`
--

LOCK TABLES `te_order_bill` WRITE;
/*!40000 ALTER TABLE `te_order_bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_order_bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_order_book`
--

DROP TABLE IF EXISTS `te_order_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_order_book` (
  `book_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `book_order_id` int(11) DEFAULT NULL COMMENT '订单ID',
  `book_step` tinyint(4) DEFAULT NULL COMMENT '预定时段,值为1 or 2,0为不分时段，全款支付',
  `book_amount` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '定金or尾款金额',
  `book_pd_amount` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '预存款支付金额',
  `book_rcb_amount` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '充值卡支付金额',
  `book_pay_name` varchar(10) DEFAULT NULL COMMENT '支付方式(文字)',
  `book_trade_no` varchar(40) DEFAULT NULL COMMENT '第三方平台交易号',
  `book_pay_time` int(11) DEFAULT '0' COMMENT '支付时间',
  `book_end_time` int(11) DEFAULT '0' COMMENT '时段1:订单自动取消时间,时段2:时段结束时间',
  `book_buyer_phone` bigint(20) DEFAULT NULL COMMENT '买家接收尾款交款通知的手机,只在第2时段有值即可',
  `book_deposit_amount` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '定金金额,只在全款支付时有值即可',
  `book_pay_notice` tinyint(4) DEFAULT '0' COMMENT '0未通知1已通知,该字段只对尾款时段有效',
  `book_real_pay` decimal(10,2) DEFAULT '0.00' COMMENT '订单被取消后最终支付金额（平台收款金额）',
  `book_cancel_time` int(11) DEFAULT '0' COMMENT '订单被取消时间,结算用,只有book_step是0或1时有值',
  `book_store_id` int(11) DEFAULT '0' COMMENT '商家 ID,只有book_step是0或1时有值即可',
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='预定订单时段详细内容表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_order_book`
--

LOCK TABLES `te_order_book` WRITE;
/*!40000 ALTER TABLE `te_order_book` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_order_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_order_common`
--

DROP TABLE IF EXISTS `te_order_common`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_order_common` (
  `order_id` int(11) NOT NULL COMMENT '订单索引id',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺ID',
  `shipping_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '配送时间',
  `shipping_express_id` tinyint(1) NOT NULL DEFAULT '0' COMMENT '配送公司ID',
  `evaluation_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评价时间',
  `order_message` varchar(300) DEFAULT NULL COMMENT '订单留言',
  `order_pointscount` int(11) NOT NULL DEFAULT '0' COMMENT '订单赠送积分',
  `voucher_price` int(11) DEFAULT NULL COMMENT '代金券面额',
  `voucher_code` varchar(32) DEFAULT NULL COMMENT '代金券编码',
  `deliver_explain` text COMMENT '发货备注',
  `daddress_id` mediumint(9) NOT NULL DEFAULT '0' COMMENT '发货地址ID',
  `reciver_name` varchar(50) NOT NULL COMMENT '收货人姓名',
  `reciver_info` varchar(500) NOT NULL COMMENT '收货人其它信息',
  `reciver_province_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '收货人省级ID',
  `reciver_city_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '收货人市级ID',
  `invoice_info` varchar(500) DEFAULT '' COMMENT '发票信息',
  `promotion_info` varchar(800) DEFAULT '' COMMENT '促销信息备注',
  `dlyo_pickup_code` varchar(6) DEFAULT NULL COMMENT '提货码',
  `promotion_total` decimal(10,2) DEFAULT '0.00' COMMENT '订单总优惠金额（代金券，满减，平台红包）',
  `discount` tinyint(4) DEFAULT '0' COMMENT '会员折扣x%',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单信息扩展表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_order_common`
--

LOCK TABLES `te_order_common` WRITE;
/*!40000 ALTER TABLE `te_order_common` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_order_common` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_order_goods`
--

DROP TABLE IF EXISTS `te_order_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_order_goods` (
  `rec_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单商品表索引id',
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称',
  `goods_price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `goods_num` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '商品数量',
  `goods_image` varchar(100) DEFAULT NULL COMMENT '商品图片',
  `goods_pay_price` decimal(10,2) unsigned NOT NULL COMMENT '商品实际成交价',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `buyer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '买家ID',
  `goods_type` char(1) NOT NULL DEFAULT '1' COMMENT '1默认2抢购商品3限时折扣商品4组合套装5赠品8加价购活动商品9加价购换购商品',
  `promotions_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '促销活动ID（抢购ID/限时折扣ID/优惠套装ID）与goods_type搭配使用',
  `commis_rate` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '佣金比例',
  `gc_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '商品最底级分类ID',
  `goods_spec` varchar(255) DEFAULT NULL COMMENT '商品规格',
  `goods_contractid` varchar(100) DEFAULT NULL COMMENT '商品开启的消费者保障服务id',
  `invite_rates` smallint(5) DEFAULT '0' COMMENT '分销佣金',
  PRIMARY KEY (`rec_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_order_goods`
--

LOCK TABLES `te_order_goods` WRITE;
/*!40000 ALTER TABLE `te_order_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_order_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_order_log`
--

DROP TABLE IF EXISTS `te_order_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_order_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `log_msg` varchar(150) DEFAULT '' COMMENT '文字描述',
  `log_time` int(10) unsigned NOT NULL COMMENT '处理时间',
  `log_role` varchar(10) NOT NULL COMMENT '操作角色',
  `log_user` varchar(30) DEFAULT '' COMMENT '操作人',
  `log_orderstate` enum('0','10','20','30','40') DEFAULT NULL COMMENT '订单状态：0(已取消)10:未付款;20:已付款;30:已发货;40:已收货;',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单处理历史表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_order_log`
--

LOCK TABLES `te_order_log` WRITE;
/*!40000 ALTER TABLE `te_order_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_order_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_order_pay`
--

DROP TABLE IF EXISTS `te_order_pay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_order_pay` (
  `pay_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pay_sn` bigint(20) unsigned NOT NULL COMMENT '支付单号',
  `buyer_id` int(10) unsigned NOT NULL COMMENT '买家ID',
  `api_pay_state` enum('0','1') DEFAULT '0' COMMENT '0默认未支付1已支付(只有第三方支付接口通知到时才会更改此状态)',
  PRIMARY KEY (`pay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单支付表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_order_pay`
--

LOCK TABLES `te_order_pay` WRITE;
/*!40000 ALTER TABLE `te_order_pay` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_order_pay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_order_snapshot`
--

DROP TABLE IF EXISTS `te_order_snapshot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_order_snapshot` (
  `rec_id` int(11) NOT NULL COMMENT '主键',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `create_time` int(11) NOT NULL COMMENT '生成时间',
  `goods_attr` text COMMENT '属性',
  `goods_body` text COMMENT '详情',
  `plate_top` text COMMENT '顶部关联版式',
  `plate_bottom` text COMMENT '底部关联版式',
  PRIMARY KEY (`rec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单快照表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_order_snapshot`
--

LOCK TABLES `te_order_snapshot` WRITE;
/*!40000 ALTER TABLE `te_order_snapshot` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_order_snapshot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_order_statis`
--

DROP TABLE IF EXISTS `te_order_statis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_order_statis` (
  `os_month` mediumint(9) unsigned NOT NULL DEFAULT '0' COMMENT '统计编号(年月)',
  `os_year` smallint(6) DEFAULT '0' COMMENT '年',
  `os_start_date` int(11) NOT NULL COMMENT '开始日期',
  `os_end_date` int(11) NOT NULL COMMENT '结束日期',
  `os_order_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单金额',
  `os_shipping_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '运费',
  `os_order_return_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '退单金额',
  `os_commis_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '佣金金额',
  `os_commis_return_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '退还佣金',
  `os_store_cost_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '店铺促销活动费用',
  `os_result_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '本期应结',
  `os_create_date` int(11) DEFAULT NULL COMMENT '创建记录日期',
  `os_order_book_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '被关闭的预定订单的实收总金额',
  PRIMARY KEY (`os_month`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='月销量统计表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_order_statis`
--

LOCK TABLES `te_order_statis` WRITE;
/*!40000 ALTER TABLE `te_order_statis` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_order_statis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_orders`
--

DROP TABLE IF EXISTS `te_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单索引id',
  `order_sn` bigint(20) unsigned NOT NULL COMMENT '订单编号',
  `pay_sn` bigint(20) unsigned NOT NULL COMMENT '支付单号',
  `pay_sn1` bigint(20) unsigned DEFAULT NULL COMMENT '预定订单支付订金时的支付单号',
  `store_id` int(11) unsigned NOT NULL COMMENT '卖家店铺id',
  `store_name` varchar(50) NOT NULL COMMENT '卖家店铺名称',
  `buyer_id` int(11) unsigned NOT NULL COMMENT '买家id',
  `buyer_name` varchar(50) NOT NULL COMMENT '买家姓名',
  `buyer_email` varchar(80) DEFAULT NULL COMMENT '买家电子邮箱',
  `buyer_phone` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '买家手机',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单生成时间',
  `payment_code` char(10) NOT NULL DEFAULT '' COMMENT '支付方式名称代码',
  `payment_time` int(10) unsigned DEFAULT '0' COMMENT '支付(付款)时间',
  `finnshed_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单完成时间',
  `goods_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '商品总价格',
  `order_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '订单总价格',
  `rcb_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '充值卡支付金额',
  `pd_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '预存款支付金额',
  `shipping_fee` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '运费',
  `evaluation_state` tinyint(4) DEFAULT '0' COMMENT '评价状态 0未评价，1已评价，2已过期未评价',
  `evaluation_again_state` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '追加评价状态 0未评价，1已评价，2已过期未评价',
  `order_state` tinyint(4) NOT NULL DEFAULT '10' COMMENT '订单状态：0(已取消)10(默认):未付款;20:已付款;30:已发货;40:已收货;',
  `refund_state` tinyint(4) unsigned DEFAULT '0' COMMENT '退款状态:0是无退款,1是部分退款,2是全部退款',
  `lock_state` tinyint(4) unsigned DEFAULT '0' COMMENT '锁定状态:0是正常,大于0是锁定,默认是0',
  `delete_state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态0未删除1放入回收站2彻底删除',
  `refund_amount` decimal(10,2) DEFAULT '0.00' COMMENT '退款金额',
  `delay_time` int(10) unsigned DEFAULT '0' COMMENT '延迟时间,默认为0',
  `order_from` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1WEB2mobile',
  `shipping_code` varchar(50) DEFAULT '' COMMENT '物流单号',
  `order_type` tinyint(4) DEFAULT '1' COMMENT '订单类型1普通订单(默认),2预定订单,3门店自提订单',
  `api_pay_time` int(10) unsigned DEFAULT '0' COMMENT '在线支付动作时间,只要向第三方支付平台提交就会更新',
  `chain_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '自提门店ID',
  `chain_code` mediumint(6) unsigned NOT NULL DEFAULT '0' COMMENT '门店提货码',
  `rpt_amount` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '红包值',
  `trade_no` varchar(50) DEFAULT NULL COMMENT '外部交易订单号',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_orders`
--

LOCK TABLES `te_orders` WRITE;
/*!40000 ALTER TABLE `te_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_p_book_quota`
--

DROP TABLE IF EXISTS `te_p_book_quota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_p_book_quota` (
  `bkq_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '预定套餐id',
  `store_id` int(11) NOT NULL COMMENT '店铺id',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `bkq_starttime` int(11) NOT NULL COMMENT '套餐开始时间',
  `bkq_endtime` int(11) NOT NULL COMMENT '套餐结束时间',
  PRIMARY KEY (`bkq_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='预定商品套餐表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_p_book_quota`
--

LOCK TABLES `te_p_book_quota` WRITE;
/*!40000 ALTER TABLE `te_p_book_quota` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_p_book_quota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_p_booth_goods`
--

DROP TABLE IF EXISTS `te_p_booth_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_p_booth_goods` (
  `booth_goods_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '套餐商品id',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺id',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品id',
  `gc_id` int(10) unsigned NOT NULL COMMENT '商品分类id',
  `booth_state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '套餐状态 1开启 0关闭 默认1',
  PRIMARY KEY (`booth_goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='展位商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_p_booth_goods`
--

LOCK TABLES `te_p_booth_goods` WRITE;
/*!40000 ALTER TABLE `te_p_booth_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_p_booth_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_p_booth_quota`
--

DROP TABLE IF EXISTS `te_p_booth_quota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_p_booth_quota` (
  `booth_quota_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '套餐id',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺id',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `booth_quota_starttime` int(10) unsigned NOT NULL COMMENT '开始时间',
  `booth_quota_endtime` int(10) unsigned NOT NULL COMMENT '结束时间',
  `booth_state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '套餐状态 1开启 0关闭 默认1',
  PRIMARY KEY (`booth_quota_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='展位套餐表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_p_booth_quota`
--

LOCK TABLES `te_p_booth_quota` WRITE;
/*!40000 ALTER TABLE `te_p_booth_quota` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_p_booth_quota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_p_bundling`
--

DROP TABLE IF EXISTS `te_p_bundling`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_p_bundling` (
  `bl_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '组合ID',
  `bl_name` varchar(50) NOT NULL COMMENT '组合名称',
  `store_id` int(11) NOT NULL COMMENT '店铺名称',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `bl_discount_price` decimal(10,2) NOT NULL COMMENT '组合价格',
  `bl_freight_choose` tinyint(1) NOT NULL COMMENT '运费承担方式',
  `bl_freight` decimal(10,2) DEFAULT '0.00' COMMENT '运费',
  `bl_state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '组合状态 0-关闭/1-开启',
  PRIMARY KEY (`bl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组合销售活动表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_p_bundling`
--

LOCK TABLES `te_p_bundling` WRITE;
/*!40000 ALTER TABLE `te_p_bundling` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_p_bundling` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_p_bundling_goods`
--

DROP TABLE IF EXISTS `te_p_bundling_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_p_bundling_goods` (
  `bl_goods_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '组合商品id',
  `bl_id` int(11) NOT NULL COMMENT '组合id',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品id',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称',
  `goods_image` varchar(100) NOT NULL COMMENT '商品图片',
  `bl_goods_price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `bl_appoint` tinyint(3) unsigned NOT NULL COMMENT '指定商品 1是，0否',
  PRIMARY KEY (`bl_goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组合销售活动商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_p_bundling_goods`
--

LOCK TABLES `te_p_bundling_goods` WRITE;
/*!40000 ALTER TABLE `te_p_bundling_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_p_bundling_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_p_bundling_quota`
--

DROP TABLE IF EXISTS `te_p_bundling_quota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_p_bundling_quota` (
  `bl_quota_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '套餐ID',
  `store_id` int(11) NOT NULL COMMENT '店铺id',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `member_id` int(11) NOT NULL COMMENT '会员id',
  `member_name` varchar(50) NOT NULL COMMENT '会员名称',
  `bl_quota_month` tinyint(3) unsigned NOT NULL COMMENT '购买数量（单位月）',
  `bl_quota_starttime` varchar(10) NOT NULL COMMENT '套餐开始时间',
  `bl_quota_endtime` varchar(10) NOT NULL COMMENT '套餐结束时间',
  `bl_state` tinyint(1) unsigned NOT NULL COMMENT '套餐状态：0关闭，1开启。默认为 1',
  PRIMARY KEY (`bl_quota_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组合销售套餐表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_p_bundling_quota`
--

LOCK TABLES `te_p_bundling_quota` WRITE;
/*!40000 ALTER TABLE `te_p_bundling_quota` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_p_bundling_quota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_p_combo_goods`
--

DROP TABLE IF EXISTS `te_p_combo_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_p_combo_goods` (
  `cg_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '推荐组合id ',
  `cg_class` varchar(10) NOT NULL COMMENT '推荐组合名称',
  `goods_id` int(10) unsigned NOT NULL COMMENT '主商品id',
  `goods_commonid` int(10) unsigned NOT NULL COMMENT '主商品公共id',
  `store_id` int(10) unsigned NOT NULL COMMENT '所属店铺id',
  `combo_goodsid` int(10) unsigned NOT NULL COMMENT '推荐组合商品id',
  PRIMARY KEY (`cg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品推荐组合表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_p_combo_goods`
--

LOCK TABLES `te_p_combo_goods` WRITE;
/*!40000 ALTER TABLE `te_p_combo_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_p_combo_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_p_combo_quota`
--

DROP TABLE IF EXISTS `te_p_combo_quota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_p_combo_quota` (
  `cq_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '推荐组合套餐id',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺id',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `cq_starttime` int(10) unsigned NOT NULL COMMENT '套餐开始时间',
  `cq_endtime` int(10) unsigned NOT NULL COMMENT '套餐结束时间',
  PRIMARY KEY (`cq_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='推荐组合套餐表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_p_combo_quota`
--

LOCK TABLES `te_p_combo_quota` WRITE;
/*!40000 ALTER TABLE `te_p_combo_quota` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_p_combo_quota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_p_cou`
--

DROP TABLE IF EXISTS `te_p_cou`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_p_cou` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `store_id` int(11) NOT NULL COMMENT '店铺ID',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `quota_id` int(11) NOT NULL COMMENT '套餐ID',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `tstart` int(10) unsigned NOT NULL COMMENT '开始时间',
  `tend` int(10) unsigned NOT NULL COMMENT '结束时间',
  `state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态 1正常2结束3平台关闭',
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  KEY `quota_id` (`quota_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='加价购';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_p_cou`
--

LOCK TABLES `te_p_cou` WRITE;
/*!40000 ALTER TABLE `te_p_cou` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_p_cou` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_p_cou_level`
--

DROP TABLE IF EXISTS `te_p_cou_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_p_cou_level` (
  `cou_id` int(11) NOT NULL COMMENT '加价购ID',
  `xlevel` tinyint(3) unsigned NOT NULL COMMENT '等级',
  `mincost` decimal(10,2) NOT NULL COMMENT '最低消费金额',
  `maxcou` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最大可凑单数',
  PRIMARY KEY (`cou_id`,`xlevel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='加价购活动规则';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_p_cou_level`
--

LOCK TABLES `te_p_cou_level` WRITE;
/*!40000 ALTER TABLE `te_p_cou_level` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_p_cou_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_p_cou_level_sku`
--

DROP TABLE IF EXISTS `te_p_cou_level_sku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_p_cou_level_sku` (
  `cou_id` int(11) NOT NULL COMMENT '加价购ID',
  `xlevel` tinyint(3) unsigned NOT NULL COMMENT '等级',
  `sku_id` int(11) NOT NULL COMMENT '商品条目ID',
  `price` decimal(10,2) NOT NULL COMMENT '价格',
  PRIMARY KEY (`cou_id`,`xlevel`,`sku_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='加价购活动换购商品';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_p_cou_level_sku`
--

LOCK TABLES `te_p_cou_level_sku` WRITE;
/*!40000 ALTER TABLE `te_p_cou_level_sku` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_p_cou_level_sku` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_p_cou_quota`
--

DROP TABLE IF EXISTS `te_p_cou_quota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_p_cou_quota` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `store_id` int(11) NOT NULL COMMENT '店铺ID',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `tstart` int(10) unsigned NOT NULL COMMENT '开始时间',
  `tend` int(10) unsigned NOT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='加价购套餐';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_p_cou_quota`
--

LOCK TABLES `te_p_cou_quota` WRITE;
/*!40000 ALTER TABLE `te_p_cou_quota` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_p_cou_quota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_p_cou_sku`
--

DROP TABLE IF EXISTS `te_p_cou_sku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_p_cou_sku` (
  `sku_id` int(11) NOT NULL COMMENT '商品条目ID',
  `cou_id` int(11) NOT NULL COMMENT '加价购ID',
  `tstart` int(10) unsigned NOT NULL COMMENT '开始时间',
  `tend` int(10) unsigned NOT NULL COMMENT '结束时间',
  PRIMARY KEY (`sku_id`,`cou_id`),
  KEY `cou_id` (`cou_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='加价购活动商品';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_p_cou_sku`
--

LOCK TABLES `te_p_cou_sku` WRITE;
/*!40000 ALTER TABLE `te_p_cou_sku` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_p_cou_sku` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_p_fcode_quota`
--

DROP TABLE IF EXISTS `te_p_fcode_quota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_p_fcode_quota` (
  `fcq_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'F码套餐id',
  `store_id` int(11) NOT NULL COMMENT '店铺id',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `fcq_starttime` int(11) NOT NULL COMMENT '套餐开始时间',
  `fcq_endtime` int(11) NOT NULL COMMENT '套餐结束时间',
  PRIMARY KEY (`fcq_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='F码商品套餐表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_p_fcode_quota`
--

LOCK TABLES `te_p_fcode_quota` WRITE;
/*!40000 ALTER TABLE `te_p_fcode_quota` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_p_fcode_quota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_p_mansong`
--

DROP TABLE IF EXISTS `te_p_mansong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_p_mansong` (
  `mansong_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '满送活动编号',
  `mansong_name` varchar(50) NOT NULL COMMENT '活动名称',
  `quota_id` int(10) unsigned NOT NULL COMMENT '套餐编号',
  `start_time` int(10) unsigned NOT NULL COMMENT '活动开始时间',
  `end_time` int(10) unsigned NOT NULL COMMENT '活动结束时间',
  `member_id` int(10) unsigned NOT NULL COMMENT '用户编号',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺编号',
  `member_name` varchar(50) NOT NULL COMMENT '用户名',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `state` tinyint(1) unsigned NOT NULL COMMENT '活动状态(1-未发布/2-正常/3-取消/4-失效/5-结束)',
  `remark` varchar(200) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`mansong_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='满就送活动表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_p_mansong`
--

LOCK TABLES `te_p_mansong` WRITE;
/*!40000 ALTER TABLE `te_p_mansong` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_p_mansong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_p_mansong_quota`
--

DROP TABLE IF EXISTS `te_p_mansong_quota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_p_mansong_quota` (
  `quota_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '满就送套餐编号',
  `member_id` int(10) unsigned NOT NULL COMMENT '用户编号',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺编号',
  `member_name` varchar(50) NOT NULL COMMENT '用户名',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `start_time` int(10) unsigned NOT NULL COMMENT '开始时间',
  `end_time` int(10) unsigned NOT NULL COMMENT '结束时间',
  `state` tinyint(1) unsigned DEFAULT '0' COMMENT '配额状态(1-可用/2-取消/3-结束)',
  PRIMARY KEY (`quota_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='满就送套餐表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_p_mansong_quota`
--

LOCK TABLES `te_p_mansong_quota` WRITE;
/*!40000 ALTER TABLE `te_p_mansong_quota` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_p_mansong_quota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_p_mansong_rule`
--

DROP TABLE IF EXISTS `te_p_mansong_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_p_mansong_rule` (
  `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则编号',
  `mansong_id` int(10) unsigned NOT NULL COMMENT '活动编号',
  `price` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '级别价格',
  `discount` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '减现金优惠金额',
  `mansong_goods_name` varchar(50) DEFAULT '' COMMENT '礼品名称',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品编号',
  PRIMARY KEY (`rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='满就送活动规则表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_p_mansong_rule`
--

LOCK TABLES `te_p_mansong_rule` WRITE;
/*!40000 ALTER TABLE `te_p_mansong_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_p_mansong_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_p_sole_goods`
--

DROP TABLE IF EXISTS `te_p_sole_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_p_sole_goods` (
  `sole_goods_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '手机专享商品id',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺id',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品id',
  `sole_price` decimal(10,2) NOT NULL COMMENT '专享价格',
  `gc_id` int(10) unsigned NOT NULL COMMENT '商品分类id',
  `sole_state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '套餐状态 1开启 0关闭 默认1',
  PRIMARY KEY (`sole_goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='手机专享商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_p_sole_goods`
--

LOCK TABLES `te_p_sole_goods` WRITE;
/*!40000 ALTER TABLE `te_p_sole_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_p_sole_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_p_sole_quota`
--

DROP TABLE IF EXISTS `te_p_sole_quota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_p_sole_quota` (
  `sole_quota_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '套餐id',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺id',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `sole_quota_starttime` int(10) unsigned NOT NULL COMMENT '开始时间',
  `sole_quota_endtime` int(10) unsigned NOT NULL COMMENT '结束时间',
  `sole_state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '套餐状态 1开启 0关闭 默认1',
  PRIMARY KEY (`sole_quota_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='手机专享套餐表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_p_sole_quota`
--

LOCK TABLES `te_p_sole_quota` WRITE;
/*!40000 ALTER TABLE `te_p_sole_quota` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_p_sole_quota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_p_xianshi`
--

DROP TABLE IF EXISTS `te_p_xianshi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_p_xianshi` (
  `xianshi_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '限时编号',
  `xianshi_name` varchar(50) NOT NULL COMMENT '活动名称',
  `xianshi_title` varchar(10) DEFAULT NULL COMMENT '活动标题',
  `xianshi_explain` varchar(50) DEFAULT NULL COMMENT '活动说明',
  `quota_id` int(10) unsigned NOT NULL COMMENT '套餐编号',
  `start_time` int(10) unsigned NOT NULL COMMENT '活动开始时间',
  `end_time` int(10) unsigned NOT NULL COMMENT '活动结束时间',
  `member_id` int(10) unsigned NOT NULL COMMENT '用户编号',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺编号',
  `member_name` varchar(50) NOT NULL COMMENT '用户名',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `lower_limit` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '购买下限，1为不限制',
  `state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态，0-取消 1-正常',
  PRIMARY KEY (`xianshi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='限时折扣活动表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_p_xianshi`
--

LOCK TABLES `te_p_xianshi` WRITE;
/*!40000 ALTER TABLE `te_p_xianshi` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_p_xianshi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_p_xianshi_goods`
--

DROP TABLE IF EXISTS `te_p_xianshi_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_p_xianshi_goods` (
  `xianshi_goods_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '限时折扣商品表',
  `xianshi_id` int(10) unsigned NOT NULL COMMENT '限时活动编号',
  `xianshi_name` varchar(50) NOT NULL COMMENT '活动名称',
  `xianshi_title` varchar(10) DEFAULT NULL COMMENT '活动标题',
  `xianshi_explain` varchar(50) DEFAULT NULL COMMENT '活动说明',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品编号',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺编号',
  `goods_name` varchar(100) NOT NULL COMMENT '商品名称',
  `goods_price` decimal(10,2) NOT NULL COMMENT '店铺价格',
  `xianshi_price` decimal(10,2) NOT NULL COMMENT '限时折扣价格',
  `goods_image` varchar(100) NOT NULL COMMENT '商品图片',
  `start_time` int(10) unsigned NOT NULL COMMENT '开始时间',
  `end_time` int(10) unsigned NOT NULL COMMENT '结束时间',
  `lower_limit` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '购买下限，0为不限制',
  `state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态，0-取消 1-正常',
  `xianshi_recommend` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '推荐标志 0-未推荐 1-已推荐',
  `gc_id_1` mediumint(9) DEFAULT '0' COMMENT '商品分类一级ID',
  PRIMARY KEY (`xianshi_goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='限时折扣商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_p_xianshi_goods`
--

LOCK TABLES `te_p_xianshi_goods` WRITE;
/*!40000 ALTER TABLE `te_p_xianshi_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_p_xianshi_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_p_xianshi_quota`
--

DROP TABLE IF EXISTS `te_p_xianshi_quota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_p_xianshi_quota` (
  `quota_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '限时折扣套餐编号',
  `member_id` int(10) unsigned NOT NULL COMMENT '用户编号',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺编号',
  `member_name` varchar(50) NOT NULL COMMENT '用户名',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `start_time` int(10) unsigned NOT NULL COMMENT '套餐开始时间',
  `end_time` int(10) unsigned NOT NULL COMMENT '套餐结束时间',
  PRIMARY KEY (`quota_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='限时折扣套餐表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_p_xianshi_quota`
--

LOCK TABLES `te_p_xianshi_quota` WRITE;
/*!40000 ALTER TABLE `te_p_xianshi_quota` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_p_xianshi_quota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_payment`
--

DROP TABLE IF EXISTS `te_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_payment` (
  `payment_id` tinyint(1) unsigned NOT NULL COMMENT '支付索引id',
  `payment_code` char(10) NOT NULL COMMENT '支付代码名称',
  `payment_name` char(10) NOT NULL COMMENT '支付名称',
  `payment_config` text COMMENT '支付接口配置信息',
  `payment_state` enum('0','1') NOT NULL DEFAULT '0' COMMENT '接口状态0禁用1启用',
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='支付方式表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_payment`
--

LOCK TABLES `te_payment` WRITE;
/*!40000 ALTER TABLE `te_payment` DISABLE KEYS */;
INSERT INTO `te_payment` VALUES (1,'offline','货到付款','a:1:{s:0:\"\";s:0:\"\";}','0'),(2,'alipay','支付宝','a:4:{s:14:\"alipay_service\";s:25:\"create_direct_pay_by_user\";s:14:\"alipay_account\";s:0:\"\";s:10:\"alipay_key\";s:0:\"\";s:14:\"alipay_partner\";s:0:\"\";}','0'),(3,'tenpay','财付通','a:2:{s:14:\"tenpay_account\";s:0:\"\";s:10:\"tenpay_key\";s:0:\"\";}','0'),(4,'chinabank','网银在线','a:2:{s:17:\"chinabank_account\";s:0:\"\";s:13:\"chinabank_key\";s:0:\"\";}','0'),(5,'predeposit','站内余额支付','a:1:{s:0:\"\";s:0:\"\";}','1'),(6,'wxpay','微信支付','a:3:{s:5:\"appid\";s:0:\"\";s:5:\"mchid\";s:0:\"\";s:3:\"key\";s:0:\"\";}','0');
/*!40000 ALTER TABLE `te_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_pd_cash`
--

DROP TABLE IF EXISTS `te_pd_cash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_pd_cash` (
  `pdc_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增编号',
  `pdc_sn` bigint(20) NOT NULL COMMENT '记录唯一标示',
  `pdc_member_id` int(11) NOT NULL COMMENT '会员编号',
  `pdc_member_name` varchar(50) NOT NULL COMMENT '会员名称',
  `pdc_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `pdc_bank_name` varchar(40) NOT NULL COMMENT '收款银行',
  `pdc_bank_no` varchar(30) DEFAULT NULL COMMENT '收款账号',
  `pdc_bank_user` varchar(10) DEFAULT NULL COMMENT '开户人姓名',
  `pdc_add_time` int(11) NOT NULL COMMENT '添加时间',
  `pdc_payment_time` int(11) DEFAULT NULL COMMENT '付款时间',
  `pdc_payment_state` enum('0','1') NOT NULL DEFAULT '0' COMMENT '提现支付状态 0默认1支付完成',
  `pdc_payment_admin` varchar(30) DEFAULT NULL COMMENT '支付管理员',
  PRIMARY KEY (`pdc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='预存款提现记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_pd_cash`
--

LOCK TABLES `te_pd_cash` WRITE;
/*!40000 ALTER TABLE `te_pd_cash` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_pd_cash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_pd_log`
--

DROP TABLE IF EXISTS `te_pd_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_pd_log` (
  `lg_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增编号',
  `lg_member_id` int(11) NOT NULL COMMENT '会员编号',
  `lg_member_name` varchar(50) NOT NULL COMMENT '会员名称',
  `lg_admin_name` varchar(50) DEFAULT NULL COMMENT '管理员名称',
  `lg_type` varchar(15) NOT NULL DEFAULT '' COMMENT 'order_pay下单支付预存款,order_freeze下单冻结预存款,order_cancel取消订单解冻预存款,order_comb_pay下单支付被冻结的预存款,recharge充值,cash_apply申请提现冻结预存款,cash_pay提现成功,cash_del取消提现申请，解冻预存款,refund退款',
  `lg_av_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '可用金额变更0表示未变更',
  `lg_freeze_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '冻结金额变更0表示未变更',
  `lg_add_time` int(11) NOT NULL COMMENT '添加时间',
  `lg_desc` varchar(150) DEFAULT NULL COMMENT '描述',
  `lg_invite_member_id` int(11) DEFAULT '0' COMMENT '原始会员编号',
  PRIMARY KEY (`lg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='预存款变更日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_pd_log`
--

LOCK TABLES `te_pd_log` WRITE;
/*!40000 ALTER TABLE `te_pd_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_pd_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_pd_recharge`
--

DROP TABLE IF EXISTS `te_pd_recharge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_pd_recharge` (
  `pdr_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增编号',
  `pdr_sn` bigint(20) unsigned NOT NULL COMMENT '记录唯一标示',
  `pdr_member_id` int(11) NOT NULL COMMENT '会员编号',
  `pdr_member_name` varchar(50) NOT NULL COMMENT '会员名称',
  `pdr_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '充值金额',
  `pdr_payment_code` varchar(20) DEFAULT '' COMMENT '支付方式',
  `pdr_payment_name` varchar(15) DEFAULT '' COMMENT '支付方式',
  `pdr_trade_sn` varchar(50) DEFAULT '' COMMENT '第三方支付接口交易号',
  `pdr_add_time` int(11) NOT NULL COMMENT '添加时间',
  `pdr_payment_state` enum('0','1') NOT NULL DEFAULT '0' COMMENT '支付状态 0未支付1支付',
  `pdr_payment_time` int(11) NOT NULL DEFAULT '0' COMMENT '支付时间',
  `pdr_admin` varchar(30) DEFAULT '' COMMENT '管理员名',
  PRIMARY KEY (`pdr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='预存款充值表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_pd_recharge`
--

LOCK TABLES `te_pd_recharge` WRITE;
/*!40000 ALTER TABLE `te_pd_recharge` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_pd_recharge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_points_cart`
--

DROP TABLE IF EXISTS `te_points_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_points_cart` (
  `pcart_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `pmember_id` int(11) NOT NULL COMMENT '会员编号',
  `pgoods_id` int(11) NOT NULL COMMENT '积分礼品序号',
  `pgoods_name` varchar(100) NOT NULL COMMENT '积分礼品名称',
  `pgoods_points` int(11) NOT NULL COMMENT '积分礼品兑换积分',
  `pgoods_choosenum` int(11) NOT NULL COMMENT '选择积分礼品数量',
  `pgoods_image` varchar(100) DEFAULT NULL COMMENT '积分礼品图片',
  PRIMARY KEY (`pcart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='积分礼品兑换购物车';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_points_cart`
--

LOCK TABLES `te_points_cart` WRITE;
/*!40000 ALTER TABLE `te_points_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_points_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_points_goods`
--

DROP TABLE IF EXISTS `te_points_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_points_goods` (
  `pgoods_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '积分礼品索引id',
  `pgoods_name` varchar(100) NOT NULL COMMENT '积分礼品名称',
  `pgoods_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '积分礼品原价',
  `pgoods_points` int(11) NOT NULL COMMENT '积分礼品兑换所需积分',
  `pgoods_image` varchar(100) DEFAULT '' COMMENT '积分礼品默认封面图片',
  `pgoods_tag` varchar(100) DEFAULT '' COMMENT '积分礼品标签',
  `pgoods_serial` varchar(50) NOT NULL COMMENT '积分礼品货号',
  `pgoods_storage` int(11) NOT NULL DEFAULT '0' COMMENT '积分礼品库存数',
  `pgoods_show` tinyint(1) NOT NULL COMMENT '积分礼品上架 0表示下架 1表示上架',
  `pgoods_commend` tinyint(1) NOT NULL COMMENT '积分礼品推荐',
  `pgoods_add_time` int(11) NOT NULL COMMENT '积分礼品添加时间',
  `pgoods_keywords` varchar(100) DEFAULT NULL COMMENT '积分礼品关键字',
  `pgoods_description` varchar(200) DEFAULT NULL COMMENT '积分礼品描述',
  `pgoods_body` text NOT NULL COMMENT '积分礼品详细内容',
  `pgoods_state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '积分礼品状态，0开启，1禁售',
  `pgoods_close_reason` varchar(255) DEFAULT NULL COMMENT '积分礼品禁售原因',
  `pgoods_salenum` int(11) NOT NULL DEFAULT '0' COMMENT '积分礼品售出数量',
  `pgoods_view` int(11) NOT NULL DEFAULT '0' COMMENT '积分商品浏览次数',
  `pgoods_islimit` tinyint(1) NOT NULL COMMENT '是否限制每会员兑换数量',
  `pgoods_limitnum` int(11) DEFAULT NULL COMMENT '每会员限制兑换数量',
  `pgoods_islimittime` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否限制兑换时间 0为不限制 1为限制',
  `pgoods_limitmgrade` int(11) NOT NULL DEFAULT '0' COMMENT '限制参与兑换的会员级别',
  `pgoods_starttime` int(11) DEFAULT NULL COMMENT '兑换开始时间',
  `pgoods_endtime` int(11) DEFAULT NULL COMMENT '兑换结束时间',
  `pgoods_sort` int(11) NOT NULL DEFAULT '0' COMMENT '礼品排序',
  PRIMARY KEY (`pgoods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='积分礼品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_points_goods`
--

LOCK TABLES `te_points_goods` WRITE;
/*!40000 ALTER TABLE `te_points_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_points_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_points_log`
--

DROP TABLE IF EXISTS `te_points_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_points_log` (
  `pl_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '积分日志编号',
  `pl_memberid` int(11) NOT NULL COMMENT '会员编号',
  `pl_membername` varchar(100) NOT NULL COMMENT '会员名称',
  `pl_adminid` int(11) DEFAULT NULL COMMENT '管理员编号',
  `pl_adminname` varchar(100) DEFAULT NULL COMMENT '管理员名称',
  `pl_points` int(11) NOT NULL DEFAULT '0' COMMENT '积分数负数表示扣除',
  `pl_addtime` int(11) NOT NULL COMMENT '添加时间',
  `pl_desc` varchar(100) NOT NULL COMMENT '操作描述',
  `pl_stage` varchar(50) NOT NULL COMMENT '操作阶段',
  PRIMARY KEY (`pl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员积分日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_points_log`
--

LOCK TABLES `te_points_log` WRITE;
/*!40000 ALTER TABLE `te_points_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_points_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_points_order`
--

DROP TABLE IF EXISTS `te_points_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_points_order` (
  `point_orderid` int(11) NOT NULL AUTO_INCREMENT COMMENT '兑换订单编号',
  `point_ordersn` varchar(20) NOT NULL COMMENT '兑换订单编号',
  `point_buyerid` int(11) NOT NULL COMMENT '兑换会员id',
  `point_buyername` varchar(50) NOT NULL COMMENT '兑换会员姓名',
  `point_buyeremail` varchar(100) NOT NULL COMMENT '兑换会员email',
  `point_addtime` int(11) NOT NULL COMMENT '兑换订单生成时间',
  `point_shippingtime` int(11) DEFAULT NULL COMMENT '配送时间',
  `point_shippingcode` varchar(50) DEFAULT NULL COMMENT '物流单号',
  `point_shipping_ecode` varchar(30) DEFAULT NULL COMMENT '物流公司编码',
  `point_finnshedtime` int(11) DEFAULT NULL COMMENT '订单完成时间',
  `point_allpoint` int(11) NOT NULL DEFAULT '0' COMMENT '兑换总积分',
  `point_ordermessage` varchar(300) DEFAULT NULL COMMENT '订单留言',
  `point_orderstate` int(11) NOT NULL DEFAULT '20' COMMENT '订单状态：20(默认):已兑换并扣除积分;30:已发货;40:已收货;50已完成;2已取消',
  PRIMARY KEY (`point_orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='兑换订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_points_order`
--

LOCK TABLES `te_points_order` WRITE;
/*!40000 ALTER TABLE `te_points_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_points_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_points_orderaddress`
--

DROP TABLE IF EXISTS `te_points_orderaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_points_orderaddress` (
  `point_oaid` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `point_orderid` int(11) NOT NULL COMMENT '订单id',
  `point_truename` varchar(50) NOT NULL COMMENT '收货人姓名',
  `point_areaid` int(11) NOT NULL COMMENT '地区id',
  `point_areainfo` varchar(100) NOT NULL COMMENT '地区内容',
  `point_address` varchar(200) NOT NULL COMMENT '详细地址',
  `point_telphone` varchar(20) DEFAULT '' COMMENT '电话号码',
  `point_mobphone` varchar(20) DEFAULT '' COMMENT '手机号码',
  PRIMARY KEY (`point_oaid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='兑换订单地址表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_points_orderaddress`
--

LOCK TABLES `te_points_orderaddress` WRITE;
/*!40000 ALTER TABLE `te_points_orderaddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_points_orderaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_points_ordergoods`
--

DROP TABLE IF EXISTS `te_points_ordergoods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_points_ordergoods` (
  `point_recid` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单礼品表索引',
  `point_orderid` int(11) NOT NULL COMMENT '订单id',
  `point_goodsid` int(11) NOT NULL COMMENT '礼品id',
  `point_goodsname` varchar(100) NOT NULL COMMENT '礼品名称',
  `point_goodspoints` int(11) NOT NULL COMMENT '礼品兑换积分',
  `point_goodsnum` int(11) NOT NULL COMMENT '礼品数量',
  `point_goodsimage` varchar(100) DEFAULT NULL COMMENT '礼品图片',
  PRIMARY KEY (`point_recid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='兑换订单商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_points_ordergoods`
--

LOCK TABLES `te_points_ordergoods` WRITE;
/*!40000 ALTER TABLE `te_points_ordergoods` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_points_ordergoods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_rcb_log`
--

DROP TABLE IF EXISTS `te_rcb_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_rcb_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增编号',
  `member_id` int(11) NOT NULL COMMENT '会员编号',
  `member_name` varchar(50) NOT NULL COMMENT '会员名称',
  `type` varchar(15) NOT NULL DEFAULT '' COMMENT 'order_pay下单使用 order_freeze下单冻结 order_cancel取消订单解冻 order_comb_pay下单扣除被冻结 recharge平台充值卡充值 refund确认退款 vr_refund虚拟兑码退款',
  `add_time` int(11) NOT NULL COMMENT '添加时间',
  `available_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '可用充值卡余额变更 0表示未变更',
  `freeze_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '冻结充值卡余额变更 0表示未变更',
  `description` varchar(150) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='充值卡余额变更日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_rcb_log`
--

LOCK TABLES `te_rcb_log` WRITE;
/*!40000 ALTER TABLE `te_rcb_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_rcb_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_rec_position`
--

DROP TABLE IF EXISTS `te_rec_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_rec_position` (
  `rec_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `pic_type` enum('1','2','0') NOT NULL DEFAULT '1' COMMENT '0文字1本地图片2远程',
  `title` varchar(200) DEFAULT '' COMMENT '标题',
  `content` text NOT NULL COMMENT '序列化推荐位内容',
  PRIMARY KEY (`rec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='推荐位';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_rec_position`
--

LOCK TABLES `te_rec_position` WRITE;
/*!40000 ALTER TABLE `te_rec_position` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_rec_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_rechargecard`
--

DROP TABLE IF EXISTS `te_rechargecard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_rechargecard` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `sn` varchar(50) NOT NULL COMMENT '卡号',
  `denomination` decimal(10,2) NOT NULL COMMENT '面额',
  `batchflag` varchar(20) DEFAULT '' COMMENT '批次标识',
  `admin_name` varchar(50) DEFAULT NULL COMMENT '创建者名称',
  `tscreated` int(10) unsigned NOT NULL COMMENT '创建时间',
  `tsused` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '使用时间',
  `state` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态 0可用 1已用 2已删',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '使用者会员ID',
  `member_name` varchar(50) DEFAULT NULL COMMENT '使用者会员名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='平台充值卡';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_rechargecard`
--

LOCK TABLES `te_rechargecard` WRITE;
/*!40000 ALTER TABLE `te_rechargecard` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_rechargecard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_redpacket`
--

DROP TABLE IF EXISTS `te_redpacket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_redpacket` (
  `rpacket_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '红包编号',
  `rpacket_code` varchar(32) NOT NULL COMMENT '红包编码',
  `rpacket_t_id` int(11) NOT NULL COMMENT '红包模版编号',
  `rpacket_title` varchar(50) NOT NULL COMMENT '红包标题',
  `rpacket_desc` varchar(255) NOT NULL COMMENT '红包描述',
  `rpacket_start_date` int(11) NOT NULL COMMENT '红包有效期开始时间',
  `rpacket_end_date` int(11) NOT NULL COMMENT '红包有效期结束时间',
  `rpacket_price` int(11) NOT NULL COMMENT '红包面额',
  `rpacket_limit` decimal(10,2) NOT NULL COMMENT '红包使用时的订单限额',
  `rpacket_state` tinyint(4) NOT NULL COMMENT '红包状态(1-未用,2-已用,3-过期)',
  `rpacket_active_date` int(11) NOT NULL COMMENT '红包发放日期',
  `rpacket_owner_id` int(11) NOT NULL COMMENT '红包所有者id',
  `rpacket_owner_name` varchar(50) DEFAULT NULL COMMENT '红包所有者名称',
  `rpacket_order_id` bigint(20) DEFAULT NULL COMMENT '使用该红包的订单支付单号',
  `rpacket_pwd` varchar(100) DEFAULT NULL COMMENT '红包卡密',
  `rpacket_pwd2` varchar(100) DEFAULT NULL COMMENT '红包卡密2',
  `rpacket_customimg` varchar(1000) DEFAULT NULL COMMENT '红包自定义图片',
  PRIMARY KEY (`rpacket_id`),
  UNIQUE KEY `rpacket_pwd` (`rpacket_pwd`),
  UNIQUE KEY `rpacket_pwd2` (`rpacket_pwd2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='红包表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_redpacket`
--

LOCK TABLES `te_redpacket` WRITE;
/*!40000 ALTER TABLE `te_redpacket` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_redpacket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_redpacket_template`
--

DROP TABLE IF EXISTS `te_redpacket_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_redpacket_template` (
  `rpacket_t_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '红包模版编号',
  `rpacket_t_title` varchar(50) NOT NULL COMMENT '红包模版名称',
  `rpacket_t_desc` varchar(255) NOT NULL COMMENT '红包模版描述',
  `rpacket_t_start_date` int(11) NOT NULL COMMENT '红包模版有效期开始时间',
  `rpacket_t_end_date` int(11) NOT NULL COMMENT '红包模版有效期结束时间',
  `rpacket_t_price` decimal(10,2) NOT NULL COMMENT '红包模版面额',
  `rpacket_t_limit` decimal(10,2) NOT NULL COMMENT '红包使用时的订单限额',
  `rpacket_t_adminid` int(11) NOT NULL COMMENT '修改管理员ID',
  `rpacket_t_state` tinyint(4) NOT NULL COMMENT '模版状态(1-有效,2-失效)',
  `rpacket_t_total` int(11) NOT NULL COMMENT '模版可发放的红包总数',
  `rpacket_t_giveout` int(11) NOT NULL COMMENT '模版已发放的红包数量',
  `rpacket_t_used` int(11) NOT NULL COMMENT '模版已经使用过的红包数量',
  `rpacket_t_updatetime` int(11) NOT NULL COMMENT '模版的创建时间',
  `rpacket_t_points` int(11) NOT NULL DEFAULT '0' COMMENT '兑换所需积分',
  `rpacket_t_eachlimit` int(11) NOT NULL DEFAULT '1' COMMENT '每人限领张数',
  `rpacket_t_customimg` varchar(200) DEFAULT NULL COMMENT '自定义模板图片',
  `rpacket_t_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推荐 0不推荐 1推荐',
  `rpacket_t_gettype` tinyint(1) NOT NULL DEFAULT '1' COMMENT '领取方式 1积分兑换 2卡密兑换 3免费领取',
  `rpacket_t_isbuild` tinyint(1) NOT NULL DEFAULT '0' COMMENT '领取方式为卡密兑换是否已经生成下属红包 0未生成 1已生成',
  `rpacket_t_mgradelimit` tinyint(2) NOT NULL DEFAULT '0' COMMENT '领取限制的会员等级',
  PRIMARY KEY (`rpacket_t_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='红包模版表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_redpacket_template`
--

LOCK TABLES `te_redpacket_template` WRITE;
/*!40000 ALTER TABLE `te_redpacket_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_redpacket_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_refund_detail`
--

DROP TABLE IF EXISTS `te_refund_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_refund_detail` (
  `refund_id` int(10) unsigned NOT NULL COMMENT '记录ID',
  `order_id` int(10) unsigned NOT NULL COMMENT '订单ID',
  `batch_no` varchar(32) NOT NULL COMMENT '批次号',
  `refund_amount` decimal(10,2) DEFAULT '0.00' COMMENT '退款金额',
  `pay_amount` decimal(10,2) DEFAULT '0.00' COMMENT '在线退款金额',
  `pd_amount` decimal(10,2) DEFAULT '0.00' COMMENT '预存款金额',
  `rcb_amount` decimal(10,2) DEFAULT '0.00' COMMENT '充值卡金额',
  `refund_code` char(10) NOT NULL DEFAULT 'predeposit' COMMENT '退款支付代码',
  `refund_state` tinyint(1) unsigned DEFAULT '1' COMMENT '退款状态:1为处理中,2为已完成,默认为1',
  `add_time` int(10) unsigned NOT NULL COMMENT '添加时间',
  `pay_time` int(10) unsigned DEFAULT '0' COMMENT '在线退款完成时间,默认为0',
  PRIMARY KEY (`refund_id`),
  KEY `batch_no` (`batch_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='退款详细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_refund_detail`
--

LOCK TABLES `te_refund_detail` WRITE;
/*!40000 ALTER TABLE `te_refund_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_refund_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_refund_reason`
--

DROP TABLE IF EXISTS `te_refund_reason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_refund_reason` (
  `reason_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '原因ID',
  `reason_info` varchar(50) NOT NULL COMMENT '原因内容',
  `sort` tinyint(1) unsigned DEFAULT '255' COMMENT '排序',
  `update_time` int(10) unsigned NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`reason_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='退款退货原因表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_refund_reason`
--

LOCK TABLES `te_refund_reason` WRITE;
/*!40000 ALTER TABLE `te_refund_reason` DISABLE KEYS */;
INSERT INTO `te_refund_reason` VALUES (95,'效果不好不喜欢',123,1435766400),(96,'商品破损、有污渍',123,1435766400),(97,'保质期不符',123,1435766400),(98,'认为是假货',123,1435766400),(99,'不能按时发货',123,1435766400);
/*!40000 ALTER TABLE `te_refund_reason` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_refund_return`
--

DROP TABLE IF EXISTS `te_refund_return`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_refund_return` (
  `refund_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `order_id` int(10) unsigned NOT NULL COMMENT '订单ID',
  `order_sn` varchar(50) NOT NULL COMMENT '订单编号',
  `refund_sn` varchar(50) NOT NULL COMMENT '申请编号',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺ID',
  `store_name` varchar(20) NOT NULL COMMENT '店铺名称',
  `buyer_id` int(10) unsigned NOT NULL COMMENT '买家ID',
  `buyer_name` varchar(50) NOT NULL COMMENT '买家会员名',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品ID,全部退款是0',
  `order_goods_id` int(10) unsigned DEFAULT '0' COMMENT '订单商品ID,全部退款是0',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称',
  `goods_num` int(10) unsigned DEFAULT '1' COMMENT '商品数量',
  `refund_amount` decimal(10,2) DEFAULT '0.00' COMMENT '退款金额',
  `goods_image` varchar(100) DEFAULT NULL COMMENT '商品图片',
  `order_goods_type` tinyint(1) unsigned DEFAULT '1' COMMENT '订单商品类型:1默认2抢购商品3限时折扣商品4组合套装',
  `refund_type` tinyint(1) unsigned DEFAULT '1' COMMENT '申请类型:1为退款,2为退货,默认为1',
  `seller_state` tinyint(1) unsigned DEFAULT '1' COMMENT '卖家处理状态:1为待审核,2为同意,3为不同意,默认为1',
  `refund_state` tinyint(1) unsigned DEFAULT '1' COMMENT '申请状态:1为处理中,2为待管理员处理,3为已完成,默认为1',
  `return_type` tinyint(1) unsigned DEFAULT '1' COMMENT '退货类型:1为不用退货,2为需要退货,默认为1',
  `order_lock` tinyint(1) unsigned DEFAULT '1' COMMENT '订单锁定类型:1为不用锁定,2为需要锁定,默认为1',
  `goods_state` tinyint(1) unsigned DEFAULT '1' COMMENT '物流状态:1为待发货,2为待收货,3为未收到,4为已收货,默认为1',
  `add_time` int(10) unsigned NOT NULL COMMENT '添加时间',
  `seller_time` int(10) unsigned DEFAULT '0' COMMENT '卖家处理时间',
  `admin_time` int(10) unsigned DEFAULT '0' COMMENT '管理员处理时间,默认为0',
  `reason_id` int(10) unsigned DEFAULT '0' COMMENT '原因ID:0为其它',
  `reason_info` varchar(300) DEFAULT '' COMMENT '原因内容',
  `pic_info` varchar(300) DEFAULT '' COMMENT '图片',
  `buyer_message` varchar(300) DEFAULT NULL COMMENT '申请原因',
  `seller_message` varchar(300) DEFAULT NULL COMMENT '卖家备注',
  `admin_message` varchar(300) DEFAULT NULL COMMENT '管理员备注',
  `express_id` tinyint(1) unsigned DEFAULT '0' COMMENT '物流公司编号',
  `invoice_no` varchar(50) DEFAULT NULL COMMENT '物流单号',
  `ship_time` int(10) unsigned DEFAULT '0' COMMENT '发货时间,默认为0',
  `delay_time` int(10) unsigned DEFAULT '0' COMMENT '收货延迟时间,默认为0',
  `receive_time` int(10) unsigned DEFAULT '0' COMMENT '收货时间,默认为0',
  `receive_message` varchar(300) DEFAULT NULL COMMENT '收货备注',
  `commis_rate` smallint(6) DEFAULT '0' COMMENT '佣金比例',
  `rpt_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '退款红包值，默认0，只有全部退款时才把该订单使用的红包金额写到此处',
  PRIMARY KEY (`refund_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='退款退货表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_refund_return`
--

LOCK TABLES `te_refund_return` WRITE;
/*!40000 ALTER TABLE `te_refund_return` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_refund_return` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_seller`
--

DROP TABLE IF EXISTS `te_seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_seller` (
  `seller_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '卖家编号',
  `seller_name` varchar(50) NOT NULL COMMENT '卖家用户名',
  `member_id` int(10) unsigned NOT NULL COMMENT '用户编号',
  `seller_group_id` int(10) unsigned NOT NULL COMMENT '卖家组编号',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺编号',
  `is_admin` tinyint(3) unsigned NOT NULL COMMENT '是否管理员(0-不是 1-是)',
  `seller_quicklink` varchar(255) DEFAULT NULL COMMENT '卖家快捷操作',
  `last_login_time` int(10) unsigned DEFAULT NULL COMMENT '最后登录时间',
  `is_client` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否客户端用户 0-否 1-是',
  PRIMARY KEY (`seller_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='卖家用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_seller`
--

LOCK TABLES `te_seller` WRITE;
/*!40000 ALTER TABLE `te_seller` DISABLE KEYS */;
INSERT INTO `te_seller` VALUES (1,'admin',1,0,1,1,NULL,NULL,0);
/*!40000 ALTER TABLE `te_seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_seller_group`
--

DROP TABLE IF EXISTS `te_seller_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_seller_group` (
  `group_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '卖家组编号',
  `group_name` varchar(50) NOT NULL COMMENT '组名',
  `limits` text NOT NULL COMMENT '权限',
  `smt_limits` text COMMENT '消息权限范围',
  `gc_limits` tinyint(3) unsigned DEFAULT '1' COMMENT '1拥有所有分类权限，0拥有部分分类权限',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺编号',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='卖家用户组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_seller_group`
--

LOCK TABLES `te_seller_group` WRITE;
/*!40000 ALTER TABLE `te_seller_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_seller_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_seller_group_bclass`
--

DROP TABLE IF EXISTS `te_seller_group_bclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_seller_group_bclass` (
  `bid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(11) unsigned DEFAULT '0' COMMENT '权限组ID',
  `class_1` mediumint(9) unsigned DEFAULT '0' COMMENT '一级分类',
  `class_2` mediumint(9) unsigned DEFAULT '0' COMMENT '二级分类',
  `class_3` mediumint(9) unsigned DEFAULT '0' COMMENT '三级分类',
  `gc_id` mediumint(9) unsigned DEFAULT '0' COMMENT '最底级分类',
  PRIMARY KEY (`bid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商家内部组商品类目表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_seller_group_bclass`
--

LOCK TABLES `te_seller_group_bclass` WRITE;
/*!40000 ALTER TABLE `te_seller_group_bclass` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_seller_group_bclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_seller_log`
--

DROP TABLE IF EXISTS `te_seller_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_seller_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '日志编号',
  `log_content` varchar(500) NOT NULL COMMENT '日志内容',
  `log_time` int(10) unsigned NOT NULL COMMENT '日志时间',
  `log_seller_id` int(10) unsigned NOT NULL COMMENT '卖家编号',
  `log_seller_name` varchar(50) NOT NULL COMMENT '卖家账号',
  `log_store_id` int(10) unsigned NOT NULL COMMENT '店铺编号',
  `log_seller_ip` varchar(50) NOT NULL COMMENT '卖家ip',
  `log_url` varchar(50) NOT NULL COMMENT '日志url',
  `log_state` tinyint(3) unsigned NOT NULL COMMENT '日志状态(0-失败 1-成功)',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='卖家日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_seller_log`
--

LOCK TABLES `te_seller_log` WRITE;
/*!40000 ALTER TABLE `te_seller_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_seller_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_seo`
--

DROP TABLE IF EXISTS `te_seo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_seo` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `keywords` varchar(255) NOT NULL COMMENT '关键词',
  `description` text NOT NULL COMMENT '描述',
  `type` varchar(20) NOT NULL COMMENT '类型',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='SEO信息存放表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_seo`
--

LOCK TABLES `te_seo` WRITE;
/*!40000 ALTER TABLE `te_seo` DISABLE KEYS */;
INSERT INTO `te_seo` VALUES (1,'{sitename} - Powered by 33hao.com','33hao,PHP商城系统,好商城商城系统,多用户商城系统,电商ERP,电商CRM,电子商务解决方案','33hao专注于研发符合时代发展需要的电子商务商城系统，以专业化的服务水平为企业级用户提供B(2B)2C【B2B2C】电子商务平台解决方案，全力打造电商平台专项ERP(CRM)系统、ERP(RFID)系统等，引领中国电子商务行业企业级需求的发展方向。咨询电话：400-333-8888','index'),(2,'{sitename} - 抢购','33hao,{sitename}','33hao专注于研发符合时代发展需要的电子商务商城系统，以专业化的服务水平为企业级用户提供B(2B)2C【B2B2C】电子商务平台解决方案，全力打造电商平台专项ERP(CRM)系统、ERP(RFID)系统等，引领中国电子商务行业企业级需求的发展方向。咨询电话：400-333-8888','group'),(3,'{sitename} - {name}','33hao,{name},{sitename}','33hao,{name},{sitename}','group_content'),(4,'{sitename} - 品牌','33hao,{sitename}','33hao,{sitename}','brand'),(5,'{sitename} - {name}','33hao,{sitename},{name}','33hao,{sitename},{name}','brand_list'),(7,'{sitename} - {name}','33hao,{sitename},{name}','33hao,{sitename},{name}','coupon_content'),(8,'{sitename} - 积分商城','33hao,{sitename}','33hao,{sitename}','point'),(9,'{sitename} - {name}','33hao,{sitename},{key}','33hao,{sitename},{description}','point_content'),(10,'{sitename} - {article_class}','33hao,{sitename}','33hao,{sitename}','article'),(11,'{sitename} - {name}','33hao,{sitename},{key}','33hao,{sitename},{description}','article_content'),(12,'{sitename} - {shopname}','33hao,{sitename},{key}','33hao,{sitename},{description}','shop'),(13,'{name} - {sitename}','33hao,{sitename}','33hao,{sitename}','product'),(14,'看{name}怎么淘到好的宝贝-{sitename}','33hao,{sitename},{name}','33hao,{sitename},{name}','sns');
/*!40000 ALTER TABLE `te_seo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_setting`
--

DROP TABLE IF EXISTS `te_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_setting` (
  `name` varchar(50) NOT NULL COMMENT '名称',
  `value` text COMMENT '值',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统设置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_setting`
--

LOCK TABLES `te_setting` WRITE;
/*!40000 ALTER TABLE `te_setting` DISABLE KEYS */;
INSERT INTO `te_setting` VALUES ('app_qq_akey','1'),('app_qq_isuse','1'),('app_qq_skey','1'),('app_sina_akey','1'),('app_sina_isuse','1'),('app_sina_skey','1'),('app_weixin_appid','1'),('app_weixin_isuse','1'),('app_weixin_secret','1'),('captcha_status_goodsqa','1'),('captcha_status_login','1'),('captcha_status_register','1'),('circle_contentleast','10'),('circle_createsum','6'),('circle_exprelease','2'),('circle_expreleasemax','10'),('circle_expreplied','3'),('circle_exprepliedmax','1000'),('circle_expreply','1'),('circle_intervaltime','1'),('circle_iscreate','1'),('circle_istalk','1'),('circle_isuse','1'),('circle_joinsum','12'),('circle_loginpic','a:4:{i:1;a:2:{s:3:\"pic\";s:5:\"1.jpg\";s:3:\"url\";s:22:\"http://www.33hao.com/\";}i:2;a:2:{s:3:\"pic\";s:5:\"2.jpg\";s:3:\"url\";s:22:\"http://www.33hao.com/\";}i:3;a:2:{s:3:\"pic\";s:5:\"3.jpg\";s:3:\"url\";s:22:\"http://www.33hao.com/\";}i:4;a:2:{s:3:\"pic\";s:5:\"4.jpg\";s:3:\"url\";s:22:\"http://www.33hao.com/\";}}'),('circle_logo','logo.png'),('circle_managesum','4'),('circle_name','33Hao圈子'),('circle_seodescription','发现精彩：圈子是买家们自己创建的私属领地，我们排斥广告分子，我们热爱真实分享！'),('circle_seokeywords','圈子,帮派,讨论小组,购物,生活,分享,show,秀,商品,电子商务,社区,消费者社区,论坛,资讯,热门话题,朋友'),('circle_seotitle','发现精彩 - 33Hao圈子'),('circle_wordfilter',NULL),('closed_reason','升级中……'),('cms_attitude_flag','1'),('cms_comment_flag','1'),('cms_isuse','1'),('cms_logo',''),('cms_seo_description','33Hao,资讯,画报'),('cms_seo_keywords','33Hao,资讯,画报'),('cms_seo_title','33Hao资讯频道'),('cms_submit_flag','1'),('cms_submit_verify_flag','1'),('complain_time_limit','2592000'),('consult_prompt','因厂家更改商品包装、场地、附配件等不做提前通知，且每位咨询者购买、提问时间等不同。为此，客服给到的回复仅对提问者3天内有效，其他网友仅供参考！给您带来的不变还请谅解，谢谢！'),('contract_allow','1'),('default_goods_image','default_goods_image.gif'),('default_store_avatar','default_store_avatar.png'),('default_store_logo','default_store_logo.gif'),('default_user_portrait','default_user_portrait.gif'),('delivery_isuse','1'),('deliver_region','1,36,37'),('email_addr',''),('email_host',''),('email_id',''),('email_pass',''),('email_port','25'),('email_type','1'),('enabled_subdomain','0'),('exppoints_rule','a:4:{s:9:\"exp_login\";s:1:\"5\";s:12:\"exp_comments\";s:2:\"10\";s:13:\"exp_orderrate\";s:1:\"1\";s:12:\"exp_ordermax\";s:3:\"500\";}'),('goods_verify','0'),('groupbuy_allow','1'),('groupbuy_price','10'),('groupbuy_review_day','0'),('guest_comment','1'),('hao_lc',''),('hao_mail','web@33hao.com'),('hao_phone','400-333-8888'),('hao_qq','10000'),('hao_rc',NULL),('hao_sms_bz',''),('hao_sms_key',''),('hao_sms_pw',''),('hao_sms_signature',''),('hao_sms_tgs',''),('hao_sms_type','0'),('hao_sms_zh',''),('hao_time','08:00-22:30(周一至周日)'),('hao_top_banner_color','#56AAFF'),('hao_top_banner_name','好商城V5.3'),('hao_top_banner_pic','04716538681718544.png'),('hao_top_banner_status','1'),('hao_top_banner_url','http://bbs.33hao.com/thread-12959-1-1.html'),('hao_webchat_appid',''),('hao_webchat_appsecret',''),('hot_search','好商城V5.3,33hao,手表,内衣,小米,手机'),('icp_number',''),('image_allow_ext','gif,jpg,jpeg,bmp,png,swf'),('image_dir_type','1'),('image_max_filesize','1024'),('live_color1','#fff'),('live_color2','#fff'),('live_color3','#fff'),('live_color4','#fff'),('live_link1','http://www.33hao.com'),('live_link2','http://www.33hao.com'),('live_link3',''),('live_link4',''),('live_pic1','04525999367706292.jpg'),('live_pic2','04525999367951893.jpg'),('live_pic3',''),('live_pic4',''),('login_pic','a:4:{i:0;s:5:\"1.jpg\";i:1;s:5:\"2.jpg\";i:2;s:5:\"3.jpg\";i:3;s:5:\"4.jpg\";}'),('malbum_max_sum','200'),('md5_key','3a5c680b3b48ec0f2a9d555095b15124'),('member_grade','a:4:{i:0;a:3:{s:5:\"level\";i:0;s:10:\"level_name\";s:2:\"V0\";s:9:\"exppoints\";i:0;}i:1;a:3:{s:5:\"level\";i:1;s:10:\"level_name\";s:2:\"V1\";s:9:\"exppoints\";i:1000;}i:2;a:3:{s:5:\"level\";i:2;s:10:\"level_name\";s:2:\"V2\";s:9:\"exppoints\";i:10000;}i:3;a:3:{s:5:\"level\";i:3;s:10:\"level_name\";s:2:\"V3\";s:9:\"exppoints\";i:20000;}}'),('member_logo','user_center.png'),('microshop_goods_default_class','0'),('microshop_header_pic',''),('microshop_isuse','1'),('microshop_logo',''),('microshop_personal_limit','50'),('microshop_seo_description','33Hao商城系统,微商城,随心看,个人秀,店铺街'),('microshop_seo_keywords','33Hao商城系统,微商城,随心看,个人秀,店铺街,网上购物'),('microshop_store_banner',''),('microshop_style','default'),('mobile_apk','http://v5.33hao.com/app.apk'),('mobile_apk_version','3.0'),('mobile_app','mb_app.png'),('mobile_ios','https://itunes.apple.com/us/app/storybear/id1146409944'),('mobile_isuse','1'),('mobile_logo','home_logo.png'),('mobile_wx','05434220788623960.png'),('pointprod_isuse','1'),('pointshop_isuse','1'),('points_comments','50'),('points_invite','80'),('points_isuse','1'),('points_login','30'),('points_ordermax','800'),('points_orderrate','20'),('points_rebate','70'),('points_reg','20'),('points_signin','5'),('promotion_allow','1'),('promotion_book_price','20'),('promotion_booth_goods_sum','10'),('promotion_booth_price','20'),('promotion_bundling_goods_sum','5'),('promotion_bundling_price','20'),('promotion_bundling_sum','50'),('promotion_combo_price','20'),('promotion_cou_price','20'),('promotion_fcode_price','20'),('promotion_mansong_price','20'),('promotion_sole_price','20'),('promotion_voucher_buyertimes_limit','5'),('promotion_voucher_default_styleimg','default_voucher.jpg'),('promotion_voucher_price','20'),('promotion_voucher_storetimes_limit','20'),('promotion_xianshi_price','11'),('qq_appcode',''),('qq_appid','1'),('qq_appkey','2'),('qq_isuse','1'),('rec_search','a:1:{i:0;a:2:{s:4:\"name\";s:15:\"好商城V5.3\";s:5:\"value\";s:9:\"33hao\";}}'),('redpacket_allow','1'),('seller_center_logo','seller_center_logo.png'),('share_isuse','1'),('share_qqweibo_appid',''),('share_qqweibo_appkey',''),('share_qqweibo_isuse','0'),('share_sinaweibo_appcode',''),('share_sinaweibo_appid',''),('share_sinaweibo_appkey',''),('share_sinaweibo_isuse','0'),('signin_isuse','1'),('sina_appcode',''),('sina_isuse','1'),('sina_wb_akey','1'),('sina_wb_skey','1'),('site_bank_account','银行:中国银行,币种:人民币,账号:xxxxxxxxxxx,姓名:33hao,开户行:中国银行天津分行'),('site_email','abc@33hao.com'),('site_logo','logo.png'),('site_name','力创商城'),('site_phone','23456789,88997788'),('site_status','1'),('sms_login','1'),('sms_password','1'),('sms_register','1'),('statistics_code','Copyright 2017 <a href=\"http://bbs.33hao.com\" target=\"_blank\">好商城</a> All rights reserved.<br />本演示来源于<a href=\"http://33haocom.taobao.com\" target=\"_blank\">bbs.33hao.com</a>'),('stat_orderpricerange',''),('stat_pricerange',''),('store_joinin_pic','a:2:{s:8:\"show_txt\";s:293:\"好商城平台为国内最大的B2B2C电商平台，提供各类专业管家服务，协助您开通店铺、运营店铺、组织营销活动及分析运营数据，悉心为您解答各类疑问，引导您按相关规则展开运营；我们将竭尽全力，为您的店铺保驾护航。\";s:3:\"pic\";a:3:{i:1;s:18:\"store_joinin_1.jpg\";i:2;s:18:\"store_joinin_2.jpg\";i:3;s:18:\"store_joinin_3.jpg\";}}'),('subdomain_edit','0'),('subdomain_length','3-12'),('subdomain_reserved','www'),('subdomain_times','3'),('taobao_api_isuse','0'),('taobao_app_key',''),('taobao_secret_key',''),('time_zone','Asia/Shanghai'),('ucenter_app_id','1'),('ucenter_app_key',''),('ucenter_connect_type','0'),('ucenter_ip',''),('ucenter_mysql_name','33hao'),('ucenter_mysql_passwd',''),('ucenter_mysql_pre','pre_ucenter_'),('ucenter_mysql_server','localhost'),('ucenter_mysql_username','root'),('ucenter_status','0'),('ucenter_type','discuz'),('ucenter_url',''),('voucher_allow','1'),('wap_weixin_appid','1'),('wap_weixin_isuse','1'),('wap_weixin_secret','1'),('weixin_appid','1'),('weixin_isuse','1'),('weixin_secret','1');
/*!40000 ALTER TABLE `te_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_signin`
--

DROP TABLE IF EXISTS `te_signin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_signin` (
  `sl_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `sl_memberid` int(11) NOT NULL COMMENT '会员ID',
  `sl_membername` varchar(100) NOT NULL COMMENT '会员名称',
  `sl_addtime` int(11) NOT NULL COMMENT '签到时间',
  `sl_points` int(11) NOT NULL COMMENT '获得积分数',
  PRIMARY KEY (`sl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_signin`
--

LOCK TABLES `te_signin` WRITE;
/*!40000 ALTER TABLE `te_signin` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_signin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_sms_log`
--

DROP TABLE IF EXISTS `te_sms_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_sms_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `log_phone` char(11) NOT NULL COMMENT '手机号',
  `log_captcha` char(6) NOT NULL COMMENT '短信验证码',
  `log_ip` varchar(15) NOT NULL COMMENT '请求IP',
  `log_msg` varchar(300) NOT NULL COMMENT '短信内容',
  `log_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '短信类型:1为注册,2为登录,3为找回密码,默认为1',
  `add_time` int(10) unsigned NOT NULL COMMENT '添加时间',
  `member_id` int(10) unsigned DEFAULT '0' COMMENT '会员ID,注册为0',
  `member_name` varchar(50) DEFAULT '' COMMENT '会员名',
  PRIMARY KEY (`log_id`),
  KEY `log_phone` (`log_phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='手机短信记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_sms_log`
--

LOCK TABLES `te_sms_log` WRITE;
/*!40000 ALTER TABLE `te_sms_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_sms_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_sns_albumclass`
--

DROP TABLE IF EXISTS `te_sns_albumclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_sns_albumclass` (
  `ac_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '相册id',
  `ac_name` varchar(100) NOT NULL COMMENT '相册名称',
  `member_id` int(10) unsigned NOT NULL COMMENT '所属会员id',
  `ac_des` varchar(255) DEFAULT '' COMMENT '相册描述',
  `ac_sort` tinyint(3) unsigned NOT NULL COMMENT '排序',
  `ac_cover` varchar(255) DEFAULT NULL COMMENT '相册封面',
  `upload_time` int(10) unsigned NOT NULL COMMENT '图片上传时间',
  `is_default` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为买家秀相册  1为是,0为否',
  PRIMARY KEY (`ac_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='相册表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_sns_albumclass`
--

LOCK TABLES `te_sns_albumclass` WRITE;
/*!40000 ALTER TABLE `te_sns_albumclass` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_sns_albumclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_sns_albumpic`
--

DROP TABLE IF EXISTS `te_sns_albumpic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_sns_albumpic` (
  `ap_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '相册图片表id',
  `ap_name` varchar(100) NOT NULL COMMENT '图片名称',
  `ac_id` int(10) unsigned NOT NULL COMMENT '相册id',
  `ap_cover` varchar(255) NOT NULL COMMENT '图片路径',
  `ap_size` int(10) unsigned NOT NULL COMMENT '图片大小',
  `ap_spec` varchar(100) NOT NULL COMMENT '图片规格',
  `member_id` int(10) unsigned NOT NULL COMMENT '所属店铺id',
  `upload_time` int(10) unsigned NOT NULL COMMENT '图片上传时间',
  `ap_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '图片类型，0为无、1为买家秀',
  `item_id` tinyint(4) NOT NULL DEFAULT '0' COMMENT '信息ID',
  PRIMARY KEY (`ap_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='相册图片表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_sns_albumpic`
--

LOCK TABLES `te_sns_albumpic` WRITE;
/*!40000 ALTER TABLE `te_sns_albumpic` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_sns_albumpic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_sns_binding`
--

DROP TABLE IF EXISTS `te_sns_binding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_sns_binding` (
  `snsbind_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `snsbind_memberid` int(11) NOT NULL COMMENT '会员编号',
  `snsbind_membername` varchar(100) NOT NULL COMMENT '会员名称',
  `snsbind_appsign` varchar(50) NOT NULL COMMENT '应用标志',
  `snsbind_updatetime` int(11) NOT NULL COMMENT '绑定更新时间',
  `snsbind_openid` varchar(100) NOT NULL COMMENT '应用用户编号',
  `snsbind_openinfo` text COMMENT '应用用户信息',
  `snsbind_accesstoken` varchar(100) NOT NULL COMMENT '访问第三方资源的凭证',
  `snsbind_expiresin` int(11) NOT NULL COMMENT 'accesstoken过期时间，以返回的时间的准，单位为秒，注意过期时提醒用户重新授权',
  `snsbind_refreshtoken` varchar(100) DEFAULT NULL COMMENT '刷新token',
  PRIMARY KEY (`snsbind_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分享应用用户绑定记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_sns_binding`
--

LOCK TABLES `te_sns_binding` WRITE;
/*!40000 ALTER TABLE `te_sns_binding` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_sns_binding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_sns_comment`
--

DROP TABLE IF EXISTS `te_sns_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_sns_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `comment_memberid` int(11) NOT NULL COMMENT '会员ID',
  `comment_membername` varchar(100) NOT NULL COMMENT '会员名称',
  `comment_memberavatar` varchar(100) DEFAULT NULL COMMENT '会员头像',
  `comment_originalid` int(11) NOT NULL COMMENT '原帖ID',
  `comment_originaltype` tinyint(1) NOT NULL DEFAULT '0' COMMENT '原帖类型 0表示动态信息 1表示分享商品 默认为0',
  `comment_content` varchar(500) NOT NULL COMMENT '评论内容',
  `comment_addtime` int(11) NOT NULL COMMENT '添加时间',
  `comment_ip` varchar(50) NOT NULL COMMENT '来源IP',
  `comment_state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0正常 1屏蔽',
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_sns_comment`
--

LOCK TABLES `te_sns_comment` WRITE;
/*!40000 ALTER TABLE `te_sns_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_sns_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_sns_friend`
--

DROP TABLE IF EXISTS `te_sns_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_sns_friend` (
  `friend_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id值',
  `friend_frommid` int(11) NOT NULL COMMENT '会员id',
  `friend_frommname` varchar(100) DEFAULT NULL COMMENT '会员名称',
  `friend_frommavatar` varchar(100) DEFAULT NULL COMMENT '会员头像',
  `friend_tomid` int(11) NOT NULL COMMENT '朋友id',
  `friend_tomname` varchar(100) NOT NULL COMMENT '好友会员名称',
  `friend_tomavatar` varchar(100) DEFAULT NULL COMMENT '朋友头像',
  `friend_addtime` int(11) NOT NULL COMMENT '添加时间',
  `friend_followstate` tinyint(1) NOT NULL DEFAULT '1' COMMENT '关注状态 1为单方关注 2为双方关注',
  PRIMARY KEY (`friend_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='好友数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_sns_friend`
--

LOCK TABLES `te_sns_friend` WRITE;
/*!40000 ALTER TABLE `te_sns_friend` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_sns_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_sns_goods`
--

DROP TABLE IF EXISTS `te_sns_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_sns_goods` (
  `snsgoods_goodsid` int(11) NOT NULL COMMENT '商品ID',
  `snsgoods_goodsname` varchar(100) NOT NULL COMMENT '商品名称',
  `snsgoods_goodsimage` varchar(100) DEFAULT NULL COMMENT '商品图片',
  `snsgoods_goodsprice` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品价格',
  `snsgoods_storeid` int(11) NOT NULL COMMENT '店铺ID',
  `snsgoods_storename` varchar(100) NOT NULL COMMENT '店铺名称',
  `snsgoods_addtime` int(11) NOT NULL COMMENT '添加时间',
  `snsgoods_likenum` int(11) NOT NULL DEFAULT '0' COMMENT '喜欢数',
  `snsgoods_likemember` text COMMENT '喜欢过的会员ID，用逗号分隔',
  `snsgoods_sharenum` int(11) NOT NULL DEFAULT '0' COMMENT '分享数',
  UNIQUE KEY `snsgoods_goodsid` (`snsgoods_goodsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SNS商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_sns_goods`
--

LOCK TABLES `te_sns_goods` WRITE;
/*!40000 ALTER TABLE `te_sns_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_sns_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_sns_membertag`
--

DROP TABLE IF EXISTS `te_sns_membertag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_sns_membertag` (
  `mtag_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '会员标签id',
  `mtag_name` varchar(20) NOT NULL COMMENT '会员标签名称',
  `mtag_sort` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员标签排序',
  `mtag_recommend` tinyint(4) NOT NULL DEFAULT '0' COMMENT '标签推荐 0未推荐（默认），1为已推荐',
  `mtag_desc` varchar(50) DEFAULT '' COMMENT '标签描述',
  `mtag_img` varchar(50) DEFAULT NULL COMMENT '标签图片',
  PRIMARY KEY (`mtag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员标签表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_sns_membertag`
--

LOCK TABLES `te_sns_membertag` WRITE;
/*!40000 ALTER TABLE `te_sns_membertag` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_sns_membertag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_sns_mtagmember`
--

DROP TABLE IF EXISTS `te_sns_mtagmember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_sns_mtagmember` (
  `mtag_id` int(11) NOT NULL COMMENT '会员标签表id',
  `member_id` int(11) NOT NULL COMMENT '会员id',
  `recommend` tinyint(4) NOT NULL DEFAULT '0' COMMENT '推荐，默认为0',
  PRIMARY KEY (`mtag_id`,`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员标签会员对照表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_sns_mtagmember`
--

LOCK TABLES `te_sns_mtagmember` WRITE;
/*!40000 ALTER TABLE `te_sns_mtagmember` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_sns_mtagmember` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_sns_setting`
--

DROP TABLE IF EXISTS `te_sns_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_sns_setting` (
  `member_id` int(11) NOT NULL COMMENT '会员id',
  `setting_skin` varchar(50) DEFAULT NULL COMMENT '皮肤',
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='个人中心设置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_sns_setting`
--

LOCK TABLES `te_sns_setting` WRITE;
/*!40000 ALTER TABLE `te_sns_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_sns_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_sns_sharegoods`
--

DROP TABLE IF EXISTS `te_sns_sharegoods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_sns_sharegoods` (
  `share_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `share_goodsid` int(11) NOT NULL COMMENT '商品ID',
  `share_memberid` int(11) NOT NULL COMMENT '所属会员ID',
  `share_membername` varchar(100) NOT NULL COMMENT '会员名称',
  `share_content` varchar(500) DEFAULT NULL COMMENT '描述内容',
  `share_addtime` int(11) NOT NULL DEFAULT '0' COMMENT '分享操作时间',
  `share_likeaddtime` int(11) NOT NULL DEFAULT '0' COMMENT '喜欢操作时间',
  `share_privacy` tinyint(1) NOT NULL DEFAULT '0' COMMENT '隐私可见度 0所有人可见 1好友可见 2仅自己可见',
  `share_commentcount` int(11) NOT NULL DEFAULT '0' COMMENT '评论数',
  `share_isshare` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否分享 0为未分享 1为分享',
  `share_islike` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否喜欢 0为未喜欢 1为喜欢',
  PRIMARY KEY (`share_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='共享商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_sns_sharegoods`
--

LOCK TABLES `te_sns_sharegoods` WRITE;
/*!40000 ALTER TABLE `te_sns_sharegoods` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_sns_sharegoods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_sns_sharestore`
--

DROP TABLE IF EXISTS `te_sns_sharestore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_sns_sharestore` (
  `share_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `share_storeid` int(11) NOT NULL COMMENT '店铺编号',
  `share_storename` varchar(100) NOT NULL COMMENT '店铺名称',
  `share_memberid` int(11) NOT NULL COMMENT '所属会员ID',
  `share_membername` varchar(100) NOT NULL COMMENT '所属会员名称',
  `share_content` varchar(500) DEFAULT NULL COMMENT '描述内容',
  `share_addtime` int(11) NOT NULL COMMENT '添加时间',
  `share_privacy` tinyint(1) NOT NULL DEFAULT '0' COMMENT '隐私可见度 0所有人可见 1好友可见 2仅自己可见',
  PRIMARY KEY (`share_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='共享店铺表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_sns_sharestore`
--

LOCK TABLES `te_sns_sharestore` WRITE;
/*!40000 ALTER TABLE `te_sns_sharestore` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_sns_sharestore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_sns_tracelog`
--

DROP TABLE IF EXISTS `te_sns_tracelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_sns_tracelog` (
  `trace_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `trace_originalid` int(11) NOT NULL DEFAULT '0' COMMENT '原动态ID 默认为0',
  `trace_originalmemberid` int(11) NOT NULL DEFAULT '0' COMMENT '原帖会员编号',
  `trace_originalstate` tinyint(1) NOT NULL DEFAULT '0' COMMENT '原帖的删除状态 0为正常 1为删除',
  `trace_memberid` int(11) NOT NULL COMMENT '会员ID',
  `trace_membername` varchar(100) NOT NULL COMMENT '会员名称',
  `trace_memberavatar` varchar(100) DEFAULT NULL COMMENT '会员头像',
  `trace_title` varchar(500) DEFAULT NULL COMMENT '动态标题',
  `trace_content` text NOT NULL COMMENT '动态内容',
  `trace_addtime` int(11) NOT NULL COMMENT '添加时间',
  `trace_state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态  0正常 1为禁止显示 默认为0',
  `trace_privacy` tinyint(1) NOT NULL DEFAULT '0' COMMENT '隐私可见度 0所有人可见 1好友可见 2仅自己可见',
  `trace_commentcount` int(11) NOT NULL DEFAULT '0' COMMENT '评论数',
  `trace_copycount` int(11) NOT NULL DEFAULT '0' COMMENT '转发数',
  `trace_orgcommentcount` int(11) NOT NULL DEFAULT '0' COMMENT '原帖评论次数',
  `trace_orgcopycount` int(11) NOT NULL DEFAULT '0' COMMENT '原帖转帖次数',
  `trace_from` tinyint(4) DEFAULT '1' COMMENT '来源 1=shop 2=storetracelog 3=microshop 4=cms 5=circle',
  PRIMARY KEY (`trace_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='动态信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_sns_tracelog`
--

LOCK TABLES `te_sns_tracelog` WRITE;
/*!40000 ALTER TABLE `te_sns_tracelog` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_sns_tracelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_sns_visitor`
--

DROP TABLE IF EXISTS `te_sns_visitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_sns_visitor` (
  `v_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `v_mid` int(11) NOT NULL COMMENT '访客会员ID',
  `v_mname` varchar(100) NOT NULL COMMENT '访客会员名称',
  `v_mavatar` varchar(100) DEFAULT NULL COMMENT '访客会员头像',
  `v_ownermid` int(11) NOT NULL COMMENT '主人会员ID',
  `v_ownermname` varchar(100) NOT NULL COMMENT '主人会员名称',
  `v_ownermavatar` varchar(100) DEFAULT NULL COMMENT '主人会员头像',
  `v_addtime` int(11) NOT NULL COMMENT '访问时间',
  PRIMARY KEY (`v_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='sns访客表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_sns_visitor`
--

LOCK TABLES `te_sns_visitor` WRITE;
/*!40000 ALTER TABLE `te_sns_visitor` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_sns_visitor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_spec`
--

DROP TABLE IF EXISTS `te_spec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_spec` (
  `sp_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '规格id',
  `sp_name` varchar(100) NOT NULL COMMENT '规格名称',
  `sp_sort` tinyint(1) unsigned NOT NULL COMMENT '排序',
  `class_id` int(10) unsigned DEFAULT '0' COMMENT '所属分类id',
  `class_name` varchar(100) DEFAULT NULL COMMENT '所属分类名称',
  PRIMARY KEY (`sp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='商品规格表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_spec`
--

LOCK TABLES `te_spec` WRITE;
/*!40000 ALTER TABLE `te_spec` DISABLE KEYS */;
INSERT INTO `te_spec` VALUES (1,'颜色',0,0,'');
/*!40000 ALTER TABLE `te_spec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_spec_value`
--

DROP TABLE IF EXISTS `te_spec_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_spec_value` (
  `sp_value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '规格值id',
  `sp_value_name` varchar(100) NOT NULL COMMENT '规格值名称',
  `sp_id` int(10) unsigned NOT NULL COMMENT '所属规格id',
  `gc_id` int(10) unsigned NOT NULL COMMENT '分类id',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺id',
  `sp_value_color` varchar(10) DEFAULT NULL COMMENT '规格颜色',
  `sp_value_sort` tinyint(1) unsigned NOT NULL COMMENT '排序',
  PRIMARY KEY (`sp_value_id`),
  KEY `store_id` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品规格值表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_spec_value`
--

LOCK TABLES `te_spec_value` WRITE;
/*!40000 ALTER TABLE `te_spec_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_spec_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_stat_member`
--

DROP TABLE IF EXISTS `te_stat_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_stat_member` (
  `statm_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `statm_memberid` int(11) NOT NULL COMMENT '会员ID',
  `statm_membername` varchar(100) NOT NULL COMMENT '会员名称',
  `statm_time` int(11) NOT NULL COMMENT '统计时间，当前按照最小时间单位为天',
  `statm_ordernum` int(11) NOT NULL DEFAULT '0' COMMENT '下单量',
  `statm_orderamount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '下单金额',
  `statm_goodsnum` int(11) NOT NULL DEFAULT '0' COMMENT '下单商品件数',
  `statm_predincrease` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '预存款增加额',
  `statm_predreduce` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '预存款减少额',
  `statm_pointsincrease` int(11) NOT NULL DEFAULT '0' COMMENT '积分增加额',
  `statm_pointsreduce` int(11) NOT NULL DEFAULT '0' COMMENT '积分减少额',
  `statm_updatetime` int(11) NOT NULL COMMENT '记录更新时间',
  PRIMARY KEY (`statm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员相关数据统计';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_stat_member`
--

LOCK TABLES `te_stat_member` WRITE;
/*!40000 ALTER TABLE `te_stat_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_stat_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_stat_order`
--

DROP TABLE IF EXISTS `te_stat_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_stat_order` (
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `order_sn` bigint(20) unsigned NOT NULL COMMENT '订单编号',
  `order_add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单生成时间',
  `payment_code` char(10) DEFAULT '' COMMENT '支付方式',
  `order_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '订单总价格',
  `shipping_fee` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '运费',
  `evaluation_state` enum('0','1') DEFAULT '0' COMMENT '评价状态 0未评价，1已评价',
  `order_state` enum('0','10','20','30','40') NOT NULL DEFAULT '10' COMMENT '订单状态：0(已取消)10(默认):未付款;20:已付款;30:已发货;40:已收货;',
  `refund_state` tinyint(1) unsigned DEFAULT '0' COMMENT '退款状态:0是无退款,1是部分退款,2是全部退款',
  `refund_amount` decimal(10,2) DEFAULT '0.00' COMMENT '退款金额',
  `order_from` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1WEB2mobile',
  `order_isvalid` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为计入统计的有效订单，0为无效 1为有效',
  `reciver_province_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '收货人省级ID',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `store_name` varchar(50) NOT NULL COMMENT '卖家店铺名称',
  `grade_id` int(11) DEFAULT '0' COMMENT '店铺等级',
  `sc_id` int(11) DEFAULT '0' COMMENT '店铺分类',
  `buyer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '买家ID',
  `buyer_name` varchar(50) NOT NULL COMMENT '买家姓名',
  UNIQUE KEY `order_id` (`order_id`),
  KEY `order_add_time` (`order_add_time`),
  KEY `order_isvalid` (`order_isvalid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计功能订单缓存表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_stat_order`
--

LOCK TABLES `te_stat_order` WRITE;
/*!40000 ALTER TABLE `te_stat_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_stat_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_stat_ordergoods`
--

DROP TABLE IF EXISTS `te_stat_ordergoods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_stat_ordergoods` (
  `rec_id` int(11) NOT NULL COMMENT '订单商品表索引id',
  `stat_updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '缓存生成时间',
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `order_sn` bigint(20) unsigned NOT NULL COMMENT '订单编号',
  `order_add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单生成时间',
  `payment_code` char(10) DEFAULT '' COMMENT '支付方式',
  `order_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '订单总价格',
  `shipping_fee` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '运费',
  `evaluation_state` enum('0','1') DEFAULT '0' COMMENT '评价状态 0未评价，1已评价',
  `order_state` enum('0','10','20','30','40') NOT NULL DEFAULT '10' COMMENT '订单状态：0(已取消)10(默认):未付款;20:已付款;30:已发货;40:已收货;',
  `refund_state` tinyint(1) unsigned DEFAULT '0' COMMENT '退款状态:0是无退款,1是部分退款,2是全部退款',
  `refund_amount` decimal(10,2) DEFAULT '0.00' COMMENT '退款金额',
  `order_from` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1WEB2mobile',
  `order_isvalid` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为计入统计的有效订单，0为无效 1为有效',
  `reciver_province_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '收货人省级ID',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `store_name` varchar(50) NOT NULL COMMENT '卖家店铺名称',
  `grade_id` int(11) DEFAULT '0' COMMENT '店铺等级',
  `sc_id` int(11) DEFAULT '0' COMMENT '店铺分类',
  `buyer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '买家ID',
  `buyer_name` varchar(50) NOT NULL COMMENT '买家姓名',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称(+规格)',
  `goods_commonid` int(10) unsigned NOT NULL COMMENT '商品公共表id',
  `goods_commonname` varchar(50) DEFAULT '' COMMENT '商品公共表中商品名称',
  `gc_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '商品最底级分类ID',
  `gc_parentid_1` int(11) DEFAULT '0' COMMENT '一级父类ID',
  `gc_parentid_2` int(11) DEFAULT '0' COMMENT '二级父类ID',
  `gc_parentid_3` int(11) DEFAULT '0' COMMENT '三级父类ID',
  `brand_id` int(10) unsigned DEFAULT '0' COMMENT '品牌id',
  `brand_name` varchar(100) DEFAULT '' COMMENT '品牌名称',
  `goods_serial` varchar(50) DEFAULT '' COMMENT '商家编号',
  `goods_price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `goods_num` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '商品数量',
  `goods_image` varchar(100) DEFAULT NULL COMMENT '商品图片',
  `goods_pay_price` decimal(10,2) unsigned NOT NULL COMMENT '商品实际成交价',
  `goods_type` enum('1','2','3','4','5') NOT NULL DEFAULT '1' COMMENT '1默认2抢购商品3限时折扣商品4优惠套装5赠品',
  `promotions_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '促销活动ID（抢购ID/限时折扣ID/优惠套装ID）与goods_type搭配使用',
  `commis_rate` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '佣金比例',
  UNIQUE KEY `rec_id` (`rec_id`),
  KEY `order_id` (`order_id`),
  KEY `order_add_time` (`order_add_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计功能订单商品缓存表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_stat_ordergoods`
--

LOCK TABLES `te_stat_ordergoods` WRITE;
/*!40000 ALTER TABLE `te_stat_ordergoods` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_stat_ordergoods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_store`
--

DROP TABLE IF EXISTS `te_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_store` (
  `store_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '店铺索引id',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `grade_id` int(11) NOT NULL COMMENT '店铺等级',
  `member_id` int(11) NOT NULL COMMENT '会员id',
  `member_name` varchar(50) NOT NULL COMMENT '会员名称',
  `seller_name` varchar(50) DEFAULT NULL COMMENT '店主卖家用户名',
  `sc_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺分类',
  `store_company_name` varchar(50) DEFAULT NULL COMMENT '店铺公司名称',
  `province_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '店铺所在省份ID',
  `area_info` varchar(100) NOT NULL DEFAULT '' COMMENT '地区内容，冗余数据',
  `store_address` varchar(100) NOT NULL DEFAULT '' COMMENT '详细地区',
  `store_zip` varchar(10) NOT NULL DEFAULT '' COMMENT '邮政编码',
  `store_state` tinyint(1) NOT NULL DEFAULT '2' COMMENT '店铺状态，0关闭，1开启，2审核中',
  `store_close_info` varchar(255) DEFAULT NULL COMMENT '店铺关闭原因',
  `store_sort` int(11) NOT NULL DEFAULT '0' COMMENT '店铺排序',
  `store_time` varchar(10) NOT NULL COMMENT '店铺时间',
  `store_end_time` varchar(10) DEFAULT NULL COMMENT '店铺关闭时间',
  `store_label` varchar(255) DEFAULT NULL COMMENT '店铺logo',
  `store_banner` varchar(255) DEFAULT NULL COMMENT '店铺横幅',
  `store_avatar` varchar(150) DEFAULT NULL COMMENT '店铺头像',
  `store_keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺seo关键字',
  `store_description` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺seo描述',
  `store_qq` varchar(50) DEFAULT NULL COMMENT 'QQ',
  `store_ww` varchar(50) DEFAULT NULL COMMENT '阿里旺旺',
  `store_phone` varchar(20) DEFAULT NULL COMMENT '商家电话',
  `store_zy` text COMMENT '主营商品',
  `store_domain` varchar(50) DEFAULT NULL COMMENT '店铺二级域名',
  `store_domain_times` tinyint(1) unsigned DEFAULT '0' COMMENT '二级域名修改次数',
  `store_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐，0为否，1为是，默认为0',
  `store_theme` varchar(50) NOT NULL DEFAULT 'default' COMMENT '店铺当前主题',
  `store_credit` int(10) NOT NULL DEFAULT '0' COMMENT '店铺信用',
  `store_desccredit` float NOT NULL DEFAULT '0' COMMENT '描述相符度分数',
  `store_servicecredit` float NOT NULL DEFAULT '0' COMMENT '服务态度分数',
  `store_deliverycredit` float NOT NULL DEFAULT '0' COMMENT '发货速度分数',
  `store_collect` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺收藏数量',
  `store_slide` text COMMENT '店铺幻灯片',
  `store_slide_url` text COMMENT '店铺幻灯片链接',
  `store_stamp` varchar(200) DEFAULT NULL COMMENT '店铺印章',
  `store_printdesc` varchar(500) DEFAULT NULL COMMENT '打印订单页面下方说明文字',
  `store_sales` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺销量',
  `store_presales` text COMMENT '售前客服',
  `store_aftersales` text COMMENT '售后客服',
  `store_workingtime` varchar(100) DEFAULT NULL COMMENT '工作时间',
  `store_free_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '超出该金额免运费，大于0才表示该值有效',
  `store_decoration_switch` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺装修开关(0-关闭 装修编号-开启)',
  `store_decoration_only` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '开启店铺装修时，仅显示店铺装修(1-是 0-否',
  `store_decoration_image_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺装修相册图片数量',
  `is_own_shop` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否自营店铺 1是 0否',
  `bind_all_gc` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '自营店是否绑定全部分类 0否1是',
  `store_vrcode_prefix` char(3) DEFAULT NULL COMMENT '商家兑换码前缀',
  `mb_title_img` varchar(150) DEFAULT NULL COMMENT '手机店铺 页头背景图',
  `mb_sliders` text COMMENT '手机店铺 轮播图链接地址',
  `left_bar_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '店铺商品页面左侧显示类型 1默认 2商城相关分类品牌商品推荐',
  `deliver_region` varchar(50) DEFAULT NULL COMMENT '店铺默认配送区域',
  `is_distribution` int(10) DEFAULT '0' COMMENT '是否分销店铺(0-否，1-是）',
  `is_person` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否为个人 1是，0否',
  PRIMARY KEY (`store_id`),
  KEY `store_name` (`store_name`),
  KEY `sc_id` (`sc_id`),
  KEY `store_state` (`store_state`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='店铺数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_store`
--

LOCK TABLES `te_store` WRITE;
/*!40000 ALTER TABLE `te_store` DISABLE KEYS */;
INSERT INTO `te_store` VALUES (1,'力创商城',0,1,'admin','admin',0,NULL,0,'','','',1,NULL,0,'1495643163',NULL,NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,0,0,'default',0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0.00,0,0,0,1,1,NULL,NULL,NULL,1,NULL,0,0);
/*!40000 ALTER TABLE `te_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_store_bind_class`
--

DROP TABLE IF EXISTS `te_store_bind_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_store_bind_class` (
  `bid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(11) unsigned DEFAULT '0' COMMENT '店铺ID',
  `commis_rate` tinyint(4) unsigned DEFAULT '0' COMMENT '佣金比例',
  `class_1` mediumint(9) unsigned DEFAULT '0' COMMENT '一级分类',
  `class_2` mediumint(9) unsigned DEFAULT '0' COMMENT '二级分类',
  `class_3` mediumint(9) unsigned DEFAULT '0' COMMENT '三级分类',
  `state` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态0审核中1已审核 2平台自营店铺',
  PRIMARY KEY (`bid`),
  KEY `store_id` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺可发布商品类目表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_store_bind_class`
--

LOCK TABLES `te_store_bind_class` WRITE;
/*!40000 ALTER TABLE `te_store_bind_class` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_store_bind_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_store_class`
--

DROP TABLE IF EXISTS `te_store_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_store_class` (
  `sc_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '索引ID',
  `sc_name` varchar(50) NOT NULL COMMENT '分类名称',
  `sc_bail` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '保证金数额',
  `sc_sort` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`sc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='店铺分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_store_class`
--

LOCK TABLES `te_store_class` WRITE;
/*!40000 ALTER TABLE `te_store_class` DISABLE KEYS */;
INSERT INTO `te_store_class` VALUES (1,'珠宝/首饰',0,8),(2,'服装鞋包',0,1),(3,'3C数码',0,2),(4,'美容护理',0,3),(5,'家居用品',0,4),(6,'食品/保健',0,5),(7,'母婴用品',0,6),(8,'文体/汽车',0,7),(9,'收藏/爱好',0,9),(10,'生活/服务',0,10);
/*!40000 ALTER TABLE `te_store_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_store_cost`
--

DROP TABLE IF EXISTS `te_store_cost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_store_cost` (
  `cost_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '费用编号',
  `cost_store_id` int(10) unsigned NOT NULL COMMENT '店铺编号',
  `cost_seller_id` int(10) unsigned NOT NULL COMMENT '卖家编号',
  `cost_price` int(10) unsigned NOT NULL COMMENT '价格',
  `cost_remark` varchar(255) NOT NULL COMMENT '费用备注',
  `cost_state` tinyint(3) unsigned NOT NULL COMMENT '费用状态(0-未结算 1-已结算)',
  `cost_time` int(10) unsigned NOT NULL COMMENT '费用发生时间',
  PRIMARY KEY (`cost_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺费用表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_store_cost`
--

LOCK TABLES `te_store_cost` WRITE;
/*!40000 ALTER TABLE `te_store_cost` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_store_cost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_store_decoration`
--

DROP TABLE IF EXISTS `te_store_decoration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_store_decoration` (
  `decoration_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '装修编号',
  `decoration_name` varchar(50) NOT NULL COMMENT '装修名称',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺编号',
  `decoration_setting` varchar(500) DEFAULT NULL COMMENT '装修整体设置(背景、边距等)',
  `decoration_nav` varchar(5000) DEFAULT NULL COMMENT '装修导航',
  `decoration_banner` varchar(255) DEFAULT NULL COMMENT '装修头部banner',
  PRIMARY KEY (`decoration_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺装修表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_store_decoration`
--

LOCK TABLES `te_store_decoration` WRITE;
/*!40000 ALTER TABLE `te_store_decoration` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_store_decoration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_store_decoration_album`
--

DROP TABLE IF EXISTS `te_store_decoration_album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_store_decoration_album` (
  `image_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '图片编号',
  `image_name` varchar(50) NOT NULL COMMENT '图片名称',
  `image_origin_name` varchar(50) NOT NULL COMMENT '图片原始名称',
  `image_width` int(10) unsigned NOT NULL COMMENT '图片宽度',
  `image_height` int(10) unsigned NOT NULL COMMENT '图片高度',
  `image_size` int(10) unsigned NOT NULL COMMENT '图片大小',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺编号',
  `upload_time` int(10) unsigned NOT NULL COMMENT '上传时间',
  PRIMARY KEY (`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺装修相册表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_store_decoration_album`
--

LOCK TABLES `te_store_decoration_album` WRITE;
/*!40000 ALTER TABLE `te_store_decoration_album` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_store_decoration_album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_store_decoration_block`
--

DROP TABLE IF EXISTS `te_store_decoration_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_store_decoration_block` (
  `block_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '装修块编号',
  `decoration_id` int(10) unsigned NOT NULL COMMENT '装修编号',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺编号',
  `block_layout` varchar(50) NOT NULL COMMENT '块布局',
  `block_content` text COMMENT '块内容',
  `block_module_type` varchar(50) DEFAULT NULL COMMENT '装修块模块类型',
  `block_full_width` tinyint(3) unsigned DEFAULT NULL COMMENT '是否100%宽度(0-否 1-是)',
  `block_sort` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '块排序',
  PRIMARY KEY (`block_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺装修块表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_store_decoration_block`
--

LOCK TABLES `te_store_decoration_block` WRITE;
/*!40000 ALTER TABLE `te_store_decoration_block` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_store_decoration_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_store_distribution`
--

DROP TABLE IF EXISTS `te_store_distribution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_store_distribution` (
  `distri_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增编号',
  `distri_store_id` int(11) NOT NULL COMMENT '申请者店铺ID',
  `distri_store_name` varchar(255) NOT NULL COMMENT '申请者店铺名称',
  `distri_seller_name` varchar(255) NOT NULL COMMENT '店主名称',
  `distri_state` int(11) NOT NULL COMMENT '申请状态0未通过1通过',
  `distri_create_time` int(11) NOT NULL COMMENT '申请时间',
  PRIMARY KEY (`distri_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺可发布商品类目表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_store_distribution`
--

LOCK TABLES `te_store_distribution` WRITE;
/*!40000 ALTER TABLE `te_store_distribution` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_store_distribution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_store_extend`
--

DROP TABLE IF EXISTS `te_store_extend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_store_extend` (
  `store_id` mediumint(8) unsigned NOT NULL COMMENT '店铺ID',
  `express` text COMMENT '快递公司ID的组合',
  `pricerange` text COMMENT '店铺统计设置的商品价格区间',
  `orderpricerange` text COMMENT '店铺统计设置的订单价格区间',
  `bill_cycle` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '结算周期，单位天，默认0表示未设置，还是按月结算',
  PRIMARY KEY (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺信息扩展表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_store_extend`
--

LOCK TABLES `te_store_extend` WRITE;
/*!40000 ALTER TABLE `te_store_extend` DISABLE KEYS */;
INSERT INTO `te_store_extend` VALUES (1,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `te_store_extend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_store_goods_class`
--

DROP TABLE IF EXISTS `te_store_goods_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_store_goods_class` (
  `stc_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '索引ID',
  `stc_name` varchar(50) NOT NULL COMMENT '店铺商品分类名称',
  `stc_parent_id` int(11) NOT NULL COMMENT '父级id',
  `stc_state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '店铺商品分类状态',
  `store_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `stc_sort` int(11) NOT NULL DEFAULT '0' COMMENT '商品分类排序',
  PRIMARY KEY (`stc_id`),
  KEY `stc_parent_id` (`stc_parent_id`,`stc_sort`),
  KEY `store_id` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺商品分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_store_goods_class`
--

LOCK TABLES `te_store_goods_class` WRITE;
/*!40000 ALTER TABLE `te_store_goods_class` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_store_goods_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_store_grade`
--

DROP TABLE IF EXISTS `te_store_grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_store_grade` (
  `sg_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '索引ID',
  `sg_name` char(50) DEFAULT NULL COMMENT '等级名称',
  `sg_goods_limit` mediumint(10) unsigned NOT NULL DEFAULT '0' COMMENT '允许发布的商品数量',
  `sg_album_limit` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '允许上传图片数量',
  `sg_space_limit` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传空间大小，单位MB',
  `sg_template_number` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '选择店铺模板套数',
  `sg_template` varchar(255) DEFAULT NULL COMMENT '模板内容',
  `sg_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '开店费用(元/年)',
  `sg_description` text COMMENT '申请说明',
  `sg_function` varchar(255) DEFAULT NULL COMMENT '附加功能',
  `sg_sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '级别，数目越大级别越高',
  PRIMARY KEY (`sg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='店铺等级表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_store_grade`
--

LOCK TABLES `te_store_grade` WRITE;
/*!40000 ALTER TABLE `te_store_grade` DISABLE KEYS */;
INSERT INTO `te_store_grade` VALUES (1,'系统默认',100,500,100,6,'default|style1|style2|style3|style4|style5',100.00,'用户选择“默认等级”，可以立即开通。','',0),(2,'白金店铺',200,1000,100,6,'default|style1|style2|style3|style4|style5',200.00,'享受更多特权','editor_multimedia',2),(3,'钻石店铺',0,1000,100,6,'default|style1|style2|style3|style4|style5',1000.00,'','editor_multimedia',100);
/*!40000 ALTER TABLE `te_store_grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_store_joinin`
--

DROP TABLE IF EXISTS `te_store_joinin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_store_joinin` (
  `member_id` int(10) unsigned NOT NULL COMMENT '用户编号',
  `member_name` varchar(50) DEFAULT NULL COMMENT '店主用户名',
  `company_name` varchar(50) DEFAULT NULL COMMENT '公司名称',
  `company_province_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '所在地省ID',
  `company_address` varchar(50) DEFAULT NULL COMMENT '公司地址',
  `company_address_detail` varchar(50) DEFAULT NULL COMMENT '公司详细地址',
  `company_phone` varchar(20) DEFAULT NULL COMMENT '公司电话',
  `company_employee_count` int(10) unsigned DEFAULT NULL COMMENT '员工总数',
  `company_registered_capital` int(10) unsigned DEFAULT NULL COMMENT '注册资金',
  `contacts_name` varchar(50) DEFAULT NULL COMMENT '联系人姓名',
  `contacts_phone` varchar(20) DEFAULT NULL COMMENT '联系人电话',
  `contacts_email` varchar(50) DEFAULT NULL COMMENT '联系人邮箱',
  `business_licence_number` varchar(50) DEFAULT NULL COMMENT '营业执照号',
  `business_licence_address` varchar(50) DEFAULT NULL COMMENT '营业执所在地',
  `business_licence_start` date DEFAULT NULL COMMENT '营业执照有效期开始',
  `business_licence_end` date DEFAULT NULL COMMENT '营业执照有效期结束',
  `business_sphere` varchar(1000) DEFAULT NULL COMMENT '法定经营范围',
  `business_licence_number_elc` varchar(50) DEFAULT NULL COMMENT '营业执照电子版',
  `organization_code` varchar(50) DEFAULT NULL COMMENT '组织机构代码',
  `organization_code_electronic` varchar(50) DEFAULT NULL COMMENT '组织机构代码电子版',
  `general_taxpayer` varchar(50) DEFAULT NULL COMMENT '一般纳税人证明',
  `bank_account_name` varchar(50) DEFAULT NULL COMMENT '银行开户名',
  `bank_account_number` varchar(50) DEFAULT NULL COMMENT '公司银行账号',
  `bank_name` varchar(50) DEFAULT NULL COMMENT '开户银行支行名称',
  `bank_code` varchar(50) DEFAULT NULL COMMENT '支行联行号',
  `bank_address` varchar(50) DEFAULT NULL COMMENT '开户银行所在地',
  `bank_licence_electronic` varchar(50) DEFAULT NULL COMMENT '开户银行许可证电子版',
  `is_settlement_account` tinyint(1) DEFAULT NULL COMMENT '开户行账号是否为结算账号 1-开户行就是结算账号 2-独立的计算账号',
  `settlement_bank_account_name` varchar(50) DEFAULT NULL COMMENT '结算银行开户名',
  `settlement_bank_account_number` varchar(50) DEFAULT NULL COMMENT '结算公司银行账号',
  `settlement_bank_name` varchar(50) DEFAULT NULL COMMENT '结算开户银行支行名称',
  `settlement_bank_code` varchar(50) DEFAULT NULL COMMENT '结算支行联行号',
  `settlement_bank_address` varchar(50) DEFAULT NULL COMMENT '结算开户银行所在地',
  `tax_registration_certificate` varchar(50) DEFAULT NULL COMMENT '税务登记证号',
  `taxpayer_id` varchar(50) DEFAULT NULL COMMENT '纳税人识别号',
  `tax_registration_certif_elc` varchar(50) DEFAULT NULL COMMENT '税务登记证号电子版',
  `seller_name` varchar(50) DEFAULT NULL COMMENT '卖家账号',
  `store_name` varchar(50) DEFAULT NULL COMMENT '店铺名称',
  `store_class_ids` varchar(1000) DEFAULT NULL COMMENT '店铺分类编号集合',
  `store_class_names` varchar(1000) DEFAULT NULL COMMENT '店铺分类名称集合',
  `joinin_state` varchar(50) DEFAULT NULL COMMENT '申请状态 10-已提交申请 11-缴费完成  20-审核成功 30-审核失败 31-缴费审核失败 40-审核通过开店',
  `joinin_message` varchar(200) DEFAULT NULL COMMENT '管理员审核信息',
  `joinin_year` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '开店时长(年)',
  `sg_name` varchar(50) DEFAULT NULL COMMENT '店铺等级名称',
  `sg_id` int(10) unsigned DEFAULT NULL COMMENT '店铺等级编号',
  `sg_info` varchar(200) DEFAULT NULL COMMENT '店铺等级下的收费等信息',
  `sc_name` varchar(50) DEFAULT NULL COMMENT '店铺分类名称',
  `sc_id` int(10) unsigned DEFAULT NULL COMMENT '店铺分类编号',
  `sc_bail` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '店铺分类保证金',
  `store_class_commis_rates` varchar(200) DEFAULT NULL COMMENT '分类佣金比例',
  `paying_money_certificate` varchar(50) DEFAULT NULL COMMENT '付款凭证',
  `paying_money_certif_exp` varchar(200) DEFAULT NULL COMMENT '付款凭证说明',
  `paying_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '付款金额',
  `is_person` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否为个人 1是，0否',
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺入住表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_store_joinin`
--

LOCK TABLES `te_store_joinin` WRITE;
/*!40000 ALTER TABLE `te_store_joinin` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_store_joinin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_store_map`
--

DROP TABLE IF EXISTS `te_store_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_store_map` (
  `map_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '地图ID',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺ID',
  `sc_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺分类ID',
  `store_name` varchar(20) NOT NULL COMMENT '店铺名称',
  `name_info` varchar(20) NOT NULL COMMENT '详细名称',
  `address_info` varchar(30) NOT NULL COMMENT '详细地址',
  `phone_info` varchar(50) DEFAULT '' COMMENT '电话信息',
  `bus_info` varchar(250) DEFAULT '' COMMENT '公交信息',
  `update_time` int(10) unsigned NOT NULL COMMENT '更新时间',
  `baidu_lng` float NOT NULL DEFAULT '0' COMMENT '百度经度',
  `baidu_lat` float NOT NULL DEFAULT '0' COMMENT '百度纬度',
  `baidu_province` varchar(15) NOT NULL COMMENT '百度省份',
  `baidu_city` varchar(15) NOT NULL COMMENT '百度城市',
  `baidu_district` varchar(15) NOT NULL COMMENT '百度区县',
  `baidu_street` varchar(15) DEFAULT '' COMMENT '百度街道',
  PRIMARY KEY (`map_id`),
  KEY `store_id` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺百度地图表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_store_map`
--

LOCK TABLES `te_store_map` WRITE;
/*!40000 ALTER TABLE `te_store_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_store_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_store_msg`
--

DROP TABLE IF EXISTS `te_store_msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_store_msg` (
  `sm_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '店铺消息id',
  `smt_code` varchar(100) NOT NULL COMMENT '模板编码',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺id',
  `sm_content` varchar(255) NOT NULL COMMENT '消息内容',
  `sm_addtime` int(10) unsigned NOT NULL COMMENT '发送时间',
  `sm_readids` varchar(255) DEFAULT '' COMMENT '已读卖家id',
  PRIMARY KEY (`sm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺消息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_store_msg`
--

LOCK TABLES `te_store_msg` WRITE;
/*!40000 ALTER TABLE `te_store_msg` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_store_msg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_store_msg_read`
--

DROP TABLE IF EXISTS `te_store_msg_read`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_store_msg_read` (
  `sm_id` int(11) NOT NULL COMMENT '店铺消息id',
  `seller_id` int(11) NOT NULL COMMENT '卖家id',
  `read_time` int(11) NOT NULL COMMENT '阅读时间',
  PRIMARY KEY (`sm_id`,`seller_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺消息阅读表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_store_msg_read`
--

LOCK TABLES `te_store_msg_read` WRITE;
/*!40000 ALTER TABLE `te_store_msg_read` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_store_msg_read` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_store_msg_setting`
--

DROP TABLE IF EXISTS `te_store_msg_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_store_msg_setting` (
  `smt_code` varchar(100) NOT NULL COMMENT '模板编码',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺id',
  `sms_message_switch` tinyint(3) unsigned NOT NULL COMMENT '站内信接收开关，0关闭，1开启',
  `sms_short_switch` tinyint(3) unsigned NOT NULL COMMENT '短消息接收开关，0关闭，1开启',
  `sms_mail_switch` tinyint(3) unsigned NOT NULL COMMENT '邮件接收开关，0关闭，1开启',
  `sms_short_number` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sms_mail_number` varchar(100) DEFAULT '' COMMENT '邮箱号码',
  PRIMARY KEY (`smt_code`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺消息接收设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_store_msg_setting`
--

LOCK TABLES `te_store_msg_setting` WRITE;
/*!40000 ALTER TABLE `te_store_msg_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_store_msg_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_store_msg_tpl`
--

DROP TABLE IF EXISTS `te_store_msg_tpl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_store_msg_tpl` (
  `smt_code` varchar(100) NOT NULL COMMENT '模板编码',
  `smt_name` varchar(100) NOT NULL COMMENT '模板名称',
  `smt_message_switch` tinyint(3) unsigned NOT NULL COMMENT '站内信默认开关，0关，1开',
  `smt_message_content` varchar(255) NOT NULL COMMENT '站内信内容',
  `smt_message_forced` tinyint(3) unsigned NOT NULL COMMENT '站内信强制接收，0否，1是',
  `smt_short_switch` tinyint(3) unsigned NOT NULL COMMENT '短信默认开关，0关，1开',
  `smt_short_content` varchar(255) NOT NULL COMMENT '短信内容',
  `smt_short_forced` tinyint(3) unsigned NOT NULL COMMENT '短信强制接收，0否，1是',
  `smt_mail_switch` tinyint(3) unsigned NOT NULL COMMENT '邮件默认开，0关，1开',
  `smt_mail_subject` varchar(255) NOT NULL COMMENT '邮件标题',
  `smt_mail_content` text NOT NULL COMMENT '邮件内容',
  `smt_mail_forced` tinyint(3) unsigned NOT NULL COMMENT '邮件强制接收，0否，1是',
  PRIMARY KEY (`smt_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商家消息模板';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_store_msg_tpl`
--

LOCK TABLES `te_store_msg_tpl` WRITE;
/*!40000 ALTER TABLE `te_store_msg_tpl` DISABLE KEYS */;
INSERT INTO `te_store_msg_tpl` VALUES ('complain','商品被投诉提醒',1,'您售出的商品被投诉，等待商家申诉。投诉单编号：{$complain_id}。',1,0,'【{$site_name}】您售出的商品被投诉，等待商家申诉。投诉单编号：{$complain_id}。',0,0,'{$site_name}提醒：您售出的商品被投诉，等待商家申诉。投诉单编号：{$complain_id}。','<p>\r\n  {$site_name}提醒：\r\n</p>\r\n<p>\r\n  您售出的商品被投诉，等待商家申诉。投诉单编号：{$complain_id}。\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n {$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n   {$mail_send_time}\r\n</p>\r\n<p>\r\n    <br />\r\n</p>',0),('goods_storage_alarm','商品库存预警',1,'您的商品库存不足，请及时补货。SPU：{$common_id}，SKU：{$sku_id}。',1,0,'【{$site_name}】您的商品库存不足，请及时补货。SPU：{$common_id}，SKU：{$sku_id}。',0,0,'{$site_name}提醒：您的商品库存不足，请及时补货。','<p>\r\n {$site_name}提醒：\r\n</p>\r\n<p>\r\n  您的商品库存不足，请及时补货。SPU：{$common_id}，SKU：{$sku_id}。\r\n</p>\r\n<p>\r\n  点击下面链接查看商品详细信息\r\n</p>\r\n<p>\r\n   <a href=\"http://{$shop_site_url}/index.php?act=goods&amp;op=index&amp;goods_id={$sku_id}\" target=\"_blank\">http://{$shop_site_url}/index.php?act=goods&amp;op=index&amp;goods_id={$sku_id}</a> \r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n {$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n   {$mail_send_time}\r\n</p>\r\n<p>\r\n    <br />\r\n</p>\r\n<br />',0),('goods_verify','商品审核失败提醒',1,'您的商品没有通过管理员审核，原因：“{$remark}”。SPU：{$common_id}。',1,0,'【{$site_name}】您的商品没有通过管理员审核，原因：“{$remark}”。SPU：{$common_id}。',0,0,'{$site_name}提醒：您的商品没有通过管理员审核。','<p>\r\n   {$site_name}提醒：\r\n</p>\r\n<p>\r\n  您的商品没有通过管理员审核，原因：“{$remark}”。SPU：{$common_id}。\r\n </p><p>\r\n     <br />\r\n  </p>\r\n    <p>\r\n     <br />\r\n  </p>\r\n    <p style=\"text-align:right;\">\r\n       {$site_name}\r\n    </p>\r\n    <p style=\"text-align:right;\">\r\n       {$mail_send_time}\r\n   </p>',0),('goods_violation','商品违规被下架',1,'您的商品被违规下架，原因：“{$remark}”。SPU：{$common_id}。',1,0,'【{$site_name}】您的商品被违规下架，原因：“{$remark}”。SPU：{$common_id}。',0,0,'{$site_name}提醒：您的商品被违规下架。','<p>\r\n {$site_name}提醒：\r\n</p>\r\n<p>\r\n  您的商品被违规下架。，原因：“{$remark}”。SPU：{$common_id}。\r\n</p>\r\n<p>\r\n <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n {$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n   {$mail_send_time}\r\n</p>\r\n<p>\r\n    <br />\r\n</p>',0),('new_order','新订单提醒',1,'您有订单需要处理，订单编号：{$order_sn}。',1,0,'【{$site_name}】您有订单需要处理，订单编号：{$order_sn}。',0,0,'{$site_name}提醒：您有订单需要处理。','<p>\r\n    {$site_name}提醒：\r\n</p>\r\n<p>\r\n  您有订单需要处理，订单编号：{$order_sn}。\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n {$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n   {$mail_send_time}\r\n</p>\r\n<br />',0),('refund','退款提醒',1,'您有一个{$type}退款单需要处理，退款编号：{$refund_sn}。',1,0,'【{$site_name}】您有一个{$type}退款单需要处理，退款编号：{$refund_sn}。',1,0,'{$site_name}提醒：您有一个{$type}退款单需要处理，退款编号：{$refund_sn}。','<p>\r\n  {$site_name}提醒：\r\n</p>\r\n<p>\r\n  您有一个{$type}退款单需要处理，退款编号：{$refund_sn}。\r\n</p>\r\n<p>\r\n    <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n {$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n   {$mail_send_time}\r\n</p>\r\n<p>\r\n    <br />\r\n</p>',1),('refund_auto_process','退款自动处理提醒',1,'您的{$type}退款单超期未处理，已自动同意买家退款申请。退款单编号：{$refund_sn}。',1,0,'【{$site_name}】您的{$type}退款单超期未处理，已自动同意买家退款申请。退款单编号：{$refund_sn}。',0,0,'{$site_name}提醒：您的{$type}退款单超期未处理，已自动同意买家退款申请。退款单编号：{$refund_sn}。','<p>\r\n  {$site_name}提醒：\r\n</p>\r\n<p>\r\n   您的{$type}退款单超期未处理，已自动同意买家退款申请。退款单编号：{$refund_sn}。\r\n</p>\r\n<p>\r\n    <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n {$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n   {$mail_send_time}\r\n</p>\r\n<p>\r\n    <br />\r\n</p>',0),('return','退货提醒',1,'您有一个{$type}退货单需要处理。退货编号：{$refund_sn}。',1,0,'【{$site_name}】您有一个{$type}退货单需要处理。退货编号：{$refund_sn}。',0,0,'{$site_name}提醒：您有一个{$type}退货单需要处理。退货编号：{$refund_sn}。','<p>\r\n   {$site_name}提醒：\r\n</p>\r\n<p>\r\n  您有一个{$type}退货单需要处理。退货编号：{$refund_sn}。\r\n</p>\r\n<p>\r\n    <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n {$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n   {$mail_send_time}\r\n</p>\r\n<p>\r\n    <br />\r\n</p>\r\n<br />',0),('return_auto_process','退货自动处理提醒',1,'您的{$type}退货单超期未处理，已自动同意买家退货申请（弃货）。退货单编号：{$refund_sn}。',1,0,'【{$site_name}】您的{$type}退货单超期未处理，已自动同意买家退货申请（弃货）。退货单编号：{$refund_sn}。',0,0,'{$site_name}提醒：您的{$type}退货单超期未处理，已自动同意买家退货申请（弃货）。退货单编号：{$refund_sn}。','<p>\r\n {$site_name}提醒：\r\n</p>\r\n<p>\r\n  您的{$type}退货单超期未处理，已自动同意买家退货申请（弃货）。退货单编号：{$refund_sn}。\r\n</p>\r\n<p>\r\n    <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n {$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n   {$mail_send_time}\r\n</p>',0),('return_auto_receipt','退货未收货自动处理提醒',1,'您的{$type}退货单不处理收货超期未处理，已自动按弃货处理。退货单编号：{$refund_sn}。',1,0,'【{$site_name}】您的{$type}退货单不处理收货超期未处理，已自动按弃货处理。退货单编号：{$refund_sn}。',0,0,'{$site_name}提醒：您的{$type}退货单超期未处理，已自动同意买家退货申请（弃货）。退货单编号：{$refund_sn}。','<p>\r\n  {$site_name}提醒：\r\n</p>\r\n<p>\r\n  您的{$type}退货单超期未处理，已自动同意买家退货申请（弃货）。退货单编号：{$refund_sn}。\r\n</p>\r\n<p>\r\n    <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n {$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n   {$mail_send_time}\r\n</p>\r\n<p>\r\n    <br />\r\n</p>',0),('store_bill_affirm','结算单等待确认提醒',1,'您有新的结算单等待确认，开始时间：{$state_time}，结束时间：{$end_time}，结算单号：{$bill_no}。',1,0,'【{$site_name}】您有新的结算单等待确认，开始时间：{$state_time}，结束时间：{$end_time}，结算单号：{$bill_no}。',0,0,'{$site_name}提醒：您有新的结算单等待确认。','<p>\r\n {$site_name}提醒：\r\n</p>\r\n<p>\r\n  您有新的结算单等待确认，起止时间：开始时间：{$state_time}，结束时间：{$end_time}，结算单号：{$bill_no}。\r\n</p>\r\n<p>\r\n    <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n {$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n   {$mail_send_time}\r\n</p>\r\n<p>\r\n    <br />\r\n</p>',0),('store_bill_gathering','结算单已经付款提醒',1,'您的结算单平台已付款，请注意查收，结算单编号：{$bill_no}。',1,0,'【{$site_name}】您的结算单平台已付款，请注意查收，结算单编号：{$bill_no}。',0,0,'{$site_name}提醒：您的结算单平台已付款，请注意查收。','<p>\r\n </p><p>\r\n     {$site_name}提醒：\r\n </p>\r\n\r\n<p>\r\n 您的结算单平台已付款，请注意查收，结算单编号：{$bill_no}。\r\n  </p><p>\r\n     <br />\r\n  </p>\r\n    <p>\r\n     <br />\r\n  </p>\r\n    <p>\r\n     <br />\r\n  </p>\r\n    <p style=\"text-align:right;\">\r\n       {$site_name}\r\n    </p>\r\n    <p style=\"text-align:right;\">\r\n       {$mail_send_time}\r\n   </p>\r\n\r\n<br />',0),('store_cost','店铺消费提醒',1,'您有一条新的店铺消费记录，金额：{$price}，操作人：{$seller_name}，备注：{$remark}。',1,0,'【{$site_name}】您有一条新的店铺消费记录，金额：{$price}，操作人：{$seller_name}，备注：{$remark}。',0,0,'{$site_name}提醒：您有一条新的店铺消费记录。','<p>\r\n    {$site_name}提醒：\r\n</p>\r\n<p>\r\n  您有一条新的店铺消费记录，金额：{$price}，操作人：{$seller_name}，备注：{$remark}。\r\n</p>\r\n<p>\r\n    <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n {$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n   {$mail_send_time}\r\n</p>',0),('store_expire','店铺到期提醒',1,'你的店铺即将到期，请及时续期。',1,0,'【{$site_name}】你的店铺即将到期，请及时续期。',0,0,'{$site_name}提醒：你的店铺即将到期，请及时续期。','<p>\r\n    {$site_name}提醒：\r\n</p>\r\n<p>\r\n  你的店铺即将到期，请及时续期。\r\n</p>\r\n<p>\r\n  <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n {$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n   {$mail_send_time}\r\n</p>\r\n<p>\r\n    <br />\r\n</p>',0);
/*!40000 ALTER TABLE `te_store_msg_tpl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_store_navigation`
--

DROP TABLE IF EXISTS `te_store_navigation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_store_navigation` (
  `sn_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '导航ID',
  `sn_title` varchar(50) NOT NULL COMMENT '导航名称',
  `sn_store_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '卖家店铺ID',
  `sn_content` text COMMENT '导航内容',
  `sn_sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '导航排序',
  `sn_if_show` tinyint(1) NOT NULL DEFAULT '0' COMMENT '导航是否显示',
  `sn_add_time` int(10) NOT NULL COMMENT '导航',
  `sn_url` varchar(255) DEFAULT NULL COMMENT '店铺导航的外链URL',
  `sn_new_open` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '店铺导航外链是否在新窗口打开：0不开新窗口1开新窗口，默认是0',
  PRIMARY KEY (`sn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='卖家店铺导航信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_store_navigation`
--

LOCK TABLES `te_store_navigation` WRITE;
/*!40000 ALTER TABLE `te_store_navigation` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_store_navigation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_store_plate`
--

DROP TABLE IF EXISTS `te_store_plate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_store_plate` (
  `plate_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '关联板式id',
  `plate_name` varchar(10) NOT NULL COMMENT '关联板式名称',
  `plate_position` tinyint(3) unsigned NOT NULL COMMENT '关联板式位置 1顶部，0底部',
  `plate_content` text NOT NULL COMMENT '关联板式内容',
  `store_id` int(10) unsigned NOT NULL COMMENT '所属店铺id',
  PRIMARY KEY (`plate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='关联板式表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_store_plate`
--

LOCK TABLES `te_store_plate` WRITE;
/*!40000 ALTER TABLE `te_store_plate` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_store_plate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_store_reopen`
--

DROP TABLE IF EXISTS `te_store_reopen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_store_reopen` (
  `re_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `re_grade_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '店铺等级ID',
  `re_grade_name` varchar(30) DEFAULT NULL COMMENT '等级名称',
  `re_grade_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '等级收费(元/年)',
  `re_year` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '续签时长(年)',
  `re_pay_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '应付总金额',
  `re_store_name` varchar(50) DEFAULT NULL COMMENT '店铺名字',
  `re_store_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `re_state` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态0默认，未上传凭证1审核中2审核通过',
  `re_start_time` int(10) unsigned DEFAULT NULL COMMENT '有效期开始时间',
  `re_end_time` int(10) unsigned DEFAULT NULL COMMENT '有效期结束时间',
  `re_create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '记录创建时间',
  `re_pay_cert` varchar(50) DEFAULT NULL COMMENT '付款凭证',
  `re_pay_cert_explain` varchar(200) DEFAULT NULL COMMENT '付款凭证说明',
  PRIMARY KEY (`re_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='续签内容表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_store_reopen`
--

LOCK TABLES `te_store_reopen` WRITE;
/*!40000 ALTER TABLE `te_store_reopen` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_store_reopen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_store_sns_comment`
--

DROP TABLE IF EXISTS `te_store_sns_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_store_sns_comment` (
  `scomm_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '店铺动态评论id',
  `strace_id` int(11) NOT NULL COMMENT '店铺动态id',
  `scomm_content` varchar(150) DEFAULT NULL COMMENT '评论内容',
  `scomm_memberid` int(11) DEFAULT NULL COMMENT '会员id',
  `scomm_membername` varchar(45) DEFAULT NULL COMMENT '会员名称',
  `scomm_memberavatar` varchar(50) DEFAULT NULL COMMENT '会员头像',
  `scomm_time` varchar(11) DEFAULT NULL COMMENT '评论时间',
  `scomm_state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '评论状态 1正常，0屏蔽',
  PRIMARY KEY (`scomm_id`),
  UNIQUE KEY `scomm_id` (`scomm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺动态评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_store_sns_comment`
--

LOCK TABLES `te_store_sns_comment` WRITE;
/*!40000 ALTER TABLE `te_store_sns_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_store_sns_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_store_sns_setting`
--

DROP TABLE IF EXISTS `te_store_sns_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_store_sns_setting` (
  `sauto_storeid` int(11) NOT NULL COMMENT '店铺id',
  `sauto_new` tinyint(4) NOT NULL DEFAULT '1' COMMENT '新品,0为关闭/1为开启',
  `sauto_newtitle` varchar(150) DEFAULT '' COMMENT '新品内容',
  `sauto_coupon` tinyint(4) NOT NULL DEFAULT '1' COMMENT '优惠券,0为关闭/1为开启',
  `sauto_coupontitle` varchar(150) DEFAULT '' COMMENT '优惠券内容',
  `sauto_xianshi` tinyint(4) NOT NULL DEFAULT '1' COMMENT '限时折扣,0为关闭/1为开启',
  `sauto_xianshititle` varchar(150) DEFAULT '' COMMENT '限时折扣内容',
  `sauto_mansong` tinyint(4) NOT NULL DEFAULT '1' COMMENT '满即送,0为关闭/1为开启',
  `sauto_mansongtitle` varchar(150) DEFAULT '' COMMENT '满即送内容',
  `sauto_bundling` tinyint(4) NOT NULL DEFAULT '1' COMMENT '组合销售,0为关闭/1为开启',
  `sauto_bundlingtitle` varchar(150) DEFAULT '' COMMENT '组合销售内容',
  `sauto_groupbuy` tinyint(4) NOT NULL DEFAULT '1' COMMENT '抢购,0为关闭/1为开启',
  `sauto_groupbuytitle` varchar(150) DEFAULT '' COMMENT '抢购内容',
  PRIMARY KEY (`sauto_storeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺自动发布动态设置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_store_sns_setting`
--

LOCK TABLES `te_store_sns_setting` WRITE;
/*!40000 ALTER TABLE `te_store_sns_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_store_sns_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_store_sns_tracelog`
--

DROP TABLE IF EXISTS `te_store_sns_tracelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_store_sns_tracelog` (
  `strace_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '店铺动态id',
  `strace_storeid` int(11) DEFAULT NULL COMMENT '店铺id',
  `strace_storename` varchar(100) DEFAULT NULL COMMENT '店铺名称',
  `strace_storelogo` varchar(255) DEFAULT '' COMMENT '店标',
  `strace_title` varchar(150) DEFAULT NULL COMMENT '动态标题',
  `strace_content` text COMMENT '发表内容',
  `strace_time` varchar(11) DEFAULT NULL COMMENT '发表时间',
  `strace_cool` int(11) DEFAULT '0' COMMENT '赞数量',
  `strace_spread` int(11) DEFAULT '0' COMMENT '转播数量',
  `strace_comment` int(11) DEFAULT '0' COMMENT '评论数量',
  `strace_type` tinyint(4) DEFAULT '1' COMMENT '1=relay,2=normal,3=new,4=coupon,5=xianshi,6=mansong,7=bundling,8=groupbuy,9=recommend,10=hotsell',
  `strace_goodsdata` text COMMENT '商品信息',
  `strace_state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '动态状态 1正常，0屏蔽',
  PRIMARY KEY (`strace_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺动态表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_store_sns_tracelog`
--

LOCK TABLES `te_store_sns_tracelog` WRITE;
/*!40000 ALTER TABLE `te_store_sns_tracelog` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_store_sns_tracelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_store_supplier`
--

DROP TABLE IF EXISTS `te_store_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_store_supplier` (
  `sup_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sup_store_id` int(11) DEFAULT NULL COMMENT '商家ID',
  `sup_store_name` varchar(50) DEFAULT NULL COMMENT '商家名称',
  `sup_name` varchar(50) DEFAULT NULL COMMENT '供货商名称',
  `sup_desc` varchar(200) DEFAULT NULL COMMENT '备注',
  `sup_man` varchar(30) DEFAULT NULL COMMENT '联系人',
  `sup_phone` varchar(30) DEFAULT NULL COMMENT '联系电话',
  PRIMARY KEY (`sup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='供货商表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_store_supplier`
--

LOCK TABLES `te_store_supplier` WRITE;
/*!40000 ALTER TABLE `te_store_supplier` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_store_supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_store_watermark`
--

DROP TABLE IF EXISTS `te_store_watermark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_store_watermark` (
  `wm_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '水印id',
  `jpeg_quality` int(3) NOT NULL DEFAULT '90' COMMENT 'jpeg图片质量',
  `wm_image_name` varchar(255) DEFAULT NULL COMMENT '水印图片的路径以及文件名',
  `wm_image_pos` tinyint(1) NOT NULL DEFAULT '1' COMMENT '水印图片放置的位置',
  `wm_image_transition` int(3) NOT NULL DEFAULT '20' COMMENT '水印图片与原图片的融合度 ',
  `wm_text` text COMMENT '水印文字',
  `wm_text_size` int(3) NOT NULL DEFAULT '20' COMMENT '水印文字大小',
  `wm_text_angle` tinyint(1) NOT NULL DEFAULT '4' COMMENT '水印文字角度',
  `wm_text_pos` tinyint(1) NOT NULL DEFAULT '3' COMMENT '水印文字放置位置',
  `wm_text_font` varchar(50) DEFAULT NULL COMMENT '水印文字的字体',
  `wm_text_color` varchar(7) NOT NULL DEFAULT '#CCCCCC' COMMENT '水印字体的颜色值',
  `wm_is_open` tinyint(1) NOT NULL DEFAULT '0' COMMENT '水印是否开启 0关闭 1开启',
  `store_id` int(11) DEFAULT NULL COMMENT '店铺id',
  PRIMARY KEY (`wm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺水印图片表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_store_watermark`
--

LOCK TABLES `te_store_watermark` WRITE;
/*!40000 ALTER TABLE `te_store_watermark` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_store_watermark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_store_waybill`
--

DROP TABLE IF EXISTS `te_store_waybill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_store_waybill` (
  `store_waybill_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '店铺运单模板编号',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺编号',
  `express_id` int(10) unsigned NOT NULL COMMENT '物流公司编号',
  `waybill_id` int(10) unsigned NOT NULL COMMENT '运单模板编号',
  `waybill_name` varchar(50) NOT NULL COMMENT '运单模板名称',
  `store_waybill_data` varchar(2000) DEFAULT NULL COMMENT '店铺自定义设置',
  `is_default` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否默认模板',
  `store_waybill_left` int(11) NOT NULL DEFAULT '0' COMMENT '店铺运单左偏移',
  `store_waybill_top` int(11) NOT NULL DEFAULT '0' COMMENT '店铺运单上偏移',
  PRIMARY KEY (`store_waybill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺运单模板表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_store_waybill`
--

LOCK TABLES `te_store_waybill` WRITE;
/*!40000 ALTER TABLE `te_store_waybill` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_store_waybill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_task`
--

DROP TABLE IF EXISTS `te_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_task` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `taskname` varchar(50) NOT NULL,
  `dourl` varchar(100) NOT NULL,
  `islock` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `runtype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `runtime` varchar(10) DEFAULT '0000',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `freq` int(10) unsigned NOT NULL DEFAULT '0',
  `lastrun` int(10) unsigned NOT NULL DEFAULT '0',
  `description` varchar(250) NOT NULL,
  `parameter` text,
  `settime` int(10) unsigned NOT NULL DEFAULT '0',
  `sta` enum('运行','成功','失败') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='计划任务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_task`
--

LOCK TABLES `te_task` WRITE;
/*!40000 ALTER TABLE `te_task` DISABLE KEYS */;
INSERT INTO `te_task` VALUES (1,'分','cj_index.php',0,0,'0:5:0',1434038400,1751212800,1,1495643220,'分，建议10分钟触发，更新首页、消息、 邮箱，商品上架，下架，过期等','act=minutes',1433902608,'运行'),(2,'时','cj_index.php',0,0,'0:10:0',1433865600,1751212800,60,1495643231,'时，建议1小时触发，更新商品全文搜索缓存等','act=hour',1433902608,'运行'),(3,'天','cj_index.php',0,0,'0:15:0',1433865600,1756569600,1440,1495643289,'天，建议每天触发，更新更新订单、佣金、结算等','act=date',1433902608,'运行');
/*!40000 ALTER TABLE `te_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_transport`
--

DROP TABLE IF EXISTS `te_transport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_transport` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '运费模板ID',
  `title` varchar(30) NOT NULL COMMENT '运费模板名称',
  `send_tpl_id` mediumint(8) unsigned DEFAULT NULL COMMENT '发货地区模板ID',
  `store_id` mediumint(8) unsigned NOT NULL COMMENT '店铺ID',
  `update_time` int(10) unsigned DEFAULT '0' COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='运费模板';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_transport`
--

LOCK TABLES `te_transport` WRITE;
/*!40000 ALTER TABLE `te_transport` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_transport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_transport_extend`
--

DROP TABLE IF EXISTS `te_transport_extend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_transport_extend` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '运费模板扩展ID',
  `area_id` text COMMENT '市级地区ID组成的串，以，隔开，两端也有，',
  `top_area_id` text COMMENT '省级地区ID组成的串，以，隔开，两端也有，',
  `area_name` text COMMENT '地区name组成的串，以，隔开',
  `sprice` decimal(10,2) DEFAULT '0.00' COMMENT '首件运费',
  `transport_id` mediumint(8) unsigned NOT NULL COMMENT '运费模板ID',
  `transport_title` varchar(60) DEFAULT NULL COMMENT '运费模板',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='运费模板扩展表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_transport_extend`
--

LOCK TABLES `te_transport_extend` WRITE;
/*!40000 ALTER TABLE `te_transport_extend` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_transport_extend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_type`
--

DROP TABLE IF EXISTS `te_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_type` (
  `type_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '类型id',
  `type_name` varchar(100) NOT NULL COMMENT '类型名称',
  `type_sort` tinyint(1) unsigned NOT NULL COMMENT '排序',
  `class_id` int(10) unsigned DEFAULT '0' COMMENT '所属分类id',
  `class_name` varchar(100) DEFAULT '' COMMENT '所属分类名称',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_type`
--

LOCK TABLES `te_type` WRITE;
/*!40000 ALTER TABLE `te_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_type_brand`
--

DROP TABLE IF EXISTS `te_type_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_type_brand` (
  `type_id` int(10) unsigned NOT NULL COMMENT '类型id',
  `brand_id` int(10) unsigned NOT NULL COMMENT '品牌id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品类型与品牌对应表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_type_brand`
--

LOCK TABLES `te_type_brand` WRITE;
/*!40000 ALTER TABLE `te_type_brand` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_type_brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_type_custom`
--

DROP TABLE IF EXISTS `te_type_custom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_type_custom` (
  `custom_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自定义属性id',
  `custom_name` varchar(50) NOT NULL COMMENT '自定义属性名称',
  `type_id` int(10) unsigned NOT NULL COMMENT '类型id',
  PRIMARY KEY (`custom_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='自定义属性表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_type_custom`
--

LOCK TABLES `te_type_custom` WRITE;
/*!40000 ALTER TABLE `te_type_custom` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_type_custom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_type_spec`
--

DROP TABLE IF EXISTS `te_type_spec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_type_spec` (
  `type_id` int(10) unsigned NOT NULL COMMENT '类型id',
  `sp_id` int(10) unsigned NOT NULL COMMENT '规格id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品类型与规格对应表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_type_spec`
--

LOCK TABLES `te_type_spec` WRITE;
/*!40000 ALTER TABLE `te_type_spec` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_type_spec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_upload`
--

DROP TABLE IF EXISTS `te_upload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_upload` (
  `upload_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '索引ID',
  `file_name` varchar(100) DEFAULT NULL COMMENT '文件名',
  `file_thumb` varchar(100) DEFAULT NULL COMMENT '缩微图片',
  `file_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `upload_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '文件类别，0为无，1为文章图片，默认为0，2为帮助内容图片，3为店铺幻灯片，4为系统文章图片，5为积分礼品切换图片，6为积分礼品内容图片',
  `upload_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `item_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '信息ID',
  PRIMARY KEY (`upload_id`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8 COMMENT='上传文件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_upload`
--

LOCK TABLES `te_upload` WRITE;
/*!40000 ALTER TABLE `te_upload` DISABLE KEYS */;
INSERT INTO `te_upload` VALUES (175,'help_store_04526250471329237.jpg',NULL,93814,2,1435766400,97),(176,'help_store_04526250486031950.jpg',NULL,402109,2,1435766400,97),(177,'help_store_04526250504192250.jpg',NULL,248466,2,1435766400,97),(180,'help_store_04526254603037325.jpg',NULL,884442,2,1435766400,99);
/*!40000 ALTER TABLE `te_upload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_voucher`
--

DROP TABLE IF EXISTS `te_voucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_voucher` (
  `voucher_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '代金券编号',
  `voucher_code` varchar(32) NOT NULL COMMENT '代金券编码',
  `voucher_t_id` int(11) NOT NULL COMMENT '代金券模版编号',
  `voucher_title` varchar(50) NOT NULL COMMENT '代金券标题',
  `voucher_desc` varchar(255) NOT NULL COMMENT '代金券描述',
  `voucher_start_date` int(11) NOT NULL COMMENT '代金券有效期开始时间',
  `voucher_end_date` int(11) NOT NULL COMMENT '代金券有效期结束时间',
  `voucher_price` int(11) NOT NULL COMMENT '代金券面额',
  `voucher_limit` decimal(10,2) NOT NULL COMMENT '代金券使用时的订单限额',
  `voucher_store_id` int(11) NOT NULL COMMENT '代金券的店铺id',
  `voucher_state` tinyint(4) NOT NULL COMMENT '代金券状态(1-未用,2-已用,3-过期,4-收回)',
  `voucher_active_date` int(11) NOT NULL COMMENT '代金券发放日期',
  `voucher_type` tinyint(4) DEFAULT '0' COMMENT '代金券类别',
  `voucher_owner_id` int(11) NOT NULL COMMENT '代金券所有者id',
  `voucher_owner_name` varchar(50) NOT NULL COMMENT '代金券所有者名称',
  `voucher_order_id` int(11) DEFAULT NULL COMMENT '使用该代金券的订单编号',
  `voucher_pwd` varchar(100) DEFAULT NULL COMMENT '代金券卡密不可逆',
  `voucher_pwd2` varchar(100) DEFAULT NULL COMMENT '代金券卡密2可逆',
  PRIMARY KEY (`voucher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代金券表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_voucher`
--

LOCK TABLES `te_voucher` WRITE;
/*!40000 ALTER TABLE `te_voucher` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_voucher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_voucher_price`
--

DROP TABLE IF EXISTS `te_voucher_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_voucher_price` (
  `voucher_price_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '代金券面值编号',
  `voucher_price_describe` varchar(255) NOT NULL COMMENT '代金券描述',
  `voucher_price` int(11) NOT NULL COMMENT '代金券面值',
  `voucher_defaultpoints` int(11) NOT NULL DEFAULT '0' COMMENT '代金劵默认的兑换所需积分可以为0',
  PRIMARY KEY (`voucher_price_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代金券面额表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_voucher_price`
--

LOCK TABLES `te_voucher_price` WRITE;
/*!40000 ALTER TABLE `te_voucher_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_voucher_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_voucher_quota`
--

DROP TABLE IF EXISTS `te_voucher_quota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_voucher_quota` (
  `quota_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '套餐编号',
  `quota_memberid` int(11) NOT NULL COMMENT '会员编号',
  `quota_membername` varchar(100) NOT NULL COMMENT '会员名称',
  `quota_storeid` int(11) NOT NULL COMMENT '店铺编号',
  `quota_storename` varchar(100) NOT NULL COMMENT '店铺名称',
  `quota_starttime` int(11) NOT NULL COMMENT '开始时间',
  `quota_endtime` int(11) NOT NULL COMMENT '结束时间',
  `quota_state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态(1-可用/2-取消/3-结束)',
  PRIMARY KEY (`quota_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代金券套餐表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_voucher_quota`
--

LOCK TABLES `te_voucher_quota` WRITE;
/*!40000 ALTER TABLE `te_voucher_quota` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_voucher_quota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_voucher_template`
--

DROP TABLE IF EXISTS `te_voucher_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_voucher_template` (
  `voucher_t_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '代金券模版编号',
  `voucher_t_title` varchar(50) NOT NULL COMMENT '代金券模版名称',
  `voucher_t_desc` varchar(255) NOT NULL COMMENT '代金券模版描述',
  `voucher_t_start_date` int(11) NOT NULL COMMENT '代金券模版有效期开始时间',
  `voucher_t_end_date` int(11) NOT NULL COMMENT '代金券模版有效期结束时间',
  `voucher_t_price` int(11) NOT NULL COMMENT '代金券模版面额',
  `voucher_t_limit` decimal(10,2) NOT NULL COMMENT '代金券使用时的订单限额',
  `voucher_t_store_id` int(11) NOT NULL COMMENT '代金券模版的店铺id',
  `voucher_t_storename` varchar(100) DEFAULT NULL COMMENT '店铺名称',
  `voucher_t_sc_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属店铺分类ID',
  `voucher_t_creator_id` int(11) NOT NULL COMMENT '代金券模版的创建者id',
  `voucher_t_state` tinyint(4) NOT NULL COMMENT '代金券模版状态(1-有效,2-失效)',
  `voucher_t_total` int(11) NOT NULL COMMENT '模版可发放的代金券总数',
  `voucher_t_giveout` int(11) NOT NULL COMMENT '模版已发放的代金券数量',
  `voucher_t_used` int(11) NOT NULL COMMENT '模版已经使用过的代金券',
  `voucher_t_add_date` int(11) NOT NULL COMMENT '模版的创建时间',
  `voucher_t_quotaid` int(11) NOT NULL COMMENT '套餐编号',
  `voucher_t_points` int(11) NOT NULL DEFAULT '0' COMMENT '兑换所需积分',
  `voucher_t_eachlimit` int(11) NOT NULL DEFAULT '1' COMMENT '每人限领张数',
  `voucher_t_styleimg` varchar(200) DEFAULT NULL COMMENT '样式模版图片',
  `voucher_t_customimg` varchar(200) DEFAULT NULL COMMENT '自定义代金券模板图片',
  `voucher_t_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推荐 0不推荐 1推荐',
  `voucher_t_gettype` tinyint(1) NOT NULL DEFAULT '1' COMMENT '领取方式 1积分兑换 2卡密兑换 3免费领取',
  `voucher_t_isbuild` tinyint(1) NOT NULL DEFAULT '0' COMMENT '领取方式为卡密兑换是否已经生成下属代金券 0未生成 1已生成',
  `voucher_t_mgradelimit` tinyint(2) NOT NULL DEFAULT '0' COMMENT '领取代金券限制的会员等级',
  PRIMARY KEY (`voucher_t_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代金券模版表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_voucher_template`
--

LOCK TABLES `te_voucher_template` WRITE;
/*!40000 ALTER TABLE `te_voucher_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_voucher_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_vr_groupbuy_area`
--

DROP TABLE IF EXISTS `te_vr_groupbuy_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_vr_groupbuy_area` (
  `area_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '区域id',
  `area_name` varchar(100) NOT NULL COMMENT '域区名称',
  `parent_area_id` int(11) NOT NULL COMMENT '域区id',
  `add_time` int(11) NOT NULL COMMENT '添加时间',
  `first_letter` char(1) NOT NULL COMMENT '首字母',
  `area_number` varchar(10) DEFAULT NULL COMMENT '区号',
  `post` varchar(10) DEFAULT NULL COMMENT '邮编',
  `hot_city` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0.否 1.是',
  `area_num` int(11) NOT NULL DEFAULT '0' COMMENT '数量',
  PRIMARY KEY (`area_id`)
) ENGINE=InnoDB AUTO_INCREMENT=382 DEFAULT CHARSET=utf8 COMMENT='虚拟抢购区域表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_vr_groupbuy_area`
--

LOCK TABLES `te_vr_groupbuy_area` WRITE;
/*!40000 ALTER TABLE `te_vr_groupbuy_area` DISABLE KEYS */;
INSERT INTO `te_vr_groupbuy_area` VALUES (1,'天津',0,1395277186,'T','022','30000',1,0),(2,'北京',0,1368172202,'B','010','0',1,0),(3,'南开区',1,1395277206,'A','','0',0,0),(5,'和平区',1,1363832792,'H',NULL,NULL,1,1),(6,'大悦城',3,1395286450,'D','','0',0,0),(7,'鞍山',0,1367830248,'A',NULL,NULL,0,0),(8,'安顺',0,1367830274,'A',NULL,NULL,0,0),(9,'阿坝',0,1367830293,'A',NULL,NULL,0,0),(10,'阿拉善',0,1367830301,'A',NULL,NULL,0,0),(12,'包头',0,1367830350,'B',NULL,NULL,0,0),(13,'保定',0,1367830358,'B',NULL,NULL,0,0),(14,'巴中',0,1367830379,'B',NULL,NULL,0,0),(15,'成都',0,1367830392,'C',NULL,NULL,0,0),(16,'重庆',0,1367830411,'C',NULL,NULL,1,0),(17,'常州',0,1367830422,'C',NULL,NULL,0,0),(18,'长沙',0,1367830434,'C',NULL,NULL,1,0),(19,'长春',0,1367830446,'C',NULL,NULL,0,0),(20,'东莞',0,1367830459,'D',NULL,NULL,0,0),(21,'大连',0,1367830469,'D',NULL,NULL,1,0),(22,'东营',0,1367830479,'C',NULL,NULL,0,0),(23,'大庆',0,1367830489,'C',NULL,NULL,0,0),(24,'大同',0,1367830498,'A',NULL,NULL,0,0),(25,'恩施',0,1367830508,'E',NULL,NULL,0,0),(26,'鄂州',0,1367830518,'E',NULL,NULL,0,0),(27,'鄂尔多斯',0,1367830530,'E',NULL,NULL,0,0),(28,'福州',0,1367830542,'F',NULL,NULL,0,0),(29,'佛山',0,1367830555,'F',NULL,NULL,0,0),(30,'抚顺',0,1367830566,'F',NULL,NULL,0,0),(31,'阜阳',0,1367830578,'F',NULL,NULL,0,0),(32,'抚州',0,1367830590,'F',NULL,NULL,0,0),(33,'广州',0,1367830602,'G',NULL,NULL,1,0),(34,'贵阳',0,1367830612,'G',NULL,NULL,0,0),(35,'桂林',0,1367830622,'G',NULL,NULL,0,0),(36,'赣州',0,1367830635,'G',NULL,NULL,0,0),(37,'广元',0,1367830646,'G',NULL,NULL,0,0),(38,'杭州',0,1367830659,'H',NULL,NULL,1,0),(39,'哈尔滨',0,1367830670,'H',NULL,NULL,0,0),(40,'合肥',0,1367830683,'H',NULL,NULL,0,0),(41,'邯郸',0,1367830694,'H',NULL,NULL,0,0),(42,'惠州',0,1367830706,'H',NULL,NULL,0,0),(43,'济南',0,1367830720,'J',NULL,NULL,1,0),(44,'济宁',0,1367830732,'J',NULL,NULL,0,0),(45,'嘉兴',0,1367830769,'J',NULL,NULL,0,0),(46,'昆明',0,1367830783,'K',NULL,NULL,0,0),(47,'昆山',0,1367830792,'K',NULL,NULL,0,0),(48,'喀什',0,1367830803,'K',NULL,NULL,0,0),(49,'克拉玛依',0,1367830814,'K',NULL,NULL,0,0),(50,'兰州',0,1367830827,'L',NULL,NULL,0,0),(51,'临沂',0,1367830836,'L',NULL,NULL,0,0),(52,'连云港',0,1367830846,'L',NULL,NULL,0,0),(53,'马鞍山',0,1367830858,'M',NULL,NULL,0,0),(54,'绵阳',0,1367830867,'M',NULL,NULL,0,0),(55,'茂名',0,1367830878,'M',NULL,NULL,0,0),(56,'南京',0,1367830891,'N',NULL,NULL,1,0),(57,'宁波',0,1367830902,'N',NULL,NULL,0,0),(58,'南通',0,1367830914,'N',NULL,NULL,0,0),(59,'萍乡',0,1367830930,'P',NULL,NULL,0,0),(60,'平顶山',0,1367830940,'P',NULL,NULL,0,0),(61,'莆田',0,1367830951,'P',NULL,NULL,0,0),(62,'青岛',0,1367830963,'Q',NULL,NULL,1,0),(63,'泉州',0,1367830973,'Q',NULL,NULL,0,0),(64,'秦皇岛',0,1367830983,'Q',NULL,NULL,0,0),(65,'日照',0,1367830998,'R',NULL,NULL,0,0),(66,'日喀则',0,1367831009,'R',NULL,NULL,0,0),(67,'上海',0,1367831021,'S',NULL,NULL,1,0),(68,'深圳',0,1367831032,'S',NULL,NULL,0,0),(69,'沈阳',0,1367831042,'S',NULL,NULL,0,0),(70,'太原',0,1367831057,'T',NULL,NULL,1,0),(71,'泰安',0,1367831068,'T',NULL,NULL,0,0),(72,'武汉',0,1367831089,'W',NULL,NULL,0,0),(73,'无锡',0,1367831100,'W',NULL,NULL,0,0),(74,'温州',0,1367831112,'W',NULL,NULL,0,0),(75,'西安',0,1367831123,'X',NULL,NULL,0,0),(76,'西安',0,1367831133,'X',NULL,NULL,0,0),(77,'徐州',0,1367831146,'X',NULL,NULL,0,0),(78,'扬州',0,1367831158,'Y',NULL,NULL,0,0),(79,'烟台',0,1367831168,'Y',NULL,NULL,0,0),(80,'盐城',0,1367831180,'Y',NULL,NULL,0,0),(81,'郑州',0,1367831190,'Z',NULL,NULL,0,0),(82,'镇江',0,1367831200,'Z',NULL,NULL,0,0),(83,'中山',0,1367831213,'Z',NULL,NULL,0,0),(84,'阿里',0,1376357672,'A','','0',0,0),(85,'安康',0,1367889614,'A',NULL,NULL,0,0),(86,'阿克苏',0,1367889622,'A',NULL,NULL,0,0),(87,'安庆',0,1367889629,'A',NULL,NULL,0,0),(88,'阿勒泰',0,1367889638,'A',NULL,NULL,0,0),(89,'安阳',0,1367889646,'A',NULL,NULL,0,0),(90,'澳门',0,1367889653,'A',NULL,NULL,0,0),(91,'巴州',0,1367889663,'B',NULL,NULL,0,0),(92,'亳州',0,1367889677,'B',NULL,NULL,0,0),(93,'滨州',0,1367889687,'B',NULL,NULL,0,0),(94,'博尔塔拉',0,1367889697,'B',NULL,NULL,0,0),(95,'毕节',0,1367889707,'B',NULL,NULL,0,0),(96,'保山',0,1367889719,'B',NULL,NULL,0,0),(97,'本溪',0,1367889728,'B',NULL,NULL,0,0),(98,'百色',0,1367889738,'B',NULL,NULL,0,0),(99,'宝鸡',0,1367889748,'B',NULL,NULL,0,0),(100,'巴彦淖尔',0,1367889757,'B',NULL,NULL,0,0),(101,'北海',0,1367889766,'B',NULL,NULL,0,0),(102,'北海',0,1367889775,'B',NULL,NULL,0,0),(103,'白城',0,1367889785,'B',NULL,NULL,0,0),(104,'白银',0,1367889797,'B',NULL,NULL,0,0),(105,'承德',0,1367889808,'C',NULL,NULL,0,0),(106,'池州',0,1367889817,'C',NULL,NULL,0,0),(107,'昌都',0,1367889826,'C',NULL,NULL,0,0),(108,'朝阳',0,1367889834,'C',NULL,NULL,0,0),(109,'滁州',0,1367889845,'C',NULL,NULL,0,0),(110,'常德',0,1367889856,'C',NULL,NULL,0,0),(111,'郴州',0,1367889865,'C',NULL,NULL,0,0),(112,'沧州',0,1367889875,'C',NULL,NULL,0,0),(113,'昌吉',0,1367889885,'C',NULL,NULL,0,0),(114,'潮州',0,1367889895,'C',NULL,NULL,0,0),(115,'崇左',0,1367889906,'C',NULL,NULL,0,0),(116,'巢湖',0,1367889915,'C',NULL,NULL,0,0),(117,'长治',0,1367889924,'C',NULL,NULL,0,0),(118,'楚雄',0,1367889936,'C',NULL,NULL,0,0),(119,'赤峰',0,1367889945,'C',NULL,NULL,0,0),(120,'定西',0,1367889956,'D',NULL,NULL,0,0),(121,'德宏',0,1367889965,'D',NULL,NULL,0,0),(122,'大兴安岭',0,1367889974,'D',NULL,NULL,0,0),(123,'丹东',0,1367889983,'D',NULL,NULL,0,0),(124,'德州',0,1367889992,'D',NULL,NULL,0,0),(125,'达州',0,1367890002,'D',NULL,NULL,0,0),(126,'迪庆',0,1367890012,'D',NULL,NULL,0,0),(127,'德阳',0,1367890022,'D',NULL,NULL,0,0),(128,'大理',0,1367890031,'D',NULL,NULL,0,0),(129,'阜新',0,1367890041,'E',NULL,NULL,0,0),(130,'防城港',0,1367890050,'E',NULL,NULL,0,0),(131,'抚州',0,1367890059,'E',NULL,NULL,0,0),(132,'阜阳',0,1367890088,'F',NULL,NULL,0,0),(133,'贵港',0,1367890101,'G',NULL,NULL,0,0),(134,'广安',0,1367890120,'G',NULL,NULL,0,0),(135,'甘孜',0,1367890130,'G',NULL,NULL,0,0),(136,'甘南',0,1367890139,'G',NULL,NULL,0,0),(137,'固原',0,1367890148,'G',NULL,NULL,0,0),(138,'果洛',0,1367890157,'G',NULL,NULL,0,0),(139,'广元',0,1367890172,'G',NULL,NULL,0,0),(140,'葫芦岛',0,1367890183,'H',NULL,NULL,0,0),(141,'鹤壁',0,1367890192,'H',NULL,NULL,0,0),(142,'黄石',0,1367890203,'G',NULL,NULL,0,0),(143,'黄冈',0,1367890214,'H',NULL,NULL,0,0),(144,'汉中',0,1367890224,'H',NULL,NULL,0,0),(145,'红河',0,1367890233,'H',NULL,NULL,0,0),(146,'河源',0,1367890243,'H',NULL,NULL,0,0),(147,'衡水',0,1367890253,'H',NULL,NULL,0,0),(148,'呼伦贝尔',0,1367890265,'H',NULL,NULL,0,0),(149,'河池',0,1367890275,'H',NULL,NULL,0,0),(150,'怀化',0,1367890284,'H',NULL,NULL,0,0),(151,'贺州',0,1367890294,'H',NULL,NULL,0,0),(152,'海西',0,1367890304,'H',NULL,NULL,0,0),(153,'黄山',0,1367890314,'H',NULL,NULL,0,0),(154,'淮南',0,1367890327,'H',NULL,NULL,0,0),(155,'淮安',0,1367890337,'H',NULL,NULL,0,0),(156,'哈密',0,1367890346,'H',NULL,NULL,0,0),(157,'和田',0,1367890355,'H',NULL,NULL,0,0),(158,'黑河',0,1367890367,'H',NULL,NULL,0,0),(159,'九江',0,1367890378,'J',NULL,NULL,0,0),(160,'荆门',0,1367890386,'J',NULL,NULL,0,0),(161,'晋中',0,1367890396,'J',NULL,NULL,0,0),(162,'揭阳',0,1367890406,'J',NULL,NULL,0,0),(163,'晋城',0,1367890421,'J',NULL,NULL,0,0),(164,'济源',0,1367890431,'J',NULL,NULL,0,0),(165,'鸡西',0,1367890440,'J',NULL,NULL,0,0),(166,'金昌',0,1367890448,'J',NULL,NULL,0,0),(167,'酒泉',0,1367890459,'J',NULL,NULL,0,0),(168,'佳木斯',0,1367890468,'J',NULL,NULL,0,0),(169,'吉安',0,1367890484,'J',NULL,NULL,0,0),(170,'景德镇',0,1367890496,'J',NULL,NULL,0,0),(171,'江门',0,1367890505,'J',NULL,NULL,0,0),(172,'锦州',0,1367890515,'J',NULL,NULL,0,0),(173,'吉林',0,1367890524,'J',NULL,NULL,0,0),(174,'荆州',0,1367890533,'J',NULL,NULL,0,0),(175,'克州',0,1367890545,'K',NULL,NULL,0,0),(176,'开封',0,1367890554,'K',NULL,NULL,0,0),(177,'乐山',0,1367890567,'L',NULL,NULL,0,0),(178,'泸州',0,1367890576,'L',NULL,NULL,0,0),(179,'来宾',0,1367890585,'L',NULL,NULL,0,0),(180,'娄底',0,1367890596,'L',NULL,NULL,0,0),(181,'林芝',0,1367890606,'L',NULL,NULL,0,0),(182,'临夏',0,1367890615,'L',NULL,NULL,0,0),(183,'丽水',0,1367890623,'L',NULL,NULL,0,0),(184,'吕梁',0,1367890633,'L',NULL,NULL,0,0),(185,'漯河',0,1367890642,'L',NULL,NULL,0,0),(186,'莱芜',0,1367890652,'L',NULL,NULL,0,0),(187,'辽阳',0,1367890661,'L',NULL,NULL,0,0),(188,'辽源',0,1367890672,'L',NULL,NULL,0,0),(189,'拉萨',0,1367890681,'L',NULL,NULL,0,0),(190,'陇南',0,1367890693,'L',NULL,NULL,0,0),(191,'临沧',0,1367890701,'L',NULL,NULL,0,0),(192,'丽江',0,1367890712,'L',NULL,NULL,0,0),(193,'六安',0,1367890721,'L',NULL,NULL,0,0),(194,'凉山',0,1367890730,'L',NULL,NULL,0,0),(195,'六盘水',0,1367890739,'L',NULL,NULL,0,0),(196,'龙岩',0,1367890749,'L',NULL,NULL,0,0),(197,'廊坊',0,1367890758,'L',NULL,NULL,0,0),(198,'眉山',0,1367890772,'M',NULL,NULL,0,0),(199,'梅州',0,1367890781,'M',NULL,NULL,0,0),(200,'牡丹江',0,1367890791,'M',NULL,NULL,0,0),(201,'那曲',0,1367890800,'N',NULL,NULL,0,0),(202,'南阳',0,1367890810,'N',NULL,NULL,0,0),(203,'南平',0,1367890819,'N',NULL,NULL,0,0),(204,'怒江',0,1367890828,'N',NULL,NULL,0,0),(205,'内江',0,1367890837,'N',NULL,NULL,0,0),(206,'宁德',0,1367890845,'N',NULL,NULL,0,0),(207,'南充',0,1367890854,'N',NULL,NULL,0,0),(208,'南昌',0,1367890863,'N',NULL,NULL,0,0),(209,'盘锦',0,1367890872,'P',NULL,NULL,0,0),(210,'普洱',0,1367890884,'P',NULL,NULL,0,0),(211,'平凉',0,1367890894,'P',NULL,NULL,0,0),(212,'攀枝花',0,1367890907,'P',NULL,NULL,0,0),(213,'濮阳',0,1367890915,'P',NULL,NULL,0,0),(214,'清远',0,1367890927,'Q',NULL,NULL,0,0),(215,'七台河',0,1367890937,'Q',NULL,NULL,0,0),(216,'黔东南',0,1367890946,'Q',NULL,NULL,0,0),(217,'曲靖',0,1367890960,'Q',NULL,NULL,0,0),(218,'黔南',0,1367890978,'Q',NULL,NULL,0,0),(219,'钦州',0,1367890986,'Q',NULL,NULL,0,0),(220,'黔西南',0,1367890995,'Q',NULL,NULL,0,0),(221,'衢州',0,1367891003,'Q',NULL,NULL,0,0),(222,'商洛',0,1367891022,'S',NULL,NULL,0,0),(223,'宿州',0,1367891034,'S',NULL,NULL,0,0),(224,'汕头',0,1367891044,'S',NULL,NULL,0,0),(225,'双鸭山',0,1367891053,'S',NULL,NULL,0,0),(226,'石嘴山',0,1367891063,'S',NULL,NULL,0,0),(227,'三明',0,1367891071,'S',NULL,NULL,0,0),(228,'宿迁',0,1367891080,'S',NULL,NULL,0,0),(229,'三峡',0,1367891089,'S',NULL,NULL,0,0),(230,'四平',0,1367891098,'S',NULL,NULL,0,0),(231,'汕尾',0,1367891107,'S',NULL,NULL,0,0),(232,'随州',0,1367891116,'S',NULL,NULL,0,0),(233,'朔州',0,1367891125,'S',NULL,NULL,0,0),(234,'商丘',0,1367891135,'S',NULL,NULL,0,0),(235,'遂宁',0,1367891144,'S',NULL,NULL,0,0),(236,'邵阳',0,1367891153,'S',NULL,NULL,0,0),(237,'山南',0,1367891161,'S',NULL,NULL,0,0),(238,'三门峡',0,1367891172,'S',NULL,NULL,0,0),(239,'十堰',0,1367891181,'S',NULL,NULL,0,0),(240,'上饶',0,1367891190,'S',NULL,NULL,0,0),(241,'松原',0,1367891199,'S',NULL,NULL,0,0),(242,'绥化',0,1367891208,'S',NULL,NULL,0,0),(243,'韶关',0,1367891218,'S',NULL,NULL,0,0),(244,'通化',0,1367891228,'T',NULL,NULL,0,0),(245,'铁岭',0,1367891236,'T',NULL,NULL,0,0),(246,'通辽',0,1367891246,'T',NULL,NULL,0,0),(247,'天水',0,1367891255,'T',NULL,NULL,0,0),(248,'吐鲁番',0,1367891264,'T',NULL,NULL,0,0),(249,'铜仁',0,1367891274,'T',NULL,NULL,0,0),(250,'台北',0,1367891282,'T',NULL,NULL,0,0),(251,'铜川',0,1367891291,'T',NULL,NULL,0,0),(252,'铜陵',0,1367891299,'T',NULL,NULL,0,0),(253,'塔城',0,1367891307,'T',NULL,NULL,0,0),(254,'泰州',0,1367891316,'T',NULL,NULL,0,0),(255,'乌海',0,1367891328,'W',NULL,NULL,0,0),(256,'文山',0,1367891345,'W',NULL,NULL,0,0),(257,'乌兰察布',0,1367891352,'A',NULL,NULL,0,0),(258,'渭南',0,1367891361,'W',NULL,NULL,0,0),(259,'武威',0,1367891370,'W',NULL,NULL,0,0),(260,'吴忠',0,1367891380,'W',NULL,NULL,0,0),(261,'梧州',0,1367891389,'W',NULL,NULL,0,0),(262,'乌鲁木齐',0,1367891398,'W',NULL,NULL,0,0),(263,'潍坊',0,1367891407,'W',NULL,NULL,0,0),(264,'威海',0,1367891416,'W',NULL,NULL,0,0),(265,'芜湖',0,1367891426,'W',NULL,NULL,0,0),(266,'许昌',0,1367891436,'X',NULL,NULL,0,0),(267,'咸宁',0,1367891449,'X',NULL,NULL,0,0),(268,'信阳',0,1367891458,'X',NULL,NULL,0,0),(269,'香港',0,1367891466,'X',NULL,NULL,0,0),(270,'宣城',0,1367891475,'X',NULL,NULL,0,0),(271,'咸阳',0,1367891485,'X',NULL,NULL,0,0),(272,'忻州',0,1367891496,'X',NULL,NULL,0,0),(273,'湘西',0,1367891520,'X',NULL,NULL,0,0),(274,'新乡',0,1367891532,'X',NULL,NULL,0,0),(275,'邢台',0,1367891541,'X',NULL,NULL,0,0),(276,'兴安',0,1367891550,'X',NULL,NULL,0,0),(277,'锡林郭勒',0,1367891560,'X',NULL,NULL,0,0),(278,'湘潭',0,1367891568,'X',NULL,NULL,0,0),(279,'新余',0,1367891578,'X',NULL,NULL,0,0),(280,'西双版纳',0,1367891588,'X',NULL,NULL,0,0),(281,'孝感',0,1367891600,'X',NULL,NULL,0,0),(282,'伊春',0,1367891610,'Y',NULL,NULL,0,0),(283,'阳江',0,1367891619,'Y',NULL,NULL,0,0),(284,'延边',0,1367891632,'Y',NULL,NULL,0,0),(285,'云浮',0,1367891643,'Y',NULL,NULL,0,0),(286,'榆林',0,1367891652,'Y',NULL,NULL,0,0),(287,'延安',0,1367891662,'Y',NULL,NULL,0,0),(288,'阳泉',0,1367891672,'Y',NULL,NULL,0,0),(289,'玉溪',0,1367891681,'Y',NULL,NULL,0,0),(290,'益阳',0,1367891690,'Y',NULL,NULL,0,0),(291,'宜宾',0,1367891699,'Y',NULL,NULL,0,0),(292,'永州',0,1367891708,'Y',NULL,NULL,0,0),(293,'营口',0,1367891719,'Y',NULL,NULL,0,0),(294,'宜春',0,1367891733,'Y',NULL,NULL,0,0),(295,'玉树',0,1367891742,'Y',NULL,NULL,0,0),(296,'伊犁',0,1367891752,'Y',NULL,NULL,0,0),(297,'雅安',0,1367891761,'Y',NULL,NULL,0,0),(298,'鹰潭',0,1367891770,'Y',NULL,NULL,0,0),(299,'银川',0,1367891780,'Y',NULL,NULL,0,0),(300,'枣庄',0,1367891790,'Z',NULL,NULL,0,0),(301,'中卫',0,1367891801,'Z',NULL,NULL,0,0),(302,'资阳',0,1367891810,'Z',NULL,NULL,0,0),(303,'张家口',0,1367891821,'Z',NULL,NULL,0,0),(304,'驻马店',0,1367891830,'Z',NULL,NULL,0,0),(305,'周口',0,1367891840,'Z',NULL,NULL,0,0),(306,'张家界',0,1367891849,'Z',NULL,NULL,0,0),(307,'昭通',0,1367891858,'Z',NULL,NULL,0,0),(308,'张掖',0,1367891866,'Z',NULL,NULL,0,0),(309,'肇庆',0,1367891878,'Z',NULL,NULL,0,0),(310,'湛江',0,1367891888,'Z',NULL,NULL,0,0),(314,'河西区',1,1367915137,'A',NULL,NULL,0,0),(315,'河东区',1,1367915221,'A',NULL,NULL,0,0),(316,'水游城',3,1367915892,'A',NULL,NULL,0,0),(317,'河北区',1,1367916777,'H',NULL,NULL,0,0),(318,'红桥区',1,1367916799,'H',NULL,NULL,0,0),(319,'滨海新区',1,1367916834,'B',NULL,NULL,0,0),(320,'老城厢/大悦城',3,1367916878,'L',NULL,NULL,0,0),(321,'白堤路/风荷园',3,1367916904,'B',NULL,NULL,0,0),(322,'王顶堤/华苑',3,1367916922,'A',NULL,NULL,0,0),(323,'水上/天塔',3,1367916942,'S',NULL,NULL,0,0),(324,'时代奥城',3,1367916960,'A',NULL,NULL,0,0),(325,'长虹公园',3,1367916985,'C',NULL,NULL,0,0),(326,'南开公园',3,1367917001,'A',NULL,NULL,0,0),(327,'南开大学/八里台',3,1367917020,'A',NULL,NULL,0,0),(328,'海光寺/六里台',3,1367917047,'A',NULL,NULL,0,0),(329,'天拖地区',3,1367917062,'A',NULL,NULL,0,0),(330,'鼓楼/七向街',3,1367917077,'A',NULL,NULL,0,0),(331,'鞍山西道',3,1367917100,'A',NULL,NULL,0,0),(332,'东马路/新世界百货',3,1367917114,'A',NULL,NULL,0,0),(333,'滨江道',5,1367917139,'A',NULL,NULL,0,1),(334,'和平路',5,1367917155,'A',NULL,NULL,0,0),(335,'小白楼',5,1367917169,'A',NULL,NULL,0,0),(336,'鞍山道沿线',5,1367917185,'A',NULL,NULL,0,0),(337,'南市',5,1367917201,'A',NULL,NULL,0,0),(338,'五大道',5,1367917216,'A',NULL,NULL,0,0),(339,'西康路沿线',5,1367917235,'A',NULL,NULL,0,0),(340,'津湾广场',5,1367917249,'A',NULL,NULL,0,0),(341,'荣业大街',5,1367917267,'A',NULL,NULL,0,0),(342,'土城',314,1367917309,'A',NULL,NULL,0,0),(343,'小海地',314,1367917326,'A',NULL,NULL,0,0),(344,'体院北',314,1367917341,'A',NULL,NULL,0,0),(345,'图书大厦',314,1367917357,'A',NULL,NULL,0,0),(346,'梅江',314,1367917373,'A',NULL,NULL,0,0),(347,'永安道',314,1367917388,'A',NULL,NULL,0,0),(348,'尖山',314,1367917401,'A',NULL,NULL,0,0),(349,'佟楼',314,1367917424,'A',NULL,NULL,0,0),(350,'乐园道',314,1367917440,'A',NULL,NULL,0,0),(351,'下瓦房',314,1367917457,'A',NULL,NULL,0,0),(352,'南楼',314,1367917471,'A',NULL,NULL,0,0),(353,'越秀路',314,1367917485,'A',NULL,NULL,0,0),(354,'天津站后广场',315,1367917503,'A',NULL,NULL,0,0),(355,'卫国道',315,1367917740,'A',NULL,NULL,0,0),(356,'二宫',3,1367917756,'A',NULL,NULL,0,0),(357,'河东万达广场',3,1367917775,'A',NULL,NULL,0,0),(358,'万新村',315,1367917791,'A',NULL,NULL,0,0),(359,'工业大学',315,1367917805,'A',NULL,NULL,0,0),(360,'大王庄',315,1367917819,'A',NULL,NULL,0,0),(361,'大直沽',315,1367917833,'A',NULL,NULL,0,0),(362,'中山门',315,1367917849,'A',NULL,NULL,0,0),(363,'金钟河大街',317,1367917874,'A',NULL,NULL,0,0),(364,'狮子林大街',317,1367917885,'A',NULL,NULL,0,0),(365,'天泰路/榆关道',317,1367917899,'A',NULL,NULL,0,0),(366,'意大利风情区/火车站',317,1367917913,'A',NULL,NULL,0,0),(367,'中山路',317,1367917924,'A',NULL,NULL,0,0),(368,'王串场/民权门',317,1367917939,'A',NULL,NULL,0,0),(369,'汉沽城区',319,1367917968,'A',NULL,NULL,0,0),(370,'大港城区',319,1367917982,'A',NULL,NULL,0,0),(371,'大港油田',319,1367917995,'A',NULL,NULL,0,0),(372,'经济开发区',319,1367918007,'A',NULL,NULL,0,0),(373,'塘沽城区',319,1367918020,'A',NULL,NULL,0,0),(374,'大胡同',318,1367918039,'A',NULL,NULL,0,0),(375,'天津西站',318,1367918053,'A',NULL,NULL,0,0),(376,'创意街/水木天成',318,1367918065,'A',NULL,NULL,0,0),(377,'凯莱赛',318,1367918077,'A',NULL,NULL,0,0),(378,'本溪路/丁字沽',318,1367918094,'A',NULL,NULL,0,0),(379,'芥园道/水游城',318,1367918107,'A',NULL,NULL,0,0),(380,'东城区',2,1367978117,'A',NULL,NULL,0,0),(381,'西城区',2,1367978125,'A',NULL,NULL,0,0);
/*!40000 ALTER TABLE `te_vr_groupbuy_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_vr_groupbuy_class`
--

DROP TABLE IF EXISTS `te_vr_groupbuy_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_vr_groupbuy_class` (
  `class_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `class_name` varchar(100) NOT NULL COMMENT '分类名称',
  `parent_class_id` int(11) NOT NULL COMMENT '父类class_id',
  `class_sort` tinyint(3) unsigned DEFAULT NULL COMMENT '分类排序',
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COMMENT='虚拟抢购分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_vr_groupbuy_class`
--

LOCK TABLES `te_vr_groupbuy_class` WRITE;
/*!40000 ALTER TABLE `te_vr_groupbuy_class` DISABLE KEYS */;
INSERT INTO `te_vr_groupbuy_class` VALUES (2,'餐饮美食',0,2),(3,'休闲娱乐',0,2),(7,'生活服务',0,3),(8,'小吃快餐',2,1),(9,'火锅',2,2),(10,'自助餐',2,3),(12,'川菜',2,5),(13,'甜品饮品',2,6),(14,'日本料理',2,7),(15,'韩国料理',2,8),(16,'主题餐厅',2,9),(17,'KTV',3,1),(18,'酒吧',3,2),(19,'电影院',3,3),(20,'公园景点',3,4),(21,'足浴按摩',3,5),(22,'运动健身',3,6),(23,'瑜伽馆',3,7),(24,'书店',3,8),(25,'电玩',3,9),(26,'电影演出',0,4),(27,'商场超市',0,5),(29,'婚庆摄像',7,1),(30,'母婴服务',7,2),(31,'银行',7,3),(32,'搬家',7,4),(33,'维修',7,5),(34,'家政保姆',7,6),(35,'开锁',7,7),(36,'宠物服务',7,8),(37,'洗衣店',7,9),(38,'电子通票',26,1),(39,'帮你代购',26,2),(40,'万达院线',26,3),(41,'金逸院线',26,4),(42,'嘉禾院线',26,5),(43,'博纳院线',26,6),(44,'UME院线',26,7),(45,'中影国际',26,8),(46,'耀莱国际',26,9),(47,'物美超市',27,1),(48,'超市卡',27,2),(49,'商场卡',27,3),(50,'水果券',27,4),(51,'购物券',27,5),(52,'食品券',27,6),(53,'网店优惠券',27,7),(54,'新世界',27,8),(55,'银泰',27,9),(56,'新一佳',27,10),(69,'电子优惠',0,6),(74,'俏江南',69,1),(75,'哈根达斯',69,2),(76,'银泰百货',69,3),(77,'阳澄湖',69,4),(78,'许留山',69,5),(79,'酷圣石',69,6),(80,'克丽缇娜',69,7),(81,'一兆韦德',69,8),(82,'宝岛眼镜',69,9),(83,'金钱豹',69,10),(84,'摄像写真',0,7),(85,'婚纱摄影',84,1),(86,'儿童摄影',84,2),(87,'写真摄影',84,3),(88,'商品摄影',84,4),(89,'个人写真',84,5),(94,'教育培训',0,8),(95,'语言培训',94,1),(96,'中小学教育',94,2),(97,'少儿培训',94,3),(98,'公务员培训',94,4),(99,'学历教育',94,5),(100,'职业资格认证',94,6);
/*!40000 ALTER TABLE `te_vr_groupbuy_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_vr_order`
--

DROP TABLE IF EXISTS `te_vr_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_vr_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '虚拟订单索引id',
  `order_sn` bigint(20) unsigned NOT NULL COMMENT '订单编号',
  `store_id` int(11) unsigned NOT NULL COMMENT '卖家店铺id',
  `store_name` varchar(50) NOT NULL COMMENT '卖家店铺名称',
  `buyer_id` int(11) unsigned NOT NULL COMMENT '买家id',
  `buyer_name` varchar(50) NOT NULL COMMENT '买家登录名',
  `buyer_phone` varchar(11) NOT NULL COMMENT '买家手机',
  `add_time` int(10) unsigned NOT NULL COMMENT '订单生成时间',
  `payment_code` char(10) DEFAULT '' COMMENT '支付方式名称代码',
  `payment_time` int(10) unsigned DEFAULT '0' COMMENT '支付(付款)时间',
  `trade_no` varchar(35) DEFAULT NULL COMMENT '第三方平台交易号',
  `close_time` int(10) unsigned DEFAULT '0' COMMENT '关闭时间',
  `close_reason` varchar(50) DEFAULT NULL COMMENT '关闭原因',
  `finnshed_time` int(11) DEFAULT NULL COMMENT '完成时间',
  `order_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '订单总价格(支付金额)',
  `refund_amount` decimal(10,2) DEFAULT '0.00' COMMENT '退款金额',
  `rcb_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '充值卡支付金额',
  `pd_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '预存款支付金额',
  `order_state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '订单状态：0(已取消)10(默认):未付款;20:已付款;40:已完成;',
  `refund_state` tinyint(1) unsigned DEFAULT '0' COMMENT '退款状态:0是无退款,1是部分退款,2是全部退款',
  `buyer_msg` varchar(150) DEFAULT NULL COMMENT '买家留言',
  `delete_state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态0未删除1放入回收站2彻底删除',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称',
  `goods_price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `goods_num` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '商品数量',
  `goods_image` varchar(100) DEFAULT NULL COMMENT '商品图片',
  `commis_rate` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '佣金比例',
  `gc_id` mediumint(9) DEFAULT '0' COMMENT '商品最底级分类ID',
  `vr_indate` int(11) DEFAULT NULL COMMENT '有效期',
  `vr_send_times` tinyint(4) NOT NULL DEFAULT '0' COMMENT '兑换码发送次数',
  `vr_invalid_refund` tinyint(4) NOT NULL DEFAULT '1' COMMENT '允许过期退款1是0否',
  `order_promotion_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '订单参加的促销类型 0无促销1抢购',
  `promotions_id` mediumint(9) DEFAULT '0' COMMENT '促销ID，与order_promotion_type配合使用',
  `order_from` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1WEB2mobile',
  `evaluation_state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '评价状态0默认1已评价2禁止评价',
  `evaluation_time` int(11) NOT NULL DEFAULT '0' COMMENT '评价时间',
  `use_state` tinyint(4) DEFAULT '0' COMMENT '使用状态0默认，未使用1已使用，有一个被使用即为1',
  `api_pay_time` int(10) unsigned DEFAULT '0' COMMENT '在线支付动作时间,只有站内+在线组合支付时记录',
  `goods_contractid` varchar(100) DEFAULT NULL COMMENT '商品开启的消费者保障服务id',
  `goods_spec` varchar(200) DEFAULT NULL COMMENT '规格',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='虚拟订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_vr_order`
--

LOCK TABLES `te_vr_order` WRITE;
/*!40000 ALTER TABLE `te_vr_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_vr_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_vr_order_bill`
--

DROP TABLE IF EXISTS `te_vr_order_bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_vr_order_bill` (
  `ob_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键作为结算单号',
  `ob_no` int(11) DEFAULT '0' COMMENT '结算单编号(年月店铺ID)',
  `ob_start_date` int(11) NOT NULL COMMENT '开始日期',
  `ob_end_date` int(11) NOT NULL COMMENT '结束日期',
  `ob_order_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单金额',
  `ob_commis_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '佣金金额',
  `ob_result_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '应结金额',
  `ob_create_date` int(11) DEFAULT '0' COMMENT '生成结算单日期',
  `os_month` mediumint(6) unsigned DEFAULT NULL COMMENT '出账单应结时间,ob_end_date+1所在月(年月份)',
  `ob_state` enum('1','2','3','4') DEFAULT '1' COMMENT '1默认2店家已确认3平台已审核4结算完成',
  `ob_pay_date` int(11) DEFAULT '0' COMMENT '付款日期',
  `ob_pay_content` varchar(200) DEFAULT '' COMMENT '支付备注',
  `ob_store_id` int(11) NOT NULL COMMENT '店铺ID',
  `ob_store_name` varchar(50) DEFAULT NULL COMMENT '店铺名',
  PRIMARY KEY (`ob_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='虚拟订单结算表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_vr_order_bill`
--

LOCK TABLES `te_vr_order_bill` WRITE;
/*!40000 ALTER TABLE `te_vr_order_bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_vr_order_bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_vr_order_code`
--

DROP TABLE IF EXISTS `te_vr_order_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_vr_order_code` (
  `rec_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '兑换码表索引id',
  `order_id` int(11) NOT NULL COMMENT '虚拟订单id',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `buyer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '买家ID',
  `vr_code` varchar(18) NOT NULL COMMENT '兑换码',
  `vr_state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '使用状态 0:(默认)未使用1:已使用2:已过期',
  `vr_usetime` int(11) DEFAULT NULL COMMENT '使用时间',
  `pay_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '实际支付金额(结算)',
  `vr_indate` int(11) DEFAULT NULL COMMENT '过期时间',
  `commis_rate` smallint(6) NOT NULL DEFAULT '0' COMMENT '佣金比例',
  `refund_lock` tinyint(1) unsigned DEFAULT '0' COMMENT '退款锁定状态:0为正常,1为锁定,2为同意,默认为0',
  `vr_invalid_refund` tinyint(4) NOT NULL DEFAULT '1' COMMENT '允许过期退款1是0否',
  PRIMARY KEY (`rec_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='兑换码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_vr_order_code`
--

LOCK TABLES `te_vr_order_code` WRITE;
/*!40000 ALTER TABLE `te_vr_order_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_vr_order_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_vr_order_snapshot`
--

DROP TABLE IF EXISTS `te_vr_order_snapshot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_vr_order_snapshot` (
  `order_id` int(11) NOT NULL COMMENT '主键',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `create_time` int(11) NOT NULL COMMENT '生成时间',
  `goods_attr` text COMMENT '属性',
  `goods_body` text COMMENT '详情',
  `plate_top` text COMMENT '顶部关联版式',
  `plate_bottom` text COMMENT '底部关联版式',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='虚拟订单快照表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_vr_order_snapshot`
--

LOCK TABLES `te_vr_order_snapshot` WRITE;
/*!40000 ALTER TABLE `te_vr_order_snapshot` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_vr_order_snapshot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_vr_order_statis`
--

DROP TABLE IF EXISTS `te_vr_order_statis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_vr_order_statis` (
  `os_month` mediumint(9) unsigned NOT NULL DEFAULT '0' COMMENT '统计编号(年月)',
  `os_year` smallint(6) DEFAULT '0' COMMENT '年',
  `os_start_date` int(11) NOT NULL COMMENT '开始日期',
  `os_end_date` int(11) NOT NULL COMMENT '结束日期',
  `os_order_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单金额',
  `os_commis_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '佣金金额',
  `os_result_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '本期应结',
  `os_create_date` int(11) DEFAULT NULL COMMENT '创建记录日期',
  PRIMARY KEY (`os_month`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='虚拟订单月销量统计表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_vr_order_statis`
--

LOCK TABLES `te_vr_order_statis` WRITE;
/*!40000 ALTER TABLE `te_vr_order_statis` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_vr_order_statis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_vr_refund`
--

DROP TABLE IF EXISTS `te_vr_refund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_vr_refund` (
  `refund_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `order_id` int(10) unsigned NOT NULL COMMENT '虚拟订单ID',
  `order_sn` varchar(50) NOT NULL COMMENT '虚拟订单编号',
  `refund_sn` varchar(50) NOT NULL COMMENT '申请编号',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺ID',
  `store_name` varchar(20) NOT NULL COMMENT '店铺名称',
  `buyer_id` int(10) unsigned NOT NULL COMMENT '买家ID',
  `buyer_name` varchar(50) NOT NULL COMMENT '买家会员名',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `goods_num` int(10) unsigned DEFAULT '1' COMMENT '退款商品数量',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称',
  `goods_image` varchar(100) DEFAULT NULL COMMENT '商品图片',
  `code_sn` varchar(300) NOT NULL COMMENT '兑换码编号',
  `refund_amount` decimal(10,2) DEFAULT '0.00' COMMENT '退款金额',
  `admin_state` tinyint(1) unsigned DEFAULT '1' COMMENT '退款状态:1为待审核,2为同意,3为不同意,默认为1',
  `add_time` int(10) unsigned NOT NULL COMMENT '添加时间',
  `admin_time` int(10) unsigned DEFAULT '0' COMMENT '管理员处理时间,默认为0',
  `buyer_message` varchar(300) DEFAULT NULL COMMENT '申请原因',
  `admin_message` varchar(300) DEFAULT NULL COMMENT '管理员备注',
  `commis_rate` smallint(6) DEFAULT '0' COMMENT '佣金比例',
  PRIMARY KEY (`refund_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='虚拟兑码退款表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_vr_refund`
--

LOCK TABLES `te_vr_refund` WRITE;
/*!40000 ALTER TABLE `te_vr_refund` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_vr_refund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_vr_refund_detail`
--

DROP TABLE IF EXISTS `te_vr_refund_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_vr_refund_detail` (
  `refund_id` int(10) unsigned NOT NULL COMMENT '记录ID',
  `order_id` int(10) unsigned NOT NULL COMMENT '订单ID',
  `batch_no` varchar(32) NOT NULL COMMENT '批次号',
  `refund_amount` decimal(10,2) DEFAULT '0.00' COMMENT '退款金额',
  `pay_amount` decimal(10,2) DEFAULT '0.00' COMMENT '在线退款金额',
  `pd_amount` decimal(10,2) DEFAULT '0.00' COMMENT '预存款金额',
  `rcb_amount` decimal(10,2) DEFAULT '0.00' COMMENT '充值卡金额',
  `refund_code` char(10) NOT NULL DEFAULT 'predeposit' COMMENT '退款支付代码',
  `refund_state` tinyint(1) unsigned DEFAULT '1' COMMENT '退款状态:1为处理中,2为已完成,默认为1',
  `add_time` int(10) unsigned NOT NULL COMMENT '添加时间',
  `pay_time` int(10) unsigned DEFAULT '0' COMMENT '在线退款完成时间,默认为0',
  PRIMARY KEY (`refund_id`),
  KEY `batch_no` (`batch_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='虚拟兑码退款详细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_vr_refund_detail`
--

LOCK TABLES `te_vr_refund_detail` WRITE;
/*!40000 ALTER TABLE `te_vr_refund_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_vr_refund_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_waybill`
--

DROP TABLE IF EXISTS `te_waybill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_waybill` (
  `waybill_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `waybill_name` varchar(50) NOT NULL,
  `waybill_image` varchar(50) NOT NULL,
  `waybill_width` int(10) unsigned NOT NULL COMMENT '宽度',
  `waybill_height` int(10) unsigned NOT NULL COMMENT '高度',
  `waybill_data` varchar(2000) DEFAULT NULL COMMENT '打印位置数据',
  `waybill_usable` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否可用',
  `waybill_top` int(11) NOT NULL DEFAULT '0' COMMENT '上偏移量',
  `waybill_left` int(11) NOT NULL DEFAULT '0' COMMENT '左偏移量',
  `express_id` tinyint(1) unsigned NOT NULL COMMENT '快递公司编号',
  `express_name` varchar(50) NOT NULL COMMENT '快递公司名称',
  `store_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '店铺编号(0-代表系统模板)',
  PRIMARY KEY (`waybill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='快递单打印模板表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_waybill`
--

LOCK TABLES `te_waybill` WRITE;
/*!40000 ALTER TABLE `te_waybill` DISABLE KEYS */;
INSERT INTO `te_waybill` VALUES (1,'百世汇通','04558238732336424.jpg',229,126,'a:10:{s:10:\"buyer_name\";a:5:{s:5:\"check\";s:2:\"on\";s:4:\"left\";s:3:\"485\";s:3:\"top\";s:2:\"97\";s:5:\"width\";s:2:\"88\";s:6:\"height\";s:2:\"24\";}s:10:\"buyer_area\";a:5:{s:5:\"check\";s:2:\"on\";s:4:\"left\";s:3:\"423\";s:3:\"top\";s:3:\"173\";s:5:\"width\";s:3:\"256\";s:6:\"height\";s:2:\"20\";}s:13:\"buyer_address\";a:5:{s:5:\"check\";s:2:\"on\";s:4:\"left\";s:3:\"420\";s:3:\"top\";s:3:\"201\";s:5:\"width\";s:3:\"333\";s:6:\"height\";s:2:\"20\";}s:12:\"buyer_mobile\";a:5:{s:5:\"check\";s:2:\"on\";s:4:\"left\";s:3:\"473\";s:3:\"top\";s:3:\"230\";s:5:\"width\";s:3:\"141\";s:6:\"height\";s:2:\"20\";}s:11:\"buyer_phone\";a:5:{s:5:\"check\";s:2:\"on\";s:4:\"left\";s:3:\"671\";s:3:\"top\";s:3:\"227\";s:5:\"width\";s:3:\"100\";s:6:\"height\";s:2:\"20\";}s:11:\"seller_name\";a:5:{s:5:\"check\";s:2:\"on\";s:4:\"left\";s:3:\"126\";s:3:\"top\";s:2:\"98\";s:5:\"width\";s:3:\"112\";s:6:\"height\";s:2:\"16\";}s:11:\"seller_area\";a:5:{s:5:\"check\";s:2:\"on\";s:4:\"left\";s:2:\"72\";s:3:\"top\";s:3:\"174\";s:5:\"width\";s:3:\"227\";s:6:\"height\";s:2:\"20\";}s:14:\"seller_address\";a:5:{s:5:\"check\";s:2:\"on\";s:4:\"left\";s:2:\"68\";s:3:\"top\";s:3:\"204\";s:5:\"width\";s:3:\"294\";s:6:\"height\";s:2:\"20\";}s:12:\"seller_phone\";a:5:{s:5:\"check\";s:2:\"on\";s:4:\"left\";s:3:\"120\";s:3:\"top\";s:3:\"231\";s:5:\"width\";s:3:\"124\";s:6:\"height\";s:2:\"20\";}s:14:\"seller_company\";a:5:{s:5:\"check\";s:2:\"on\";s:4:\"left\";s:3:\"116\";s:3:\"top\";s:3:\"124\";s:5:\"width\";s:3:\"184\";s:6:\"height\";s:2:\"20\";}}',1,-3,-5,16,'汇通快递',0),(2,'申通','04559833067248352.jpg',229,127,'a:10:{s:10:\"buyer_name\";a:5:{s:5:\"check\";s:2:\"on\";s:4:\"left\";s:3:\"497\";s:3:\"top\";s:2:\"99\";s:5:\"width\";s:3:\"100\";s:6:\"height\";s:2:\"20\";}s:10:\"buyer_area\";a:5:{s:5:\"check\";s:2:\"on\";s:4:\"left\";s:3:\"492\";s:3:\"top\";s:3:\"165\";s:5:\"width\";s:3:\"191\";s:6:\"height\";s:2:\"20\";}s:13:\"buyer_address\";a:5:{s:5:\"check\";s:2:\"on\";s:4:\"left\";s:3:\"426\";s:3:\"top\";s:3:\"200\";s:5:\"width\";s:3:\"322\";s:6:\"height\";s:2:\"20\";}s:12:\"buyer_mobile\";a:5:{s:5:\"check\";s:2:\"on\";s:4:\"left\";s:3:\"551\";s:3:\"top\";s:3:\"235\";s:5:\"width\";s:3:\"122\";s:6:\"height\";s:2:\"20\";}s:11:\"buyer_phone\";a:5:{s:5:\"check\";s:2:\"on\";s:4:\"left\";s:3:\"688\";s:3:\"top\";s:3:\"236\";s:5:\"width\";s:3:\"100\";s:6:\"height\";s:2:\"20\";}s:11:\"seller_name\";a:5:{s:5:\"check\";s:2:\"on\";s:4:\"left\";s:3:\"132\";s:3:\"top\";s:3:\"100\";s:5:\"width\";s:3:\"100\";s:6:\"height\";s:2:\"20\";}s:11:\"seller_area\";a:5:{s:5:\"check\";s:2:\"on\";s:4:\"left\";s:3:\"125\";s:3:\"top\";s:3:\"169\";s:5:\"width\";s:3:\"218\";s:6:\"height\";s:2:\"20\";}s:14:\"seller_address\";a:5:{s:5:\"check\";s:2:\"on\";s:4:\"left\";s:2:\"68\";s:3:\"top\";s:3:\"208\";s:5:\"width\";s:3:\"100\";s:6:\"height\";s:2:\"20\";}s:12:\"seller_phone\";a:5:{s:5:\"check\";s:2:\"on\";s:4:\"left\";s:3:\"171\";s:3:\"top\";s:3:\"238\";s:5:\"width\";s:3:\"159\";s:6:\"height\";s:2:\"20\";}s:14:\"seller_company\";a:5:{s:5:\"check\";s:2:\"on\";s:4:\"left\";s:3:\"140\";s:3:\"top\";s:3:\"136\";s:5:\"width\";s:3:\"217\";s:6:\"height\";s:2:\"20\";}}',1,-3,-5,28,'申通快递',0),(3,'顺风','04559894766651678.jpg',216,139,'a:10:{s:10:\"buyer_name\";a:5:{s:5:\"check\";s:2:\"on\";s:4:\"left\";s:3:\"302\";s:3:\"top\";s:3:\"290\";s:5:\"width\";s:3:\"100\";s:6:\"height\";s:2:\"20\";}s:10:\"buyer_area\";a:5:{s:5:\"check\";s:2:\"on\";s:4:\"left\";s:3:\"101\";s:3:\"top\";s:3:\"317\";s:5:\"width\";s:3:\"100\";s:6:\"height\";s:2:\"20\";}s:13:\"buyer_address\";a:4:{s:4:\"left\";s:1:\"0\";s:3:\"top\";s:1:\"0\";s:5:\"width\";s:1:\"0\";s:6:\"height\";s:1:\"0\";}s:12:\"buyer_mobile\";a:4:{s:4:\"left\";s:1:\"0\";s:3:\"top\";s:1:\"0\";s:5:\"width\";s:1:\"0\";s:6:\"height\";s:1:\"0\";}s:11:\"buyer_phone\";a:4:{s:4:\"left\";s:1:\"0\";s:3:\"top\";s:1:\"0\";s:5:\"width\";s:1:\"0\";s:6:\"height\";s:1:\"0\";}s:11:\"seller_name\";a:4:{s:4:\"left\";s:1:\"0\";s:3:\"top\";s:1:\"0\";s:5:\"width\";s:1:\"0\";s:6:\"height\";s:1:\"0\";}s:11:\"seller_area\";a:4:{s:4:\"left\";s:1:\"0\";s:3:\"top\";s:1:\"0\";s:5:\"width\";s:1:\"0\";s:6:\"height\";s:1:\"0\";}s:14:\"seller_address\";a:4:{s:4:\"left\";s:1:\"0\";s:3:\"top\";s:1:\"0\";s:5:\"width\";s:1:\"0\";s:6:\"height\";s:1:\"0\";}s:12:\"seller_phone\";a:4:{s:4:\"left\";s:1:\"0\";s:3:\"top\";s:1:\"0\";s:5:\"width\";s:1:\"0\";s:6:\"height\";s:1:\"0\";}s:14:\"seller_company\";a:4:{s:4:\"left\";s:1:\"0\";s:3:\"top\";s:1:\"0\";s:5:\"width\";s:1:\"0\";s:6:\"height\";s:1:\"0\";}}',1,-4,-5,29,'顺丰快递',0),(4,'圆通速递','04577145745163834.jpg',229,127,'a:10:{s:10:\"buyer_name\";a:5:{s:5:\"check\";s:2:\"on\";s:4:\"left\";s:3:\"471\";s:3:\"top\";s:3:\"105\";s:5:\"width\";s:3:\"179\";s:6:\"height\";s:2:\"20\";}s:10:\"buyer_area\";a:5:{s:5:\"check\";s:2:\"on\";s:4:\"left\";s:3:\"469\";s:3:\"top\";s:3:\"144\";s:5:\"width\";s:3:\"242\";s:6:\"height\";s:2:\"20\";}s:13:\"buyer_address\";a:5:{s:5:\"check\";s:2:\"on\";s:4:\"left\";s:3:\"419\";s:3:\"top\";s:3:\"173\";s:5:\"width\";s:3:\"343\";s:6:\"height\";s:2:\"20\";}s:12:\"buyer_mobile\";a:5:{s:5:\"check\";s:2:\"on\";s:4:\"left\";s:3:\"507\";s:3:\"top\";s:3:\"201\";s:5:\"width\";s:2:\"93\";s:6:\"height\";s:2:\"20\";}s:11:\"buyer_phone\";a:5:{s:5:\"check\";s:2:\"on\";s:4:\"left\";s:3:\"613\";s:3:\"top\";s:3:\"198\";s:5:\"width\";s:3:\"109\";s:6:\"height\";s:2:\"20\";}s:11:\"seller_name\";a:5:{s:5:\"check\";s:2:\"on\";s:4:\"left\";s:3:\"116\";s:3:\"top\";s:3:\"104\";s:5:\"width\";s:3:\"100\";s:6:\"height\";s:2:\"20\";}s:11:\"seller_area\";a:5:{s:5:\"check\";s:2:\"on\";s:4:\"left\";s:3:\"110\";s:3:\"top\";s:3:\"144\";s:5:\"width\";s:3:\"148\";s:6:\"height\";s:2:\"20\";}s:14:\"seller_address\";a:5:{s:5:\"check\";s:2:\"on\";s:4:\"left\";s:2:\"63\";s:3:\"top\";s:3:\"169\";s:5:\"width\";s:3:\"323\";s:6:\"height\";s:2:\"20\";}s:12:\"seller_phone\";a:5:{s:5:\"check\";s:2:\"on\";s:4:\"left\";s:3:\"151\";s:3:\"top\";s:3:\"195\";s:5:\"width\";s:3:\"139\";s:6:\"height\";s:2:\"20\";}s:14:\"seller_company\";a:5:{s:5:\"check\";s:2:\"on\";s:4:\"left\";s:3:\"109\";s:3:\"top\";s:3:\"123\";s:5:\"width\";s:3:\"271\";s:6:\"height\";s:2:\"12\";}}',1,-3,-5,40,'圆通快递',0);
/*!40000 ALTER TABLE `te_waybill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_web`
--

DROP TABLE IF EXISTS `te_web`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_web` (
  `web_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模块ID',
  `web_name` varchar(20) DEFAULT '' COMMENT '模块名称',
  `style_name` varchar(20) DEFAULT 'orange' COMMENT '风格名称',
  `web_page` varchar(10) DEFAULT 'index' COMMENT '所在页面(暂时只有index)',
  `update_time` int(10) unsigned NOT NULL COMMENT '更新时间',
  `web_sort` tinyint(1) unsigned DEFAULT '9' COMMENT '排序',
  `web_show` tinyint(1) unsigned DEFAULT '1' COMMENT '是否显示，0为否，1为是，默认为1',
  `web_html` text COMMENT '模块html代码',
  PRIMARY KEY (`web_id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8 COMMENT='页面模块表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_web`
--

LOCK TABLES `te_web` WRITE;
/*!40000 ALTER TABLE `te_web` DISABLE KEYS */;
INSERT INTO `te_web` VALUES (1,'红色','red','index',1495643287,1,1,'\r\n<div class=\"home-standard-layout wrapper style-red\">\r\n  <div class=\"left-sidebar\">\r\n    <div class=\"title\">\r\n            <div class=\"txt-type\">\r\n                <span>1F</span>\r\n                <h2 title=\"潮流女装\">潮流女装</h2>\r\n      </div>\r\n          </div>\r\n    <div class=\"left-ads\">\r\n            <a href=\"\" title=\"\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/editor/web-1-13.jpg?343\" alt=\"\"> </a>\r\n          </div>\r\n    <div class=\"recommend-classes\">\r\n    <h3>大家还喜欢了</h3>\r\n      <ul>\r\n                        <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1103\" title=\"衬衫\" target=\"_blank\">衬衫</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1104\" title=\"T恤\" target=\"_blank\">T恤</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1106\" title=\"雪纺衫\" target=\"_blank\">雪纺衫</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1524\" title=\"情侣装\" target=\"_blank\">情侣装</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1528\" title=\"大码女装\" target=\"_blank\">大码女装</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1264\" title=\"连衣裙\" target=\"_blank\">连衣裙</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1265\" title=\"半身裙\" target=\"_blank\">半身裙</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1434\" title=\"旗袍\" target=\"_blank\">旗袍</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1253\" title=\"牛仔裤\" target=\"_blank\">牛仔裤</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1254\" title=\"休闲裤\" target=\"_blank\">休闲裤</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1255\" title=\"西装裤\" target=\"_blank\">西装裤</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1443\" title=\"七分裤\" target=\"_blank\">七分裤</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1527\" title=\"短裤\" target=\"_blank\">短裤</a></li>\r\n                      </ul>\r\n    </div>\r\n  </div>\r\n  <div class=\"middle-layout\">\r\n \r\n  <ul class=\"right-brand\">\r\n\r\n                                          <li>\r\n          <a href=\"http://it.hnlichaung.com/shop/index.php?act=brand&op=list&brand=106\" title=\"RDK\" target=\"_blank\">RDK</a>\r\n        </li>\r\n                          <li>\r\n          <a href=\"http://it.hnlichaung.com/shop/index.php?act=brand&op=list&brand=104\" title=\"esprit\" target=\"_blank\">esprit</a>\r\n        </li>\r\n                          <li>\r\n          <a href=\"http://it.hnlichaung.com/shop/index.php?act=brand&op=list&brand=83\" title=\"秀秀美\" target=\"_blank\">秀秀美</a>\r\n        </li>\r\n                          <li>\r\n          <a href=\"http://it.hnlichaung.com/shop/index.php?act=brand&op=list&brand=85\" title=\"猫人\" target=\"_blank\">猫人</a>\r\n        </li>\r\n                          <li>\r\n          <a href=\"http://it.hnlichaung.com/shop/index.php?act=brand&op=list&brand=87\" title=\"Hanes恒适\" target=\"_blank\">Hanes恒适</a>\r\n        </li>\r\n                          <li>\r\n          <a href=\"http://it.hnlichaung.com/shop/index.php?act=brand&op=list&brand=80\" title=\"享爱.\" target=\"_blank\">享爱.</a>\r\n        </li>\r\n                          <li>\r\n          <a href=\"http://it.hnlichaung.com/shop/index.php?act=brand&op=list&brand=81\" title=\"派丽蒙\" target=\"_blank\">派丽蒙</a>\r\n        </li>\r\n                          <li>\r\n          <a href=\"http://it.hnlichaung.com/shop/index.php?act=brand&op=list&brand=82\" title=\"康妮雅\" target=\"_blank\">康妮雅</a>\r\n        </li>\r\n                                                       <li>\r\n          <a href=\"http://it.hnlichaung.com/index.php?act=brand&op=index\" title=\"\" target=\"_blank\">更多</a>\r\n        </li>\r\n            </ul>\r\n    \r\n    <ul class=\"tabs-nav\">\r\n                  <li class=\"tabs-selected\"><i class=\"arrow\"></i>\r\n        <h3>商品推荐</h3>\r\n      </li>\r\n                </ul>\r\n                <div class=\"tabs-panel middle-banner-style01 fade-img \">\r\n    \r\n      <div class=\"right-sidebar\">\r\n        <div class=\"right-side-focus\">\r\n          <ul>\r\n                                                <li><a href=\"\" title=\"拉夏贝尔套头针织衫 2015冬新款休闲圆领直身裙套装女 拉贝缇 墨绿色 M\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/editor/web-1-18-2.png?254\" alt=\"拉夏贝尔套头针织衫 2015冬新款休闲圆领直身裙套装女 拉贝缇 墨绿色 M\"/></a> </li>\r\n                                                <li><a href=\"\" title=\"拉夏贝尔套头针织衫\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/editor/web-1-18-1.png?318\" alt=\"拉夏贝尔套头针织衫\"/></a> </li>\r\n                                                <li><a href=\"\" title=\"拉夏贝尔套头针织衫\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/editor/web-1-18-3.png?756\" alt=\"拉夏贝尔套头针织衫\"/></a> </li>\r\n                                              </ul>\r\n        </div>\r\n      </div>\r\n      \r\n      <div class=\"middle-banner-list\">\r\n        <ul>\r\n          <li>\r\n            <dl>\r\n               \r\n              <dt class=\"banner-name\"><a href=\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index&amp;cate_id=1100\" title=\"针织格子提花休闲圆领七分袖连衣裙 格子混色 L\" target=\"_blank\"> 针织格子提花休闲圆领七分袖连衣裙 格子混色 L</a></dt>\r\n                            <dd class=\"banner-thumb\"> <a href=\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index&amp;cate_id=1100\" title=\"针织格子提花休闲圆领七分袖连衣裙 格子混色 L\" class=\"a1\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/common/loading.gif\" alt=\"针织格子提花休闲圆领七分袖连衣裙 格子混色 L\" data-url=\"http://it.hnlichaung.com/data/upload/shop/editor/web-1-15-1-11.jpg?445\" rel=\"lazy\" /></a></dd>\r\n            </dl>\r\n          </li>\r\n		  <li>\r\n            <dl>\r\n                            <dt class=\"banner-name\"><a href=\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index&amp;cate_id=1100\" title=\"撞色印花提花针织短袖连衣裙 米白 L\" target=\"_blank\"> 撞色印花提花针织短袖连衣裙 米白 L</a></dt>\r\n                            <dd class=\"banner-thumb\"> <a href=\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index&amp;cate_id=1100\" title=\"撞色印花提花针织短袖连衣裙 米白 L\" class=\"a1\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/common/loading.gif\" alt=\"撞色印花提花针织短袖连衣裙 米白 L\" data-url=\"http://it.hnlichaung.com/data/upload/shop/editor/web-1-15-1-31.jpg?570\" rel=\"lazy\" /></a></dd>\r\n            </dl>\r\n          </li>\r\n		  <li>\r\n            <dl>\r\n                            <dt class=\"banner-name\"><a href=\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index&amp;cate_id=1100\" title=\"钉珠蝴蝶结长袖连衣裙套装女 玫红 L\" target=\"_blank\"> 钉珠蝴蝶结长袖连衣裙套装女 玫红 L</a></dt>\r\n                            <dd class=\"banner-thumb\"> <a href=\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index&amp;cate_id=1100\" title=\"钉珠蝴蝶结长袖连衣裙套装女 玫红 L\" class=\"a1\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/common/loading.gif\" alt=\"钉珠蝴蝶结长袖连衣裙套装女 玫红 L\" data-url=\"http://it.hnlichaung.com/data/upload/shop/editor/web-1-15-1-33.jpg?633\" rel=\"lazy\" /></a></dd>\r\n            </dl>\r\n          </li>\r\n          <li>\r\n            <dl>\r\n                            <dt class=\"banner-name\"><a href=\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index&amp;cate_id=1100\" title=\"街头人物印花休闲圆领长袖连衣裙 黑色 S\" target=\"_blank\"> 街头人物印花休闲圆领长袖连衣裙 黑色 S</a></dt>\r\n                            <dd class=\"banner-thumb\"> <a href=\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index&amp;cate_id=1100\" title=\"街头人物印花休闲圆领长袖连衣裙 黑色 S\" class=\"a1\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/common/loading.gif\" alt=\"街头人物印花休闲圆领长袖连衣裙 黑色 S\" data-url=\"http://it.hnlichaung.com/data/upload/shop/editor/web-1-15-1-12.jpg?299\" rel=\"lazy\" /></a></dd>\r\n            </dl>\r\n          </li>\r\n          <li>\r\n            <dl>\r\n                            <dt class=\"banner-name\"><a href=\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index&amp;cate_id=1100\" title=\"钉珠蝴蝶结长袖连衣裙套装女 玫红 L\" target=\"_blank\"> 钉珠蝴蝶结长袖连衣裙套装女 玫红 L</a></dt>\r\n                            <dd class=\"banner-thumb\"> <a href=\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index&amp;cate_id=1100\" title=\"钉珠蝴蝶结长袖连衣裙套装女 玫红 L\" class=\"a1\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/common/loading.gif\" alt=\"钉珠蝴蝶结长袖连衣裙套装女 玫红 L\" data-url=\"http://it.hnlichaung.com/data/upload/shop/editor/web-1-15-1-32.jpg?568\" rel=\"lazy\" /></a></dd>\r\n            </dl>\r\n          </li>\r\n          <li>\r\n            <dl>\r\n                            <dt class=\"banner-name\"><a href=\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index&amp;cate_id=1100\" title=\"波点绣花两件套毛衣连衣裙女 黑色 M\" target=\"_blank\"> 波点绣花两件套毛衣连衣裙女 黑色 M</a></dt>\r\n                            <dd class=\"banner-thumb\"> <a href=\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index&amp;cate_id=1100\" title=\"波点绣花两件套毛衣连衣裙女 黑色 M\" class=\"a1\" target=\"_blank\"> <img alt=\"波点绣花两件套毛衣连衣裙女 黑色 M\" src=\"http://it.hnlichaung.com/data/upload/shop/editor/web-1-15-1-34.jpg?499\" rel=\"lazy\" /></a></dd>\r\n            </dl>\r\n          </li>\r\n        </ul>\r\n      </div>\r\n      \r\n       </div>\r\n              </div>\r\n</div>\r\n'),(2,'粉色','pink','index',1495643287,1,1,'\r\n<div class=\"home-standard-layout wrapper style-pink\">\r\n  <div class=\"left-sidebar\">\r\n    <div class=\"title\">\r\n            <div class=\"txt-type\">\r\n                <span>2F</span>\r\n                <h2 title=\"精品男装\">精品男装</h2>\r\n      </div>\r\n          </div>\r\n    <div class=\"left-ads\">\r\n            <a href=\"\" title=\"出游服装五折起\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/editor/web-2-23.jpg?343\" alt=\"出游服装五折起\"> </a>\r\n          </div>\r\n    <div class=\"recommend-classes\">\r\n    <h3>大家还喜欢了</h3>\r\n      <ul>\r\n                        <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1140\" title=\"衬衫\" target=\"_blank\">衬衫</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1141\" title=\"T恤\" target=\"_blank\">T恤</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1142\" title=\"POLO衫\" target=\"_blank\">POLO衫</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1144\" title=\"卫衣\" target=\"_blank\">卫衣</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1530\" title=\"唐装\" target=\"_blank\">唐装</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1150\" title=\"西裤\" target=\"_blank\">西裤</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1151\" title=\"休闲裤\" target=\"_blank\">休闲裤</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1152\" title=\"牛仔裤\" target=\"_blank\">牛仔裤</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1158\" title=\"卫裤\" target=\"_blank\">卫裤</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1373\" title=\"九分裤\" target=\"_blank\">九分裤</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1442\" title=\"短裤\" target=\"_blank\">短裤</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1300\" title=\"T恤/背心\" target=\"_blank\">T恤/背心</a></li>\r\n                      </ul>\r\n    </div>\r\n  </div>\r\n  <div class=\"middle-layout\">\r\n \r\n  <ul class=\"right-brand\">\r\n\r\n                                          <li>\r\n          <a href=\"http://it.hnlichaung.com/shop/index.php?act=brand&op=list&brand=104\" title=\"esprit\" target=\"_blank\">esprit</a>\r\n        </li>\r\n                          <li>\r\n          <a href=\"http://it.hnlichaung.com/shop/index.php?act=brand&op=list&brand=102\" title=\"她他/tata\" target=\"_blank\">她他/tata</a>\r\n        </li>\r\n                          <li>\r\n          <a href=\"http://it.hnlichaung.com/shop/index.php?act=brand&op=list&brand=99\" title=\"梦特娇\" target=\"_blank\">梦特娇</a>\r\n        </li>\r\n                          <li>\r\n          <a href=\"http://it.hnlichaung.com/shop/index.php?act=brand&op=list&brand=96\" title=\"佐丹奴\" target=\"_blank\">佐丹奴</a>\r\n        </li>\r\n                          <li>\r\n          <a href=\"http://it.hnlichaung.com/shop/index.php?act=brand&op=list&brand=90\" title=\"金利来\" target=\"_blank\">金利来</a>\r\n        </li>\r\n                          <li>\r\n          <a href=\"http://it.hnlichaung.com/shop/index.php?act=brand&op=list&brand=84\" title=\"阿迪达斯\" target=\"_blank\">阿迪达斯</a>\r\n        </li>\r\n                          <li>\r\n          <a href=\"http://it.hnlichaung.com/shop/index.php?act=brand&op=list&brand=85\" title=\"猫人\" target=\"_blank\">猫人</a>\r\n        </li>\r\n                          <li>\r\n          <a href=\"http://it.hnlichaung.com/shop/index.php?act=brand&op=list&brand=95\" title=\"李宁\" target=\"_blank\">李宁</a>\r\n        </li>\r\n                                                       <li>\r\n          <a href=\"http://it.hnlichaung.com/index.php?act=brand&op=index\" title=\"\" target=\"_blank\">更多</a>\r\n        </li>\r\n            </ul>\r\n    \r\n    <ul class=\"tabs-nav\">\r\n                  <li class=\"tabs-selected\"><i class=\"arrow\"></i>\r\n        <h3>商品推荐</h3>\r\n      </li>\r\n                </ul>\r\n                <div class=\"tabs-panel middle-banner-style01 fade-img \">\r\n    \r\n      <div class=\"right-sidebar\">\r\n        <div class=\"right-side-focus\">\r\n          <ul>\r\n                                                <li><a href=\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index&amp;cate_id=1112\" title=\"冬装可拆卸帽可拆卸袖百搭羽绒服\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/editor/web-2-28-1.png?688\" alt=\"冬装可拆卸帽可拆卸袖百搭羽绒服\"/></a> </li>\r\n                                                <li><a href=\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index&amp;cate_id=1100\" title=\"冬新品男士羊毛衫圆领套头毛衫蓝色针织衫\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/editor/web-2-28-2.png?755\" alt=\"冬新品男士羊毛衫圆领套头毛衫蓝色针织衫\"/></a> </li>\r\n                                                <li><a href=\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index&amp;cate_id=1100\" title=\"冬装新品卡其色翻领男式羊毛呢大衣中长款\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/editor/web-2-28-3.png?557\" alt=\"冬装新品卡其色翻领男式羊毛呢大衣中长款\"/></a> </li>\r\n                                              </ul>\r\n        </div>\r\n      </div>\r\n      \r\n      <div class=\"middle-banner-list\">\r\n        <ul>\r\n          <li>\r\n            <dl>\r\n                            <dd class=\"banner-thumb\"> <a href=\"\" title=\"\" class=\"a1\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/common/loading.gif\" alt=\"\" data-url=\"http://it.hnlichaung.com/data/upload/shop/editor/web-2-25-1-11.jpg?694\" rel=\"lazy\" /></a></dd>\r\n            </dl>\r\n          </li>\r\n		  <li>\r\n            <dl>\r\n                            <dd class=\"banner-thumb\"> <a href=\"\" title=\"\" class=\"a1\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/common/loading.gif\" alt=\"\" data-url=\"http://it.hnlichaung.com/data/upload/shop/editor/web-2-25-1-31.jpg?959\" rel=\"lazy\" /></a></dd>\r\n            </dl>\r\n          </li>\r\n		  <li>\r\n            <dl>\r\n                            <dd class=\"banner-thumb\"> <a href=\"\" title=\"\" class=\"a1\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/common/loading.gif\" alt=\"\" data-url=\"http://it.hnlichaung.com/data/upload/shop/editor/web-2-25-1-33.jpg?984\" rel=\"lazy\" /></a></dd>\r\n            </dl>\r\n          </li>\r\n          <li>\r\n            <dl>\r\n                            <dd class=\"banner-thumb\"> <a href=\"\" title=\"\" class=\"a1\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/common/loading.gif\" alt=\"\" data-url=\"http://it.hnlichaung.com/data/upload/shop/editor/web-2-25-1-12.jpg?135\" rel=\"lazy\" /></a></dd>\r\n            </dl>\r\n          </li>\r\n          <li>\r\n            <dl>\r\n                            <dd class=\"banner-thumb\"> <a href=\"\" title=\"\" class=\"a1\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/common/loading.gif\" alt=\"\" data-url=\"http://it.hnlichaung.com/data/upload/shop/editor/web-2-25-1-32.jpg?131\" rel=\"lazy\" /></a></dd>\r\n            </dl>\r\n          </li>\r\n          <li>\r\n            <dl>\r\n                            <dd class=\"banner-thumb\"> <a href=\"\" title=\"\" class=\"a1\" target=\"_blank\"> <img alt=\"\" src=\"http://it.hnlichaung.com/data/upload/shop/editor/web-2-25-1-34.jpg?246\" rel=\"lazy\" /></a></dd>\r\n            </dl>\r\n          </li>\r\n        </ul>\r\n      </div>\r\n      \r\n       </div>\r\n              </div>\r\n</div>\r\n'),(3,'橘色','orange','index',1495643287,2,1,'\r\n<div class=\"home-standard-layout wrapper style-orange\">\r\n  <div class=\"left-sidebar\">\r\n    <div class=\"title\">\r\n            <div class=\"txt-type\">\r\n                <span>3F</span>\r\n                <h2 title=\"时尚鞋靴\">时尚鞋靴</h2>\r\n      </div>\r\n          </div>\r\n    <div class=\"left-ads\">\r\n            <a href=\"\" title=\"\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/editor/web-3-33.png?575\" alt=\"\"> </a>\r\n          </div>\r\n    <div class=\"recommend-classes\">\r\n    <h3>大家还喜欢了</h3>\r\n      <ul>\r\n                        <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1160\" title=\"单鞋\" target=\"_blank\">单鞋</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1161\" title=\"平底鞋\" target=\"_blank\">平底鞋</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1165\" title=\"帆布鞋\" target=\"_blank\">帆布鞋</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1425\" title=\"内增高\" target=\"_blank\">内增高</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1428\" title=\"凉鞋\" target=\"_blank\">凉鞋</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1472\" title=\"拖鞋\" target=\"_blank\">拖鞋</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1175\" title=\"休闲鞋\" target=\"_blank\">休闲鞋</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1176\" title=\"正装鞋\" target=\"_blank\">正装鞋</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1177\" title=\"商务鞋\" target=\"_blank\">商务鞋</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1182\" title=\"板鞋\" target=\"_blank\">板鞋</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1534\" title=\"短靴\" target=\"_blank\">短靴</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1536\" title=\"马丁靴\" target=\"_blank\">马丁靴</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1549\" title=\"雨靴\" target=\"_blank\">雨靴</a></li>\r\n                      </ul>\r\n    </div>\r\n  </div>\r\n  <div class=\"middle-layout\">\r\n \r\n  <ul class=\"right-brand\">\r\n\r\n                                          <li>\r\n          <a href=\"http://it.hnlichaung.com/shop/index.php?act=brand&op=list&brand=105\" title=\"westside\" target=\"_blank\">westside</a>\r\n        </li>\r\n                          <li>\r\n          <a href=\"http://it.hnlichaung.com/shop/index.php?act=brand&op=list&brand=104\" title=\"esprit\" target=\"_blank\">esprit</a>\r\n        </li>\r\n                          <li>\r\n          <a href=\"http://it.hnlichaung.com/shop/index.php?act=brand&op=list&brand=103\" title=\"ELLE HOME\" target=\"_blank\">ELLE HOME</a>\r\n        </li>\r\n                          <li>\r\n          <a href=\"http://it.hnlichaung.com/shop/index.php?act=brand&op=list&brand=102\" title=\"她他/tata\" target=\"_blank\">她他/tata</a>\r\n        </li>\r\n                          <li>\r\n          <a href=\"http://it.hnlichaung.com/shop/index.php?act=brand&op=list&brand=101\" title=\"爱帝\" target=\"_blank\">爱帝</a>\r\n        </li>\r\n                          <li>\r\n          <a href=\"http://it.hnlichaung.com/shop/index.php?act=brand&op=list&brand=98\" title=\"斯波帝卡\" target=\"_blank\">斯波帝卡</a>\r\n        </li>\r\n                          <li>\r\n          <a href=\"http://it.hnlichaung.com/shop/index.php?act=brand&op=list&brand=97\" title=\"百思图\" target=\"_blank\">百思图</a>\r\n        </li>\r\n                          <li>\r\n          <a href=\"http://it.hnlichaung.com/shop/index.php?act=brand&op=list&brand=100\" title=\"宝姿\" target=\"_blank\">宝姿</a>\r\n        </li>\r\n                                                       <li>\r\n          <a href=\"http://it.hnlichaung.com/index.php?act=brand&op=index\" title=\"\" target=\"_blank\">更多</a>\r\n        </li>\r\n            </ul>\r\n    \r\n    <ul class=\"tabs-nav\">\r\n                  <li class=\"tabs-selected\"><i class=\"arrow\"></i>\r\n        <h3>商品推荐</h3>\r\n      </li>\r\n                </ul>\r\n                <div class=\"tabs-panel middle-banner-style01 fade-img \">\r\n    \r\n      <div class=\"right-sidebar\">\r\n        <div class=\"right-side-focus\">\r\n          <ul>\r\n                                                <li><a href=\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index&amp;cate_id=1109\" title=\"冬季新款骑士靴棉靴子\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/editor/web-3-38-2.png?328\" alt=\"冬季新款骑士靴棉靴子\"/></a> </li>\r\n                                                <li><a href=\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index&amp;cate_id=1109\" title=\"时尚平底铆钉短靴子\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/editor/web-3-38-3.png?218\" alt=\"时尚平底铆钉短靴子\"/></a> </li>\r\n                                                <li><a href=\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index&amp;cate_id=1109\" title=\"新款粗跟圆头加绒短靴裸靴\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/editor/web-3-38-5.png?708\" alt=\"新款粗跟圆头加绒短靴裸靴\"/></a> </li>\r\n                                              </ul>\r\n        </div>\r\n      </div>\r\n      \r\n      <div class=\"middle-banner-list\">\r\n        <ul>\r\n          <li>\r\n            <dl>\r\n                            <dd class=\"banner-thumb\"> <a href=\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index&amp;cate_id=1109\" title=\"\" class=\"a1\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/common/loading.gif\" alt=\"\" data-url=\"http://it.hnlichaung.com/data/upload/shop/editor/web-3-35-1-11.jpg?136\" rel=\"lazy\" /></a></dd>\r\n            </dl>\r\n          </li>\r\n		  <li>\r\n            <dl>\r\n                            <dd class=\"banner-thumb\"> <a href=\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index&amp;cate_id=1109\" title=\"\" class=\"a1\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/common/loading.gif\" alt=\"\" data-url=\"http://it.hnlichaung.com/data/upload/shop/editor/web-3-35-1-31.jpg?822\" rel=\"lazy\" /></a></dd>\r\n            </dl>\r\n          </li>\r\n		  <li>\r\n            <dl>\r\n                            <dd class=\"banner-thumb\"> <a href=\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index&amp;cate_id=1109\" title=\"\" class=\"a1\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/common/loading.gif\" alt=\"\" data-url=\"http://it.hnlichaung.com/data/upload/shop/editor/web-3-35-1-33.jpg?259\" rel=\"lazy\" /></a></dd>\r\n            </dl>\r\n          </li>\r\n          <li>\r\n            <dl>\r\n                            <dd class=\"banner-thumb\"> <a href=\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index&amp;cate_id=1109\" title=\"\" class=\"a1\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/common/loading.gif\" alt=\"\" data-url=\"http://it.hnlichaung.com/data/upload/shop/editor/web-3-35-1-12.jpg?270\" rel=\"lazy\" /></a></dd>\r\n            </dl>\r\n          </li>\r\n          <li>\r\n            <dl>\r\n                            <dd class=\"banner-thumb\"> <a href=\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index&amp;cate_id=1109\" title=\"\" class=\"a1\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/common/loading.gif\" alt=\"\" data-url=\"http://it.hnlichaung.com/data/upload/shop/editor/web-3-35-1-32.jpg?894\" rel=\"lazy\" /></a></dd>\r\n            </dl>\r\n          </li>\r\n          <li>\r\n            <dl>\r\n                            <dd class=\"banner-thumb\"> <a href=\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index&amp;cate_id=1109\" title=\"\" class=\"a1\" target=\"_blank\"> <img alt=\"\" src=\"http://it.hnlichaung.com/data/upload/shop/editor/web-3-35-1-34.jpg?192\" rel=\"lazy\" /></a></dd>\r\n            </dl>\r\n          </li>\r\n        </ul>\r\n      </div>\r\n      \r\n       </div>\r\n              </div>\r\n</div>\r\n'),(4,'绿色','green','index',1495643287,3,1,'\r\n<div class=\"home-standard-layout wrapper style-green\">\r\n  <div class=\"left-sidebar\">\r\n    <div class=\"title\">\r\n            <div class=\"txt-type\">\r\n                <span>4F</span>\r\n                <h2 title=\"美妆护肤\">美妆护肤</h2>\r\n      </div>\r\n          </div>\r\n    <div class=\"left-ads\">\r\n            <a href=\"\" title=\"\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/editor/web-4-43.jpg?581\" alt=\"\"> </a>\r\n          </div>\r\n    <div class=\"recommend-classes\">\r\n    <h3>大家还喜欢了</h3>\r\n      <ul>\r\n                        <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1183\" title=\"洁面\" target=\"_blank\">洁面</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1184\" title=\"面膜\" target=\"_blank\">面膜</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1185\" title=\"化妆水\" target=\"_blank\">化妆水</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1186\" title=\"精华\" target=\"_blank\">精华</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1187\" title=\"乳液\" target=\"_blank\">乳液</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1188\" title=\"面霜\" target=\"_blank\">面霜</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1189\" title=\"眼霜\" target=\"_blank\">眼霜</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1498\" title=\"防晒\" target=\"_blank\">防晒</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1501\" title=\"护肤套装\" target=\"_blank\">护肤套装</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1225\" title=\"卸妆\" target=\"_blank\">卸妆</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1227\" title=\"BB霜\" target=\"_blank\">BB霜</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1508\" title=\"彩妆套装\" target=\"_blank\">彩妆套装</a></li>\r\n                      </ul>\r\n    </div>\r\n  </div>\r\n  <div class=\"middle-layout\">\r\n \r\n  <ul class=\"right-brand\">\r\n\r\n                                          <li>\r\n          <a href=\"http://it.hnlichaung.com/shop/index.php?act=brand&op=list&brand=102\" title=\"她他/tata\" target=\"_blank\">她他/tata</a>\r\n        </li>\r\n                          <li>\r\n          <a href=\"http://it.hnlichaung.com/shop/index.php?act=brand&op=list&brand=104\" title=\"esprit\" target=\"_blank\">esprit</a>\r\n        </li>\r\n                          <li>\r\n          <a href=\"http://it.hnlichaung.com/shop/index.php?act=brand&op=list&brand=106\" title=\"RDK\" target=\"_blank\">RDK</a>\r\n        </li>\r\n                          <li>\r\n          <a href=\"http://it.hnlichaung.com/shop/index.php?act=brand&op=list&brand=86\" title=\"茵曼（INMAN）\" target=\"_blank\">茵曼（INMAN）</a>\r\n        </li>\r\n                          <li>\r\n          <a href=\"http://it.hnlichaung.com/shop/index.php?act=brand&op=list&brand=88\" title=\"缪诗\" target=\"_blank\">缪诗</a>\r\n        </li>\r\n                          <li>\r\n          <a href=\"http://it.hnlichaung.com/shop/index.php?act=brand&op=list&brand=85\" title=\"猫人\" target=\"_blank\">猫人</a>\r\n        </li>\r\n                          <li>\r\n          <a href=\"http://it.hnlichaung.com/shop/index.php?act=brand&op=list&brand=80\" title=\"享爱.\" target=\"_blank\">享爱.</a>\r\n        </li>\r\n                                                       <li>\r\n          <a href=\"http://it.hnlichaung.com/index.php?act=brand&op=index\" title=\"\" target=\"_blank\">更多</a>\r\n        </li>\r\n            </ul>\r\n    \r\n    <ul class=\"tabs-nav\">\r\n                  <li class=\"tabs-selected\"><i class=\"arrow\"></i>\r\n        <h3>商品推荐</h3>\r\n      </li>\r\n                </ul>\r\n                <div class=\"tabs-panel middle-banner-style01 fade-img \">\r\n    \r\n      <div class=\"right-sidebar\">\r\n        <div class=\"right-side-focus\">\r\n          <ul>\r\n                                                <li><a href=\"\" title=\"\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/editor/web-4-48-1.jpg?202\" alt=\"\"/></a> </li>\r\n                                                <li><a href=\"\" title=\"\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/editor/web-4-48-4.jpg?901\" alt=\"\"/></a> </li>\r\n                                                <li><a href=\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index&amp;cate_id=1111\" title=\"海飞丝洗发露\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/editor/web-4-48-2.png?560\" alt=\"海飞丝洗发露\"/></a> </li>\r\n                                              </ul>\r\n        </div>\r\n      </div>\r\n      \r\n      <div class=\"middle-banner-list\">\r\n        <ul>\r\n          <li>\r\n            <dl>\r\n                            <dd class=\"banner-thumb\"> <a href=\"\" title=\"\" class=\"a1\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/common/loading.gif\" alt=\"\" data-url=\"http://it.hnlichaung.com/data/upload/shop/editor/web-4-45-2-11.jpg?532\" rel=\"lazy\" /></a></dd>\r\n            </dl>\r\n          </li>\r\n		  <li>\r\n            <dl>\r\n                            <dd class=\"banner-thumb\"> <a href=\"\" title=\"\" class=\"a1\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/common/loading.gif\" alt=\"\" data-url=\"http://it.hnlichaung.com/data/upload/shop/editor/web-4-45-2-31.jpg?561\" rel=\"lazy\" /></a></dd>\r\n            </dl>\r\n          </li>\r\n		  <li>\r\n            <dl>\r\n                            <dd class=\"banner-thumb\"> <a href=\"\" title=\"\" class=\"a1\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/common/loading.gif\" alt=\"\" data-url=\"http://it.hnlichaung.com/data/upload/shop/editor/web-4-45-2-33.jpg?573\" rel=\"lazy\" /></a></dd>\r\n            </dl>\r\n          </li>\r\n          <li>\r\n            <dl>\r\n                            <dd class=\"banner-thumb\"> <a href=\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index&amp;cate_id=1109\" title=\"\" class=\"a1\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/common/loading.gif\" alt=\"\" data-url=\"http://it.hnlichaung.com/data/upload/shop/editor/web-4-45-2-12.jpg?965\" rel=\"lazy\" /></a></dd>\r\n            </dl>\r\n          </li>\r\n          <li>\r\n            <dl>\r\n                            <dd class=\"banner-thumb\"> <a href=\"\" title=\"\" class=\"a1\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/common/loading.gif\" alt=\"\" data-url=\"http://it.hnlichaung.com/data/upload/shop/editor/web-4-45-2-32.jpg?189\" rel=\"lazy\" /></a></dd>\r\n            </dl>\r\n          </li>\r\n          <li>\r\n            <dl>\r\n                            <dd class=\"banner-thumb\"> <a href=\"\" title=\"\" class=\"a1\" target=\"_blank\"> <img alt=\"\" src=\"http://it.hnlichaung.com/data/upload/shop/editor/web-4-45-2-34.jpg?625\" rel=\"lazy\" /></a></dd>\r\n            </dl>\r\n          </li>\r\n        </ul>\r\n      </div>\r\n      \r\n       </div>\r\n              </div>\r\n</div>\r\n'),(5,'蓝色','blue','index',1495643287,4,1,'\r\n<div class=\"home-standard-layout wrapper style-blue\">\r\n  <div class=\"left-sidebar\">\r\n    <div class=\"title\">\r\n            <div class=\"txt-type\">\r\n                <span>5F</span>\r\n                <h2 title=\"箱包皮具\">箱包皮具</h2>\r\n      </div>\r\n          </div>\r\n    <div class=\"left-ads\">\r\n            <a href=\"\" title=\"\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/editor/web-5-53.png?994\" alt=\"\"> </a>\r\n          </div>\r\n    <div class=\"recommend-classes\">\r\n    <h3>大家还喜欢了</h3>\r\n      <ul>\r\n                        <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1195\" title=\"手提包\" target=\"_blank\">手提包</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1196\" title=\"单肩包\" target=\"_blank\">单肩包</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1224\" title=\"双肩包\" target=\"_blank\">双肩包</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1304\" title=\"斜挎包\" target=\"_blank\">斜挎包</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1198\" title=\"商务包\" target=\"_blank\">商务包</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1311\" title=\"休闲包\" target=\"_blank\">休闲包</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1312\" title=\"公文包\" target=\"_blank\">公文包</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1193\" title=\"女士钱包\" target=\"_blank\">女士钱包</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1197\" title=\"男士钱包\" target=\"_blank\">男士钱包</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1568\" title=\"旅行包\" target=\"_blank\">旅行包</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1322\" title=\"行李箱\" target=\"_blank\">行李箱</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1323\" title=\"拉杆箱\" target=\"_blank\">拉杆箱</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1324\" title=\"旅行箱\" target=\"_blank\">旅行箱</a></li>\r\n                      </ul>\r\n    </div>\r\n  </div>\r\n  <div class=\"middle-layout\">\r\n \r\n  <ul class=\"right-brand\">\r\n\r\n                                          <li>\r\n          <a href=\"http://it.hnlichaung.com/shop/index.php?act=brand&op=list&brand=366\" title=\"摩伊拉\" target=\"_blank\">摩伊拉</a>\r\n        </li>\r\n                          <li>\r\n          <a href=\"http://it.hnlichaung.com/shop/index.php?act=brand&op=list&brand=93\" title=\"百丽\" target=\"_blank\">百丽</a>\r\n        </li>\r\n                          <li>\r\n          <a href=\"http://it.hnlichaung.com/shop/index.php?act=brand&op=list&brand=96\" title=\"佐丹奴\" target=\"_blank\">佐丹奴</a>\r\n        </li>\r\n                          <li>\r\n          <a href=\"http://it.hnlichaung.com/shop/index.php?act=brand&op=list&brand=91\" title=\"其乐\" target=\"_blank\">其乐</a>\r\n        </li>\r\n                          <li>\r\n          <a href=\"http://it.hnlichaung.com/shop/index.php?act=brand&op=list&brand=81\" title=\"派丽蒙\" target=\"_blank\">派丽蒙</a>\r\n        </li>\r\n                          <li>\r\n          <a href=\"http://it.hnlichaung.com/shop/index.php?act=brand&op=list&brand=83\" title=\"秀秀美\" target=\"_blank\">秀秀美</a>\r\n        </li>\r\n                          <li>\r\n          <a href=\"http://it.hnlichaung.com/shop/index.php?act=brand&op=list&brand=80\" title=\"享爱.\" target=\"_blank\">享爱.</a>\r\n        </li>\r\n                          <li>\r\n          <a href=\"http://it.hnlichaung.com/shop/index.php?act=brand&op=list&brand=82\" title=\"康妮雅\" target=\"_blank\">康妮雅</a>\r\n        </li>\r\n                                                       <li>\r\n          <a href=\"http://it.hnlichaung.com/index.php?act=brand&op=index\" title=\"\" target=\"_blank\">更多</a>\r\n        </li>\r\n            </ul>\r\n    \r\n    <ul class=\"tabs-nav\">\r\n                  <li class=\"tabs-selected\"><i class=\"arrow\"></i>\r\n        <h3>商品推荐</h3>\r\n      </li>\r\n                </ul>\r\n                <div class=\"tabs-panel middle-banner-style01 fade-img \">\r\n    \r\n      <div class=\"right-sidebar\">\r\n        <div class=\"right-side-focus\">\r\n          <ul>\r\n                                                <li><a href=\"\" title=\"\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/editor/web-5-58-1.jpg?965\" alt=\"\"/></a> </li>\r\n                                                <li><a href=\"\" title=\"\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/editor/web-5-58-2.jpg?837\" alt=\"\"/></a> </li>\r\n                                              </ul>\r\n        </div>\r\n      </div>\r\n      \r\n      <div class=\"middle-banner-list\">\r\n        <ul>\r\n          <li>\r\n            <dl>\r\n                            <dd class=\"banner-thumb\"> <a href=\"\" title=\"\" class=\"a1\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/common/loading.gif\" alt=\"\" data-url=\"http://it.hnlichaung.com/data/upload/shop/editor/web-5-55-1-11.jpg?978\" rel=\"lazy\" /></a></dd>\r\n            </dl>\r\n          </li>\r\n		  <li>\r\n            <dl>\r\n                            <dd class=\"banner-thumb\"> <a href=\"\" title=\"\" class=\"a1\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/common/loading.gif\" alt=\"\" data-url=\"http://it.hnlichaung.com/data/upload/shop/editor/web-5-55-1-31.jpg?165\" rel=\"lazy\" /></a></dd>\r\n            </dl>\r\n          </li>\r\n		  <li>\r\n            <dl>\r\n                            <dd class=\"banner-thumb\"> <a href=\"\" title=\"\" class=\"a1\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/common/loading.gif\" alt=\"\" data-url=\"http://it.hnlichaung.com/data/upload/shop/editor/web-5-55-1-33.jpg?687\" rel=\"lazy\" /></a></dd>\r\n            </dl>\r\n          </li>\r\n          <li>\r\n            <dl>\r\n                            <dd class=\"banner-thumb\"> <a href=\"\" title=\"\" class=\"a1\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/common/loading.gif\" alt=\"\" data-url=\"http://it.hnlichaung.com/data/upload/shop/editor/web-5-55-1-12.jpg?770\" rel=\"lazy\" /></a></dd>\r\n            </dl>\r\n          </li>\r\n          <li>\r\n            <dl>\r\n                            <dd class=\"banner-thumb\"> <a href=\"\" title=\"\" class=\"a1\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/common/loading.gif\" alt=\"\" data-url=\"http://it.hnlichaung.com/data/upload/shop/editor/web-5-55-1-32.jpg?495\" rel=\"lazy\" /></a></dd>\r\n            </dl>\r\n          </li>\r\n          <li>\r\n            <dl>\r\n                            <dd class=\"banner-thumb\"> <a href=\"\" title=\"\" class=\"a1\" target=\"_blank\"> <img alt=\"\" src=\"http://it.hnlichaung.com/data/upload/shop/editor/web-5-55-1-34.jpg?363\" rel=\"lazy\" /></a></dd>\r\n            </dl>\r\n          </li>\r\n        </ul>\r\n      </div>\r\n      \r\n       </div>\r\n              </div>\r\n</div>\r\n'),(6,'紫色','purple','index',1495643287,6,1,'\r\n<div class=\"home-standard-layout wrapper style-purple\">\r\n  <div class=\"left-sidebar\">\r\n    <div class=\"title\">\r\n            <div class=\"txt-type\">\r\n                <span>6F</span>\r\n                <h2 title=\"运动户外\">运动户外</h2>\r\n      </div>\r\n          </div>\r\n    <div class=\"left-ads\">\r\n            <a href=\"\" title=\"\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/editor/web-6-63.png?949\" alt=\"\"> </a>\r\n          </div>\r\n    <div class=\"recommend-classes\">\r\n    <h3>大家还喜欢了</h3>\r\n      <ul>\r\n                        <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1124\" title=\"运动鞋\" target=\"_blank\">运动鞋</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1125\" title=\"运动服\" target=\"_blank\">运动服</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1408\" title=\"户外鞋\" target=\"_blank\">户外鞋</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1474\" title=\"户外服\" target=\"_blank\">户外服</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1475\" title=\"冲锋衣裤\" target=\"_blank\">冲锋衣裤</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1476\" title=\"速干衣裤\" target=\"_blank\">速干衣裤</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1477\" title=\"抓绒衣裤\" target=\"_blank\">抓绒衣裤</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1478\" title=\"软壳衣裤\" target=\"_blank\">软壳衣裤</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1479\" title=\"T恤\" target=\"_blank\">T恤</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1481\" title=\"滑雪服\" target=\"_blank\">滑雪服</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1482\" title=\"功能内衣\" target=\"_blank\">功能内衣</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1220\" title=\"T恤\" target=\"_blank\">T恤</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1221\" title=\"卫衣\" target=\"_blank\">卫衣</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1222\" title=\"运动裤\" target=\"_blank\">运动裤</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1223\" title=\"运动套装\" target=\"_blank\">运动套装</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1331\" title=\"足球服\" target=\"_blank\">足球服</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1332\" title=\"篮球服\" target=\"_blank\">篮球服</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1333\" title=\"风衣夹克\" target=\"_blank\">风衣夹克</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1334\" title=\"网羽服\" target=\"_blank\">网羽服</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1335\" title=\"棒球服\" target=\"_blank\">棒球服</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1415\" title=\"训练服\" target=\"_blank\">训练服</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1416\" title=\"运动帽\" target=\"_blank\">运动帽</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1563\" title=\"运动手套\" target=\"_blank\">运动手套</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1564\" title=\"运动袜\" target=\"_blank\">运动袜</a></li>\r\n                      </ul>\r\n    </div>\r\n  </div>\r\n  <div class=\"middle-layout\">\r\n \r\n  <ul class=\"right-brand\">\r\n\r\n                                          <li>\r\n          <a href=\"http://it.hnlichaung.com/shop/index.php?act=brand&op=list&brand=106\" title=\"RDK\" target=\"_blank\">RDK</a>\r\n        </li>\r\n                          <li>\r\n          <a href=\"http://it.hnlichaung.com/shop/index.php?act=brand&op=list&brand=105\" title=\"westside\" target=\"_blank\">westside</a>\r\n        </li>\r\n                          <li>\r\n          <a href=\"http://it.hnlichaung.com/shop/index.php?act=brand&op=list&brand=104\" title=\"esprit\" target=\"_blank\">esprit</a>\r\n        </li>\r\n                          <li>\r\n          <a href=\"http://it.hnlichaung.com/shop/index.php?act=brand&op=list&brand=103\" title=\"ELLE HOME\" target=\"_blank\">ELLE HOME</a>\r\n        </li>\r\n                          <li>\r\n          <a href=\"http://it.hnlichaung.com/shop/index.php?act=brand&op=list&brand=100\" title=\"宝姿\" target=\"_blank\">宝姿</a>\r\n        </li>\r\n                          <li>\r\n          <a href=\"http://it.hnlichaung.com/shop/index.php?act=brand&op=list&brand=98\" title=\"斯波帝卡\" target=\"_blank\">斯波帝卡</a>\r\n        </li>\r\n                          <li>\r\n          <a href=\"http://it.hnlichaung.com/shop/index.php?act=brand&op=list&brand=81\" title=\"派丽蒙\" target=\"_blank\">派丽蒙</a>\r\n        </li>\r\n                                                       <li>\r\n          <a href=\"http://it.hnlichaung.com/index.php?act=brand&op=index\" title=\"\" target=\"_blank\">更多</a>\r\n        </li>\r\n            </ul>\r\n    \r\n    <ul class=\"tabs-nav\">\r\n                  <li class=\"tabs-selected\"><i class=\"arrow\"></i>\r\n        <h3>商品推荐</h3>\r\n      </li>\r\n                </ul>\r\n                <div class=\"tabs-panel middle-banner-style01 fade-img \">\r\n    \r\n      <div class=\"right-sidebar\">\r\n        <div class=\"right-side-focus\">\r\n          <ul>\r\n                                                <li><a href=\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index\" title=\"\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/editor/web-6-68-1.png?180\" alt=\"\"/></a> </li>\r\n                                                <li><a href=\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index&amp;cate_id=1100\" title=\"\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/editor/web-6-68-2.png?492\" alt=\"\"/></a> </li>\r\n                                              </ul>\r\n        </div>\r\n      </div>\r\n      \r\n      <div class=\"middle-banner-list\">\r\n        <ul>\r\n          <li>\r\n            <dl>\r\n                            <dd class=\"banner-thumb\"> <a href=\"\" title=\"\" class=\"a1\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/common/loading.gif\" alt=\"\" data-url=\"http://it.hnlichaung.com/data/upload/shop/editor/web-6-65-1-11.jpg?387\" rel=\"lazy\" /></a></dd>\r\n            </dl>\r\n          </li>\r\n		  <li>\r\n            <dl>\r\n                            <dd class=\"banner-thumb\"> <a href=\"\" title=\"\" class=\"a1\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/common/loading.gif\" alt=\"\" data-url=\"http://it.hnlichaung.com/data/upload/shop/editor/web-6-65-1-31.png?563\" rel=\"lazy\" /></a></dd>\r\n            </dl>\r\n          </li>\r\n		  <li>\r\n            <dl>\r\n                            <dd class=\"banner-thumb\"> <a href=\"\" title=\"\" class=\"a1\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/common/loading.gif\" alt=\"\" data-url=\"http://it.hnlichaung.com/data/upload/shop/editor/web-6-65-1-33.jpg?841\" rel=\"lazy\" /></a></dd>\r\n            </dl>\r\n          </li>\r\n          <li>\r\n            <dl>\r\n                            <dd class=\"banner-thumb\"> <a href=\"\" title=\"\" class=\"a1\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/common/loading.gif\" alt=\"\" data-url=\"http://it.hnlichaung.com/data/upload/shop/editor/web-6-65-1-12.jpg?513\" rel=\"lazy\" /></a></dd>\r\n            </dl>\r\n          </li>\r\n          <li>\r\n            <dl>\r\n                            <dd class=\"banner-thumb\"> <a href=\"\" title=\"\" class=\"a1\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/common/loading.gif\" alt=\"\" data-url=\"http://it.hnlichaung.com/data/upload/shop/editor/web-6-65-1-32.png?804\" rel=\"lazy\" /></a></dd>\r\n            </dl>\r\n          </li>\r\n          <li>\r\n            <dl>\r\n                            <dd class=\"banner-thumb\"> <a href=\"\" title=\"\" class=\"a1\" target=\"_blank\"> <img alt=\"\" src=\"http://it.hnlichaung.com/data/upload/shop/editor/web-6-65-1-34.jpg?793\" rel=\"lazy\" /></a></dd>\r\n            </dl>\r\n          </li>\r\n        </ul>\r\n      </div>\r\n      \r\n       </div>\r\n              </div>\r\n</div>\r\n'),(7,'褐色','brown','index',1495643287,7,1,'\r\n<div class=\"home-standard-layout wrapper style-brown\">\r\n  <div class=\"left-sidebar\">\r\n    <div class=\"title\">\r\n            <div class=\"txt-type\">\r\n                <span>7F</span>\r\n                <h2 title=\"礼品配饰\">礼品配饰</h2>\r\n      </div>\r\n          </div>\r\n    <div class=\"left-ads\">\r\n            <a href=\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index&amp;cate_id=1114\" title=\"\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/editor/web-7-73.png?848\" alt=\"\"> </a>\r\n          </div>\r\n    <div class=\"recommend-classes\">\r\n    <h3>大家还喜欢了</h3>\r\n      <ul>\r\n                        <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1203\" title=\"项链\" target=\"_blank\">项链</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1204\" title=\"戒指\" target=\"_blank\">戒指</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1205\" title=\"手镯\" target=\"_blank\">手镯</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1206\" title=\"耳饰\" target=\"_blank\">耳饰</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1207\" title=\"发饰\" target=\"_blank\">发饰</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1208\" title=\"手链\" target=\"_blank\">手链</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1209\" title=\"锁骨链\" target=\"_blank\">锁骨链</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1210\" title=\"佛珠\" target=\"_blank\">佛珠</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1211\" title=\"转运珠\" target=\"_blank\">转运珠</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1212\" title=\"太阳镜\" target=\"_blank\">太阳镜</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1422\" title=\"护目镜\" target=\"_blank\">护目镜</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1999\" title=\"情侣饰品\" target=\"_blank\">情侣饰品</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1213\" title=\"机械表\" target=\"_blank\">机械表</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1214\" title=\"电子表\" target=\"_blank\">电子表</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1215\" title=\"石英表\" target=\"_blank\">石英表</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1336\" title=\"时装表\" target=\"_blank\">时装表</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1337\" title=\"学生表\" target=\"_blank\">学生表</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1338\" title=\"运动表\" target=\"_blank\">运动表</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1339\" title=\"儿童表\" target=\"_blank\">儿童表</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1340\" title=\"防水表\" target=\"_blank\">防水表</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1341\" title=\"情侣表\" target=\"_blank\">情侣表</a></li>\r\n                      </ul>\r\n    </div>\r\n  </div>\r\n  <div class=\"middle-layout\">\r\n \r\n  <ul class=\"right-brand\">\r\n\r\n                                          <li>\r\n          <a href=\"http://it.hnlichaung.com/shop/index.php?act=brand&op=list&brand=106\" title=\"RDK\" target=\"_blank\">RDK</a>\r\n        </li>\r\n                          <li>\r\n          <a href=\"http://it.hnlichaung.com/shop/index.php?act=brand&op=list&brand=105\" title=\"westside\" target=\"_blank\">westside</a>\r\n        </li>\r\n                          <li>\r\n          <a href=\"http://it.hnlichaung.com/shop/index.php?act=brand&op=list&brand=365\" title=\"柒牌\" target=\"_blank\">柒牌</a>\r\n        </li>\r\n                          <li>\r\n          <a href=\"http://it.hnlichaung.com/shop/index.php?act=brand&op=list&brand=87\" title=\"Hanes恒适\" target=\"_blank\">Hanes恒适</a>\r\n        </li>\r\n                          <li>\r\n          <a href=\"http://it.hnlichaung.com/shop/index.php?act=brand&op=list&brand=88\" title=\"缪诗\" target=\"_blank\">缪诗</a>\r\n        </li>\r\n                          <li>\r\n          <a href=\"http://it.hnlichaung.com/shop/index.php?act=brand&op=list&brand=90\" title=\"金利来\" target=\"_blank\">金利来</a>\r\n        </li>\r\n                                                       <li>\r\n          <a href=\"http://it.hnlichaung.com/index.php?act=brand&op=index\" title=\"\" target=\"_blank\">更多</a>\r\n        </li>\r\n            </ul>\r\n    \r\n    <ul class=\"tabs-nav\">\r\n                  <li class=\"tabs-selected\"><i class=\"arrow\"></i>\r\n        <h3>商品推荐</h3>\r\n      </li>\r\n                </ul>\r\n                <div class=\"tabs-panel middle-banner-style01 fade-img \">\r\n    \r\n      <div class=\"right-sidebar\">\r\n        <div class=\"right-side-focus\">\r\n          <ul>\r\n                                                <li><a href=\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index\" title=\"七度银饰专场\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/editor/web-7-78-1.jpg?446\" alt=\"七度银饰专场\"/></a> </li>\r\n                                                <li><a href=\"http://demo.33hao.com/shop/index.php?act=goods&amp;op=index&amp;goods_id=102126\" title=\"七度银饰专场\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/editor/web-7-78-2.png?182\" alt=\"七度银饰专场\"/></a> </li>\r\n                                              </ul>\r\n        </div>\r\n      </div>\r\n      \r\n      <div class=\"middle-banner-list\">\r\n        <ul>\r\n          <li>\r\n            <dl>\r\n                            <dd class=\"banner-thumb\"> <a href=\"\" title=\"\" class=\"a1\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/common/loading.gif\" alt=\"\" data-url=\"http://it.hnlichaung.com/data/upload/shop/editor/web-7-75-1-11.jpg?585\" rel=\"lazy\" /></a></dd>\r\n            </dl>\r\n          </li>\r\n		  <li>\r\n            <dl>\r\n                            <dd class=\"banner-thumb\"> <a href=\"\" title=\"\" class=\"a1\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/common/loading.gif\" alt=\"\" data-url=\"http://it.hnlichaung.com/data/upload/shop/editor/web-7-75-1-31.png?392\" rel=\"lazy\" /></a></dd>\r\n            </dl>\r\n          </li>\r\n		  <li>\r\n            <dl>\r\n                            <dd class=\"banner-thumb\"> <a href=\"\" title=\"\" class=\"a1\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/common/loading.gif\" alt=\"\" data-url=\"http://it.hnlichaung.com/data/upload/shop/editor/web-7-75-1-33.png?752\" rel=\"lazy\" /></a></dd>\r\n            </dl>\r\n          </li>\r\n          <li>\r\n            <dl>\r\n                            <dd class=\"banner-thumb\"> <a href=\"\" title=\"\" class=\"a1\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/common/loading.gif\" alt=\"\" data-url=\"http://it.hnlichaung.com/data/upload/shop/editor/web-7-75-1-12.jpg?181\" rel=\"lazy\" /></a></dd>\r\n            </dl>\r\n          </li>\r\n          <li>\r\n            <dl>\r\n                            <dd class=\"banner-thumb\"> <a href=\"\" title=\"\" class=\"a1\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/common/loading.gif\" alt=\"\" data-url=\"http://it.hnlichaung.com/data/upload/shop/editor/web-7-75-1-32.jpg?806\" rel=\"lazy\" /></a></dd>\r\n            </dl>\r\n          </li>\r\n          <li>\r\n            <dl>\r\n                            <dd class=\"banner-thumb\"> <a href=\"\" title=\"\" class=\"a1\" target=\"_blank\"> <img alt=\"\" src=\"http://it.hnlichaung.com/data/upload/shop/editor/web-7-75-1-34.jpg?541\" rel=\"lazy\" /></a></dd>\r\n            </dl>\r\n          </li>\r\n        </ul>\r\n      </div>\r\n      \r\n       </div>\r\n              </div>\r\n</div>\r\n'),(8,'默认','default','index',1495643288,8,1,'\r\n<div class=\"home-standard-layout wrapper style-default\">\r\n  <div class=\"left-sidebar\">\r\n    <div class=\"title\">\r\n            <div class=\"txt-type\">\r\n                <span>8F</span>\r\n                <h2 title=\"生活家居\">生活家居</h2>\r\n      </div>\r\n          </div>\r\n    <div class=\"left-ads\">\r\n            <a href=\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index&amp;cate_id=1231\" title=\"\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/editor/web-8-83.png?171\" alt=\"\"> </a>\r\n          </div>\r\n    <div class=\"recommend-classes\">\r\n    <h3>大家还喜欢了</h3>\r\n      <ul>\r\n                        <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1234\" title=\"四件套\" target=\"_blank\">四件套</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1235\" title=\"被子/被套\" target=\"_blank\">被子/被套</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1236\" title=\"枕头/枕套\" target=\"_blank\">枕头/枕套</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1419\" title=\"公仔\" target=\"_blank\">公仔</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1421\" title=\"凉席/凉枕\" target=\"_blank\">凉席/凉枕</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1858\" title=\"手工/十字绣\" target=\"_blank\">手工/十字绣</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1240\" title=\"工艺摆件\" target=\"_blank\">工艺摆件</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1241\" title=\"花瓶/花器\" target=\"_blank\">花瓶/花器</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1242\" title=\"仿真花卉\" target=\"_blank\">仿真花卉</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1243\" title=\"装饰画\" target=\"_blank\">装饰画</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1352\" title=\"相架/画框\" target=\"_blank\">相架/画框</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1353\" title=\"闹钟/挂钟\" target=\"_blank\">闹钟/挂钟</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1354\" title=\"香薰/蜡烛\" target=\"_blank\">香薰/蜡烛</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1355\" title=\"创意家居\" target=\"_blank\">创意家居</a></li>\r\n                <li><a href=\"http://it.hnlichaung.com/shop/index.php?act=search&op=index&cate_id=1356\" title=\"办公用品\" target=\"_blank\">办公用品</a></li>\r\n                      </ul>\r\n    </div>\r\n  </div>\r\n  <div class=\"middle-layout\">\r\n \r\n  <ul class=\"right-brand\">\r\n\r\n                                          <li>\r\n          <a href=\"http://it.hnlichaung.com/shop/index.php?act=brand&op=list&brand=104\" title=\"esprit\" target=\"_blank\">esprit</a>\r\n        </li>\r\n                          <li>\r\n          <a href=\"http://it.hnlichaung.com/shop/index.php?act=brand&op=list&brand=103\" title=\"ELLE HOME\" target=\"_blank\">ELLE HOME</a>\r\n        </li>\r\n                          <li>\r\n          <a href=\"http://it.hnlichaung.com/shop/index.php?act=brand&op=list&brand=105\" title=\"westside\" target=\"_blank\">westside</a>\r\n        </li>\r\n                          <li>\r\n          <a href=\"http://it.hnlichaung.com/shop/index.php?act=brand&op=list&brand=106\" title=\"RDK\" target=\"_blank\">RDK</a>\r\n        </li>\r\n                          <li>\r\n          <a href=\"http://it.hnlichaung.com/shop/index.php?act=brand&op=list&brand=92\" title=\"Newbalance\" target=\"_blank\">Newbalance</a>\r\n        </li>\r\n                          <li>\r\n          <a href=\"http://it.hnlichaung.com/shop/index.php?act=brand&op=list&brand=91\" title=\"其乐\" target=\"_blank\">其乐</a>\r\n        </li>\r\n                          <li>\r\n          <a href=\"http://it.hnlichaung.com/shop/index.php?act=brand&op=list&brand=85\" title=\"猫人\" target=\"_blank\">猫人</a>\r\n        </li>\r\n                          <li>\r\n          <a href=\"http://it.hnlichaung.com/shop/index.php?act=brand&op=list&brand=93\" title=\"百丽\" target=\"_blank\">百丽</a>\r\n        </li>\r\n                                                       <li>\r\n          <a href=\"http://it.hnlichaung.com/index.php?act=brand&op=index\" title=\"\" target=\"_blank\">更多</a>\r\n        </li>\r\n            </ul>\r\n    \r\n    <ul class=\"tabs-nav\">\r\n                  <li class=\"tabs-selected\"><i class=\"arrow\"></i>\r\n        <h3>商品推荐</h3>\r\n      </li>\r\n                </ul>\r\n                <div class=\"tabs-panel middle-banner-style01 fade-img \">\r\n    \r\n      <div class=\"right-sidebar\">\r\n        <div class=\"right-side-focus\">\r\n          <ul>\r\n                                                <li><a href=\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index&amp;cate_id=1109\" title=\"\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/editor/web-8-88-2.jpg?934\" alt=\"\"/></a> </li>\r\n                                                <li><a href=\"http://demo.33hao.com/shop/index.php?act=goods&amp;op=index&amp;goods_id=102126\" title=\"拉夏贝尔 秋新款女装街头人物印花休闲圆领长袖连衣裙 黑色 S\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/editor/web-8-88-3.jpg?885\" alt=\"拉夏贝尔 秋新款女装街头人物印花休闲圆领长袖连衣裙 黑色 S\"/></a> </li>\r\n                                              </ul>\r\n        </div>\r\n      </div>\r\n      \r\n      <div class=\"middle-banner-list\">\r\n        <ul>\r\n          <li>\r\n            <dl>\r\n                            <dd class=\"banner-thumb\"> <a href=\"\" title=\"\" class=\"a1\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/common/loading.gif\" alt=\"\" data-url=\"http://it.hnlichaung.com/data/upload/shop/editor/web-8-85-1-11.jpg?195\" rel=\"lazy\" /></a></dd>\r\n            </dl>\r\n          </li>\r\n		  <li>\r\n            <dl>\r\n                            <dd class=\"banner-thumb\"> <a href=\"\" title=\"\" class=\"a1\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/common/loading.gif\" alt=\"\" data-url=\"http://it.hnlichaung.com/data/upload/shop/editor/web-8-85-1-31.jpg?634\" rel=\"lazy\" /></a></dd>\r\n            </dl>\r\n          </li>\r\n		  <li>\r\n            <dl>\r\n                            <dd class=\"banner-thumb\"> <a href=\"\" title=\"\" class=\"a1\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/common/loading.gif\" alt=\"\" data-url=\"http://it.hnlichaung.com/data/upload/shop/editor/web-8-85-1-33.jpg?689\" rel=\"lazy\" /></a></dd>\r\n            </dl>\r\n          </li>\r\n          <li>\r\n            <dl>\r\n                            <dd class=\"banner-thumb\"> <a href=\"\" title=\"\" class=\"a1\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/common/loading.gif\" alt=\"\" data-url=\"http://it.hnlichaung.com/data/upload/shop/editor/web-8-85-1-12.jpg?235\" rel=\"lazy\" /></a></dd>\r\n            </dl>\r\n          </li>\r\n          <li>\r\n            <dl>\r\n                            <dd class=\"banner-thumb\"> <a href=\"\" title=\"\" class=\"a1\" target=\"_blank\"> <img src=\"http://it.hnlichaung.com/data/upload/shop/common/loading.gif\" alt=\"\" data-url=\"http://it.hnlichaung.com/data/upload/shop/editor/web-8-85-1-32.jpg?454\" rel=\"lazy\" /></a></dd>\r\n            </dl>\r\n          </li>\r\n          <li>\r\n            <dl>\r\n                            <dd class=\"banner-thumb\"> <a href=\"\" title=\"\" class=\"a1\" target=\"_blank\"> <img alt=\"\" src=\"http://it.hnlichaung.com/data/upload/shop/editor/web-8-85-1-34.jpg?772\" rel=\"lazy\" /></a></dd>\r\n            </dl>\r\n          </li>\r\n        </ul>\r\n      </div>\r\n      \r\n       </div>\r\n              </div>\r\n</div>\r\n'),(101,'首页头部焦点图片','orange','index_pic',1495643288,100,1,'\r\n  <ul id=\"fullScreenSlides\" class=\"full-screen-slides\">\r\n                                        <li style=\"background: #EDD9C0 url(\'http://it.hnlichaung.com/data/upload/shop/editor/web-101-101-1.png?177\') no-repeat center top\">\r\n            <a href=\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index&amp;cate_id=1100\" target=\"_blank\" title=\"好商城\">&nbsp;</a></li>\r\n                                        <li style=\"background: #200772 url(\'http://it.hnlichaung.com/data/upload/shop/editor/web-101-101-2.png?442\') no-repeat center top\">\r\n            <a href=\"http://demo.33hao.com/shop/index.php?act=show_groupbuy&amp;op=index\" target=\"_blank\" title=\"好商城\">&nbsp;</a></li>\r\n                                        <li style=\"background: #EFE6DD url(\'http://it.hnlichaung.com/data/upload/shop/editor/web-101-101-3.png?983\') no-repeat center top\">\r\n            <a href=\"http://demo.33hao.com/shop/index.php?act=show_groupbuy&amp;op=index\" target=\"_blank\" title=\"好商城\">&nbsp;</a></li>\r\n                                        <li style=\"background: #760907 url(\'http://it.hnlichaung.com/data/upload/shop/editor/web-101-101-4.png?779\') no-repeat center top\">\r\n            <a href=\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index&amp;cate_id=1100\" target=\"_blank\" title=\"好商城\">&nbsp;</a></li>\r\n                              \r\n  </ul>\r\n  <div class=\"jfocus-trigeminybox\">\r\n  <a class=\"limited_time\" title=\"限时打折\" href=\"http://it.hnlichaung.com/index.php?act=promotion&op=index\">\r\n        <div class=\"clock-wrap\">\r\n          <div class=\"clock\">\r\n            <div class=\"clock-h\" id=\"ClockHours\" style=\"-webkit-transform: rotate(93deg);\"></div>\r\n            <div class=\"clock-m\"></div>\r\n            <div class=\"clock-s\"></div>\r\n          </div>\r\n    </div>\r\n    </a>\r\n  <div class=\"jfocus-trigeminy\"> \r\n    <ul>\r\n                              <li>\r\n                                        <a href=\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index\" target=\"_blank\" title=\"测试\">\r\n                <img src=\"http://it.hnlichaung.com/data/upload/shop/editor/web-101-102-1-1.jpg?306\" alt=\"测试\"></a>\r\n                          <a href=\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index\" target=\"_blank\" title=\"测试\">\r\n                <img src=\"http://it.hnlichaung.com/data/upload/shop/editor/web-101-102-1-2.jpg?220\" alt=\"测试\"></a>\r\n                          <a href=\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index\" target=\"_blank\" title=\"测试\">\r\n                <img src=\"http://it.hnlichaung.com/data/upload/shop/editor/web-101-102-1-3.jpg?296\" alt=\"测试\"></a>\r\n                          <a href=\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index\" target=\"_blank\" title=\"测试\">\r\n                <img src=\"http://it.hnlichaung.com/data/upload/shop/editor/web-101-102-1-4.jpg?752\" alt=\"测试\"></a>\r\n                                      </li>\r\n                    <li>\r\n                                        <a href=\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index\" target=\"_blank\" title=\"测试\">\r\n                <img src=\"http://it.hnlichaung.com/data/upload/shop/editor/web-101-102-2-1.jpg?718\" alt=\"测试\"></a>\r\n                          <a href=\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index\" target=\"_blank\" title=\"测试\">\r\n                <img src=\"http://it.hnlichaung.com/data/upload/shop/editor/web-101-102-2-2.jpg?967\" alt=\"测试\"></a>\r\n                          <a href=\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index\" target=\"_blank\" title=\"测试\">\r\n                <img src=\"http://it.hnlichaung.com/data/upload/shop/editor/web-101-102-2-3.jpg?477\" alt=\"测试\"></a>\r\n                          <a href=\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index\" target=\"_blank\" title=\"测试\">\r\n                <img src=\"http://it.hnlichaung.com/data/upload/shop/editor/web-101-102-2-4.jpg?643\" alt=\"测试\"></a>\r\n                                      </li>\r\n                    <li>\r\n                                        <a href=\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index\" target=\"_blank\" title=\"测试\">\r\n                <img src=\"http://it.hnlichaung.com/data/upload/shop/editor/web-101-102-3-1.jpg?970\" alt=\"测试\"></a>\r\n                          <a href=\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index\" target=\"_blank\" title=\"测试\">\r\n                <img src=\"http://it.hnlichaung.com/data/upload/shop/editor/web-101-102-3-2.jpg?341\" alt=\"测试\"></a>\r\n                          <a href=\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index\" target=\"_blank\" title=\"测试\">\r\n                <img src=\"http://it.hnlichaung.com/data/upload/shop/editor/web-101-102-3-3.jpg?480\" alt=\"测试\"></a>\r\n                          <a href=\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index\" target=\"_blank\" title=\"测试\">\r\n                <img src=\"http://it.hnlichaung.com/data/upload/shop/editor/web-101-102-3-4.jpg?162\" alt=\"测试\"></a>\r\n                                      </li>\r\n                        </ul>\r\n  </div>\r\n  </div>\r\n<script type=\"text/javascript\">\r\n	update_screen_focus();\r\n</script>'),(121,'首页促销区','orange','index_sale',1495643288,120,1,'\r\n    <ul class=\"tabs-nav\">\r\n                                            <li class=\"tabs-selected\"><h3>新品上架</h3></li>\r\n                          <li class=\"\"><h3>热卖商品</h3></li>\r\n                          <li class=\"\"><h3>疯狂抢购</h3></li>\r\n                          <li class=\"\"><h3>猜您喜欢</h3></li>\r\n                          <li class=\"\"><h3>热评商品</h3></li>\r\n                                        </ul>\r\n                                                                                                <div class=\"tabs-panel sale-goods-list \">\r\n                                    <ul>\r\n                                                                          <li>\r\n                                        <dl>\r\n                                          <dt class=\"goods-name\"><a target=\"_blank\" href=\"http://it.hnlichaung.com/shop/index.php?act=goods&op=index&goods_id=102592\" title=\"爵爷商务皮鞋 秋款男士正装 前系带 金属尖头低帮单鞋 黑色 38\">\r\n                                          	爵爷商务皮鞋 秋款男士正装 前系带 金属尖头低帮单鞋 黑色 38</a></dt>\r\n                                          <dd class=\"goods-thumb\">\r\n                                          	<a target=\"_blank\" href=\"http://it.hnlichaung.com/shop/index.php?act=goods&op=index&goods_id=102592\">\r\n                                          	<img src=\"http://it.hnlichaung.com/data/upload/shop/store/goods/16/16_05000683915287946_240.jpg\" alt=\"爵爷商务皮鞋 秋款男士正装 前系带 金属尖头低帮单鞋 黑色 38\" />\r\n                                          	</a></dd>\r\n                                          <dd class=\"goods-price\">商城价：<em>&yen;108.00</em></dd>\r\n                                        </dl>\r\n                                      </li>\r\n                                                                          <li>\r\n                                        <dl>\r\n                                          <dt class=\"goods-name\"><a target=\"_blank\" href=\"http://it.hnlichaung.com/shop/index.php?act=goods&op=index&goods_id=102700\" title=\"纯色透气圆头单鞋男真皮方跟低帮鞋前系带男士皮鞋 棕色 38\">\r\n                                          	纯色透气圆头单鞋男真皮方跟低帮鞋前系带男士皮鞋 棕色 38</a></dt>\r\n                                          <dd class=\"goods-thumb\">\r\n                                          	<a target=\"_blank\" href=\"http://it.hnlichaung.com/shop/index.php?act=goods&op=index&goods_id=102700\">\r\n                                          	<img src=\"http://it.hnlichaung.com/data/upload/shop/store/goods/16/16_05003068354931461_240.jpg\" alt=\"纯色透气圆头单鞋男真皮方跟低帮鞋前系带男士皮鞋 棕色 38\" />\r\n                                          	</a></dd>\r\n                                          <dd class=\"goods-price\">商城价：<em>&yen;88.00</em></dd>\r\n                                        </dl>\r\n                                      </li>\r\n                                                                          <li>\r\n                                        <dl>\r\n                                          <dt class=\"goods-name\"><a target=\"_blank\" href=\"http://it.hnlichaung.com/shop/index.php?act=goods&op=index&goods_id=102649\" title=\"优质超纤皮男鞋纯色前系带尖头低帮皮鞋 棕色 38\">\r\n                                          	优质超纤皮男鞋纯色前系带尖头低帮皮鞋 棕色 38</a></dt>\r\n                                          <dd class=\"goods-thumb\">\r\n                                          	<a target=\"_blank\" href=\"http://it.hnlichaung.com/shop/index.php?act=goods&op=index&goods_id=102649\">\r\n                                          	<img src=\"http://it.hnlichaung.com/data/upload/shop/store/goods/16/16_05002911543965426_240.jpg\" alt=\"优质超纤皮男鞋纯色前系带尖头低帮皮鞋 棕色 38\" />\r\n                                          	</a></dd>\r\n                                          <dd class=\"goods-price\">商城价：<em>&yen;108.00</em></dd>\r\n                                        </dl>\r\n                                      </li>\r\n                                                                          <li>\r\n                                        <dl>\r\n                                          <dt class=\"goods-name\"><a target=\"_blank\" href=\"http://it.hnlichaung.com/shop/index.php?act=goods&op=index&goods_id=102688\" title=\"爵爷2015春秋商务正装男士皮鞋透气超纤皮男鞋 黑色 38\">\r\n                                          	爵爷2015春秋商务正装男士皮鞋透气超纤皮男鞋 黑色 38</a></dt>\r\n                                          <dd class=\"goods-thumb\">\r\n                                          	<a target=\"_blank\" href=\"http://it.hnlichaung.com/shop/index.php?act=goods&op=index&goods_id=102688\">\r\n                                          	<img src=\"http://it.hnlichaung.com/data/upload/shop/store/goods/16/16_05003062100708546_240.jpg\" alt=\"爵爷2015春秋商务正装男士皮鞋透气超纤皮男鞋 黑色 38\" />\r\n                                          	</a></dd>\r\n                                          <dd class=\"goods-price\">商城价：<em>&yen;108.00</em></dd>\r\n                                        </dl>\r\n                                      </li>\r\n                                                                          <li>\r\n                                        <dl>\r\n                                          <dt class=\"goods-name\"><a target=\"_blank\" href=\"http://it.hnlichaung.com/shop/index.php?act=goods&op=index&goods_id=102604\" title=\"日常休闲鞋男士豆豆鞋驾车真皮男鞋英伦皮鞋 黄色 38\">\r\n                                          	日常休闲鞋男士豆豆鞋驾车真皮男鞋英伦皮鞋 黄色 38</a></dt>\r\n                                          <dd class=\"goods-thumb\">\r\n                                          	<a target=\"_blank\" href=\"http://it.hnlichaung.com/shop/index.php?act=goods&op=index&goods_id=102604\">\r\n                                          	<img src=\"http://it.hnlichaung.com/data/upload/shop/store/goods/16/16_05001210537684207_240.jpg\" alt=\"日常休闲鞋男士豆豆鞋驾车真皮男鞋英伦皮鞋 黄色 38\" />\r\n                                          	</a></dd>\r\n                                          <dd class=\"goods-price\">商城价：<em>&yen;108.00</em></dd>\r\n                                        </dl>\r\n                                      </li>\r\n                                                                        </ul>\r\n                                  </div>\r\n                                                                                                        <div class=\"tabs-panel sale-goods-list tabs-hide\">\r\n                                    <ul>\r\n                                                                          <li>\r\n                                        <dl>\r\n                                          <dt class=\"goods-name\"><a target=\"_blank\" href=\"http://it.hnlichaung.com/shop/index.php?act=goods&op=index&goods_id=102020\" title=\"冬装男装立领 男式纯棉T恤男士加厚加绒保暖打底衫 白色 M\">\r\n                                          	冬装男装立领 男式纯棉T恤男士加厚加绒保暖打底衫 白色 M</a></dt>\r\n                                          <dd class=\"goods-thumb\">\r\n                                          	<a target=\"_blank\" href=\"http://it.hnlichaung.com/shop/index.php?act=goods&op=index&goods_id=102020\">\r\n                                          	<img src=\"http://it.hnlichaung.com/data/upload/shop/store/goods/15/15_04999727187217105_240.png\" alt=\"冬装男装立领 男式纯棉T恤男士加厚加绒保暖打底衫 白色 M\" />\r\n                                          	</a></dd>\r\n                                          <dd class=\"goods-price\">商城价：<em>&yen;73.00</em></dd>\r\n                                        </dl>\r\n                                      </li>\r\n                                                                          <li>\r\n                                        <dl>\r\n                                          <dt class=\"goods-name\"><a target=\"_blank\" href=\"http://it.hnlichaung.com/shop/index.php?act=goods&op=index&goods_id=102165\" title=\"2015秋新款男装男式牛仔裤男休闲商务长裤子韩版修身直筒 图片色 28\">\r\n                                          	2015秋新款男装男式牛仔裤男休闲商务长裤子韩版修身直筒 图片色 28</a></dt>\r\n                                          <dd class=\"goods-thumb\">\r\n                                          	<a target=\"_blank\" href=\"http://it.hnlichaung.com/shop/index.php?act=goods&op=index&goods_id=102165\">\r\n                                          	<img src=\"http://it.hnlichaung.com/data/upload/shop/store/goods/15/15_04999963827312369_240.jpg\" alt=\"2015秋新款男装男式牛仔裤男休闲商务长裤子韩版修身直筒 图片色 28\" />\r\n                                          	</a></dd>\r\n                                          <dd class=\"goods-price\">商城价：<em>&yen;81.00</em></dd>\r\n                                        </dl>\r\n                                      </li>\r\n                                                                          <li>\r\n                                        <dl>\r\n                                          <dt class=\"goods-name\"><a target=\"_blank\" href=\"http://it.hnlichaung.com/shop/index.php?act=goods&op=index&goods_id=102126\" title=\"2015秋冬新款韩版女羽绒棉服女立领修身显瘦棉衣短款棉服外套 红色 L\">\r\n                                          	2015秋冬新款韩版女羽绒棉服女立领修身显瘦棉衣短款棉服外套 红色 L</a></dt>\r\n                                          <dd class=\"goods-thumb\">\r\n                                          	<a target=\"_blank\" href=\"http://it.hnlichaung.com/shop/index.php?act=goods&op=index&goods_id=102126\">\r\n                                          	<img src=\"http://it.hnlichaung.com/data/upload/shop/store/goods/12/12_04999931964380007_240.jpg\" alt=\"2015秋冬新款韩版女羽绒棉服女立领修身显瘦棉衣短款棉服外套 红色 L\" />\r\n                                          	</a></dd>\r\n                                          <dd class=\"goods-price\">商城价：<em>&yen;103.00</em></dd>\r\n                                        </dl>\r\n                                      </li>\r\n                                                                          <li>\r\n                                        <dl>\r\n                                          <dt class=\"goods-name\"><a target=\"_blank\" href=\"http://it.hnlichaung.com/shop/index.php?act=goods&op=index&goods_id=102070\" title=\"新款女装韩版修身A字斗篷棉衣加厚保暖短外套大毛领连帽羽绒棉服 蓝色 M\">\r\n                                          	新款女装韩版修身A字斗篷棉衣加厚保暖短外套大毛领连帽羽绒棉服 蓝色 M</a></dt>\r\n                                          <dd class=\"goods-thumb\">\r\n                                          	<a target=\"_blank\" href=\"http://it.hnlichaung.com/shop/index.php?act=goods&op=index&goods_id=102070\">\r\n                                          	<img src=\"http://it.hnlichaung.com/data/upload/shop/store/goods/12/12_04999920485539383_240.jpg\" alt=\"新款女装韩版修身A字斗篷棉衣加厚保暖短外套大毛领连帽羽绒棉服 蓝色 M\" />\r\n                                          	</a></dd>\r\n                                          <dd class=\"goods-price\">商城价：<em>&yen;118.00</em></dd>\r\n                                        </dl>\r\n                                      </li>\r\n                                                                          <li>\r\n                                        <dl>\r\n                                          <dt class=\"goods-name\"><a target=\"_blank\" href=\"http://it.hnlichaung.com/shop/index.php?act=goods&op=index&goods_id=101680\" title=\"2015秋冬新款女装女式韩版修身短款棉衣棉服羽绒棉衣女 粉色 M\">\r\n                                          	2015秋冬新款女装女式韩版修身短款棉衣棉服羽绒棉衣女 粉色 M</a></dt>\r\n                                          <dd class=\"goods-thumb\">\r\n                                          	<a target=\"_blank\" href=\"http://it.hnlichaung.com/shop/index.php?act=goods&op=index&goods_id=101680\">\r\n                                          	<img src=\"http://it.hnlichaung.com/data/upload/shop/store/goods/12/12_04999938698283696_240.png\" alt=\"2015秋冬新款女装女式韩版修身短款棉衣棉服羽绒棉衣女 粉色 M\" />\r\n                                          	</a></dd>\r\n                                          <dd class=\"goods-price\">商城价：<em>&yen;112.00</em></dd>\r\n                                        </dl>\r\n                                      </li>\r\n                                                                        </ul>\r\n                                  </div>\r\n                                                                                                        <div class=\"tabs-panel sale-goods-list tabs-hide\">\r\n                                    <ul>\r\n                                                                          <li>\r\n                                        <dl>\r\n                                          <dt class=\"goods-name\"><a target=\"_blank\" href=\"http://it.hnlichaung.com/shop/index.php?act=goods&op=index&goods_id=101559\" title=\"2015冬季新款棉衣女修身大码羽绒棉服女士短款韩版连帽冬季防寒服 蓝色 M\">\r\n                                          	2015冬季新款棉衣女修身大码羽绒棉服女士短款韩版连帽冬季防寒服 蓝色 M</a></dt>\r\n                                          <dd class=\"goods-thumb\">\r\n                                          	<a target=\"_blank\" href=\"http://it.hnlichaung.com/shop/index.php?act=goods&op=index&goods_id=101559\">\r\n                                          	<img src=\"http://it.hnlichaung.com/data/upload/shop/store/goods/12/12_039f2d0f136e6927e9cfa6fff35e077_240.jpg\" alt=\"2015冬季新款棉衣女修身大码羽绒棉服女士短款韩版连帽冬季防寒服 蓝色 M\" />\r\n                                          	</a></dd>\r\n                                          <dd class=\"goods-price\">商城价：<em>&yen;88.00</em></dd>\r\n                                        </dl>\r\n                                      </li>\r\n                                                                          <li>\r\n                                        <dl>\r\n                                          <dt class=\"goods-name\"><a target=\"_blank\" href=\"http://it.hnlichaung.com/shop/index.php?act=goods&op=index&goods_id=101598\" title=\"2015新款冬装棉衣外套女中长款大码加厚毛领羽绒棉服韩版修身棉袄 粉色 M\">\r\n                                          	2015新款冬装棉衣外套女中长款大码加厚毛领羽绒棉服韩版修身棉袄 粉色 M</a></dt>\r\n                                          <dd class=\"goods-thumb\">\r\n                                          	<a target=\"_blank\" href=\"http://it.hnlichaung.com/shop/index.php?act=goods&op=index&goods_id=101598\">\r\n                                          	<img src=\"http://it.hnlichaung.com/data/upload/shop/store/goods/12/12_cc322b39c176a5ae261b62795d46258_240.jpg\" alt=\"2015新款冬装棉衣外套女中长款大码加厚毛领羽绒棉服韩版修身棉袄 粉色 M\" />\r\n                                          	</a></dd>\r\n                                          <dd class=\"goods-price\">商城价：<em>&yen;119.00</em></dd>\r\n                                        </dl>\r\n                                      </li>\r\n                                                                          <li>\r\n                                        <dl>\r\n                                          <dt class=\"goods-name\"><a target=\"_blank\" href=\"http://it.hnlichaung.com/shop/index.php?act=goods&op=index&goods_id=101429\" title=\"2015夏季新款鱼嘴凉鞋超高跟防水台夜店鞋透气网纱粗跟女鞋 粉色 34\">\r\n                                          	2015夏季新款鱼嘴凉鞋超高跟防水台夜店鞋透气网纱粗跟女鞋 粉色 34</a></dt>\r\n                                          <dd class=\"goods-thumb\">\r\n                                          	<a target=\"_blank\" href=\"http://it.hnlichaung.com/shop/index.php?act=goods&op=index&goods_id=101429\">\r\n                                          	<img src=\"http://it.hnlichaung.com/data/upload/shop/store/goods/6/6_04847714326505496_240.jpg\" alt=\"2015夏季新款鱼嘴凉鞋超高跟防水台夜店鞋透气网纱粗跟女鞋 粉色 34\" />\r\n                                          	</a></dd>\r\n                                          <dd class=\"goods-price\">商城价：<em>&yen;108.00</em></dd>\r\n                                        </dl>\r\n                                      </li>\r\n                                                                          <li>\r\n                                        <dl>\r\n                                          <dt class=\"goods-name\"><a target=\"_blank\" href=\"http://it.hnlichaung.com/shop/index.php?act=goods&op=index&goods_id=102433\" title=\"秋冬季时尚单鞋 糖果色亮面浅口细跟职业女鞋 漆皮镜面尖头高跟鞋 白色 34\">\r\n                                          	秋冬季时尚单鞋 糖果色亮面浅口细跟职业女鞋 漆皮镜面尖头高跟鞋 白色 34</a></dt>\r\n                                          <dd class=\"goods-thumb\">\r\n                                          	<a target=\"_blank\" href=\"http://it.hnlichaung.com/shop/index.php?act=goods&op=index&goods_id=102433\">\r\n                                          	<img src=\"http://it.hnlichaung.com/data/upload/shop/store/goods/17/17_05000574018138552_240.jpg\" alt=\"秋冬季时尚单鞋 糖果色亮面浅口细跟职业女鞋 漆皮镜面尖头高跟鞋 白色 34\" />\r\n                                          	</a></dd>\r\n                                          <dd class=\"goods-price\">商城价：<em>&yen;119.00</em></dd>\r\n                                        </dl>\r\n                                      </li>\r\n                                                                          <li>\r\n                                        <dl>\r\n                                          <dt class=\"goods-name\"><a target=\"_blank\" href=\"http://it.hnlichaung.com/shop/index.php?act=goods&op=index&goods_id=102265\" title=\"秋季新款糖果色细跟单鞋 浅口真皮尖头高跟鞋 杏色 34\">\r\n                                          	秋季新款糖果色细跟单鞋 浅口真皮尖头高跟鞋 杏色 34</a></dt>\r\n                                          <dd class=\"goods-thumb\">\r\n                                          	<a target=\"_blank\" href=\"http://it.hnlichaung.com/shop/index.php?act=goods&op=index&goods_id=102265\">\r\n                                          	<img src=\"http://it.hnlichaung.com/data/upload/shop/store/goods/17/17_05000548082598798_240.jpg\" alt=\"秋季新款糖果色细跟单鞋 浅口真皮尖头高跟鞋 杏色 34\" />\r\n                                          	</a></dd>\r\n                                          <dd class=\"goods-price\">商城价：<em>&yen;119.00</em></dd>\r\n                                        </dl>\r\n                                      </li>\r\n                                                                        </ul>\r\n                                  </div>\r\n                                                                                                        <div class=\"tabs-panel sale-goods-list tabs-hide\">\r\n                                    <ul>\r\n                                                                          <li>\r\n                                        <dl>\r\n                                          <dt class=\"goods-name\"><a target=\"_blank\" href=\"http://it.hnlichaung.com/shop/index.php?act=goods&op=index&goods_id=102865\" title=\"酷迪璐新品男式夹克外套男士pu皮衣韩版休闲绒布接男装 蓝色 M\">\r\n                                          	酷迪璐新品男式夹克外套男士pu皮衣韩版休闲绒布接男装 蓝色 M</a></dt>\r\n                                          <dd class=\"goods-thumb\">\r\n                                          	<a target=\"_blank\" href=\"http://it.hnlichaung.com/shop/index.php?act=goods&op=index&goods_id=102865\">\r\n                                          	<img src=\"http://it.hnlichaung.com/data/upload/shop/store/goods/18/18_05011806114146918_240.jpg\" alt=\"酷迪璐新品男式夹克外套男士pu皮衣韩版休闲绒布接男装 蓝色 M\" />\r\n                                          	</a></dd>\r\n                                          <dd class=\"goods-price\">商城价：<em>&yen;128.00</em></dd>\r\n                                        </dl>\r\n                                      </li>\r\n                                                                          <li>\r\n                                        <dl>\r\n                                          <dt class=\"goods-name\"><a target=\"_blank\" href=\"http://it.hnlichaung.com/shop/index.php?act=goods&op=index&goods_id=102835\" title=\"2015新款保暖加绒修身衬衫 白色 M\">\r\n                                          	2015新款保暖加绒修身衬衫 白色 M</a></dt>\r\n                                          <dd class=\"goods-thumb\">\r\n                                          	<a target=\"_blank\" href=\"http://it.hnlichaung.com/shop/index.php?act=goods&op=index&goods_id=102835\">\r\n                                          	<img src=\"http://it.hnlichaung.com/data/upload/shop/store/goods/18/18_05011800162520471_240.jpg\" alt=\"2015新款保暖加绒修身衬衫 白色 M\" />\r\n                                          	</a></dd>\r\n                                          <dd class=\"goods-price\">商城价：<em>&yen;98.00</em></dd>\r\n                                        </dl>\r\n                                      </li>\r\n                                                                          <li>\r\n                                        <dl>\r\n                                          <dt class=\"goods-name\"><a target=\"_blank\" href=\"http://it.hnlichaung.com/shop/index.php?act=goods&op=index&goods_id=102805\" title=\"酷迪璐冬装男士加棉加厚长袖衬衫格子夹克衬衫 灰色 M\">\r\n                                          	酷迪璐冬装男士加棉加厚长袖衬衫格子夹克衬衫 灰色 M</a></dt>\r\n                                          <dd class=\"goods-thumb\">\r\n                                          	<a target=\"_blank\" href=\"http://it.hnlichaung.com/shop/index.php?act=goods&op=index&goods_id=102805\">\r\n                                          	<img src=\"http://it.hnlichaung.com/data/upload/shop/store/goods/18/18_05011789584196803_240.jpg\" alt=\"酷迪璐冬装男士加棉加厚长袖衬衫格子夹克衬衫 灰色 M\" />\r\n                                          	</a></dd>\r\n                                          <dd class=\"goods-price\">商城价：<em>&yen;108.00</em></dd>\r\n                                        </dl>\r\n                                      </li>\r\n                                                                          <li>\r\n                                        <dl>\r\n                                          <dt class=\"goods-name\"><a target=\"_blank\" href=\"http://it.hnlichaung.com/shop/index.php?act=goods&op=index&goods_id=102751\" title=\"2015新款秋冬男式PU皮夹克外贸 海宁男士立领休闲修身外套 黑色 M\">\r\n                                          	2015新款秋冬男式PU皮夹克外贸 海宁男士立领休闲修身外套 黑色 M</a></dt>\r\n                                          <dd class=\"goods-thumb\">\r\n                                          	<a target=\"_blank\" href=\"http://it.hnlichaung.com/shop/index.php?act=goods&op=index&goods_id=102751\">\r\n                                          	<img src=\"http://it.hnlichaung.com/data/upload/shop/store/goods/18/18_05011764627052815_240.jpg\" alt=\"2015新款秋冬男式PU皮夹克外贸 海宁男士立领休闲修身外套 黑色 M\" />\r\n                                          	</a></dd>\r\n                                          <dd class=\"goods-price\">商城价：<em>&yen;158.00</em></dd>\r\n                                        </dl>\r\n                                      </li>\r\n                                                                          <li>\r\n                                        <dl>\r\n                                          <dt class=\"goods-name\"><a target=\"_blank\" href=\"http://it.hnlichaung.com/shop/index.php?act=goods&op=index&goods_id=102633\" title=\"2015秋冬新款 全棉男式牛仔裤直筒型 图片色 28\">\r\n                                          	2015秋冬新款 全棉男式牛仔裤直筒型 图片色 28</a></dt>\r\n                                          <dd class=\"goods-thumb\">\r\n                                          	<a target=\"_blank\" href=\"http://it.hnlichaung.com/shop/index.php?act=goods&op=index&goods_id=102633\">\r\n                                          	<img src=\"http://it.hnlichaung.com/data/upload/shop/store/goods/15/15_05002060806639307_240.jpg\" alt=\"2015秋冬新款 全棉男式牛仔裤直筒型 图片色 28\" />\r\n                                          	</a></dd>\r\n                                          <dd class=\"goods-price\">商城价：<em>&yen;89.00</em></dd>\r\n                                        </dl>\r\n                                      </li>\r\n                                                                        </ul>\r\n                                  </div>\r\n                                                                                                        <div class=\"tabs-panel sale-goods-list tabs-hide\">\r\n                                    <ul>\r\n                                                                          <li>\r\n                                        <dl>\r\n                                          <dt class=\"goods-name\"><a target=\"_blank\" href=\"http://it.hnlichaung.com/shop/index.php?act=goods&op=index&goods_id=102150\" title=\"韩版品牌直筒修身牛仔裤 秋冬男士长裤休闲牛仔裤 图片色 28\">\r\n                                          	韩版品牌直筒修身牛仔裤 秋冬男士长裤休闲牛仔裤 图片色 28</a></dt>\r\n                                          <dd class=\"goods-thumb\">\r\n                                          	<a target=\"_blank\" href=\"http://it.hnlichaung.com/shop/index.php?act=goods&op=index&goods_id=102150\">\r\n                                          	<img src=\"http://it.hnlichaung.com/data/upload/shop/store/goods/15/15_04999958412070501_240.jpg\" alt=\"韩版品牌直筒修身牛仔裤 秋冬男士长裤休闲牛仔裤 图片色 28\" />\r\n                                          	</a></dd>\r\n                                          <dd class=\"goods-price\">商城价：<em>&yen;82.00</em></dd>\r\n                                        </dl>\r\n                                      </li>\r\n                                                                          <li>\r\n                                        <dl>\r\n                                          <dt class=\"goods-name\"><a target=\"_blank\" href=\"http://it.hnlichaung.com/shop/index.php?act=goods&op=index&goods_id=102005\" title=\"冬装男装爆款 男式纯棉T恤男士加厚加绒保暖打底衫 黑色 M\">\r\n                                          	冬装男装爆款 男式纯棉T恤男士加厚加绒保暖打底衫 黑色 M</a></dt>\r\n                                          <dd class=\"goods-thumb\">\r\n                                          	<a target=\"_blank\" href=\"http://it.hnlichaung.com/shop/index.php?act=goods&op=index&goods_id=102005\">\r\n                                          	<img src=\"http://it.hnlichaung.com/data/upload/shop/store/goods/15/15_04999724012252809_240.jpg\" alt=\"冬装男装爆款 男式纯棉T恤男士加厚加绒保暖打底衫 黑色 M\" />\r\n                                          	</a></dd>\r\n                                          <dd class=\"goods-price\">商城价：<em>&yen;69.00</em></dd>\r\n                                        </dl>\r\n                                      </li>\r\n                                                                          <li>\r\n                                        <dl>\r\n                                          <dt class=\"goods-name\"><a target=\"_blank\" href=\"http://it.hnlichaung.com/shop/index.php?act=goods&op=index&goods_id=101930\" title=\"2015冬款新品 男式拼接长袖加厚加绒保暖V领T恤男装不倒绒 酒红 M\">\r\n                                          	2015冬款新品 男式拼接长袖加厚加绒保暖V领T恤男装不倒绒 酒红 M</a></dt>\r\n                                          <dd class=\"goods-thumb\">\r\n                                          	<a target=\"_blank\" href=\"http://it.hnlichaung.com/shop/index.php?act=goods&op=index&goods_id=101930\">\r\n                                          	<img src=\"http://it.hnlichaung.com/data/upload/shop/store/goods/15/15_04999707884947293_240.jpg\" alt=\"2015冬款新品 男式拼接长袖加厚加绒保暖V领T恤男装不倒绒 酒红 M\" />\r\n                                          	</a></dd>\r\n                                          <dd class=\"goods-price\">商城价：<em>&yen;65.00</em></dd>\r\n                                        </dl>\r\n                                      </li>\r\n                                                                          <li>\r\n                                        <dl>\r\n                                          <dt class=\"goods-name\"><a target=\"_blank\" href=\"http://it.hnlichaung.com/shop/index.php?act=goods&op=index&goods_id=101807\" title=\"2015秋季新款男士长袖t恤潮纯棉秋长袖修身韩版青年体恤运动小衫 白拼枣红 M\">\r\n                                          	2015秋季新款男士长袖t恤潮纯棉秋长袖修身韩版青年体恤运动小衫 白拼枣红 M</a></dt>\r\n                                          <dd class=\"goods-thumb\">\r\n                                          	<a target=\"_blank\" href=\"http://it.hnlichaung.com/shop/index.php?act=goods&op=index&goods_id=101807\">\r\n                                          	<img src=\"http://it.hnlichaung.com/data/upload/shop/store/goods/15/15_04999618551849829_240.jpg\" alt=\"2015秋季新款男士长袖t恤潮纯棉秋长袖修身韩版青年体恤运动小衫 白拼枣红 M\" />\r\n                                          	</a></dd>\r\n                                          <dd class=\"goods-price\">商城价：<em>&yen;65.00</em></dd>\r\n                                        </dl>\r\n                                      </li>\r\n                                                                          <li>\r\n                                        <dl>\r\n                                          <dt class=\"goods-name\"><a target=\"_blank\" href=\"http://it.hnlichaung.com/shop/index.php?act=goods&op=index&goods_id=102157\" title=\"品牌男装牛仔裤纯棉商务男裤男式牛仔裤 图片色 28\">\r\n                                          	品牌男装牛仔裤纯棉商务男裤男式牛仔裤 图片色 28</a></dt>\r\n                                          <dd class=\"goods-thumb\">\r\n                                          	<a target=\"_blank\" href=\"http://it.hnlichaung.com/shop/index.php?act=goods&op=index&goods_id=102157\">\r\n                                          	<img src=\"http://it.hnlichaung.com/data/upload/shop/store/goods/15/15_04999961053663021_240.jpg\" alt=\"品牌男装牛仔裤纯棉商务男裤男式牛仔裤 图片色 28\" />\r\n                                          	</a></dd>\r\n                                          <dd class=\"goods-price\">商城价：<em>&yen;89.00</em></dd>\r\n                                        </dl>\r\n                                      </li>\r\n                                                                        </ul>\r\n                                  </div>\r\n                                                              ');
/*!40000 ALTER TABLE `te_web` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_web_channel`
--

DROP TABLE IF EXISTS `te_web_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_web_channel` (
  `channel_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '频道ID',
  `channel_name` varchar(50) DEFAULT '' COMMENT '频道名称',
  `channel_style` varchar(20) DEFAULT '' COMMENT '颜色风格',
  `gc_id` int(10) unsigned DEFAULT '0' COMMENT '绑定分类ID',
  `gc_name` varchar(50) DEFAULT '' COMMENT '分类名称',
  `keywords` varchar(255) DEFAULT '' COMMENT '关键词',
  `description` varchar(255) DEFAULT '' COMMENT '描述',
  `top_id` int(10) unsigned DEFAULT '0' COMMENT '顶部楼层编号',
  `floor_ids` varchar(100) DEFAULT '' COMMENT '中部楼层编号',
  `update_time` int(10) unsigned NOT NULL COMMENT '更新时间',
  `channel_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '启用状态，0为否，1为是，默认为1',
  PRIMARY KEY (`channel_id`),
  KEY `gc_id` (`gc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商城频道表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_web_channel`
--

LOCK TABLES `te_web_channel` WRITE;
/*!40000 ALTER TABLE `te_web_channel` DISABLE KEYS */;
/*!40000 ALTER TABLE `te_web_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `te_web_code`
--

DROP TABLE IF EXISTS `te_web_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `te_web_code` (
  `code_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '内容ID',
  `web_id` int(10) unsigned NOT NULL COMMENT '模块ID',
  `code_type` varchar(10) NOT NULL DEFAULT 'array' COMMENT '数据类型:array,html,json',
  `var_name` varchar(20) NOT NULL COMMENT '变量名称',
  `code_info` text COMMENT '内容数据',
  `show_name` varchar(20) DEFAULT '' COMMENT '页面名称',
  PRIMARY KEY (`code_id`),
  KEY `web_id` (`web_id`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8 COMMENT='模块内容表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `te_web_code`
--

LOCK TABLES `te_web_code` WRITE;
/*!40000 ALTER TABLE `te_web_code` DISABLE KEYS */;
INSERT INTO `te_web_code` VALUES (11,1,'array','tit','a:5:{s:3:\"pic\";s:28:\"shop/editor/web-1-11.png?926\";s:3:\"url\";s:0:\"\";s:4:\"type\";s:3:\"txt\";s:5:\"floor\";s:2:\"1F\";s:5:\"title\";s:12:\"潮流女装\";}','标题图片'),(12,1,'array','category_list','a:1:{s:11:\"goods_class\";a:13:{i:1103;a:2:{s:5:\"gc_id\";s:4:\"1103\";s:7:\"gc_name\";s:6:\"衬衫\";}i:1104;a:2:{s:5:\"gc_id\";s:4:\"1104\";s:7:\"gc_name\";s:4:\"T恤\";}i:1106;a:2:{s:5:\"gc_id\";s:4:\"1106\";s:7:\"gc_name\";s:9:\"雪纺衫\";}i:1524;a:2:{s:5:\"gc_id\";s:4:\"1524\";s:7:\"gc_name\";s:9:\"情侣装\";}i:1528;a:2:{s:5:\"gc_id\";s:4:\"1528\";s:7:\"gc_name\";s:12:\"大码女装\";}i:1264;a:2:{s:5:\"gc_id\";s:4:\"1264\";s:7:\"gc_name\";s:9:\"连衣裙\";}i:1265;a:2:{s:5:\"gc_id\";s:4:\"1265\";s:7:\"gc_name\";s:9:\"半身裙\";}i:1434;a:2:{s:5:\"gc_id\";s:4:\"1434\";s:7:\"gc_name\";s:6:\"旗袍\";}i:1253;a:2:{s:5:\"gc_id\";s:4:\"1253\";s:7:\"gc_name\";s:9:\"牛仔裤\";}i:1254;a:2:{s:5:\"gc_id\";s:4:\"1254\";s:7:\"gc_name\";s:9:\"休闲裤\";}i:1255;a:2:{s:5:\"gc_id\";s:4:\"1255\";s:7:\"gc_name\";s:9:\"西装裤\";}i:1443;a:2:{s:5:\"gc_id\";s:4:\"1443\";s:7:\"gc_name\";s:9:\"七分裤\";}i:1527;a:2:{s:5:\"gc_id\";s:4:\"1527\";s:7:\"gc_name\";s:6:\"短裤\";}}}','推荐分类'),(13,1,'array','act','a:4:{s:3:\"pic\";s:28:\"shop/editor/web-1-13.jpg?343\";s:4:\"type\";s:3:\"pic\";s:5:\"title\";s:0:\"\";s:3:\"url\";s:0:\"\";}','活动图片'),(15,1,'array','recommend_list','a:1:{i:1;a:2:{s:9:\"recommend\";a:1:{s:4:\"name\";s:12:\"商品推荐\";}s:8:\"pic_list\";a:9:{i:14;a:4:{s:6:\"pic_id\";s:2:\"14\";s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:7:\"pic_img\";s:33:\"shop/editor/web-1-15-1-14.jpg?393\";}i:11;a:4:{s:8:\"pic_name\";s:63:\"针织格子提花休闲圆领七分袖连衣裙 格子混色 L\";s:7:\"pic_url\";s:77:\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index&amp;cate_id=1100\";s:6:\"pic_id\";s:2:\"11\";s:7:\"pic_img\";s:33:\"shop/editor/web-1-15-1-11.jpg?445\";}i:21;a:4:{s:6:\"pic_id\";s:2:\"21\";s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:7:\"pic_img\";s:33:\"shop/editor/web-1-15-1-21.jpg?368\";}i:12;a:4:{s:8:\"pic_name\";s:54:\"街头人物印花休闲圆领长袖连衣裙 黑色 S\";s:7:\"pic_url\";s:77:\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index&amp;cate_id=1100\";s:6:\"pic_id\";s:2:\"12\";s:7:\"pic_img\";s:33:\"shop/editor/web-1-15-1-12.jpg?299\";}i:24;a:4:{s:6:\"pic_id\";s:2:\"24\";s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:7:\"pic_img\";s:33:\"shop/editor/web-1-15-1-24.jpg?466\";}i:31;a:4:{s:6:\"pic_id\";s:2:\"31\";s:8:\"pic_name\";s:48:\"撞色印花提花针织短袖连衣裙 米白 L\";s:7:\"pic_url\";s:77:\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index&amp;cate_id=1100\";s:7:\"pic_img\";s:33:\"shop/editor/web-1-15-1-31.jpg?570\";}i:32;a:4:{s:6:\"pic_id\";s:2:\"32\";s:8:\"pic_name\";s:48:\"钉珠蝴蝶结长袖连衣裙套装女 玫红 L\";s:7:\"pic_url\";s:77:\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index&amp;cate_id=1100\";s:7:\"pic_img\";s:33:\"shop/editor/web-1-15-1-32.jpg?568\";}i:33;a:4:{s:6:\"pic_id\";s:2:\"33\";s:8:\"pic_name\";s:48:\"钉珠蝴蝶结长袖连衣裙套装女 玫红 L\";s:7:\"pic_url\";s:77:\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index&amp;cate_id=1100\";s:7:\"pic_img\";s:33:\"shop/editor/web-1-15-1-33.jpg?633\";}i:34;a:4:{s:6:\"pic_id\";s:2:\"34\";s:8:\"pic_name\";s:48:\"波点绣花两件套毛衣连衣裙女 黑色 M\";s:7:\"pic_url\";s:77:\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index&amp;cate_id=1100\";s:7:\"pic_img\";s:33:\"shop/editor/web-1-15-1-34.jpg?499\";}}}}','商品推荐'),(18,1,'array','adv','a:3:{i:2;a:7:{s:6:\"pic_id\";s:1:\"2\";s:8:\"pic_name\";s:93:\"拉夏贝尔套头针织衫 2015冬新款休闲圆领直身裙套装女 拉贝缇 墨绿色 M\";s:7:\"pic_url\";s:0:\"\";s:8:\"pic_surl\";s:0:\"\";s:9:\"pic_sname\";s:0:\"\";s:8:\"pic_simg\";s:0:\"\";s:7:\"pic_img\";s:30:\"shop/editor/web-1-18-2.png?254\";}i:1;a:4:{s:8:\"pic_name\";s:27:\"拉夏贝尔套头针织衫\";s:7:\"pic_url\";s:0:\"\";s:6:\"pic_id\";s:1:\"1\";s:7:\"pic_img\";s:30:\"shop/editor/web-1-18-1.png?318\";}i:3;a:7:{s:6:\"pic_id\";s:1:\"3\";s:8:\"pic_name\";s:27:\"拉夏贝尔套头针织衫\";s:7:\"pic_url\";s:0:\"\";s:8:\"pic_surl\";s:0:\"\";s:9:\"pic_sname\";s:0:\"\";s:8:\"pic_simg\";s:0:\"\";s:7:\"pic_img\";s:30:\"shop/editor/web-1-18-3.png?756\";}}','广告图片'),(19,1,'array','brand_list','a:8:{i:106;a:3:{s:8:\"brand_id\";s:3:\"106\";s:10:\"brand_name\";s:3:\"RDK\";s:9:\"brand_pic\";s:35:\"shop/brand/04398091763582415_sm.jpg\";}i:104;a:3:{s:8:\"brand_id\";s:3:\"104\";s:10:\"brand_name\";s:6:\"esprit\";s:9:\"brand_pic\";s:35:\"shop/brand/04398090828687339_sm.jpg\";}i:83;a:3:{s:8:\"brand_id\";s:2:\"83\";s:10:\"brand_name\";s:9:\"秀秀美\";s:9:\"brand_pic\";s:35:\"shop/brand/04397471716977022_sm.jpg\";}i:85;a:3:{s:8:\"brand_id\";s:2:\"85\";s:10:\"brand_name\";s:6:\"猫人\";s:9:\"brand_pic\";s:35:\"shop/brand/04397472152849925_sm.jpg\";}i:87;a:3:{s:8:\"brand_id\";s:2:\"87\";s:10:\"brand_name\";s:11:\"Hanes恒适\";s:9:\"brand_pic\";s:35:\"shop/brand/04397472577467506_sm.jpg\";}i:80;a:3:{s:8:\"brand_id\";s:2:\"80\";s:10:\"brand_name\";s:7:\"享爱.\";s:9:\"brand_pic\";s:35:\"shop/brand/04397468934349942_sm.jpg\";}i:81;a:3:{s:8:\"brand_id\";s:2:\"81\";s:10:\"brand_name\";s:9:\"派丽蒙\";s:9:\"brand_pic\";s:35:\"shop/brand/04397469152627878_sm.jpg\";}i:82;a:3:{s:8:\"brand_id\";s:2:\"82\";s:10:\"brand_name\";s:9:\"康妮雅\";s:9:\"brand_pic\";s:35:\"shop/brand/04397471448679692_sm.jpg\";}}','品牌推荐'),(21,2,'array','tit','a:5:{s:3:\"pic\";s:28:\"shop/editor/web-2-21.png?920\";s:3:\"url\";s:0:\"\";s:4:\"type\";s:3:\"txt\";s:5:\"floor\";s:2:\"2F\";s:5:\"title\";s:12:\"精品男装\";}','标题图片'),(22,2,'array','category_list','a:1:{s:11:\"goods_class\";a:12:{i:1140;a:2:{s:5:\"gc_id\";s:4:\"1140\";s:7:\"gc_name\";s:6:\"衬衫\";}i:1141;a:2:{s:5:\"gc_id\";s:4:\"1141\";s:7:\"gc_name\";s:4:\"T恤\";}i:1142;a:2:{s:5:\"gc_id\";s:4:\"1142\";s:7:\"gc_name\";s:7:\"POLO衫\";}i:1144;a:2:{s:5:\"gc_id\";s:4:\"1144\";s:7:\"gc_name\";s:6:\"卫衣\";}i:1530;a:2:{s:5:\"gc_id\";s:4:\"1530\";s:7:\"gc_name\";s:6:\"唐装\";}i:1150;a:2:{s:5:\"gc_id\";s:4:\"1150\";s:7:\"gc_name\";s:6:\"西裤\";}i:1151;a:2:{s:5:\"gc_id\";s:4:\"1151\";s:7:\"gc_name\";s:9:\"休闲裤\";}i:1152;a:2:{s:5:\"gc_id\";s:4:\"1152\";s:7:\"gc_name\";s:9:\"牛仔裤\";}i:1158;a:2:{s:5:\"gc_id\";s:4:\"1158\";s:7:\"gc_name\";s:6:\"卫裤\";}i:1373;a:2:{s:5:\"gc_id\";s:4:\"1373\";s:7:\"gc_name\";s:9:\"九分裤\";}i:1442;a:2:{s:5:\"gc_id\";s:4:\"1442\";s:7:\"gc_name\";s:6:\"短裤\";}i:1300;a:2:{s:5:\"gc_id\";s:4:\"1300\";s:7:\"gc_name\";s:11:\"T恤/背心\";}}}','推荐分类'),(23,2,'array','act','a:4:{s:3:\"pic\";s:28:\"shop/editor/web-2-23.jpg?343\";s:4:\"type\";s:3:\"pic\";s:5:\"title\";s:21:\"出游服装五折起\";s:3:\"url\";s:0:\"\";}','活动图片'),(25,2,'array','recommend_list','a:1:{i:1;a:2:{s:9:\"recommend\";a:1:{s:4:\"name\";s:12:\"商品推荐\";}s:8:\"pic_list\";a:9:{i:31;a:4:{s:6:\"pic_id\";s:2:\"31\";s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:7:\"pic_img\";s:33:\"shop/editor/web-2-25-1-31.jpg?959\";}i:32;a:4:{s:6:\"pic_id\";s:2:\"32\";s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:7:\"pic_img\";s:33:\"shop/editor/web-2-25-1-32.jpg?131\";}i:33;a:4:{s:6:\"pic_id\";s:2:\"33\";s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:7:\"pic_img\";s:33:\"shop/editor/web-2-25-1-33.jpg?984\";}i:34;a:4:{s:6:\"pic_id\";s:2:\"34\";s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:7:\"pic_img\";s:33:\"shop/editor/web-2-25-1-34.jpg?246\";}i:11;a:4:{s:6:\"pic_id\";s:2:\"11\";s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:7:\"pic_img\";s:33:\"shop/editor/web-2-25-1-11.jpg?694\";}i:12;a:4:{s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:6:\"pic_id\";s:2:\"12\";s:7:\"pic_img\";s:33:\"shop/editor/web-2-25-1-12.jpg?135\";}i:21;a:4:{s:6:\"pic_id\";s:2:\"21\";s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:7:\"pic_img\";s:33:\"shop/editor/web-2-25-1-21.jpg?852\";}i:24;a:4:{s:6:\"pic_id\";s:2:\"24\";s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:7:\"pic_img\";s:33:\"shop/editor/web-2-25-1-24.jpg?645\";}i:14;a:4:{s:6:\"pic_id\";s:2:\"14\";s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:7:\"pic_img\";s:33:\"shop/editor/web-2-25-1-14.jpg?588\";}}}}','商品推荐'),(28,2,'array','adv','a:3:{i:1;a:7:{s:6:\"pic_id\";s:1:\"1\";s:8:\"pic_name\";s:45:\"冬装可拆卸帽可拆卸袖百搭羽绒服\";s:7:\"pic_url\";s:77:\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index&amp;cate_id=1112\";s:8:\"pic_surl\";s:0:\"\";s:9:\"pic_sname\";s:0:\"\";s:8:\"pic_simg\";s:0:\"\";s:7:\"pic_img\";s:30:\"shop/editor/web-2-28-1.png?688\";}i:2;a:7:{s:6:\"pic_id\";s:1:\"2\";s:8:\"pic_name\";s:57:\"冬新品男士羊毛衫圆领套头毛衫蓝色针织衫\";s:7:\"pic_url\";s:77:\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index&amp;cate_id=1100\";s:8:\"pic_surl\";s:0:\"\";s:9:\"pic_sname\";s:0:\"\";s:8:\"pic_simg\";s:0:\"\";s:7:\"pic_img\";s:30:\"shop/editor/web-2-28-2.png?755\";}i:3;a:4:{s:8:\"pic_name\";s:57:\"冬装新品卡其色翻领男式羊毛呢大衣中长款\";s:7:\"pic_url\";s:77:\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index&amp;cate_id=1100\";s:6:\"pic_id\";s:1:\"3\";s:7:\"pic_img\";s:30:\"shop/editor/web-2-28-3.png?557\";}}','广告图片'),(29,2,'array','brand_list','a:8:{i:104;a:3:{s:8:\"brand_id\";s:3:\"104\";s:10:\"brand_name\";s:6:\"esprit\";s:9:\"brand_pic\";s:35:\"shop/brand/04398090828687339_sm.jpg\";}i:102;a:3:{s:8:\"brand_id\";s:3:\"102\";s:10:\"brand_name\";s:11:\"她他/tata\";s:9:\"brand_pic\";s:35:\"shop/brand/04398090459092275_sm.jpg\";}i:99;a:3:{s:8:\"brand_id\";s:2:\"99\";s:10:\"brand_name\";s:9:\"梦特娇\";s:9:\"brand_pic\";s:35:\"shop/brand/04398089942879365_sm.jpg\";}i:96;a:3:{s:8:\"brand_id\";s:2:\"96\";s:10:\"brand_name\";s:9:\"佐丹奴\";s:9:\"brand_pic\";s:35:\"shop/brand/04398089412399747_sm.jpg\";}i:90;a:3:{s:8:\"brand_id\";s:2:\"90\";s:10:\"brand_name\";s:9:\"金利来\";s:9:\"brand_pic\";s:35:\"shop/brand/04397473042647991_sm.jpg\";}i:84;a:3:{s:8:\"brand_id\";s:2:\"84\";s:10:\"brand_name\";s:12:\"阿迪达斯\";s:9:\"brand_pic\";s:35:\"shop/brand/04397471910652190_sm.jpg\";}i:85;a:3:{s:8:\"brand_id\";s:2:\"85\";s:10:\"brand_name\";s:6:\"猫人\";s:9:\"brand_pic\";s:35:\"shop/brand/04397472152849925_sm.jpg\";}i:95;a:3:{s:8:\"brand_id\";s:2:\"95\";s:10:\"brand_name\";s:6:\"李宁\";s:9:\"brand_pic\";s:35:\"shop/brand/04398089270610035_sm.jpg\";}}','品牌推荐'),(31,3,'array','tit','a:5:{s:3:\"pic\";s:0:\"\";s:3:\"url\";s:0:\"\";s:4:\"type\";s:3:\"txt\";s:5:\"floor\";s:2:\"3F\";s:5:\"title\";s:12:\"时尚鞋靴\";}','标题图片'),(32,3,'array','category_list','a:1:{s:11:\"goods_class\";a:13:{i:1160;a:2:{s:5:\"gc_id\";s:4:\"1160\";s:7:\"gc_name\";s:6:\"单鞋\";}i:1161;a:2:{s:5:\"gc_id\";s:4:\"1161\";s:7:\"gc_name\";s:9:\"平底鞋\";}i:1165;a:2:{s:5:\"gc_id\";s:4:\"1165\";s:7:\"gc_name\";s:9:\"帆布鞋\";}i:1425;a:2:{s:5:\"gc_id\";s:4:\"1425\";s:7:\"gc_name\";s:9:\"内增高\";}i:1428;a:2:{s:5:\"gc_id\";s:4:\"1428\";s:7:\"gc_name\";s:6:\"凉鞋\";}i:1472;a:2:{s:5:\"gc_id\";s:4:\"1472\";s:7:\"gc_name\";s:6:\"拖鞋\";}i:1175;a:2:{s:5:\"gc_id\";s:4:\"1175\";s:7:\"gc_name\";s:9:\"休闲鞋\";}i:1176;a:2:{s:5:\"gc_id\";s:4:\"1176\";s:7:\"gc_name\";s:9:\"正装鞋\";}i:1177;a:2:{s:5:\"gc_id\";s:4:\"1177\";s:7:\"gc_name\";s:9:\"商务鞋\";}i:1182;a:2:{s:5:\"gc_id\";s:4:\"1182\";s:7:\"gc_name\";s:6:\"板鞋\";}i:1534;a:2:{s:5:\"gc_id\";s:4:\"1534\";s:7:\"gc_name\";s:6:\"短靴\";}i:1536;a:2:{s:5:\"gc_id\";s:4:\"1536\";s:7:\"gc_name\";s:9:\"马丁靴\";}i:1549;a:2:{s:5:\"gc_id\";s:4:\"1549\";s:7:\"gc_name\";s:6:\"雨靴\";}}}','推荐分类'),(33,3,'array','act','a:4:{s:3:\"pic\";s:28:\"shop/editor/web-3-33.png?575\";s:4:\"type\";s:3:\"pic\";s:5:\"title\";s:0:\"\";s:3:\"url\";s:0:\"\";}','活动图片'),(35,3,'array','recommend_list','a:1:{i:1;a:2:{s:9:\"recommend\";a:1:{s:4:\"name\";s:12:\"商品推荐\";}s:8:\"pic_list\";a:9:{i:11;a:4:{s:6:\"pic_id\";s:2:\"11\";s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:77:\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index&amp;cate_id=1109\";s:7:\"pic_img\";s:33:\"shop/editor/web-3-35-1-11.jpg?136\";}i:12;a:4:{s:6:\"pic_id\";s:2:\"12\";s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:77:\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index&amp;cate_id=1109\";s:7:\"pic_img\";s:33:\"shop/editor/web-3-35-1-12.jpg?270\";}i:21;a:4:{s:6:\"pic_id\";s:2:\"21\";s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:7:\"pic_img\";s:33:\"shop/editor/web-3-35-1-21.jpg?361\";}i:24;a:4:{s:6:\"pic_id\";s:2:\"24\";s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:7:\"pic_img\";s:33:\"shop/editor/web-3-35-1-24.jpg?112\";}i:14;a:4:{s:6:\"pic_id\";s:2:\"14\";s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:7:\"pic_img\";s:33:\"shop/editor/web-3-35-1-14.jpg?395\";}i:31;a:4:{s:6:\"pic_id\";s:2:\"31\";s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:77:\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index&amp;cate_id=1109\";s:7:\"pic_img\";s:33:\"shop/editor/web-3-35-1-31.jpg?822\";}i:32;a:4:{s:6:\"pic_id\";s:2:\"32\";s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:77:\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index&amp;cate_id=1109\";s:7:\"pic_img\";s:33:\"shop/editor/web-3-35-1-32.jpg?894\";}i:33;a:4:{s:6:\"pic_id\";s:2:\"33\";s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:77:\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index&amp;cate_id=1109\";s:7:\"pic_img\";s:33:\"shop/editor/web-3-35-1-33.jpg?259\";}i:34;a:4:{s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:77:\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index&amp;cate_id=1109\";s:6:\"pic_id\";s:2:\"34\";s:7:\"pic_img\";s:33:\"shop/editor/web-3-35-1-34.jpg?192\";}}}}','商品推荐'),(38,3,'array','adv','a:3:{i:2;a:4:{s:6:\"pic_id\";s:1:\"2\";s:8:\"pic_name\";s:30:\"冬季新款骑士靴棉靴子\";s:7:\"pic_url\";s:77:\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index&amp;cate_id=1109\";s:7:\"pic_img\";s:30:\"shop/editor/web-3-38-2.png?328\";}i:3;a:4:{s:6:\"pic_id\";s:1:\"3\";s:8:\"pic_name\";s:27:\"时尚平底铆钉短靴子\";s:7:\"pic_url\";s:77:\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index&amp;cate_id=1109\";s:7:\"pic_img\";s:30:\"shop/editor/web-3-38-3.png?218\";}i:5;a:4:{s:8:\"pic_name\";s:36:\"新款粗跟圆头加绒短靴裸靴\";s:7:\"pic_url\";s:77:\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index&amp;cate_id=1109\";s:6:\"pic_id\";s:1:\"5\";s:7:\"pic_img\";s:30:\"shop/editor/web-3-38-5.png?708\";}}','广告图片'),(39,3,'array','brand_list','a:8:{i:105;a:3:{s:8:\"brand_id\";s:3:\"105\";s:10:\"brand_name\";s:8:\"westside\";s:9:\"brand_pic\";s:35:\"shop/brand/04398090975832253_sm.jpg\";}i:104;a:3:{s:8:\"brand_id\";s:3:\"104\";s:10:\"brand_name\";s:6:\"esprit\";s:9:\"brand_pic\";s:35:\"shop/brand/04398090828687339_sm.jpg\";}i:103;a:3:{s:8:\"brand_id\";s:3:\"103\";s:10:\"brand_name\";s:9:\"ELLE HOME\";s:9:\"brand_pic\";s:35:\"shop/brand/04398090611386532_sm.jpg\";}i:102;a:3:{s:8:\"brand_id\";s:3:\"102\";s:10:\"brand_name\";s:11:\"她他/tata\";s:9:\"brand_pic\";s:35:\"shop/brand/04398090459092275_sm.jpg\";}i:101;a:3:{s:8:\"brand_id\";s:3:\"101\";s:10:\"brand_name\";s:6:\"爱帝\";s:9:\"brand_pic\";s:35:\"shop/brand/04398090218578648_sm.jpg\";}i:98;a:3:{s:8:\"brand_id\";s:2:\"98\";s:10:\"brand_name\";s:12:\"斯波帝卡\";s:9:\"brand_pic\";s:35:\"shop/brand/04398089726299223_sm.jpg\";}i:97;a:3:{s:8:\"brand_id\";s:2:\"97\";s:10:\"brand_name\";s:9:\"百思图\";s:9:\"brand_pic\";s:35:\"shop/brand/04398089574801901_sm.jpg\";}i:100;a:3:{s:8:\"brand_id\";s:3:\"100\";s:10:\"brand_name\";s:6:\"宝姿\";s:9:\"brand_pic\";s:35:\"shop/brand/04398090061006740_sm.jpg\";}}','品牌推荐'),(41,4,'array','tit','a:5:{s:3:\"pic\";s:0:\"\";s:3:\"url\";s:0:\"\";s:4:\"type\";s:3:\"txt\";s:5:\"floor\";s:2:\"4F\";s:5:\"title\";s:12:\"美妆护肤\";}','标题图片'),(42,4,'array','category_list','a:1:{s:11:\"goods_class\";a:12:{i:1183;a:2:{s:5:\"gc_id\";s:4:\"1183\";s:7:\"gc_name\";s:6:\"洁面\";}i:1184;a:2:{s:5:\"gc_id\";s:4:\"1184\";s:7:\"gc_name\";s:6:\"面膜\";}i:1185;a:2:{s:5:\"gc_id\";s:4:\"1185\";s:7:\"gc_name\";s:9:\"化妆水\";}i:1186;a:2:{s:5:\"gc_id\";s:4:\"1186\";s:7:\"gc_name\";s:6:\"精华\";}i:1187;a:2:{s:5:\"gc_id\";s:4:\"1187\";s:7:\"gc_name\";s:6:\"乳液\";}i:1188;a:2:{s:5:\"gc_id\";s:4:\"1188\";s:7:\"gc_name\";s:6:\"面霜\";}i:1189;a:2:{s:5:\"gc_id\";s:4:\"1189\";s:7:\"gc_name\";s:6:\"眼霜\";}i:1498;a:2:{s:5:\"gc_id\";s:4:\"1498\";s:7:\"gc_name\";s:6:\"防晒\";}i:1501;a:2:{s:5:\"gc_id\";s:4:\"1501\";s:7:\"gc_name\";s:12:\"护肤套装\";}i:1225;a:2:{s:5:\"gc_id\";s:4:\"1225\";s:7:\"gc_name\";s:6:\"卸妆\";}i:1227;a:2:{s:5:\"gc_id\";s:4:\"1227\";s:7:\"gc_name\";s:5:\"BB霜\";}i:1508;a:2:{s:5:\"gc_id\";s:4:\"1508\";s:7:\"gc_name\";s:12:\"彩妆套装\";}}}','推荐分类'),(43,4,'array','act','a:4:{s:3:\"pic\";s:28:\"shop/editor/web-4-43.jpg?581\";s:4:\"type\";s:3:\"pic\";s:5:\"title\";s:0:\"\";s:3:\"url\";s:0:\"\";}','活动图片'),(45,4,'array','recommend_list','a:1:{i:2;a:2:{s:9:\"recommend\";a:1:{s:4:\"name\";s:12:\"商品推荐\";}s:8:\"pic_list\";a:9:{i:14;a:4:{s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:6:\"pic_id\";s:2:\"14\";s:7:\"pic_img\";s:33:\"shop/editor/web-4-45-2-14.png?467\";}i:11;a:4:{s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:6:\"pic_id\";s:2:\"11\";s:7:\"pic_img\";s:33:\"shop/editor/web-4-45-2-11.jpg?532\";}i:12;a:4:{s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:77:\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index&amp;cate_id=1109\";s:6:\"pic_id\";s:2:\"12\";s:7:\"pic_img\";s:33:\"shop/editor/web-4-45-2-12.jpg?965\";}i:21;a:4:{s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:6:\"pic_id\";s:2:\"21\";s:7:\"pic_img\";s:33:\"shop/editor/web-4-45-2-21.jpg?449\";}i:24;a:4:{s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:6:\"pic_id\";s:2:\"24\";s:7:\"pic_img\";s:33:\"shop/editor/web-4-45-2-24.jpg?629\";}i:31;a:4:{s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:6:\"pic_id\";s:2:\"31\";s:7:\"pic_img\";s:33:\"shop/editor/web-4-45-2-31.jpg?561\";}i:33;a:4:{s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:6:\"pic_id\";s:2:\"33\";s:7:\"pic_img\";s:33:\"shop/editor/web-4-45-2-33.jpg?573\";}i:34;a:4:{s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:6:\"pic_id\";s:2:\"34\";s:7:\"pic_img\";s:33:\"shop/editor/web-4-45-2-34.jpg?625\";}i:32;a:4:{s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:6:\"pic_id\";s:2:\"32\";s:7:\"pic_img\";s:33:\"shop/editor/web-4-45-2-32.jpg?189\";}}}}','商品推荐'),(48,4,'array','adv','a:3:{i:1;a:4:{s:6:\"pic_id\";s:1:\"1\";s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:7:\"pic_img\";s:30:\"shop/editor/web-4-48-1.jpg?202\";}i:4;a:4:{s:6:\"pic_id\";s:1:\"4\";s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:7:\"pic_img\";s:30:\"shop/editor/web-4-48-4.jpg?901\";}i:2;a:4:{s:8:\"pic_name\";s:18:\"海飞丝洗发露\";s:7:\"pic_url\";s:77:\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index&amp;cate_id=1111\";s:6:\"pic_id\";s:1:\"2\";s:7:\"pic_img\";s:30:\"shop/editor/web-4-48-2.png?560\";}}','广告图片'),(49,4,'array','brand_list','a:7:{i:102;a:3:{s:8:\"brand_id\";s:3:\"102\";s:10:\"brand_name\";s:11:\"她他/tata\";s:9:\"brand_pic\";s:35:\"shop/brand/04398090459092275_sm.jpg\";}i:104;a:3:{s:8:\"brand_id\";s:3:\"104\";s:10:\"brand_name\";s:6:\"esprit\";s:9:\"brand_pic\";s:35:\"shop/brand/04398090828687339_sm.jpg\";}i:106;a:3:{s:8:\"brand_id\";s:3:\"106\";s:10:\"brand_name\";s:3:\"RDK\";s:9:\"brand_pic\";s:35:\"shop/brand/04398091763582415_sm.jpg\";}i:86;a:3:{s:8:\"brand_id\";s:2:\"86\";s:10:\"brand_name\";s:17:\"茵曼（INMAN）\";s:9:\"brand_pic\";s:35:\"shop/brand/04397472336312422_sm.jpg\";}i:88;a:3:{s:8:\"brand_id\";s:2:\"88\";s:10:\"brand_name\";s:6:\"缪诗\";s:9:\"brand_pic\";s:35:\"shop/brand/04397472716852803_sm.jpg\";}i:85;a:3:{s:8:\"brand_id\";s:2:\"85\";s:10:\"brand_name\";s:6:\"猫人\";s:9:\"brand_pic\";s:35:\"shop/brand/04397472152849925_sm.jpg\";}i:80;a:3:{s:8:\"brand_id\";s:2:\"80\";s:10:\"brand_name\";s:7:\"享爱.\";s:9:\"brand_pic\";s:35:\"shop/brand/04397468934349942_sm.jpg\";}}','品牌推荐'),(51,5,'array','tit','a:5:{s:3:\"pic\";s:0:\"\";s:3:\"url\";s:0:\"\";s:4:\"type\";s:3:\"txt\";s:5:\"floor\";s:2:\"5F\";s:5:\"title\";s:12:\"箱包皮具\";}','标题图片'),(52,5,'array','category_list','a:1:{s:11:\"goods_class\";a:13:{i:1195;a:2:{s:5:\"gc_id\";s:4:\"1195\";s:7:\"gc_name\";s:9:\"手提包\";}i:1196;a:2:{s:5:\"gc_id\";s:4:\"1196\";s:7:\"gc_name\";s:9:\"单肩包\";}i:1224;a:2:{s:5:\"gc_id\";s:4:\"1224\";s:7:\"gc_name\";s:9:\"双肩包\";}i:1304;a:2:{s:5:\"gc_id\";s:4:\"1304\";s:7:\"gc_name\";s:9:\"斜挎包\";}i:1198;a:2:{s:5:\"gc_id\";s:4:\"1198\";s:7:\"gc_name\";s:9:\"商务包\";}i:1311;a:2:{s:5:\"gc_id\";s:4:\"1311\";s:7:\"gc_name\";s:9:\"休闲包\";}i:1312;a:2:{s:5:\"gc_id\";s:4:\"1312\";s:7:\"gc_name\";s:9:\"公文包\";}i:1193;a:2:{s:5:\"gc_id\";s:4:\"1193\";s:7:\"gc_name\";s:12:\"女士钱包\";}i:1197;a:2:{s:5:\"gc_id\";s:4:\"1197\";s:7:\"gc_name\";s:12:\"男士钱包\";}i:1568;a:2:{s:5:\"gc_id\";s:4:\"1568\";s:7:\"gc_name\";s:9:\"旅行包\";}i:1322;a:2:{s:5:\"gc_id\";s:4:\"1322\";s:7:\"gc_name\";s:9:\"行李箱\";}i:1323;a:2:{s:5:\"gc_id\";s:4:\"1323\";s:7:\"gc_name\";s:9:\"拉杆箱\";}i:1324;a:2:{s:5:\"gc_id\";s:4:\"1324\";s:7:\"gc_name\";s:9:\"旅行箱\";}}}','推荐分类'),(53,5,'array','act','a:4:{s:3:\"pic\";s:28:\"shop/editor/web-5-53.png?994\";s:4:\"type\";s:3:\"pic\";s:5:\"title\";s:0:\"\";s:3:\"url\";s:0:\"\";}','活动图片'),(55,5,'array','recommend_list','a:1:{i:1;a:2:{s:9:\"recommend\";a:1:{s:4:\"name\";s:12:\"商品推荐\";}s:8:\"pic_list\";a:9:{i:14;a:4:{s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:6:\"pic_id\";s:2:\"14\";s:7:\"pic_img\";s:33:\"shop/editor/web-5-55-1-14.jpg?296\";}i:11;a:4:{s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:6:\"pic_id\";s:2:\"11\";s:7:\"pic_img\";s:33:\"shop/editor/web-5-55-1-11.jpg?978\";}i:12;a:4:{s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:6:\"pic_id\";s:2:\"12\";s:7:\"pic_img\";s:33:\"shop/editor/web-5-55-1-12.jpg?770\";}i:21;a:4:{s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:6:\"pic_id\";s:2:\"21\";s:7:\"pic_img\";s:33:\"shop/editor/web-5-55-1-21.jpg?364\";}i:24;a:4:{s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:6:\"pic_id\";s:2:\"24\";s:7:\"pic_img\";s:33:\"shop/editor/web-5-55-1-24.jpg?393\";}i:31;a:4:{s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:6:\"pic_id\";s:2:\"31\";s:7:\"pic_img\";s:33:\"shop/editor/web-5-55-1-31.jpg?165\";}i:32;a:4:{s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:6:\"pic_id\";s:2:\"32\";s:7:\"pic_img\";s:33:\"shop/editor/web-5-55-1-32.jpg?495\";}i:33;a:4:{s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:6:\"pic_id\";s:2:\"33\";s:7:\"pic_img\";s:33:\"shop/editor/web-5-55-1-33.jpg?687\";}i:34;a:4:{s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:6:\"pic_id\";s:2:\"34\";s:7:\"pic_img\";s:33:\"shop/editor/web-5-55-1-34.jpg?363\";}}}}','商品推荐'),(58,5,'array','adv','a:2:{i:1;a:4:{s:6:\"pic_id\";s:1:\"1\";s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:7:\"pic_img\";s:30:\"shop/editor/web-5-58-1.jpg?965\";}i:2;a:4:{s:6:\"pic_id\";s:1:\"2\";s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:7:\"pic_img\";s:30:\"shop/editor/web-5-58-2.jpg?837\";}}','广告图片'),(59,5,'array','brand_list','a:8:{i:366;a:3:{s:8:\"brand_id\";s:3:\"366\";s:10:\"brand_name\";s:9:\"摩伊拉\";s:9:\"brand_pic\";s:38:\"shop/brand/04847455077997907_small.png\";}i:93;a:3:{s:8:\"brand_id\";s:2:\"93\";s:10:\"brand_name\";s:6:\"百丽\";s:9:\"brand_pic\";s:35:\"shop/brand/04398088925179484_sm.png\";}i:96;a:3:{s:8:\"brand_id\";s:2:\"96\";s:10:\"brand_name\";s:9:\"佐丹奴\";s:9:\"brand_pic\";s:35:\"shop/brand/04398089412399747_sm.jpg\";}i:91;a:3:{s:8:\"brand_id\";s:2:\"91\";s:10:\"brand_name\";s:6:\"其乐\";s:9:\"brand_pic\";s:35:\"shop/brand/04397473331842699_sm.jpg\";}i:81;a:3:{s:8:\"brand_id\";s:2:\"81\";s:10:\"brand_name\";s:9:\"派丽蒙\";s:9:\"brand_pic\";s:35:\"shop/brand/04397469152627878_sm.jpg\";}i:83;a:3:{s:8:\"brand_id\";s:2:\"83\";s:10:\"brand_name\";s:9:\"秀秀美\";s:9:\"brand_pic\";s:35:\"shop/brand/04397471716977022_sm.jpg\";}i:80;a:3:{s:8:\"brand_id\";s:2:\"80\";s:10:\"brand_name\";s:7:\"享爱.\";s:9:\"brand_pic\";s:35:\"shop/brand/04397468934349942_sm.jpg\";}i:82;a:3:{s:8:\"brand_id\";s:2:\"82\";s:10:\"brand_name\";s:9:\"康妮雅\";s:9:\"brand_pic\";s:35:\"shop/brand/04397471448679692_sm.jpg\";}}','品牌推荐'),(61,6,'array','tit','a:5:{s:3:\"pic\";s:0:\"\";s:3:\"url\";s:0:\"\";s:4:\"type\";s:3:\"txt\";s:5:\"floor\";s:2:\"6F\";s:5:\"title\";s:12:\"运动户外\";}','标题图片'),(62,6,'array','category_list','a:1:{s:11:\"goods_class\";a:24:{i:1124;a:2:{s:5:\"gc_id\";s:4:\"1124\";s:7:\"gc_name\";s:9:\"运动鞋\";}i:1125;a:2:{s:5:\"gc_id\";s:4:\"1125\";s:7:\"gc_name\";s:9:\"运动服\";}i:1408;a:2:{s:5:\"gc_id\";s:4:\"1408\";s:7:\"gc_name\";s:9:\"户外鞋\";}i:1474;a:2:{s:5:\"gc_id\";s:4:\"1474\";s:7:\"gc_name\";s:9:\"户外服\";}i:1475;a:2:{s:5:\"gc_id\";s:4:\"1475\";s:7:\"gc_name\";s:12:\"冲锋衣裤\";}i:1476;a:2:{s:5:\"gc_id\";s:4:\"1476\";s:7:\"gc_name\";s:12:\"速干衣裤\";}i:1477;a:2:{s:5:\"gc_id\";s:4:\"1477\";s:7:\"gc_name\";s:12:\"抓绒衣裤\";}i:1478;a:2:{s:5:\"gc_id\";s:4:\"1478\";s:7:\"gc_name\";s:12:\"软壳衣裤\";}i:1479;a:2:{s:5:\"gc_id\";s:4:\"1479\";s:7:\"gc_name\";s:4:\"T恤\";}i:1481;a:2:{s:5:\"gc_id\";s:4:\"1481\";s:7:\"gc_name\";s:9:\"滑雪服\";}i:1482;a:2:{s:5:\"gc_id\";s:4:\"1482\";s:7:\"gc_name\";s:12:\"功能内衣\";}i:1220;a:2:{s:5:\"gc_id\";s:4:\"1220\";s:7:\"gc_name\";s:4:\"T恤\";}i:1221;a:2:{s:5:\"gc_id\";s:4:\"1221\";s:7:\"gc_name\";s:6:\"卫衣\";}i:1222;a:2:{s:5:\"gc_id\";s:4:\"1222\";s:7:\"gc_name\";s:9:\"运动裤\";}i:1223;a:2:{s:5:\"gc_id\";s:4:\"1223\";s:7:\"gc_name\";s:12:\"运动套装\";}i:1331;a:2:{s:5:\"gc_id\";s:4:\"1331\";s:7:\"gc_name\";s:9:\"足球服\";}i:1332;a:2:{s:5:\"gc_id\";s:4:\"1332\";s:7:\"gc_name\";s:9:\"篮球服\";}i:1333;a:2:{s:5:\"gc_id\";s:4:\"1333\";s:7:\"gc_name\";s:12:\"风衣夹克\";}i:1334;a:2:{s:5:\"gc_id\";s:4:\"1334\";s:7:\"gc_name\";s:9:\"网羽服\";}i:1335;a:2:{s:5:\"gc_id\";s:4:\"1335\";s:7:\"gc_name\";s:9:\"棒球服\";}i:1415;a:2:{s:5:\"gc_id\";s:4:\"1415\";s:7:\"gc_name\";s:9:\"训练服\";}i:1416;a:2:{s:5:\"gc_id\";s:4:\"1416\";s:7:\"gc_name\";s:9:\"运动帽\";}i:1563;a:2:{s:5:\"gc_id\";s:4:\"1563\";s:7:\"gc_name\";s:12:\"运动手套\";}i:1564;a:2:{s:5:\"gc_id\";s:4:\"1564\";s:7:\"gc_name\";s:9:\"运动袜\";}}}','活动图片'),(63,6,'array','act','a:4:{s:3:\"pic\";s:28:\"shop/editor/web-6-63.png?949\";s:4:\"type\";s:3:\"pic\";s:5:\"title\";s:0:\"\";s:3:\"url\";s:0:\"\";}','活动图片'),(65,6,'array','recommend_list','a:1:{i:1;a:2:{s:9:\"recommend\";a:1:{s:4:\"name\";s:12:\"商品推荐\";}s:8:\"pic_list\";a:9:{i:14;a:4:{s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:6:\"pic_id\";s:2:\"14\";s:7:\"pic_img\";s:33:\"shop/editor/web-6-65-1-14.jpg?840\";}i:11;a:4:{s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:6:\"pic_id\";s:2:\"11\";s:7:\"pic_img\";s:33:\"shop/editor/web-6-65-1-11.jpg?387\";}i:12;a:4:{s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:6:\"pic_id\";s:2:\"12\";s:7:\"pic_img\";s:33:\"shop/editor/web-6-65-1-12.jpg?513\";}i:21;a:4:{s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:6:\"pic_id\";s:2:\"21\";s:7:\"pic_img\";s:33:\"shop/editor/web-6-65-1-21.jpg?996\";}i:24;a:4:{s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:6:\"pic_id\";s:2:\"24\";s:7:\"pic_img\";s:33:\"shop/editor/web-6-65-1-24.jpg?314\";}i:31;a:4:{s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:6:\"pic_id\";s:2:\"31\";s:7:\"pic_img\";s:33:\"shop/editor/web-6-65-1-31.png?563\";}i:34;a:4:{s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:6:\"pic_id\";s:2:\"34\";s:7:\"pic_img\";s:33:\"shop/editor/web-6-65-1-34.jpg?793\";}i:33;a:4:{s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:6:\"pic_id\";s:2:\"33\";s:7:\"pic_img\";s:33:\"shop/editor/web-6-65-1-33.jpg?841\";}i:32;a:4:{s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:6:\"pic_id\";s:2:\"32\";s:7:\"pic_img\";s:33:\"shop/editor/web-6-65-1-32.png?804\";}}}}','商品推荐'),(68,6,'array','adv','a:2:{i:1;a:4:{s:6:\"pic_id\";s:1:\"1\";s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:60:\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index\";s:7:\"pic_img\";s:30:\"shop/editor/web-6-68-1.png?180\";}i:2;a:4:{s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:77:\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index&amp;cate_id=1100\";s:6:\"pic_id\";s:1:\"2\";s:7:\"pic_img\";s:30:\"shop/editor/web-6-68-2.png?492\";}}','广告图片'),(69,6,'array','brand_list','a:7:{i:106;a:3:{s:8:\"brand_id\";s:3:\"106\";s:10:\"brand_name\";s:3:\"RDK\";s:9:\"brand_pic\";s:35:\"shop/brand/04398091763582415_sm.jpg\";}i:105;a:3:{s:8:\"brand_id\";s:3:\"105\";s:10:\"brand_name\";s:8:\"westside\";s:9:\"brand_pic\";s:35:\"shop/brand/04398090975832253_sm.jpg\";}i:104;a:3:{s:8:\"brand_id\";s:3:\"104\";s:10:\"brand_name\";s:6:\"esprit\";s:9:\"brand_pic\";s:35:\"shop/brand/04398090828687339_sm.jpg\";}i:103;a:3:{s:8:\"brand_id\";s:3:\"103\";s:10:\"brand_name\";s:9:\"ELLE HOME\";s:9:\"brand_pic\";s:35:\"shop/brand/04398090611386532_sm.jpg\";}i:100;a:3:{s:8:\"brand_id\";s:3:\"100\";s:10:\"brand_name\";s:6:\"宝姿\";s:9:\"brand_pic\";s:35:\"shop/brand/04398090061006740_sm.jpg\";}i:98;a:3:{s:8:\"brand_id\";s:2:\"98\";s:10:\"brand_name\";s:12:\"斯波帝卡\";s:9:\"brand_pic\";s:35:\"shop/brand/04398089726299223_sm.jpg\";}i:81;a:3:{s:8:\"brand_id\";s:2:\"81\";s:10:\"brand_name\";s:9:\"派丽蒙\";s:9:\"brand_pic\";s:35:\"shop/brand/04397469152627878_sm.jpg\";}}','品牌推荐'),(71,7,'array','tit','a:5:{s:3:\"pic\";s:0:\"\";s:3:\"url\";s:0:\"\";s:4:\"type\";s:3:\"txt\";s:5:\"floor\";s:2:\"7F\";s:5:\"title\";s:12:\"礼品配饰\";}','标题图片'),(72,7,'array','category_list','a:1:{s:11:\"goods_class\";a:21:{i:1203;a:2:{s:5:\"gc_id\";s:4:\"1203\";s:7:\"gc_name\";s:6:\"项链\";}i:1204;a:2:{s:5:\"gc_id\";s:4:\"1204\";s:7:\"gc_name\";s:6:\"戒指\";}i:1205;a:2:{s:5:\"gc_id\";s:4:\"1205\";s:7:\"gc_name\";s:6:\"手镯\";}i:1206;a:2:{s:5:\"gc_id\";s:4:\"1206\";s:7:\"gc_name\";s:6:\"耳饰\";}i:1207;a:2:{s:5:\"gc_id\";s:4:\"1207\";s:7:\"gc_name\";s:6:\"发饰\";}i:1208;a:2:{s:5:\"gc_id\";s:4:\"1208\";s:7:\"gc_name\";s:6:\"手链\";}i:1209;a:2:{s:5:\"gc_id\";s:4:\"1209\";s:7:\"gc_name\";s:9:\"锁骨链\";}i:1210;a:2:{s:5:\"gc_id\";s:4:\"1210\";s:7:\"gc_name\";s:6:\"佛珠\";}i:1211;a:2:{s:5:\"gc_id\";s:4:\"1211\";s:7:\"gc_name\";s:9:\"转运珠\";}i:1212;a:2:{s:5:\"gc_id\";s:4:\"1212\";s:7:\"gc_name\";s:9:\"太阳镜\";}i:1422;a:2:{s:5:\"gc_id\";s:4:\"1422\";s:7:\"gc_name\";s:9:\"护目镜\";}i:1999;a:2:{s:5:\"gc_id\";s:4:\"1999\";s:7:\"gc_name\";s:12:\"情侣饰品\";}i:1213;a:2:{s:5:\"gc_id\";s:4:\"1213\";s:7:\"gc_name\";s:9:\"机械表\";}i:1214;a:2:{s:5:\"gc_id\";s:4:\"1214\";s:7:\"gc_name\";s:9:\"电子表\";}i:1215;a:2:{s:5:\"gc_id\";s:4:\"1215\";s:7:\"gc_name\";s:9:\"石英表\";}i:1336;a:2:{s:5:\"gc_id\";s:4:\"1336\";s:7:\"gc_name\";s:9:\"时装表\";}i:1337;a:2:{s:5:\"gc_id\";s:4:\"1337\";s:7:\"gc_name\";s:9:\"学生表\";}i:1338;a:2:{s:5:\"gc_id\";s:4:\"1338\";s:7:\"gc_name\";s:9:\"运动表\";}i:1339;a:2:{s:5:\"gc_id\";s:4:\"1339\";s:7:\"gc_name\";s:9:\"儿童表\";}i:1340;a:2:{s:5:\"gc_id\";s:4:\"1340\";s:7:\"gc_name\";s:9:\"防水表\";}i:1341;a:2:{s:5:\"gc_id\";s:4:\"1341\";s:7:\"gc_name\";s:9:\"情侣表\";}}}','推荐分类'),(73,7,'array','act','a:4:{s:3:\"pic\";s:28:\"shop/editor/web-7-73.png?848\";s:4:\"type\";s:3:\"pic\";s:5:\"title\";s:0:\"\";s:3:\"url\";s:77:\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index&amp;cate_id=1114\";}','活动图片'),(75,7,'array','recommend_list','a:1:{i:1;a:2:{s:9:\"recommend\";a:1:{s:4:\"name\";s:12:\"商品推荐\";}s:8:\"pic_list\";a:9:{i:14;a:4:{s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:6:\"pic_id\";s:2:\"14\";s:7:\"pic_img\";s:33:\"shop/editor/web-7-75-1-14.jpg?249\";}i:11;a:4:{s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:6:\"pic_id\";s:2:\"11\";s:7:\"pic_img\";s:33:\"shop/editor/web-7-75-1-11.jpg?585\";}i:21;a:4:{s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:6:\"pic_id\";s:2:\"21\";s:7:\"pic_img\";s:33:\"shop/editor/web-7-75-1-21.jpg?331\";}i:24;a:4:{s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:6:\"pic_id\";s:2:\"24\";s:7:\"pic_img\";s:33:\"shop/editor/web-7-75-1-24.jpg?551\";}i:12;a:4:{s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:6:\"pic_id\";s:2:\"12\";s:7:\"pic_img\";s:33:\"shop/editor/web-7-75-1-12.jpg?181\";}i:31;a:4:{s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:6:\"pic_id\";s:2:\"31\";s:7:\"pic_img\";s:33:\"shop/editor/web-7-75-1-31.png?392\";}i:32;a:4:{s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:6:\"pic_id\";s:2:\"32\";s:7:\"pic_img\";s:33:\"shop/editor/web-7-75-1-32.jpg?806\";}i:33;a:4:{s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:6:\"pic_id\";s:2:\"33\";s:7:\"pic_img\";s:33:\"shop/editor/web-7-75-1-33.png?752\";}i:34;a:4:{s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:6:\"pic_id\";s:2:\"34\";s:7:\"pic_img\";s:33:\"shop/editor/web-7-75-1-34.jpg?541\";}}}}','商品推荐'),(78,7,'array','adv','a:2:{i:1;a:4:{s:8:\"pic_name\";s:18:\"七度银饰专场\";s:7:\"pic_url\";s:60:\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index\";s:6:\"pic_id\";s:1:\"1\";s:7:\"pic_img\";s:30:\"shop/editor/web-7-78-1.jpg?446\";}i:2;a:4:{s:6:\"pic_id\";s:1:\"2\";s:8:\"pic_name\";s:18:\"七度银饰专场\";s:7:\"pic_url\";s:79:\"http://demo.33hao.com/shop/index.php?act=goods&amp;op=index&amp;goods_id=102126\";s:7:\"pic_img\";s:30:\"shop/editor/web-7-78-2.png?182\";}}','广告图片'),(79,7,'array','brand_list','a:6:{i:106;a:3:{s:8:\"brand_id\";s:3:\"106\";s:10:\"brand_name\";s:3:\"RDK\";s:9:\"brand_pic\";s:35:\"shop/brand/04398091763582415_sm.jpg\";}i:105;a:3:{s:8:\"brand_id\";s:3:\"105\";s:10:\"brand_name\";s:8:\"westside\";s:9:\"brand_pic\";s:35:\"shop/brand/04398090975832253_sm.jpg\";}i:365;a:3:{s:8:\"brand_id\";s:3:\"365\";s:10:\"brand_name\";s:6:\"柒牌\";s:9:\"brand_pic\";s:38:\"shop/brand/04820158988380844_small.png\";}i:87;a:3:{s:8:\"brand_id\";s:2:\"87\";s:10:\"brand_name\";s:11:\"Hanes恒适\";s:9:\"brand_pic\";s:35:\"shop/brand/04397472577467506_sm.jpg\";}i:88;a:3:{s:8:\"brand_id\";s:2:\"88\";s:10:\"brand_name\";s:6:\"缪诗\";s:9:\"brand_pic\";s:35:\"shop/brand/04397472716852803_sm.jpg\";}i:90;a:3:{s:8:\"brand_id\";s:2:\"90\";s:10:\"brand_name\";s:9:\"金利来\";s:9:\"brand_pic\";s:35:\"shop/brand/04397473042647991_sm.jpg\";}}','品牌推荐'),(81,8,'array','tit','a:5:{s:3:\"pic\";s:0:\"\";s:3:\"url\";s:0:\"\";s:4:\"type\";s:3:\"txt\";s:5:\"floor\";s:2:\"8F\";s:5:\"title\";s:12:\"生活家居\";}','标题图片'),(82,8,'array','category_list','a:1:{s:11:\"goods_class\";a:15:{i:1234;a:2:{s:5:\"gc_id\";s:4:\"1234\";s:7:\"gc_name\";s:9:\"四件套\";}i:1235;a:2:{s:5:\"gc_id\";s:4:\"1235\";s:7:\"gc_name\";s:13:\"被子/被套\";}i:1236;a:2:{s:5:\"gc_id\";s:4:\"1236\";s:7:\"gc_name\";s:13:\"枕头/枕套\";}i:1419;a:2:{s:5:\"gc_id\";s:4:\"1419\";s:7:\"gc_name\";s:6:\"公仔\";}i:1421;a:2:{s:5:\"gc_id\";s:4:\"1421\";s:7:\"gc_name\";s:13:\"凉席/凉枕\";}i:1858;a:2:{s:5:\"gc_id\";s:4:\"1858\";s:7:\"gc_name\";s:16:\"手工/十字绣\";}i:1240;a:2:{s:5:\"gc_id\";s:4:\"1240\";s:7:\"gc_name\";s:12:\"工艺摆件\";}i:1241;a:2:{s:5:\"gc_id\";s:4:\"1241\";s:7:\"gc_name\";s:13:\"花瓶/花器\";}i:1242;a:2:{s:5:\"gc_id\";s:4:\"1242\";s:7:\"gc_name\";s:12:\"仿真花卉\";}i:1243;a:2:{s:5:\"gc_id\";s:4:\"1243\";s:7:\"gc_name\";s:9:\"装饰画\";}i:1352;a:2:{s:5:\"gc_id\";s:4:\"1352\";s:7:\"gc_name\";s:13:\"相架/画框\";}i:1353;a:2:{s:5:\"gc_id\";s:4:\"1353\";s:7:\"gc_name\";s:13:\"闹钟/挂钟\";}i:1354;a:2:{s:5:\"gc_id\";s:4:\"1354\";s:7:\"gc_name\";s:13:\"香薰/蜡烛\";}i:1355;a:2:{s:5:\"gc_id\";s:4:\"1355\";s:7:\"gc_name\";s:12:\"创意家居\";}i:1356;a:2:{s:5:\"gc_id\";s:4:\"1356\";s:7:\"gc_name\";s:12:\"办公用品\";}}}','推荐分类'),(83,8,'array','act','a:4:{s:3:\"pic\";s:28:\"shop/editor/web-8-83.png?171\";s:4:\"type\";s:3:\"pic\";s:5:\"title\";s:0:\"\";s:3:\"url\";s:77:\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index&amp;cate_id=1231\";}','活动图片'),(85,8,'array','recommend_list','a:1:{i:1;a:2:{s:9:\"recommend\";a:1:{s:4:\"name\";s:12:\"商品推荐\";}s:8:\"pic_list\";a:9:{i:14;a:4:{s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:6:\"pic_id\";s:2:\"14\";s:7:\"pic_img\";s:33:\"shop/editor/web-8-85-1-14.jpg?297\";}i:11;a:4:{s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:6:\"pic_id\";s:2:\"11\";s:7:\"pic_img\";s:33:\"shop/editor/web-8-85-1-11.jpg?195\";}i:12;a:4:{s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:6:\"pic_id\";s:2:\"12\";s:7:\"pic_img\";s:33:\"shop/editor/web-8-85-1-12.jpg?235\";}i:31;a:4:{s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:6:\"pic_id\";s:2:\"31\";s:7:\"pic_img\";s:33:\"shop/editor/web-8-85-1-31.jpg?634\";}i:32;a:4:{s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:6:\"pic_id\";s:2:\"32\";s:7:\"pic_img\";s:33:\"shop/editor/web-8-85-1-32.jpg?454\";}i:33;a:4:{s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:6:\"pic_id\";s:2:\"33\";s:7:\"pic_img\";s:33:\"shop/editor/web-8-85-1-33.jpg?689\";}i:34;a:4:{s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:6:\"pic_id\";s:2:\"34\";s:7:\"pic_img\";s:33:\"shop/editor/web-8-85-1-34.jpg?772\";}i:21;a:4:{s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:6:\"pic_id\";s:2:\"21\";s:7:\"pic_img\";s:33:\"shop/editor/web-8-85-1-21.jpg?151\";}i:24;a:4:{s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:6:\"pic_id\";s:2:\"24\";s:7:\"pic_img\";s:33:\"shop/editor/web-8-85-1-24.jpg?459\";}}}}','商品推荐'),(88,8,'array','adv','a:2:{i:2;a:4:{s:6:\"pic_id\";s:1:\"2\";s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:77:\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index&amp;cate_id=1109\";s:7:\"pic_img\";s:30:\"shop/editor/web-8-88-2.jpg?934\";}i:3;a:4:{s:6:\"pic_id\";s:1:\"3\";s:8:\"pic_name\";s:82:\"拉夏贝尔 秋新款女装街头人物印花休闲圆领长袖连衣裙 黑色 S\";s:7:\"pic_url\";s:79:\"http://demo.33hao.com/shop/index.php?act=goods&amp;op=index&amp;goods_id=102126\";s:7:\"pic_img\";s:30:\"shop/editor/web-8-88-3.jpg?885\";}}','广告图片'),(89,8,'array','brand_list','a:8:{i:104;a:3:{s:8:\"brand_id\";s:3:\"104\";s:10:\"brand_name\";s:6:\"esprit\";s:9:\"brand_pic\";s:35:\"shop/brand/04398090828687339_sm.jpg\";}i:103;a:3:{s:8:\"brand_id\";s:3:\"103\";s:10:\"brand_name\";s:9:\"ELLE HOME\";s:9:\"brand_pic\";s:35:\"shop/brand/04398090611386532_sm.jpg\";}i:105;a:3:{s:8:\"brand_id\";s:3:\"105\";s:10:\"brand_name\";s:8:\"westside\";s:9:\"brand_pic\";s:35:\"shop/brand/04398090975832253_sm.jpg\";}i:106;a:3:{s:8:\"brand_id\";s:3:\"106\";s:10:\"brand_name\";s:3:\"RDK\";s:9:\"brand_pic\";s:35:\"shop/brand/04398091763582415_sm.jpg\";}i:92;a:3:{s:8:\"brand_id\";s:2:\"92\";s:10:\"brand_name\";s:10:\"Newbalance\";s:9:\"brand_pic\";s:35:\"shop/brand/04397473633585549_sm.jpg\";}i:91;a:3:{s:8:\"brand_id\";s:2:\"91\";s:10:\"brand_name\";s:6:\"其乐\";s:9:\"brand_pic\";s:35:\"shop/brand/04397473331842699_sm.jpg\";}i:85;a:3:{s:8:\"brand_id\";s:2:\"85\";s:10:\"brand_name\";s:6:\"猫人\";s:9:\"brand_pic\";s:35:\"shop/brand/04397472152849925_sm.jpg\";}i:93;a:3:{s:8:\"brand_id\";s:2:\"93\";s:10:\"brand_name\";s:6:\"百丽\";s:9:\"brand_pic\";s:35:\"shop/brand/04398088925179484_sm.png\";}}','品牌推荐'),(101,101,'array','screen_list','a:4:{i:1;a:5:{s:6:\"pic_id\";s:1:\"1\";s:8:\"pic_name\";s:9:\"好商城\";s:7:\"pic_url\";s:77:\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index&amp;cate_id=1100\";s:5:\"color\";s:7:\"#EDD9C0\";s:7:\"pic_img\";s:33:\"shop/editor/web-101-101-1.png?177\";}i:2;a:5:{s:6:\"pic_id\";s:1:\"2\";s:8:\"pic_name\";s:9:\"好商城\";s:7:\"pic_url\";s:67:\"http://demo.33hao.com/shop/index.php?act=show_groupbuy&amp;op=index\";s:5:\"color\";s:7:\"#200772\";s:7:\"pic_img\";s:33:\"shop/editor/web-101-101-2.png?442\";}i:3;a:5:{s:6:\"pic_id\";s:1:\"3\";s:8:\"pic_name\";s:9:\"好商城\";s:7:\"pic_url\";s:67:\"http://demo.33hao.com/shop/index.php?act=show_groupbuy&amp;op=index\";s:5:\"color\";s:7:\"#EFE6DD\";s:7:\"pic_img\";s:33:\"shop/editor/web-101-101-3.png?983\";}i:4;a:5:{s:6:\"pic_id\";s:1:\"4\";s:8:\"pic_name\";s:9:\"好商城\";s:7:\"pic_url\";s:77:\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index&amp;cate_id=1100\";s:5:\"color\";s:7:\"#760907\";s:7:\"pic_img\";s:33:\"shop/editor/web-101-101-4.png?779\";}}','切换大图'),(102,101,'array','focus_list','a:3:{i:1;a:1:{s:8:\"pic_list\";a:4:{i:1;a:4:{s:6:\"pic_id\";s:1:\"1\";s:8:\"pic_name\";s:6:\"测试\";s:7:\"pic_url\";s:60:\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index\";s:7:\"pic_img\";s:35:\"shop/editor/web-101-102-1-1.jpg?306\";}i:2;a:4:{s:6:\"pic_id\";s:1:\"2\";s:8:\"pic_name\";s:6:\"测试\";s:7:\"pic_url\";s:60:\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index\";s:7:\"pic_img\";s:35:\"shop/editor/web-101-102-1-2.jpg?220\";}i:3;a:4:{s:6:\"pic_id\";s:1:\"3\";s:8:\"pic_name\";s:6:\"测试\";s:7:\"pic_url\";s:60:\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index\";s:7:\"pic_img\";s:35:\"shop/editor/web-101-102-1-3.jpg?296\";}i:4;a:4:{s:6:\"pic_id\";s:1:\"4\";s:8:\"pic_name\";s:6:\"测试\";s:7:\"pic_url\";s:60:\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index\";s:7:\"pic_img\";s:35:\"shop/editor/web-101-102-1-4.jpg?752\";}}}i:2;a:1:{s:8:\"pic_list\";a:4:{i:1;a:4:{s:6:\"pic_id\";s:1:\"1\";s:8:\"pic_name\";s:6:\"测试\";s:7:\"pic_url\";s:60:\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index\";s:7:\"pic_img\";s:35:\"shop/editor/web-101-102-2-1.jpg?718\";}i:2;a:4:{s:6:\"pic_id\";s:1:\"2\";s:8:\"pic_name\";s:6:\"测试\";s:7:\"pic_url\";s:60:\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index\";s:7:\"pic_img\";s:35:\"shop/editor/web-101-102-2-2.jpg?967\";}i:3;a:4:{s:6:\"pic_id\";s:1:\"3\";s:8:\"pic_name\";s:6:\"测试\";s:7:\"pic_url\";s:60:\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index\";s:7:\"pic_img\";s:35:\"shop/editor/web-101-102-2-3.jpg?477\";}i:4;a:4:{s:6:\"pic_id\";s:1:\"4\";s:8:\"pic_name\";s:6:\"测试\";s:7:\"pic_url\";s:60:\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index\";s:7:\"pic_img\";s:35:\"shop/editor/web-101-102-2-4.jpg?643\";}}}i:3;a:1:{s:8:\"pic_list\";a:4:{i:1;a:4:{s:6:\"pic_id\";s:1:\"1\";s:8:\"pic_name\";s:6:\"测试\";s:7:\"pic_url\";s:60:\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index\";s:7:\"pic_img\";s:35:\"shop/editor/web-101-102-3-1.jpg?970\";}i:2;a:4:{s:6:\"pic_id\";s:1:\"2\";s:8:\"pic_name\";s:6:\"测试\";s:7:\"pic_url\";s:60:\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index\";s:7:\"pic_img\";s:35:\"shop/editor/web-101-102-3-2.jpg?341\";}i:3;a:4:{s:6:\"pic_id\";s:1:\"3\";s:8:\"pic_name\";s:6:\"测试\";s:7:\"pic_url\";s:60:\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index\";s:7:\"pic_img\";s:35:\"shop/editor/web-101-102-3-3.jpg?480\";}i:4;a:4:{s:8:\"pic_name\";s:6:\"测试\";s:7:\"pic_url\";s:60:\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index\";s:6:\"pic_id\";s:1:\"4\";s:7:\"pic_img\";s:35:\"shop/editor/web-101-102-3-4.jpg?162\";}}}}','切换小图'),(121,121,'array','sale_list','a:5:{i:5;a:2:{s:9:\"recommend\";a:1:{s:4:\"name\";s:12:\"新品上架\";}s:10:\"goods_list\";a:5:{i:102592;a:5:{s:8:\"goods_id\";s:6:\"102592\";s:12:\"market_price\";s:0:\"\";s:10:\"goods_name\";s:82:\"爵爷商务皮鞋 秋款男士正装 前系带 金属尖头低帮单鞋 黑色 38\";s:11:\"goods_price\";s:6:\"108.00\";s:9:\"goods_pic\";s:48:\"shop/store/goods/16/16_05000683915287946_240.jpg\";}i:102700;a:5:{s:8:\"goods_id\";s:6:\"102700\";s:12:\"market_price\";s:0:\"\";s:10:\"goods_name\";s:79:\"纯色透气圆头单鞋男真皮方跟低帮鞋前系带男士皮鞋 棕色 38\";s:11:\"goods_price\";s:5:\"88.00\";s:9:\"goods_pic\";s:48:\"shop/store/goods/16/16_05003068354931461_240.jpg\";}i:102649;a:5:{s:8:\"goods_id\";s:6:\"102649\";s:12:\"market_price\";s:0:\"\";s:10:\"goods_name\";s:64:\"优质超纤皮男鞋纯色前系带尖头低帮皮鞋 棕色 38\";s:11:\"goods_price\";s:6:\"108.00\";s:9:\"goods_pic\";s:48:\"shop/store/goods/16/16_05002911543965426_240.jpg\";}i:102688;a:5:{s:8:\"goods_id\";s:6:\"102688\";s:12:\"market_price\";s:0:\"\";s:10:\"goods_name\";s:71:\"爵爷2015春秋商务正装男士皮鞋透气超纤皮男鞋 黑色 38\";s:11:\"goods_price\";s:6:\"108.00\";s:9:\"goods_pic\";s:48:\"shop/store/goods/16/16_05003062100708546_240.jpg\";}i:102604;a:5:{s:8:\"goods_id\";s:6:\"102604\";s:12:\"market_price\";s:6:\"168.00\";s:10:\"goods_name\";s:70:\"日常休闲鞋男士豆豆鞋驾车真皮男鞋英伦皮鞋 黄色 38\";s:11:\"goods_price\";s:6:\"108.00\";s:9:\"goods_pic\";s:48:\"shop/store/goods/16/16_05001210537684207_240.jpg\";}}}i:3;a:2:{s:9:\"recommend\";a:1:{s:4:\"name\";s:12:\"热卖商品\";}s:10:\"goods_list\";a:5:{i:102020;a:5:{s:8:\"goods_id\";s:6:\"102020\";s:12:\"market_price\";s:0:\"\";s:10:\"goods_name\";s:77:\"冬装男装立领 男式纯棉T恤男士加厚加绒保暖打底衫 白色 M\";s:11:\"goods_price\";s:5:\"73.00\";s:9:\"goods_pic\";s:48:\"shop/store/goods/15/15_04999727187217105_240.png\";}i:102165;a:5:{s:8:\"goods_id\";s:6:\"102165\";s:12:\"market_price\";s:0:\"\";s:10:\"goods_name\";s:89:\"2015秋新款男装男式牛仔裤男休闲商务长裤子韩版修身直筒 图片色 28\";s:11:\"goods_price\";s:5:\"81.00\";s:9:\"goods_pic\";s:48:\"shop/store/goods/15/15_04999963827312369_240.jpg\";}i:102126;a:5:{s:8:\"goods_id\";s:6:\"102126\";s:12:\"market_price\";s:6:\"163.00\";s:10:\"goods_name\";s:91:\"2015秋冬新款韩版女羽绒棉服女立领修身显瘦棉衣短款棉服外套 红色 L\";s:11:\"goods_price\";s:6:\"103.00\";s:9:\"goods_pic\";s:48:\"shop/store/goods/12/12_04999931964380007_240.jpg\";}i:102070;a:5:{s:8:\"goods_id\";s:6:\"102070\";s:12:\"market_price\";s:6:\"188.00\";s:10:\"goods_name\";s:97:\"新款女装韩版修身A字斗篷棉衣加厚保暖短外套大毛领连帽羽绒棉服 蓝色 M\";s:11:\"goods_price\";s:6:\"118.00\";s:9:\"goods_pic\";s:48:\"shop/store/goods/12/12_04999920485539383_240.jpg\";}i:101680;a:5:{s:8:\"goods_id\";s:6:\"101680\";s:12:\"market_price\";s:6:\"162.00\";s:10:\"goods_name\";s:82:\"2015秋冬新款女装女式韩版修身短款棉衣棉服羽绒棉衣女 粉色 M\";s:11:\"goods_price\";s:6:\"112.00\";s:9:\"goods_pic\";s:48:\"shop/store/goods/12/12_04999938698283696_240.png\";}}}i:1;a:2:{s:9:\"recommend\";a:1:{s:4:\"name\";s:12:\"疯狂抢购\";}s:10:\"goods_list\";a:5:{i:101559;a:5:{s:8:\"goods_id\";s:6:\"101559\";s:12:\"market_price\";s:6:\"118.00\";s:10:\"goods_name\";s:97:\"2015冬季新款棉衣女修身大码羽绒棉服女士短款韩版连帽冬季防寒服 蓝色 M\";s:11:\"goods_price\";s:5:\"88.00\";s:9:\"goods_pic\";s:62:\"shop/store/goods/12/12_039f2d0f136e6927e9cfa6fff35e077_240.jpg\";}i:101598;a:5:{s:8:\"goods_id\";s:6:\"101598\";s:12:\"market_price\";s:6:\"169.00\";s:10:\"goods_name\";s:97:\"2015新款冬装棉衣外套女中长款大码加厚毛领羽绒棉服韩版修身棉袄 粉色 M\";s:11:\"goods_price\";s:6:\"119.00\";s:9:\"goods_pic\";s:62:\"shop/store/goods/12/12_cc322b39c176a5ae261b62795d46258_240.jpg\";}i:101429;a:5:{s:8:\"goods_id\";s:6:\"101429\";s:12:\"market_price\";s:6:\"138.00\";s:10:\"goods_name\";s:89:\"2015夏季新款鱼嘴凉鞋超高跟防水台夜店鞋透气网纱粗跟女鞋 粉色 34\";s:11:\"goods_price\";s:6:\"108.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/6/6_04847714326505496_240.jpg\";}i:102433;a:5:{s:8:\"goods_id\";s:6:\"102433\";s:12:\"market_price\";s:6:\"199.00\";s:10:\"goods_name\";s:99:\"秋冬季时尚单鞋 糖果色亮面浅口细跟职业女鞋 漆皮镜面尖头高跟鞋 白色 34\";s:11:\"goods_price\";s:6:\"119.00\";s:9:\"goods_pic\";s:48:\"shop/store/goods/17/17_05000574018138552_240.jpg\";}i:102265;a:5:{s:8:\"goods_id\";s:6:\"102265\";s:12:\"market_price\";s:6:\"199.00\";s:10:\"goods_name\";s:71:\"秋季新款糖果色细跟单鞋 浅口真皮尖头高跟鞋 杏色 34\";s:11:\"goods_price\";s:6:\"119.00\";s:9:\"goods_pic\";s:48:\"shop/store/goods/17/17_05000548082598798_240.jpg\";}}}i:2;a:2:{s:9:\"recommend\";a:1:{s:4:\"name\";s:12:\"猜您喜欢\";}s:10:\"goods_list\";a:5:{i:102865;a:5:{s:8:\"goods_id\";s:6:\"102865\";s:12:\"market_price\";s:6:\"188.00\";s:10:\"goods_name\";s:83:\"酷迪璐新品男式夹克外套男士pu皮衣韩版休闲绒布接男装 蓝色 M\";s:11:\"goods_price\";s:6:\"128.00\";s:9:\"goods_pic\";s:48:\"shop/store/goods/18/18_05011806114146918_240.jpg\";}i:102835;a:5:{s:8:\"goods_id\";s:6:\"102835\";s:12:\"market_price\";s:6:\"198.00\";s:10:\"goods_name\";s:43:\"2015新款保暖加绒修身衬衫 白色 M\";s:11:\"goods_price\";s:5:\"98.00\";s:9:\"goods_pic\";s:48:\"shop/store/goods/18/18_05011800162520471_240.jpg\";}i:102805;a:5:{s:8:\"goods_id\";s:6:\"102805\";s:12:\"market_price\";s:6:\"198.00\";s:10:\"goods_name\";s:72:\"酷迪璐冬装男士加棉加厚长袖衬衫格子夹克衬衫 灰色 M\";s:11:\"goods_price\";s:6:\"108.00\";s:9:\"goods_pic\";s:48:\"shop/store/goods/18/18_05011789584196803_240.jpg\";}i:102751;a:5:{s:8:\"goods_id\";s:6:\"102751\";s:12:\"market_price\";s:6:\"308.00\";s:10:\"goods_name\";s:85:\"2015新款秋冬男式PU皮夹克外贸 海宁男士立领休闲修身外套 黑色 M\";s:11:\"goods_price\";s:6:\"158.00\";s:9:\"goods_pic\";s:48:\"shop/store/goods/18/18_05011764627052815_240.jpg\";}i:102633;a:5:{s:8:\"goods_id\";s:6:\"102633\";s:12:\"market_price\";s:6:\"139.00\";s:10:\"goods_name\";s:60:\"2015秋冬新款 全棉男式牛仔裤直筒型 图片色 28\";s:11:\"goods_price\";s:5:\"89.00\";s:9:\"goods_pic\";s:48:\"shop/store/goods/15/15_05002060806639307_240.jpg\";}}}i:4;a:2:{s:9:\"recommend\";a:1:{s:4:\"name\";s:12:\"热评商品\";}s:10:\"goods_list\";a:5:{i:102150;a:5:{s:8:\"goods_id\";s:6:\"102150\";s:12:\"market_price\";s:6:\"132.00\";s:10:\"goods_name\";s:80:\"韩版品牌直筒修身牛仔裤 秋冬男士长裤休闲牛仔裤 图片色 28\";s:11:\"goods_price\";s:5:\"82.00\";s:9:\"goods_pic\";s:48:\"shop/store/goods/15/15_04999958412070501_240.jpg\";}i:102005;a:5:{s:8:\"goods_id\";s:6:\"102005\";s:12:\"market_price\";s:6:\"129.00\";s:10:\"goods_name\";s:77:\"冬装男装爆款 男式纯棉T恤男士加厚加绒保暖打底衫 黑色 M\";s:11:\"goods_price\";s:5:\"69.00\";s:9:\"goods_pic\";s:48:\"shop/store/goods/15/15_04999724012252809_240.jpg\";}i:101930;a:5:{s:8:\"goods_id\";s:6:\"101930\";s:12:\"market_price\";s:6:\"125.00\";s:10:\"goods_name\";s:85:\"2015冬款新品 男式拼接长袖加厚加绒保暖V领T恤男装不倒绒 酒红 M\";s:11:\"goods_price\";s:5:\"65.00\";s:9:\"goods_pic\";s:48:\"shop/store/goods/15/15_04999707884947293_240.jpg\";}i:101807;a:5:{s:8:\"goods_id\";s:6:\"101807\";s:12:\"market_price\";s:6:\"135.00\";s:10:\"goods_name\";s:101:\"2015秋季新款男士长袖t恤潮纯棉秋长袖修身韩版青年体恤运动小衫 白拼枣红 M\";s:11:\"goods_price\";s:5:\"65.00\";s:9:\"goods_pic\";s:48:\"shop/store/goods/15/15_04999618551849829_240.jpg\";}i:102157;a:5:{s:8:\"goods_id\";s:6:\"102157\";s:12:\"market_price\";s:6:\"159.00\";s:10:\"goods_name\";s:67:\"品牌男装牛仔裤纯棉商务男裤男式牛仔裤 图片色 28\";s:11:\"goods_price\";s:5:\"89.00\";s:9:\"goods_pic\";s:48:\"shop/store/goods/15/15_04999961053663021_240.jpg\";}}}}','促销区'),(122,1,'array','banner','a:5:{s:3:\"pic\";s:29:\"shop/editor/web-1-122.png?883\";s:4:\"type\";s:3:\"pic\";s:5:\"title\";s:7:\"广告1\";s:3:\"url\";s:20:\"http://www.33hao.com\";s:4:\"show\";s:1:\"1\";}','横幅图片'),(123,2,'array','banner','a:4:{s:3:\"pic\";s:29:\"shop/editor/web-2-123.png?872\";s:4:\"type\";s:3:\"pic\";s:5:\"title\";s:9:\"好商城\";s:3:\"url\";s:20:\"http://www.33hao.com\";}','横幅图片'),(124,3,'array','banner','a:5:{s:3:\"pic\";s:29:\"shop/editor/web-3-124.png?997\";s:4:\"type\";s:3:\"pic\";s:5:\"title\";s:9:\"好商城\";s:3:\"url\";s:19:\"http://ww.33hao.com\";s:4:\"show\";s:1:\"1\";}','横幅图片'),(125,4,'array','banner','a:5:{s:3:\"pic\";s:29:\"shop/editor/web-4-125.png?335\";s:4:\"type\";s:3:\"pic\";s:5:\"title\";s:9:\"好商城\";s:3:\"url\";s:20:\"http://www.33hao.com\";s:4:\"show\";s:1:\"1\";}','横幅图片'),(126,5,'array','banner','a:5:{s:3:\"pic\";s:29:\"shop/editor/web-5-126.png?135\";s:4:\"type\";s:3:\"pic\";s:5:\"title\";s:11:\"好商城V5\";s:3:\"url\";s:20:\"http://www.33hao.com\";s:4:\"show\";s:1:\"1\";}','横幅图片'),(127,6,'array','banner','',''),(128,7,'array','banner','',''),(129,8,'array','banner','a:5:{s:3:\"pic\";s:29:\"shop/editor/web-8-129.png?227\";s:4:\"type\";s:3:\"pic\";s:5:\"title\";s:0:\"\";s:3:\"url\";s:21:\"http://demo.33hao.com\";s:4:\"show\";s:1:\"1\";}',''),(130,122,'array','channel_tit','a:3:{s:3:\"pic\";s:0:\"\";s:3:\"url\";s:0:\"\";s:5:\"title\";s:12:\"男女服装\";}','频道中部标题'),(131,122,'array','channel_act','a:4:{s:3:\"pic\";s:35:\"shop/editor/channel-122-131.jpg?213\";s:4:\"type\";s:3:\"pic\";s:5:\"title\";s:0:\"\";s:3:\"url\";s:0:\"\";}','频道中部活动'),(132,122,'array','recommend_list','a:1:{i:1;a:2:{s:9:\"recommend\";a:1:{s:4:\"name\";s:12:\"商品推荐\";}s:10:\"goods_list\";a:8:{i:101559;a:5:{s:8:\"goods_id\";s:6:\"101559\";s:12:\"market_price\";s:6:\"118.00\";s:10:\"goods_name\";s:97:\"2015冬季新款棉衣女修身大码羽绒棉服女士短款韩版连帽冬季防寒服 蓝色 M\";s:11:\"goods_price\";s:5:\"88.00\";s:9:\"goods_pic\";s:62:\"shop/store/goods/12/12_039f2d0f136e6927e9cfa6fff35e077_240.jpg\";}i:101598;a:5:{s:8:\"goods_id\";s:6:\"101598\";s:12:\"market_price\";s:6:\"169.00\";s:10:\"goods_name\";s:97:\"2015新款冬装棉衣外套女中长款大码加厚毛领羽绒棉服韩版修身棉袄 粉色 M\";s:11:\"goods_price\";s:6:\"119.00\";s:9:\"goods_pic\";s:62:\"shop/store/goods/12/12_cc322b39c176a5ae261b62795d46258_240.jpg\";}i:101583;a:5:{s:8:\"goods_id\";s:6:\"101583\";s:12:\"market_price\";s:6:\"228.00\";s:10:\"goods_name\";s:94:\"2015冬季新款棉衣女韩版加厚修身显瘦中长款连帽毛领外套棉袄女 蓝色 M\";s:11:\"goods_price\";s:6:\"168.00\";s:9:\"goods_pic\";s:48:\"shop/store/goods/12/12_04998647920805428_240.jpg\";}i:101623;a:5:{s:8:\"goods_id\";s:6:\"101623\";s:12:\"market_price\";s:6:\"192.00\";s:10:\"goods_name\";s:96:\"2015新款棉衣女 加厚羽绒棉服连帽中长款贴布刺绣 欧美风宽松大码 白色 M\";s:11:\"goods_price\";s:6:\"132.00\";s:9:\"goods_pic\";s:62:\"shop/store/goods/12/12_4eefff7530f50c03279f0ad372075be_240.jpg\";}i:101635;a:5:{s:8:\"goods_id\";s:6:\"101635\";s:12:\"market_price\";s:6:\"168.00\";s:10:\"goods_name\";s:97:\"2015秋冬装新款韩版中长款修身气质连帽毛领女装棉衣外套羽绒棉服 绿色 M\";s:11:\"goods_price\";s:6:\"138.00\";s:9:\"goods_pic\";s:48:\"shop/store/goods/12/12_04999935528632429_240.jpg\";}i:101655;a:5:{s:8:\"goods_id\";s:6:\"101655\";s:12:\"market_price\";s:6:\"195.00\";s:10:\"goods_name\";s:82:\"冬装新款2015羽绒棉服女中长款韩版连帽大毛领女式棉衣 蓝色 M\";s:11:\"goods_price\";s:6:\"165.00\";s:9:\"goods_pic\";s:48:\"shop/store/goods/12/12_04999940350217540_240.jpg\";}i:102433;a:5:{s:8:\"goods_id\";s:6:\"102433\";s:12:\"market_price\";s:6:\"199.00\";s:10:\"goods_name\";s:99:\"秋冬季时尚单鞋 糖果色亮面浅口细跟职业女鞋 漆皮镜面尖头高跟鞋 白色 34\";s:11:\"goods_price\";s:6:\"119.00\";s:9:\"goods_pic\";s:48:\"shop/store/goods/17/17_05000574018138552_240.jpg\";}i:102265;a:5:{s:8:\"goods_id\";s:6:\"102265\";s:12:\"market_price\";s:6:\"199.00\";s:10:\"goods_name\";s:71:\"秋季新款糖果色细跟单鞋 浅口真皮尖头高跟鞋 杏色 34\";s:11:\"goods_price\";s:6:\"119.00\";s:9:\"goods_pic\";s:48:\"shop/store/goods/17/17_05000548082598798_240.jpg\";}}}}','频道中部商品'),(133,122,'array','adv_a','a:3:{s:8:\"pic_name\";s:0:\"\";s:3:\"pic\";s:35:\"shop/editor/channel-122-133.jpg?162\";s:7:\"pic_url\";s:0:\"\";}','频道中部广告1'),(134,122,'array','adv_b','a:3:{s:8:\"pic_name\";s:0:\"\";s:3:\"pic\";s:35:\"shop/editor/channel-122-134.jpg?188\";s:7:\"pic_url\";s:0:\"\";}','频道中部广告2'),(135,122,'array','adv_c','a:3:{s:8:\"pic_name\";s:0:\"\";s:3:\"pic\";s:35:\"shop/editor/channel-122-135.jpg?441\";s:7:\"pic_url\";s:0:\"\";}','频道中部广告3'),(136,123,'array','channel_category','a:6:{i:1101;a:2:{s:9:\"gc_parent\";a:3:{s:5:\"gc_id\";s:4:\"1101\";s:7:\"gc_name\";s:6:\"上衣\";s:6:\"gc_pic\";s:0:\"\";}s:11:\"goods_class\";a:23:{i:1103;a:2:{s:5:\"gc_id\";s:4:\"1103\";s:7:\"gc_name\";s:6:\"衬衫\";}i:1104;a:2:{s:5:\"gc_id\";s:4:\"1104\";s:7:\"gc_name\";s:4:\"T恤\";}i:1106;a:2:{s:5:\"gc_id\";s:4:\"1106\";s:7:\"gc_name\";s:9:\"雪纺衫\";}i:1130;a:2:{s:5:\"gc_id\";s:4:\"1130\";s:7:\"gc_name\";s:6:\"卫衣\";}i:1847;a:2:{s:5:\"gc_id\";s:4:\"1847\";s:7:\"gc_name\";s:13:\"吊带/背心\";}i:1849;a:2:{s:5:\"gc_id\";s:4:\"1849\";s:7:\"gc_name\";s:6:\"开衫\";}i:1131;a:2:{s:5:\"gc_id\";s:4:\"1131\";s:7:\"gc_name\";s:9:\"打底衫\";}i:1846;a:2:{s:5:\"gc_id\";s:4:\"1846\";s:7:\"gc_name\";s:6:\"马甲\";}i:1848;a:2:{s:5:\"gc_id\";s:4:\"1848\";s:7:\"gc_name\";s:9:\"羊毛衫\";}i:1134;a:2:{s:5:\"gc_id\";s:4:\"1134\";s:7:\"gc_name\";s:9:\"羊绒衫\";}i:1105;a:2:{s:5:\"gc_id\";s:4:\"1105\";s:7:\"gc_name\";s:9:\"针织衫\";}i:1129;a:2:{s:5:\"gc_id\";s:4:\"1129\";s:7:\"gc_name\";s:6:\"毛衣\";}i:1432;a:2:{s:5:\"gc_id\";s:4:\"1432\";s:7:\"gc_name\";s:6:\"风衣\";}i:1366;a:2:{s:5:\"gc_id\";s:4:\"1366\";s:7:\"gc_name\";s:9:\"小西装\";}i:1368;a:2:{s:5:\"gc_id\";s:4:\"1368\";s:7:\"gc_name\";s:9:\"薄外套\";}i:1370;a:2:{s:5:\"gc_id\";s:4:\"1370\";s:7:\"gc_name\";s:9:\"羽绒服\";}i:1431;a:2:{s:5:\"gc_id\";s:4:\"1431\";s:7:\"gc_name\";s:6:\"棉服\";}i:1435;a:2:{s:5:\"gc_id\";s:4:\"1435\";s:7:\"gc_name\";s:6:\"大衣\";}i:1436;a:2:{s:5:\"gc_id\";s:4:\"1436\";s:7:\"gc_name\";s:6:\"皮衣\";}i:1439;a:2:{s:5:\"gc_id\";s:4:\"1439\";s:7:\"gc_name\";s:6:\"皮草\";}i:1524;a:2:{s:5:\"gc_id\";s:4:\"1524\";s:7:\"gc_name\";s:9:\"情侣装\";}i:1528;a:2:{s:5:\"gc_id\";s:4:\"1528\";s:7:\"gc_name\";s:12:\"大码女装\";}i:1845;a:2:{s:5:\"gc_id\";s:4:\"1845\";s:7:\"gc_name\";s:9:\"妈妈装\";}}}i:1247;a:2:{s:9:\"gc_parent\";a:3:{s:5:\"gc_id\";s:4:\"1247\";s:7:\"gc_name\";s:6:\"下装\";s:6:\"gc_pic\";s:0:\"\";}s:11:\"goods_class\";a:18:{i:1253;a:2:{s:5:\"gc_id\";s:4:\"1253\";s:7:\"gc_name\";s:9:\"牛仔裤\";}i:1254;a:2:{s:5:\"gc_id\";s:4:\"1254\";s:7:\"gc_name\";s:9:\"休闲裤\";}i:1255;a:2:{s:5:\"gc_id\";s:4:\"1255\";s:7:\"gc_name\";s:9:\"西装裤\";}i:1256;a:2:{s:5:\"gc_id\";s:4:\"1256\";s:7:\"gc_name\";s:9:\"打底裤\";}i:1257;a:2:{s:5:\"gc_id\";s:4:\"1257\";s:7:\"gc_name\";s:9:\"连体裤\";}i:1258;a:2:{s:5:\"gc_id\";s:4:\"1258\";s:7:\"gc_name\";s:9:\"哈伦裤\";}i:1259;a:2:{s:5:\"gc_id\";s:4:\"1259\";s:7:\"gc_name\";s:9:\"铅笔裤\";}i:1260;a:2:{s:5:\"gc_id\";s:4:\"1260\";s:7:\"gc_name\";s:9:\"小脚裤\";}i:1261;a:2:{s:5:\"gc_id\";s:4:\"1261\";s:7:\"gc_name\";s:9:\"阔腿裤\";}i:1262;a:2:{s:5:\"gc_id\";s:4:\"1262\";s:7:\"gc_name\";s:9:\"背带裤\";}i:1371;a:2:{s:5:\"gc_id\";s:4:\"1371\";s:7:\"gc_name\";s:9:\"直筒裤\";}i:1372;a:2:{s:5:\"gc_id\";s:4:\"1372\";s:7:\"gc_name\";s:9:\"喇叭裤\";}i:1441;a:2:{s:5:\"gc_id\";s:4:\"1441\";s:7:\"gc_name\";s:6:\"卫裤\";}i:1443;a:2:{s:5:\"gc_id\";s:4:\"1443\";s:7:\"gc_name\";s:9:\"五分裤\";}i:1525;a:2:{s:5:\"gc_id\";s:4:\"1525\";s:7:\"gc_name\";s:9:\"七分裤\";}i:1526;a:2:{s:5:\"gc_id\";s:4:\"1526\";s:7:\"gc_name\";s:9:\"九分裤\";}i:1527;a:2:{s:5:\"gc_id\";s:4:\"1527\";s:7:\"gc_name\";s:6:\"长裤\";}i:1850;a:2:{s:5:\"gc_id\";s:4:\"1850\";s:7:\"gc_name\";s:6:\"短裤\";}}}i:1248;a:2:{s:9:\"gc_parent\";a:3:{s:5:\"gc_id\";s:4:\"1248\";s:7:\"gc_name\";s:6:\"裙装\";s:6:\"gc_pic\";s:0:\"\";}s:11:\"goods_class\";a:7:{i:1264;a:2:{s:5:\"gc_id\";s:4:\"1264\";s:7:\"gc_name\";s:9:\"连衣裙\";}i:1265;a:2:{s:5:\"gc_id\";s:4:\"1265\";s:7:\"gc_name\";s:9:\"半身裙\";}i:1266;a:2:{s:5:\"gc_id\";s:4:\"1266\";s:7:\"gc_name\";s:6:\"长裙\";}i:1267;a:2:{s:5:\"gc_id\";s:4:\"1267\";s:7:\"gc_name\";s:6:\"短裙\";}i:1429;a:2:{s:5:\"gc_id\";s:4:\"1429\";s:7:\"gc_name\";s:6:\"礼服\";}i:1433;a:2:{s:5:\"gc_id\";s:4:\"1433\";s:7:\"gc_name\";s:6:\"婚纱\";}i:1434;a:2:{s:5:\"gc_id\";s:4:\"1434\";s:7:\"gc_name\";s:6:\"旗袍\";}}}i:1292;a:2:{s:9:\"gc_parent\";a:3:{s:5:\"gc_id\";s:4:\"1292\";s:7:\"gc_name\";s:12:\"女式内衣\";s:6:\"gc_pic\";s:0:\"\";}s:11:\"goods_class\";a:12:{i:1851;a:2:{s:5:\"gc_id\";s:4:\"1851\";s:7:\"gc_name\";s:12:\"内衣配件\";}i:1852;a:2:{s:5:\"gc_id\";s:4:\"1852\";s:7:\"gc_name\";s:12:\"大码内衣\";}i:1293;a:2:{s:5:\"gc_id\";s:4:\"1293\";s:7:\"gc_name\";s:6:\"文胸\";}i:1294;a:2:{s:5:\"gc_id\";s:4:\"1294\";s:7:\"gc_name\";s:6:\"内裤\";}i:1295;a:2:{s:5:\"gc_id\";s:4:\"1295\";s:7:\"gc_name\";s:12:\"文胸套装\";}i:1296;a:2:{s:5:\"gc_id\";s:4:\"1296\";s:7:\"gc_name\";s:12:\"性感内衣\";}i:1297;a:2:{s:5:\"gc_id\";s:4:\"1297\";s:7:\"gc_name\";s:12:\"保暖内衣\";}i:1375;a:2:{s:5:\"gc_id\";s:4:\"1375\";s:7:\"gc_name\";s:13:\"吊带/背心\";}i:1383;a:2:{s:5:\"gc_id\";s:4:\"1383\";s:7:\"gc_name\";s:16:\"睡衣/家具服\";}i:1417;a:2:{s:5:\"gc_id\";s:4:\"1417\";s:7:\"gc_name\";s:9:\"塑身衣\";}i:1445;a:2:{s:5:\"gc_id\";s:4:\"1445\";s:7:\"gc_name\";s:13:\"袜子/丝袜\";}i:1572;a:2:{s:5:\"gc_id\";s:4:\"1572\";s:7:\"gc_name\";s:6:\"泳衣\";}}}i:1386;a:2:{s:9:\"gc_parent\";a:3:{s:5:\"gc_id\";s:4:\"1386\";s:7:\"gc_name\";s:12:\"女士配件\";s:6:\"gc_pic\";s:0:\"\";}s:11:\"goods_class\";a:6:{i:1387;a:2:{s:5:\"gc_id\";s:4:\"1387\";s:7:\"gc_name\";s:6:\"帽子\";}i:1388;a:2:{s:5:\"gc_id\";s:4:\"1388\";s:7:\"gc_name\";s:13:\"皮带/腰链\";}i:1389;a:2:{s:5:\"gc_id\";s:4:\"1389\";s:7:\"gc_name\";s:6:\"围巾\";}i:1390;a:2:{s:5:\"gc_id\";s:4:\"1390\";s:7:\"gc_name\";s:6:\"丝巾\";}i:1391;a:2:{s:5:\"gc_id\";s:4:\"1391\";s:7:\"gc_name\";s:6:\"披肩\";}i:1392;a:2:{s:5:\"gc_id\";s:4:\"1392\";s:7:\"gc_name\";s:6:\"手套\";}}}i:1117;a:2:{s:9:\"gc_parent\";a:3:{s:5:\"gc_id\";s:4:\"1117\";s:7:\"gc_name\";s:6:\"女鞋\";s:6:\"gc_pic\";s:0:\"\";}s:11:\"goods_class\";a:20:{i:1160;a:2:{s:5:\"gc_id\";s:4:\"1160\";s:7:\"gc_name\";s:6:\"单鞋\";}i:1161;a:2:{s:5:\"gc_id\";s:4:\"1161\";s:7:\"gc_name\";s:9:\"平底鞋\";}i:2004;a:2:{s:5:\"gc_id\";s:4:\"2004\";s:7:\"gc_name\";s:9:\"高跟鞋\";}i:1162;a:2:{s:5:\"gc_id\";s:4:\"1162\";s:7:\"gc_name\";s:9:\"细跟鞋\";}i:1164;a:2:{s:5:\"gc_id\";s:4:\"1164\";s:7:\"gc_name\";s:9:\"粗跟鞋\";}i:2003;a:2:{s:5:\"gc_id\";s:4:\"2003\";s:7:\"gc_name\";s:9:\"方根鞋\";}i:1163;a:2:{s:5:\"gc_id\";s:4:\"1163\";s:7:\"gc_name\";s:9:\"坡跟鞋\";}i:1165;a:2:{s:5:\"gc_id\";s:4:\"1165\";s:7:\"gc_name\";s:9:\"帆布鞋\";}i:1166;a:2:{s:5:\"gc_id\";s:4:\"1166\";s:7:\"gc_name\";s:9:\"乐福鞋\";}i:1167;a:2:{s:5:\"gc_id\";s:4:\"1167\";s:7:\"gc_name\";s:9:\"牛津鞋\";}i:1168;a:2:{s:5:\"gc_id\";s:4:\"1168\";s:7:\"gc_name\";s:16:\"布鞋/绣花鞋\";}i:1169;a:2:{s:5:\"gc_id\";s:4:\"1169\";s:7:\"gc_name\";s:9:\"懒人鞋\";}i:1170;a:2:{s:5:\"gc_id\";s:4:\"1170\";s:7:\"gc_name\";s:9:\"罗马鞋\";}i:1171;a:2:{s:5:\"gc_id\";s:4:\"1171\";s:7:\"gc_name\";s:9:\"豆豆鞋\";}i:1172;a:2:{s:5:\"gc_id\";s:4:\"1172\";s:7:\"gc_name\";s:9:\"松糕鞋\";}i:1424;a:2:{s:5:\"gc_id\";s:4:\"1424\";s:7:\"gc_name\";s:9:\"妈妈鞋\";}i:1425;a:2:{s:5:\"gc_id\";s:4:\"1425\";s:7:\"gc_name\";s:9:\"内增高\";}i:1426;a:2:{s:5:\"gc_id\";s:4:\"1426\";s:7:\"gc_name\";s:6:\"婚鞋\";}i:1428;a:2:{s:5:\"gc_id\";s:4:\"1428\";s:7:\"gc_name\";s:6:\"凉鞋\";}i:1472;a:2:{s:5:\"gc_id\";s:4:\"1472\";s:7:\"gc_name\";s:6:\"拖鞋\";}}}}','频道顶部分类'),(137,123,'array','channel_slide','a:2:{i:1;a:5:{s:6:\"pic_id\";s:1:\"1\";s:8:\"pic_name\";s:12:\"上衣推荐\";s:7:\"pic_url\";s:77:\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index&amp;cate_id=1101\";s:5:\"color\";s:7:\"#EFD8AE\";s:7:\"pic_img\";s:37:\"shop/editor/channel-123-137-1.png?205\";}i:2;a:5:{s:5:\"color\";s:7:\"#C6122B\";s:8:\"pic_name\";s:12:\"上衣推荐\";s:7:\"pic_url\";s:77:\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index&amp;cate_id=1101\";s:6:\"pic_id\";s:1:\"2\";s:7:\"pic_img\";s:37:\"shop/editor/channel-123-137-2.png?136\";}}','频道顶部切换'),(138,123,'array','channel_adv','a:1:{i:1;a:1:{s:8:\"pic_list\";a:3:{i:1;a:4:{s:6:\"pic_id\";s:1:\"1\";s:8:\"pic_name\";s:12:\"衬衫推荐\";s:7:\"pic_url\";s:79:\"http://demo.33hao.com/shop/index.php?act=goods&amp;op=index&amp;goods_id=102126\";s:7:\"pic_img\";s:39:\"shop/editor/channel-123-138-1-1.png?239\";}i:2;a:4:{s:6:\"pic_id\";s:1:\"2\";s:8:\"pic_name\";s:6:\"推荐\";s:7:\"pic_url\";s:79:\"http://demo.33hao.com/shop/index.php?act=goods&amp;op=index&amp;goods_id=102126\";s:7:\"pic_img\";s:39:\"shop/editor/channel-123-138-1-2.png?245\";}i:3;a:4:{s:8:\"pic_name\";s:6:\"推荐\";s:7:\"pic_url\";s:79:\"http://demo.33hao.com/shop/index.php?act=goods&amp;op=index&amp;goods_id=102126\";s:6:\"pic_id\";s:1:\"3\";s:7:\"pic_img\";s:39:\"shop/editor/channel-123-138-1-3.png?106\";}}}}','频道顶部广告'),(139,1,'array','recommends_list','a:1:{i:1;a:2:{s:10:\"recommends\";a:1:{s:4:\"name\";s:12:\"热卖促销\";}s:10:\"goods_list\";a:2:{i:102070;a:5:{s:8:\"goods_id\";s:6:\"102070\";s:12:\"market_price\";s:6:\"188.00\";s:10:\"goods_name\";s:97:\"新款女装韩版修身A字斗篷棉衣加厚保暖短外套大毛领连帽羽绒棉服 蓝色 M\";s:11:\"goods_price\";s:6:\"118.00\";s:9:\"goods_pic\";s:48:\"shop/store/goods/12/12_04999920485539383_240.jpg\";}i:101680;a:5:{s:8:\"goods_id\";s:6:\"101680\";s:12:\"market_price\";s:6:\"162.00\";s:10:\"goods_name\";s:82:\"2015秋冬新款女装女式韩版修身短款棉衣棉服羽绒棉衣女 粉色 M\";s:11:\"goods_price\";s:6:\"112.00\";s:9:\"goods_pic\";s:48:\"shop/store/goods/12/12_04999938698283696_240.png\";}}}}','热卖促销'),(140,2,'array','recommends_list','a:1:{i:1;a:2:{s:10:\"recommends\";a:1:{s:4:\"name\";s:12:\"热卖促销\";}s:10:\"goods_list\";a:2:{i:102865;a:5:{s:8:\"goods_id\";s:6:\"102865\";s:12:\"market_price\";s:6:\"188.00\";s:10:\"goods_name\";s:83:\"酷迪璐新品男式夹克外套男士pu皮衣韩版休闲绒布接男装 蓝色 M\";s:11:\"goods_price\";s:6:\"128.00\";s:9:\"goods_pic\";s:48:\"shop/store/goods/18/18_05011806114146918_240.jpg\";}i:102817;a:5:{s:8:\"goods_id\";s:6:\"102817\";s:12:\"market_price\";s:6:\"128.00\";s:10:\"goods_name\";s:85:\"秋冬男衬衫2015新款秋冬衬衫男装长袖酷迪璐免烫男式衬衫 白色 M\";s:11:\"goods_price\";s:5:\"78.00\";s:9:\"goods_pic\";s:48:\"shop/store/goods/18/18_05011794098190322_240.jpg\";}}}}','热卖促销'),(141,3,'array','recommends_list','a:1:{i:1;a:2:{s:10:\"recommends\";a:1:{s:4:\"name\";s:12:\"热卖促销\";}s:10:\"goods_list\";a:2:{i:102714;a:5:{s:8:\"goods_id\";s:6:\"102714\";s:12:\"market_price\";s:6:\"199.00\";s:10:\"goods_name\";s:112:\"欧洲站独家新款女靴真皮短靴内增高职业女鞋秋冬马丁靴圆头女靴子 黑色（加绒） 35\";s:11:\"goods_price\";s:6:\"139.00\";s:9:\"goods_pic\";s:48:\"shop/store/goods/17/17_05003992073017413_240.jpg\";}i:101329;a:5:{s:8:\"goods_id\";s:6:\"101329\";s:12:\"market_price\";s:6:\"158.00\";s:10:\"goods_name\";s:76:\"摩伊拉夏季新款凉鞋金属色绑带潮鞋真皮内里女鞋 粉色 34\";s:11:\"goods_price\";s:6:\"128.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/6/6_04849943887552948_240.jpg\";}}}}','热卖促销'),(142,4,'array','recommends_list','a:1:{i:1;a:2:{s:10:\"recommends\";a:1:{s:4:\"name\";s:12:\"热卖促销\";}s:10:\"goods_list\";a:2:{i:102835;a:5:{s:8:\"goods_id\";s:6:\"102835\";s:12:\"market_price\";s:6:\"198.00\";s:10:\"goods_name\";s:43:\"2015新款保暖加绒修身衬衫 白色 M\";s:11:\"goods_price\";s:5:\"98.00\";s:9:\"goods_pic\";s:48:\"shop/store/goods/18/18_05011800162520471_240.jpg\";}i:101915;a:5:{s:8:\"goods_id\";s:6:\"101915\";s:12:\"market_price\";s:6:\"122.00\";s:10:\"goods_name\";s:79:\"2015冬款加绒T恤 男式纯棉T恤男士加厚加绒保暖打底衫 黑色 M\";s:11:\"goods_price\";s:5:\"72.00\";s:9:\"goods_pic\";s:48:\"shop/store/goods/15/15_04999703686355513_240.jpg\";}}}}','热卖促销'),(143,5,'array','recommends_list','a:1:{i:1;a:2:{s:10:\"recommends\";a:1:{s:4:\"name\";s:12:\"热卖促销\";}s:10:\"goods_list\";a:2:{i:102700;a:5:{s:8:\"goods_id\";s:6:\"102700\";s:12:\"market_price\";s:6:\"158.00\";s:10:\"goods_name\";s:79:\"纯色透气圆头单鞋男真皮方跟低帮鞋前系带男士皮鞋 棕色 38\";s:11:\"goods_price\";s:5:\"88.00\";s:9:\"goods_pic\";s:48:\"shop/store/goods/16/16_05003068354931461_240.jpg\";}i:102592;a:5:{s:8:\"goods_id\";s:6:\"102592\";s:12:\"market_price\";s:6:\"188.00\";s:10:\"goods_name\";s:82:\"爵爷商务皮鞋 秋款男士正装 前系带 金属尖头低帮单鞋 黑色 38\";s:11:\"goods_price\";s:6:\"118.00\";s:9:\"goods_pic\";s:48:\"shop/store/goods/16/16_05000683915287946_240.jpg\";}}}}','热卖促销'),(144,6,'array','recommends_list','a:1:{i:1;a:2:{s:10:\"recommends\";a:1:{s:4:\"name\";s:12:\"热卖促销\";}s:10:\"goods_list\";a:2:{i:102714;a:5:{s:8:\"goods_id\";s:6:\"102714\";s:12:\"market_price\";s:6:\"199.00\";s:10:\"goods_name\";s:112:\"欧洲站独家新款女靴真皮短靴内增高职业女鞋秋冬马丁靴圆头女靴子 黑色（加绒） 35\";s:11:\"goods_price\";s:6:\"139.00\";s:9:\"goods_pic\";s:48:\"shop/store/goods/17/17_05003992073017413_240.jpg\";}i:102649;a:5:{s:8:\"goods_id\";s:6:\"102649\";s:12:\"market_price\";s:6:\"188.00\";s:10:\"goods_name\";s:64:\"优质超纤皮男鞋纯色前系带尖头低帮皮鞋 棕色 38\";s:11:\"goods_price\";s:6:\"108.00\";s:9:\"goods_pic\";s:48:\"shop/store/goods/16/16_05002911543965426_240.jpg\";}}}}','热卖促销'),(145,7,'array','recommends_list','a:1:{i:1;a:2:{s:10:\"recommends\";a:1:{s:4:\"name\";s:12:\"热卖促销\";}s:10:\"goods_list\";a:2:{i:102714;a:5:{s:8:\"goods_id\";s:6:\"102714\";s:12:\"market_price\";s:6:\"199.00\";s:10:\"goods_name\";s:112:\"欧洲站独家新款女靴真皮短靴内增高职业女鞋秋冬马丁靴圆头女靴子 黑色（加绒） 35\";s:11:\"goods_price\";s:6:\"139.00\";s:9:\"goods_pic\";s:48:\"shop/store/goods/17/17_05003992073017413_240.jpg\";}i:102688;a:5:{s:8:\"goods_id\";s:6:\"102688\";s:12:\"market_price\";s:6:\"188.00\";s:10:\"goods_name\";s:71:\"爵爷2015春秋商务正装男士皮鞋透气超纤皮男鞋 黑色 38\";s:11:\"goods_price\";s:6:\"108.00\";s:9:\"goods_pic\";s:48:\"shop/store/goods/16/16_05003062100708546_240.jpg\";}}}}','热卖促销'),(146,8,'array','recommends_list','a:1:{i:1;a:2:{s:10:\"recommends\";a:1:{s:4:\"name\";s:12:\"热卖促销\";}s:10:\"goods_list\";a:2:{i:102880;a:5:{s:8:\"goods_id\";s:6:\"102880\";s:12:\"market_price\";s:6:\"198.00\";s:10:\"goods_name\";s:94:\"2015秋冬酷迪璐男士夹克潮青年韩版时尚修身立领夹克男装外套 咖啡色 M\";s:11:\"goods_price\";s:6:\"128.00\";s:9:\"goods_pic\";s:48:\"shop/store/goods/18/18_05013234251110713_240.jpg\";}i:102865;a:5:{s:8:\"goods_id\";s:6:\"102865\";s:12:\"market_price\";s:6:\"188.00\";s:10:\"goods_name\";s:83:\"酷迪璐新品男式夹克外套男士pu皮衣韩版休闲绒布接男装 蓝色 M\";s:11:\"goods_price\";s:6:\"128.00\";s:9:\"goods_pic\";s:48:\"shop/store/goods/18/18_05011806114146918_240.jpg\";}}}}','热卖促销'),(147,1,'array','banner','a:5:{s:3:\"pic\";s:29:\"shop/editor/web-1-147.png?937\";s:4:\"type\";s:3:\"pic\";s:5:\"title\";s:7:\"广告1\";s:3:\"url\";s:26:\"http://demo.33hao.com/shop\";s:4:\"show\";s:1:\"0\";}','横幅图片'),(148,2,'array','banner','a:5:{s:3:\"pic\";s:29:\"shop/editor/web-2-148.png?871\";s:4:\"type\";s:3:\"pic\";s:5:\"title\";s:7:\"广告2\";s:3:\"url\";s:21:\"http://www.33hao.com/\";s:4:\"show\";s:1:\"0\";}','横幅图片'),(149,3,'array','banner','','横幅图片'),(150,4,'array','banner','','横幅图片'),(151,5,'array','banner','','横幅图片'),(152,6,'array','banner','','横幅图片'),(153,7,'array','banner','','横幅图片'),(154,8,'array','banner','','横幅图片'),(155,124,'array','channel_tit','a:3:{s:3:\"pic\";s:0:\"\";s:3:\"url\";s:0:\"\";s:5:\"title\";s:12:\"上衣推荐\";}','频道中部标题'),(156,124,'array','channel_act','a:4:{s:3:\"pic\";s:35:\"shop/editor/channel-124-156.jpg?810\";s:4:\"type\";s:3:\"pic\";s:5:\"title\";s:6:\"大衣\";s:3:\"url\";s:77:\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index&amp;cate_id=1100\";}','频道中部活动'),(157,124,'array','recommend_list','a:2:{i:1;a:2:{s:9:\"recommend\";a:1:{s:4:\"name\";s:12:\"商品推荐\";}s:10:\"goods_list\";a:8:{i:102126;a:5:{s:8:\"goods_id\";s:6:\"102126\";s:12:\"market_price\";s:6:\"163.00\";s:10:\"goods_name\";s:91:\"2015秋冬新款韩版女羽绒棉服女立领修身显瘦棉衣短款棉服外套 红色 L\";s:11:\"goods_price\";s:6:\"103.00\";s:9:\"goods_pic\";s:48:\"shop/store/goods/12/12_04999931964380007_240.jpg\";}i:102110;a:5:{s:8:\"goods_id\";s:6:\"102110\";s:12:\"market_price\";s:6:\"168.00\";s:10:\"goods_name\";s:79:\"2015秋冬新款修身连帽棉服女中长款外穿女装外套棉衣 红色 L\";s:11:\"goods_price\";s:6:\"108.00\";s:9:\"goods_pic\";s:48:\"shop/store/goods/12/12_04999927971638202_240.png\";}i:102070;a:5:{s:8:\"goods_id\";s:6:\"102070\";s:12:\"market_price\";s:6:\"188.00\";s:10:\"goods_name\";s:97:\"新款女装韩版修身A字斗篷棉衣加厚保暖短外套大毛领连帽羽绒棉服 蓝色 M\";s:11:\"goods_price\";s:6:\"118.00\";s:9:\"goods_pic\";s:48:\"shop/store/goods/12/12_04999920485539383_240.jpg\";}i:101730;a:5:{s:8:\"goods_id\";s:6:\"101730\";s:12:\"market_price\";s:6:\"168.00\";s:10:\"goods_name\";s:97:\"2015秋冬装新款韩版中长款修身气质连帽毛领女装棉衣外套羽绒棉服 绿色 L\";s:11:\"goods_price\";s:6:\"138.00\";s:9:\"goods_pic\";s:48:\"shop/store/goods/12/12_04998693284537206_240.jpg\";}i:101705;a:5:{s:8:\"goods_id\";s:6:\"101705\";s:12:\"market_price\";s:6:\"178.00\";s:10:\"goods_name\";s:97:\"冬装新款羽绒棉服女 韩版时尚修身中长款棉袄加厚大毛领连帽棉衣 灰色 L\";s:11:\"goods_price\";s:6:\"128.00\";s:9:\"goods_pic\";s:48:\"shop/store/goods/12/12_04999936911250267_240.jpg\";}i:101680;a:5:{s:8:\"goods_id\";s:6:\"101680\";s:12:\"market_price\";s:6:\"162.00\";s:10:\"goods_name\";s:82:\"2015秋冬新款女装女式韩版修身短款棉衣棉服羽绒棉衣女 粉色 M\";s:11:\"goods_price\";s:6:\"112.00\";s:9:\"goods_pic\";s:48:\"shop/store/goods/12/12_04999938698283696_240.png\";}i:101655;a:5:{s:8:\"goods_id\";s:6:\"101655\";s:12:\"market_price\";s:6:\"195.00\";s:10:\"goods_name\";s:82:\"冬装新款2015羽绒棉服女中长款韩版连帽大毛领女式棉衣 蓝色 M\";s:11:\"goods_price\";s:6:\"165.00\";s:9:\"goods_pic\";s:48:\"shop/store/goods/12/12_04999940350217540_240.jpg\";}i:101635;a:5:{s:8:\"goods_id\";s:6:\"101635\";s:12:\"market_price\";s:6:\"168.00\";s:10:\"goods_name\";s:97:\"2015秋冬装新款韩版中长款修身气质连帽毛领女装棉衣外套羽绒棉服 绿色 M\";s:11:\"goods_price\";s:6:\"138.00\";s:9:\"goods_pic\";s:48:\"shop/store/goods/12/12_04999935528632429_240.jpg\";}}}i:2;a:2:{s:9:\"recommend\";a:1:{s:4:\"name\";s:12:\"商品推荐\";}s:10:\"goods_list\";a:8:{i:102714;a:5:{s:8:\"goods_id\";s:6:\"102714\";s:12:\"market_price\";s:6:\"199.00\";s:10:\"goods_name\";s:112:\"欧洲站独家新款女靴真皮短靴内增高职业女鞋秋冬马丁靴圆头女靴子 黑色（加绒） 35\";s:11:\"goods_price\";s:6:\"139.00\";s:9:\"goods_pic\";s:48:\"shop/store/goods/17/17_05003992073017413_240.jpg\";}i:102700;a:5:{s:8:\"goods_id\";s:6:\"102700\";s:12:\"market_price\";s:6:\"158.00\";s:10:\"goods_name\";s:79:\"纯色透气圆头单鞋男真皮方跟低帮鞋前系带男士皮鞋 棕色 38\";s:11:\"goods_price\";s:5:\"88.00\";s:9:\"goods_pic\";s:48:\"shop/store/goods/16/16_05003068354931461_240.jpg\";}i:102688;a:5:{s:8:\"goods_id\";s:6:\"102688\";s:12:\"market_price\";s:6:\"188.00\";s:10:\"goods_name\";s:71:\"爵爷2015春秋商务正装男士皮鞋透气超纤皮男鞋 黑色 38\";s:11:\"goods_price\";s:6:\"108.00\";s:9:\"goods_pic\";s:48:\"shop/store/goods/16/16_05003062100708546_240.jpg\";}i:102649;a:5:{s:8:\"goods_id\";s:6:\"102649\";s:12:\"market_price\";s:6:\"188.00\";s:10:\"goods_name\";s:64:\"优质超纤皮男鞋纯色前系带尖头低帮皮鞋 棕色 38\";s:11:\"goods_price\";s:6:\"108.00\";s:9:\"goods_pic\";s:48:\"shop/store/goods/16/16_05002911543965426_240.jpg\";}i:102604;a:5:{s:8:\"goods_id\";s:6:\"102604\";s:12:\"market_price\";s:6:\"168.00\";s:10:\"goods_name\";s:70:\"日常休闲鞋男士豆豆鞋驾车真皮男鞋英伦皮鞋 黄色 38\";s:11:\"goods_price\";s:6:\"108.00\";s:9:\"goods_pic\";s:48:\"shop/store/goods/16/16_05001210537684207_240.jpg\";}i:102592;a:5:{s:8:\"goods_id\";s:6:\"102592\";s:12:\"market_price\";s:6:\"188.00\";s:10:\"goods_name\";s:82:\"爵爷商务皮鞋 秋款男士正装 前系带 金属尖头低帮单鞋 黑色 38\";s:11:\"goods_price\";s:6:\"118.00\";s:9:\"goods_pic\";s:48:\"shop/store/goods/16/16_05000683915287946_240.jpg\";}i:102550;a:5:{s:8:\"goods_id\";s:6:\"102550\";s:12:\"market_price\";s:6:\"188.00\";s:10:\"goods_name\";s:83:\"2015新款男士尖头皮鞋男超纤套脚商务休闲鞋新郎结婚鞋 棕色 38\";s:11:\"goods_price\";s:6:\"108.00\";s:9:\"goods_pic\";s:48:\"shop/store/goods/16/16_05000599917943696_240.jpg\";}i:102529;a:5:{s:8:\"goods_id\";s:6:\"102529\";s:12:\"market_price\";s:6:\"198.00\";s:10:\"goods_name\";s:70:\"商务鞋英伦真皮休闲皮鞋透气低帮鞋潮流单鞋 黄色 38\";s:11:\"goods_price\";s:6:\"118.00\";s:9:\"goods_pic\";s:48:\"shop/store/goods/16/16_05000591480492095_240.jpg\";}}}}','频道中部商品'),(158,124,'array','adv_a','a:3:{s:8:\"pic_name\";s:6:\"推荐\";s:3:\"pic\";s:35:\"shop/editor/channel-124-158.jpg?604\";s:7:\"pic_url\";s:77:\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index&amp;cate_id=1100\";}','频道中部广告1'),(159,124,'array','adv_b','a:3:{s:8:\"pic_name\";s:6:\"推荐\";s:3:\"pic\";s:35:\"shop/editor/channel-124-159.jpg?879\";s:7:\"pic_url\";s:77:\"http://demo.33hao.com/shop/index.php?act=search&amp;op=index&amp;cate_id=1100\";}','频道中部广告2'),(160,124,'array','adv_c','a:3:{s:8:\"pic_name\";s:7:\"推荐2\";s:3:\"pic\";s:35:\"shop/editor/channel-124-160.jpg?189\";s:7:\"pic_url\";s:79:\"http://demo.33hao.com/shop/index.php?act=goods&amp;op=index&amp;goods_id=102070\";}','频道中部广告3'),(161,122,'array','channel_category','a:6:{i:1;a:2:{s:9:\"gc_parent\";a:3:{s:5:\"gc_id\";s:1:\"1\";s:7:\"gc_name\";s:12:\"服饰鞋帽\";s:6:\"gc_pic\";s:0:\"\";}s:11:\"goods_class\";a:8:{i:4;a:2:{s:5:\"gc_id\";s:1:\"4\";s:7:\"gc_name\";s:6:\"女装\";}i:5;a:2:{s:5:\"gc_id\";s:1:\"5\";s:7:\"gc_name\";s:6:\"男装\";}i:6;a:2:{s:5:\"gc_id\";s:1:\"6\";s:7:\"gc_name\";s:6:\"内衣\";}i:7;a:2:{s:5:\"gc_id\";s:1:\"7\";s:7:\"gc_name\";s:6:\"运动\";}i:8;a:2:{s:5:\"gc_id\";s:1:\"8\";s:7:\"gc_name\";s:6:\"女鞋\";}i:9;a:2:{s:5:\"gc_id\";s:1:\"9\";s:7:\"gc_name\";s:6:\"男鞋\";}i:10;a:2:{s:5:\"gc_id\";s:2:\"10\";s:7:\"gc_name\";s:6:\"配饰\";}i:11;a:2:{s:5:\"gc_id\";s:2:\"11\";s:7:\"gc_name\";s:6:\"童装\";}}}i:2;a:2:{s:9:\"gc_parent\";a:3:{s:5:\"gc_id\";s:1:\"2\";s:7:\"gc_name\";s:12:\"礼品箱包\";s:6:\"gc_pic\";s:0:\"\";}s:11:\"goods_class\";a:5:{i:151;a:2:{s:5:\"gc_id\";s:3:\"151\";s:7:\"gc_name\";s:12:\"潮流女包\";}i:152;a:2:{s:5:\"gc_id\";s:3:\"152\";s:7:\"gc_name\";s:12:\"时尚男包\";}i:153;a:2:{s:5:\"gc_id\";s:3:\"153\";s:7:\"gc_name\";s:12:\"功能箱包\";}i:154;a:2:{s:5:\"gc_id\";s:3:\"154\";s:7:\"gc_name\";s:6:\"礼品\";}i:155;a:2:{s:5:\"gc_id\";s:3:\"155\";s:7:\"gc_name\";s:9:\"奢侈品\";}}}i:3;a:2:{s:9:\"gc_parent\";a:3:{s:5:\"gc_id\";s:1:\"3\";s:7:\"gc_name\";s:12:\"家居家装\";s:6:\"gc_pic\";s:0:\"\";}s:11:\"goods_class\";a:6:{i:200;a:2:{s:5:\"gc_id\";s:3:\"200\";s:7:\"gc_name\";s:6:\"家纺\";}i:201;a:2:{s:5:\"gc_id\";s:3:\"201\";s:7:\"gc_name\";s:6:\"灯具\";}i:202;a:2:{s:5:\"gc_id\";s:3:\"202\";s:7:\"gc_name\";s:12:\"生活日用\";}i:203;a:2:{s:5:\"gc_id\";s:3:\"203\";s:7:\"gc_name\";s:12:\"家装软饰\";}i:204;a:2:{s:5:\"gc_id\";s:3:\"204\";s:7:\"gc_name\";s:12:\"清洁日用\";}i:205;a:2:{s:5:\"gc_id\";s:3:\"205\";s:7:\"gc_name\";s:12:\"宠物生活\";}}}i:256;a:2:{s:9:\"gc_parent\";a:3:{s:5:\"gc_id\";s:3:\"256\";s:7:\"gc_name\";s:12:\"数码办公\";s:6:\"gc_pic\";s:0:\"\";}s:11:\"goods_class\";a:11:{i:258;a:2:{s:5:\"gc_id\";s:3:\"258\";s:7:\"gc_name\";s:12:\"手机配件\";}i:259;a:2:{s:5:\"gc_id\";s:3:\"259\";s:7:\"gc_name\";s:12:\"摄影摄像\";}i:260;a:2:{s:5:\"gc_id\";s:3:\"260\";s:7:\"gc_name\";s:12:\"数码配件\";}i:261;a:2:{s:5:\"gc_id\";s:3:\"261\";s:7:\"gc_name\";s:12:\"时尚影音\";}i:390;a:2:{s:5:\"gc_id\";s:3:\"390\";s:7:\"gc_name\";s:12:\"电脑整机\";}i:391;a:2:{s:5:\"gc_id\";s:3:\"391\";s:7:\"gc_name\";s:12:\"电脑配件\";}i:392;a:2:{s:5:\"gc_id\";s:3:\"392\";s:7:\"gc_name\";s:12:\"外设产品\";}i:393;a:2:{s:5:\"gc_id\";s:3:\"393\";s:7:\"gc_name\";s:12:\"网络产品\";}i:394;a:2:{s:5:\"gc_id\";s:3:\"394\";s:7:\"gc_name\";s:12:\"办公打印\";}i:395;a:2:{s:5:\"gc_id\";s:3:\"395\";s:7:\"gc_name\";s:12:\"办公文仪\";}i:1034;a:2:{s:5:\"gc_id\";s:4:\"1034\";s:7:\"gc_name\";s:12:\"手机通讯\";}}}i:530;a:2:{s:9:\"gc_parent\";a:3:{s:5:\"gc_id\";s:3:\"530\";s:7:\"gc_name\";s:12:\"珠宝手表\";s:6:\"gc_pic\";s:0:\"\";}s:11:\"goods_class\";a:10:{i:531;a:2:{s:5:\"gc_id\";s:3:\"531\";s:7:\"gc_name\";s:12:\"时尚饰品\";}i:532;a:2:{s:5:\"gc_id\";s:3:\"532\";s:7:\"gc_name\";s:16:\"纯金K金饰品\";}i:533;a:2:{s:5:\"gc_id\";s:3:\"533\";s:7:\"gc_name\";s:12:\"金银投资\";}i:534;a:2:{s:5:\"gc_id\";s:3:\"534\";s:7:\"gc_name\";s:6:\"银饰\";}i:535;a:2:{s:5:\"gc_id\";s:3:\"535\";s:7:\"gc_name\";s:12:\"钻石饰品\";}i:536;a:2:{s:5:\"gc_id\";s:3:\"536\";s:7:\"gc_name\";s:12:\"翡翠玉石\";}i:537;a:2:{s:5:\"gc_id\";s:3:\"537\";s:7:\"gc_name\";s:12:\"水晶玛瑙\";}i:538;a:2:{s:5:\"gc_id\";s:3:\"538\";s:7:\"gc_name\";s:12:\"宝石珍珠\";}i:539;a:2:{s:5:\"gc_id\";s:3:\"539\";s:7:\"gc_name\";s:6:\"婚庆\";}i:540;a:2:{s:5:\"gc_id\";s:3:\"540\";s:7:\"gc_name\";s:12:\"钟表手表\";}}}i:662;a:2:{s:9:\"gc_parent\";a:3:{s:5:\"gc_id\";s:3:\"662\";s:7:\"gc_name\";s:12:\"运动健康\";s:6:\"gc_pic\";s:0:\"\";}s:11:\"goods_class\";a:8:{i:663;a:2:{s:5:\"gc_id\";s:3:\"663\";s:7:\"gc_name\";s:12:\"户外鞋服\";}i:664;a:2:{s:5:\"gc_id\";s:3:\"664\";s:7:\"gc_name\";s:12:\"户外装备\";}i:665;a:2:{s:5:\"gc_id\";s:3:\"665\";s:7:\"gc_name\";s:12:\"运动器械\";}i:666;a:2:{s:5:\"gc_id\";s:3:\"666\";s:7:\"gc_name\";s:12:\"纤体瑜伽\";}i:667;a:2:{s:5:\"gc_id\";s:3:\"667\";s:7:\"gc_name\";s:12:\"体育娱乐\";}i:668;a:2:{s:5:\"gc_id\";s:3:\"668\";s:7:\"gc_name\";s:12:\"成人用品\";}i:669;a:2:{s:5:\"gc_id\";s:3:\"669\";s:7:\"gc_name\";s:12:\"保健器械\";}i:670;a:2:{s:5:\"gc_id\";s:3:\"670\";s:7:\"gc_name\";s:12:\"急救卫生\";}}}}','频道顶部分类'),(162,122,'array','channel_slide','a:1:{i:1;a:5:{s:5:\"color\";s:7:\"#00b050\";s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:6:\"pic_id\";s:1:\"1\";s:7:\"pic_img\";s:37:\"shop/editor/channel-122-162-1.jpg?589\";}}','频道顶部切换'),(163,122,'array','channel_adv','a:1:{i:1;a:1:{s:8:\"pic_list\";a:3:{i:1;a:4:{s:6:\"pic_id\";s:1:\"1\";s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:7:\"pic_img\";s:39:\"shop/editor/channel-122-163-1-1.jpg?197\";}i:2;a:4:{s:6:\"pic_id\";s:1:\"2\";s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:7:\"pic_img\";s:39:\"shop/editor/channel-122-163-1-2.jpg?296\";}i:3;a:4:{s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:6:\"pic_id\";s:1:\"3\";s:7:\"pic_img\";s:39:\"shop/editor/channel-122-163-1-3.jpg?825\";}}}}','频道顶部广告');
/*!40000 ALTER TABLE `te_web_code` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-25  0:30:40
