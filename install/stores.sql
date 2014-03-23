/*
 Navicat Premium Data Transfer

 Source Server         : LOCAL
 Source Server Type    : MySQL
 Source Server Version : 50616
 Source Host           : localhost
 Source Database       : oxidce

 Target Server Type    : MySQL
 Target Server Version : 50616
 File Encoding         : utf-8

 Date: 03/23/2014 18:14:04 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `stores`
-- ----------------------------
DROP TABLE IF EXISTS `stores`;
CREATE TABLE `stores` (
  `OXID` int(11) NOT NULL AUTO_INCREMENT,
  `store_name` varchar(255) DEFAULT NULL,
  `store_address` varchar(255) DEFAULT NULL,
  `store_city` varchar(255) DEFAULT NULL,
  `store_zip` int(8) DEFAULT NULL,
  `store_country` char(32) DEFAULT NULL,
  `store_contact` text,
  `store_description` text,
  `store_latitude` double DEFAULT NULL,
  `store_logitude` double DEFAULT NULL,
  `store_marker` varchar(128) DEFAULT NULL,
  `store_active` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`OXID`)
) ENGINE=InnoDB AUTO_INCREMENT=2147483647 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `stores`
-- ----------------------------
BEGIN;
INSERT INTO `stores` VALUES ('1', 'Sea Life', 'Hafenstraße 9', 'Konstanz', '78462', 'a7c40f631fc920687.20179984', 'Tel: +49 7531 128270', 'ÖFFNUNGSZEITEN\r\nTäglich:\r\nab 10.00 Uhr', '47.65706', '9.18018', 'marker.png', '1'), ('2', 'Lago Shopping Center', 'Bodanstraße 1', 'Konstanz', '78462', 'a7c40f631fc920687.20179984', 'Tel: +49 7531 6913360', '', '47.6575711', '9.1764994', 'marker.png', '1');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
