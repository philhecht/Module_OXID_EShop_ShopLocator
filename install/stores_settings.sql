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

 Date: 03/23/2014 18:14:48 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `stores_settings`
-- ----------------------------
DROP TABLE IF EXISTS `stores_settings`;
CREATE TABLE `stores_settings` (
  `OXID` char(32) NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `short_description` varchar(45) DEFAULT NULL,
  `streetview_active` tinyint(1) DEFAULT '0',
  `directions_active` tinyint(1) DEFAULT '0',
  `zoom_factor` int(1) DEFAULT NULL,
  `styled_map` text,
  PRIMARY KEY (`OXID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `stores_settings`
-- ----------------------------
BEGIN;
INSERT INTO `stores_settings` VALUES ('oxbaseshop', 'Standorte in Ihrer Nähe', 'Geben Sie ein Ort ein', '1', '1', '8', '[\r\n  {\r\n  },{\r\n    \"stylers\": [\r\n      { \"hue\": \"#becfdf\" },\r\n      { \"visibility\": \"on\" },\r\n      { \"weight\": 0.3 },\r\n      { \"saturation\": -12 },\r\n      { \"lightness\": 5 },\r\n      { \"gamma\": 0.98 }\r\n    ]\r\n  }\r\n]\r\n');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
