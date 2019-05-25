/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50723
Source Host           : localhost:3306
Source Database       : hospital

Target Server Type    : MYSQL
Target Server Version : 50723
File Encoding         : 65001

Date: 2018-12-08 21:33:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `h_d_orders`
-- ----------------------------
DROP TABLE IF EXISTS `h_d_orders`;
CREATE TABLE `h_d_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rq` varchar(255) DEFAULT NULL,
  `rs` int(11) DEFAULT NULL,
  `hdoctor` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of h_d_orders
-- ----------------------------
INSERT INTO `h_d_orders` VALUES ('1', '2014-05-19', '5', '1');
INSERT INTO `h_d_orders` VALUES ('3', '2014-05-21', '6', '3');
INSERT INTO `h_d_orders` VALUES ('4', '2014-05-19', '2', '3');
INSERT INTO `h_d_orders` VALUES ('5', '2014-05-20', '6', '4');
INSERT INTO `h_d_orders` VALUES ('6', '2014-05-21', '5', '5');
INSERT INTO `h_d_orders` VALUES ('8', '2014-05-26', '2', '2');

-- ----------------------------
-- Table structure for `h_doctor`
-- ----------------------------
DROP TABLE IF EXISTS `h_doctor`;
CREATE TABLE `h_doctor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(255) DEFAULT NULL,
  `upass` varchar(255) DEFAULT NULL,
  `tname` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `htype` varchar(255) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `utype` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `delstatus` varchar(255) DEFAULT NULL,
  `idcard` varchar(255) DEFAULT NULL,
  `remark` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of h_doctor
-- ----------------------------
INSERT INTO `h_doctor` VALUES ('1', 'admin', '123', '老胡', '男', '13888888888', '1', '高级', '0', null, '0', null, '医生');
INSERT INTO `h_doctor` VALUES ('2', '1', '123', '王医生', '女', '13333333333', '3', '高级', '1', '', '0', '', '医生');
INSERT INTO `h_doctor` VALUES ('3', '2', '123', '陈医生', '女', '13512344321', '3', '中级', '1', '', '1', null, '医生');
INSERT INTO `h_doctor` VALUES ('4', '3', '123', '陈医生', '男', '13000000000', '2', '初级', '1', '', '0', '1241234234', '医生');
INSERT INTO `h_doctor` VALUES ('5', '4', '123', '张医生', '男', '15512344321', '4', '中级', '1', '', '0', '123123123123123123', '医生');
INSERT INTO `h_doctor` VALUES ('9', 'zhang', '1234', 'zhang', '女', '15478944567', '1', '中级', '1', 'null', '1', '123', '123');
INSERT INTO `h_doctor` VALUES ('10', 'zhang', '1234', 'zhang', '女', '15478944567', '1', '中级', '1', 'null', '0', '123', '123');

-- ----------------------------
-- Table structure for `h_p`
-- ----------------------------
DROP TABLE IF EXISTS `h_p`;
CREATE TABLE `h_p` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hdoctor` varchar(255) DEFAULT NULL,
  `rq` varchar(255) DEFAULT NULL,
  `huser` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `lsno` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of h_p
-- ----------------------------
INSERT INTO `h_p` VALUES ('57', '5', '2014-05-21', '1', '待诊', null);

-- ----------------------------
-- Table structure for `h_type`
-- ----------------------------
DROP TABLE IF EXISTS `h_type`;
CREATE TABLE `h_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `remark` text,
  `delstatus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of h_type
-- ----------------------------
INSERT INTO `h_type` VALUES ('1', '普外门诊', '外科', '普外门诊', '0');
INSERT INTO `h_type` VALUES ('2', '妇科门诊', '妇产科', '妇科门诊', '0');
INSERT INTO `h_type` VALUES ('3', '儿科门诊', '儿科', '儿科门诊', '0');
INSERT INTO `h_type` VALUES ('4', '眼科门诊', '眼科', '眼科门诊', '0');
INSERT INTO `h_type` VALUES ('5', '口腔科门诊', '口腔科', '口腔科门诊', '0');
INSERT INTO `h_type` VALUES ('6', '耳鼻喉科门诊', '耳鼻喉科', '耳鼻喉科门诊', '0');
INSERT INTO `h_type` VALUES ('7', '中医科门诊', '中医科', '中医科门诊', '0');
INSERT INTO `h_type` VALUES ('8', '呼吸门诊-肺癌专科门诊', '内科', '呼吸门诊', '0');
INSERT INTO `h_type` VALUES ('9', '皮肤科', '外科', '皮肤科', '0');
INSERT INTO `h_type` VALUES ('10', '大脑内科', '内科', '大脑内科', '0');

-- ----------------------------
-- Table structure for `h_user`
-- ----------------------------
DROP TABLE IF EXISTS `h_user`;
CREATE TABLE `h_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(255) DEFAULT NULL,
  `upass` varchar(255) DEFAULT NULL,
  `tname` varchar(255) DEFAULT NULL,
  `age` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `isblack` varchar(255) DEFAULT NULL,
  `delstatus` varchar(255) DEFAULT NULL,
  `idcard` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of h_user
-- ----------------------------
INSERT INTO `h_user` VALUES ('1', '123', '123', '1234', '1234', '男', '1234', 'no', '0', '1234');

-- ----------------------------
-- Table structure for `notice`
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `savetime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('2', '测试新闻一', '<p>测试新闻一测试新闻一测试新闻一</p>', '2014-05-18 01:06:37');
INSERT INTO `notice` VALUES ('3', '测试新闻二', '<p>测试新闻二测试新闻二测试新闻二</p>', '2014-05-18 01:06:44');
INSERT INTO `notice` VALUES ('4', '测试新闻三', '<p>测试新闻三测试新闻三测试新闻三</p>', '2014-05-19 22:49:39');
INSERT INTO `notice` VALUES ('5', '测试新闻四', '<p>测试新闻四测试新闻四测试新闻四</p>', '2014-05-19 22:49:45');

-- ----------------------------
-- Table structure for `yyjj`
-- ----------------------------
DROP TABLE IF EXISTS `yyjj`;
CREATE TABLE `yyjj` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `remark` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yyjj
-- ----------------------------
INSERT INTO `yyjj` VALUES ('1', '医院管理系统');
