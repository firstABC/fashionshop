/*
Navicat MySQL Data Transfer

Source Server         : fashionShop
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : fashionshop

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2018-02-27 22:14:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `n_id` varchar(64) DEFAULT NULL,
  `n_title` varchar(255) DEFAULT NULL,
  `n_detal` varchar(255) DEFAULT NULL,
  `n_author` varchar(255) DEFAULT NULL,
  `n_number` int(10) DEFAULT NULL,
  `n_dateTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------
