/*
Navicat MySQL Data Transfer

Source Server         : localmysql
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : movierecommend

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-02-27 22:00:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `user_id` int(30) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `user_pwd` varchar(30) NOT NULL,
  `user_phone` varchar(30) DEFAULT NULL,
  `user_email` varchar(30) DEFAULT NULL,
  `user_date` datetime DEFAULT NULL,
  `is_delete` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('1', 'aaab', '123456', '18888888877', '111@163.co', '2018-02-26 16:49:55', '0');
INSERT INTO `userinfo` VALUES ('2', 'ss', '123', '1134', '13@163.com', '2018-02-12 14:24:44', '0');
INSERT INTO `userinfo` VALUES ('3', 'dd', '5555', '1145', '1@163.com', '2018-02-12 14:28:38', '0');
INSERT INTO `userinfo` VALUES ('4', 'ff', '222', '111', '1@123.com', '2018-02-12 14:32:10', '0');
INSERT INTO `userinfo` VALUES ('5', 'te', '123', '111', '123@qq.com', '2018-02-26 15:59:11', '0');
INSERT INTO `userinfo` VALUES ('6', 'tt', '321', '134', '11@qq.com', '2018-02-26 16:14:37', '0');
