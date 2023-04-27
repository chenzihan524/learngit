/*
Navicat MySQL Data Transfer

Source Server         : mysq
Source Server Version : 50717
Source Host           : 127.0.0.1:3306
Source Database       : myshop

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2020-06-19 16:52:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tbchushi`
-- ----------------------------
DROP TABLE IF EXISTS `tbchushi`;
CREATE TABLE `tbchushi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tbname` varchar(255) DEFAULT NULL,
  `tblevel` varchar(255) DEFAULT NULL,
  `tbgood` varchar(255) DEFAULT NULL,
  `tbcontents` varchar(255) DEFAULT NULL,
  `imgurl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbchushi
-- ----------------------------
INSERT INTO `tbchushi` VALUES ('6', 'Adhiel', '3', '美式咖啡', '帅气，在摩卡咖啡的领域有着特别的方法和见解，将咖啡与生活融合。', '20200614115922.jpg');
INSERT INTO `tbchushi` VALUES ('7', 'Ethojl', '2', 'Black Coffee', '漂亮，在拿铁咖啡的领域有着特别的方法和见解，将咖啡与生活融合。', '20200615104703.jpg');
INSERT INTO `tbchushi` VALUES ('11', 'Dianel', '3', 'cappuccino', '温柔，在美式咖啡的领域有着特别的方法和见解，将咖啡与生活融合。', '20200615102822.jpg');
INSERT INTO `tbchushi` VALUES ('12', 'Xidoner', '1', 'Mocha Coffee', '帅气，在摩卡咖啡的领域有着特别的方法和见解，将咖啡与生活融合。', '20200615104401.jpg');

-- ----------------------------
-- Table structure for `tbguestbook`
-- ----------------------------
DROP TABLE IF EXISTS `tbguestbook`;
CREATE TABLE `tbguestbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `contents` varchar(255) DEFAULT NULL,
  `createtime` varchar(255) DEFAULT NULL,
  `isshow` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbguestbook
-- ----------------------------

-- ----------------------------
-- Table structure for `tbliuyan`
-- ----------------------------
DROP TABLE IF EXISTS `tbliuyan`;
CREATE TABLE `tbliuyan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `truename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbliuyan
-- ----------------------------
INSERT INTO `tbliuyan` VALUES ('21', '12', 'Xidoner在摩卡方面是我很喜欢的！', 'Nelson');
INSERT INTO `tbliuyan` VALUES ('22', '13', '喜欢Ethojl呀，拿铁可以的。', '去稀饭');
INSERT INTO `tbliuyan` VALUES ('23', '14', '其实对于Adhiel的美式我更喜欢E的。', 'Bothan');
INSERT INTO `tbliuyan` VALUES ('24', '16', '喜欢', '李四');

-- ----------------------------
-- Table structure for `tbmember`
-- ----------------------------
DROP TABLE IF EXISTS `tbmember`;
CREATE TABLE `tbmember` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `truename` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbmember
-- ----------------------------
INSERT INTO `tbmember` VALUES ('4', 'user5', '123456', '伍思凯', '15900000001', '成都市高新区XX路3-3-2');
INSERT INTO `tbmember` VALUES ('6', 'user100', '123456', '徐XX', '15112345678', '成都市温江区海科东路');

-- ----------------------------
-- Table structure for `tbnews`
-- ----------------------------
DROP TABLE IF EXISTS `tbnews`;
CREATE TABLE `tbnews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `author` varchar(100) DEFAULT NULL,
  `contents` text,
  `createtime` varchar(100) DEFAULT NULL,
  `typeid` varchar(11) DEFAULT NULL,
  `source` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbnews
-- ----------------------------
INSERT INTO `tbnews` VALUES ('102', '在流量时代怎样做餐饮营销', 'admin', '2019年3月18日，由吉食道食品、申唐产业、翠宏食品、航佳食品、红灯笼食品、智琪食品六家公司共同发起，成都市食品工业协会联合主办的第四届“发现川味”中国餐饮高峰论坛及食材展在成都隆重举行。\r\n据悉，本届食材展汇聚了全国40 家餐饮业供应链企业。活动当天，全国知名餐饮品牌CEO、餐饮加盟门店企业主等上千名代表出席了餐饮高峰论坛，会上嘉宾从餐饮运营、营销、供应链等角度全方位的剖析餐饮行业当前的发展现状和行业前景。\r\n红餐作为战略合作媒体参与了本次活动，为大家进行详细的报道。', '2019-03-18', '1', '吃哪儿网');
INSERT INTO `tbnews` VALUES ('103', '“不忘初心，牢记使命”主题教育工作会议召开', 'admin', '1212', '1212', '1', '校内新闻');

-- ----------------------------
-- Table structure for `tborderhead`
-- ----------------------------
DROP TABLE IF EXISTS `tborderhead`;
CREATE TABLE `tborderhead` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(255) DEFAULT NULL,
  `sname` varchar(255) DEFAULT NULL,
  `stel` varchar(255) DEFAULT NULL,
  `saddress` varchar(255) DEFAULT NULL,
  `sumprice` decimal(11,0) DEFAULT '0',
  `memberid` int(11) DEFAULT NULL,
  `ctime` varchar(255) DEFAULT NULL,
  `ptime` varchar(255) DEFAULT NULL,
  `memo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orderid` (`orderid`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tborderhead
-- ----------------------------
INSERT INTO `tborderhead` VALUES ('19', '20200610091829876000', '汤燕', '15397600032', '11栋', '78', '2', '2020-06-10 09:18:29', '2020-06-10', 'aaaa');
INSERT INTO `tborderhead` VALUES ('20', '20200612164621337575', '张嘻嘻', '123456789', '就断开拉设计费', '40', '10', '2020-06-12 16:46:21', '2020-06-12', '110');
INSERT INTO `tborderhead` VALUES ('21', '20200614180505744283', '1', '1', '1', '57', '10', '2020-06-14 18:05:05', '', '1');
INSERT INTO `tborderhead` VALUES ('22', '20200614183930146167', '', '', '', '98', '10', '2020-06-14 18:39:30', '', '');
INSERT INTO `tborderhead` VALUES ('26', '20200617154919755491', '', '', '', '98', '10', '2020-06-17 15:49:19', '', '');
INSERT INTO `tborderhead` VALUES ('27', '20200618154747039248', '', '', '', '0', '12', '2020-06-18 15:47:47', '', '');
INSERT INTO `tborderhead` VALUES ('28', '20200618162829834085', 'Nelson', '13254897450', '重庆工商', '137', '12', '2020-06-18 16:28:29', '2020-06-18', '时间');
INSERT INTO `tborderhead` VALUES ('29', '20200619154800322488', '1', '1', '1', '49', '14', '2020-06-19 15:48:00', '', '1');
INSERT INTO `tborderhead` VALUES ('30', '20200619164518816410', '李四', '13587456952', '该公司', '98', '16', '2020-06-19 16:45:18', '2020-01-19', '加冰');

-- ----------------------------
-- Table structure for `tborderitems`
-- ----------------------------
DROP TABLE IF EXISTS `tborderitems`;
CREATE TABLE `tborderitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(255) DEFAULT NULL,
  `proid` int(11) DEFAULT NULL,
  `proname` varchar(255) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `procount` int(11) DEFAULT NULL,
  `imgurl` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order` (`orderid`),
  KEY `fk_proid` (`proid`),
  CONSTRAINT `fk_order` FOREIGN KEY (`orderid`) REFERENCES `tborderhead` (`orderid`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tborderitems
-- ----------------------------
INSERT INTO `tborderitems` VALUES ('34', '20200610091829876000', '18', '鱼香肉丝', '28', '2', 'http://localhost:8000/static/uploadimg/20200526150104.jpg');
INSERT INTO `tborderitems` VALUES ('35', '20200610091829876000', '17', '回锅肉', '22', '1', 'http://localhost:8000/static/uploadimg/20200526145801.jpg');
INSERT INTO `tborderitems` VALUES ('36', '20200612164621337575', '22', '手撕面包', '20', '2', 'http://localhost:8000/static/uploadimg/20200612154308.jpg');
INSERT INTO `tborderitems` VALUES ('37', '20200614180505744283', '19', '牛角包', '19', '3', 'http://localhost:8000/static/uploadimg/20200612163621.jpg');
INSERT INTO `tborderitems` VALUES ('38', '20200614183930146167', '23', '美式咖啡', '49', '2', 'http://localhost:8000/static/uploadimg/20200614180913.jpg');
INSERT INTO `tborderitems` VALUES ('41', '20200617154919755491', '23', '美式咖啡', '49', '2', 'http://localhost:8000/static/uploadimg/20200614180913.jpg');
INSERT INTO `tborderitems` VALUES ('42', '20200618162829834085', '27', '气致™冷萃浮乐朵', '49', '2', 'http://localhost:8000/static/uploadimg/20200618152629.jpg');
INSERT INTO `tborderitems` VALUES ('43', '20200618162829834085', '24', '麦芽雪冷萃', '39', '1', 'http://localhost:8000/static/uploadimg/20200618151425.jpg');
INSERT INTO `tborderitems` VALUES ('44', '20200619154800322488', '27', '气致™冷萃浮乐朵', '49', '1', 'http://localhost:8000/static/uploadimg/20200618152629.jpg');
INSERT INTO `tborderitems` VALUES ('45', '20200619164518816410', '27', '气致™冷萃浮乐朵', '49', '2', 'http://localhost:8000/static/uploadimg/20200618152629.jpg');

-- ----------------------------
-- Table structure for `tbproduct`
-- ----------------------------
DROP TABLE IF EXISTS `tbproduct`;
CREATE TABLE `tbproduct` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proname` varchar(255) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `brief` varchar(255) DEFAULT NULL,
  `descriptions` text,
  `address` varchar(255) DEFAULT NULL,
  `istop` int(11) DEFAULT '0',
  `isstar` int(11) DEFAULT '0',
  `imgurl` varchar(255) DEFAULT NULL,
  `typeid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbproduct
-- ----------------------------
INSERT INTO `tbproduct` VALUES ('17', '脏脏bias', '24', '脏的包包', '脏的魔力', '重庆', '0', '0', '20200612163833.jpg', '1');
INSERT INTO `tbproduct` VALUES ('18', '吐司司', '28', '全麦的噢', '全麦粑粑', '重庆', '0', '0', '20200612164354.jpg', '1');
INSERT INTO `tbproduct` VALUES ('24', '麦芽雪冷萃', '39', 'COLD BREW MALT', '冷萃咖啡，双份新西兰进口香草冰淇淋、巧克力味苦味酒，麦芽成分', '重庆', '0', '0', '20200618151425.jpg', '1');
INSERT INTO `tbproduct` VALUES ('25', '阿馥奇朵', '42', 'AFFOGATO', '双份精萃浓缩咖啡，新西兰进口香草冰淇淋', '重庆', '0', '0', '20200618151941.jpg', '1');
INSERT INTO `tbproduct` VALUES ('26', '冷萃浮乐朵', '39', 'COLD BREW FLOAT', '冷萃咖啡，新西兰进口香草冰淇淋', '重庆', '0', '0', '20200618152712.jpg', '1');
INSERT INTO `tbproduct` VALUES ('27', '气致™冷萃浮乐朵', '49', 'NITRO CLOD BREW FLOAT', '气致™冷萃咖啡，新西兰进口香草冰淇淋', '重庆', '0', '0', '20200618152629.jpg', '1');
INSERT INTO `tbproduct` VALUES ('28', '冷萃冰咖啡', '39', 'COLD BREW ', '10多个小时的慢速萃取，带出微甜的巧克力般风味，与特别的柑橘般风味，为你奉上沁甘顺滑的味觉感受。', '重庆', '0', '0', '20200618153129.jpg', '1');
INSERT INTO `tbproduct` VALUES ('29', '轻甜奶油冷萃', '39', 'SWEET CREAM COLD BREW', '在冷萃冰咖啡的基础上，添加香草风味轻奶油。每份轻奶油都是根据西雅图的星巴克咖啡研发团队精心研发的配方新鲜手工调制而成， 使用脱脂奶也更符合现代人的健康生活理念。', '重庆', '0', '0', '20200618153120.jpg', '1');
INSERT INTO `tbproduct` VALUES ('30', '美式咖啡', '38', '来自美国', '美味', '重庆', '0', '0', '20200619164823.jpg', '1');

-- ----------------------------
-- Table structure for `tbshoppingcar`
-- ----------------------------
DROP TABLE IF EXISTS `tbshoppingcar`;
CREATE TABLE `tbshoppingcar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionid` varchar(32) DEFAULT NULL,
  `proname` varchar(255) DEFAULT NULL,
  `proid` int(11) DEFAULT NULL,
  `procount` int(11) DEFAULT NULL,
  `ctime` varchar(255) DEFAULT NULL,
  `imgurl` varchar(255) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbshoppingcar
-- ----------------------------

-- ----------------------------
-- Table structure for `tbusers`
-- ----------------------------
DROP TABLE IF EXISTS `tbusers`;
CREATE TABLE `tbusers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `truename` varchar(20) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbusers
-- ----------------------------
INSERT INTO `tbusers` VALUES ('1', 'admin', '123456', '管理员1', '15397600032', '北京复兴门外大街10086号');
INSERT INTO `tbusers` VALUES ('2', 'user', '123456', '张三', '15397600032', '北京复兴门外大街10086号');
INSERT INTO `tbusers` VALUES ('7', 'feifei', '123456', '郭靖', '15397600032', '北京复兴门外大街10086号');
INSERT INTO `tbusers` VALUES ('8', 'xiangyang', '123456', '刘湘', '15397600032', '襄阳XX号');
INSERT INTO `tbusers` VALUES ('9', 'mr', '123456', '蓉兔子', '15397600032', '北京ZXXX号');
INSERT INTO `tbusers` VALUES ('10', '1', '1', '1', '1', '1');
INSERT INTO `tbusers` VALUES ('11', '2', '2', '2', '2', '2');
INSERT INTO `tbusers` VALUES ('12', '0000', '0000', 'Nelson', '13200000000', '重庆工商大学融智学院');
INSERT INTO `tbusers` VALUES ('13', '136', '136', '去稀饭', '15646123167', '重庆工商');
INSERT INTO `tbusers` VALUES ('14', '124', '124', 'Bothan', '1646366782', '重庆工商');
INSERT INTO `tbusers` VALUES ('15', '', '', '', '', '');
INSERT INTO `tbusers` VALUES ('16', '1388', '123456', '李四', '1368756941', '重庆工商大学融智学院');

-- ----------------------------
-- Table structure for `uilunbo`
-- ----------------------------
DROP TABLE IF EXISTS `uilunbo`;
CREATE TABLE `uilunbo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imgurl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uilunbo
-- ----------------------------
INSERT INTO `uilunbo` VALUES ('8', '20200617143513.png');
INSERT INTO `uilunbo` VALUES ('9', '20200617143520.png');
INSERT INTO `uilunbo` VALUES ('10', '20200617143527.png');

-- ----------------------------
-- View structure for `v_order`
-- ----------------------------
DROP VIEW IF EXISTS `v_order`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_order` AS select `tborderhead`.`sname` AS `sname`,`tborderhead`.`id` AS `id`,`tborderhead`.`orderid` AS `orderid`,`tborderhead`.`stel` AS `stel`,`tborderhead`.`saddress` AS `saddress`,`tborderhead`.`sumprice` AS `sumprice`,`tborderhead`.`memberid` AS `memberid`,`tborderhead`.`ctime` AS `ctime`,`tborderhead`.`ptime` AS `ptime`,`tborderhead`.`memo` AS `memo`,`tborderitems`.`procount` AS `procount`,`tborderitems`.`price` AS `price`,`tborderitems`.`proname` AS `proname`,`tborderitems`.`proid` AS `proid`,`tborderitems`.`imgurl` AS `imgurl` from (`tborderhead` join `tborderitems` on((`tborderhead`.`orderid` = `tborderitems`.`orderid`))) ;
