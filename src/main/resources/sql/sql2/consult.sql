/*
Navicat MySQL Data Transfer

Source Server         : localmysql
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : movierecommend

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-03-10 13:11:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for consult
-- ----------------------------
DROP TABLE IF EXISTS `consult`;
CREATE TABLE `consult` (
  `consult_id` varchar(64) NOT NULL,
  `user_id` varchar(64) DEFAULT NULL,
  `admin_id` varchar(64) DEFAULT NULL,
  `goods_id` varchar(64) DEFAULT NULL,
  `consult_msg` varchar(200) DEFAULT NULL,
  `reply_msg` varchar(200) DEFAULT NULL,
  `consult_date` datetime DEFAULT NULL,
  `reply_date` datetime DEFAULT NULL,
  `is_delete` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of consult
-- ----------------------------
INSERT INTO `consult` VALUES ('1', '1', null, '1', 'testmsg', null, '2018-02-28 11:40:43', null, '0');
INSERT INTO `consult` VALUES ('2', '1', '1', '1', 'testcobsult', 'testreply', '2018-02-28 14:22:51', '2018-02-28 14:22:55', '0');
INSERT INTO `consult` VALUES ('3', '2', null, '1', 'addconsult', null, '2018-02-28 16:30:36', null, '0');
INSERT INTO `consult` VALUES ('4', '2', '1', '1', 'addconsult', 'addreply2', '2018-02-28 16:31:28', '2018-02-28 16:44:11', '0');
INSERT INTO `consult` VALUES ('7092683d-14ec-4729-add0-3dbaa9ba24a4', '1', null, 'test', 'gggggg', null, '2018-03-10 00:10:47', null, '0');
INSERT INTO `consult` VALUES ('1ad1d16d-611a-40b7-8c47-d0aa2e8cb29f', '1', null, 'test', 'llll', null, '2018-03-10 00:12:48', null, '0');
INSERT INTO `consult` VALUES ('93bd2a99-c5d7-431f-8722-59de06e69fb4', '1', null, 'test', 'llllllll99', null, '2018-03-10 00:15:01', null, '0');
INSERT INTO `consult` VALUES ('d2269317-170c-4189-b5d5-40c9cca2c6a7', '1', null, 'test', 'ooooo', null, '2018-03-10 00:39:30', null, '0');
INSERT INTO `consult` VALUES ('8093d6ff-af1d-4b17-bad4-584d4ea3861b', '1', null, 'test', 'yyyyyyyy', null, '2018-03-10 02:33:10', null, '0');
INSERT INTO `consult` VALUES ('7bde4f5a-d52d-4ab7-9b02-2e9b5cd72a95', '1ce00f8e-89c2-4732-aa2c-a16a90c55561', null, 'test', 'hhhhhhhhhhhh', null, '2018-03-10 13:09:27', null, '0');
