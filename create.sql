/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : yangjiawenhua

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-12-16 15:00:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bill
-- ----------------------------
DROP TABLE IF EXISTS `bill`;
CREATE TABLE `bill` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `frome` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `head` varchar(255) DEFAULT NULL,
  `card` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `project` varchar(255) DEFAULT NULL,
  `book_type` varchar(255) DEFAULT NULL,
  `book_id` bigint(20) DEFAULT NULL,
  `publishing_house` varchar(255) DEFAULT NULL,
  `bill_amount` decimal(10,0) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bill
-- ----------------------------

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `book_name` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `a-1` bigint(20) DEFAULT NULL,
  `a-2` bigint(20) DEFAULT NULL,
  `a-3` bigint(20) DEFAULT NULL,
  `a-4` bigint(20) DEFAULT NULL,
  `a-5` bigint(20) DEFAULT NULL,
  `a-6` bigint(20) DEFAULT NULL,
  `b-1` bigint(20) DEFAULT NULL,
  `b-2` bigint(20) DEFAULT NULL,
  `b-3` bigint(20) DEFAULT NULL,
  `b-4` bigint(20) DEFAULT NULL,
  `b-5` bigint(20) DEFAULT NULL,
  `b-6` bigint(20) DEFAULT NULL,
  `b-7` bigint(20) DEFAULT NULL,
  `b-8` bigint(20) DEFAULT NULL,
  `c-1` bigint(20) DEFAULT NULL,
  `c-2` bigint(20) DEFAULT NULL,
  `c-3` bigint(20) DEFAULT NULL,
  `c-4` bigint(20) DEFAULT NULL,
  `c-5` bigint(20) DEFAULT NULL,
  `c-6` bigint(20) DEFAULT NULL,
  `c-7` bigint(20) DEFAULT NULL,
  `c-8` bigint(20) DEFAULT NULL,
  `c-9` bigint(20) DEFAULT NULL,
  `c-10` bigint(20) DEFAULT NULL,
  `c-11` bigint(20) DEFAULT NULL,
  `c-12` bigint(20) DEFAULT NULL,
  `c-13` bigint(20) DEFAULT NULL,
  `c-14` bigint(20) DEFAULT NULL,
  `c-15` bigint(20) DEFAULT NULL,
  `book_info_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book
-- ----------------------------

-- ----------------------------
-- Table structure for book_info
-- ----------------------------
DROP TABLE IF EXISTS `book_info`;
CREATE TABLE `book_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `book_name` varchar(255) DEFAULT NULL,
  `publicer` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `eb` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `words` varchar(255) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `product_size` varchar(255) DEFAULT NULL,
  `volumes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book_info
-- ----------------------------

-- ----------------------------
-- Table structure for custom
-- ----------------------------
DROP TABLE IF EXISTS `custom`;
CREATE TABLE `custom` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `china_name` varchar(100) DEFAULT NULL,
  `phone_no` varchar(5000) DEFAULT NULL,
  `unit_name` varchar(100) DEFAULT NULL,
  `profession` varchar(100) DEFAULT NULL,
  `user_id` bigint(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of custom
-- ----------------------------

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `phone_no` varchar(255) DEFAULT NULL,
  `custom_name` varchar(255) DEFAULT NULL,
  `custom_place` varchar(255) DEFAULT NULL,
  `book_id` bigint(20) DEFAULT NULL,
  `amount` decimal(10,0) DEFAULT NULL,
  `words` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `contract_send_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `return_amount` decimal(10,0) DEFAULT NULL,
  `return_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(1) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `second_return_amount` decimal(10,0) DEFAULT NULL,
  `second_return_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `third_return_amount` decimal(10,0) DEFAULT NULL,
  `third_return_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------

-- ----------------------------
-- Table structure for privilege
-- ----------------------------
DROP TABLE IF EXISTS `privilege`;
CREATE TABLE `privilege` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `privilege_name` varchar(40) NOT NULL,
  `pid` int(10) DEFAULT NULL COMMENT '父权限id ',
  `type` varchar(1) NOT NULL COMMENT '权限类型:\n0 菜单\n1 按钮 ',
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of privilege
-- ----------------------------
INSERT INTO `privilege` VALUES ('1', '系统管理', null, '1', '');
INSERT INTO `privilege` VALUES ('2', '客户管理', null, '1', '');
INSERT INTO `privilege` VALUES ('3', '图书管理', null, '1', '');
INSERT INTO `privilege` VALUES ('4', '订单管理', null, '1', '');
INSERT INTO `privilege` VALUES ('5', '发票管理', null, '1', '');
INSERT INTO `privilege` VALUES ('6', '推荐费管理', null, '1', '');
INSERT INTO `privilege` VALUES ('7', '日志查询', null, '1', '');
INSERT INTO `privilege` VALUES ('11', '用户资料管理', '1', '2', '');
INSERT INTO `privilege` VALUES ('21', '客户信息查询', '2', '2', '');
INSERT INTO `privilege` VALUES ('22', '客户信息录入', '2', '2', '');
INSERT INTO `privilege` VALUES ('31', '合作图书管理', '3', '2', '');
INSERT INTO `privilege` VALUES ('32', '自费图书管理', '3', '2', '');
INSERT INTO `privilege` VALUES ('111', '查询', '11', '3', '“”');
INSERT INTO `privilege` VALUES ('112', '增加', '11', '3', '1');
INSERT INTO `privilege` VALUES ('113', '修改', '11', '3', '1');
INSERT INTO `privilege` VALUES ('114', '删除', '11', '3', '1');

-- ----------------------------
-- Table structure for recommend
-- ----------------------------
DROP TABLE IF EXISTS `recommend`;
CREATE TABLE `recommend` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `type` varchar(1) DEFAULT NULL,
  `phone_no` varchar(11) DEFAULT NULL,
  `custom_phone_no` varchar(11) DEFAULT NULL,
  `bcustom_phone_no` varchar(11) DEFAULT NULL,
  `custom_name` varchar(100) DEFAULT NULL,
  `bcustom_name` varchar(100) DEFAULT NULL,
  `custom_company` varchar(100) DEFAULT NULL,
  `bcustom_company` varchar(100) DEFAULT NULL,
  `bcustom_book_id` bigint(255) DEFAULT NULL,
  `bcustom_place` varchar(100) DEFAULT NULL,
  `bcustom_amount` decimal(10,0) DEFAULT NULL,
  `bank_name` varchar(100) DEFAULT NULL,
  `bank_no` varchar(100) DEFAULT NULL,
  `recommend_amount` decimal(10,0) DEFAULT NULL,
  `recommend_remark` varchar(500) DEFAULT NULL,
  `user_id` bigint(255) DEFAULT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of recommend
-- ----------------------------

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '管理员');

-- ----------------------------
-- Table structure for role_privilege
-- ----------------------------
DROP TABLE IF EXISTS `role_privilege`;
CREATE TABLE `role_privilege` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) NOT NULL,
  `privilege_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `i_role_privilege_roleId` (`role_id`) USING BTREE,
  KEY `i_role_privilege_privilege_id` (`privilege_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_privilege
-- ----------------------------
INSERT INTO `role_privilege` VALUES ('1', '1', '1');
INSERT INTO `role_privilege` VALUES ('2', '1', '2');
INSERT INTO `role_privilege` VALUES ('3', '1', '3');
INSERT INTO `role_privilege` VALUES ('4', '1', '4');
INSERT INTO `role_privilege` VALUES ('5', '1', '5');
INSERT INTO `role_privilege` VALUES ('6', '1', '6');
INSERT INTO `role_privilege` VALUES ('7', '1', '7');
INSERT INTO `role_privilege` VALUES ('8', '1', '11');
INSERT INTO `role_privilege` VALUES ('9', '1', '21');
INSERT INTO `role_privilege` VALUES ('10', '1', '22');
INSERT INTO `role_privilege` VALUES ('11', '1', '31');
INSERT INTO `role_privilege` VALUES ('12', '1', '32');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `position` varchar(100) DEFAULT NULL,
  `dto_id` varchar(100) DEFAULT NULL,
  `china_name` varchar(100) DEFAULT NULL,
  `user_no` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '1', '1', '1', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(20) NOT NULL,
  `role_id` int(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `i_user_role_userId` (`user_id`) USING BTREE,
  KEY `i_user_role_roleId` (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '1', '1');
