-- MySQL dump 10.13  Distrib 5.6.23, for Win32 (x86)
--
-- Host: localhost    Database: hrm
-- ------------------------------------------------------
-- Server version	5.6.23-log

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
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `absent` int(11) DEFAULT NULL,
  `link1` varchar(255) DEFAULT NULL,
  `link2` varchar(255) DEFAULT NULL,
  `link3` varchar(255) DEFAULT NULL,
  `link4` varchar(255) DEFAULT NULL,
  `in_time` datetime DEFAULT NULL,
  `late_by` datetime DEFAULT NULL,
  `out_time` datetime DEFAULT NULL,
  `over_time` datetime DEFAULT NULL,
  `performance` double DEFAULT NULL,
  `shift` varchar(255) DEFAULT NULL,
  `sign_time` datetime DEFAULT NULL,
  `user_id` varchar(255) NOT NULL,
  `work_duration` varchar(255) DEFAULT NULL,
  `work_hr_day` datetime DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` VALUES (13,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'2018-03-31 21:15:37','121',NULL,NULL,'REMARK'),(14,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'2018-03-31 21:45:43','333',NULL,NULL,'REMARK'),(15,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'2018-04-01 16:29:59','121',NULL,NULL,'REMARK'),(16,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'2018-04-01 16:31:15','121',NULL,NULL,'REMARK');
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance_user`
--

DROP TABLE IF EXISTS `attendance_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendance_user` (
  `attend_id` int(11) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  PRIMARY KEY (`attend_id`,`user_id`),
  KEY `FKmq1kc386m1rj5pc3i2k5krww3` (`user_id`),
  CONSTRAINT `FKb0xuwxi07sy14u4hx3pe985jc` FOREIGN KEY (`attend_id`) REFERENCES `attendance` (`id`),
  CONSTRAINT `FKmq1kc386m1rj5pc3i2k5krww3` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance_user`
--

LOCK TABLES `attendance_user` WRITE;
/*!40000 ALTER TABLE `attendance_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendance_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emergency_contact`
--

DROP TABLE IF EXISTS `emergency_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emergency_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `leave_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emergency_contact`
--

LOCK TABLES `emergency_contact` WRITE;
/*!40000 ALTER TABLE `emergency_contact` DISABLE KEYS */;
INSERT INTO `emergency_contact` VALUES (1,'sdfgsdf',0,'sdfs','0453');
/*!40000 ALTER TABLE `emergency_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hr_record`
--

DROP TABLE IF EXISTS `hr_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hr_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `balance` int(11) NOT NULL,
  `balance_maternity` int(11) NOT NULL,
  `balance_other` int(11) NOT NULL,
  `balance_personal` int(11) NOT NULL,
  `balance_planned` int(11) NOT NULL,
  `balance_sick` int(11) NOT NULL,
  `balance_vacation` int(11) NOT NULL,
  `total_leave` int(11) NOT NULL,
  `total_leave_maternity` int(11) NOT NULL,
  `total_leave_other` int(11) NOT NULL,
  `total_leave_personal` int(11) NOT NULL,
  `total_leave_planned` int(11) NOT NULL,
  `total_leave_sick` int(11) NOT NULL,
  `taken` int(11) NOT NULL,
  `taken_maternity` int(11) NOT NULL,
  `taken_other` int(11) NOT NULL,
  `taken_personal` int(11) NOT NULL,
  `taken_planned` int(11) NOT NULL,
  `taken_sick` int(11) NOT NULL,
  `taken_vacation` int(11) NOT NULL,
  `total_leave_vacation` int(11) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr_record`
--

LOCK TABLES `hr_record` WRITE;
/*!40000 ALTER TABLE `hr_record` DISABLE KEYS */;
INSERT INTO `hr_record` VALUES (4,30,5,5,5,5,5,5,30,5,5,5,5,5,0,0,0,0,0,0,0,5,'165465123');
/*!40000 ALTER TABLE `hr_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hr_record_user`
--

DROP TABLE IF EXISTS `hr_record_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hr_record_user` (
  `hr_record_id` int(11) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  PRIMARY KEY (`hr_record_id`,`user_id`),
  KEY `FKawqvajloqffdq3wpw2bo6t0wq` (`user_id`),
  CONSTRAINT `FKawqvajloqffdq3wpw2bo6t0wq` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKlo0bjk40dqh6dqv6psldjgcr2` FOREIGN KEY (`hr_record_id`) REFERENCES `hr_record` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr_record_user`
--

LOCK TABLES `hr_record_user` WRITE;
/*!40000 ALTER TABLE `hr_record_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `hr_record_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_user`
--

DROP TABLE IF EXISTS `leave_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leave_user` (
  `leave_id` int(11) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  PRIMARY KEY (`leave_id`,`user_id`),
  KEY `FKinxpmu31urc9keopa7pq7y03f` (`user_id`),
  CONSTRAINT `FKcdif9f76mmvdgdguilpwa9ut0` FOREIGN KEY (`leave_id`) REFERENCES `leaves` (`id`),
  CONSTRAINT `FKinxpmu31urc9keopa7pq7y03f` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_user`
--

LOCK TABLES `leave_user` WRITE;
/*!40000 ALTER TABLE `leave_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `leave_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leaves`
--

DROP TABLE IF EXISTS `leaves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leaves` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `apply_whom` varchar(255) NOT NULL,
  `action_by` varchar(255) NOT NULL,
  `apply_date` datetime NOT NULL,
  `apply_from` datetime NOT NULL,
  `apply_to` datetime NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `modify_to` varchar(255) NOT NULL,
  `total_leave_day` int(11) DEFAULT NULL,
  `user_id` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `cancellation_status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leaves`
--

LOCK TABLES `leaves` WRITE;
/*!40000 ALTER TABLE `leaves` DISABLE KEYS */;
INSERT INTO `leaves` VALUES (2,'PRO-VC','New Apply','2018-02-19 16:54:25','2018-02-20 00:00:00','2018-02-21 00:00:00','reas','Pending','Personal','New Apply',3,'333','fsdsdfg',NULL),(3,'PRO-VC','New Apply','2018-02-19 17:47:25','2018-02-20 00:00:00','2018-02-22 00:00:00','Nothing','Rejected','Personal','New Apply',3,'333','Desc',NULL),(4,'ADMIN','New Apply','2018-04-01 16:35:56','2018-04-24 00:00:00','2018-04-28 00:00:00','Nothing','Pending','Vacation','New Apply',5,'121','sdfgsdg',NULL);
/*!40000 ALTER TABLE `leaves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payroll`
--

DROP TABLE IF EXISTS `payroll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payroll` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adv_loan` double DEFAULT NULL,
  `adv_loan_ded` double DEFAULT NULL,
  `arrears` double DEFAULT NULL,
  `basic` double DEFAULT NULL,
  `bonus` double DEFAULT NULL,
  `child` double DEFAULT NULL,
  `conveyance` double DEFAULT NULL,
  `edu_all` double DEFAULT NULL,
  `house` double DEFAULT NULL,
  `incentive` double DEFAULT NULL,
  `interesr` double DEFAULT NULL,
  `interest_ded` double DEFAULT NULL,
  `leave_ded` double DEFAULT NULL,
  `leave_encash` double DEFAULT NULL,
  `medical` double DEFAULT NULL,
  `other` double DEFAULT NULL,
  `other_ded` double DEFAULT NULL,
  `overtime` double DEFAULT NULL,
  `perquisite` double DEFAULT NULL,
  `pf` double DEFAULT NULL,
  `professional_tax_ded` double DEFAULT NULL,
  `reimbursement` double DEFAULT NULL,
  `security_deposite_ded` double DEFAULT NULL,
  `special` double DEFAULT NULL,
  `stipen` double DEFAULT NULL,
  `tds` double DEFAULT NULL,
  `user_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payroll`
--

LOCK TABLES `payroll` WRITE;
/*!40000 ALTER TABLE `payroll` DISABLE KEYS */;
INSERT INTO `payroll` VALUES (1,0,0,0,12540,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'2001'),(2,0,0,0,15200,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'121');
/*!40000 ALTER TABLE `payroll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(255) DEFAULT NULL,
  `role_chain` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ADMIN','ADMIN'),(2,'VC','VC'),(3,'PRO-VC','VC'),(4,'DEAN','PRO-VC VC'),(5,'CHAIRMAN','DEAN PRO-VC VC'),(6,'CO-ORDINATOR','CHAIRMAN DEAN PRO-VC VC'),(7,'FACULTY','CO-ORDINATOR CHAIRMAN DEAN PRO-VC VC'),(8,'USER','FACULTY CO-ORDINATOR CHAIRMAN DEAN PRO-VC VC');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_image`
--

DROP TABLE IF EXISTS `test_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_image` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `data` longblob,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_image`
--

LOCK TABLES `test_image` WRITE;
/*!40000 ALTER TABLE `test_image` DISABLE KEYS */;
INSERT INTO `test_image` VALUES (3,'ÿØÿà\0JFIF\0\0\0\0\0\0ÿí\0„Photoshop 3.0\08BIM\0\0\0\0\0g(\0bFBMD01000aa4030000cc100000b61e0000ad1f00009b20000012270000243a00000d3e0000af4000001843000085680000\0ÿâICC_PROFILE\0\0\0lcms\0\0mntrRGB XYZ Ü\0\0\0\0)\09acspAPPL\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0öÖ\0\0\0\0\0Ó-lcms\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\ndesc\0\0\0ü\0\0\0^cprt\0\0\\\0\0\0wtpt\0\0h\0\0\0bkpt\0\0|\0\0\0rXYZ\0\0\0\0\0gXYZ\0\0¤\0\0\0bXYZ\0\0¸\0\0\0rTRC\0\0Ì\0\0\0@gTRC\0\0Ì\0\0\0@bTRC\0\0Ì\0\0\0@desc\0\0\0\0\0\0\0c2\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0text\0\0\0\0FB\0\0XYZ \0\0\0\0\0\0öÖ\0\0\0\0\0Ó-XYZ \0\0\0\0\0\0\0\03\0\0¤XYZ \0\0\0\0\0\0o¢\0\08õ\0\0XYZ \0\0\0\0\0\0b™\0\0·…\0\0ÚXYZ \0\0\0\0\0\0$ \0\0„\0\0¶Ïcurv\0\0\0\0\0\0\0\Z\0\0\0ËÉc’kö?Q4!ñ)2;’FQw]íkpz‰±š|¬i¿}ÓÃé0ÿÿÿÛ\0C\0\n\n\n		\n\Z%\Z# , #&\')*)-0-(0%()(ÿÛ\0C\n\n\n\n(\Z\Z((((((((((((((((((((((((((((((((((((((((((((((((((ÿÀ\0¡í\0\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0E\0\0\0!1AQa\"q2BR‘#3¡±brÁÑ$%Cð45á‚6Ds„¢²ñÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0$\0\0\0\0\0\0!1AQa\"2qÿÚ\0\0\0\0?\0ú¨BY’.^§\"’WJ÷A$ˆÕ+¢è\ZIfB&Ð•Ò¸CRº.¢FŠªWJé\\\"èÑt’º	]Qº.‚WEÔoáðˆÒ½’ùJèaÜ§ò£¨EÐ4î¡­ÐˆÒº[tEÐ“¹QB¡Ü¢å$&&ÊHBªWÕ;…@„®‹”T’Jå\"nˆ‘(QÑ©%t´Jè%t”otî¡$h¡-®‹¨ÝL\r	]\"à”]Fá\"îÉ¢wIFýÒ\'²hšD¨“p•ì¦‰wK2WEÐIÑt€Bº„®‹ê¡+¤®p‹„ž!ÝQº.®„³^Û¥hÐJŠu0îš…ÓÑj*I]$œ{D®’Žd_EŒ¾©Üªî‹ ²ýÓº®é…DÑû¨§uÐ•ÑtV½‡r˜ÅG•ÆÄ«[LBçäÆòu~õoRQ÷£{•Ëôç²¥ô¯;&¯ýc´1VßB¤1VŸÄ¸>š_*ÈiŸœf<úw>òoæR›{¬‘Ð5ÌÕº¤pîÍ°IW+gÞMî÷“{€°ºƒ(¸iXŸI.m¬®¦Wwïþ`¼›ù‚âz9ÖéŠIF×M;þ;x³¸GÞ\rÜ¸¢Žbz©zÂyÿ\0¯\\Îéúæ÷†(ç\'ª~†{èJi5ÛõÍèBb´wp$ãñ½5@êžKÛ¿ë[Ü#Ö·¸\\MSÒè0T\rÁO$ÛüzXÞá?XÞáyîUJfž¢Ú8§‘·øô\"­¿˜#Õ7óçÅ5WBT›OT:ŸÝ<—·{Õ4õõ,îÓÕ¥†¡½ÏÂy»ž¥Ó\r¶ëÍs\'ÚçöRc§vÄ§”Hô~¡½Ñê[Ü/>yã©Sc*\\ÈwEC{Ý¡¿øW‘QÝBÒ·rUò†WwÔ7ÿ\0\n9í\\[?ó(¸ÈÝsò1Ûç·ÿ\0\n9íÿ\0Â¼Óª¥i¶¨õrr§œ5éyíÿ\0ÂŽsð¯3ëeRm\\…<âkÒs›ÿ\0…>cWŸLF–\nÖ™ÏTòŠíóZ—9«yÔ,ÌÝ_!Ûç5À¸mžWtRŸ O(;\\ÁÝÀ¸Ùç‹çdò†:üÐŽh\\nlÃ§õ@šcÑ<¡ŽÏ0#š›7åLI)O(c­ÌYr³O}\Z‚ùÆí%<¢ã«Í	g‘Î˜nÒÎ—±O(Ž¾qÝÇuÈçÉØ©6I6O(¸êgòŒë›žAøTy¯êr†:™Ñsy¯è«åts£:çÉtóIÛú¦ñ1ÐÌ–m–+¹HfO(xµæ½Ö\'5Î#MÕÙìÆÝ:ÿ\0t®:,­kû µ÷O(­Y‘™dv`¢îªù\r¹‘˜,&B\'tò1´¸%˜,™þQ˜¥åjÌŒÁfÌåÏì§”3\Zó#5ÖP^{«Tò†,%åžè=ÕÕÀ5E¼¦#=Ñ©¦sH)SÊ–Qð¡bP.ò‹ãSOÂ€¹è¥•ÝžPñ§dú(†?²˜ÊùHxÑ™0Så8©6ÕKÏôð¨õEÕíOÓ,}¼Wë®a«CÀ,|Æ…8ê\ZÛjUb¶Š|ÝSu3mºƒ+ƒëtÈ«};Se8Ì,©±\rÊ›kâtØ|-1—UÊ”}†\"Òu9aÁ•—(bmiV7m·:.¤`ì¡é™Ø,gt}êËn¢ëx§h7Rt-ì¹‡e÷C±Feú‚£¦Øc\ZØ)ä°ý—ø¦º[±kuCc¹+## ý!‘ßR¸¿zƒÕEØ«{ ôQ².¶StqÑyO¾ZÖ­ûà[êDwœÈ‡dÚ\"ëeçþôkÖ¬‹t³Ðz6ˆí¥D}@\\X±«Ârâl±9‘qÙ´]‚‹¢ãauçŽ&ßÍedx³Gãc°hc\'aû+\"¢½—\'ï`>òò¦+µé\"ìéâo@¸NÅˆ?RˆÆ.lJzGuÑ2Ú\0±ËLÓ®‹±A”‘ºÌì^Ê˜Þa¶À*Ÿv–XÙ‹~•Þ&Ú4©«‰³Ìu!90¡mÇî©n-”Ø²Êg.ÙªŠ\'ñ)7·TÙ‰9»¶ëCq?oÐŒ@Pïuttím»*‰ÑTìEÃ¢lO\ZéúvªÏ%\\°`-ý1‚í,UØ¾Ó†‰M–†ÒGÕr[Š•6â¯=?¢žQ|]CG\ZªJFºÃ÷±\nˆÄŒŽµìžIãS’0Ç$ÐÐ“fvªS9\0OöIÉ|Hz+šÞYöì²9ã(î¬§ˆÌâK²4}N=É|Zóµ»Ù0æ»`\nÁ3l·µû¨¶)da:n{,ÞkàÕPXÁr@ýVSSÙÀªç‚&¹/ÎûØ“°\\Ê™Ø=¦XÚ²Ÿaá–ÔBGB¤*¡oeäÛZÖT¹€:VŸÄÓ²ÑêÇäe<Îñ\rB}¿âýqé}lJšèY©!p›$$²ž[t¨–²¤æ|oÀê¯u|ïâx:C‚ú8\'÷ÔÁ¹+˜h#s¬[—7â2ðüŽ7l€¶ú8\rÖo;úx;_|AžÅÖ*NÆ ˆ.xzC»Íü)·†Ý±{ˆ¿UŸ»ë®èÅ¡;8)}ïÜ…Ä<;&|Áîß²náù¦w\'Ü}nÏÞÑÈKïh‡â”ÎxÓ3”dá÷ßG~Óë®ì8ÄG¨*ÿ\0½#=óqàRZâßsÔûŽO¹<+ºÜF\'‡î¤ú¸¾¸$ÃQ+î¤0ŠŒÚÊõ~Óë®¼•Qª=lm;…›î©\\Û8ùT?ywÖõ>Ö¾½tÛˆGÔÝO×Eùš¹\rÀN¯z´`„iwiå>ØŸUuYp¥êâ=W><·©?%kfn…O¸ŸXk#èZÑµ”~í?•vÑ/Í[úÍØ‹[Ô\'&×l¡÷VmÁ²ƒä7h²ÏÝWëkmcN©\ZÑ{*Æá¥p×_dûià¼T:\'ÏBÃ¡RôNò³ö_êÎ?ÄÄàvKžÓ½¿EBã½Ô›Bàó_•ªbfw\n±DmÕ\r¢ ©æ¹þ-õ\nMªŒtUú\"Rô$öSËHÐ+cëYÑQè\n˜ øMz±âÊÁ]nSè‘èü©ÒãçMÄå\'êW6ºB>¥Û†\"c¯rV–à\r4Ýåýx¼kÌ»˜h\n!)Ü¯Qÿ\0Â:¡\'AÚÊïøž/0+d×Tz©Oârô±à‚uZ¾ä€4èÐ›þ/‹Éú™@Ð”½e@ÚëÖÇƒD7²´`Ð[P®§‹Æz¹Žïrƒª¦Ø=ËÛ}ÍOÑ­ý”NO¾Qû)«#Å2¢{ýn\'ÉZ%E®\\mò½kp˜Gá²—Ý†ìÓÅãÝ,àèâ¢ê™º’W²û®øBƒ°¸‡à²iâò¢CÔªÝ4„îW°û²È÷T?~Éä¾ž_(p•ÃLËÛ7\rˆ\rßÙHPÆ?¢m\'‚O›éwì´2š ž½ÜtquöVŠX†à+«âð^’¥Ã@ä½a6÷/ zx›°\n¸‡e5<^-´a 8xVG‡V9Ú8þ«Ùì¤-ì_\ZòŸuU–ïý‡ª¾®þ‹ÕóâhÝDÕD÷M<á3\rÜUž†Fþ%×ud}¢J–²—”YÁÊuÉÔ©Ç‡¹+i”]GŸm”Ø³‚-¢mº©z(¿(G¨=Ô}ByEñ§éX€1@ÝPfKš§œkÂœð³5Ò©sœv+>Púê×6áG—æêÔ¹ŠùÃë«rÈ{3*‹ÒqY¿/ŸKÓ´îNÑ²YœŒÎ=Ôû\"øT¹JmŽÊ±™Hf*_’/×VdÑ\rfª!¯²±Í³”’â5¿EŸ²ZMŽúÆÊö³9cF¶+<L{ŽÝWZ8ùŒ–KY•¾ç]YÍ<#lo4¹ÿ\0H:mT¼íòµ\rªz×HàÒ\"§`ý]åCÐ±´ôþçº—$Ÿ®]cœàØ˜ç±Ø\"˜â3ß4Í†X¢C.è¤pp¹Ñþ«Äãô4ËzYç•€»ß9\0Ÿ!6—ÝôY]˜Õ\\7{Ýcš’†=ò5®ëîÖËæµ|I‡	E,pH,	×ÕWM-tÒÎi_TÙÚðEÅí#ýQ5ô7ÕÀÙiÚÝõ,aÄ1‡BÉDV.`¸Í¥õWpæŠ]&(ÖQÆû\0éˆiýë¼0º¿Ÿ ¨q#ÐÝòú®#®3X5þã`ªCŠå†sL÷ÈéÀ0¶÷=‚öuŒáö½ôö©¥yÒîŒÙpÝÃÞ—¦­yeE=3LÑ¼h@öƒúÛöIiÓmÃ3›OZL2ìn4z\Zz¹¡hu9mD_—¨_ ¯§« õË?¨7°6 ‹ëuê°i¦ª‡42²Ä@6ýBÖÿ\0Qõ>º\Z†‚,/Ð®£XÃ¨µ—‚¢¬ç`ñÕTÞ\'¹æ\'K×MœeÚÂñ	Ã\ZÙžÛ½§GëŸ(Ü¯J\ZÞÁ}‚ªÎŒ=§B¯lgåso¢\rhè‘§ Vr“ §#(FAùBÒ\"R¡Ó-½‘‘måü#–N˜²&#ºÙ 0\"leä„r‚×‘\"\0CY„#¢ŽÝ–Ñ•\rgå„ùjë\'dMS’É†…m‘d5Xj22@@pCPÈ²¨—öC´²£(QÌ•Ð2ò—ÊVF¢Ñ²Š@ÙD›©¦,<Þ\Z‹¦˜‘z.{]M5Ÿ\\:5±¿•yóVJ^©Åz¯Ï¾ºô¸t­ðÔ½GÔ¿¥Óÿ\0Ñ©ÝõžF·Âás¤r|ÉVoþDYñ;>´¬ƒˆ8\r,¸¼É{”^B5ºŸzýnÇÞîkÜz®?¿ÊVª}õ~¸ìzãÝ¸÷’!(åJOU~ú}qÕ5îèB^¹Çñj¹¢)\n§yî§ßÈðæ°þd½[¿0Y=<—RÒ>îKá\Z}c‡âKÖÌ©o;§èœŸw#Â-õ‡ó(\Z³}ÒG±Sô$ôSíä¾Sªœz•_©u÷+P we!@*ž|‰#\'¨wrŽ{ÊÛè<)Š\r6O>K‘Ï2¸ôFwu¨(?Â¤0ÿ\0\Z©åËúdrŸå;½v[A®ÊM¡piÓ‰g–WßªôˆvLQ´nÚtàd”¹/;]z&Ñ³°Sô¬ìG›m;ÉØ«=#ü¯D)Ø:\'Égeu^y´W6ýBîr˜ÈÑ²‰®(¡%?@z®Í‡„\\Èlr	ì¦(|.¥Ú.mŽp¡îô!t3&è¬>Œ&)@è¶\rNºÜ,Ðá±Ù‘´þ“i³sð´5Äa¿…´Âêx›™¶•âãÀHZÌ0è£o¾æB4hRm †64ãw­€6(€$ó»¿(V‡2–\0÷4—¥õ.=×IéBPÚZaÊ¸qn¼Æ)ËŠ_Qˆ9€“ìeöÑu¥ò=Ï“5­p:þW€âqlR Ç†Ó>K¸Ýç¢,ëÛÎqa­ÄdÊj&Žœki˜I?%dÂp<M´Ï‰òM<høÚ\r¾or½e7U³,ø­c¢\rs®Uu¸ö€z(ß5HmËß¨åV/t¨8hREÍšœE™ºš‰Ih²loÁéÞÚy\"hÙÜ–ÿ\0Êòu˜ÕV>Mç&1g5$þëÊáÔîv\'SKR×6\'»¯­ÓÈñ{z®/’‰#h±:>K¸+ÔÓcD-¨kdl‘´—Á\"ëæ•8K¨â¹kå†3{ÈtÂ¢§}lf7Ldc@Êë·)ì{¦é_KÆ©\r]#ä…s‡¹Žïò¸xHøË*	29™%ˆ6Ãb<®\rq-cy¡ìÍLË1ÀèW£c)jj™[JÆ¸¶XÉÔ¥ÕŒ¸uó>ž™†a—Y¤‹ß·ê²G_O*ÈîÖ‘\Ziv»¢îã¸xæÃ¢\"•À<lÒ/uçj¨a~%oN3D—Ô€´¯In£u~Ñš9ØË›®žlJépd²\'Å8>×\\t‡C/¨,Ìçsšìíï¦ëÙáum|—…ƒ;ôÌz)},öîàí³¦gáEÕ\r²ÁA-–õ=ÖæŸÌ¸VÒ-LéÙ@¬™°E’²;$Bƒ¾‰åÑ\0 /¢®@HW\"À ¥ …%e…’#²,¨[DYH¤ˆƒ¼)\'nèAYK\'…a@AS›Ù ÞëFQe[·EÔ,‹)f¾Ê7÷ZÊ`d]@r™¿b Z|¦,JÊ\nMªe·L=JKMöS±L\néÝ½ÓÈ¢<¨ R#²ÒÙÔÄ¤ôW\Zd7&(Væ¼•ktÝQÏm”…ìº9‘™BÞ¡OÑ3²Údî‰Œm¡o`¦Ú6Ûe¬<\'Ì¬­£möSm•üÐ9ãºzVŽÊb™¡DÎ.˜™ù\rìÁVfKœ‚îS{)6&žŠžo•&Ím[ÊhO#U|ÂŽað‚ÜK(U	<©	&\'`¤«š2Ù^¤Y§¥ÙO„V«£8ð³•¸¢cW1\"ð³òßÙM±<¡‹9–Kš!=T›„D9£²\\Õw vLAáG0’%Çe¬BE>Pð¡ÓW)rÏU·–dò…SXÄIò¬¶e	ØxCY9HyZì<\"Èk7([u.W·Â¾ÊMa;ì˜š®–Ÿ<ƒM¿+w.IdtÒÊÝþ‹M5>K^ÅÄmÙ]-]qkç\"×Ýtã1›n¹Eœ†9óêãr°Í!pt’œ‚ÞÐz%Yˆsf.\r|†úi²çW¾YXàÖ‹ØvRÖ¸ñc­t•\rÕ\"žêât\nºŠ»âåá\rHÿ\0ªy¤Üw¢æÉK=\\}I\"&œÁ‡cåAôâFËZ1«ÝÕþ•¬qñ¬T˜ÌU>Ióœ›Õ|¿‰k]Xhéó4µÞà×þëÙq;âÃâå\\6¶cî±þX;•äêàŠ8U(ï»Ë†­×]S{KŽ¿Fj[0dt.ì:xZxÓ‡_AˆÃŠÓÉ–	,É@ÒÇ¿ÁWàðÈÙâòÓ½£3›©Óªú\r57ß}ECY+_µ‡ÖËtò¶¥˜ñ¸(‡¤’Š²@%p<·IþËÎÍ„‚fb1Ä$¼Mi¹p=Š+ Äøoôò> aþÒ6î™ž?±^¦lZ:vÀüBš:œ2paÍúóÐ…¨åÉó\ZÊÉñ6HØá”å ÚÖÐžëÑpÎ-9¡Œ¸„_†ú8y^‚«‚&Žº<G¯x†vç5$\rå?î¼Î-…cTU!ô´R4‡úvE™Ï¹êGE¦2¾©€ÕÁÄÔ,Š)kc7,vÒ[Bî¼î)‡ÏBú™$Í–ŸÚAüM\'B¹”œ9Y«™Î¯{e4Fü«ž¤lë›/mÊ8Žè¡‘ƒ£Ô¶öæ÷!^ÕâaÄÃ@LÙË‡\0^¢Š|Ð²Hˆ÷vî¼U\\BÏâ\0&+ØE‹Hî½ŠÀÉ¡¦qò7˜ë\0ã¸=“Ûé?#çÃØù.$:WT/\'‚W=³r¢³ÇAì½u[s\ZXvÔ.vvèÞÝ”‚ªCÇK«TI@]BèBº‚7ºwE‡tì‚7Bd²CtE–Pvè	YH\rßE¶éÝEÄ,šwºH_¢D€–`„JÈI\"mº˜uNê»Ü©í@];•^Û<È<ãX›rÊ“aqØ\'È(ÑµíT„¡G’PØLËÙGš˜‡å>R\"\"Ce.a²\\¾È>QG1ÝÔ3‡U3G ¦\"®kDó9XØU­‰fÝOU¡°ßº— ¡¬Á5£Ó’¤ÚRˆÏt®¶¶™X)ÀèŠÀÒoÕXÐOuµ´ã²±°\"kCå1B·ˆ€RÑ\ral±V6ŸMVÌ<¨k\' uL@Õ¡ÃE„5T¹ +¢gT5T²µ“MaÑ;È#º,€BvE$\'dYB{$€&ÈBBNp\Z_T\r]c›qsºƒ!sÿ\0]\0î·ÇLÈH\r÷=ÆÝVøÆiIÎ’\"ùcm°+™;aŽ,çW»[v[«	’VÅ{«`¸5N¬pfglÖß`§*ß¦Iß#òDÒ~ëTT~Ö™\\ZÆÞÍÿ\0u££ng:}†¤¬¸•\\ÕsŠZÁfÎ’ú\'mÛ?‰Ýë§t4Í&6è÷…“a´$3¤[cÝvêŸM-´•ÑŒnÙ¼®5ì¥sê.ù\\,{¥¸q›{|—†zŒIò½ùÝncÎÃåCt´•t®iæI|½ïÝzêŒ2:cœ×ùnn7?Š©âoRÉ&–`\rì,ã[¼]Ž4QF)ÚÂ×Í ·é¸èéá¯©ÃòËj&1I`ØÚ þ»/ORêwE x“#‰A\"ßÐÒ®–`Ñ[‡ÔIfŠÇ+ôèU¶,ÇÐx‡£â\\!Œ«câk†fÊÂ“½—‘<„Ña¢ˆVÔV¶\'™ãdÙº‹ö+Íáü}S…bŒF½ïnI!ËìyèWKæÈcÆ°Ú¹*©¯{|¿êšÅ£š Uâ½ÃAs6WTSLø(ÄpˆÅÄfÎs‡žËÊñs3èÜØ›-¤³~±ßUå$©ôØ“+L9‹˜[%Î¤Ø…¸Å™íô\nn;¡æÏ÷†Jrêé#:›în¶Sñ:­³ÒÒÕÅP×Ý¥’[UóçSÓšX¤kË[8±osm•ø#‹$’¶Ç«OR”}‹Ÿ„ñD>ñ$M?Q\0vºò˜¼1a¸€‚ZYÙ;š7Èmp7#ºç`UÍ\\ØŒ„™\r¯×0]_ø†FÒ¾Ÿ‰µñFÿ\0á¹ÿ\0ÌŒx(˜ô¸¬¨,¯¤¹±Ê	^Ú–¥µTç˜,ñ¿b¼7\rÒÓ²?œIŽq¾¦ø^¦•Œ2d}Úî •›\ZŽ® tcºé4ÝshÇ,¹ h×>æºí¸XZ¹¨´ÝKDèÐmÝ+yHÐ‘6	 hH¸\rÊ†~Ú žo	ÝWr˜=Ð4¶ê‚Ua¤»DÝAîIÀŽ¤(•Úë©“¢‹Z¥eUV`§¸ÑVèõÑN65r¹eqcIÙG Šu)oÕ^Z\0@¨°‰\Z]²š1–ÝX„ E £*hAÏµ‘eqŒöLGáUj†_•³—tùHkCåI±¶ˆ‚“c0º§+g,&\0k/\'Â…i²hŒÍHA¦ÊôY\rTØ@RåÊÐ„5XŒ,Ih²h@ZÈB	¤„C²vBH¦‹$M“@!+!È\ZA7R@!E	]I\"	]4ˆºé\'•M±æ¾ \0.IAYf°ÔøVZé†²¢¬²=ÖÍfõ²¾\Z`\Z]£Z?ªW¹ò´5îp\r ehÓD¥­qŒ¥û =–˜^Ö²G¥¬e·$1±·»†ÉÕŽ]1ŒhGÔ{­¦8xåc©0ù¦hyËsÙs0*Wº”O!<ÉŽbOá©Ä”^©”Q·é¶g‹¡ä2ÆY¶Ó¢Ï(é=+xt¯D[jU“Í\rm‚·šíÏo+Ÿ_ˆ¶†‘Æ÷ÓAùŠä`²ÉXùê&\'˜íŠ›‘dýté ï«šîvonnådÆÞÚé]LÈËrÙ†Oñ-2Udd$Û#ZéÀÙqâšxðÞl¤gq\rñ~¿ùÙgznK®&.Ñ>#G ‰%kÿ\0é´ïú›•å¸é¥ø¨{Ï²7Þ¥©âˆ^hØX|¢â}¡0úz§7ëkAhÒ;gxæS¶7áïy¾gI”÷¶SaýC‡êãžžZLdlc.nUŸ§\rÈápÙ¢.=u¸?Ý`¡&>ÆÏs/Û]Üª® Â¨j˜÷VÅé¤k­Íàþ‹ø¿\nTG53RÁîcÇ‘Ñ{FŸWD×JÙl¯#qä/7‹RÕÑ	$7i»_kfBšÅâôøv\'…ñ\r01ÀØªZÛIü>BàâÜ?ä’[px‰áÞ©‚V:	ænWM³Iøè½$µF’œ\n±ê ÛšÁ{|¤©cÉÇ„³ÒÉOÍ/×3n,A\n‰i=-d,.<¿«üAz©(áæ	cúO¹¥»†»‘ùÝýŽ²k25RÆÖÏT°ƒêR¥ÉÈ:©`RÒC»´òÊ¿„¶©Ž*jØÙ€Õ:‚ªžf8·!Èï…õI‡©h™ `M¿ºùL‚ÃÙÇUô>ª–|¿R/þ¥eÚÃ	þ&g›“ +£\rÆ÷Xè©¹rjA7ºèµ¶½ú¬ßbL~ªÌÉ5‚êyB\nýÝ“ÍefT²„Á[½Û&`¦\0	 Îö:ú)6;n­)]H4!Ã²wò„Eyš,T†‹º2„!\"Û\"É Ÿ=@î¤Ô¹EO¢”&„P„#dBII$	;$¬vA#DÑk I é I„!d\0¤J+jJ/ÝL\nã²`¨‘ªmÙPÐ„ „ „íò!;&YÕJÈ@š+\"ÉÝ@ ¤JWE4³&5ÕÒCeÚ ±\n ”î¢ý”êQ´ÈðÆƒw$‚p±Ò;ãRQ#ÚE›ôÿ\0uuK›Bu±÷»¹Y,P\Z”ÉRqktºD\\\\ ¶•™³¸‹å\Z|­4Ñó\'dºa¢b7?%[†´ºW=ºØnºHÇë£LÌÒI3À\rhÈÐ?ªæ×¿;cnÅ×>ê>Ì¡-a¶·¿÷+ˆç5ò^G^‹7ÛR)Ä&»½:.M\\Å±ªrÏ|ÎÛ]N`Ú\'<YµÓÞSÄ=SË¾˜€h×©+»‡E†—´[Ceâbw2XZëÞY]+¾°_D-kp–ØnÕ‹Ûµ˜çâó±ínÍ E—$ÁLÖè\ZÃo’ñ\0dæ[[Ä-ý?ÙYLl¯ÈHI+ƒÇÊªŽC³N[ùX¸Â#5N£øn‹_›Ùuå-‰¤6ùÛ-þüB§23[¥é½ÿ\0§ŽÃã72ÌÍ;j?¨\\àÐ=x\0ÜH$×±]Ïxa}MoõY&{\rP•§ørŒ¯¿ð­Z—‹>?¢žJroìö|ºfG_Nà]œ´ÚÇp¸Ó0–9Ÿ÷`vžXÙ[O3œuÑö§¿u6Vly¬kžÎpi|¸x.Ç×ºj<yf‡]×¢ŠHêiÃI\Z9§ªÂÜªùÔ×…Ä{š5iý¤Ô¾“ƒ€9´õqË´kã\Zð¶rœb*@à6·eŽ»w,cÖýŠÉ¥Š¢9˜âßÂðž˜Ã¤Œ¥`i}býÁ]ºÈ[49± ¨½ívIKîá¡Vº.u\\Ò›¸S{\\TèŒoqÔ4\\‘ð½/	W6:¯»…ÁÊ$Íäê¼Ü’:›\r´Ì&à4ŽýÕðV²šµµ0âóOÀ\Z­oLcët®Ìò@Ð-C]÷X0™3S7é}ÊéG¶ª3SoÒ˜Hlš•ÓºD@MÒ	7u$VM%•¬„_ÊEü¥}PÃB~È.‰8ZÞPFèºª.ÒºE+ÝÉºEÐü;¤ä„„•ÒqAe“B0’` 		Ý$õOr’mÝ\0EöEŠhº“Q½Ó.\0]B¡ó‹ÛEQaºÔÝ`57r›*.lPÆ¼ÊY‚¥®g©‘ãéÈckˆ¶ê9õÝakßmAº/%nTLšªãc­ªašê‚Æ¼uSº¨0ôV\0€)\'k¦ÑGs¢a4Unl%ÎÖ«%ËŠX\\wV†éªa¡¥Il‹)!U ¿’ÀÖ}gê=¼+¹\r¥§l³ÿ\02Av3°îVW‘Ê¸ç«^…e@ÔTo®ÊNŽÎ7+\"¹SŒÛ Y£]OeémcubkT’Ù Nát¨alTùÔíOeÆŒg˜´n¢ëó-X.ZÑw\0µ©‡]5¢Êáaþ‹—-ÝN^ý/ô­DäkN¶;±\"9 Y­²—¦Þs\"FÁ`ªw7ê\nÓÄÇø.nî\0ì¹¸Lí©Â˜	š,u\\­ï\'õâ).8š¢.ÆÖýÕ}²s°ØÚ-²ñìÃ‹8ÂiíÔ0\0mÔëðøÉ¤•ƒRÃýã=»ßÆ¼5¤iš>Âƒ*ã¦‰äk¡p#™Ô¸›d.\"7ieÎªÅã<È£ ¸nÛíåI©eöÁQŽÀêªˆÜÓrâBžŠ²®•Ð[VÜØþ ¸›£™ÏôÓCÌ\0Ü¨^nZªŽ¡²3$Ý‡enÖ¦W¶|yè½Ì+Ÿ4|©2É¤r_±[hqZlJ¼;·b…®zfM¾¦ÙHÖtâÉ‹„€c4püÁW”i$cMÀíÜ-.aöq$7éwŽÅQ$±5ÎpsAîª•–LJI)¨¹šãî·Eu\'ê€÷rÜEãõYj1\nvÇ)¾fæs|/S‰º,MÞ¹\ZæÜ±[á·ÛŸ.RNßA¥ª•N§©!Ìqö¸Òu3$nÖwqÕxø†®:8fÄi@…Ä†ÈÓÔ/A„ãíªŒ†œÙEþU»=œs“¿„-³‡°èAZdfJc”Ý¡Ù›úè¹¾µ“Ñ—:N‰g§tO7»}¾ulotòÁC\0¸ssX‡j,¥–š¦®ÞÇG+ýþÝ®VLb|¸LMi÷<‹,0ìb7»f4‘++¾»ÃÕQˆDpMµ^†íÑx©l•³Æû!Ì/Ôõ^àBY­;‹?ÂuxÅjØ&á¢Ëê„ì-ÿ\0uC^ˆ(„ÝôùºJ mÏE#q²‰¨±ž©™ÙFÈƒt\\§²V@^è°Ý&ê¥¶ˆZÈA6CQB	QCE²*ºå\\àa \"(ºGêB,;¦n¤Ôhdœl¦¡–îDéÈºžP–@Œ¬ºitAÕ·EQ¾e0ÝK¢Wº`h‚.6è›]un˜Ý‰²½ÔïÝ=&íåS0$YªÓr›Fš À)Ësug¥î¶!XÄ6è¡Ë!ËnDì;\"+Ž;\rTò×SM\\ z\0¤ØÀ*a4(E‚@X!@Y;$‹¢šIz%bw@î–b‹\'—DDMÊLÐ%(À½ß{\rTR$ì«g‘ÓI™æý€ ÷{²@øPk²;]JD­Z%ÒèÍî·E¹·ì©’Kh5*\"ù½’eæúY\r~[½ÇÝ°ùTDuÝ«”žœÈÙ¹V%oÃi_#˜óøÅõè;®C„t®Ëÿ\0pØ,1LèZÀ/Ÿ-´ì®–K<G¸kªÕÿ\0iÐ46c#Ïµšþ«5CŒŽæF®VÍ0Š°7ê>çŸôX1\nÈ¨èß$ÆÍh¾‹¨àcù¤h¹ÈÌÏð¼Æ?!²F\r…Ül½P’—‡ª+*=µ§@ïÂÓ·ô^»ŽŽ–¢©Æå¬sˆ¾s¾Ý¸Îž‹\n«X¼q‘ô¸ºôðDø\'ªmŽ¢àY|Ëì›f1Œ5Ãk¹À{öiÒìÖ­k§Ó·\'‚âzTÒÈ]œí”\\¯“ãØ-ÑŠÜÑSØž\\gÞ{\\ÿ\0¢ý è#±qh.ò˜âŠª©Ÿš1Ÿ¡òµ$ãÚo—Uù†l.¼T1ÍŽBXë—fßåoŽ\Z˜©9$sËó_eôF”ÆòÙ#\0ì¹Ò6Ghö[œ·ñ>®<.¸˜L¹®y\rqúƒv>W¹Ã_\'¤µ‰ hV\\\0¨¬9 mû“°^ßáÙå”ôìö³GËÒëSŒ_)¯\rU!¹¾‡ÊòØœ.šBÒò:€½¿a3á•`M#^ÒM‹W™©€9×\n^=¥å•æNö½åò¼™ˆ§eÃŽy7¾ÖÓUè9E®»›§u¾À™xßqÂglšG¼3`ã{-ôx\\t×å\0ÛïeÖkšt¶êÆ³²–[í¯þ2É¢\r\rl¼ÝexÂë£Ïw5Ý^²FûJù×IŸ`4^Ë9\\Žþ9Œ\nˆ(ÙÐá¯pn½U	åÆ\':^À]|¨1Æ¯÷}cªú(©-Â‡øl­qöôøms£q’#i\"}Ç‘uõÌ¶<B†9ã7Ì5Šø]’¡Å×±u×Ñ¸Ou\r@\Zúiw¾Í+¬1}¾kÜ¢ÏÊä:ì¾C¸ì¯üÆ4ÜB{•Š„ÇÝ:¦¨c€œ°m¸Zê!¤SÚÊ(ÒB„‰¹E¯²-dÙ ™è’$[T†›¤Jz\"Þ¿Â: Š’‰7Nè\"I\n$©ºÅFÈEdÝ\"ÈI\ZG)îtî˜(¸ÖÈ:¥~ˆ€ºÉgL‹•&ªæ•¼…;#*2ƒ\rÔìJcE\"\n\nìz©4]ImÐE†‰¨¹È)‘å§CedO¸IÍÜ)5 P/MVè®ëÜ ³}€-¢K¢I¤H@l¤ ¤4®tƒ{«øÕ4Y¡¡\nÈ²	²‡1½Jj\'d¶F`vEÐ†‘E”šõè‚EÈÝH‹”¬fÒs…ô(pÓl”|¤è‡+2Œºý]­ú­Ô«‰¤ÛÜ€7Ñ6D©Ô ÆØýWQ’B[íÝ\\=›äË \Z«èc#›)\Zfü•U4Yc3Hoc`\nÔ^NÞ…ÆåY†.¥G¾ú\r£x|ÒK%òƒqå*f“úŽIÎÌÆhÑ¥»”TdÎ’gh-ÕpkÉßÌŸùl7kNÇÊéÖ½ò\0ÆíkX¯ÄuuŸKJû9Ã~ÃªÇ*éÂmcãN#ŽHœ$‘Œ† @±éÝ|KâyqJY(iY–,î{´ÕÂÚõ_AÆ8qÕ±>9d— iÌF—_8Æ°š\Zå’V¼œ…ÄÞ×ÝI{×N\\d;bµòaüI}ÃIÊ@:¯ÔÍ~fƒâëñ®R(ýp’$ŠW:àjæ›Iê¿Tð–*1Lš`}Ù\0:õWõ¹o.:ìÍ!Ë­\r“ê¹Z§qÕd\\-Æ±çqÊZfS8¾;¸øXpN\Z§™™ã~‡¢ìãp‡ÒºãQª¢š½Q´’4p³^‡Ãi(ò¶?¨ö^•±²8HkCG`,¼¯=õÆj¢.Öù^¥áÜ‡™=­hUÏ”þ¾7öœê˜ÜÝJñe½·ò½ÇÚ#›\'µº¸›…á2Jm¡ùN›ç:ƒ.¶OƒO…(õuœ,V†3ªžQ™Å`¶÷ÑihÊÛõU¹ÇªçÊºHª±á‘ºËåÕÎm^1>wY¶sZGæéýWÐ±ªƒÎná¥|ú†ˆÉ(¹9ÝªÎ¹ó—Ãã”Dàn wÑ}\rˆËFÖIk´¸ö:åéàg¯‚!¾·ø^º’2Àci±·ÎŠñ»¹LG‰±W‘ç\'ô:¯SÃÏuDfÀ:×mö+Y|¯îÑ•ÑÁ_’Fkb6]?ÇÒ¸––]O½¹²´\r× m|r8û$ÉÈA‘Ì=Ýb½3§¥Ë#ˆÃ”¬Tm§Í$î“)k-a~«Rª7]Z²”ÒB.®‚à>R	þ˜Fê.:è¤Ò,ŠG@•ÐJÂ$M\n:¤\\B	¤£™µBD‘r•ÓèˆI ¨”XnJú$â—T4îôQGÊ(½Ó$¢\ZyRJê-ZÛôM&‘dÙi“BWFè\Z/Ù @7ÊE·)¡kl¤£˜\'pv@&’,€BvE$)$PID) ƒŸ—¢aàì“Û˜¡¢È\'t%²i§²HDFM–GÂç;Ce·t¬W2‹¬jv	[UV\Z‘u¶Ý½”lO…&F_™Û‹’‹„^ˆ¢—ÚÙ\\ð-–Ö*‘`Ðç=ÀYi«\rŽ\0né=ÇÀè¤bÖÈãkTãcÊÑ©r¥ò€H`ÍmíÑD¸¼]ÆÍ0:Ï&×SŒÚobªç’àÖ6÷SŠ›œêv\nZÔ‰°9í76`¯Š33ú³B¦kÝÁ§Ú;-”~Ø‹Þë:ÖcTì_!ä‹3v‹,âù¯ÔjT&˜½úke+7ê®¬ŒuÏvWµ¦Ù…‰ð¸ØvÕ•s˜»,\r¿MnUØÔ²êÈŽ¤Ø+°†žÖ¼ÜÛ:Ä»[“#Äý¡Õ.’FEìuïsÐ/‚b’É^ê™æ‘îŒ#\"\Z‚í¿²úßÚ¥c«1	bŽÄ5¾áÜv_ªcÉ‡\ZHfršïãÿ\08âÉ]<31ÁÄ–êÙ~€ûâQ‰PMLöˆÝ¬\Z\rô²øÔüÈÜm¨6+Õ}ŽânÂ8Â8Ümã-»º^ã—xòÏÇêÉumÁºÌZîªÊy3±®oÒáu 0;T•è×&ª<ÍpvÇEáñ6º	¶¾‹èõŒ¦ËÏbt,•ís\0µäNYuÒÁU…ðàm,\\éuymírVx²JÆI\rLÓMcí~Çõ^ºŽ,Û\r—Š0öOHòØ›žÚXÝ;g9nXùÆ5)ž¡ÒM°Øç™ŠT9‚œˆ›¡y;üÙ“\rÄjŽò¸7ªóshçÇô¼oÝL¼9s’4I#_P^Ñfì¸õh\\¨˜àá›UÒ¥½µVÌrãV¸ûtYæÑjpö¬Ò‹…‹]wˆå,¡v÷q\rKLZàûnËYt±ææ¬£‡qrò´Ëce›ÚËŸë®9t4äÌéHÖöjõ˜\\LšFóÛ•Ë†\0Æ4uÝtpÃcc¾Ë¯]×A´nq,v± ¦”ÕÆÂâÝìújÙb!¥Ù›°ÖÊÊ™\'d™[ff\0Œ£{î÷ñ‡§¤fJ8\0w¾úö±„—\n§æÐ¿û…ç°—Ú65¬|h½äÅU	e‹sýÖk?®ÖNŠÖö\n˜Þ$®iÑÂéI!c˜á±Ñd^–Á\"o¨ê–è[™Ý•¼µ•0å\rG\"ƒ‚ºê$Ž©Ø¢ÖLl¬ÑFÊ…òž‰ O ›…76íU´YCL‹”ú&…V‘ÙFÊiDR°º’VD\'(ôÑNÖ\n6Q®Å’vÉ“ad•Bnêz \0¤5CVl„jž¨„›Qd\r7@Ç”(æHIÀ–è˜ò˜AG%Å×ÕM×kU…ÖÙVnwM5Î¾ªöCT€@î„!I	 h:„!_(	&4®šVEI	t²› hBqÕ;÷QrW\'Â‚D£émú9\0º§›ÚÑ]B9HJZõÙ4(&ß¤9Ãeš¶¡òÉý>µÒèÐ,µoKl\0ê·n3= ÷fhkŠM„ÈÑ{†…u,%¾ù5=»-$,í­<moÒÝFÉfåÈd\Z@ð¯ŽÂ\';¾‹;¾¡çºé)½CŽwe£3ÝÙ:‚\Z†,ßÃ¦èmCZÞS–ºÝJªJ}n{xW²;Õr4¹Þýú(	š\\Kµôšª0A77ð¥j1OñCõ9nl°âX„xF\rSY5®\ZYê]Ýnšc!qh°²ð¼i9«äRç%qqåâëÂmxZé$–«Y*I^;ˆ¨¹š79ÿ\0Eëñvó%n_¦3`¹üAš‚€ÙÂëŒåÛ¼x™iÁ¨anŒ˜\\x+œKðìF\ZˆÈæÂðöŸ‚»’3ÛL\0¹l¶@^XÝÈ¿ÂïÇžÖ9dšý?Á´x¦\rÑºáÍáz{¶ö¸+óÇØßš)þî¨}šãì¹þ‹ô@š6›Ý¤]][w±(öê¹µ¥…äØA]Iœ\0Õxœz†¿ÄyTÓšxí|Ö½•”ûzLS‹0ü†G‰$-Ñ£Uó<{1<Z ÃFãájx§Ùý=uSéæÅkØÀç<Ü|tËÔðun\\áA‰	Zá”sEîºÉ³§§ãøøñ›ÆmN³ÇKD>¢V6ÇéÐ®W©–9¦x.:¸¼êU8«8‚šAQ\',²Å€Ç®ËÎVÇYˆÔTHìÙma¢e[y_Ç¿Ãê¡• fmþWM¬V›…ó|3žY˜È¤e7.ÌlÐpÆ>*q„¸Ž¥c•¯?)7#`´Qä™ Zce›uÏâJï»0iäŒÿ\0í-`ë¯UÊÕy9j›YÄ²›±†ÌýzHìíEõ²ò˜+à¬§|Ú¹ÚŸÕ{áLdqËÞêGÿ\0Uè\\ún`i!½‚¬DZXñ{/gÃtb|6¦3¸iè¼ôpŒaÜ[²éÇÓ(ÛÌpÖÆ×[è[Í·:åÌp\ruöî°ÄÇ:ÍÝº/SE…¸áôòØ9€‘û•¦jTƒ—UcF8Ü“Ýw©Ú_‹wFIì¹††IYø‚ÎØ†	Zýº…+>Úheå°_#¶ÿ\0	[¤1HÂÖºë,e¼ÏWIZZá¦¶*!Ó¸ä³·n…]kª>Š‹~aÙhn¡\nmRº®ùzÙ0o²\"N½ôMGTÝb$uÙ\0èxIÓd¶A\'l©·¹Y~Š6BÀšAQRÝh†0[­ŠË{)‰B¬Jµñ†‚².´f¸Q-9®%MÌG)PE#MTSL>©ÝD$G•Ll¿„‰QÎ•îˆ•ÒµÊ\0=TÛÕÊ„.‹øA@YE¼¡dY@!@ÒB=‘t€B7NÚY\0ÓtÔmg&|\"š`$„CBIªIÛ©!ED\'Õ4ÃNW8lÝÕ\nÊ©%\riïÐ**ª›—»ºŽ)$•áÁ…ÇoC\ZŽ/Êv;•ª8†‡¯öUÁWf~¯þËNf·sdÔÀå¸ÙÁTú˜Ú47X¤ªsŽ†ÃÂ]VºÑ¹ÅÀåi .k$®h\'s¯…®Œó,whF¦,ŽpgSb|+V)±¾Ó¥ÿ\0tÜH\r9·×áAÅ±49ß¢É$åÇKÙgZ‘¹²Dßæ¼e’º²”é´ì±b49­¹7^nyåkˆy\0Ÿ¥¡sçÏ+§.åf)hÜÖhÕxêÌÕ¹×»œ`º‘Âéð]”îs(RÓÛšâ.v\\m·Û|åã+£\rs‚ÉˆÆÖ`úìu]<Y—öêt\\N1ªÔ1ÀÓî¶b6º<ÕbzØXvaæÊÅ¨Åç$Ü\rèº8lœšiç“ù’h`¹“ùÓ6÷µ«´˜Ï)Ó$2IO#¥…åcÃšGB¿Cý›ña¯Ã©ÙZà\'sF§bWçÉcäFÖIõ¿ÜB÷¼*óRC€\Z­[Œðï§èg¿3Vf7)\'ªòÜ3Äaíe=sìFå{(ƒ%h,7bµ\Z³<b»œÁi-b{¯žqU’ÈþN·Ò÷Ù}~j&½ºÙy¼k\0¦9Îsšîà­Ë>?šñ¯‘ÇCˆ¶Gf!Íuô\'k¢	å×Á¢úÙv*¡|85Ù€:*š÷\n¼¼šåóêêzXi£‰¶îz•¥‘uUBÇ9nkr6î\\¹V\'õšº²:‰Õ5N\r£n§À^R¾º–¸™eyHÐmÑƒ 	q¶‰bØµ441™\"k.\Z]a{­˜\'ÙÏÔHÏQ#M…”ÎµŽv~°Ð7;„ÎhúA^ï‡èåžˆÔ8\r½O_…ÙÂþÎÌNcª¤ŽPÛ{v×Òá\rˆµ¯+EšÆ‹4)8ßn<¹ÌÈòøÞŽ³$­þÆ¿™‰R1‰Y—Gû›åz¬r‹ÒHÉš,Ë®V?\rO3.Xuk¼v]#2¸´@Ã3Ùk‡]}ŽèpÈÝ§48‘Ø/4y$Ù{ˆšG„IÙšù7V\'\'6XæÊÇ5u;d1Žk‰è¶NÆ™ç¸VC\"Înâö![SŠ0>{+K¬Û<iÐÝWpn«‚^ð\\ßiëÙdM”°“pÓû­pÊ¾v\\ïNÒçƒú(SLàìŽÝ®Ñiš]k)³ÚÔƒMº!&ïª	nìp²HT%²)&PR@(‘r¥t”ÑÆÉ¥ºjÔV4÷U\0š©‰¸‹*Œ–ÝOp¡$ ÔRÎ\nDj«Ê§r¨vQ(Fêj­)„Ãn¥``¢.˜(\0Ÿê–Å4IÕ\0÷R	]+£¢J€ìQm”&‘t\rDøM\nB7AÝ$î€MEI&MP!	Ù04]U$ÌaÞÿ\0,“Í \"&åÎê$hš¥‹½À,rTÔÔÞ:p[Ü÷J*\"dÏ).rÝ›NšøWUžŸšÈKßÖë]ÚÍ‹B®îqì¨¨¨‚KØ(EÒT21{ßác–Yî>Ö®¢Ó5Aö³(îvZ#§kOñ\\| ÊØŸ+´úB×3sÂàjUÁ ZÖS°hÜ\"êêvƒ#¬\0Òë-D¹Üçe;+_ Êæ‚A¶ë,¤ÈÛ(Õ3H,º‘` øìòM”Üæ‚-¥µ(k]&­ªËs¥Uk¹l\0€ÝyŸMi+µ$éáw¤Ó1\Zô%så‘¬Ï#…šÑeŽs[sËCIq:ì)ôô§6çU¢…‚gºWèÆêäqQuØÝÏEË\Z×žzŠË~Ü¯ÅÓsñ9,}¬6^ò‘¥¢YøEÊùþ\'¦¬ L²E%íÚ{cžœ7˜ÐHÛápÄ€LÑø-o+èÐÐHb\"à´·çEóÊªc¯]È+·ýN]Æ:Š‡MVoÑ{þx4qùç±Çgv¹^ß†]–6-óŽ\\\'ºö°ZëÓ`XôÔ\r”™!ìu#áyzsv‚µÇ¾‹§|Øú´8Œ5Tí–‡4öÜ|®F?Sšïeä(êf¦vh\\ZV‰«d¨ÄÔ®“›=¹0½Î=uê ÊR\rÈ]XëÕAÏ#@¿#Vv¬0DÛ\n©Ä¹Ú«%×uS–=¯ãŸ‰³>Wg4èB.?Šaîš—–ŽŽ7WU·UË—Ì»ñ?É6½–öS²È:ØÙzü3ŽpšÀ3½ð8þq§î¾\'ËÝ\\Ò[ +y+…¿Wš|K\r\"Xä¸³®¸ôTñÕarAP,\"v¿×Éðªš¸kà³=ŽsÃt;Ü¯¦áµo¦¦2ÌÂá( ß­”¼dMª±\Z	tWÌ\0ö»¸èW¡Â$2pì/yÌ`“_‚«-Ž²‚7°ÝÍýÊ<×@jh¥7.i tðV3Öª‡Ú¤ê2ÝhŠ±’FÑ³šl°g!ÍRÐBL“#Ý¥¯º³YÝ¢Äïnª5°µÉXéª.ÛYÁj-·Û»uQœS3‡£²ër³Ó@çÍÌk\\[Ü­mc¥pk˜ZÑ©¿Uµº\"“EšBvD SºDY!!\nPŠI• ‹!\0„¾A+ (¤¬.¥u,×U“d³*‹\r’Q¾ˆÌSÊŒ©fNé‚Á ÑI\n º.„ .šŠhì‘=”ÕH ŽÊ ôV4*ˆ^Èk®¤æûuU´YˆGD „ „ d%ª‘=”wÔ  w¶è¿mRpºD[eTœ^v\0%Íü¼ìà?Dr‰ÝîP!úÉ\"n€‚|)wù)ršÑ`Ñû\"*’Võ$ŽÍ\nPãq/¿rµ¹‡#ˆvVì²9Úù&ÁSÝ4Ÿ[ËG`lœ,Õ‘y%ZÚ[êé¬ÂžŒÛI¤E&y¯ô°xº9Ž;±—ÿ\01VÉI)ú*>BËS‘Ë.càê‹‹ÒL·{¨så.\ri=\0T2–Y\rýÁ¿ârÙK†¿)ºÀuT1TÕ2Gí‘¥¤i¢¡õL-#–òOU°R±‚î7>Ul…Ò»,-ÍÝÝ\Z†22G<Ù¬\'à-¼¹Ì‡#@úz«&x &™Î®+žú‡ÔÖ_Sª•¨¦gkËn\\Ú&\"&-º“Ü®‹£i$ëýÓ§ ´WuÁ\"öX­k—ü¸KFW™¬%ó=îÔƒ¢ô•Ã!’ÇKÙyÚ°Eì5\'EÂûtáíÃ&;‰ÕÎÊ\n:ú†ÊFÃEéªá.1AøcŸòVZx9µhÙYíÑDTÖk^á£A%xL[çÕKE‰m—¿ÄçfÑÄFg}vÖÁyLFVScLqú/”•©{MxÂÚ‡4ì\r¬½N\0u=U<M†˜1,BñJ3¶ÊüYÍ6Ñu·Y=!9F«twkuÎ£>ÕÒˆèu•²=EÔÚMÈèªc‚µ®SR‡…K·S{®tPº—9RãpSôêªq°Z‘šÏ9¸X$½ô[¦Õcp9—~.<”äIÀ‹Y[”„eºÞ9ØÓúÅ;	šªú½p†jj0\0k§ŽLƒmouò:Wòjáxü/ú¯yÄUÂŽ>™ÎÊÎii>ÿ\0êV,oáüA³MQFÇj\Zà-Ðl»í´sPÎ‹Ùîù^„è¸óˆ¨¦¾V¾:˜Èí\nú#*\ZpÞ…ÖøY¾‡#ˆ›QDÙj`xŠ7ƒi¨i=Õ%%}\rª²ú¨ý¯¶ÇÊíÍÅøv²ŽSwKm¼‘¢øþŒb8f0ü\"±ðÐ\\=Î¿Õc_Rhs}Í×®‹±ƒœÔ®q79µ^\Z,¬–š°d7ÊÇ½®½^RØÈˆ›mu,5Ý=Ò@ ‹„@„)5P„4)ÑBM’RQ!J˜PAÎ²…É*ç\0¢ZWmT®™m’pWTn‹ÙDh‚ªCÝ uB\0EÃº`÷I‹Ð„\"!!\0(\0.žU \0B@€Jö\n7KtÐÉ½’RyQaÕPÂ¿@›v@!@!@!	„û $„Jè¾¶AØª£®‰¥°I’&×Þý”s[B¤\\K\0¾ƒUO|Ì°;¸YE·/?ªÓu—ç²£°à\rÙ$?æUäš–Nãþ\0VÉÞg[ü ª]VËZn{•œÕÕ–Ÿ`?Sd-~iØòï+K›S-¯œÃÚ«}ü¬ÇËÑZ‰Ò‘«Ã?Ì³b´¡†p[½›Õam#ZÛËD÷áË4ñE´T’´ÿ\0›D25MŠR9Úg-`7Cñ’bÉG)½Î¥b‡¨™ÖäJèC„·ø¯$,‹Ó‘#Ì.™ÅÆ÷Z©yÒÚ:xN½WhPÅ\0hêIHT2œœ!Líeþ0\nCÀNCžÃe®¹†½Ä\\»\'Iyd3ÉßAefC sˆ·e›èýyEùF¶ÔÝqÛ‘õ«Š×ŠÊLÙFöºË–>SA¼®÷|çývFg’È_;Î²ßìŠÏú^ù[oU0¸?–ëmm?2ºŠ•¿NkŸ€¹Øäžª¾¢ôF2…¹	uåiéã’¦g]îÒåpqæ’Úw;ñn´WVº¢¸CÄmu•\\BìòS´lÑªq·‹kêp8$:É	þ\n«	ˆæ¹C—d$}v\'át0øìÑeÖ3n:Ô£K-ðíeŠe¾/¥k\ZãV·EsIT³U{{,Ö´‰ÝU#»+¢­ÁKÚŸ*·«\\«pê·Åk4g-Ô­·UãÜ»qpåT{&E‚nßAtïÓåiÎ©{­¯]×G«]/`µböŠ­­ö¹\\ÙôÉasÿ\0Ä<Ä4Š*¨æèÁkÛöJÍ}&†ÅóÕÌášz&@Öõßê}Ò:X!/uÝ”ókó<GÏÆY~“NZ/¸³oý×ÑŒ„RÒM0åæ‘Ø“`=Æ`3I¶GJ^Ò:uç$Ž‹‹ðÜ:ªXÙ6!æG3Góz[ÉzŠ]\"®•í\nwÝ¿›ÂùàŒÀâ–’G·ÓÕ9ðe61ƒ®OÐ«¹øD´Ø„&fæelÝÇUî=df‡œ×fårW€q\rë™¥}?¶xíõv+‹C^êVI®æÈÜ§¥»+{nvúŸã¬¯‹’×JÁ{÷´]&ëâØ\rt˜~%C	ö¸\\wí´³6®–)Yl¯mô\\ùL¥6?0×ueÆ_*¼–Ù5e$%{ ¦¨Ût]JAq¢ªÅQ; ¨ÝIg@š@§t…[‰ÖÊåQK	\Z¹7:û+.y,CÝu\'<e-‘•®ßDÅ&‘•2B­À‡{vRÛuPÍ¬¢„ÀE	&JZ¡\Z/tÖx_•¾õh‘”ÓJèA\"E’iºŠ“[mB\0è–d8ëºT)\r’\Z6Èè‚I‹ÝGª	¡\0éd¢„!\0‹ê„ „ ú§oiºÌsxC\ZºƒJ	  ’a.ˆÙsAÔ¨Ûkiò¥tŽ¨+~m\0*ŒL\Z¹Äžä­Z:&\ZÓøB¡”ãðæ*Ávý1…qh÷AVI}ÄØ.­&’²M~k¾†žžULi”:O¥º‘Ýtä‘åÙAi{~@®®]\\lÎCn[¶ª¢Æ—FÖßb­œ–ÈXÓsÔ«)Ù‘¥äjtCQ|býDká@\0\\2è²„sÜ@7Öäžª-¹-Ûk£SÑTâen nW>¢>dÁƒõ[‰ÊÛ“¯”S6òºW}=Ï(OIG‹n‹›¹‘Ãõ^ßW…Ò’sîÊzjåã±ê§L]µìâ;,s²Lk·î™$·âÊ\néÐÄÊzI\'vùr´‹+ak]ýÇ]•¼C\'£¦m;wZä®2:ûé™¯ÏZÙw\rÐÁÅž!Åˆ;Ìëü.æ3²-É:.N3NfÇb¸:Ñj{N/WDbÅæh°³|‚¹üÙ$-üÞÕè¸˜¶š¦©ÃëqÈ’Ìiv¹FbºHé/JÜnöøZ«FA\Zl¹þ•ÎyzÙJ4=×n<zb×Zuº¢äÆïÑl§šÎ\0„¼z^5Ðoíi3\\\nàóÔ¬xº,sµ±U»dœûl«’OiÕO	œz]ftžR’KÝPí×^<Yµ)ØªKµSå9ÿ\0\nÈéíò¶çc=®‡\r–¢À;*¦°Mbÿ\0®.=Ué0Ùå×F›%ö5Óá¼DÙœêàö2úèF¤vÕpøþ³•K-u#µø]ÏþŸà’l[yy,Ä8ö÷öJåË—yÎ5®’›í6DF•ŽóšÁ}ŸŽªD4¸ed,«ptñ7«²n?b¾;‡Ò#ûZ¥ÈÌÍuhsí­ƒ5\'ú/¡qu||Aö«GÓLÆÖQJÃºÿ\0pþßì³âÆöú&üZ8{Fñnëç7âlfŽ¥Î4UÏhÜ1Ähuô°TÉŠe#–É\Z#°Ó\'Eâxº73l {Ðoä\'§IEÝƒb‰í.Šod„ÃÔ.>%F)ë¥£\\måw(êY]à¨|g4NñÙSR—Ô:VÈÏ¤	±\Z*ÜŽ,-Êñ¢úÇÔsðpÂuÙEòæ´H^ûìòCË©aðl±É®s§µÐ¨8X&\n7Ü¬c’¶œÅJÚ©ålšÐ™	(\"„Ñd ôFÛêš<Èº‰@ºªH¥t®¢”z ”$þÕ$–‚²6GT¢\rSº@&GdÕˆòË¼+\ZÀ6S²ê²vBh(ï¢H@Š6EEÂ‡²j¶²Î*ÅLÂ¾¨	ßÝª(üHr\r·	_DD‘ú¡D wArHè7MBvP#U-²š¡¨\"è²vMLT4B¡]4!\0¦4\n#tPu)±®{ƒZ.ã QÌºÑFð×‹fØÞU‘\Zéãä¹®6.HóÝNgzXîMê%sº…L\'GK\'ò£Úÿ\0ˆöXæ™Ò¼¸›’ªEÐÆéd=KŽêuÏkmÒlÎ¤ˆ¸ÿ\01ÂÀv“5A|™»Žë*¸ÊAÐ\\\rû)¾p@hÐê¡.$gÐ\rr¨Oüà{•+Päp|‘m¹Wj/f•Žkª\\òzxUTÕdŒ|,êÈÏŒWújrÈˆÏ\'µ¢Ú…æen­kÞïqZ¦Í5Vy.{_¢”4†¢gI«Z7=‚çËkS¥a¬l³H7p9aÑp1jƒUTù5!ºÔÇ+Ø?å)µ¢×î¼ÿ\0*Iåd1ß3¿d÷]\'SkÒpÌø£ùqƒsåcªË&\"\\Ñ£b|\0½,o§Ã°šz2óÝw8yN#”aôS\0m,¿ºé1Î^ß8ÇäuV$û@$«é&û\nË#?æ‹·×U½Ñ¿ºÜŽšº(Å¶VzpvN µ¢ßkŒ¼’:]XÈÈÔ-9vÐ+2\0ÛØ+­HŒ°±Væ* ;h™rEÅŽ:n³JònÃî;+.gX\\)}«\0¹:«\0®›…¶¨Î&Ñ`¤I@)fèŒÔî:*¥nº«­Ô,X´í¥¡šglÆ’¬räùoÖ\nœeÌi»\"ýz¯¨}Œƒ€}›ñU6ÑHLp÷~Qm?ûˆäXF[Å<M\rKê«&\rðÐN¤ø~®âþ\ZÀð.Áp\\J¦88s\r’ªî³ê^5·¹.Õ/§Ÿ;×Î>Ìð‰8S…ñ>7ÇA‚WÆñGÅ»ñŸ“ \\/³ŠÑ.%ÄÜmT3Táø[¤i#yßìw~ÔøÒ,kìúªN_&\nš–SÑÓ2GeçðªWá¿aÕ&ÇÕñ`Žus ý4%\núOÙ>$ÜG‡[P×ë+ìáÚÃQû•({_]53ÍÊæ3Áü]xÏ²Üm”ØRº(^æ>aøÝ”—ü—¯ã\Zi‹2}lèÀwê³omðq¨jùRÅØ>ä÷u1Ú_O^Ö\\ ®bZn¨ÅO>Ÿ\nœéh²8Ÿ\n»Ç\r k±^ÏìüS0vl¼[Fb½w?.$YÝ…s­óÿ\0ÕïÂò’yŒèRJé MGª	$Pu(I&’]4(Ý²ƒ´*Æ•	r¬¢-:©¸Xh¢ÖX)8‹j›nSº‰p\Z•W©Žújš.ºDêªõÕ6LÇ›ª,Jé4e‘zCêEÑkj\Z:¡HêšTÕ\r@TM è’‰¡B6„¾P 7A×Â,ß².JCDÊÍŠIß²V©ü *hÛUæé¸¨(,]W˜7{¡ï·þïo…ò[í\nœŽƒ!!½‚›ä$†Ç·öTÄ@»ýÆç­–¦4»ènƒ²®úyÔ«å©lL1Ç×sÝX%+ËƒX>–ìŠ&¶7M!\0lÐz•…Ó£)7:¬òM,ç—]•	¥UU%DÙ\"÷I{[²ÕKN!mÝîu**FÀ\rµyÝË^P/nÊ*¸\\r=Ý\r–iò†¾Fë¦—Fc|ƒé½Êd€D®ì³oJÇK‰µü¬õ,/s›{1¢ä’¶:A9GÕÕrêé¤k/w†ÔRÂ&™î{²ÆÃ«ŠÉŒbwÿ\0—¤ch%Îî´âr¶(DqÝ¬÷^mò\\Õ6ÆÑ´\\ü©ÚÏnDµ·»W8®ùËáÑTV´œÛ±‡r®à\nR¾¢º¸^’ˆfÊº~Ë‹Õ»â7ÔçSßømìÕÖq“³—-éÓáç>«çÏ­ÛÀ‡Eà¸Ã5œ@#Íf¹äeñ{ô>3G…×UM¡-6 ²ø•Þ¿ˆ&¨\'èÌE»dÖ<±ìùY¥Óe¨0“¢óü-‰Š¼ôÒ>óG®½Bõµu“8rØ#i\nöl£ª“GŸÑ/§MZÜ j—ð©nº+·\Z¬cR‡¨d÷h/},¬B¿üX¤Æàãqo\nV?¾ŠDn‡\r’‰6ÉpÓÑS%<ŒÊHîùìÑ›^Ö\n>¤0’Æ›ü«#Y‹rÚéÙkmsK}ðFãä+Ù[—§h*±\\ñ­í®n9€âXÕ8¤¤ÍlŽ³Þïh\r^­¸Ìy\07Å—â^\'Äëâ‘œ!SË\r¥Žÿ\0Åhñ}ÿ\0E\\y×C	Ù%Õ…Í¬Ç_€:åfŽËäÜQÅø×ã1Tâ•/	?…NÝÏAÝdÄh±ªÚ§zºJÉ\'\'Þ÷Æu?+Öýžp=YÆá­Æ¡0QÓºOkM»’«‡–®Çp*Œk\ZÁ°\Zsj\\>”IW5ìÖf÷8Ÿ6Óåt¾Õ±úJ,;Âð°Zib-€âa\0_çýÊÙ‰q>8Šz²hçpš¾®?¡¬oáo}€ºù\'W¿ÇjêžMœò~€\"n=WØýTTœ_E-CšØÛ\'´lÏpÊ×ß¸¦\"êS#Ý¹ìZw_•èª]‡KESŒ‘ÉÎ¨±Ñ~®e\\uØ=%Sløj\"kÉð@¿÷\\ùLíÓ…x§FÙX±Ø‚Wf¸a4mÑ¡rª¡õRÓÚá§Ú{ö[q\'Ù”ÑFXÆd•êŽ~Î^Ÿ‚÷aþR¼Å¬{¯QÀí\'$taXå{k—þ¯ ]4š™Yy‚ÑÕº7IABW@]+Ý	 j=Sr[ aM ]Ð\n,Zöûn²f$­%÷m–vŽéŠÏT]—EÊµÆä®óØ!`¨¤Ìí‚Šwnº1­î³ÃJXµ±¤¢Qk#$+9zãp\rRæ,vEŠ“´I\"¶ÀºL)\0ì“•/qª´^¡}S»EÔZ”NèI>‰\0…CÎ®\n‰ÝnŠ!4ê‹&…*„þPÝ42˜·Tf\n„‹”ZèSK2Ê\"vÕDèP.SÖÖSõ@Òm¢¬—t²°Ý5Q•ÙÉÕ¤ŽÉ±ÒFe	$#FîPT]?,ß–ÀNäÝd»Ý\'´¹þNËW ¿Y\rÏöW¶6³¢*˜â$æuÉîV¸ÃZ4ïå$˜\'˜ôQ{ò°›Û²r_P;+FXd\'1ëuT’mÉ»†Ê\'øwJœ0Þ2ò-q¢æé#-D®ç‚\rõÐ,ÄÚG8ìwW5¹ë2HUVDç8²=îzr«åõ0Ô21|ƒuÈšEO_#¿Úì»qÓriêK…À?¦¥dÄZG+[­Ü>ñét[p³÷Åþ¢´Üž«Ëát¾’ŠOîœ7+[Ûåuq‰›5&ÃgGIJÇ‚J*k&–@\\Ø@\0tºÓŸhÕŽÃ¸\"¤±Ã#ycä¯ƒa\råG,î6Ó \'¯uõ¿µ·Ë]OE‡Äâ39ÓÊ<\r‡îWÈ8¦fRC:=­¼–è{+Æ1Î¹Tœ”X·«ŠöÍ¨îÙ°Š¸ëèbž#v¼]|\"ëÖp/;¬Ó¼úiM…Î+®?Ûë9{©†{Aµ“‰Í‘ÌÔU­ÑÝì³¯\\ªãŽÚ«ZÍí¥À¶©þP-Q\"Û…vêÝCP²‰¸h-ÝONŠ%\"ÊNnŠ¼½ÂºÅºÛ,în€€‹YZóc²ÍQ0Ž7=Ä´\\”g—§žã|XaØD™\r¦“ØÅò=ñ»;æ»{´Ø®×bçÅæ“ÈŒe`ïåpîµ>|¶½.Å˜õ$ÍŽŸ©yvc˜UÕâž Å[€zJ¶Yª+r¬#`;~«ÒG‡ã5ØÄ$Ó:7OwÖKcñp¼å}l••fyÍÍè.ŒE”5N¤¦›—¡“Úï#²Å½îœŽ.q$[ÀÙG¢¸©=ÄÚçaeú[ìª³Öð&ÈÏgã¢üÐ=Ü¾Ëê4ÑfI.|ÝxqÝ{\ZêVIÈ•öˆ˜å>Ñrê¦3Îç»NÃ°^›Œs¶I}ºŽ«ËÈÌ²9‡§^…b½<.“u½×¯à8ÿ\0ç&w@Ë/$Æëeì¸-ÂªNäŠ×É×³o…%‚\Z‚âw*ÖÎK­b7m(ÕEO2€ºi\"ê€›%tR@ït‚	IÔN‰Žˆ!,©9¶M®²–…\Z•F~…\Z)¹šè¡–ÅU¢`¦AQ;*šw²wò	(\' j­L5U+²¨Êe04Pa»uRº¢N:*t%K}ÒTö$i^ÉÞãEº{$‹ ºš	€‚¨`]\",„n¨.„!eBº@]=Ò:\"ëA¤RM+…å3áA%î•Í”mwjª—èÑú©ôëÝH_Âh\0-¢„!$Âª·[ôG)ü¬Òi}•›´“k\0ª»¹@¸î4P`‘†Z¦·U® åôP¤-æHOöS¨9¬-¥Ö]4ðÊh!…õSÈofö\\)ª­=D¢ÃMN®¡±Ó½¿ÙyÊƒÿ\0#+€\Z›%I{&;™FólÌÈéñ²Âç—aæ@?þË¦çGKÁò>`æIXàÆºß€oýW+w6Ôƒ·…wðÎÜ¬9óMÃ¯‘í%ñÈâß!uøO-ÃeyÞGfv¨4Î¤¥eÚ[vÇ¨]:Š¦a|3#£·5÷È<Fy>SÇ˜›YYY9\"ÑŽ[<¾]+¦©‘Ò8¹×Ý{>Ä\\ê†Ò—f{	/wwu^!Ú•×„qåÊ—÷E¿d¶ÙteôNâ«e ¯ˆÞïì¾¡ÖÊWçV—Óg\rA^ë„¸ÁÑé±\'u³_þë<¸ÿ\0þ?—=¾¨z•`p\\ÚZ¨æìp Ž‡u§š?Ýç9[.\\8œ¦éÙkÅv.\0Y, nªÏ{[¢™}Æº\"ìN×ÙGm’æYS$ÍhÜ~ê¥¸opmóó´#]‡Q»Üïæ¸t–®3âÖÒµÔÔœ‚Æ¡¿ü¯™<¹î/y%Î7$Õy¾_“z„‹Ûd%ºÓ‹\\5.sÚ$y —\'aewê„þTÝ\Z#¢v½Õ\Zh uLðÄÏÄá…õü‚(™mÀð¾qÂÑ4Nw\Z/¥áº4Ùqçv½“Ž¾‡G/¯ÁÃ¯üXÛeÇª‹1ÓGqä%Ãµb\Z€Ç}Ýj­ÐÔ=ƒð°÷-qê°ík¯WÃ,ÍJoÕËÌÔ5¤5ì7Üv+ÚpŒ!øs]ÝÅcõ¯’ôíÀÀ\Z2…lp“\"¾(¬¬6j–¸\"aí¢­ÑåÕY#®ÕO½ÇTžÕíTÁº|£mU\\Æ‡eê´˜±FéZÈ‡¡·DQ}	)´¨»rˆHB	‚¢6M_J˜=Òr]u;¨%tô#E\"i±SÌ£tÕi\n©\0qÕY}vDE	ßá‡„*C@¢HM_BÕM€Ù,¡H%\r.ªMULìŠ*Û$M•,šé8ßt¢üÀ„î©`ÙX4DJèºJèwMEM»§µJ6‚uY+¤åÈ2­§Fè°Ét™¯Ê½&f…%…;)L4ì—E&›)‘tÜn€¨¨L\'dÐ!½•nš6îáuEˆYd¬c[qr³7auˆ(®”´\rò°ÅZt½–ØÚ^Üû7¹DIÚ±U;²³ôU¼¹óX;O=”‡érGtR sÜuÑ)Ürï©S¾â‰¼f©ËaíY­Ç\"»ÚËtºÀöéq·ÜãkÓÄ™Î=6\\ê™d¤¥<Ÿl„~VmÅÎÜž%¬ÍˆSQBìÐQµ­p]Õu°\\)´”î««>ònØºåph©A®‰Î½ÙÉ+Õ’êˆËµ·o)Âùv¼ÿ\05ÆM^\'†aôq´<Ê.à4hV} ÊØ(£¤†Âh`sÇø²ïú­”4ñn9^næJão¦ÃEãøÓ`Ä0C8w2¢GÄÝ{oú.ŽuùïŸÕ×M+‰%Î:•Ï’2Æ‡\\»bìj>F/WF™íà•‘­®kkjÕÚ<÷uOÂDÚä©<ZÖQ±Z¡È¿¹?ó°D×gâ\nÌ1À1Åñ~Rv^ÊƒŒ)æ\09Å®¶ ¯šfîöÑF§+^ÿ\0ˆ`#ù—VGŽBãõÙ|…²½šú«[Y;]í‘ßº½5ç_hƒcµÁj‹m«‚ø£qzÆÛ,¤|(OŠVÌÛ>¢L½®–F¾ÊúÖ)ÄÔTVçJÛŸÊnW†ÇøÆ¢µ¯†ˆò¢:u+È¹ÅÆî%Ç¹II¼íH’âK‰$êIê¡õÑ?Ô§¸*ã-´)	r¾µ“AE´\n)†÷GÒÛ¦Ý”&½´U5éxiÚíuô|7ùL·eón:\0WÒ0Ïå³áq¾Þ¾¨íÒ®:ô^Ž¥Â¦’)™«Û£—™†×Úë±…ÕJàÿ\0¡ÃP²ëÅ\\À%\"Ú_eô>h3:¸þ‹çµqr§pÿ\0²ú\'ú_%b§Éê:’NèÜ\\ÜÛ©ÌÃbVÌ&P˜âèBn¯kuY!6î´6BpÕÓÈÉ\\70º ¼_^‹£;‹ôº­¬U¨hh°Õ;¡\n µÓ²HCB7BVºhi÷ 6K¦‰¿}\Z%Q›¢º	Õ!pQR²t\"S·„‘{\"h¨¨l-$®p­’WèS¢çî4Vò›@°Ñ\ZÈÈé$°Z!q- €NÊÆ¶ÊéLm¢Ø&ÖÝAÚ)¬â{)4\\\"Ùz¨-Î\Zò¢ýTÒº¤0,tV4wQ²EÔ¶Ù0•“‰‘BvE ÌÊæ¦¨	:ªÈ¹S&ê?\n¶É¥dÑh@W)µBGµ»ˆXä¬;FmsÚÍÈýÖ*Š·–!ú¨²Ìnò@Z¢§dmÐ&4ÅU›¼è´z/ÌV¶žÊÆŽ¥TsÝ2VI!™ u\'`/¾‹-D-6è¡§NÆ4ƒkî´I=Ú@‹#.•º.ªn¦ÔFÜÎ²·.WYm;}Ûªÿ\0üÔ‡ÂºŸê*†¼6¢[ìî³csÓ]ƒC{›’¹x›I„_rWEÁÓUl;¬ãÁ9[³z¬r,®m(½F]†]J+qŸO,pGï66nß©Pˆˆá~¾çoà.$?}LÂÁ¬pc¸uÅ+¹UZÊJZÉ#±•‘§ì¾q\\çâtø.!;‹Í,óNòz›.î)3ÇüJçÆÚvå×ÂùÞ;ŠOMÀQÇÀ|“–tiÿ\0E¾=±^“Õb5S7ñÈ\\~IXº©_OÔ@¹]Ü]7\nTÝ P7k†š*º‹“µ®|£§”BÓKÝ6ìB]“@“vÚn‚oÞÉuE>É\'×û ,ªý’Ba@Ôod_²`wêQHh4êSRNç¨@Ô›®ê:tÁµº¨$|*Ÿ¨V(?BÞÞ“†˜s5}m£oÂð\\6Ëµ¥{ú#mû,=\\zŽ´Zî´0Ù¤wÑf„Ù_uŠíÅÑ‘Þ¢ž97s}Žÿ\0B¾‰Á§þ…ùŠùÎg4lñb¾“ÁNÿ\0¡²ÿ\0˜®uŸ“ÓÐ‚,åÄ©o\"³ÛÕuóáežªÎRW$[u0OUÝub¬à)j„*B:!„@’r/Ý½Ð¢@M­\'mQ¬)&tÐîE6¦„#& ´¢„ŽFûRÝsišöÏêµ±ä;T±lZÖ€nUÍ\n¯ªÊæ‹\Z*d\0ê¦çyT¸¢%šÍÑDºû£*aº [„\0¨ž²Hpª^¶Û‡Ý„Öëc–B# ž«A\'-Ñqx!6¬Íy²´8¢bÔÔ\Zn¤7H©¡	+@JM7QpÑ8ÂL&©~ˆè³TÕ²oÄµ†fXfÃóK˜êcT¿Rr­ñBÈÆ‚åJ(²srª+h$öVäÓtô%˜uQ5 l4²A×Ø(9Ê¶Ê‰¼[›˜|\'Ÿ]S·e0T“\Zì¥¾ŠØÜØØlÛ¿¡ì˜¨2ñíºýÐGdš:¢/‹EŽm[üL[\"7ÝaÄ½µŸÌJëÇÓ9— qgÔíu¹¹è·LâÙð°U´´»mÖ=ŽeTþŽ%˜ü¶\r+Èá2Í=ul“’é2Xø¹]Ìz_àÙ§)7²áà²º†ƒ©±.ÎÈØORJ°Ìš»”M&/F\Z]$”ÄþÂÀ~ëäœP]GÑáÒ¼:¥Ï3H?\'@Öç—‘…q.óï§Í@áëá8•A«Ÿœv‘¹µ]8ÎÜ¹×0J6ÕY’lBLmÝ”ì»8 \ZHÕIÑdÄ@ÑN¡ÎÊÖ‹enÂË)q;ÑO¾–QØè„Ž¥P³j¤F‰e÷ú¨ \r¾’pRÜ*@ò˜Ý FèºN¹	µÀH)†èMì €µ·MºZÓC²€¥©ÙIÚ«µøSÚ¨~!ò¡=½¯ƒ•ºtÕ{š!v·áx¾cOÂöôBÍoÂæõOQ½º5X*Å›¥h§ÄðöØ‘Ð¯¤pd˜y¿1_3ˆ¯ ð˜/ÃX?qY³SäôõBPu²&}Ù¢©£Dì±âá¨°§t]-Ž»-!¡FéôC\rC¼\"`BWî‚QpÐM\\P™(Â¤Ç›ôQ¸ºg]Žˆ¦ïqºˆM¨µÎˆ¥t“´Ù\0éª&&…§tgÚ¬è„\'ëUk:+…\"~\"wH¡\n¡µIßIBxn)Xèÿ\0ô¿¢Šèp×óŸò½c¶oÂ+ÌýèB±*MV\rÐ…”MB°H!	6 ¡	}ªè¾”œ„ ­ÊBÔAÑEÈBŸ è’¨‹Ô„	»¦„T‚:¡\"q}AdÄ¾¸Ì„+}:qrê™ú,ßÉoÂ°·ÓÊcŸƒõ\\Èÿ\0ö?ÿ\0xÄ!håècŸþ	âÿ\0óŸÿ\0¨_?ú*ò¡§Ÿäô£ªqýCå[sFo­ßªÊz!`ê˜Ý@ÿ\0Ý.¨BäÂŸ·êIÿ\0QùBî†õBJ°ý*§}eVªLÙ3õþˆBæ„>”Ð…¯Å?Â¡ø‚¤\'·½á¿å·á{J?¤!1ëü¡[Ðü!7Û¯âê¾Áû?ÿ\0yBSäõ‰©¡/=$Ý²‹Rè„(RnÈB	BŠêšŒÜ¥Ô¡¨¹\rB£RfèB%/Ä‡î„!	3°B_ÿÙ','Marilyn-Lima-018.jpg'),(4,'ÿØÿà\0JFIF\0\0\0\0\0\0ÿÛ\0„\0	\Z\Z\Z( \Z\Z%!1!%)+...383-7(-.+\n\n\n\r\Z+%%0------------/------------------------------------ÿÀ\0\0á\0á\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0I\0	\0\0\0!1A\"Qaq2‘¡±#BRÁ3Sbr’Ñðc‚²Âáñ4s“¢³$%CTƒÿÄ\0\Z\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0,\0\0\0\0\0\0\0\0!1Q2Aa\"3q‘±#4ðÿÚ\0\0\0?\0¦éJP¼\'…^ÄÜ°öšíÂ	\n»ÀÜ’tÄ×Ïá—°÷\r«öžÕÁº¸ƒã‘#J°½\Zq>€QŒ»ºq%M…´Ð‰_V`g0ô‡ÓÄñ\"ïWÕ¢.KjL¶Y’XŽdòå@E©JPð¸;—	í=ÂbˆrrƒÆ°ÕÉù;¦˜ã\ZÅ¡ãµÍ*¡Æˆ»pw\\ñ\Z+Ú\Z\0.dÀr{€æk¿Ä:±…\\eë,³Ú0âtRÈu\0¼Åu=ô»ÃÅÛ—p]~#Ceåa{1–[Ô“®`	Ö¹½,é¶/ˆ¹7®E°{6ÅµönÇÅ½‘Pí)J)JP\nR””¥\0¥)@)JP\nR””¥\0¥)@)JPÔ¿ \0¿ÄŸ6¶ðàöî‘¿x¶>Óxì*EèÏÑcb²âqªÉctµ¨{½ÄóTøšzDôˆ–JpîTC-»Žžª) i\Zfƒ©yÔ0p½6tk‚·ƒ\\6m–ë8Ý‚„Œÿ\0y¤“>uZðœ0»~Õ²@u’`A`µtþP–¿ô¸C;\\#Þ›ü*ŒV‚Ðƒ\"€ýŽôtõÌ\r¶Ã2Ük#G`À(i;Ã1ê9Òƒáð|ñ½iF%zã«³u )R‡)æj$¾–ø¨´-‹è¬6”ÜÈ–”>yf¸}&é†7|²©•EPˆ~U\ZŸ;Ð}puÅñ5—…ó8ïTˆ>\0öÔÛòâ*q0ËmWo9`½®Ög’ÀÛÇÂ£Þ†.Å¬O5¸žB\nêþP|¼FÛ}û\n}ÌE¡èG‡%î(½bfí=À‘˜U\'øOý>p+Mƒ\\P@.Û¸ªX\rJ7f¼ÙP¯@mÿ\0º;á®{{vêÀâ=9ÀÞ|gâ\'ª†k}a#.êdzŽ$o§:0~x¯+{à’Íû–­_[öÑ¡.§ªë\0ƒç¬kF¤\nR”½U$ÀN€xò«oÑ‚ðüM²‡\n–ñV@bðHq0dœ§ÃÝY]gNXÎB;¤‘Zq¾øgUms `|y0kŸrtÇ`#½Ð®©\'Q&ªd³×^Ëm2†m\0ÙGãXiu=Xå®Þæ÷Ñ±ðû˜±8r	ûi˜{I…`®ÇIÀ[ª‹²[U®=t×-ÑOÉ‹À¥)W()JP\nR””¥íZþ‡=ŒAÜRM~¦ÙÚá»ºÃŸ²ªfØùWêÞŠñŒ>\'ƒzÚE Š M¦ÖçH<¨ÁôÅéÙÍ€Â4>X½qL~cf\"$ªcƒÚÍˆ°½÷­ûÅ\\·=ðôbø¾&ä±,Ä½«rÄÉ2Àë3YxCú=bõ¶árà¸¹Ò•»y» `N±¥@>?(Ða?æ?øEQ•úwÒ	á÷íYüá‰k®B0`%ˆ˜2§š¦zWÑ®fÃ]Âqazà\"-	m{Ô¬ÐÉÿ\0„áïý0Þ±jéSd)¹m_(as0‰î¨¥nkÄïZ²-•G\n*æ£žUdþNø¸lMãµË¨£û€ÏÅþuôý…ËÄ‘ÿ\0Y‡Cü,Ë@G}_	Åpl[—ø”§ùªùGa»X+‘Êòÿ\0L¨øµV}BxŽ\'éVO°\\ü*Ûü¢î£áVD›®G|óÐ­ì¼ZÏí%Åÿ\0¶Ë_™ìeâøˆZoi´³ñšÍèCŸ‹[?«µqþÏ_š±¸½ð„[KíêÁ?@A«ÊR¤\nÚáØe¹p#\\[y´Þ¨o²òé<«V”÷áðÍ’ý–¶|F‡É„†F·º1ÒVÁu­m™Ô(,tQ$ì7åÌWK£Ý<½bßSuEûC`ú²ŽàNãÀ×Q:W:ý)ç6‡ÀŠâºÉ¥¶PÊø:ª®/˜Ï©ËÂqŒn-^Ù´.‡gŒ¡gÄ[¸~oe®;K‘¾Òy*øxÔƒ	Ä/^Löpì	ÌË•r\'/2 xT7¥|\'˜½Ð]uPr¨€g/!kã\\nÙlÂ„}×»:¥\r‘ÝêdjýâìÎwbMc¥+ØKƒÌoÈ¥)B)JJR€R” =¯’£º½¥æAÜ+%‹¥]wV<Á|E|R€ýÒ¤^5Á:Ì<5Àâ¨Õ…ÄÕíø4HöŠüõ…ÁÜ¹pYKl×IË)Í3#Æºýév+‡Ü/‡}¯mµ¶þk#_¬ôæãµù¶Ör5axéÌxM@-.‰ðÛ|;†Ã=ÅVÑI&3ÞifNäÏº¡žžº9rý›8‹6™ÚÓp‹™º¶çX\ráÎª>•ôÏº·/¼3m-Ê¢õÖsh;[ÔÏúnÅZ¶þ1\0æsmˆý >\"<ªAóèW¡÷Û¸»¶^Ý« •.¥sÜ#(\0À™ò¯O|mocmáÔ‚0èÁ£ï¼À‹_|wÓn.ò±a0ä‚ç7~ìª…>$\Z¬Åù¸äÜí†`ÄËë,o®Óã@\\~‡ðI€Àâ8¦\'²E¹ ƒb<]ŒøÚª.1ÄŸ~î!ýk®\\øNÃØ {*AÓ^^Ç‹vúµ±‡¶\0K(ed˜„iãQ:JR€R” ·Âz¾ºß[ú<ëŸ÷gZÔ¯j\ZÊh•Üýo‡â±Y¥«pð§RTÛ+¨XìöuÚ«Þ9Åñ•ÞJìD #^_Wñ«—¢?ð	ßÕ,ÿ\0\0ªS§‹ëŸ:ðk[gäö#,©ü;†I#i1å_5íy^ò<qJR¤JR€R” ¥()JJR€R” ·Â¸{_º¶“sÏ2|+â««=¾±A“6\\Ã˜Ì6>5yôƒpæÃ.+™©SšK‚=d3Ü{·Ò¹õ7ô¡”i­NX(›ÖÊ±VA‚<kâ¬œa0Ö¦ã\"›1”‘&71Ëj‚a0Æã„]ØÇóøTÑz²ûm[%·#`¦YûHØgùV\ZëôBÞ6Kh¿3ø×\"´®[¢™œã¶M\nR•r¢”¥\0¯E\0­Îƒk¬ê –Úá˜&\'ÀoÏºªÞÆ>çéÞ‰HÀÛÙ/øRý;\Z¾Ÿiª\'Âîß¼å\rìF\\Žd;T˜ÐÁ\"´Ñn³ÛG3Ô´Þ>¶õç­&%»±×B[¸îjÒX»&†xh³?^§•z\')JT)JP\nR””¥\0¥)@)JP\nÛá¸#zà¶U›EÌaKrYØNÒyÖ¥*61Ø+–\\Û»m­¸Ð«5%áÝ7¹‡Â.\ZÍ°$³¶£S:.ÞúØàý=\"Ø³Œ²1(+0Àî3¿Î·-ñ^9…‹`þÒ…q_cíemþ‡]UûÆi~§ÄnãÕYúÅbK,åÔF½Ü«­‚ái‚²×n0/\Z÷Ùf·1=1µm&Õ½€\0Ê²<jÅøÅÜCKª£aüÏeÙjÚ–ØÜ\ZÍÂ§¹½Ò517Ë³;nÆÒ±R•é¥…„yïžE)JJR€Ë†`I3,h«Ó‚ð+õìSŒÆú€CªÀ·°¢\"\0{*ˆMÇ˜ùÕÝ` ²®NnÈ!®9·d4Ën	9OŒƒ^WÔ\\ÖÝ¯OCG¸½È•q[økvº öÑv`eÜ7ùT\'‰ñ+ARV\r9fNy±´ÐwWÅëöó[ õVÓ7e>Ì‘öœÇúW/ŒÐj†´ul„³hãNVÎ‘¥y»\\žOJºã†FqxÎÏ\Zöõ\ZI`uùÔnàƒa¥Kñw¤jèvïïçPâkÚÑÉÉ<žvº†1îyJö„FõÚyÇ”¯E()JP\nR””¥\0¥)@)JP\nîtGƒÛÄÞ+záKj¹ŽXÌu\075Ã©o¢Ñÿ\0¹Y½þ\ZÇQ\'\Z¥(ððkBNÄ¤²‰GÀðô´0å.gLòc´?kSîªÃk#²ƒ0HŸUlzO#¬:wrÞú¨Üê|ëéÍ´ÞNÍr[bð|Ò”¯Hó…)JJR€UèûŠ­õÝÈ{`AÝòÄ’Q¬©åUL=©8¶?Tß1Ü+]Z•-ø:´sq³K_‚Ã*Õ»0Ü³·# Ia¬ëî¨/ÒH]À:ïÚa¬óV6/ÝV·s¤=Ë>Ê­øÚ 2ôu¯\n¤zõÉá‘-rKsî®nqd1Ïo:Ëƒà×nÚk–—¬È{h€—QÉŠîT÷«è©Œa#U9NÇ’CÐž„.=Y—€¡e¬§8YÞI\0ƒ<«©ÓNŠ$õ… ‹”È•±ÓœöTc¡¼up8ƒyÑÉÙ¬&7†•×â<zï¶Ö†ó\n•2‚\Ze‰Ú¹®WuT¢þÔM[64×$[„ázËÊ£Q˜dOõßZ×ýfýãó©]ü*àl˜÷iËËœ\rüb¢5ÓUFä»v_&VCbI÷<¥)[˜ŠR””¥\0¥)@)JP\n•z3ÄÛµÄ-½ë‹m¼³°Uõ`jt¨÷Ã·Ù1˜ÀÖ¤÷MX	èä![­qa-ÕõSÂå$–`5y!\\ú‹kŠÛ7Œ›Ó	åJ(Ïéiî’—¥s®WV0ŽF*°5Þâ}6CÍÐæ J‘ÌI™ >uÅ¿nm0sG-{5M,kŠûM/ê4·¬`ÅJRºÎAJR€R” <ôAlUÉÇÅª	SÏD­–õæ31¼NÃ_urk¿\"GF—ób]x°2Ÿ/ú©úJ¢X@ÓOŽúU¥Ž¼½tÓýEU½!N¿Ô×ÏAÿ\0‘Öž?k \\hj¾ÚÕáØû¶.¶œ£®Äx=à÷VçXËí®U}-ÖUÅ¬™ÿ\0ýó>·°ÖÝ£Ö\0lâ:_páÛvÂEÞ«m5LÜ„O…@êU…àø¦ÁÈÊ\ràÊ­ 0É©`dSX[§ÓÃi%ê¶éð¿¢9ŒÅ½Ö/q‹1æáX+éÐ© ˆ#pw¯šìŽã±É,çžâ”¥XJR€R” ¥()Jg†Ýu˜×X5Þžý*ÐÆ-ÈÊ/Ý ë¹3üBë Nâªj¿:;l%¶r5¤$õ`¶ª\'S¿yÚè¼¦ŽÝ-‰E¦U¼VËYœè`’Àwý¥‚\Z&ÅŸ©wK”©Ì	ÔíÂ~5ºdšÓL³É¦¦Å°ø¥)]§œ)JP\nR”¬OCÉõ—pO~µ]ÕèÖ¿ýÏóWÔ?×‘Õ£Y¹~å±Ä-Í± ÈóŠ­zB½¦|¾3V&>Bh>5\\ñ¿YùÌ×ÎÖó3Ü¥}¬ƒqôõO‰ùV	ÀïbŸ-¤Ûv:(ó=þ&á\\qwÖÓI^Óºo/\Z¸øF•* E\0ÿ\0sç^ÚÕl‚„VYåßRv9Ë±èÏAía€r¥îé,Wm>Èû>{×_h‘¯=¼êÁN#]ë‘ÅxHàOv½û×\rõßê°½WWœDªxç·{×N×&\Zíçí¨?èåËRWëÀv‡˜þUmq,)·„ïQËàŠiõVUÂìmmPµf]Êº¼©Wá\nÝ»`P6og#Qb+Ý¦èÚ²&Úe[Ã<¥)WÉŸ”¥XJVkWUIù{êK¹)7ØÃ^]«\0ˆ7~íë¯Âø&bVÕ‡ºÛh\r9ÇãY»=‘}‰,É‘°Ãt#¿CWçP0õ?¡YØT|j¤ãƒÿ\0U|ýÖ<ÈØeò:¯•eÁ4¡pN`BèÀpß…sj´îô¹Æ\rèº5óƒwŽÞ¤êHˆ·º¡—ýfó?:”3±Ø±–\"Þ§áµhÞáö„=¡#q¼mÈïñ©ÓÃ¤°Ù{îWc\ZW]¸Jú¹»ZGkM{‰¬«Ñ«ì¹ÖÛ•K…™Í ®ž¢9z(áÒ¶Îýáß–µðøGb­¾>HéËÁ¯JWµb‡•bú#õ¯üjº«Ñ*ixëë/‡\"wð®©<iåûgfƒó¿fZ@öIîªó˜ë:oòÚ¬,rö=žÊ®¸Í±,\0FÑøWÎ×ê=Êý,ÃÐ›±¶;Ã1éð««ŒÓz¢xäÄÛ~@Ÿ²y\"§	Ò&Ô®ºì¢vòþ´®»fã4âsÙFòÇ»ÄHŠc8“>i<â<*?sŒ^}’äx#i¡ï²}ÕÉ¿‰»¬ç¸ä+;.¶ÎJ×¥ŒyÊ7¸‹Á0NõÀÄ$ø×ÍÜC‘=®ÿ\0‡hbqd´óðò¤a3m‘^ç—-r:k½FúIÊEÐ4c÷»ýµÞ\\p;ëåZ½ pØv:zÊF¾5ß¦œ¡4™É©©J‡Å+Øå{›“ÃÞ)JUKŸH²@ï U½€è;…n€¤\rÔ›ƒÀ\ró‘UOµšõµýµùÍ~ˆÂ\0©Äs\'~{Õ$“|•²rŒxg#Ñk¢TÝ\'Ã+¾ÙüD×s\n.P\0‰Ð\0¢<„\nŒôÛ¦)€UPª÷žB`yµ-\Z‚D€5æyW[qË8Ü?[eô‚Xö‘ÈÕ[æ=ü(¥c	8å²¡â7K5ÂI=¶4Çº4×mkë…á^êž®ÞsÖ	l‘Ì.•%ÅðÔÃÜ!íÙV]ËMÖ#pÊnBë?r¾³½è\n¸‹Ë¦H¶;ÏÜúÍ¼Iá#œ.^µíÛI^°–“Ü–Á3®Ó[kÃ-o\\ eÕº¤#x™ãIå]{Å¼BZ°§›´˜ðTR	ö×[Ð°G×^b³QB-CµÜi5^C’Dun„9¾¦Ù?iÐ~±å¾QZ†[ì@¹vûd.{†b@ÓmHîÚ§¸^‚RýZ[{–ô¸ºË‰#@Á³eÓº ÀÒ»¥\n2”*aI\'˜ŸVóª¤É”°Q¸†É·vÛ#¡!ƒ!ØÆ¤Á<+X\\´FŒ#}àëÊ·újâñ$Hú÷’e{DA \0²<ëA†®3Ã¯ª± è&{:«mF‘™íÌ26Ì6ý“?mb8TìŽýÀÛjÕœÉ\"Ü©a\0ù¸Ò˜‹dkÕ©ò–ËNß²Ÿ“;pÎ\\õæ\ZîtWŒ\\ÁN[A”°--ˆ€cËZŽàï`4þþ‚9’ÃAã[1†ÛK†Ó|­äFÒ÷û*–W½m—(Ò6íyE‘sÒ*8°·—IÝOòùTw‰t†Ó“ÔžL±î¨âc	ÙŽŸÙ˜ïÜS=Õô1`ìÉÏ›íf¹?ZyHÞ\Z¹Äíðœr‹ÈK€3[aæjwƒeiËŠ·ËAx˜ö\rÎµW\\º7 Dï#Û¤\rjOÐ^˜¬J­ü¶ÕTa¶ºù½QÉ¶ÛÊ«=*üW’ÄNÑ«ŽñÙ˜ÜÈ“\\v3e75¦A¦ä\ràLì{…N-©†R2°ÐDíä@ˆ»ª·7X@L~5É\Z¦¤Ô‹+¢ã”fÄpˆ\Z1öüâ£üSª\n–ø\r½ûxíS\\E®Èå cæjÄ0—Zóºâð6­˜#éà¹\neÉ;iÝZi¡dåƒK,„\"›#x¾w\r”Çˆø\næc¬\\Uí´9øïRÞ1†eqxk™[ªº¬h	òÌ	ŽuÄ’ÈÀÆAHcÜtkÑ«zõvJ-ý§*¼¯¾¬÷q¯+¿©òpt™ê[\'`O­«<.ë}˜ó1SþƒtS®´Î×ˆUb¢k¤“$è5©ÞÃlYK÷¬¶ìª®Í™X±Ð…PëÈ)®~¤ŸcV¡[+¾ÁÖÕÔº÷Cd`r(ßÂOò«~ÿ\0\ZK8VÅÜRP<	15ûD9Nü«CÅp¸\\eŒ²¢åîjªƒ!%·%˜¾ÐyÔ_ÓO+jÕ€OÖ\\goNÊí$ùÕ£Ÿvc7¹¥‚±ã<Zæ&óÞ¸e§ÀJ;€\ZRF<y°øÛi\'«¾ËiÖy³B7š´îšˆ\ZÝà„ý\"ÌoÖÛã£\\?KÝÁÚ-™‘\'Ú+·2n\rym\\n‹ôÇ½vÍ ÀÚ2§õ–ƒpCT“Ù ï4ô‹y×‹Õ‹9	¢òkvðÍ¯uVÞ‡ð7GWd*–íÜ.[²°W(˜\Z’=ÕŸ)ðH:{éî¶0¥Wª`oL6rDõ;z€y>&ã½)[\\/éÖ´gE6”ý‡¹Ù‚~ÖHcºŠ¨zGÁ/\\ÄÞ¸\ZÛg»q¿Ml’û]ÑS?œ+\r„|Af\\¤µ»eÒW6p	+0\\	ì¨n+Ê-ûŽˆqË¶qÖ®+^â­É3]€pÝó3ç_ ±B\rÅXÊµžè:ißáóª…}Î\"ÕãzåÕKŠÝX·’¯i‰š\'ÂjÈÇtü‹¬«‡´ f[ŒYÁmôÏní)9E1Ò•ˆWÅÜñHÈ÷ÚNŸ¬>îZxW:ý¥îÛk„[m¬ÝÞ\ZÃÄ8ãgf{6‰fÌt:™$ë{Œ3™dB5Ò\ZÄóð¨QlžÜ3¤˜p.+\\}	\0ë¨?tïß_\\VÀëTB´ÀTå\'xI®f#ŠÞÐþ\"DrÓÊ+ãéË9‚å?³·¸Ôíc\'G|Ù`êcFS@@;{A¦!C>b ì¨€§hbkFÞ=CfíÓXïðî¬‡ˆ.`ÂF€mË_zS$ðÎ¯ÃÜ¸ZX \0cËI¾µ‚Åùy`§BÛå×@|G¶µðüP-Ö²’±Ù]9÷Ï.êÉk\n„Ì	ÒcŸ/[Mý•\\2W&pÍsC\nÆãInP½ÞÊû[×1\'ƒ²VBu3²•šv_\r~Ó¬“¡h‘®X‘¥I:m¾‘e\r³ërv$hÞ\"‰¬òR,N“q+·,¢áð¸¬¿Yô{¤ÈAVÍlêÔVÎ}aÈê-89>Ð‰ð¦÷û\ns©ÜH€;Ìç\'aü¦±ÚÄƒ`äÜ	\Zg×‘\nK¥œÊF•˜â$WÑá‰µ“jíÇ\r!Õ8\\‘—6ÜëèšÜ±…Ã­»¨–\rß[«bMÂ§Bnˆ29ÔÄâ\ZUK\0AÒXIÖy1Ÿ04¯»W˜±‚ócÝ§úÕTªì¤Këwq\"?¢‰nÎ*Ú£Î&ÐLÇ«ì.|Û+ÒcŸ!Xú3Ð¢\\-Ý,ÊïwÌ\"@‰Ë¤ÔÚíÆ¢ÌÀÎÙ¢H:d0¦¾]õ–Î´%„°2	ŒÛ4fúV‹fÞìÏ}™8ÿ\0E_þ†øš•ÞüÏwï·ÃùWµO³Ë4Ýa\\Û¾mp{Ê¦àuRHY‚˜buÐªÆì3`pf½m\nÎÊ÷TF{ƒ,‰ä ûÍs±ÏeÖ2¡\Zs“âyW>í©ÃÚæÙØ\r¢41çS_cYÃœùä˜cñ¸vãˆlBä¶öà*1\'«@\0\0€5#yk¤;…Å]¶Ì¸€ªšL™ ƒÌm\\G¸Ãm•: &L‰\"	Ž[í_|L~‹-µÍÖ˜ûS\Z´Ú¥K\r/ÓM6Gq93¯6^Y£7¶4Þ³pœ{X¼—’3#\\ÊO|0\"¥ñ—¢z›R\Zu¶¾ï7­Œ/\Z¸“›„ibç¬Ã£L„›UÜþ\nmù78ßÆâ-¿ÖßÊ@¼„1Ž`e€À{ÔCÆoµÔuîÀew$k§9ï©¾Èu;	\0N¤(ä6Ò¢\\<MÛb>Úüë:ðÓÉ¬økN5„ê®”•1÷Láá]>Cá.xêÏdeŸXIò\Z||+SÝ-x9|$ŸÆ¶¸T-îG7ÉNŸ\Z™sL8›#õ.·qJ`û²Ë,N$®£Èä}D*Y‡I1¶¶õþñ;U­çjxmœî“Ø‹ÙUDŸºdLw\nÁèæ.Ê–»†¸Š°	eÐNƒ_eKq|$^eºÈêÃ_«TUb	3Û}vî×€|E²\ZíÒ®Ae7Bs [aãH<E#;e™¶T5î]*Ên„áÑ³ N·Ln9\0ÒkR×G­Í¾è&áíïUó‚›‘k}Û@åXÕf¬;h¶ÁU¶ƒVÊ2±¶„;A†§Ÿ*â]ájXÊ&¦`gÛ)\"\0ý¡\nD‘Ë6ÌÌxMop‹#­]ÔÏ- ×a¸0\nUðî²dÄ´#ÙYp\\*\\*˜’>±Ž™@ÒWï¨o%Ô’0àV ¢ö‰bdsžÌÞ&¤]9±6™„ÍÉÛOVv<´®pá‘Ùý<£ìx×O£VòÞ¨¬@Ì\"uQËÛî¬b¾ì²ÖY˜a.+rˆ×oÇOu|¾-œ‚Û©ìå\'müš	®>+Ç( zÀoâu÷V#‹\',Jö¢FY\Z ´¨•*M¶eRKù;–t+\'QÚÐžùØïÊ·ì¼A	Ú/ëj‡á1WzûênnÓ*ª²Å”Ì«ìŠèÚâ\'’ëÌr=Õ†‡xð[¯,â\\›8€\Zì\rîŸ|,	çJÚ^%Õ˜;j è*0¸†×I–c¡ïÿ\0jõñ„\rTé>\"fµÆb‘ŠŽ&Ù3ü÷w¸ÿ\0þt¨çoìŸøò¯k.›5ßðU<e”%Ì¤#mtï=ÕÉºËÕØ\Z³^Ñ[Fé6™ˆÜ¼Líí®~\'ÿ\0„sÊ>&µ‚þÍ$û/ƒ«i‡Ò	Ì\n O>Ðüaã£ª;v‰ñÞ°8ŒÜƒð\'ð¬\\ö”w(çáE¹žÞ·x”Vë–Ï†šyŸ:ãÚ½žI¸~QZ‰Äî„È³øwMk[ÜyŠÓi™&¿{³sS¢(Ûœ½qx<uöÿ\0xWGˆ\\Òï˜é®o1}<áT‚ášÍòŽ*&ókB³á\\.ç9còŠÒÆv®1\'c±peÃ¸–ü*_d„_-œSCa<Þÿ\0ºjR¤qÖØ\Zé—ÿ\0þu3YÁH2Wo€eëÀ“?éYìb²’C®¼µ#-ª	ô÷·zæX2æälFµ&àÌ.ÚVp“êÈ\Zë4š÷%¥ßf÷‘Ô¼O»oi‹«\"hOyÜø\nÜÂ½´G^Ô´j\0:\0À¡Ì}S˜ß°+tãl–cªv[)¤¨g¶VÚ‰ÕT+CÐ9Ã(±à†ÜÆ±•t3ë×Åë¬ÄP \r›}$H#¸Ô’ö\"Êý`@½Ó\0•smLˆÒåÉžäTµvÁ´à´7VêD,ÜfÃ-¥$Çg-ÀXÍŽÚTme·ÇÁÂ»‰`Æmê$;kÝ\Zk][*ês—PzOª¦…&F„ó­ŒG¶ÌìCÝhÍ9ÛdSÅ_Ûç[¸®în‹j×õË—êÜP¬¬—$i—¸Æ¥·©ÚüÜ|¼V:ê\\Êö¡­–\'PG~žÖ6˜¶Y‘\Z´nfu©ÆYÕ\\³‹MhÜ\n¬nNm¬uP9‘ë¯ž&ødÑRÙž·(T¶@F¹l¢æ$ ¸¡k^óM¬n^{qò@›zÎùÇq§ç²#êÎ„XFžÍùWLãp]aah(+¤  vóe+\Zœƒ,ÀóçZ–1øp2ÈUE}–¸Fcö½eÜŸ3Sµ‘˜ø0ÚãD=ÇêÌ9O´4O}ÚãÚƒÕ#NÐó­«éuÊª·TÒQ/ôXSm~Áë†nÈƒ˜oµjcµ²£²2çU•$f\Zm3–u$þñ©I‘º>ã¤_ÙŸx¯ŸÏóöÞ5ÿ\0Jô¶0V&u[eAX*¯Ý`r’Ý™ˆ×\\ß7Ÿ\nUÔZQÙ9Ì0É™Öhä6±ÇƒÏÏ‹ú£ï®oTÇÞiQ·äf>Çõï\n×Å~šß’üéJˆvþM¥ê7ð~­ïù‡ü-\\~!ë{?\nR¯R*û3M«êÇ¬¾cç^Ò´3:ø¿RçïŸ‘­.úUöü)YG³5}Ï»Våÿ\0Ð/›|Å)GìJ÷95#OÓÛöâ¥*ÓîŠÀÒÅ~™ü‡ÈT¯£ðãÍ¿ÄiJ£,ý\'NÕc~_×:R¬Œ{›Ÿë™­e¯)RŠ™›—·äkëê··ð¯)PÉ\r·°|«#aå^R †a;š×mÏ)Zn¯òühiJ‚¬ú}¿®á_Kë?Æ”£,Œ4¥+2OÿÙ','download.jpg'),(5,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0E\0\0g\0\0\0É(â\0\0\0sRGB\0®Îé\0\0\0gAMA\0\0±üa\0\0\0	pHYs\0\0Â\0\0Â(J€\0\0î:IDATx^ìý	|už?þ¿BB:$$Š&\\Ê‚ÈHTäc`tåò@þ°¢8ÇÅcegwñë9|w]uáëàèì88‚Œb˜A „K(cNètBð¯OÕ§º«úî¤;é$¯çãQª>Õutu‘O×»ßŸÏ§€kÊDDDDDDDDDDÔ&´ËÊ\ZÎ (µò_\"\"\"\"\"\"\"\"\"¢6AQ\"\"\"\"\"\"\"\"\"jS%\"\"\"\"\"\"\"\"¢6…AQ\"\"\"\"\"\"\"\"\"jSÚuîÜÙ4ÐR}}=‡£\'\"¢/ªS®\\©—KÃº‘ˆˆZÖDDDšv7Þ˜jªÇªªªpõÚU¹DDDÔ2]ÝuJV-—\Z‡u#µ¬‰ˆˆ4í22†˜‚¢ååå¨¿zE.µLúõÇùóçåRã°n$\"¢Ö‚õ#‘¦]VÖpSP´´´—¯°b#\"¢–mÈàÁJV&—\Z‡u#µ¬‰ˆˆ4h‰ˆˆˆˆˆˆˆˆˆÚE‰ˆˆˆˆˆˆˆˆ¨MaP”ˆˆˆˆˆˆˆˆˆÚE‰ˆˆˆˆˆˆˆˆ¨M	h ¥8K¢;wF»vídIp\\»v\r5/¢ÂV!Kˆˆ¨%U}¡ó§Þhª$X7‘¿X?6ëG\"¢Ö¥9ëF¿3EÅIÆDG‡ä$Å>Å¾Å1ˆˆ¨ee}¡—zƒu#ù‹õcp°~$\"j=š»nô;(*¢¶¡ÖÇ \"¢ÐjÊ¿åÍ]o°n$\"\"±~.ÖDD-_s×~7Ÿ¿>å:9Z/úQÎéFâ_Öþ\nY¹xf#¦þê]¹àp×?¿Å·ÆÈ¥ÓøãÏ#ãÓÐ[–ø$ö{x0>êØâûÏŸÅïœKîÄ`Æ«ÿƒ‡úEÊeqÜÅXƒGñŸ†cŸþô^ür\\ \"jåšª¾Ð¹Öš¦hØ|u£«˜Á1÷&!«2ºFÉzéÊeÔÙŠqüÀf|´fUkÅ@?L~òñ³Ûú!Y¯:ë.ãBÑ!üyã»Ø°ãè/¹íA,~àndôˆGÇöZ™Øçéo·à£7b_¹VFDDÞ±~>Ÿõã¨°î—Ã”§6¡\Zûþó!üû.uA©\n\'âÉG§!ûædÄèõ[­Å‡ÿŒ?þîclÿÁ^iQˆ4wÝÈ–¼¸ñÎñ3ýaÑ[`œ= JDDÔâ1ùéwð»eJtË\rŽ€¨Ð>»Þ€Œ±ðâê7ñäíJYÌÝX¼rþi¬! *tŒD×ÔaøÙ“oâµ¹ÉjQÿ^Áÿ÷ìýÈJuD…Ž–dôû(þå?^À8YFDDÔRÄŒýV‰zs€# *tŒŠÇ·NÃ“o¼‚¹MûœNDDÍ $AÑØØX|ûí_ÕIÌ7ÃØõÙ|fŸþ‚ïkå*E]á_ë”éËÃrAÌ`Œ{ø¹à,3îí±‘ˆˆÈ»ÐÔ1÷Ïÿº=e	l?àÐ×ZÝöç¿ý€j™ÀS÷ã~lÿ¸ë—â®î2pZ[ŒC;”×îØÓå—µ²êÃØ¾¡H}ý¬ŸÌ®QŠO}å²Ïâ¿|ŒíÚ,Qƒ4ý³ãH,~d$’eÅY÷£Rï)õÛöoOã‚|^¬>ú6øn¤ADD-\\ûë¯ïñ¯r^USS«×L-êU±]|WPÌÇ]wÝ…)S&£gÏžjYZZ\ZNW¦ÁØ¿ÿ€ZæMeU•œÓ¥á®{GàúNrÑzë¶þM.8ôy²{è„p|ý»Xw`?öÛ§öÈšêØOíwã¹ÿüƒcý	¥ÖËœ€Ùýºj/â®»¶?|‰“rÙîÖEøå½½ÑE.jÄq·!·àžYý¡ïéÂ‰\rø<W.µrþÔÁäZohR’“•:­F.5NøÕš˜Ëðâ=7@Or¹pø]üúçÿöhuÛž][ð¿kÑ3©zqö^‰Gæ”uáeZû^xOyíÞ¯ðù§›q¤²=þ¾k%þ÷ÌeÄüÃÃ˜?PÖd?~_ýâ¿°SßçŽqåêaüñÿû‚Ó\0“ˆ¨õcýhÊúÑ®çHÜÛõò‡ÃËøû_þ€?÷|Ý%Ëjãwÿø/X«Ôo{¿Þ†?n9\n[Äß±kå\'8-+$\"¢Ðiîº1h™¢Ã†\rÅüùÿ?Ìž=£FÝ%K¡Î‹2±N¼¦Å‰ŒI9g‹2K”ˆ¨¡>üð}üú×Kå’«_ÿú_ðÁïÉ¥–-´uã`<vw?C†è~¬YºÇå¢Ý‰xù_‹íj×h½ÑMï£[Ñ5¹Ÿœªqè³wñÑ_´>Ô²®3Ôr1]ÑßØÔ¾ü+|ô»-®Ç\"\"¢cýØDÏŽ½»Ú[A ¢+ÌUáa|ö»ßc»%\"\n¡®ƒ¿äýøc‘\\Ö¯_¯N:±ÎŸ_ûÂ†­Ú>ÈÄw.Àd9¯ê÷¨£/ÑºbÛ´Y\"\"ò­²²S¦Lq[¹‰JMdŒTùÊüh!BZ7¦ŽDÿîr^Q|p#þ,ç=ûçíuV$nœü\nÖ­|ON½\r7:õ¡½¯ä‚œSX†áÉµÿƒßþ³Rÿõ—…DDL¬›èÙ±à‚ý9oÀä—ÞÇª—ŸÀÏn»Á,%\"¢°êº1hAÑë®=QkM\'D…¶|ù¨“£r»&_ÓH½¦áÓ?~â29Fž’ò=Ø~F¶™0e‹Æàg9²D‹ÿú5¾—óDDäÛSO-ÁÉ“\']*7½RëÄkZƒÖ·Ýhï¦Edy~ÿ77}c»øûO›Ó_bº÷Ã¸¹Ïà·kÅCáŒÕiõÖÃæú­½|â7ÿƒOÿçM<w¯1µ†ˆˆ\Z‹õcžÝÙ±ùÆª°}’Ü¹Ï¾‰u¼ƒ×æßÆà(Q˜uÝ´ èÿ÷;^+.±N¼¦å¨Æš‡Ù¢ÙBmØÑïQL,«ÉºØþC¢DD¿öýÓ?-4UnbÒ+5±N¼¦5iÝØ%ÒÑt^ƒùòÙëïbŸ!	ÔN}(œˆçV¼€q¢š+\\‰7?=:m­Y×0â‘eøÏ¹ŒëG‡Ð>;nÁËköÃ]Uˆ˜dôŸüÞúç»%\"\n¡®ƒýñÇ¿Ë9`Ö¬Yø?ÿçWê$æuß}÷œk„òÃæQãå´§0=aïz×‘-jÉÀäb0y¶!Kt×ÿà#sÂ\rùÁ¹rSk{àBZ7V]6,õÑ–|©þÿ¾è_ðß;N Ø]Öuf<6X=¾f1æ/ßˆ}…VÔ¹]#ÑûžÄ¹DDDÇú1ÈÏŽTïx/]‰íÇŠQíæGÅ®·ÞÇn‘DDÔ¬BY7-(*Næ±ÇÚû†d‹IebÝSO=­.7Ší4þ{ÕJ—)§Øm.K#ý€5ê¿\"F¢ÿØåøÙ@½]¡è„û„6ODDÓ+·¨Sk{àBZ7~WlÈr‰ÁýœôBÔao>‹ùÞ‹Ù‹^Åûß›¬É7“sÀ…¯ßÅ¿ÿüqÿ?ü#~ùÖœ6ö£Ýñô%ç‰ˆ((X?ñÙÑ‹êÃ[ðæsaö?<„\'^ù\0û~4&Ù$ãÆ8F0Qkªº1hAQÁsgØ×B×Qv¨}»ÛOÈ\n2!É²­bñ7àÌ%\"j½rk|ºÕû\n§Ëå¼\"yØƒÈ’ó¨þá/øèÿ>†ÿ>à«R³âô¶•øåÂ-ìK›ˆ(ÄX?6å³c5¾ÿËïñïWbÐ%\"\n[¡¨ƒ\ZV®\\¥¦±>øàÃê$æW®üÿäÚ–¨\ZïÿÞ©Ïf‰Q\0BS7îÇûßþ ç	·áÉ™h|IsÛ¼øÏ¢¿\\îÿÀøÏ—ŸÁ½l)&ÒÑCiuÙi¥àn<ùòr¼øØHó>Œ}™ã‡oå,Q€Býìxã@ãˆòzÕýór¼öôýÈ0U…1èh¯àªq^©\n‰ˆ¨uk—•5\\öO*--Áå+®«\\Ÿ¢Ñÿœü½èG9§‰Yû+dYäâ™˜ú«wå‚Ã]ÿü¾aúÓøãÏc\\Ò˜÷Sýí`öÿýJ[ÐÍ]ŽO§öÖæMÇ‰ÁŒWÿõ‹T—Š·=‹ùoéAQã~õã>Šÿüã4È=u—QwUÎë.ìÁò…ÿ=r‘ˆ¨µhªúBçZoh†¬Ôier©qÂ¯nÔõÃÜÿX†ŸõÒê\'Õ…°ïÀa×F\"¹_2úÆ«AÌ:¥^{áŽxrÙDÜ(\n®T£ø»ýØwº\Z]zÀˆÚëÄCãŸÿïbšøßxr¨¬Wõ}¢;2n†e]Zwâ<òÌïíƒ‘g¬ƒÏõ=Æ còtŒ¸^©Ñ,ý0*»7bdŸÛu\'~¯ÔYàÆùoâÅÉ7hu^u1Ž8€|[úÜ6ýd}Zòþ}Á`Ÿ¶DDD!ÒÜucÐ3E[§j|ôïÿï‹A>Y‰åö€¨Ÿ:F¢c”Óc5˜ˆˆ(`\'°æ…ÿ‡íÆÁ»Þ€¬±1yòÝÈ’QÕ•ŽHzºé2©£ÍT^7wÙ¢—qúÓÿÀòo£wC-¥ïs¬# ŠûñßÿÎ€(…“aøÙÌijÝ6ùNG@u§±yÍJ•ŒŒ]u£mþNQgŽtD•×þq9¢DDmßAÑk×L	¥!ÑÇh°ê¿à#1¨Óï¶à¸,\"\"\"WMù·¼¹ë°¨•úéÍŸÿ#^XõŽ—T›G‰¯»Œ?ÆöUÿ‚GžZ‰?¯ûÌ^ð\"Öì8Œï/©W.£ºä>[¾\0¿\\#~øSö¹èñÄ›±ïT1ª£0ÕZñý7à…E/b;#¢DD~cý\\îq#ºDÉYA´Š8¶Ë.†Z½¡ýëCxäßßÅö¿ý€µê«4uÎ¯%\"¢PkîºÑïæóq–8ÄDGË¥Ð¨®©A…­B.QKÔõ…Î[½ÑÍY7‘¿X?ëG\"¢–¯¹ëF¿3EÅ†b¡ˆâŠ}²R#\"jBY_èÂ¥Þ`ÝHDDþbý¬‰ˆZæ®ýÎ%\"\"jIš\"†ˆˆ¨¥aýHDD¤á@KDDDDDDDDDÔ¦0(JDDDDDDDDDm\nƒ¢DDDDDDDDDÔ¦0(JDDDDDDDDDm\nƒ¢DDDDDDDDDÔ¦0(JDDDDDDDDDmJ»¬¬á×ä¼ª´´:w–KDDD-SŸ^½”:­L.5ëF\"\"j-X?iÜE¯Êy\"\"¢p4qÂx9ç°eë69§I80¨}¬‰ˆ(Ü±~$\"\"2óV7²ù<µ)ŠQ›Â (µ)ŠQ›Â (µ)ŠQ›Â (µ)ŠQ›Òƒ¢Q˜=?OdÈEiìýÙxmñ`ÌN–Màîg¦a×Çs´éõTY\Z1þ¥ÇñÜâÊü\0<°âq,œ“¨­j	úÄBåœµóo*-üš…½Ž\\õˆ,\'ó>@ÞÙ3(<{ëçÉ2\"\"\"¯¦`â«1OþF\\\'‹Mäk-@‚,	=qLOçCõÚñ}A™v¼\"Kˆ(œ4YP42&ÉItfnªÝ¯nÄ¨ékñâ¾\nYBªñÓðÜK#Ñ„ñi\"¢feQêÆDÄFÊ‚Vdáës°é™8¹ÔšÌÇú_d{^BjÏ!˜µZQt@¬R7&ÇEµ²žMØòâ<¬~ñü]–4-cPv5fLhº’›p¼„	ÿÏ~>ú41S®ô“§}‡…×·cVŸSXß³RÇ>+‰(œ4A=£UjQWªpI–øÔ®ÚE8Míä:ŸâðD2>wü>K–ÆºbYÐ¦•¡¸°––*ó¥(³EeÚª–àøWx{Ñ[xyù1YÐ|]3q_öÆX¹DDm]:Ç%Â‚:ÔÈßÜÕ~WŽ-ŽþÃáüßÉ‚°ÑÝ-6ä}±J.QÐDÆ 9©ê+ëdo.u£2µ\\2pºb%”G‹à¹nf¼p/b¿ý\rV«ÙyØ{Ã#;ÔúWüQžÓêÏòqýäÀ£ájÁ\rÝüýX\"—‰(ü´ËÊ\Z~MÎ«JKKpUÎCdŒ.ÚpQˆOèˆKåÊ¼¯DtD\\7¢ìõYlþl—œ‚¥õr`ÙÎZY(ˆ€Ô ¤É%¡`{~{H™‘ÛÄª¥EØºü´RAH½ñÚ8ø.ó*¯¬™†Û´(\n±aú.¼-—ÑDð…Ä\\ŒzºP–èR±êãQ¸I.áì.ók…]SÍî«ömÄ”WY§ê~³Y:\'7óáR4í¸¦¶<¬yþ+h1e_ënÆ‘½(ñÆõ¢Ù»^fr›mÄAu^4SŸauÁißÀÅcR/mÞº÷#¼½Ö˜¨ƒ¿ÃšÒa˜;\\Ûók’ç<d_çî¸‰»ÞÂ‘Áú1lØ¿â}l;®¾À§¾ccRÁç¾Ïà;QcMœ0^Î9lÙºMÎiÒTê´àü ìºQdˆÆ\\±¡ò²øáPù«g-SæåJÚ¡“¥â;9ö.Už‡µ¶gæ­9›žÌDmÉT‰úå—Ø…Ï§afOµÈ^Ç8×=v¦:Ì[ýf\\W¿¼¹Ï~¥.¨¼[cÞ·ë{JÀgÓOc¨þšÊ\\¼8÷0¾P_àW°óìD”,c–(…Ÿ–]?*ub\\TW(ÏqJ=™Ô©¥Ê¼¯ýwˆîŠ„˜ör	¸RcEyu=L¹*í¹,ý„ñ™ÉµÌ\\™ë!Ñ\nbrÙFü\'FÙ_ø3–ÈØëêÿƒ=?Ê\"…ÈšüÙ­ò¸§?Áê7ió*±MòW—á–y?Ñž]E0Ñ<Í|ó&÷‘8jØ¿È¦¼ÎûÔÉóùì8nœìÏ¾¿6[rå‚Xw{þø¿ÀXýÜäù›Þ“‘qýMÇMÇr.3ïÃñ¾|í[#ÞÛ½¸^.¹^×ÐZ°î ^è¾…Y¢DÍÌ[ÝòLÑËÕ~3]­CµR‘éê«k|ïC+êóÛsœ¢¢ÑAè–{\0K–‹lÐÈµÉUBq–‰ò÷O£RÙ*GRÐßÐÿhßÄ  <°€h¹ò°7}­œÌQo¾ÞÛì9ÊÐ·šòÐ7%N©¤õõkMQñà÷Ë¬\nl°oü€hÜÞð²ÈÈ“=0)‚‡Æua?Ò1×Ô¿gLZÔ9êú/Q`IÇXqêžŸžÓ‚êz1éI´¼X«—kû¾ÏÐwçÁåÚºÍgd³^£17i¿¶½rœøá·cˆ\\%‚¦s‡Wb³<îš½±˜äÔŒ?mêãÈ.ÕÞÛæ3›ìSS;cÉöjd>äÚ§-µ-WkE@T.øí\Z.UWÃ¾Ù•\ZT5: ê©Qê˜\'3ñ£ò §­Óê csø.YÓÔC±^tsÓ]ƒq·R®gxn8«$õ}Ôó^¿b¾^.Kœy:¶VïŽÂuöãîÂÊkÍý’¦bæÇ™(Wß·rŒØLÌÇ~K‰ˆÚœzTúuV±\Z5zôÚ%T^t*ðÅ‰\nté—*ë!	±ÈÛãøñl&Ïn/în{T¯c4¢RZ\\ê Æ)ßúÔlÉ?~kx¦3éƒ;ç%âojVå\'ø{üO0\\Ï¨™ “qtµžqY†óžÇÍêÊ)èÓøû1oÁÀ8T¶w»oXpHÛ¯ºo‘Í©ï[R^ÿ3ýÜVÿ•½Ç¨Y¨ú{úú4PiÈRõ˜,/)Sö—¨õ©ª¼¯áXeßîßÿAëoÕŸ}ßü@òõrñ¾zßÛj²P‰(8Â¶›–úÚ*Ô\\Qf®Õ¢J©Ø¼x¯‹Aîû2ûÓ(ãzdâ4Ö™¥þªÀÖÜJ¤Ý¬?FáÖ>@î×ž**\'dâ¶ØBl0fwàí§ÔBP0¯K1þ\Z‡ôn~³KÅP·z\"ËEvølœ}€òÞ$Ï†4[þ`ÌÂÔ¿Ã,çc_W†mkó`íu³#ø¨fXêÎc8rFy\')þ\rJT¼v£!3³ÛŸ”$—ý ‚­z³úmß¡\0±Hî¯-ÜŸ:°Åk÷£À’Š!r½êÌ—öÌÒƒ‡Ï	Iõ}zè´\Z€ï6.KÇDÉB\"\"?]Qö´Ê5U•ÇÇ†ŠÃ+w¥¢jß.S¦îîg2qSe.6ØL+ÄüM…æÉ³»ìAÔ/öœFUl‚#óÓßõ›žŽ=2éÈÅÚƒ»J,XÓÍƒžÜ¤gý4àØónDw” Y¢Df\nŸÅÿf¥:µ)×êP]¥5·¿\\]ƒK^¢ª_¼š‹“±½q÷HYðHoÜt6×Q~uó\r‰&në7ÑÂ@>ßZÿ5ŽÈ’|	ß©ó›\Zˆí®%h$d(,ß®rdžæ~‚£Ö>èãw\0Ðó¾Õ&ýÆ fî!ü‰H05½7lÿã×øÞ\Z‡øuEàŠÊÉJ?®Ä–­Ž.ÑÊG¥0õÃwêïIp~_Þ=ú›ßã“ÿuž~‡î’/ðCßîØJòå…£ðí»úZ=ªª/áR•R±¹ÿ©OJ{Ûô ;u¤•i	Z_Éñè‹R|ëgÓç»ÅCVe¹ÇLŸD>:½2éÍ5Êê›¹@–>‚ý(,”kTJ…>Ey€½iŠÜ~ñÌg1Ftöì<e<¾B¥$Y”\Z©ÔÞdÝ…íŠälÐé#ËËÉÑÔ½±‘¬Ô®\"Tß÷sÆ.\0¤‚Ã†~J·m„#C6p±™×³Q\"\nÐ5\\¾XÚºjT×y­}™1Ê³F‘—ùÊ+hR ¯õ[#ôJ@—ØL¼`Ø·kSþB0´œxûi§–ÉüWÏqìŒˆÂŠˆ\ZµµàèÕÚ\ZT]¾ˆÊZñÃ¡7âÇ0GbÉÂôTœÌ3&°ˆŽ:d—±©êD¡£~Ï\\Óýo	*		qˆ½õ)Ã€EOa kŸd\r&šß;ömhŽ®³Çwö®\0ŽaÏ\nCóú@¥$Ê®í„±Èpl½y¾¿DÓ~ûy¯Æ½e¹Þ}ê~ÜûÎÓ#xñÏò^ˆfó\"é(ë@/¤ÏfäDá,¬ô»v©Ò¾Òj±nUNèš%[qÊ¦5¡ï;(	ÈW–å*_¾ðö°é‹è÷lŠRIÛ›.jMMÔJXoÚ‡™ÎÑß9š~l(WíÑÆeŠ•\ZûpÃÒ¦S»ºé\'´!àEé€¡Ùþš½>Î%@ŸjûuLþ÷êC7Küî—–ˆÈàj*\ZÐ¼Ð¬å.}Æ8Q°ŒÍÕú‚ÁŸú­1DÜ¯}j`‹\r3ùƒâÀÏÏnÇk²”ˆ(œ‰À¨sÀ´uªGµµ\Z—ýø½ðí<½åC*†ö4ÿP¶ðõi¸\r†zäÍ\\TÉuáÎÔ„\\NZ`2V+pý€)êë%úî¼³w>¾¶ï7´£çß< Ú×ºèOôæžÂ@bMóµ—ù¦v)ÐGíÿT¿¢©½¿\Z“)ºrö5éhßÐ3È[7_–Q8\në h@<5K.®A¥%	·Ê6ÎcïŠÌ€’kñm~%º%ÆáÖ>ÕÈ	¤þïN«}•ýÒÐ[`”‡V½oÌGFyÍ¤ñ€=Yf\\ß¸LÑâ½…°ö\Z\\ûª•MÒ{ ÛÞÏg\"ÆêëÞoìÍÒ}*¼\0«s³uû¨îýGâ¾ eŠjMñÓ¦N34ó2u.Ý<…„žñ2\r¯èMUZ¿j7Mqú1MÒš\ZûÚLÅÌ¬8œü³ÿ‰zÇÜo›‘ÿõ[@\Z]ïúaõ÷(Aw¤Î“ËDD-@ÛŒúI­+pÓ#½qÝ¾\\×,O{K	¥}Ô5S4}w,±·Î÷0šü1ìù&pêO3aÂóþ>/ƒ”ÂÍ¸Éõ¡\\¹¦±7Ýé³Ù»€­ÀÑÿ5òtþïr~\0Füƒk¦¨÷}WÀª7aÌ|¾É2Eu§Jl°twPEDá\'ä£Ï‹v“b;Ê%Ÿ£É7ˆi>ç\r#|k£~k>+s §ÛPôÿNL×98B¯îsÒ\nŽ`ÉïÍþt\ZaWôo¦6±ªÆQé%Ã¼btCûƒbe.þRž‰ô292¢:@†±4óÈˆ®£ÿºŽzß(Î#Å›F×b²7=?ó%^ÖûñT×\rC™aÔv1b¼¼ÈŸQàË÷ïÅ01p’º§ãJöæÅèó£.8§ù\\ÌûWØß—côùÍxúIÜC	8ÎìP¢ hé£Ï#2Éñå‚C_£ÐB¯k\\Gqœë\no£Ï×©Û‰A&ôLõµbTwc=ãTÏ5¸~çïûØÎõ®ad`·ç(ÑÚ‚£ÏQx	$è9iæ¤0­#Ð9®,.ŽU~B­þƒkÝèT÷Ü—‹ë²õ†>ú¼Ý®8q\ZÁ]£¦.š‰»iòn-ÝuÄzÑ¤ý–òßà#½ÏM—ý‹ìNCŸšNëEf©¶­¯}›Gp¯üö¯¨¼µ¿ãõb¿bôyãhõ.œÞŸÇÑéÎYd{\ZšÌÿ]9vì­b@\'c_¡î÷-¨£îëPë_qôüOp£ñš…GŸ\'\nÞžC%\"\"\n¶¥ŒAQ\"\n?\rÉ½uÌp9×p¬‰<cP”(<x{vl=Íç‰ˆˆˆB.%6º{èâ…ˆ¨¥øvç^u\"¢ÐXùC	t£_ãvQó`¦(µ8Ì¥f5ïä-Í†6ä0c”ˆÂ€»LÑzjß#Ð74k´©êGö‰JDDÞ¤ö<H3E‰ˆˆˆ‚eõƒHW)d@”ˆÂ›Œz{PÔ1k”ˆˆÚ\"E‰ˆˆˆˆˆZ1ep”ˆˆÈŒAQ\"\"\"\"\"¢6@FÅèó¾08JDDmƒ¢DDDDDDmˆ¿}ˆ28JDD­Z\"\"¢‡-9x\ZhIðU?úôtHmÎ–üé€ˆˆZŸ@ë´DDDDDDD.D°ÓŸÌQfQkÃLQ\"\"jq˜)JDDÁä.ë¤¥ó7SÔY ™£Ì%\"¢¦ÆLQ\"\"\"\"\"¢ hÑÆ$sô,¯µ`Šz…Ùó³ñD†\\lR¯`çÙƒX?O.†©ë¢°œg¸xmÇ™ð¼^ó>@ÞYåÜv¼\"šŸzo…Ñù´H½ñÚüôUšóïµV™÷<ƒ¥óÃÄDYàxÝ“#’å’ýfaéÌqH‘‹aÃÒëgGãOÊ´>½,l‡_OŽÆ7ÈE\"¢VÄŸÀ¨À ²¿2ðð<QoúWwš‰mÝÆ qž´{2eqSÑžätèh9Ìšä9á¹Ó0D™²øq<÷ÒHøù!Œ%büKÊ{Y<@™€V<Ž…s\Zúá9å¾›¯YàxÍ‚¡	‚¢è—ˆä$9Åtå­„:,Î–Ó`Ìô/øëÛDËDå”·n¾\\\n¦ëÑô×¤U×ÔéËGø˜õ‡ŸwSAx]´ç¬L;_—+ÃJfÿ$-Â)YâËØûõ¿eÊd¦R¨DÆêÆ¸¨6ö+e2&Î|÷“‹Mè®ôNj`SŸNy}$æÊò¹ƒ;‡/â§ŸÕƒ;¨åw¥wD–µ¿øA{\rQks«ŸY£\"0\Z”àhDâõºQ™b#ey«pï­~ËVoA“‡‘Ë¶ãMqì`•EMÍ¶ç%¤öì…ÔŒ±R–y§bž3NLµÀÎ®-gƒ£ÿH,ç¥ŽÂA˜_³ñÓçöÆ÷—åÍ*œ¯™LÚÏ×,BþÕ.Gqi™2YQø(‡m×í\"œ&ó3KÈˆ ÀÒ1QrÉ—8<1Øº<K”ie.ùPoŒ•kµÌ,ÏR5¸2½;r–)•ƒ¨ z®\0×à•{+gQÎ{f­–Á`ËÁ‹êõè…÷\0ÙK·ã5¹ª¥[2V¼¯ _¯`Xý ÒÅ5û¬,h\n\"úyd—n÷¿2¦F\'†{4õãSè;½y£}ÇÆk÷ÇÉ%\'Éñè‹ÓØzH.û’ÑpDý[¶dùä¢7˜ö­ü½[lüûFƒnÊc‰V7ž‡\r]Ô4Ìý\\<Ü½ƒ-Áéº5ônˆÄSiWð›u5ø©˜Ô\0gGüÚbX?ø*>‘ë?)ŒÄ½“;à.¹ºØjè†ÝÒÅk¿ao³D~ôþDƒåÖ&	ŽF slG\\*u£2Y/\":Þ‚Î¾Ÿ•‰ZŽâ¢Jå»õ)óE¥6 ¼ÅÚ*UÁ§oáåEbúû‘Ž¹a’Iªf¸ÎòÏÈåþ-¬¥¥Ê|)Ê”·UQ¬/K¾÷ž×l\0˜\nlVÏë-¬Ù[¤ekxÍ\\•aÛóúy)Ó§•¼f!Ðä-‰ÌõA°º^–¸ÑqÝ,ˆ²×gu°•Ûp1¤Ï\"€9™8•«ôÌ*­¬Û_\0ã!M-+ÂÖå§±Cw’œ‚¥%áÔû‡±NÿK.2IÇ¥ `{~k\nNˆ€ÐLàã^ó´,2ë\'¢äã<¤OÏ†ú¼&1Æ_ÖD¦ÛtG.×)ã¾Äº	%xñ\ràçKåöùÔ —Æ¾0B4ë}qÝÞ†œeÆ@ŸÈþ{Ùö—œÂúžã°D.y¥Ÿ·þ>Õ÷ÃöNûv9gíºÚ¯Šñš‰}\rÝK&ÚÏ_üb™>{•:/ˆìÙY}ä‚é}‰ýÃ¾e%˜¤_OŸ‡iß¢yº¾óõpy\n—2óûr>o¯Ä¾Œ×Ô‰ñ=»ì×kf¾üÿ¬Õíåy</u}÷-X™öó3ÝãÎ÷‚éóÐÖußÚû†êïO~ž0~Fþ»»óv)3Ý†ûH½ž%ÈIÊVÎ[)×ÿÏÝt¯(<ü¿?àLHóü÷H¬Ï>\0ËvÖÊ’Àþž‰€ë‚>¥†¿‡²,È5þk&­m ¥ˆ(’:Õ¡´¢6tYœ\"ño¯â½²H%šîe£lã;Ø‚qxrÚPÄ«åØ´z=rÕy¶¬.rQa=ú.ÞÜS¬6¥ŸÒC\ZèëÕæó·”cSaL¨æíë´¿]Ô/\n‘úTÜeüÔÈŒÀ³#qþ³Kø7›h\nß\n.bVžüj$šÌOncb=Ä|GÄ(ÅÕ‡kq,-\nÝÖ¸f‰ÊÿÃäï45+wA¼–:ˆOSÕþÆÔ¸ëØ±IJMc-Ã‘ž?£Ñ]‘Ó^®ÔXQ®<kšrÃŠ¡>5}NugÕ¬Ú°]\rÚ·Ù¾wÈú×´^!êÏ;´ox@ö¹ì_!šÑOKÀnŸõ¶kÝ®}ç‡ÓsŸD=©$ÐzQd£>}Úoaç2‘m6ÃìÏyXóüWjPU4ÅŸÔK+6²îýo¯•Fd.Nu|)AÇ±¼¢“KñöòcÚqð%^Væ›__3gâ\Z.JEþŠ÷±í¸,k¡¿f\"€>w¸}cìoè{V¯YWä,Úˆƒ²¨y4ÿ5´Þny-]­Cµ!hZ_]â€¨È€\ZŠÌG°Ä\0Ð¥KÅù÷eö”-Ù~g’*Æ’÷O£Û8§Ô×‡¡¯r¤}n¢:²§wÇf5#mNY²1Ëžö\nvÝïÈ°S³Õœ2*•×¿°Tn¿,¶>Õ¦èZvg/¬ÏWn/å¡Í¾?³õíÕIìW–ë¬[dÎþàÕÙkCû*\'YbÿL^Ûñ¼aß/!\'i¦©€×vÌDwã{r¸õ™©ÚÔuÊ¹cÄ\"{ó|QÑÏJÊñ’¥Ú³ôëéîó0eýö2Wúz&¦›ë…§÷+ï¯/²™†nèäï—×MøŒïkJF<´ÌD-{U»Ü2^3å>³Œ˜á¸&¯oW¾•`½z^âšuÇ,¿š¤ÏÇ˜AØŽì2>Î”c‹/PÚ¾mè;Á±ïëf\0ohÇUïdãçNÝAˆN}ûõùÊÿ§^q|Ê{1e|6â>]ùC‰òÿ­»´ã½ðq‰ù>ê“­kÕóQÿ‹{)cÔûP¹–f£äcýœ”uÊ50ws!‚›Ù˜Ðõ4Vzù&;­9ö€¨CcþžÚyK¶W#ó!öMÚº£¨ˆïæå·^Íð2ïQ¬*¶`™ÚLðUl:\'W(´ìÒw±¯\n8»[[/&SÐ³ËPL‰ËÑÖí.@üÀÑAéÿìÏ…WP\Zeo2?÷ö(ô¶]Á.õs;t³\\Á±Bý1:o¨AÐöJ¹²h«Ç,™A:ËÚžÍæ‰¨M»5€þFž9êŸú‹Õ¨Ñÿt_»„Ê‹áõ,eÄh`‡^/*õ$†bº©?î8dÝ!šnÖ‹`çñØ·Qn¿ÛŠ¬iþ÷š2â^S½½Ì%h\Z.´Œµ¸­oÃä9·kÍÙj÷É~.—eÊëmo9‚{\"ˆ3ø;{ùËŸžCÚTcžÇ¿R¢-C˜\\³%ˆ×¬ÿHŒÅçör5CvNÃ2*“‡§\"þÌwÍõ$<¯™?š6(*šF×Á¦TT¾Ô×V¡æŠ2s­U~¼¾ÁDvçâAè–{\0K~¯<ºQ°]ÏŠªÅ·ù•ˆíÖI-7‹Âì©½[PèšAU\\„eËà|æPÏM]Ýfz æYìËºß GžÅcS\r¬uGª©ÿMÃö«w!ÏfA÷¦êƒ¢Ï°†7yÁ\\ÙWã,l06_A–È\n²¿ïU˜µõ,ƒF™‚pÎË&\"¦ooº&¯`ÖNmuQWÎ^›1Xéíó,H¿Û”óÏ³X/~Cõþ4EÀÈùPžç¼QÊŸü—=Èêüú3^3§ûL­O}ì&®œ½Åà‚ü\röàòÊ/ò`Óbyö8Ã¯Ô«°óˆ\r–îö4_aû%NI7†¦{Šã%ö`÷‚»Ó=+çöôGæûH¹žëå!¶=™±ÖMD_Ãzõÿ¹DÛïiï?àèúJRþ•»\r˜úõ÷Lù»8;3Ö}¤ž~è¡†‹ˆ‚%¶#jjÂ!KTóc…^\ZúþLLF<¬ðÙ*Gy0»£G6}îoß\rnˆì}ûGqV9²üŽe§ý àj`ó\"Ž¥uVû½WùðÓÏêñg¹Z£\ržô§ÙÊýýµhB¯\\…xcSÌ¼qgööðiÉ^˜%JD­Œöô3´!ÑÈ˜xD×U¡ú²,ðäZª«êÔÙËÕ5¸.•i€Šö¬7dv#·°ñqÆ0€ÈþÔƒ•r}j†:0aÊMÊwà£Ÿ8¶?ñ%öU¥!=¾»{ô\ZD\rI·iÓšôêŠ×n4d•áàqâ“’ä²/Çð¡1°¹í; ÉaÑgc0…ã5KÄø9éˆ?³¿™³D=	â5;þ>´••}í-„ÕÒ5€EE¦ÖoçÜáÀþÏÂ5N×,0MfÇwFÕÏfð×êQU}	—ª”Š-„?õ©Á9ßcï—Mï=VíÒRŒÉÑÁ1Ø‹¡É¸Î–‡† Ñ¬OMõƒKT˜ëóûb–<·€sÒ³÷D&Ÿ1¸:ïFˆ˜¾_u24W–ŒÕ2õ ª?Ù”ŽÀ¦\r%\rþ£ü,Æ¨™§ÏËs¬T5à§¿W5jøìúw‡Å(“¹û‚æ2©Êß5‘©Ÿ—Ûû0Tôó½\\“SŒ?Œ c÷\0‰ÏHÎöínÅ~ˆéyCW~(ýÞó9f$ÈfïÞÄa‚hâþµ¿EÅá‰‡z+;8àÔå‡«ØÌëÙÇh£u@lB ò<*}=ô5¡¢óVíA,1‰€ž5ZUŽµ¹–IA¾³Úìý§ë.b_|”i0% =²&ëëEÓøv¸1^ù2fèKTd—&®Ã÷ƒõÁ˜:9ú$%\"jƒD“EšÉ’5*º•é}çýìVæjm\rª._De­Èªi¡L#Ä?ƒù²OD]­»..ñµo»tž¹_Šö¼ƒMçÒ0Enÿ¤)C5œ$\"9AÎ\n¢9±a°Gs[ÿˆf¼öbVŒöã{vK~×lÈâ¦<ï®	ÛlÛ`^3ÑŒÜpÍ¥Ëî§üuÊŒÉ—íGâ¢ðœÈU8]³À4MPTDðÐwíR%¬µ¡ý©OmÚ ,N{ß~ž2·ŒÙ¨Ëe––šYfn2µ©·Ú—š¡™­\\ô&ÙzSïr/3ì&™¶5¾g9™]ZðW-_–ƒî~€SòƒžÍãœIÛÝù¿«7ËV&µy Q5kU»ÔLCçfåz Ø8ùÙÝA¨‰~>Mçå×/È«PXê#«×+­™¹è³O?®h^ß\\œ»y0uK!\'¿pÊfU»RÐ‰,MÑì½ë Ï£Ã‹À©­ß:g¬ûEd¢BZÁC_¤ND?ÉõÆùí¢	¾‡æûä\'­¯´è\ZkÈëº€•—Ã\Z—ŒL‘yræK”Åe %!ñÅŽ¾ËZ 1‚|L¡Þìý\Zþí³‹Øg‹Äxµ9ý5œWþŒT¾hh¯5©åª\"qo|Þ.lñ©—Õ™~sÊA=ˆˆ‚UûÙŽU¾O•WÃÿGÇzT[•×·Ävóª<<m(pô]{öUG½ÿÀÒ-0ÔË¢ÿmGówm2÷\rîÖ½˜¶À:ðÑðŒöˆ>Êó™6àË\0<°HynÚû‘¡™­ÿÏ¢ÏÂI½ÎÙþyyÑ—(ëZ•0»fZ’Ê>dÿ’a)ˆ×Ì\0Ö¯ÙŠ<·]OùçŽœq4Q+a{Í|}PÔ\r»‡>»\nüÖW Á_ƒhƒ/iSaõƒØœ/²ìŒ³ùX¿#€ÑçM}mž¡wªÄæ5(¥g¢6®ïÊ|(‡i Ù<^ïÃRgíð³ÙøêïQ\"gÝQû>µèýºjÍáÍ}V:7eöŸÚÇd@´æßÝoxc•`³±Ù¥h²nqí/³ùiçìÒ—­Ÿ–|˜›óûz}{@÷›= =ïü<ÐìYñÃDšúk?PØó†œÍô-†¾j¡u`î«Ö¹[Ñì}Ýªl½Ð\\FƒÂìŸ¤¸oöî“# ê©+mà¸ä¾ï<pÎõ:ð`3K‰³\"ï„xàêƒq½âaU¾|*+V¾¸8šì¥ŒxÌÍÀJZ¿¥={5¼sZ­ŽjÀßŸøûhò°´Ç\0åO‡–	z\r»\n® Æ0\Zý]é‘†>Ge³ù¯ÍÍíûÄ9÷PéYìþÖUDD­Lc‚£Ž€h¨Ù\rOÖó²žM‡é^3E30NYöŒö…,÷Œèû^LJ¬¤eUrÖ@|ç-<{°AßqƒC´ÄŸùÒ4°}Dìþ#qŸK6šÖ¤7mð\0¹ìDŽz/YÜÔ™¢bÜñ]&”×4¼®™= Úà‚Zè5+/•`Ùm€:ß\0Ê±³{Ù¿Wž‹_Úø5óCÈƒ¢‘»@ôX×)¶’“ådAç¦íÍÔŽ@ÃlûÉS33)˜°8¯é“=ãTô3*F£w@Ù”Æfæ…gú×¼Wë»ÑÑ¤zRINÀAµÏLCSóà<ÀéÿéôI©Á}«ÉlQ-*²@µÁ•û76Ï;\rå¢)·œÈ”¡g¸fÚ\0AŽþèÔÏ£Ôi½¿Í­Å¨âr;uRÚqì[û¡”«£ŠëŸ¹ùa^|¦%#f*×K`I÷,ÆÈŒ[ã1\nVÞ·:ÙCr\\31B»ÞìÛßÌ^ÑU‚–ënß>ˆÌZS—Ê4t¿Ÿ•²_U½éþÒîÈ4ST9þ©ƒiÉ}\\q¹Ù±¢™¾:¸’¾ß\0ö-¯‰ÈpÖ¶ssK;~Ÿƒ•¹1˜`ÌpOŽG_KŽ7 `ÙwLªö¥&mão™29TŠÃã€­z¶;5JDT4¢ÅLt¼¡nLDl¤ººù‰Àf—¡ÈÂQµï²Ü3VôìgXNµyž:½ÞÜNÐáÞÛ]€žwhMðæÇå¸ÍvÉý|Îö˜¨í§‰šê­ùæ\"ö¡#žR›½+ÓäŽ(þÚ1‚üŸó.©™ŸYjŸ¢Ñx*í\n~#ûÕ›Íÿ›øSc«Ç¶ÂHÜ+ú%M½Œmúhõ‚þƒ\\cúÖ&\"jü	Œ\nŽàhÄÄvTþíK‚£nLŽk%}˜‹ÑáÕ:o\"z*ß«²¦‰ùÇd ó¶+u¥^w.–€S.u§¾¶ì6d‚žX/WÒ×‹É1Ð’÷z[ë?Ü±6X¢i\0Äf”6UoF;\Zq\"óÌÞäúvìµ9Ö/êŠ|7Ùh—‰‚^£íMqÊÁ^Š×îG%seyvi^\0Yìý<ª£hëû_ì!Àã––`¢<X}Ü°¼fj@OÌôÀ$¹½:µòkvð³<Xíå3x<¬GÇ}¦»!£õ·µk¸vYYÃMJKKÂf jDFŒ:\"{€ƒ]4¸œP‚CÕ¯$Q3™ëÙçxnúÞŠLœàÚ™Î–­†Ÿ&é*uZ ¿¤zÆº‘ü\'~Ô~—nNˆÈ;wM¹ý\rè…›p­Ý]cw<]÷ÖôµE¢uÇ¤’—8¡3ñ|ª&Ó4÷\0V-¯YàZá5´NðV7†]¾&µ,¯=\r‹¡?5‘=Ú¢DáJkÀ€(‘3ñ°êOS<èú@%j¹dk=÷Àk8^30(J27W{bæ%‘Ú¥ˆ:¸\Z¢DDn¥ÖEï¦Ëï®¶Z5Ñ=šŒ•*ÿñšŽ×ÌŠR€£»«Sh6¯}=2€KDDDDÔ¬ü	Ž20Úzˆ±ìÏ|#¢0Â (µ)ŠQ“ñ§ïPšÙ5ƒ¢DDDDDDrþCD‰ˆ¨)0(JDDDDDD!H0”Q\"\"j*ŠQHø%\"¢¦Æ (³C‰ˆ(Ü1(JDDDDDDAÁ`(µŠhìýÙX:&J.IÉ)Xº8¯Ý\'ˆˆˆ¨1RF<†¥óžÁÃýd…µÖ€V<Ž…sþ#±P™`¼\\Õh‰ÿÒãxnñ\0eÞpœ/”×,”ûnN¼fóõ¾^ÁÎ³gP(§¯Ëb\"BŒArR¢cŠé WµQQˆ7ÖqQü•2,´Ã¯\'GãO³åt»ó§âk}øZøúlz†?ÞQðùÂ):dñãx.\\Fã§©çbœÔàO Ô@Ñ4‘‹Á££Lç÷ÒH$ËµÍ&¬¯™&yÎCŽóã5óJÿÿè<ùÿÿóYŒéÙ©=_BŽMù!ôßæ/W£¸´LNçaëø(‡m×í\"œ¦vr]ˆ¹Íõ¥¸Ë–ç`Éï+dŸ2z3»”ˆ¨-ºZ«½n,Ãùú.Hâ†&E{ÞÁ²Õ¯â½² 	Ü•Þ\n.â§ëj”©§S£°>Ýñdîí‘e­õ¸žˆ¨­9@04¬²CÇOÃ¤„s(p	ž”¢L)«(*Ž—¢6”ÊU¦ÔùåPêÿReÞp»sØ¼è-¼,¦yÀð¬BÆpnbzþ+Ë5¡½f¾ö¾×Lùæö/Ä\Z^3¿\\.ÏÉpnVÓ¹‡òšQ[Ö.+kø59¯*--ÁU9\n‘1‰ˆ¹rÖZ/G‰èˆ¸nDÙŸ3ê`+·áb(OQ˜=(2q\Z+Wá”,µ—[ä¢¢2÷\0–í¬UçEuBš:k*×·ë›ï­ÌÓ1‰ˆÈ›‰\\6Þ²u›œÓ¤¨ÔiÊ§ uÝeARû\ZW×Ë’æ%š®OG>¬‡¢\'\n°i70å¥²;·Ë>?dÍüú{Ø·ñl‘—;óžgpGÅ»ø÷Ú_sv·!À™8ONŠx¹¨QŽ³z=r‘‡çMTŽ+˜÷+hçö	vÇ=Š)=´2Ó¾…y oi6°ç%¤Ï^%7÷öhåÔâ§ß(Ÿ¾¥ÖOncŸ]Â¿)_Ê…»Ò;á©´+øÍgõø3\"ðÆìö8øÙ5ŒŸÜ1â¶:¹Nd˜vF–ò}F[VÜ‰?Ý‰Ó_×à?ˆ_R±êãQ¸I.áì.ŒzZ>\r<2\n»î*Ç‹sãµ@¼6åonÄ#¦á…,7?À\Z·9›žÌDmÉ¼NZ°î ^ä,‚Y«e!Q+á.Ë1|›w{×Tõã·;÷Ê9ï‚uƒû‰ÌÇÑÀ§¡lÔ$îzš/QÓ|SÍ‹6â ,r-ÓÎ[>zg¾ÄËË)3Nåv6ì_ñ>¶×–DÖâÜáúC­ywbÿ7ãˆñÜÂA8_3‘M9øƒ)\ZB~ÍD30Ì~Éò°¦×@½öIûå±1ë=î[{aÌÓ²ˆZ@ëouc·ûê€¨è:\\ªóñhyµÕ†ÃúêšDãðÄâ¡È¼pKœ‚“cï—å\"T™¶ÈÒŽß»/‡òõm~%bûÄ£¯,:¡›¥§ŽèAÒZ¬[¥l{¡7,î±²”ˆˆÚ’têÔ5uáÕÅìƒ²ïb_U\Z¦ÜRŽUÀÚc 2ÅÊÄq‡OÔLN1­:\nd‡uKMüÀG1?.G®¯@Ï[ôõÉ˜8v(pô]mûÝ¢ÁOá=u¿[à)ÿHì[]]÷B–vˆ±]Á.AÍ§·WËûÈ\" ÷Nn‡mj&éEìCG,T3I¯áß>«Åi‹¾7\nˆŠæï½q`úZŒR§]8ÙsV=\"WzñÅ«Õm6(³jŸ6¯Nö g*V=™‰7™÷Í¦öÔÖéMÂ[Úôß¿Y©N¡\"‚¡þDÅÃi¸–‡,´3_6 Ô—Â°\"ÉýµÅ!‹E`RÏ¤û½FË¦ÅÇð¡=³Î˜Ñiàõ©<k~.ËßÂ\Zå#6\'šs[˜\\³äá©ˆ/WŽ/ú•ÍÀÃ\'ë×I¯YòœÛµzùGØtÜ× ÷=\0c‡û?4 J¸&	ŠŠ­ß´xD×øà¬¯­BÍeæZ-ª.†ðAQ$iºåpmþ®¬ËN+ÂÖ@›ÅK§v¢À’„[õ¿œ	H+(Ä:§ŸJD`uen&,ŒÙ­®f\"\"\"·ì}nwƒU¨¾,ËÃÅ¹{†æÙ¿mG‘6«)ÛŽ÷ö8*³¢“ù°vIÀurYUu\0«dV©i}búv©À©“rûGqqHLÐýrnÞ”Çw{ìÕ\"½g¯Fe‰Š ç½©W°ï°Ó—‘1*ú½øD4¡W¾JÝhoM¢¼þ³ËX£Î_Ã®‚+ˆ‰Ó›½\\Å/>«wÀ¯Ó#Ñ»°Öï€¨ðöÓ»ð¶œWž`pà,p]Jã—w?“‰›*s±áw²@Ù÷üM…èÒ/wËaåì!HíÉ,Q¢–\"ØÑÖUõ‰ì^ç°9àì³f 6v8¸Ü˜©yGÎ\0q)~œŽ…×:²ƒ‹÷Âjé\ZÀŠ=0ÉÞÏãC/ha\'L®YJ’òÅ Wª#@(›©‡EÿµÎ‚xÍŠ×n4dÒ–áàqâ“’ä²ÿ’çCÚ™ý†}…N“E¯ÖÚìý¦•^‰öo@‰kõ¨ª¾„KU5¸djà\\}%!VÎ_ŽÄ*ÇÐú({s\n\n¾ó`EæÌÌ \"jŒ}n×´GRR\"åªð—Œ‰3ŸQG‡W\'—¦ð€µð#Z¶oªMãÅ|1¬ˆCß›ä¯€ýªMôóš°ïPŸDàSÍät4•WY:â){&èe¬±D(Wâ*¾7¾ÆY|î’³°ÕãíÃÈ\Z|Ÿˆ&ùMä?žcŸf3æP^!›Ý™ùÂ:ªJÄø9é¨øÔô	cý“”ÚÒ@4s¶&Ç¤^²Ü/rä{}ûEé.õ¶g2CPŸ>­Ä°Ea\Z\r›k¦|Úû¹#¨wü+ämJÁ¼fê LŽm]Bd‰ZPp˜Y¢Ô4š¸ù¼h_‡KÛ£½\\öæÚ¥Jï}Á©‡±dùœÏ\Z’Av|W$›ÐÇ¡ZŽkI3&¢_Ò™ÕØÚÁšˆˆ¨å»|	5JÍØ¡Ékå†É¼çQdá\0V©ÍÜ•I4­—ë|+FY•Ö^\r¨Þ‘†³»õ¦óa@í;´#pø¢9“Óv\rÕ¦LP…Ú¤þ\Zòå¢[Ö«Z¢‚hrŸvŸŽÀ½“;8‚¥¾ˆ>?§¤â¤½‰»Ö>hâLY¡w!•ˆZ¾@‚¡áUôˆ> mª´Ñú>T—Ãadp\'jlT¢XÖD°ij|êNn>£½ÎC+ïyŽAÔ&Ð\r´í;¸ô&Âåš•6,C²9ïš\rÀ‹Ò½Ù·]³×Û¯Æî©Y¢¶<ì÷î-¨ÕhòÇ¯ÈÎ]Ð©æÂ«•`~»ü\0r»ÂkóS}€_Äy¤ †¶ØwÌ`û J~;TŽK4Ò2Ð-÷ïØ!‹uê@M]OcåòÓ.ëˆˆ¨mˆˆŠF´øÑ0´¿WE±ÌÕúõ;{¢ßhs@U™‚>Â¼héìä­›/üdˆÎÊsj¦b»‚c¶öÈºSf¶Ã¯‡D¢ºàŠ#èi¤ìkáàö8] ¨²ÑƒõX“WgèoÔ_(×Låš)\Z› aŠÃ+k2I\'Ë*\\šÄ_ì9ªØLÌ´÷OšŠ™Yq8ùg}Ð&h©P¹¦;_—D­H‹è5!³Co3=[Òµ;þÞ–Á\ZmúûmÐ@#ë˜ÂC`,\nºñÓÔ,»SV«a´me½KŸÚºyj¢]^*ß£–1HÖ£‘Ú\'«­iÚÜÆ®™ÚÔ¾×0G6­Úmƒ\rù{à¬…^3utxAyÏ÷œ)*³Dw…f€ª×v(×“ßeÈIÈGŸWGÔU0t5Ö°]×¤Ì>o1>£7^\'{)8‚•çS1\'åz1@Ó —ØÌ£ÐkÁÔ™@îû‡Íý‰Š}ß\\ÎìP\"¢\0µøÑçE¢ñå‚¢®\n¥µ!á>êÈòb¤Ï‹1qæ£HüÛ«x¯\\ŒŸ€Ý¢¼Óèñg@ü@¹NYÖGŸ×ûý4MïE–}¨s}ù~³ÔìQ3Ç(ôŽs“M/Ôsq[ÕÀÑçÕÑæSå‚ÈÕ›ÑËQäåwüjSðTŒ>…ÞrIp¤$×Ê‘ì9ú¼yž-|ÝÐd¾2)ÏDzÙFLyUûa\\rÓ.`Š6úü³_ieZ°t\ZnÓûò2ú¼Iß¯ÝëÛQ8½/¿©cŸ•…D.Ä KÎþé)-”âoýèof¨†ê‚^?zàîý5>˜-šG7dôymtëlË)¬ï9Kdi£Œ#€÷‚ëHçCš2Ûò°¿<}J?ÂÛ†~/Íû1ìCd\0\ZšìÍCÜð®ÈñgDyçs³Fˆ6vÍOûõ[Ë»fæÑúÏaÿÞX`yõØ	\r±^ãeôyù]Æà÷C\n?Ö	ÞžC%\"\"\n¶mËDÐSŒf¿Á0x“\Z6›-Ž|Fâ¼=€ÚÊÈ@sÉÇn2ˆ¨Ù5&(Ú`¨®eENdœÍJÊÁ‹\"tcý·.¼fã5k/AQ~—i5‚m!½—QkÒÍµñYf¯4 ª?Êe\n\'âáâ\nùAÔ*5& Ú&‰L³³T„×,p¼fAÆï2ä3E‰ˆ¨Åa¦hKæ¦ù|Õsæh‹ÔÊ3E‰(¬š)ºyÃf¹ä¯`h[Í%¢pó\nvžiæƒŸ­Z03E%\"¢‡AQ\"\"\"ƒ¢î^çŽ¿™¡ŠQScP”ˆˆÚ4E‰ˆˆ|EƒÕ5gP”ˆˆHÇ>E‰ˆˆˆˆˆÈî¿³2dQ\"\"¢–ŽAQ\"\"\"\"\"¢VFDý!‚¡ˆQ[Ä (QÃ`(µuŠµ“fNb0”ˆˆHÁ–ˆˆ¨Åá@KDDDþôªBÁú‘ˆˆÚ´DDDDDDÔFy•—ˆˆ¨­bP”\Zláës°ëãixe¤,ð@¼nÓ3qrÉ—x`ÅãX8\'è?•ù\\ƒú-P¾¯ŒÞxm~\núÊE\"j£æ}€¼³gPxö ÖÏ“eDDÔ¦üÓS\rW‰ãðä¼YÈ”‹äÁëÛ•ï2âûŒ—ï4üÎCD\rÔ„AÑtŽKDr’Š%\n‘(ÌþI\n\nþZ„S²„ˆÂ[dŒ¨)‚eõƒHïÙ©— û`,&\"¢ÖÇ9ð)‚¡bjiô:QŸ‚^7¶hÉ˜8ó<ÜO.6¥æàÚrð¢øNÓsf­–evó±þÙÀž—<¬\'\"ò¬ÉÂ“Q]`©¿ˆ\Z¹ìU»vhá4µ“ëÂYr\n–.î±r±µ{ûéµ5}#žýJE)Êl@EQp¼°¡¬P®jÑ|¼/‘Ýy¿ŸÙ´Þî³äxôÅil=$—[´8<Ñ†þ?Qƒn”º±N.‡ÂÓûqÊÒÙãDD­œŒ¶Ô`¨îruŠKåT^…öñ¾j\\ž•‰Ú’>èn±!ï‹Ur™ˆÈM3ÐRDâ:âRy\r:$D£¾Ü†‹ÞÑqÝ,ˆ²×gu°ùÚ¦¹‰ Ö¸lÏÁoM©(Ìž?™¹ˆ\"l]~\Z;Ôy§u¶ÓX¹JÏð¡¿ÙõF¬i½¶]ßüX¶³V}µ¾/cYß1ƒ± SÝRQ‰Ü÷c]±\\ôz^>ŒŒMOf¢‹ºPˆ\rÓwámu^‡WÖLÃmú¡Uû6bÊ«r©‘ÆOÃsS{ÈÀº÷#¼½Vï,^4S4¹„3_âååÇ´y±Ýàï°¦tæ×Þ¸c[m;|ú>´Õâ\\æeß‚×óòE~0Þnx¼Ï4cïÏFöyã}!Éít•¹Æ×ˆ{mã}Á’ßËÏJlws9VžOµßKömÕ}Â|ß¸”yÙ·àõ¼ô{N÷.Qkh©b“â•?çQÝ\rjÊPyY®\nªW°óì0ìë9Kd	µN­k BQOú~vìÝ	1íåp¥ÆŠòêz˜rÃE¿YXz‡ý›±¢\0›V¯G®:/2AE–ö¥<@Àª\rÛ•§4 óžg0Åñ˜ag=ú.ÞÜ#¿$;íûìîWñÞ	¹ Hñæt$a˜×;ûÜ,û\\<ldàáyáÚCöm|[ämä}ß‚ø.2SyVÝ€Ô±ÏÊ2?‰æóJðbÆƒX)‹ÌÄ¾\'¢d³D‰È=oucEE³ùnèté<¬µ~UlB‡ÎñHèÒA¯¯V*¶šzu>yÜÈ@×§@ÔwLoÜzä´ÜÆ9¨©“ô`¥¶SÙ§Ô)ˆšŠóú9$§à‰AVüV˜œ_¯.w+t{^~Sƒ£	øÌ)(*ú‰]õ´–\n)–\'—)(ªc±ÅûØv\\–Y<\rX¾Õ%§ ¦´Ôƒ™ê2°y‘öú!‹Ç$¢ïÏE]‘c_ïeßêò0”y8/‰ æ„4÷jŸB‘AúP4rœ·U1·{oà÷æ ¦~ŸÙƒ–z0Óôtz­Âù¾òºoç{ÖyžÁÔ6µ†‡>ÑD°¬(®¾ªÖ“ŠQcµª hd’£¯ ´¢Öû1ÚuDl‚Ñ\"¡æÚ%XÏWâRÈNªDôi}pJ&ªË	Ø-ƒ¢)#f!óäzhÔ‚”}\rAOY–ø7ç€£‡ïÞS™\n5@\nGÀÕéXÎÔ +ô@¨›c{ÛÞÇ¾5ŠQóñV7†¾ù|dgXP[m`5S}mj®(3×jQu1|¢\"ˆµ ³\Z[—»	ìd\\LK¶z<žÚ©D…Z|›_‰Ønä² ²;õ€RŽ\0Ý£Ô¥S;Q`IÂ­Éê¢r¬¤:öW\\dˆ\n§Ž”¢ÒíÈØÒ‚ß4yä`LîYˆ\r2 êÂÞ	¶Ó´ãùo1~TX÷~î1ðxÐ´ŽáÈ .%Q.+lyX£=·}‡Ä\"¹¿¶xð³<X{ÝŒ!Ú\"’‡§{¿±ïÏç¾•;½Ïpãràvü>+sc0añ`ÌÖ?[…×ûLê;(	±åæ€¨¶ÿ$•¹\'=n·Ã´Ì÷™Jd(ë÷ð¡råšÅ »znØš[‰´›õ_…£pk ÷kÇýîsßÊõï;È¸ìÆ¡ÓX¢ü?è6.KÇøx-QK…˜è‹8_Ýõ[>Jl}‘õº\\$\"\"\n[ú8Êß55>¢Âµ:TWiýÐ\\®®	Ï€¨\"3k(pô{v¥³¢=z@T(Fnaâã^rD…Gqñ0=ª(O‚énû#Í@zl²o_Œ-+@|jí¹|ñ´oÝ³#ú\r4 êy7¢;JPÈ€(5@ˆƒ¢ß¶J?*3g×êQU}	—ª”Š-,Û>qèoŠ2šõMŒl5(Ë.Ô¾!³ñšœMÝý!LŽ€ÒØ›SPð1ø*2Oû~Mo‚/Úy[R0A®o²`“>ð‡óäW™„D‹òÎE¿œžˆìÏÛ§I½d¹?ŽE¾­©?\"$bH ¯áX^÷}®È†Ïë§Ùƒ«\r‹Ì;õ`£÷ûL‡	\"‹ÔÔtB7åš/sÈ]ˆLLý>Q¦	>å ÛõàºÚŸi)¾5_½î»¿}ÿ´ò\rq¨\\ï»ÿÐØÌëÙÇ(µÊ_l\\±V#$‰¡.VaVÆK(™ ~„ÚŽ×d)Qø¹Š‹z¿¢çQˆø(ß¬WkkPuù\"*kEVM%2.ç=ƒ¥r26G÷‡ÈöÔ·]êÜä½l;ÞÜ]€žwÈõ3Ç9ž‰ÉˆG\Z¦Ø·U&S¼í;¤D†¨òÝæÀ±55Phƒ¢‘Ž°$è#Æ;–c´¦ñÞ\\»T	k€¦M«¿]î>³O8UV-çÜ‰Ãõr`‰²1­Ì­”ëü³ã»\"Äö(4+ÂqÃƒcï—ýSÊ}‹L;ç½‹¬DíØGp>shÓF•)ª\rVä‘hî>µ\n>}//Ò¦Ígä:¿”áàqÒPö5}P¨,ËUþìûøWx[®[³7“\Zud„*Ÿ‹=ÃØû}¦™Â6§€¤êÎ{»f\"0/›¦ë÷áVQ|7Š­8eKAÿ-SùÊ²\\å×¾‹‹°L®ÓÞŸ›À¨¬*ÿWÎ«û1fžµPÑ©#¯×Ý`Ñ—ã¢BP1‹‡†EÀâG(>4QKq—.Õ¡S{jÆzT‹Ã6™Æ—<<Md’¾‹e«_U§UG“<}zNÙžrÛe«·à¬\\gwb½}ß›*†b¾)xiÜVN²?S¿xÝw¨ÈìÓ7€ŸóG_\"j ÐE/W;FT\'+jÔA“”ù&i2Ø4DÖå’íÕÈ|(OdÈBA45¶ôÆl/ÁF{_r\nf”)ªP÷´ŒtËý»k°èÂE ŠÂì©æLQ3³@|U‘Š¡h‹w?3\r3?S6*ST-§z6\ZFu?-°LQEñÞBX’0dx**v}sŒÑÿ}àÔþD»Š@¶ûÀŸÇûL6‘/ø«»š´nÒÆyËÂ¬Äyýfô(STß·Ä8ÜÚ§\Z9†.4þïÛí\" ªö‡ÊþD©¹Z«©n<[PcUæ}õ›Ö`lVFDD-MÄÄvDM]ëxnü±¢ÂÐ$]‚Æ«óVý‹sâ8LwÉ-FQÐ³—éAÀ¡ª\\yÓdÞãnp$q.ve‡pª*\rSîñ°_¡¬VŸMä5¦}ÛÉ¬N¿a´ú{å[Nw¤Î“ËDDhšÑçíüA°År;Ð6¸Œ#äDG8GU!77™öAj\\¡A3ç‘Å=¾£ž‹#Z{\ZÝ2õsÓurŒ<¯pÜè|!Ë¹’6ŒBÿÈ(ìš’ª–âì.¼X–‰_bWÐFŸOžó}ôxÁ8Ê»:X’¬´åay:ú”Êõ¢ùû¨Xó¼ìt?8’¶sö˜t>÷my^P=\rå–þÝ\\îßgà|Ÿ¹½ïÌÌ÷šy”w5«ß ¶ÓÈ½Ð}õûLœ×Oj<è¥’÷¸›{Èç¾Å Nv¢]çý&à¸—÷EmWë\Z]W-QcµìúQ«Eë	øÁ04ucs0Žð.FoÏAâ´È³´dÁ½\0ûŽÆ#+.G~¤3ï}Þ¹ü\0¬û Lêä<:¼–jÉiôy…id{Á4º½côyßûÄw´DDÍÃ[ÝØÄAQ\"\n6wÁr¢Ö®uECAQ\"¢¶‚õ#µ:ŠQ#y«CÛ|žˆBNô\rË€(yôú0ôµ•¸é^ƒˆˆˆ¨¥ËG‰Í‚îýå\"Q\0%\"\"jôí¦÷Å©­ž²+ˆˆˆˆÂœ%/¨ôÄz—¾CWaÖ9è>ÝÓz\"\"Ï%\"\"jÛyZ–µ$O3Ðë¡‰¼ý;›ÐQ`%\"\"\"\"\"\"\"\"¢6…AQ\"\"\"\"\"\"\"\"\"jS%\"\"\"\"\"\"\"\"¢6…AQ\"\"\"\"\"\"\"\"\"jS%\"\"\"\"\"\"\"\"¢6…AQ\"\"\"\"\"\"\"\"\"jS%\"\"\"\"\"\"\"\"¢VgËÖm.“®ýõ×÷øW9¯ª©©Æ59O®ÆÞŸ‡RJñÕ™zYb…Ùó‡ã®úïñm±,Rô3ÏÞ×7W›Ë‰ˆ¨anêÛGÎ9œÊÏ—sšîIIJV#—\Z‡u#µ¬É»<<ïQLzîR¦!Q§°÷‡jóº›£ñÝ‘Ó¨’¥æm#æû}8e¼}ÇáÉÙÓ1A]#*sóP$W5Z(÷ÝHÉsÂÏç÷BåæHYü8æþ´3Nî(€~5.ã_z?iÿ-›ÿë6À\0<°â\\wúòËd…ñÝŽå>r*\nÝ}FºÐE#¢Ÿ¸˜htÑ§vu¨¾|U¾ INÁC#/!çÃRœ‘Ef0xØuè|ÎüìÖ+Ã®ë„ŠÓŠCËèë€Ø¤nèj¬#¯ââ¥z>\\Qƒµš ¨þÉº1¨2ïyÃ+·`ÙÇÀW¹ß¢B2†½	ñu?â€)(ZŒCÊk¿Ê­DÚÐQsÂ)(Zs\Z{Åúï£1¤4\nÝ.ûÍÂÒŸMV±n«žø³ïfÒeH2{Ôáäæ@ö­¸)º¹A	VE£ÏØAˆ>ÛØ ¨®NÁu7bÃÃÅî?ÿu2ÆMºw*Sj½ÓqÆOÃs¿\Z«®»sR?D;T}­÷ÆÇ¶CDÐïAí¼î¼Ã5ø§ïÛ_¯\ný\r¯xß·ˆžq¯\\? \n»÷ß”¯õ>x}ße(I¼3fÆ»\rv†î>#]Ó4Ÿ¯«BiiŠõ©Ú]–ex™ KÇDÉ%³¾ƒ’€Ü¿c‡\\ö×©‡±dy~{HøId˜z:\"\"jé.â¼±n¬¨Eü¹ˆˆ(È\"Ð9¶®Ô\\”ËÉH‰ÎžñôPzï­~Ë6ljà1eÄcXzG<ömTö-ö¿ú kRäú–ª¸¨°]P¯UQ©\r(/õ;@×’çÜƒaÈÃÖ:÷æ¤\"Å[xy‘2}ziSÂøþrµÈZœ\nlë”iÍ^`Ø¢i\"×ªÕ©±Ø/·wYï•}Ÿ†IøR;¯Ea?Ò1wñ\0¹R¡¬Ÿ;¼Ò¾ýæ3=0é¥‘Ê]íû×ªÏñäú/QÐk4ÎI”kE@u†•ëÛ»®÷ÊkV¼ö}l.OÇ}nöî÷YkúLÑvÕ	¸ö¿ðiMßïè|\Z¿û_+ÎËR‡8Ì¾/çvüy¦°|žX<Ó³oÄ¸ìëpò^¡ÆuñH<]bØV[7ÜÔ¤Þ\\vþÌ%¾o¦÷°aûÑKò5DDÔò3a\"Ð)¦êk.3JDDAÓ\Z2E#¢bÑ­ÃEXk#y\r5Ì\r’>qÛM@á78T.‹$¸üÕ„±Z&gr%¾:å.ì\"2IÝdŠê¢ûà\'.Ùœ¸wB:¬»ßÀÿ~/‹PS§™¨¦&òŽïvß‚¹;€»LMÿ“1qæ\"Œ¨ÿío}óï¯qÍR]°î >Y¾?©|¿Ï•…þÈ?Ý2c¯úà!sæ šy.oŽÀØ30ÅMv¢)sQNƒÏ`ßAå“R3E«0øWr[—¬HÑäZ_§L.™‹0mþõÈ_õ\'2%4Ö ‡!K1?©“ú#ºHÏ-ÃaÃqª/Åcððî¨“™C™ŒÁÖüîOÚª^V¶Ï@wçlS·¼ï[½žö÷Pƒªý™Z/¯Y\"ÆÏèƒŸcÓAíÃ+¾ÐƒïLEG2U½î[ûüöÉýŠóŒ |1%Ú6Êgyß„(ù`§<ŽÈìì‡ý;ºÍìtæï5ïçÖ{oVî§ìWo÷ZR‰`äPd^8‚%«ŠpJ–\Zõ“Š´‚B¬3Ý¡\":Ýr¨™ K–@®M®RUà·jùÈ‡\nW\nÓnŽ“ËŠäÎè¦ü™?nÿñNl¯ì³ë ¼6?}e)Q«K,`«dë‰ AÇyÏ`é¼‰è©,ö¼CÌ‹i2µW hÏ;jçª£²$Hú\rTŽY€¼rÙEž6ÖÝzéœí1OŽð\'ÿO=\'\"þè»rÛw±C1ÿž¹^#ÞïÚk6‹CV–y}èôÀ¤ÃP¦f~‰K:ÆŽ—«Dæb¯s2ëñ#ì1„3_âmCVgÚT}[™iÈl²øfQ·•ûî5\ZèûÆßŒ4[!—ËA‘ˆä àð1ûòø—F#M™‹Kñ3k²Á’h±!¯~}àEéˆ‡‰©²(TR»\"Þx-ÕŒU`éêG¶s\0×ìøQäÛz`ñs¤&Ñ4AÑŽ]”¤ÜêƒHY’S°t±lþÞS%…[ûÄ¢à;§õ×+Éi¬ÛY+³ãëÓ¨LKÀX¹ì¾y~-Ö­ÊÁÖ½±`qoûk‰ˆ¨¥ëŒnöºÑ‚Îü™’ˆˆÚ¸ÈÎ]€Ê*\\dD4xÊ¶ãM=à¨,žµ ×#ÄÈPH‘žU°Ý4=„÷v >5ÃwÀ©ßhdu)Àî=zÖR1¶ì8\0kö`¯êÜ¼)_“{¦\0ˆK6í{åì!Hí9³VË‚ *øô}lSƒiÇpäŒ#6dpàÌw8¨.•áàqdj\nîØ8xøÐëf{“ëƒË7Êmó¾…ä”X¿šYY<\Zi¶<ìpÄm šÚ§#þÌ~ûyèD–ës+f¨MÎ×ìµ!>)I®ñ—ç}«Dvæp\nv}åôDPQ{4ð©7  ëqß’\Z°¶aÿgz SÙ¿+”c«]\0|‰Ä\"ÙÞí€o¾¯YŠËð~¨ÑBÿvµVCŸi¥•í•‡Àð	ŒŠ@¤ò\'Ã;üÜ\Z`Ÿ >[qÊ–‚þêU\"ð\nœ:â-Àš‚lö1JDÔ\nÔ£ÒP7[¯À’ÀÀ(µa‘1èÖ¡\n¶ZFDÛ”Šb§&ñ¨*ÇrÖSª\'Ö½ÏTÏÎáˆ!Øxpù[öLPµoH{3Cú[`=~Ôs³ð¬rV5~\Zž:9Mê%Ë¥”$‹œóLZ¤f«>ï>8¨ö£‰<¬Yn¦M}Ù¥Zÿ›âýˆcYKKåZÿxÚ·FËÅÞð¡)XkÁ°E3¸KËýp›–…YQHsrOû–DàsjS@ZeIÇÜE]‘£fænÄÁþIˆC%ŠÝtÝð÷š‰û\"ð\035V“?~]­«C8õŽ©\r‚tç3‡âµû\rMÙ\rÆÞœ‚Ê|«ÛfõS‹oó+µ&ôÉñè‹R7£Ó‹&úÙ˜Ðõ4V.ÏÁ²f¥Q»|	ÁéÝˆˆ¨eŠìØÙÜÂ0Þ±VM\rÉoåå°\"\réýä²;N™›)Ýâåœº$à:9«JH@\0[7uðµy½–=è: ’µ	·6ØŽ#p§7Ÿ×2&Ô «\" :w8°…1ãÔAd5ºLËÔLFs3ÿÀ“î÷­}¥ŽFšSW@)Ê”·d53µ&õe…rÑ\'Oû–Äuu0UÒ6óµ2~^vÍ\Z`¦Ækâ ¨6’`§šK¸,KÂƒ—¾;“SV„wÁÈâ\ZTZ’p«Ìs{ÿPdúþQÆäÔ‘RTvíŒ±ƒ’pþ¯Îý™Š€¨÷¾N‰ˆ¨å‹Œ‰G´øÑÉ1DDÔF]®6´ P[Q\\êªPªÌW†×Ã#ù«l;vŸýz:ú/U°1ñmôù¢“ù°vŠqö iÆ\rŒÃÙ¿ù‘Íyâ(Î\"\rwØûUö{K\Z¬G¿¨[\01ÐRáÙƒX?O„\\\"Æ25_ö­©Ñ^oÎ$5ÕæÞr^Rƒ®NÍñuŽ€¨S6¤dZŠŒHY¦Óšñú/;†YÌ±öfænF†÷¶ocÐòe—R­‹øá÷ØGÊOž3ÌµßTÇö¶o…! ê0Uûú´`Ø}Ÿî>…ž½k1_á×5S5$óUóÚŽ3Ê=|;_—vYYÃMƒù•––µSëˆ(’b;Ê%àRåyXÃ¸IÄØû³‘}þ€=#³ï˜ÁXÐ­Ðc£êúL­~eîätŠþßåà·\"K?£7^çÜJ%rß?l\Z°IsBZ¶.?mêOTì{6N2;”ˆÈÉÄ	®½oÙjþv‘>p ú Á®EA5FWcEqu½\\ \"\"j˜_?\Z‰º2ú\nJ+8èRpˆ‘Ú\'»_Å{¦Ä€E\"«‹\\ÔÛ‚eŸ+µýfaébh£\nìÛø¶(·‘¹~þ@ç—Ødè³4óžg0¥‡\\0l«AMjÏð´}×Þ¨ï}kïI ¥ÒÏY¥½¯Ä¿9¿_3}a³,ˆýŠªA6ÑÜÚ}&¦\Z@›j¿ \Z[Ö¨ÁQÑoæ3$[‰Ic°N.Êe»ýåéèSj|ýnš›‰Ëà \\²Ó-ƒƒ.Ù¶Æ`¢éÜÝ8õówZçcßZ°Ö5ÃLõ÷`zýz¹?¶¯}›®§ÈÕÇæÏÄùóÐÈkëî¼|^3…¯{Æ›×·£pz_Øö¼„ôÙ«d!ù+äAÑ–MŒJŸŠóNAL\"\"j^­ê¡ˆˆ(HX?…;-À&úÆt,µ21k°­aÔ@`ÿB7ÃÐSƒŒ	î‚–¡×|Ç–ÓrÙ¨>ˆóýŽ6èóŸ÷ò–f£äã^ó´,#¿qH¯D³zD‰ˆˆˆˆˆˆ¨±D_˜rV× ú(e\ri:íIñÚÏ±é¸oNŽf.›7KP²-Ðjß°\rˆŠíÅy{íWÖ­ùXè\nmfŠQ‹ÃL\"\"\"W¬‰Z\07ÍçÍÄƒG4é†2ý‡R8ŸÑÍ8ÒfóŠQ‹Ã‡>\"\"\"W¬‰ˆˆüÇæóDDDDDDDDDÔ¦0(JDDDDDDDDDm\nƒ¢DDDDDDDDDÔ¦0(JDDDDDDDDDm\nƒ¢DDDDDDDDDÔ¦0(JDDDDDDDDDm\nƒ¢DDDDDDDDDÔ¦´Á hfÏÏÆrÑYFo¼6?}å¢&O,ÎvSNDDÔ–ÍÇúCgPxöòÖÍ—eDDDDB2&Î|OŽH–ËM+óžg°tž65×9¸7\0¬xç$ýGb¡2ÿÀx¹ª‘’ç<„çKÌ}‘\'â^˜†!rÉ™úÈõC?Žç^\Z©ü¯¢`j² hdL\"’“äÓA–6ƒŒë‘‰ÓØzH.5“ˆ(‹£nŒ‹jq¿T.X·ÙÈÁ‹={!}ö*YJDDÔ0¦zQN±‘r%…” †WàP—‡e`3Ðàfîç¯bÙêW±éœ, ÿŸ†¹Ã+±yù1Y Qs+ää “^}½k WëëÕ p€´ã?„ñýeyßz ÑNy?Žuî¶÷&ã_2ì»b-¸éîšÃŽ½±˜Ä`g³i‚ç¯tŽKD7XQ\\Z¦MÕõr](ˆ¬ÎÁ˜íáŽ\Z{s\n\nþZ„SrÙ?øíò,Yèv\"+Õó¹QÛ%~,LêT‡R½n¬¨ÅU¹Î½vhá4µk\'×5¾Ý-°Ù…•r™ˆˆ¨±.Užw<7*Såe¹‚ÚžÄqxrÞDÄ}W\rnŠécŒÆÄÀcia¦e6 ¢¨8^Š\nØPV(W……x`j|ºe‰jü4LÂ—xyÑ[Êôö#síÂDŒŸ“Šüb2}ziSÁGX¸½iëWäÃg!«=•æÁ*K´}ãSyleÚ|¦&éç&‚µSc±_žÛš½À°Ež³3\rY<ÃÊõ÷ý%\nz  «TïC!\nd‰³âµïcsy:îs³Ïâ¢JÀvEÊ|Q©rÓ”—¢X[EAÒþúë{ü«œWÕÔTãšœŠÈh$´«q TJNÁÒÇú¡sîü6ÏÍñ”õ¼„Ü?^ÀY$ô3ÏÞ×ã²oÄ¸>]”šøö¨Âyçu=lØ~ô’¶‘B]wwÎÈ×º–Õ#¯¾æÜ;\07Woy÷ÅM}ûÈ9‡SùùrNÓ=)I©ÓjäRã½nŒˆ‚¥s.ø„\ZµC§ØnHˆFL´6u¸R‹Úú†œY^Ysî¾p33\r‹gÁ£3º¢óÇg±O¾Âãù%nªþ\ZoýïYBDDÍ©¥×í:tB\'Ô5°n#oRF<†_M‹»†Þ¡Ni5ßàP¹£üf•t‹}ý]É•øê”ò\0+“³‡ãrnÆÍ{ÓÄº›£ñÝ‘Ó¨’ûY¦óï’Û\rŒ˜ï÷á”z‹uÁMé· [Åß°÷‡jeYd}Š}ÜˆÊÜ<5Ðã(Ó¶uJ¾VÙïÈéÈ¨Ü‚×wV—…ªòä¾ó¶Îç¥»®ïH½¤Ÿƒƒ§k¢ê7Kï¾ß÷Á?ÎžŽ	â5ú5ÑÍû\0yŸ,Çã?©	ð»P\ròw|‹ÃêÍ2Þ|ùeê\n•È†¼ï¦3ø~È}øùü;pç¤[‘Z¯¿^!‚|ÿ:ã”r±N›®Gåæ¨\Z’Ì˜Q™=sÔÖ™¶UƒtbÆ½r»;:ãäŽ¯Lòœ{0º.o¿o8)!ÿvïÑËjPÕ£2Sëåöâ=ÞG~R\'õGt‘<öøq˜‘Q‰/çjA½²\\p+nM®2ìÓ³!‹ïAÄ«ñÇsi¸ux.ì5^³4üäÞ”m7”Ý¤œ›rÄ¾‡<2ƒ­9øÝŸ´•Õ/+ç–î¦ëâr­ï›…#ì”û.CIb?ŒèßÑåº¹“<ç>¤ç­Æÿü!\Zƒ\'õN¸?fñ…Î¸õÞ›qYùMa#qÍåqªòëZQ`Bž)\ZÙ±3.]é€ØP7}>Ôç·ç`ÙÎZYh6öÎÞ@îß±C.«”ídVc«ÈÓvíO³îÔÎÃjùÊÜJYâpêH)*-IÊdY Hë‹Ê|«#£ôÐi,yÿ4ºËÆÒ1Q²ˆˆÚ²ˆŽÑ©èç¨ã£|UÉ×p©º\Zö„™+Ê—ÑZÿCª®âpÛ“™(s-FM_‹\rgS1óõT¹ŽˆˆˆZÄq˜>ÐŠM2ÛRLïÐVíyÇÞÄÜjÈÈ\\ö¹±¿¹4L™—²bÝœí2ãúikD`qJÜ¬’Û­:\ndM›…Lmµ`êYŸë‘«–‰>G™ [`ø(V÷ôÀÙ3žú½sÞö]ìÃPÌ¿ÇÓà!NúÍÂ|ã5Ù]€žw<fÎBUÞçüi	Ø-Öo<\0kì&ËR>s“öËÌFÒFéÍ«EFf: g\\~*ú°aÿ\nCVg¯ÑÈ.u¬O›êÈŠLžs;°VË˜Ô³=ÍŠ‰Òß‚‚Ãæfó•œœùÎ~Ž¢9¹ˆ\"!É¯fã—¿mÇå‚‹c8rÆâÈþÌáú{P¾g\'Àð~´¬Ò4e..Å3µ+âm…8¨[íVÀXº\"Ey#²@?Ü&¼9~ù¶¤¾eÉ!ŠF Cå¡/¶=jõ&Ö‹ˆŽ· s,²3_ƒÜ÷sð[}…Æ¡Z%N1L£0û\')(Ø~Ú(õWqr\nbÑwìÇPÊœƒ²Êë–-?‚ó™CñÚýq²ˆˆÚªöí;ÑÊT)ëÆò* ¶›ï\r¯\\BeÍeæ\Zjª.¢±m0NnÚˆg¿ÒæßÎ+T¾˜ÆánmÑó‘š”üÀ¾D‰ˆ(xD«ýÃf‹¢ÕICºd6ÄÙÝï`‹š¤vyç€øn\"”•qãpöoÛeÖ§²~‚}UÎÇrDßÜcÈƒKÌ@_ÀÇö²CØ~´={ùØì7\ZY]\n°Û¾m1¶ìËn²Î’1ñ–4X~)ƒ³Šë±é\\úÞdÑU`ßFÀ-;„SUqHLPWhV?ˆôPõ«nËÃ\ZÙŸgñÞBXõ \\ÿèc±!¯ÌÜö\n`A¢ñwí3_âíµÆõŽ`[ñÚ†àb·!>IùBg—„Deÿ>›óëÇ]_¹mÎ=dñh¤)ïa‡s@Pöí9·!Ö¬Ès¼¯F:¸\\€I¢ÏÏEZ3~ç`¤Öéô9þ‘\Zh6¿oDv®Ø÷T`³hBX$Ô/©/âyÀÏ@-Uô)\nÔX\r™-—/ÂV×ÚËåF‹Â­}bå¼g}Ç¤\"­ ëÜým„ß!¶O¼6*}F‚rŒrïÖ´Tö1JDD¸TY…‹z¢çÕZT×ˆ`©ïlÑË«Q[Wêº4-ŒMÀMrÖ›×vˆçoôÂ˜§e!Q#]­µú=[‡xFƒ¡l;ÞT3!å€E3Çˆ*@žÌ,Ä\0FŽàfÊô&çÄŠžÊëNtzOH@¼ÈÆ4¤4`\0IDUåøQÎ6„õ¼à@U>rí­•‹±eƒ#Ã6Ô¬Ç:‚Ç¿ÂÛ‹d&¨Ú©}†ËàÙø›‘†s8â1Që¿ÔNîÉIÍz4êŸßŸÀ\0<°HËVu—©ežÃæç¦½Fã¹Q°Fd©Šuj¦Ö_fc©O}ßŸVbØ\"ó@NiS·gÏŠ€qJ’ÖÒR¹ÖK:æ.êŠ5»VùÔkT‰b™«\r#ú\r(PKAâ èUÔ×ûó×µX·J4{¯FæCÙxÂíJZà´à»\n¹D‡ÊQ ›Ð«ƒ8¹;†èëtñ tË=€%Ë=0KDD-Ë•+uèÔÐºñj*ê‹4\0•å8)g½Y2¶R{®\0~q;_—…DDDAu—.ÕÉyj´ëe3óW±©b(æõÄ){ÉHì\"g%Ñ,ßc³ú*GÓ{û¤6Ý/FY¼gvIÀurV%‚¬rÖZ¶«.)-¢Q§äÍëÕÀ¦»‘LŒ™ŸŽ`¦Ö|^kšo¢]½Fš1Õ@Dç‡¹9¿B0æ@©Ú¤>õ‰ì^6ì_+÷½m£Úm@üðÛ1Df`š²ge“zu +_\n/ÀêÜ=Aƒ¹Fj)hBž)z¹î\":Åv†½E`dgX:^Dm°GôÖwgÆõÊßÓØêÒ´¾%€´›å_?¼hÕPã±è–‡þ]ÝCìÓG_§DDÔ¶\\­«Ã¥èhGW2Qˆ‰VÊê‚ê*ÍÁ®§á•‘²È­T¬š’Šª…øB–ø¶\n…Ê÷¶î7Ì—ËDDDA$%Œíˆšº&°·ù±Â5ì%ÊâS3”jMé{Þâ°¦ŒÈFÏªØî”Q)ú.Ýt.\rSŒÁØGÕþI§p×”²[þV\0ô˜(ûÕ¤Œ˜¥õë)¶E\Zî°oë¦I¼GÅÈ-TÞïÀÑŽ ­Ks|?ˆ–ÎžAÞº&ü.4þvCž–)\'o}V&Ï†4cŸ˜\n{0P67AW§æøvŽ€èË²i¿‘# ê¦ÿOÙŒß>\"¼²¯±ö~?´&î0*½Î|ÎC÷°Ú~ð°r“ö\ZíØ§¸†çìZm”øçVGÌW¨}}Z0lŽ¡O×Q=Ì™¼‚ìà9ûûT\0Z\'Z.&*4T»¬¬á¦öw¥¥%AÏ>‰ˆ² I©Ð4q¾ÔÐœ>èâðÄâTœß‘‘9öþldŸ?à!()^?HíhWùS­ï× {*°nUN‰>GçE¦óß‰‚#Xò{CE\"ŸÈu>†Øþ&àSf‡ÓÄ	®ß”¶l5#L8P©ÓÿbáN(êFDÆ 9¾³\\¨ƒ­ÜæhN4\"(:\r·ÅVà/o:úu”ËEEÕ¾˜òj`-*Ä—°I%/…¦/-\"\"\nXË®#Ð9®,úccÈêÆ¶G†dn–^€MöÁŽtbà¢G‘¥gyžÛ¢elŠÑçÕÁ†œ_ï FŸŸÒC.˜ö­í³o¡Þ—¨~ÑW§ÞG©ÖßhO1+Ýmh¦.F¿C{ZDÖ©£é¾Ó¶ú9«\\÷+·7_ã9)Äqo)Çª\rŽþR]ˆ èÒl`Op¿‰À hêí.SÞÍÀ0§EÁ§ZpTL\ZVŠ¾IÙ™¦õç°o,†‰ANõ5¢ÏO§æï.û–´cË€©,³3ßü\ZýœMDpqjX÷šß¿ûc‹N€•ÛÙ9½oóúsØ¬wG` Ãõ¼Ì×ÜùÜ4ò½y=®ƒË1D·j}oY¿¼¾…ÓûÂäû°­h’ h³R–ÑÈYÞÀÁ”ˆˆ(ì´Š h³Ò‚¢	^‹ù¿“E\rÀ (QxaýHÔÊ‰ ›è;Ó%ð&\0j@@Í--ÀwAËPSƒƒé¨hŽc«×1Ö}¦«O2pZî>‹Öïpdp¾äcöõß!o>ßìÔ‘ß%\"\"\n¶S%6Xº÷‘KDDDDJj?œNŒMÅƒã>üôÒ¦NÃYz²ùz³DEXôÏÚ°€¨È0£Ú74 *¶Ÿ”‡?õ‡Î ÑFiý™¢DDÔê0¦±‚“)ª}{Ùå»8›ì5;ÖD­›æóÎM¶ƒDmNîÔ´ž‚MdoÆ‘ eùR %\"¢‡}DDD®X?ù¯ÅEï¾{¬œkY¾ø‚\rú‰ˆ\ZŠ}DDD®X?ù™¢DDÔâð¡ˆˆÈëG\"\"\"ÿµþ–ˆˆˆˆˆˆˆˆˆˆ%\"\"\"\"\"\"\"\"¢6…AQ\"\"\"\"\"\"\"\"\"jS%\"\"\"\"\"\"\"\"¢6…AQ\"\"\"\"\"\"\"\"\"jS%\"\"¢V#óžg°tž6=9\"Y–š¥ŒxL]ÿp?Y@DÔÆ}»s¯}\"r\'ëNýœÔéžY\Z1þ¥ÇñÜâÊü\0<°âq,œ“¨­j4±¿‡0¾¿\\lŒñÓðÜK#áþÛKòœ‡<þâ3Ÿ§xÝs+¦aˆ\\EM#ÄAÑtŽKDr’ódAg†c‰ˆ¨ŠŒqW7&\"6R¾ ,$câÌP=ü„nß¹Ÿ¿Še«_Å¦s²€T_ŸƒMÏÄÉ%\"\"ç@¨1@Ú<AÒˆ\rÛº‘\ZBü`éé‡JÁÜœ7™²Ü—¢=ï¨uþª£²„üÖ$NÅþµ_¡X©Ô Ýãrr\r¾Y¬¯S&7U-°§¿&ð\0Ÿ¾ýãeéØ.¯‘h}½\Zö_cÏ[½žŽ[¼v?*†Ïpûž¨ù…84y+ÊP\\j˜¬•ò+¨¿ª½‚ˆˆ¨­¹\\íT7–WáêPE¾€BJˆzï„, \"\"š4@\Z…ø¤xÀê¨#+/ËuÔ¬BUwŠ€éüVlRö-ö¿lõQ¤‡UÖgCˆïvÊm\\ZªÌ—¢ÌT•i«ÂB\"ÆÏIö~ŽmÇe‘j\0˜\nl^ô^V¦5Êùa‹ÂñÓ0	_ªë^^ôö#sA@eýÜá•öí7ŸéI~g¢jAÍûPˆYb$‚–Žc+Ó§ç6ÕqnCÏÀ°r}ý—(è5ÚÿìÜF·¨ÎòÏÈÇðáŠ<ÄÎ×®ð¬¨D±ò9U¶(’«¨i´ËÊ\Z~MÎ«JKKÊx¥ÈŽ‰¹rÖZFE‰ˆ¨a&Npý©uËÖmrN“>p R§çh¨ëÆˆ(’Ú× ¸º^–4/ñ€2¥‡\\0°}oîÑò	DVÇüzæaò0³¹b6qžœ60¼VÛŸö\Zø±o_ÌÇ®À¾ï`‹ÓG-ŽyG…ó>3ðð¼‰è©Î{ÞÎùü´sSî»™÷;r8Mß‡á}ëæ}€¼¥ÙÀž—>{•,ôÓ#£°kJª\\\0ªömÄ”Wõì—T¬úxn’K¦ub»ôÓx±,/di×E_÷3Óìe&gwaÔÓ…rÁË¾GÆ¦\'ðÙôÓª¿¦2/Î=Œ/Ôh^Ûq³úœÂúžã°D–QÓkHýØÐ`ç­c†½~ÏŠQu„›¨7§ãìŽ{Ô^ÇÝmp\ZëGEÕ¬Ú°]g¼×Þöm®¯\rÎmÁ²ÏÉï}pÊM}¬3×Ëîënõ8q9Ú>äw’x¹h?® ®KÀn„ÕßŸé}kBR¿‰lÌQ°f-pß¢tíüÎ|‰——SWkMäG#M.ilØ¿â}l;.Ö\rCÙ§…è3UnkËÃšçŸ\"H7w¸E.éÛÉEA?¾a·Döã¢Tä;o/©Çé_(÷#‚š3ÐçøGx{­ü€|lo$ö5¶è}|¸M{ïøô-e^®Tˆ,ÑìRç}wEÎ¢8èæ8æsó¦qç­¾vr)ÞV>;qŽjàÖþ9š¹¼\nMÛˆ=\"\n1ÑQÍ€(‘Ô1±ÊWÖ‹á´&èïb_•ö`£en¼ê0ö›eÊêXu4SfŽCŠXW¶oî.@üÀ{1Qü@¯¼VˆŠà¡Ï}û¢<ÄŒS¾ôíV²ÆÊcûtï©ÛmÁYYbb?WÇ9Š(Ç¹Å!kZ6Ê6êëÓp‡—æ€Q¢qøË›k1jº69¢qxeÍ(\\·o£\\·?fMÃªGäj¡ç(¼˜«­ßTˆ.Y™X¨ñª¶Íå\r‹`§¾oG@Ô}#3?ÎD¹zn»p263Më‰¨-ÁÔ³‡Ï¢P™‚£¢¢ëPß>ÆÐµLØz>8â>ªþX¨ÖŸJ=Ýó½™ºèÒf\"âÊu¢~ÃPÌ·gkú¨;Æ}‹¦ì=oÑêe=»Tti#~`Ôö¯L20™rSÄWå#×CŒH;§ÄÀ*¹ZçOó·y}ž6Vûw\råü{LtjÆŸ†)óôz]Yße(Æ5UŸ©–tÌUƒzoáåy°ö\Zfoª>dñh¤‰ ©¾N)+øÔ ³`ØT¹­ÌØ¼OÏŠì?cñ¹Ì˜”ÙžsÌYC÷€õøQÁÂ@%!ÑbCþ^ýÃ€Ô€¯‰Žß{=*^+¢rÁƒ‡Ï!ÞÞ]Ët?óŠÅÔ®ˆ·â ~}ÔÌO‹r™ºúñý°qçã_©Q¨ï¡ÿ@¿3P©i4iP4²s ò\"øÃ‘&\"*\ZÑ55¸Ø‚~/Ìì•†³»’E{r”‰>ÈÔ[)X¯=¸dÃÄ[Ì¯m´²íxÏ@-:™k—\\\'—C¼/œ;*Ïµ¹…@\\²éõÙÝz†Š¶>^Yo²úA¤÷ì`–h^¹+UûváÙ¯d‘ÑÈTåq\'ÿi’bÃ¾\nÜ”nø¶.²7õ@çïNã¤²Ï´‘Ú¢Wþì[qrÓFyn…8 <_—bÎüY2¶R™%JÔf‰À¨>5XD´GGXÚ_²7?_ÓÝâ¢š8“§•2þÈwâ(Î\")ê—£‘Õ¥\0»íuk1¶ì8\0k~÷íiÜwðêåŒ‡³sdníùDýA2ÝÀeÊˆlô¬:€íölØCxOüh›šá¡^?„¼s@|7s½ºúMdpnÔ‚zÇ\"ß¦á`P/ à°´©ë”o\nê‡¥3l‹2<nsÛŽ…\r™ˆÅ{a5‘œàOs~=ð¸ß}¶dÿ‘¸o¸»œ31µfðÏÉlÏÍgœÏ½¶m„h©bßZf§KF¦ÈÚýzª]\0|‰Ä\"Ùï©BtÞF¢©¼_ZjJMW¿¨Y¢u¸TÇ,Q\"\"\"ÈíˆšºðÉõ-\"Öó}@1šÜIêƒKÜPdUl	¸ÿ1ÑTÎ±oçÁ´AšìëÍâ\ZéÇŠ\nÀþ˜ŒÌÔ8X5AßNqHˆUŽ_¤&ôJ@—ØL¼ðñì’“Û&ñ\rá×¾qàwrVñöÓÆ,V\"jn3\\\Z¢qÒ‹8oèJæòÅ*\\êØíå2SälU9~”³á¥eår¶!*Š}ÔáÈ3|G­Yün¹ÒXÆÌF”aÛózsq­Ò´Á²¯ÎþÑÇ”ÉèJí‹ÒNîÉIožo\'2#å¬jÈÃ\Z·YZ6%ö~ä”ÝiÁ°E3¸KËRýp›¿X?ˆ&ÿ¢Û€bß_ª™z2fÞªMê“”;\\ë«Ó·ž·ÑñRåŽ$PKM¡É‚¢\"K´SË„!\"\"\n%5K´®\nÕ-°	…±é»6™ûøÊ¼çQô-Ü‚}qÎMÕ|ÓG×\'ãŠØoMé–m< 6+†¢óbO¢)¸jÇù¸IŽ*Pn|žqGd‚êMß]šÀ7R(÷MD-šm’\0éÕz\\A{t`Zh13;‚öƒ£7j½kliâÂ¸U%#±‹œõ‡Sk”nMñ®\ZK¤	½FÛƒš®\"™%§Äå¥jÆ¦=˜)›ÏëÍï´ «7jß˜½Îa³Ûþ8µ>?Eó~sß˜Ú~­¦@©Ö4½¬Ñ_)1~Teßúu8†E&¨%cEszu°\"cö¬BmRïÏ E¡<o\'j©©4M•#³DÃ©¿4\"\"¢æ%³DkjC:ˆSÃC$.öìå<¬ÖlÜÑ™²oÎÝ{©Mð ÷/jçiß~²g~$câØ`eŠ*ûR›ú²Nƒ-øE´töòÖÍ—þ¨À\'*pÓ”Qj? .DsøØLüò™†g‡ž,«@—~©¸[.Ûaß‚ˆ¢ðìA¬Ÿ\'ˆ¨Õ	}€´µ5aéÜA.ë‰5—ØýZeÞ3=õ¾<Õ¦ôÆ>²µúÐzôË u}#Zb87[WøûªâœúÏÀÃj¦Zsv½RÁµI¼gZ3~c¡®Íñý¡ÕoÛñš\\¹þ#‘-’zPS™¼Ì3\0cE3v½¹½ ¤j0Q4WçuZÐÕSÓp{@Td[Ê2G@Ôu0!ÙŒø=ö¾Q“çCš)#V¡f|>ŽçŒ£Öû)>)IÎ)Æß¬Üµ2p)»pô*ƒ¨Ný¦Š÷&Ž­õKªóó¼õ¦ùŒJïÂï@­“×·+÷ rîxEP05Áèóè×\r–zkØŒªKDD-[k}^Œ°Û­CJ+Â5(*˜G£õ<ú¼B±µß,,½C.êÍæµ‘cGŒõ¼o¯œF’={ô\0âŠÑcE¿¥æ}êìû–çff8/wëí#ÑŠfû\"ñoŽ÷åv´ÛFŒ>ï<R¼·Ñç…“›Öb¾hÖ.iº«Ü0\"¼x­IïT*MÃm±rÑËèó‚}ßöÑçwámm•[ÖÄ#,°5dÔ}\"\nš`>ïoàSÔb°¥ÆHlü«-Ÿ;ÊÅ\Z>CƒÇ:[.:×É¦QÚ}Ô.u¡}TwcâZš¥gy\Z÷ï¼ŽÁí;„\\0­sÞN2îÛé;ƒé»†ÛótÒÑç=ŒŒ®&å‚$2µà¨LjÅªãHí\"xgh2_°7qÃå(í²L=¾Úï¦SàÓi[;5jï`<¾é5N£âkäù;¯SÏÉþAÛ9öíü¾GÕÝÌÀ0yhÇõ2Çp·Î÷yëûw»~*7ã†>ÿ\nvž‰¾¶¼˜ñ VÊR\nŽ&ŠWkŠR¸q\rzêe}ýØ¶e\"‹azwä,‚Y«e5¹æŠ\ZëG¿šÉ{aR°¸ýÂ“\Z˜t\nbªe©È7Cð‰ÁŠÐ5–.–»Ë6\r1ô­0‘ «ÜLýàîsõÛ|¬?ô<²K7 uì³²Œ‚…=¶ÁM?e‰è«”YÏ3 ê™È^8Ã€(©DPSŸ\ZÂØÄ¾±V¢I4±–³ºäá©JY0û¢,Ã¶µy€¡ÉxSÙ˜bäø¦ˆŠ@¬Ö?kƒ¢²Éƒ¢\"›T=vàQÑ§ð,¢¡ÄLQ\"\"jq˜)J!á¦‰ ±\0\"¢p×Ü™¢ž#ÀÉ,RÏ@&¢¦ÒÚþ3(JDD-ƒ¢DDäŒ¡à	vPÔˆÒàã½ODM¥µýýeóy\"\"\"\"\"jÑj9Äµ>5”ø¼õ‰ˆˆ¨¡%\"\"\"\"\"¢&Ç\0)5\'E‰ˆˆˆˆˆ¨Y¤\r\r’2@JDD`Ÿ¢DDÔâ°OQ\"\"2b,xüíOThªú±±Ÿoc2Q[w×§µ¿g\"\n½¶ð·…AQ\"\"jq%\"\"#…4m¡~d€Ôï\"\n…¶ð·…Íç‰ˆˆˆˆˆ¨EäúÔâ!_Ÿˆˆ¨mcP”ˆˆˆˆˆˆZH‰ˆ¨1m¤…¯ÏÁ®µiÓ3q²4À+ÇÂ9‰@ÿ‘X¨Ì?àÚšÆƒDŒéq<·x€2oØOK÷úvú\0ä\"ù¡Q×ìì<{;_—‹DÔ\"¥ŒxKç=#§YÈ”åa-qžç{O†, \"¢Ö.˜ÒV$í7KgŽCŠ\\kâyDy¦Ð¦ƒX?O–‘O¯íÐÿï(ÓŽWd)5IP42&ÉIŽ)6R®hÞ~z-FM_‹\rüqQcª´´)oÝ|¹²õÒþØlÇkró>@^0ß»º?ÃþƒIž«ã3ã—\r¢¦e1ÕñQaø;eâ8LìÛø*–­ÓzäÊU“Œ‰3ŸÁÃýäb2÷öhüiv\'üÚ\"œY:`ýlå5“;à.YDDÔ&DD!ÞP/Ú§¸¨€Z ÚL€ÔêÍøÃ¨-/öì…ÔžC0kµ,ô:SNoÜ Ëí\"ð†aýúôv²¼±Úá×“ûu[¯ßé}}#Ü•ÞÉ°o×÷e^‰¹²<´ï1rrù®ât]nÅw[ýÎ×4TŸµNîßí÷³ÛtŸ;½o÷Ù’±âÿM/¼¸Ç&KÈYÈŸÀÄC_7XQ\\Z¦MÖ‹ˆŽ×¸h»vhá4ù}_Åá‰Åƒ1;Y.¶Y¥(SîûŠ¢2àx)*`CY¡\\å“ò9•ÖÒReÞ°;q{c¬\\ru\nëÕJK™–å\0#žoåÑùHM²ÁfëŽTL\\pwºRy·„?<¯`çÒl”|,?/w_6Ú<þM¡ˆŒAR§:u µn,¯b» s¸ÅE_•ÜàŒÇÑtÊ¶ãMÄýü,Úæ!u¨–%®”/úwvDqáe¹LDÔ†\\­Už?d½(§ó5Jy}½×Áœ\\ž•ÉˆÒÖJÔ™íqì³\Züt2}}½ï4…Dð,\nÉ‡/jë?«wv8mˆkø7ý¸ê±¯\"k²!ø(‚XwF`Ÿ|ÍoÃ¼¾1nˆÄSiWðýØêûêèxßbýà«øD®ÿ¤0÷ë‡Veß÷¢V¾ï‹Ø‡ŽxÊøœ{{gdYõõµ8\Zô\0á]é•c\\Æi¹¬	åg­PíqþðY`ÔÇžl¸Ï×]Â¿éa†PÞgmHÈ¿Ú·ïˆKWÕØ•+¸$g=j	K·tWÆ´)Qþü_JNÁÒÅƒÐ-÷$ÖË2=€§®ËÆkbšŸ‚¾r­_eo\"p3y§mW=\"ËUqxecÝ®Ga¡\\£IÅ*Ã¶»ÖÆÝroeØöü[øPlò>\\ô>¶WW(Dóø‡0¾¿Ö4þ9uš†!r­ppù[x{­x\n6îGW­¹1˜àO hõƒHÿø,#f²µfÕ®™¤¢|;Ö¯;(Ë_ÁúCÎ™‹æmÒ´»¯Ü¿ë±›z»+ó,ïH	Òïû›1Ýó°ùˆòwª{m¥Â”ºnzOó•÷)–ïMÏ\n•eK³aQîÚY.Û7ò¼_¦ìõö=-—=pÍã9+“·ÏCÏH5¾ÆGs˜†ãš2q½^³ rû7EWäß1ÝN]gPKÑ¾½ù!ïj=Ü}Íjn)Ýâåœ«Ì{ô&õbzí½¬ˆ,P±œ‡Ý4»×¶{Y]€žwèëŸÁ“#üÿåÁÜ¤ßœqj</—}Šæ‚†íÔÉ©ù ïîäß\0› Í½=ç•/­¿ðò¥úEuøC,°UåK®1SÀð€£em8=Œ)¯1?ˆ4ì¼‰ˆšODE×Áv±^.»×>*ÞðÜ˜€„ÎíáéÑ±-HMõÛi²T§µà°¯·×².Ÿ6ñHÃ}½©Þw®;Íë4¡¨ƒD`Ò úá\nN£=ºÙƒƒe¹Œmy×´e[=¶)upï´„@l×L?xÎÜ1…—íçöç<Ä‹Ä ÊîŠWÎßz–Ë°]…ã1¥~=$Õ‡ë±F–¬9\\‡jK{ŒrÊ l.ã§ßèß^¯aWòíU9õûˆòÝc|êì;¬¯¿Š?¾‚˜´öÁ	È\nÊ1†r§oÍ!ý¬•ï`C®á7ë.c—,1	é±Åç)‚ž†ûÜ ”÷Y[ò èåº‹èÛM6™@çØ.èTs	^s ®*ÿq«•_}u\r.zûyPÈè×êóÛs°lg­,Ô¥`ÂCÑÈYžƒ%Ë ½1{L”\\çƒjN‰Ã_ÞÔšÉ‹iÊ«r¥/©X•~Ú¾Ý¨M…¸iŠ#ðy÷3£p[ù.Çúé»ð¶\\\',|}®Û·Ñ±~îa|!×5žÃ\rCÙŠ·ðò¢·°ùLLRûõÏ©‡±d{52ÊÆ¾ºl;^ô,JÌš‰î{^’Y‰P2âyC\0¯/²»oAª\ZHU^·µÖç[ìÁFó¶/!Ùx!ÊÕ’Ybÿö,ÖE2÷,öå+GjØ—ŸC»/ö£dÐ(,˜7\nÝKv)[:ˆàÞ¬$½Ù‡H_²—\Zƒxey\"J–É÷eë‹IjðñYŒ‘çj3fàÚ³9yÞOïW^)‚­^ŠÆkf\npðyˆ€¨ž‘šñ VêeÓ»#G}Ïbß%ækòúv¼0¢Äþž_ÜÓ³LAWO×,H¼üM{Ž«OÄtiƒ|ÿ? 2¸ZW‡KÑñö&ó‘1ñˆe¾êº&¢çŒºÅ|ù £ÅÃÏ”¸X¥6©«ŽYÓŒÄ8e9ej³ûw±¯*\rwÈms?×Ë€³»µíÅôæÓ/ž©Mú­Ø$·Ó{\'ä:…¶ÿW±éœ,0:±Þ¾vØ·c;Šäj4oØ÷ª£ñ˜¤>×Ö|ãþ­þEÿëzÇƒŽ‰Èôh‡mj–€–±P=×|£,Û”õj¶†òúÎŽÀá‹˜¥A\'\"j\"¢¢]ãû9°þb5jô?w×.¡òb=üùë×¦¤NõÛ²Ýæ_ßRFŒvêGÅtµÞ>„÷DÙÆ°¢ÀP÷¾ƒ-z+¥^‡Od¹üN0¶ùû+Uƒ‡…WìÁAÑ¤üÞTeFâÑ]©íc?V;Üœ.Ðo\\-“°·2—ßø¬É?+Ç©6d`Î½]Ù·í\nv©ß1Ú¡›å\nŽêÿ\"ðÆäŽˆ1‹CÅÒ1öóP¨«íÕrGšPcèßoê\\¾O…ö³¾Š_|æé»Yˆmiå>J5t‡`ÿQ<´÷Y[¢=…Òåj—Z•›Bô	Ó\r.G±!àéI}mjÄ\0×jQåã×Á¾cãµq1È}?¿uÛR®RYw\Z;ÔùZ|›_‰ØnÔ%ïâðÊ]©¨Ú·Ï~%‹RˆùORB~w\Z\'•}¦”ËBÏÞNÙ¡f]ú¥ºÍ5gÐ9&³\Z…‚OÙ£+O	Ið?OGqè4–(×µÛ¸l,õd^ý=Jä,æB:rð_³WÉ‚g±~ÍÔ³!çÃgålÖ{¯Ï@¶å6Û·]…YoäÀÖg˜ÿ‚¢?š±rÿ«w!Ï¦\\%š÷õÚÐ¾°íùKä²g}Ð]­džÅ¾ÒtÌz ;J¾ÐÏQx³FXpj«*VÎ^¡ñ²Ÿ×©õ@ç*ì<b3e™zÓðó´ ëú|GªË=d¼fjU¸ýý<npDÇ>Oµ‹=+MõŸþÈtMÄû8õñ8ûûX9{NYÒ1ÆMÚÐkæ‹¯¿);~¯ÿ=*p\\ù^Ù-ÑÏZˆµ‰ày\\êÔMí/Míf¦¢ÖkóÀ¦¤W­\0ªÁO-p™qãpöoŽ`bÑžOÔÀgº!cóìný©¹…ˆ¨†ñÁ|¬†Hq/ú~âx¨SdöJSÎÛÑojÑžœíÒ™¦Œùc•þw1HÄ¯ýî¾è;\\Á¾Ï.Ë/ÝZvFLœþ¥WdËˆfj‘øuz5Ûôm—€hhÎ›ˆ(4: &Vù\Zêã9Pu­ÕUuêìåêšýÀh64H\Z¾ÑdL¼Å\\¿9+Ú³ÞPXo—mÇ{†6‹NæÃÚ%×ÉeMèë -8X‡?ü tjÓçh­Éùg\"k2XA:G?’O©Ù‹®7žÖ’£3\\ÄoDÖ¤½Þn[=f­»ˆciÕc«ÍÙ]‚v\"@&Ž­<Ÿ|-šÐ‡ P¦þ˜Û§:[¶VùÓÀ\'¢	½rnF@Vddºý~c²ÏÚ¡8¶4#”÷­5wí²@É}Ö†„>(\Z£<ðE£¾\\ôcÅ•XåÐŸÎ²¯Õ£ªú.U)›×Ÿú¢pk¥ÆT×ÎðÝ„>	Ê®,ò73Ô•qtzÑ<þ&Y.|ñêFl8›Š™r½s³ü·ŸÞˆ¿ /ÈõÆ¦÷+g‘ÙyæÉt\n˜¥kƒÑ‹Í¼Þs£ónDw9‹þÝa±dãC ÷…ü•´•˜20g\nE·©:5Hªå^AVcÀÏ?K” oR	v®V>£ì¡`…\r%öî‚,ç-;`™ }§0@”ŸGß¢é¿kæjßîXF<o¿\nÏ>lû­ úiU^£œ‹cýL?þÏƒSD©¡ùüçHD¾¨ƒItC‡\ZQ7ž‡­C¼RWúèo;¬T ¬\\Î†€¹i¾S3xÑ_èîGÓû†drŠlÓÔ||lÊNMFŠR\r›ô/7\rÏ\n€òEúÞx_ôÝ1e!\\Å/DŸfƒ#¼d›µj–h\0-(®ÖÖ êòETÖ§3š†H[Z“z;u %Gý§¶ñ›SÓ{µ©}ÓÒ²ó.ãçà`jþ¤6}®Ñ‡\"Èd»†|¹ºq”zW\rT‰é2ºM6ôÔûÎhŒ¯Ðú™-7úÄµGuE€õ¼;jÐ±3º”A²xå=šSj¬Éúú\Züâ-£°Ø\Z„cÛi¨¢UÊ/ŒAhKG<eoÕrk,ÊÝqß{k)ãåx¢ïLoßoBúYûÊcÛŒß¯áß^6}ÿÙ}Ö†„8(\ZÎÑq©²J6{¨Ge©5» Æ\'¿k—*a­õUÖbÝªÿ›rë.\\ô#¸VòJ9Û\0w?3\r3{bƒ¡yüI¹N§^/Öý˜5Í)0ZgçÊõoæâº)ŽÀh02E]Ø.8šúÃÐ¼xÉrcæœ™È´ …zF }ô@Ãäï¯†–îæÀ˜²ÊÙÀi·’™Ž\"ÛPÍZMÐó÷û™m)È÷÷ô8Góp!éFÙÜÛ‚îýÕIÏ.\r†Æœ·åü×+½ýÎ¸ôãó8õ±ÌDuÓß¨ÍÞôÞ1ûb[óú¦ÊÇßÑÏè¸¨÷½6muéÿÈ»ÈÎ¢++*Õ¾d®âbÅyå;OgÄ„ãônÅ!1AÎª’‘ØEÎž©ªO.Më\rÍà7UÅü€£ÊÃÛØ>8el6o`lÒ¯M†&‚!27MùR$$Df…š]áXöÚQ¿±O1ñ$²2œ{ \"jqD–hGÔÔÒ‚¢ÕÖj\\f, 2ðð´¡ÀÑwíuŸÚRÄO™÷<Š,8Z•hMí›Žˆª™šöÖš?+u$`”ºôÇ4WqÐžy\rß‹PXkèÆ&xI­ÉZŒ-E´.tÆ«Íé¯á¼\r¨6+µ&õ¢<8D†lz›ÞŸBíWÕØªE¬àà\ríÑ[\röÊïIâøúòíMüY›…ôØâš*×Ðý“yhï³¶¤Iž¾:µ7&²¢Q‡úàüˆçàoSîäÌÎŒEÁwþü¡¯À\'*Lý€¬²Ü}„\Z3EÍ|`¿ªÀrVn¦è\0<0µ¬Ç\Z:iöAD½vY ©ýBZÍ EókK6~Þ¾eÿ—Ž~#çcý„@šŠ;‘Í¿Œjí>‘7¡»££É~?\'8‚‚ÖMD_çî¼Q» 07·7\nÞy‹LSåïo‰UW\0ŸÇ’±®ý.9 ú\'Õûtu&½Ó7x’>¸Uƒ~,ðú7¥çõÿ,ÊÿfŠRƒtèà¨„#:¢SG1¡ÿÍçòÎ=oq\"SFd£gÕl7ôíé]1D#Œž½\ZßïµæoÎÍæ5ZsÁžw¸\\É(øƒE¬ùFËæ°O__Vþ×©¦ÞdÍØ”ÚÏV=Öü |1#Í:5­²Ÿw($\"jJZ–hª½BZ-¦¯P¿8Õ¹\"+Ôe %Àª¹UûîvÊ-+†Õ[×5Ê1ÔñÃ£»LÑÐöçˆºé·[xÉXFà>SÝ©iÔó‚N©—Å Cz_žk\n”›75ÊñÃ¦Œç ©Nã3ˆc»6ë“±¥ˆÚï¤“ÝëF£¿+=ÒÐç¨än\0\\¿8¢Ž—$åÇlí‘u§£ÏKuÐ\'å|LÁA} Ý@î1À“ñ{’Ú,_`•yqMùY;óëØ\rü¬Õkª¼ó5õï>#_œ¿1™È~±¢&Z4}Š*S|{ØÊm¾Njˆâ\",[~ç3or\Z=VÍøR›ºÊÌF¯<ÑÄýÅ}qö&îæfîŽÑágöºdM3­ÿâÕ\\œŒu4Ÿ\\¦,«kç‘ç§©ƒ.9qr\ZyþcmÐ¥ù¿“«ƒ mª>òühÄíýHŽ6ï8<1Øºü°ÓˆÜ:Ã(ér G°Vô\'£\r®¤®—“˜œ·}Ù¥HSqcÓýéÀúžŽ>+5\"€iyjx¿»ð@4O__ê8¶:€1£Ô\'å½Ë¦íÚ{wþƒÚ€óV¸fk\'ùwMù<VaVÆœê3SytŠ¬Zup%ãñAPøWW²¯S¦¦~˜w÷7E)Ë)0üMùI\rr™)Jº\\}6tA’^7&tÁk™Ì\r\"“SÍÐ´7³³bÓ÷™—žä~¾g{L´7·ówôyç‘çÍÇvŒx?¥‡òÌ0ðQó¾ûÍ2•k“c”Ü¢=ïhƒ+Ù×)SZnjvƒð@ËvèdhñÍ!¡ì£øk=`*ú\rëlêgKiV4å2FóQ\"ˆœúf&\"\n+Q°œ%\Z\r„6¦?ÒP3Õ¹Ó°Û”ÍyÛŠe½§¬?å’)zï»®1Ô¹û”}ÙëóG‘XØT™¢ZðÉT?ªu¤”ÍÛEÛ¢y¹X§õ¯éüc£HÔºßHÒŽ£?Qí˜íqÌ4þeõNÑ´Y]¯ö¯iÎdÕ“@”ŠÙ©E¡wêàŠ¢_Iû±ß	Ää—ð›Ã°_­KG£Jí~Mù×¹ÕŸj€UÌØ¯©6iA9™µj?7­KS6© &Ö(ì-*ƒ!”ŸµÞ?«è;V%ß_@÷YÃ>kíšÖ¢x°Ö¬Ë5õë>#_Úee\r7Ý¥¥¥%M^…VžXœŠóï{\nàµE‰ÿÒ$îzn“Ed\'~AšTâo`0|´Ôó&jˆ‰ÆË9‡-[ÍÐÒTê´à´{n}u#µ,âá+çÝeÂ@Ô³’rðb@?ÊµîYá\Z \n%Öil&h¸Üc­úþ™…JBWw‰¬I7ƒÂ6	ñÞÔ$¢¦è\"Ì¬ù¾ˆ¬I-™¦Él£Ÿµ ’¡^è¾%àkÞêÖgŠµ0Ê«Y\r¨¨ÙµÔó&\"¢Ð_ÄÏ2 JD$ðSCˆ€€>QK&›47KLv\'ÐA²füN µRlŽ€hý¬É/Ìm“˜)êBýåF4°µ¬?V-õ¼‰\Z‰™0Ô¶\'S”¨5kÙ,þ`ýèª¡ÁO£p¿—ZõýoÞøÌC5#X©)?ð`t[¨[Û@P”ˆˆZ>ô‘ƒ¢\ZÖš¶5âýOD¡Ðþ¶°ù<µhâá]Ÿ\ZJ<ìëµ~ŠQ‹Ã@(5›ÏQ‹ÃæDDdä.(Öƒ\\m¡~lL\0Th÷Ec¯	‘¿ZÛßPE‰ˆ¨ÅaP”ˆˆŒ\nž[Ç—s¾5UýÈ@¨w¼ÿ‰¨©´¶¿§l>ODDDDDDªowî•sÍKúô©!Äƒ»>¹Ã (5;B‰ˆ¨)1(JDDDDDDÍ‚P\"\"j.­ OÑ8¼²f\Zþ¼ó\'‹Bá‘QØ5%U.Tà/onÄ³_ÉE1þ¥Vþ%^^<°b4âö~„·×Š>î´u‰»ÞÂ‡ænðÂOÿ‘X¸¨+rmÄAYd2~\Zžukžÿ\nÅ²(œ%Ïys‡[Pði¸]ûê=’fËk1×20žîyùÿÄ\"Ïˆÿ/Çä5µðýÿaÆ>E[–Ì{žÁïâÍ=îþ²%câÌG‘ø·WñÞ	Y¤HñæŒÃÙÝær\"\"O\Z\ZT#Wþö+Úú1ŸSË€¾‚gg¢¯2wêã^ó´V\Zl¯í8ƒY}”™ü\rHû¬VHDDn1(ê—T¬úx°)Ðc46(êã5¾‚•A2dñãÈ.ÕÏÛ™?ï#¼x\rú4k€·AÑ–˜öpŽêçÑ¿°•‚[EÝEÝeARlG¹tçK«qY.µ6-*(Úo–ÞRŽU¶£H…\rK¬ŸÜ1…µøé7îïÈ¹·GãÞTàô×5øÅ²íðëÉ‘¥ÿøäe{\"jÙ\ZR?ºëC4ØAÑ¶ucÞÈ[Ú›{ŽÃY4¯oGát`}(öMDÔ\n±ù¼?FÆá:â@ÀA×2—ÖÒRe¾e6 ¢(8èMg\0õ:‡·QEÿèƒ<ìh!Q¡xíûxyQ8|ŽáCå¼^n¥ÁÁ!ƒ{ `—ë{KI²Àzü(¢a\"|ÿ´2‘1HŠ½‚óÊCi±2•V¶G·¸(VÊE{ÞÁ²ÕÌÕÝ•Þ	ºS©)\ne;7DâÞøË8­|ß0š{{gdYkñÓu5ÊT‹Ó©QXŸÞN®%\"\n\r½I|c¢}nËÂ­·õõ\ZmÑÎe\nk«w!ÏÖ©óär-¸¡;¿ŸQ\"\"?µ¢LÑ]À”Q¸I-+Ä†é»ð¶:ïÈ$=>3ÕúÔÜüýîg¦á…¬8mÁ´­¤6‡ky£è–_SG#M-;‡Í2ëSdgNê¥šXÕLÓ$-£P–9Ø°ÅûØv\\ËöºŸ#\'i†}?®™_23ÑKse5k,i¿ÇõÎY¤î³Jõ÷úÊF¹Ë*ç1eÑgš›Ì×€² å{’K0e]\Z×9®•JÍºMG¼\\tp|&úûpÛÌ[œãàï°¦t˜še\'hŸ•ã:˜?Sóñõì<•Ëç!ÎûfYqÙú9êïË¯óöÍt|…ñ^ñ¼N;¯²½±¦¬·îýùýG+×ÇéÚ\n³šµkÚç¸ûLdó±ûÛÝ¬ÝÄE®ÿtîÏ]»`úÿà®Ìý~~GëŸ©Ó{÷ÃÔrÁõzøº¦n?k1¯ðõYyÿït›®™v\rÜþÿp{}œË¼üÿ–)\ZÎqÝÐéÒyXkõ½v@lR4êËm¸•pž7yËqÇ´¡Ú½XuÀ”=©grj*°oã;Øb¿ÜZögV¹¨°5fŠŠýO„ñ×‘j\\ç¼_í¸Óñ	vÇ=Š)ò¿™)›4qžÔÏÙ®\0›V¯G®\\rËív‚q[§ó6]ß×LÐš5ž\n,‹Gdˆ¾ŠYß\\Õ2Aá.Ó3oÌŽ¾¾ˆóC:£ÛA™)ªf—¶Ç±Ï.áßd°TXŸJ»‚ß|V?«ÛµÇÁÏ®a¼ÈB/°ÕÉuzæée|²î2Öˆu2[‡/bVžã+dƒÞ]sgŠ##´ßžöºPmUÑ¾ÅÕõZ¢»\"!¦½\\®ÔXQ®¼ÞôVæcý¡EÀC0kµ,\n’ëâ…î[ØlžˆÈO­&)å¦)™(s-FMßˆ¿T¦bò3úƒšæ¦)s0¹l£²~-6œÃm?•ýƒ>2\n/dU`ƒR.Ö½¸/3×ÆÝÊ*,ÝõñÙ—h*fŠy1½®÷-ÚxiS‡¡lÅ[xyÑGØoëì9‰jùÁåz™Ô™[bÒG2£pE¬jPC_o¼ÄŸ¡(ÕuŸžSŽ5\rCä:ÿÀXåûÐþÏ<6úD¶SiQ©\rñIIrÉ™–9—¢½Gß—*¿±Hî/—`Èb­‹ýz™³.åu[ô¥òˆëäøWx[^\'5¥oo²\rY,»BPË•Ï&a4ÊÏKÕk´@ë•ÏÃïÁxù^D°jR‚c¿k”ïžÃ9>=;oÍ^§ô»˜¤ÅöÊù[Ò1V|çõã¼}Ñ‚l•†ûÈø\Z?Í¼N½²¿/q^ÃÄ{VÊã‡V…›ÏXÐg¸ù329ØûáœD@íq<·B¢‰{õ9uÙ°oåþ\Z‹Ïíç¤^³9#‘,W+OæÊ5tÿÿGðü¾ŽáÈåÿÞàêëTãoFšòéˆù™Á«´©Ú\0b¿â=›,÷\'ÀSc±_=/eú´ÒôY‹õ÷yºÞ*ãg­¼/¤ã>ý}ùü<ÌÿïÅý”6ÊqÍ’çÜc¸‡Åd¼O¼üÿpwÍú\'!ÎpÍ|þÿ W®#¯¢¾®#:8žéÂ@\Z¦LKÀîÕ¯bÙêw±C1}„¼›Ça>Q39Å´ê(5vR´µÈ¼çQdUl±¯ß¤ü‰rÓ‰ˆ?ú®\\¯ì»J®RÂ{jùxz´Žø¨Ú_;vzÞ¢[Ù÷Ø¡€¾ïÝânUQ¡l;ÞÔ·ÁLõÄ¤oëæ¼•k2ÿžu­ÆË5k[½\ZõfîíQè]Xkh2/YÚ!Æv»ôêå†H<5X¹Ñ”rÑåœ&÷Nn‡mj&éEå¼;b¡Ì$]ó²lSÖß.¾2¶Ã¯ït\rˆQÛŒŒP} $‘jIˆQþ*)\"¢`‰íˆš:ÏQ¡þb5jô?I×.¡òb8D‰ˆ(œ´š èÉMzæg¾8Q.‰æ (ÎîÂ”W+ÔÙ·ó\n„85ð¹0=UÙÖ‘úÅ«¹8ÛwóZuÔ&ÑVMdjÓQOË¶k¢?˜³gPè<íxE[ï‡‚Oõ@f÷Pl€3_:²ï¶}‡—€£‚xÊæ\"[¡r^rÙIòðTÄŸùÎ|+.ª”s\"Hò¸Š$!ÑbC™rÙDÐT#²ÊÇ\"°§W*Q|\\ëb@%K+´@RrJ,P^êwóêøþ\r³`ÑºØl¿VeØ¶ëœùX\"(©¯?~ù6Õø¹.[LMÇ‹×~®ñ¹þ˜ïÈÜÓXZ€Êcp9 òÜ>uDU>£Q=`53·mt\nz*ç¥Í•÷ï¾qílÈßkHõ²à´À¿ÈªÕ‚i†Àþñ¯ð¡!à^¼·VKW{ÐEðüÿÇÛû~–k¯›íJÑ´ßô>ýaøÿuðð9åoJ’z/ˆÿØû¹ã}lûÆÍgíí³7~ÖÆ÷åÏç¡0œ—»kÃû„ó5ÓÞ§~.~üÿ ƒ«¸t©ÑÑŽæòQ]`Ñ»\rÆ`b1r+\'?Ñ²íxÏÐ?hÑÉ|X»$à:±8wô(À¦Ï‰%WýF#ð±ÛþEýtn‹=ëÔ|ìôíRS\'å¾OÅY¥†ILÐEœw—ì¶Ÿw1¶ì8\0kÈ”%^¯™´dl/¤;›ÒÒãE6§·À©Èðœ­6ÁÿD4¡Wî¾íYãW°ï3™	ŠkØUp1qzóÓkø·ÏD“ûHü:½ƒòÙÕ)ß£\\Ã\r!y_D¶Dv©˜Î60ªAõIw¹ºÅV [R\"’:âRy*}u¸}­ÕUuêìåê\Z\\òþRX…ÂRÒïž/—ƒ§owl%ùr‰ˆˆ|i3Ý—PÝïvaÔÜÃøByPJS”D©šªNz|?¬~é=ÅC€Ó¶Íô ?´\0Œ»> 5²H/Àª‡`Î¡Â¤AOå±¨RðôˆÄòs€Ø³]@D&©vŽÉÃ»¢âŒò¯âjý²úvp¹–Y7WÍ:”A×`P·=0IîWìÍ£=s.µ pØQß—÷skl?¸És†!íÌ~S³´À¹ýz»í&À_ïK\rZëI7ýæªAyÃ±e€Þ¨à°áÞß¶zV²è#Õ‘ù*&csu…ÈîU3<åú—ŒÙ¯È€«Ð˜ÏCd$o>ã¸Êä4]³DQþoÚÝþüÿ]\n×ûó¾[±«µUÊÚIâ¡O™,¨­®õWäÂU\\²##sæ3X:ONn›7ƒ²bX•»±ïMòîê7=Q€<C¿¤bÐ\'ûy+Ó“drV•ãG9ë7û5-{³øk=¨é†¥#ž²g‚*¯³D(ŸàU|ï©q‚»ä¬äÿâë«È\Z}_kÍê‰¨íÑ¡îšÛûÃ]ÔYdŒR/F_Q›÷[¯À’ˆø(ß¬WkkPuù\"*kÃ½\"Õˆ’6w…gb}úÍæErNÖ^HŸ½J–‘/m&(êÍÉM2Ô>9úõ*™¢M+€Àœ@Éâ¥9±§,Òã¥¨™iÊú¸Òop7cˆ˜¨AO…šYf‡¿AYÒ@$§vE¼Ì™¤q)Ô€Ë‘Ï. qx¢\Zdò?T†mÏ‹ŒCeZ‘‡¸©AŒšº*“©y¾+Çy;¤Eö¬œmNâó’³ž˜3RÅ¯örÖ/\"xf1ý¤6Ç†¡K\0µ»?ù|_Z¦Ú\\ÜËNÏön	ì“ûŒSO™¯ŽÉÔD^QeùæòtÌõ 4dJ7îóÐ»æÓ—¨>#€À¨áš‰¿pþÿïãÿ‡á=»¬k“®âb…6È’˜¬µ@‡ŽWPîÙ-Åêßrµy<MÌ7ðÿÿgH£¬Jk^¯=ïHÃÙÝæ¦ó¹ŸËs–“ûñ=Ð3Ru		¾ƒÁòš…Œ¥=(õIï;£ñ\'‘	:[e^]žÜwÙ®¡Ú”	ªP›Ô_ƒ×\\\"ëUGðSd™ŠS‰¹²˜ˆZ¿¦„ÚED!&º¶ÊZ¥–T\\®F±õ\":ÅvÖšÓ{Ujk5.·ˆvó¢OQ-€™Ú38ýŠ®œ=DMÎÙ7ôòÖ?•ˆ¨µjãAQ­©ýMSFa¡,	HÈ3EEæ¤S?~FjàÇ¿&Ø¢¯M× ¦ì×q±ëþ]û€4ò•E\n$§hYdE¥±4ÙôÔ%\'UâÈ6åý!cÇ:e‚&!±ü;å\\•²þ·cP‚S0WÏâóHò#àçBm-©jPÖDfÉMrs­ÜQûn´•eŒ¦¾‡)ŸGGí÷tÞ:×Lœ›Å©¯Nlº=üvG–äøÛÕ÷eÊªôF¼xŸöûF¹çæ)êõ}iŠ×îGA¯aX8*Ös¿¹\r šÒÇú“õÅÑ¥„jÿ£zP9Ÿ‡‰¡»\n?©Íñå\ZÆÿÿþÿ gb%åîs²$ì$ŽÃôq8{ÆÐ$ÞìÓúñ´ÿÿT³5ÓÞO[#é\"©ÊËaíÒ™2¯X\r25Šlšïè´£×;ŸÚ?\rwØ3K•÷}K\Z¬G¿tß_©»k¦žÝŽ×är£‰þFÕP}}€§¿VæÅ`I¶+8fk¬;;ÈÌÏvøõHT\\qŸñié€…ƒÛãt¡×û­Çš.ã“B½Q3í}\'ã‰ˆš_“B]˜û×ŽìØ¨»‚–‘ÿJÜµ¢Ò“n}€²(§Jl°twôMDDÞµùLQÑo¨:¸’½ù¼2É–ÂÁÁå_¢ ×h{“SsV×1|hl†k¤F0l§òãwf–»> \r¼f‘Š@KëA\rÀŠ J\\¯Ž §TZÒ1ZfÞÁÃ•HëåÈU›×OW¾DèŽ”÷@šEkzï›>x>iƒ.\rÒËÓÔAzÄ¼Ó5;þþ ‚¤ïCo6-2PµÁcûwú<”÷¥7Û×ÃqdŠì<5#Ð¸Þþy8š‰«£ŠëŸ[ &çí›ó¹‰IÏ®Í­ÿÿíÝtuž/ð/	@H\'’„ddM@P0\"³CD‡Ç€€œñ,e½pðŒ.ÎìV|9»{ñ8>Æ{ïÜaG¸^|î/ŠÂò‡]ä1ðRB#;„$tà­ÿ¿þÕ]UýH?“N÷÷sNºªÒUÝÕÕ)ê›ßÿÿ_ ÝÝ,Z xÕ¤ì«óÔ‰\0Ï;+½Kãx/@ö© *E5þÞ—NN3=*Ã$*\"åàJîýš?1\0”{¹ý\\ŒsS›–¡Å4â{xŸ‡­;Ñ¬¿ÉÔïp€ß}Ú1­½fë÷?€ïY¥¤Éfóú$F Ï´n—’yª™ù¼ñh6ð~ä èKs–j‚þ8²ëÌ•¢GñîÞZ›¤?wYÆ>9’Kã|,fRÛ&Yb\ZU®¶+Fy7^ÃO1+Óéôn}ð#ù|÷ô˜\nhb{}«––«>CÅ\0PÛÐlT¡jï[&e­4õ}ÌÂ#Fˆ×+A,Zä§êU¡^ÂIO¢OP}ð¤T•¤wÕÚJJFÉCúö÷hŠ¯F®èC,ýˆ®?Öv±Û¾Å¸øý>òˆ(ö…„*7¯¢¹ù\nf\Z×ÇlîÛ††U9šÖíA¥üu:#õ%DDE}JJJ-\Z\Z.$ÎE\'ŽÉ‘·Å¨à¾Qò£«çŠ”ÄèÖ®0…ô@iò¥ ‚ç ªSå(êÁ5=ïN±w.‹`_Œ¨o\ZpŠ¼šõ g‰ü¶/¬©)*,”}’EBâ]Çâ±¥ehÜü¶õ¦_õ\"P½§	k7íp7YË&[]£ÈGK/=f2pMÁÅO¯á_‚¬·x}êæÁ¾Õ‘i\nJD¡	åújEè½SKyïÑ|~9ð+ï¿/Eå}yÎ>¼4ö\'x[-”è[ôÅ!ÛbxŒ\"¢Ø’ð•¢äIT£ùSEQê’ì—3vQdÏ¶°DD½ZÞ`ÏN6Æ\r/m€$\nÐ+Ø%šz2%J\"5&\nÑÒÉ(r\\@ý÷¥øã’öû4Ô@TxûÛ@Îm!5½\'\"JDE‰(±ÍÄƒì\n€ˆbßùýŸx4ŸŸ“qØZ9Jö¦Ê>ÕˆÅ+¡‘¢þˆ´ªØÿVª¥.ÏL×Ç§1•´mll(Ã‹1=ø/Qì`óy\"\"êuØ|žˆˆÈS¨×G{ú@P^‰ˆ¨7c¥(Q3Wƒ²\"”ˆˆCQ\"\"\"\"\"\"\"\"\"J(E‰ˆˆˆˆˆˆˆˆ(¡0%\"\"\"\"\"\"\"\"¢„ÂP”ˆˆˆˆˆˆˆˆˆ\nCQ\"\"\"\"\"\"\"\"\"J(E‰ˆˆˆˆˆˆˆˆ(¡$ßzëÐV¥Ë—ÛñzîÂ#kfâ{g¢ªQ-Š#¹‹ÅÏ–MBþ¯p¬J-ìR6f¼ü8þ:9˜ç*šÛŽ óðü?Lî¸ÉçÜ‹Ú¹Ô6[÷áhýì4êÕêÄ$¾_0)»\Z¯•àÉ~wzLÅñ\\š‹ovÖ¢]-²ý€ÜÞôÙ÷âþÙ·FôXËïÍÂLßûægóî9B=r;Se=ñ†ääh×´Ëj.<½òÚ¸ô}T~òžûû%øëÖ·ðoGÔr\"\"Š[¼>’cñØÒÇ1oü$ü@›ŠSÏàÀ·Æÿ†Õº;âëãgÑ¦–ZŸ3i>ˆ3æÓ\'{:ž^4Êõ·¡õH%Î«Ua‹æ¶Ã¤ß‡ë÷y+žÂ’\rð}o”HÞOÇwÄgt’|ÜkFï<#+EÃ&~i=…Gf¨ÙX\"‚—@®šÅÚ/ƒ\'g«¹^äo\'cÏú1ø¡šxeýb¬ý[5+N}‰7—ÿ¿XS‰fµ¨·xâÃ\nÔÕT»§£ïã	µŽM_¤çd#7#Õó‚›’†\\±NNˆôyÝOP4l8ò?¾€²Ÿó$\"¢Þ@]7Õ”™ÊÛÕH\Z7s†Û†Õë^•Ó¯÷ò\'ÿ£xWþü6Ô¨%;ðk±~óaßÿgUŽUKŸUÓO1+Ð[¹@¶M>ˆœb\n2|Ží§Ô\"Ä=å5+÷ÚÏ‹u®éQÌ­V*\"¨ëBÊ@Dá‹ØîŠ»Ô7c»Æä¾ç×3ó:}ò|m¾XÞ——÷mÝ÷<«å‚ýu‰)¨÷.r×sí¯ù$vHÇì8Ìmz^ez¹ú\rïáËƒ¶«˜í›ƒ?nu—´‹q+êµ‹JýùVÀy)fþRÙs\ZÐèZÎ7§\ZÐ\'\ZëÔªÞ¬‹ÏzäÔ1X55UÍÙ¼¾/N¼€\"Œ2¦±?ÁÛj5%zöÇÖµÀ$)™™Ép65¢¾¡\rÚiæÈJCŠZQÏÂÇŒT³DDD±)	22‘ÜzQ^ëšÑ™>éQ¹8&¢\\äe\05ÕGÕ¼\n?7íˆè=NÞÄŸbÕ¤LÜ¬±«×}”LGžZß[™ïÎ7h7DM\r1Õª,wñLL@%~»ÁV\"*º;Ñx@{Í>Ônù¼WÖ§÷L¡ªN>Œ:Ôª%Ááâb ªZ-0Ó^×’ÑuXoìwM%P:SˆØþ‚ù5iÓ–sÚrý~­KÚ¶gc·zîG8„\",1‡²bß¥­øLmû³ê¡!eóÜûÖ¦€sÏMÇ¡5úóÖ\0&,·†®\"Óù¬©{)üŠõó,ô)))µ´xhh¸€›êq¯\"¾Üs‡ªý¤}Sþ™€Æ-u1·™b¥³ë_øÒu2‰/ç’R‡šsj\'¬û‹/þ¢PÖð~‹™®Ÿ¿$Ä—@¬›=\\.²pï[ãóuù#~Ù,@öû—M½ùúÄã)(Ë­¯Y~ñ–«÷jqNû¢oF…kû»¹Æ6Œu2ï_ã:¦lÛöÜjíÔ\'õÇòµß‚}Ë¿ÆÝÆÏ¨mÃò9™˜Ÿïí³ŒÏÒ`=<×‡ä1Øúô8R³nuØ4Þ”Eµæ<|?]Îh¿ßà¥%ÇðïrF_—õû\r8\\´‡‰e-ø_oÆsÚaž|ÝXîÖvp3æ¼Ú¢=²m»f&?£\'—Þž\'¸ŸEâó˜|	ŸÊÇluÌ½~?\\ç„ýüÔÏµ	®¯®ù{-Î±;q|Í%”ßÓzù9‹‹®š7¾ËÞø»w£ ö8Vþ›õ8½¶³\ZåØ„üiÏ©%vË°ñè(3^w•ýg_Á®š…®\0Ë¹ÿe-Z«æÈ0ëAÏ?ÏnûÂúáj×´®~ß&økc_¤gôE{ËU ÕœþhÐÛHIËÆ`4£¾ý†Z\"*c´3µ¹­×Õ¢ˆçÔ6+Õ\"\"ŠO±}ôCü1Q»^lh‡q)L×ÐäË¦ë%…N4ƒŸì}ïžV‹\\.+ÌÐgD%éçÞ‚Sñü24n~Û¼>¢©û¼,ì]·î{|ïÓE>o¼ûÞÕÛþ½n[Ð·ïºi;Œµ®P7³>Žì?½ŠÊáÏbŽ¼\rlÁAÛë-¼^œì[]Œòuja¸üÜÓ\Z„·,A¿Òn“Â¹Ÿ–Äz#7P‹$mùË9ØiÜ[›î‡âuÝ}Ìû=‘¸‡švþ=m¾s¯,ŽÉC\rxS{ò½‹ÒôšåýYÎ!Ó2_ïA\'¶!rš®³OÖ{AýžrÄ)Ó¶äç—*µoñóãóöåù^};Ÿ÷¼mñQ)*Ã.wú.&ë	ëÀ„¹âëv£ÖQ„iÆÿ´“ošv‚Ï“Éýbë_2Kè_P¹Þ‰‚ÉúúŠ7Äs>Â!§õ¯)î}k\'¼ß×åK#ê›€Œ<í\nNâ¹Míý¨%.F³cñ×ñËWíû¶/XÁ\\ñKF,ïa(Ên’®‘3´_ÚÆûú…í—©¿m¯¸Ç]¯I{ýÃ§ØÊÏ‡b¶ü¨Ö«ÏË¨Šý¬Z¿`¸öm¹\0ø¡ªC]ûU‹]´sááR÷_ˆÄv *|ysæoÀä­uzØ)ËÉD>;xÇX¾ÿqøûgÕL”;æ,ÆC›åÏlªÉÀ÷”¯¯øÛÉX8L¬ê¹­Ú²š=®PóÉ×çáûM{ÜÛÎšŒ­jÛo>ã~Î7[ýoˆ~ jÐ>ÛÙê»eýk`×rßl0>+ý/~Ö¿®iç‘¼°ˆõ¶ï½‰¼Peéß“À?ïüë‡qä–»ñÚ²<KÞÊÃg€Q·óµÄêµ/hðMªŠôeìËYˆÊ—©µ\"0]ˆ!û_Vë7áÂÄ°ëuµšz‘h5… VIèÛ¸ÜaÜàé•1µGÉÉlÀADD	¬£ê¡p³S›Ó.š¼:†AŠ²Ùº›d4c/×î8tç÷¿%«8×žˆð=À¨BmŸµ¨ôˆŠPsÞx4ï5ªH·¡fè,<=1†Ä\"ôœ…Ìï¨ç¾ƒƒe3Çªõ:ñ~\'µè?³õ\\JJ¬ë£Çû=­4cfA§ºE›Õ»-Yû~ZU.š*»¼Ÿžq\'\nœu¨ðOâÛ}{0ÄýxÈ÷Ç\"£ðsß^ ÍÚû0šÌ¯˜âã=h´ûö2íøí!¤ô”ƒl‡ULŽ,ªq [Ýn‡.¹Y@í1ã}‹\0V³=²žS\'PåŠ»½Ü¯RtÅÁõE;±&E³×¾2¢’ÒOâxµé$Ô¾œ˜¾LòËè¸ÅZÎ/‚EõöºÞ/F”ÚNø\0ÈÒhI|qTŸ£sh‰x\0j·uiÔ~Ù8‘™“#—w%wñí”—R|Û®xÃÎÚ>Åý|ïë£§g~ýû«{\\UŸ\"pû÷Ó-”m\rEÍAç›•u@V†ìŸôÉ\"í·uÍY°êÏ5Öù/SU*Ö?÷û:\Z•Pß¦}cª)b!é»¥_ÿ¾ÔoØlúÎ{;‡ý|ïW \ZÒ®âÃµûðÅ¥ÛñÄŠÛ1M-Å3Óe˜yF£òxíÀkj•¨Ø+q]•¡kQþÅ8îž¬÷÷¸t2Š°ÿÛUú6îwbäxï+õ~¢b47g0ú_»ˆ†ÖôJ(Z…Î‘(a¸NDD±ìú5\\î7i®æò}‘ž9@=¦ýrª>Ak\\¤½ê²ûåM,Ã°¶ÃØá\nMâÝ½µÈÌÛõýö¨)(T‹½®~Që±mça4-t…½Ò¹m®¾ST×j7¹–m¿½¨Xû¿{«DM|ÝÓ\nT­îSôûdåX\n³ÜÏÕîŸ†ßéjrÝÕýtn^zXÍ¬æºûÎì¶±<da×G¨\Z½@îWVWú¸G+~¨8ðGÓ1‚,„r v}Ûzîò¼ªâ…Xæc*\nå\\ý‚zéµ+â¾óù5zEª(´óÌ^)Œ£hˆƒPT$ûÐû4‰qò«ÉK³óæS\'Ü_ùeµV\\úvÈê7ãdí;ÂcßÚdü…Gô!¿(£‘Ý¤ý4¾ÝÔ¥þ¥uOæ_†y9Ú§/QÙkÚ¶gçpÜô(Q‘p©ºmÛA\r4%>Û-çÜîììX4±ÿx1ö¨éÅ[ ªùF¡†ÿ»“Uóúo\Z[€a·ãI¹\"?•¶ÓuzÓû2ð=äc¡iÛ{æþ\'/ý?	¦¾1Õ4õõ¥_&š˜>k¯]+øã(ÂíÜ³|¿C–‡2K£Ïaª:V«F¢¼¦—j‹—ÞÑ³c¹9džoª3=G^4­qbï‹z™ÙHëÔûMk¾zÉÉýp­3\ZØ¬EùØ—qáAqN™Cz\"\"Š7¢©¼}ê=n µùŠ¼>ê-õÇUm7nôÎîÝ(0-õ¡ßß¶5á/ê¡/–>TOoŒxŸ©¾ù¾§•P®3Å£þïIäx&]ÜOËûõé­aÝU¨-¥º\'•÷vz‚²z6kŠöÞìù‰FV‰š+;ƒ¡WâÀG¶ŠW&,7ö-ZêžFÆd´XÕ\'õÚ‚FE¾ šú‹ç‹s@|>Í\r\rj­›8/-T£È‰ƒPTè%TÅ+ÈˆÍúFtd;¢êÛ^/F³|±=;v}9Å/¾¬—æÇþˆÆœBäæß‚ÌnêX×úËÐ\ZJº«XC ~ÙÍ\nswâ¯0ci\"¯MÁV\0šž/:;^Ò-Áh>Ö>=8¨7ÓKoºòïçÅÏ\ZÁç<|Gð¿,Íß¦õ¦ÉÕ_©Q¯µ°^|üs_ÐŒÏKüÅ-(¢JUýÑ\"¨Ñ]R±hY¼å,Þ~cVïºª–[­œ¶	g´íW·\0g¬ƒ0‰É<“s^²¯÷Ù?)õN7Åýp¹Y†¡:½I}gTBQÑ§èràWâ|b¿¢DDÃ®·«A–ÄÔŽÎää(ýÁºES“vo]€¢QjÞ[åfÞ`{‰’ƒ²ð=õPÊÊò2®Fì‘ƒçÈæõ\"ÔÔó­0!r\0£8*€ûé°î×-ô*Ôî ª?3«w«<Dä$žÝð	úÏ2µ”Þ`­›#OÝó¹ƒR½I½÷„Ueo@TÑeŸ¾ïy}…¥]qŠê\'eÁ\\/E”+hÌÆŒÅž•¢þé\'zÁ˜®ÿR ÿòNnN+Žo×ö|L“Ü—D«Ž|ØGc Œþ>B’Ó/ÙŸŠz ù”Ñ…Q+#w1Qª›Ð–~;~ø€š·ù‹75ŒÁß{©õ.¯ü ßÒ¨%ðü²•­ùXøº¿êÐÔjçð¢¾M·VŠÎ¸Ö¿¨vÅu1Ñþs šAÍUühÀ}™êD :ã.ÇÊµçqF-õêõ	©óÄ…{ÝT:G¢ÜG£ú(áeø™«QŠW×;®ˆRQ÷ˆº)àèwW#>È’áê¢Ð,Œˆˆ(Zä Ký;àtý‘zÆØ{Nôëéî¿Tö:S}þü7Uh4Ó]¡éXL/Ì@ÍŸ¨æ<}5(À$Wÿ£Úvï)@ó‰ÝAu ¨V]Ý\"[vÿg5ýòè?o­$õ?-s[süÈmY•)+>Ÿ\n­Õ¥ù5k÷û#´Û;Kx¨ªD}ê£oRŸûv¢žã‘¨nØLc[èÝúîÏT6¿wõªÕ»¶\nR½ëSvâóž7˜!+1Ðoô\n—â_ÜŒ>/G3…\"îQ¬Å@tRìî“C4\rwT&¾8¦&óµ*‘QêõËò³>©/™šsí[|1,£ÛF‰÷ËöÅUÛrŽí±mÁsûÖãb}Þ]™ê9Ú[lÇÍ=š^×Û–ý8\Z¿¸µçj*ÂËçÑÕ¨kú>\\£Ž{ýåÖýøšG}³ŸCž£ü…ï‡ÏÎ35w>o_þ3ðýì#j”x÷èóËþ¯þ;Ù³I¼—Ñë]£Ïk<G—ÏÇÚ\'ã5×m£Ï[Îaëñöü<÷ÏØÏíCÒ1ÁužùÿÞËçšF[4¶åþ½áßÈ©c°ßx©µ,/9m£YzþŒu„yëèóÂ™£ÕeAïû£ëŠÁ“ÃÑOÍ\Z:ÚÜ£ÐËQv¾Ò®XFÛ,Ž>ODDn1;ú¼ýÚy¹™£ÎG”¯‘àõQÚK©Yƒ1\nü¨r¬šä\Zç\\qân¹Þ¥[M}–Ž›iŒþ.ØF€·>ß|âW ]oÛ6ú¼eäz÷èó>G¾×Dwôy÷’Þîåm÷Ó®{]ýÅïý´äy¯«óÜ¶äÚ·5×°ßŸyÏ Dÿ§æýû°ßKÛ·­¸îå=_›×í6ù»÷÷¾oï÷•Öí[~Æu<ûëò•é¨÷gy®b9nöã¢”ƒøðúÙ%›õž’7¡(Qp<C³ÞÉ[`ª/+:Ý\rÁ&Q‰ýP4–0%\"\"7^‰z’²™‹ˆŒebž@\n4a/éN2´\ry0ÛðôÜ¾	m}3ðméû¨\\U†,¤	I4Ÿ\'\nž,‰àHþ=\'Y¦\nPé|iË\\Íñ‰(±‰.œüwó@DDDDÝ@(ÚÂ[Sñ0Õoø‡P„‡»kôxATDŠŸz\"”ìÁ}‹\0Zö\rb *ž/^·ß~e½-«QÇ@4,¬¥„aifTW1ÎKóyÑÇ¨×¦öÝÅÞ½‚M ÍÔ‰|a¥h\0Ô_Åÿ»ÙX)JÔÃ¼4C·6”xiÏÄgt\'Ž‡Òlž\"‚¡(õ:E‰ˆˆBÃë#‘ŽÍç‰ˆˆˆˆˆˆˆˆ(¡0%\"\"\"\"\"\"\"\"¢„ÂP”ˆˆˆˆˆˆˆˆˆ\nCQ\"\"\"\"\"\"\"\"\"J(E‰ˆˆˆˆˆˆˆˆ(¡0%\"\"\"\"\"\"\"\"¢„ÂP”ˆˆˆˆˆˆˆˆˆ\nCÑ€¼‚]5Õ¨;ú>žPK£ž\'§\nl\\ªGCnV­¸ÓÔl,™ö7eX55UÍQüËÅ¬…Ïâé‰¹j¾{›ù,V-Õ§žz\rÞÝ…GÖ<…\'g£À“ÚãGf¨UaÊ]ü(ž_q—šO$·EÑ!>#yy½ó,ž0^ßBàˆç0uØpäÛ„3jI´L»ÿvàÈa§š¹y(+8}»®ªDDDDD”ÈRÒ²‘›ãÀ\0»Ñ$ÈëÔ”ÖW-§hbl‡†±xL›Á†›G>«×½Š­çÔ\nÜŒyXRÚŠÏÞ8©¸É°ÔKÀf,7O!œ\nçB\r[‹Wˆí>Š£Õ=\0tï{ŠÕ\Zý9žSÀ¡ñš}>ÏºokHi]Úôòê›æç˜Õo8„–Ò;ÃÀP4 *Üû¼­–t;¿• lð8öv¼ö7j&<þ*AGÞdX›¿‹ÑŠW\"\"\"\"\"\nG_¤çd#µ³\r×Ô³”´ÁpÜhF}C£65ãòÀLd¦ò–5aeOÇÓKg!óÄ;2ÜÓÇ˜‚Y¾\nãz4:–óÀ©´À‰Æ:µ*&Ü…GæEí–Í¨PKtÙ˜ñòSxu¨UKìš|„_,ÿkú`»Z¡‘¡éb ªZ-Š.ÞÝP‰fµÄM¼®)À÷~?«ŠÙ*D¬xÃ½\\NkÄ6=æÚ¶ç£jzî–s(˜keõ}gï[Û6<BÊsøÌ¼ÿ¾D½ZÓ•®ÙI| í3c®;v‹õó,6ÄÉf65š©Û›¹ëëv½¼¶ÓÖ”}éû¨óóGŽ2¼h<¿f^ÓŸŒ\'>¬PË´iç+j©•åg´Iì+PÖçº÷k!ÌGoÇÅg½†‹#§æ£ ¶ÉcÝÈ©cðÚŠ25Á\"óŸ#ŽþŽÜr7^[–íÝ‡(‹–•áÁ[ÎâC¯lœ9n^§BOòª×fy\r-øâH\Z´¿^\"\"\"\"\"êÕRÒâFS#Z;Ô³¤T¤\rì€óÊ\rµàÚµìß¿+y\" oâO]Õ–bzl”uùœ¡@fáãîŸ™9VÿL–cœ¹bsátäék%s3õUKê\'´4¶!¶gð]	:®d<2ÏmÃ¯÷»#¤óû7b[£š±=×þººâë˜H£ÊõíÉ÷¯~Æ8&•\'T~¸L-T#¶¿`†\'ñÁò÷°ý”\\!‰ÊFQmh®¼´„l¶ÊE}²†bæêHk@§›®çy©ZÌ]<Õ»-¦»x&²÷üonhPK‚ ½æ‡sš¯˜€Æ5Ú1; Xä Ûa\rüÎ78Õ#O¹¥ùÈ¬>d9æ¾‰ÏÊôùlÿ\Zµp ;_ÍÏ¸ç°oƒ:)O}‰}Õ@Á˜t;è1“ûŠ2fôþÏ3ÒÅÅõå‰\0¿ÍÔÅô2ö¡?³ýb\Z9¿\Z³/¼,fc•e¼¬û	ŠÄs>>8÷á%ù|1MÇJõ¼·Ëe/í÷þ¥¡æ‹/`£ë¹Ã1õµ²+¯ï°<÷¥ýCPnkÆ/ƒÍéi8òÞ>üëQµÐBü¡EÍ+¹yxß`åûäôöí¢2×>^Å‡k÷á‹K·ã‰*3E¸9ã.ÇÊµç½v ‡µuøÐã¬½¶GbŸ|m‡q·c‘©ÒôÌ®cX¹£ã-ÃßÙ®;DDÂ¶/¶{LDDDÛ®·;qå¦š±KNFÿŽ\\3Ö§¤!\'½Ð/Éj…({:æ6c«ª¶Ó»§õUç÷¿åjbÞlªÈ\\ý¹ùæ³\0s––¡q³X·\r5ƒÆcº)T“qkÕóÖž\0Jæ™COƒ0ªÏÚ=  ú5W‚nCsáã*œ‹¢¡@Mµ×›`ý¹ïà Æc™=¸ôeT9–™ÉÞZ›dtµ÷¹l^öŠõ›£yhY·U©f–.Àˆ-ÿ\rÖp¢`²^ŠÊÅ\"À¨LÜ\"úpâÐ\ZSUçð)(kp¯/0Uæ.¾Ø`T-~„C(ÂÃ–0-Å£¨=æÙl¾~Ã{AiÀN}‰7½4ÅTÅþ½“8^íÀ„åê}Š0±Ôû{§ÓJCŸ†þZÌróÒê¯]Ç^Ù³‡k²r‚k\"ïMÇ¬âØ9dŽ.Ÿ	(.BÑ·MGù:5ƒµØuÜ	Çj^©Ú„¢EkåÃ•‡Ï\09·E ÑWP>Ñ3»CÔ`¼6~¤å¹o/Ú†3Ž\"LU2‰féOŒkÇoó,*c³PàlÀWöõõçñ¯¦êÍ3ÇÐê¨]Î¬vþ›Lƒ¬Ì”Užwcð‘ÃXùo¶0Ö%÷ŽHGí×ÞÖ·âÈ{FÕëU|UÕŠôÁýåœËÑ³X©ýÌàé¤‰ˆˆˆˆ(a$¥\"Sô\'š	\\Mè‘Œ¾,€™+!ƒT³÷-U¡y•ç€ÌÁâæq,¦f æO;p^¬Òœßÿ	¶Ù÷åDÍUŸÈ‹‘8Œ]ËŽbÇ‰@°9j\nJÕb¯ë¹õØ¶S—…^Y»\\Ìº§\0Í\'v«pVsz#¶žËÀÈ;Ì7Å-8¸Y¸Gq¦-ÙYr…NY9CD9+±^bõêÐì¸E¯‚]ˆ\'ª¨ÊD{å¢P½o\Z•‹rýPÜ­ªEë7l6…‹¨8åÔ¾o9j^ð¬º†s]U¨Ý8H“l\"¿˜-ö»\\oîî-ÀÕ«`­õT¼b\n\n´Ïf§}Û3æÉ÷¼dtÖ‹æùÆç%\rÕ_—œ¼õ‡\Zu—lû¤@ÅÇåÅh¯¦\':Ô\n·3‡ŸS4ÏLLÿ KoÃ8q!¤/Ô2äk¿{D«»ùüBS%§è\'T=ô)‹þ:µÿé­RSoÚîj>ÿèíHWk¼KÇ¸ûëcTôê[š±·j£³øÂ×öìnà³ú¸[ÙÇ(Q¼ë79YÉh—}Š¶ãzR_$£7|U—R`\Zwà×²R5²™9P‹JUY*ˆŒÜáf\Z›ÔC2Çc˜ösg¾±Uòde!STc\ZÍÓµiYaã^´5á/êa(š/Ú^][Ž¸šê×cÛ&w…m´5Ÿ:án2-*—«JPÙ7¤#JUuçŒ;Q€s8î³‚SïWÒÅÖô~I©-;ƒPG•¤zªªBÍšÒmÁ¨ì.`ò%¬—Õ±­˜°Ü>à‘ ªD}UvM¯=‡ÏìÍÙ‡kïÓØ·X—2—Ô\nD³uã˜¯-\nÁ¨</Ò‘À5ÎÅA(ú\nv­*öëMãý5u¸uÆõ0Tg>v7»×§bUõÚ‚•ÍÞýTqæfb¤ã<Ny	§ýÍxJ¾­šÏ‹ªËVµÎÌ]ªýŒÏªO+Ù¼ýã¸8n¼ÏÁš¦Ý™‡ÖªæÀGÝ¿tÅú³®~TÅë÷Þ—*Å‰ÎN\\CœMí¸®éMê;Ñ©f)§7ªfæ¯bkËx,:õÅV=‰\\dRÑ,ßg³ú6wÓ{×$›î×£±\rþ«Feá{ê¡$BVõ0zµ«!y‘‡8ÊôÓU‘éu@$3såç]xd¹©é½6‰¦ù2\\‹½\nµ[Œ~\0eÃ8´A…•Û7Ën2Kï³ô³*«D½Uy@¢KD³{s7šúó\"e±¥²I}Sƒ585ÈÊÝ(av+êÙghÐâ¦!Â…oUÉúÒ÷ñ3/•¢~º\0§©ÙzàžÃAÑ?éÏ­ý€Foæ?r¾Á•ýkN»ÿvÿ#»»‚ÆT,šëY)*Q1HÒÛ>BGc`*ïG‰Ðö°÷ÁšróPèhøÚÏ.\Zgkf/Q¿ý¨Q\\¹ÙkýàHOU7©I0p\0®]ë\0E#ë/-ž±—X–™?6È ToJ?ìwÀš7±ÃÚc‡­¢Rô]ºõ\\æ˜ÃØÓ\'dÿ¤óMƒ+¹ÕcÛŸj¡³, åM,×ûõÏE&¹žë¥I¼Oõ8R§½ßÂ)îÖ£9~\0Bh)b`TêU‰jò×Ï§Ö¡Â–ÉÑÈÕ÷¦•]mÍñCá·_OßŒ¢¬ƒCÂúš‹Ç\\Õš‚ªÝc«òt1 ò¬ât¢^ú5UÝ#ÝwUª7¿·~®ê]/ƒ^ÌR\Z£Õµml›DÒ§¤¤ô;õXjh¸Ðë.:ú`GÆ—ùöí‚²!Û?M4™£Ï¿€!_ø\0É¾r°%ý¹eößU›Ô¶u\"<,7ua*ª?å¾^ß¡loáÄ¾ÕF5¨}¿\Z1à“·¦ý¢O98‘`ŠŽòqñ=ýÊŸw¡µGÎbð8ÓóEðxg“ßêPã}¹Þ\"\\-»x«U*‡zbpm‹×}·¥oÓÚæðS¬ÏÂ)V‡Q˜Š\nµkš«ÍSXzãµ‘ˆˆÈ›ž¼>&¥:ôÁ“,Du¨1\0Sd†CýÈµÖ‹h¾Ê+p¸Ä`HÖféµØê\ZìÈ .z%F•ç¹mzÅ¦}]6dÿy71ú¼½^gÞ¶¾Í‘uF_¢Æ>D_F¥z£ÃÄC¥f¯©™º~’ûîQTº›îÛžk¼fÉs»‚ùùÖãb~M\Z±ß{š°v“»¿T\"PR­V#Ù¯¨Å@I®~A-Dx·\0lEí=Õ<s¾P‰õæ*FËús8t Ä€N¦}äÏˆ¾1íÍÄE¿™s]´‹¾oûëƒ?™CÄ»ðÈš)cœˆþOÍû6öÑ|Àúþ=Þ—dÚ‡ýµÙÞ·8¦³³¬ËìŒ}ÇRçãu[¶oýËóí¯Ëþ~%ãØÃgF7	R€ÇLãÿœñÇÈ¼Œ,ñÄE(šˆü=©‹°¶ËõDD‘ÁP”ˆˆÈ¯D½˜ÙDÿ•æpOo°jáÐÃ8XÂÁn\"ª&—¡¥\'ö-cº÷ŠÐ($´õI³[°/ÄÏ_Ãåø(ÎK\0Ç¯—’Íêc.D³zžDDDDDDD‘$û«´ñl*®“ø`Ë9Ìgé“3ºTóõ	DE,úgí@T±Ú¾CDÅk—Ç,„@T´l®Iì@T`¥(u3VŠQ÷`%‘\'^‰z3/ÍçmMÅ#E6\'·5­§Ø\">£‡ñyÍæÉÀP”ˆˆâoúˆˆˆ<ñúHDD¤cóy\"\"\"\"\"\"\"\"\"J(E‰ˆˆˆˆˆˆˆˆ(¡0%\"\"\"\"\"\"\"\"¢„ÂP”ˆˆˆˆˆˆˆˆˆ\nCQ\"\"\"\"\"\"\"\"\"J(E‰ˆˆˆˆˆˆˆˆ(¡0%\"\"\"\"\"\"\"\"¢„ÂP”ˆˆˆˆˆˆˆ|Ê›øS¬Zú,¥Ä\0ã5ÉiæXµ4dcÆËOáùwiïÂ#kžÂ“‹³õUaÛ{3F«ÙpÌ˜‡ç_~\0¹j–bÐèð¤ÏÏ(šçYâH¾õÖ¡ÿ¬K—/·ã;õ˜ˆˆ¨·\Z’“£]Ó.«¹ððÚHDDñ\"®)iÙÈÉì‹›W¯á†Çú\"=g0nI¹‰+×nðú#ÝV‚	9©h®û#Ž6©…\Z7óYÌÏ9ƒß¶«%V\"Üü‡§áã\'iÓmh=R‰ój?mßÄ—Gþˆ¯SÇ`BêŸñå™zµ¦§\rÄˆiwãÖ+5Ø»3{8RÏÇÁŠH|ïr´íÝŠËŽ¢ªQ-\n…Û‚ãk‡£öíˆuÿü¦ßÕ¦½~óJ¼-ÀœÙ÷â~cš4\0ßì¬…ù“-^ñ–üdž\rþ5æ.~?[6	ù7¾Â±*µPÑ·ëÞ·ëgŒ×k~]bòòÚ¼áâãXðcõ<÷í½ýuÝ?;Ø÷®Ž«·×ÛX‹ë÷<„eö×$Dó<K¬%\"\"\"\"\"¢n Ïl¤v¶ášZb‘’†Üœþ¸ÑÚ¡P¬8¿ÿ-¬^÷*Þ=­DˆL—6c«¶m±ýÕëN (¦ª>CÑˆú& ¹¡A{Ü€F\'Ðr>Èt0ª²1cqpàsl?¥)\"”|~1PU­x8‡Ï–ÿ¿0¦¾„;ŠÖ«ïn¨D³Z8½êñaÔ¡V-1¯k6v»÷»å\næÎC±XyêK¼i,WÓgâõ75˜^›o¹‹gbÄ©Ôsw£vøKÅeñŠ˜ÐdìÛs½P»Å¼ÿ÷<Ž«O¢ZwÍh< $>T¼ñeMÁ#3Ô—X?ÏzVŠQ\\b¥(‘§ž¼>¦¤\rœ—ÐÞÙ©“ÑyÅ\\)Úéé}Ð|ñ\n:ûöGZßN\\f¥hDˆJÌÿvÛŸq½h9–ý@TcNBÁesÅçX<¶ôqÌ“•šÚtç@|}ü,Ú<ÖAÚŸâŒéôñ·m£ôNšs¾m1å¶êUÙÓ1ÿÞ¨ÜüþàÚf=Žš*>ehª¶ëmÿ‚¬bõV)ªmÿéEóñ }¿®u¥¸~$	Ó÷gyßº×vVcÝŸƒïý¯w±C-Dýþ¯TÅÞeTí´U=Š li.¾9W€ÅF…£¥úÐKE¦«úPUŠžÏÄŒPÏµU\ZÕ–>«gLÇ‚auøàœ´V%Ž~\0‹ï9ƒÿùÒ!*»w@T šŸ(ö…†ÏN{\r‹WÌDÒûëðÿ´÷uoi.QÍš»øaU®Ãÿùí@YñˆÓÖc6ò‡“Ó`SMJ.Æ”ÀŸ½¾–»0í\'Y¨zW@ûo¯8jª®lDÒ]÷bLÚý½kÇäáSqÜµ­F\\È…‰£û¹Žyžv¬†\\ð¬líšö9/MÂoWlG}ñXŒËnÁ¯•­Ú9”|+æLÖÎÛz¿ç„•¢DDDDDDu×Û¸rSÍx¸Ö–«ð¹šÂ’Yø8&µ¼£Wcî­Å°Iå\'×äbÖÂYÈ<¡Ö­{1Ë\\ÕšGñ®\\¾\r5j‰yÛkO´`Ø=Ó‘§-7ªK·žš]Û×¦ÏÊçåÝ1™mU8â#¸¡êœŒÃX«ž·öP2ÏxÝ]‹ÇæGó^µOñú‡ÎÂÓÍ½3`ÎÒ24nVëÇôîê3ÕQ„%ËoÁ>QY¸¦ÍÃ\'¸ú	-^1Õª2Q¬Ó–Õn1W:0a®zîòpExØ¨\\ý\0¦ásWÕâúÀ„ÅÖ>)‹ÇEó©ža¢¨¸|ã¤š	^ÅATHÚÔoxlW3^T;‡ÌÒªZR¯tÍ¬þ\Zr­Uîâ	Úñ;òk±È¿™Î:TÛš1KJÚGp‹<ÇÃsX*mýØþ5jù(ŽD_²dÁP”ˆˆˆˆˆˆ(žÛ†_ïWñËé¨A&òDŽ6j\nJÕb¯±õØ¶ó0š‡>jLÛ>ÿMšeá{r.c1½05Úáê_ôüþOp°­\0E—yË0¬í0v¸šûÅ»{k‘™?ÖfÕì}Ûd({•ç€ÌÁÖ!mVNŽüaÓ±RÍGŽ‡ÖlÖC½S\'Påt ;_ÌÜ…»‡µÇT8)×òÃ2˜ž‹FTœr\"st¡|žúlp§ÌõêÐl	ð²‘›N3ë¡˜½æ)</§\røˆí›!š®c®Øï½¹»×\0÷.L+}\Zb¸;cf×Ž¯ýù¢ßRñžçŸ‰&ôHG®é½È×¥OÑìH47ÎŠ$†¢DDDDDDD	%ÙYêa[þ¢Æ–49¨“EK}6Õ¢ÒÔGê‘Ï_uÇÑf®>D#¶¿ðU)©÷\rY0FŒ(®]ˆ\'ªø1ëÏ·ªG‚Þ7§Ð=¿¼™j.Ùõ0h\'ñª@•Ó–VLXÞMÁ¨ì{s\Z×ˆ}ïFKé¯#çË*QË±\r‚>çµUåjÌU½Ë7£btŽöíiE½ú™Š7LÇD½¶È£zÿ¡Öpœ\"¡(QB1ŽöÊÎ¬,[ç/6kûq>sSp+å\"{zˆŒ\\KUhÞàîxWáÒÃ/Ÿâ\n5½\rˆd–›—î\ZTH\n„J¬7B:ÕüÞM]#B4éV£+3&E³ë8ˆpv7jE˜f|HT‰:P»\'À&éf\"•Çú#k3þºKÚñ3Wæjd“úK>÷“8îsªp„[áK¾0%\"\"\"\"\"\"JãfÎÂ0£/OÙ”¾\0“\\}mæbÖ=h>±GÔ’pý¥¥Å£Ùºtz7¶e dšÞ©n,“ý™êÍÙþIÏ&ñ¾éÍøÍ}„z6Ç„h©®f^SóQ7ú”\r·Žðþ¦©9¼\'\ZÍí×¨ëªïMùØ¹ŠCÙ÷i°U™²âó)<¿BUÂ!3\'G=ÒÌ¸S;kh¬Só\Z½J´;}ôMZ¼B¯žõÅÝˆzkÕµ»_VÐzë“UPÍïí•½>÷0Qák}¿Y†GÅ9\\KÕ\"²èSRRjÐ¯¡á;·&\"¢^¯¨°P»¦Eæ¯©¼6Q¼èêúøÕ®êpïÔRõÈ»`¯I©ä¤÷Ss†8›Ä\0LI1Õmhà\0La-+ÌPsš¶ÃX»ÉŠæga˜š}„\Zƒ!aT9VM*Ð»´ààf½/N¹íŒ}îŸ£ºÏËÂÞuM¡ªÌéq”UžæíÛ×¡[MÏ£ÏÏªf,ëìÏSÌÛ–¯e¼+ƒ=¹šÇ{}žD(Z>â6F²_QN¾„õ>Ùš€Ý¬ÙØ‰‘é§Àü‰Ôn1šÞkTÀg¼çÚ•È(M¿M•Žbÿ²oLÓ2ÉsÛ’ôIôß)Ÿçú0ÜË1ê½„ÈBTYš›£«}8+­ïß¾mÅýÞì¯Í¶]õ¾[ÌÇÂNíÃ},uÞŽ·uû¢K‚˜ Þšõùö×%mûqÕxÝ·u».öc#ˆçû9güyâÃ\n¼8Ñ3ÇÔgÔBra(JDDq‰¡(‘\'×Gs jw¯—€”×ÇÞÁ#¸¤Ø%Ã=[ˆ)—å£Ê.†CãÄ`E•‘Q§‚À&k Ú-	N£%¬}ëÇ,{Oˆ¯ûõ¨›?ûV£|ZF.l>ODDDDDD~‰ÀÔ˜ˆ(JD•ê¡!·4_[æØ\'|Ø¾¡(Ù}£ÇkD%©9¾ûQ*êý³v \Zþ¾e?±Ú1þ¹¯`WM5Ñ.°R”ˆˆâ+E‰ˆˆ<…Z)êÍ°1Ãx}ìX)Ú»x6çöÑ$;\\a4É¦n\"*L¿åg5E‰ˆ(.1%\"\"òÉPÔ,Œ«GJ\"\"¢^Íç‰ˆˆˆˆˆ(,uÇj\\QoÀP”ˆˆˆˆˆˆ¼º·‹è½a@JDD½›ÏQ\\bóy\"\"\"OÁ6Ÿ·‡¢¡6±góúè`ðLD±¨·üÎg¥(D„¤ÆVQ¬a(JDDDDDDA£Ï‡R\rÄ€”ˆˆbCQ\"\"\"\"\"\"\n™F)XH‰ˆ¨§0%\"\"\"\"\"¢ˆˆD@JDDÔ8ÐÅ%´DDDä)Ü–Ì‚¹>†\Zv†®&oÇµËc6ª«îiÂÚM;p^-ŠY¯ï@Ýü‘jÆ‰}«‹Q¾NÍ‘_¯í¬Fù5Sµ	ùÓžS3‘Òï¡ÁP”ˆˆâCQ\"\"\"O=Š\ZÂ©e@ê©[BÑìéxz^ö®Ûˆ#jQ·¡èƒðÒØŸàmµÈ*	¿Z”ŠÛÕÜÙ?\\ÆÏ¿U3¶uíÇ® ¼Ò„ÇÑê‡´º«øÑmß„¿JÁïîOQ38øé5ü‹SÍFÈ’ûâÇùö÷ü ¨?þqL²š»ŽO>¼Žõj.,ÆûU³pvà—ŸÞÀïÕ,ÐÿôÐ\0”8Ô¬·ããý\Zºë³ö¿_!ŠçYWçQ€çÙVàÅ!ÛŠzÁP”ˆˆâCQ\"\"\n\'€#]dCÑ¾HÏÉZÛœÞGwUËƒgÜp÷Iê#ÿ5ûîfƒ¯—Ð¡¨\néê=B*AèîªU•ßŸ\rž:q°¹J`ÿä¾’qRTzHy3rá¤ Â°bà,R€\nÓ{’!\\û’^¦=¼Œ¹mÓ{·ÎëAan„By3®»³å}F÷³¶°}¶Ñ=ÏÄ1LF…ú,=Î£ Î3†¢¾±OQ\"\"\"\"\"Š;DcOJÚ@ÜhjDk‡>?ª8üþG“S31$+Ë5e\rH†gLJyŠUKŸÕ§Ij©!³ªubZ8yrùX<&æçG&\n0ÇX¿ô§˜•-@²lÛ¶N÷\nvÕT£nç+j>2–Œñ>ýU_”8®c»È9o`{p{A\"G_<)ºOoàÏj‘™x]iu×]{¿¯¼.ÃËâ¿ÒçÃ—„_ÝŸ‚³7pQ-ÑõÁ?§ ýØ\rW(¶þXÚÉ˜lToFPUK§z¤ÑŽÉŒüN<f„Ã7ñÛcH+HÆÔ’pŒÈHF{‹)\\u~‡võ0ªŸµó&êÕC)ªû¾‰Ÿ›Îß×ujï9	·©Ï2úçYb`(JDDDDDDQw½Ý‰+¦‚:3#\r6 =ûŸGðÕ®ƒrÂw×ÐzåLÑ		£Ê±¬°[×½ŠÕbÚ[«Vèò&NvªuëÞÁAŒÇü‰¹Úš£xW,Û|Í¨u?Ý[Øf4ÆÉžŽéøD-kO\0%ÓŒP5š’Pœß‰‹™)øÝ¢jJÁµö™I@]§+PUt²	´¶<ìÎyå>›…÷Ám™ÚyYk¬•„zÓêÜÌÈÄõKîÓ¶WwÕKÜƒ8Yg|’ð+ÙÜ=Y[®ELL.Hv¿OG¤9;±Gt¢’S6á×–]Z†c}íu¤€_ÉÀO;¦÷‹@Pÿ|£úYÛýU2n7½ÏnÝ·EôÏ³DÁP”ˆˆˆˆˆˆb†FG|¿DÍî«ÝÇðMG°·ÊÅ¬{\nP³×wÓ÷óû7ºCNÔãH]23D(\Z€Æxw¿»vîü7Uh”…ï©yÝs˜:lxd›î:’´w–Œ’ŒNüèÃËrú¤.?~¨¯5ŒÍ¬\r”MÝù©¨šŒLHÑœüw‹ô¦Õ¿U“«dEæu|â3”D@&ö\nüA—eêxŠ÷U‚üÖÌŠ&Ýb½lÚ~gM•aùöºö_îwSþJ£öYÇS¼/½B×£+‚¨ŸgFì®5Då<K E‰ˆˆˆˆˆÈƒ¿þD£))ÕÁ¯`DˆÕ£‚Ñ¼ži\0DŸ¡®æïÏbYa†Z[Ó{ÙÔ¾»XÃA½©¸)ŒÊOÅïŠ¿Ã/Eh*úÔÔÖ¥9¿C•ZM·ß?3Z®È°Vô5éÑü;$z0VÿÏ>#Ý’QòÐ\0®ÐƒâŸ«WÖ7G¨~Z†“ú¶TÑÿhªÎ…£þñ¡>Ø.×k¯Q×7ñg[ˆ:¦àâ§bÛWQ?f\0~gÀ£úY‡‘ûÓ\\,ˆE¦à±Î³%÷é!ô/mAptÎ³ÄÂ–ˆˆ(.q %\"¢Äæ-%\\‹71q}LJEfV?\\kòlN/ÑœtÀée!Ô 3?ÿ®ÏsZ>Žì?½ŠwO«E––D¿¡³yâüZU|Š>B—eìÃêÏÕ@X~Z\Z7óYÌÉ8ì´)Òƒ2ùhIB#B2ÓhÛràÊ]Çz¢™ä@4æÁz\"À>Øà¹LT\ZêAeXƒïÈ÷\'šÃ{!G‚ïÄdó ?’—ã1¦mÃ:è$>†=È“~ü<ß—^	ûstÏgm°l»Î3y>‰ê`Ó>„`Î3´ä+E‰ˆˆˆˆˆ¨Çˆ\nâfÛ˜‚!nÜ)qÔã|0løX}V„–-ÍUxmý|{¥hc=šQ€¢QjÞ®EÛ‡|‹YÓ¼UŠFc ¥›¨¨KFÉw¤¡<£úwü¶S:óãûŒõIxxŒ©LåµÚëÒ^Û®×Õ‚ý_ŠêA½ÿK\ZŒ§ÂT-ÃÆ£bßØ¸T-êŠèËTV+º«:³PŠø{j;‘¦‡RMÖP”béSZú>*Åçqô}<¡…Â²míß“Níó¸ß¨Þì£ú¤½K *BîÏK³pÑ·\':qQì»[?kÛ¶ÚwŸµâ+;Ï¨+¬%\"¢¸ÄJQ\"¢ÄÖ›+W¢©\'¯zèÙOÍ:TÚé9™¨–ºt´¡¡åj—û	\'èìÍçE`ç¹^\rª/­ÅÖÍM˜4\røXUwÊÊPWZ‹ƒ\'2Qb®Du©+LmÁÁÍj°%YêBkNFf¡½RT„¢1²jSð•j>+E½2®Äè³²ÎZ±)*QM(ŸDxèQ©)¶?$œû_FÑ¢µjaW¬Ûu1ï_V¦èE3/¡–¬Þ›èÀ™‡cê3jaP¼WÊJE1È‘ +Hí•š\"¤{eŽ3Ø8l:Vª¥]²¼\'Ç¶­ŸGû1se§AÎ}>>S_ìÇ¼-Õ¯Ñú¬mç˜ÆsÛ]ï;¤ÏÚWepç™ÀJQßŠQ\\b(JD”ØŠz—×ÇD\nHãþ<÷ŠF€¨š\\U†!“a!Ýì[]ŒòujY7U“å9Á“‘ Ù†òp%èg-0õÍç‰ˆˆˆˆˆ(nˆ›qc\n–¸¹\'T¥ÞB5iî‘Lu\'Ð!™ç´}÷D *‚¹ºšžDô³¦€°R”ˆˆâ+E‰ˆ[ÜWÐ…(‘¯¡†±|ÞÄýy®š<ëœ–ˆ‚ +‚G¨™Pº¯Poþ=ÄP”ˆˆâCQ\"¢ÄÆPÔ;^CG…X;‡xžQOëÍ¿‡Ø|žˆˆˆˆˆˆ†¸Y7¦`‰›c\"\"¢Þ¡(%¤H¤DDÔ;1%\"\"\"\"\"¢„j@ÊêQ\"¢Þ‰¡(‘I8Õ£DDÔ;0%\"\"\"\"\"\"ò\"ÔêQ\"\"Š}E‰ˆˆˆˆˆˆ|`Óx\"¢øÄP”ˆˆˆˆˆˆÈÄBƒ\rCYQJDÔ{0%\"\"\"\"\"¢„j*tÝÄþìª©F6íz]-²p¯÷ý3DDI}JJJ¿S¥††¸©õVE……Ú5­QÍ…‡×F\"¢ÞÇ[°Å*¾Ø¸>¦¤ecðÀ8›œ¸bÚ€¾\\Íh.77¢õºš‰’PPCHçÓÒ÷Q¹j>6+Õ\"«eØxôùb8¦>£ùÎë\'\"Š–Þr½e¥(uƒ¾HÏÉFjg®©%f×ÛQß ¦¦6$g:0 Jw¬áV„†|Ã¿n*C¿TÍQa(JDDDDDDQ—’67š\ZÑÚ¡øsó:ÕÃH1‚Ð`ÃÐ°ƒP\"\"ŠIE‰ˆˆˆˆˆ(ê®·[›Ëû•Ò;:p-ÌþkB\rB¡DDñ¡(Å€$ÈÈFnŽ6eÀåËWCê³4AhôÂÐµ¨kp è‡ËÔ<õ´DDDq‰-%6o«þbäú˜”ŠÌ¬~¸fhÉJ¤ƒÑÿÚE4_\rl/¡„ BOœ¯í¬Fù\'ö­.Fù:µP\nn %\"\"\n+E‰ˆˆˆˆˆ(ÆÜÄµkèŸìÿ–5ÔªÐèW„ú\"BÏj”Žüaö@”ˆˆºCQ\"\"\"\"\"\"Š1}‘–Þ—;n¨y·PƒP¡g‚P;\'.œR‰ˆ¨Ç°ù<Å%6Ÿ\'\"Jl¡fduïÔRõÈ»`¯I©ä¤÷Ss†8e3z½¹¼Ã´úrs#Z¯ëÃù<{>5•¢Ë_ùªeóy\"¢îÂJQ\"\"\"\"\"\"òðÕ®êQdÜ¼êD}C£m2ú½‰+-Öu\"\r·\"4¶Q\"\"Š%E‰ˆˆˆˆˆ(fAh°ah¯B—NF‘ãêØ—(Qc(JDDDDDD=*Ô Tè¡¯`WM5êV•û?ÂJµÔM­¯yeµˆˆˆ¢Š}ŠQ\\bŸ¢DDJÀFVþú\r÷úÎçû!(Å:†¢DD—Šyòw}ôÖ‡h4BÑPÃP¡DDIl>ODDDDDDQe465šÆ3%\"¢Hc(JDDDDDDj*0%\"¢hc(JDDDDDD‰ ”a(u†¢DDDDDD¡DDÔÛ0%\"\"\"\"\"¢ Õ„XÊ ”ˆˆbCQ\"\"\"\"\"\"\nˆ¡Þ˜‚Å ”ˆˆb	CQ\"\"\"\"\"\"ò)A(ÃP\"\"Š5E‰ˆˆˆˆˆÈ«h¡)iÙÈÍq`€¯»Ñ¤Tdæh?“‘ÊV\"\"Š\Z^cˆˆˆˆˆˆ(,]¡º¾HÏÉFjg®©%ž’0 }:/_QóDDDÑÁP”ˆˆˆˆˆˆBÒuê–’67š\ZÑÚ¡x‘”:´¡ÝÏÏECQ\"\"\"\"\"\"\nØ½SKå4,À0Ôp½Ý‰+7ÕŒ7I©p¤ÎÖ«ð÷cDDD‘ÀP”ˆˆˆˆˆˆü2‚P1EKÊ€A@k›ÿà”ˆˆ(BŠ‘GàÙA¨KJ\Z÷mƒó*Q\"\"êE‰ˆˆˆˆˆHêÖ Ô$¥ß\0 ß äˆQçÅ”éžOOQ?DDDAE‰ˆˆˆˆˆ¨G]ooD}ƒij¾t´¡A{Üz]ýQõ;¶ø;õXjjjb§ÖDDÔëºã\\¼xQÍ…‡×F\"\"Š=y}Lê?Yƒú©9CZ/µÁ£Õ|Ê@ä¤v¢©õ\Z¯ÁDD}n»-ßŠ¶µµÁ²€ˆˆ¨ú^^®vMkWsááµ‘ˆˆâ¯DDDº>%%¥¼ŽQÂ`Ÿ¢DDDDDDDDD”PŠQþ?A@¹ÉLí\0\0\0\0IEND®B`‚','dd.png');
/*!40000 ALTER TABLE `test_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` varchar(255) NOT NULL,
  `active` int(11) DEFAULT NULL,
  `blood_group` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `dob` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `father_name` varchar(255) DEFAULT NULL,
  `f_name` varchar(255) NOT NULL,
  `image_name` varchar(255) DEFAULT NULL,
  `income_tex_no` varchar(255) DEFAULT NULL,
  `l_name` varchar(255) NOT NULL,
  `m_name` varchar(255) DEFAULT NULL,
  `mother_name` varchar(255) DEFAULT NULL,
  `my_role` varchar(255) DEFAULT NULL,
  `nationality` varchar(255) DEFAULT NULL,
  `nid` varchar(255) DEFAULT NULL,
  `passport_no` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `permanent_city` varchar(255) DEFAULT NULL,
  `permanent_country` varchar(255) DEFAULT NULL,
  `permanent_districe` varchar(255) DEFAULT NULL,
  `permanent_house` varchar(255) DEFAULT NULL,
  `permanent_post_office` varchar(255) DEFAULT NULL,
  `permanent_street` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `present_city` varchar(255) DEFAULT NULL,
  `present_country` varchar(255) DEFAULT NULL,
  `present_districe` varchar(255) DEFAULT NULL,
  `present_house` varchar(255) DEFAULT NULL,
  `present_post_office` varchar(255) DEFAULT NULL,
  `present_street` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('001122',1,NULL,'EEE','Faculty',NULL,'user@9',NULL,'Some',NULL,NULL,'One','Name',NULL,'FACULTY',NULL,NULL,NULL,'$2a$10$S0e5tt10FOTYGEeZYC2.heHoWEV2T4t0d5fCfk0ogFMrRzSA2P26e',NULL,NULL,NULL,NULL,NULL,NULL,'0123456789',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('0123654789',1,NULL,'TEXTILE','Faculty',NULL,'user@10',NULL,'User',NULL,NULL,'10','',NULL,'FACULTY',NULL,NULL,NULL,'$2a$10$TKQL2/9gj5LrXUJUMXvoluU.3Iml3/dg8ZP6mjFvqV7bqzkkv3qja',NULL,NULL,NULL,NULL,NULL,NULL,'01248579363',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('10254',1,NULL,'CSE','Student',NULL,'t@t',NULL,'Test',NULL,NULL,'t','t',NULL,'USER',NULL,NULL,NULL,'$2a$10$CMUOB//aJkaw/.C/JfTgVOcbR4aX2yeVej3idGFaqVdfJG8jqwyPa',NULL,NULL,NULL,NULL,NULL,NULL,'0123654',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('121',1,NULL,'CSE','Student',NULL,'f@r',NULL,'F',NULL,NULL,'R',NULL,NULL,'ADMIN',NULL,NULL,NULL,'$2a$10$t1SJW73l6WKtiSnUr8mryOJmnp8mAWVsRP0uVb1kNKSjG7YWM1Hpe',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('1231',1,NULL,'CSE','Student',NULL,'f@l',NULL,'F',NULL,NULL,'L','M',NULL,'USER',NULL,NULL,NULL,'$2a$10$tqzm72xKM6H8EVvPnLc0zuVX8VI8.6zZEh3VJmAqzGy6NKOW/Kc7G',NULL,NULL,NULL,NULL,NULL,NULL,'0123547869',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('1598753',1,NULL,'CSE','Student',NULL,'r@t',NULL,'R',NULL,NULL,'Y','T',NULL,'USER',NULL,NULL,NULL,'$2a$10$hTleMOv7EZbvSUk2XnreR.KY/fRE1pEHm7u4Ecyne1jkWy0jTFRE6',NULL,NULL,NULL,NULL,NULL,NULL,'01254789634',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('165465123',1,NULL,'TEXTILE','Faculty',NULL,'user@5',NULL,'user',NULL,NULL,'5','',NULL,'FACULTY',NULL,NULL,NULL,'$2a$10$dFq7pVRccsYnOyGFhN9azuAR.gDslnYDH95ZL8hKOYVkK1NfBSliO',NULL,NULL,NULL,NULL,NULL,NULL,'26545645665',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('2014200000071',1,NULL,'CSE','Student',NULL,'frsummit@gmail.com',NULL,'Fayazur',NULL,NULL,'Summit','Rahman',NULL,'ADMIN',NULL,NULL,NULL,'$2a$10$h.su08OimEKJFskyDIE8QuPk3R9Znfl3s2xMhcropM9oJvaTwq9FO',NULL,NULL,NULL,NULL,NULL,NULL,'01687858300',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('2014200000088',1,NULL,'CSE','Student',NULL,'abir_raihan@gmail.com',NULL,'Muntasir',NULL,NULL,'Abir','Rahman',NULL,'USER',NULL,NULL,NULL,'$2a$10$kIgCmWWIh4TMkIxEuYs6Ze50rBQ8EhvL7FeM8tfUXnKAhL/geaVGK',NULL,NULL,NULL,NULL,NULL,NULL,'0168257419314',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('2016000000059',1,'A+','CSE','Student','2018-04-13','rimi_shehrin@gmail.com','','Hafsina',NULL,NULL,'Rimi','Shehrin','','USER',NULL,'','$2a$10$9525MwDozFIYus1OcZy2TutxG1WvNfsIVyD2Ay36w4M4tTzMhQkFS','$2a$10$9525MwDozFIYus1OcZy2TutxG1WvNfsIVyD2Ay36w4M4tTzMhQkFS',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,'Male'),('333',1,'A+','CSE','','','e@r','','w',NULL,NULL,'e','','','DEAN',NULL,'',NULL,'$2a$10$FA2lUI8CpyX6yaqtteyxyeQWV8mHUevUsMY0TGKityJfPLOSyBdjS',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,'Male'),('696',1,NULL,'EEE','Student',NULL,'l@k',NULL,'l',NULL,NULL,'k','o',NULL,'USER',NULL,NULL,NULL,'$2a$10$5.lvb7QbbLb1MdOiXf/atOW9LT/zNipEXb3emDm2Pzz./DzNtldry',NULL,NULL,NULL,NULL,NULL,NULL,'1236547521',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('987001',1,NULL,'CSE','Professor',NULL,'c@m',NULL,'Chair',NULL,NULL,'Man','',NULL,'CHAIRMAN',NULL,NULL,NULL,'$2a$10$OJbVCg/62oTo.Gzeig9s.O3OfqfGelLJ4OnmJd2zgYuRQZeX6T522',NULL,NULL,NULL,NULL,NULL,NULL,'34654214652165',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('987012',1,NULL,'CSE','Ass-Pro',NULL,'c@o',NULL,'Co',NULL,NULL,'Ord','',NULL,'CO-ORDINATOR',NULL,NULL,NULL,'$2a$10$2.bdCx3jrvBkzpvHXOOvTeTK2K/rE6pdmAxaLTktW6ma47.Hit.ca',NULL,NULL,NULL,NULL,NULL,NULL,'214654145',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('987111',1,NULL,'CSE','VC',NULL,'v@c',NULL,'V',NULL,NULL,'C','C',NULL,'VC',NULL,NULL,NULL,'$2a$10$KJ0IM9JDwcl.6TuFHcK06eIs/DIUSN4qpGjVYGdjwsiHGC/XMfkcK',NULL,NULL,NULL,NULL,NULL,NULL,'1598764423',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('987112',1,NULL,'CSE','PRO-VC',NULL,'pro@vc',NULL,'PRO',NULL,NULL,'C','V',NULL,'PRO-VC',NULL,NULL,NULL,'$2a$10$BnV/DkO9z3LH6kEXByFsIu.4m7Ab5.5mDDrIO8XLhvkgKIkc8taZW',NULL,NULL,NULL,NULL,NULL,NULL,'1016541251654',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `user_id` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKa68196081fvovjhkek5m97n3y` (`role_id`),
  CONSTRAINT `FK859n2jvi8ivhui0rl0esws6o` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKa68196081fvovjhkek5m97n3y` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES ('121',1),('2014200000071',1),('987111',2),('987112',3),('333',4),('987001',5),('987012',6),('001122',7),('0123654789',7),('165465123',7),('10254',8),('1231',8),('1598753',8),('2014200000088',8),('2016000000059',8),('696',8);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-03 21:59:22
