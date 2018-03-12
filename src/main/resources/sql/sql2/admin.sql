/*
Navicat MySQL Data Transfer

Source Server         : localmysql
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : movierecommend

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-03-10 13:11:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` varchar(64) DEFAULT NULL,
  `admin_name` varchar(30) DEFAULT NULL,
  `admin_pwd` varchar(30) DEFAULT NULL,
  `is_delete` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', '123456', '0');
INSERT INTO `admin` VALUES ('2', 'update', '654321', '0');
