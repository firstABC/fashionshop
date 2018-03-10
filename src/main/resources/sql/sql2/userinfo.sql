/*
Navicat MySQL Data Transfer

Source Server         : localmysql
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : movierecommend

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-03-10 13:11:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `user_id` varchar(64) NOT NULL,
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
INSERT INTO `userinfo` VALUES ('1ce00f8e-89c2-4732-aa2c-a16a90c55561', 'regis', '4321', '111111111', '123@163.com', '2018-03-10 13:04:02', '0');
INSERT INTO `userinfo` VALUES ('2', 'ss', '123', '1134', '13@163.com', '2018-02-12 14:24:44', '0');
INSERT INTO `userinfo` VALUES ('3', 'ss', '5555', '1145', '1@163.com', '2018-03-10 02:31:11', '0');
INSERT INTO `userinfo` VALUES ('4', 'ff', '222', '111', '1@123.com', '2018-02-12 14:32:10', '0');
INSERT INTO `userinfo` VALUES ('4124d1ab-277c-468a-bca7-09d9b9676a66', 'aaab', '1111', '111114', '2222222@qq.com', '2018-03-10 12:58:12', '0');
INSERT INTO `userinfo` VALUES ('5', 'te', '123', '111', '123@qq.com', '2018-02-26 15:59:11', '0');
INSERT INTO `userinfo` VALUES ('6', 'tt', '321', '134', '11@qq.com', '2018-02-26 16:14:37', '0');
INSERT INTO `userinfo` VALUES ('7', 'zz', '2222', '11111111111', '1@qq.com', '2018-02-28 11:04:58', '0');
