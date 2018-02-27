/*
Navicat MySQL Data Transfer

Source Server         : localmysql
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : movierecommend

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-02-27 22:00:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for consult
-- ----------------------------
DROP TABLE IF EXISTS `consult`;
CREATE TABLE `consult` (
  `consult_id` int(30) NOT NULL,
  `user_id` int(30) DEFAULT NULL,
  `admin_id` int(30) DEFAULT NULL,
  `goods_id` int(30) DEFAULT NULL,
  `consult_msg` varchar(200) DEFAULT NULL,
  `reply_msg` varchar(200) DEFAULT NULL,
  `consult_date` datetime DEFAULT NULL,
  `reply_date` datetime DEFAULT NULL,
  `is_delete` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of consult
-- ----------------------------
