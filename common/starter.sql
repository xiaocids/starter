/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : starter_local

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2015-10-02 08:27:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `view` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `thumbnail_base_url` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumbnail_path` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `updater_id` int(11) DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `published_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_article_author` (`author_id`),
  KEY `fk_article_updater` (`updater_id`),
  KEY `fk_article_category` (`category_id`),
  CONSTRAINT `fk_article_author` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_article_category` FOREIGN KEY (`category_id`) REFERENCES `article_category` (`id`),
  CONSTRAINT `fk_article_updater` FOREIGN KEY (`updater_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of article
-- ----------------------------

-- ----------------------------
-- Table structure for article_attachment
-- ----------------------------
DROP TABLE IF EXISTS `article_attachment`;
CREATE TABLE `article_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `base_url` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_article_attachment_article` (`article_id`),
  CONSTRAINT `fk_article_attachment_article` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for article_category
-- ----------------------------
DROP TABLE IF EXISTS `article_category`;
CREATE TABLE `article_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `parent_id` int(11) DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_article_category_section` (`parent_id`),
  CONSTRAINT `fk_article_category_section` FOREIGN KEY (`parent_id`) REFERENCES `article_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of article_category
-- ----------------------------
INSERT INTO `article_category` VALUES ('1', 'news', 'News', null, null, '1', '1443688346', null);

-- ----------------------------
-- Table structure for file_storage_item
-- ----------------------------
DROP TABLE IF EXISTS `file_storage_item`;
CREATE TABLE `file_storage_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `component` varchar(255) NOT NULL,
  `base_url` varchar(1024) NOT NULL,
  `path` varchar(1024) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `upload_ip` varchar(15) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of file_storage_item
-- ----------------------------

-- ----------------------------
-- Table structure for i18n_message
-- ----------------------------
DROP TABLE IF EXISTS `i18n_message`;
CREATE TABLE `i18n_message` (
  `id` int(11) NOT NULL DEFAULT '0',
  `language` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `translation` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`,`language`),
  CONSTRAINT `fk_i18n_message_source_message` FOREIGN KEY (`id`) REFERENCES `i18n_source_message` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of i18n_message
-- ----------------------------

-- ----------------------------
-- Table structure for i18n_source_message
-- ----------------------------
DROP TABLE IF EXISTS `i18n_source_message`;
CREATE TABLE `i18n_source_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of i18n_source_message
-- ----------------------------

-- ----------------------------
-- Table structure for key_storage_item
-- ----------------------------
DROP TABLE IF EXISTS `key_storage_item`;
CREATE TABLE `key_storage_item` (
  `key` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `idx_key_storage_item_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of key_storage_item
-- ----------------------------
INSERT INTO `key_storage_item` VALUES ('backend.layout-boxed', '0', null, null, null);
INSERT INTO `key_storage_item` VALUES ('backend.layout-collapsed-sidebar', '0', null, null, null);
INSERT INTO `key_storage_item` VALUES ('backend.layout-fixed', '0', null, null, null);
INSERT INTO `key_storage_item` VALUES ('backend.theme-skin', 'skin-blue', 'skin-blue, skin-black, skin-purple, skin-green, skin-red, skin-yellow', null, null);
INSERT INTO `key_storage_item` VALUES ('frontend.maintenance', 'disabled', 'Set it to \"true\" to turn on maintenance mode', null, null);

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `route` varchar(256) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `data` text,
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`),
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `menu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', 'Menu Module Administrator', null, null, '1', 'return [ \'class\'=>\'header\', \'options\'=>[]];');
INSERT INTO `menu` VALUES ('2', 'Users', '1', '/user/index', '1', 'return [\'icon\'=>\'<i class=\"fa fa-users\"></i>\', \'badge\'=> common\\models\\User::find()->count(),\'badgeBgClass\'=>\'label-success\', \'options\'=>[]];');
INSERT INTO `menu` VALUES ('3', 'Modules', '1', '/admin/module/index', '2', 'return [\'icon\'=>\'<i class=\"fa fa-windows\"></i>\',];');
INSERT INTO `menu` VALUES ('4', 'Menu', '1', '/admin/menu/index', '3', 'return [\'icon\'=>\'<i class=\"fa fa-th-list\"></i>\'];');
INSERT INTO `menu` VALUES ('5', 'Create User', '2', '/user/create', '1', null);
INSERT INTO `menu` VALUES ('6', 'List Users', '2', '/user/index', '2', null);
INSERT INTO `menu` VALUES ('7', 'Create Menu', '4', '/admin/menu/create', '1', null);
INSERT INTO `menu` VALUES ('8', 'List Menu', '4', '/admin/menu/index', '2', null);
INSERT INTO `menu` VALUES ('9', 'System Information', '1', '/admin/system-information/index', '4', 'return [\'icon\'=>\'<i class=\"fa fa-dashboard\"></i>\',];');
INSERT INTO `menu` VALUES ('10', 'User Access', '1', '/admin/assignment/index', '2', 'return [\'icon\'=>\'<i class=\"fa fa-user-secret\"></i>\',];');
INSERT INTO `menu` VALUES ('11', 'Roles', '10', '/admin/role/index', '1', null);
INSERT INTO `menu` VALUES ('12', 'Permissions', '10', '/admin/permission/index', '2', null);
INSERT INTO `menu` VALUES ('13', 'Rules', '10', '/admin/rule/index', '3', null);

-- ----------------------------
-- Table structure for module
-- ----------------------------
DROP TABLE IF EXISTS `module`;
CREATE TABLE `module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `other_name` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of module
-- ----------------------------
INSERT INTO `module` VALUES ('1', '0', '0', 'gii', 'Gii', 'Module Generator', '/gii/default/index', '');
INSERT INTO `module` VALUES ('2', '0', '1', 'debug', 'Debug', 'Module Debuging', '/debug/default/index', '');
INSERT INTO `module` VALUES ('3', '0', '0', 'admin', 'Administrator', 'Modul System Administrator', '/admin/', 'fa-cogs');

-- ----------------------------
-- Table structure for page
-- ----------------------------
DROP TABLE IF EXISTS `page`;
CREATE TABLE `page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(2048) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `body` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `view` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of page
-- ----------------------------
INSERT INTO `page` VALUES ('1', 'about', 'About', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', null, '1', '1443688345', '1443688345');

-- ----------------------------
-- Table structure for rbac_auth_assignment
-- ----------------------------
DROP TABLE IF EXISTS `rbac_auth_assignment`;
CREATE TABLE `rbac_auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  CONSTRAINT `rbac_auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `rbac_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of rbac_auth_assignment
-- ----------------------------
INSERT INTO `rbac_auth_assignment` VALUES ('All Access', '1', '1443693880');
INSERT INTO `rbac_auth_assignment` VALUES ('director', '3', '1443693109');
INSERT INTO `rbac_auth_assignment` VALUES ('presdir', '2', '1443693109');
INSERT INTO `rbac_auth_assignment` VALUES ('superpower', '1', '1443693109');

-- ----------------------------
-- Table structure for rbac_auth_item
-- ----------------------------
DROP TABLE IF EXISTS `rbac_auth_item`;
CREATE TABLE `rbac_auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  CONSTRAINT `rbac_auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `rbac_auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of rbac_auth_item
-- ----------------------------
INSERT INTO `rbac_auth_item` VALUES ('/*', '2', null, null, null, '1443693782', '1443693782');
INSERT INTO `rbac_auth_item` VALUES ('/admin/*', '2', null, null, null, '1443693778', '1443693778');
INSERT INTO `rbac_auth_item` VALUES ('/admin/assignment/*', '2', null, null, null, '1443693776', '1443693776');
INSERT INTO `rbac_auth_item` VALUES ('/admin/assignment/assign', '2', null, null, null, '1443693776', '1443693776');
INSERT INTO `rbac_auth_item` VALUES ('/admin/assignment/index', '2', null, null, null, '1443693776', '1443693776');
INSERT INTO `rbac_auth_item` VALUES ('/admin/assignment/search', '2', null, null, null, '1443693776', '1443693776');
INSERT INTO `rbac_auth_item` VALUES ('/admin/assignment/view', '2', null, null, null, '1443693776', '1443693776');
INSERT INTO `rbac_auth_item` VALUES ('/admin/default/*', '2', null, null, null, '1443693777', '1443693777');
INSERT INTO `rbac_auth_item` VALUES ('/admin/default/index', '2', null, null, null, '1443693777', '1443693777');
INSERT INTO `rbac_auth_item` VALUES ('/admin/menu/*', '2', null, null, null, '1443693777', '1443693777');
INSERT INTO `rbac_auth_item` VALUES ('/admin/menu/create', '2', null, null, null, '1443693777', '1443693777');
INSERT INTO `rbac_auth_item` VALUES ('/admin/menu/delete', '2', null, null, null, '1443693777', '1443693777');
INSERT INTO `rbac_auth_item` VALUES ('/admin/menu/index', '2', null, null, null, '1443693777', '1443693777');
INSERT INTO `rbac_auth_item` VALUES ('/admin/menu/update', '2', null, null, null, '1443693777', '1443693777');
INSERT INTO `rbac_auth_item` VALUES ('/admin/menu/view', '2', null, null, null, '1443693777', '1443693777');
INSERT INTO `rbac_auth_item` VALUES ('/admin/module/*', '2', null, null, null, '1443693777', '1443693777');
INSERT INTO `rbac_auth_item` VALUES ('/admin/module/create', '2', null, null, null, '1443693777', '1443693777');
INSERT INTO `rbac_auth_item` VALUES ('/admin/module/delete', '2', null, null, null, '1443693777', '1443693777');
INSERT INTO `rbac_auth_item` VALUES ('/admin/module/index', '2', null, null, null, '1443693777', '1443693777');
INSERT INTO `rbac_auth_item` VALUES ('/admin/module/update', '2', null, null, null, '1443693777', '1443693777');
INSERT INTO `rbac_auth_item` VALUES ('/admin/module/view', '2', null, null, null, '1443693777', '1443693777');
INSERT INTO `rbac_auth_item` VALUES ('/admin/permission/*', '2', null, null, null, '1443693777', '1443693777');
INSERT INTO `rbac_auth_item` VALUES ('/admin/permission/assign', '2', null, null, null, '1443693777', '1443693777');
INSERT INTO `rbac_auth_item` VALUES ('/admin/permission/create', '2', null, null, null, '1443693777', '1443693777');
INSERT INTO `rbac_auth_item` VALUES ('/admin/permission/delete', '2', null, null, null, '1443693777', '1443693777');
INSERT INTO `rbac_auth_item` VALUES ('/admin/permission/index', '2', null, null, null, '1443693777', '1443693777');
INSERT INTO `rbac_auth_item` VALUES ('/admin/permission/search', '2', null, null, null, '1443693777', '1443693777');
INSERT INTO `rbac_auth_item` VALUES ('/admin/permission/update', '2', null, null, null, '1443693777', '1443693777');
INSERT INTO `rbac_auth_item` VALUES ('/admin/permission/view', '2', null, null, null, '1443693777', '1443693777');
INSERT INTO `rbac_auth_item` VALUES ('/admin/role/*', '2', null, null, null, '1443693778', '1443693778');
INSERT INTO `rbac_auth_item` VALUES ('/admin/role/assign', '2', null, null, null, '1443693778', '1443693778');
INSERT INTO `rbac_auth_item` VALUES ('/admin/role/create', '2', null, null, null, '1443693778', '1443693778');
INSERT INTO `rbac_auth_item` VALUES ('/admin/role/delete', '2', null, null, null, '1443693778', '1443693778');
INSERT INTO `rbac_auth_item` VALUES ('/admin/role/index', '2', null, null, null, '1443693778', '1443693778');
INSERT INTO `rbac_auth_item` VALUES ('/admin/role/search', '2', null, null, null, '1443693778', '1443693778');
INSERT INTO `rbac_auth_item` VALUES ('/admin/role/update', '2', null, null, null, '1443693778', '1443693778');
INSERT INTO `rbac_auth_item` VALUES ('/admin/role/view', '2', null, null, null, '1443693778', '1443693778');
INSERT INTO `rbac_auth_item` VALUES ('/admin/route/*', '2', null, null, null, '1443693778', '1443693778');
INSERT INTO `rbac_auth_item` VALUES ('/admin/route/assign', '2', null, null, null, '1443693778', '1443693778');
INSERT INTO `rbac_auth_item` VALUES ('/admin/route/create', '2', null, null, null, '1443693778', '1443693778');
INSERT INTO `rbac_auth_item` VALUES ('/admin/route/index', '2', null, null, null, '1443693778', '1443693778');
INSERT INTO `rbac_auth_item` VALUES ('/admin/route/search', '2', null, null, null, '1443693778', '1443693778');
INSERT INTO `rbac_auth_item` VALUES ('/admin/rule/*', '2', null, null, null, '1443693778', '1443693778');
INSERT INTO `rbac_auth_item` VALUES ('/admin/rule/create', '2', null, null, null, '1443693778', '1443693778');
INSERT INTO `rbac_auth_item` VALUES ('/admin/rule/delete', '2', null, null, null, '1443693778', '1443693778');
INSERT INTO `rbac_auth_item` VALUES ('/admin/rule/index', '2', null, null, null, '1443693778', '1443693778');
INSERT INTO `rbac_auth_item` VALUES ('/admin/rule/update', '2', null, null, null, '1443693778', '1443693778');
INSERT INTO `rbac_auth_item` VALUES ('/admin/rule/view', '2', null, null, null, '1443693778', '1443693778');
INSERT INTO `rbac_auth_item` VALUES ('/admin/system-information/*', '2', null, null, null, '1443693777', '1443693777');
INSERT INTO `rbac_auth_item` VALUES ('/admin/system-information/index', '2', null, null, null, '1443693777', '1443693777');
INSERT INTO `rbac_auth_item` VALUES ('/admin/user/*', '2', null, null, null, '1443693777', '1443693777');
INSERT INTO `rbac_auth_item` VALUES ('/admin/user/create', '2', null, null, null, '1443693776', '1443693776');
INSERT INTO `rbac_auth_item` VALUES ('/admin/user/delete', '2', null, null, null, '1443693777', '1443693777');
INSERT INTO `rbac_auth_item` VALUES ('/admin/user/index', '2', null, null, null, '1443693776', '1443693776');
INSERT INTO `rbac_auth_item` VALUES ('/admin/user/update', '2', null, null, null, '1443693777', '1443693777');
INSERT INTO `rbac_auth_item` VALUES ('/admin/user/view', '2', null, null, null, '1443693776', '1443693776');
INSERT INTO `rbac_auth_item` VALUES ('/article-category/*', '2', null, null, null, '1443693779', '1443693779');
INSERT INTO `rbac_auth_item` VALUES ('/article-category/create', '2', null, null, null, '1443693778', '1443693778');
INSERT INTO `rbac_auth_item` VALUES ('/article-category/delete', '2', null, null, null, '1443693779', '1443693779');
INSERT INTO `rbac_auth_item` VALUES ('/article-category/index', '2', null, null, null, '1443693778', '1443693778');
INSERT INTO `rbac_auth_item` VALUES ('/article-category/update', '2', null, null, null, '1443693779', '1443693779');
INSERT INTO `rbac_auth_item` VALUES ('/article-category/view', '2', null, null, null, '1443693778', '1443693778');
INSERT INTO `rbac_auth_item` VALUES ('/article/*', '2', null, null, null, '1443693779', '1443693779');
INSERT INTO `rbac_auth_item` VALUES ('/article/create', '2', null, null, null, '1443693779', '1443693779');
INSERT INTO `rbac_auth_item` VALUES ('/article/delete', '2', null, null, null, '1443693779', '1443693779');
INSERT INTO `rbac_auth_item` VALUES ('/article/index', '2', null, null, null, '1443693779', '1443693779');
INSERT INTO `rbac_auth_item` VALUES ('/article/update', '2', null, null, null, '1443693779', '1443693779');
INSERT INTO `rbac_auth_item` VALUES ('/cache/*', '2', null, null, null, '1443693779', '1443693779');
INSERT INTO `rbac_auth_item` VALUES ('/cache/flush-cache', '2', null, null, null, '1443693779', '1443693779');
INSERT INTO `rbac_auth_item` VALUES ('/cache/flush-cache-key', '2', null, null, null, '1443693779', '1443693779');
INSERT INTO `rbac_auth_item` VALUES ('/cache/flush-cache-tag', '2', null, null, null, '1443693779', '1443693779');
INSERT INTO `rbac_auth_item` VALUES ('/cache/index', '2', null, null, null, '1443693779', '1443693779');
INSERT INTO `rbac_auth_item` VALUES ('/debug/*', '2', null, null, null, '1443693776', '1443693776');
INSERT INTO `rbac_auth_item` VALUES ('/debug/default/*', '2', null, null, null, '1443693776', '1443693776');
INSERT INTO `rbac_auth_item` VALUES ('/debug/default/download-mail', '2', null, null, null, '1443693776', '1443693776');
INSERT INTO `rbac_auth_item` VALUES ('/debug/default/index', '2', null, null, null, '1443693775', '1443693775');
INSERT INTO `rbac_auth_item` VALUES ('/debug/default/toolbar', '2', null, null, null, '1443693776', '1443693776');
INSERT INTO `rbac_auth_item` VALUES ('/debug/default/view', '2', null, null, null, '1443693776', '1443693776');
INSERT INTO `rbac_auth_item` VALUES ('/file-manager-elfinder/*', '2', null, null, null, '1443693778', '1443693778');
INSERT INTO `rbac_auth_item` VALUES ('/file-manager-elfinder/connect', '2', null, null, null, '1443693778', '1443693778');
INSERT INTO `rbac_auth_item` VALUES ('/file-manager-elfinder/manager', '2', null, null, null, '1443693778', '1443693778');
INSERT INTO `rbac_auth_item` VALUES ('/file-manager/*', '2', null, null, null, '1443693779', '1443693779');
INSERT INTO `rbac_auth_item` VALUES ('/file-manager/index', '2', null, null, null, '1443693779', '1443693779');
INSERT INTO `rbac_auth_item` VALUES ('/file-storage/*', '2', null, null, null, '1443693779', '1443693779');
INSERT INTO `rbac_auth_item` VALUES ('/file-storage/delete', '2', null, null, null, '1443693779', '1443693779');
INSERT INTO `rbac_auth_item` VALUES ('/file-storage/index', '2', null, null, null, '1443693779', '1443693779');
INSERT INTO `rbac_auth_item` VALUES ('/file-storage/upload', '2', null, null, null, '1443693779', '1443693779');
INSERT INTO `rbac_auth_item` VALUES ('/file-storage/upload-delete', '2', null, null, null, '1443693779', '1443693779');
INSERT INTO `rbac_auth_item` VALUES ('/file-storage/upload-imperavi', '2', null, null, null, '1443693779', '1443693779');
INSERT INTO `rbac_auth_item` VALUES ('/file-storage/view', '2', null, null, null, '1443693779', '1443693779');
INSERT INTO `rbac_auth_item` VALUES ('/gii/*', '2', null, null, null, '1443693775', '1443693775');
INSERT INTO `rbac_auth_item` VALUES ('/gii/default/*', '2', null, null, null, '1443693775', '1443693775');
INSERT INTO `rbac_auth_item` VALUES ('/gii/default/action', '2', null, null, null, '1443693775', '1443693775');
INSERT INTO `rbac_auth_item` VALUES ('/gii/default/diff', '2', null, null, null, '1443693775', '1443693775');
INSERT INTO `rbac_auth_item` VALUES ('/gii/default/index', '2', null, null, null, '1443693775', '1443693775');
INSERT INTO `rbac_auth_item` VALUES ('/gii/default/preview', '2', null, null, null, '1443693775', '1443693775');
INSERT INTO `rbac_auth_item` VALUES ('/gii/default/view', '2', null, null, null, '1443693775', '1443693775');
INSERT INTO `rbac_auth_item` VALUES ('/i18n/*', '2', null, null, null, '1443693776', '1443693776');
INSERT INTO `rbac_auth_item` VALUES ('/i18n/i18n-message/*', '2', null, null, null, '1443693776', '1443693776');
INSERT INTO `rbac_auth_item` VALUES ('/i18n/i18n-message/create', '2', null, null, null, '1443693776', '1443693776');
INSERT INTO `rbac_auth_item` VALUES ('/i18n/i18n-message/delete', '2', null, null, null, '1443693776', '1443693776');
INSERT INTO `rbac_auth_item` VALUES ('/i18n/i18n-message/index', '2', null, null, null, '1443693776', '1443693776');
INSERT INTO `rbac_auth_item` VALUES ('/i18n/i18n-message/update', '2', null, null, null, '1443693776', '1443693776');
INSERT INTO `rbac_auth_item` VALUES ('/i18n/i18n-source-message/*', '2', null, null, null, '1443693776', '1443693776');
INSERT INTO `rbac_auth_item` VALUES ('/i18n/i18n-source-message/create', '2', null, null, null, '1443693776', '1443693776');
INSERT INTO `rbac_auth_item` VALUES ('/i18n/i18n-source-message/delete', '2', null, null, null, '1443693776', '1443693776');
INSERT INTO `rbac_auth_item` VALUES ('/i18n/i18n-source-message/index', '2', null, null, null, '1443693776', '1443693776');
INSERT INTO `rbac_auth_item` VALUES ('/i18n/i18n-source-message/update', '2', null, null, null, '1443693776', '1443693776');
INSERT INTO `rbac_auth_item` VALUES ('/i18n/i18n-source-message/view', '2', null, null, null, '1443693776', '1443693776');
INSERT INTO `rbac_auth_item` VALUES ('/key-storage/*', '2', null, null, null, '1443693780', '1443693780');
INSERT INTO `rbac_auth_item` VALUES ('/key-storage/create', '2', null, null, null, '1443693780', '1443693780');
INSERT INTO `rbac_auth_item` VALUES ('/key-storage/delete', '2', null, null, null, '1443693780', '1443693780');
INSERT INTO `rbac_auth_item` VALUES ('/key-storage/index', '2', null, null, null, '1443693780', '1443693780');
INSERT INTO `rbac_auth_item` VALUES ('/key-storage/update', '2', null, null, null, '1443693780', '1443693780');
INSERT INTO `rbac_auth_item` VALUES ('/log/*', '2', null, null, null, '1443693780', '1443693780');
INSERT INTO `rbac_auth_item` VALUES ('/log/delete', '2', null, null, null, '1443693780', '1443693780');
INSERT INTO `rbac_auth_item` VALUES ('/log/index', '2', null, null, null, '1443693780', '1443693780');
INSERT INTO `rbac_auth_item` VALUES ('/log/view', '2', null, null, null, '1443693780', '1443693780');
INSERT INTO `rbac_auth_item` VALUES ('/module/*', '2', null, null, null, '1443693780', '1443693780');
INSERT INTO `rbac_auth_item` VALUES ('/module/create', '2', null, null, null, '1443693780', '1443693780');
INSERT INTO `rbac_auth_item` VALUES ('/module/delete', '2', null, null, null, '1443693780', '1443693780');
INSERT INTO `rbac_auth_item` VALUES ('/module/index', '2', null, null, null, '1443693780', '1443693780');
INSERT INTO `rbac_auth_item` VALUES ('/module/update', '2', null, null, null, '1443693780', '1443693780');
INSERT INTO `rbac_auth_item` VALUES ('/module/view', '2', null, null, null, '1443693780', '1443693780');
INSERT INTO `rbac_auth_item` VALUES ('/page/*', '2', null, null, null, '1443693780', '1443693780');
INSERT INTO `rbac_auth_item` VALUES ('/page/create', '2', null, null, null, '1443693780', '1443693780');
INSERT INTO `rbac_auth_item` VALUES ('/page/delete', '2', null, null, null, '1443693780', '1443693780');
INSERT INTO `rbac_auth_item` VALUES ('/page/index', '2', null, null, null, '1443693780', '1443693780');
INSERT INTO `rbac_auth_item` VALUES ('/page/update', '2', null, null, null, '1443693780', '1443693780');
INSERT INTO `rbac_auth_item` VALUES ('/sign-in/*', '2', null, null, null, '1443693781', '1443693781');
INSERT INTO `rbac_auth_item` VALUES ('/sign-in/account', '2', null, null, null, '1443693780', '1443693780');
INSERT INTO `rbac_auth_item` VALUES ('/sign-in/avatar-delete', '2', null, null, null, '1443693780', '1443693780');
INSERT INTO `rbac_auth_item` VALUES ('/sign-in/avatar-upload', '2', null, null, null, '1443693780', '1443693780');
INSERT INTO `rbac_auth_item` VALUES ('/sign-in/login', '2', null, null, null, '1443693780', '1443693780');
INSERT INTO `rbac_auth_item` VALUES ('/sign-in/logout', '2', null, null, null, '1443693780', '1443693780');
INSERT INTO `rbac_auth_item` VALUES ('/sign-in/profile', '2', null, null, null, '1443693780', '1443693780');
INSERT INTO `rbac_auth_item` VALUES ('/site/*', '2', null, null, null, '1443693781', '1443693781');
INSERT INTO `rbac_auth_item` VALUES ('/site/error', '2', null, null, null, '1443693781', '1443693781');
INSERT INTO `rbac_auth_item` VALUES ('/site/settings', '2', null, null, null, '1443693781', '1443693781');
INSERT INTO `rbac_auth_item` VALUES ('/system-information/*', '2', null, null, null, '1443693781', '1443693781');
INSERT INTO `rbac_auth_item` VALUES ('/system-information/index', '2', null, null, null, '1443693781', '1443693781');
INSERT INTO `rbac_auth_item` VALUES ('/timeline-event/*', '2', null, null, null, '1443693781', '1443693781');
INSERT INTO `rbac_auth_item` VALUES ('/timeline-event/index', '2', null, null, null, '1443693781', '1443693781');
INSERT INTO `rbac_auth_item` VALUES ('/user/*', '2', null, null, null, '1443693781', '1443693781');
INSERT INTO `rbac_auth_item` VALUES ('/user/create', '2', null, null, null, '1443693781', '1443693781');
INSERT INTO `rbac_auth_item` VALUES ('/user/delete', '2', null, null, null, '1443693781', '1443693781');
INSERT INTO `rbac_auth_item` VALUES ('/user/index', '2', null, null, null, '1443693781', '1443693781');
INSERT INTO `rbac_auth_item` VALUES ('/user/update', '2', null, null, null, '1443693781', '1443693781');
INSERT INTO `rbac_auth_item` VALUES ('/user/view', '2', null, null, null, '1443693781', '1443693781');
INSERT INTO `rbac_auth_item` VALUES ('/widget-carousel-item/*', '2', null, null, null, '1443693781', '1443693781');
INSERT INTO `rbac_auth_item` VALUES ('/widget-carousel-item/create', '2', null, null, null, '1443693781', '1443693781');
INSERT INTO `rbac_auth_item` VALUES ('/widget-carousel-item/delete', '2', null, null, null, '1443693781', '1443693781');
INSERT INTO `rbac_auth_item` VALUES ('/widget-carousel-item/update', '2', null, null, null, '1443693781', '1443693781');
INSERT INTO `rbac_auth_item` VALUES ('/widget-carousel/*', '2', null, null, null, '1443693781', '1443693781');
INSERT INTO `rbac_auth_item` VALUES ('/widget-carousel/create', '2', null, null, null, '1443693781', '1443693781');
INSERT INTO `rbac_auth_item` VALUES ('/widget-carousel/delete', '2', null, null, null, '1443693781', '1443693781');
INSERT INTO `rbac_auth_item` VALUES ('/widget-carousel/index', '2', null, null, null, '1443693781', '1443693781');
INSERT INTO `rbac_auth_item` VALUES ('/widget-carousel/update', '2', null, null, null, '1443693781', '1443693781');
INSERT INTO `rbac_auth_item` VALUES ('/widget-menu/*', '2', null, null, null, '1443693781', '1443693781');
INSERT INTO `rbac_auth_item` VALUES ('/widget-menu/create', '2', null, null, null, '1443693781', '1443693781');
INSERT INTO `rbac_auth_item` VALUES ('/widget-menu/delete', '2', null, null, null, '1443693781', '1443693781');
INSERT INTO `rbac_auth_item` VALUES ('/widget-menu/index', '2', null, null, null, '1443693781', '1443693781');
INSERT INTO `rbac_auth_item` VALUES ('/widget-menu/update', '2', null, null, null, '1443693781', '1443693781');
INSERT INTO `rbac_auth_item` VALUES ('/widget-text/*', '2', null, null, null, '1443693782', '1443693782');
INSERT INTO `rbac_auth_item` VALUES ('/widget-text/create', '2', null, null, null, '1443693782', '1443693782');
INSERT INTO `rbac_auth_item` VALUES ('/widget-text/delete', '2', null, null, null, '1443693782', '1443693782');
INSERT INTO `rbac_auth_item` VALUES ('/widget-text/index', '2', null, null, null, '1443693782', '1443693782');
INSERT INTO `rbac_auth_item` VALUES ('/widget-text/update', '2', null, null, null, '1443693782', '1443693782');
INSERT INTO `rbac_auth_item` VALUES ('All Access', '2', 'For Superpower only.', null, null, '1443693845', '1443748516');
INSERT INTO `rbac_auth_item` VALUES ('director', '1', null, null, null, '1443693109', '1443693109');
INSERT INTO `rbac_auth_item` VALUES ('loginToBackend', '2', null, null, null, '1443693109', '1443693109');
INSERT INTO `rbac_auth_item` VALUES ('manager', '1', null, null, null, '1443693108', '1443693108');
INSERT INTO `rbac_auth_item` VALUES ('presdir', '1', null, null, null, '1443693109', '1443693109');
INSERT INTO `rbac_auth_item` VALUES ('staff', '1', null, null, null, '1443693108', '1443693108');
INSERT INTO `rbac_auth_item` VALUES ('superpower', '1', null, null, null, '1443693109', '1443693109');
INSERT INTO `rbac_auth_item` VALUES ('supervisor', '1', null, null, null, '1443693108', '1443693108');

-- ----------------------------
-- Table structure for rbac_auth_item_child
-- ----------------------------
DROP TABLE IF EXISTS `rbac_auth_item_child`;
CREATE TABLE `rbac_auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `rbac_auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `rbac_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rbac_auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `rbac_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of rbac_auth_item_child
-- ----------------------------
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/*');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/admin/*');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/admin/assignment/*');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/admin/assignment/assign');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/admin/assignment/index');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/admin/assignment/search');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/admin/assignment/view');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/admin/default/*');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/admin/default/index');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/admin/menu/*');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/admin/menu/create');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/admin/menu/delete');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/admin/menu/index');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/admin/menu/update');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/admin/menu/view');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/admin/module/*');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/admin/module/create');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/admin/module/delete');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/admin/module/index');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/admin/module/update');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/admin/module/view');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/admin/permission/*');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/admin/permission/assign');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/admin/permission/create');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/admin/permission/delete');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/admin/permission/index');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/admin/permission/search');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/admin/permission/update');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/admin/permission/view');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/admin/role/*');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/admin/role/assign');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/admin/role/create');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/admin/role/delete');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/admin/role/index');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/admin/role/search');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/admin/role/update');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/admin/role/view');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/admin/route/*');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/admin/route/assign');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/admin/route/create');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/admin/route/index');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/admin/route/search');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/admin/rule/*');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/admin/rule/create');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/admin/rule/delete');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/admin/rule/index');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/admin/rule/update');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/admin/rule/view');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/admin/system-information/*');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/admin/system-information/index');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/admin/user/*');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/admin/user/create');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/admin/user/delete');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/admin/user/index');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/admin/user/update');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/admin/user/view');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/article-category/*');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/article-category/create');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/article-category/delete');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/article-category/index');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/article-category/update');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/article-category/view');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/article/*');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/article/create');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/article/delete');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/article/index');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/article/update');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/cache/*');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/cache/flush-cache');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/cache/flush-cache-key');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/cache/flush-cache-tag');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/cache/index');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/debug/*');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/debug/default/*');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/debug/default/download-mail');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/debug/default/index');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/debug/default/toolbar');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/debug/default/view');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/file-manager-elfinder/*');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/file-manager-elfinder/connect');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/file-manager-elfinder/manager');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/file-manager/*');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/file-manager/index');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/file-storage/*');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/file-storage/delete');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/file-storage/index');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/file-storage/upload');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/file-storage/upload-delete');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/file-storage/upload-imperavi');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/file-storage/view');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/gii/*');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/gii/default/*');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/gii/default/action');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/gii/default/diff');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/gii/default/index');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/gii/default/preview');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/gii/default/view');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/i18n/*');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/i18n/i18n-message/*');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/i18n/i18n-message/create');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/i18n/i18n-message/delete');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/i18n/i18n-message/index');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/i18n/i18n-message/update');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/i18n/i18n-source-message/*');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/i18n/i18n-source-message/create');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/i18n/i18n-source-message/delete');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/i18n/i18n-source-message/index');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/i18n/i18n-source-message/update');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/i18n/i18n-source-message/view');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/key-storage/*');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/key-storage/create');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/key-storage/delete');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/key-storage/index');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/key-storage/update');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/log/*');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/log/delete');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/log/index');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/log/view');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/module/*');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/module/create');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/module/delete');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/module/index');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/module/update');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/module/view');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/page/*');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/page/create');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/page/delete');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/page/index');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/page/update');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/sign-in/*');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/sign-in/account');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/sign-in/avatar-delete');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/sign-in/avatar-upload');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/sign-in/login');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/sign-in/logout');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/sign-in/profile');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/site/*');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/site/error');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/site/settings');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/system-information/*');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/system-information/index');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/timeline-event/*');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/timeline-event/index');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/user/*');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/user/create');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/user/delete');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/user/index');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/user/update');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/user/view');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/widget-carousel-item/*');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/widget-carousel-item/create');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/widget-carousel-item/delete');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/widget-carousel-item/update');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/widget-carousel/*');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/widget-carousel/create');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/widget-carousel/delete');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/widget-carousel/index');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/widget-carousel/update');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/widget-menu/*');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/widget-menu/create');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/widget-menu/delete');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/widget-menu/index');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/widget-menu/update');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/widget-text/*');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/widget-text/create');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/widget-text/delete');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/widget-text/index');
INSERT INTO `rbac_auth_item_child` VALUES ('All Access', '/widget-text/update');
INSERT INTO `rbac_auth_item_child` VALUES ('presdir', 'director');
INSERT INTO `rbac_auth_item_child` VALUES ('manager', 'loginToBackend');
INSERT INTO `rbac_auth_item_child` VALUES ('staff', 'loginToBackend');
INSERT INTO `rbac_auth_item_child` VALUES ('director', 'manager');
INSERT INTO `rbac_auth_item_child` VALUES ('superpower', 'presdir');
INSERT INTO `rbac_auth_item_child` VALUES ('supervisor', 'staff');
INSERT INTO `rbac_auth_item_child` VALUES ('manager', 'supervisor');

-- ----------------------------
-- Table structure for rbac_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `rbac_auth_rule`;
CREATE TABLE `rbac_auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of rbac_auth_rule
-- ----------------------------

-- ----------------------------
-- Table structure for system_db_migration
-- ----------------------------
DROP TABLE IF EXISTS `system_db_migration`;
CREATE TABLE `system_db_migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_db_migration
-- ----------------------------
INSERT INTO `system_db_migration` VALUES ('m000000_000000_base', '1443688309');
INSERT INTO `system_db_migration` VALUES ('m140703_123000_user', '1443688319');
INSERT INTO `system_db_migration` VALUES ('m140703_123055_log', '1443688320');
INSERT INTO `system_db_migration` VALUES ('m140703_123104_page', '1443688320');
INSERT INTO `system_db_migration` VALUES ('m140703_123803_article', '1443688329');
INSERT INTO `system_db_migration` VALUES ('m140703_123813_rbac', '1443688331');
INSERT INTO `system_db_migration` VALUES ('m140709_173306_widget_menu', '1443688332');
INSERT INTO `system_db_migration` VALUES ('m140709_173333_widget_text', '1443688332');
INSERT INTO `system_db_migration` VALUES ('m140712_123329_widget_carousel', '1443688335');
INSERT INTO `system_db_migration` VALUES ('m140805_084745_key_storage_item', '1443688337');
INSERT INTO `system_db_migration` VALUES ('m141012_101932_i18n_tables', '1443688339');
INSERT INTO `system_db_migration` VALUES ('m150318_213934_file_storage_item', '1443688340');
INSERT INTO `system_db_migration` VALUES ('m150414_195800_timeline_event', '1443688341');
INSERT INTO `system_db_migration` VALUES ('m150725_192740_seed_data', '1443688346');

-- ----------------------------
-- Table structure for system_log
-- ----------------------------
DROP TABLE IF EXISTS `system_log`;
CREATE TABLE `system_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `level` int(11) DEFAULT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_time` double DEFAULT NULL,
  `prefix` text COLLATE utf8_unicode_ci,
  `message` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_log_level` (`level`),
  KEY `idx_log_category` (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of system_log
-- ----------------------------
INSERT INTO `system_log` VALUES ('1', '2', 'yii\\log\\Dispatcher::dispatch', '1443688352.8269', '[backend][/]', 'Unable to send log via yii\\debug\\LogTarget: Exception \'PDOException\' with message \'You cannot serialize or unserialize PDO instances\' \n\nin C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php:58\n\nStack trace:\n#0 [internal function]: PDO->__sleep()\n#1 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(58): serialize(Array)\n#2 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(112): yii\\debug\\LogTarget->export(Array)\n#3 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Dispatcher.php(183): yii\\debug\\LogTarget->collect(Array, true)\n#4 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Logger.php(173): yii\\log\\Dispatcher->dispatch(Array, true)\n#5 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\base\\ErrorHandler.php(111): yii\\log\\Logger->flush(true)\n#6 [internal function]: yii\\base\\ErrorHandler->handleException(Object(yii\\web\\ForbiddenHttpException))\n#7 {main}');
INSERT INTO `system_log` VALUES ('2', '2', 'yii\\log\\Dispatcher::dispatch', '1443688421.8708', '[backend][/]', 'Unable to send log via yii\\debug\\LogTarget: Exception \'PDOException\' with message \'You cannot serialize or unserialize PDO instances\' \n\nin C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php:58\n\nStack trace:\n#0 [internal function]: PDO->__sleep()\n#1 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(58): serialize(Array)\n#2 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(112): yii\\debug\\LogTarget->export(Array)\n#3 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Dispatcher.php(183): yii\\debug\\LogTarget->collect(Array, true)\n#4 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Logger.php(173): yii\\log\\Dispatcher->dispatch(Array, true)\n#5 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\base\\ErrorHandler.php(111): yii\\log\\Logger->flush(true)\n#6 [internal function]: yii\\base\\ErrorHandler->handleException(Object(yii\\web\\ForbiddenHttpException))\n#7 {main}');
INSERT INTO `system_log` VALUES ('3', '2', 'yii\\log\\Dispatcher::dispatch', '1443688444.7712', '[backend][/]', 'Unable to send log via yii\\debug\\LogTarget: Exception \'PDOException\' with message \'You cannot serialize or unserialize PDO instances\' \n\nin C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php:58\n\nStack trace:\n#0 [internal function]: PDO->__sleep()\n#1 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(58): serialize(Array)\n#2 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(112): yii\\debug\\LogTarget->export(Array)\n#3 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Dispatcher.php(183): yii\\debug\\LogTarget->collect(Array, true)\n#4 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Logger.php(173): yii\\log\\Dispatcher->dispatch(Array, true)\n#5 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\base\\ErrorHandler.php(111): yii\\log\\Logger->flush(true)\n#6 [internal function]: yii\\base\\ErrorHandler->handleException(Object(yii\\web\\ForbiddenHttpException))\n#7 {main}');
INSERT INTO `system_log` VALUES ('4', '2', 'yii\\log\\Dispatcher::dispatch', '1443688455.6568', '[backend][/]', 'Unable to send log via yii\\debug\\LogTarget: Exception \'PDOException\' with message \'You cannot serialize or unserialize PDO instances\' \n\nin C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php:58\n\nStack trace:\n#0 [internal function]: PDO->__sleep()\n#1 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(58): serialize(Array)\n#2 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(112): yii\\debug\\LogTarget->export(Array)\n#3 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Dispatcher.php(183): yii\\debug\\LogTarget->collect(Array, true)\n#4 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Logger.php(173): yii\\log\\Dispatcher->dispatch(Array, true)\n#5 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\base\\ErrorHandler.php(111): yii\\log\\Logger->flush(true)\n#6 [internal function]: yii\\base\\ErrorHandler->handleException(Object(yii\\web\\ForbiddenHttpException))\n#7 {main}');
INSERT INTO `system_log` VALUES ('5', '2', 'yii\\log\\Dispatcher::dispatch', '1443688461.5791', '[backend][/]', 'Unable to send log via yii\\debug\\LogTarget: Exception \'PDOException\' with message \'You cannot serialize or unserialize PDO instances\' \n\nin C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php:58\n\nStack trace:\n#0 [internal function]: PDO->__sleep()\n#1 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(58): serialize(Array)\n#2 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(112): yii\\debug\\LogTarget->export(Array)\n#3 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Dispatcher.php(183): yii\\debug\\LogTarget->collect(Array, true)\n#4 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Logger.php(173): yii\\log\\Dispatcher->dispatch(Array, true)\n#5 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\base\\ErrorHandler.php(111): yii\\log\\Logger->flush(true)\n#6 [internal function]: yii\\base\\ErrorHandler->handleException(Object(yii\\web\\ForbiddenHttpException))\n#7 {main}');
INSERT INTO `system_log` VALUES ('6', '2', 'yii\\log\\Dispatcher::dispatch', '1443688510.6889', '[backend][/]', 'Unable to send log via yii\\debug\\LogTarget: Exception \'PDOException\' with message \'You cannot serialize or unserialize PDO instances\' \n\nin C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php:58\n\nStack trace:\n#0 [internal function]: PDO->__sleep()\n#1 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(58): serialize(Array)\n#2 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(112): yii\\debug\\LogTarget->export(Array)\n#3 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Dispatcher.php(183): yii\\debug\\LogTarget->collect(Array, true)\n#4 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Logger.php(173): yii\\log\\Dispatcher->dispatch(Array, true)\n#5 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\base\\ErrorHandler.php(111): yii\\log\\Logger->flush(true)\n#6 [internal function]: yii\\base\\ErrorHandler->handleException(Object(yii\\web\\ForbiddenHttpException))\n#7 {main}');
INSERT INTO `system_log` VALUES ('7', '2', 'yii\\log\\Dispatcher::dispatch', '1443688544.5599', '[backend][/]', 'Unable to send log via yii\\debug\\LogTarget: Exception \'PDOException\' with message \'You cannot serialize or unserialize PDO instances\' \n\nin C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php:58\n\nStack trace:\n#0 [internal function]: PDO->__sleep()\n#1 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(58): serialize(Array)\n#2 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(112): yii\\debug\\LogTarget->export(Array)\n#3 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Dispatcher.php(183): yii\\debug\\LogTarget->collect(Array, true)\n#4 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Logger.php(173): yii\\log\\Dispatcher->dispatch(Array, true)\n#5 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\base\\ErrorHandler.php(111): yii\\log\\Logger->flush(true)\n#6 [internal function]: yii\\base\\ErrorHandler->handleException(Object(yii\\web\\ForbiddenHttpException))\n#7 {main}');
INSERT INTO `system_log` VALUES ('8', '2', 'yii\\log\\Dispatcher::dispatch', '1443688612.0817', '[backend][/]', 'Unable to send log via yii\\debug\\LogTarget: Exception \'PDOException\' with message \'You cannot serialize or unserialize PDO instances\' \n\nin C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php:58\n\nStack trace:\n#0 [internal function]: PDO->__sleep()\n#1 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(58): serialize(Array)\n#2 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(112): yii\\debug\\LogTarget->export(Array)\n#3 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Dispatcher.php(183): yii\\debug\\LogTarget->collect(Array, true)\n#4 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Logger.php(173): yii\\log\\Dispatcher->dispatch(Array, true)\n#5 [internal function]: yii\\log\\Logger->flush(true)\n#6 {main}');
INSERT INTO `system_log` VALUES ('9', '2', 'yii\\log\\Dispatcher::dispatch', '1443688615.1309', '[backend][/]', 'Unable to send log via yii\\debug\\LogTarget: Exception \'PDOException\' with message \'You cannot serialize or unserialize PDO instances\' \n\nin C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php:58\n\nStack trace:\n#0 [internal function]: PDO->__sleep()\n#1 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(58): serialize(Array)\n#2 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(112): yii\\debug\\LogTarget->export(Array)\n#3 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Dispatcher.php(183): yii\\debug\\LogTarget->collect(Array, true)\n#4 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Logger.php(173): yii\\log\\Dispatcher->dispatch(Array, true)\n#5 [internal function]: yii\\log\\Logger->flush(true)\n#6 {main}');
INSERT INTO `system_log` VALUES ('10', '1', 'yii\\db\\Exception', '1443688622.5543', '[backend][/]', 'exception \'PDOException\' with message \'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'starter_local.menu\' doesn\'t exist\' in C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\db\\Command.php:837\nStack trace:\n#0 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\db\\Command.php(837): PDOStatement->execute()\n#1 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\db\\Command.php(359): yii\\db\\Command->queryInternal(\'<span class=\"st...\', \'<span class=\"ke...\')\n#2 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\db\\Query.php(206): yii\\db\\Command->queryAll()\n#3 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\db\\ActiveQuery.php(132): yii\\db\\Query->all(\'<span class=\"ke...\')\n#4 C:\\xampp\\htdocs\\starter\\vendor\\mdmsoft\\yii2-admin\\components\\MenuHelper.php(73): yii\\db\\ActiveQuery->all()\n#5 C:\\xampp\\htdocs\\starter\\backend\\views\\layouts\\common.php(225): mdm\\admin\\components\\MenuHelper::getAssignedMenu(\'<span class=\"nu...\', \'<span class=\"nu...\', Object(Closure))\n#6 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\base\\View.php(325): require(\'C:\\\\xampp\\\\htdocs...\')\n#7 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\base\\View.php(247): yii\\base\\View->renderPhpFile(\'<span class=\"st...\', \'[<span class=\"s...\')\n#8 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\base\\Controller.php(386): yii\\base\\View->renderFile(\'<span class=\"st...\', \'[<span class=\"s...\', Object(backend\\controllers\\TimelineEventController))\n#9 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\base\\Controller.php(372): yii\\base\\Controller->renderContent(\'<span class=\"st...\')\n#10 C:\\xampp\\htdocs\\starter\\backend\\controllers\\TimelineEventController.php(30): yii\\base\\Controller->render(\'<span class=\"st...\', \'[<span class=\"s...\')\n#11 [internal function]: backend\\controllers\\TimelineEventController->actionIndex()\n#12 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(55): call_user_func_array(\'[<span class=\"t...\', \'[]\')\n#13 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\base\\Controller.php(151): yii\\base\\InlineAction->runWithParams(\'[]\')\n#14 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\base\\Module.php(455): yii\\base\\Controller->runAction(\'<span class=\"st...\', \'[]\')\n#15 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\web\\Application.php(84): yii\\base\\Module->runAction(\'<span class=\"st...\', \'[]\')\n#16 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\base\\Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#17 C:\\xampp\\htdocs\\starter\\backend\\web\\index.php(23): yii\\base\\Application->run()\n#18 {main}\n\nNext exception \'yii\\db\\Exception\' with message \'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'starter_local.menu\' doesn\'t exist\nThe SQL being executed was: SELECT * FROM `menu`\' in C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\db\\Schema.php:628\nStack trace:\n#0 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\db\\Command.php(852): yii\\db\\Schema->convertException(Object(PDOException), \'SELECT * FROM `...\')\n#1 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\db\\Command.php(359): yii\\db\\Command->queryInternal(\'<span class=\"st...\', \'<span class=\"ke...\')\n#2 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\db\\Query.php(206): yii\\db\\Command->queryAll()\n#3 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\db\\ActiveQuery.php(132): yii\\db\\Query->all(\'<span class=\"ke...\')\n#4 C:\\xampp\\htdocs\\starter\\vendor\\mdmsoft\\yii2-admin\\components\\MenuHelper.php(73): yii\\db\\ActiveQuery->all()\n#5 C:\\xampp\\htdocs\\starter\\backend\\views\\layouts\\common.php(225): mdm\\admin\\components\\MenuHelper::getAssignedMenu(\'<span class=\"nu...\', \'<span class=\"nu...\', Object(Closure))\n#6 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\base\\View.php(325): require(\'C:\\\\xampp\\\\htdocs...\')\n#7 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\base\\View.php(247): yii\\base\\View->renderPhpFile(\'<span class=\"st...\', \'[<span class=\"s...\')\n#8 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\base\\Controller.php(386): yii\\base\\View->renderFile(\'<span class=\"st...\', \'[<span class=\"s...\', Object(backend\\controllers\\TimelineEventController))\n#9 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\base\\Controller.php(372): yii\\base\\Controller->renderContent(\'<span class=\"st...\')\n#10 C:\\xampp\\htdocs\\starter\\backend\\controllers\\TimelineEventController.php(30): yii\\base\\Controller->render(\'<span class=\"st...\', \'[<span class=\"s...\')\n#11 [internal function]: backend\\controllers\\TimelineEventController->actionIndex()\n#12 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(55): call_user_func_array(\'[<span class=\"t...\', \'[]\')\n#13 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\base\\Controller.php(151): yii\\base\\InlineAction->runWithParams(\'[]\')\n#14 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\base\\Module.php(455): yii\\base\\Controller->runAction(\'<span class=\"st...\', \'[]\')\n#15 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\web\\Application.php(84): yii\\base\\Module->runAction(\'<span class=\"st...\', \'[]\')\n#16 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\base\\Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#17 C:\\xampp\\htdocs\\starter\\backend\\web\\index.php(23): yii\\base\\Application->run()\n#18 {main}\r\nAdditional Information:\r\nArray\n(\n    [0] => 42S02\n    [1] => 1146\n    [2] => Table \'starter_local.menu\' doesn\'t exist\n)\n');
INSERT INTO `system_log` VALUES ('11', '2', 'yii\\log\\Dispatcher::dispatch', '1443688622.7883', '[backend][/]', 'Unable to send log via yii\\debug\\LogTarget: Exception \'Exception\' with message \'Serialization of \'Closure\' is not allowed\' \n\nin C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php:58\n\nStack trace:\n#0 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(58): serialize(Array)\n#1 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(112): yii\\debug\\LogTarget->export(Array)\n#2 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Dispatcher.php(183): yii\\debug\\LogTarget->collect(Array, true)\n#3 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Logger.php(173): yii\\log\\Dispatcher->dispatch(Array, true)\n#4 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\base\\ErrorHandler.php(111): yii\\log\\Logger->flush(true)\n#5 [internal function]: yii\\base\\ErrorHandler->handleException(Object(yii\\db\\Exception))\n#6 {main}');
INSERT INTO `system_log` VALUES ('12', '2', 'yii\\log\\Dispatcher::dispatch', '1443688805.3048', '[backend][/admin/role/search?id=superpower&target=avaliable&term=]', 'Unable to send log via yii\\debug\\LogTarget: Exception \'PDOException\' with message \'You cannot serialize or unserialize PDO instances\' \n\nin C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php:58\n\nStack trace:\n#0 [internal function]: PDO->__sleep()\n#1 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(58): serialize(Array)\n#2 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(112): yii\\debug\\LogTarget->export(Array)\n#3 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Dispatcher.php(183): yii\\debug\\LogTarget->collect(Array, true)\n#4 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Logger.php(173): yii\\log\\Dispatcher->dispatch(Array, true)\n#5 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\base\\ErrorHandler.php(111): yii\\log\\Logger->flush(true)\n#6 [internal function]: yii\\base\\ErrorHandler->handleException(Object(yii\\web\\ForbiddenHttpException))\n#7 {main}');
INSERT INTO `system_log` VALUES ('13', '2', 'yii\\log\\Dispatcher::dispatch', '1443688805.5638', '[backend][/admin/role/search?id=superpower&target=assigned&term=]', 'Unable to send log via yii\\debug\\LogTarget: Exception \'PDOException\' with message \'You cannot serialize or unserialize PDO instances\' \n\nin C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php:58\n\nStack trace:\n#0 [internal function]: PDO->__sleep()\n#1 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(58): serialize(Array)\n#2 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(112): yii\\debug\\LogTarget->export(Array)\n#3 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Dispatcher.php(183): yii\\debug\\LogTarget->collect(Array, true)\n#4 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Logger.php(173): yii\\log\\Dispatcher->dispatch(Array, true)\n#5 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\base\\ErrorHandler.php(111): yii\\log\\Logger->flush(true)\n#6 [internal function]: yii\\base\\ErrorHandler->handleException(Object(yii\\web\\ForbiddenHttpException))\n#7 {main}');
INSERT INTO `system_log` VALUES ('14', '2', 'yii\\log\\Dispatcher::dispatch', '1443688811.8341', '[backend][/admin/role/assign]', 'Unable to send log via yii\\debug\\LogTarget: Exception \'PDOException\' with message \'You cannot serialize or unserialize PDO instances\' \n\nin C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php:58\n\nStack trace:\n#0 [internal function]: PDO->__sleep()\n#1 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(58): serialize(Array)\n#2 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(112): yii\\debug\\LogTarget->export(Array)\n#3 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Dispatcher.php(183): yii\\debug\\LogTarget->collect(Array, true)\n#4 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Logger.php(173): yii\\log\\Dispatcher->dispatch(Array, true)\n#5 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\base\\ErrorHandler.php(111): yii\\log\\Logger->flush(true)\n#6 [internal function]: yii\\base\\ErrorHandler->handleException(Object(yii\\web\\ForbiddenHttpException))\n#7 {main}');
INSERT INTO `system_log` VALUES ('15', '2', 'yii\\log\\Dispatcher::dispatch', '1443688813.8583', '[backend][/]', 'Unable to send log via yii\\debug\\LogTarget: Exception \'PDOException\' with message \'You cannot serialize or unserialize PDO instances\' \n\nin C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php:58\n\nStack trace:\n#0 [internal function]: PDO->__sleep()\n#1 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(58): serialize(Array)\n#2 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(112): yii\\debug\\LogTarget->export(Array)\n#3 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Dispatcher.php(183): yii\\debug\\LogTarget->collect(Array, true)\n#4 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Logger.php(173): yii\\log\\Dispatcher->dispatch(Array, true)\n#5 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\base\\ErrorHandler.php(111): yii\\log\\Logger->flush(true)\n#6 [internal function]: yii\\base\\ErrorHandler->handleException(Object(yii\\web\\ForbiddenHttpException))\n#7 {main}');
INSERT INTO `system_log` VALUES ('16', '2', 'yii\\log\\Dispatcher::dispatch', '1443688836.4636', '[backend][/]', 'Unable to send log via yii\\debug\\LogTarget: Exception \'PDOException\' with message \'You cannot serialize or unserialize PDO instances\' \n\nin C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php:58\n\nStack trace:\n#0 [internal function]: PDO->__sleep()\n#1 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(58): serialize(Array)\n#2 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(112): yii\\debug\\LogTarget->export(Array)\n#3 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Dispatcher.php(183): yii\\debug\\LogTarget->collect(Array, true)\n#4 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Logger.php(173): yii\\log\\Dispatcher->dispatch(Array, true)\n#5 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\base\\ErrorHandler.php(111): yii\\log\\Logger->flush(true)\n#6 [internal function]: yii\\base\\ErrorHandler->handleException(Object(yii\\web\\ForbiddenHttpException))\n#7 {main}');
INSERT INTO `system_log` VALUES ('17', '2', 'yii\\log\\Dispatcher::dispatch', '1443688844.441', '[backend][/]', 'Unable to send log via yii\\debug\\LogTarget: Exception \'PDOException\' with message \'You cannot serialize or unserialize PDO instances\' \n\nin C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php:58\n\nStack trace:\n#0 [internal function]: PDO->__sleep()\n#1 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(58): serialize(Array)\n#2 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(112): yii\\debug\\LogTarget->export(Array)\n#3 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Dispatcher.php(183): yii\\debug\\LogTarget->collect(Array, true)\n#4 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Logger.php(173): yii\\log\\Dispatcher->dispatch(Array, true)\n#5 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\base\\ErrorHandler.php(111): yii\\log\\Logger->flush(true)\n#6 [internal function]: yii\\base\\ErrorHandler->handleException(Object(yii\\web\\ForbiddenHttpException))\n#7 {main}');
INSERT INTO `system_log` VALUES ('18', '2', 'yii\\log\\Dispatcher::dispatch', '1443688863.2211', '[backend][/]', 'Unable to send log via yii\\debug\\LogTarget: Exception \'PDOException\' with message \'You cannot serialize or unserialize PDO instances\' \n\nin C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php:58\n\nStack trace:\n#0 [internal function]: PDO->__sleep()\n#1 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(58): serialize(Array)\n#2 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(112): yii\\debug\\LogTarget->export(Array)\n#3 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Dispatcher.php(183): yii\\debug\\LogTarget->collect(Array, true)\n#4 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Logger.php(173): yii\\log\\Dispatcher->dispatch(Array, true)\n#5 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\base\\ErrorHandler.php(111): yii\\log\\Logger->flush(true)\n#6 [internal function]: yii\\base\\ErrorHandler->handleException(Object(yii\\web\\ForbiddenHttpException))\n#7 {main}');
INSERT INTO `system_log` VALUES ('19', '2', 'yii\\log\\Dispatcher::dispatch', '1443689804.2929', '[backend][/sign-in/login]', 'Unable to send log via yii\\debug\\LogTarget: Exception \'PDOException\' with message \'You cannot serialize or unserialize PDO instances\' \n\nin C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php:58\n\nStack trace:\n#0 [internal function]: PDO->__sleep()\n#1 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(58): serialize(Array)\n#2 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(112): yii\\debug\\LogTarget->export(Array)\n#3 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Dispatcher.php(183): yii\\debug\\LogTarget->collect(Array, true)\n#4 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Logger.php(173): yii\\log\\Dispatcher->dispatch(Array, true)\n#5 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\base\\ErrorHandler.php(111): yii\\log\\Logger->flush(true)\n#6 [internal function]: yii\\base\\ErrorHandler->handleException(Object(yii\\web\\ForbiddenHttpException))\n#7 {main}');
INSERT INTO `system_log` VALUES ('20', '2', 'yii\\log\\Dispatcher::dispatch', '1443692416.7663', '[backend][/admin/role/view?id=supervisor]', 'Unable to send log via yii\\debug\\LogTarget: Exception \'PDOException\' with message \'You cannot serialize or unserialize PDO instances\' \n\nin C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php:58\n\nStack trace:\n#0 [internal function]: PDO->__sleep()\n#1 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(58): serialize(Array)\n#2 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(112): yii\\debug\\LogTarget->export(Array)\n#3 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Dispatcher.php(183): yii\\debug\\LogTarget->collect(Array, true)\n#4 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Logger.php(173): yii\\log\\Dispatcher->dispatch(Array, true)\n#5 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\base\\ErrorHandler.php(111): yii\\log\\Logger->flush(true)\n#6 [internal function]: yii\\base\\ErrorHandler->handleException(Object(yii\\web\\ForbiddenHttpException))\n#7 {main}');
INSERT INTO `system_log` VALUES ('21', '2', 'yii\\log\\Dispatcher::dispatch', '1443692427.823', '[backend][/admin/role/update?id=supervisor]', 'Unable to send log via yii\\debug\\LogTarget: Exception \'PDOException\' with message \'You cannot serialize or unserialize PDO instances\' \n\nin C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php:58\n\nStack trace:\n#0 [internal function]: PDO->__sleep()\n#1 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(58): serialize(Array)\n#2 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(112): yii\\debug\\LogTarget->export(Array)\n#3 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Dispatcher.php(183): yii\\debug\\LogTarget->collect(Array, true)\n#4 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Logger.php(173): yii\\log\\Dispatcher->dispatch(Array, true)\n#5 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\base\\ErrorHandler.php(111): yii\\log\\Logger->flush(true)\n#6 [internal function]: yii\\base\\ErrorHandler->handleException(Object(yii\\web\\ForbiddenHttpException))\n#7 {main}');
INSERT INTO `system_log` VALUES ('22', '2', 'yii\\log\\Dispatcher::dispatch', '1443692436.0394', '[backend][/admin/role/view?id=supervisor]', 'Unable to send log via yii\\debug\\LogTarget: Exception \'PDOException\' with message \'You cannot serialize or unserialize PDO instances\' \n\nin C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php:58\n\nStack trace:\n#0 [internal function]: PDO->__sleep()\n#1 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(58): serialize(Array)\n#2 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(112): yii\\debug\\LogTarget->export(Array)\n#3 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Dispatcher.php(183): yii\\debug\\LogTarget->collect(Array, true)\n#4 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Logger.php(173): yii\\log\\Dispatcher->dispatch(Array, true)\n#5 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\base\\ErrorHandler.php(111): yii\\log\\Logger->flush(true)\n#6 [internal function]: yii\\base\\ErrorHandler->handleException(Object(yii\\web\\ForbiddenHttpException))\n#7 {main}');
INSERT INTO `system_log` VALUES ('23', '2', 'yii\\log\\Dispatcher::dispatch', '1443692593.2494', '[backend][/admin/role/update?id=supervisor]', 'Unable to send log via yii\\debug\\LogTarget: Exception \'PDOException\' with message \'You cannot serialize or unserialize PDO instances\' \n\nin C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php:58\n\nStack trace:\n#0 [internal function]: PDO->__sleep()\n#1 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(58): serialize(Array)\n#2 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(112): yii\\debug\\LogTarget->export(Array)\n#3 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Dispatcher.php(183): yii\\debug\\LogTarget->collect(Array, true)\n#4 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Logger.php(173): yii\\log\\Dispatcher->dispatch(Array, true)\n#5 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\base\\ErrorHandler.php(111): yii\\log\\Logger->flush(true)\n#6 [internal function]: yii\\base\\ErrorHandler->handleException(Object(yii\\web\\ForbiddenHttpException))\n#7 {main}');
INSERT INTO `system_log` VALUES ('24', '2', 'yii\\log\\Dispatcher::dispatch', '1443692596.6516', '[backend][/sign-in/profile]', 'Unable to send log via yii\\debug\\LogTarget: Exception \'PDOException\' with message \'You cannot serialize or unserialize PDO instances\' \n\nin C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php:58\n\nStack trace:\n#0 [internal function]: PDO->__sleep()\n#1 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(58): serialize(Array)\n#2 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(112): yii\\debug\\LogTarget->export(Array)\n#3 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Dispatcher.php(183): yii\\debug\\LogTarget->collect(Array, true)\n#4 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Logger.php(173): yii\\log\\Dispatcher->dispatch(Array, true)\n#5 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\base\\ErrorHandler.php(111): yii\\log\\Logger->flush(true)\n#6 [internal function]: yii\\base\\ErrorHandler->handleException(Object(yii\\web\\ForbiddenHttpException))\n#7 {main}');
INSERT INTO `system_log` VALUES ('25', '2', 'yii\\log\\Dispatcher::dispatch', '1443692601.3929', '[backend][/sign-in/logout]', 'Unable to send log via yii\\debug\\LogTarget: Exception \'PDOException\' with message \'You cannot serialize or unserialize PDO instances\' \n\nin C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php:58\n\nStack trace:\n#0 [internal function]: PDO->__sleep()\n#1 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(58): serialize(Array)\n#2 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(112): yii\\debug\\LogTarget->export(Array)\n#3 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Dispatcher.php(183): yii\\debug\\LogTarget->collect(Array, true)\n#4 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Logger.php(173): yii\\log\\Dispatcher->dispatch(Array, true)\n#5 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\base\\ErrorHandler.php(111): yii\\log\\Logger->flush(true)\n#6 [internal function]: yii\\base\\ErrorHandler->handleException(Object(yii\\web\\MethodNotAllowedHttpException))\n#7 {main}');
INSERT INTO `system_log` VALUES ('26', '2', 'yii\\log\\Dispatcher::dispatch', '1443692605.8092', '[backend][/sign-in/]', 'Unable to send log via yii\\debug\\LogTarget: Exception \'PDOException\' with message \'You cannot serialize or unserialize PDO instances\' \n\nin C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php:58\n\nStack trace:\n#0 [internal function]: PDO->__sleep()\n#1 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(58): serialize(Array)\n#2 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(112): yii\\debug\\LogTarget->export(Array)\n#3 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Dispatcher.php(183): yii\\debug\\LogTarget->collect(Array, true)\n#4 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Logger.php(173): yii\\log\\Dispatcher->dispatch(Array, true)\n#5 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\base\\ErrorHandler.php(111): yii\\log\\Logger->flush(true)\n#6 [internal function]: yii\\base\\ErrorHandler->handleException(Object(yii\\web\\ForbiddenHttpException))\n#7 {main}');
INSERT INTO `system_log` VALUES ('27', '2', 'yii\\log\\Dispatcher::dispatch', '1443692622.6971', '[backend][/]', 'Unable to send log via yii\\debug\\LogTarget: Exception \'PDOException\' with message \'You cannot serialize or unserialize PDO instances\' \n\nin C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php:58\n\nStack trace:\n#0 [internal function]: PDO->__sleep()\n#1 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(58): serialize(Array)\n#2 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(112): yii\\debug\\LogTarget->export(Array)\n#3 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Dispatcher.php(183): yii\\debug\\LogTarget->collect(Array, true)\n#4 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Logger.php(173): yii\\log\\Dispatcher->dispatch(Array, true)\n#5 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\base\\ErrorHandler.php(111): yii\\log\\Logger->flush(true)\n#6 [internal function]: yii\\base\\ErrorHandler->handleException(Object(yii\\web\\ForbiddenHttpException))\n#7 {main}');
INSERT INTO `system_log` VALUES ('28', '2', 'yii\\log\\Dispatcher::dispatch', '1443692796.217', '[backend][/]', 'Unable to send log via yii\\debug\\LogTarget: Exception \'PDOException\' with message \'You cannot serialize or unserialize PDO instances\' \n\nin C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php:58\n\nStack trace:\n#0 [internal function]: PDO->__sleep()\n#1 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(58): serialize(Array)\n#2 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(112): yii\\debug\\LogTarget->export(Array)\n#3 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Dispatcher.php(183): yii\\debug\\LogTarget->collect(Array, true)\n#4 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Logger.php(173): yii\\log\\Dispatcher->dispatch(Array, true)\n#5 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\base\\ErrorHandler.php(111): yii\\log\\Logger->flush(true)\n#6 [internal function]: yii\\base\\ErrorHandler->handleException(Object(yii\\web\\ForbiddenHttpException))\n#7 {main}');
INSERT INTO `system_log` VALUES ('29', '2', 'yii\\log\\Dispatcher::dispatch', '1443692803.2694', '[backend][/admin/module/index]', 'Unable to send log via yii\\debug\\LogTarget: Exception \'PDOException\' with message \'You cannot serialize or unserialize PDO instances\' \n\nin C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php:58\n\nStack trace:\n#0 [internal function]: PDO->__sleep()\n#1 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(58): serialize(Array)\n#2 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(112): yii\\debug\\LogTarget->export(Array)\n#3 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Dispatcher.php(183): yii\\debug\\LogTarget->collect(Array, true)\n#4 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Logger.php(173): yii\\log\\Dispatcher->dispatch(Array, true)\n#5 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\base\\ErrorHandler.php(111): yii\\log\\Logger->flush(true)\n#6 [internal function]: yii\\base\\ErrorHandler->handleException(Object(yii\\web\\ForbiddenHttpException))\n#7 {main}');
INSERT INTO `system_log` VALUES ('30', '2', 'yii\\log\\Dispatcher::dispatch', '1443692806.1376', '[backend][/admin/menu/index]', 'Unable to send log via yii\\debug\\LogTarget: Exception \'PDOException\' with message \'You cannot serialize or unserialize PDO instances\' \n\nin C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php:58\n\nStack trace:\n#0 [internal function]: PDO->__sleep()\n#1 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(58): serialize(Array)\n#2 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(112): yii\\debug\\LogTarget->export(Array)\n#3 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Dispatcher.php(183): yii\\debug\\LogTarget->collect(Array, true)\n#4 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Logger.php(173): yii\\log\\Dispatcher->dispatch(Array, true)\n#5 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\base\\ErrorHandler.php(111): yii\\log\\Logger->flush(true)\n#6 [internal function]: yii\\base\\ErrorHandler->handleException(Object(yii\\web\\ForbiddenHttpException))\n#7 {main}');
INSERT INTO `system_log` VALUES ('31', '2', 'yii\\log\\Dispatcher::dispatch', '1443692809.5288', '[backend][/]', 'Unable to send log via yii\\debug\\LogTarget: Exception \'PDOException\' with message \'You cannot serialize or unserialize PDO instances\' \n\nin C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php:58\n\nStack trace:\n#0 [internal function]: PDO->__sleep()\n#1 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(58): serialize(Array)\n#2 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(112): yii\\debug\\LogTarget->export(Array)\n#3 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Dispatcher.php(183): yii\\debug\\LogTarget->collect(Array, true)\n#4 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Logger.php(173): yii\\log\\Dispatcher->dispatch(Array, true)\n#5 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\base\\ErrorHandler.php(111): yii\\log\\Logger->flush(true)\n#6 [internal function]: yii\\base\\ErrorHandler->handleException(Object(yii\\web\\ForbiddenHttpException))\n#7 {main}');
INSERT INTO `system_log` VALUES ('32', '2', 'yii\\log\\Dispatcher::dispatch', '1443692873.5165', '[backend][/sign-in/login]', 'Unable to send log via yii\\debug\\LogTarget: Exception \'PDOException\' with message \'You cannot serialize or unserialize PDO instances\' \n\nin C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php:58\n\nStack trace:\n#0 [internal function]: PDO->__sleep()\n#1 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(58): serialize(Array)\n#2 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(112): yii\\debug\\LogTarget->export(Array)\n#3 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Dispatcher.php(183): yii\\debug\\LogTarget->collect(Array, true)\n#4 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Logger.php(173): yii\\log\\Dispatcher->dispatch(Array, true)\n#5 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\base\\ErrorHandler.php(111): yii\\log\\Logger->flush(true)\n#6 [internal function]: yii\\base\\ErrorHandler->handleException(Object(yii\\web\\ForbiddenHttpException))\n#7 {main}');
INSERT INTO `system_log` VALUES ('33', '2', 'yii\\log\\Dispatcher::dispatch', '1443692904.5972', '[backend][/sign-in/login]', 'Unable to send log via yii\\debug\\LogTarget: Exception \'PDOException\' with message \'You cannot serialize or unserialize PDO instances\' \n\nin C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php:58\n\nStack trace:\n#0 [internal function]: PDO->__sleep()\n#1 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(58): serialize(Array)\n#2 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(112): yii\\debug\\LogTarget->export(Array)\n#3 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Dispatcher.php(183): yii\\debug\\LogTarget->collect(Array, true)\n#4 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Logger.php(173): yii\\log\\Dispatcher->dispatch(Array, true)\n#5 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\base\\ErrorHandler.php(111): yii\\log\\Logger->flush(true)\n#6 [internal function]: yii\\base\\ErrorHandler->handleException(Object(yii\\web\\ForbiddenHttpException))\n#7 {main}');
INSERT INTO `system_log` VALUES ('34', '2', 'yii\\log\\Dispatcher::dispatch', '1443692918.365', '[backend][/sign-in/login]', 'Unable to send log via yii\\debug\\LogTarget: Exception \'PDOException\' with message \'You cannot serialize or unserialize PDO instances\' \n\nin C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php:58\n\nStack trace:\n#0 [internal function]: PDO->__sleep()\n#1 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(58): serialize(Array)\n#2 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(112): yii\\debug\\LogTarget->export(Array)\n#3 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Dispatcher.php(183): yii\\debug\\LogTarget->collect(Array, true)\n#4 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Logger.php(173): yii\\log\\Dispatcher->dispatch(Array, true)\n#5 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\base\\ErrorHandler.php(111): yii\\log\\Logger->flush(true)\n#6 [internal function]: yii\\base\\ErrorHandler->handleException(Object(yii\\web\\ForbiddenHttpException))\n#7 {main}');
INSERT INTO `system_log` VALUES ('35', '2', 'yii\\log\\Dispatcher::dispatch', '1443692975.0793', '[backend][/]', 'Unable to send log via yii\\debug\\LogTarget: Exception \'PDOException\' with message \'You cannot serialize or unserialize PDO instances\' \n\nin C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php:58\n\nStack trace:\n#0 [internal function]: PDO->__sleep()\n#1 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(58): serialize(Array)\n#2 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(112): yii\\debug\\LogTarget->export(Array)\n#3 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Dispatcher.php(183): yii\\debug\\LogTarget->collect(Array, true)\n#4 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Logger.php(173): yii\\log\\Dispatcher->dispatch(Array, true)\n#5 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\base\\ErrorHandler.php(111): yii\\log\\Logger->flush(true)\n#6 [internal function]: yii\\base\\ErrorHandler->handleException(Object(yii\\web\\ForbiddenHttpException))\n#7 {main}');
INSERT INTO `system_log` VALUES ('36', '2', 'yii\\log\\Dispatcher::dispatch', '1443692995.2454', '[backend][/]', 'Unable to send log via yii\\debug\\LogTarget: Exception \'PDOException\' with message \'You cannot serialize or unserialize PDO instances\' \n\nin C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php:58\n\nStack trace:\n#0 [internal function]: PDO->__sleep()\n#1 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(58): serialize(Array)\n#2 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(112): yii\\debug\\LogTarget->export(Array)\n#3 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Dispatcher.php(183): yii\\debug\\LogTarget->collect(Array, true)\n#4 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Logger.php(173): yii\\log\\Dispatcher->dispatch(Array, true)\n#5 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\base\\ErrorHandler.php(111): yii\\log\\Logger->flush(true)\n#6 [internal function]: yii\\base\\ErrorHandler->handleException(Object(yii\\web\\ForbiddenHttpException))\n#7 {main}');
INSERT INTO `system_log` VALUES ('37', '2', 'yii\\log\\Dispatcher::dispatch', '1443693032.4906', '[backend][/]', 'Unable to send log via yii\\debug\\LogTarget: Exception \'PDOException\' with message \'You cannot serialize or unserialize PDO instances\' \n\nin C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php:58\n\nStack trace:\n#0 [internal function]: PDO->__sleep()\n#1 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(58): serialize(Array)\n#2 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2-debug\\LogTarget.php(112): yii\\debug\\LogTarget->export(Array)\n#3 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Dispatcher.php(183): yii\\debug\\LogTarget->collect(Array, true)\n#4 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\log\\Logger.php(173): yii\\log\\Dispatcher->dispatch(Array, true)\n#5 C:\\xampp\\htdocs\\starter\\vendor\\yiisoft\\yii2\\base\\ErrorHandler.php(111): yii\\log\\Logger->flush(true)\n#6 [internal function]: yii\\base\\ErrorHandler->handleException(Object(yii\\web\\ForbiddenHttpException))\n#7 {main}');

-- ----------------------------
-- Table structure for system_rbac_migration
-- ----------------------------
DROP TABLE IF EXISTS `system_rbac_migration`;
CREATE TABLE `system_rbac_migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_rbac_migration
-- ----------------------------
INSERT INTO `system_rbac_migration` VALUES ('m150625_214101_roles', '1443693109');
INSERT INTO `system_rbac_migration` VALUES ('m150625_215624_init_permissions', '1443693109');

-- ----------------------------
-- Table structure for timeline_event
-- ----------------------------
DROP TABLE IF EXISTS `timeline_event`;
CREATE TABLE `timeline_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `event` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_created_at` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of timeline_event
-- ----------------------------
INSERT INTO `timeline_event` VALUES ('1', 'frontend', 'user', 'signup', '{\"public_identity\":\"webmaster\",\"user_id\":1,\"created_at\":1443688341}', '1443688341');
INSERT INTO `timeline_event` VALUES ('2', 'frontend', 'user', 'signup', '{\"public_identity\":\"manager\",\"user_id\":2,\"created_at\":1443688341}', '1443688341');
INSERT INTO `timeline_event` VALUES ('3', 'frontend', 'user', 'signup', '{\"public_identity\":\"user\",\"user_id\":3,\"created_at\":1443688341}', '1443688341');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `oauth_client` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `oauth_client_user_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '1',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `logged_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'webmaster', 'wZkN07esetqWeCls2NmY1Zk5H9HI5kDL', '$2y$13$oZLEAYe4piWo4gH2TVK7vegWlvzo2jdLzTtD7h5ai0R.c9bnIILY2', null, null, null, 'webmaster@example.com', '1', '1443688342', '1443689910', '1443689910');
INSERT INTO `user` VALUES ('2', 'manager', 'BsHrkPl271vRUqXkK6CXH9VkHn0HHCQA', '$2y$13$FCSl8tplw7FuZ0IwixYtfuX4hs8a.uqwtp03DYpcVXXKqH1EkfzLu', null, null, null, 'manager@example.com', '1', '1443688344', '1443692873', '1443692873');
INSERT INTO `user` VALUES ('3', 'user', 'NeDnTZFmv6DaqXkKx0WuGIHY9O-UJFjT', '$2y$13$fwNVj3zb5323Ouu/Gf0mqe2ZlZierVYykTca4j6xRMaZqRxS0vnRW', null, null, null, 'user@example.com', '1', '1443688345', '1443692918', '1443692918');

-- ----------------------------
-- Table structure for user_profile
-- ----------------------------
DROP TABLE IF EXISTS `user_profile`;
CREATE TABLE `user_profile` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `middlename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_base_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locale` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `gender` smallint(1) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user_profile
-- ----------------------------
INSERT INTO `user_profile` VALUES ('1', 'John', null, 'Doe', null, null, 'en-US', null);
INSERT INTO `user_profile` VALUES ('2', null, null, null, null, null, 'en-US', null);
INSERT INTO `user_profile` VALUES ('3', null, null, null, null, null, 'en-US', null);

-- ----------------------------
-- Table structure for widget_carousel
-- ----------------------------
DROP TABLE IF EXISTS `widget_carousel`;
CREATE TABLE `widget_carousel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of widget_carousel
-- ----------------------------
INSERT INTO `widget_carousel` VALUES ('1', 'index', '1');

-- ----------------------------
-- Table structure for widget_carousel_item
-- ----------------------------
DROP TABLE IF EXISTS `widget_carousel_item`;
CREATE TABLE `widget_carousel_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `carousel_id` int(11) NOT NULL,
  `base_url` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `caption` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `order` int(11) DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_item_carousel` (`carousel_id`),
  CONSTRAINT `fk_item_carousel` FOREIGN KEY (`carousel_id`) REFERENCES `widget_carousel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of widget_carousel_item
-- ----------------------------
INSERT INTO `widget_carousel_item` VALUES ('1', '1', 'http://front.starter.local', 'img/yii2-starter-kit.gif', 'image/gif', '/', null, '1', '0', null, null);

-- ----------------------------
-- Table structure for widget_menu
-- ----------------------------
DROP TABLE IF EXISTS `widget_menu`;
CREATE TABLE `widget_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `items` text COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of widget_menu
-- ----------------------------
INSERT INTO `widget_menu` VALUES ('1', 'frontend-index', 'Frontend index menu', '[\n    {\n        \"label\": \"Get started with Yii2\",\n        \"url\": \"http://www.yiiframework.com\",\n        \"options\": {\n            \"tag\": \"span\"\n        },\n        \"template\": \"<a href=\\\"{url}\\\" class=\\\"btn btn-lg btn-success\\\">{label}</a>\"\n    },\n    {\n        \"label\": \"Yii2 Starter Kit on GitHub\",\n        \"url\": \"https://github.com/trntv/yii2-starter-kit\",\n        \"options\": {\n            \"tag\": \"span\"\n        },\n        \"template\": \"<a href=\\\"{url}\\\" class=\\\"btn btn-lg btn-primary\\\">{label}</a>\"\n    },\n    {\n        \"label\": \"Find a bug?\",\n        \"url\": \"https://github.com/trntv/yii2-starter-kit/issues\",\n        \"options\": {\n            \"tag\": \"span\"\n        },\n        \"template\": \"<a href=\\\"{url}\\\" class=\\\"btn btn-lg btn-danger\\\">{label}</a>\"\n    }\n]', '1');

-- ----------------------------
-- Table structure for widget_text
-- ----------------------------
DROP TABLE IF EXISTS `widget_text`;
CREATE TABLE `widget_text` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_widget_text_key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of widget_text
-- ----------------------------
INSERT INTO `widget_text` VALUES ('1', 'backend_welcome', 'Welcome to backend', '<p>Welcome to Yii2 Starter Kit Dashboard</p>', '1', '1443688346', '1443688346');
