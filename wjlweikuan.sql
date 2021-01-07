/*
 Navicat Premium Data Transfer

 Source Server         : 张喜服务器
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : 39.101.142.204:3306
 Source Schema         : wjlweikuan

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 07/01/2021 18:02:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for franchiser
-- ----------------------------
DROP TABLE IF EXISTS `franchiser`;
CREATE TABLE `franchiser`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `company` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司',
  `contact` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of franchiser
-- ----------------------------
INSERT INTO `franchiser` VALUES (1, '尾款', '1233', 'cuit', '12312', '启用', '男');
INSERT INTO `franchiser` VALUES (2, '测试经销商2', '123', '123', '123', '禁用', '女');
INSERT INTO `franchiser` VALUES (3, '测试经销商3', '123', '123', '123', '启用', '男');
INSERT INTO `franchiser` VALUES (4, '测试经销商4', '123', '123', '123', '启用', '男');
INSERT INTO `franchiser` VALUES (5, '123', '3123', '12312', '123', '启用', '男');
INSERT INTO `franchiser` VALUES (6, '23123123', '123', '1231', NULL, '启用', '男');

-- ----------------------------
-- Table structure for operator
-- ----------------------------
DROP TABLE IF EXISTS `operator`;
CREATE TABLE `operator`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `contact` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `company` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of operator
-- ----------------------------
INSERT INTO `operator` VALUES (1, '尾款小分队222', 'weikuan', '110110', 'cuit123123', '禁用', '男');
INSERT INTO `operator` VALUES (2, '尾款小分队', 'weikuan', '110110', 'cuit', '启用', '男');
INSERT INTO `operator` VALUES (3, '尾款小分队二号', 'weikuan', '110110', 'cuit', '启用', '男');
INSERT INTO `operator` VALUES (4, 'string', 'string', 'string', 'string', '启用', '女');
INSERT INTO `operator` VALUES (6, 'string', 'string', 'string', 'string', '启用', 'string');
INSERT INTO `operator` VALUES (8, '123123', '31231231', '23123123', '12312312', '启用', '女');

SET FOREIGN_KEY_CHECKS = 1;
