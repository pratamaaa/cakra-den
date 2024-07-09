/*
 Navicat Premium Data Transfer

 Source Server         : MYSQL - LOCAL 5
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : localhost:3306
 Source Schema         : cakra

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 24/09/2023 03:06:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for mst_work_units
-- ----------------------------
DROP TABLE IF EXISTS `mst_work_units`;
CREATE TABLE `mst_work_units`  (
  `work_unit_id` int NOT NULL AUTO_INCREMENT,
  `work_unit_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `work_unit_parent_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `work_unit_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `work_unit_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `work_unit_sort` int NULL DEFAULT NULL,
  `work_unit_create_by` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `work_unit_create_date` datetime NULL DEFAULT NULL,
  `work_unit_update_by` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `work_unit_update_date` datetime NULL DEFAULT NULL,
  `work_unit_log_uuid` int NULL DEFAULT NULL,
  `work_unit_status` int NULL DEFAULT NULL,
  PRIMARY KEY (`work_unit_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mst_work_units
-- ----------------------------
INSERT INTO `mst_work_units` VALUES (1, '261b36ee-5a41-11ee-971e-f4a4757ae8c3', '0', 'SETJEN DEN', 'SEKRETARIS JENDERAL DEWAN ENERGI NASIONAL', 1, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `mst_work_units` VALUES (2, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '261b36ee-5a41-11ee-971e-f4a4757ae8c3', 'BIRO UMUM', 'BIRO UMUM', 1, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `mst_work_units` VALUES (3, '261b3744-5a41-11ee-971e-f4a4757ae8c3', '261b36ee-5a41-11ee-971e-f4a4757ae8c3', 'BIRO FKEP', 'BIRO FASILITASI KEBIJAKAN ENERGI DAN PERSIDANGAN', 2, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `mst_work_units` VALUES (4, '261b3748-5a41-11ee-971e-f4a4757ae8c3', '261b36ee-5a41-11ee-971e-f4a4757ae8c3', 'BIRO FPKPE', 'BIRO FASILITASI PENANGGULANGAN KRISIS DAN PENGAWASAN ENERGI', 3, NULL, NULL, NULL, NULL, NULL, 1);

-- ----------------------------
-- Table structure for sys_access
-- ----------------------------
DROP TABLE IF EXISTS `sys_access`;
CREATE TABLE `sys_access`  (
  `access_id` int NOT NULL AUTO_INCREMENT,
  `access_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `access_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `access_is_admin` int NULL DEFAULT NULL,
  `access_create_by` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `access_create_date` datetime NULL DEFAULT NULL,
  `access_update_by` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `access_update_date` datetime NULL DEFAULT NULL,
  `access_log_uuid` int NULL DEFAULT NULL,
  `access_status` int NULL DEFAULT NULL,
  PRIMARY KEY (`access_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_access
-- ----------------------------
INSERT INTO `sys_access` VALUES (1, '5d0a9005-5582-11ee-a558-f4a4757ae8c3', 'Administrator', 1, NULL, NULL, NULL, NULL, NULL, 1);

-- ----------------------------
-- Table structure for sys_access_detail
-- ----------------------------
DROP TABLE IF EXISTS `sys_access_detail`;
CREATE TABLE `sys_access_detail`  (
  `access_detail_id` int NOT NULL AUTO_INCREMENT,
  `access_detail_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `access_detail_access_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `access_detail_menu_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `access_detail_read` int NULL DEFAULT NULL,
  `access_detail_create` int NULL DEFAULT NULL,
  `access_detail_update` int NULL DEFAULT NULL,
  `access_detail_delete` int NULL DEFAULT NULL,
  `access_detail_approve` int NULL DEFAULT NULL,
  `access_detail_create_by` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `access_detail_create_date` datetime NULL DEFAULT NULL,
  `access_detail_update_by` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `access_detail_update_date` datetime NULL DEFAULT NULL,
  `access_detail_log_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `access_detail_status` int NULL DEFAULT NULL,
  PRIMARY KEY (`access_detail_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_access_detail
-- ----------------------------
INSERT INTO `sys_access_detail` VALUES (1, 'a683c611-5591-11ee-a558-f4a4757ae8c3', '5d0a9005-5582-11ee-a558-f4a4757ae8c3', '8d78217e-5591-11ee-a558-f4a4757ae8c3', 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_access_detail` VALUES (2, 'a683c626-5591-11ee-a558-f4a4757ae8c3', '5d0a9005-5582-11ee-a558-f4a4757ae8c3', '8d782195-5591-11ee-a558-f4a4757ae8c3', 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_access_detail` VALUES (3, 'a683c629-5591-11ee-a558-f4a4757ae8c3', '5d0a9005-5582-11ee-a558-f4a4757ae8c3', '8d782199-5591-11ee-a558-f4a4757ae8c3', 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_access_detail` VALUES (4, 'a683c62c-5591-11ee-a558-f4a4757ae8c3', '5d0a9005-5582-11ee-a558-f4a4757ae8c3', '8d78219d-5591-11ee-a558-f4a4757ae8c3', 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_access_detail` VALUES (5, 'a683c62f-5591-11ee-a558-f4a4757ae8c3', '5d0a9005-5582-11ee-a558-f4a4757ae8c3', '8d7821a0-5591-11ee-a558-f4a4757ae8c3', 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_access_detail` VALUES (6, 'a683c632-5591-11ee-a558-f4a4757ae8c3', '5d0a9005-5582-11ee-a558-f4a4757ae8c3', '8d7821a4-5591-11ee-a558-f4a4757ae8c3', 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_access_detail` VALUES (7, 'a683c634-5591-11ee-a558-f4a4757ae8c3', '5d0a9005-5582-11ee-a558-f4a4757ae8c3', '8d7821a6-5591-11ee-a558-f4a4757ae8c3', 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_access_detail` VALUES (8, 'a683c636-5591-11ee-a558-f4a4757ae8c3', '5d0a9005-5582-11ee-a558-f4a4757ae8c3', '8d7821a9-5591-11ee-a558-f4a4757ae8c3', 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_access_detail` VALUES (9, 'e71b22af-579f-11ee-b087-f4a4757ae8c3', '5d0a9005-5582-11ee-a558-f4a4757ae8c3', 'e71b2266-579f-11ee-b087-f4a4757ae8c3', 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_access_detail` VALUES (10, 'e71b22b3-579f-11ee-b087-f4a4757ae8c3', '5d0a9005-5582-11ee-a558-f4a4757ae8c3', 'e71b22a7-579f-11ee-b087-f4a4757ae8c3', 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_access_detail` VALUES (11, '31d0babe-57b0-11ee-b087-f4a4757ae8c3', '5d0a9005-5582-11ee-a558-f4a4757ae8c3', '18de19d9-57b0-11ee-b087-f4a4757ae8c3', 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_access_detail` VALUES (12, '31d0bad7-57b0-11ee-b087-f4a4757ae8c3', '5d0a9005-5582-11ee-a558-f4a4757ae8c3', '18de19f2-57b0-11ee-b087-f4a4757ae8c3', 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_access_detail` VALUES (13, '98bcdbf5-57b0-11ee-b087-f4a4757ae8c3', '5d0a9005-5582-11ee-a558-f4a4757ae8c3', '72d90376-57b0-11ee-b087-f4a4757ae8c3', 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_access_detail` VALUES (14, 'd2fbf5d0-57b0-11ee-b087-f4a4757ae8c3', '5d0a9005-5582-11ee-a558-f4a4757ae8c3', 'c99ce7bc-57b0-11ee-b087-f4a4757ae8c3', 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, 1);

-- ----------------------------
-- Table structure for sys_menus
-- ----------------------------
DROP TABLE IF EXISTS `sys_menus`;
CREATE TABLE `sys_menus`  (
  `menu_id` int NOT NULL AUTO_INCREMENT,
  `menu_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `menu_parent_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `menu_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `menu_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `menu_controller` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `menu_folder` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `menu_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `menu_sort` int NULL DEFAULT NULL,
  `menu_create_by` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `menu_create_date` datetime NULL DEFAULT NULL,
  `menu_update_by` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `menu_update_date` datetime NULL DEFAULT NULL,
  `menu_log_uuid` int NULL DEFAULT NULL,
  `menu_status` int NULL DEFAULT NULL,
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menus
-- ----------------------------
INSERT INTO `sys_menus` VALUES (1, '8d78217e-5591-11ee-a558-f4a4757ae8c3', '0', 'Dashboard', 'home', 'home', NULL, 'ph-house', 1, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_menus` VALUES (2, '8d782195-5591-11ee-a558-f4a4757ae8c3', '0', 'Detail Realisasi', 'detailrealisasi', 'detailrealisasi', NULL, 'ph-currency-circle-dollar ', 2, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_menus` VALUES (3, '8d782199-5591-11ee-a558-f4a4757ae8c3', '0', 'Realisasi PNBP', NULL, NULL, NULL, 'ph-note-pencil', 9, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_menus` VALUES (4, '8d78219d-5591-11ee-a558-f4a4757ae8c3', '8d782199-5591-11ee-a558-f4a4757ae8c3', 'Provinsi', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menus` VALUES (5, '8d7821a0-5591-11ee-a558-f4a4757ae8c3', '8d782199-5591-11ee-a558-f4a4757ae8c3', 'Kota', 'master/kota', 'kota', 'master', NULL, 2, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menus` VALUES (6, '8d7821a4-5591-11ee-a558-f4a4757ae8c3', '8d782199-5591-11ee-a558-f4a4757ae8c3', 'Universitas', NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menus` VALUES (7, '8d7821a6-5591-11ee-a558-f4a4757ae8c3', '8d782199-5591-11ee-a558-f4a4757ae8c3', 'Fakultas', NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menus` VALUES (8, '8d7821a9-5591-11ee-a558-f4a4757ae8c3', '8d782199-5591-11ee-a558-f4a4757ae8c3', 'Lokasi Ujian', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menus` VALUES (9, 'e71b2266-579f-11ee-b087-f4a4757ae8c3', '8d782199-5591-11ee-a558-f4a4757ae8c3', 'Berkas Pendaftaran', NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menus` VALUES (10, 'e71b22a7-579f-11ee-b087-f4a4757ae8c3', '0', 'Pengaturan', NULL, NULL, NULL, 'ph-wrench', 10, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menus` VALUES (11, '18de19d9-57b0-11ee-b087-f4a4757ae8c3', 'e71b22a7-579f-11ee-b087-f4a4757ae8c3', 'Hak Akses', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menus` VALUES (12, '18de19f2-57b0-11ee-b087-f4a4757ae8c3', 'e71b22a7-579f-11ee-b087-f4a4757ae8c3', 'Pengguna', NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menus` VALUES (13, '72d90376-57b0-11ee-b087-f4a4757ae8c3', '0', 'Detail Per Biro', 'detailbiro', 'detailbiro', NULL, 'ph-hard-drives ', 3, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_menus` VALUES (14, 'c99ce7bc-57b0-11ee-b087-f4a4757ae8c3', '0', 'Anggaran APK DEN', NULL, NULL, NULL, 'ph-user-list ', 4, NULL, NULL, NULL, NULL, NULL, 1);

-- ----------------------------
-- Table structure for sys_users
-- ----------------------------
DROP TABLE IF EXISTS `sys_users`;
CREATE TABLE `sys_users`  (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_create_by` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_create_date` datetime NULL DEFAULT NULL,
  `user_update_by` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_update_date` datetime NULL DEFAULT NULL,
  `user_log_uuid` int NULL DEFAULT NULL,
  `user_status` int NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_users
-- ----------------------------
INSERT INTO `sys_users` VALUES (1, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', 'linda', NULL, NULL, NULL, NULL, NULL, NULL, 1);

-- ----------------------------
-- Table structure for trx_exam_period
-- ----------------------------
DROP TABLE IF EXISTS `trx_exam_period`;
CREATE TABLE `trx_exam_period`  (
  `exam_period_id` int NOT NULL AUTO_INCREMENT,
  `exam_period_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'uuid()',
  `exam_period_date` date NULL DEFAULT NULL,
  `exam_period_register_start_date` date NULL DEFAULT NULL,
  `exam_period_register_end_date` date NULL DEFAULT NULL,
  `exam_period_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `exam_period_create_by` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `exam_period_create_date` datetime NULL DEFAULT NULL,
  `exam_period_update_by` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `exam_period_update_date` datetime NULL DEFAULT NULL,
  `exam_period_log_uuid` int NULL DEFAULT NULL,
  `exam_period_status` int NULL DEFAULT NULL,
  PRIMARY KEY (`exam_period_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of trx_exam_period
-- ----------------------------
INSERT INTO `trx_exam_period` VALUES (1, '67a5e407-5855-11ee-a05a-f4a4757ae8c3', '2023-12-01', '2023-10-16', '2023-11-30', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `trx_exam_period` VALUES (2, '5309281f-585e-11ee-a05a-f4a4757ae8c3', '2023-12-01', '2023-10-16', '2023-11-30', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `trx_exam_period` VALUES (3, '53427cef-585e-11ee-a05a-f4a4757ae8c3', '2023-12-01', '2023-10-16', '2023-11-30', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `trx_exam_period` VALUES (4, '5381b006-585e-11ee-a05a-f4a4757ae8c3', '2023-12-01', '2023-10-16', '2023-11-30', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `trx_exam_period` VALUES (5, '53c56b46-585e-11ee-a05a-f4a4757ae8c3', '2023-12-01', '2023-10-16', '2023-11-30', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `trx_exam_period` VALUES (6, '5402ad53-585e-11ee-a05a-f4a4757ae8c3', '2023-12-01', '2023-10-16', '2023-11-30', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `trx_exam_period` VALUES (7, '543e3b53-585e-11ee-a05a-f4a4757ae8c3', '2023-12-01', '2023-10-16', '2023-11-30', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `trx_exam_period` VALUES (8, '5485928e-585e-11ee-a05a-f4a4757ae8c3', '2023-12-01', '2023-10-16', '2023-11-30', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `trx_exam_period` VALUES (9, '54c02406-585e-11ee-a05a-f4a4757ae8c3', '2023-12-01', '2023-10-16', '2023-11-30', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `trx_exam_period` VALUES (10, '54fb6936-585e-11ee-a05a-f4a4757ae8c3', '2023-12-01', '2023-10-16', '2023-11-30', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `trx_exam_period` VALUES (11, '553fd2e0-585e-11ee-a05a-f4a4757ae8c3', '2023-12-01', '2023-10-16', '2023-11-30', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `trx_exam_period` VALUES (12, '558c94a1-585e-11ee-a05a-f4a4757ae8c3', '2023-12-01', '2023-10-16', '2023-11-30', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `trx_exam_period` VALUES (13, '5619c70b-585e-11ee-a05a-f4a4757ae8c3', '2023-12-01', '2023-10-16', '2023-11-30', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `trx_exam_period` VALUES (14, '4b4ac7b7-7c7f-4de0-b7fe-fb8c236487fa', '2023-09-23', '2023-09-01', '2023-10-31', 'test', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2023-09-23 02:21:29', NULL, NULL, NULL, 1);
INSERT INTO `trx_exam_period` VALUES (15, '0998e4c6-28a9-4a29-8924-881083e9c867', '2023-09-01', '2023-09-08', '2023-10-14', 'asas', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2023-09-23 02:36:04', NULL, NULL, NULL, 1);
INSERT INTO `trx_exam_period` VALUES (16, '8e682d4c-5fac-4334-a33f-6a031a80217e', '2023-09-01', '2023-09-01', '2023-10-19', NULL, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2023-09-23 02:36:52', NULL, NULL, NULL, 1);
INSERT INTO `trx_exam_period` VALUES (17, '305b25ae-bf33-4a9a-ab06-bcd128b3c075', '2023-09-01', '2023-09-15', '2023-10-26', 'sas', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2023-09-23 02:37:43', NULL, NULL, NULL, 1);
INSERT INTO `trx_exam_period` VALUES (18, '0dce4d9e-1654-4e70-a562-f6e36aa2a361', '2023-09-01', '2023-09-14', '2023-10-24', 'aaa', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2023-09-23 02:45:15', NULL, NULL, NULL, 1);
INSERT INTO `trx_exam_period` VALUES (19, 'b4eddba6-cb25-4510-9f06-33ceeb211744', '2023-09-01', '2023-09-01', '2023-10-24', 'aaaa', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2023-09-23 02:50:34', NULL, NULL, NULL, 1);
INSERT INTO `trx_exam_period` VALUES (20, 'ca8f96f9-868f-4d44-8c63-eababfe4baff', '2023-09-01', '2023-09-07', '2023-10-27', NULL, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2023-09-23 02:51:44', NULL, NULL, NULL, 1);
INSERT INTO `trx_exam_period` VALUES (21, '81077090-7e4d-40b4-b74f-c1ef517b74e3', '2023-09-06', '2023-09-07', '2023-10-17', 'aa', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2023-09-23 02:54:21', NULL, NULL, NULL, 1);
INSERT INTO `trx_exam_period` VALUES (22, '7fd39e48-f9dc-4829-a043-d4c1650749ed', '2023-09-06', '2023-09-07', '2023-10-18', NULL, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2023-09-23 02:55:48', NULL, NULL, NULL, 1);
INSERT INTO `trx_exam_period` VALUES (23, '993523da-86f2-421c-b0f4-6efb70049559', '2023-09-06', '2023-09-15', '2023-10-18', NULL, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2023-09-23 02:57:05', NULL, NULL, NULL, 1);
INSERT INTO `trx_exam_period` VALUES (24, 'a7f49b0d-c40d-4978-8c14-4b70dc60cec9', '2023-09-01', '2023-09-13', '2023-10-19', 'asas', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2023-09-23 02:58:54', NULL, NULL, NULL, 1);

-- ----------------------------
-- Table structure for trx_work_programs
-- ----------------------------
DROP TABLE IF EXISTS `trx_work_programs`;
CREATE TABLE `trx_work_programs`  (
  `work_program_id` int NOT NULL AUTO_INCREMENT,
  `work_program_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `work_program_year` int NULL DEFAULT NULL,
  `work_program_parent_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `work_program_work_unit_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `work_program_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `work_program_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `work_program_description` varchar(4400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `work_program_create_by` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `work_program_create_date` datetime NULL DEFAULT NULL,
  `work_program_update_by` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `work_program_update_date` datetime NULL DEFAULT NULL,
  `work_program_log_uuid` int NULL DEFAULT NULL,
  `work_program_status` int NULL DEFAULT NULL,
  PRIMARY KEY (`work_program_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of trx_work_programs
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
