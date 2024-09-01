/*
 Navicat Premium Data Transfer

 Source Server         : tifengchaoren
 Source Server Type    : MySQL
 Source Server Version : 80036
 Source Host           : localhost:3306
 Source Schema         : hospital_manage

 Target Server Type    : MySQL
 Target Server Version : 80036
 File Encoding         : 65001

 Date: 01/09/2024 20:36:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `admin_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `role` int(0) NULL DEFAULT 0 COMMENT '默认0:管理员',
  `admin_acc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '账号',
  `admin_pwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`admin_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for doctor
-- ----------------------------
DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor`  (
  `doc_id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `doc_pwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `major` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '从事专业',
  `Section_id` int(0) NOT NULL COMMENT '所属科室id',
  `degree` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学历',
  `job` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '职称',
  `role` int(0) NULL DEFAULT 1 COMMENT '默认1：权限医生',
  `doc_acc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '医生账号',
  PRIMARY KEY (`doc_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for drug
-- ----------------------------
DROP TABLE IF EXISTS `drug`;
CREATE TABLE `drug`  (
  `drug_id` int(0) NOT NULL AUTO_INCREMENT,
  `drug_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `function` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `drug_price` decimal(10, 2) NULL DEFAULT NULL,
  `inbound_date` datetime(0) NULL DEFAULT NULL COMMENT '入库信息',
  `expiration_date` datetime(0) NULL DEFAULT NULL COMMENT '有效期',
  `stock_quantity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '库存数量 ',
  PRIMARY KEY (`drug_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for medical_record
-- ----------------------------
DROP TABLE IF EXISTS `medical_record`;
CREATE TABLE `medical_record`  (
  `medical_record_id` int(0) NOT NULL AUTO_INCREMENT,
  `patient_id` int(0) NULL DEFAULT NULL,
  `doctor_id` int(0) NULL DEFAULT NULL,
  `gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '性别',
  `age` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '年龄',
  `treatment_plan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '治疗方案',
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`medical_record_id`) USING BTREE,
  INDEX `med_doc_id`(`doctor_id`) USING BTREE,
  INDEX `med_patient_id`(`patient_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for medical_record_drug
-- ----------------------------
DROP TABLE IF EXISTS `medical_record_drug`;
CREATE TABLE `medical_record_drug`  (
  `medical_record_id` int(0) NOT NULL,
  `drug_id` int(0) NOT NULL,
  PRIMARY KEY (`medical_record_id`, `drug_id`) USING BTREE,
  INDEX `drug_id`(`drug_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for patient
-- ----------------------------
DROP TABLE IF EXISTS `patient`;
CREATE TABLE `patient`  (
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `patient_pwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `role` int(0) NULL DEFAULT 2 COMMENT '默认：2患者',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `patient_id` int(0) NOT NULL AUTO_INCREMENT,
  `id` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '身份证号',
  `age` int(0) NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `patient_acc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '账号',
  `balance` int(0) NULL DEFAULT NULL COMMENT '账户余额',
  PRIMARY KEY (`patient_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rate
-- ----------------------------
DROP TABLE IF EXISTS `rate`;
CREATE TABLE `rate`  (
  `rate_id` int(0) NOT NULL AUTO_INCREMENT,
  `rating` decimal(3, 1) NULL DEFAULT NULL COMMENT '星级',
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `doc_id` int(0) NOT NULL,
  `patient_id` int(0) NOT NULL,
  `rate_state` int(0) NOT NULL COMMENT '审核状态：0未审核，1通过，2未通过',
  `rate_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`rate_id`) USING BTREE,
  INDEX `rate_doc_id`(`doc_id`) USING BTREE,
  INDEX `rate_patient_id`(`patient_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for registered
-- ----------------------------
DROP TABLE IF EXISTS `registered`;
CREATE TABLE `registered`  (
  `registration_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '挂号',
  `doc_id` int(0) NULL DEFAULT NULL,
  `patient_id` int(0) NOT NULL,
  `fee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '所需的费用',
  `status` int(0) NULL DEFAULT NULL COMMENT '挂号的状态，比如“已挂号”0、“已完成”1、“已取消2”等',
  `registration_time` datetime(0) NULL DEFAULT NULL COMMENT '挂号发生的日期和时间',
  `appointment_date` date NULL DEFAULT NULL COMMENT '病人预约的就诊日期',
  `timeframe` int(0) NULL DEFAULT NULL COMMENT '预约时段，0为上午，1为下午',
  PRIMARY KEY (`registration_id`) USING BTREE,
  INDEX `reg_doc_id`(`doc_id`) USING BTREE,
  INDEX `reg_patient_id`(`patient_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for section
-- ----------------------------
DROP TABLE IF EXISTS `section`;
CREATE TABLE `section`  (
  `sec_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '科室id',
  `sec_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '科室名称',
  `sec_doctor_id` int(0) NULL DEFAULT NULL COMMENT '科室主任id',
  `sec_inform` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '科室介绍',
  PRIMARY KEY (`sec_id`) USING BTREE,
  INDEX `sec_doc_id`(`sec_doctor_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
