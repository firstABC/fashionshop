/*
Navicat MySQL Data Transfer

Source Server         : fashionShop
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : fashionshop

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2018-02-27 22:14:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `g_id` varchar(64) DEFAULT NULL,
  `g_title` varchar(255) DEFAULT NULL,
  `g_detail` varchar(5000) DEFAULT NULL,
  `g_price` varchar(6) DEFAULT NULL,
  `g_brand` varchar(255) DEFAULT NULL,
  `g_inventory` int(10) DEFAULT NULL,
  `g_like` int(10) DEFAULT NULL,
  `g_status` varchar(2) DEFAULT NULL
  `g_sex` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
