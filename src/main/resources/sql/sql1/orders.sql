/*
Navicat MySQL Data Transfer

Source Server         : fashionShop
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : fashionshop

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2018-03-07 19:15:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `or_id` varchar(64) DEFAULT NULL,
  `g_id` varchar(64) DEFAULT NULL,
  `or_number` int(10) DEFAULT NULL,
  `or_date` datetime DEFAULT NULL,
  `or_price` double(10,0) DEFAULT NULL,
  `or_status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
