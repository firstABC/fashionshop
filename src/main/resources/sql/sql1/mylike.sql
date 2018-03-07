/*
Navicat MySQL Data Transfer

Source Server         : fashionShop
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : fashionshop

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2018-03-07 19:15:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for mylike
-- ----------------------------
DROP TABLE IF EXISTS `mylike`;
CREATE TABLE `mylike` (
  `ml_id` varchar(64) NOT NULL,
  `g_id` varchar(64) DEFAULT NULL,
  `userId` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ml_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
