
-- Dump of TYPO3 Connection "Default"
-- MariaDB dump 10.19  Distrib 10.5.15-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	10.4.26-MariaDB-1:10.4.26+maria~ubu2004-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `backend_layout`
--

DROP TABLE IF EXISTS `backend_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backend_layout` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `config` text COLLATE utf8_unicode_ci NOT NULL,
  `icon` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend_layout`
--

LOCK TABLES `backend_layout` WRITE;
/*!40000 ALTER TABLE `backend_layout` DISABLE KEYS */;
/*!40000 ALTER TABLE `backend_layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `be_dashboards`
--

DROP TABLE IF EXISTS `be_dashboards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `be_dashboards` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `endtime` int(10) unsigned NOT NULL DEFAULT 0,
  `identifier` varchar(120) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(120) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `widgets` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `be_dashboards`
--

LOCK TABLES `be_dashboards` WRITE;
/*!40000 ALTER TABLE `be_dashboards` DISABLE KEYS */;
INSERT INTO `be_dashboards` VALUES (1,0,1670958873,1670958873,1,0,0,0,0,'23f352dc500c9594c7b0d00b0cc38c55d514c250','My dashboard','{\"645a86ac6f295dcde42cd7303f5af334eb7bd21a\":{\"identifier\":\"t3information\"},\"bae084f2ed4f489ff0b13d697eb83620a8d758a1\":{\"identifier\":\"docGettingStarted\"}}');
/*!40000 ALTER TABLE `be_dashboards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `be_groups`
--

DROP TABLE IF EXISTS `be_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `be_groups` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `non_exclude_fields` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `explicit_allowdeny` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `allowed_languages` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `custom_options` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `db_mountpoints` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `pagetypes_select` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `tables_select` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `tables_modify` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `groupMods` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `availableWidgets` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `mfa_providers` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_mountpoints` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_permissions` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `TSconfig` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `subgroup` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `workspace_perms` smallint(6) NOT NULL DEFAULT 1,
  `category_perms` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `be_groups`
--

LOCK TABLES `be_groups` WRITE;
/*!40000 ALTER TABLE `be_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `be_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `be_sessions`
--

DROP TABLE IF EXISTS `be_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `be_sessions` (
  `ses_id` varchar(190) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ses_iplock` varchar(39) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ses_userid` int(10) unsigned NOT NULL DEFAULT 0,
  `ses_tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `ses_data` longblob DEFAULT NULL,
  PRIMARY KEY (`ses_id`),
  KEY `ses_tstamp` (`ses_tstamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `be_sessions`
--

LOCK TABLES `be_sessions` WRITE;
/*!40000 ALTER TABLE `be_sessions` DISABLE KEYS */;
INSERT INTO `be_sessions` VALUES ('085110adb514fd2e5f26235aed0e644520c580bd86fea2db8a6f104d5f712630','[DISABLED]',1,1671036410,'a:1:{s:26:\"formProtectionSessionToken\";s:64:\"fdaa06b056833d5cae8cc962ecbc4adfd1828f2d51faf02715cca176cea2c69a\";}');
/*!40000 ALTER TABLE `be_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `be_users`
--

DROP TABLE IF EXISTS `be_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `be_users` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `disable` smallint(5) unsigned NOT NULL DEFAULT 0,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `endtime` int(10) unsigned NOT NULL DEFAULT 0,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `avatar` int(10) unsigned NOT NULL DEFAULT 0,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `admin` smallint(5) unsigned NOT NULL DEFAULT 0,
  `usergroup` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `db_mountpoints` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `options` smallint(5) unsigned NOT NULL DEFAULT 0,
  `realName` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userMods` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `allowed_languages` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `uc` mediumblob DEFAULT NULL,
  `file_mountpoints` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_permissions` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `workspace_perms` smallint(6) NOT NULL DEFAULT 1,
  `TSconfig` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastlogin` int(10) unsigned NOT NULL DEFAULT 0,
  `workspace_id` int(11) NOT NULL DEFAULT 0,
  `mfa` mediumblob DEFAULT NULL,
  `category_perms` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_reset_token` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`),
  KEY `username` (`username`),
  KEY `parent` (`pid`,`deleted`,`disable`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `be_users`
--

LOCK TABLES `be_users` WRITE;
/*!40000 ALTER TABLE `be_users` DISABLE KEYS */;
INSERT INTO `be_users` VALUES (1,0,1670958744,1670958744,0,0,0,0,0,NULL,'monobloc',0,'$argon2i$v=19$m=65536,t=16,p=1$S1dDVjJTSnhUVjJJemVGNg$y8X7rmEAcNlDOxjgmS5iTFOP0kTrTfewM3D9VjLcFMo',1,NULL,'default','',NULL,0,'',NULL,'','a:11:{s:14:\"interfaceSetup\";s:7:\"backend\";s:10:\"moduleData\";a:7:{s:28:\"dashboard/current_dashboard/\";s:40:\"23f352dc500c9594c7b0d00b0cc38c55d514c250\";s:10:\"web_layout\";a:3:{s:8:\"function\";s:1:\"1\";s:8:\"language\";s:1:\"0\";s:19:\"constant_editor_cat\";N;}s:57:\"TYPO3\\CMS\\Backend\\Utility\\BackendUtility::getUpdateSignal\";a:1:{s:14:\"updatePageTree\";a:2:{s:3:\"set\";s:14:\"updatePageTree\";s:9:\"parameter\";s:0:\"\";}}s:6:\"web_ts\";a:3:{s:8:\"function\";s:85:\"TYPO3\\CMS\\Tstemplate\\Controller\\TypoScriptTemplateInformationModuleFunctionController\";s:8:\"language\";N;s:19:\"constant_editor_cat\";s:0:\"\";}s:10:\"FormEngine\";a:2:{i:0;a:1:{s:32:\"696addfecc296b326ff6e9f04c7ff3e1\";a:4:{i:0;s:4:\"Home\";i:1;a:5:{s:4:\"edit\";a:1:{s:5:\"pages\";a:1:{i:1;s:4:\"edit\";}}s:7:\"defVals\";N;s:12:\"overrideVals\";N;s:11:\"columnsOnly\";N;s:6:\"noView\";N;}i:2;s:28:\"&edit%5Bpages%5D%5B1%5D=edit\";i:3;a:5:{s:5:\"table\";s:5:\"pages\";s:3:\"uid\";i:1;s:3:\"pid\";i:0;s:3:\"cmd\";s:4:\"edit\";s:12:\"deleteAccess\";b:1;}}}i:1;s:32:\"696addfecc296b326ff6e9f04c7ff3e1\";}s:16:\"opendocs::recent\";a:1:{s:32:\"86205c5935270b8ee413592ec1b62292\";a:4:{i:0;s:8:\"NEW SITE\";i:1;a:5:{s:4:\"edit\";a:1:{s:12:\"sys_template\";a:1:{i:1;s:4:\"edit\";}}s:7:\"defVals\";N;s:12:\"overrideVals\";N;s:11:\"columnsOnly\";N;s:6:\"noView\";N;}i:2;s:35:\"&edit%5Bsys_template%5D%5B1%5D=edit\";i:3;a:5:{s:5:\"table\";s:12:\"sys_template\";s:3:\"uid\";i:1;s:3:\"pid\";i:1;s:3:\"cmd\";s:4:\"edit\";s:12:\"deleteAccess\";b:1;}}}s:8:\"web_list\";a:3:{s:8:\"function\";N;s:8:\"language\";N;s:19:\"constant_editor_cat\";N;}}s:14:\"emailMeAtLogin\";i:0;s:8:\"titleLen\";i:50;s:8:\"edit_RTE\";s:1:\"1\";s:20:\"edit_docModuleUpload\";s:1:\"1\";s:25:\"resizeTextareas_MaxHeight\";i:500;s:4:\"lang\";s:7:\"default\";s:19:\"firstLoginTimeStamp\";i:1670958872;s:15:\"moduleSessionID\";a:7:{s:28:\"dashboard/current_dashboard/\";s:40:\"d4a15a9ebb9a06fb7b9ee3ab02b27c4e12193938\";s:10:\"web_layout\";s:40:\"d4a15a9ebb9a06fb7b9ee3ab02b27c4e12193938\";s:57:\"TYPO3\\CMS\\Backend\\Utility\\BackendUtility::getUpdateSignal\";s:40:\"d4a15a9ebb9a06fb7b9ee3ab02b27c4e12193938\";s:6:\"web_ts\";s:40:\"d4a15a9ebb9a06fb7b9ee3ab02b27c4e12193938\";s:10:\"FormEngine\";s:40:\"d4a15a9ebb9a06fb7b9ee3ab02b27c4e12193938\";s:16:\"opendocs::recent\";s:40:\"d4a15a9ebb9a06fb7b9ee3ab02b27c4e12193938\";s:8:\"web_list\";s:40:\"d4a15a9ebb9a06fb7b9ee3ab02b27c4e12193938\";}s:17:\"BackendComponents\";a:1:{s:6:\"States\";a:1:{s:8:\"Pagetree\";a:1:{s:9:\"stateHash\";a:5:{s:3:\"0_0\";s:1:\"1\";s:3:\"0_1\";s:1:\"1\";s:3:\"0_4\";s:1:\"1\";s:3:\"0_3\";s:1:\"1\";s:3:\"0_7\";s:1:\"1\";}}}}}',NULL,NULL,1,NULL,1671036371,0,NULL,NULL,''),(2,0,1670958807,1670958807,0,0,0,0,0,NULL,'_cli_',0,'$argon2i$v=19$m=65536,t=16,p=1$VmR3TEdWeW9KY0dwZGtxZA$Ba0HfbI7ghtpjzz1sQYoOhhgNfLPFs0a1+E37/dzgvQ',1,NULL,'default','',NULL,0,'',NULL,'','a:9:{s:14:\"interfaceSetup\";s:0:\"\";s:10:\"moduleData\";a:0:{}s:14:\"emailMeAtLogin\";i:0;s:8:\"titleLen\";i:50;s:8:\"edit_RTE\";s:1:\"1\";s:20:\"edit_docModuleUpload\";s:1:\"1\";s:25:\"resizeTextareas_MaxHeight\";i:500;s:4:\"lang\";s:7:\"default\";s:19:\"firstLoginTimeStamp\";i:1670958807;}',NULL,NULL,1,NULL,0,0,NULL,NULL,'');
/*!40000 ALTER TABLE `be_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_hash`
--

DROP TABLE IF EXISTS `cache_hash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_hash` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` int(10) unsigned NOT NULL DEFAULT 0,
  `content` longblob DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(180),`expires`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_hash`
--

LOCK TABLES `cache_hash` WRITE;
/*!40000 ALTER TABLE `cache_hash` DISABLE KEYS */;
INSERT INTO `cache_hash` VALUES (1,'6e3ee4ef3581548f477641f7182f08ad',2145909600,'a:3:{s:8:\"options.\";a:8:{s:15:\"enableBookmarks\";s:1:\"1\";s:10:\"file_list.\";a:3:{s:23:\"enableDisplayThumbnails\";s:10:\"selectable\";s:15:\"enableClipBoard\";s:10:\"selectable\";s:10:\"thumbnail.\";a:2:{s:5:\"width\";s:2:\"64\";s:6:\"height\";s:2:\"64\";}}s:9:\"pageTree.\";a:1:{s:31:\"doktypesToShowInNewPageDragArea\";s:25:\"1,6,4,7,3,254,255,199,101\";}s:12:\"contextMenu.\";a:1:{s:6:\"table.\";a:3:{s:6:\"pages.\";a:2:{s:12:\"disableItems\";s:0:\"\";s:5:\"tree.\";a:1:{s:12:\"disableItems\";s:0:\"\";}}s:9:\"sys_file.\";a:2:{s:12:\"disableItems\";s:0:\"\";s:5:\"tree.\";a:1:{s:12:\"disableItems\";s:0:\"\";}}s:15:\"sys_filemounts.\";a:2:{s:12:\"disableItems\";s:0:\"\";s:5:\"tree.\";a:1:{s:12:\"disableItems\";s:0:\"\";}}}}s:11:\"saveDocView\";s:1:\"1\";s:10:\"saveDocNew\";s:1:\"1\";s:11:\"saveDocNew.\";a:3:{s:5:\"pages\";s:1:\"0\";s:8:\"sys_file\";s:1:\"0\";s:17:\"sys_file_metadata\";s:1:\"0\";}s:14:\"disableDelete.\";a:1:{s:8:\"sys_file\";s:1:\"1\";}}s:9:\"admPanel.\";a:1:{s:7:\"enable.\";a:1:{s:3:\"all\";s:1:\"1\";}}s:12:\"TCAdefaults.\";a:1:{s:9:\"sys_note.\";a:2:{s:6:\"author\";s:0:\"\";s:5:\"email\";s:0:\"\";}}}'),(2,'618162543429733d4a84c4bbeaab3c37',2145909600,'a:2:{i:0;a:3:{s:8:\"TSconfig\";a:5:{s:4:\"mod.\";a:6:{s:11:\"web_layout.\";a:3:{s:11:\"tt_content.\";a:1:{s:8:\"preview.\";a:4:{s:18:\"mono_site_col50-50\";s:56:\"EXT:container/Resources/Private/Templates/Container.html\";s:18:\"mono_site_col40-40\";s:56:\"EXT:container/Resources/Private/Templates/Container.html\";s:18:\"mono_site_col40-60\";s:56:\"EXT:container/Resources/Private/Templates/Container.html\";s:19:\"mono_site_pipelines\";s:56:\"EXT:container/Resources/Private/Templates/Container.html\";}}s:15:\"BackendLayouts.\";a:1:{s:8:\"Default.\";a:2:{s:5:\"title\";s:7:\"Default\";s:7:\"config.\";a:1:{s:15:\"backend_layout.\";a:3:{s:8:\"colCount\";s:1:\"1\";s:8:\"rowCount\";s:1:\"1\";s:5:\"rows.\";a:1:{s:2:\"1.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:7:\"Content\";s:6:\"colPos\";s:1:\"0\";s:11:\"no_allowed.\";a:2:{s:5:\"CType\";s:1:\"*\";s:9:\"list_type\";s:1:\"*\";}}}}}}}}}s:13:\"localization.\";a:1:{s:10:\"enableCopy\";s:1:\"0\";}}s:8:\"wizards.\";a:2:{s:18:\"newContentElement.\";a:1:{s:12:\"wizardItems.\";a:5:{s:10:\"container.\";a:3:{s:6:\"header\";s:68:\"LLL:EXT:container/Resources/Private/Language/locallang.xlf:container\";s:4:\"show\";s:1:\"*\";s:9:\"elements.\";a:4:{s:19:\"mono_site_col50-50.\";a:5:{s:5:\"title\";s:19:\"2 Spalten Container\";s:11:\"description\";s:24:\"2 Spalten gleiche Breite\";s:14:\"iconIdentifier\";s:18:\"mono_site_col50-50\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:18:\"mono_site_col50-50\";}s:12:\"saveAndClose\";s:1:\"1\";}s:19:\"mono_site_col40-40.\";a:5:{s:5:\"title\";s:12:\"Profilkarten\";s:11:\"description\";s:0:\"\";s:14:\"iconIdentifier\";s:18:\"mono_site_col40-40\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:18:\"mono_site_col40-40\";}s:12:\"saveAndClose\";s:1:\"1\";}s:19:\"mono_site_col40-60.\";a:5:{s:5:\"title\";s:27:\"2 Spalten Container 40 - 60\";s:11:\"description\";s:17:\"2 Spalten 40 - 60\";s:14:\"iconIdentifier\";s:18:\"mono_site_col40-60\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:18:\"mono_site_col40-60\";}s:12:\"saveAndClose\";s:1:\"1\";}s:20:\"mono_site_pipelines.\";a:5:{s:5:\"title\";s:9:\"Pipelines\";s:11:\"description\";s:9:\"Pipelines\";s:14:\"iconIdentifier\";s:19:\"mono_site_pipelines\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:19:\"mono_site_pipelines\";}s:12:\"saveAndClose\";s:1:\"1\";}}}s:6:\"forms.\";a:3:{s:6:\"header\";s:80:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:forms\";s:4:\"show\";s:20:\"formframework,search\";s:9:\"elements.\";a:2:{s:14:\"formframework.\";a:4:{s:14:\"iconIdentifier\";s:12:\"content-form\";s:5:\"title\";s:75:\"LLL:EXT:form/Resources/Private/Language/locallang.xlf:form_new_wizard_title\";s:11:\"description\";s:81:\"LLL:EXT:form/Resources/Private/Language/locallang.xlf:form_new_wizard_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:18:\"form_formframework\";}}s:7:\"search.\";a:4:{s:14:\"iconIdentifier\";s:27:\"content-elements-searchform\";s:5:\"title\";s:79:\"LLL:EXT:indexed_search/Resources/Private/Language/locallang_db.xlf:plugin_title\";s:11:\"description\";s:85:\"LLL:EXT:indexed_search/Resources/Private/Language/locallang_db.xlf:plugin_description\";s:21:\"tt_content_defValues.\";a:2:{s:5:\"CType\";s:4:\"list\";s:9:\"list_type\";s:17:\"indexedsearch_pi2\";}}}}s:8:\"plugins.\";a:3:{s:6:\"header\";s:82:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:plugins\";s:9:\"elements.\";a:2:{s:8:\"general.\";a:4:{s:14:\"iconIdentifier\";s:14:\"content-plugin\";s:5:\"title\";s:96:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:plugins_general_title\";s:11:\"description\";s:102:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:plugins_general_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:4:\"list\";}}s:5:\"main.\";a:4:{s:14:\"iconIdentifier\";s:29:\"om_cookie_manager-plugin-main\";s:5:\"title\";s:100:\"LLL:EXT:om_cookie_manager/Resources/Private/Language/locallang_db.xlf:tx_om_cookie_manager_main.name\";s:11:\"description\";s:107:\"LLL:EXT:om_cookie_manager/Resources/Private/Language/locallang_db.xlf:tx_om_cookie_manager_main.description\";s:21:\"tt_content_defValues.\";a:2:{s:5:\"CType\";s:4:\"list\";s:9:\"list_type\";s:20:\"omcookiemanager_main\";}}}s:4:\"show\";s:1:\"*\";}s:10:\"mono-site.\";a:4:{s:6:\"header\";s:14:\"Basic elements\";s:6:\"before\";s:9:\"container\";s:9:\"elements.\";a:14:{s:18:\"mono_site_textpic.\";a:3:{s:14:\"iconIdentifier\";s:15:\"content-textpic\";s:5:\"title\";s:13:\"Text mit Bild\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:17:\"mono_site_textpic\";}}s:15:\"mono_site_text.\";a:3:{s:14:\"iconIdentifier\";s:12:\"content-text\";s:5:\"title\";s:4:\"Text\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:14:\"mono_site_text\";}}s:16:\"mono_site_image.\";a:3:{s:14:\"iconIdentifier\";s:13:\"content-image\";s:5:\"title\";s:4:\"Bild\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:15:\"mono_site_image\";}}s:15:\"mono_site_hero.\";a:3:{s:14:\"iconIdentifier\";s:18:\"install-test-image\";s:5:\"title\";s:4:\"Hero\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:14:\"mono_site_hero\";}}s:17:\"mono_site_banner.\";a:3:{s:14:\"iconIdentifier\";s:17:\"form-image-upload\";s:5:\"title\";s:6:\"Banner\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:16:\"mono_site_banner\";}}s:15:\"mono_site_card.\";a:3:{s:14:\"iconIdentifier\";s:17:\"content-menu-card\";s:5:\"title\";s:4:\"Card\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:14:\"mono_site_card\";}}s:18:\"mono_site_contact.\";a:3:{s:14:\"iconIdentifier\";s:19:\"actions-credit-card\";s:5:\"title\";s:7:\"Contact\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:17:\"mono_site_contact\";}}s:17:\"mono_site_header.\";a:3:{s:14:\"iconIdentifier\";s:26:\"mimetypes-x-content-header\";s:5:\"title\";s:6:\"Header\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:16:\"mono_site_header\";}}s:15:\"mono_site_link.\";a:3:{s:14:\"iconIdentifier\";s:12:\"actions-link\";s:5:\"title\";s:4:\"Link\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:14:\"mono_site_link\";}}s:19:\"mono_site_download.\";a:3:{s:14:\"iconIdentifier\";s:16:\"actions-download\";s:5:\"title\";s:8:\"Download\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:14:\"mono_site_link\";}}s:14:\"mono_site_map.\";a:3:{s:14:\"iconIdentifier\";s:11:\"content-map\";s:5:\"title\";s:3:\"Map\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:13:\"mono_site_map\";}}s:14:\"mono_site_tab.\";a:3:{s:14:\"iconIdentifier\";s:32:\"mimetypes-open-document-database\";s:5:\"title\";s:3:\"Tab\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:13:\"mono_site_tab\";}}s:17:\"mono_site_anchor.\";a:3:{s:14:\"iconIdentifier\";s:18:\"content-menu-pages\";s:5:\"title\";s:6:\"Anchor\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:16:\"mono_site_anchor\";}}s:19:\"mono_site_pipeline.\";a:3:{s:14:\"iconIdentifier\";s:21:\"content-timeline-item\";s:5:\"title\";s:8:\"Pipeline\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:18:\"mono_site_pipeline\";}}}s:4:\"show\";s:1:\"*\";}s:7:\"common.\";a:1:{s:4:\"show\";s:7:\"version\";}}}s:10:\"newRecord.\";a:1:{s:6:\"pages.\";a:1:{s:5:\"show.\";a:3:{s:10:\"pageInside\";s:1:\"1\";s:9:\"pageAfter\";s:1:\"1\";s:18:\"pageSelectPosition\";s:1:\"1\";}}}}s:9:\"web_list.\";a:6:{s:15:\"enableClipBoard\";s:10:\"selectable\";s:18:\"tableDisplayOrder.\";a:9:{s:9:\"be_users.\";a:1:{s:5:\"after\";s:9:\"be_groups\";}s:15:\"sys_filemounts.\";a:1:{s:5:\"after\";s:8:\"be_users\";}s:17:\"sys_file_storage.\";a:1:{s:5:\"after\";s:14:\"sys_filemounts\";}s:13:\"sys_language.\";a:1:{s:5:\"after\";s:16:\"sys_file_storage\";}s:9:\"fe_users.\";a:2:{s:5:\"after\";s:9:\"fe_groups\";s:6:\"before\";s:5:\"pages\";}s:13:\"sys_template.\";a:1:{s:5:\"after\";s:5:\"pages\";}s:15:\"backend_layout.\";a:1:{s:5:\"after\";s:5:\"pages\";}s:11:\"tt_content.\";a:1:{s:5:\"after\";s:33:\"pages,backend_layout,sys_template\";}s:13:\"sys_category.\";a:1:{s:5:\"after\";s:10:\"tt_content\";}}s:12:\"searchLevel.\";a:1:{s:6:\"items.\";a:6:{i:-1;s:82:\"EXT:core/Resources/Private/Language/locallang_core.xlf:labels.searchLevel.infinite\";i:0;s:75:\"EXT:core/Resources/Private/Language/locallang_core.xlf:labels.searchLevel.0\";i:1;s:75:\"EXT:core/Resources/Private/Language/locallang_core.xlf:labels.searchLevel.1\";i:2;s:75:\"EXT:core/Resources/Private/Language/locallang_core.xlf:labels.searchLevel.2\";i:3;s:75:\"EXT:core/Resources/Private/Language/locallang_core.xlf:labels.searchLevel.3\";i:4;s:75:\"EXT:core/Resources/Private/Language/locallang_core.xlf:labels.searchLevel.4\";}}s:15:\"deniedNewTables\";s:81:\"tx_omcookiemanager_domain_model_cookie,tx_omcookiemanager_domain_model_cookiehtml\";s:20:\"noExportRecordsLinks\";s:1:\"1\";s:10:\"hideTables\";s:81:\"tx_omcookiemanager_domain_model_cookie,tx_omcookiemanager_domain_model_cookiehtml\";}s:9:\"web_view.\";a:1:{s:19:\"previewFrameWidths.\";a:12:{s:5:\"1920.\";a:4:{s:5:\"label\";s:66:\"LLL:EXT:viewpage/Resources/Private/Language/locallang.xlf:computer\";s:4:\"type\";s:7:\"desktop\";s:5:\"width\";s:4:\"1920\";s:6:\"height\";s:4:\"1080\";}s:5:\"1366.\";a:4:{s:5:\"label\";s:66:\"LLL:EXT:viewpage/Resources/Private/Language/locallang.xlf:computer\";s:4:\"type\";s:7:\"desktop\";s:5:\"width\";s:4:\"1366\";s:6:\"height\";s:3:\"768\";}s:5:\"1280.\";a:4:{s:5:\"label\";s:66:\"LLL:EXT:viewpage/Resources/Private/Language/locallang.xlf:computer\";s:4:\"type\";s:7:\"desktop\";s:5:\"width\";s:4:\"1280\";s:6:\"height\";s:4:\"1024\";}s:5:\"1024.\";a:4:{s:5:\"label\";s:66:\"LLL:EXT:viewpage/Resources/Private/Language/locallang.xlf:computer\";s:4:\"type\";s:7:\"desktop\";s:5:\"width\";s:4:\"1024\";s:6:\"height\";s:3:\"768\";}s:7:\"nexus7.\";a:4:{s:5:\"label\";s:7:\"Nexus 7\";s:4:\"type\";s:6:\"tablet\";s:5:\"width\";s:3:\"600\";s:6:\"height\";s:3:\"960\";}s:8:\"nexus6p.\";a:4:{s:5:\"label\";s:8:\"Nexus 6P\";s:4:\"type\";s:6:\"mobile\";s:5:\"width\";s:3:\"411\";s:6:\"height\";s:3:\"731\";}s:8:\"ipadpro.\";a:4:{s:5:\"label\";s:8:\"iPad Pro\";s:4:\"type\";s:6:\"tablet\";s:5:\"width\";s:4:\"1024\";s:6:\"height\";s:4:\"1366\";}s:8:\"ipadair.\";a:4:{s:5:\"label\";s:8:\"iPad Air\";s:4:\"type\";s:6:\"tablet\";s:5:\"width\";s:3:\"768\";s:6:\"height\";s:4:\"1024\";}s:12:\"iphone7plus.\";a:4:{s:5:\"label\";s:13:\"iPhone 7 Plus\";s:4:\"type\";s:6:\"mobile\";s:5:\"width\";s:3:\"414\";s:6:\"height\";s:3:\"736\";}s:8:\"iphone6.\";a:4:{s:5:\"label\";s:8:\"iPhone 6\";s:4:\"type\";s:6:\"mobile\";s:5:\"width\";s:3:\"375\";s:6:\"height\";s:3:\"667\";}s:8:\"iphone5.\";a:4:{s:5:\"label\";s:8:\"iPhone 5\";s:4:\"type\";s:6:\"mobile\";s:5:\"width\";s:3:\"320\";s:6:\"height\";s:3:\"568\";}s:8:\"iphone4.\";a:4:{s:5:\"label\";s:8:\"iPhone 4\";s:4:\"type\";s:6:\"mobile\";s:5:\"width\";s:3:\"320\";s:6:\"height\";s:3:\"480\";}}}s:9:\"web_info.\";a:1:{s:17:\"fieldDefinitions.\";a:6:{s:2:\"0.\";a:2:{s:5:\"label\";s:69:\"LLL:EXT:info/Resources/Private/Language/locallang_webinfo.xlf:pages_0\";s:6:\"fields\";s:75:\"title,uid,slug,starttime,endtime,fe_group,target,url,shortcut,shortcut_mode\";}s:2:\"1.\";a:2:{s:5:\"label\";s:69:\"LLL:EXT:info/Resources/Private/Language/locallang_webinfo.xlf:pages_1\";s:6:\"fields\";s:26:\"title,uid,###ALL_TABLES###\";}s:2:\"2.\";a:2:{s:5:\"label\";s:69:\"LLL:EXT:info/Resources/Private/Language/locallang_webinfo.xlf:pages_2\";s:6:\"fields\";s:93:\"title,uid,lastUpdated,newUntil,cache_timeout,php_tree_stop,TSconfig,is_siteroot,fe_login_mode\";}s:2:\"3.\";a:2:{s:5:\"label\";s:75:\"LLL:EXT:info/Resources/Private/Language/locallang_webinfo.xlf:pages_layouts\";s:6:\"fields\";s:79:\"title,uid,actual_backend_layout,backend_layout,backend_layout_next_level,layout\";}s:4:\"seo.\";a:2:{s:5:\"label\";s:64:\"LLL:EXT:seo/Resources/Private/Language/locallang_webinfo.xlf:seo\";s:6:\"fields\";s:106:\"title,uid,slug,seo_title,description,no_index,no_follow,canonical_link,sitemap_changefreq,sitemap_priority\";}s:13:\"social_media.\";a:2:{s:5:\"label\";s:73:\"LLL:EXT:seo/Resources/Private/Language/locallang_webinfo.xlf:social_media\";s:6:\"fields\";s:67:\"title,uid,og_title,og_description,twitter_title,twitter_description\";}}}s:7:\"SHARED.\";a:2:{s:19:\"defaultLanguageFlag\";s:2:\"en\";s:20:\"defaultLanguageLabel\";s:12:\"English (en)\";}}s:8:\"TCEMAIN.\";a:4:{s:18:\"translateToMessage\";s:16:\"Translate to %s:\";s:12:\"linkHandler.\";a:7:{s:5:\"page.\";a:2:{s:7:\"handler\";s:48:\"TYPO3\\CMS\\Recordlist\\LinkHandler\\PageLinkHandler\";s:5:\"label\";s:77:\"LLL:EXT:recordlist/Resources/Private/Language/locallang_browse_links.xlf:page\";}s:5:\"file.\";a:4:{s:7:\"handler\";s:48:\"TYPO3\\CMS\\Recordlist\\LinkHandler\\FileLinkHandler\";s:5:\"label\";s:77:\"LLL:EXT:recordlist/Resources/Private/Language/locallang_browse_links.xlf:file\";s:12:\"displayAfter\";s:4:\"page\";s:9:\"scanAfter\";s:4:\"page\";}s:7:\"folder.\";a:4:{s:7:\"handler\";s:50:\"TYPO3\\CMS\\Recordlist\\LinkHandler\\FolderLinkHandler\";s:5:\"label\";s:79:\"LLL:EXT:recordlist/Resources/Private/Language/locallang_browse_links.xlf:folder\";s:12:\"displayAfter\";s:9:\"page,file\";s:9:\"scanAfter\";s:9:\"page,file\";}s:4:\"url.\";a:4:{s:7:\"handler\";s:47:\"TYPO3\\CMS\\Recordlist\\LinkHandler\\UrlLinkHandler\";s:5:\"label\";s:79:\"LLL:EXT:recordlist/Resources/Private/Language/locallang_browse_links.xlf:extUrl\";s:12:\"displayAfter\";s:16:\"page,file,folder\";s:9:\"scanAfter\";s:9:\"telephone\";}s:5:\"mail.\";a:4:{s:7:\"handler\";s:48:\"TYPO3\\CMS\\Recordlist\\LinkHandler\\MailLinkHandler\";s:5:\"label\";s:78:\"LLL:EXT:recordlist/Resources/Private/Language/locallang_browse_links.xlf:email\";s:12:\"displayAfter\";s:20:\"page,file,folder,url\";s:10:\"scanBefore\";s:3:\"url\";}s:10:\"telephone.\";a:4:{s:7:\"handler\";s:53:\"TYPO3\\CMS\\Recordlist\\LinkHandler\\TelephoneLinkHandler\";s:5:\"label\";s:82:\"LLL:EXT:recordlist/Resources/Private/Language/locallang_browse_links.xlf:telephone\";s:12:\"displayAfter\";s:25:\"page,file,folder,url,mail\";s:10:\"scanBefore\";s:3:\"url\";}s:11:\"dictionary.\";a:3:{s:7:\"handler\";s:50:\"TYPO3\\CMS\\Recordlist\\LinkHandler\\RecordLinkHandler\";s:5:\"label\";s:84:\"LLL:EXT:mono_site/Resources/Private/Language/locallang_be.xlf:linkHandler.dictionary\";s:14:\"configuration.\";a:3:{s:5:\"table\";s:36:\"tx_monodictionary_domain_model_entry\";s:12:\"hidePageTree\";s:1:\"1\";s:10:\"storagePid\";s:2:\"27\";}}}s:6:\"table.\";a:2:{s:6:\"pages.\";a:2:{s:20:\"disablePrependAtCopy\";s:1:\"1\";s:17:\"disableHideAtCopy\";s:1:\"1\";}s:11:\"tt_content.\";a:2:{s:20:\"disablePrependAtCopy\";s:1:\"1\";s:17:\"disableHideAtCopy\";s:1:\"1\";}}s:12:\"permissions.\";a:1:{s:7:\"groupid\";s:1:\"1\";}}s:8:\"TCEFORM.\";a:3:{s:11:\"tt_content.\";a:21:{s:12:\"imageorient.\";a:1:{s:6:\"types.\";a:2:{s:6:\"image.\";a:1:{s:11:\"removeItems\";s:18:\"8,9,10,17,18,25,26\";}s:18:\"mono_site_textpic.\";a:1:{s:11:\"removeItems\";s:18:\"0,1,2, 8,10, 17,18\";}}}s:7:\"layout.\";a:5:{s:8:\"disabled\";s:1:\"0\";s:10:\"altLabels.\";a:3:{i:0;s:7:\"Default\";i:1;s:24:\"mono_container--fullsize\";i:2;s:28:\"mono_container--grey-padding\";}s:9:\"addItems.\";a:0:{}s:11:\"removeItems\";s:16:\"3,4,5,6,7,8,9,10\";s:6:\"types.\";a:1:{s:23:\"monosite_menu_products.\";a:2:{s:11:\"removeItems\";s:22:\"0,1,2,3,4,5,6,7,8,9,10\";s:9:\"addItems.\";a:6:{i:100;s:15:\"Machines (Case)\";i:101;s:7:\"Popular\";i:102;s:7:\"Success\";i:103;s:16:\"Success bordered\";i:104;s:15:\"Versions (Wide)\";i:110;s:6:\"Narrow\";}}}}s:18:\"space_after_class.\";a:4:{s:8:\"disabled\";s:1:\"0\";s:10:\"altLabels.\";a:1:{s:0:\"\";s:7:\"Default\";}s:11:\"removeItems\";s:64:\"none ,extra-small, small, medium, large, extra-large, 0, default\";s:9:\"addItems.\";a:12:{s:4:\"pb-0\";s:14:\"SIZE-0 (inner)\";s:4:\"pb-1\";s:14:\"SIZE-1 (inner)\";s:4:\"pb-2\";s:14:\"SIZE-2 (inner)\";s:4:\"pb-3\";s:14:\"SIZE-3 (inner)\";s:4:\"pb-4\";s:14:\"SIZE-4 (inner)\";s:4:\"pb-5\";s:14:\"SIZE-5 (inner)\";s:4:\"mb-0\";s:14:\"SIZE-0 (outer)\";s:4:\"mb-1\";s:14:\"SIZE-1 (outer)\";s:4:\"mb-2\";s:14:\"SIZE-2 (outer)\";s:4:\"mb-3\";s:14:\"SIZE-3 (outer)\";s:4:\"mb-4\";s:14:\"SIZE-4 (outer)\";s:4:\"mb-5\";s:14:\"SIZE-5 (outer)\";}}s:19:\"space_before_class.\";a:4:{s:8:\"disabled\";s:1:\"0\";s:10:\"altLabels.\";a:1:{s:0:\"\";s:7:\"Default\";}s:11:\"removeItems\";s:64:\"none, extra-small, small, medium, large, extra-large, 0, default\";s:9:\"addItems.\";a:12:{s:4:\"pt-0\";s:14:\"SIZE-0 (inner)\";s:4:\"pt-1\";s:14:\"SIZE-1 (inner)\";s:4:\"pt-2\";s:14:\"SIZE-2 (inner)\";s:4:\"pt-3\";s:14:\"SIZE-3 (inner)\";s:4:\"pt-4\";s:14:\"SIZE-4 (inner)\";s:4:\"pt-5\";s:14:\"SIZE-5 (inner)\";s:4:\"mt-0\";s:14:\"SIZE-0 (outer)\";s:4:\"mt-1\";s:14:\"SIZE-1 (outer)\";s:4:\"mt-2\";s:14:\"SIZE-2 (outer)\";s:4:\"mt-3\";s:14:\"SIZE-3 (outer)\";s:4:\"mt-4\";s:14:\"SIZE-4 (outer)\";s:4:\"mt-5\";s:14:\"SIZE-5 (outer)\";}}s:16:\"header_position.\";a:1:{s:8:\"disabled\";s:1:\"0\";}s:5:\"date.\";a:1:{s:8:\"disabled\";s:1:\"1\";}s:10:\"subheader.\";a:1:{s:8:\"disabled\";s:1:\"0\";}s:12:\"header_link.\";a:1:{s:8:\"disabled\";s:1:\"0\";}s:12:\"frame_class.\";a:3:{s:8:\"disabled\";s:1:\"0\";s:11:\"removeItems\";s:75:\"ruler-before, ruler-after, indent, indent-left, indent-right, default, none\";s:9:\"addItems.\";a:3:{i:0;s:7:\"Default\";s:26:\"mono_bgcolor--grey_light-1\";s:6:\"grey-1\";s:26:\"mono_bgcolor--grey_light-2\";s:6:\"grey-2\";}}s:13:\"sectionIndex.\";a:1:{s:8:\"disabled\";s:1:\"1\";}s:10:\"linkToTop.\";a:1:{s:8:\"disabled\";s:1:\"1\";}s:9:\"editlock.\";a:1:{s:8:\"disabled\";s:1:\"1\";}s:11:\"categories.\";a:1:{s:8:\"disabled\";s:1:\"0\";}s:15:\"rowDescription.\";a:1:{s:8:\"disabled\";s:1:\"1\";}s:11:\"image_zoom.\";a:1:{s:8:\"disabled\";s:1:\"0\";}s:6:\"CType.\";a:1:{s:11:\"removeItems\";s:763:\"            ## STANDARD ##,\n            text,\n            textpic,\n            image,\n            textmedia,\n\n            ## LISTS ##,\n            uploads,\n            bullets,\n            table,\n\n            ## MENU ##,\n            menu_abstract,\n            menu_categorized_content,\n            menu_categorized_pages,\n            menu_pages,\n            menu_subpages,\n            menu_recently_updated,\n            menu_related_pages,\n            menu_section,\n            menu_section_pages,\n            menu_sitemap,\n            menu_sitemap_pages,\n\n            ## SPEZIAL ##,\n            shortcut,\n            # list,\n            div,\n            html,\n\n            ## FORMS ##,\n            login,\n            felogin_login\n            #form_formframework\";}s:12:\"pi_flexform.\";a:1:{s:19:\"ttaddress_listview.\";a:1:{s:9:\"sDISPLAY.\";a:1:{s:21:\"settings.displayMode.\";a:1:{s:9:\"addItems.\";a:2:{s:8:\"cardlist\";s:8:\"Cardlist\";s:10:\"footerlist\";s:10:\"Footerlist\";}}}}}s:14:\"header_layout.\";a:3:{s:10:\"altLabels.\";a:6:{i:0;s:16:\"Default | Hidden\";i:1;s:2:\"H1\";i:2;s:2:\"H2\";i:3;s:2:\"H3\";i:4;s:2:\"H4\";i:5;s:2:\"H5\";}s:11:\"removeItems\";s:9:\"6,7,8,100\";s:17:\"defaultHeaderType\";s:1:\"0\";}s:10:\"imagecols.\";a:1:{s:11:\"removeItems\";s:17:\"0,1,2,3,4,5,6,7,8\";}s:12:\"imageborder.\";a:1:{s:8:\"disabled\";s:1:\"1\";}s:9:\"fe_group.\";a:1:{s:6:\"types.\";a:1:{s:5:\"list.\";a:1:{s:8:\"disabled\";s:1:\"1\";}}}}s:6:\"pages.\";a:32:{s:7:\"layout.\";a:1:{s:8:\"disabled\";s:1:\"1\";}s:7:\"author.\";a:1:{s:8:\"disabled\";s:1:\"1\";}s:13:\"author_email.\";a:1:{s:8:\"disabled\";s:1:\"1\";}s:12:\"lastUpdated.\";a:1:{s:8:\"disabled\";s:1:\"1\";}s:9:\"newUntil.\";a:1:{s:8:\"disabled\";s:1:\"1\";}s:17:\"content_from_pid.\";a:1:{s:8:\"disabled\";s:1:\"1\";}s:14:\"cache_timeout.\";a:1:{s:8:\"disabled\";s:1:\"1\";}s:11:\"cache_tags.\";a:1:{s:8:\"disabled\";s:1:\"1\";}s:9:\"no_cache.\";a:1:{s:8:\"disabled\";s:1:\"0\";}s:9:\"abstract.\";a:1:{s:8:\"disabled\";s:1:\"1\";}s:9:\"keywords.\";a:1:{s:8:\"disabled\";s:1:\"1\";}s:12:\"is_siteroot.\";a:1:{s:8:\"disabled\";s:1:\"0\";}s:14:\"php_tree_stop.\";a:1:{s:8:\"disabled\";s:1:\"1\";}s:9:\"l18n_cfg.\";a:1:{s:8:\"disabled\";s:1:\"0\";}s:9:\"editlock.\";a:1:{s:8:\"disabled\";s:1:\"1\";}s:14:\"fe_login_mode.\";a:1:{s:8:\"disabled\";s:1:\"1\";}s:7:\"module.\";a:1:{s:8:\"disabled\";s:1:\"0\";}s:10:\"starttime.\";a:1:{s:8:\"disabled\";s:1:\"0\";}s:8:\"endtime.\";a:1:{s:8:\"disabled\";s:1:\"0\";}s:17:\"extendToSubpages.\";a:1:{s:8:\"disabled\";s:1:\"1\";}s:15:\"rowDescription.\";a:1:{s:8:\"disabled\";s:1:\"0\";}s:7:\"target.\";a:1:{s:8:\"disabled\";s:1:\"1\";}s:9:\"fe_group.\";a:1:{s:8:\"disabled\";s:1:\"1\";}s:15:\"backend_layout.\";a:1:{s:8:\"disabled\";s:1:\"1\";}s:26:\"backend_layout_next_level.\";a:1:{s:8:\"disabled\";s:1:\"1\";}s:11:\"categories.\";a:1:{s:8:\"disabled\";s:1:\"0\";}s:8:\"doktype.\";a:1:{s:11:\"removeItems\";s:7:\"6,7,255\";}s:6:\"media.\";a:1:{s:8:\"disabled\";s:1:\"1\";}s:9:\"subtitle.\";a:1:{s:8:\"disabled\";s:1:\"0\";}s:10:\"nav_title.\";a:1:{s:8:\"disabled\";s:1:\"0\";}s:9:\"TSconfig.\";a:1:{s:8:\"disabled\";s:1:\"1\";}s:18:\"tsconfig_includes.\";a:1:{s:8:\"disabled\";s:1:\"1\";}}s:13:\"sys_category.\";a:1:{s:7:\"parent.\";a:1:{s:7:\"disable\";s:1:\"1\";}}}s:12:\"TCAdefaults.\";a:1:{s:11:\"tt_content.\";a:1:{s:13:\"header_layout\";s:1:\"0\";}}s:4:\"RTE.\";a:2:{s:8:\"default.\";a:1:{s:6:\"preset\";s:4:\"full\";}s:7:\"config.\";a:1:{s:6:\"pages.\";a:1:{s:17:\"tx_monosite_info.\";a:1:{s:6:\"preset\";s:4:\"full\";}}}}}s:8:\"sections\";a:1:{s:32:\"fd813138e6307567987026b52f420ee5\";s:27:\"[page && page[\"uid\"] == 46]\";}s:5:\"match\";a:0:{}}i:1;s:32:\"ca270cc474f6f8ffe4c54f97e7b59439\";}');
/*!40000 ALTER TABLE `cache_hash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_hash_tags`
--

DROP TABLE IF EXISTS `cache_hash_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_hash_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tag` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(191)),
  KEY `cache_tag` (`tag`(191))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_hash_tags`
--

LOCK TABLES `cache_hash_tags` WRITE;
/*!40000 ALTER TABLE `cache_hash_tags` DISABLE KEYS */;
INSERT INTO `cache_hash_tags` VALUES (1,'6e3ee4ef3581548f477641f7182f08ad','UserTSconfig'),(2,'618162543429733d4a84c4bbeaab3c37','pageTSconfig');
/*!40000 ALTER TABLE `cache_hash_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_imagesizes`
--

DROP TABLE IF EXISTS `cache_imagesizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_imagesizes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` int(10) unsigned NOT NULL DEFAULT 0,
  `content` longblob DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(180),`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_imagesizes`
--

LOCK TABLES `cache_imagesizes` WRITE;
/*!40000 ALTER TABLE `cache_imagesizes` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_imagesizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_imagesizes_tags`
--

DROP TABLE IF EXISTS `cache_imagesizes_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_imagesizes_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tag` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(191)),
  KEY `cache_tag` (`tag`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_imagesizes_tags`
--

LOCK TABLES `cache_imagesizes_tags` WRITE;
/*!40000 ALTER TABLE `cache_imagesizes_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_imagesizes_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_pages`
--

DROP TABLE IF EXISTS `cache_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` int(10) unsigned NOT NULL DEFAULT 0,
  `content` longblob DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(180),`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_pages`
--

LOCK TABLES `cache_pages` WRITE;
/*!40000 ALTER TABLE `cache_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_pages_tags`
--

DROP TABLE IF EXISTS `cache_pages_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_pages_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tag` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(191)),
  KEY `cache_tag` (`tag`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_pages_tags`
--

LOCK TABLES `cache_pages_tags` WRITE;
/*!40000 ALTER TABLE `cache_pages_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_pages_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_pagesection`
--

DROP TABLE IF EXISTS `cache_pagesection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_pagesection` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` int(10) unsigned NOT NULL DEFAULT 0,
  `content` longblob DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(180),`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_pagesection`
--

LOCK TABLES `cache_pagesection` WRITE;
/*!40000 ALTER TABLE `cache_pagesection` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_pagesection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_pagesection_tags`
--

DROP TABLE IF EXISTS `cache_pagesection_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_pagesection_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tag` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(191)),
  KEY `cache_tag` (`tag`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_pagesection_tags`
--

LOCK TABLES `cache_pagesection_tags` WRITE;
/*!40000 ALTER TABLE `cache_pagesection_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_pagesection_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_rootline`
--

DROP TABLE IF EXISTS `cache_rootline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_rootline` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` int(10) unsigned NOT NULL DEFAULT 0,
  `content` longblob DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(180),`expires`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_rootline`
--

LOCK TABLES `cache_rootline` WRITE;
/*!40000 ALTER TABLE `cache_rootline` DISABLE KEYS */;
INSERT INTO `cache_rootline` VALUES (1,'1__0_0_1',1673628410,'xúMêMr√ ÖÔ¬	¸”¶≠|ÅÆ≤Iˆ1äÀ#èn3ô‹Ω≤]ª¨@è\'È(··†hT<\"‘†gU3≥•JkUJıäÎ	GMˇä≤ÿ‡wÃhπ—»Üq√ØB{©#ºÄ˙§~πäo0ìﬁüƒR≠Í≠3:ÄÚÊNâ7G_ŒZ/i92ª~o˚\nÉÕ…;®+Ín§4Ã∂2m±úbá?,‚3ù“e0∆Ãƒ“çÔnqà…˘‘R∏∫N5«˘ªh8ÆDª–˙dÁˇ«ø@\\‘—1éDú%⁄S\n¨≥ÃÀ*Éö¸ŒÎehOù∫\'ª/SIP”ﬁdlΩ¶£Él°=NË˜ûœ_X[õ/');
/*!40000 ALTER TABLE `cache_rootline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_rootline_tags`
--

DROP TABLE IF EXISTS `cache_rootline_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_rootline_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tag` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(191)),
  KEY `cache_tag` (`tag`(191))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_rootline_tags`
--

LOCK TABLES `cache_rootline_tags` WRITE;
/*!40000 ALTER TABLE `cache_rootline_tags` DISABLE KEYS */;
INSERT INTO `cache_rootline_tags` VALUES (1,'1__0_0_1','pageId_1');
/*!40000 ALTER TABLE `cache_rootline_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_staticfilecache`
--

DROP TABLE IF EXISTS `cache_staticfilecache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_staticfilecache` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(500) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` int(10) unsigned NOT NULL DEFAULT 0,
  `content` longblob DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(180),`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_staticfilecache`
--

LOCK TABLES `cache_staticfilecache` WRITE;
/*!40000 ALTER TABLE `cache_staticfilecache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_staticfilecache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_staticfilecache_tags`
--

DROP TABLE IF EXISTS `cache_staticfilecache_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_staticfilecache_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(500) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tag` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(191)),
  KEY `cache_tag` (`tag`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_staticfilecache_tags`
--

LOCK TABLES `cache_staticfilecache_tags` WRITE;
/*!40000 ALTER TABLE `cache_staticfilecache_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_staticfilecache_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_treelist`
--

DROP TABLE IF EXISTS `cache_treelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_treelist` (
  `md5hash` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pid` int(11) NOT NULL DEFAULT 0,
  `treelist` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `tstamp` int(11) NOT NULL DEFAULT 0,
  `expires` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`md5hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_treelist`
--

LOCK TABLES `cache_treelist` WRITE;
/*!40000 ALTER TABLE `cache_treelist` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_treelist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fe_groups`
--

DROP TABLE IF EXISTS `fe_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fe_groups` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `tx_extbase_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subgroup` tinytext COLLATE utf8_unicode_ci DEFAULT NULL,
  `TSconfig` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fe_groups`
--

LOCK TABLES `fe_groups` WRITE;
/*!40000 ALTER TABLE `fe_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `fe_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fe_sessions`
--

DROP TABLE IF EXISTS `fe_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fe_sessions` (
  `ses_id` varchar(190) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ses_iplock` varchar(39) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ses_userid` int(10) unsigned NOT NULL DEFAULT 0,
  `ses_tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `ses_data` mediumblob DEFAULT NULL,
  `ses_permanent` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`ses_id`),
  KEY `ses_tstamp` (`ses_tstamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fe_sessions`
--

LOCK TABLES `fe_sessions` WRITE;
/*!40000 ALTER TABLE `fe_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `fe_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fe_users`
--

DROP TABLE IF EXISTS `fe_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fe_users` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `disable` smallint(5) unsigned NOT NULL DEFAULT 0,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `endtime` int(10) unsigned NOT NULL DEFAULT 0,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `tx_extbase_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `usergroup` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(160) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `first_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `middle_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `last_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `telephone` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fax` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `uc` blob DEFAULT NULL,
  `title` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `zip` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `city` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `country` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `www` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `company` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `image` tinytext COLLATE utf8_unicode_ci DEFAULT NULL,
  `TSconfig` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastlogin` int(10) unsigned NOT NULL DEFAULT 0,
  `is_online` int(10) unsigned NOT NULL DEFAULT 0,
  `mfa` mediumblob DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`username`(100)),
  KEY `username` (`username`(100)),
  KEY `is_online` (`is_online`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fe_users`
--

LOCK TABLES `fe_users` WRITE;
/*!40000 ALTER TABLE `fe_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `fe_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_config`
--

DROP TABLE IF EXISTS `index_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `index_config` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `set_id` int(11) NOT NULL DEFAULT 0,
  `session_data` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `depth` int(10) unsigned NOT NULL DEFAULT 0,
  `table2index` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `alternative_source_pid` int(10) unsigned NOT NULL DEFAULT 0,
  `get_params` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fieldlist` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `externalUrl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `indexcfgs` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `filepath` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `extensions` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timer_next_indexing` int(11) NOT NULL DEFAULT 0,
  `timer_frequency` int(11) NOT NULL DEFAULT 0,
  `timer_offset` int(11) NOT NULL DEFAULT 0,
  `url_deny` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `recordsbatch` int(11) NOT NULL DEFAULT 0,
  `records_indexonchange` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_config`
--

LOCK TABLES `index_config` WRITE;
/*!40000 ALTER TABLE `index_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `index_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_debug`
--

DROP TABLE IF EXISTS `index_debug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `index_debug` (
  `phash` int(11) NOT NULL DEFAULT 0,
  `debuginfo` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`phash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_debug`
--

LOCK TABLES `index_debug` WRITE;
/*!40000 ALTER TABLE `index_debug` DISABLE KEYS */;
/*!40000 ALTER TABLE `index_debug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_fulltext`
--

DROP TABLE IF EXISTS `index_fulltext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `index_fulltext` (
  `phash` int(11) NOT NULL DEFAULT 0,
  `fulltextdata` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `metaphonedata` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`phash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_fulltext`
--

LOCK TABLES `index_fulltext` WRITE;
/*!40000 ALTER TABLE `index_fulltext` DISABLE KEYS */;
/*!40000 ALTER TABLE `index_fulltext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_grlist`
--

DROP TABLE IF EXISTS `index_grlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `index_grlist` (
  `uniqid` int(11) NOT NULL AUTO_INCREMENT,
  `phash` int(11) NOT NULL DEFAULT 0,
  `phash_x` int(11) NOT NULL DEFAULT 0,
  `hash_gr_list` int(11) NOT NULL DEFAULT 0,
  `gr_list` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`uniqid`),
  KEY `joinkey` (`phash`,`hash_gr_list`),
  KEY `phash_grouping` (`phash_x`,`hash_gr_list`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_grlist`
--

LOCK TABLES `index_grlist` WRITE;
/*!40000 ALTER TABLE `index_grlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `index_grlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_phash`
--

DROP TABLE IF EXISTS `index_phash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `index_phash` (
  `phash` int(11) NOT NULL DEFAULT 0,
  `phash_grouping` int(11) NOT NULL DEFAULT 0,
  `static_page_arguments` blob DEFAULT NULL,
  `data_filename` varchar(1024) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `data_page_id` int(10) unsigned NOT NULL DEFAULT 0,
  `data_page_type` int(10) unsigned NOT NULL DEFAULT 0,
  `data_page_mp` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gr_list` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `item_type` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `item_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `item_description` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `item_mtime` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `item_size` int(11) NOT NULL DEFAULT 0,
  `contentHash` int(11) NOT NULL DEFAULT 0,
  `crdate` int(11) NOT NULL DEFAULT 0,
  `parsetime` int(11) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `item_crdate` int(11) NOT NULL DEFAULT 0,
  `externalUrl` smallint(6) NOT NULL DEFAULT 0,
  `recordUid` int(11) NOT NULL DEFAULT 0,
  `freeIndexUid` int(11) NOT NULL DEFAULT 0,
  `freeIndexSetId` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`phash`),
  KEY `phash_grouping` (`phash_grouping`),
  KEY `freeIndexUid` (`freeIndexUid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_phash`
--

LOCK TABLES `index_phash` WRITE;
/*!40000 ALTER TABLE `index_phash` DISABLE KEYS */;
/*!40000 ALTER TABLE `index_phash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_rel`
--

DROP TABLE IF EXISTS `index_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `index_rel` (
  `phash` int(11) NOT NULL DEFAULT 0,
  `wid` int(11) NOT NULL DEFAULT 0,
  `count` smallint(5) unsigned NOT NULL DEFAULT 0,
  `first` int(10) unsigned NOT NULL DEFAULT 0,
  `freq` smallint(5) unsigned NOT NULL DEFAULT 0,
  `flags` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`phash`,`wid`),
  KEY `wid` (`wid`,`phash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_rel`
--

LOCK TABLES `index_rel` WRITE;
/*!40000 ALTER TABLE `index_rel` DISABLE KEYS */;
/*!40000 ALTER TABLE `index_rel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_section`
--

DROP TABLE IF EXISTS `index_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `index_section` (
  `uniqid` int(11) NOT NULL AUTO_INCREMENT,
  `phash` int(11) NOT NULL DEFAULT 0,
  `phash_t3` int(11) NOT NULL DEFAULT 0,
  `rl0` int(10) unsigned NOT NULL DEFAULT 0,
  `rl1` int(10) unsigned NOT NULL DEFAULT 0,
  `rl2` int(10) unsigned NOT NULL DEFAULT 0,
  `page_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uniqid`),
  KEY `joinkey` (`phash`,`rl0`),
  KEY `page_id` (`page_id`),
  KEY `rl0` (`rl0`,`rl1`,`phash`),
  KEY `rl0_2` (`rl0`,`phash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_section`
--

LOCK TABLES `index_section` WRITE;
/*!40000 ALTER TABLE `index_section` DISABLE KEYS */;
/*!40000 ALTER TABLE `index_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_stat_word`
--

DROP TABLE IF EXISTS `index_stat_word`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `index_stat_word` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `word` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `index_stat_search_id` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(11) NOT NULL DEFAULT 0,
  `pageid` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `tstamp` (`tstamp`,`word`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_stat_word`
--

LOCK TABLES `index_stat_word` WRITE;
/*!40000 ALTER TABLE `index_stat_word` DISABLE KEYS */;
/*!40000 ALTER TABLE `index_stat_word` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_words`
--

DROP TABLE IF EXISTS `index_words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `index_words` (
  `wid` int(11) NOT NULL DEFAULT 0,
  `baseword` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `metaphone` int(11) NOT NULL DEFAULT 0,
  `is_stopword` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`wid`),
  KEY `baseword` (`baseword`),
  KEY `metaphone` (`metaphone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_words`
--

LOCK TABLES `index_words` WRITE;
/*!40000 ALTER TABLE `index_words` DISABLE KEYS */;
/*!40000 ALTER TABLE `index_words` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `endtime` int(10) unsigned NOT NULL DEFAULT 0,
  `fe_group` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `sorting` int(11) NOT NULL DEFAULT 0,
  `rowDescription` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `editlock` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `perms_userid` int(10) unsigned NOT NULL DEFAULT 0,
  `perms_groupid` int(10) unsigned NOT NULL DEFAULT 0,
  `perms_user` smallint(5) unsigned NOT NULL DEFAULT 0,
  `perms_group` smallint(5) unsigned NOT NULL DEFAULT 0,
  `perms_everybody` smallint(5) unsigned NOT NULL DEFAULT 0,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(2048) COLLATE utf8_unicode_ci DEFAULT NULL,
  `doktype` int(10) unsigned NOT NULL DEFAULT 0,
  `TSconfig` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_siteroot` smallint(6) NOT NULL DEFAULT 0,
  `php_tree_stop` smallint(6) NOT NULL DEFAULT 0,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shortcut` int(10) unsigned NOT NULL DEFAULT 0,
  `shortcut_mode` int(10) unsigned NOT NULL DEFAULT 0,
  `subtitle` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `layout` int(10) unsigned NOT NULL DEFAULT 0,
  `target` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `media` int(10) unsigned NOT NULL DEFAULT 0,
  `lastUpdated` int(10) unsigned NOT NULL DEFAULT 0,
  `keywords` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `cache_timeout` int(10) unsigned NOT NULL DEFAULT 0,
  `cache_tags` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `newUntil` int(10) unsigned NOT NULL DEFAULT 0,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `no_search` smallint(5) unsigned NOT NULL DEFAULT 0,
  `SYS_LASTCHANGED` int(10) unsigned NOT NULL DEFAULT 0,
  `abstract` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `module` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `extendToSubpages` smallint(5) unsigned NOT NULL DEFAULT 0,
  `author` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `author_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `nav_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `nav_hide` smallint(6) NOT NULL DEFAULT 0,
  `content_from_pid` int(10) unsigned NOT NULL DEFAULT 0,
  `mount_pid` int(10) unsigned NOT NULL DEFAULT 0,
  `mount_pid_ol` smallint(6) NOT NULL DEFAULT 0,
  `l18n_cfg` smallint(6) NOT NULL DEFAULT 0,
  `fe_login_mode` smallint(6) NOT NULL DEFAULT 0,
  `backend_layout` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `backend_layout_next_level` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tsconfig_includes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `categories` int(10) unsigned NOT NULL DEFAULT 0,
  `tx_impexp_origuid` int(11) NOT NULL DEFAULT 0,
  `seo_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `no_index` smallint(6) NOT NULL DEFAULT 0,
  `no_follow` smallint(6) NOT NULL DEFAULT 0,
  `og_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `og_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `og_image` int(10) unsigned NOT NULL DEFAULT 0,
  `twitter_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `twitter_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter_image` int(10) unsigned NOT NULL DEFAULT 0,
  `twitter_card` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `canonical_link` varchar(2048) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sitemap_priority` decimal(2,1) NOT NULL DEFAULT 0.5,
  `sitemap_changefreq` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tx_staticfilecache_cache` smallint(6) DEFAULT 1,
  `tx_staticfilecache_cache_force` smallint(6) DEFAULT 0,
  `tx_staticfilecache_cache_offline` smallint(6) DEFAULT 0,
  `tx_staticfilecache_cache_priority` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `determineSiteRoot` (`is_siteroot`),
  KEY `language_identifier` (`l10n_parent`,`sys_language_uid`),
  KEY `slug` (`slug`(127)),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `translation_source` (`l10n_source`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,0,1670959291,1670959021,1,0,0,0,0,'0',256,NULL,0,0,0,0,NULL,0,'{\"hidden\":\"\"}',0,0,0,0,1,1,31,27,0,'Home','/',1,NULL,1,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,1670959291,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',1,0,0,0),(2,1,1670959270,1670959157,1,0,0,0,0,'0',256,NULL,0,0,0,0,NULL,0,'{\"hidden\":\"\"}',0,0,0,0,1,1,31,27,0,'404','/404',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,1670959270,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',1,0,0,0),(3,1,1670959269,1670959166,1,0,0,0,0,'0',128,NULL,0,0,0,0,NULL,0,'{\"hidden\":\"\"}',0,0,0,0,1,1,31,27,0,'Meta','/meta',254,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',1,0,0,0),(4,1,1670959269,1670959171,1,0,0,0,0,'0',64,NULL,0,0,0,0,NULL,0,'{\"hidden\":\"\"}',0,0,0,0,1,1,31,27,0,'Data','/data',254,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',1,0,0,0),(5,4,1670959273,1670959177,1,0,0,0,0,'0',256,NULL,0,0,0,0,NULL,0,'{\"hidden\":\"\"}',0,0,0,0,1,1,31,27,0,'Forms','/forms',254,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',1,0,0,0),(6,4,1670959273,1670959189,1,0,0,0,0,'0',128,NULL,0,0,0,0,NULL,0,'{\"hidden\":\"\"}',0,0,0,0,1,1,31,27,0,'Content Elements','/content-elements',254,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',1,0,0,0),(7,3,1670959277,1670959207,1,0,0,0,0,'0',256,NULL,0,0,0,0,NULL,0,'{\"hidden\":\"\"}',0,0,0,0,1,1,31,27,0,'Contact','/contact',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',1,0,0,0),(8,3,1670959277,1670959212,1,0,0,0,0,'0',128,NULL,0,0,0,0,NULL,0,'{\"hidden\":\"\"}',0,0,0,0,1,1,31,27,0,'Imprint','/imprint',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',1,0,0,0),(9,3,1670959276,1670959224,1,0,0,0,0,'0',64,NULL,0,0,0,0,NULL,0,'{\"hidden\":\"\"}',0,0,0,0,1,1,31,27,0,'Privacy Policy','/privacy',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',1,0,0,0),(10,3,1670959276,1670959244,1,0,0,0,0,'0',32,NULL,0,0,0,0,NULL,0,'{\"hidden\":\"\"}',0,0,0,0,1,1,31,27,0,'Cookie Settings','/cookie-settings',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',1,0,0,0),(11,7,1670959284,1670959253,1,0,0,0,0,'0',256,NULL,0,0,0,0,NULL,0,'{\"hidden\":\"\"}',0,0,0,0,1,1,31,27,0,'Thank you','/contact/thanks-you',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',1,0,0,0),(12,4,1670959466,1670959438,1,0,0,0,0,'0',64,NULL,0,0,0,0,NULL,0,'{\"hidden\":\"\"}',0,0,0,0,1,1,31,27,0,'Cookies','/cookies',254,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',1,0,0,0);
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_be_shortcuts`
--

DROP TABLE IF EXISTS `sys_be_shortcuts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_be_shortcuts` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned NOT NULL DEFAULT 0,
  `route` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `arguments` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sc_group` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `event` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_be_shortcuts`
--

LOCK TABLES `sys_be_shortcuts` WRITE;
/*!40000 ALTER TABLE `sys_be_shortcuts` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_be_shortcuts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_category`
--

DROP TABLE IF EXISTS `sys_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_category` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `endtime` int(10) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `title` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `items` int(11) NOT NULL DEFAULT 0,
  `parent` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `category_parent` (`parent`),
  KEY `category_list` (`pid`,`deleted`,`sys_language_uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_category`
--

LOCK TABLES `sys_category` WRITE;
/*!40000 ALTER TABLE `sys_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_category_record_mm`
--

DROP TABLE IF EXISTS `sys_category_record_mm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_category_record_mm` (
  `uid_local` int(10) unsigned NOT NULL DEFAULT 0,
  `uid_foreign` int(10) unsigned NOT NULL DEFAULT 0,
  `sorting` int(10) unsigned NOT NULL DEFAULT 0,
  `sorting_foreign` int(10) unsigned NOT NULL DEFAULT 0,
  `tablenames` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fieldname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  KEY `uid_local` (`uid_local`),
  KEY `uid_foreign` (`uid_foreign`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_category_record_mm`
--

LOCK TABLES `sys_category_record_mm` WRITE;
/*!40000 ALTER TABLE `sys_category_record_mm` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_category_record_mm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_file`
--

DROP TABLE IF EXISTS `sys_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_file` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `last_indexed` int(11) NOT NULL DEFAULT 0,
  `missing` smallint(6) NOT NULL DEFAULT 0,
  `storage` int(11) NOT NULL DEFAULT 0,
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `metadata` int(11) NOT NULL DEFAULT 0,
  `identifier` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `identifier_hash` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `folder_hash` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `extension` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mime_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` tinytext COLLATE utf8_unicode_ci DEFAULT NULL,
  `sha1` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `size` bigint(20) unsigned NOT NULL DEFAULT 0,
  `creation_date` int(11) NOT NULL DEFAULT 0,
  `modification_date` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `sel01` (`storage`,`identifier_hash`),
  KEY `folder` (`storage`,`folder_hash`),
  KEY `tstamp` (`tstamp`),
  KEY `lastindex` (`last_indexed`),
  KEY `sha1` (`sha1`),
  KEY `parent` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_file`
--

LOCK TABLES `sys_file` WRITE;
/*!40000 ALTER TABLE `sys_file` DISABLE KEYS */;
INSERT INTO `sys_file` VALUES (1,0,1670959301,0,0,0,'2',0,'/typo3conf/ext/mono_site/Resources/Public/images/page/Sumaya-Logo-Text.svg','49649155712ed9f6b8c5e683798880b746ce03ed','521fad0ae73a743a301e63db8c2e2683030daee1','svg','image/svg+xml','Sumaya-Logo-Text.svg','583d68ea1ea75b1b9d18b983190bf22c7c1871da',4710,1670958580,1670593663),(2,0,1670959301,0,0,0,'2',0,'/typo3conf/ext/mono_site/Resources/Public/images/page/Sumaya-Logo-Karte.svg','21800843c3bff2c99638f792e901916693aa0928','521fad0ae73a743a301e63db8c2e2683030daee1','svg','image/svg+xml','Sumaya-Logo-Karte.svg','cc723a2771179a49f69264cb7dc0b01be2f13302',116712,1670958580,1670593663),(3,0,1670959301,0,0,0,'2',0,'/typo3conf/ext/mono_site/Resources/Public/images/icons/mail-red.svg','9bba1853a9c0379ca288a354680f23ea1157b3e8','b478c5e595e19d688f2f8e7cf69c55bc41ff347f','svg','image/svg+xml','mail-red.svg','9f1e46bb9184d9aac6ead525c29d0d1a380a69c4',1027,1670958581,1670593663),(4,0,1670959301,0,0,0,'2',0,'/typo3conf/ext/mono_site/Resources/Public/images/icons/favicon-500.png','4d32828d5aa4e77a445f776f464aae3f8c03f23b','b478c5e595e19d688f2f8e7cf69c55bc41ff347f','png','image/png','favicon-500.png','16e8d37541219d670bd1c1a6ed19dbe14ff6039e',8155,1670958581,1670593663),(5,0,1670959301,0,0,0,'2',0,'/typo3conf/ext/mono_site/Resources/Public/images/icons/favicon-wide.png','7d67d0c97d480868d0713f059f59bdaf44f13db9','b478c5e595e19d688f2f8e7cf69c55bc41ff347f','png','image/png','favicon-wide.png','d8f4eb157d7f6c5adc6c1de167914dd75a4559a3',2858,1670958581,1670593663);
/*!40000 ALTER TABLE `sys_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_file_collection`
--

DROP TABLE IF EXISTS `sys_file_collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_file_collection` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `endtime` int(10) unsigned NOT NULL DEFAULT 0,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `title` tinytext COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'static',
  `files` int(11) NOT NULL DEFAULT 0,
  `storage` int(11) NOT NULL DEFAULT 0,
  `folder` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `recursive` smallint(6) NOT NULL DEFAULT 0,
  `category` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_file_collection`
--

LOCK TABLES `sys_file_collection` WRITE;
/*!40000 ALTER TABLE `sys_file_collection` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_file_collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_file_metadata`
--

DROP TABLE IF EXISTS `sys_file_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_file_metadata` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `file` int(11) NOT NULL DEFAULT 0,
  `title` tinytext COLLATE utf8_unicode_ci DEFAULT NULL,
  `width` int(11) NOT NULL DEFAULT 0,
  `height` int(11) NOT NULL DEFAULT 0,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `alternative` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `categories` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `file` (`file`),
  KEY `fal_filelist` (`l10n_parent`,`sys_language_uid`),
  KEY `parent` (`pid`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_file_metadata`
--

LOCK TABLES `sys_file_metadata` WRITE;
/*!40000 ALTER TABLE `sys_file_metadata` DISABLE KEYS */;
INSERT INTO `sys_file_metadata` VALUES (1,0,1670959301,1670959301,1,0,0,NULL,0,'',0,0,0,0,1,NULL,358,80,NULL,NULL,0),(2,0,1670959301,1670959301,1,0,0,NULL,0,'',0,0,0,0,2,NULL,358,200,NULL,NULL,0),(3,0,1670959301,1670959301,1,0,0,NULL,0,'',0,0,0,0,3,NULL,36,27,NULL,NULL,0),(4,0,1670959301,1670959301,1,0,0,NULL,0,'',0,0,0,0,4,NULL,500,500,NULL,NULL,0),(5,0,1670959301,1670959301,1,0,0,NULL,0,'',0,0,0,0,5,NULL,310,150,NULL,NULL,0);
/*!40000 ALTER TABLE `sys_file_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_file_processedfile`
--

DROP TABLE IF EXISTS `sys_file_processedfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_file_processedfile` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `tstamp` int(11) NOT NULL DEFAULT 0,
  `crdate` int(11) NOT NULL DEFAULT 0,
  `storage` int(11) NOT NULL DEFAULT 0,
  `original` int(11) NOT NULL DEFAULT 0,
  `identifier` varchar(512) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` tinytext COLLATE utf8_unicode_ci DEFAULT NULL,
  `processing_url` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `configuration` blob DEFAULT NULL,
  `configurationsha1` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `originalfilesha1` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `task_type` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `checksum` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `width` int(11) DEFAULT 0,
  `height` int(11) DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `combined_1` (`original`,`task_type`(100),`configurationsha1`),
  KEY `identifier` (`storage`,`identifier`(180))
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_file_processedfile`
--

LOCK TABLES `sys_file_processedfile` WRITE;
/*!40000 ALTER TABLE `sys_file_processedfile` DISABLE KEYS */;
INSERT INTO `sys_file_processedfile` VALUES (1,1670959301,1670959301,0,1,'',NULL,'','a:7:{s:5:\"width\";N;s:6:\"height\";N;s:8:\"minWidth\";N;s:9:\"minHeight\";N;s:8:\"maxWidth\";N;s:9:\"maxHeight\";N;s:4:\"crop\";N;}','24f48d5b4de7d99b7144e6559156976855e74b5d','583d68ea1ea75b1b9d18b983190bf22c7c1871da','Image.CropScaleMask','f352784189',358,80),(2,1670959301,1670959301,0,2,'',NULL,'','a:7:{s:5:\"width\";N;s:6:\"height\";N;s:8:\"minWidth\";N;s:9:\"minHeight\";N;s:8:\"maxWidth\";N;s:9:\"maxHeight\";N;s:4:\"crop\";N;}','24f48d5b4de7d99b7144e6559156976855e74b5d','cc723a2771179a49f69264cb7dc0b01be2f13302','Image.CropScaleMask','dda83e9e11',358,200),(3,1670959301,1670959301,0,3,'',NULL,'','a:7:{s:5:\"width\";N;s:6:\"height\";N;s:8:\"minWidth\";N;s:9:\"minHeight\";N;s:8:\"maxWidth\";N;s:9:\"maxHeight\";N;s:4:\"crop\";N;}','24f48d5b4de7d99b7144e6559156976855e74b5d','9f1e46bb9184d9aac6ead525c29d0d1a380a69c4','Image.CropScaleMask','bd1a9a8a06',36,27),(4,1670959301,1670959301,0,4,'/typo3temp/assets/_processed_/2/9/csm_favicon-500_cd40faddb7.png','csm_favicon-500_cd40faddb7.png',NULL,'a:11:{s:5:\"width\";s:3:\"60c\";s:6:\"height\";s:3:\"60c\";s:13:\"fileExtension\";s:0:\"\";s:8:\"maxWidth\";i:0;s:9:\"maxHeight\";i:0;s:8:\"minWidth\";i:0;s:9:\"minHeight\";i:0;s:7:\"noScale\";s:0:\"\";s:20:\"additionalParameters\";s:0:\"\";s:5:\"frame\";i:0;s:4:\"crop\";N;}','3b07eaaf68f89a9d2ad6ab93f98aaf3faeb57f1f','16e8d37541219d670bd1c1a6ed19dbe14ff6039e','Image.CropScaleMask','cd40faddb7',60,60),(5,1670959301,1670959301,0,4,'/typo3temp/assets/_processed_/2/9/csm_favicon-500_8e57ef9dbb.png','csm_favicon-500_8e57ef9dbb.png',NULL,'a:11:{s:5:\"width\";s:3:\"57c\";s:6:\"height\";s:3:\"57c\";s:13:\"fileExtension\";s:0:\"\";s:8:\"maxWidth\";i:0;s:9:\"maxHeight\";i:0;s:8:\"minWidth\";i:0;s:9:\"minHeight\";i:0;s:7:\"noScale\";s:0:\"\";s:20:\"additionalParameters\";s:0:\"\";s:5:\"frame\";i:0;s:4:\"crop\";N;}','48949ecc4d79a85456f35fc7243ce191a7062eb2','16e8d37541219d670bd1c1a6ed19dbe14ff6039e','Image.CropScaleMask','8e57ef9dbb',57,57),(6,1670959301,1670959301,0,4,'/typo3temp/assets/_processed_/2/9/csm_favicon-500_5d87db22bc.png','csm_favicon-500_5d87db22bc.png',NULL,'a:11:{s:5:\"width\";s:3:\"76c\";s:6:\"height\";s:3:\"76c\";s:13:\"fileExtension\";s:0:\"\";s:8:\"maxWidth\";i:0;s:9:\"maxHeight\";i:0;s:8:\"minWidth\";i:0;s:9:\"minHeight\";i:0;s:7:\"noScale\";s:0:\"\";s:20:\"additionalParameters\";s:0:\"\";s:5:\"frame\";i:0;s:4:\"crop\";N;}','9f3f38bd77308ce133bb466b05504a69d3582873','16e8d37541219d670bd1c1a6ed19dbe14ff6039e','Image.CropScaleMask','5d87db22bc',76,76),(7,1670959301,1670959301,0,4,'/typo3temp/assets/_processed_/2/9/csm_favicon-500_a5d4c6b72f.png','csm_favicon-500_a5d4c6b72f.png',NULL,'a:11:{s:5:\"width\";s:4:\"114c\";s:6:\"height\";s:4:\"114c\";s:13:\"fileExtension\";s:0:\"\";s:8:\"maxWidth\";i:0;s:9:\"maxHeight\";i:0;s:8:\"minWidth\";i:0;s:9:\"minHeight\";i:0;s:7:\"noScale\";s:0:\"\";s:20:\"additionalParameters\";s:0:\"\";s:5:\"frame\";i:0;s:4:\"crop\";N;}','f053c73f6b32200077333217c96f8d3c75490a7f','16e8d37541219d670bd1c1a6ed19dbe14ff6039e','Image.CropScaleMask','a5d4c6b72f',114,114),(8,1670959301,1670959301,0,4,'/typo3temp/assets/_processed_/2/9/csm_favicon-500_3042e42432.png','csm_favicon-500_3042e42432.png',NULL,'a:11:{s:5:\"width\";s:4:\"120c\";s:6:\"height\";s:4:\"120c\";s:13:\"fileExtension\";s:0:\"\";s:8:\"maxWidth\";i:0;s:9:\"maxHeight\";i:0;s:8:\"minWidth\";i:0;s:9:\"minHeight\";i:0;s:7:\"noScale\";s:0:\"\";s:20:\"additionalParameters\";s:0:\"\";s:5:\"frame\";i:0;s:4:\"crop\";N;}','3ae4ef7286d8397590f0fd09b3be41fc03f44637','16e8d37541219d670bd1c1a6ed19dbe14ff6039e','Image.CropScaleMask','3042e42432',120,120),(9,1670959301,1670959301,0,4,'/typo3temp/assets/_processed_/2/9/csm_favicon-500_c04abc12eb.png','csm_favicon-500_c04abc12eb.png',NULL,'a:11:{s:5:\"width\";s:4:\"144c\";s:6:\"height\";s:4:\"144c\";s:13:\"fileExtension\";s:0:\"\";s:8:\"maxWidth\";i:0;s:9:\"maxHeight\";i:0;s:8:\"minWidth\";i:0;s:9:\"minHeight\";i:0;s:7:\"noScale\";s:0:\"\";s:20:\"additionalParameters\";s:0:\"\";s:5:\"frame\";i:0;s:4:\"crop\";N;}','7b95e088afe6473039957b27d54024f5ffd04a0f','16e8d37541219d670bd1c1a6ed19dbe14ff6039e','Image.CropScaleMask','c04abc12eb',144,144),(10,1670959301,1670959301,0,4,'/typo3temp/assets/_processed_/2/9/csm_favicon-500_16388fa89b.png','csm_favicon-500_16388fa89b.png',NULL,'a:11:{s:5:\"width\";s:4:\"152c\";s:6:\"height\";s:4:\"152c\";s:13:\"fileExtension\";s:0:\"\";s:8:\"maxWidth\";i:0;s:9:\"maxHeight\";i:0;s:8:\"minWidth\";i:0;s:9:\"minHeight\";i:0;s:7:\"noScale\";s:0:\"\";s:20:\"additionalParameters\";s:0:\"\";s:5:\"frame\";i:0;s:4:\"crop\";N;}','529d7cf6b8bc95b0168588105125f8e568b40937','16e8d37541219d670bd1c1a6ed19dbe14ff6039e','Image.CropScaleMask','16388fa89b',152,152),(11,1670959301,1670959301,0,4,'/typo3temp/assets/_processed_/2/9/csm_favicon-500_518af49612.png','csm_favicon-500_518af49612.png',NULL,'a:11:{s:5:\"width\";s:4:\"180c\";s:6:\"height\";s:4:\"180c\";s:13:\"fileExtension\";s:0:\"\";s:8:\"maxWidth\";i:0;s:9:\"maxHeight\";i:0;s:8:\"minWidth\";i:0;s:9:\"minHeight\";i:0;s:7:\"noScale\";s:0:\"\";s:20:\"additionalParameters\";s:0:\"\";s:5:\"frame\";i:0;s:4:\"crop\";N;}','d21a97ac8b13cf5ba137351a9caaac902e9fbe72','16e8d37541219d670bd1c1a6ed19dbe14ff6039e','Image.CropScaleMask','518af49612',180,180),(12,1670959301,1670959301,0,4,'/typo3temp/assets/_processed_/2/9/csm_favicon-500_81e0ac8638.png','csm_favicon-500_81e0ac8638.png',NULL,'a:11:{s:5:\"width\";s:3:\"16c\";s:6:\"height\";s:3:\"16c\";s:13:\"fileExtension\";s:0:\"\";s:8:\"maxWidth\";i:0;s:9:\"maxHeight\";i:0;s:8:\"minWidth\";i:0;s:9:\"minHeight\";i:0;s:7:\"noScale\";s:0:\"\";s:20:\"additionalParameters\";s:0:\"\";s:5:\"frame\";i:0;s:4:\"crop\";N;}','0219406bca88c5825244f55002dea7a698d497ff','16e8d37541219d670bd1c1a6ed19dbe14ff6039e','Image.CropScaleMask','81e0ac8638',16,16),(13,1670959301,1670959301,0,4,'/typo3temp/assets/_processed_/2/9/csm_favicon-500_f7aaa4747b.png','csm_favicon-500_f7aaa4747b.png',NULL,'a:11:{s:5:\"width\";s:3:\"32c\";s:6:\"height\";s:3:\"32c\";s:13:\"fileExtension\";s:0:\"\";s:8:\"maxWidth\";i:0;s:9:\"maxHeight\";i:0;s:8:\"minWidth\";i:0;s:9:\"minHeight\";i:0;s:7:\"noScale\";s:0:\"\";s:20:\"additionalParameters\";s:0:\"\";s:5:\"frame\";i:0;s:4:\"crop\";N;}','fec39e9bd51501936ef399b2480cc14c478988b0','16e8d37541219d670bd1c1a6ed19dbe14ff6039e','Image.CropScaleMask','f7aaa4747b',32,32),(14,1670959301,1670959301,0,4,'/typo3temp/assets/_processed_/2/9/csm_favicon-500_6a36e02bee.png','csm_favicon-500_6a36e02bee.png',NULL,'a:11:{s:5:\"width\";s:3:\"96c\";s:6:\"height\";s:3:\"96c\";s:13:\"fileExtension\";s:0:\"\";s:8:\"maxWidth\";i:0;s:9:\"maxHeight\";i:0;s:8:\"minWidth\";i:0;s:9:\"minHeight\";i:0;s:7:\"noScale\";s:0:\"\";s:20:\"additionalParameters\";s:0:\"\";s:5:\"frame\";i:0;s:4:\"crop\";N;}','f913b227122324e7d0ac56bc88be64b00c8a0ea5','16e8d37541219d670bd1c1a6ed19dbe14ff6039e','Image.CropScaleMask','6a36e02bee',96,96),(15,1670959301,1670959301,0,4,'/typo3temp/assets/_processed_/2/9/csm_favicon-500_c5b5d89265.png','csm_favicon-500_c5b5d89265.png',NULL,'a:11:{s:5:\"width\";s:4:\"192c\";s:6:\"height\";s:4:\"192c\";s:13:\"fileExtension\";s:0:\"\";s:8:\"maxWidth\";i:0;s:9:\"maxHeight\";i:0;s:8:\"minWidth\";i:0;s:9:\"minHeight\";i:0;s:7:\"noScale\";s:0:\"\";s:20:\"additionalParameters\";s:0:\"\";s:5:\"frame\";i:0;s:4:\"crop\";N;}','1c40d9f61e87970cf321e53862817171718f69eb','16e8d37541219d670bd1c1a6ed19dbe14ff6039e','Image.CropScaleMask','c5b5d89265',192,192),(16,1670959301,1670959301,0,4,'/typo3temp/assets/_processed_/2/9/csm_favicon-500_75709944aa.png','csm_favicon-500_75709944aa.png',NULL,'a:11:{s:5:\"width\";s:3:\"70c\";s:6:\"height\";s:3:\"70c\";s:13:\"fileExtension\";s:0:\"\";s:8:\"maxWidth\";i:0;s:9:\"maxHeight\";i:0;s:8:\"minWidth\";i:0;s:9:\"minHeight\";i:0;s:7:\"noScale\";s:0:\"\";s:20:\"additionalParameters\";s:0:\"\";s:5:\"frame\";i:0;s:4:\"crop\";N;}','1751300a6634ca043741963481171423a4d0182d','16e8d37541219d670bd1c1a6ed19dbe14ff6039e','Image.CropScaleMask','75709944aa',70,70),(17,1670959301,1670959301,0,4,'/typo3temp/assets/_processed_/2/9/csm_favicon-500_1d6f739f60.png','csm_favicon-500_1d6f739f60.png',NULL,'a:11:{s:5:\"width\";s:4:\"150c\";s:6:\"height\";s:4:\"150c\";s:13:\"fileExtension\";s:0:\"\";s:8:\"maxWidth\";i:0;s:9:\"maxHeight\";i:0;s:8:\"minWidth\";i:0;s:9:\"minHeight\";i:0;s:7:\"noScale\";s:0:\"\";s:20:\"additionalParameters\";s:0:\"\";s:5:\"frame\";i:0;s:4:\"crop\";N;}','37c01c1843fba87f11c6b0bff4cd819c86d5008b','16e8d37541219d670bd1c1a6ed19dbe14ff6039e','Image.CropScaleMask','1d6f739f60',150,150),(18,1670959301,1670959301,0,4,'/typo3temp/assets/_processed_/2/9/csm_favicon-500_df6e4d109b.png','csm_favicon-500_df6e4d109b.png',NULL,'a:11:{s:5:\"width\";s:4:\"310c\";s:6:\"height\";s:4:\"310c\";s:13:\"fileExtension\";s:0:\"\";s:8:\"maxWidth\";i:0;s:9:\"maxHeight\";i:0;s:8:\"minWidth\";i:0;s:9:\"minHeight\";i:0;s:7:\"noScale\";s:0:\"\";s:20:\"additionalParameters\";s:0:\"\";s:5:\"frame\";i:0;s:4:\"crop\";N;}','1bf327c950fde5862ba8c8ef00fccba05a874cdc','16e8d37541219d670bd1c1a6ed19dbe14ff6039e','Image.CropScaleMask','df6e4d109b',310,310),(19,1670959301,1670959301,0,5,'/typo3temp/assets/_processed_/4/0/csm_favicon-wide_1b630f0b56.png','csm_favicon-wide_1b630f0b56.png',NULL,'a:11:{s:5:\"width\";s:4:\"310c\";s:6:\"height\";s:4:\"150c\";s:13:\"fileExtension\";s:0:\"\";s:8:\"maxWidth\";i:0;s:9:\"maxHeight\";i:0;s:8:\"minWidth\";i:0;s:9:\"minHeight\";i:0;s:7:\"noScale\";s:0:\"\";s:20:\"additionalParameters\";s:0:\"\";s:5:\"frame\";i:0;s:4:\"crop\";N;}','98176f8abfaeb3396074a4c6247a2b4c908c5cfd','d8f4eb157d7f6c5adc6c1de167914dd75a4559a3','Image.CropScaleMask','1b630f0b56',310,150);
/*!40000 ALTER TABLE `sys_file_processedfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_file_reference`
--

DROP TABLE IF EXISTS `sys_file_reference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_file_reference` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `uid_local` int(11) NOT NULL DEFAULT 0,
  `uid_foreign` int(11) NOT NULL DEFAULT 0,
  `tablenames` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fieldname` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sorting_foreign` int(11) NOT NULL DEFAULT 0,
  `table_local` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` tinytext COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `alternative` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(1024) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `crop` varchar(4000) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `autoplay` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `tablenames_fieldname` (`tablenames`(32),`fieldname`(12)),
  KEY `deleted` (`deleted`),
  KEY `uid_local` (`uid_local`),
  KEY `uid_foreign` (`uid_foreign`),
  KEY `combined_1` (`l10n_parent`,`t3ver_oid`,`t3ver_wsid`,`t3ver_state`,`deleted`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_file_reference`
--

LOCK TABLES `sys_file_reference` WRITE;
/*!40000 ALTER TABLE `sys_file_reference` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_file_reference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_file_storage`
--

DROP TABLE IF EXISTS `sys_file_storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_file_storage` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `driver` tinytext COLLATE utf8_unicode_ci DEFAULT NULL,
  `configuration` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_default` smallint(6) NOT NULL DEFAULT 0,
  `is_browsable` smallint(6) NOT NULL DEFAULT 0,
  `is_public` smallint(6) NOT NULL DEFAULT 0,
  `is_writable` smallint(6) NOT NULL DEFAULT 0,
  `is_online` smallint(6) NOT NULL DEFAULT 1,
  `auto_extract_metadata` smallint(6) NOT NULL DEFAULT 1,
  `processingfolder` tinytext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_file_storage`
--

LOCK TABLES `sys_file_storage` WRITE;
/*!40000 ALTER TABLE `sys_file_storage` DISABLE KEYS */;
INSERT INTO `sys_file_storage` VALUES (1,0,1670959115,1670959115,0,0,'This is the local fileadmin/ directory. This storage mount has been created automatically by TYPO3.','fileadmin','Local','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"basePath\">\n                    <value index=\"vDEF\">fileadmin/</value>\n                </field>\n                <field index=\"pathType\">\n                    <value index=\"vDEF\">relative</value>\n                </field>\n                <field index=\"caseSensitive\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',1,1,1,1,1,1,NULL);
/*!40000 ALTER TABLE `sys_file_storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_filemounts`
--

DROP TABLE IF EXISTS `sys_filemounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_filemounts` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `base` int(10) unsigned NOT NULL DEFAULT 0,
  `read_only` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_filemounts`
--

LOCK TABLES `sys_filemounts` WRITE;
/*!40000 ALTER TABLE `sys_filemounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_filemounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_history`
--

DROP TABLE IF EXISTS `sys_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_history` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `actiontype` smallint(6) NOT NULL DEFAULT 0,
  `usertype` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'BE',
  `userid` int(10) unsigned DEFAULT NULL,
  `originaluserid` int(10) unsigned DEFAULT NULL,
  `recuid` int(11) NOT NULL DEFAULT 0,
  `tablename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `history_data` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `workspace` int(11) DEFAULT 0,
  `correlation_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`),
  KEY `recordident_1` (`tablename`(100),`recuid`),
  KEY `recordident_2` (`tablename`(100),`tstamp`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_history`
--

LOCK TABLES `sys_history` WRITE;
/*!40000 ALTER TABLE `sys_history` DISABLE KEYS */;
INSERT INTO `sys_history` VALUES (1,1670959021,1,'BE',1,0,1,'pages','{\"uid\":1,\"pid\":0,\"tstamp\":1670959021,\"crdate\":1670959021,\"cruser_id\":1,\"deleted\":0,\"hidden\":1,\"starttime\":0,\"endtime\":0,\"fe_group\":\"0\",\"sorting\":256,\"rowDescription\":null,\"editlock\":0,\"sys_language_uid\":0,\"l10n_parent\":0,\"l10n_source\":0,\"l10n_state\":null,\"t3_origuid\":0,\"l10n_diffsource\":\"\",\"t3ver_oid\":0,\"t3ver_wsid\":0,\"t3ver_state\":0,\"t3ver_stage\":0,\"perms_userid\":1,\"perms_groupid\":1,\"perms_user\":31,\"perms_group\":27,\"perms_everybody\":0,\"title\":\"Home\",\"slug\":\"\\/\",\"doktype\":1,\"TSconfig\":null,\"is_siteroot\":0,\"php_tree_stop\":0,\"url\":\"\",\"shortcut\":0,\"shortcut_mode\":0,\"subtitle\":\"\",\"layout\":0,\"target\":\"\",\"media\":0,\"lastUpdated\":0,\"keywords\":null,\"cache_timeout\":0,\"cache_tags\":\"\",\"newUntil\":0,\"description\":null,\"no_search\":0,\"SYS_LASTCHANGED\":0,\"abstract\":null,\"module\":\"\",\"extendToSubpages\":0,\"author\":\"\",\"author_email\":\"\",\"nav_title\":\"\",\"nav_hide\":0,\"content_from_pid\":0,\"mount_pid\":0,\"mount_pid_ol\":0,\"l18n_cfg\":0,\"fe_login_mode\":0,\"backend_layout\":\"\",\"backend_layout_next_level\":\"\",\"tsconfig_includes\":null,\"categories\":0,\"tx_impexp_origuid\":0,\"seo_title\":\"\",\"no_index\":0,\"no_follow\":0,\"og_title\":\"\",\"og_description\":null,\"og_image\":0,\"twitter_title\":\"\",\"twitter_description\":null,\"twitter_image\":0,\"twitter_card\":\"summary\",\"canonical_link\":\"\",\"sitemap_priority\":\"0.5\",\"sitemap_changefreq\":\"\",\"tx_staticfilecache_cache\":1,\"tx_staticfilecache_cache_force\":0,\"tx_staticfilecache_cache_offline\":0,\"tx_staticfilecache_cache_priority\":0}',0,'0400$aff995e21d2175037ee0cf710039391e:e175f7045d7ccbfb26ffcf279422c2e5'),(2,1670959027,1,'BE',1,0,1,'sys_template','{\"uid\":1,\"pid\":1,\"tstamp\":1670959027,\"crdate\":1670959027,\"cruser_id\":1,\"deleted\":0,\"hidden\":0,\"starttime\":0,\"endtime\":0,\"sorting\":256,\"description\":null,\"t3_origuid\":0,\"t3ver_oid\":0,\"t3ver_wsid\":0,\"t3ver_state\":0,\"t3ver_stage\":0,\"title\":\"NEW SITE\",\"root\":1,\"clear\":3,\"include_static_file\":null,\"constants\":null,\"config\":\"\\n# Default PAGE object:\\npage = PAGE\\npage.10 = TEXT\\npage.10.value = HELLO WORLD!\\n\",\"basedOn\":\"\",\"includeStaticAfterBasedOn\":0,\"static_file_mode\":0,\"tx_impexp_origuid\":0}',0,'0400$3ba64e102678f7eec3dd2102b255a752:35af6288617af54964e77af08c30949a'),(3,1670959108,2,'BE',1,0,1,'sys_template','{\"oldRecord\":{\"constants\":null,\"config\":\"\\n# Default PAGE object:\\npage = PAGE\\npage.10 = TEXT\\npage.10.value = HELLO WORLD!\\n\"},\"newRecord\":{\"constants\":\"@import \'EXT:mono_site\\/Configuration\\/TypoScript\\/constants.typoscript\'\\r\\n\",\"config\":\"@import \'EXT:mono_site\\/Configuration\\/TypoScript\\/setup.typoscript\'\\r\\n\"}}',0,'0400$4efbe352d6392ce05d7c147b884a7f75:35af6288617af54964e77af08c30949a'),(4,1670959143,2,'BE',1,0,1,'pages','{\"oldRecord\":{\"is_siteroot\":0,\"l10n_diffsource\":\"\"},\"newRecord\":{\"is_siteroot\":\"1\",\"l10n_diffsource\":\"{\\\"doktype\\\":\\\"\\\",\\\"title\\\":\\\"\\\",\\\"slug\\\":\\\"\\\",\\\"nav_title\\\":\\\"\\\",\\\"subtitle\\\":\\\"\\\",\\\"seo_title\\\":\\\"\\\",\\\"description\\\":\\\"\\\",\\\"no_index\\\":\\\"\\\",\\\"no_follow\\\":\\\"\\\",\\\"canonical_link\\\":\\\"\\\",\\\"sitemap_changefreq\\\":\\\"\\\",\\\"sitemap_priority\\\":\\\"\\\",\\\"og_title\\\":\\\"\\\",\\\"og_description\\\":\\\"\\\",\\\"og_image\\\":\\\"\\\",\\\"twitter_title\\\":\\\"\\\",\\\"twitter_description\\\":\\\"\\\",\\\"twitter_image\\\":\\\"\\\",\\\"twitter_card\\\":\\\"\\\",\\\"tx_staticfilecache_cache\\\":\\\"\\\",\\\"tx_staticfilecache_cache_force\\\":\\\"\\\",\\\"tx_staticfilecache_cache_offline\\\":\\\"\\\",\\\"tx_staticfilecache_cache_priority\\\":\\\"\\\",\\\"is_siteroot\\\":\\\"\\\",\\\"no_search\\\":\\\"\\\",\\\"module\\\":\\\"\\\",\\\"l18n_cfg\\\":\\\"\\\",\\\"hidden\\\":\\\"\\\",\\\"nav_hide\\\":\\\"\\\",\\\"starttime\\\":\\\"\\\",\\\"endtime\\\":\\\"\\\",\\\"categories\\\":\\\"\\\",\\\"rowDescription\\\":\\\"\\\"}\"}}',0,'0400$6797281a16e282eab001b77e2925157a:e175f7045d7ccbfb26ffcf279422c2e5'),(5,1670959157,1,'BE',1,0,2,'pages','{\"uid\":2,\"pid\":1,\"tstamp\":1670959157,\"crdate\":1670959157,\"cruser_id\":1,\"deleted\":0,\"hidden\":1,\"starttime\":0,\"endtime\":0,\"fe_group\":\"0\",\"sorting\":256,\"rowDescription\":null,\"editlock\":0,\"sys_language_uid\":0,\"l10n_parent\":0,\"l10n_source\":0,\"l10n_state\":null,\"t3_origuid\":0,\"l10n_diffsource\":\"\",\"t3ver_oid\":0,\"t3ver_wsid\":0,\"t3ver_state\":0,\"t3ver_stage\":0,\"perms_userid\":1,\"perms_groupid\":1,\"perms_user\":31,\"perms_group\":27,\"perms_everybody\":0,\"title\":\"404\",\"slug\":\"\\/404\",\"doktype\":1,\"TSconfig\":null,\"is_siteroot\":0,\"php_tree_stop\":0,\"url\":\"\",\"shortcut\":0,\"shortcut_mode\":0,\"subtitle\":\"\",\"layout\":0,\"target\":\"\",\"media\":0,\"lastUpdated\":0,\"keywords\":null,\"cache_timeout\":0,\"cache_tags\":\"\",\"newUntil\":0,\"description\":null,\"no_search\":0,\"SYS_LASTCHANGED\":0,\"abstract\":null,\"module\":\"\",\"extendToSubpages\":0,\"author\":\"\",\"author_email\":\"\",\"nav_title\":\"\",\"nav_hide\":0,\"content_from_pid\":0,\"mount_pid\":0,\"mount_pid_ol\":0,\"l18n_cfg\":0,\"fe_login_mode\":0,\"backend_layout\":\"\",\"backend_layout_next_level\":\"\",\"tsconfig_includes\":null,\"categories\":0,\"tx_impexp_origuid\":0,\"seo_title\":\"\",\"no_index\":0,\"no_follow\":0,\"og_title\":\"\",\"og_description\":null,\"og_image\":0,\"twitter_title\":\"\",\"twitter_description\":null,\"twitter_image\":0,\"twitter_card\":\"summary\",\"canonical_link\":\"\",\"sitemap_priority\":\"0.5\",\"sitemap_changefreq\":\"\",\"tx_staticfilecache_cache\":1,\"tx_staticfilecache_cache_force\":0,\"tx_staticfilecache_cache_offline\":0,\"tx_staticfilecache_cache_priority\":0}',0,'0400$946aa0838d440e4803cdb5837b8d9f46:f11830df10b4b0bca2db34810c2241b3'),(6,1670959166,1,'BE',1,0,3,'pages','{\"uid\":3,\"pid\":1,\"tstamp\":1670959166,\"crdate\":1670959166,\"cruser_id\":1,\"deleted\":0,\"hidden\":1,\"starttime\":0,\"endtime\":0,\"fe_group\":\"0\",\"sorting\":128,\"rowDescription\":null,\"editlock\":0,\"sys_language_uid\":0,\"l10n_parent\":0,\"l10n_source\":0,\"l10n_state\":null,\"t3_origuid\":0,\"l10n_diffsource\":\"\",\"t3ver_oid\":0,\"t3ver_wsid\":0,\"t3ver_state\":0,\"t3ver_stage\":0,\"perms_userid\":1,\"perms_groupid\":1,\"perms_user\":31,\"perms_group\":27,\"perms_everybody\":0,\"title\":\"Meta\",\"slug\":\"\\/meta\",\"doktype\":254,\"TSconfig\":null,\"is_siteroot\":0,\"php_tree_stop\":0,\"url\":\"\",\"shortcut\":0,\"shortcut_mode\":0,\"subtitle\":\"\",\"layout\":0,\"target\":\"\",\"media\":0,\"lastUpdated\":0,\"keywords\":null,\"cache_timeout\":0,\"cache_tags\":\"\",\"newUntil\":0,\"description\":null,\"no_search\":0,\"SYS_LASTCHANGED\":0,\"abstract\":null,\"module\":\"\",\"extendToSubpages\":0,\"author\":\"\",\"author_email\":\"\",\"nav_title\":\"\",\"nav_hide\":0,\"content_from_pid\":0,\"mount_pid\":0,\"mount_pid_ol\":0,\"l18n_cfg\":0,\"fe_login_mode\":0,\"backend_layout\":\"\",\"backend_layout_next_level\":\"\",\"tsconfig_includes\":null,\"categories\":0,\"tx_impexp_origuid\":0,\"seo_title\":\"\",\"no_index\":0,\"no_follow\":0,\"og_title\":\"\",\"og_description\":null,\"og_image\":0,\"twitter_title\":\"\",\"twitter_description\":null,\"twitter_image\":0,\"twitter_card\":\"summary\",\"canonical_link\":\"\",\"sitemap_priority\":\"0.5\",\"sitemap_changefreq\":\"\",\"tx_staticfilecache_cache\":1,\"tx_staticfilecache_cache_force\":0,\"tx_staticfilecache_cache_offline\":0,\"tx_staticfilecache_cache_priority\":0}',0,'0400$35a15b485c88ecbe8eaa95a960dafed0:fe15eeb7d49e64e2cea91ab53fcf0db1'),(7,1670959171,1,'BE',1,0,4,'pages','{\"uid\":4,\"pid\":1,\"tstamp\":1670959171,\"crdate\":1670959171,\"cruser_id\":1,\"deleted\":0,\"hidden\":1,\"starttime\":0,\"endtime\":0,\"fe_group\":\"0\",\"sorting\":64,\"rowDescription\":null,\"editlock\":0,\"sys_language_uid\":0,\"l10n_parent\":0,\"l10n_source\":0,\"l10n_state\":null,\"t3_origuid\":0,\"l10n_diffsource\":\"\",\"t3ver_oid\":0,\"t3ver_wsid\":0,\"t3ver_state\":0,\"t3ver_stage\":0,\"perms_userid\":1,\"perms_groupid\":1,\"perms_user\":31,\"perms_group\":27,\"perms_everybody\":0,\"title\":\"Data\",\"slug\":\"\\/data\",\"doktype\":254,\"TSconfig\":null,\"is_siteroot\":0,\"php_tree_stop\":0,\"url\":\"\",\"shortcut\":0,\"shortcut_mode\":0,\"subtitle\":\"\",\"layout\":0,\"target\":\"\",\"media\":0,\"lastUpdated\":0,\"keywords\":null,\"cache_timeout\":0,\"cache_tags\":\"\",\"newUntil\":0,\"description\":null,\"no_search\":0,\"SYS_LASTCHANGED\":0,\"abstract\":null,\"module\":\"\",\"extendToSubpages\":0,\"author\":\"\",\"author_email\":\"\",\"nav_title\":\"\",\"nav_hide\":0,\"content_from_pid\":0,\"mount_pid\":0,\"mount_pid_ol\":0,\"l18n_cfg\":0,\"fe_login_mode\":0,\"backend_layout\":\"\",\"backend_layout_next_level\":\"\",\"tsconfig_includes\":null,\"categories\":0,\"tx_impexp_origuid\":0,\"seo_title\":\"\",\"no_index\":0,\"no_follow\":0,\"og_title\":\"\",\"og_description\":null,\"og_image\":0,\"twitter_title\":\"\",\"twitter_description\":null,\"twitter_image\":0,\"twitter_card\":\"summary\",\"canonical_link\":\"\",\"sitemap_priority\":\"0.5\",\"sitemap_changefreq\":\"\",\"tx_staticfilecache_cache\":1,\"tx_staticfilecache_cache_force\":0,\"tx_staticfilecache_cache_offline\":0,\"tx_staticfilecache_cache_priority\":0}',0,'0400$de0d1d872e17c89adfac572e581a62ad:412add0b3eb6ec8f1cb6710aea92e21e'),(8,1670959177,1,'BE',1,0,5,'pages','{\"uid\":5,\"pid\":4,\"tstamp\":1670959177,\"crdate\":1670959177,\"cruser_id\":1,\"deleted\":0,\"hidden\":1,\"starttime\":0,\"endtime\":0,\"fe_group\":\"0\",\"sorting\":256,\"rowDescription\":null,\"editlock\":0,\"sys_language_uid\":0,\"l10n_parent\":0,\"l10n_source\":0,\"l10n_state\":null,\"t3_origuid\":0,\"l10n_diffsource\":\"\",\"t3ver_oid\":0,\"t3ver_wsid\":0,\"t3ver_state\":0,\"t3ver_stage\":0,\"perms_userid\":1,\"perms_groupid\":1,\"perms_user\":31,\"perms_group\":27,\"perms_everybody\":0,\"title\":\"Forms\",\"slug\":\"\\/forms\",\"doktype\":254,\"TSconfig\":null,\"is_siteroot\":0,\"php_tree_stop\":0,\"url\":\"\",\"shortcut\":0,\"shortcut_mode\":0,\"subtitle\":\"\",\"layout\":0,\"target\":\"\",\"media\":0,\"lastUpdated\":0,\"keywords\":null,\"cache_timeout\":0,\"cache_tags\":\"\",\"newUntil\":0,\"description\":null,\"no_search\":0,\"SYS_LASTCHANGED\":0,\"abstract\":null,\"module\":\"\",\"extendToSubpages\":0,\"author\":\"\",\"author_email\":\"\",\"nav_title\":\"\",\"nav_hide\":0,\"content_from_pid\":0,\"mount_pid\":0,\"mount_pid_ol\":0,\"l18n_cfg\":0,\"fe_login_mode\":0,\"backend_layout\":\"\",\"backend_layout_next_level\":\"\",\"tsconfig_includes\":null,\"categories\":0,\"tx_impexp_origuid\":0,\"seo_title\":\"\",\"no_index\":0,\"no_follow\":0,\"og_title\":\"\",\"og_description\":null,\"og_image\":0,\"twitter_title\":\"\",\"twitter_description\":null,\"twitter_image\":0,\"twitter_card\":\"summary\",\"canonical_link\":\"\",\"sitemap_priority\":\"0.5\",\"sitemap_changefreq\":\"\",\"tx_staticfilecache_cache\":1,\"tx_staticfilecache_cache_force\":0,\"tx_staticfilecache_cache_offline\":0,\"tx_staticfilecache_cache_priority\":0}',0,'0400$3de7da16ec79d9ed52c2701d84d66f8f:7ef5a4e3e11db8ac3fea4d7a75468161'),(9,1670959189,1,'BE',1,0,6,'pages','{\"uid\":6,\"pid\":4,\"tstamp\":1670959189,\"crdate\":1670959189,\"cruser_id\":1,\"deleted\":0,\"hidden\":1,\"starttime\":0,\"endtime\":0,\"fe_group\":\"0\",\"sorting\":128,\"rowDescription\":null,\"editlock\":0,\"sys_language_uid\":0,\"l10n_parent\":0,\"l10n_source\":0,\"l10n_state\":null,\"t3_origuid\":0,\"l10n_diffsource\":\"\",\"t3ver_oid\":0,\"t3ver_wsid\":0,\"t3ver_state\":0,\"t3ver_stage\":0,\"perms_userid\":1,\"perms_groupid\":1,\"perms_user\":31,\"perms_group\":27,\"perms_everybody\":0,\"title\":\"Content Elements\",\"slug\":\"\\/content-elements\",\"doktype\":254,\"TSconfig\":null,\"is_siteroot\":0,\"php_tree_stop\":0,\"url\":\"\",\"shortcut\":0,\"shortcut_mode\":0,\"subtitle\":\"\",\"layout\":0,\"target\":\"\",\"media\":0,\"lastUpdated\":0,\"keywords\":null,\"cache_timeout\":0,\"cache_tags\":\"\",\"newUntil\":0,\"description\":null,\"no_search\":0,\"SYS_LASTCHANGED\":0,\"abstract\":null,\"module\":\"\",\"extendToSubpages\":0,\"author\":\"\",\"author_email\":\"\",\"nav_title\":\"\",\"nav_hide\":0,\"content_from_pid\":0,\"mount_pid\":0,\"mount_pid_ol\":0,\"l18n_cfg\":0,\"fe_login_mode\":0,\"backend_layout\":\"\",\"backend_layout_next_level\":\"\",\"tsconfig_includes\":null,\"categories\":0,\"tx_impexp_origuid\":0,\"seo_title\":\"\",\"no_index\":0,\"no_follow\":0,\"og_title\":\"\",\"og_description\":null,\"og_image\":0,\"twitter_title\":\"\",\"twitter_description\":null,\"twitter_image\":0,\"twitter_card\":\"summary\",\"canonical_link\":\"\",\"sitemap_priority\":\"0.5\",\"sitemap_changefreq\":\"\",\"tx_staticfilecache_cache\":1,\"tx_staticfilecache_cache_force\":0,\"tx_staticfilecache_cache_offline\":0,\"tx_staticfilecache_cache_priority\":0}',0,'0400$a07ec22f0c4604c282b09c120749a881:c75354c439a48dbde16b03ac553a080d'),(10,1670959207,1,'BE',1,0,7,'pages','{\"uid\":7,\"pid\":3,\"tstamp\":1670959207,\"crdate\":1670959207,\"cruser_id\":1,\"deleted\":0,\"hidden\":1,\"starttime\":0,\"endtime\":0,\"fe_group\":\"0\",\"sorting\":256,\"rowDescription\":null,\"editlock\":0,\"sys_language_uid\":0,\"l10n_parent\":0,\"l10n_source\":0,\"l10n_state\":null,\"t3_origuid\":0,\"l10n_diffsource\":\"\",\"t3ver_oid\":0,\"t3ver_wsid\":0,\"t3ver_state\":0,\"t3ver_stage\":0,\"perms_userid\":1,\"perms_groupid\":1,\"perms_user\":31,\"perms_group\":27,\"perms_everybody\":0,\"title\":\"Contact\",\"slug\":\"\\/contact\",\"doktype\":1,\"TSconfig\":null,\"is_siteroot\":0,\"php_tree_stop\":0,\"url\":\"\",\"shortcut\":0,\"shortcut_mode\":0,\"subtitle\":\"\",\"layout\":0,\"target\":\"\",\"media\":0,\"lastUpdated\":0,\"keywords\":null,\"cache_timeout\":0,\"cache_tags\":\"\",\"newUntil\":0,\"description\":null,\"no_search\":0,\"SYS_LASTCHANGED\":0,\"abstract\":null,\"module\":\"\",\"extendToSubpages\":0,\"author\":\"\",\"author_email\":\"\",\"nav_title\":\"\",\"nav_hide\":0,\"content_from_pid\":0,\"mount_pid\":0,\"mount_pid_ol\":0,\"l18n_cfg\":0,\"fe_login_mode\":0,\"backend_layout\":\"\",\"backend_layout_next_level\":\"\",\"tsconfig_includes\":null,\"categories\":0,\"tx_impexp_origuid\":0,\"seo_title\":\"\",\"no_index\":0,\"no_follow\":0,\"og_title\":\"\",\"og_description\":null,\"og_image\":0,\"twitter_title\":\"\",\"twitter_description\":null,\"twitter_image\":0,\"twitter_card\":\"summary\",\"canonical_link\":\"\",\"sitemap_priority\":\"0.5\",\"sitemap_changefreq\":\"\",\"tx_staticfilecache_cache\":1,\"tx_staticfilecache_cache_force\":0,\"tx_staticfilecache_cache_offline\":0,\"tx_staticfilecache_cache_priority\":0}',0,'0400$643b0ac8654b5990c0e9ea9c3d7c134d:df50bb24cbce671cf0d61f42fbbef601'),(11,1670959212,1,'BE',1,0,8,'pages','{\"uid\":8,\"pid\":3,\"tstamp\":1670959212,\"crdate\":1670959212,\"cruser_id\":1,\"deleted\":0,\"hidden\":1,\"starttime\":0,\"endtime\":0,\"fe_group\":\"0\",\"sorting\":128,\"rowDescription\":null,\"editlock\":0,\"sys_language_uid\":0,\"l10n_parent\":0,\"l10n_source\":0,\"l10n_state\":null,\"t3_origuid\":0,\"l10n_diffsource\":\"\",\"t3ver_oid\":0,\"t3ver_wsid\":0,\"t3ver_state\":0,\"t3ver_stage\":0,\"perms_userid\":1,\"perms_groupid\":1,\"perms_user\":31,\"perms_group\":27,\"perms_everybody\":0,\"title\":\"Imprint\",\"slug\":\"\\/imprint\",\"doktype\":1,\"TSconfig\":null,\"is_siteroot\":0,\"php_tree_stop\":0,\"url\":\"\",\"shortcut\":0,\"shortcut_mode\":0,\"subtitle\":\"\",\"layout\":0,\"target\":\"\",\"media\":0,\"lastUpdated\":0,\"keywords\":null,\"cache_timeout\":0,\"cache_tags\":\"\",\"newUntil\":0,\"description\":null,\"no_search\":0,\"SYS_LASTCHANGED\":0,\"abstract\":null,\"module\":\"\",\"extendToSubpages\":0,\"author\":\"\",\"author_email\":\"\",\"nav_title\":\"\",\"nav_hide\":0,\"content_from_pid\":0,\"mount_pid\":0,\"mount_pid_ol\":0,\"l18n_cfg\":0,\"fe_login_mode\":0,\"backend_layout\":\"\",\"backend_layout_next_level\":\"\",\"tsconfig_includes\":null,\"categories\":0,\"tx_impexp_origuid\":0,\"seo_title\":\"\",\"no_index\":0,\"no_follow\":0,\"og_title\":\"\",\"og_description\":null,\"og_image\":0,\"twitter_title\":\"\",\"twitter_description\":null,\"twitter_image\":0,\"twitter_card\":\"summary\",\"canonical_link\":\"\",\"sitemap_priority\":\"0.5\",\"sitemap_changefreq\":\"\",\"tx_staticfilecache_cache\":1,\"tx_staticfilecache_cache_force\":0,\"tx_staticfilecache_cache_offline\":0,\"tx_staticfilecache_cache_priority\":0}',0,'0400$f9c65d5ebb5415ff12917983287a4d74:595375f2fb9f014e091eb08fbc51ec88'),(12,1670959224,1,'BE',1,0,9,'pages','{\"uid\":9,\"pid\":3,\"tstamp\":1670959224,\"crdate\":1670959224,\"cruser_id\":1,\"deleted\":0,\"hidden\":1,\"starttime\":0,\"endtime\":0,\"fe_group\":\"0\",\"sorting\":64,\"rowDescription\":null,\"editlock\":0,\"sys_language_uid\":0,\"l10n_parent\":0,\"l10n_source\":0,\"l10n_state\":null,\"t3_origuid\":0,\"l10n_diffsource\":\"\",\"t3ver_oid\":0,\"t3ver_wsid\":0,\"t3ver_state\":0,\"t3ver_stage\":0,\"perms_userid\":1,\"perms_groupid\":1,\"perms_user\":31,\"perms_group\":27,\"perms_everybody\":0,\"title\":\"Privacy\",\"slug\":\"\\/privacy\",\"doktype\":1,\"TSconfig\":null,\"is_siteroot\":0,\"php_tree_stop\":0,\"url\":\"\",\"shortcut\":0,\"shortcut_mode\":0,\"subtitle\":\"\",\"layout\":0,\"target\":\"\",\"media\":0,\"lastUpdated\":0,\"keywords\":null,\"cache_timeout\":0,\"cache_tags\":\"\",\"newUntil\":0,\"description\":null,\"no_search\":0,\"SYS_LASTCHANGED\":0,\"abstract\":null,\"module\":\"\",\"extendToSubpages\":0,\"author\":\"\",\"author_email\":\"\",\"nav_title\":\"\",\"nav_hide\":0,\"content_from_pid\":0,\"mount_pid\":0,\"mount_pid_ol\":0,\"l18n_cfg\":0,\"fe_login_mode\":0,\"backend_layout\":\"\",\"backend_layout_next_level\":\"\",\"tsconfig_includes\":null,\"categories\":0,\"tx_impexp_origuid\":0,\"seo_title\":\"\",\"no_index\":0,\"no_follow\":0,\"og_title\":\"\",\"og_description\":null,\"og_image\":0,\"twitter_title\":\"\",\"twitter_description\":null,\"twitter_image\":0,\"twitter_card\":\"summary\",\"canonical_link\":\"\",\"sitemap_priority\":\"0.5\",\"sitemap_changefreq\":\"\",\"tx_staticfilecache_cache\":1,\"tx_staticfilecache_cache_force\":0,\"tx_staticfilecache_cache_offline\":0,\"tx_staticfilecache_cache_priority\":0}',0,'0400$a070ec084b2d62f3050a23a724002baf:c5e7fa6b7b8146bdcdc78407b052e1d7'),(13,1670959236,2,'BE',1,0,9,'pages','{\"oldRecord\":{\"title\":\"Privacy\",\"l10n_diffsource\":\"\"},\"newRecord\":{\"title\":\"Privacy Policy\",\"l10n_diffsource\":\"{\\\"title\\\":\\\"\\\"}\"}}',0,'0400$347e91348f5f4a6479997e8cb78616a6:c5e7fa6b7b8146bdcdc78407b052e1d7'),(14,1670959244,1,'BE',1,0,10,'pages','{\"uid\":10,\"pid\":3,\"tstamp\":1670959244,\"crdate\":1670959244,\"cruser_id\":1,\"deleted\":0,\"hidden\":1,\"starttime\":0,\"endtime\":0,\"fe_group\":\"0\",\"sorting\":32,\"rowDescription\":null,\"editlock\":0,\"sys_language_uid\":0,\"l10n_parent\":0,\"l10n_source\":0,\"l10n_state\":null,\"t3_origuid\":0,\"l10n_diffsource\":\"\",\"t3ver_oid\":0,\"t3ver_wsid\":0,\"t3ver_state\":0,\"t3ver_stage\":0,\"perms_userid\":1,\"perms_groupid\":1,\"perms_user\":31,\"perms_group\":27,\"perms_everybody\":0,\"title\":\"Cookie Settings\",\"slug\":\"\\/cookie-settings\",\"doktype\":1,\"TSconfig\":null,\"is_siteroot\":0,\"php_tree_stop\":0,\"url\":\"\",\"shortcut\":0,\"shortcut_mode\":0,\"subtitle\":\"\",\"layout\":0,\"target\":\"\",\"media\":0,\"lastUpdated\":0,\"keywords\":null,\"cache_timeout\":0,\"cache_tags\":\"\",\"newUntil\":0,\"description\":null,\"no_search\":0,\"SYS_LASTCHANGED\":0,\"abstract\":null,\"module\":\"\",\"extendToSubpages\":0,\"author\":\"\",\"author_email\":\"\",\"nav_title\":\"\",\"nav_hide\":0,\"content_from_pid\":0,\"mount_pid\":0,\"mount_pid_ol\":0,\"l18n_cfg\":0,\"fe_login_mode\":0,\"backend_layout\":\"\",\"backend_layout_next_level\":\"\",\"tsconfig_includes\":null,\"categories\":0,\"tx_impexp_origuid\":0,\"seo_title\":\"\",\"no_index\":0,\"no_follow\":0,\"og_title\":\"\",\"og_description\":null,\"og_image\":0,\"twitter_title\":\"\",\"twitter_description\":null,\"twitter_image\":0,\"twitter_card\":\"summary\",\"canonical_link\":\"\",\"sitemap_priority\":\"0.5\",\"sitemap_changefreq\":\"\",\"tx_staticfilecache_cache\":1,\"tx_staticfilecache_cache_force\":0,\"tx_staticfilecache_cache_offline\":0,\"tx_staticfilecache_cache_priority\":0}',0,'0400$c53db5f09691a796b4337c9d429fd7fa:e904af5a60392ab3165f5849f5877e45'),(15,1670959253,1,'BE',1,0,11,'pages','{\"uid\":11,\"pid\":7,\"tstamp\":1670959253,\"crdate\":1670959253,\"cruser_id\":1,\"deleted\":0,\"hidden\":1,\"starttime\":0,\"endtime\":0,\"fe_group\":\"0\",\"sorting\":256,\"rowDescription\":null,\"editlock\":0,\"sys_language_uid\":0,\"l10n_parent\":0,\"l10n_source\":0,\"l10n_state\":null,\"t3_origuid\":0,\"l10n_diffsource\":\"\",\"t3ver_oid\":0,\"t3ver_wsid\":0,\"t3ver_state\":0,\"t3ver_stage\":0,\"perms_userid\":1,\"perms_groupid\":1,\"perms_user\":31,\"perms_group\":27,\"perms_everybody\":0,\"title\":\"Thanks you\",\"slug\":\"\\/contact\\/thanks-you\",\"doktype\":1,\"TSconfig\":null,\"is_siteroot\":0,\"php_tree_stop\":0,\"url\":\"\",\"shortcut\":0,\"shortcut_mode\":0,\"subtitle\":\"\",\"layout\":0,\"target\":\"\",\"media\":0,\"lastUpdated\":0,\"keywords\":null,\"cache_timeout\":0,\"cache_tags\":\"\",\"newUntil\":0,\"description\":null,\"no_search\":0,\"SYS_LASTCHANGED\":0,\"abstract\":null,\"module\":\"\",\"extendToSubpages\":0,\"author\":\"\",\"author_email\":\"\",\"nav_title\":\"\",\"nav_hide\":0,\"content_from_pid\":0,\"mount_pid\":0,\"mount_pid_ol\":0,\"l18n_cfg\":0,\"fe_login_mode\":0,\"backend_layout\":\"\",\"backend_layout_next_level\":\"\",\"tsconfig_includes\":null,\"categories\":0,\"tx_impexp_origuid\":0,\"seo_title\":\"\",\"no_index\":0,\"no_follow\":0,\"og_title\":\"\",\"og_description\":null,\"og_image\":0,\"twitter_title\":\"\",\"twitter_description\":null,\"twitter_image\":0,\"twitter_card\":\"summary\",\"canonical_link\":\"\",\"sitemap_priority\":\"0.5\",\"sitemap_changefreq\":\"\",\"tx_staticfilecache_cache\":1,\"tx_staticfilecache_cache_force\":0,\"tx_staticfilecache_cache_offline\":0,\"tx_staticfilecache_cache_priority\":0}',0,'0400$9a3d4a53f848fb32ef03fb32d82c9667:51bca2bcf14079cc366c99de31802400'),(16,1670959261,2,'BE',1,0,11,'pages','{\"oldRecord\":{\"title\":\"Thanks you\",\"l10n_diffsource\":\"\"},\"newRecord\":{\"title\":\"Thank you\",\"l10n_diffsource\":\"{\\\"title\\\":\\\"\\\"}\"}}',0,'0400$f96db249345353cb89c1152250eb261e:51bca2bcf14079cc366c99de31802400'),(17,1670959269,2,'BE',1,0,4,'pages','{\"oldRecord\":{\"hidden\":1,\"l10n_diffsource\":\"\"},\"newRecord\":{\"hidden\":\"0\",\"l10n_diffsource\":\"{\\\"hidden\\\":\\\"\\\"}\"}}',0,'0400$87b284b42953fa5f9b8fa3b59e9ab5d5:412add0b3eb6ec8f1cb6710aea92e21e'),(18,1670959269,2,'BE',1,0,3,'pages','{\"oldRecord\":{\"hidden\":1,\"l10n_diffsource\":\"\"},\"newRecord\":{\"hidden\":\"0\",\"l10n_diffsource\":\"{\\\"hidden\\\":\\\"\\\"}\"}}',0,'0400$537d34abe0a5049d3180ab9bff1088e7:fe15eeb7d49e64e2cea91ab53fcf0db1'),(19,1670959270,2,'BE',1,0,2,'pages','{\"oldRecord\":{\"hidden\":1,\"l10n_diffsource\":\"\"},\"newRecord\":{\"hidden\":\"0\",\"l10n_diffsource\":\"{\\\"hidden\\\":\\\"\\\"}\"}}',0,'0400$b00fdbf966ffe75046c6f8d25d8dcad7:f11830df10b4b0bca2db34810c2241b3'),(20,1670959273,2,'BE',1,0,6,'pages','{\"oldRecord\":{\"hidden\":1,\"l10n_diffsource\":\"\"},\"newRecord\":{\"hidden\":\"0\",\"l10n_diffsource\":\"{\\\"hidden\\\":\\\"\\\"}\"}}',0,'0400$f48f4bec423aa8e9b210b78b2d52c9cd:c75354c439a48dbde16b03ac553a080d'),(21,1670959273,2,'BE',1,0,5,'pages','{\"oldRecord\":{\"hidden\":1,\"l10n_diffsource\":\"\"},\"newRecord\":{\"hidden\":\"0\",\"l10n_diffsource\":\"{\\\"hidden\\\":\\\"\\\"}\"}}',0,'0400$f8e176b9a13d133fd475a07431b05aa1:7ef5a4e3e11db8ac3fea4d7a75468161'),(22,1670959276,2,'BE',1,0,10,'pages','{\"oldRecord\":{\"hidden\":1,\"l10n_diffsource\":\"\"},\"newRecord\":{\"hidden\":\"0\",\"l10n_diffsource\":\"{\\\"hidden\\\":\\\"\\\"}\"}}',0,'0400$b063fc2ba9f1230be6dbbbd33165fea4:e904af5a60392ab3165f5849f5877e45'),(23,1670959276,2,'BE',1,0,9,'pages','{\"oldRecord\":{\"hidden\":1,\"l10n_diffsource\":\"{\\\"title\\\":\\\"\\\"}\"},\"newRecord\":{\"hidden\":\"0\",\"l10n_diffsource\":\"{\\\"hidden\\\":\\\"\\\"}\"}}',0,'0400$70c742298d5a8bac52e0e005227b706a:c5e7fa6b7b8146bdcdc78407b052e1d7'),(24,1670959277,2,'BE',1,0,8,'pages','{\"oldRecord\":{\"hidden\":1,\"l10n_diffsource\":\"\"},\"newRecord\":{\"hidden\":\"0\",\"l10n_diffsource\":\"{\\\"hidden\\\":\\\"\\\"}\"}}',0,'0400$b695a2d9a2b2a353ed2326d6f8ba2030:595375f2fb9f014e091eb08fbc51ec88'),(25,1670959277,2,'BE',1,0,7,'pages','{\"oldRecord\":{\"hidden\":1,\"l10n_diffsource\":\"\"},\"newRecord\":{\"hidden\":\"0\",\"l10n_diffsource\":\"{\\\"hidden\\\":\\\"\\\"}\"}}',0,'0400$26d15b2434a0d1fd90b66949058bd9ed:df50bb24cbce671cf0d61f42fbbef601'),(26,1670959284,2,'BE',1,0,11,'pages','{\"oldRecord\":{\"hidden\":1,\"l10n_diffsource\":\"{\\\"title\\\":\\\"\\\"}\"},\"newRecord\":{\"hidden\":\"0\",\"l10n_diffsource\":\"{\\\"hidden\\\":\\\"\\\"}\"}}',0,'0400$bd9a70d7273069450418f26982e23b71:51bca2bcf14079cc366c99de31802400'),(27,1670959291,2,'BE',1,0,1,'pages','{\"oldRecord\":{\"hidden\":1,\"l10n_diffsource\":\"{\\\"doktype\\\":\\\"\\\",\\\"title\\\":\\\"\\\",\\\"slug\\\":\\\"\\\",\\\"nav_title\\\":\\\"\\\",\\\"subtitle\\\":\\\"\\\",\\\"seo_title\\\":\\\"\\\",\\\"description\\\":\\\"\\\",\\\"no_index\\\":\\\"\\\",\\\"no_follow\\\":\\\"\\\",\\\"canonical_link\\\":\\\"\\\",\\\"sitemap_changefreq\\\":\\\"\\\",\\\"sitemap_priority\\\":\\\"\\\",\\\"og_title\\\":\\\"\\\",\\\"og_description\\\":\\\"\\\",\\\"og_image\\\":\\\"\\\",\\\"twitter_title\\\":\\\"\\\",\\\"twitter_description\\\":\\\"\\\",\\\"twitter_image\\\":\\\"\\\",\\\"twitter_card\\\":\\\"\\\",\\\"tx_staticfilecache_cache\\\":\\\"\\\",\\\"tx_staticfilecache_cache_force\\\":\\\"\\\",\\\"tx_staticfilecache_cache_offline\\\":\\\"\\\",\\\"tx_staticfilecache_cache_priority\\\":\\\"\\\",\\\"is_siteroot\\\":\\\"\\\",\\\"no_search\\\":\\\"\\\",\\\"module\\\":\\\"\\\",\\\"l18n_cfg\\\":\\\"\\\",\\\"hidden\\\":\\\"\\\",\\\"nav_hide\\\":\\\"\\\",\\\"starttime\\\":\\\"\\\",\\\"endtime\\\":\\\"\\\",\\\"categories\\\":\\\"\\\",\\\"rowDescription\\\":\\\"\\\"}\"},\"newRecord\":{\"hidden\":\"0\",\"l10n_diffsource\":\"{\\\"hidden\\\":\\\"\\\"}\"}}',0,'0400$8dd8e7ec309e2cff7f3ce5100c1567a2:e175f7045d7ccbfb26ffcf279422c2e5'),(28,1670959438,1,'BE',1,0,12,'pages','{\"uid\":12,\"pid\":4,\"tstamp\":1670959438,\"crdate\":1670959438,\"cruser_id\":1,\"deleted\":0,\"hidden\":1,\"starttime\":0,\"endtime\":0,\"fe_group\":\"0\",\"sorting\":64,\"rowDescription\":null,\"editlock\":0,\"sys_language_uid\":0,\"l10n_parent\":0,\"l10n_source\":0,\"l10n_state\":null,\"t3_origuid\":0,\"l10n_diffsource\":\"\",\"t3ver_oid\":0,\"t3ver_wsid\":0,\"t3ver_state\":0,\"t3ver_stage\":0,\"perms_userid\":1,\"perms_groupid\":1,\"perms_user\":31,\"perms_group\":27,\"perms_everybody\":0,\"title\":\"Cookies\",\"slug\":\"\\/cookies\",\"doktype\":254,\"TSconfig\":null,\"is_siteroot\":0,\"php_tree_stop\":0,\"url\":\"\",\"shortcut\":0,\"shortcut_mode\":0,\"subtitle\":\"\",\"layout\":0,\"target\":\"\",\"media\":0,\"lastUpdated\":0,\"keywords\":null,\"cache_timeout\":0,\"cache_tags\":\"\",\"newUntil\":0,\"description\":null,\"no_search\":0,\"SYS_LASTCHANGED\":0,\"abstract\":null,\"module\":\"\",\"extendToSubpages\":0,\"author\":\"\",\"author_email\":\"\",\"nav_title\":\"\",\"nav_hide\":0,\"content_from_pid\":0,\"mount_pid\":0,\"mount_pid_ol\":0,\"l18n_cfg\":0,\"fe_login_mode\":0,\"backend_layout\":\"\",\"backend_layout_next_level\":\"\",\"tsconfig_includes\":null,\"categories\":0,\"tx_impexp_origuid\":0,\"seo_title\":\"\",\"no_index\":0,\"no_follow\":0,\"og_title\":\"\",\"og_description\":null,\"og_image\":0,\"twitter_title\":\"\",\"twitter_description\":null,\"twitter_image\":0,\"twitter_card\":\"summary\",\"canonical_link\":\"\",\"sitemap_priority\":\"0.5\",\"sitemap_changefreq\":\"\",\"tx_staticfilecache_cache\":1,\"tx_staticfilecache_cache_force\":0,\"tx_staticfilecache_cache_offline\":0,\"tx_staticfilecache_cache_priority\":0}',0,'0400$5d888636daf88b1071328303f004a00b:d6f57183d4ec29f4a568a174f36b861b'),(29,1670959466,2,'BE',1,0,12,'pages','{\"oldRecord\":{\"hidden\":1,\"l10n_diffsource\":\"\"},\"newRecord\":{\"hidden\":\"0\",\"l10n_diffsource\":\"{\\\"hidden\\\":\\\"\\\"}\"}}',0,'0400$10e6477300db8d90b19769ef3a88fd93:d6f57183d4ec29f4a568a174f36b861b');
/*!40000 ALTER TABLE `sys_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_language`
--

DROP TABLE IF EXISTS `sys_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_language` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `title` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `flag` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `language_isocode` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_language`
--

LOCK TABLES `sys_language` WRITE;
/*!40000 ALTER TABLE `sys_language` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_lockedrecords`
--

DROP TABLE IF EXISTS `sys_lockedrecords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_lockedrecords` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `record_table` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `record_uid` int(11) NOT NULL DEFAULT 0,
  `record_pid` int(11) NOT NULL DEFAULT 0,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `feuserid` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `event` (`userid`,`tstamp`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_lockedrecords`
--

LOCK TABLES `sys_lockedrecords` WRITE;
/*!40000 ALTER TABLE `sys_lockedrecords` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_lockedrecords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_log`
--

DROP TABLE IF EXISTS `sys_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_log` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `userid` int(10) unsigned NOT NULL DEFAULT 0,
  `action` smallint(5) unsigned NOT NULL DEFAULT 0,
  `recuid` int(10) unsigned NOT NULL DEFAULT 0,
  `tablename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `recpid` int(11) NOT NULL DEFAULT 0,
  `error` smallint(5) unsigned NOT NULL DEFAULT 0,
  `details` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` smallint(5) unsigned NOT NULL DEFAULT 0,
  `channel` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `details_nr` smallint(6) NOT NULL DEFAULT 0,
  `IP` varchar(39) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `log_data` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `event_pid` int(11) NOT NULL DEFAULT -1,
  `workspace` int(11) NOT NULL DEFAULT 0,
  `NEWid` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `request_id` varchar(13) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `time_micro` double NOT NULL DEFAULT 0,
  `component` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `level` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'info',
  `message` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `event` (`userid`,`event_pid`),
  KEY `recuidIdx` (`recuid`),
  KEY `user_auth` (`type`,`action`,`tstamp`),
  KEY `request` (`request_id`),
  KEY `combined_1` (`tstamp`,`type`,`userid`),
  KEY `errorcount` (`tstamp`,`error`),
  KEY `parent` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_log`
--

LOCK TABLES `sys_log` WRITE;
/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;
INSERT INTO `sys_log` VALUES (1,0,1670958872,1,1,0,'',0,0,'User %s logged in from ###IP###',255,'user',1,'172.20.0.6','a:1:{i:0;s:8:\"monobloc\";}',-1,-99,'','',0,'','info',NULL,NULL),(2,0,1670959021,1,1,1,'pages',0,0,'Record \'%s\' (%s) was inserted on page \'%s\' (%s)',1,'content',10,'172.20.0.6','a:4:{i:0;s:4:\"Home\";i:1;s:7:\"pages:1\";i:2;s:12:\"[root-level]\";i:3;i:0;}',0,0,'NEW_1','',0,'','info',NULL,NULL),(3,0,1670959027,1,1,1,'sys_template',0,0,'Record \'%s\' (%s) was inserted on page \'%s\' (%s)',1,'content',10,'172.20.0.6','a:4:{i:0;s:8:\"NEW SITE\";i:1;s:14:\"sys_template:1\";i:2;s:4:\"Home\";i:3;i:1;}',1,0,'NEW','',0,'','info',NULL,NULL),(4,0,1670959108,1,2,1,'sys_template',0,0,'Record \'%s\' (%s) was updated. (Online).',1,'content',10,'172.20.0.6','a:3:{i:0;s:8:\"NEW SITE\";i:1;s:14:\"sys_template:1\";s:7:\"history\";s:1:\"3\";}',1,0,'','',0,'','info',NULL,NULL),(5,0,1670959143,1,2,1,'pages',0,0,'Record \'%s\' (%s) was updated. (Online).',1,'content',10,'172.20.0.6','a:3:{i:0;s:4:\"Home\";i:1;s:7:\"pages:1\";s:7:\"history\";s:1:\"4\";}',1,0,'','',0,'','info',NULL,NULL),(6,0,1670959157,1,1,2,'pages',0,0,'Record \'%s\' (%s) was inserted on page \'%s\' (%s)',1,'content',10,'172.20.0.6','a:4:{i:0;s:3:\"404\";i:1;s:7:\"pages:2\";i:2;s:4:\"Home\";i:3;i:1;}',1,0,'NEW_1','',0,'','info',NULL,NULL),(7,0,1670959166,1,1,3,'pages',0,0,'Record \'%s\' (%s) was inserted on page \'%s\' (%s)',1,'content',10,'172.20.0.6','a:4:{i:0;s:4:\"Meta\";i:1;s:7:\"pages:3\";i:2;s:4:\"Home\";i:3;i:1;}',1,0,'NEW_1','',0,'','info',NULL,NULL),(8,0,1670959171,1,1,4,'pages',0,0,'Record \'%s\' (%s) was inserted on page \'%s\' (%s)',1,'content',10,'172.20.0.6','a:4:{i:0;s:4:\"Data\";i:1;s:7:\"pages:4\";i:2;s:4:\"Home\";i:3;i:1;}',1,0,'NEW_1','',0,'','info',NULL,NULL),(9,0,1670959177,1,1,5,'pages',0,0,'Record \'%s\' (%s) was inserted on page \'%s\' (%s)',1,'content',10,'172.20.0.6','a:4:{i:0;s:5:\"Forms\";i:1;s:7:\"pages:5\";i:2;s:4:\"Data\";i:3;i:4;}',4,0,'NEW_1','',0,'','info',NULL,NULL),(10,0,1670959189,1,1,6,'pages',0,0,'Record \'%s\' (%s) was inserted on page \'%s\' (%s)',1,'content',10,'172.20.0.6','a:4:{i:0;s:16:\"Content Elements\";i:1;s:7:\"pages:6\";i:2;s:4:\"Data\";i:3;i:4;}',4,0,'NEW_1','',0,'','info',NULL,NULL),(11,0,1670959207,1,1,7,'pages',0,0,'Record \'%s\' (%s) was inserted on page \'%s\' (%s)',1,'content',10,'172.20.0.6','a:4:{i:0;s:7:\"Contact\";i:1;s:7:\"pages:7\";i:2;s:4:\"Meta\";i:3;i:3;}',3,0,'NEW_1','',0,'','info',NULL,NULL),(12,0,1670959212,1,1,8,'pages',0,0,'Record \'%s\' (%s) was inserted on page \'%s\' (%s)',1,'content',10,'172.20.0.6','a:4:{i:0;s:7:\"Imprint\";i:1;s:7:\"pages:8\";i:2;s:4:\"Meta\";i:3;i:3;}',3,0,'NEW_1','',0,'','info',NULL,NULL),(13,0,1670959224,1,1,9,'pages',0,0,'Record \'%s\' (%s) was inserted on page \'%s\' (%s)',1,'content',10,'172.20.0.6','a:4:{i:0;s:7:\"Privacy\";i:1;s:7:\"pages:9\";i:2;s:4:\"Meta\";i:3;i:3;}',3,0,'NEW_1','',0,'','info',NULL,NULL),(14,0,1670959236,1,2,9,'pages',0,0,'Record \'%s\' (%s) was updated. (Online).',1,'content',10,'172.20.0.6','a:3:{i:0;s:14:\"Privacy Policy\";i:1;s:7:\"pages:9\";s:7:\"history\";s:2:\"13\";}',9,0,'','',0,'','info',NULL,NULL),(15,0,1670959244,1,1,10,'pages',0,0,'Record \'%s\' (%s) was inserted on page \'%s\' (%s)',1,'content',10,'172.20.0.6','a:4:{i:0;s:15:\"Cookie Settings\";i:1;s:8:\"pages:10\";i:2;s:4:\"Meta\";i:3;i:3;}',3,0,'NEW_1','',0,'','info',NULL,NULL),(16,0,1670959253,1,1,11,'pages',0,0,'Record \'%s\' (%s) was inserted on page \'%s\' (%s)',1,'content',10,'172.20.0.6','a:4:{i:0;s:10:\"Thanks you\";i:1;s:8:\"pages:11\";i:2;s:7:\"Contact\";i:3;i:7;}',7,0,'NEW_1','',0,'','info',NULL,NULL),(17,0,1670959261,1,2,11,'pages',0,0,'Record \'%s\' (%s) was updated. (Online).',1,'content',10,'172.20.0.6','a:3:{i:0;s:9:\"Thank you\";i:1;s:8:\"pages:11\";s:7:\"history\";s:2:\"16\";}',11,0,'','',0,'','info',NULL,NULL),(18,0,1670959269,1,2,4,'pages',0,0,'Record \'%s\' (%s) was updated. (Online).',1,'content',10,'172.20.0.6','a:3:{i:0;s:4:\"Data\";i:1;s:7:\"pages:4\";s:7:\"history\";s:2:\"17\";}',4,0,'','',0,'','info',NULL,NULL),(19,0,1670959269,1,2,3,'pages',0,0,'Record \'%s\' (%s) was updated. (Online).',1,'content',10,'172.20.0.6','a:3:{i:0;s:4:\"Meta\";i:1;s:7:\"pages:3\";s:7:\"history\";s:2:\"18\";}',3,0,'','',0,'','info',NULL,NULL),(20,0,1670959270,1,2,2,'pages',0,0,'Record \'%s\' (%s) was updated. (Online).',1,'content',10,'172.20.0.6','a:3:{i:0;s:3:\"404\";i:1;s:7:\"pages:2\";s:7:\"history\";s:2:\"19\";}',2,0,'','',0,'','info',NULL,NULL),(21,0,1670959273,1,2,6,'pages',0,0,'Record \'%s\' (%s) was updated. (Online).',1,'content',10,'172.20.0.6','a:3:{i:0;s:16:\"Content Elements\";i:1;s:7:\"pages:6\";s:7:\"history\";s:2:\"20\";}',6,0,'','',0,'','info',NULL,NULL),(22,0,1670959273,1,2,5,'pages',0,0,'Record \'%s\' (%s) was updated. (Online).',1,'content',10,'172.20.0.6','a:3:{i:0;s:5:\"Forms\";i:1;s:7:\"pages:5\";s:7:\"history\";s:2:\"21\";}',5,0,'','',0,'','info',NULL,NULL),(23,0,1670959276,1,2,10,'pages',0,0,'Record \'%s\' (%s) was updated. (Online).',1,'content',10,'172.20.0.6','a:3:{i:0;s:15:\"Cookie Settings\";i:1;s:8:\"pages:10\";s:7:\"history\";s:2:\"22\";}',10,0,'','',0,'','info',NULL,NULL),(24,0,1670959276,1,2,9,'pages',0,0,'Record \'%s\' (%s) was updated. (Online).',1,'content',10,'172.20.0.6','a:3:{i:0;s:14:\"Privacy Policy\";i:1;s:7:\"pages:9\";s:7:\"history\";s:2:\"23\";}',9,0,'','',0,'','info',NULL,NULL),(25,0,1670959277,1,2,8,'pages',0,0,'Record \'%s\' (%s) was updated. (Online).',1,'content',10,'172.20.0.6','a:3:{i:0;s:7:\"Imprint\";i:1;s:7:\"pages:8\";s:7:\"history\";s:2:\"24\";}',8,0,'','',0,'','info',NULL,NULL),(26,0,1670959277,1,2,7,'pages',0,0,'Record \'%s\' (%s) was updated. (Online).',1,'content',10,'172.20.0.6','a:3:{i:0;s:7:\"Contact\";i:1;s:7:\"pages:7\";s:7:\"history\";s:2:\"25\";}',7,0,'','',0,'','info',NULL,NULL),(27,0,1670959284,1,2,11,'pages',0,0,'Record \'%s\' (%s) was updated. (Online).',1,'content',10,'172.20.0.6','a:3:{i:0;s:9:\"Thank you\";i:1;s:8:\"pages:11\";s:7:\"history\";s:2:\"26\";}',11,0,'','',0,'','info',NULL,NULL),(28,0,1670959291,1,2,1,'pages',0,0,'Record \'%s\' (%s) was updated. (Online).',1,'content',10,'172.20.0.6','a:3:{i:0;s:4:\"Home\";i:1;s:7:\"pages:1\";s:7:\"history\";s:2:\"27\";}',1,0,'','',0,'','info',NULL,NULL),(29,0,1670959438,1,1,12,'pages',0,0,'Record \'%s\' (%s) was inserted on page \'%s\' (%s)',1,'content',10,'172.20.0.6','a:4:{i:0;s:7:\"Cookies\";i:1;s:8:\"pages:12\";i:2;s:4:\"Data\";i:3;i:4;}',4,0,'NEW_1','',0,'','info',NULL,NULL),(30,0,1670959466,1,2,12,'pages',0,0,'Record \'%s\' (%s) was updated. (Online).',1,'content',10,'172.20.0.6','a:3:{i:0;s:7:\"Cookies\";i:1;s:8:\"pages:12\";s:7:\"history\";s:2:\"29\";}',12,0,'','',0,'','info',NULL,NULL),(31,0,1671036371,1,1,0,'',0,0,'User %s logged in from ###IP###',255,'user',1,'172.20.0.6','a:1:{i:0;s:8:\"monobloc\";}',-1,-99,'','',0,'','info',NULL,NULL),(32,0,1671036399,1,1,0,'',0,0,'User %s has cleared the cache (cacheCmd=%s)',3,'default',0,'172.20.0.6','a:2:{i:0;s:8:\"monobloc\";i:1;s:3:\"all\";}',-1,0,'','',0,'','info',NULL,NULL),(33,0,1671036402,1,1,0,'',0,0,'User %s has cleared the cache (cacheCmd=%s)',3,'default',0,'172.20.0.6','a:2:{i:0;s:8:\"monobloc\";i:1;s:3:\"all\";}',-1,0,'','',0,'','info',NULL,NULL);
/*!40000 ALTER TABLE `sys_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_news`
--

DROP TABLE IF EXISTS `sys_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_news` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `endtime` int(10) unsigned NOT NULL DEFAULT 0,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `content` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_news`
--

LOCK TABLES `sys_news` WRITE;
/*!40000 ALTER TABLE `sys_news` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_note`
--

DROP TABLE IF EXISTS `sys_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_note` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `message` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `personal` smallint(5) unsigned NOT NULL DEFAULT 0,
  `category` smallint(5) unsigned NOT NULL DEFAULT 0,
  `position` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_note`
--

LOCK TABLES `sys_note` WRITE;
/*!40000 ALTER TABLE `sys_note` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_redirect`
--

DROP TABLE IF EXISTS `sys_redirect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_redirect` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `updatedon` int(10) unsigned NOT NULL DEFAULT 0,
  `createdon` int(10) unsigned NOT NULL DEFAULT 0,
  `createdby` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `disabled` smallint(5) unsigned NOT NULL DEFAULT 0,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `endtime` int(10) unsigned NOT NULL DEFAULT 0,
  `source_host` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `source_path` varchar(2048) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `is_regexp` smallint(5) unsigned NOT NULL DEFAULT 0,
  `protected` smallint(5) unsigned NOT NULL DEFAULT 0,
  `force_https` smallint(5) unsigned NOT NULL DEFAULT 0,
  `respect_query_parameters` smallint(5) unsigned NOT NULL DEFAULT 0,
  `keep_query_parameters` smallint(5) unsigned NOT NULL DEFAULT 0,
  `target` varchar(2048) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `target_statuscode` int(11) NOT NULL DEFAULT 307,
  `hitcount` int(11) NOT NULL DEFAULT 0,
  `lasthiton` int(11) NOT NULL DEFAULT 0,
  `disable_hitcount` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `index_source` (`source_host`(80),`source_path`(80)),
  KEY `parent` (`pid`,`deleted`,`disabled`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_redirect`
--

LOCK TABLES `sys_redirect` WRITE;
/*!40000 ALTER TABLE `sys_redirect` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_redirect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_refindex`
--

DROP TABLE IF EXISTS `sys_refindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_refindex` (
  `hash` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tablename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `recuid` int(11) NOT NULL DEFAULT 0,
  `field` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `flexpointer` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `softref_key` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `softref_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sorting` int(11) NOT NULL DEFAULT 0,
  `workspace` int(11) NOT NULL DEFAULT 0,
  `ref_table` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ref_uid` int(11) NOT NULL DEFAULT 0,
  `ref_string` varchar(1024) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`hash`),
  KEY `lookup_rec` (`tablename`(100),`recuid`),
  KEY `lookup_uid` (`ref_table`(100),`ref_uid`),
  KEY `lookup_string` (`ref_string`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_refindex`
--

LOCK TABLES `sys_refindex` WRITE;
/*!40000 ALTER TABLE `sys_refindex` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_refindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_registry`
--

DROP TABLE IF EXISTS `sys_registry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_registry` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_namespace` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `entry_key` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `entry_value` mediumblob DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `entry_identifier` (`entry_namespace`,`entry_key`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_registry`
--

LOCK TABLES `sys_registry` WRITE;
/*!40000 ALTER TABLE `sys_registry` DISABLE KEYS */;
INSERT INTO `sys_registry` VALUES (1,'installUpdate','TYPO3\\CMS\\Install\\Updates\\FeeditExtractionUpdate','i:1;'),(2,'installUpdate','TYPO3\\CMS\\Install\\Updates\\TaskcenterExtractionUpdate','i:1;'),(3,'installUpdate','TYPO3\\CMS\\Install\\Updates\\SysActionExtractionUpdate','i:1;'),(4,'installUpdate','TYPO3\\CMS\\Install\\Updates\\SvgFilesSanitization','i:1;'),(5,'installUpdate','TYPO3\\CMS\\Install\\Updates\\ShortcutRecordsMigration','i:1;'),(6,'installUpdate','TYPO3\\CMS\\Install\\Updates\\CollectionsExtractionUpdate','i:1;'),(7,'installUpdate','TYPO3\\CMS\\Install\\Updates\\BackendUserLanguageMigration','i:1;'),(8,'installUpdate','TYPO3\\CMS\\Install\\Updates\\SysLogChannel','i:1;'),(9,'installUpdateRows','rowUpdatersDone','a:4:{i:0;s:69:\"TYPO3\\CMS\\Install\\Updates\\RowUpdater\\WorkspaceVersionRecordsMigration\";i:1;s:66:\"TYPO3\\CMS\\Install\\Updates\\RowUpdater\\L18nDiffsourceToJsonMigration\";i:2;s:77:\"TYPO3\\CMS\\Install\\Updates\\RowUpdater\\WorkspaceMovePlaceholderRemovalMigration\";i:3;s:76:\"TYPO3\\CMS\\Install\\Updates\\RowUpdater\\WorkspaceNewPlaceholderRemovalMigration\";}'),(10,'extensionDataImport','typo3/sysext/core/ext_tables_static+adt.sql','s:0:\"\";'),(11,'extensionDataImport','typo3/sysext/scheduler/ext_tables_static+adt.sql','s:0:\"\";'),(12,'extensionDataImport','typo3/sysext/extbase/ext_tables_static+adt.sql','s:0:\"\";'),(13,'extensionDataImport','typo3/sysext/fluid/ext_tables_static+adt.sql','s:0:\"\";'),(14,'extensionDataImport','typo3/sysext/install/ext_tables_static+adt.sql','s:0:\"\";'),(15,'extensionDataImport','typo3/sysext/recordlist/ext_tables_static+adt.sql','s:0:\"\";'),(16,'extensionDataImport','typo3/sysext/backend/ext_tables_static+adt.sql','s:0:\"\";'),(17,'extensionDataImport','typo3/sysext/frontend/ext_tables_static+adt.sql','s:0:\"\";'),(18,'extensionDataImport','typo3/sysext/dashboard/ext_tables_static+adt.sql','s:0:\"\";'),(19,'extensionDataImport','typo3/sysext/fluid_styled_content/ext_tables_static+adt.sql','s:0:\"\";'),(20,'extensionDataImport','typo3/sysext/redirects/ext_tables_static+adt.sql','s:0:\"\";'),(21,'extensionDataImport','typo3/sysext/filelist/ext_tables_static+adt.sql','s:0:\"\";'),(22,'extensionDataImport','typo3/sysext/impexp/ext_tables_static+adt.sql','s:0:\"\";'),(23,'extensionDataImport','typo3/sysext/form/ext_tables_static+adt.sql','s:0:\"\";'),(24,'extensionDataImport','typo3/sysext/seo/ext_tables_static+adt.sql','s:0:\"\";'),(25,'extensionDataImport','typo3/sysext/indexed_search/ext_tables_static+adt.sql','s:0:\"\";'),(26,'extensionDataImport','typo3/sysext/setup/ext_tables_static+adt.sql','s:0:\"\";'),(27,'extensionDataImport','typo3/sysext/rte_ckeditor/ext_tables_static+adt.sql','s:0:\"\";'),(28,'extensionDataImport','typo3/sysext/belog/ext_tables_static+adt.sql','s:0:\"\";'),(29,'extensionDataImport','typo3/sysext/beuser/ext_tables_static+adt.sql','s:0:\"\";'),(30,'extensionDataImport','typo3/sysext/extensionmanager/ext_tables_static+adt.sql','s:0:\"\";'),(31,'extensionDataImport','typo3/sysext/info/ext_tables_static+adt.sql','s:0:\"\";'),(32,'extensionDataImport','typo3/sysext/lowlevel/ext_tables_static+adt.sql','s:0:\"\";'),(33,'extensionDataImport','typo3/sysext/sys_note/ext_tables_static+adt.sql','s:0:\"\";'),(34,'extensionDataImport','typo3/sysext/t3editor/ext_tables_static+adt.sql','s:0:\"\";'),(35,'extensionDataImport','typo3/sysext/tstemplate/ext_tables_static+adt.sql','s:0:\"\";'),(36,'extensionDataImport','typo3/sysext/viewpage/ext_tables_static+adt.sql','s:0:\"\";'),(37,'extensionDataImport','typo3conf/ext/container/ext_tables_static+adt.sql','s:0:\"\";'),(38,'extensionDataImport','typo3conf/ext/content_defender/ext_tables_static+adt.sql','s:0:\"\";'),(39,'extensionDataImport','helhum/typo3-console/ext_tables_static+adt.sql','s:0:\"\";'),(40,'extensionDataImport','typo3conf/ext/language_detection/ext_tables_static+adt.sql','s:0:\"\";'),(41,'extensionDataImport','typo3conf/ext/min/ext_tables_static+adt.sql','s:0:\"\";'),(42,'extensionDataImport','typo3conf/ext/mono_site/ext_tables_static+adt.sql','s:0:\"\";'),(43,'extensionDataImport','typo3conf/ext/om_cookie_manager/ext_tables_static+adt.sql','s:0:\"\";'),(44,'extensionDataImport','typo3conf/ext/picture/ext_tables_static+adt.sql','s:0:\"\";'),(45,'extensionDataImport','typo3conf/ext/staticfilecache/ext_tables_static+adt.sql','s:0:\"\";'),(46,'extensionDataImport','typo3conf/ext/zabbix_client/ext_tables_static+adt.sql','s:0:\"\";'),(47,'core','formProtectionSessionToken:1','s:64:\"fdaa06b056833d5cae8cc962ecbc4adfd1828f2d51faf02715cca176cea2c69a\";');
/*!40000 ALTER TABLE `sys_registry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_template`
--

DROP TABLE IF EXISTS `sys_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_template` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `endtime` int(10) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `root` smallint(5) unsigned NOT NULL DEFAULT 0,
  `clear` smallint(5) unsigned NOT NULL DEFAULT 0,
  `include_static_file` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `constants` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `config` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `basedOn` tinytext COLLATE utf8_unicode_ci DEFAULT NULL,
  `includeStaticAfterBasedOn` smallint(5) unsigned NOT NULL DEFAULT 0,
  `static_file_mode` smallint(5) unsigned NOT NULL DEFAULT 0,
  `tx_impexp_origuid` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `roottemplate` (`deleted`,`hidden`,`root`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_template`
--

LOCK TABLES `sys_template` WRITE;
/*!40000 ALTER TABLE `sys_template` DISABLE KEYS */;
INSERT INTO `sys_template` VALUES (1,1,1670959108,1670959027,1,0,0,0,0,256,NULL,0,0,0,0,0,'NEW SITE',1,3,NULL,'@import \'EXT:mono_site/Configuration/TypoScript/constants.typoscript\'\r\n','@import \'EXT:mono_site/Configuration/TypoScript/setup.typoscript\'\r\n','',0,0,0);
/*!40000 ALTER TABLE `sys_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tt_content`
--

DROP TABLE IF EXISTS `tt_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tt_content` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rowDescription` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `endtime` int(10) unsigned NOT NULL DEFAULT 0,
  `fe_group` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `sorting` int(11) NOT NULL DEFAULT 0,
  `editlock` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l18n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l18n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `CType` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `header` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `header_position` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `bodytext` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `bullets_type` smallint(5) unsigned NOT NULL DEFAULT 0,
  `uploads_description` smallint(5) unsigned NOT NULL DEFAULT 0,
  `uploads_type` smallint(5) unsigned NOT NULL DEFAULT 0,
  `assets` int(10) unsigned NOT NULL DEFAULT 0,
  `image` int(10) unsigned NOT NULL DEFAULT 0,
  `imagewidth` int(10) unsigned NOT NULL DEFAULT 0,
  `imageorient` smallint(5) unsigned NOT NULL DEFAULT 0,
  `imagecols` smallint(5) unsigned NOT NULL DEFAULT 0,
  `imageborder` smallint(5) unsigned NOT NULL DEFAULT 0,
  `media` int(10) unsigned NOT NULL DEFAULT 0,
  `layout` int(10) unsigned NOT NULL DEFAULT 0,
  `frame_class` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `cols` int(10) unsigned NOT NULL DEFAULT 0,
  `space_before_class` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `space_after_class` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `records` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `pages` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `colPos` int(10) unsigned NOT NULL DEFAULT 0,
  `subheader` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `header_link` varchar(1024) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `image_zoom` smallint(5) unsigned NOT NULL DEFAULT 0,
  `header_layout` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `list_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sectionIndex` smallint(5) unsigned NOT NULL DEFAULT 0,
  `linkToTop` smallint(5) unsigned NOT NULL DEFAULT 0,
  `file_collections` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `filelink_size` smallint(5) unsigned NOT NULL DEFAULT 0,
  `filelink_sorting` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `filelink_sorting_direction` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `target` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `date` int(10) unsigned NOT NULL DEFAULT 0,
  `recursive` smallint(5) unsigned NOT NULL DEFAULT 0,
  `imageheight` int(10) unsigned NOT NULL DEFAULT 0,
  `pi_flexform` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `accessibility_title` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `accessibility_bypass` smallint(5) unsigned NOT NULL DEFAULT 0,
  `accessibility_bypass_text` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `category_field` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `table_class` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `table_caption` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `table_delimiter` smallint(5) unsigned NOT NULL DEFAULT 0,
  `table_enclosure` smallint(5) unsigned NOT NULL DEFAULT 0,
  `table_header_position` smallint(5) unsigned NOT NULL DEFAULT 0,
  `table_tfoot` smallint(5) unsigned NOT NULL DEFAULT 0,
  `categories` int(10) unsigned NOT NULL DEFAULT 0,
  `selected_categories` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `tx_impexp_origuid` int(11) NOT NULL DEFAULT 0,
  `tx_container_parent` int(11) NOT NULL DEFAULT 0,
  `tx_monosite_headersize` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tx_monosite_checkbox` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`sorting`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `language` (`l18n_parent`,`sys_language_uid`),
  KEY `translation_source` (`l10n_source`),
  KEY `container_parent` (`tx_container_parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tt_content`
--

LOCK TABLES `tt_content` WRITE;
/*!40000 ALTER TABLE `tt_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `tt_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_extensionmanager_domain_model_extension`
--

DROP TABLE IF EXISTS `tx_extensionmanager_domain_model_extension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_extensionmanager_domain_model_extension` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `extension_key` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `repository` int(11) NOT NULL DEFAULT 1,
  `remote` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ter',
  `version` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `alldownloadcounter` int(10) unsigned NOT NULL DEFAULT 0,
  `downloadcounter` int(10) unsigned NOT NULL DEFAULT 0,
  `title` varchar(150) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` int(11) NOT NULL DEFAULT 0,
  `review_state` int(11) NOT NULL DEFAULT 0,
  `category` int(11) NOT NULL DEFAULT 0,
  `last_updated` int(10) unsigned NOT NULL DEFAULT 0,
  `serialized_dependencies` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `author_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `author_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ownerusername` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `md5hash` varchar(35) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `update_comment` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `authorcompany` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `integer_version` int(11) NOT NULL DEFAULT 0,
  `current_version` int(11) NOT NULL DEFAULT 0,
  `lastreviewedversion` int(11) NOT NULL DEFAULT 0,
  `documentation_link` varchar(2048) COLLATE utf8_unicode_ci DEFAULT NULL,
  `distribution_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `distribution_welcome_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `versionextrepo` (`extension_key`,`version`,`remote`),
  KEY `index_extrepo` (`extension_key`,`remote`),
  KEY `index_versionrepo` (`integer_version`,`remote`,`extension_key`),
  KEY `index_currentversions` (`current_version`,`review_state`),
  KEY `parent` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_extensionmanager_domain_model_extension`
--

LOCK TABLES `tx_extensionmanager_domain_model_extension` WRITE;
/*!40000 ALTER TABLE `tx_extensionmanager_domain_model_extension` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_extensionmanager_domain_model_extension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_impexp_presets`
--

DROP TABLE IF EXISTS `tx_impexp_presets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_impexp_presets` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `user_uid` int(10) unsigned NOT NULL DEFAULT 0,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `public` smallint(6) NOT NULL DEFAULT 0,
  `item_uid` int(11) NOT NULL DEFAULT 0,
  `preset_data` blob DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `lookup` (`item_uid`),
  KEY `parent` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_impexp_presets`
--

LOCK TABLES `tx_impexp_presets` WRITE;
/*!40000 ALTER TABLE `tx_impexp_presets` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_impexp_presets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_omcookiemanager_domain_model_cookie`
--

DROP TABLE IF EXISTS `tx_omcookiemanager_domain_model_cookie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_omcookiemanager_domain_model_cookie` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `endtime` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_oid` int(11) NOT NULL DEFAULT 0,
  `t3ver_wsid` int(11) NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(11) NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `cookiegroup` int(10) unsigned NOT NULL DEFAULT 0,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `lifetime` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `provider` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cookie_group` int(10) unsigned DEFAULT 0,
  `cookie_html` int(10) unsigned DEFAULT 0,
  `t3ver_id` int(11) NOT NULL DEFAULT 0,
  `t3ver_label` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `t3ver_count` int(11) NOT NULL DEFAULT 0,
  `t3ver_tstamp` int(11) NOT NULL DEFAULT 0,
  `t3ver_move_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `language` (`l10n_parent`,`sys_language_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_omcookiemanager_domain_model_cookie`
--

LOCK TABLES `tx_omcookiemanager_domain_model_cookie` WRITE;
/*!40000 ALTER TABLE `tx_omcookiemanager_domain_model_cookie` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_omcookiemanager_domain_model_cookie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_omcookiemanager_domain_model_cookiegroup`
--

DROP TABLE IF EXISTS `tx_omcookiemanager_domain_model_cookiegroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_omcookiemanager_domain_model_cookiegroup` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `endtime` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_oid` int(11) NOT NULL DEFAULT 0,
  `t3ver_wsid` int(11) NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(11) NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gtm_event_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `essential` smallint(5) unsigned NOT NULL DEFAULT 0,
  `cookies` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_id` int(11) NOT NULL DEFAULT 0,
  `t3ver_label` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `t3ver_count` int(11) NOT NULL DEFAULT 0,
  `t3ver_tstamp` int(11) NOT NULL DEFAULT 0,
  `t3ver_move_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `language` (`l10n_parent`,`sys_language_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_omcookiemanager_domain_model_cookiegroup`
--

LOCK TABLES `tx_omcookiemanager_domain_model_cookiegroup` WRITE;
/*!40000 ALTER TABLE `tx_omcookiemanager_domain_model_cookiegroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_omcookiemanager_domain_model_cookiegroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_omcookiemanager_domain_model_cookiehtml`
--

DROP TABLE IF EXISTS `tx_omcookiemanager_domain_model_cookiehtml`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_omcookiemanager_domain_model_cookiehtml` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `endtime` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_oid` int(11) NOT NULL DEFAULT 0,
  `t3ver_wsid` int(11) NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(11) NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `cookie` int(10) unsigned NOT NULL DEFAULT 0,
  `html` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `insert_place` int(11) NOT NULL DEFAULT 0,
  `t3ver_id` int(11) NOT NULL DEFAULT 0,
  `t3ver_label` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `t3ver_count` int(11) NOT NULL DEFAULT 0,
  `t3ver_tstamp` int(11) NOT NULL DEFAULT 0,
  `t3ver_move_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `language` (`l10n_parent`,`sys_language_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_omcookiemanager_domain_model_cookiehtml`
--

LOCK TABLES `tx_omcookiemanager_domain_model_cookiehtml` WRITE;
/*!40000 ALTER TABLE `tx_omcookiemanager_domain_model_cookiehtml` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_omcookiemanager_domain_model_cookiehtml` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_omcookiemanager_domain_model_cookiepanel`
--

DROP TABLE IF EXISTS `tx_omcookiemanager_domain_model_cookiepanel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_omcookiemanager_domain_model_cookiepanel` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `endtime` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_oid` int(11) NOT NULL DEFAULT 0,
  `t3ver_wsid` int(11) NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(11) NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `groups` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `t3ver_id` int(11) NOT NULL DEFAULT 0,
  `t3ver_label` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `t3ver_count` int(11) NOT NULL DEFAULT 0,
  `t3ver_tstamp` int(11) NOT NULL DEFAULT 0,
  `t3ver_move_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `language` (`l10n_parent`,`sys_language_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_omcookiemanager_domain_model_cookiepanel`
--

LOCK TABLES `tx_omcookiemanager_domain_model_cookiepanel` WRITE;
/*!40000 ALTER TABLE `tx_omcookiemanager_domain_model_cookiepanel` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_omcookiemanager_domain_model_cookiepanel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_scheduler_task`
--

DROP TABLE IF EXISTS `tx_scheduler_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_scheduler_task` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `disable` smallint(5) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `nextexecution` int(10) unsigned NOT NULL DEFAULT 0,
  `lastexecution_time` int(10) unsigned NOT NULL DEFAULT 0,
  `lastexecution_failure` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastexecution_context` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `serialized_task_object` mediumblob DEFAULT NULL,
  `serialized_executions` mediumblob DEFAULT NULL,
  `task_group` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `index_nextexecution` (`nextexecution`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_scheduler_task`
--

LOCK TABLES `tx_scheduler_task` WRITE;
/*!40000 ALTER TABLE `tx_scheduler_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_scheduler_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_scheduler_task_group`
--

DROP TABLE IF EXISTS `tx_scheduler_task_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_scheduler_task_group` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `groupName` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_scheduler_task_group`
--

LOCK TABLES `tx_scheduler_task_group` WRITE;
/*!40000 ALTER TABLE `tx_scheduler_task_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_scheduler_task_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_staticfilecache_queue`
--

DROP TABLE IF EXISTS `tx_staticfilecache_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_staticfilecache_queue` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `cache_url` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `cache_priority` int(11) NOT NULL DEFAULT 0,
  `page_uid` int(11) NOT NULL DEFAULT 0,
  `invalid_date` int(11) NOT NULL DEFAULT 0,
  `call_date` int(11) NOT NULL DEFAULT 0,
  `call_result` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`uid`),
  KEY `call_date` (`call_date`,`cache_url`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_staticfilecache_queue`
--

LOCK TABLES `tx_staticfilecache_queue` WRITE;
/*!40000 ALTER TABLE `tx_staticfilecache_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_staticfilecache_queue` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-14 18:46:40
