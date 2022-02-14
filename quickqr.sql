/*
SQLyog Professional v13.1.1 (64 bit)
MySQL - 10.4.14-MariaDB : Database - quickqr
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`quickqr` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `quickqr`;

/*Table structure for table `qr_admins` */

DROP TABLE IF EXISTS `qr_admins`;

CREATE TABLE `qr_admins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_hash` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default_user.png',
  `permission` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `qr_admins` */

insert  into `qr_admins`(`id`,`username`,`password_hash`,`name`,`email`,`image`,`permission`) values 
(1,'admin','$2y$13$yAgbh/cqFjK7eXJ7FqZoX.ydHl/SU3K4nHHGtWEccehufVAPCJV8i','Admin','yaroslavgaponenko04041996@gmail.com','','0');

/*Table structure for table `qr_balance` */

DROP TABLE IF EXISTS `qr_balance`;

CREATE TABLE `qr_balance` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `current_balance` double(9,2) DEFAULT NULL,
  `total_earning` double(9,2) DEFAULT NULL,
  `total_withdrawal` double(9,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `qr_balance` */

insert  into `qr_balance`(`id`,`current_balance`,`total_earning`,`total_withdrawal`) values 
(1,0.00,0.00,0.00);

/*Table structure for table `qr_blog` */

DROP TABLE IF EXISTS `qr_blog`;

CREATE TABLE `qr_blog` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `author` int(10) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` text CHARACTER SET utf32 COLLATE utf32_unicode_ci DEFAULT NULL,
  `status` enum('publish','pending') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `qr_blog` */

insert  into `qr_blog`(`id`,`author`,`title`,`description`,`image`,`tags`,`status`,`created_at`,`updated_at`) values 
(1,1,'First Blog','<p>Consectetur adipisicing elitsed do eiusmod tempor incididunt ut labore et dolore magna aliqua Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commo do consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla paria tur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<blockquote>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla paria tur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</blockquote><p>Elitsed do eiusmod tempor incididunt ut labore et dolore magna aliqua Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commo do consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla paria tur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim.</p><p></p></p>\n',NULL,'travel fun, love','publish','2020-01-15 23:05:15','2020-10-13 20:47:43');

/*Table structure for table `qr_blog_cat_relation` */

DROP TABLE IF EXISTS `qr_blog_cat_relation`;

CREATE TABLE `qr_blog_cat_relation` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `blog_id` int(10) DEFAULT NULL,
  `category_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `qr_blog_cat_relation` */

insert  into `qr_blog_cat_relation`(`id`,`blog_id`,`category_id`) values 
(3,1,1),
(4,1,2);

/*Table structure for table `qr_blog_categories` */

DROP TABLE IF EXISTS `qr_blog_categories`;

CREATE TABLE `qr_blog_categories` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(10) NOT NULL DEFAULT 0,
  `active` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `qr_blog_categories` */

insert  into `qr_blog_categories`(`id`,`title`,`slug`,`position`,`active`) values 
(1,'Fashion','fashion',0,'1'),
(2,'Lifestyle','lifestyle',1,'1');

/*Table structure for table `qr_blog_comment` */

DROP TABLE IF EXISTS `qr_blog_comment`;

CREATE TABLE `qr_blog_comment` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `blog_id` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `is_admin` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `name` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `active` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `parent` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `qr_blog_comment` */

/*Table structure for table `qr_catagory_main` */

DROP TABLE IF EXISTS `qr_catagory_main`;

CREATE TABLE `qr_catagory_main` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `cat_name` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent` int(11) NOT NULL DEFAULT 0,
  `cat_order` int(10) DEFAULT NULL,
  `slug` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fa-usd',
  `picture` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `translation` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `qr_catagory_main` */

/*Table structure for table `qr_countries` */

DROP TABLE IF EXISTS `qr_countries`;

CREATE TABLE `qr_countries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iso3` char(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iso_numeric` int(10) unsigned DEFAULT NULL,
  `fips` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `asciiname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capital` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area` int(10) unsigned DEFAULT NULL,
  `population` int(10) unsigned DEFAULT NULL,
  `continent_code` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tld` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code_format` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code_regex` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `languages` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `neighbours` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `equivalent_fips_code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `qr_countries` */

insert  into `qr_countries`(`id`,`code`,`latitude`,`longitude`,`iso3`,`iso_numeric`,`fips`,`name`,`asciiname`,`capital`,`area`,`population`,`continent_code`,`tld`,`currency_code`,`phone`,`postal_code_format`,`postal_code_regex`,`languages`,`neighbours`,`equivalent_fips_code`,`active`,`created_at`,`updated_at`) values 
(1,'AD',NULL,NULL,'AND',20,'AN','Andorra','Andorra','Andorra la Vella',468,84000,'EU','.ad','EUR','376','AD###','^(?:AD)*(d{3})$','ca','ES,FR','',1,NULL,'2019-11-30 05:49:46'),
(2,'AE',NULL,NULL,'ARE',784,'AE','al-ImÄrÄt','United Arab Emirates','Abu Dhabi',82880,4975593,'AS','.ae','AED','971','','','ar-AE,fa,en,hi,ur','SA,OM','',1,NULL,'2019-11-30 05:49:58'),
(3,'AF',NULL,NULL,'AFG',4,'AF','AfÄ¡ÄnistÄn','Afghanistan','Kabul',647500,29121286,'AS','.af','AFN','93','','','fa-AF,ps,uz-AF,tk','TM,CN,IR,TJ,PK,UZ','',1,NULL,'2019-11-30 05:50:01'),
(4,'AG',NULL,NULL,'ATG',28,'AC','Antigua and Barbuda','Antigua and Barbuda','St. John\'s',443,86754,'NA','.ag','XCD','+1-268','','','en-AG','','',1,NULL,'2019-11-30 05:50:04'),
(5,'AI',NULL,NULL,'AIA',660,'AV','Anguilla','Anguilla','The Valley',102,13254,'NA','.ai','XCD','+1-264','','','en-AI','','',1,NULL,'2019-11-30 05:50:06'),
(6,'AL',NULL,NULL,'ALB',8,'AL','ShqipÃ«ria','Albania','Tirana',28748,2986952,'EU','.al','ALL','355','','','sq,el','MK,GR,ME,RS,XK','',1,NULL,'2019-11-30 05:50:10'),
(7,'AM',NULL,NULL,'ARM',51,'AM','Hayastan','Armenia','Yerevan',29800,2968000,'AS','.am','AMD','374','######','^(d{6})$','hy','GE,IR,AZ,TR','',1,NULL,'2019-11-30 05:50:13'),
(8,'AN',NULL,NULL,'ANT',530,'NT','Netherlands Antilles','Netherlands Antilles','Willemstad',960,136197,'NA','.an','ANG','599','','','nl-AN,en,es','GP','',1,NULL,'2019-11-30 05:50:15'),
(9,'AO',NULL,NULL,'AGO',24,'AO','Angola','Angola','Luanda',1246700,13068161,'AF','.ao','AOA','244','','','pt-AO','CD,NA,ZM,CG','',1,NULL,'2019-11-30 05:50:18'),
(10,'AQ',NULL,NULL,'ATA',10,'AY','Antarctica','Antarctica','',14000000,0,'AN','.aq','','','','','','','',1,NULL,'2019-11-30 05:50:20'),
(11,'AR',NULL,NULL,'ARG',32,'AR','Argentina','Argentina','Buenos Aires',2766890,41343201,'SA','.ar','ARS','54','@####@@@','^([A-Z]d{4}[A-Z]{3})$','es-AR,en,it,de,fr,gn','CL,BO,UY,PY,BR','',1,NULL,'2019-11-30 05:50:27'),
(12,'AS',NULL,NULL,'ASM',16,'AQ','American Samoa','American Samoa','Pago Pago',199,57881,'OC','.as','USD','+1-684','','','en-AS,sm,to','','',1,NULL,'2019-11-30 05:50:29'),
(13,'AT',NULL,NULL,'AUT',40,'AU','Ã–sterreich','Austria','Vienna',83858,8205000,'EU','.at','EUR','43','####','^(d{4})$','de-AT,hr,hu,sl','CH,DE,HU,SK,CZ,IT,SI,LI','',1,NULL,'2019-11-30 05:50:33'),
(14,'AU',NULL,NULL,'AUS',36,'AS','Australia','Australia','Canberra',7686850,21515754,'OC','.au','AUD','61','####','^(d{4})$','en-AU','','',1,NULL,'2019-11-30 05:50:36'),
(15,'AW',NULL,NULL,'ABW',533,'AA','Aruba','Aruba','Oranjestad',193,71566,'NA','.aw','AWG','297','','','nl-AW,es,en','','',1,NULL,'2019-11-30 05:50:40'),
(16,'AX',NULL,NULL,'ALA',248,'','Aland Islands','Aland Islands','Mariehamn',1580,26711,'EU','.ax','EUR','+358-18','#####','^(?:FI)*(d{5})$','sv-AX','','FI',1,NULL,'2019-11-30 05:50:43'),
(17,'AZ',NULL,NULL,'AZE',31,'AJ','AzÉ™rbaycan','Azerbaijan','Baku',86600,8303512,'AS','.az','AZN','994','AZ ####','^(?:AZ)*(d{4})$','az,ru,hy','GE,IR,AM,TR,RU','',1,NULL,'2019-11-30 05:50:46'),
(18,'BA',NULL,NULL,'BIH',70,'BK','Bosna i Hercegovina','Bosnia and Herzegovina','Sarajevo',51129,4590000,'EU','.ba','BAM','387','#####','^(d{5})$','bs,hr-BA,sr-BA','HR,ME,RS','',1,NULL,'2019-11-30 05:50:50'),
(19,'BB',NULL,NULL,'BRB',52,'BB','Barbados','Barbados','Bridgetown',431,285653,'NA','.bb','BBD','+1-246','BB#####','^(?:BB)*(d{5})$','en-BB','','',1,NULL,'2019-11-30 05:50:53'),
(20,'BD',NULL,NULL,'BGD',50,'BG','BaÌ„nÌ‡laÌ„deÌ„sÌ','Bangladesh','Dhaka',144000,156118464,'AS','.bd','BDT','880','####','^(d{4})$','bn-BD,en','MM,IN','',1,NULL,'2019-11-30 05:50:57'),
(21,'BE',NULL,NULL,'BEL',56,'BE','Belgique','Belgium','Brussels',30510,10403000,'EU','.be','EUR','32','####','^(d{4})$','nl-BE,fr-BE,de-BE','DE,NL,LU,FR','',1,NULL,'2019-11-30 05:51:03'),
(22,'BF',NULL,NULL,'BFA',854,'UV','Burkina Faso','Burkina Faso','Ouagadougou',274200,16241811,'AF','.bf','XOF','226','','','fr-BF','NE,BJ,GH,CI,TG,ML','',1,NULL,'2019-11-30 05:51:06'),
(23,'BG',NULL,NULL,'BGR',100,'BU','BÅ­lgarija','Bulgaria','Sofia',110910,7148785,'EU','.bg','BGN','359','####','^(d{4})$','bg,tr-BG,rom','MK,GR,RO,TR,RS','',1,NULL,'2019-11-30 05:51:09'),
(24,'BH',NULL,NULL,'BHR',48,'BA','al-Baá¸¥rayn','Bahrain','Manama',665,738004,'AS','.bh','BHD','973','####|###','^(d{3}d?)$','ar-BH,en,fa,ur','','',1,NULL,'2019-11-30 05:51:11'),
(25,'BI',NULL,NULL,'BDI',108,'BY','Burundi','Burundi','Bujumbura',27830,9863117,'AF','.bi','BIF','257','','','fr-BI,rn','TZ,CD,RW','',1,NULL,'2019-11-30 05:51:14'),
(26,'BJ',NULL,NULL,'BEN',204,'BN','BÃ©nin','Benin','Porto-Novo',112620,9056010,'AF','.bj','XOF','+229','','','fr-BJ','NE,TG,BF,NG','',1,NULL,'2019-11-30 05:51:16'),
(27,'BL',NULL,NULL,'BLM',652,'TB','Saint Barthelemy','Saint Barthelemy','Gustavia',21,8450,'NA','.gp','EUR','590','### ###','','fr','','',1,NULL,'2019-11-30 05:51:19'),
(28,'BM',NULL,NULL,'BMU',60,'BD','Bermuda','Bermuda','Hamilton',53,65365,'NA','.bm','BMD','+1-441','@@ ##','^([A-Z]{2}d{2})$','en-BM,pt','','',1,NULL,'2019-11-30 05:51:22'),
(29,'BN',NULL,NULL,'BRN',96,'BX','Brunei Darussalam','Brunei','Bandar Seri Begawan',5770,395027,'AS','.bn','BND','673','@@####','^([A-Z]{2}d{4})$','ms-BN,en-BN','MY','',1,NULL,'2019-11-30 05:51:26'),
(30,'BO',NULL,NULL,'BOL',68,'BL','Bolivia','Bolivia','Sucre',1098580,9947418,'SA','.bo','BOB','591','','','es-BO,qu,ay','PE,CL,PY,BR,AR','',1,NULL,'2019-11-30 05:51:28'),
(31,'BQ',NULL,NULL,'BES',535,'','Bonaire, Saint Eustatius and Saba ','Bonaire, Saint Eustatius and Saba ','',328,18012,'NA','.bq','USD','599','','','nl,pap,en','','',1,NULL,'2019-11-30 05:51:35'),
(32,'BR',NULL,NULL,'BRA',76,'BR','Brasil','Brazil','Brasilia',8511965,201103330,'SA','.br','BRL','55','#####-###','^(d{8})$','pt-BR,es,en,fr','SR,PE,BO,UY,GY,PY,GF,VE,CO,AR','',1,NULL,'2019-11-30 05:51:40'),
(33,'BS',NULL,NULL,'BHS',44,'BF','Bahamas','Bahamas','Nassau',13940,301790,'NA','.bs','BSD','+1-242','','','en-BS','','',1,NULL,'2019-11-30 05:51:43'),
(34,'BT',NULL,NULL,'BTN',64,'BT','Druk-yul','Bhutan','Thimphu',47000,699847,'AS','.bt','BTN','975','','','dz','CN,IN','',1,NULL,'2019-11-30 05:51:47'),
(35,'BV',NULL,NULL,'BVT',74,'BV','Bouvet Island','Bouvet Island','',49,0,'AN','.bv','NOK','','','','','','',1,NULL,'2019-11-30 05:51:50'),
(36,'BW',NULL,NULL,'BWA',72,'BC','Botswana','Botswana','Gaborone',600370,2029307,'AF','.bw','BWP','267','','','en-BW,tn-BW','ZW,ZA,NA','',1,NULL,'2019-11-30 05:51:53'),
(37,'BY',NULL,NULL,'BLR',112,'BO','BieÅ‚aruÅ›','Belarus','Minsk',207600,9685000,'EU','.by','BYR','375','######','^(d{6})$','be,ru','PL,LT,UA,RU,LV','',1,NULL,'2019-11-30 05:51:56'),
(38,'BZ',NULL,NULL,'BLZ',84,'BH','Belize','Belize','Belmopan',22966,314522,'NA','.bz','BZD','501','','','en-BZ,es','GT,MX','',1,NULL,'2019-11-30 05:52:00'),
(39,'CA',NULL,NULL,'CAN',124,'CA','Canada','Canada','Ottawa',9984670,33679000,'NA','.ca','CAD','1','@#@ #@#','^([ABCEGHJKLMNPRSTVXY]d[ABCEGHJKLMNPRSTVWXYZ]) ?(d[ABCEGHJKLMNPRSTVWXYZ]d)$ ','en-CA,fr-CA,iu','US','',1,NULL,'2019-11-30 05:52:03'),
(40,'CC',NULL,NULL,'CCK',166,'CK','Cocos Islands','Cocos Islands','West Island',14,628,'AS','.cc','AUD','61','','','ms-CC,en','','',1,NULL,'2019-11-30 05:52:05'),
(41,'CD',NULL,NULL,'COD',180,'CG','RDC','Democratic Republic of the Congo','Kinshasa',2345410,70916439,'AF','.cd','CDF','243','','','fr-CD,ln,kg','TZ,CF,SS,RW,ZM,BI,UG,CG,AO','',1,NULL,'2019-11-30 05:52:11'),
(42,'CF',NULL,NULL,'CAF',140,'CT','Centrafrique','Central African Republic','Bangui',622984,4844927,'AF','.cf','XAF','236','','','fr-CF,sg,ln,kg','TD,SD,CD,SS,CM,CG','',1,NULL,'2019-11-30 05:52:14'),
(43,'CG',NULL,NULL,'COG',178,'CF','Congo','Republic of the Congo','Brazzaville',342000,3039126,'AF','.cg','XAF','242','','','fr-CG,kg,ln-CG','CF,GA,CD,CM,AO','',1,NULL,'2019-11-30 05:52:16'),
(44,'CH',NULL,NULL,'CHE',756,'SZ','Switzerland','Switzerland','Berne',41290,7581000,'EU','.ch','CHF','41','####','^(d{4})$','de-CH,fr-CH,it-CH,rm','DE,IT,LI,FR,AT','',1,NULL,'2019-11-30 05:52:19'),
(45,'CI',NULL,NULL,'CIV',384,'IV','CÃ´te d\'Ivoire','Ivory Coast','Yamoussoukro',322460,21058798,'AF','.ci','XOF','225','','','fr-CI','LR,GH,GN,BF,ML','',1,NULL,'2019-11-30 05:52:21'),
(46,'CK',NULL,NULL,'COK',184,'CW','Cook Islands','Cook Islands','Avarua',240,21388,'OC','.ck','NZD','682','','','en-CK,mi','','',1,NULL,'2019-11-30 05:52:25'),
(47,'CL',NULL,NULL,'CHL',152,'CI','Chile','Chile','Santiago',756950,16746491,'SA','.cl','CLP','56','#######','^(d{7})$','es-CL','PE,BO,AR','',1,NULL,'2019-11-30 05:52:27'),
(48,'CM',NULL,NULL,'CMR',120,'CM','Cameroun','Cameroon','Yaounde',475440,19294149,'AF','.cm','XAF','237','','','fr-CM,en-CM','TD,CF,GA,GQ,CG,NG','',1,NULL,'2019-11-30 05:52:30'),
(49,'CN',NULL,NULL,'CHN',156,'CH','ZhÅngguÃ³','China','Beijing',9596960,1330044000,'AS','.cn','CNY','86','######','^(d{6})$','zh-CN,yue,wuu,dta,ug,za','LA,BT,TJ,KZ,MN,AF,NP,MM,KG,PK,KP,RU,VN,IN','',1,NULL,'2019-11-30 05:52:33'),
(50,'CO',NULL,NULL,'COL',170,'CO','Colombia','Colombia','Bogota',1138910,47790000,'SA','.co','COP','57','','','es-CO','EC,PE,PA,BR,VE','',1,NULL,'2019-11-30 05:52:35'),
(51,'CR',NULL,NULL,'CRI',188,'CS','Costa Rica','Costa Rica','San Jose',51100,4516220,'NA','.cr','CRC','506','####','^(d{4})$','es-CR,en','PA,NI','',1,NULL,'2019-11-30 05:52:41'),
(52,'CS',NULL,NULL,'SCG',891,'YI','Serbia and Montenegro','Serbia and Montenegro','Belgrade',102350,10829175,'EU','.cs','RSD','381','#####','^(d{5})$','cu,hu,sq,sr','AL,HU,MK,RO,HR,BA,BG','',1,NULL,'2019-11-30 05:52:43'),
(53,'CU',NULL,NULL,'CUB',192,'CU','Cuba','Cuba','Havana',110860,11423000,'NA','.cu','CUP','53','CP #####','^(?:CP)*(d{5})$','es-CU','US','',1,NULL,'2019-11-30 05:52:45'),
(54,'CV',NULL,NULL,'CPV',132,'CV','Cabo Verde','Cape Verde','Praia',4033,508659,'AF','.cv','CVE','238','####','^(d{4})$','pt-CV','','',1,NULL,'2019-11-30 05:52:49'),
(55,'CW',NULL,NULL,'CUW',531,'UC','Curacao','Curacao',' Willemstad',444,141766,'NA','.cw','ANG','599','','','nl,pap','','',1,NULL,'2019-11-30 05:52:52'),
(56,'CX',NULL,NULL,'CXR',162,'KT','Christmas Island','Christmas Island','Flying Fish Cove',135,1500,'AS','.cx','AUD','61','####','^(d{4})$','en,zh,ms-CC','','',1,NULL,'2019-11-30 05:52:54'),
(57,'CY',NULL,NULL,'CYP',196,'CY','KÃ½pros (KÄ±brÄ±s)','Cyprus','Nicosia',9250,1102677,'EU','.cy','EUR','357','####','^(d{4})$','el-CY,tr-CY,en','','',1,NULL,'2019-11-30 05:52:56'),
(58,'CZ',NULL,NULL,'CZE',203,'EZ','ÄŒesko','Czech Republic','Prague',78866,10476000,'EU','.cz','CZK','420','### ##','^(d{5})$','cs,sk','PL,DE,SK,AT','',1,NULL,'2019-11-30 05:52:59'),
(59,'DE',NULL,NULL,'DEU',276,'GM','Deutschland','Germany','Berlin',357021,81802257,'EU','.de','EUR','49','#####','^(d{5})$','de','CH,PL,NL,DK,BE,CZ,LU,FR,AT','',1,NULL,'2019-11-30 05:53:02'),
(60,'DJ',NULL,NULL,'DJI',262,'DJ','Djibouti','Djibouti','Djibouti',23000,740528,'AF','.dj','DJF','253','','','fr-DJ,ar,so-DJ,aa','ER,ET,SO','',1,NULL,'2019-11-30 05:53:05'),
(61,'DK',NULL,NULL,'DNK',208,'DA','Danmark','Denmark','Copenhagen',43094,5484000,'EU','.dk','DKK','45','####','^(d{4})$','da-DK,en,fo,de-DK','DE','',1,NULL,'2019-11-30 05:53:11'),
(62,'DM',NULL,NULL,'DMA',212,'DO','Dominica','Dominica','Roseau',754,72813,'NA','.dm','XCD','+1-767','','','en-DM','','',1,NULL,'2019-11-30 05:53:13'),
(63,'DO',NULL,NULL,'DOM',214,'DR','RepÃºblica Dominicana','Dominican Republic','Santo Domingo',48730,9823821,'NA','.do','DOP','+809/829/849','#####','^(d{5})$','es-DO','HT','',1,NULL,'2019-11-30 05:53:16'),
(64,'DZ',NULL,NULL,'DZA',12,'AG','AlgÃ©rie','Algeria','Algiers',2381740,34586184,'AF','.dz','DZD','213','#####','^(d{5})$','ar-DZ,fr','NE,EH,LY,MR,TN,MA,ML','',1,NULL,'2019-11-30 05:53:20'),
(65,'EC',NULL,NULL,'ECU',218,'EC','Ecuador','Ecuador','Quito',283560,14790608,'SA','.ec','USD','593','@####@','^([a-zA-Z]d{4}[a-zA-Z])$','es-EC','PE,CO','',1,NULL,'2019-11-30 05:53:24'),
(66,'EE',NULL,NULL,'EST',233,'EN','Eesti','Estonia','Tallinn',45226,1291170,'EU','.ee','EUR','372','#####','^(d{5})$','et,ru','RU,LV','',1,NULL,'2019-11-30 05:53:27'),
(67,'EG',NULL,NULL,'EGY',818,'EG','Egypt','Egypt','Cairo',1001450,80471869,'AF','.eg','EGP','20','#####','^(d{5})$','ar-EG,en,fr','LY,SD,IL,PS','',1,NULL,'2019-11-30 05:53:30'),
(68,'EH',NULL,NULL,'ESH',732,'WI','aá¹£-á¹¢aá¸¥rÄwÄ«yÃ¢ al-Ê¿ArabÄ«yÃ¢','Western Sahara','El-Aaiun',266000,273008,'AF','.eh','MAD','212','','','ar,mey','DZ,MR,MA','',1,NULL,'2019-11-30 05:53:33'),
(69,'ER',NULL,NULL,'ERI',232,'ER','ErtrÄ','Eritrea','Asmara',121320,5792984,'AF','.er','ERN','291','','','aa-ER,ar,tig,kun,ti-ER','ET,SD,DJ','',1,NULL,'2019-11-30 05:53:36'),
(70,'ES',NULL,NULL,'ESP',724,'SP','EspaÃ±a','Spain','Madrid',504782,46505963,'EU','.es','EUR','34','#####','^(d{5})$','es-ES,ca,gl,eu,oc','AD,PT,GI,FR,MA','',1,NULL,'2019-11-30 05:53:39'),
(71,'ET',NULL,NULL,'ETH',231,'ET','Ityoá¹—ya','Ethiopia','Addis Ababa',1127127,88013491,'AF','.et','ETB','251','####','^(d{4})$','am,en-ET,om-ET,ti-ET,so-ET,sid','ER,KE,SD,SS,SO,DJ','',1,NULL,'2019-11-30 05:53:45'),
(72,'FI',NULL,NULL,'FIN',246,'FI','Suomi (Finland)','Finland','Helsinki',337030,5244000,'EU','.fi','EUR','358','#####','^(?:FI)*(d{5})$','fi-FI,sv-FI,smn','NO,RU,SE','',1,NULL,'2019-11-30 05:53:48'),
(73,'FJ',NULL,NULL,'FJI',242,'FJ','Viti','Fiji','Suva',18270,875983,'OC','.fj','FJD','679','','','en-FJ,fj','','',1,NULL,'2019-11-30 05:53:56'),
(74,'FK',NULL,NULL,'FLK',238,'FK','Falkland Islands','Falkland Islands','Stanley',12173,2638,'SA','.fk','FKP','500','','','en-FK','','',1,NULL,'2019-11-30 05:53:59'),
(75,'FM',NULL,NULL,'FSM',583,'FM','Micronesia','Micronesia','Palikir',702,107708,'OC','.fm','USD','691','#####','^(d{5})$','en-FM,chk,pon,yap,kos,uli,woe,nkr,kpg','','',1,NULL,'2019-11-30 05:54:06'),
(76,'FO',NULL,NULL,'FRO',234,'FO','FÃ¸royar','Faroe Islands','Torshavn',1399,48228,'EU','.fo','DKK','298','FO-###','^(?:FO)*(d{3})$','fo,da-FO','','',1,NULL,'2019-11-30 05:54:09'),
(77,'FR',NULL,NULL,'FRA',250,'FR','France','France','Paris',547030,64768389,'EU','.fr','EUR','33','#####','^(d{5})$','fr-FR,frp,br,co,ca,eu,oc','CH,DE,BE,LU,IT,AD,MC,ES','',1,NULL,'2019-11-30 05:54:12'),
(78,'GA',NULL,NULL,'GAB',266,'GB','Gabon','Gabon','Libreville',267667,1545255,'AF','.ga','XAF','241','','','fr-GA','CM,GQ,CG','',1,NULL,'2019-11-30 05:54:15'),
(79,'GD',NULL,NULL,'GRD',308,'GJ','Grenada','Grenada','St. George\'s',344,107818,'NA','.gd','XCD','+1-473','','','en-GD','','',1,NULL,'2019-11-30 05:54:19'),
(80,'GE',NULL,NULL,'GEO',268,'GG','Sak\'art\'velo','Georgia','Tbilisi',69700,4630000,'AS','.ge','GEL','995','####','^(d{4})$','ka,ru,hy,az','AM,AZ,TR,RU','',1,NULL,'2019-11-30 05:54:21'),
(81,'GF',NULL,NULL,'GUF',254,'FG','Guyane','French Guiana','Cayenne',91000,195506,'SA','.gf','EUR','594','#####','^((97|98)3d{2})$','fr-GF','SR,BR','',1,NULL,'2019-11-30 05:54:30'),
(82,'GG',NULL,NULL,'GGY',831,'GK','Guernsey','Guernsey','St Peter Port',78,65228,'EU','.gg','GBP','+44-1481','@# #@@|@## #@@|@@# #@@|@@## #@@|@#@ #@@|@@#@ #@@|G','^(([A-Z]d{2}[A-Z]{2})|([A-Z]d{3}[A-Z]{2})|([A-Z]{2}d{2}[A-Z]{2})|([A-Z]{2}d{3}[A-Z]{2})|([A-Z]d[A-Z]d[A-Z]{2})|([A-Z]{2}d[A-Z]d[A-Z]{2})|(GIR0AA))$','en,fr','','',1,NULL,'2019-11-30 05:54:32'),
(83,'GH',NULL,NULL,'GHA',288,'GH','Ghana','Ghana','Accra',239460,24339838,'AF','.gh','GHS','233','','','en-GH,ak,ee,tw','CI,TG,BF','',1,NULL,'2019-11-30 05:54:35'),
(84,'GI',NULL,NULL,'GIB',292,'GI','Gibraltar','Gibraltar','Gibraltar',7,27884,'EU','.gi','GIP','350','','','en-GI,es,it,pt','ES','',1,NULL,'2019-11-30 05:54:38'),
(85,'GL',NULL,NULL,'GRL',304,'GL','GrÃ¸nland','Greenland','Nuuk',2166086,56375,'NA','.gl','DKK','299','####','^(d{4})$','kl,da-GL,en','','',1,NULL,'2019-11-30 05:54:40'),
(86,'GM',NULL,NULL,'GMB',270,'GA','Gambia','Gambia','Banjul',11300,1593256,'AF','.gm','GMD','220','','','en-GM,mnk,wof,wo,ff','SN','',1,NULL,'2019-11-30 05:54:43'),
(87,'GN',NULL,NULL,'GIN',324,'GV','GuinÃ©e','Guinea','Conakry',245857,10324025,'AF','.gn','GNF','224','','','fr-GN','LR,SN,SL,CI,GW,ML','',1,NULL,'2019-11-30 05:54:46'),
(88,'GP',NULL,NULL,'GLP',312,'GP','Guadeloupe','Guadeloupe','Basse-Terre',1780,443000,'NA','.gp','EUR','590','#####','^((97|98)d{3})$','fr-GP','','',1,NULL,'2019-11-30 05:54:48'),
(89,'GQ',NULL,NULL,'GNQ',226,'EK','GuinÃ©e Equatoriale','Equatorial Guinea','Malabo',28051,1014999,'AF','.gq','XAF','240','','','es-GQ,fr','GA,CM','',1,NULL,'2019-11-30 05:54:51'),
(90,'GR',NULL,NULL,'GRC',300,'GR','EllÃ¡da','Greece','Athens',131940,11000000,'EU','.gr','EUR','30','### ##','^(d{5})$','el-GR,en,fr','AL,MK,TR,BG','',1,NULL,'2019-11-30 05:54:54'),
(91,'GS',NULL,NULL,'SGS',239,'SX','South Georgia and the South Sandwich Islands','South Georgia and the South Sandwich Islands','Grytviken',3903,30,'AN','.gs','GBP','','','','en','','',1,NULL,'2019-11-30 05:55:00'),
(92,'GT',NULL,NULL,'GTM',320,'GT','Guatemala','Guatemala','Guatemala City',108890,13550440,'NA','.gt','GTQ','502','#####','^(d{5})$','es-GT','MX,HN,BZ,SV','',1,NULL,'2019-11-30 05:55:02'),
(93,'GU',NULL,NULL,'GUM',316,'GQ','Guam','Guam','Hagatna',549,159358,'OC','.gu','USD','+1-671','969##','^(969d{2})$','en-GU,ch-GU','','',1,NULL,'2019-11-30 05:55:05'),
(94,'GW',NULL,NULL,'GNB',624,'PU','GuinÃ©-Bissau','Guinea-Bissau','Bissau',36120,1565126,'AF','.gw','XOF','245','####','^(d{4})$','pt-GW,pov','SN,GN','',1,NULL,'2019-11-30 05:55:08'),
(95,'GY',NULL,NULL,'GUY',328,'GY','Guyana','Guyana','Georgetown',214970,748486,'SA','.gy','GYD','592','','','en-GY','SR,BR,VE','',1,NULL,'2019-11-30 05:55:10'),
(96,'HK',NULL,NULL,'HKG',344,'HK','HÃ¨unggÃ³ng','Hong Kong','Hong Kong',1092,6898686,'AS','.hk','HKD','852','','','zh-HK,yue,zh,en','','',1,NULL,'2019-11-30 05:55:14'),
(97,'HM',NULL,NULL,'HMD',334,'HM','Heard Island and McDonald Islands','Heard Island and McDonald Islands','',412,0,'AN','.hm','AUD',' ','','','','','',1,NULL,'2019-11-30 05:55:16'),
(98,'HN',NULL,NULL,'HND',340,'HO','Honduras','Honduras','Tegucigalpa',112090,7989415,'NA','.hn','HNL','504','@@####','^([A-Z]{2}d{4})$','es-HN','GT,NI,SV','',1,NULL,'2019-11-30 05:55:19'),
(99,'HR',NULL,NULL,'HRV',191,'HR','Hrvatska','Croatia','Zagreb',56542,4491000,'EU','.hr','HRK','385','#####','^(?:HR)*(d{5})$','hr-HR,sr','HU,SI,BA,ME,RS','',1,NULL,'2019-11-30 05:55:22'),
(100,'HT',NULL,NULL,'HTI',332,'HA','HaÃ¯ti','Haiti','Port-au-Prince',27750,9648924,'NA','.ht','HTG','509','HT####','^(?:HT)*(d{4})$','ht,fr-HT','DO','',1,NULL,'2019-11-30 05:55:28'),
(101,'HU',NULL,NULL,'HUN',348,'HU','MagyarorszÃ¡g','Hungary','Budapest',93030,9982000,'EU','.hu','HUF','36','####','^(d{4})$','hu-HU','SK,SI,RO,UA,HR,AT,RS','',1,NULL,'2019-11-30 05:55:33'),
(102,'ID',NULL,NULL,'IDN',360,'ID','Indonesia','Indonesia','Jakarta',1919440,242968342,'AS','.id','IDR','62','#####','^(d{5})$','id,en,nl,jv','PG,TL,MY','',1,NULL,'2019-11-30 05:55:36'),
(103,'IE',NULL,NULL,'IRL',372,'EI','Ireland','Ireland','Dublin',70280,4622917,'EU','.ie','EUR','353','','','en-IE,ga-IE','GB','',1,NULL,'2019-11-30 05:55:38'),
(104,'IL',NULL,NULL,'ISR',376,'IS','YiÅ›rÄ\'Ä“l','Israel','Jerusalem',20770,7353985,'AS','.il','ILS','972','#####','^(d{5})$','he,ar-IL,en-IL,','SY,JO,LB,EG,PS','',1,NULL,'2019-11-30 05:55:41'),
(105,'IM',NULL,NULL,'IMN',833,'IM','Isle of Man','Isle of Man','Douglas, Isle of Man',572,75049,'EU','.im','GBP','+44-1624','@# #@@|@## #@@|@@# #@@|@@## #@@|@#@ #@@|@@#@ #@@|G','^(([A-Z]d{2}[A-Z]{2})|([A-Z]d{3}[A-Z]{2})|([A-Z]{2}d{2}[A-Z]{2})|([A-Z]{2}d{3}[A-Z]{2})|([A-Z]d[A-Z]d[A-Z]{2})|([A-Z]{2}d[A-Z]d[A-Z]{2})|(GIR0AA))$','en,gv','','',1,NULL,'2019-11-30 05:55:45'),
(106,'IN',NULL,NULL,'IND',356,'IN','Bharat','India','New Delhi',3287590,1173108018,'AS','.in','INR','91','######','^(d{6})$','en-IN,hi,bn,te,mr,ta,ur,gu,kn,ml,or,pa,as,bh,sat,k','CN,NP,MM,BT,PK,BD','',1,NULL,'2019-11-30 05:55:48'),
(107,'IO',NULL,NULL,'IOT',86,'IO','British Indian Ocean Territory','British Indian Ocean Territory','Diego Garcia',60,4000,'AS','.io','USD','246','','','en-IO','','',1,NULL,'2019-11-30 05:55:50'),
(108,'IQ',NULL,NULL,'IRQ',368,'IZ','al-Ê¿IrÄq','Iraq','Baghdad',437072,29671605,'AS','.iq','IQD','964','#####','^(d{5})$','ar-IQ,ku,hy','SY,SA,IR,JO,TR,KW','',1,NULL,'2019-11-30 05:55:54'),
(109,'IR',NULL,NULL,'IRN',364,'IR','ÄªrÄn','Iran','Tehran',1648000,76923300,'AS','.ir','IRR','98','##########','^(d{10})$','fa-IR,ku','TM,AF,IQ,AM,PK,AZ,TR','',1,NULL,'2019-11-30 05:55:56'),
(110,'IS',NULL,NULL,'ISL',352,'IC','Ãsland','Iceland','Reykjavik',103000,308910,'EU','.is','ISK','354','###','^(d{3})$','is,en,de,da,sv,no','','',1,NULL,'2019-11-30 05:55:59'),
(111,'IT',NULL,NULL,'ITA',380,'IT','Italia','Italy','Rome',301230,60340328,'EU','.it','EUR','39','#####','^(d{5})$','it-IT,en,de-IT,fr-IT,sc,ca,co,sl','CH,VA,SI,SM,FR,AT','',1,NULL,'2019-11-30 05:56:06'),
(112,'JE',NULL,NULL,'JEY',832,'JE','Jersey','Jersey','Saint Helier',116,90812,'EU','.je','GBP','+44-1534','@# #@@|@## #@@|@@# #@@|@@## #@@|@#@ #@@|@@#@ #@@|G','^(([A-Z]d{2}[A-Z]{2})|([A-Z]d{3}[A-Z]{2})|([A-Z]{2}d{2}[A-Z]{2})|([A-Z]{2}d{3}[A-Z]{2})|([A-Z]d[A-Z]d[A-Z]{2})|([A-Z]{2}d[A-Z]d[A-Z]{2})|(GIR0AA))$','en,pt','','',1,NULL,'2019-11-30 05:56:09'),
(113,'JM',NULL,NULL,'JAM',388,'JM','Jamaica','Jamaica','Kingston',10991,2847232,'NA','.jm','JMD','+1-876','','','en-JM','','',1,NULL,'2019-11-30 05:56:11'),
(114,'JO',NULL,NULL,'JOR',400,'JO','al-Urdun','Jordan','Amman',92300,6407085,'AS','.jo','JOD','962','#####','^(d{5})$','ar-JO,en','SY,SA,IQ,IL,PS','',1,NULL,'2019-11-30 05:56:14'),
(115,'JP',NULL,NULL,'JPN',392,'JA','Nihon','Japan','Tokyo',377835,127288000,'AS','.jp','JPY','81','###-####','^(d{7})$','ja','','',1,NULL,'2019-11-30 05:56:17'),
(116,'KE',NULL,NULL,'KEN',404,'KE','Kenya','Kenya','Nairobi',582650,40046566,'AF','.ke','KES','254','#####','^(d{5})$','en-KE,sw-KE','ET,TZ,SS,SO,UG','',1,NULL,'2019-11-30 05:56:20'),
(117,'KG',NULL,NULL,'KGZ',417,'KG','Kyrgyzstan','Kyrgyzstan','Bishkek',198500,5508626,'AS','.kg','KGS','996','######','^(d{6})$','ky,uz,ru','CN,TJ,UZ,KZ','',1,NULL,'2019-11-30 05:56:23'),
(118,'KH',NULL,NULL,'KHM',116,'CB','KambucÄ','Cambodia','Phnom Penh',181040,14453680,'AS','.kh','KHR','855','#####','^(d{5})$','km,fr,en','LA,TH,VN','',1,NULL,'2019-11-30 05:56:25'),
(119,'KI',NULL,NULL,'KIR',296,'KR','Kiribati','Kiribati','Tarawa',811,92533,'OC','.ki','AUD','686','','','en-KI,gil','','',1,NULL,'2019-11-30 05:56:27'),
(120,'KM',NULL,NULL,'COM',174,'CN','Comores','Comoros','Moroni',2170,773407,'AF','.km','KMF','269','','','ar,fr-KM','','',1,NULL,'2019-11-30 05:56:30'),
(121,'KN',NULL,NULL,'KNA',659,'SC','Saint Kitts and Nevis','Saint Kitts and Nevis','Basseterre',261,51134,'NA','.kn','XCD','+1-869','','','en-KN','','',1,NULL,'2019-11-30 05:56:35'),
(122,'KP',NULL,NULL,'PRK',408,'KN','Joseon','North Korea','Pyongyang',120540,22912177,'AS','.kp','KPW','850','###-###','^(d{6})$','ko-KP','CN,KR,RU','',1,NULL,'2019-11-30 05:56:37'),
(123,'KR',NULL,NULL,'KOR',410,'KS','Hanguk','South Korea','Seoul',98480,48422644,'AS','.kr','KRW','82','SEOUL ###-###','^(?:SEOUL)*(d{6})$','ko-KR,en','KP','',1,NULL,'2019-11-30 05:56:40'),
(124,'KW',NULL,NULL,'KWT',414,'KU','al-Kuwayt','Kuwait','Kuwait City',17820,2789132,'AS','.kw','KWD','965','#####','^(d{5})$','ar-KW,en','SA,IQ','',1,NULL,'2019-11-30 05:56:42'),
(125,'KY',NULL,NULL,'CYM',136,'CJ','Cayman Islands','Cayman Islands','George Town',262,44270,'NA','.ky','KYD','+1-345','','','en-KY','','',1,NULL,'2019-11-30 05:56:45'),
(126,'KZ',NULL,NULL,'KAZ',398,'KZ','Ä¶azaÄ·stan','Kazakhstan','Astana',2717300,15340000,'AS','.kz','KZT','7','######','^(d{6})$','kk,ru','TM,CN,KG,UZ,RU','',1,NULL,'2019-11-30 05:56:48'),
(127,'LA',NULL,NULL,'LAO',418,'LA','LÄw','Laos','Vientiane',236800,6368162,'AS','.la','LAK','856','#####','^(d{5})$','lo,fr,en','CN,MM,KH,TH,VN','',1,NULL,'2019-11-30 05:56:50'),
(128,'LB',NULL,NULL,'LBN',422,'LE','LubnÄn','Lebanon','Beirut',10400,4125247,'AS','.lb','LBP','961','#### ####|####','^(d{4}(d{4})?)$','ar-LB,fr-LB,en,hy','SY,IL','',1,NULL,'2019-11-30 05:56:52'),
(129,'LC',NULL,NULL,'LCA',662,'ST','Saint Lucia','Saint Lucia','Castries',616,160922,'NA','.lc','XCD','+1-758','','','en-LC','','',1,NULL,'2019-11-30 05:56:55'),
(130,'LI',NULL,NULL,'LIE',438,'LS','Liechtenstein','Liechtenstein','Vaduz',160,35000,'EU','.li','CHF','423','####','^(d{4})$','de-LI','CH,AT','',1,NULL,'2019-11-30 05:56:57'),
(131,'LK',NULL,NULL,'LKA',144,'CE','Å rÄ« Laá¹kÄ','Sri Lanka','Colombo',65610,21513990,'AS','.lk','LKR','94','#####','^(d{5})$','si,ta,en','','',1,NULL,'2019-11-30 05:57:11'),
(132,'LR',NULL,NULL,'LBR',430,'LI','Liberia','Liberia','Monrovia',111370,3685076,'AF','.lr','LRD','231','####','^(d{4})$','en-LR','SL,CI,GN','',1,NULL,'2019-11-30 05:57:14'),
(133,'LS',NULL,NULL,'LSO',426,'LT','Lesotho','Lesotho','Maseru',30355,1919552,'AF','.ls','LSL','266','###','^(d{3})$','en-LS,st,zu,xh','ZA','',1,NULL,'2019-11-30 05:57:17'),
(134,'LT',NULL,NULL,'LTU',440,'LH','Lietuva','Lithuania','Vilnius',65200,2944459,'EU','.lt','EUR','370','LT-#####','^(?:LT)*(d{5})$','lt,ru,pl','PL,BY,RU,LV','',1,NULL,'2019-11-30 05:57:19'),
(135,'LU',NULL,NULL,'LUX',442,'LU','LÃ«tzebuerg','Luxembourg','Luxembourg',2586,497538,'EU','.lu','EUR','352','L-####','^(d{4})$','lb,de-LU,fr-LU','DE,BE,FR','',1,NULL,'2019-11-30 05:57:21'),
(136,'LV',NULL,NULL,'LVA',428,'LG','Latvija','Latvia','Riga',64589,2217969,'EU','.lv','EUR','371','LV-####','^(?:LV)*(d{4})$','lv,ru,lt','LT,EE,BY,RU','',1,NULL,'2019-11-30 05:57:24'),
(137,'LY',NULL,NULL,'LBY',434,'LY','LÄ«biyÄ','Libya','Tripolis',1759540,6461454,'AF','.ly','LYD','218','','','ar-LY,it,en','TD,NE,DZ,SD,TN,EG','',1,NULL,'2019-11-30 05:57:26'),
(138,'MA',NULL,NULL,'MAR',504,'MO','Maroc','Morocco','Rabat',446550,31627428,'AF','.ma','MAD','212','#####','^(d{5})$','ar-MA,fr','DZ,EH,ES','',1,NULL,'2019-11-30 05:57:36'),
(139,'MC',NULL,NULL,'MCO',492,'MN','Monaco','Monaco','Monaco',2,32965,'EU','.mc','EUR','377','#####','^(d{5})$','fr-MC,en,it','FR','',1,NULL,'2019-11-30 05:57:39'),
(140,'MD',NULL,NULL,'MDA',498,'MD','Moldova','Moldova','Chisinau',33843,4324000,'EU','.md','MDL','373','MD-####','^(?:MD)*(d{4})$','ro,ru,gag,tr','RO,UA','',1,NULL,'2019-11-30 05:57:41'),
(141,'ME',NULL,NULL,'MNE',499,'MJ','Crna Gora','Montenegro','Podgorica',14026,666730,'EU','.me','EUR','382','#####','^(d{5})$','sr,hu,bs,sq,hr,rom','AL,HR,BA,RS,XK','',1,NULL,'2019-11-30 05:57:46'),
(142,'MF',NULL,NULL,'MAF',663,'RN','Saint Martin','Saint Martin','Marigot',53,35925,'NA','.gp','EUR','590','### ###','','fr','SX','',1,NULL,'2019-11-30 05:57:49'),
(143,'MG',NULL,NULL,'MDG',450,'MA','Madagascar','Madagascar','Antananarivo',587040,21281844,'AF','.mg','MGA','261','###','^(d{3})$','fr-MG,mg','','',1,NULL,'2019-11-30 05:57:51'),
(144,'MH',NULL,NULL,'MHL',584,'RM','Marshall Islands','Marshall Islands','Majuro',181,65859,'OC','.mh','USD','692','','','mh,en-MH','','',1,NULL,'2019-11-30 05:57:54'),
(145,'MK',NULL,NULL,'MKD',807,'MK','Makedonija','Macedonia','Skopje',25333,2062294,'EU','.mk','MKD','389','####','^(d{4})$','mk,sq,tr,rmm,sr','AL,GR,BG,RS,XK','',1,NULL,'2019-11-30 05:57:57'),
(146,'ML',NULL,NULL,'MLI',466,'ML','Mali','Mali','Bamako',1240000,13796354,'AF','.ml','XOF','223','','','fr-ML,bm','SN,NE,DZ,CI,GN,MR,BF','',1,NULL,'2019-11-30 05:58:00'),
(147,'MM',NULL,NULL,'MMR',104,'BM','MáºanmÄ','Myanmar','Nay Pyi Taw',678500,53414374,'AS','.mm','MMK','95','#####','^(d{5})$','my','CN,LA,TH,BD,IN','',1,NULL,'2019-11-30 05:58:02'),
(148,'MN',NULL,NULL,'MNG',496,'MG','Mongol Uls','Mongolia','Ulan Bator',1565000,3086918,'AS','.mn','MNT','976','######','^(d{6})$','mn,ru','CN,RU','',1,NULL,'2019-11-30 05:58:05'),
(149,'MO',NULL,NULL,'MAC',446,'MC','NgoumÃºn','Macao','Macao',254,449198,'AS','.mo','MOP','853','','','zh,zh-MO,pt','','',1,NULL,'2019-11-30 05:58:08'),
(150,'MP',NULL,NULL,'MNP',580,'CQ','Northern Mariana Islands','Northern Mariana Islands','Saipan',477,53883,'OC','.mp','USD','+1-670','','','fil,tl,zh,ch-MP,en-MP','','',1,NULL,'2019-11-30 05:58:11'),
(151,'MQ',NULL,NULL,'MTQ',474,'MB','Martinique','Martinique','Fort-de-France',1100,432900,'NA','.mq','EUR','596','#####','^(d{5})$','fr-MQ','','',1,NULL,'2019-11-30 05:58:17'),
(152,'MR',NULL,NULL,'MRT',478,'MR','Mauritanie','Mauritania','Nouakchott',1030700,3205060,'AF','.mr','MRO','222','','','ar-MR,fuc,snk,fr,mey,wo','SN,DZ,EH,ML','',1,NULL,'2019-11-30 05:58:20'),
(153,'MS',NULL,NULL,'MSR',500,'MH','Montserrat','Montserrat','Plymouth',102,9341,'NA','.ms','XCD','+1-664','','','en-MS','','',1,NULL,'2019-11-30 05:58:22'),
(154,'MT',NULL,NULL,'MLT',470,'MT','Malta','Malta','Valletta',316,403000,'EU','.mt','EUR','356','@@@ ###|@@@ ##','^([A-Z]{3}d{2}d?)$','mt,en-MT','','',1,NULL,'2019-11-30 05:58:26'),
(155,'MU',NULL,NULL,'MUS',480,'MP','Mauritius','Mauritius','Port Louis',2040,1294104,'AF','.mu','MUR','230','','','en-MU,bho,fr','','',1,NULL,'2019-11-30 05:58:29'),
(156,'MV',NULL,NULL,'MDV',462,'MV','Dhivehi','Maldives','Male',300,395650,'AS','.mv','MVR','960','#####','^(d{5})$','dv,en','','',1,NULL,'2019-11-30 05:58:32'),
(157,'MW',NULL,NULL,'MWI',454,'MI','Malawi','Malawi','Lilongwe',118480,15447500,'AF','.mw','MWK','265','','','ny,yao,tum,swk','TZ,MZ,ZM','',1,NULL,'2019-11-30 05:58:34'),
(158,'MX',NULL,NULL,'MEX',484,'MX','MÃ©xico','Mexico','Mexico City',1972550,112468855,'NA','.mx','MXN','52','#####','^(d{5})$','es-MX','GT,US,BZ','',1,NULL,'2019-11-30 05:58:37'),
(159,'MY',NULL,NULL,'MYS',458,'MY','Malaysia','Malaysia','Kuala Lumpur',329750,28274729,'AS','.my','MYR','60','#####','^(d{5})$','ms-MY,en,zh,ta,te,ml,pa,th','BN,TH,ID','',1,NULL,'2019-11-30 05:58:39'),
(160,'MZ',NULL,NULL,'MOZ',508,'MZ','MoÃ§ambique','Mozambique','Maputo',801590,22061451,'AF','.mz','MZN','258','####','^(d{4})$','pt-MZ,vmw','ZW,TZ,SZ,ZA,ZM,MW','',1,NULL,'2019-11-30 05:58:46'),
(161,'NA',NULL,NULL,'NAM',516,'WA','Namibia','Namibia','Windhoek',825418,2128471,'AF','.na','NAD','264','','','en-NA,af,de,hz,naq','ZA,BW,ZM,AO','',1,NULL,'2019-11-30 05:58:50'),
(162,'NC',NULL,NULL,'NCL',540,'NC','Nouvelle CalÃ©donie','New Caledonia','Noumea',19060,216494,'OC','.nc','XPF','687','#####','^(d{5})$','fr-NC','','',1,NULL,'2019-11-30 05:58:52'),
(163,'NE',NULL,NULL,'NER',562,'NG','Niger','Niger','Niamey',1267000,15878271,'AF','.ne','XOF','227','####','^(d{4})$','fr-NE,ha,kr,dje','TD,BJ,DZ,LY,BF,NG,ML','',1,NULL,'2019-11-30 05:58:56'),
(164,'NF',NULL,NULL,'NFK',574,'NF','Norfolk Island','Norfolk Island','Kingston',35,1828,'OC','.nf','AUD','672','####','^(d{4})$','en-NF','','',1,NULL,'2019-11-30 05:59:03'),
(165,'NG',NULL,NULL,'NGA',566,'NI','Nigeria','Nigeria','Abuja',923768,154000000,'AF','.ng','NGN','234','######','^(d{6})$','en-NG,ha,yo,ig,ff','TD,NE,BJ,CM','',1,NULL,'2019-11-30 05:59:06'),
(166,'NI',NULL,NULL,'NIC',558,'NU','Nicaragua','Nicaragua','Managua',129494,5995928,'NA','.ni','NIO','505','###-###-#','^(d{7})$','es-NI,en','CR,HN','',1,NULL,'2019-11-30 05:59:08'),
(167,'NL',NULL,NULL,'NLD',528,'NL','Nederland','Netherlands','Amsterdam',41526,16645000,'EU','.nl','EUR','31','#### @@','^(d{4}[A-Z]{2})$','nl-NL,fy-NL','DE,BE','',1,NULL,'2019-11-30 05:59:10'),
(168,'NO',NULL,NULL,'NOR',578,'NO','Norge (Noreg)','Norway','Oslo',324220,5009150,'EU','.no','NOK','47','####','^(d{4})$','no,nb,nn,se,fi','FI,RU,SE','',1,NULL,'2019-11-30 05:59:14'),
(169,'NP',NULL,NULL,'NPL',524,'NP','NÄ“pÄl','Nepal','Kathmandu',140800,28951852,'AS','.np','NPR','977','#####','^(d{5})$','ne,en','CN,IN','',1,NULL,'2019-11-30 05:59:17'),
(170,'NR',NULL,NULL,'NRU',520,'NR','Naoero','Nauru','Yaren',21,10065,'OC','.nr','AUD','674','','','na,en-NR','','',1,NULL,'2019-11-30 05:59:19'),
(171,'NU',NULL,NULL,'NIU',570,'NE','Niue','Niue','Alofi',260,2166,'OC','.nu','NZD','683','','','niu,en-NU','','',1,NULL,'2019-11-30 05:59:24'),
(172,'NZ',NULL,NULL,'NZL',554,'NZ','New Zealand','New Zealand','Wellington',268680,4252277,'OC','.nz','NZD','64','####','^(d{4})$','en-NZ,mi','','',1,NULL,'2019-11-30 05:59:26'),
(173,'OM',NULL,NULL,'OMN',512,'MU','Ê¿UmÄn','Oman','Muscat',212460,2967717,'AS','.om','OMR','968','###','^(d{3})$','ar-OM,en,bal,ur','SA,YE,AE','',1,NULL,'2019-11-30 05:59:29'),
(174,'PA',NULL,NULL,'PAN',591,'PM','PanamÃ¡','Panama','Panama City',78200,3410676,'NA','.pa','PAB','507','','','es-PA,en','CR,CO','',1,NULL,'2019-11-30 05:59:31'),
(175,'PE',NULL,NULL,'PER',604,'PE','PerÃº','Peru','Lima',1285220,29907003,'SA','.pe','PEN','51','','','es-PE,qu,ay','EC,CL,BO,BR,CO','',1,NULL,'2019-11-30 05:59:35'),
(176,'PF',NULL,NULL,'PYF',258,'FP','PolinÃ©sie FranÃ§aise','French Polynesia','Papeete',4167,270485,'OC','.pf','XPF','689','#####','^((97|98)7d{2})$','fr-PF,ty','','',1,NULL,'2019-11-30 05:59:37'),
(177,'PG',NULL,NULL,'PNG',598,'PP','Papua New Guinea','Papua New Guinea','Port Moresby',462840,6064515,'OC','.pg','PGK','675','###','^(d{3})$','en-PG,ho,meu,tpi','ID','',1,NULL,'2019-11-30 05:59:40'),
(178,'PH',NULL,NULL,'PHL',608,'RP','Pilipinas','Philippines','Manila',300000,99900177,'AS','.ph','PHP','63','####','^(d{4})$','tl,en-PH,fil','','',1,NULL,'2019-11-30 05:59:43'),
(179,'PK',NULL,NULL,'PAK',586,'PK','PÄkistÄn','Pakistan','Islamabad',803940,184404791,'AS','.pk','PKR','92','#####','^(d{5})$','ur-PK,en-PK,pa,sd,ps,brh','CN,AF,IR,IN','',1,NULL,'2019-11-30 05:59:45'),
(180,'PL',NULL,NULL,'POL',616,'PL','Polska','Poland','Warsaw',312685,38500000,'EU','.pl','PLN','48','##-###','^(d{5})$','pl','DE,LT,SK,CZ,BY,UA,RU','',1,NULL,'2019-11-30 05:59:47'),
(181,'PM',NULL,NULL,'SPM',666,'SB','Saint Pierre and Miquelon','Saint Pierre and Miquelon','Saint-Pierre',242,7012,'NA','.pm','EUR','508','#####','^(97500)$','fr-PM','','',1,NULL,'2019-11-30 05:59:52'),
(182,'PN',NULL,NULL,'PCN',612,'PC','Pitcairn','Pitcairn','Adamstown',47,46,'OC','.pn','NZD','870','','','en-PN','','',1,NULL,'2019-11-30 05:59:55'),
(183,'PR',NULL,NULL,'PRI',630,'RQ','Puerto Rico','Puerto Rico','San Juan',9104,3916632,'NA','.pr','USD','+1-787/1-939','#####-####','^(d{9})$','en-PR,es-PR','','',1,NULL,'2019-11-30 05:59:58'),
(184,'PS',NULL,NULL,'PSE',275,'WE','Filasá¹­Ä«n','Palestinian Territory','East Jerusalem',5970,3800000,'AS','.ps','ILS','970','','','ar-PS','JO,IL,EG','',1,NULL,'2019-11-30 06:00:00'),
(185,'PT',NULL,NULL,'PRT',620,'PO','Portugal','Portugal','Lisbon',92391,10676000,'EU','.pt','EUR','351','####-###','^(d{7})$','pt-PT,mwl','ES','',1,NULL,'2019-11-30 06:00:02'),
(186,'PW',NULL,NULL,'PLW',585,'PS','Palau','Palau','Melekeok',458,19907,'OC','.pw','USD','680','96940','^(96940)$','pau,sov,en-PW,tox,ja,fil,zh','','',1,NULL,'2019-11-30 06:00:04'),
(187,'PY',NULL,NULL,'PRY',600,'PA','Paraguay','Paraguay','Asuncion',406750,6375830,'SA','.py','PYG','595','####','^(d{4})$','es-PY,gn','BO,BR,AR','',1,NULL,'2019-11-30 06:00:07'),
(188,'QA',NULL,NULL,'QAT',634,'QA','Qaá¹­ar','Qatar','Doha',11437,840926,'AS','.qa','QAR','974','','','ar-QA,es','SA','',1,NULL,'2019-11-30 06:00:11'),
(189,'RE',NULL,NULL,'REU',638,'RE','RÃ©union','Reunion','Saint-Denis',2517,776948,'AF','.re','EUR','262','#####','^((97|98)(4|7|8)d{2})$','fr-RE','','',1,NULL,'2019-11-30 06:00:14'),
(190,'RO',NULL,NULL,'ROU',642,'RO','RomÃ¢nia','Romania','Bucharest',237500,21959278,'EU','.ro','RON','40','######','^(d{6})$','ro,hu,rom','MD,HU,UA,BG,RS','',1,NULL,'2019-11-30 06:00:17'),
(191,'RS',NULL,NULL,'SRB',688,'RI','Srbija','Serbia','Belgrade',88361,7344847,'EU','.rs','RSD','381','######','^(d{6})$','sr,hu,bs,rom','AL,HU,MK,RO,HR,BA,BG,ME,XK','',1,NULL,'2019-11-30 06:00:23'),
(192,'RU',NULL,NULL,'RUS',643,'RS','Rossija','Russia','Moscow',17100000,140702000,'EU','.ru','RUB','7','######','^(d{6})$','ru,tt,xal,cau,ady,kv,ce,tyv,cv,udm,tut,mns,bua,myv','GE,CN,BY,UA,KZ,LV,PL,EE,LT,FI,MN,NO,AZ,KP','',1,NULL,'2019-11-30 06:00:25'),
(193,'RW',NULL,NULL,'RWA',646,'RW','Rwanda','Rwanda','Kigali',26338,11055976,'AF','.rw','RWF','250','','','rw,en-RW,fr-RW,sw','TZ,CD,BI,UG','',1,NULL,'2019-11-30 06:00:28'),
(194,'SA',NULL,NULL,'SAU',682,'SA','as-SaÊ¿Å«dÄ«yÃ¢','Saudi Arabia','Riyadh',1960582,25731776,'AS','.sa','SAR','966','#####','^(d{5})$','ar-SA','QA,OM,IQ,YE,JO,AE,KW','',1,NULL,'2019-11-30 06:00:31'),
(195,'SB',NULL,NULL,'SLB',90,'BP','Solomon Islands','Solomon Islands','Honiara',28450,559198,'OC','.sb','SBD','677','','','en-SB,tpi','','',1,NULL,'2019-11-30 06:00:34'),
(196,'SC',NULL,NULL,'SYC',690,'SE','Seychelles','Seychelles','Victoria',455,88340,'AF','.sc','SCR','248','','','en-SC,fr-SC','','',1,NULL,'2019-11-30 06:00:36'),
(197,'SD',NULL,NULL,'SDN',729,'SU','Sudan','Sudan','Khartoum',1861484,35000000,'AF','.sd','SDG','249','#####','^(d{5})$','ar-SD,en,fia','SS,TD,EG,ET,ER,LY,CF','',1,NULL,'2019-11-30 06:00:39'),
(198,'SE',NULL,NULL,'SWE',752,'SW','Sverige','Sweden','Stockholm',449964,9555893,'EU','.se','SEK','46','### ##','^(?:SE)*(d{5})$','sv-SE,se,sma,fi-SE','NO,FI','',1,NULL,'2019-11-30 06:00:42'),
(199,'SG',NULL,NULL,'SGP',702,'SN','xÄ«njiÄpÅ','Singapore','Singapur',693,4701069,'AS','.sg','SGD','65','######','^(d{6})$','cmn,en-SG,ms-SG,ta-SG,zh-SG','','',1,NULL,'2019-11-30 06:00:44'),
(200,'SH',NULL,NULL,'SHN',654,'SH','Saint Helena','Saint Helena','Jamestown',410,7460,'AF','.sh','SHP','290','STHL 1ZZ','^(STHL1ZZ)$','en-SH','','',1,NULL,'2019-11-30 06:00:47'),
(201,'SI',NULL,NULL,'SVN',705,'SI','Slovenija','Slovenia','Ljubljana',20273,2007000,'EU','.si','EUR','386','####','^(?:SI)*(d{4})$','sl,sh','HU,IT,HR,AT','',1,NULL,'2019-11-30 06:00:52'),
(202,'SJ',NULL,NULL,'SJM',744,'SV','Svalbard and Jan Mayen','Svalbard and Jan Mayen','Longyearbyen',62049,2550,'EU','.sj','NOK','47','','','no,ru','','',1,NULL,'2019-11-30 06:00:55'),
(203,'SK',NULL,NULL,'SVK',703,'LO','Slovensko','Slovakia','Bratislava',48845,5455000,'EU','.sk','EUR','421','### ##','^(d{5})$','sk,hu','PL,HU,CZ,UA,AT','',1,NULL,'2019-11-30 06:00:57'),
(204,'SL',NULL,NULL,'SLE',694,'SL','Sierra Leone','Sierra Leone','Freetown',71740,5245695,'AF','.sl','SLL','232','','','en-SL,men,tem','LR,GN','',1,NULL,'2019-11-30 06:01:00'),
(205,'SM',NULL,NULL,'SMR',674,'SM','San Marino','San Marino','San Marino',61,31477,'EU','.sm','EUR','378','4789#','^(4789d)$','it-SM','IT','',1,NULL,'2019-11-30 06:01:02'),
(206,'SN',NULL,NULL,'SEN',686,'SG','SÃ©nÃ©gal','Senegal','Dakar',196190,12323252,'AF','.sn','XOF','221','#####','^(d{5})$','fr-SN,wo,fuc,mnk','GN,MR,GW,GM,ML','',1,NULL,'2019-11-30 06:01:06'),
(207,'SO',NULL,NULL,'SOM',706,'SO','Soomaaliya','Somalia','Mogadishu',637657,10112453,'AF','.so','SOS','252','@@  #####','^([A-Z]{2}d{5})$','so-SO,ar-SO,it,en-SO','ET,KE,DJ','',1,NULL,'2019-11-30 06:01:08'),
(208,'SR',NULL,NULL,'SUR',740,'NS','Suriname','Suriname','Paramaribo',163270,492829,'SA','.sr','SRD','597','','','nl-SR,en,srn,hns,jv','GY,BR,GF','',1,NULL,'2019-11-30 06:01:10'),
(209,'SS',NULL,NULL,'SSD',728,'OD','South Sudan','South Sudan','Juba',644329,8260490,'AF','','SSP','211','','','en','CD,CF,ET,KE,SD,UG,','',1,NULL,'2019-11-30 06:01:13'),
(210,'ST',NULL,NULL,'STP',678,'TP','SÃ£o TomÃ© e PrÃ­ncipe','Sao Tome and Principe','Sao Tome',1001,175808,'AF','.st','STD','239','','','pt-ST','','',1,NULL,'2019-11-30 06:01:15'),
(211,'SV',NULL,NULL,'SLV',222,'ES','El Salvador','El Salvador','San Salvador',21040,6052064,'NA','.sv','USD','503','CP ####','^(?:CP)*(d{4})$','es-SV','GT,HN','',1,NULL,'2019-11-30 06:01:24'),
(212,'SX',NULL,NULL,'SXM',534,'NN','Sint Maarten','Sint Maarten','Philipsburg',21,37429,'NA','.sx','ANG','599','','','nl,en','MF','',1,NULL,'2019-11-30 06:01:27'),
(213,'SY',NULL,NULL,'SYR',760,'SY','SÅ«rÄ«yÃ¢','Syria','Damascus',185180,22198110,'AS','.sy','SYP','963','','','ar-SY,ku,hy,arc,fr,en','IQ,JO,IL,TR,LB','',1,NULL,'2019-11-30 06:01:29'),
(214,'SZ',NULL,NULL,'SWZ',748,'WZ','Swaziland','Swaziland','Mbabane',17363,1354051,'AF','.sz','SZL','268','@###','^([A-Z]d{3})$','en-SZ,ss-SZ','ZA,MZ','',1,NULL,'2019-11-30 06:01:32'),
(215,'TC',NULL,NULL,'TCA',796,'TK','Turks and Caicos Islands','Turks and Caicos Islands','Cockburn Town',430,20556,'NA','.tc','USD','+1-649','TKCA 1ZZ','^(TKCA 1ZZ)$','en-TC','','',1,NULL,'2019-11-30 06:01:34'),
(216,'TD',NULL,NULL,'TCD',148,'CD','Tchad','Chad','N\'Djamena',1284000,10543464,'AF','.td','XAF','235','','','fr-TD,ar-TD,sre','NE,LY,CF,SD,CM,NG','',1,NULL,'2019-11-30 06:01:37'),
(217,'TF',NULL,NULL,'ATF',260,'FS','French Southern Territories','French Southern Territories','Port-aux-Francais',7829,140,'AN','.tf','EUR','','','','fr','','',1,NULL,'2019-11-30 06:01:40'),
(218,'TG',NULL,NULL,'TGO',768,'TO','Togo','Togo','Lome',56785,6587239,'AF','.tg','XOF','228','','','fr-TG,ee,hna,kbp,dag,ha','BJ,GH,BF','',1,NULL,'2019-11-30 06:01:43'),
(219,'TH',NULL,NULL,'THA',764,'TH','PrathÄ“t tai','Thailand','Bangkok',514000,67089500,'AS','.th','THB','66','#####','^(d{5})$','th,en','LA,MM,KH,MY','',1,NULL,'2019-11-30 06:01:46'),
(220,'TJ',NULL,NULL,'TJK',762,'TI','Tojikiston','Tajikistan','Dushanbe',143100,7487489,'AS','.tj','TJS','992','######','^(d{6})$','tg,ru','CN,AF,KG,UZ','',1,NULL,'2019-11-30 06:01:48'),
(221,'TK',NULL,NULL,'TKL',772,'TL','Tokelau','Tokelau','',10,1466,'OC','.tk','NZD','690','','','tkl,en-TK','','',1,NULL,'2019-11-30 06:01:52'),
(222,'TL',NULL,NULL,'TLS',626,'TT','TimÃ³r Lorosa\'e','East Timor','Dili',15007,1154625,'OC','.tl','USD','670','','','tet,pt-TL,id,en','ID','',1,NULL,'2019-11-30 06:01:54'),
(223,'TM',NULL,NULL,'TKM',795,'TX','Turkmenistan','Turkmenistan','Ashgabat',488100,4940916,'AS','.tm','TMT','993','######','^(d{6})$','tk,ru,uz','AF,IR,UZ,KZ','',1,NULL,'2019-11-30 06:01:57'),
(224,'TN',NULL,NULL,'TUN',788,'TS','Tunisie','Tunisia','Tunis',163610,10589025,'AF','.tn','TND','216','####','^(d{4})$','ar-TN,fr','DZ,LY','',1,NULL,'2019-11-30 06:01:59'),
(225,'TO',NULL,NULL,'TON',776,'TN','Tonga','Tonga','Nuku\'alofa',748,122580,'OC','.to','TOP','676','','','to,en-TO','','',1,NULL,'2019-11-30 06:02:02'),
(226,'TR',NULL,NULL,'TUR',792,'TU','TÃ¼rkiye','Turkey','Ankara',780580,77804122,'AS','.tr','TRY','90','#####','^(d{5})$','tr-TR,ku,diq,az,av','SY,GE,IQ,IR,GR,AM,AZ,BG','',1,NULL,'2019-11-30 06:02:05'),
(227,'TT',NULL,NULL,'TTO',780,'TD','Trinidad and Tobago','Trinidad and Tobago','Port of Spain',5128,1228691,'NA','.tt','TTD','+1-868','','','en-TT,hns,fr,es,zh','','',1,NULL,'2019-11-30 06:02:07'),
(228,'TV',NULL,NULL,'TUV',798,'TV','Tuvalu','Tuvalu','Funafuti',26,10472,'OC','.tv','AUD','688','','','tvl,en,sm,gil','','',1,NULL,'2019-11-30 06:02:10'),
(229,'TW',NULL,NULL,'TWN',158,'TW','T\'ai2-wan1','Taiwan','Taipei',35980,22894384,'AS','.tw','TWD','886','#####','^(d{5})$','zh-TW,zh,nan,hak','','',1,NULL,'2019-11-30 06:02:12'),
(230,'TZ',NULL,NULL,'TZA',834,'TZ','Tanzania','Tanzania','Dodoma',945087,41892895,'AF','.tz','TZS','255','','','sw-TZ,en,ar','MZ,KE,CD,RW,ZM,BI,UG,MW','',1,NULL,'2019-11-30 06:02:15'),
(231,'UA',NULL,NULL,'UKR',804,'UP','Ukrajina','Ukraine','Kiev',603700,45415596,'EU','.ua','UAH','380','#####','^(d{5})$','uk,ru-UA,rom,pl,hu','PL,MD,HU,SK,BY,RO,RU','',1,NULL,'2019-11-30 06:02:24'),
(232,'UG',NULL,NULL,'UGA',800,'UG','Uganda','Uganda','Kampala',236040,33398682,'AF','.ug','UGX','256','','','en-UG,lg,sw,ar','TZ,KE,SS,CD,RW','',1,NULL,'2019-11-30 06:02:26'),
(233,'UK',NULL,NULL,'GBR',826,'UK','United Kingdom','United Kingdom','London',244820,62348447,'EU','.uk','GBP','44','@# #@@|@## #@@|@@# #@@|@@## #@@|@#@ #@@|@@#@ #@@|G','^(([A-Z]d{2}[A-Z]{2})|([A-Z]d{3}[A-Z]{2})|([A-Z]{2}d{2}[A-Z]{2})|([A-Z]{2}d{3}[A-Z]{2})|([A-Z]d[A-Z]d[A-Z]{2})|([A-Z]{2}d[A-Z]d[A-Z]{2})|(GIR0AA))$','en-GB,cy-GB,gd','IE','',1,NULL,'2019-11-30 06:02:28'),
(234,'UM',NULL,NULL,'UMI',581,'','United States Minor Outlying Islands','United States Minor Outlying Islands','',0,0,'OC','.um','USD','1','','','en-UM','','',1,NULL,'2019-11-30 06:02:31'),
(235,'US',NULL,NULL,'USA',840,'US','USA','United States','Washington',9629091,310232863,'NA','.us','USD','1','#####-####','^d{5}(-d{4})?$','en-US,es-US,haw,fr','CA,MX,CU','',1,NULL,'2019-11-30 05:44:32'),
(236,'UY',NULL,NULL,'URY',858,'UY','Uruguay','Uruguay','Montevideo',176220,3477000,'SA','.uy','UYU','598','#####','^(d{5})$','es-UY','BR,AR','',1,NULL,'2019-11-30 06:02:34'),
(237,'UZ',NULL,NULL,'UZB',860,'UZ','O\'zbekiston','Uzbekistan','Tashkent',447400,27865738,'AS','.uz','UZS','998','######','^(d{6})$','uz,ru,tg','TM,AF,KG,TJ,KZ','',1,NULL,'2019-11-30 06:02:36'),
(238,'VA',NULL,NULL,'VAT',336,'VT','Vaticanum','Vatican','Vatican City',0,921,'EU','.va','EUR','379','#####','^(d{5})$','la,it,fr','IT','',1,NULL,'2019-11-30 06:02:38'),
(239,'VC',NULL,NULL,'VCT',670,'VC','Saint Vincent and the Grenadines','Saint Vincent and the Grenadines','Kingstown',389,104217,'NA','.vc','XCD','+1-784','','','en-VC,fr','','',1,NULL,'2019-11-30 06:02:41'),
(240,'VE',NULL,NULL,'VEN',862,'VE','Venezuela','Venezuela','Caracas',912050,27223228,'SA','.ve','VEF','58','####','^(d{4})$','es-VE','GY,BR,CO','',1,NULL,'2019-11-30 06:02:44'),
(241,'VG',NULL,NULL,'VGB',92,'VI','British Virgin Islands','British Virgin Islands','Road Town',153,21730,'NA','.vg','USD','+1-284','','','en-VG','','',1,NULL,'2019-11-30 06:02:48'),
(242,'VI',NULL,NULL,'VIR',850,'VQ','U.S. Virgin Islands','U.S. Virgin Islands','Charlotte Amalie',352,108708,'NA','.vi','USD','+1-340','#####-####','^d{5}(-d{4})?$','en-VI','','',1,NULL,'2019-11-30 06:02:50'),
(243,'VN',NULL,NULL,'VNM',704,'VM','Viá»‡t Nam','Vietnam','Hanoi',329560,89571130,'AS','.vn','VND','84','######','^(d{6})$','vi,en,fr,zh,km','CN,LA,KH','',1,NULL,'2019-11-30 06:02:52'),
(244,'VU',NULL,NULL,'VUT',548,'NH','Vanuatu','Vanuatu','Port Vila',12200,221552,'OC','.vu','VUV','678','','','bi,en-VU,fr-VU','','',1,NULL,'2019-11-30 06:02:55'),
(245,'WF',NULL,NULL,'WLF',876,'WF','Wallis and Futuna','Wallis and Futuna','Mata Utu',274,16025,'OC','.wf','XPF','681','#####','^(986d{2})$','wls,fud,fr-WF','','',1,NULL,'2019-11-30 06:02:56'),
(246,'WS',NULL,NULL,'WSM',882,'WS','Samoa','Samoa','Apia',2944,192001,'OC','.ws','WST','685','','','sm,en-WS','','',1,NULL,'2019-11-30 06:02:59'),
(247,'XK',NULL,NULL,'XKX',0,'KV','Kosovo','Kosovo','Pristina',10908,1800000,'EU','','EUR','','','','sq,sr','RS,AL,MK,ME','',1,NULL,'2019-11-30 06:03:01'),
(248,'YE',NULL,NULL,'YEM',887,'YM','al-Yaman','Yemen','Sanaa',527970,23495361,'AS','.ye','YER','967','','','ar-YE','SA,OM','',1,NULL,'2019-11-30 06:03:04'),
(249,'YT',NULL,NULL,'MYT',175,'MF','Mayotte','Mayotte','Mamoudzou',374,159042,'AF','.yt','EUR','262','#####','^(d{5})$','fr-YT','','',1,NULL,'2019-11-30 06:03:06'),
(250,'ZA',NULL,NULL,'ZAF',710,'SF','South Africa','South Africa','Pretoria',1219912,49000000,'AF','.za','ZAR','27','####','^(d{4})$','zu,xh,af,nso,en-ZA,tn,st,ts,ss,ve,nr','ZW,SZ,MZ,BW,NA,LS','',1,NULL,'2019-11-30 06:03:08'),
(251,'ZM',NULL,NULL,'ZMB',894,'ZA','Zambia','Zambia','Lusaka',752614,13460305,'AF','.zm','ZMW','260','#####','^(d{5})$','en-ZM,bem,loz,lun,lue,ny,toi','ZW,TZ,MZ,CD,NA,MW,AO','',1,NULL,'2019-11-30 06:03:12'),
(252,'ZW',NULL,NULL,'ZWE',716,'ZI','Zimbabwe','Zimbabwe','Harare',390580,11651858,'AF','.zw','ZWL','263','','','en-ZW,sn,nr,nd','ZA,MZ,BW,ZM','',1,NULL,'2019-11-30 06:03:15');

/*Table structure for table `qr_currencies` */

DROP TABLE IF EXISTS `qr_currencies`;

CREATE TABLE `qr_currencies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `html_entity` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'From Github : An array of currency symbols as HTML entities',
  `font_arial` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `font_code2000` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unicode_decimal` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unicode_hex` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `in_left` tinyint(1) DEFAULT 0,
  `decimal_places` int(10) unsigned DEFAULT 2 COMMENT 'Currency Decimal Places - ISO 4217',
  `decimal_separator` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '.',
  `thousand_separator` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT ',',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `qr_currencies` */

insert  into `qr_currencies`(`id`,`code`,`name`,`html_entity`,`font_arial`,`font_code2000`,`unicode_decimal`,`unicode_hex`,`in_left`,`decimal_places`,`decimal_separator`,`thousand_separator`,`created_at`,`updated_at`) values 
(1,'AED','United Arab Emirates Dirham','&#1583;.&#1573;','Ø¯.Ø¥','Ø¯.Ø¥',NULL,NULL,0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(2,'AFN','Afghanistan Afghani','&#65;&#102;','Ø‹','Ø‹','1547','60b',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(3,'ALL','Albania Lek','&#76;&#101;&#107;','Lek','Lek','76, 1','4c, 6',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(4,'AMD','Armenia Dram','',NULL,NULL,NULL,NULL,0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(5,'ANG','Netherlands Antilles Guilder','&#402;','Æ’','Æ’','402','192',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(6,'AOA','Angola Kwanza','&#75;&#122;','Kz','Kz',NULL,NULL,1,2,'.',',',NULL,'2016-04-03 07:05:01'),
(7,'ARS','Argentina Peso','&#36;','$','$','36','24',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(8,'AUD','Australia Dollar','&#36;','$','$','36','24',1,2,'.',',',NULL,'2016-04-03 07:05:01'),
(9,'AWG','Aruba Guilder','&#402;','Æ’','Æ’','402','192',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(10,'AZN','Azerbaijan New Manat','&#1084;&#1072;&#1085;','Ð¼Ð°Ð','Ð¼Ð°Ð','1084,','43c, ',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(11,'BAM','Bosnia and Herzegovina Convertible Marka','&#75;&#77;','KM','KM','75, 7','4b, 4',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(12,'BBD','Barbados Dollar','&#36;','$','$','36','24',1,2,'.',',',NULL,'2016-04-03 07:05:01'),
(13,'BDT','Bangladesh Taka','&#2547;','à§³','à§³',NULL,NULL,0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(14,'BGN','Bulgaria Lev','&#1083;&#1074;','Ð»Ð²','Ð»Ð²','1083,','43b, ',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(15,'BHD','Bahrain Dinar','.&#1583;.&#1576;',NULL,NULL,NULL,NULL,0,3,'.',',',NULL,'2016-04-03 07:05:01'),
(16,'BIF','Burundi Franc','&#70;&#66;&#117;','FBu','FBu',NULL,NULL,0,0,'.',',',NULL,'2016-04-03 07:05:01'),
(17,'BMD','Bermuda Dollar','&#36;','$','$','36','24',1,2,'.',',',NULL,'2016-04-03 07:05:01'),
(18,'BND','Brunei Darussalam Dollar','&#36;','$','$','36','24',1,2,'.',',',NULL,'2016-04-03 07:05:01'),
(19,'BOB','Bolivia Boliviano','&#36;&#98;','$b','$b','36, 9','24, 6',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(20,'BRL','Brazil Real','&#82;&#36;','R$','R$','82, 3','52, 2',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(21,'BSD','Bahamas Dollar','&#36;','$','$','36','24',1,2,'.',',',NULL,'2016-04-03 07:05:01'),
(22,'BTN','Bhutan Ngultrum','&#78;&#117;&#46;',NULL,NULL,NULL,NULL,0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(23,'BWP','Botswana Pula','&#80;','P','P','80','50',1,2,'.',',',NULL,'2016-04-03 07:05:01'),
(24,'BYR','Belarus Ruble','&#112;&#46;','p.','p.','112, ','70, 2',0,0,'.',',',NULL,'2016-04-03 07:05:01'),
(25,'BZD','Belize Dollar','&#66;&#90;&#36;','BZ$','BZ$','66, 9','42, 5',1,2,'.',',',NULL,'2016-04-03 07:05:01'),
(26,'CAD','Canada Dollar','&#36;','$','$','36','24',1,2,'.',',',NULL,'2016-04-03 07:05:01'),
(27,'CDF','Congo/Kinshasa Franc','&#70;&#67;','Fr','Fr',NULL,NULL,0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(28,'CHF','Switzerland Franc','','Fr','Fr','67, 7','43, 4',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(29,'CLP','Chile Peso','&#36;','$','$','36','24',0,0,'.',',',NULL,'2016-04-03 07:05:01'),
(30,'CNY','China Yuan Renminbi','&#165;','Â¥','Â¥','165','a5',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(31,'COP','Colombia Peso','&#36;','$','$','36','24',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(32,'CRC','Costa Rica Colon','&#8353;','â‚¡','â‚¡','8353','20a1',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(33,'CUC','Cuba Convertible Peso',NULL,NULL,NULL,NULL,NULL,0,2,'.',',',NULL,NULL),
(34,'CUP','Cuba Peso','&#8396;','â‚±','â‚±','8369','20b1',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(35,'CVE','Cape Verde Escudo','&#x24;','$','$',NULL,NULL,1,0,'.',',',NULL,'2016-04-03 07:05:01'),
(36,'CZK','Czech Republic Koruna','&#75;&#269;','KÄ','KÄ','75, 2','4b, 1',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(37,'DJF','Djibouti Franc','&#70;&#100;&#106;','Fr','Fr',NULL,NULL,0,0,'.',',',NULL,'2016-04-03 07:05:01'),
(38,'DKK','Denmark Krone','&#107;&#114;','kr','kr','107, ','6b, 7',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(39,'DOP','Dominican Republic Peso','&#82;&#68;&#36;','RD$','RD$','82, 6','52, 4',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(40,'DZD','Algeria Dinar','&#1583;&#1580;','DA','DA',NULL,NULL,0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(41,'EEK','Estonia Kroon',NULL,'kr','kr','107, ','6b, 7',0,2,'.',',',NULL,NULL),
(42,'EGP','Egypt Pound','&#163;','Â£','Â£','163','a3',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(43,'ERN','Eritrea Nakfa','&#x4E;&#x66;&#x6B;','Nfk','Nfk',NULL,NULL,0,2,'.',',',NULL,NULL),
(44,'ETB','Ethiopia Birr','&#66;&#114;','Br','Br',NULL,NULL,1,2,'.',',',NULL,'2016-04-03 07:05:01'),
(45,'EUR','Euro Member Countries','&euro;','â‚¬','â‚¬','8364','20ac',0,2,',',' ',NULL,'2017-02-10 00:57:28'),
(46,'FJD','Fiji Dollar','&#36;','$','$','36','24',1,2,'.',',',NULL,'2016-04-03 07:05:01'),
(47,'FKP','Falkland Islands (Malvinas) Pound','&#163;','Â£','Â£','163','a3',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(48,'GBP','United Kingdom Pound','&#163;','Â£','Â£','163','a3',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(49,'GEL','Georgia Lari','&#4314;',NULL,NULL,NULL,NULL,0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(50,'GGP','Guernsey Pound',NULL,'Â£','Â£','163','a3',0,2,'.',',',NULL,NULL),
(51,'GHC','Ghana Cedi','&#x47;&#x48;&#xA2;','GHÂ¢','GHÂ¢','162','a2',1,2,'.',',',NULL,NULL),
(52,'GHS','Ghana Cedi','&#x47;&#x48;&#xA2;','GHÂ¢','GHÂ¢',NULL,NULL,1,2,'.',',',NULL,'2016-04-03 07:05:01'),
(53,'GIP','Gibraltar Pound','&#163;','Â£','Â£','163','a3',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(54,'GMD','Gambia Dalasi','&#68;','D','D',NULL,NULL,0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(55,'GNF','Guinea Franc','&#70;&#71;','Fr','Fr',NULL,NULL,0,0,'.',',',NULL,'2016-04-03 07:05:01'),
(56,'GTQ','Guatemala Quetzal','&#81;','Q','Q','81','51',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(57,'GYD','Guyana Dollar','&#36;','$','$','36','24',1,2,'.',',',NULL,'2016-04-03 07:05:01'),
(58,'HKD','Hong Kong Dollar','&#36;','$','$','36','24',1,2,'.',',',NULL,'2016-04-03 07:05:01'),
(59,'HNL','Honduras Lempira','&#76;','L','L','76','4c',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(60,'HRK','Croatia Kuna','&#107;&#110;','kn','kn','107, ','6b, 6',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(61,'HTG','Haiti Gourde','&#71;',NULL,NULL,NULL,NULL,0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(62,'HUF','Hungary Forint','&#70;&#116;','Ft','Ft','70, 1','46, 7',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(63,'IDR','Indonesia Rupiah','&#82;&#112;','Rp','Rp','82, 1','52, 7',0,0,'.',',',NULL,'2016-04-03 07:05:01'),
(64,'ILS','Israel Shekel','&#8362;','â‚ª','â‚ª','8362','20aa',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(65,'IMP','Isle of Man Pound',NULL,'Â£','Â£','163','a3',0,2,'.',',',NULL,NULL),
(66,'INR','India Rupee','&#8377;','â‚¨','â‚¨','','',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(67,'IQD','Iraq Dinar','&#1593;.&#1583;','Ø¯.Ø¹','Ø¯.Ø¹',NULL,NULL,0,0,'.',',',NULL,'2016-04-03 07:05:01'),
(68,'IRR','Iran Rial','&#65020;','ï·¼','ï·¼','65020','fdfc',0,0,'.',',',NULL,'2016-04-03 07:05:01'),
(69,'ISK','Iceland Krona','&#107;&#114;','kr','kr','107, ','6b, 7',0,0,'.',',',NULL,'2016-04-03 07:05:01'),
(70,'JEP','Jersey Pound','&#163;','Â£','Â£','163','a3',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(71,'JMD','Jamaica Dollar','&#74;&#36;','J$','J$','74, 3','4a, 2',1,2,'.',',',NULL,'2016-04-03 07:05:01'),
(72,'JOD','Jordan Dinar','&#74;&#68;',NULL,NULL,NULL,NULL,0,3,'.',',',NULL,'2016-04-03 07:05:01'),
(73,'JPY','Japan Yen','&#165;','Â¥','Â¥','165','a5',0,0,'.',',',NULL,'2016-04-03 07:05:01'),
(74,'KES','Kenya Shilling','&#x4B;&#x53;&#x68;','KSh','KSh',NULL,NULL,1,2,'.',',',NULL,'2016-04-03 07:05:01'),
(75,'KGS','Kyrgyzstan Som','&#1083;&#1074;','Ð»Ð²','Ð»Ð²','1083,','43b, ',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(76,'KHR','Cambodia Riel','&#6107;','áŸ›','áŸ›','6107','17db',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(77,'KMF','Comoros Franc','&#67;&#70;','Fr','Fr',NULL,NULL,0,0,'.',',',NULL,'2016-04-03 07:05:01'),
(78,'KPW','Korea (North) Won','&#8361;','â‚©','â‚©','8361','20a9',0,0,'.',',',NULL,'2016-04-03 07:05:01'),
(79,'KRW','Korea (South) Won','&#8361;','â‚©','â‚©','8361','20a9',0,0,'.',',',NULL,'2016-04-03 07:05:01'),
(80,'KWD','Kuwait Dinar','&#1583;.&#1603;','Ø¯.Ùƒ','Ø¯.Ùƒ',NULL,NULL,0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(81,'KYD','Cayman Islands Dollar','&#36;','$','$','36','24',1,2,'.',',',NULL,'2016-04-03 07:05:01'),
(82,'KZT','Kazakhstan Tenge','&#1083;&#1074;','Ð»Ð²','Ð»Ð²','1083,','43b, ',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(83,'LAK','Laos Kip','&#8365;','â‚­','â‚­','8365','20ad',0,0,'.',',',NULL,'2016-04-03 07:05:01'),
(84,'LBP','Lebanon Pound','&#163;','Â£','Â£','163','a3',0,0,'.',',',NULL,'2016-04-03 07:05:01'),
(85,'LKR','Sri Lanka Rupee','&#8360;','â‚¨','â‚¨','8360','20a8',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(86,'LRD','Liberia Dollar','&#36;','$','$','36','24',1,2,'.',',',NULL,'2016-04-03 07:05:01'),
(87,'LSL','Lesotho Loti','&#76;','M','M',NULL,NULL,0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(88,'LTL','Lithuania Litas','&#76;&#116;','Lt','Lt','76, 1','4c, 7',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(89,'LVL','Latvia Lat','&#76;&#115;','Ls','Ls','76, 1','4c, 7',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(90,'LYD','Libya Dinar','&#1604;.&#1583;','DL','DL',NULL,NULL,0,3,'.',',',NULL,'2016-04-03 07:05:01'),
(91,'MAD','Morocco Dirham','&#1583;.&#1605;.','Dhs','Dhs',NULL,NULL,0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(92,'MDL','Moldova Leu','&#76;',NULL,NULL,NULL,NULL,0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(93,'MGA','Madagascar Ariary','&#65;&#114;','Ar','Ar',NULL,NULL,0,5,'.',',',NULL,'2016-04-03 07:05:01'),
(94,'MKD','Macedonia Denar','&#1076;&#1077;&#1085;','Ð´ÐµÐ','Ð´ÐµÐ','1076,','434, ',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(95,'MMK','Myanmar (Burma) Kyat','&#75;',NULL,NULL,NULL,NULL,0,0,'.',',',NULL,'2016-04-03 07:05:01'),
(96,'MNT','Mongolia Tughrik','&#8366;','â‚®','â‚®','8366','20ae',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(97,'MOP','Macau Pataca','&#77;&#79;&#80;&#36;',NULL,NULL,NULL,NULL,0,1,'.',',',NULL,'2016-04-03 07:05:01'),
(98,'MRO','Mauritania Ouguiya','&#85;&#77;','UM','UM',NULL,NULL,0,5,'.',',',NULL,'2016-04-03 07:05:01'),
(99,'MUR','Mauritius Rupee','&#8360;','â‚¨','â‚¨','8360','20a8',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(100,'MVR','Maldives (Maldive Islands) Rufiyaa','.&#1923;',NULL,NULL,NULL,NULL,0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(101,'MWK','Malawi Kwacha','&#77;&#75;','MK','MK',NULL,NULL,0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(102,'MXN','Mexico Peso','&#36;','$','$','36','24',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(103,'MYR','Malaysia Ringgit','&#82;&#77;','RM','RM','82, 7','52, 4',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(104,'MZN','Mozambique Metical','&#77;&#84;','MT','MT','77, 8','4d, 5',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(105,'NAD','Namibia Dollar','&#36;','$','$','36','24',1,2,'.',',',NULL,'2016-04-03 07:05:01'),
(106,'NGN','Nigeria Naira','&#8358;','â‚¦','â‚¦','8358','20a6',1,2,'.',',',NULL,'2016-04-03 07:05:01'),
(107,'NIO','Nicaragua Cordoba','&#67;&#36;','C$','C$','67, 3','43, 2',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(108,'NOK','Norway Krone','&#107;&#114;','kr','kr','107, ','6b, 7',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(109,'NPR','Nepal Rupee','&#8360;','â‚¨','â‚¨','8360','20a8',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(110,'NZD','New Zealand Dollar','&#36;','$','$','36','24',1,2,'.',',',NULL,'2016-04-03 07:05:01'),
(111,'OMR','Oman Rial','&#65020;','ï·¼','ï·¼','65020','fdfc',0,3,'.',',',NULL,'2016-04-03 07:05:01'),
(112,'PAB','Panama Balboa','&#66;&#47;&#46;','B/.','B/.','66, 4','42, 2',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(113,'PEN','Peru Nuevo Sol','&#83;&#47;&#46;','S/.','S/.','83, 4','53, 2',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(114,'PGK','Papua New Guinea Kina','&#75;',NULL,NULL,NULL,NULL,0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(115,'PHP','Philippines Peso','&#8369;','â‚±','â‚±','8369','20b1',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(116,'PKR','Pakistan Rupee','&#8360;','â‚¨','â‚¨','8360','20a8',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(117,'PLN','Poland Zloty','&#122;&#322;','zÅ‚','zÅ‚','122, ','7a, 1',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(118,'PYG','Paraguay Guarani','&#71;&#115;','Gs','Gs','71, 1','47, 7',0,0,'.',',',NULL,'2016-04-03 07:05:01'),
(119,'QAR','Qatar Riyal','&#65020;','ï·¼','ï·¼','65020','fdfc',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(120,'RON','Romania New Leu','&#108;&#101;&#105;','lei','lei','108, ','6c, 6',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(121,'RSD','Serbia Dinar','&#1044;&#1080;&#1085;&#46;','Ð”Ð¸Ð','Ð”Ð¸Ð','1044,','414, ',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(122,'RUB','Russia Ruble','&#1088;&#1091;&#1073;','Ñ€ÑƒÐ','Ñ€ÑƒÐ','1088,','440, ',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(123,'RWF','Rwanda Franc','&#1585;.&#1587;','FRw','FRw',NULL,NULL,0,0,'.',',',NULL,'2016-04-03 07:05:01'),
(124,'SAR','Saudi Arabia Riyal','&#65020;','ï·¼','ï·¼','65020','fdfc',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(125,'SBD','Solomon Islands Dollar','&#36;','$','$','36','24',1,2,'.',',',NULL,'2016-04-03 07:05:01'),
(126,'SCR','Seychelles Rupee','&#8360;','â‚¨','â‚¨','8360','20a8',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(127,'SDG','Sudan Pound','&#163;','DS','DS',NULL,NULL,0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(128,'SEK','Sweden Krona','&#107;&#114;','kr','kr','107, ','6b, 7',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(129,'SGD','Singapore Dollar','&#36;','$','$','36','24',1,2,'.',',',NULL,'2016-04-03 07:05:01'),
(130,'SHP','Saint Helena Pound','&#163;','Â£','Â£','163','a3',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(131,'SLL','Sierra Leone Leone','&#76;&#101;','Le','Le',NULL,NULL,1,0,'.',',',NULL,'2016-04-03 07:05:01'),
(132,'SOS','Somalia Shilling','&#83;','S','S','83','53',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(133,'SPL','Seborga Luigino',NULL,NULL,NULL,NULL,NULL,0,2,'.',',',NULL,NULL),
(134,'SRD','Suriname Dollar','&#36;','$','$','36','24',1,2,'.',',',NULL,'2016-04-03 07:05:01'),
(135,'SSP','South Sudanese Pound','&#xA3;','Â£','Â£',NULL,NULL,0,2,'.',',',NULL,NULL),
(136,'STD','SÃ£o TomÃ© and PrÃ­ncipe Dobra','&#68;&#98;','Db','Db',NULL,NULL,0,0,'.',',',NULL,'2016-04-03 07:05:01'),
(137,'SVC','El Salvador Colon','&#36;','$','$','36','24',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(138,'SYP','Syria Pound','&#163;','Â£','Â£','163','a3',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(139,'SZL','Swaziland Lilangeni','&#76;','E','E',NULL,NULL,1,2,'.',',',NULL,'2016-04-03 07:05:01'),
(140,'THB','Thailand Baht','&#3647;','à¸¿','à¸¿','3647','e3f',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(141,'TJS','Tajikistan Somoni','&#84;&#74;&#83;',NULL,NULL,NULL,NULL,0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(142,'TMT','Turkmenistan Manat','&#109;',NULL,NULL,NULL,NULL,0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(143,'TND','Tunisia Dinar','&#1583;.&#1578;','DT','DT',NULL,NULL,1,3,'.',',',NULL,'2016-04-03 07:05:01'),
(144,'TOP','Tonga Pa\'anga','&#84;&#36;',NULL,NULL,NULL,NULL,0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(145,'TRL','Turkey Lira',NULL,'â‚¤','â‚¤','8356','20a4',1,2,'.',',',NULL,NULL),
(146,'TRY','Turkey Lira','&#x20BA;','â‚º','â‚º','','',1,2,'.',',',NULL,'2016-04-03 07:05:01'),
(147,'TTD','Trinidad and Tobago Dollar','&#36;','TT$','TT$','84, 8','54, 5',1,2,'.',',',NULL,'2016-04-03 07:05:01'),
(148,'TVD','Tuvalu Dollar',NULL,'$','$','36','24',1,2,'.',',',NULL,NULL),
(149,'TWD','Taiwan New Dollar','&#78;&#84;&#36;','NT$','NT$','78, 8','4e, 5',1,2,'.',',',NULL,'2016-04-03 07:05:01'),
(150,'TZS','Tanzania Shilling','&#x54;&#x53;&#x68;','TSh','TSh',NULL,NULL,0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(151,'UAH','Ukraine Hryvnia','&#8372;','â‚´','â‚´','8372','20b4',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(152,'UGX','Uganda Shilling','&#85;&#83;&#104;','USh','USh',NULL,NULL,0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(153,'USD','United States Dollar','&#36;','$','$','36','24',1,2,'.',',',NULL,'2016-04-03 07:05:01'),
(154,'UYU','Uruguay Peso','&#36;&#85;','$U','$U','36, 8','24, 5',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(155,'UZS','Uzbekistan Som','&#1083;&#1074;','Ð»Ð²','Ð»Ð²','1083,','43b, ',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(156,'VEF','Venezuela Bolivar','&#66;&#115;','Bs','Bs','66, 1','42, 7',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(157,'VND','Viet Nam Dong','&#8363;','â‚«','â‚«','8363','20ab',1,0,'.',',',NULL,'2016-04-03 07:05:01'),
(158,'VUV','Vanuatu Vatu','&#86;&#84;',NULL,NULL,NULL,NULL,0,0,'.',',',NULL,'2016-04-03 07:05:01'),
(159,'WST','Samoa Tala','&#87;&#83;&#36;',NULL,NULL,NULL,NULL,0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(160,'XAF','CommunautÃ© FinanciÃ¨re Africaine (BEAC) CFA Franc','&#70;&#67;&#70;&#65;','F','F',NULL,NULL,0,0,'.',',',NULL,'2016-04-03 07:05:01'),
(161,'XCD','East Caribbean Dollar','&#36;','$','$','36','24',1,2,'.',',',NULL,'2016-04-03 07:05:01'),
(162,'XDR','International Monetary Fund (IMF) Special Drawing ','',NULL,NULL,NULL,NULL,0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(163,'XOF','CommunautÃ© FinanciÃ¨re Africaine (BCEAO) Franc','&#70;&#67;&#70;&#65;','F','F',NULL,NULL,0,0,'.',',',NULL,'2016-04-03 07:05:01'),
(164,'XPF','Comptoirs FranÃ§ais du Pacifique (CFP) Franc','&#70;','F','F',NULL,NULL,0,0,'.',',',NULL,'2016-04-03 07:05:01'),
(165,'YER','Yemen Rial','&#65020;','ï·¼','ï·¼','65020','fdfc',0,2,'.',',',NULL,'2016-04-03 07:05:01'),
(166,'ZAR','South Africa Rand','&#82;','R','R','82','52',1,2,'.',',',NULL,'2016-04-03 07:05:01'),
(167,'ZMW','Zambia Kwacha',NULL,'ZK','ZK',NULL,NULL,0,2,'.',',',NULL,NULL),
(168,'ZWD','Zimbabwe Dollar',NULL,'Z$','Z$','90, 3','5a, 2',1,2,'.',',',NULL,NULL),
(169,'ZWL','Zimbabwe Dollar',NULL,'Z$','Z$','90, 3','5a, 2',1,2,'.',',',NULL,NULL),
(170,'XBT','Bitcoin','à¸¿','à¸¿','à¸¿',NULL,NULL,1,2,'.',',',NULL,NULL);

/*Table structure for table `qr_faq_entries` */

DROP TABLE IF EXISTS `qr_faq_entries`;

CREATE TABLE `qr_faq_entries` (
  `faq_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `translation_lang` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `translation_of` int(10) unsigned DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `faq_pid` smallint(4) NOT NULL DEFAULT 0,
  `faq_weight` mediumint(6) NOT NULL DEFAULT 0,
  `faq_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `faq_content` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`faq_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `qr_faq_entries` */

/*Table structure for table `qr_image_menu` */

DROP TABLE IF EXISTS `qr_image_menu`;

CREATE TABLE `qr_image_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `position` int(11) NOT NULL DEFAULT 9999,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `qr_image_menu` */

/*Table structure for table `qr_languages` */

DROP TABLE IF EXISTS `qr_languages`;

CREATE TABLE `qr_languages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direction` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `default` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `qr_languages` */

insert  into `qr_languages`(`id`,`code`,`direction`,`name`,`file_name`,`active`,`default`) values 
(1,'en','ltr','English','english',1,1),
(2,'fr','ltr','French','french',1,0),
(3,'sv','ltr','Swedish','swedish',1,0),
(4,'it','ltr','Italian','italian',1,0),
(5,'de','ltr','German','german',1,0),
(6,'es','ltr','Spanish','spanish',1,0),
(7,'pl','ltr','Polish','polish',1,0),
(8,'ja','ltr','Japanese','japanese',1,0),
(9,'zh','ltr','Chinese','chinese',1,0),
(10,'ar','rtl','Arabic','arabic',1,0),
(11,'he','rtl','Hebrew','hebrew',1,0),
(12,'ru','ltr','Russian','russian',1,0),
(13,'bn','ltr','Bangali','bangali',1,0),
(14,'hi','ltr','Hindi','hindi',1,0),
(15,'bg','ltr','Bulgarian','bulgarian',1,0),
(16,'ro','ltr','Romanian','romanian',1,0),
(17,'th','ltr','Thai','thai',1,0),
(18,'tr','ltr','Turkish','turkish',1,0),
(19,'ur','rtl','Urdu','urdu',1,0),
(20,'vi','ltr','Vietnamese','vietnamese',1,0);

/*Table structure for table `qr_logs` */

DROP TABLE IF EXISTS `qr_logs`;

CREATE TABLE `qr_logs` (
  `log_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `log_date` int(11) unsigned NOT NULL DEFAULT 0,
  `log_summary` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `log_details` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `qr_logs` */

insert  into `qr_logs`(`log_id`,`log_date`,`log_summary`,`log_details`) values 
(1,1619502991,'Cron Run','Expire membership: 0<br><br>Cron Took: 0 seconds');

/*Table structure for table `qr_menu` */

DROP TABLE IF EXISTS `qr_menu`;

CREATE TABLE `qr_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `restro_id` int(11) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` float DEFAULT 0,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'default.png',
  `type` enum('veg','nonveg') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'veg',
  `active` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `position` int(11) NOT NULL DEFAULT 9999,
  `translation` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `qr_menu` */

/*Table structure for table `qr_menu_extras` */

DROP TABLE IF EXISTS `qr_menu_extras`;

CREATE TABLE `qr_menu_extras` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,2) DEFAULT 0.00,
  `position` int(11) NOT NULL DEFAULT 9999,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `translation` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `qr_menu_extras` */

/*Table structure for table `qr_options` */

DROP TABLE IF EXISTS `qr_options`;

CREATE TABLE `qr_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `option_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `qr_options` */

insert  into `qr_options`(`option_id`,`option_name`,`option_value`) values 
(1,'site_logo','restro-theme_logo.png'),
(2,'site_title','QuickQR Digital Menu'),
(3,'meta_keywords',''),
(4,'meta_description',''),
(5,'admin_email','admin@gmail.com'),
(6,'tpl_name','restro-theme'),
(7,'country_type','multi'),
(8,'timezone','Indian/Maldives'),
(9,'lang','english'),
(10,'currency_sign','&#36;'),
(11,'currency_code','USD'),
(12,'currency_pos','1'),
(13,'featured_fee','10'),
(14,'urgent_fee','10'),
(15,'highlight_fee','10'),
(16,'home_page','home-image'),
(17,'home_map_latitude','28.6139391'),
(18,'home_map_longitude','77.20902120000005'),
(19,'home_map_zoom','4'),
(20,'map_color','#8080ff'),
(21,'theme_color','#2a41e8'),
(22,'home_banner','bg.jpg'),
(23,'contact_address','142, Basant Viahr '),
(24,'contact_phone','1-972-8103-393'),
(25,'contact_email','contact@gmail.com'),
(26,'contact_latitude','40.7344458'),
(27,'contact_longitude','-73.86704922'),
(28,'footer_text','Aenean sodales mattis augue. Morbi euismod, felis at volutpat volutpat, quam lectus porttitor massa, tur ex a neque pulvinar pulvinar.'),
(29,'copyright_text','2020 Bylancer, All right reserved'),
(30,'facebook_link','https://www.facebook.com/'),
(31,'twitter_link','https://www.twitter.com/'),
(32,'googleplus_link','https://plus.google.com/'),
(33,'youtube_link','https://www.youtube.com/'),
(34,'facebook_app_id',''),
(35,'facebook_app_secret',''),
(36,'google_app_id',''),
(37,'google_app_secret',''),
(38,'recaptcha_mode','0'),
(39,'recaptcha_public_key',''),
(40,'recaptcha_private_key',''),
(41,'gmap_api_key',''),
(42,'email_type','smtp'),
(43,'smtp_host',''),
(44,'smtp_port',''),
(45,'smtp_username',''),
(46,'smtp_password',''),
(47,'userlangsel','1'),
(48,'userthemesel','0'),
(49,'color_switcher','0'),
(50,'admin_tpl_name','style-dark'),
(51,'admin_tpl_color','green'),
(52,'admin_menu_style','horizontal'),
(53,'transfer_filter','1'),
(54,'mod_rewrite','1'),
(55,'temp_php','1'),
(56,'quickad_debug','0'),
(57,'xml_latest','1'),
(58,'xml_featured','1'),
(59,'site_admin_logo','adminlogo.png'),
(60,'site_favicon','favicon.png'),
(61,'post_address_mode','0'),
(62,'post_tags_mode','1'),
(63,'post_auto_approve','0'),
(64,'post_watermark','1'),
(65,'max_image_upload','3'),
(66,'post_premium_listing','1'),
(67,'post_desc_editor','1'),
(68,'email_template','1'),
(69,'email_engine','phpmailer'),
(70,'smtp_secure','0'),
(71,'smtp_auth','true'),
(72,'aws_host',''),
(73,'aws_access_key',''),
(74,'aws_secret_key',''),
(75,'mandrill_user',''),
(76,'mandrill_key',''),
(77,'sendgrid_user',''),
(78,'sendgrid_pass',''),
(79,'email_sub_signup_confirm','{SITE_TITLE} - {LANG_EMAILCONFIRM}'),
(80,'email_sub_forgot_pass','{SITE_TITLE} - {LANG_FORGOTPASS}'),
(81,'email_sub_contact','{LANG_CONTACT_SUBJECT_START} - {CONTACT_SUBJECT}'),
(82,'email_sub_feedback','{FEEDBACK_SUBJECT}'),
(83,'email_sub_report','{LANG_REPORTVIO}  - {SITE_TITLE}'),
(84,'email_sub_ad_approve','Congratulations! {SELLER_NAME} Your ad has been approved'),
(85,'email_sub_re_ad_approve','Congratulations! {SELLER_NAME} Your ad resubmission has been approved'),
(86,'email_sub_contact_seller','{SITE_TITLE} - {SENDER_NAME} {LANG_WANT-TO-CONTACT}'),
(87,'email_message_signup_confirm','Greetings from {SITE_TITLE} Team!\n\nThanks for registering with {SITE_TITLE}. We are thrilled to have you as a registered member and hope that you find our service beneficial.\n\nBefore we get you started please activate your account by clicking on the link below\n{CONFIRMATION_LINK}\n\n\nAfter your Account activation you will have  Post Ad, Chat with sellers and more. Once you have your Profile filled in you are ready to go.\n\nHave further questions? You can find answers in our FAQ Section at {LINK_CONTACT}\nSincerely,\n\n{SITE_TITLE} Team!\n{SITE_URL}'),
(88,'email_message_forgot_pass','{LANG_TORESET}\n\n{FORGET_PASSWORD_LINK}\n\nHave further questions? You can find answers in our FAQ Section at {LINK_CONTACT}\nSincerely,\n\n{SITE_TITLE} Team!\n{SITE_URL}'),
(89,'email_message_contact','{NAME} {LANG_WANT-TO-CONTACT} {SITE_TITLE}:\n\n{LANG_NAME}          : {NAME}\n{LANG_EMAIL}         : {EMAIL}\n\n{LANG_MESSAGE}:\n\n{MESSAGE}\n\n------------------------------------------\n\nThis message has been sent automatically by the {SITE_TITLE} system.\nIf you need to contact us, go to {LINK_CONTACT}'),
(90,'email_message_feedback','{NAME} {LANG_SEND-FEEDBACK} {SITE_TITLE}:\n\n{LANG_NAME}          : {NAME}\n{LANG_EMAIL}         : {EMAIL}\n{LANG_PHONE}         : {PHONE}\n\n{LANG_MESSAGE}:\n\n{MESSAGE}\n\n------------------------------------------\n\nThis message has been sent automatically by the {SITE_TITLE} system.\nIf you need to contact us, go to {LINK_CONTACT}'),
(91,'email_message_report','{LANG_FOLLOWING-SENT-AUTO}  {SITE_TITLE}:\n\n{LANG_NAME}: {NAME}\n{LANG_USERNAME}: {USERNAME}\n{LANG_EMAIL}: {EMAIL}\n\n{LANG_VIOLATION}: {VIOLATION}\n{LANG_VIOLAT0R}: {USERNAME2}\n{LANG_VIOLATION} URL: {URL}\n\n{DETAILS}'),
(92,'email_message_ad_approve','Congratulations! Your ad to {ADTITLE} on {SITE_TITLE} has been approved. You can view your item here:\n\n{ADLINK}\n\nThanks for your submission!\n\nRegards,\n{SITE_TITLE} Team\n\nQuestions? See our Knowledgebase and Support Center at {LINK_CONTACT}\n\n------------------------------------------\n\nThis message has been sent automatically by the {SITE_TITLE} system.\nIf you need to contact us, go to {LINK_CONTACT}'),
(93,'email_message_re_ad_approve','Congratulations! Your ad Re-Submission to {ADTITLE} on {SITE_TITLE} has been approved. You can view your item here:\n\n{ADLINK}\n\nThanks for your submission!\n\nRegards,\n{SITE_TITLE} Team\n\nQuestions? See our Knowledgebase and Support Center at {SITE_URL}contact.php\n\n------------------------------------------\n\nThis message has been sent automatically by the {SITE_TITLE} system.\nIf you need to contact us, go to {LINK_CONTACT}'),
(94,'email_message_contact_seller','{SENDER_NAME} {LANG_WANT-TO-CONTACT}.\n\n{LANG_YOUR-AD}  : {ADTITLE}\n{LANG_NAME}     : {SENDER_NAME}\n{LANG_EMAIL}    : {SENDER_EMAIL}\n{LANG_RESUME}    : {RESUME_LINK}\n{LANG_PROFILE}    : {SENDER_PROFILE}\n{LANG_MESSAGE}  : {MESSAGE}\n\n------------------------------------------\nThis message has been sent automatically by the {SITE_TITLE} system.\nIf you need to contact us, go to {LINK_CONTACT}'),
(95,'email_message_post_notification','This message has been sent automatically by the {SITE_TITLE} system.\nIf you need to contact us, go to {LINK_CONTACT}\n-----------------------------------------\nThe following project was recently added to {SITE_TITLE} and fits under your expertise:\n\n{ADTITLE}\n{ADLINK}'),
(96,'email_sub_post_notification','{SITE_TITLE} - {LANG_ADNOTICE}'),
(97,'email_sub_signup_details','{SITE_TITLE} - {LANG_THANKSIGNUP}'),
(98,'email_message_signup_details','Dear Valued Thanks for creating an account {SITE_TITLE} ,\n\nYour username: {USERNAME}\nYour password: {PASSWORD}\n\n\nHave further questions? You can start chat with live support team.\nSincerely,\n\n{SITE_TITLE} Team!\n{SITE_URL}'),
(99,'contact_validation','0'),
(100,'delete_expired','0'),
(101,'validation_time','0'),
(102,'cron_exec_time','300'),
(103,'cron_time','1619502991'),
(104,'external_code',''),
(105,'site_logo_footer','restro-theme_footer_logo.png'),
(106,'blog_enable','1'),
(107,'blog_banner','1'),
(108,'blog_comment_enable','1'),
(109,'blog_comment_approval','2'),
(110,'blog_comment_user','1'),
(111,'show_blog_home','1'),
(112,'testimonials_enable','1'),
(113,'show_testimonials_blog','1'),
(114,'show_testimonials_home','1'),
(115,'instagram_link','https://instagram.com'),
(116,'project_image_field','0'),
(117,'resume_enable','0'),
(118,'company_enable','0'),
(119,'non_active_allow','1'),
(120,'non_active_msg','1'),
(121,'linkedin_link','https://www.linkedin.com/'),
(122,'pinterest_link','https://pinterest.com/'),
(123,'show_search_home','1'),
(124,'show_categories_home','1'),
(125,'show_featured_projects_home','1'),
(126,'show_latest_projects_home','1'),
(127,'find_freelancer_enable','1'),
(128,'cookie_link',''),
(129,'cookie_consent','1'),
(130,'specific_country1','IN'),
(131,'site_url1','http://localhost/quickqr/'),
(132,'quickad_secret_file',''),
(133,'purchase_key',''),
(134,'zechat_on_off','on'),
(135,'wchat_on_off','on'),
(136,'wchat_secret_file',''),
(137,'wchat_purchase_code',''),
(138,'zechat_secret_file',''),
(139,'zechat_purchase_code',''),
(140,'2checkout_sandbox_mode','production'),
(141,'map_type','openstreet'),
(142,'quickchat_socket_on_off','on'),
(143,'quickchat_socket_secret_file',''),
(144,'quickchat_socket_purchase_code',''),
(145,'quickchat_ajax_on_off','off'),
(146,'quickchat_ajax_secret_file',''),
(147,'quickchat_ajax_purchase_code',''),
(148,'location_track_icon','1'),
(149,'auto_detect_location','no'),
(150,'live_location_api','geo_ip_db'),
(151,'resume_files','pdf,doc,docx,rtf,rtx,ppt,pptx,jpeg,jpg,bmp,png'),
(152,'show_featured_jobs_home','1'),
(153,'show_latest_jobs_home','1'),
(154,'termcondition_link',''),
(155,'privacy_link',''),
(156,'socket_host','localhost'),
(157,'socket_port','3302'),
(158,'openstreet_access_token',''),
(159,'paypal_sandbox_mode','Yes'),
(160,'paypal_api_username',''),
(161,'paypal_api_password',''),
(162,'paypal_api_signature',''),
(163,'restaurant_text_editor','1'),
(164,'email_sub_new_order','{RESTAURANT_NAME} - {LANG_NEW_ORDER}'),
(165,'email_message_new_order','{RESTAURANT_NAME}\n\n{LANG_NEW_ORDER}\n\n{LANG_CUSTOMER}: {CUSTOMER_NAME}\n{LANG_TABLE_NUMBER}: {TABLE_NUMBER}\n{LANG_MESSAGE}: {MESSAGE}\n\n{LANG_ORDERS}\n{ORDER}'),
(166,'quickad_user_secret_file',''),
(167,'free_membership_plan','{\"id\":\"free\",\"name\":\"Free Plan\",\"badge\":\"\",\"settings\":{\"category_limit\":5,\"menu_limit\":5,\"scan_limit\":50,\"allow_ordering\":1},\"status\":1}'),
(168,'trial_membership_plan','{\"id\":\"trial\",\"name\":\"Trial Plan\",\"badge\":\"\",\"days\":10,\"settings\":{\"category_limit\":5,\"menu_limit\":5,\"scan_limit\":50,\"allow_ordering\":1,\"custom\":[]},\"status\":1}'),
(169,'paypal_payment_mode','both'),
(170,'stripe_payment_mode','both'),
(171,'admin_allow_online_payment','1'),
(172,'quickorder_enable','0'),
(173,'quickorder_homepage_enable','0'),
(174,'quickorder_whatsapp_message','*New order* (#{ORDER_ID})\n\n{ORDER_DETAILS}\n\nPayable: *{ORDER_TOTAL}*\n\n*Customer details*\n{CUSTOMER_DETAILS}\n\n-----------------------------\nThanks for the order.'),
(175,'try_demo_link',''),
(176,'specific_country','au'),
(177,'site_url','http://localhost/quickqr/');

/*Table structure for table `qr_order_item_extras` */

DROP TABLE IF EXISTS `qr_order_item_extras`;

CREATE TABLE `qr_order_item_extras` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_item_id` int(11) DEFAULT NULL,
  `extra_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `qr_order_item_extras` */

/*Table structure for table `qr_order_items` */

DROP TABLE IF EXISTS `qr_order_items`;

CREATE TABLE `qr_order_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `variation` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `qr_order_items` */

/*Table structure for table `qr_orders` */

DROP TABLE IF EXISTS `qr_orders`;

CREATE TABLE `qr_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `restaurant_id` int(11) DEFAULT NULL,
  `type` enum('on-table','takeaway','delivery') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'on-table',
  `customer_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_number` int(11) DEFAULT NULL,
  `phone_number` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','completed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT 0,
  `is_paid` tinyint(1) NOT NULL DEFAULT 0,
  `payment_gateway` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `qr_orders` */

/*Table structure for table `qr_pages` */

DROP TABLE IF EXISTS `qr_pages`;

CREATE TABLE `qr_pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `translation_lang` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `translation_of` int(10) unsigned DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `type` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `qr_pages` */

/*Table structure for table `qr_payments` */

DROP TABLE IF EXISTS `qr_payments`;

CREATE TABLE `qr_payments` (
  `payment_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `payment_install` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `payment_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_folder` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `qr_payments` */

insert  into `qr_payments`(`payment_id`,`payment_install`,`payment_title`,`payment_folder`,`payment_desc`) values 
(1,'1','Paypal','paypal','You will be redirected to paypal to complete payment.'),
(2,'0','Credit & Debit Card','stripe','Make an instant deposit using online payment service Stripe. Pay with your debit or credit card.'),
(3,'0','Bank Deposit (Offline Payment)','wire_transfer',NULL),
(4,'0','2Checkout','2checkout',NULL),
(5,'0','Paystack','paystack','You will be redirected to Paystack to complete payment.'),
(6,'0','Payumoney','payumoney','You will be redirected to Payumoney to complete payment.'),
(7,'0','Paytm','paytm',NULL),
(8,'0','CCAvenue','ccavenue',NULL),
(9,'0','Mollie','mollie','You will be redirected to Mollie to complete payment.');

/*Table structure for table `qr_plan_options` */

DROP TABLE IF EXISTS `qr_plan_options`;

CREATE TABLE `qr_plan_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `translation_lang` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `translation_name` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(10) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `qr_plan_options` */

/*Table structure for table `qr_plans` */

DROP TABLE IF EXISTS `qr_plans`;

CREATE TABLE `qr_plans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `badge` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `monthly_price` float DEFAULT NULL,
  `annual_price` float DEFAULT NULL,
  `lifetime_price` float DEFAULT NULL,
  `recommended` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `settings` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `taxes_ids` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `qr_plans` */

/*Table structure for table `qr_restaurant` */

DROP TABLE IF EXISTS `qr_restaurant`;

CREATE TABLE `qr_restaurant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` enum('active','pending','rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timing` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `main_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'default.png',
  `cover_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'default.png',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `qr_restaurant` */

/*Table structure for table `qr_restaurant_options` */

DROP TABLE IF EXISTS `qr_restaurant_options`;

CREATE TABLE `qr_restaurant_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `restaurant_id` int(11) DEFAULT NULL,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `option_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `qr_restaurant_options` */

/*Table structure for table `qr_restaurant_view` */

DROP TABLE IF EXISTS `qr_restaurant_view`;

CREATE TABLE `qr_restaurant_view` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `restaurant_id` int(11) DEFAULT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `qr_restaurant_view` */

/*Table structure for table `qr_subscriptions` */

DROP TABLE IF EXISTS `qr_subscriptions`;

CREATE TABLE `qr_subscriptions` (
  `sub_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sub_title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_term` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'MONTHLY',
  `sub_amount` double(8,2) NOT NULL DEFAULT 0.00,
  `sub_image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group_id` smallint(10) DEFAULT NULL,
  `pay_mode` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `recommended` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `discount_badge` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`sub_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `qr_subscriptions` */

insert  into `qr_subscriptions`(`sub_id`,`sub_title`,`sub_term`,`sub_amount`,`sub_image`,`group_id`,`pay_mode`,`active`,`recommended`,`discount_badge`) values 
(7,'Free','MONTHLY',0.00,'',1,'one_time',1,'no',''),
(8,'Standard Plan','MONTHLY',19.00,'',2,'one_time',1,'yes',''),
(9,'Extended Plan','YEARLY',99.00,'',4,'one_time',1,'no','');

/*Table structure for table `qr_taxes` */

DROP TABLE IF EXISTS `qr_taxes`;

CREATE TABLE `qr_taxes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `internal_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` decimal(10,2) DEFAULT NULL,
  `value_type` enum('percentage','fixed') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('inclusive','exclusive') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_type` enum('personal','business','both') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `countries` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `qr_taxes` */

/*Table structure for table `qr_testimonials` */

DROP TABLE IF EXISTS `qr_testimonials`;

CREATE TABLE `qr_testimonials` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `designation` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `qr_testimonials` */

insert  into `qr_testimonials`(`id`,`name`,`designation`,`content`,`image`) values 
(1,'Tony Stark','Social Marketing','Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla paria tur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',NULL),
(2,'Steve Roger','Content Writer','Elitsed do eiusmod tempor incididunt ut labore et dolore magna aliqua Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip e',NULL),
(3,'Natasha','Designer','Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commo do consequat. Elitsed do eiusmod tempor incididunt ut labore et dolore magna aliqua',NULL);

/*Table structure for table `qr_time_zones` */

DROP TABLE IF EXISTS `qr_time_zones`;

CREATE TABLE `qr_time_zones` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country_code` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_zone_id` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `gmt` float DEFAULT NULL,
  `dst` float DEFAULT NULL,
  `raw` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `time_zone_id` (`time_zone_id`),
  KEY `country_code` (`country_code`)
) ENGINE=InnoDB AUTO_INCREMENT=248 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `qr_time_zones` */

insert  into `qr_time_zones`(`id`,`country_code`,`time_zone_id`,`gmt`,`dst`,`raw`) values 
(1,'AD','Europe/Andorra',1,2,1),
(2,'AE','Asia/Dubai',4,4,4),
(3,'AF','Asia/Kabul',4.5,4.5,4.5),
(4,'AG','America/Antigua',-4,-4,-4),
(5,'AI','America/Anguilla',-4,-4,-4),
(6,'AL','Europe/Tirane',1,2,1),
(7,'AM','Asia/Yerevan',4,4,4),
(8,'AO','Africa/Luanda',1,1,1),
(9,'AQ','Antarctica/Casey',8,8,8),
(10,'AR','America/Argentina/Buenos_Aires',-3,-3,-3),
(11,'AS','Pacific/Pago_Pago',-11,-11,-11),
(12,'AT','Europe/Vienna',1,2,1),
(13,'AU','Antarctica/Macquarie',11,11,11),
(14,'AW','America/Aruba',-4,-4,-4),
(15,'AX','Europe/Mariehamn',2,3,2),
(16,'AZ','Asia/Baku',4,5,4),
(17,'BA','Europe/Sarajevo',1,2,1),
(18,'BB','America/Barbados',-4,-4,-4),
(19,'BD','Asia/Dhaka',6,6,6),
(20,'BE','Europe/Brussels',1,2,1),
(21,'BF','Africa/Ouagadougou',0,0,0),
(22,'BG','Europe/Sofia',2,3,2),
(23,'BH','Asia/Bahrain',3,3,3),
(24,'BI','Africa/Bujumbura',2,2,2),
(25,'BJ','Africa/Porto-Novo',1,1,1),
(26,'BL','America/St_Barthelemy',-4,-4,-4),
(27,'BM','Atlantic/Bermuda',-4,-3,-4),
(28,'BN','Asia/Brunei',8,8,8),
(29,'BO','America/La_Paz',-4,-4,-4),
(30,'BQ','America/Kralendijk',-4,-4,-4),
(31,'BR','America/Araguaina',-3,-3,-3),
(32,'BS','America/Nassau',-5,-4,-5),
(33,'BT','Asia/Thimphu',6,6,6),
(34,'BW','Africa/Gaborone',2,2,2),
(35,'BY','Europe/Minsk',3,3,3),
(36,'BZ','America/Belize',-6,-6,-6),
(37,'CA','America/Atikokan',-5,-5,-5),
(38,'CC','Indian/Cocos',6.5,6.5,6.5),
(39,'CD','Africa/Kinshasa',1,1,1),
(40,'CF','Africa/Bangui',1,1,1),
(41,'CG','Africa/Brazzaville',1,1,1),
(42,'CH','Europe/Zurich',1,2,1),
(43,'CI','Africa/Abidjan',0,0,0),
(44,'CK','Pacific/Rarotonga',-10,-10,-10),
(45,'CL','America/Santiago',-3,-3,-3),
(46,'CM','Africa/Douala',1,1,1),
(47,'CN','Asia/Shanghai',8,8,8),
(48,'CO','America/Bogota',-5,-5,-5),
(49,'CR','America/Costa_Rica',-6,-6,-6),
(50,'CU','America/Havana',-5,-4,-5),
(51,'CV','Atlantic/Cape_Verde',-1,-1,-1),
(52,'CW','America/Curacao',-4,-4,-4),
(53,'CX','Indian/Christmas',7,7,7),
(54,'CY','Asia/Nicosia',2,3,2),
(55,'CZ','Europe/Prague',1,2,1),
(56,'DE','Europe/Berlin',1,2,1),
(57,'DJ','Africa/Djibouti',3,3,3),
(58,'DK','Europe/Copenhagen',1,2,1),
(59,'DM','America/Dominica',-4,-4,-4),
(60,'DO','America/Santo_Domingo',-4,-4,-4),
(61,'DZ','Africa/Algiers',1,1,1),
(62,'EC','America/Guayaquil',-5,-5,-5),
(63,'EE','Europe/Tallinn',2,3,2),
(64,'EG','Africa/Cairo',2,2,2),
(65,'EH','Africa/El_Aaiun',0,0,0),
(66,'ER','Africa/Asmara',3,3,3),
(67,'ES','Africa/Ceuta',1,2,1),
(68,'ET','Africa/Addis_Ababa',3,3,3),
(69,'FI','Europe/Helsinki',2,3,2),
(70,'FJ','Pacific/Fiji',13,12,12),
(71,'FK','Atlantic/Stanley',-3,-3,-3),
(72,'FM','Pacific/Chuuk',10,10,10),
(73,'FO','Atlantic/Faroe',0,1,0),
(74,'FR','Europe/Paris',1,2,1),
(75,'GA','Africa/Libreville',1,1,1),
(76,'GD','America/Grenada',-4,-4,-4),
(77,'GE','Asia/Tbilisi',4,4,4),
(78,'GF','America/Cayenne',-3,-3,-3),
(79,'GG','Europe/Guernsey',0,1,0),
(80,'GH','Africa/Accra',0,0,0),
(81,'GI','Europe/Gibraltar',1,2,1),
(82,'GL','America/Danmarkshavn',0,0,0),
(83,'GM','Africa/Banjul',0,0,0),
(84,'GN','Africa/Conakry',0,0,0),
(85,'GP','America/Guadeloupe',-4,-4,-4),
(86,'GQ','Africa/Malabo',1,1,1),
(87,'GR','Europe/Athens',2,3,2),
(88,'GS','Atlantic/South_Georgia',-2,-2,-2),
(89,'GT','America/Guatemala',-6,-6,-6),
(90,'GU','Pacific/Guam',10,10,10),
(91,'GW','Africa/Bissau',0,0,0),
(92,'GY','America/Guyana',-4,-4,-4),
(93,'HK','Asia/Hong_Kong',8,8,8),
(94,'HN','America/Tegucigalpa',-6,-6,-6),
(95,'HR','Europe/Zagreb',1,2,1),
(96,'HT','America/Port-au-Prince',-5,-4,-5),
(97,'HU','Europe/Budapest',1,2,1),
(98,'ID','Asia/Jakarta',7,7,7),
(99,'IE','Europe/Dublin',0,1,0),
(100,'IL','Asia/Jerusalem',2,3,2),
(101,'IM','Europe/Isle_of_Man',0,1,0),
(102,'IN','Asia/Kolkata',5.5,5.5,5.5),
(103,'IO','Indian/Chagos',6,6,6),
(104,'IQ','Asia/Baghdad',3,3,3),
(105,'IR','Asia/Tehran',3.5,4.5,3.5),
(106,'IS','Atlantic/Reykjavik',0,0,0),
(107,'IT','Europe/Rome',1,2,1),
(108,'JE','Europe/Jersey',0,1,0),
(109,'JM','America/Jamaica',-5,-5,-5),
(110,'JO','Asia/Amman',2,3,2),
(111,'JP','Asia/Tokyo',9,9,9),
(112,'KE','Africa/Nairobi',3,3,3),
(113,'KG','Asia/Bishkek',6,6,6),
(114,'KH','Asia/Phnom_Penh',7,7,7),
(115,'KI','Pacific/Enderbury',13,13,13),
(116,'KM','Indian/Comoro',3,3,3),
(117,'KN','America/St_Kitts',-4,-4,-4),
(118,'KP','Asia/Pyongyang',9,9,9),
(119,'KR','Asia/Seoul',9,9,9),
(120,'KW','Asia/Kuwait',3,3,3),
(121,'KY','America/Cayman',-5,-5,-5),
(122,'KZ','Asia/Almaty',6,6,6),
(123,'LA','Asia/Vientiane',7,7,7),
(124,'LB','Asia/Beirut',2,3,2),
(125,'LC','America/St_Lucia',-4,-4,-4),
(126,'LI','Europe/Vaduz',1,2,1),
(127,'LK','Asia/Colombo',5.5,5.5,5.5),
(128,'LR','Africa/Monrovia',0,0,0),
(129,'LS','Africa/Maseru',2,2,2),
(130,'LT','Europe/Vilnius',2,3,2),
(131,'LU','Europe/Luxembourg',1,2,1),
(132,'LV','Europe/Riga',2,3,2),
(133,'LY','Africa/Tripoli',2,2,2),
(134,'MA','Africa/Casablanca',0,0,0),
(135,'MC','Europe/Monaco',1,2,1),
(136,'MD','Europe/Chisinau',2,3,2),
(137,'ME','Europe/Podgorica',1,2,1),
(138,'MF','America/Marigot',-4,-4,-4),
(139,'MG','Indian/Antananarivo',3,3,3),
(140,'MH','Pacific/Kwajalein',12,12,12),
(141,'MK','Europe/Skopje',1,2,1),
(142,'ML','Africa/Bamako',0,0,0),
(143,'MM','Asia/Rangoon',6.5,6.5,6.5),
(144,'MN','Asia/Choibalsan',8,8,8),
(145,'MO','Asia/Macau',8,8,8),
(146,'MP','Pacific/Saipan',10,10,10),
(147,'MQ','America/Martinique',-4,-4,-4),
(148,'MR','Africa/Nouakchott',0,0,0),
(149,'MS','America/Montserrat',-4,-4,-4),
(150,'MT','Europe/Malta',1,2,1),
(151,'MU','Indian/Mauritius',4,4,4),
(152,'MV','Indian/Maldives',5,5,5),
(153,'MW','Africa/Blantyre',2,2,2),
(154,'MX','America/Bahia_Banderas',-6,-5,-6),
(155,'MY','Asia/Kuala_Lumpur',8,8,8),
(156,'MZ','Africa/Maputo',2,2,2),
(157,'NA','Africa/Windhoek',2,1,1),
(158,'NC','Pacific/Noumea',11,11,11),
(159,'NE','Africa/Niamey',1,1,1),
(160,'NF','Pacific/Norfolk',11.5,11.5,11.5),
(161,'NG','Africa/Lagos',1,1,1),
(162,'NI','America/Managua',-6,-6,-6),
(163,'NL','Europe/Amsterdam',1,2,1),
(164,'NO','Europe/Oslo',1,2,1),
(165,'NP','Asia/Kathmandu',5.75,5.75,5.75),
(166,'NR','Pacific/Nauru',12,12,12),
(167,'NU','Pacific/Niue',-11,-11,-11),
(168,'NZ','Pacific/Auckland',13,12,12),
(169,'OM','Asia/Muscat',4,4,4),
(170,'PA','America/Panama',-5,-5,-5),
(171,'PE','America/Lima',-5,-5,-5),
(172,'PF','Pacific/Gambier',-9,-9,-9),
(173,'PG','Pacific/Bougainville',11,11,11),
(174,'PH','Asia/Manila',8,8,8),
(175,'PK','Asia/Karachi',5,5,5),
(176,'PL','Europe/Warsaw',1,2,1),
(177,'PM','America/Miquelon',-3,-2,-3),
(178,'PN','Pacific/Pitcairn',-8,-8,-8),
(179,'PR','America/Puerto_Rico',-4,-4,-4),
(180,'PS','Asia/Gaza',2,3,2),
(181,'PT','Atlantic/Azores',-1,0,-1),
(182,'PW','Pacific/Palau',9,9,9),
(183,'PY','America/Asuncion',-3,-4,-4),
(184,'QA','Asia/Qatar',3,3,3),
(185,'RE','Indian/Reunion',4,4,4),
(186,'RO','Europe/Bucharest',2,3,2),
(187,'RS','Europe/Belgrade',1,2,1),
(188,'RU','Asia/Anadyr',12,12,12),
(189,'RW','Africa/Kigali',2,2,2),
(190,'SA','Asia/Riyadh',3,3,3),
(191,'SB','Pacific/Guadalcanal',11,11,11),
(192,'SC','Indian/Mahe',4,4,4),
(193,'SD','Africa/Khartoum',3,3,3),
(194,'SE','Europe/Stockholm',1,2,1),
(195,'SG','Asia/Singapore',8,8,8),
(196,'SH','Atlantic/St_Helena',0,0,0),
(197,'SI','Europe/Ljubljana',1,2,1),
(198,'SJ','Arctic/Longyearbyen',1,2,1),
(199,'SK','Europe/Bratislava',1,2,1),
(200,'SL','Africa/Freetown',0,0,0),
(201,'SM','Europe/San_Marino',1,2,1),
(202,'SN','Africa/Dakar',0,0,0),
(203,'SO','Africa/Mogadishu',3,3,3),
(204,'SR','America/Paramaribo',-3,-3,-3),
(205,'SS','Africa/Juba',3,3,3),
(206,'ST','Africa/Sao_Tome',0,0,0),
(207,'SV','America/El_Salvador',-6,-6,-6),
(208,'SX','America/Lower_Princes',-4,-4,-4),
(209,'SY','Asia/Damascus',2,3,2),
(210,'SZ','Africa/Mbabane',2,2,2),
(211,'TC','America/Grand_Turk',-5,-4,-5),
(212,'TD','Africa/Ndjamena',1,1,1),
(213,'TF','Indian/Kerguelen',5,5,5),
(214,'TG','Africa/Lome',0,0,0),
(215,'TH','Asia/Bangkok',7,7,7),
(216,'TJ','Asia/Dushanbe',5,5,5),
(217,'TK','Pacific/Fakaofo',13,13,13),
(218,'TL','Asia/Dili',9,9,9),
(219,'TM','Asia/Ashgabat',5,5,5),
(220,'TN','Africa/Tunis',1,1,1),
(221,'TO','Pacific/Tongatapu',13,13,13),
(222,'TR','Europe/Istanbul',2,3,2),
(223,'TT','America/Port_of_Spain',-4,-4,-4),
(224,'TV','Pacific/Funafuti',12,12,12),
(225,'TW','Asia/Taipei',8,8,8),
(226,'TZ','Africa/Dar_es_Salaam',3,3,3),
(227,'UA','Europe/Kiev',2,3,2),
(228,'UG','Africa/Kampala',3,3,3),
(229,'UK','Europe/London',0,1,0),
(230,'UM','Pacific/Johnston',-10,-10,-10),
(231,'US','America/Adak',-10,-9,-10),
(232,'UY','America/Montevideo',-2,-3,-3),
(233,'UZ','Asia/Samarkand',5,5,5),
(234,'VA','Europe/Vatican',1,2,1),
(235,'VC','America/St_Vincent',-4,-4,-4),
(236,'VE','America/Caracas',-4.5,-4.5,-4.5),
(237,'VG','America/Tortola',-4,-4,-4),
(238,'VI','America/St_Thomas',-4,-4,-4),
(239,'VN','Asia/Ho_Chi_Minh',7,7,7),
(240,'VU','Pacific/Efate',11,11,11),
(241,'WF','Pacific/Wallis',12,12,12),
(242,'WS','Pacific/Apia',14,13,13),
(243,'YE','Asia/Aden',3,3,3),
(244,'YT','Indian/Mayotte',3,3,3),
(245,'ZA','Africa/Johannesburg',2,2,2),
(246,'ZM','Africa/Lusaka',2,2,2),
(247,'ZW','Africa/Harare',2,2,2);

/*Table structure for table `qr_transaction` */

DROP TABLE IF EXISTS `qr_transaction`;

CREATE TABLE `qr_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `amount` double(9,2) DEFAULT NULL,
  `base_amount` double(9,2) DEFAULT NULL,
  `featured` enum('0','1') COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `urgent` enum('0','1') COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `highlight` enum('0','1') COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `transaction_time` int(11) DEFAULT NULL,
  `status` enum('pending','success','failed','cancel') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_gatway` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_ip` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_method` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `frequency` enum('MONTHLY','YEARLY','LIFETIME') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `taxes_ids` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `qr_transaction` */

/*Table structure for table `qr_upgrades` */

DROP TABLE IF EXISTS `qr_upgrades`;

CREATE TABLE `qr_upgrades` (
  `upgrade_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sub_id` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `user_id` int(11) unsigned NOT NULL DEFAULT 0,
  `pay_mode` enum('one_time','recurring') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'one_time',
  `upgrade_lasttime` bigint(20) unsigned NOT NULL DEFAULT 0,
  `upgrade_expires` bigint(20) unsigned NOT NULL DEFAULT 0,
  `unique_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paypal_subscription_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paypal_profile_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_customer_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_subscription_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authorizenet_subscription_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_day` int(2) DEFAULT NULL,
  `length` int(4) DEFAULT NULL,
  `interval` int(4) DEFAULT NULL,
  `trial_days` int(4) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_trial_ends` date DEFAULT NULL,
  `date_canceled` datetime DEFAULT NULL,
  `date_created` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`upgrade_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `qr_upgrades` */

/*Table structure for table `qr_user` */

DROP TABLE IF EXISTS `qr_user`;

CREATE TABLE `qr_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'free',
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_type` enum('user','employer') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `balance` float(10,2) NOT NULL DEFAULT 0.00,
  `password_hash` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `forgot` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirm` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('0','1','2') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `view` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tagline` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `salary_min` bigint(20) NOT NULL DEFAULT 0,
  `salary_max` bigint(20) NOT NULL DEFAULT 0,
  `category` int(11) DEFAULT NULL,
  `subcategory` int(11) DEFAULT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sex` enum('Male','Female','Other') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_code` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state_code` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default_user.png',
  `lastactive` datetime DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `googleplus` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oauth_provider` enum('','facebook','google','twitter') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oauth_uid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oauth_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `online` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `notify` enum('0','1') COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `notify_cat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menu_layout` enum('both','grid','list') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'both',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `qr_user` */

/*Table structure for table `qr_user_options` */

DROP TABLE IF EXISTS `qr_user_options`;

CREATE TABLE `qr_user_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `option_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `qr_user_options` */

/*Table structure for table `qr_usergroups` */

DROP TABLE IF EXISTS `qr_usergroups`;

CREATE TABLE `qr_usergroups` (
  `group_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_removable` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `group_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_limit` int(11) NOT NULL DEFAULT 0,
  `menu_limit` int(11) NOT NULL DEFAULT 0,
  `scan_limit` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `qr_usergroups` */

insert  into `qr_usergroups`(`group_id`,`group_removable`,`group_name`,`category_limit`,`menu_limit`,`scan_limit`) values 
(1,0,'Registerd users (Free)',5,5,200),
(2,0,'Basic Member',999,999,999),
(4,0,'Bussiness Member',999,999,999);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
