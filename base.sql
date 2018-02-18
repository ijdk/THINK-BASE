/*
Navicat MySQL Data Transfer

Source Server         : phpstydy
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : base

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-02-18 16:16:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tglx_access`
-- ----------------------------
DROP TABLE IF EXISTS `tglx_access`;
CREATE TABLE `tglx_access` (
  `role_id` smallint(6) unsigned NOT NULL,
  `node_id` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) NOT NULL,
  `module` varchar(50) DEFAULT NULL,
  KEY `groupId` (`role_id`),
  KEY `nodeId` (`node_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tglx_access
-- ----------------------------

-- ----------------------------
-- Table structure for `tglx_action`
-- ----------------------------
DROP TABLE IF EXISTS `tglx_action`;
CREATE TABLE `tglx_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text NOT NULL COMMENT '行为规则',
  `log` text NOT NULL COMMENT '日志规则',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统行为表';

-- ----------------------------
-- Records of tglx_action
-- ----------------------------
INSERT INTO `tglx_action` VALUES ('1', 'user_login', '用户登录', '积分+10，每天一次', 'table:member|field:score|condition:uid={$self} AND status>-1|rule:score+10|cycle:24|max:1;', '[user|get_nickname]在[time|time_format]登录了后台', '1', '1', '1387181220');

-- ----------------------------
-- Table structure for `tglx_action_log`
-- ----------------------------
DROP TABLE IF EXISTS `tglx_action_log`;
CREATE TABLE `tglx_action_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  PRIMARY KEY (`id`),
  KEY `action_ip_ix` (`action_ip`),
  KEY `action_id_ix` (`action_id`),
  KEY `user_id_ix` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表';

-- ----------------------------
-- Records of tglx_action_log
-- ----------------------------
INSERT INTO `tglx_action_log` VALUES ('5', '1', '1', '2130706433', 'admin', '1', '在登录了后台', '1', '1518891236');
INSERT INTO `tglx_action_log` VALUES ('6', '1', '1', '2130706433', 'admin', '1', '在登录了后台', '1', '1518897511');
INSERT INTO `tglx_action_log` VALUES ('7', '1', '1', '2130706433', 'admin', '1', '在登录了后台', '1', '1518897742');
INSERT INTO `tglx_action_log` VALUES ('8', '1', '1', '2130706433', 'admin', '1', '在登录了后台', '1', '1518941709');

-- ----------------------------
-- Table structure for `tglx_admin`
-- ----------------------------
DROP TABLE IF EXISTS `tglx_admin`;
CREATE TABLE `tglx_admin` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `account` varchar(64) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `password` char(32) NOT NULL,
  `last_login_time` int(11) unsigned DEFAULT '0',
  `last_login_ip` varchar(40) DEFAULT NULL,
  `login_count` mediumint(8) unsigned DEFAULT '0',
  `verify` varchar(32) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `remark` varchar(255) NOT NULL,
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  `type_id` tinyint(2) unsigned DEFAULT '0',
  `info` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`account`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tglx_admin
-- ----------------------------
INSERT INTO `tglx_admin` VALUES ('1', 'administrator', '超级管理员', 'b14f5d41788048e5180100ac8b340916', '1518941709', '2130706433', '0', null, '1620016116@qq.com', '', '0', '0', '1', '0', '');

-- ----------------------------
-- Table structure for `tglx_member`
-- ----------------------------
DROP TABLE IF EXISTS `tglx_member`;
CREATE TABLE `tglx_member` (
  `id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tglx_member
-- ----------------------------

-- ----------------------------
-- Table structure for `tglx_member_data`
-- ----------------------------
DROP TABLE IF EXISTS `tglx_member_data`;
CREATE TABLE `tglx_member_data` (
  `id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tglx_member_data
-- ----------------------------

-- ----------------------------
-- Table structure for `tglx_node`
-- ----------------------------
DROP TABLE IF EXISTS `tglx_node`;
CREATE TABLE `tglx_node` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `remark` varchar(255) DEFAULT NULL,
  `sort` smallint(6) unsigned DEFAULT NULL,
  `pid` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `level` (`level`),
  KEY `pid` (`pid`),
  KEY `status` (`status`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tglx_node
-- ----------------------------

-- ----------------------------
-- Table structure for `tglx_role`
-- ----------------------------
DROP TABLE IF EXISTS `tglx_role`;
CREATE TABLE `tglx_role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `pid` smallint(6) DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tglx_role
-- ----------------------------

-- ----------------------------
-- Table structure for `tglx_role_user`
-- ----------------------------
DROP TABLE IF EXISTS `tglx_role_user`;
CREATE TABLE `tglx_role_user` (
  `role_id` mediumint(9) unsigned DEFAULT NULL,
  `user_id` char(32) DEFAULT NULL,
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tglx_role_user
-- ----------------------------
