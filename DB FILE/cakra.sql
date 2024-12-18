/*
 Navicat Premium Dump SQL

 Source Server         : MYSQL - LOCAL 8
 Source Server Type    : MySQL
 Source Server Version : 80027 (8.0.27)
 Source Host           : localhost:3306
 Source Schema         : cakra

 Target Server Type    : MySQL
 Target Server Version : 80027 (8.0.27)
 File Encoding         : 65001

 Date: 18/12/2024 01:17:19
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
  `work_unit_log_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `work_unit_status` int NULL DEFAULT NULL,
  PRIMARY KEY (`work_unit_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_access
-- ----------------------------
INSERT INTO `sys_access` VALUES (1, '5d0a9005-5582-11ee-a558-f4a4757ae8c3', 'Administrator', 1, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_access` VALUES (2, '7c841c7a-b08c-11ee-ad93-f4a4757ae8c3', 'Capaian Kinerja', 1, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_access` VALUES (3, '8558369f-b08c-11ee-ad93-f4a4757ae8c3', 'Realisasi Anggaran', 1, NULL, NULL, NULL, NULL, NULL, 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_access_detail
-- ----------------------------
INSERT INTO `sys_access_detail` VALUES (1, 'a683c611-5591-11ee-a558-f4a4757ae8c3', '5d0a9005-5582-11ee-a558-f4a4757ae8c3', '8d78217e-5591-11ee-a558-f4a4757ae8c3', 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_access_detail` VALUES (2, 'a683c626-5591-11ee-a558-f4a4757ae8c3', '5d0a9005-5582-11ee-a558-f4a4757ae8c3', '48d634f6-b47c-11ee-b641-f4a4757ae8c3', 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_access_detail` VALUES (3, 'a683c629-5591-11ee-a558-f4a4757ae8c3', '5d0a9005-5582-11ee-a558-f4a4757ae8c3', '86b55362-b931-11ee-a348-f4a4757ae8c3', 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_access_detail` VALUES (4, 'a683c62c-5591-11ee-a558-f4a4757ae8c3', '5d0a9005-5582-11ee-a558-f4a4757ae8c3', '8d78219d-5591-11ee-a558-f4a4757ae8c3', 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_access_detail` VALUES (5, 'a683c62f-5591-11ee-a558-f4a4757ae8c3', '5d0a9005-5582-11ee-a558-f4a4757ae8c3', '63b41c22-b94c-11ee-a348-f4a4757ae8c3', 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_access_detail` VALUES (6, 'a683c632-5591-11ee-a558-f4a4757ae8c3', '5d0a9005-5582-11ee-a558-f4a4757ae8c3', '8d7821a4-5591-11ee-a558-f4a4757ae8c3', 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_access_detail` VALUES (7, 'a683c634-5591-11ee-a558-f4a4757ae8c3', '5d0a9005-5582-11ee-a558-f4a4757ae8c3', '8d7821a6-5591-11ee-a558-f4a4757ae8c3', 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_access_detail` VALUES (8, 'a683c636-5591-11ee-a558-f4a4757ae8c3', '5d0a9005-5582-11ee-a558-f4a4757ae8c3', '8d7821a9-5591-11ee-a558-f4a4757ae8c3', 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_access_detail` VALUES (9, 'e71b22af-579f-11ee-b087-f4a4757ae8c3', '5d0a9005-5582-11ee-a558-f4a4757ae8c3', 'e71b2266-579f-11ee-b087-f4a4757ae8c3', 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_access_detail` VALUES (10, 'e71b22b3-579f-11ee-b087-f4a4757ae8c3', '5d0a9005-5582-11ee-a558-f4a4757ae8c3', 'e71b22a7-579f-11ee-b087-f4a4757ae8c3', 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_access_detail` VALUES (11, '31d0babe-57b0-11ee-b087-f4a4757ae8c3', '5d0a9005-5582-11ee-a558-f4a4757ae8c3', '18de19d9-57b0-11ee-b087-f4a4757ae8c3', 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_access_detail` VALUES (12, '31d0bad7-57b0-11ee-b087-f4a4757ae8c3', '5d0a9005-5582-11ee-a558-f4a4757ae8c3', '18de19f2-57b0-11ee-b087-f4a4757ae8c3', 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_access_detail` VALUES (13, '98bcdbf5-57b0-11ee-b087-f4a4757ae8c3', '5d0a9005-5582-11ee-a558-f4a4757ae8c3', '72d90376-57b0-11ee-b087-f4a4757ae8c3', 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_access_detail` VALUES (14, 'd2fbf5d0-57b0-11ee-b087-f4a4757ae8c3', '5d0a9005-5582-11ee-a558-f4a4757ae8c3', 'c99ce7bc-57b0-11ee-b087-f4a4757ae8c3', 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_access_detail` VALUES (15, '0d86be47-b08d-11ee-ad93-f4a4757ae8c3', '8558369f-b08c-11ee-ad93-f4a4757ae8c3', '8d78217e-5591-11ee-a558-f4a4757ae8c3', 1, 1, 1, 1, 1, '1', NULL, '1', NULL, '1', 1);
INSERT INTO `sys_access_detail` VALUES (16, '0d86be53-b08d-11ee-ad93-f4a4757ae8c3', '8558369f-b08c-11ee-ad93-f4a4757ae8c3', '8d782195-5591-11ee-a558-f4a4757ae8c3', 1, 1, 1, 1, 1, '1', NULL, '1', NULL, '1', 1);
INSERT INTO `sys_access_detail` VALUES (17, '0d86be56-b08d-11ee-ad93-f4a4757ae8c3', '8558369f-b08c-11ee-ad93-f4a4757ae8c3', '8d782199-5591-11ee-a558-f4a4757ae8c3', 1, 1, 1, 1, 1, '1', NULL, '1', NULL, '1', 1);
INSERT INTO `sys_access_detail` VALUES (19, '0d86be58-b08d-11ee-ad93-f4a4757ae8c3', '8558369f-b08c-11ee-ad93-f4a4757ae8c3', '72d90376-57b0-11ee-b087-f4a4757ae8c3', 1, 1, 1, 1, 1, '1', NULL, '1', NULL, '1', 1);
INSERT INTO `sys_access_detail` VALUES (20, '0d86be5a-b08d-11ee-ad93-f4a4757ae8c3', '8558369f-b08c-11ee-ad93-f4a4757ae8c3', 'c99ce7bc-57b0-11ee-b087-f4a4757ae8c3', 1, 1, 1, 1, 1, '1', NULL, '1', NULL, '1', 1);
INSERT INTO `sys_access_detail` VALUES (21, '0d86be47-b08d-11ee-ad93-f4a4757ae8c3', '7c841c7a-b08c-11ee-ad93-f4a4757ae8c3', '4a9af4fd-b08f-11ee-ad93-f4a4757ae8c3', 1, 1, 1, 1, 1, '1', NULL, '1', NULL, '1', 1);
INSERT INTO `sys_access_detail` VALUES (22, '48d634a8-b47c-11ee-b641-f4a4757ae8c3', '5d0a9005-5582-11ee-a558-f4a4757ae8c3', '8d7821a0-5591-11ee-a558-f4a4757ae8c3', 1, 1, 1, 1, 1, '1', NULL, '1', NULL, '1', 1);
INSERT INTO `sys_access_detail` VALUES (23, '292f5777-7047-11ef-9d39-a9cf12ed7065', '5d0a9005-5582-11ee-a558-f4a4757ae8c3', '292f56c1-7047-11ef-9d39-a9cf12ed7065', 1, 1, 1, 1, 1, '1', NULL, NULL, NULL, '1', 1);
INSERT INTO `sys_access_detail` VALUES (24, '292f578e-7047-11ef-9d39-a9cf12ed7065', '8558369f-b08c-11ee-ad93-f4a4757ae8c3', '292f5780-7047-11ef-9d39-a9cf12ed7065', 1, 1, 1, 1, 1, '1', NULL, '1', NULL, '1', 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menus
-- ----------------------------
INSERT INTO `sys_menus` VALUES (1, '8d78217e-5591-11ee-a558-f4a4757ae8c3', '0', 'Dashboard', 'realisasianggaran/index', 'realisasianggaran', NULL, 'ph-house', 1, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_menus` VALUES (2, '8d782195-5591-11ee-a558-f4a4757ae8c3', '0', 'Detail Realisasi', 'realisasianggaran/detailrealisasi', 'realisasianggaran/detailrealisasi', NULL, 'ph-currency-circle-dollar ', 2, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_menus` VALUES (3, '8d782199-5591-11ee-a558-f4a4757ae8c3', '0', 'Realisasi PNBP', NULL, NULL, NULL, 'ph-note-pencil', 9, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menus` VALUES (4, '8d78219d-5591-11ee-a558-f4a4757ae8c3', '0', 'Upload', 'upload', 'upload', NULL, 'ph-upload ', 3, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_menus` VALUES (5, '8d7821a0-5591-11ee-a558-f4a4757ae8c3', '0', 'Target Renkas', 'targetrenkas', 'targetrenkas', NULL, 'ph-wrench', 9, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_menus` VALUES (6, '8d7821a4-5591-11ee-a558-f4a4757ae8c3', '8d782199-5591-11ee-a558-f4a4757ae8c3', 'Universitas', NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menus` VALUES (7, '8d7821a6-5591-11ee-a558-f4a4757ae8c3', '8d782199-5591-11ee-a558-f4a4757ae8c3', 'Fakultas', NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menus` VALUES (8, '8d7821a9-5591-11ee-a558-f4a4757ae8c3', '8d782199-5591-11ee-a558-f4a4757ae8c3', 'Lokasi Ujian', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menus` VALUES (9, 'e71b2266-579f-11ee-b087-f4a4757ae8c3', '8d782199-5591-11ee-a558-f4a4757ae8c3', 'Berkas Pendaftaran', NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menus` VALUES (10, 'e71b22a7-579f-11ee-b087-f4a4757ae8c3', '0', 'Pengaturan', NULL, NULL, NULL, 'ph-wrench', 10, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menus` VALUES (11, '18de19d9-57b0-11ee-b087-f4a4757ae8c3', 'e71b22a7-579f-11ee-b087-f4a4757ae8c3', 'Hak Akses', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menus` VALUES (12, '18de19f2-57b0-11ee-b087-f4a4757ae8c3', 'e71b22a7-579f-11ee-b087-f4a4757ae8c3', 'Pengguna', NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menus` VALUES (13, '72d90376-57b0-11ee-b087-f4a4757ae8c3', '0', 'Detail Per Biro', 'realisasianggaran/detailperbiro', 'realisasianggaran/detailperbiro', NULL, 'ph-hard-drives ', 3, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_menus` VALUES (14, 'c99ce7bc-57b0-11ee-b087-f4a4757ae8c3', '0', 'Anggaran APK DEN', 'realisasianggaran/apk', 'realisasianggaran/apk', NULL, 'ph-user-list ', 4, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_menus` VALUES (15, '4a9af4fd-b08f-11ee-ad93-f4a4757ae8c3', '0', 'Dashboard', 'capaiankinerja', 'capaiankinerja/dashboard', NULL, 'ph-house', 1, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_menus` VALUES (16, '48d634f6-b47c-11ee-b641-f4a4757ae8c3', '0', 'Data Dashboard Realisasi', 'dashboard/datarealisasi', 'dashboard/datarealisasi', NULL, 'ph-currency-circle-dollar ', 2, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_menus` VALUES (17, '86b55362-b931-11ee-a348-f4a4757ae8c3', '0', 'Sasaran Strategis', 'sasaranstrategis', 'sasaranstrategis/index', NULL, 'ph-currency-circle-dollar ', 3, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_menus` VALUES (18, '63b41c22-b94c-11ee-a348-f4a4757ae8c3', '0', 'Indikator Kinerja', 'indikatorkinerja', 'indikatorkinerja/index', NULL, 'ph-currency-circle-dollar ', 4, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_menus` VALUES (19, '292f56c1-7047-11ef-9d39-a9cf12ed7065', '0', 'Laporan Realisasi Super', 'upload/laporan_realisasi', 'upload', NULL, 'ph-upload ', 3, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menus` VALUES (20, '292f5780-7047-11ef-9d39-a9cf12ed7065', '0', 'Laporan Realisasi Super', 'upload/laporan_realisasi', 'upload', NULL, 'ph-upload ', 6, NULL, NULL, NULL, NULL, NULL, 0);

-- ----------------------------
-- Table structure for sys_users
-- ----------------------------
DROP TABLE IF EXISTS `sys_users`;
CREATE TABLE `sys_users`  (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_fullname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_create_by` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_create_date` datetime NULL DEFAULT NULL,
  `user_update_by` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_update_date` datetime NULL DEFAULT NULL,
  `user_log_uuid` int NULL DEFAULT NULL,
  `user_status` int NULL DEFAULT NULL,
  `user_access_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_users
-- ----------------------------
INSERT INTO `sys_users` VALUES (1, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', 'Riki Pratama', 'riki@mail.com', '$2y$10$Za/hcZ7X2rX1h1uGYkgpauYJi6sissvLLLBk7R9aFzBmRIbM0DClq', NULL, NULL, NULL, NULL, NULL, 1, '5d0a9005-5582-11ee-a558-f4a4757ae8c3');

-- ----------------------------
-- Table structure for trx_apk
-- ----------------------------
DROP TABLE IF EXISTS `trx_apk`;
CREATE TABLE `trx_apk`  (
  `apk_id` int NOT NULL AUTO_INCREMENT,
  `apk_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `apk_year` int NULL DEFAULT NULL,
  `apk_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `apk_sort` int NULL DEFAULT NULL,
  `apk_create_by` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `apk_create_date` datetime NULL DEFAULT NULL,
  `apk_status` int NULL DEFAULT NULL,
  `apk_log_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`apk_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of trx_apk
-- ----------------------------

-- ----------------------------
-- Table structure for trx_budgets
-- ----------------------------
DROP TABLE IF EXISTS `trx_budgets`;
CREATE TABLE `trx_budgets`  (
  `budget_id` int NOT NULL AUTO_INCREMENT,
  `budget_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `budget_year` int NULL DEFAULT NULL,
  `budget_month` int NULL DEFAULT NULL,
  `budget_work_program_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `budget_plafon` decimal(12, 0) NULL DEFAULT NULL,
  `budget_realization` decimal(12, 0) NULL DEFAULT NULL,
  `budget_create_by` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `budget_create_date` datetime NULL DEFAULT NULL,
  `budget_status` int NULL DEFAULT NULL,
  `budget_log_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`budget_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 112 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of trx_budgets
-- ----------------------------

-- ----------------------------
-- Table structure for trx_dashboard_realisasi
-- ----------------------------
DROP TABLE IF EXISTS `trx_dashboard_realisasi`;
CREATE TABLE `trx_dashboard_realisasi`  (
  `dashboard_realisasi_id` int NOT NULL AUTO_INCREMENT,
  `dashboard_realisasi_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dashboard_realisasi_year` int NULL DEFAULT NULL,
  `dashboard_realisasi_revision_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dashboard_realisasi_pegawai` decimal(12, 0) NULL DEFAULT NULL,
  `dashboard_realisasi_barang` decimal(12, 0) NULL DEFAULT NULL,
  `dashboard_realisasi_modal` decimal(12, 0) NULL DEFAULT NULL,
  `dashboard_realisasi_version` int NULL DEFAULT NULL,
  `dashboard_realisasi_create_by` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dashboard_realisasi_create_date` datetime NULL DEFAULT NULL,
  `dashboard_realisasi_status` int NULL DEFAULT NULL,
  `dashboard_realisasi_log_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dashboard_realisasi_total_belanja` decimal(12, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`dashboard_realisasi_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of trx_dashboard_realisasi
-- ----------------------------

-- ----------------------------
-- Table structure for trx_indikator_kinerja
-- ----------------------------
DROP TABLE IF EXISTS `trx_indikator_kinerja`;
CREATE TABLE `trx_indikator_kinerja`  (
  `indikator_kinerja_id` int NOT NULL AUTO_INCREMENT,
  `indikator_kinerja_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `indikator_kinerja_sasaran_strategis_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `indikator_kinerja_biro_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `indikator_kinerja_sort` int NULL DEFAULT NULL,
  `indikator_kinerja_name` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `indikator_kinerja_satuan` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `indikator_kinerja_target` decimal(12, 2) NULL DEFAULT NULL,
  `indikator_kinerja_realisasi` decimal(12, 2) NULL DEFAULT NULL,
  `indikator_kinerja_create_by` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `indikator_kinerja_create_date` datetime NULL DEFAULT NULL,
  `indikator_kinerja_status` int NULL DEFAULT NULL,
  `indikator_kinerja_log_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`indikator_kinerja_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of trx_indikator_kinerja
-- ----------------------------

-- ----------------------------
-- Table structure for trx_program_apk
-- ----------------------------
DROP TABLE IF EXISTS `trx_program_apk`;
CREATE TABLE `trx_program_apk`  (
  `program_apk_id` int NOT NULL AUTO_INCREMENT,
  `program_apk_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `program_apk_apk_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `program_apk_year` int NULL DEFAULT NULL,
  `program_apk_month` int NULL DEFAULT NULL,
  `program_apk_urian` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `program_apk_pagu` decimal(12, 2) NULL DEFAULT NULL,
  `program_apk_realisasi` decimal(12, 2) NULL DEFAULT NULL,
  `program_apk_create_by` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `program_apk_create_date` datetime NULL DEFAULT NULL,
  `program_apk_status` int NULL DEFAULT NULL,
  `program_apk_log_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`program_apk_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of trx_program_apk
-- ----------------------------

-- ----------------------------
-- Table structure for trx_realisasi_apk
-- ----------------------------
DROP TABLE IF EXISTS `trx_realisasi_apk`;
CREATE TABLE `trx_realisasi_apk`  (
  `realisasi_apk_id` int NOT NULL AUTO_INCREMENT,
  `realisasi_apk_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `realisasi_apk_apk_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `realisasi_apk_year` int NULL DEFAULT NULL,
  `realisasi_apk_month` int NULL DEFAULT NULL,
  `realisasi_apk_urian` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `realisasi_apk_pagu` decimal(12, 2) NULL DEFAULT NULL,
  `realisasi_apk_realisasi` decimal(12, 2) NULL DEFAULT NULL,
  `realisasi_apk_create_by` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `realisasi_apk_create_date` datetime NULL DEFAULT NULL,
  `realisasi_apk_status` int NULL DEFAULT NULL,
  `realisasi_apk_log_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`realisasi_apk_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of trx_realisasi_apk
-- ----------------------------

-- ----------------------------
-- Table structure for trx_realisasi_iku
-- ----------------------------
DROP TABLE IF EXISTS `trx_realisasi_iku`;
CREATE TABLE `trx_realisasi_iku`  (
  `realisasi_iku_id` int NOT NULL AUTO_INCREMENT,
  `realisasi_iku_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `realisasi_iku_indikator_kinerja_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `realisasi_iku_target` decimal(12, 2) NULL DEFAULT NULL,
  `realisasi_iku_realisasi` decimal(12, 2) NULL DEFAULT NULL,
  `realisasi_iku_create_by` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `realisasi_iku_create_date` datetime NULL DEFAULT NULL,
  `realisasi_iku_status` int NULL DEFAULT NULL,
  `realisasi_iku_log_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`realisasi_iku_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of trx_realisasi_iku
-- ----------------------------

-- ----------------------------
-- Table structure for trx_sasaran_strategis
-- ----------------------------
DROP TABLE IF EXISTS `trx_sasaran_strategis`;
CREATE TABLE `trx_sasaran_strategis`  (
  `sasaran_strategis_id` int NOT NULL AUTO_INCREMENT,
  `sasaran_strategis_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sasaran_strategis_year` int NULL DEFAULT NULL,
  `sasaran_strategis_name` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sasaran_strategis_sort` int NULL DEFAULT NULL,
  `sasaran_strategis_create_by` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sasaran_strategis_create_date` datetime NULL DEFAULT NULL,
  `sasaran_strategis_status` int NULL DEFAULT NULL,
  `sasaran_strategis_log_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sasaran_strategis_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of trx_sasaran_strategis
-- ----------------------------

-- ----------------------------
-- Table structure for trx_sppd
-- ----------------------------
DROP TABLE IF EXISTS `trx_sppd`;
CREATE TABLE `trx_sppd`  (
  `sppd_id` int NOT NULL AUTO_INCREMENT,
  `sppd_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sppd_year` int NULL DEFAULT NULL,
  `sppd_month` int NULL DEFAULT NULL,
  `sppd_work_unit_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sppd_pegawai` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sppd_barang` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sppd_modal` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sppd_create_by` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sppd_create_date` datetime NULL DEFAULT NULL,
  `sppd_status` int NULL DEFAULT NULL,
  `sppd_log_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sppd_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of trx_sppd
-- ----------------------------

-- ----------------------------
-- Table structure for trx_target
-- ----------------------------
DROP TABLE IF EXISTS `trx_target`;
CREATE TABLE `trx_target`  (
  `target_id` int NOT NULL AUTO_INCREMENT,
  `target_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `target_work_unit_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `target_year` int NULL DEFAULT NULL,
  `target_month` int NULL DEFAULT NULL,
  `target_value` decimal(12, 0) NULL DEFAULT NULL,
  `target_value_percent` decimal(13, 10) NULL DEFAULT NULL,
  `target_value_percent_1` decimal(13, 10) NULL DEFAULT NULL,
  `target_value_percent_2` decimal(13, 10) NULL DEFAULT NULL,
  `target_value_percent_3` decimal(13, 10) NULL DEFAULT NULL,
  `target_value_percent_4` decimal(13, 10) NULL DEFAULT NULL,
  `target_value_percent_5` decimal(13, 10) NULL DEFAULT NULL,
  `target_value_percent_6` decimal(13, 10) NULL DEFAULT NULL,
  `target_value_percent_7` decimal(13, 10) NULL DEFAULT NULL,
  `target_value_percent_8` decimal(13, 10) NULL DEFAULT NULL,
  `target_value_percent_9` decimal(13, 10) NULL DEFAULT NULL,
  `target_value_percent_10` decimal(13, 10) NULL DEFAULT NULL,
  `target_value_percent_11` decimal(13, 10) NULL DEFAULT NULL,
  `target_value_percent_12` decimal(13, 10) NULL DEFAULT NULL,
  `target_create_by` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `target_create_date` datetime NULL DEFAULT NULL,
  `target_status` int NULL DEFAULT NULL,
  `target_log_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`target_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of trx_target
-- ----------------------------
INSERT INTO `trx_target` VALUES (1, 'e88dbbb2-6777-44c9-9eff-db07cf866f05', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 98.9418729961, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 17:59:19', 1, NULL);
INSERT INTO `trx_target` VALUES (2, 'c1f097bb-c908-431e-94df-ae7a91bbbbd4', '261b3744-5a41-11ee-971e-f4a4757ae8c3', 2024, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.5755080245, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 17:59:19', 1, NULL);
INSERT INTO `trx_target` VALUES (3, 'c87a5523-1306-4e1b-a7dd-4ba28474307c', '261b3748-5a41-11ee-971e-f4a4757ae8c3', 2024, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.0657741292, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 17:59:19', 1, NULL);

-- ----------------------------
-- Table structure for trx_upload
-- ----------------------------
DROP TABLE IF EXISTS `trx_upload`;
CREATE TABLE `trx_upload`  (
  `upload_id` int NOT NULL AUTO_INCREMENT,
  `upload_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `upload_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `upload_file_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `upload_create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `upload_create_date` datetime NULL DEFAULT NULL,
  `upload_status` int NULL DEFAULT NULL,
  `upload_log_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `upload_year` int NULL DEFAULT NULL,
  `upload_month` int NULL DEFAULT NULL,
  PRIMARY KEY (`upload_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of trx_upload
-- ----------------------------
INSERT INTO `trx_upload` VALUES (1, '032e267b-61b9-4846-9efa-1c6fd240adba', 'data_inisiasi', 'D:\\WORK\\2023\\GC\\cakra-den\\storage\\app/uploads/hfLIraG1klRaU69QohjtdCbp97IdOM5JyQ084oFZ.xlsx', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:09:52', 1, NULL, 2024, 1);
INSERT INTO `trx_upload` VALUES (2, '9689d1d4-47da-43d7-aae7-58a99f41a4a2', 'data_realisasi', 'D:\\WORK\\2023\\GC\\cakra-den\\storage\\app/uploads/Mfy0LXHAedq1Sga5K0kUKLXwAaXQSPDv7yoKScAQ.xlsx', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:13:20', 1, NULL, 2024, 12);

-- ----------------------------
-- Table structure for trx_upload_apk
-- ----------------------------
DROP TABLE IF EXISTS `trx_upload_apk`;
CREATE TABLE `trx_upload_apk`  (
  `upload_apk_id` int NOT NULL AUTO_INCREMENT,
  `upload_apk_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `upload_apk_year` int NULL DEFAULT NULL,
  `upload_apk_month` int NULL DEFAULT NULL,
  `upload_apk_nama` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `upload_apk_ket` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `upload_apk_pagu` decimal(16, 2) NULL DEFAULT NULL,
  `upload_apk_realisasi` decimal(16, 2) NULL DEFAULT NULL,
  `upload_apk_persentase_realisasi` decimal(16, 2) NULL DEFAULT NULL,
  `upload_apk_sisa` decimal(16, 2) NULL DEFAULT NULL,
  `upload_apk_create_by` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `upload_apk_create_date` datetime NULL DEFAULT NULL,
  `upload_apk_status` int NULL DEFAULT NULL,
  `upload_apk_log_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`upload_apk_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of trx_upload_apk
-- ----------------------------
INSERT INTO `trx_upload_apk` VALUES (1, '83a3a32e-0113-444f-8c5d-ef566ae393cf', 2024, 1, 'Dr. Ir. Agus Puji Prasetyono, M.Eng., IPU', 'DN', 433703000.00, 369664875.00, 85.23, 64038125.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:39', 1, NULL);
INSERT INTO `trx_upload_apk` VALUES (2, 'cf45bf49-a553-4a79-b533-0bf323e0055d', 2024, 1, 'Dr. Ir. Agus Puji Prasetyono, M.Eng., IPU', 'LN', 67216875.00, 25455774.00, 37.87, 41761101.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:39', 1, NULL);
INSERT INTO `trx_upload_apk` VALUES (3, 'b61b2802-7ce0-4d32-8c8a-58aa24f0741e', 2024, 1, 'Dr. Ir. Musri, M.T.', 'DN', 433703000.00, 403783820.00, 93.10, 29919180.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:39', 1, NULL);
INSERT INTO `trx_upload_apk` VALUES (4, 'cfff64f3-c579-4391-ae47-6dc476438077', 2024, 1, 'Dr. Ir. Musri, M.T.', 'LN', 67216875.00, 50773005.00, 75.54, 16443870.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:39', 1, NULL);
INSERT INTO `trx_upload_apk` VALUES (5, '24566116-c2ab-47c2-aea7-24a96e85a708', 2024, 1, 'Dr. Ir. Eri Purnomohadi, M.M.', 'DN', 433703000.00, 366537457.00, 84.51, 67165543.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:39', 1, NULL);
INSERT INTO `trx_upload_apk` VALUES (6, '86b1951d-2da6-4863-9874-88dfe151f205', 2024, 1, 'Dr. Ir. Eri Purnomohadi, M.M.', 'LN', 67216875.00, 94342113.00, 140.35, -27125238.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:39', 1, NULL);
INSERT INTO `trx_upload_apk` VALUES (7, '1e184cbe-8d1c-4bae-bdf5-f3bb98e164ec', 2024, 1, 'Dr. Ir. As Natio Lasman', 'DN', 433703000.00, 408704173.00, 94.24, 24998827.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:39', 1, NULL);
INSERT INTO `trx_upload_apk` VALUES (8, '66a060ed-a9b7-45bc-a281-fefe05db0630', 2024, 1, 'Dr. Ir. As Natio Lasman', 'LN', 67216875.00, 73171899.00, 108.86, -5955024.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:39', 1, NULL);
INSERT INTO `trx_upload_apk` VALUES (9, '8e4bbdb4-2094-488a-ba04-2a14014d1705', 2024, 1, 'Dr. (HC) Yusra Khan, S.H.', 'DN', 433703000.00, 410210102.00, 94.58, 23492898.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:39', 1, NULL);
INSERT INTO `trx_upload_apk` VALUES (10, '26dad87a-cfb3-471d-81b6-f0881ff5c2cf', 2024, 1, 'Dr. (HC) Yusra Khan, S.H.', 'LN', 67216875.00, 94342113.00, 140.35, -27125238.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:39', 1, NULL);
INSERT INTO `trx_upload_apk` VALUES (11, '240ef0a9-04d9-43c3-a364-3f7ced3e2cae', 2024, 1, 'Ir. Agus Pramono', 'DN', 433703000.00, 323257175.00, 74.53, 110445825.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:39', 1, NULL);
INSERT INTO `trx_upload_apk` VALUES (12, '53f46d63-dbc0-4cc0-9d57-904d0928719e', 2024, 1, 'Ir. Agus Pramono', 'LN', 67216875.00, 48363091.00, 71.95, 18853784.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:39', 1, NULL);
INSERT INTO `trx_upload_apk` VALUES (13, 'e8772e6f-d51b-4a04-916c-abaa6ae20455', 2024, 1, 'Dr. Dina Nurul Fitria, SE, MT.', 'DN', 433703000.00, 245636664.00, 56.64, 188066336.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:39', 1, NULL);
INSERT INTO `trx_upload_apk` VALUES (14, '9f2cf8eb-e147-495f-81d4-80019ac29355', 2024, 1, 'Dr. Dina Nurul Fitria, SE, MT.', 'LN', 67216875.00, 73171899.00, 108.86, -5955024.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:39', 1, NULL);
INSERT INTO `trx_upload_apk` VALUES (15, 'ce27df5b-5569-42a2-9519-4d9782292e4a', 2024, 1, 'Ir. Abadi Poernomo, Dipl.Geoth, En.Tech.', 'DN', 433703000.00, 175648028.00, 40.50, 258054972.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:39', 1, NULL);
INSERT INTO `trx_upload_apk` VALUES (16, '95fb2fb8-e518-48af-a1db-618a7b0fc167', 2024, 1, 'Ir. Abadi Poernomo, Dipl.Geoth, En.Tech.', 'LN', 67216875.00, 0.00, 0.00, 67216875.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:39', 1, NULL);
INSERT INTO `trx_upload_apk` VALUES (17, 'b27dca6a-2a99-48f9-90fc-d410ca564c92', 2024, 12, 'Dr. Ir. Agus Puji Prasetyono, M.Eng., IPU', 'DN', 433703000.00, 369664875.00, 85.23, 64038125.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:08', 1, NULL);
INSERT INTO `trx_upload_apk` VALUES (18, '090648f5-faff-4ddb-b222-4b47d20929fe', 2024, 12, 'Dr. Ir. Agus Puji Prasetyono, M.Eng., IPU', 'LN', 67216875.00, 25455774.00, 37.87, 41761101.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:08', 1, NULL);
INSERT INTO `trx_upload_apk` VALUES (19, '4877ecf3-0239-4d55-a9cd-bcf4b2085c3c', 2024, 12, 'Dr. Ir. Musri, M.T.', 'DN', 433703000.00, 403783820.00, 93.10, 29919180.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:08', 1, NULL);
INSERT INTO `trx_upload_apk` VALUES (20, 'ed646ebf-6e53-4671-95ea-956d4424391f', 2024, 12, 'Dr. Ir. Musri, M.T.', 'LN', 67216875.00, 50773005.00, 75.54, 16443870.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:08', 1, NULL);
INSERT INTO `trx_upload_apk` VALUES (21, '00ec0edf-bf80-43c2-a6ec-b8e8c8bc83c2', 2024, 12, 'Dr. Ir. Eri Purnomohadi, M.M.', 'DN', 433703000.00, 366537457.00, 84.51, 67165543.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:08', 1, NULL);
INSERT INTO `trx_upload_apk` VALUES (22, '434dcc81-72ce-4594-a1ee-6138f587af57', 2024, 12, 'Dr. Ir. Eri Purnomohadi, M.M.', 'LN', 67216875.00, 94342113.00, 140.35, -27125238.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:08', 1, NULL);
INSERT INTO `trx_upload_apk` VALUES (23, '1f4286b1-66d5-4f66-9117-c011c71b53f2', 2024, 12, 'Dr. Ir. As Natio Lasman', 'DN', 433703000.00, 408704173.00, 94.24, 24998827.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:08', 1, NULL);
INSERT INTO `trx_upload_apk` VALUES (24, 'f905b81e-1071-49b0-8563-4187fde07ffe', 2024, 12, 'Dr. Ir. As Natio Lasman', 'LN', 67216875.00, 73171899.00, 108.86, -5955024.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:08', 1, NULL);
INSERT INTO `trx_upload_apk` VALUES (25, '05b6600f-ad3f-4d6e-8b24-f2b552b7946d', 2024, 12, 'Dr. (HC) Yusra Khan, S.H.', 'DN', 433703000.00, 410210102.00, 94.58, 23492898.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:08', 1, NULL);
INSERT INTO `trx_upload_apk` VALUES (26, '1f080a96-3cde-489d-ac46-59dd23a0a371', 2024, 12, 'Dr. (HC) Yusra Khan, S.H.', 'LN', 67216875.00, 94342113.00, 140.35, -27125238.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:08', 1, NULL);
INSERT INTO `trx_upload_apk` VALUES (27, '0b5e1aaf-9943-4ecc-9842-48a711527147', 2024, 12, 'Ir. Agus Pramono', 'DN', 433703000.00, 323257175.00, 74.53, 110445825.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:08', 1, NULL);
INSERT INTO `trx_upload_apk` VALUES (28, 'b60ce602-1e3c-4edf-bd10-6566d1b91f16', 2024, 12, 'Ir. Agus Pramono', 'LN', 67216875.00, 48363091.00, 71.95, 18853784.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:08', 1, NULL);
INSERT INTO `trx_upload_apk` VALUES (29, '3cb617ce-fe1f-4258-b457-0d8c817f44a3', 2024, 12, 'Dr. Dina Nurul Fitria, SE, MT.', 'DN', 433703000.00, 245636664.00, 56.64, 188066336.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:08', 1, NULL);
INSERT INTO `trx_upload_apk` VALUES (30, 'ad790e73-deb2-4263-8a53-e9f6b8065eb2', 2024, 12, 'Dr. Dina Nurul Fitria, SE, MT.', 'LN', 67216875.00, 73171899.00, 108.86, -5955024.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:08', 1, NULL);
INSERT INTO `trx_upload_apk` VALUES (31, 'e6a7ed90-04e0-4a1a-bd75-11a54f58d858', 2024, 12, 'Ir. Abadi Poernomo, Dipl.Geoth, En.Tech.', 'DN', 433703000.00, 175648028.00, 40.50, 258054972.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:08', 1, NULL);
INSERT INTO `trx_upload_apk` VALUES (32, 'ba72df97-0ec6-4e58-a5da-657df40211fd', 2024, 12, 'Ir. Abadi Poernomo, Dipl.Geoth, En.Tech.', 'LN', 67216875.00, 0.00, 0.00, 67216875.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:08', 1, NULL);

-- ----------------------------
-- Table structure for trx_upload_belanja
-- ----------------------------
DROP TABLE IF EXISTS `trx_upload_belanja`;
CREATE TABLE `trx_upload_belanja`  (
  `upload_belanja_id` int NOT NULL AUTO_INCREMENT,
  `upload_belanja_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `upload_belanja_year` int NULL DEFAULT NULL,
  `upload_belanja_month` int NULL DEFAULT NULL,
  `upload_belanja_nama` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `upload_belanja_spd_pagu` decimal(16, 2) NULL DEFAULT NULL,
  `upload_belanja_spd_realisasi` decimal(16, 2) NULL DEFAULT NULL,
  `upload_belanja_spd_persentase_realisasi` decimal(16, 2) NULL DEFAULT NULL,
  `upload_belanja_spd_total` decimal(16, 2) NULL DEFAULT NULL,
  `upload_belanja_spm_pagu` decimal(16, 2) NULL DEFAULT NULL,
  `upload_belanja_spm_realisasi` decimal(16, 2) NULL DEFAULT NULL,
  `upload_belanja_spm_persentase_realisasi` decimal(16, 2) NULL DEFAULT NULL,
  `upload_belanja_spm_total` decimal(16, 2) NULL DEFAULT NULL,
  `upload_belanja_create_by` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `upload_belanja_create_date` datetime NULL DEFAULT NULL,
  `upload_belanja_status` int NULL DEFAULT NULL,
  `upload_belanja_log_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`upload_belanja_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of trx_upload_belanja
-- ----------------------------
INSERT INTO `trx_upload_belanja` VALUES (1, 'c2b27124-931c-41f2-a2c9-33fd69c729f2', 2024, 1, '51|BELANJA PEGAWAI', 21773786000.00, 20237888992.00, 92.95, 1535897008.00, 21773786000.00, 20243442213.00, 92.97, 1530343787.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:38', 1, NULL);
INSERT INTO `trx_upload_belanja` VALUES (2, '8e314fba-1e49-4ecd-b07b-ff1879c689af', 2024, 1, '52|BELANJA BARANG', 34812314000.00, 32019003231.00, 91.98, 2793310769.00, 34812314000.00, 32621206573.00, 93.71, 2191107427.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:38', 1, NULL);
INSERT INTO `trx_upload_belanja` VALUES (3, '14ba83fa-6ecf-426d-911c-ea3820991fce', 2024, 1, '53|BELANJA MODAL', 149640000.00, 149600000.00, 99.97, 40000.00, 149640000.00, 149600000.00, 99.97, 40000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:38', 1, NULL);
INSERT INTO `trx_upload_belanja` VALUES (4, '1ed13819-f651-40d3-86bc-4f5e8e5caf72', 2024, 12, '51|BELANJA PEGAWAI', 21773786000.00, 20237888992.00, 92.95, 1535897008.00, 21773786000.00, 20243442213.00, 92.97, 1530343787.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:07', 1, NULL);
INSERT INTO `trx_upload_belanja` VALUES (5, 'e72be366-9f41-4d78-96dd-5039e913e53b', 2024, 12, '52|BELANJA BARANG', 34812314000.00, 32019003231.00, 91.98, 2793310769.00, 34812314000.00, 32621206573.00, 93.71, 2191107427.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:07', 1, NULL);
INSERT INTO `trx_upload_belanja` VALUES (6, 'fa4e17a5-d047-4271-9f69-48de6905c609', 2024, 12, '53|BELANJA MODAL', 149640000.00, 149600000.00, 99.97, 40000.00, 149640000.00, 149600000.00, 99.97, 40000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:07', 1, NULL);

-- ----------------------------
-- Table structure for trx_upload_nilai_program
-- ----------------------------
DROP TABLE IF EXISTS `trx_upload_nilai_program`;
CREATE TABLE `trx_upload_nilai_program`  (
  `upload_nilai_program_id` int NOT NULL AUTO_INCREMENT,
  `upload_nilai_program_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `upload_nilai_program_year` int NULL DEFAULT NULL,
  `upload_nilai_program_month` int NULL DEFAULT NULL,
  `upload_nilai_program_work_program_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `upload_nilai_program_pagu` decimal(16, 2) NULL DEFAULT NULL,
  `upload_nilai_program_realisasi` decimal(16, 2) NULL DEFAULT NULL,
  `upload_nilai_program_sisa` decimal(16, 2) NULL DEFAULT NULL,
  `upload_nilai_program_create_by` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `upload_nilai_program_create_date` datetime NULL DEFAULT NULL,
  `upload_nilai_program_status` int NULL DEFAULT NULL,
  `upload_nilai_program_log_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`upload_nilai_program_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 209 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of trx_upload_nilai_program
-- ----------------------------
INSERT INTO `trx_upload_nilai_program` VALUES (1, '1734bdd5-d063-42f0-9a37-8ce51dfac295', 2024, 1, '218e556e-25ba-4b25-a779-c41195a155b2', 56735740000.00, 53014248786.00, 3721491214.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (2, '20485c1b-c7d5-4944-9bd1-ce5ca90f2c8a', 2024, 1, '53427feb-63ca-499e-a215-e96c38bae4b6', 47435273000.00, 44301581098.00, 3133691902.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (3, '10bcef12-0798-4f87-a3c0-59a89017f33b', 2024, 1, 'ad333241-0a69-44ea-b2b7-efd2652c8f81', 47435273000.00, 44301581098.00, 3133691902.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (4, '414fcf38-3d88-4a19-86b1-3627c54cbced', 2024, 1, '90c7f4dd-ffe2-40b3-a749-b3cb22e2379d', 3693924000.00, 3526425309.00, 167498691.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (5, '3ff2e57f-ea9b-43ae-9295-ddcc860a0aae', 2024, 1, 'fd5912d3-7722-4adb-af4c-92cc530f2d1e', 10800000.00, 10639129.00, 160871.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (6, '48bab308-d848-4818-bfe9-a734253ae4c7', 2024, 1, 'f85a89ea-72ba-4dbb-957c-8bbe1d7b59f9', 182000000.00, 180200000.00, 1800000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (7, '12821094-52fe-499d-adac-d40857386b35', 2024, 1, '6a73c2f5-739e-4696-a9f0-7291e525bd56', 35240000.00, 25589941.00, 9650059.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (8, 'dfb665a1-fe24-4b5d-9709-9a45a8c059a1', 2024, 1, 'de00de18-2307-424b-b65e-ed352fdb005a', 476700000.00, 436800000.00, 39900000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (9, 'd1b27506-5a68-487a-a972-4f06507d91b6', 2024, 1, 'ea2677a2-2a85-4cc2-8bb0-56b0a2cdea9d', 2904663000.00, 2900763411.00, 3899589.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (10, '743fe0db-7862-481c-9f28-f78d0849ca55', 2024, 1, '4e62d446-e7fd-49f4-bf8c-eafbc5a49c14', 11040000.00, 10330000.00, 710000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (11, '1e4ea13a-9f51-4717-8896-ad4d57c13f0d', 2024, 1, 'f6eff89f-25a5-4100-a576-52e0b2954066', 1911257000.00, 1782249309.00, 129007691.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (12, 'c3fe3caf-8310-48ee-9416-f4b1439f4cf5', 2024, 1, 'dd9a016b-2b7a-4159-88af-c425bc668f12', 2683880000.00, 2683821517.00, 58483.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (13, '75086ffd-2414-4284-ab8b-24c5ce794d61', 2024, 1, '97aa3766-c142-433e-9a0f-191fd4886a23', 717733000.00, 689206239.00, 28526761.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (14, '1da20142-b527-48a4-a408-ea8c21b148e4', 2024, 1, '823201d6-b733-4ad1-a4e7-ff4fe25f2934', 1436777000.00, 1382819774.00, 53957226.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (15, '4c82d907-56d4-4d19-92e6-3c9c21feb98e', 2024, 1, '4de179b3-a6e8-405b-8fef-505ae43f8f95', 4643059000.00, 4119773279.00, 523285721.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (16, 'f9b2e39f-222d-4331-8ac0-a9223c3c201d', 2024, 1, '47dad614-db71-4200-860a-d3cfb8794fd3', 159000000.00, 157524000.00, 1476000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (17, 'f3509791-d403-4b4e-98ae-870300dbf9f2', 2024, 1, '7d0c808a-352a-43b9-8857-dbd1002241da', 969000.00, 0.00, 969000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (18, '5ce1bda3-6b82-42e1-a8bf-57ad5e3a67f8', 2024, 1, '1facf35e-6ad6-4902-8ce5-4c5962388232', 425873000.00, 400792989.00, 25080011.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (19, '9b45b480-4053-40b8-926c-7a3e116dddbe', 2024, 1, '9818cd5d-06e5-43a3-b38f-1bb56ee3682e', 1143606000.00, 1089999228.00, 53606772.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (20, 'a3fab539-38b4-41e9-813b-9d47208c423b', 2024, 1, '03cde798-2cbc-408c-ada2-6e3777c188b9', 12672424000.00, 11996632857.00, 675791143.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (21, 'c31a39c4-64ed-4698-99bc-be10e2ee6cf6', 2024, 1, '6f86f90b-2f14-44b4-89d9-5776c60d977b', 395516000.00, 349605566.00, 45910434.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (22, 'f658af67-3f02-4494-8adc-e25397885123', 2024, 1, '4cc7bc89-15e0-4b1d-aa12-ea3290303b63', 98907000.00, 98906000.00, 1000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (23, 'ffeec34f-7811-4af1-80a0-7fe3483af5bc', 2024, 1, 'f6164b24-d144-447e-a2b1-6abe7f763a1d', 197954000.00, 197950000.00, 4000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (24, 'ecd334cd-e49c-45cd-a346-75976aa97813', 2024, 1, '95edab7b-c78b-4807-a5df-6e9552142389', 11550000.00, 11550000.00, 0.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (25, 'a4a79c5d-d4df-4652-9954-62aa1fa79b1c', 2024, 1, '2851611c-0d5a-480f-b242-3d05f3524855', 524268000.00, 443727605.00, 80540395.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (26, '1a328cb2-e4df-466a-8e16-b503b5cd5dc3', 2024, 1, '077459a3-09f9-4f7c-aaad-347dec3de9c3', 620045000.00, 600400548.00, 19644452.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (27, '88479f43-d498-483c-8607-e7c3b3999169', 2024, 1, '4931ce69-cbae-4a62-b20c-226bae375f42', 596292000.00, 576713148.00, 19578852.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (28, 'f9128dc5-be0f-4514-9255-c5a2b7ee76d2', 2024, 1, 'd0192e8f-f175-4d01-b2bd-01e823d2ba30', 23753000.00, 23687400.00, 65600.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (29, '5985474c-5d36-4b14-adfa-8ed07823786c', 2024, 1, '35f6aefd-00cf-4af1-a798-32a7099e594f', 204240000.00, 139613195.00, 64626805.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (30, '2694cbdc-8cf5-4a74-ae04-55ee21a5bbe0', 2024, 1, '8debfa1c-d185-435e-abfd-dc11529cd7d5', 3900000.00, 1566000.00, 2334000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (31, 'e1e90057-7e8f-4290-951b-a14a87f58197', 2024, 1, 'e789080c-3968-4806-9da9-b0ffbe625a4a', 60000000.00, 29248500.00, 30751500.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (32, 'dcb06577-5531-4bbb-8a45-1038522f9a26', 2024, 1, 'a0f006cd-2aa6-4464-ad89-b90f439678c4', 521900000.00, 518407189.00, 3492811.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (33, '50377a2c-8a43-4cc1-9c1a-1a6c290fcadd', 2024, 1, 'f7a47e85-4796-4bf2-b991-9be2513764ab', 3900000.00, 1566000.00, 2334000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (34, '43348e31-c707-4722-a94b-4b644ec085c2', 2024, 1, '6ac2a99e-2f9e-428f-ba46-69729b2609a9', 264825000.00, 246308813.00, 18516187.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (35, 'a672038f-ef5b-4b3e-b06e-b6a503055ac0', 2024, 1, 'cb7addbd-5418-4491-8a1e-05c676eb74b0', 11640000.00, 9649243.00, 1990757.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (36, '71791c94-f480-4811-a02c-e2fb8b51a41b', 2024, 1, '8c84ac82-50d3-4529-a56f-f2389bfce91d', 70200000.00, 57832537.00, 12367463.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (37, 'b7f4ec70-fa9f-4087-bf6f-645791cf4dce', 2024, 1, '06a858d2-449f-4a4c-926a-4707ce4729de', 10260000.00, 8547320.00, 1712680.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (38, 'eaf96314-12c4-46b7-aef9-b6bad8f80b40', 2024, 1, '4a30dcb1-e1a0-4b79-86dd-682ff583f255', 4800000.00, 2400000.00, 2400000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (39, '99bbec2c-bf4f-45c3-b9bf-9b5f8ccfc12a', 2024, 1, '0be10129-7420-4ea3-ba44-97a86daa5c6f', 7600000.00, 4000000.00, 3600000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (40, '588960a7-394c-4d35-af40-196a3f2abcf1', 2024, 1, 'a26098fd-75ec-40fd-b5ec-87ef2efb1737', 3600000.00, 0.00, 3600000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (41, '670f8cdd-5bc5-4a70-a361-dfebb05316ad', 2024, 1, '45b23872-25ff-4b12-b062-dc83cc4d711a', 4000000.00, 4000000.00, 0.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (42, '9bee4050-ba77-47d8-abeb-99c81671e14f', 2024, 1, '54ec428f-29aa-40f0-99be-a322d8b07d26', 199015000.00, 135136000.00, 63879000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (43, 'b7088d88-58f1-41a5-9fa4-d17bdc330964', 2024, 1, '480b9a94-976f-4a37-a849-d73432a1d668', 88108000.00, 25200000.00, 62908000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (44, '6d9a8451-045a-4816-8c3a-8950989ee19a', 2024, 1, 'd1b3d5b8-8e60-49e7-a404-333fc5738b57', 383654000.00, 263332135.00, 120321865.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (45, '3315c39b-565e-4af4-bcd6-d84407e70b87', 2024, 1, 'cd9174f2-9e83-4b76-a251-436123816f41', 4063875000.00, 4053011434.00, 10863566.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (46, '4c5beaa3-bd1e-4e4e-94ed-9293d5649d82', 2024, 1, '0d36c268-bf22-49ee-b3ae-9c58f30e568a', 232390000.00, 162995811.00, 69394189.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (47, '4a6f39cf-9162-4478-91fb-7ba93a7e00c2', 2024, 1, '858063d3-0f42-46fe-8184-680f5eed4c9d', 129840000.00, 96570000.00, 33270000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (48, '2037ad79-c17f-486d-8878-c7fe210a9d5a', 2024, 1, 'dc500477-8353-4fc4-9d57-ddeddaf94627', 713097000.00, 590673561.00, 122423439.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (49, '750ab931-86c6-4954-b843-6ed757c8c4d4', 2024, 1, 'dc7e0384-da2b-4d9b-8864-8e247722c2ca', 296370000.00, 246975000.00, 49395000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (50, '2eb450a9-a542-4fe1-acfc-cd653761eb23', 2024, 1, '4780526f-720b-4dee-ba34-4536a7b6b22d', 4043775000.00, 4042930000.00, 845000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (51, '700bc8f5-eb64-4ae1-aab1-626bd2056170', 2024, 1, '0ae0da9b-5069-4721-94c4-e2dc6ac9a3f0', 4043775000.00, 4042930000.00, 845000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (52, 'ba4c9971-2f5c-4154-a4b2-39b9c5399708', 2024, 1, 'e04a8d97-a5e5-4623-99ca-31754240f290', 713097000.00, 590673561.00, 122423439.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (53, '7576996d-b0b5-4cd2-ab8d-8afbe2131f77', 2024, 1, '108f9b9f-8c50-4bc2-9978-6e9cbfb0f87e', 10800000.00, 10639129.00, 160871.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (54, '7893041b-d808-4d4c-a4f1-0119e8620efe', 2024, 1, '7591a3d4-ce4b-4ad6-9ec5-7142aa5f493f', 10800000.00, 10639129.00, 160871.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (55, '03815d1c-80f9-4d5f-807f-5f2e886171c3', 2024, 1, 'b9827ee7-68c2-4f5a-972b-a09b275d1646', 149640000.00, 149600000.00, 40000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (56, '88eee4d9-0c59-4bb1-98ea-1bb6b5b51d2c', 2024, 1, '33daee68-3bde-4e42-94ba-7e6e5bec4d11', 149640000.00, 149600000.00, 40000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (57, 'c6e91669-eeb3-4a83-9297-af808c638136', 2024, 1, '4c25b3e9-297e-41e0-8dd8-a5e056b5dc25', 21773786000.00, 20243442213.00, 1530343787.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (58, '738119e8-75f4-4caf-b7aa-77776f90a099', 2024, 1, '741f0276-154f-4576-b1de-190291ab8a27', 5177019000.00, 5167081840.00, 9937160.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (59, '54a3518a-59c9-4a1c-b0cc-9648b4c6b222', 2024, 1, '4908d4ae-b418-4ccb-a62e-a0462e14d5af', 79000.00, 76655.00, 2345.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (60, '11ed484f-e582-4701-ba97-04318b010386', 2024, 1, '63933a85-00b6-41de-8408-fd816562d6f1', 389336000.00, 387881590.00, 1454410.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (61, '6d32c08d-64fe-446e-9bfb-de620b5d9db4', 2024, 1, 'c4d6af81-0b1e-4f33-840a-b759f98759e2', 104907000.00, 104578226.00, 328774.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (62, '2b59b580-c8cb-4153-934f-2befe82c3724', 2024, 1, '80314ddf-d6ce-44eb-ba9f-4c36312fe061', 246635000.00, 246260000.00, 375000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (63, '43ab1343-0d98-4cda-90f6-f9bf5bb7e7fc', 2024, 1, 'eb0f277e-1c1b-42ac-92b7-ba462e91cdac', 581467000.00, 568367000.00, 13100000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (64, '1262c15c-defb-4ebe-8069-b670fadd4496', 2024, 1, '2c83571e-b539-452b-a74d-00cb97512fe7', 88548000.00, 75400159.00, 13147841.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (65, '9e3a9e53-c0ab-4034-a784-30a0d4ce6ddc', 2024, 1, '63d5919e-bb45-4222-b34e-0241d3043d83', 265777000.00, 264550260.00, 1226740.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (66, 'd5854849-1caf-4d01-89d8-c41c1b6ffe06', 2024, 1, 'ec51d416-26db-438f-bcde-5804fab89131', 303765000.00, 166653000.00, 137112000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (67, '3ae4f549-5612-40ae-92b3-137fde4d5b8d', 2024, 1, '0ca77cf5-a2ca-40bc-94a1-4ef7f45adf68', 110252000.00, 109135000.00, 1117000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (68, '0ab311b2-be26-4d4f-8ee4-97f4a8d2205a', 2024, 1, 'e8d41009-4257-424f-859b-9e0d656b8af5', 464912000.00, 464823200.00, 88800.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (69, '720e270e-221b-42fd-9a5f-a153603c6f94', 2024, 1, '76b15ed9-552e-4408-b9a0-1452c83d7c8f', 11000.00, 9588.00, 1412.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (70, '1161b0f9-7c73-43b3-a8d1-bcc29cc38a8a', 2024, 1, 'c44a09de-038d-4343-98a4-be5e5149e528', 18720000.00, 18600960.00, 119040.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (71, 'b87da6bf-7412-43f3-83a9-86085395c955', 2024, 1, '96891363-0dc4-4910-8a63-028dea76f92b', 8288000.00, 8205232.00, 82768.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (72, '47b1a17c-5037-434e-935e-063bc69d1633', 2024, 1, '650ab252-fa6a-498b-8e64-e7b3b1e03613', 74256000.00, 74230000.00, 26000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (73, '20cf22c7-4a33-4bc3-9ddb-19af63e0c459', 2024, 1, 'b12bdf39-a35b-41c6-b7c9-ac517ef8ae99', 24528000.00, 24477960.00, 50040.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (74, '34103165-f881-47b3-a6be-fe22808fc744', 2024, 1, 'dff372b8-b640-411e-83e6-21254aed1ef1', 43680000.00, 24410000.00, 19270000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (75, '7911566c-d9ef-4dcb-98c6-17d8f87a32b6', 2024, 1, 'bb356424-1bb0-4f86-bce0-28f3942c8c01', 5698196000.00, 5243699250.00, 454496750.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (76, '4d489b07-544d-4b7b-b49b-f4bdf3846c06', 2024, 1, '36def224-6745-4c93-9304-89fefdadf8c0', 62000.00, 0.00, 62000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (77, 'e82e92fd-af74-4222-b6f9-a532919312ca', 2024, 1, '41623e52-96a0-4c61-ab18-7691ade3dccd', 7589828000.00, 6763855502.00, 825972498.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (78, 'bfa3b4fe-4922-460e-8643-72437448d741', 2024, 1, 'a3258631-fe7e-4796-b2fd-99a0ccf3a7db', 583520000.00, 531146791.00, 52373209.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (79, 'f8cddacd-c902-428d-a423-336d909dd903', 2024, 1, '5cd2e41e-6be4-40ce-8298-04c4be79167b', 9300467000.00, 8712667688.00, 587799312.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (80, 'e8a22e62-7058-46c4-8ae4-faf15224dbb7', 2024, 1, 'dd4e2c4d-cd55-4f89-ad5b-a1f202b88111', 5322184000.00, 5173016950.00, 149167050.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (81, 'eef1f3c6-5374-4657-b7f9-764949fdabd6', 2024, 1, '7b20b362-1314-403e-869e-46e71caedc39', 1626680000.00, 1586717254.00, 39962746.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (82, '539e6278-79cc-48a9-b91f-8fe735409148', 2024, 1, '37267344-8826-4178-b156-0ad46aace99f', 6733000.00, 3665000.00, 3068000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (83, 'dad52137-c499-48cb-a9b3-207a3267de96', 2024, 1, '5686a8ca-09df-4051-9458-6943e53c4e2e', 90200000.00, 90200000.00, 0.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (84, 'da44d580-6f00-44ed-a7eb-a30e35512a3e', 2024, 1, 'f1d3e13b-ef63-492b-b4a4-e555697a228b', 4426000.00, 4392000.00, 34000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (85, '975ca24d-cf3e-4f79-89d7-c71f027446a6', 2024, 1, 'c58c8a91-2f35-441e-9cb4-ebad831ac427', 15500000.00, 13800000.00, 1700000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (86, '75f5a919-ebe7-46bf-8e0e-81f3bb519f30', 2024, 1, 'e452b2a9-5751-46fb-a841-1b7e33da354c', 1332186000.00, 1326684742.00, 5501258.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (87, 'aeab3ebb-667d-44d7-8d8c-c03a8bfb4a63', 2024, 1, 'fe79d253-a08a-46d9-b4d4-1a2b2e12eff6', 1551819000.00, 1516645447.00, 35173553.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (88, '77c05a77-b1f2-48fe-af3e-358b1886fc41', 2024, 1, '6f992539-538e-4c15-8f61-117c3c64e5db', 1248276000.00, 1186168595.00, 62107405.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (89, '80a38e3a-8d3e-4d28-bcce-7bae8ce783be', 2024, 1, '507673d9-5d22-4f00-8b4a-a41bb033dfcf', 778550000.00, 771428654.00, 7121346.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (90, '181560bd-7f7f-4c3b-b30b-a25ccb9d55ef', 2024, 1, '7f049001-fe39-42a0-8104-a0d0cb98f903', 2330000.00, 2053500.00, 276500.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (91, '4d5941c9-6d54-4dc8-8a94-fedc06377762', 2024, 1, '27734fd9-bde8-4865-aa10-99d10e939860', 259520000.00, 259515565.00, 4435.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (92, '7ccdd839-7f82-449a-b485-d6916ca920c9', 2024, 1, '7b2d98c9-2fc8-489b-a9bc-d80dd16f54a4', 895409000.00, 883485654.00, 11923346.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (93, '2d11dd0f-8659-4327-9d49-b2db5e30d524', 2024, 1, '32851a29-210b-48c1-b109-6a193175396b', 3978283000.00, 3539650738.00, 438632262.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (94, '4fd8e39d-8be7-46fe-a04c-c964dcb4f48b', 2024, 1, 'cf9464b5-4bff-423f-8f48-7f63936a6d17', 1186376000.00, 1051400076.00, 134975924.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (95, '6f82fc5f-8a3d-4356-8697-705f81a31501', 2024, 1, '69520c54-5c1c-46a9-94ea-7aa49dc2775a', 7564000.00, 1252000.00, 6312000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (96, '819130f8-b657-49c5-8045-b76d5861f3c2', 2024, 1, '2a3040ba-99de-438a-a7a9-2c0399156f3b', 213400000.00, 208900000.00, 4500000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (97, '73af0614-1f8c-41b3-a1f0-3dc63243a71f', 2024, 1, '1d95c303-723a-4728-a87c-4390e8637883', 41160000.00, 41090940.00, 69060.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (98, '6f6d4e88-da6d-459c-94ac-5e193d3119ee', 2024, 1, '8088f06b-5978-4d90-ae9f-b6b98fad17f6', 137200000.00, 85700000.00, 51500000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (99, 'e3b505a9-9afd-4b05-a65c-f94aed7c603d', 2024, 1, '1d2e0687-42a7-464d-8b41-36550d0b4be1', 1607940000.00, 1437680767.00, 170259233.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (100, '6bc2a127-04c7-4599-9c77-4499bcc115a0', 2024, 1, '9ad67839-64e9-451f-b623-ad2e8f4c9734', 21660000.00, 18075000.00, 3585000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (101, 'ac02ec8d-c263-43d6-b353-ba7457ec7152', 2024, 1, 'c4e8a1bc-0526-4d09-8281-6de2b88ae52c', 762983000.00, 695551955.00, 67431045.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (102, 'e607bd5e-bfbb-4baa-8461-c07618855927', 2024, 1, '133de6ae-9c73-4cb2-aa7c-b5a71625f3a3', 6080000.00, 3760000.00, 2320000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (103, '0053fd6a-f2c5-418e-b4ef-be971e4710d0', 2024, 1, '368f4187-60f0-448d-9944-cda4663dcb5b', 68426000.00, 67913040.00, 512960.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (104, 'c134b4d7-bfc8-4a29-ac2f-de409765b809', 2024, 1, 'f86ccc27-e378-4bb4-93c5-0abcba98e534', 2028924000.00, 1792698707.00, 236225293.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:36', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (105, '5639661e-2442-4f01-a202-518d15cae4dd', 2024, 12, '218e556e-25ba-4b25-a779-c41195a155b2', 56735740000.00, 53014248786.00, 3721491214.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (106, 'e51c3428-14a6-432f-877a-8b8955fe2ffb', 2024, 12, '53427feb-63ca-499e-a215-e96c38bae4b6', 47435273000.00, 44301581098.00, 3133691902.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (107, 'ac03a80a-4f91-4ae3-b0d0-895fab1c7fac', 2024, 12, 'ad333241-0a69-44ea-b2b7-efd2652c8f81', 47435273000.00, 44301581098.00, 3133691902.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (108, '83f03e1f-19e7-4366-838b-236bf621ac59', 2024, 12, '90c7f4dd-ffe2-40b3-a749-b3cb22e2379d', 3693924000.00, 3526425309.00, 167498691.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (109, 'd89e36d5-6070-4540-9753-a356ded63c2c', 2024, 12, 'fd5912d3-7722-4adb-af4c-92cc530f2d1e', 10800000.00, 10639129.00, 160871.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (110, 'fb920314-46c9-49be-9f0e-8a62f2b98524', 2024, 12, 'f85a89ea-72ba-4dbb-957c-8bbe1d7b59f9', 182000000.00, 180200000.00, 1800000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (111, '1ef90d74-4de5-43fe-ae39-3662b12d4c1d', 2024, 12, '6a73c2f5-739e-4696-a9f0-7291e525bd56', 35240000.00, 25589941.00, 9650059.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (112, '42a28a60-e757-4b7c-a5e2-5eb64d3b91b7', 2024, 12, 'de00de18-2307-424b-b65e-ed352fdb005a', 476700000.00, 436800000.00, 39900000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (113, 'beb7b56d-8f4b-434e-a572-4f02489b8d55', 2024, 12, 'ea2677a2-2a85-4cc2-8bb0-56b0a2cdea9d', 2904663000.00, 2900763411.00, 3899589.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (114, '4418adda-96bd-4983-85a4-0d3b1ad934f8', 2024, 12, '4e62d446-e7fd-49f4-bf8c-eafbc5a49c14', 11040000.00, 10330000.00, 710000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (115, '092cf248-253f-4d59-b05a-1402332ca0ca', 2024, 12, 'f6eff89f-25a5-4100-a576-52e0b2954066', 1911257000.00, 1782249309.00, 129007691.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (116, '48919f04-bc1f-4e8b-a27f-94ff95afa1d8', 2024, 12, 'dd9a016b-2b7a-4159-88af-c425bc668f12', 2683880000.00, 2683821517.00, 58483.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (117, '8189ab4c-6021-4837-866f-c9f4a3ee8140', 2024, 12, '97aa3766-c142-433e-9a0f-191fd4886a23', 717733000.00, 689206239.00, 28526761.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (118, '26df73a3-25a1-4186-baf5-beaf06893f5e', 2024, 12, '823201d6-b733-4ad1-a4e7-ff4fe25f2934', 1436777000.00, 1382819774.00, 53957226.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (119, '4e814223-23c8-42a0-8f7c-9a4c7eb1c9b7', 2024, 12, '4de179b3-a6e8-405b-8fef-505ae43f8f95', 4643059000.00, 4119773279.00, 523285721.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (120, '7dc2d5c6-2609-4858-9740-b32de0788dd6', 2024, 12, '47dad614-db71-4200-860a-d3cfb8794fd3', 159000000.00, 157524000.00, 1476000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (121, '70cacbfa-d62d-48e6-b01a-cc25ecde6683', 2024, 12, '7d0c808a-352a-43b9-8857-dbd1002241da', 969000.00, 0.00, 969000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (122, '05f834d4-1971-4111-9fd5-415ec3acb4fa', 2024, 12, '1facf35e-6ad6-4902-8ce5-4c5962388232', 425873000.00, 400792989.00, 25080011.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (123, 'c289b41a-a438-4b63-b8c2-fc1c47d47b71', 2024, 12, '9818cd5d-06e5-43a3-b38f-1bb56ee3682e', 1143606000.00, 1089999228.00, 53606772.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (124, '3fb6a36c-0f51-4cca-afb2-8892e463d0c7', 2024, 12, '03cde798-2cbc-408c-ada2-6e3777c188b9', 12672424000.00, 11996632857.00, 675791143.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (125, 'e9e739ce-6b17-49ac-9a0b-d3235077e2fe', 2024, 12, '6f86f90b-2f14-44b4-89d9-5776c60d977b', 395516000.00, 349605566.00, 45910434.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (126, '4fd90888-acc8-4339-9515-fa42ccc4c47e', 2024, 12, '4cc7bc89-15e0-4b1d-aa12-ea3290303b63', 98907000.00, 98906000.00, 1000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (127, '11bf0a17-e192-4540-890f-95edbc36a1ba', 2024, 12, 'f6164b24-d144-447e-a2b1-6abe7f763a1d', 197954000.00, 197950000.00, 4000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (128, '6e3b2e97-7d1b-49c7-9b46-04d7c1e6a8c5', 2024, 12, '95edab7b-c78b-4807-a5df-6e9552142389', 11550000.00, 11550000.00, 0.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (129, '0f7c1b6f-dab8-49c8-a514-cb061a9abc44', 2024, 12, '2851611c-0d5a-480f-b242-3d05f3524855', 524268000.00, 443727605.00, 80540395.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (130, 'a921bd47-e251-4457-946f-17da765e14c0', 2024, 12, '077459a3-09f9-4f7c-aaad-347dec3de9c3', 620045000.00, 600400548.00, 19644452.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (131, '8a91c0bb-0813-4607-8be0-2d653f5f383f', 2024, 12, '4931ce69-cbae-4a62-b20c-226bae375f42', 596292000.00, 576713148.00, 19578852.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (132, '65c2aadc-c455-462c-a192-4e11e023a632', 2024, 12, 'd0192e8f-f175-4d01-b2bd-01e823d2ba30', 23753000.00, 23687400.00, 65600.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (133, '13bf1c81-6bee-45af-828d-b8f60b090850', 2024, 12, '35f6aefd-00cf-4af1-a798-32a7099e594f', 204240000.00, 139613195.00, 64626805.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (134, '380eb281-b71b-49b4-b8ad-3217051c5412', 2024, 12, '8debfa1c-d185-435e-abfd-dc11529cd7d5', 3900000.00, 1566000.00, 2334000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (135, 'e217a60c-1c93-4ec2-86a2-2db4acecb2a3', 2024, 12, 'e789080c-3968-4806-9da9-b0ffbe625a4a', 60000000.00, 29248500.00, 30751500.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (136, '246bc5a2-91e7-48ba-88fb-a8bd3a770001', 2024, 12, 'a0f006cd-2aa6-4464-ad89-b90f439678c4', 521900000.00, 518407189.00, 3492811.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (137, 'f60a7f2e-caf1-4253-9b7e-8c40ce6c56a1', 2024, 12, 'f7a47e85-4796-4bf2-b991-9be2513764ab', 3900000.00, 1566000.00, 2334000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (138, '9b539c6c-8016-455e-9be2-c054e27f2e40', 2024, 12, '6ac2a99e-2f9e-428f-ba46-69729b2609a9', 264825000.00, 246308813.00, 18516187.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (139, 'ca42b920-34e5-405d-8e17-2917147127e5', 2024, 12, 'cb7addbd-5418-4491-8a1e-05c676eb74b0', 11640000.00, 9649243.00, 1990757.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (140, '190a3753-da59-4fd2-af55-39e677555068', 2024, 12, '8c84ac82-50d3-4529-a56f-f2389bfce91d', 70200000.00, 57832537.00, 12367463.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (141, 'c6a6c973-f24b-4c40-8e45-ecb76e1bb434', 2024, 12, '06a858d2-449f-4a4c-926a-4707ce4729de', 10260000.00, 8547320.00, 1712680.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (142, '04ce4ac7-0d3d-45cc-94dc-bb6055ed7b9b', 2024, 12, '4a30dcb1-e1a0-4b79-86dd-682ff583f255', 4800000.00, 2400000.00, 2400000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (143, 'd76ec9f2-bfb1-422b-922f-b7e443361ce8', 2024, 12, '0be10129-7420-4ea3-ba44-97a86daa5c6f', 7600000.00, 4000000.00, 3600000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (144, 'ccfea406-05d7-4eaf-999c-73b508ddbbe5', 2024, 12, 'a26098fd-75ec-40fd-b5ec-87ef2efb1737', 3600000.00, 0.00, 3600000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (145, '2e106c16-4c13-4265-a050-278fa5ef045c', 2024, 12, '45b23872-25ff-4b12-b062-dc83cc4d711a', 4000000.00, 4000000.00, 0.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (146, 'f4cb7512-fb63-4f75-91df-e850764b2aa0', 2024, 12, '54ec428f-29aa-40f0-99be-a322d8b07d26', 199015000.00, 135136000.00, 63879000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (147, 'df66f74a-a2a9-48ef-99ff-97aba29c7a8c', 2024, 12, '480b9a94-976f-4a37-a849-d73432a1d668', 88108000.00, 25200000.00, 62908000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (148, 'a3805d72-e55f-4466-8374-47b2b03014da', 2024, 12, 'd1b3d5b8-8e60-49e7-a404-333fc5738b57', 383654000.00, 263332135.00, 120321865.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (149, '207220d8-8910-4a68-a5e4-29fe4074138a', 2024, 12, 'cd9174f2-9e83-4b76-a251-436123816f41', 4063875000.00, 4053011434.00, 10863566.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (150, 'd8f6ab3b-aed7-4ee3-b863-2c916fb95031', 2024, 12, '0d36c268-bf22-49ee-b3ae-9c58f30e568a', 232390000.00, 162995811.00, 69394189.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (151, 'c22cd7fa-9d7b-434b-b81b-b1da2f25c274', 2024, 12, '858063d3-0f42-46fe-8184-680f5eed4c9d', 129840000.00, 96570000.00, 33270000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (152, 'bd767adf-271a-41b9-8fee-898b5b1372c5', 2024, 12, 'dc500477-8353-4fc4-9d57-ddeddaf94627', 713097000.00, 590673561.00, 122423439.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (153, 'e05526ae-a072-4e18-bee3-ca8f9cf028fa', 2024, 12, 'dc7e0384-da2b-4d9b-8864-8e247722c2ca', 296370000.00, 246975000.00, 49395000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (154, '7083e75a-6292-4cd1-9506-f5e0ce0128c9', 2024, 12, '4780526f-720b-4dee-ba34-4536a7b6b22d', 4043775000.00, 4042930000.00, 845000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (155, 'd2164ec3-5ea0-4835-a8b3-a44ce98706d5', 2024, 12, '0ae0da9b-5069-4721-94c4-e2dc6ac9a3f0', 4043775000.00, 4042930000.00, 845000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (156, '70633e49-7879-4060-b678-3d9b5b78b2a3', 2024, 12, 'e04a8d97-a5e5-4623-99ca-31754240f290', 713097000.00, 590673561.00, 122423439.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (157, '621ab78d-1622-418a-91ab-069db44abf79', 2024, 12, '108f9b9f-8c50-4bc2-9978-6e9cbfb0f87e', 10800000.00, 10639129.00, 160871.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (158, '3430c26b-cf5e-4c81-a910-faa43456b483', 2024, 12, '7591a3d4-ce4b-4ad6-9ec5-7142aa5f493f', 10800000.00, 10639129.00, 160871.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (159, '1e4202a7-f39e-4aaa-ad32-5bd0770df66e', 2024, 12, 'b9827ee7-68c2-4f5a-972b-a09b275d1646', 149640000.00, 149600000.00, 40000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (160, 'c8fcd1c4-46f0-4cc5-b5c6-38cc459ccc14', 2024, 12, '33daee68-3bde-4e42-94ba-7e6e5bec4d11', 149640000.00, 149600000.00, 40000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (161, 'b798712e-b104-412c-8d9c-30a090870738', 2024, 12, '4c25b3e9-297e-41e0-8dd8-a5e056b5dc25', 21773786000.00, 20243442213.00, 1530343787.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (162, '4ab14acd-11ed-432b-8937-a756a43a2618', 2024, 12, '741f0276-154f-4576-b1de-190291ab8a27', 5177019000.00, 5167081840.00, 9937160.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (163, 'a0e599aa-24a4-4147-9c9f-b24eb5abc5e1', 2024, 12, '4908d4ae-b418-4ccb-a62e-a0462e14d5af', 79000.00, 76655.00, 2345.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (164, 'f1c9fee2-01df-46dd-9a3e-73e229bbbdaf', 2024, 12, '63933a85-00b6-41de-8408-fd816562d6f1', 389336000.00, 387881590.00, 1454410.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (165, '88b2490e-fea4-4fa6-87b9-07e28ce3d087', 2024, 12, 'c4d6af81-0b1e-4f33-840a-b759f98759e2', 104907000.00, 104578226.00, 328774.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (166, '83d1f6af-a863-41ee-91e5-8aa9c227712a', 2024, 12, '80314ddf-d6ce-44eb-ba9f-4c36312fe061', 246635000.00, 246260000.00, 375000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (167, '3d99c47f-b2d4-494c-9253-40f9e1ec1ff9', 2024, 12, 'eb0f277e-1c1b-42ac-92b7-ba462e91cdac', 581467000.00, 568367000.00, 13100000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (168, '8054ba1c-1c76-46ce-87cf-d9a76c91f757', 2024, 12, '2c83571e-b539-452b-a74d-00cb97512fe7', 88548000.00, 75400159.00, 13147841.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (169, '427e7a69-6974-474a-b6c7-90cad48a4a39', 2024, 12, '63d5919e-bb45-4222-b34e-0241d3043d83', 265777000.00, 264550260.00, 1226740.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (170, 'a365b079-b1cf-4390-b17c-a1e7b2b3b7f0', 2024, 12, 'ec51d416-26db-438f-bcde-5804fab89131', 303765000.00, 166653000.00, 137112000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (171, 'a75563d2-1eb7-4097-b5ee-b5b7c58fdbe3', 2024, 12, '0ca77cf5-a2ca-40bc-94a1-4ef7f45adf68', 110252000.00, 109135000.00, 1117000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (172, 'e1e7dc5f-18cc-40d5-ac30-c5689e7276a7', 2024, 12, 'e8d41009-4257-424f-859b-9e0d656b8af5', 464912000.00, 464823200.00, 88800.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (173, '22b7aa9e-ea92-4e12-a86b-0b268a3399b4', 2024, 12, '76b15ed9-552e-4408-b9a0-1452c83d7c8f', 11000.00, 9588.00, 1412.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (174, '12523947-2678-4095-bfb2-2f2e4ed59f8e', 2024, 12, 'c44a09de-038d-4343-98a4-be5e5149e528', 18720000.00, 18600960.00, 119040.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (175, 'a13bacc8-6b3f-4447-8a8c-6e2d78adaffe', 2024, 12, '96891363-0dc4-4910-8a63-028dea76f92b', 8288000.00, 8205232.00, 82768.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (176, 'bcd01733-8323-42c0-be74-adfb1c4363ef', 2024, 12, '650ab252-fa6a-498b-8e64-e7b3b1e03613', 74256000.00, 74230000.00, 26000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (177, '0a79ee94-354e-43fd-816d-cebeba8a9bdd', 2024, 12, 'b12bdf39-a35b-41c6-b7c9-ac517ef8ae99', 24528000.00, 24477960.00, 50040.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (178, '363b1a82-717d-42e8-8fe7-7605a72ea64b', 2024, 12, 'dff372b8-b640-411e-83e6-21254aed1ef1', 43680000.00, 24410000.00, 19270000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (179, '110234fc-45fa-4c41-913d-aa781f072e79', 2024, 12, 'bb356424-1bb0-4f86-bce0-28f3942c8c01', 5698196000.00, 5243699250.00, 454496750.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (180, '2103db74-b639-4dec-9353-ea41752402e1', 2024, 12, '36def224-6745-4c93-9304-89fefdadf8c0', 62000.00, 0.00, 62000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (181, 'aac7ae23-a83a-4a1c-96b0-ae0336962022', 2024, 12, '41623e52-96a0-4c61-ab18-7691ade3dccd', 7589828000.00, 6763855502.00, 825972498.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (182, '4d5ca6db-1d6f-4162-ab5b-f34206221bd6', 2024, 12, 'a3258631-fe7e-4796-b2fd-99a0ccf3a7db', 583520000.00, 531146791.00, 52373209.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (183, '6b3d06cb-20d5-4589-ac94-2cb3c87fa9a1', 2024, 12, '5cd2e41e-6be4-40ce-8298-04c4be79167b', 9300467000.00, 8712667688.00, 587799312.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (184, '884289f6-0cb9-4fbc-9a26-789dbf36cac4', 2024, 12, 'dd4e2c4d-cd55-4f89-ad5b-a1f202b88111', 5322184000.00, 5173016950.00, 149167050.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (185, 'f869b6ff-e940-4b05-80a1-9cbe26a2e32b', 2024, 12, '7b20b362-1314-403e-869e-46e71caedc39', 1626680000.00, 1586717254.00, 39962746.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (186, 'adc76f14-8f0b-4600-b8d1-f602c5f5fb87', 2024, 12, '37267344-8826-4178-b156-0ad46aace99f', 6733000.00, 3665000.00, 3068000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (187, '39dba29a-71e9-451c-b10a-90b296185c61', 2024, 12, '5686a8ca-09df-4051-9458-6943e53c4e2e', 90200000.00, 90200000.00, 0.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (188, '1cc72bff-d05a-486e-8ea1-da1415650da9', 2024, 12, 'f1d3e13b-ef63-492b-b4a4-e555697a228b', 4426000.00, 4392000.00, 34000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (189, 'da1a298a-f78c-49b2-8b7e-ab79b000a762', 2024, 12, 'c58c8a91-2f35-441e-9cb4-ebad831ac427', 15500000.00, 13800000.00, 1700000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (190, '11bec2a5-0ed5-442c-a72c-f70821bc8788', 2024, 12, 'e452b2a9-5751-46fb-a841-1b7e33da354c', 1332186000.00, 1326684742.00, 5501258.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (191, '13a7de0d-74aa-4bb6-876c-2d57d1905672', 2024, 12, 'fe79d253-a08a-46d9-b4d4-1a2b2e12eff6', 1551819000.00, 1516645447.00, 35173553.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (192, 'c08dd0ac-dd26-4d05-af1b-d846d7ba48b5', 2024, 12, '6f992539-538e-4c15-8f61-117c3c64e5db', 1248276000.00, 1186168595.00, 62107405.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (193, '7671d1a8-1589-4c95-a685-933b26c65e4e', 2024, 12, '507673d9-5d22-4f00-8b4a-a41bb033dfcf', 778550000.00, 771428654.00, 7121346.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (194, 'fc97ad10-8224-463b-a32f-3ff0ebbe7a17', 2024, 12, '7f049001-fe39-42a0-8104-a0d0cb98f903', 2330000.00, 2053500.00, 276500.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (195, 'c849fc71-cd16-4731-a2bb-d5b76edafbe6', 2024, 12, '27734fd9-bde8-4865-aa10-99d10e939860', 259520000.00, 259515565.00, 4435.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (196, '7126aeb4-4c30-43a7-b0aa-c1ccc9e547d0', 2024, 12, '7b2d98c9-2fc8-489b-a9bc-d80dd16f54a4', 895409000.00, 883485654.00, 11923346.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (197, '6311bdf4-034e-447c-bcc5-14737d761f2f', 2024, 12, '32851a29-210b-48c1-b109-6a193175396b', 3978283000.00, 3539650738.00, 438632262.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (198, '9cff1452-329b-4041-b604-4b172af576c2', 2024, 12, 'cf9464b5-4bff-423f-8f48-7f63936a6d17', 1186376000.00, 1051400076.00, 134975924.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (199, '28298440-291b-477d-a364-106be3f91e30', 2024, 12, '69520c54-5c1c-46a9-94ea-7aa49dc2775a', 7564000.00, 1252000.00, 6312000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (200, 'fdaafb1e-46d3-4a4c-b5d1-618424150ac9', 2024, 12, '2a3040ba-99de-438a-a7a9-2c0399156f3b', 213400000.00, 208900000.00, 4500000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (201, 'd8418d00-0a42-41d1-bdfb-b60a14f7bd16', 2024, 12, '1d95c303-723a-4728-a87c-4390e8637883', 41160000.00, 41090940.00, 69060.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (202, 'e49b6ed3-f50a-465c-8b76-483604339407', 2024, 12, '8088f06b-5978-4d90-ae9f-b6b98fad17f6', 137200000.00, 85700000.00, 51500000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (203, 'e901a244-9b3b-4a10-8e5a-ed6f9cfb193f', 2024, 12, '1d2e0687-42a7-464d-8b41-36550d0b4be1', 1607940000.00, 1437680767.00, 170259233.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (204, '70132d0a-b803-404c-8ee8-c6ee391b0fb0', 2024, 12, '9ad67839-64e9-451f-b623-ad2e8f4c9734', 21660000.00, 18075000.00, 3585000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (205, 'a2d4efca-7f80-4683-973b-55ca2ef2f9d7', 2024, 12, 'c4e8a1bc-0526-4d09-8281-6de2b88ae52c', 762983000.00, 695551955.00, 67431045.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (206, '0adeaa35-edea-40ed-820b-2eba44017eac', 2024, 12, '133de6ae-9c73-4cb2-aa7c-b5a71625f3a3', 6080000.00, 3760000.00, 2320000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (207, '3b292215-0704-4795-8c3a-d6d26bb81844', 2024, 12, '368f4187-60f0-448d-9944-cda4663dcb5b', 68426000.00, 67913040.00, 512960.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (208, '4f8f1ca2-f9a9-4376-8076-cd09d32f257c', 2024, 12, 'f86ccc27-e378-4bb4-93c5-0abcba98e534', 2028924000.00, 1792698707.00, 236225293.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);

-- ----------------------------
-- Table structure for trx_upload_paparan_program
-- ----------------------------
DROP TABLE IF EXISTS `trx_upload_paparan_program`;
CREATE TABLE `trx_upload_paparan_program`  (
  `upload_paparan_program_id` int NOT NULL AUTO_INCREMENT,
  `upload_paparan_program_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `upload_paparan_program_parent_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `upload_paparan_program_work_unit_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `upload_paparan_program_year` int NULL DEFAULT NULL,
  `upload_paparan_program_month` int NULL DEFAULT NULL,
  `upload_paparan_program_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `upload_paparan_program_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `upload_paparan_program_spd_pagu` decimal(16, 2) NULL DEFAULT NULL,
  `upload_paparan_program_spd_realisasi` decimal(16, 2) NULL DEFAULT NULL,
  `upload_paparan_program_spd_persen_realisasi` decimal(16, 2) NULL DEFAULT NULL,
  `upload_paparan_program_spd_sisa` decimal(16, 2) NULL DEFAULT NULL,
  `upload_paparan_program_spd_target` decimal(16, 2) NULL DEFAULT NULL,
  `upload_paparan_program_spd_persen_target` decimal(16, 2) NULL DEFAULT NULL,
  `upload_paparan_program_spd_deviasi` decimal(16, 2) NULL DEFAULT NULL,
  `upload_paparan_program_spd_persen_deviasi` decimal(16, 2) NULL DEFAULT NULL,
  `upload_paparan_program_spm_pagu` decimal(16, 2) NULL DEFAULT NULL,
  `upload_paparan_program_spm_realisasi` decimal(16, 2) NULL DEFAULT NULL,
  `upload_paparan_program_spm_persen_realisasi` decimal(16, 2) NULL DEFAULT NULL,
  `upload_paparan_program_spm_sisa` decimal(16, 2) NULL DEFAULT NULL,
  `upload_paparan_program_spm_target` decimal(16, 2) NULL DEFAULT NULL,
  `upload_paparan_program_spm_persen_target` decimal(16, 2) NULL DEFAULT NULL,
  `upload_paparan_program_spm_deviasi` decimal(16, 2) NULL DEFAULT NULL,
  `upload_paparan_program_spm_persen_deviasi` decimal(16, 2) NULL DEFAULT NULL,
  `upload_paparan_program_create_by` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `upload_paparan_program_create_date` datetime NULL DEFAULT NULL,
  `upload_paparan_program_status` int NULL DEFAULT NULL,
  `upload_paparan_program_log_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`upload_paparan_program_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of trx_upload_paparan_program
-- ----------------------------
INSERT INTO `trx_upload_paparan_program` VALUES (1, 'ed32c49a-8578-453f-8567-e091f007c8a1', '0', '261b36ee-5a41-11ee-971e-f4a4757ae8c3', 2024, 1, '020.07.11', 'PROGRAM DUKUNGAN MANAJEMEN DAN PELAKSANAAN TUGAS TEKNIS LAINNYA DEWAN ENERGI NASIONAL', 56735740000.00, 53014248786.00, 93.44, 3721491214.00, 56174056174.00, 99.01, -3159807388.00, -5.57, 56735740000.00, 53014248786.00, 93.44, 3721491214.00, 56174056174.00, 99.01, -3159807388.00, -5.57, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:35', 1, NULL);
INSERT INTO `trx_upload_paparan_program` VALUES (2, '7555c304-cc91-4f68-8762-bea8795d5084', 'ed32c49a-8578-453f-8567-e091f007c8a1', '261b36ee-5a41-11ee-971e-f4a4757ae8c3', 2024, 1, '1909', 'Pengelolaan Manajemen Kesekretariatan Dewan Energi Nasional', 47435273000.00, 44301581098.00, 93.39, 3133691902.00, 46933347567.00, 98.94, -2631766469.00, -5.55, 47435273000.00, 44301581098.00, 93.39, 3133691902.00, 46933347567.00, 98.94, -2631766469.00, -5.55, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:35', 1, NULL);
INSERT INTO `trx_upload_paparan_program` VALUES (3, '07c9a31b-069a-4f17-b096-8325e3248829', '7555c304-cc91-4f68-8762-bea8795d5084', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, 1, '', 'BIRO UMUM', 47435273000.00, 44301581098.00, 93.39, 3133691902.00, 46933347567.00, 98.94, -2631766469.00, -5.55, 47435273000.00, 44301581098.00, 93.39, 3133691902.00, 46933347567.00, 98.94, -2631766469.00, -5.55, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:35', 1, NULL);
INSERT INTO `trx_upload_paparan_program` VALUES (4, '605a0f50-5b23-4590-bb74-2287eb2e69c5', '07c9a31b-069a-4f17-b096-8325e3248829', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, 1, '1', 'Pokja Perencanaan dan Keuangan', 3693924000.00, 3526425309.00, 95.47, 167498691.00, 3630149715.50, 98.27, -103724406.50, -2.81, 3693924000.00, 3526425309.00, 95.47, 167498691.00, 3630149715.50, 98.27, -103724406.50, -2.81, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:35', 1, NULL);
INSERT INTO `trx_upload_paparan_program` VALUES (5, 'a0579e31-0dd2-4437-8008-045ef2e23090', '07c9a31b-069a-4f17-b096-8325e3248829', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, 1, '2', 'Pokja Hukum dan Kepegawaian', 1911257000.00, 1782249309.00, 93.25, 129007691.00, 1896738598.00, 99.24, -114489289.00, -5.99, 1911257000.00, 1782249309.00, 93.25, 129007691.00, 1896738598.00, 99.24, -114489289.00, -5.99, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:35', 1, NULL);
INSERT INTO `trx_upload_paparan_program` VALUES (6, 'f9e1dc92-fbca-46d1-b024-3cfc6c059121', '07c9a31b-069a-4f17-b096-8325e3248829', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, 1, '3', 'Bagian Rumah Tangga', 1436777000.00, 1382819774.00, 96.24, 53957226.00, 1416040318.00, 98.56, -33220544.00, -2.31, 1436777000.00, 1382819774.00, 96.24, 53957226.00, 1416040318.00, 98.56, -33220544.00, -2.31, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:35', 1, NULL);
INSERT INTO `trx_upload_paparan_program` VALUES (7, 'd091bea3-7397-4a9d-9894-31551ae7daa8', '07c9a31b-069a-4f17-b096-8325e3248829', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, 1, '4', 'APK', 4643059000.00, 4119773279.00, 88.73, 523285721.00, 4768562945.67, 102.70, -648789666.67, -13.97, 4643059000.00, 4119773279.00, 88.73, 523285721.00, 4768562945.67, 102.70, -648789666.67, -13.97, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:35', 1, NULL);
INSERT INTO `trx_upload_paparan_program` VALUES (8, 'e059ac51-8403-44e9-b6e6-c9a47222fec8', '07c9a31b-069a-4f17-b096-8325e3248829', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, 1, '5', 'Pimpinan', 1143606000.00, 1089999228.00, 95.31, 53606772.00, 1013745000.00, 88.64, 76254228.00, 6.67, 1143606000.00, 1089999228.00, 95.31, 53606772.00, 1013745000.00, 88.64, 76254228.00, 6.67, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:35', 1, NULL);
INSERT INTO `trx_upload_paparan_program` VALUES (9, '1fe85462-6ef4-4100-b19a-2917f6047177', '07c9a31b-069a-4f17-b096-8325e3248829', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, 1, '6', 'Operasional Perkantoran', 12672424000.00, 11996632857.00, 94.67, 675791143.00, 12268786548.33, 96.81, -272153691.33, -2.15, 12672424000.00, 11996632857.00, 94.67, 675791143.00, 12268786548.33, 96.81, -272153691.33, -2.15, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:35', 1, NULL);
INSERT INTO `trx_upload_paparan_program` VALUES (10, '562a97d8-9033-4ae3-b852-26a6163fb9f4', '07c9a31b-069a-4f17-b096-8325e3248829', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, 1, '7', 'Belanja Bahan (Zoom)', 10800000.00, 10639129.00, 98.51, 160871.00, 10639129.00, 98.51, 0.00, 0.00, 10800000.00, 10639129.00, 98.51, 160871.00, 10639129.00, 98.51, 0.00, 0.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:35', 1, NULL);
INSERT INTO `trx_upload_paparan_program` VALUES (11, 'a1d896e9-56e5-4588-a728-64668f5c767e', '07c9a31b-069a-4f17-b096-8325e3248829', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, 1, '8', 'Peralatan dan Mesin', 149640000.00, 149600000.00, 99.97, 40000.00, 149600000.00, 99.97, 0.00, 0.00, 149640000.00, 149600000.00, 99.97, 40000.00, 149600000.00, 99.97, 0.00, 0.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:35', 1, NULL);
INSERT INTO `trx_upload_paparan_program` VALUES (12, '6d8d06d3-4264-42d4-ab59-9d4743e8bb15', '07c9a31b-069a-4f17-b096-8325e3248829', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, 1, '9', 'Gaji dan Tunjangan Honor APK', 21773786000.00, 20243442213.00, 92.97, 1530343787.00, 21779085312.50, 100.02, -1535643099.50, -7.05, 21773786000.00, 20243442213.00, 92.97, 1530343787.00, 21779085312.50, 100.02, -1535643099.50, -7.05, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:35', 1, NULL);
INSERT INTO `trx_upload_paparan_program` VALUES (13, 'a5d3b6dd-dbe9-47e5-8997-eb75d1874221', 'ed32c49a-8578-453f-8567-e091f007c8a1', '261b36ee-5a41-11ee-971e-f4a4757ae8c3', 2024, 1, '6382', 'Dukungan Teknis Pelaksanaan Tugas Dewan Energi Nasional', 9300467000.00, 8712667688.00, 93.68, 587799312.00, 9240708607.00, 99.36, -528040919.00, -5.68, 9300467000.00, 8712667688.00, 93.68, 587799312.00, 9240708607.00, 99.36, -528040919.00, -5.68, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:35', 1, NULL);
INSERT INTO `trx_upload_paparan_program` VALUES (14, '1283015e-8ad0-49ab-9700-b903f7549d18', 'a5d3b6dd-dbe9-47e5-8997-eb75d1874221', '261b3744-5a41-11ee-971e-f4a4757ae8c3', 2024, 1, '', 'BIRO FASILITASI KEBIJAKAN ENERGI DAN PERSIDANGAN', 5322184000.00, 5173016950.00, 97.20, 149167050.00, 5299591756.00, 99.58, -126574806.00, -2.38, 5322184000.00, 5173016950.00, 97.20, 149167050.00, 5299591756.00, 99.58, -126574806.00, -2.38, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:35', 1, NULL);
INSERT INTO `trx_upload_paparan_program` VALUES (15, '8638736f-27e9-4a2c-9aac-eec3befd1347', '1283015e-8ad0-49ab-9700-b903f7549d18', '261b3744-5a41-11ee-971e-f4a4757ae8c3', 2024, 1, '1', 'Pokja Kebijakan Energi', 1626680000.00, 1586717254.00, 97.54, 39962746.00, 1617298718.00, 99.42, -30581464.00, -1.88, 1626680000.00, 1586717254.00, 97.54, 39962746.00, 1617298718.00, 99.42, -30581464.00, -1.88, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:35', 1, NULL);
INSERT INTO `trx_upload_paparan_program` VALUES (16, '6e7055c8-7777-4c6d-b6e0-320d93a878bb', '1283015e-8ad0-49ab-9700-b903f7549d18', '261b3744-5a41-11ee-971e-f4a4757ae8c3', 2024, 1, '2', 'Pokja Humas dan Persidangan', 1551819000.00, 1516645447.00, 97.73, 35173553.00, 1543568715.00, 99.47, -26923268.00, -1.73, 1551819000.00, 1516645447.00, 97.73, 35173553.00, 1543568715.00, 99.47, -26923268.00, -1.73, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:35', 1, NULL);
INSERT INTO `trx_upload_paparan_program` VALUES (17, 'c898fd7e-c3c8-4a94-9a94-6506a4e943b3', '1283015e-8ad0-49ab-9700-b903f7549d18', '261b3744-5a41-11ee-971e-f4a4757ae8c3', 2024, 1, '3', 'Pokja RUEN', 1248276000.00, 1186168595.00, 95.02, 62107405.00, 1248276000.00, 100.00, -62107405.00, -4.98, 1248276000.00, 1186168595.00, 95.02, 62107405.00, 1248276000.00, 100.00, -62107405.00, -4.98, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:35', 1, NULL);
INSERT INTO `trx_upload_paparan_program` VALUES (18, '7dcefb8d-ebcc-48b5-b3df-650078dc216f', '1283015e-8ad0-49ab-9700-b903f7549d18', '261b3744-5a41-11ee-971e-f4a4757ae8c3', 2024, 1, '4', 'Pokja Kemandirian', 895409000.00, 883485654.00, 98.67, 11923346.00, 890448323.00, 99.45, -6962669.00, -0.78, 895409000.00, 883485654.00, 98.67, 11923346.00, 890448323.00, 99.45, -6962669.00, -0.78, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:35', 1, NULL);
INSERT INTO `trx_upload_paparan_program` VALUES (19, '9f782b5d-a550-449f-821e-6b08e0daf782', 'a5d3b6dd-dbe9-47e5-8997-eb75d1874221', '261b3748-5a41-11ee-971e-f4a4757ae8c3', 2024, 1, '', 'BIRO FASILITASI PENANGGULANGAN KRISIS DAN PENGAWASAN ENERGI', 3978283000.00, 3539650738.00, 88.97, 438632262.00, 3941116851.00, 99.07, -401466113.00, -10.09, 3978283000.00, 3539650738.00, 88.97, 438632262.00, 3941116851.00, 99.07, -401466113.00, -10.09, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:35', 1, NULL);
INSERT INTO `trx_upload_paparan_program` VALUES (20, '4ade89d4-0cbd-41bc-b199-9901c36e7423', '9f782b5d-a550-449f-821e-6b08e0daf782', '261b3748-5a41-11ee-971e-f4a4757ae8c3', 2024, 1, '1', 'Pokja Krisdaren', 1186376000.00, 1051400076.00, 88.62, 134975924.00, 1179200973.00, 99.40, -127800897.00, -10.77, 1186376000.00, 1051400076.00, 88.62, 134975924.00, 1179200973.00, 99.40, -127800897.00, -10.77, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:35', 1, NULL);
INSERT INTO `trx_upload_paparan_program` VALUES (21, 'f5a03ae7-c797-4d31-9dfe-266c5733d159', '9f782b5d-a550-449f-821e-6b08e0daf782', '261b3748-5a41-11ee-971e-f4a4757ae8c3', 2024, 1, '2', 'Pokja Ketahanan', 762983000.00, 695551955.00, 91.16, 67431045.00, 733405040.00, 96.12, -37853085.00, -4.96, 762983000.00, 695551955.00, 91.16, 67431045.00, 733405040.00, 96.12, -37853085.00, -4.96, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:35', 1, NULL);
INSERT INTO `trx_upload_paparan_program` VALUES (22, '6b30dcfa-ae95-4264-b07f-6fdb78e73688', '9f782b5d-a550-449f-821e-6b08e0daf782', '261b3748-5a41-11ee-971e-f4a4757ae8c3', 2024, 1, '3', 'Pokja Pengawasan', 2028924000.00, 1792698707.00, 88.36, 236225293.00, 2028510838.00, 99.98, -235812131.00, -11.62, 2028924000.00, 1792698707.00, 88.36, 236225293.00, 2028510838.00, 99.98, -235812131.00, -11.62, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:12:35', 1, NULL);
INSERT INTO `trx_upload_paparan_program` VALUES (23, 'ab5c7c05-2b78-48e7-8afd-e04b83b03dd9', '0', '261b36ee-5a41-11ee-971e-f4a4757ae8c3', 2024, 12, '020.07.11', 'PROGRAM DUKUNGAN MANAJEMEN DAN PELAKSANAAN TUGAS TEKNIS LAINNYA DEWAN ENERGI NASIONAL', 56735740000.00, 53014248786.00, 93.44, 3721491214.00, 56174056174.00, 99.01, -3159807388.00, -5.57, 56735740000.00, 53014248786.00, 93.44, 3721491214.00, 56174056174.00, 99.01, -3159807388.00, -5.57, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:04', 1, NULL);
INSERT INTO `trx_upload_paparan_program` VALUES (24, '16f2a060-9f30-47a2-b717-5659e032b317', 'ab5c7c05-2b78-48e7-8afd-e04b83b03dd9', '261b36ee-5a41-11ee-971e-f4a4757ae8c3', 2024, 12, '1909', 'Pengelolaan Manajemen Kesekretariatan Dewan Energi Nasional', 47435273000.00, 44301581098.00, 93.39, 3133691902.00, 46933347567.00, 98.94, -2631766469.00, -5.55, 47435273000.00, 44301581098.00, 93.39, 3133691902.00, 46933347567.00, 98.94, -2631766469.00, -5.55, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:04', 1, NULL);
INSERT INTO `trx_upload_paparan_program` VALUES (25, 'c7db46dc-2a6b-4a7a-9a3c-1310cc792a44', '16f2a060-9f30-47a2-b717-5659e032b317', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, 12, '', 'BIRO UMUM', 47435273000.00, 44301581098.00, 93.39, 3133691902.00, 46933347567.00, 98.94, -2631766469.00, -5.55, 47435273000.00, 44301581098.00, 93.39, 3133691902.00, 46933347567.00, 98.94, -2631766469.00, -5.55, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:04', 1, NULL);
INSERT INTO `trx_upload_paparan_program` VALUES (26, '86cdd1dd-425a-4735-9d0c-e7bfeff13312', 'c7db46dc-2a6b-4a7a-9a3c-1310cc792a44', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, 12, '1', 'Pokja Perencanaan dan Keuangan', 3693924000.00, 3526425309.00, 95.47, 167498691.00, 3630149715.50, 98.27, -103724406.50, -2.81, 3693924000.00, 3526425309.00, 95.47, 167498691.00, 3630149715.50, 98.27, -103724406.50, -2.81, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:04', 1, NULL);
INSERT INTO `trx_upload_paparan_program` VALUES (27, 'ced16268-9b8c-4c78-a60a-82113ef00865', 'c7db46dc-2a6b-4a7a-9a3c-1310cc792a44', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, 12, '2', 'Pokja Hukum dan Kepegawaian', 1911257000.00, 1782249309.00, 93.25, 129007691.00, 1896738598.00, 99.24, -114489289.00, -5.99, 1911257000.00, 1782249309.00, 93.25, 129007691.00, 1896738598.00, 99.24, -114489289.00, -5.99, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:04', 1, NULL);
INSERT INTO `trx_upload_paparan_program` VALUES (28, '969d7d64-8f78-4519-8bc3-b26234cd7417', 'c7db46dc-2a6b-4a7a-9a3c-1310cc792a44', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, 12, '3', 'Bagian Rumah Tangga', 1436777000.00, 1382819774.00, 96.24, 53957226.00, 1416040318.00, 98.56, -33220544.00, -2.31, 1436777000.00, 1382819774.00, 96.24, 53957226.00, 1416040318.00, 98.56, -33220544.00, -2.31, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:04', 1, NULL);
INSERT INTO `trx_upload_paparan_program` VALUES (29, '6360bdcb-3edd-49a2-ad3d-bb78ab6d4cd4', 'c7db46dc-2a6b-4a7a-9a3c-1310cc792a44', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, 12, '4', 'APK', 4643059000.00, 4119773279.00, 88.73, 523285721.00, 4768562945.67, 102.70, -648789666.67, -13.97, 4643059000.00, 4119773279.00, 88.73, 523285721.00, 4768562945.67, 102.70, -648789666.67, -13.97, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:04', 1, NULL);
INSERT INTO `trx_upload_paparan_program` VALUES (30, '696ec06b-d048-410a-ba48-b02f3eea5fce', 'c7db46dc-2a6b-4a7a-9a3c-1310cc792a44', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, 12, '5', 'Pimpinan', 1143606000.00, 1089999228.00, 95.31, 53606772.00, 1013745000.00, 88.64, 76254228.00, 6.67, 1143606000.00, 1089999228.00, 95.31, 53606772.00, 1013745000.00, 88.64, 76254228.00, 6.67, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:04', 1, NULL);
INSERT INTO `trx_upload_paparan_program` VALUES (31, '9472db9e-36b3-4629-8afa-df5ea00cea8b', 'c7db46dc-2a6b-4a7a-9a3c-1310cc792a44', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, 12, '6', 'Operasional Perkantoran', 12672424000.00, 11996632857.00, 94.67, 675791143.00, 12268786548.33, 96.81, -272153691.33, -2.15, 12672424000.00, 11996632857.00, 94.67, 675791143.00, 12268786548.33, 96.81, -272153691.33, -2.15, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:04', 1, NULL);
INSERT INTO `trx_upload_paparan_program` VALUES (32, '7b6c1429-b7ed-4610-80bf-5448a022f859', 'c7db46dc-2a6b-4a7a-9a3c-1310cc792a44', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, 12, '7', 'Belanja Bahan (Zoom)', 10800000.00, 10639129.00, 98.51, 160871.00, 10639129.00, 98.51, 0.00, 0.00, 10800000.00, 10639129.00, 98.51, 160871.00, 10639129.00, 98.51, 0.00, 0.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:04', 1, NULL);
INSERT INTO `trx_upload_paparan_program` VALUES (33, '93d4c5a2-d656-4581-a943-8d4536630b6a', 'c7db46dc-2a6b-4a7a-9a3c-1310cc792a44', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, 12, '8', 'Peralatan dan Mesin', 149640000.00, 149600000.00, 99.97, 40000.00, 149600000.00, 99.97, 0.00, 0.00, 149640000.00, 149600000.00, 99.97, 40000.00, 149600000.00, 99.97, 0.00, 0.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:04', 1, NULL);
INSERT INTO `trx_upload_paparan_program` VALUES (34, 'b2c97359-93c7-44e5-91dc-c2a71bc6a8bf', 'c7db46dc-2a6b-4a7a-9a3c-1310cc792a44', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, 12, '9', 'Gaji dan Tunjangan Honor APK', 21773786000.00, 20243442213.00, 92.97, 1530343787.00, 21779085312.50, 100.02, -1535643099.50, -7.05, 21773786000.00, 20243442213.00, 92.97, 1530343787.00, 21779085312.50, 100.02, -1535643099.50, -7.05, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:04', 1, NULL);
INSERT INTO `trx_upload_paparan_program` VALUES (35, '0567aaed-0175-4323-bd62-657e91064c79', 'ab5c7c05-2b78-48e7-8afd-e04b83b03dd9', '261b36ee-5a41-11ee-971e-f4a4757ae8c3', 2024, 12, '6382', 'Dukungan Teknis Pelaksanaan Tugas Dewan Energi Nasional', 9300467000.00, 8712667688.00, 93.68, 587799312.00, 9240708607.00, 99.36, -528040919.00, -5.68, 9300467000.00, 8712667688.00, 93.68, 587799312.00, 9240708607.00, 99.36, -528040919.00, -5.68, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:04', 1, NULL);
INSERT INTO `trx_upload_paparan_program` VALUES (36, 'a4a833eb-d603-4101-b794-eaba6af697d7', '0567aaed-0175-4323-bd62-657e91064c79', '261b3744-5a41-11ee-971e-f4a4757ae8c3', 2024, 12, '', 'BIRO FASILITASI KEBIJAKAN ENERGI DAN PERSIDANGAN', 5322184000.00, 5173016950.00, 97.20, 149167050.00, 5299591756.00, 99.58, -126574806.00, -2.38, 5322184000.00, 5173016950.00, 97.20, 149167050.00, 5299591756.00, 99.58, -126574806.00, -2.38, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:04', 1, NULL);
INSERT INTO `trx_upload_paparan_program` VALUES (37, 'dbab54cf-e883-4dca-a66c-5c2e3878de4d', 'a4a833eb-d603-4101-b794-eaba6af697d7', '261b3744-5a41-11ee-971e-f4a4757ae8c3', 2024, 12, '1', 'Pokja Kebijakan Energi', 1626680000.00, 1586717254.00, 97.54, 39962746.00, 1617298718.00, 99.42, -30581464.00, -1.88, 1626680000.00, 1586717254.00, 97.54, 39962746.00, 1617298718.00, 99.42, -30581464.00, -1.88, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:04', 1, NULL);
INSERT INTO `trx_upload_paparan_program` VALUES (38, '876594e1-b5ac-49d5-9cae-0a62f884992f', 'a4a833eb-d603-4101-b794-eaba6af697d7', '261b3744-5a41-11ee-971e-f4a4757ae8c3', 2024, 12, '2', 'Pokja Humas dan Persidangan', 1551819000.00, 1516645447.00, 97.73, 35173553.00, 1543568715.00, 99.47, -26923268.00, -1.73, 1551819000.00, 1516645447.00, 97.73, 35173553.00, 1543568715.00, 99.47, -26923268.00, -1.73, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:04', 1, NULL);
INSERT INTO `trx_upload_paparan_program` VALUES (39, 'ded4d390-d60e-4a9a-bf83-961d60947a6f', 'a4a833eb-d603-4101-b794-eaba6af697d7', '261b3744-5a41-11ee-971e-f4a4757ae8c3', 2024, 12, '3', 'Pokja RUEN', 1248276000.00, 1186168595.00, 95.02, 62107405.00, 1248276000.00, 100.00, -62107405.00, -4.98, 1248276000.00, 1186168595.00, 95.02, 62107405.00, 1248276000.00, 100.00, -62107405.00, -4.98, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:04', 1, NULL);
INSERT INTO `trx_upload_paparan_program` VALUES (40, 'e2248873-1964-4ada-ac8d-7794aa47d15e', 'a4a833eb-d603-4101-b794-eaba6af697d7', '261b3744-5a41-11ee-971e-f4a4757ae8c3', 2024, 12, '4', 'Pokja Kemandirian', 895409000.00, 883485654.00, 98.67, 11923346.00, 890448323.00, 99.45, -6962669.00, -0.78, 895409000.00, 883485654.00, 98.67, 11923346.00, 890448323.00, 99.45, -6962669.00, -0.78, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:04', 1, NULL);
INSERT INTO `trx_upload_paparan_program` VALUES (41, 'af7042d4-c97d-4235-bc29-2c8bcbe1d30c', '0567aaed-0175-4323-bd62-657e91064c79', '261b3748-5a41-11ee-971e-f4a4757ae8c3', 2024, 12, '', 'BIRO FASILITASI PENANGGULANGAN KRISIS DAN PENGAWASAN ENERGI', 3978283000.00, 3539650738.00, 88.97, 438632262.00, 3941116851.00, 99.07, -401466113.00, -10.09, 3978283000.00, 3539650738.00, 88.97, 438632262.00, 3941116851.00, 99.07, -401466113.00, -10.09, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:04', 1, NULL);
INSERT INTO `trx_upload_paparan_program` VALUES (42, '2ac777b6-5c58-458a-8123-4e2897412c1e', 'af7042d4-c97d-4235-bc29-2c8bcbe1d30c', '261b3748-5a41-11ee-971e-f4a4757ae8c3', 2024, 12, '1', 'Pokja Krisdaren', 1186376000.00, 1051400076.00, 88.62, 134975924.00, 1179200973.00, 99.40, -127800897.00, -10.77, 1186376000.00, 1051400076.00, 88.62, 134975924.00, 1179200973.00, 99.40, -127800897.00, -10.77, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:04', 1, NULL);
INSERT INTO `trx_upload_paparan_program` VALUES (43, '2858f47a-6c77-4fe9-8097-8e419725fc57', 'af7042d4-c97d-4235-bc29-2c8bcbe1d30c', '261b3748-5a41-11ee-971e-f4a4757ae8c3', 2024, 12, '2', 'Pokja Ketahanan', 762983000.00, 695551955.00, 91.16, 67431045.00, 733405040.00, 96.12, -37853085.00, -4.96, 762983000.00, 695551955.00, 91.16, 67431045.00, 733405040.00, 96.12, -37853085.00, -4.96, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:04', 1, NULL);
INSERT INTO `trx_upload_paparan_program` VALUES (44, '2e83baa0-06e0-4469-84e8-1292bf8cfe94', 'af7042d4-c97d-4235-bc29-2c8bcbe1d30c', '261b3748-5a41-11ee-971e-f4a4757ae8c3', 2024, 12, '3', 'Pokja Pengawasan', 2028924000.00, 1792698707.00, 88.36, 236225293.00, 2028510838.00, 99.98, -235812131.00, -11.62, 2028924000.00, 1792698707.00, 88.36, 236225293.00, 2028510838.00, 99.98, -235812131.00, -11.62, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:04', 1, NULL);

-- ----------------------------
-- Table structure for trx_upload_work_program
-- ----------------------------
DROP TABLE IF EXISTS `trx_upload_work_program`;
CREATE TABLE `trx_upload_work_program`  (
  `upload_work_program_id` int NOT NULL AUTO_INCREMENT,
  `upload_work_program_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `upload_work_program_parent_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `upload_work_program_work_unit_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `upload_work_program_year` int NULL DEFAULT NULL,
  `upload_work_program_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `upload_work_program_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `upload_work_program_create_by` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `upload_work_program_create_date` datetime NULL DEFAULT NULL,
  `upload_work_program_status` int NULL DEFAULT NULL,
  `upload_work_program_log_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`upload_work_program_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 105 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of trx_upload_work_program
-- ----------------------------
INSERT INTO `trx_upload_work_program` VALUES (1, '218e556e-25ba-4b25-a779-c41195a155b2', '0', '261b36ee-5a41-11ee-971e-f4a4757ae8c3', 2024, '020.07.11', 'PROGRAM DUKUNGAN MANAJEMEN DAN PELAKSANAAN TUGAS TEKNIS LAINNYA DEWAN ENERGI NASIONAL', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (2, '53427feb-63ca-499e-a215-e96c38bae4b6', '218e556e-25ba-4b25-a779-c41195a155b2', '261b36ee-5a41-11ee-971e-f4a4757ae8c3', 2024, '1909', 'Pengelolaan Manajemen Kesekretariatan Dewan Energi Nasional', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (3, 'ad333241-0a69-44ea-b2b7-efd2652c8f81', '53427feb-63ca-499e-a215-e96c38bae4b6', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '', 'BIRO UMUM', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (4, '90c7f4dd-ffe2-40b3-a749-b3cb22e2379d', 'ad333241-0a69-44ea-b2b7-efd2652c8f81', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '1', 'Bagian Perencanaan dan Keuangan', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (5, 'fd5912d3-7722-4adb-af4c-92cc530f2d1e', '90c7f4dd-ffe2-40b3-a749-b3cb22e2379d', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '521211', 'Belanja Bahan', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (6, 'f85a89ea-72ba-4dbb-957c-8bbe1d7b59f9', '90c7f4dd-ffe2-40b3-a749-b3cb22e2379d', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '521213', 'Belanja Honor Output Kegiatan', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (7, '6a73c2f5-739e-4696-a9f0-7291e525bd56', '90c7f4dd-ffe2-40b3-a749-b3cb22e2379d', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '521811', 'Belanja Barang Persediaan Barang Konsumsi (ATK)', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (8, 'de00de18-2307-424b-b65e-ed352fdb005a', '90c7f4dd-ffe2-40b3-a749-b3cb22e2379d', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '522151', 'Belanja Jasa Profesi (NARSUM)', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (9, 'ea2677a2-2a85-4cc2-8bb0-56b0a2cdea9d', '90c7f4dd-ffe2-40b3-a749-b3cb22e2379d', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '524111', 'Belanja Perjalanan Dinas', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (10, '4e62d446-e7fd-49f4-bf8c-eafbc5a49c14', '90c7f4dd-ffe2-40b3-a749-b3cb22e2379d', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '524113', 'Belanja Perjalanan Dinas Dalam Kota', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (11, 'f6eff89f-25a5-4100-a576-52e0b2954066', 'ad333241-0a69-44ea-b2b7-efd2652c8f81', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '2', 'Bagian Hukum dan Kepegawaian', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (12, 'dd9a016b-2b7a-4159-88af-c425bc668f12', 'f6eff89f-25a5-4100-a576-52e0b2954066', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '522191', 'Belanja Jasa Lainnya', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (13, '97aa3766-c142-433e-9a0f-191fd4886a23', 'f6eff89f-25a5-4100-a576-52e0b2954066', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '524111', 'Belanja Perjalanan Dinas Biasa', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (14, '823201d6-b733-4ad1-a4e7-ff4fe25f2934', 'ad333241-0a69-44ea-b2b7-efd2652c8f81', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '3', 'Bagian Rumah Tangga', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (15, '4de179b3-a6e8-405b-8fef-505ae43f8f95', 'ad333241-0a69-44ea-b2b7-efd2652c8f81', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '4', 'APK', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (16, '47dad614-db71-4200-860a-d3cfb8794fd3', '4de179b3-a6e8-405b-8fef-505ae43f8f95', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '521111', 'Belanja Kebutuhan Perkantoran (konsumsi)', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (17, '7d0c808a-352a-43b9-8857-dbd1002241da', '4de179b3-a6e8-405b-8fef-505ae43f8f95', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '524119', 'Belanja Perjalanan Dinas Paket Meeting Luar Kota', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (18, '1facf35e-6ad6-4902-8ce5-4c5962388232', '4de179b3-a6e8-405b-8fef-505ae43f8f95', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '524211', 'Belanja Perjalanan Dinas Biasa - Luar Negeri', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (19, '9818cd5d-06e5-43a3-b38f-1bb56ee3682e', 'ad333241-0a69-44ea-b2b7-efd2652c8f81', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '4', 'Pimpinan', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (20, '03cde798-2cbc-408c-ada2-6e3777c188b9', 'ad333241-0a69-44ea-b2b7-efd2652c8f81', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '5', 'Operasional dan Pemeliharaan Kantor', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (21, '6f86f90b-2f14-44b4-89d9-5776c60d977b', '03cde798-2cbc-408c-ada2-6e3777c188b9', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, 'A', 'Poliklinik dan Obat-obatan', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (22, '4cc7bc89-15e0-4b1d-aa12-ea3290303b63', '6f86f90b-2f14-44b4-89d9-5776c60d977b', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '521811', 'Belanja Barang Persediaan Barang Konsumsi', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (23, 'f6164b24-d144-447e-a2b1-6abe7f763a1d', '03cde798-2cbc-408c-ada2-6e3777c188b9', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, 'B', 'Pengadaan Pakaian Kerja', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (24, '95edab7b-c78b-4807-a5df-6e9552142389', 'f6164b24-d144-447e-a2b1-6abe7f763a1d', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '521111', 'Belanja Keperluan Perkantoran', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (25, '2851611c-0d5a-480f-b242-3d05f3524855', '03cde798-2cbc-408c-ada2-6e3777c188b9', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, 'C', 'Pertemuan/Tamu', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (26, '077459a3-09f9-4f7c-aaad-347dec3de9c3', '03cde798-2cbc-408c-ada2-6e3777c188b9', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, 'E', 'Perawatan Gedung Kantor dan Rumah Negara', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (27, '4931ce69-cbae-4a62-b20c-226bae375f42', '077459a3-09f9-4f7c-aaad-347dec3de9c3', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '523111', 'Belanja Pemeliharaan Gedung dan Bangunan', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (28, 'd0192e8f-f175-4d01-b2bd-01e823d2ba30', '077459a3-09f9-4f7c-aaad-347dec3de9c3', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '523112', 'Belanja Barang Persediaan Pemeliharaan Gedung dan Bangunan', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (29, '35f6aefd-00cf-4af1-a798-32a7099e594f', '03cde798-2cbc-408c-ada2-6e3777c188b9', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, 'F', 'Perbaikan peralatan kantor', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (30, '8debfa1c-d185-435e-abfd-dc11529cd7d5', '35f6aefd-00cf-4af1-a798-32a7099e594f', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '523121', 'Belanja Pemeliharaan Peralatan dan Mesin', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (31, 'e789080c-3968-4806-9da9-b0ffbe625a4a', '35f6aefd-00cf-4af1-a798-32a7099e594f', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '523133', 'Belanja Pemeliharaan Jaringan', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (32, 'a0f006cd-2aa6-4464-ad89-b90f439678c4', '03cde798-2cbc-408c-ada2-6e3777c188b9', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, 'G', 'Perawatan Kendaraan Bermotor Roda 4/6/10', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (33, 'f7a47e85-4796-4bf2-b991-9be2513764ab', '03cde798-2cbc-408c-ada2-6e3777c188b9', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, 'H', 'Perawatan Kendaraan Bermotor Roda 2', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (34, '6ac2a99e-2f9e-428f-ba46-69729b2609a9', '03cde798-2cbc-408c-ada2-6e3777c188b9', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, 'I', 'Langganan daya dan Jasa', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (35, 'cb7addbd-5418-4491-8a1e-05c676eb74b0', '6ac2a99e-2f9e-428f-ba46-69729b2609a9', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '522111', 'Belanja Langganan Listrik', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (36, '8c84ac82-50d3-4529-a56f-f2389bfce91d', '6ac2a99e-2f9e-428f-ba46-69729b2609a9', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '522112', 'Belanja Langganan Telepon', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (37, '06a858d2-449f-4a4c-926a-4707ce4729de', '6ac2a99e-2f9e-428f-ba46-69729b2609a9', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '522113', 'Belanja Langganan Air', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (38, '4a30dcb1-e1a0-4b79-86dd-682ff583f255', '6ac2a99e-2f9e-428f-ba46-69729b2609a9', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '522119', 'Belanja Langganan Daya dan Jasa Lainnya', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (39, '0be10129-7420-4ea3-ba44-97a86daa5c6f', '03cde798-2cbc-408c-ada2-6e3777c188b9', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, 'J', 'Jasa pos/giro/sertifikat', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (40, 'a26098fd-75ec-40fd-b5ec-87ef2efb1737', '0be10129-7420-4ea3-ba44-97a86daa5c6f', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '521114', 'Belanja Pengiriman Surat Dinas Pos Pusat', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (41, '45b23872-25ff-4b12-b062-dc83cc4d711a', '0be10129-7420-4ea3-ba44-97a86daa5c6f', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '521813', 'Belanja Barang Persediaan Pita Cukai, Meterai dan Leges', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (42, '54ec428f-29aa-40f0-99be-a322d8b07d26', '03cde798-2cbc-408c-ada2-6e3777c188b9', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, 'K', 'Pengadaan Toner dan barang cetakan Setjen DEN', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (43, '480b9a94-976f-4a37-a849-d73432a1d668', '54ec428f-29aa-40f0-99be-a322d8b07d26', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '521119', 'Belanja Barang Operasional Lainnya', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (44, 'd1b3d5b8-8e60-49e7-a404-333fc5738b57', '03cde798-2cbc-408c-ada2-6e3777c188b9', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, 'L', 'Kebutuhan sehari-hari perkantoran', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (45, 'cd9174f2-9e83-4b76-a251-436123816f41', '03cde798-2cbc-408c-ada2-6e3777c188b9', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, 'M', 'Honor Satpam, Pramubakti, petugas kebersihan,pengemudi dan teknisi', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (46, '0d36c268-bf22-49ee-b3ae-9c58f30e568a', '03cde798-2cbc-408c-ada2-6e3777c188b9', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, 'N', 'Layanan Dukungan Pengelola Operasional Satker', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (47, '858063d3-0f42-46fe-8184-680f5eed4c9d', '0d36c268-bf22-49ee-b3ae-9c58f30e568a', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '521115', 'Belanja Honor Operasional Satuan Kerja', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (48, 'dc500477-8353-4fc4-9d57-ddeddaf94627', '0d36c268-bf22-49ee-b3ae-9c58f30e568a', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '524111', 'Perjalanan Dinas Biasa', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (49, 'dc7e0384-da2b-4d9b-8864-8e247722c2ca', '03cde798-2cbc-408c-ada2-6e3777c188b9', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, 'O', 'Sewa Peralatan Kantor', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (50, '4780526f-720b-4dee-ba34-4536a7b6b22d', 'dc7e0384-da2b-4d9b-8864-8e247722c2ca', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '522141', 'Belanja Sewa', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (51, '0ae0da9b-5069-4721-94c4-e2dc6ac9a3f0', '03cde798-2cbc-408c-ada2-6e3777c188b9', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, 'P', 'Sewa kendaraan dinas jabatan', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (52, 'e04a8d97-a5e5-4623-99ca-31754240f290', '03cde798-2cbc-408c-ada2-6e3777c188b9', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, 'Q', 'Dukungan Operasional Kerumahtanggaan', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (53, '108f9b9f-8c50-4bc2-9978-6e9cbfb0f87e', 'ad333241-0a69-44ea-b2b7-efd2652c8f81', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '6', 'Pengadaan perangkat pengolah data dan komunikasi', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (54, '7591a3d4-ce4b-4ad6-9ec5-7142aa5f493f', '108f9b9f-8c50-4bc2-9978-6e9cbfb0f87e', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, 'A', 'Melakukan Penyelenggaraan Layanan Rapat Online', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (55, 'b9827ee7-68c2-4f5a-972b-a09b275d1646', 'ad333241-0a69-44ea-b2b7-efd2652c8f81', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '7', 'Peralatan dan Mesin', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (56, '33daee68-3bde-4e42-94ba-7e6e5bec4d11', 'b9827ee7-68c2-4f5a-972b-a09b275d1646', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '532111', 'Belanja Modal Peralatan dan Mesin', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (57, '4c25b3e9-297e-41e0-8dd8-a5e056b5dc25', 'ad333241-0a69-44ea-b2b7-efd2652c8f81', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '8', 'Gaji dan Tunjangan Honor APK', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (58, '741f0276-154f-4576-b1de-190291ab8a27', '4c25b3e9-297e-41e0-8dd8-a5e056b5dc25', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '511111', 'Belanja Gaji Pokok PNS', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (59, '4908d4ae-b418-4ccb-a62e-a0462e14d5af', '4c25b3e9-297e-41e0-8dd8-a5e056b5dc25', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '511119', 'Belanja Pembulatan Gaji PNS', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (60, '63933a85-00b6-41de-8408-fd816562d6f1', '4c25b3e9-297e-41e0-8dd8-a5e056b5dc25', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '511121', 'Belanja Tunj. Suami/Istri PNS', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (61, 'c4d6af81-0b1e-4f33-840a-b759f98759e2', '4c25b3e9-297e-41e0-8dd8-a5e056b5dc25', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '511122', 'Belanja Tunj. Anak PNS', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (62, '80314ddf-d6ce-44eb-ba9f-4c36312fe061', '4c25b3e9-297e-41e0-8dd8-a5e056b5dc25', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '511123', 'Belanja Tunj. Struktural PNS', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (63, 'eb0f277e-1c1b-42ac-92b7-ba462e91cdac', '4c25b3e9-297e-41e0-8dd8-a5e056b5dc25', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '511124', 'Belanja Tunj. Fungsional PNS', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (64, '2c83571e-b539-452b-a74d-00cb97512fe7', '4c25b3e9-297e-41e0-8dd8-a5e056b5dc25', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '511125', 'Belanja Tunj. PPh PNS', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (65, '63d5919e-bb45-4222-b34e-0241d3043d83', '4c25b3e9-297e-41e0-8dd8-a5e056b5dc25', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '511126', 'Belanja Tunj. Beras PNS', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (66, 'ec51d416-26db-438f-bcde-5804fab89131', '4c25b3e9-297e-41e0-8dd8-a5e056b5dc25', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '511129', 'Belanja Uang Makan PNS', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (67, '0ca77cf5-a2ca-40bc-94a1-4ef7f45adf68', '4c25b3e9-297e-41e0-8dd8-a5e056b5dc25', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '511151', 'Belanja Tunjangan Umum PNS', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (68, 'e8d41009-4257-424f-859b-9e0d656b8af5', '4c25b3e9-297e-41e0-8dd8-a5e056b5dc25', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '511611', 'Belanja Gaji Pokok PPPK', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (69, '76b15ed9-552e-4408-b9a0-1452c83d7c8f', '4c25b3e9-297e-41e0-8dd8-a5e056b5dc25', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '511619', 'Belanja Pembulatan Gaji PPPK', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (70, 'c44a09de-038d-4343-98a4-be5e5149e528', '4c25b3e9-297e-41e0-8dd8-a5e056b5dc25', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '511621', 'Belanja Tunjangan Suami/Istri PPPK', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (71, '96891363-0dc4-4910-8a63-028dea76f92b', '4c25b3e9-297e-41e0-8dd8-a5e056b5dc25', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '511622', 'Belanja Tunjangan Anak PPPK', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (72, '650ab252-fa6a-498b-8e64-e7b3b1e03613', '4c25b3e9-297e-41e0-8dd8-a5e056b5dc25', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '511624', 'Belanja Tunjangan Fungsional PPPK', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (73, 'b12bdf39-a35b-41c6-b7c9-ac517ef8ae99', '4c25b3e9-297e-41e0-8dd8-a5e056b5dc25', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '511625', 'Belanja Tunjangan Beras PPPK', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (74, 'dff372b8-b640-411e-83e6-21254aed1ef1', '4c25b3e9-297e-41e0-8dd8-a5e056b5dc25', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '511628', 'Belanja Uang Makan PPPK', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (75, 'bb356424-1bb0-4f86-bce0-28f3942c8c01', '4c25b3e9-297e-41e0-8dd8-a5e056b5dc25', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '512111', 'Belanja Uang Honor Tetap', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (76, '36def224-6745-4c93-9304-89fefdadf8c0', '4c25b3e9-297e-41e0-8dd8-a5e056b5dc25', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '512211', 'Belanja Uang Lembur', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (77, '41623e52-96a0-4c61-ab18-7691ade3dccd', '4c25b3e9-297e-41e0-8dd8-a5e056b5dc25', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '512411', 'Belanja Pegawai (Tunjangan Khusus/Kegiatan/Kinerja)', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (78, 'a3258631-fe7e-4796-b2fd-99a0ccf3a7db', '4c25b3e9-297e-41e0-8dd8-a5e056b5dc25', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '512414', 'Belanja Pegawai Tunjangan Khusus/Kegiatan/Kinerja PPPK', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (79, '5cd2e41e-6be4-40ce-8298-04c4be79167b', '218e556e-25ba-4b25-a779-c41195a155b2', '261b36ee-5a41-11ee-971e-f4a4757ae8c3', 2024, '6382', 'Dukungan Teknis Pelaksanaan Tugas Dewan Energi Nasional', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (80, 'dd4e2c4d-cd55-4f89-ad5b-a1f202b88111', '5cd2e41e-6be4-40ce-8298-04c4be79167b', '261b3744-5a41-11ee-971e-f4a4757ae8c3', 2024, '', 'BIRO FASILITASI KEBIJAKAN ENERGI DAN PERSIDANGAN', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (81, '7b20b362-1314-403e-869e-46e71caedc39', 'dd4e2c4d-cd55-4f89-ad5b-a1f202b88111', '261b3744-5a41-11ee-971e-f4a4757ae8c3', 2024, '1', 'Bagian Kebijakan Energi', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (82, '37267344-8826-4178-b156-0ad46aace99f', '7b20b362-1314-403e-869e-46e71caedc39', '261b3744-5a41-11ee-971e-f4a4757ae8c3', 2024, '521211', 'Belanja Bahan', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (83, '5686a8ca-09df-4051-9458-6943e53c4e2e', '7b20b362-1314-403e-869e-46e71caedc39', '261b3744-5a41-11ee-971e-f4a4757ae8c3', 2024, '521213', 'Belanja Honor Output Kegiatan', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (84, 'f1d3e13b-ef63-492b-b4a4-e555697a228b', '7b20b362-1314-403e-869e-46e71caedc39', '261b3744-5a41-11ee-971e-f4a4757ae8c3', 2024, '521811', 'Belanja Barang Persediaan Barang Konsumsi (ATK)', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (85, 'c58c8a91-2f35-441e-9cb4-ebad831ac427', '7b20b362-1314-403e-869e-46e71caedc39', '261b3744-5a41-11ee-971e-f4a4757ae8c3', 2024, '522151', 'Belanja Jasa Profesi (NARSUM)', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (86, 'e452b2a9-5751-46fb-a841-1b7e33da354c', '7b20b362-1314-403e-869e-46e71caedc39', '261b3744-5a41-11ee-971e-f4a4757ae8c3', 2024, '524111', 'Belanja Perjalanan Dinas Biasa', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (87, 'fe79d253-a08a-46d9-b4d4-1a2b2e12eff6', 'dd4e2c4d-cd55-4f89-ad5b-a1f202b88111', '261b3744-5a41-11ee-971e-f4a4757ae8c3', 2024, '2', 'Bagian Humas dan Persidangan', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (88, '6f992539-538e-4c15-8f61-117c3c64e5db', 'dd4e2c4d-cd55-4f89-ad5b-a1f202b88111', '261b3744-5a41-11ee-971e-f4a4757ae8c3', 2024, '3', 'Bagian RUEN', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (89, '507673d9-5d22-4f00-8b4a-a41bb033dfcf', '6f992539-538e-4c15-8f61-117c3c64e5db', '261b3744-5a41-11ee-971e-f4a4757ae8c3', 2024, '524111', 'Belanja Perjalanan Dinas', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (90, '7f049001-fe39-42a0-8104-a0d0cb98f903', '6f992539-538e-4c15-8f61-117c3c64e5db', '261b3744-5a41-11ee-971e-f4a4757ae8c3', 2024, '524113', 'Belanja Perjalanan Dinas Dalam Kota', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (91, '27734fd9-bde8-4865-aa10-99d10e939860', '6f992539-538e-4c15-8f61-117c3c64e5db', '261b3744-5a41-11ee-971e-f4a4757ae8c3', 2024, '524211', 'Belanja Perjalanan Dinas Biasa - Luar Negeri', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (92, '7b2d98c9-2fc8-489b-a9bc-d80dd16f54a4', 'dd4e2c4d-cd55-4f89-ad5b-a1f202b88111', '261b3744-5a41-11ee-971e-f4a4757ae8c3', 2024, '4', 'Bagian Kemandirian', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (93, '32851a29-210b-48c1-b109-6a193175396b', '5cd2e41e-6be4-40ce-8298-04c4be79167b', '261b3748-5a41-11ee-971e-f4a4757ae8c3', 2024, '', 'BIRO FASILITASI PENANGGULANGAN KRISIS DAN PENGAWASAN ENERGI', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (94, 'cf9464b5-4bff-423f-8f48-7f63936a6d17', '32851a29-210b-48c1-b109-6a193175396b', '261b3748-5a41-11ee-971e-f4a4757ae8c3', 2024, '1', 'Bagian Krisdaren', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (95, '69520c54-5c1c-46a9-94ea-7aa49dc2775a', 'cf9464b5-4bff-423f-8f48-7f63936a6d17', '261b3748-5a41-11ee-971e-f4a4757ae8c3', 2024, '521211', 'Belanja Bahan', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (96, '2a3040ba-99de-438a-a7a9-2c0399156f3b', 'cf9464b5-4bff-423f-8f48-7f63936a6d17', '261b3748-5a41-11ee-971e-f4a4757ae8c3', 2024, '521213', 'Belanja Honor Output Kegiatan', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (97, '1d95c303-723a-4728-a87c-4390e8637883', 'cf9464b5-4bff-423f-8f48-7f63936a6d17', '261b3748-5a41-11ee-971e-f4a4757ae8c3', 2024, '521811', 'Belanja Barang Persediaan Barang Konsumsi (ATK)', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (98, '8088f06b-5978-4d90-ae9f-b6b98fad17f6', 'cf9464b5-4bff-423f-8f48-7f63936a6d17', '261b3748-5a41-11ee-971e-f4a4757ae8c3', 2024, '522151', 'Belanja Jasa Profesi (NARSUM)', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (99, '1d2e0687-42a7-464d-8b41-36550d0b4be1', 'cf9464b5-4bff-423f-8f48-7f63936a6d17', '261b3748-5a41-11ee-971e-f4a4757ae8c3', 2024, '524111', 'Belanja Perjalanan Dinas Biasa', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (100, '9ad67839-64e9-451f-b623-ad2e8f4c9734', 'cf9464b5-4bff-423f-8f48-7f63936a6d17', '261b3748-5a41-11ee-971e-f4a4757ae8c3', 2024, '524113', 'Belanja Perjalanan Dinas Dalam Kota', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (101, 'c4e8a1bc-0526-4d09-8281-6de2b88ae52c', '32851a29-210b-48c1-b109-6a193175396b', '261b3748-5a41-11ee-971e-f4a4757ae8c3', 2024, '2', 'Bagian Ketahanan', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (102, '133de6ae-9c73-4cb2-aa7c-b5a71625f3a3', 'c4e8a1bc-0526-4d09-8281-6de2b88ae52c', '261b3748-5a41-11ee-971e-f4a4757ae8c3', 2024, '524119', 'Belanja Perjalanan Dinas Paket Meeting Luar Kota', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (103, '368f4187-60f0-448d-9944-cda4663dcb5b', 'c4e8a1bc-0526-4d09-8281-6de2b88ae52c', '261b3748-5a41-11ee-971e-f4a4757ae8c3', 2024, '524211', 'Belanja Perjalanan Dinas Luar Negeri', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (104, 'f86ccc27-e378-4bb4-93c5-0abcba98e534', '32851a29-210b-48c1-b109-6a193175396b', '261b3748-5a41-11ee-971e-f4a4757ae8c3', 2024, '3', 'Bagian Pengawasan', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-12-17 18:16:05', 1, NULL);

-- ----------------------------
-- Table structure for trx_work_programs
-- ----------------------------
DROP TABLE IF EXISTS `trx_work_programs`;
CREATE TABLE `trx_work_programs`  (
  `work_program_id` int NOT NULL AUTO_INCREMENT,
  `work_program_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `work_program_parent_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `work_program_year` int NULL DEFAULT NULL,
  `work_program_work_unit_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `work_program_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `work_program_name` varchar(4400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `work_program_is_last_child` int NULL DEFAULT NULL,
  `work_program_description` varchar(4400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `work_program_create_by` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `work_program_create_date` datetime NULL DEFAULT NULL,
  `work_program_update_by` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `work_program_update_date` datetime NULL DEFAULT NULL,
  `work_program_log_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `work_program_status` int NULL DEFAULT NULL,
  PRIMARY KEY (`work_program_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 151 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of trx_work_programs
-- ----------------------------

-- ----------------------------
-- Table structure for trx_work_programs_new
-- ----------------------------
DROP TABLE IF EXISTS `trx_work_programs_new`;
CREATE TABLE `trx_work_programs_new`  (
  `work_program_id` int NOT NULL AUTO_INCREMENT,
  `work_program_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `work_program_year` int NULL DEFAULT NULL,
  `work_program_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `work_program_name` varchar(4400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `work_program_create_by` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `work_program_create_date` datetime NULL DEFAULT NULL,
  `work_program_log_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `work_program_status` int NULL DEFAULT NULL,
  PRIMARY KEY (`work_program_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of trx_work_programs_new
-- ----------------------------

-- ----------------------------
-- View structure for view_data_anggaran
-- ----------------------------
DROP VIEW IF EXISTS `view_data_anggaran`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_data_anggaran` AS with `datas` as (select `c`.`work_unit_id` AS `work_unit_id`,`c`.`work_unit_code` AS `work_unit_code`,`c`.`work_unit_name` AS `work_unit_name`,`c`.`work_unit_sort` AS `work_unit_sort`,`b`.`budget_year` AS `budget_year`,`b`.`budget_month` AS `budget_month`,sum(`b`.`budget_plafon`) AS `plafon`,concat(format(sum(`b`.`budget_plafon`),0,'id_ID')) AS `plafon_format`,concat(format(sum(`b`.`budget_realization`),0,'id_ID')) AS `realisasi_format`,sum(`b`.`budget_realization`) AS `realisasi`,((sum(`b`.`budget_realization`) / sum(`b`.`budget_plafon`)) * 100) AS `presentasi_realisasi`,(sum(`b`.`budget_plafon`) - sum(`b`.`budget_realization`)) AS `total_fund`,(select sum(`x`.`target_value`) from `trx_target` `x` where ((`x`.`target_status` = 1) and (`x`.`target_log_uuid` is null) and (`x`.`target_year` = `b`.`budget_year`) and (`x`.`target_month` <= `b`.`budget_month`) and (`x`.`target_work_unit_uuid` = `c`.`work_unit_uuid`))) AS `target`,(select ((sum(`x`.`sppd_pegawai`) + sum(`x`.`sppd_barang`)) + sum(`x`.`sppd_modal`)) from `trx_sppd` `x` where ((`x`.`sppd_status` = 1) and (`x`.`sppd_log_uuid` is null) and (`x`.`sppd_year` = `b`.`budget_year`) and (`x`.`sppd_month` <= `b`.`budget_month`) and (`x`.`sppd_work_unit_uuid` = `c`.`work_unit_uuid`))) AS `sppd` from ((`trx_work_programs` `a` join `trx_budgets` `b` on((`a`.`work_program_uuid` = `b`.`budget_work_program_uuid`))) join `mst_work_units` `c` on(((`a`.`work_program_work_unit_uuid` = `c`.`work_unit_uuid`) and (`c`.`work_unit_log_uuid` is null)))) where (length(`a`.`work_program_code`) = 6) group by `c`.`work_unit_id`,`c`.`work_unit_code`,`c`.`work_unit_name`,`c`.`work_unit_sort`,`b`.`budget_year`,`b`.`budget_month`) select `aa`.`work_unit_id` AS `work_unit_id`,`aa`.`work_unit_code` AS `work_unit_code`,`aa`.`work_unit_name` AS `work_unit_name`,`aa`.`work_unit_sort` AS `work_unit_sort`,`aa`.`budget_year` AS `budget_year`,`aa`.`budget_month` AS `budget_month`,`aa`.`plafon` AS `plafon`,`aa`.`plafon_format` AS `plafon_format`,`aa`.`realisasi_format` AS `realisasi_format`,`aa`.`realisasi` AS `realisasi`,`aa`.`presentasi_realisasi` AS `presentasi_realisasi`,`aa`.`total_fund` AS `total_fund`,`aa`.`target` AS `target`,format(`aa`.`target`,0,'id_ID') AS `target_format`,round(((`aa`.`target` / `aa`.`plafon`) * 100),2) AS `persen_target`,`aa`.`sppd` AS `sppd`,format(`aa`.`sppd`,0,'id_ID') AS `sppd_format`,abs((`aa`.`sppd` - `aa`.`realisasi`)) AS `deviasi`,format(abs((`aa`.`sppd` - `aa`.`realisasi`)),0,'id_ID') AS `deviasi_format`,round(((`aa`.`target` / `aa`.`sppd`) * 100),2) AS `persen_realisasi_target`,round(((`aa`.`sppd` / `aa`.`plafon`) * 100),2) AS `persen_realisasi_pagu`,(`aa`.`plafon` - `aa`.`realisasi`) AS `sisa_anggaran_spm`,format((`aa`.`plafon` - `aa`.`realisasi`),0,'id_ID') AS `sisa_anggaran_spm_format`,(`aa`.`plafon` - `aa`.`sppd`) AS `sisa_anggaran_sp2d`,format((`aa`.`plafon` - `aa`.`sppd`),0,'id_ID') AS `sisa_anggaran_sp2d_format` from `datas` `aa`;

-- ----------------------------
-- View structure for view_data_realisasi_item_sppd
-- ----------------------------
DROP VIEW IF EXISTS `view_data_realisasi_item_sppd`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_data_realisasi_item_sppd` AS with `data_item_target` as (select (select ifnull(sum(`trx_budgets`.`budget_plafon`),0) from `trx_budgets` where ((`trx_budgets`.`budget_year` = year(now())) and (`trx_budgets`.`budget_month` = 1))) AS `plafon`,((ifnull(sum(`trx_sppd`.`sppd_pegawai`),0) + ifnull(sum(`trx_sppd`.`sppd_barang`),0)) + ifnull(sum(`trx_sppd`.`sppd_modal`),0)) AS `sppd`,cast(now() as date) AS `tanggal_target` from `trx_sppd` where ((`trx_sppd`.`sppd_status` = 1) and (`trx_sppd`.`sppd_log_uuid` is null) and (`trx_sppd`.`sppd_year` = year(now())) and (`trx_sppd`.`sppd_month` <= month(now())))) select `data_item_target`.`plafon` AS `plafon`,`data_item_target`.`sppd` AS `sppd`,`data_item_target`.`tanggal_target` AS `tanggal_target`,ifnull(round(((`data_item_target`.`sppd` / `data_item_target`.`plafon`) * 100),2),0) AS `persen_sppd` from `data_item_target`;

-- ----------------------------
-- View structure for view_data_realisasi_item_target
-- ----------------------------
DROP VIEW IF EXISTS `view_data_realisasi_item_target`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_data_realisasi_item_target` AS with `data_item_target` as (select (select ifnull(sum(`trx_budgets`.`budget_plafon`),0) from `trx_budgets` where ((`trx_budgets`.`budget_year` = year(now())) and (`trx_budgets`.`budget_month` = 1))) AS `plafon`,ifnull(sum(`trx_target`.`target_value`),0) AS `target`,last_day(now()) AS `tanggal_target` from `trx_target` where ((`trx_target`.`target_status` = 1) and (`trx_target`.`target_log_uuid` is null) and (`trx_target`.`target_year` = year(now())) and (`trx_target`.`target_month` <= month(now())))) select `data_item_target`.`plafon` AS `plafon`,`data_item_target`.`target` AS `target`,`data_item_target`.`tanggal_target` AS `tanggal_target`,ifnull(round(((`data_item_target`.`target` / `data_item_target`.`plafon`) * 100),2),0) AS `persen_target` from `data_item_target`;

-- ----------------------------
-- View structure for view_per_biro_setjen
-- ----------------------------
DROP VIEW IF EXISTS `view_per_biro_setjen`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_per_biro_setjen` AS with recursive `datas` as (select `a`.`work_program_id` AS `work_program_id`,`a`.`work_program_uuid` AS `work_program_uuid`,`a`.`work_program_parent_uuid` AS `work_program_parent_uuid`,`a`.`work_program_code` AS `work_program_code`,`a`.`work_program_name` AS `work_program_name`,`a`.`work_program_year` AS `work_program_year`,1 AS `work_program_level`,cast('' as char(4000) charset utf8mb4) AS `tabs`,cast(concat('',`a`.`work_program_uuid`) as char(4000) charset utf8mb4) AS `hirarki` from `trx_work_programs` `a` where (`a`.`work_program_parent_uuid` = '0') union all select `a`.`work_program_id` AS `work_program_id`,`a`.`work_program_uuid` AS `work_program_uuid`,`a`.`work_program_parent_uuid` AS `work_program_parent_uuid`,`a`.`work_program_code` AS `work_program_code`,`a`.`work_program_name` AS `work_program_name`,`a`.`work_program_year` AS `work_program_year`,(`b`.`work_program_level` + 1) AS `work_program_level`,concat(`b`.`tabs`,'___') AS `tabs`,concat(`b`.`hirarki`,'::',cast(`b`.`work_unit_sort` as char(10) charset utf8mb4),'::',convert(`a`.`work_program_code` using utf8mb4),'::',convert(`a`.`work_program_uuid` using utf8mb4)) AS `hirarki` from ((`trx_work_programs` `a` join `datas` `b` on((`a`.`work_program_parent_uuid` = `b`.`work_program_uuid`))) join `mst_work_units` `b` on((`a`.`work_program_work_unit_uuid` = `b`.`work_unit_uuid`)))) select concat(`aa`.`tabs`,'',convert(`aa`.`work_program_name` using utf8mb4)) AS `work_program_name_tabs`,`bb`.`budget_plafon` AS `budget_plafon`,format(abs(`bb`.`budget_plafon`),0,'id_ID') AS `budget_plafon_format`,`bb`.`budget_realization` AS `budget_realization`,format(abs(`bb`.`budget_realization`),0,'id_ID') AS `budget_realization_format`,`bb`.`budget_year` AS `budget_year`,`bb`.`budget_month` AS `budget_month`,`aa`.`work_program_id` AS `work_program_id`,`aa`.`work_program_uuid` AS `work_program_uuid`,`aa`.`work_program_parent_uuid` AS `work_program_parent_uuid`,`aa`.`work_program_code` AS `work_program_code`,`aa`.`work_program_name` AS `work_program_name`,`aa`.`work_program_year` AS `work_program_year`,`aa`.`work_program_level` AS `work_program_level`,`aa`.`tabs` AS `tabs`,`aa`.`hirarki` AS `hirarki` from (`datas` `aa` left join `trx_budgets` `bb` on(((`aa`.`work_program_uuid` = `bb`.`budget_work_program_uuid`) and (`bb`.`budget_log_uuid` is null) and (`aa`.`work_program_year` = `bb`.`budget_year`) and (`bb`.`budget_month` = (select max(`xx`.`budget_month`) from `trx_budgets` `xx` where ((`xx`.`budget_year` = `bb`.`budget_year`) and (`xx`.`budget_work_program_uuid` = `bb`.`budget_work_program_uuid`) and (`xx`.`budget_log_uuid` is null))))))) order by `aa`.`hirarki`;

-- ----------------------------
-- View structure for view_periode_revisi
-- ----------------------------
DROP VIEW IF EXISTS `view_periode_revisi`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_periode_revisi` AS select `aa`.`dashboard_realisasi_uuid` AS `dashboard_realisasi_uuid`,`aa`.`dashboard_realisasi_year` AS `dashboard_realisasi_year`,concat(`aa`.`dashboard_realisasi_revision_name`,convert((case when (`aa`.`dashboard_realisasi_revision_name` <> 'PAGU AWAL') then concat(' ',`aa`.`dashboard_realisasi_version`) else '' end) using utf8mb3)) AS `jenis_revisi`,`aa`.`dashboard_realisasi_create_date` AS `dashboard_realisasi_create_date` from `trx_dashboard_realisasi` `aa` group by `aa`.`dashboard_realisasi_uuid`,`aa`.`dashboard_realisasi_revision_name`,`aa`.`dashboard_realisasi_version`,`aa`.`dashboard_realisasi_year`,`aa`.`dashboard_realisasi_create_date`;

-- ----------------------------
-- View structure for view_realisasi_by_unit
-- ----------------------------
DROP VIEW IF EXISTS `view_realisasi_by_unit`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_realisasi_by_unit` AS select `aa`.`work_program_year` AS `work_program_year`,`bb`.`work_unit_id` AS `work_unit_id`,`bb`.`work_unit_uuid` AS `work_unit_uuid`,`bb`.`work_unit_code` AS `work_unit_code`,`bb`.`work_unit_name` AS `work_unit_name`,sum(`cc`.`budget_realization`) AS `budget_realization` from ((`trx_work_programs` `aa` join `mst_work_units` `bb` on((`aa`.`work_program_work_unit_uuid` = `bb`.`work_unit_uuid`))) left join `trx_budgets` `cc` on(((`aa`.`work_program_uuid` = `cc`.`budget_work_program_uuid`) and (`cc`.`budget_year` = `aa`.`work_program_year`) and (`cc`.`budget_status` = 1) and (`cc`.`budget_log_uuid` is null) and (`cc`.`budget_month` = (select max(`xx`.`budget_month`) from `trx_budgets` `xx` where ((`xx`.`budget_year` = `cc`.`budget_year`) and (`xx`.`budget_work_program_uuid` = `cc`.`budget_work_program_uuid`) and (`xx`.`budget_log_uuid` is null))))))) where (`bb`.`work_unit_id` > 1) group by `bb`.`work_unit_id`,`bb`.`work_unit_code`,`bb`.`work_unit_name`,`aa`.`work_program_year`;

-- ----------------------------
-- View structure for view_sys_users
-- ----------------------------
DROP VIEW IF EXISTS `view_sys_users`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_sys_users` AS select `aa`.`user_id` AS `user_id`,`aa`.`user_uuid` AS `user_uuid`,`aa`.`user_fullname` AS `user_fullname`,`aa`.`user_name` AS `user_name`,`aa`.`user_password` AS `user_password`,`aa`.`user_create_by` AS `user_create_by`,`aa`.`user_create_date` AS `user_create_date`,`aa`.`user_update_by` AS `user_update_by`,`aa`.`user_update_date` AS `user_update_date`,`aa`.`user_log_uuid` AS `user_log_uuid`,`aa`.`user_status` AS `user_status`,`aa`.`user_access_uuid` AS `user_access_uuid`,`bb`.`access_id` AS `access_id`,`bb`.`access_uuid` AS `access_uuid`,`bb`.`access_name` AS `access_name`,`bb`.`access_is_admin` AS `access_is_admin`,`bb`.`access_create_by` AS `access_create_by`,`bb`.`access_create_date` AS `access_create_date`,`bb`.`access_update_by` AS `access_update_by`,`bb`.`access_update_date` AS `access_update_date`,`bb`.`access_log_uuid` AS `access_log_uuid`,`bb`.`access_status` AS `access_status`,(case when (`aa`.`user_status` = 1) then 'Aktif' else 'Tidak Aktif' end) AS `user_status_name` from (`sys_users` `aa` join `sys_access` `bb` on(((`aa`.`user_access_uuid` = `bb`.`access_uuid`) and (`bb`.`access_status` = 1) and (`bb`.`access_log_uuid` is null)))) where ((`aa`.`user_status` = 1) and (`aa`.`user_log_uuid` is null));

-- ----------------------------
-- View structure for view_trx_budgets
-- ----------------------------
DROP VIEW IF EXISTS `view_trx_budgets`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_trx_budgets` AS select `aa`.`budget_id` AS `budget_id`,`aa`.`budget_uuid` AS `budget_uuid`,`aa`.`budget_year` AS `budget_year`,`aa`.`budget_month` AS `budget_month`,`aa`.`budget_work_program_uuid` AS `budget_work_program_uuid`,`aa`.`budget_plafon` AS `budget_plafon`,`aa`.`budget_realization` AS `budget_realization`,`aa`.`budget_create_by` AS `budget_create_by`,`aa`.`budget_create_date` AS `budget_create_date`,`aa`.`budget_status` AS `budget_status`,`aa`.`budget_log_uuid` AS `budget_log_uuid`,`bb`.`work_program_id` AS `work_program_id`,`bb`.`work_program_uuid` AS `work_program_uuid`,`bb`.`work_program_parent_uuid` AS `work_program_parent_uuid`,`bb`.`work_program_year` AS `work_program_year`,`bb`.`work_program_work_unit_uuid` AS `work_program_work_unit_uuid`,`bb`.`work_program_code` AS `work_program_code`,`bb`.`work_program_name` AS `work_program_name`,`bb`.`work_program_is_last_child` AS `work_program_is_last_child`,`bb`.`work_program_description` AS `work_program_description`,`bb`.`work_program_create_by` AS `work_program_create_by`,`bb`.`work_program_create_date` AS `work_program_create_date`,`bb`.`work_program_update_by` AS `work_program_update_by`,`bb`.`work_program_update_date` AS `work_program_update_date`,`bb`.`work_program_log_uuid` AS `work_program_log_uuid`,`bb`.`work_program_status` AS `work_program_status` from (`trx_budgets` `aa` join `trx_work_programs` `bb` on(((`aa`.`budget_work_program_uuid` = `bb`.`work_program_uuid`) and (`bb`.`work_program_status` = 1) and (`bb`.`work_program_log_uuid` is null)))) where ((`aa`.`budget_status` = 1) and (`aa`.`budget_log_uuid` is null));

-- ----------------------------
-- View structure for view_trx_dashboard_realisasi
-- ----------------------------
DROP VIEW IF EXISTS `view_trx_dashboard_realisasi`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_trx_dashboard_realisasi` AS select `aa`.`dashboard_realisasi_id` AS `dashboard_realisasi_id`,`aa`.`dashboard_realisasi_uuid` AS `dashboard_realisasi_uuid`,`aa`.`dashboard_realisasi_year` AS `dashboard_realisasi_year`,(case when (`aa`.`dashboard_realisasi_version` <> 'Pagu Awal') then concat(`aa`.`dashboard_realisasi_revision_name`,' ',`aa`.`dashboard_realisasi_version`) else `aa`.`dashboard_realisasi_revision_name` end) AS `dashboard_realisasi_revision_name`,`aa`.`dashboard_realisasi_pegawai` AS `dashboard_realisasi_pegawai`,format(`aa`.`dashboard_realisasi_pegawai`,0,'id_ID') AS `dashboard_realisasi_pegawai_format`,`aa`.`dashboard_realisasi_barang` AS `dashboard_realisasi_barang`,format(`aa`.`dashboard_realisasi_barang`,0,'id_ID') AS `dashboard_realisasi_barang_format`,`aa`.`dashboard_realisasi_total_belanja` AS `dashboard_realisasi_total_belanja`,format(`aa`.`dashboard_realisasi_total_belanja`,0,'id_ID') AS `dashboard_realisasi_total_belanja_format`,`aa`.`dashboard_realisasi_modal` AS `dashboard_realisasi_modal`,format(`aa`.`dashboard_realisasi_modal`,0,'id_ID') AS `dashboard_realisasi_modal_format`,((`aa`.`dashboard_realisasi_pegawai` + `aa`.`dashboard_realisasi_barang`) + `aa`.`dashboard_realisasi_modal`) AS `dashboard_realisasi_total`,`aa`.`dashboard_realisasi_version` AS `dashboard_realisasi_version`,`aa`.`dashboard_realisasi_create_by` AS `dashboard_realisasi_create_by`,`aa`.`dashboard_realisasi_create_date` AS `dashboard_realisasi_create_date`,`aa`.`dashboard_realisasi_status` AS `dashboard_realisasi_status`,`aa`.`dashboard_realisasi_log_uuid` AS `dashboard_realisasi_log_uuid`,`bb`.`user_fullname` AS `dashboard_realisasi_create_by_name` from (`trx_dashboard_realisasi` `aa` left join `sys_users` `bb` on((`aa`.`dashboard_realisasi_create_by` = `bb`.`user_uuid`)));

-- ----------------------------
-- View structure for view_trx_indikator_kinerja
-- ----------------------------
DROP VIEW IF EXISTS `view_trx_indikator_kinerja`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_trx_indikator_kinerja` AS select `aa`.`indikator_kinerja_id` AS `indikator_kinerja_id`,`aa`.`indikator_kinerja_uuid` AS `indikator_kinerja_uuid`,`aa`.`indikator_kinerja_sasaran_strategis_uuid` AS `indikator_kinerja_sasaran_strategis_uuid`,`aa`.`indikator_kinerja_biro_uuid` AS `indikator_kinerja_biro_uuid`,`aa`.`indikator_kinerja_sort` AS `indikator_kinerja_sort`,`aa`.`indikator_kinerja_name` AS `indikator_kinerja_name`,`aa`.`indikator_kinerja_satuan` AS `indikator_kinerja_satuan`,`aa`.`indikator_kinerja_target` AS `indikator_kinerja_target`,`aa`.`indikator_kinerja_realisasi` AS `indikator_kinerja_realisasi`,round(((`aa`.`indikator_kinerja_realisasi` / `aa`.`indikator_kinerja_target`) * 100),2) AS `indikator_kinerja_persen_capaian`,0 AS `indikator_kinerja_persen_anggaran`,`aa`.`indikator_kinerja_create_by` AS `indikator_kinerja_create_by`,`aa`.`indikator_kinerja_create_date` AS `indikator_kinerja_create_date`,`aa`.`indikator_kinerja_status` AS `indikator_kinerja_status`,`aa`.`indikator_kinerja_log_uuid` AS `indikator_kinerja_log_uuid`,`cc`.`sasaran_strategis_year` AS `sasaran_strategis_year`,`cc`.`sasaran_strategis_name` AS `sasaran_strategis_name`,`cc`.`sasaran_strategis_sort` AS `sasaran_strategis_sort`,`bb`.`user_fullname` AS `indikator_kinerja_create_by_name`,concat(`aa`.`indikator_kinerja_sort`,':',`cc`.`sasaran_strategis_sort`) AS `sorting` from ((`trx_indikator_kinerja` `aa` left join `sys_users` `bb` on((`aa`.`indikator_kinerja_create_by` = `bb`.`user_uuid`))) left join `trx_sasaran_strategis` `cc` on(((`aa`.`indikator_kinerja_sasaran_strategis_uuid` = `cc`.`sasaran_strategis_uuid`) and (`cc`.`sasaran_strategis_log_uuid` is null))));

-- ----------------------------
-- View structure for view_trx_program_apk
-- ----------------------------
DROP VIEW IF EXISTS `view_trx_program_apk`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_trx_program_apk` AS select `aa`.`program_apk_id` AS `program_apk_id`,`aa`.`program_apk_uuid` AS `program_apk_uuid`,`aa`.`program_apk_apk_uuid` AS `program_apk_apk_uuid`,`aa`.`program_apk_year` AS `program_apk_year`,`aa`.`program_apk_month` AS `program_apk_month`,`aa`.`program_apk_urian` AS `program_apk_urian`,`aa`.`program_apk_pagu` AS `program_apk_pagu`,format(`aa`.`program_apk_pagu`,0,'id_ID') AS `program_apk_pagu_format`,`aa`.`program_apk_realisasi` AS `program_apk_realisasi`,format(`aa`.`program_apk_realisasi`,0,'id_ID') AS `program_apk_realisasi_format`,`aa`.`program_apk_create_by` AS `program_apk_create_by`,`aa`.`program_apk_create_date` AS `program_apk_create_date`,`aa`.`program_apk_status` AS `program_apk_status`,`aa`.`program_apk_log_uuid` AS `program_apk_log_uuid`,`bb`.`apk_id` AS `apk_id`,`bb`.`apk_uuid` AS `apk_uuid`,`bb`.`apk_year` AS `apk_year`,`bb`.`apk_name` AS `apk_name`,`bb`.`apk_sort` AS `apk_sort`,`bb`.`apk_create_by` AS `apk_create_by`,`bb`.`apk_create_date` AS `apk_create_date`,`bb`.`apk_status` AS `apk_status`,`bb`.`apk_log_uuid` AS `apk_log_uuid` from (`trx_program_apk` `aa` join `trx_apk` `bb` on((`aa`.`program_apk_apk_uuid` = `bb`.`apk_uuid`))) where ((`aa`.`program_apk_log_uuid` is null) and (`aa`.`program_apk_status` = 1));

-- ----------------------------
-- View structure for view_trx_realisasi_apk
-- ----------------------------
DROP VIEW IF EXISTS `view_trx_realisasi_apk`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_trx_realisasi_apk` AS select `aa`.`realisasi_apk_id` AS `realisasi_apk_id`,`aa`.`realisasi_apk_uuid` AS `realisasi_apk_uuid`,`aa`.`realisasi_apk_apk_uuid` AS `realisasi_apk_apk_uuid`,`aa`.`realisasi_apk_year` AS `realisasi_apk_year`,`aa`.`realisasi_apk_month` AS `realisasi_apk_month`,`aa`.`realisasi_apk_urian` AS `realisasi_apk_urian`,`aa`.`realisasi_apk_pagu` AS `realisasi_apk_pagu`,format(`aa`.`realisasi_apk_pagu`,0,'id_ID') AS `realisasi_apk_pagu_format`,`aa`.`realisasi_apk_realisasi` AS `realisasi_apk_realisasi`,format(`aa`.`realisasi_apk_realisasi`,0,'id_ID') AS `realisasi_apk_realisasi_format`,`aa`.`realisasi_apk_create_by` AS `realisasi_apk_create_by`,`aa`.`realisasi_apk_create_date` AS `realisasi_apk_create_date`,`aa`.`realisasi_apk_status` AS `realisasi_apk_status`,`aa`.`realisasi_apk_log_uuid` AS `realisasi_apk_log_uuid`,`bb`.`apk_id` AS `apk_id`,`bb`.`apk_uuid` AS `apk_uuid`,`bb`.`apk_year` AS `apk_year`,`bb`.`apk_name` AS `apk_name`,`bb`.`apk_sort` AS `apk_sort`,`bb`.`apk_create_by` AS `apk_create_by`,`bb`.`apk_create_date` AS `apk_create_date`,`bb`.`apk_status` AS `apk_status`,`bb`.`apk_log_uuid` AS `apk_log_uuid` from (`trx_realisasi_apk` `aa` join `trx_apk` `bb` on((`aa`.`realisasi_apk_apk_uuid` = `bb`.`apk_uuid`))) where ((`aa`.`realisasi_apk_log_uuid` is null) and (`aa`.`realisasi_apk_status` = 1));

-- ----------------------------
-- View structure for view_trx_sasaran_strategis
-- ----------------------------
DROP VIEW IF EXISTS `view_trx_sasaran_strategis`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_trx_sasaran_strategis` AS select `aa`.`sasaran_strategis_id` AS `sasaran_strategis_id`,`aa`.`sasaran_strategis_uuid` AS `sasaran_strategis_uuid`,`aa`.`sasaran_strategis_year` AS `sasaran_strategis_year`,`aa`.`sasaran_strategis_name` AS `sasaran_strategis_name`,`aa`.`sasaran_strategis_sort` AS `sasaran_strategis_sort`,`aa`.`sasaran_strategis_create_by` AS `sasaran_strategis_create_by`,`aa`.`sasaran_strategis_create_date` AS `sasaran_strategis_create_date`,`aa`.`sasaran_strategis_status` AS `sasaran_strategis_status`,`aa`.`sasaran_strategis_log_uuid` AS `sasaran_strategis_log_uuid`,`bb`.`user_fullname` AS `sasaran_strategis_create_by_name` from (`trx_sasaran_strategis` `aa` left join `sys_users` `bb` on((`aa`.`sasaran_strategis_create_by` = `bb`.`user_uuid`)));

-- ----------------------------
-- View structure for view_trx_target
-- ----------------------------
DROP VIEW IF EXISTS `view_trx_target`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_trx_target` AS with `aa` as (select `aa`.`target_id` AS `target_id`,`aa`.`target_uuid` AS `target_uuid`,`aa`.`target_work_unit_uuid` AS `target_work_unit_uuid`,`aa`.`target_year` AS `target_year`,`aa`.`target_month` AS `target_month`,`aa`.`target_value` AS `target_value`,`aa`.`target_value_percent` AS `target_value_percent`,`aa`.`target_value_percent_1` AS `target_value_percent_1`,`aa`.`target_value_percent_2` AS `target_value_percent_2`,`aa`.`target_value_percent_3` AS `target_value_percent_3`,`aa`.`target_value_percent_4` AS `target_value_percent_4`,`aa`.`target_value_percent_5` AS `target_value_percent_5`,`aa`.`target_value_percent_6` AS `target_value_percent_6`,`aa`.`target_value_percent_7` AS `target_value_percent_7`,`aa`.`target_value_percent_8` AS `target_value_percent_8`,`aa`.`target_value_percent_9` AS `target_value_percent_9`,`aa`.`target_value_percent_10` AS `target_value_percent_10`,`aa`.`target_value_percent_11` AS `target_value_percent_11`,`aa`.`target_value_percent_12` AS `target_value_percent_12`,`aa`.`target_create_by` AS `target_create_by`,`aa`.`target_create_date` AS `target_create_date`,`aa`.`target_status` AS `target_status`,`aa`.`target_log_uuid` AS `target_log_uuid`,`bb`.`work_unit_id` AS `work_unit_id`,`bb`.`work_unit_code` AS `work_unit_code`,`bb`.`work_unit_name` AS `work_unit_name`,`bb`.`work_unit_sort` AS `work_unit_sort` from (`trx_target` `aa` left join `mst_work_units` `bb` on(((`aa`.`target_work_unit_uuid` = `bb`.`work_unit_uuid`) and (`bb`.`work_unit_log_uuid` is null))))) select `aa`.`target_id` AS `target_id`,`aa`.`target_uuid` AS `target_uuid`,`aa`.`target_work_unit_uuid` AS `target_work_unit_uuid`,`aa`.`target_year` AS `target_year`,`aa`.`target_month` AS `target_month`,`aa`.`target_value` AS `target_value`,`aa`.`target_value_percent` AS `target_value_percent`,`aa`.`target_value_percent_1` AS `target_value_percent_1`,`aa`.`target_value_percent_2` AS `target_value_percent_2`,`aa`.`target_value_percent_3` AS `target_value_percent_3`,`aa`.`target_value_percent_4` AS `target_value_percent_4`,`aa`.`target_value_percent_5` AS `target_value_percent_5`,`aa`.`target_value_percent_6` AS `target_value_percent_6`,`aa`.`target_value_percent_7` AS `target_value_percent_7`,`aa`.`target_value_percent_8` AS `target_value_percent_8`,`aa`.`target_value_percent_9` AS `target_value_percent_9`,`aa`.`target_value_percent_10` AS `target_value_percent_10`,`aa`.`target_value_percent_11` AS `target_value_percent_11`,`aa`.`target_value_percent_12` AS `target_value_percent_12`,round((`bb`.`budget_realization` * (`aa`.`target_value_percent_1` / 100)),0) AS `target_value_1`,round((`bb`.`budget_realization` * (`aa`.`target_value_percent_2` / 100)),0) AS `target_value_2`,round((`bb`.`budget_realization` * (`aa`.`target_value_percent_3` / 100)),0) AS `target_value_3`,round((`bb`.`budget_realization` * (`aa`.`target_value_percent_4` / 100)),0) AS `target_value_4`,round((`bb`.`budget_realization` * (`aa`.`target_value_percent_5` / 100)),0) AS `target_value_5`,round((`bb`.`budget_realization` * (`aa`.`target_value_percent_6` / 100)),0) AS `target_value_6`,round((`bb`.`budget_realization` * (`aa`.`target_value_percent_7` / 100)),0) AS `target_value_7`,round((`bb`.`budget_realization` * (`aa`.`target_value_percent_8` / 100)),0) AS `target_value_8`,round((`bb`.`budget_realization` * (`aa`.`target_value_percent_9` / 100)),0) AS `target_value_9`,round((`bb`.`budget_realization` * (`aa`.`target_value_percent_10` / 100)),0) AS `target_value_10`,round((`bb`.`budget_realization` * (`aa`.`target_value_percent_11` / 100)),0) AS `target_value_11`,round((`bb`.`budget_realization` * (`aa`.`target_value_percent_12` / 100)),0) AS `target_value_12`,`aa`.`target_create_by` AS `target_create_by`,`aa`.`target_create_date` AS `target_create_date`,`aa`.`target_status` AS `target_status`,`aa`.`target_log_uuid` AS `target_log_uuid`,`aa`.`work_unit_id` AS `work_unit_id`,`aa`.`work_unit_code` AS `work_unit_code`,`aa`.`work_unit_name` AS `work_unit_name`,`aa`.`work_unit_sort` AS `work_unit_sort`,`bb`.`budget_realization` AS `budget_realization` from (`aa` left join `view_realisasi_by_unit` `bb` on(((`aa`.`target_year` = `bb`.`work_program_year`) and (`aa`.`target_work_unit_uuid` = `bb`.`work_unit_uuid`))));

-- ----------------------------
-- View structure for view_trx_upload
-- ----------------------------
DROP VIEW IF EXISTS `view_trx_upload`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_trx_upload` AS select `trx_upload`.`upload_id` AS `upload_id`,`trx_upload`.`upload_uuid` AS `upload_uuid`,`trx_upload`.`upload_year` AS `upload_year`,`trx_upload`.`upload_type` AS `upload_type`,`trx_upload`.`upload_file_path` AS `upload_file_path`,`trx_upload`.`upload_create_by` AS `upload_create_by`,`trx_upload`.`upload_create_date` AS `upload_create_date`,`trx_upload`.`upload_status` AS `upload_status`,`trx_upload`.`upload_log_uuid` AS `upload_log_uuid`,`trx_upload`.`upload_month` AS `upload_month`,(case when (`trx_upload`.`upload_type` = 1) then 'Data Inisiasi' else 'Data Realisasi' end) AS `upload_type_name` from `trx_upload`;

-- ----------------------------
-- View structure for view_work_program_parent
-- ----------------------------
DROP VIEW IF EXISTS `view_work_program_parent`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_work_program_parent` AS select `aa`.`work_program_id` AS `work_program_id`,`aa`.`work_program_uuid` AS `work_program_uuid`,`aa`.`work_program_parent_uuid` AS `work_program_parent_uuid`,`aa`.`work_program_year` AS `work_program_year`,`aa`.`work_program_work_unit_uuid` AS `work_program_work_unit_uuid`,`aa`.`work_program_code` AS `work_program_code`,`aa`.`work_program_name` AS `work_program_name`,`aa`.`work_program_is_last_child` AS `work_program_is_last_child`,`aa`.`work_program_description` AS `work_program_description`,`aa`.`work_program_create_by` AS `work_program_create_by`,`aa`.`work_program_create_date` AS `work_program_create_date`,`aa`.`work_program_update_by` AS `work_program_update_by`,`aa`.`work_program_update_date` AS `work_program_update_date`,`aa`.`work_program_log_uuid` AS `work_program_log_uuid`,`aa`.`work_program_status` AS `work_program_status`,`bb`.`work_program_code` AS `work_program_parent_code`,`bb`.`work_program_name` AS `work_program_parent_name` from (`trx_work_programs` `aa` left join `trx_work_programs` `bb` on(((`aa`.`work_program_parent_uuid` = `bb`.`work_program_uuid`) and (`bb`.`work_program_status` = 1) and (`bb`.`work_program_log_uuid` is null)))) where ((`aa`.`work_program_status` = 1) and (`aa`.`work_program_log_uuid` is null));

-- ----------------------------
-- Procedure structure for get_data_anggaran_by_periode
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_data_anggaran_by_periode`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_data_anggaran_by_periode`( tahun INT, bulan INT )
BEGIN  


	DECLARE bulan_fix INT;
	SELECT upload_paparan_program_month INTO bulan_fix
	FROM trx_upload_paparan_program 
	WHERE upload_paparan_program_year = tahun AND
	upload_paparan_program_month <= bulan
	AND upload_paparan_program_status = 1
	GROUP BY upload_paparan_program_year, upload_paparan_program_month
	ORDER BY upload_paparan_program_month DESC
	LIMIT 1;

  WITH RECURSIVE category_hierarchy AS (
    SELECT 
		a.upload_paparan_program_id,
		a.upload_paparan_program_uuid,
		a.upload_paparan_program_parent_uuid,
		a.upload_paparan_program_work_unit_uuid,
		a.upload_paparan_program_year,
		a.upload_paparan_program_month,
		a.upload_paparan_program_code,
		a.upload_paparan_program_name,
		a.upload_paparan_program_spd_pagu,
		a.upload_paparan_program_spd_realisasi,
		a.upload_paparan_program_spd_persen_realisasi,
		a.upload_paparan_program_spd_sisa,
		a.upload_paparan_program_spd_target,
		a.upload_paparan_program_spd_persen_target,
		a.upload_paparan_program_spd_deviasi,
		a.upload_paparan_program_spd_persen_deviasi,
		a.upload_paparan_program_spm_pagu,
		a.upload_paparan_program_spm_realisasi,
		a.upload_paparan_program_spm_persen_realisasi,
		a.upload_paparan_program_spm_sisa,
		a.upload_paparan_program_spm_target,
		a.upload_paparan_program_spm_persen_target,
		a.upload_paparan_program_spm_deviasi,
		a.upload_paparan_program_spm_persen_deviasi,
		format(a.upload_paparan_program_spd_pagu, 0, 'id_ID' ) AS upload_paparan_program_spd_pagu_format,
		format(a.upload_paparan_program_spd_realisasi, 0, 'id_ID' ) AS upload_paparan_program_spd_realisasi_format,
		format(a.upload_paparan_program_spd_persen_realisasi, 2, 'id_ID' ) AS upload_paparan_program_spd_persen_realisasi_format,
		format(a.upload_paparan_program_spd_sisa, 0, 'id_ID' ) AS upload_paparan_program_spd_sisa_format,
		format(a.upload_paparan_program_spd_target, 0, 'id_ID' ) AS upload_paparan_program_spd_target_format,
		format(a.upload_paparan_program_spd_persen_target, 2, 'id_ID' ) AS upload_paparan_program_spd_persen_target_format,
		format(a.upload_paparan_program_spd_deviasi, 0, 'id_ID' ) AS upload_paparan_program_spd_deviasi_format,
		format(a.upload_paparan_program_spd_persen_deviasi, 2, 'id_ID' ) AS upload_paparan_program_spd_persen_deviasi_format,
		format(a.upload_paparan_program_spm_pagu, 0, 'id_ID' ) AS upload_paparan_program_spm_pagu_format,
		format(a.upload_paparan_program_spm_realisasi, 0, 'id_ID' ) AS upload_paparan_program_spm_realisasi_format,
		format(a.upload_paparan_program_spm_persen_realisasi, 2, 'id_ID' ) AS upload_paparan_program_spm_persen_realisasi_format,
		format(a.upload_paparan_program_spm_sisa, 0, 'id_ID' ) AS upload_paparan_program_spm_sisa_format,
		format(a.upload_paparan_program_spm_target, 0, 'id_ID' ) AS upload_paparan_program_spm_target_format,
		format(a.upload_paparan_program_spm_persen_target, 2, 'id_ID' ) AS upload_paparan_program_spm_persen_target_format,
		format(a.upload_paparan_program_spm_deviasi, 0, 'id_ID' ) AS upload_paparan_program_spm_deviasi_format,
		format(a.upload_paparan_program_spm_persen_deviasi, 2, 'id_ID' ) AS upload_paparan_program_spm_persen_deviasi_format,
		c.work_unit_code,
		c.work_unit_name,
		CAST('' AS CHAR(255)) AS tabs,
		CAST(CONCAT(number_to_alphabet(a.upload_paparan_program_id)) AS CHAR(4400)) AS hirarki,
		0 AS levels

    FROM trx_upload_paparan_program a
		LEFT JOIN mst_work_units c ON a.upload_paparan_program_work_unit_uuid = c.work_unit_uuid AND c.work_unit_log_uuid IS NULL AND c.work_unit_status = 1
    WHERE a.upload_paparan_program_parent_uuid = '0' 
		AND a.upload_paparan_program_status = 1 AND a.upload_paparan_program_log_uuid IS NULL
		AND a.upload_paparan_program_year = tahun AND a.upload_paparan_program_month = bulan_fix
    UNION ALL
    SELECT 
		a.upload_paparan_program_id,
		a.upload_paparan_program_uuid,
		a.upload_paparan_program_parent_uuid,
		a.upload_paparan_program_work_unit_uuid,
		a.upload_paparan_program_year,
		a.upload_paparan_program_month,
		a.upload_paparan_program_code,
		a.upload_paparan_program_name,
		a.upload_paparan_program_spd_pagu,
		a.upload_paparan_program_spd_realisasi,
		a.upload_paparan_program_spd_persen_realisasi,
		a.upload_paparan_program_spd_sisa,
		a.upload_paparan_program_spd_target,
		a.upload_paparan_program_spd_persen_target,
		a.upload_paparan_program_spd_deviasi,
		a.upload_paparan_program_spd_persen_deviasi,
		a.upload_paparan_program_spm_pagu,
		a.upload_paparan_program_spm_realisasi,
		a.upload_paparan_program_spm_persen_realisasi,
		a.upload_paparan_program_spm_sisa,
		a.upload_paparan_program_spm_target,
		a.upload_paparan_program_spm_persen_target,
		a.upload_paparan_program_spm_deviasi,
		a.upload_paparan_program_spm_persen_deviasi,
		format(a.upload_paparan_program_spd_pagu, 0, 'id_ID' ) AS upload_paparan_program_spd_pagu_format,
		format(a.upload_paparan_program_spd_realisasi, 0, 'id_ID' ) AS upload_paparan_program_spd_realisasi_format,
		format(a.upload_paparan_program_spd_persen_realisasi, 2, 'id_ID' ) AS upload_paparan_program_spd_persen_realisasi_format,
		format(a.upload_paparan_program_spd_sisa, 0, 'id_ID' ) AS upload_paparan_program_spd_sisa_format,
		format(a.upload_paparan_program_spd_target, 0, 'id_ID' ) AS upload_paparan_program_spd_target_format,
		format(a.upload_paparan_program_spd_persen_target, 2, 'id_ID' ) AS upload_paparan_program_spd_persen_target_format,
		format(a.upload_paparan_program_spd_deviasi, 0, 'id_ID' ) AS upload_paparan_program_spd_deviasi_format,
		format(a.upload_paparan_program_spd_persen_deviasi, 2, 'id_ID' ) AS upload_paparan_program_spd_persen_deviasi_format,
		format(a.upload_paparan_program_spm_pagu, 0, 'id_ID' ) AS upload_paparan_program_spm_pagu_format,
		format(a.upload_paparan_program_spm_realisasi, 0, 'id_ID' ) AS upload_paparan_program_spm_realisasi_format,
		format(a.upload_paparan_program_spm_persen_realisasi, 2, 'id_ID' ) AS upload_paparan_program_spm_persen_realisasi_format,
		format(a.upload_paparan_program_spm_sisa, 0, 'id_ID' ) AS upload_paparan_program_spm_sisa_format,
		format(a.upload_paparan_program_spm_target, 0, 'id_ID' ) AS upload_paparan_program_spm_target_format,
		format(a.upload_paparan_program_spm_persen_target, 2, 'id_ID' ) AS upload_paparan_program_spm_persen_target_format,
		format(a.upload_paparan_program_spm_deviasi, 0, 'id_ID' ) AS upload_paparan_program_spm_deviasi_format,
		format(a.upload_paparan_program_spm_persen_deviasi, 2, 'id_ID' ) AS upload_paparan_program_spm_persen_deviasi_format,
		c.work_unit_code,
		c.work_unit_name,
		CONCAT(b.tabs,'___') AS tabs,
		CONCAT(b.hirarki,':',(CASE WHEN b.levels >= 2 THEN CONCAT(':',a.upload_paparan_program_code,':') ELSE '' END),number_to_alphabet(a.upload_paparan_program_id)) AS hirarki,
		b.levels + 1
    FROM trx_upload_paparan_program a
    INNER JOIN category_hierarchy b ON a.upload_paparan_program_parent_uuid = b.upload_paparan_program_uuid
		LEFT JOIN mst_work_units c ON a.upload_paparan_program_work_unit_uuid = c.work_unit_uuid AND c.work_unit_log_uuid IS NULL AND c.work_unit_status = 1
		WHERE a.upload_paparan_program_status = 1 AND a.upload_paparan_program_log_uuid IS NULL
		AND a.upload_paparan_program_year = tahun AND a.upload_paparan_program_month = bulan_fix

  
--       
-- 		SELECT
-- 			aa.work_unit_id,
-- 			aa.work_unit_code,
-- 			aa.work_unit_name,
-- 			aa.work_unit_sort,
-- 			IFNULL(sum(cc.upload_nilai_program_pagu),0) AS plafon,
-- 			IFNULL(sum(dd.budget_realization),0) AS realisasi,
-- 			
-- 			(IFNULL(
-- 			(SELECT 
-- 			(CASE 
-- 			WHEN bulan = 1 THEN x.target_value_percent_1
-- 			WHEN bulan = 2 THEN x.target_value_percent_2
-- 			WHEN bulan = 3 THEN x.target_value_percent_3
-- 			WHEN bulan = 4 THEN x.target_value_percent_4
-- 			WHEN bulan = 5 THEN x.target_value_percent_5
-- 			WHEN bulan = 6 THEN x.target_value_percent_6
-- 			WHEN bulan = 7 THEN x.target_value_percent_7
-- 			WHEN bulan = 8 THEN x.target_value_percent_8
-- 			WHEN bulan = 9 THEN x.target_value_percent_9
-- 			WHEN bulan = 10 THEN x.target_value_percent_10
-- 			WHEN bulan = 11 THEN x.target_value_percent_11
-- 			WHEN bulan = bulan THEN x.target_value_percent_12
-- 			 ELSE 0 END) target_value
-- 			 FROM trx_target x WHERE x.target_status = 1 AND x.target_log_uuid IS NULL AND x.target_year = tahun AND  x.target_status = 1 AND x.target_work_unit_uuid = aa.work_unit_uuid)
-- 			 ,0)*IFNULL(sum(cc.upload_nilai_program_pagu),0))/100
-- 				target,
-- 			IFNULL((SELECT SUM(x.sppd_pegawai)+SUM(x.sppd_barang)+SUM(x.sppd_modal) FROM trx_sppd x WHERE x.sppd_status = 1 AND x.sppd_log_uuid IS NULL AND x.sppd_year = tahun AND x.sppd_month <= bulan AND 	x.sppd_work_unit_uuid = aa.work_unit_uuid),0) sppd
-- 		FROM
-- 			mst_work_units aa 
-- 			LEFT JOIN trx_work_programs bb ON bb.work_program_work_unit_uuid = aa.work_unit_uuid AND bb.work_program_year = tahun AND bb.work_program_status = 1 AND bb.work_program_log_uuid IS NULL
-- 			LEFT JOIN trx_budgets cc ON bb.work_program_uuid = cc.budget_work_program_uuid AND cc.budget_year = bb.work_program_year AND cc.budget_month = 1 AND cc.budget_status = 1 AND cc.budget_log_uuid IS NULL
-- 			LEFT JOIN trx_budgets dd ON bb.work_program_uuid = dd.budget_work_program_uuid AND dd.budget_year = bb.work_program_year AND dd.budget_month <= bulan AND dd.budget_status = 1 AND dd.budget_log_uuid IS NULL
-- 		WHERE
-- 			aa.work_unit_log_uuid IS NULL 
-- 			AND aa.work_unit_status = 1 
-- 			AND aa.work_unit_parent_uuid != '0' 
-- 			GROUP BY
-- 			aa.work_unit_id,
-- 			aa.work_unit_code,
-- 			aa.work_unit_name,
-- 			aa.work_unit_sort
	), fixer AS(
   
  SELECT 
	aa.*, 
   (
  
  (
  (SELECT CAST(IFNULL(
  (
            CASE
                
                WHEN bulan = 1 THEN
                x.target_value_percent_1
                WHEN bulan = 2 THEN
                x.target_value_percent_2 
                WHEN bulan = 3 THEN
                x.target_value_percent_3 
                WHEN bulan = 4 THEN
                x.target_value_percent_4 
                WHEN bulan = 5 THEN
                x.target_value_percent_5 
                WHEN bulan = 6 THEN
                x.target_value_percent_6 
                WHEN bulan = 7 THEN
                x.target_value_percent_7 
                WHEN bulan = 8 THEN
                x.target_value_percent_8 
                WHEN bulan = 9 THEN
                x.target_value_percent_9 
                WHEN bulan = 10 THEN
                x.target_value_percent_10 
                WHEN bulan = 11 THEN
                x.target_value_percent_11 
                WHEN bulan = bulan THEN
                x.target_value_percent_12 ELSE 0 
                END 
              )
              
               ,0) AS DECIMAL(12,2))
               FROM trx_target x 
            WHERE
              x.target_status = 1 
              AND x.target_log_uuid IS NULL 
              AND x.target_year = tahun 
              AND x.target_status = 1 
              AND x.target_work_unit_uuid = aa.upload_paparan_program_work_unit_uuid
               )
               )
               ) persen_target 
  ,
   FLOOR(
  
  (
  (SELECT IFNULL(
  (
            CASE
                
                WHEN bulan = 1 THEN
                x.target_value_percent_1
                WHEN bulan = 2 THEN
                x.target_value_percent_2 
                WHEN bulan = 3 THEN
                x.target_value_percent_3 
                WHEN bulan = 4 THEN
                x.target_value_percent_4 
                WHEN bulan = 5 THEN
                x.target_value_percent_5 
                WHEN bulan = 6 THEN
                x.target_value_percent_6 
                WHEN bulan = 7 THEN
                x.target_value_percent_7 
                WHEN bulan = 8 THEN
                x.target_value_percent_8 
                WHEN bulan = 9 THEN
                x.target_value_percent_9 
                WHEN bulan = 10 THEN
                x.target_value_percent_10 
                WHEN bulan = 11 THEN
                x.target_value_percent_11 
                WHEN bulan = bulan THEN
                x.target_value_percent_12 ELSE 0 
                END 
              )
              
               ,0)
               FROM trx_target x 
            WHERE
              x.target_status = 1 
              AND x.target_log_uuid IS NULL 
              AND x.target_year = tahun 
              AND x.target_status = 1 
              AND x.target_work_unit_uuid = aa.upload_paparan_program_work_unit_uuid
               )
               )*FLOOR(IFNULL(aa.upload_paparan_program_spd_pagu,0))/100
               ) target
    
   FROM category_hierarchy aa WHERE aa.levels = 2
  )
  
--   	SELECT *,
-- 	CONCAT(tabs,' ',upload_paparan_program_name) nama_tabs,
--   		upload_paparan_program_spd_pagu plafon,
-- 		upload_paparan_program_spd_realisasi realisasi,
--   0 AS target_value,
--   0 AS target,
--   upload_paparan_program_spd_target sppd
-- 
-- 	FROM category_hierarchy
--   WHERE levels = 2
-- 	ORDER BY 
-- 	hirarki ASC
  
  
	SELECT 
	aa.*,
	format(aa.upload_paparan_program_spd_pagu, 0, 'id_ID' ) plafon_format,
	format(aa.upload_paparan_program_spd_realisasi, 0, 'id_ID' ) realisasi_format,
	format(aa.target, 0, 'id_ID' ) target_format,
	format(aa.upload_paparan_program_spd_target, 0, 'id_ID' ) sppd_format,
	IFNULL(aa.persen_target,0) AS persen_target,
  upload_paparan_program_spd_deviasi_format deviasi_format,
-- 	format( ABS(aa.upload_paparan_program_spd_pagu-aa.upload_paparan_program_spd_realisasi), 0, 'id_ID' ) AS deviasi_format,
	IFNULL(ROUND(((aa.upload_paparan_program_spd_realisasi/aa.target)*100),2),0) persen_realisasi_target,
	IFNULL(ROUND(((aa.upload_paparan_program_spd_realisasi/aa.upload_paparan_program_spd_pagu)*100),2),0) persen_realisasi_pagu,
	IFNULL(aa.upload_paparan_program_spd_pagu-aa.upload_paparan_program_spd_realisasi,0) AS sisa_anggaran_spm,
	format( (aa.upload_paparan_program_spd_pagu-aa.upload_paparan_program_spd_realisasi), 0, 'id_ID' ) AS sisa_anggaran_spm_format,
	aa.upload_paparan_program_spd_pagu-aa.upload_paparan_program_spd_target AS sisa_anggaran_sp2d,
	format( (aa.upload_paparan_program_spd_pagu-aa.upload_paparan_program_spd_target), 0, 'id_ID' ) AS sisa_anggaran_sp2d_format
	FROM fixer aa
	ORDER BY
		aa.hirarki ASC;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for get_data_apk_perbiro_by_periode
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_data_apk_perbiro_by_periode`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_data_apk_perbiro_by_periode`( tahun INT, bulan INT)
BEGIN  
	
	DECLARE bulan_fix INT;
	
	SELECT aa.upload_apk_month INTO bulan_fix FROM trx_upload_apk aa WHERE aa.upload_apk_year = tahun AND aa.upload_apk_month <= bulan
	AND aa.upload_apk_status = 1
	GROUP BY aa.upload_apk_month
	ORDER BY aa.upload_apk_month DESC
	LIMIT 1;
	
	SELECT 
		aa.upload_apk_id,
		aa.upload_apk_uuid,
		aa.upload_apk_year,
		aa.upload_apk_month,
		aa.upload_apk_nama,
		aa.upload_apk_ket,
		(CASE WHEN aa.upload_apk_ket = 'LN' THEN 'Luar Negeri'
		WHEN aa.upload_apk_ket = 'DN' THEN 'Dalam Negeri' ELSE aa.upload_apk_ket END) upload_apk_ket_name, 
		aa.upload_apk_pagu,
		aa.upload_apk_realisasi,
		aa.upload_apk_persentase_realisasi,
		aa.upload_apk_sisa,
		format( aa.upload_apk_pagu, 0, 'id_ID' ) AS upload_apk_pagu_format,
		format( aa.upload_apk_realisasi, 0, 'id_ID' ) AS upload_apk_realisasi_format,
		format( aa.upload_apk_persentase_realisasi, 2, 'id_ID' ) AS upload_apk_persentase_realisasi_format,
		format( aa.upload_apk_sisa, 0, 'id_ID' ) AS upload_apk_sisa_format,
		aa.upload_apk_create_by,
		aa.upload_apk_create_date,
		aa.upload_apk_status,
		aa.upload_apk_log_uuid
 FROM trx_upload_apk aa WHERE aa.upload_apk_year = tahun AND aa.upload_apk_month <= bulan_fix AND aa.upload_apk_status = 1
 ORDER BY aa.upload_apk_id ASC;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for get_data_belanja_by_periode
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_data_belanja_by_periode`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_data_belanja_by_periode`(tahun INT, bulan INT)
BEGIN  
	    DECLARE bulan_fix INT;
			
			SELECT upload_belanja_month INTO bulan_fix
			FROM trx_upload_belanja 
			WHERE upload_belanja_year = tahun AND
			upload_belanja_month <= bulan
			AND upload_belanja_status = 1
			GROUP BY upload_belanja_year, upload_belanja_month
			ORDER BY upload_belanja_month DESC
			LIMIT 1;

			SELECT 
			aa.upload_belanja_id,
			aa.upload_belanja_uuid,
			aa.upload_belanja_year,
			aa.upload_belanja_month,
			aa.upload_belanja_nama,
			aa.upload_belanja_spd_pagu,
			aa.upload_belanja_spd_realisasi,
			aa.upload_belanja_spd_persentase_realisasi,
			aa.upload_belanja_spd_total,
			format( aa.upload_belanja_spd_pagu, 0, 'id_ID' ) AS upload_belanja_spd_pagu_format,
			format( aa.upload_belanja_spd_realisasi, 0, 'id_ID' ) AS upload_belanja_spd_realisasi_format,
			format( aa.upload_belanja_spd_persentase_realisasi, 2, 'id_ID' ) AS upload_belanja_spd_persentase_realisasi_format,
			format( aa.upload_belanja_spd_total, 0, 'id_ID' ) AS upload_belanja_spd_total_format,
			aa.upload_belanja_spm_pagu,
			aa.upload_belanja_spm_realisasi,
			aa.upload_belanja_spm_persentase_realisasi,
			aa.upload_belanja_spm_total,
			format( aa.upload_belanja_spm_pagu, 0, 'id_ID' ) AS upload_belanja_spm_pagu_format,
			format( aa.upload_belanja_spm_realisasi, 0, 'id_ID' ) AS upload_belanja_spm_realisasi_format,
			format( aa.upload_belanja_spm_persentase_realisasi, 2, 'id_ID' ) AS upload_belanja_spm_persentase_realisasi_format,
			format( aa.upload_belanja_spm_total, 0, 'id_ID' ) AS upload_belanja_spm_total_format,
			aa.upload_belanja_create_by,
			aa.upload_belanja_create_date,
			aa.upload_belanja_status,
			aa.upload_belanja_log_uuid
			FROM trx_upload_belanja aa
			WHERE aa.upload_belanja_year = tahun AND aa.upload_belanja_month <= bulan_fix
			AND aa.upload_belanja_status = 1
			ORDER BY aa.upload_belanja_nama ASC;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for get_data_capaian_kinerja_by_periode
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_data_capaian_kinerja_by_periode`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_data_capaian_kinerja_by_periode`( tahun INT)
BEGIN  
  with recursive cte  as (
		SELECT 
	aa.sasaran_strategis_id,
	aa.sasaran_strategis_uuid,
	aa.sasaran_strategis_parent_uuid,
	aa.sasaran_strategis_year,
	aa.sasaran_strategis_name,
	aa.sasaran_strategis_indicator_name,
	cc.work_unit_code,
	cc.work_unit_name,

	aa.sasaran_strategis_satuan,
	aa.sasaran_strategis_target,
	aa.sasaran_strategis_realisasi,

	CONCAT(aa.sasaran_strategis_sort,'') hirarki,
	0 AS levels
	 FROM `trx_sasaran_strategis` aa 
		LEFT JOIN mst_work_units cc ON aa.sasaran_strategis_biro_uuid = cc.work_unit_uuid AND cc.work_unit_log_uuid IS NULL

	 WHERE aa.sasaran_strategis_parent_uuid = '0'
		UNION ALL
		SELECT 
	aa.sasaran_strategis_id,
	aa.sasaran_strategis_uuid,
	aa.sasaran_strategis_parent_uuid,
	aa.sasaran_strategis_year,
	aa.sasaran_strategis_name,
	aa.sasaran_strategis_indicator_name,
	cc.work_unit_code,
	cc.work_unit_name,
	aa.sasaran_strategis_satuan,
	aa.sasaran_strategis_target,
	aa.sasaran_strategis_realisasi,
	CONCAT(bb.hirarki,':',aa.sasaran_strategis_sort) hirarki,
	bb.levels +1 AS levels
	 FROM `trx_sasaran_strategis` aa
	 INNER JOIN cte bb ON aa.sasaran_strategis_parent_uuid = bb.sasaran_strategis_uuid
	 LEFT JOIN mst_work_units cc ON aa.sasaran_strategis_biro_uuid = cc.work_unit_uuid AND cc.work_unit_log_uuid IS NULL
		WHERE aa.sasaran_strategis_parent_uuid = '0'
	)
	select aa.sasaran_strategis_id,
	aa.sasaran_strategis_uuid,
	CONCAT((CASE WHEN aa.sasaran_strategis_parent_uuid = '0' THEN aa.sasaran_strategis_name ELSE aa.work_unit_code END),'') sasaran_strategis_name,
	CONCAT((CASE WHEN aa.sasaran_strategis_parent_uuid = '0' THEN aa.sasaran_strategis_indicator_name ELSE aa.sasaran_strategis_indicator_name END),'') sasaran_strategis_indicator_name,
	aa.sasaran_strategis_satuan,
	aa.sasaran_strategis_target,
	levels
	 from cte aa ORDER BY aa.hirarki ASC;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for get_data_dashboard_realisasi_anggaran
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_data_dashboard_realisasi_anggaran`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_data_dashboard_realisasi_anggaran`( tahun INT)
BEGIN  
  
  WITH datas AS (
		SELECT
			aa.work_unit_id,
			aa.work_unit_code,
			aa.work_unit_name,
			aa.work_unit_sort,
			IFNULL(sum(cc.budget_plafon),0) AS plafon,
			IFNULL(sum(dd.budget_realization),0) AS realisasi
		FROM
			mst_work_units aa 
			LEFT JOIN trx_work_programs bb ON bb.work_program_work_unit_uuid = aa.work_unit_uuid AND bb.work_program_status = 1 AND bb.work_program_log_uuid IS NULL
			LEFT JOIN trx_budgets cc ON bb.work_program_uuid = cc.budget_work_program_uuid AND cc.budget_year = bb.work_program_year AND cc.budget_month = 1 AND cc.budget_status = 1 AND cc.budget_log_uuid IS NULL
			LEFT JOIN trx_budgets dd ON bb.work_program_uuid = dd.budget_work_program_uuid AND dd.budget_year = bb.work_program_year AND dd.budget_status = 1 AND dd.budget_month = (
	SELECT
		MAX( xx.budget_month ) 
	FROM
		trx_budgets xx WHERE xx.budget_year = dd.budget_year 
		AND xx.budget_work_program_uuid = dd.budget_work_program_uuid 
		AND xx.budget_log_uuid IS NULL 
	)  AND dd.budget_log_uuid IS NULL
		WHERE
			aa.work_unit_log_uuid IS NULL 
			AND aa.work_unit_status = 1 
			AND aa.work_unit_parent_uuid != '0' 
			AND bb.work_program_year = tahun 
			GROUP BY
			aa.work_unit_id,
			aa.work_unit_code,
			aa.work_unit_name,
			aa.work_unit_sort
	)
	SELECT 
	aa.* -- ,
-- 	format(aa.plafon, 0, 'id_ID' ) plafon_format,
-- 	format(aa.realisasi, 0, 'id_ID' ) realisasi_format,
-- 	format(aa.target, 0, 'id_ID' ) target_format,
-- 	format(aa.sppd, 0, 'id_ID' ) sppd_format,
-- 	IFNULL(ROUND(((aa.target/aa.plafon)*100),2),0) AS persen_target,
-- 	format( ABS(aa.plafon-aa.realisasi), 0, 'id_ID' ) AS deviasi_format,
-- 	IFNULL(ROUND(((aa.realisasi/aa.target)*100),2),0) persen_realisasi_target,
-- 	IFNULL(ROUND(((aa.realisasi/aa.plafon)*100),2),0) persen_realisasi_pagu,
-- 	IFNULL(aa.plafon-aa.realisasi,0) AS sisa_anggaran_spm,
-- 	format( (aa.plafon-aa.realisasi), 0, 'id_ID' ) AS sisa_anggaran_spm_format,
-- 	aa.plafon-aa.sppd AS sisa_anggaran_sp2d,
-- 	format( (aa.plafon-aa.sppd), 0, 'id_ID' ) AS sisa_anggaran_sp2d_format
	FROM datas aa
	ORDER BY
		aa.work_unit_sort ASC;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for get_data_detail_perbiro_by_periode
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_data_detail_perbiro_by_periode`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_data_detail_perbiro_by_periode`( tahun INT, bulan INT, jenis INT )
BEGIN  
	
	DECLARE bulan_fix INT;
	DECLARE work_unit_uuid VARCHAR(255);
	
	SELECT (CASE 
	WHEN jenis = 1 THEN '261b373f-5a41-11ee-971e-f4a4757ae8c3'
	WHEN jenis = 2 THEN '261b3744-5a41-11ee-971e-f4a4757ae8c3'
	WHEN jenis = 3 THEN '261b3748-5a41-11ee-971e-f4a4757ae8c3' ELSE '' END) INTO work_unit_uuid;
	

	SELECT 
	bb.upload_nilai_program_month INTO bulan_fix
	FROM trx_upload_work_program aa
	LEFT JOIN trx_upload_nilai_program bb ON aa.upload_work_program_uuid = bb.upload_nilai_program_work_program_uuid AND bb.upload_nilai_program_status = 1
	AND bb.upload_nilai_program_year = tahun AND bb.upload_nilai_program_month <= bulan
	WHERE aa.upload_work_program_work_unit_uuid = work_unit_uuid AND aa.upload_work_program_status = 1
	GROUP BY
	bb.upload_nilai_program_year,
	bb.upload_nilai_program_month
	ORDER BY 
	bb.upload_nilai_program_month DESC
	LIMIT 1;

	
	WITH RECURSIVE category_hierarchy AS (
		SELECT 
		a.upload_work_program_id,
		a.upload_work_program_uuid,
		a.upload_work_program_parent_uuid,
		a.upload_work_program_work_unit_uuid,
		a.upload_work_program_year,
		a.upload_work_program_code,
		a.upload_work_program_name,
		c.work_unit_code,
		c.work_unit_name,
		CAST('' AS CHAR(255)) AS tabs,
		CAST(CONCAT(number_to_alphabet(a.upload_work_program_id)) AS CHAR(4400)) AS hirarki,
		0 AS levels

		FROM trx_upload_work_program a
		LEFT JOIN mst_work_units c ON a.upload_work_program_work_unit_uuid = c.work_unit_uuid AND c.work_unit_log_uuid IS NULL AND c.work_unit_status = 1
		WHERE a.upload_work_program_parent_uuid = '0' 
		UNION ALL
		SELECT 
		a.upload_work_program_id,
		a.upload_work_program_uuid,
		a.upload_work_program_parent_uuid,
		a.upload_work_program_work_unit_uuid,
		a.upload_work_program_year,
		a.upload_work_program_code,
		a.upload_work_program_name,
		c.work_unit_code,
		c.work_unit_name,
		CONCAT(b.tabs,'___') AS tabs,
		CONCAT(b.hirarki,':',(CASE WHEN b.levels >= 2 THEN CONCAT(':',a.upload_work_program_code,':') ELSE '' END),number_to_alphabet(a.upload_work_program_id)) AS hirarki,
		b.levels + 1
		FROM trx_upload_work_program a
		INNER JOIN category_hierarchy b ON a.upload_work_program_parent_uuid = b.upload_work_program_uuid
		LEFT JOIN mst_work_units c ON a.upload_work_program_work_unit_uuid = c.work_unit_uuid AND c.work_unit_log_uuid IS NULL AND c.work_unit_status = 1
	)
	



	SELECT aa.*,
	CONCAT(aa.tabs,' ',aa.upload_work_program_name) nama_tabs,
	bb.*,
	format( bb.upload_nilai_program_pagu, 0, 'id_ID' ) AS upload_nilai_program_pagu_format,
	format( bb.upload_nilai_program_realisasi, 0, 'id_ID' ) AS upload_nilai_program_realisasi_format,
	format( ((bb.upload_nilai_program_realisasi/bb.upload_nilai_program_pagu)*100), 2, 'id_ID' ) AS upload_nilai_program_realisasi_percen_format,
	format( bb.upload_nilai_program_sisa, 0, 'id_ID' ) AS upload_nilai_program_sisa_format
	FROM category_hierarchy aa
	LEFT JOIN trx_upload_nilai_program bb ON aa.upload_work_program_uuid = bb.upload_nilai_program_work_program_uuid AND bb.upload_nilai_program_status = 1
	AND bb.upload_nilai_program_year = tahun
	AND bb.upload_nilai_program_month = bulan_fix

	WHERE upload_work_program_work_unit_uuid = work_unit_uuid

	ORDER BY 
	hirarki ASC;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for get_data_detail_perbiro_setjen_by_periode
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_data_detail_perbiro_setjen_by_periode`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_data_detail_perbiro_setjen_by_periode`( tahun INT, bulan INT )
BEGIN  
	
	DECLARE bulan_fix INT;
	SELECT upload_paparan_program_month INTO bulan_fix
	FROM trx_upload_paparan_program 
	WHERE upload_paparan_program_year = tahun AND
	upload_paparan_program_month <= bulan
	AND upload_paparan_program_status = 1
	GROUP BY upload_paparan_program_year, upload_paparan_program_month
	ORDER BY upload_paparan_program_month DESC
	LIMIT 1;
	
  WITH RECURSIVE category_hierarchy AS (
    SELECT 
		a.upload_paparan_program_id,
		a.upload_paparan_program_uuid,
		a.upload_paparan_program_parent_uuid,
		a.upload_paparan_program_work_unit_uuid,
		a.upload_paparan_program_year,
		a.upload_paparan_program_month,
		a.upload_paparan_program_code,
		a.upload_paparan_program_name,
		a.upload_paparan_program_spd_pagu,
		a.upload_paparan_program_spd_realisasi,
		a.upload_paparan_program_spd_persen_realisasi,
		a.upload_paparan_program_spd_sisa,
		a.upload_paparan_program_spd_target,
		a.upload_paparan_program_spd_persen_target,
		a.upload_paparan_program_spd_deviasi,
		a.upload_paparan_program_spd_persen_deviasi,
		a.upload_paparan_program_spm_pagu,
		a.upload_paparan_program_spm_realisasi,
		a.upload_paparan_program_spm_persen_realisasi,
		a.upload_paparan_program_spm_sisa,
		a.upload_paparan_program_spm_target,
		a.upload_paparan_program_spm_persen_target,
		a.upload_paparan_program_spm_deviasi,
		a.upload_paparan_program_spm_persen_deviasi,
		format(a.upload_paparan_program_spd_pagu, 0, 'id_ID' ) AS upload_paparan_program_spd_pagu_format,
		format(a.upload_paparan_program_spd_realisasi, 0, 'id_ID' ) AS upload_paparan_program_spd_realisasi_format,
		format(a.upload_paparan_program_spd_persen_realisasi, 2, 'id_ID' ) AS upload_paparan_program_spd_persen_realisasi_format,
		format(a.upload_paparan_program_spd_sisa, 0, 'id_ID' ) AS upload_paparan_program_spd_sisa_format,
		format(a.upload_paparan_program_spd_target, 0, 'id_ID' ) AS upload_paparan_program_spd_target_format,
		format(a.upload_paparan_program_spd_persen_target, 2, 'id_ID' ) AS upload_paparan_program_spd_persen_target_format,
		format(a.upload_paparan_program_spd_deviasi, 0, 'id_ID' ) AS upload_paparan_program_spd_deviasi_format,
		format(a.upload_paparan_program_spd_persen_deviasi, 2, 'id_ID' ) AS upload_paparan_program_spd_persen_deviasi_format,
		format(a.upload_paparan_program_spm_pagu, 0, 'id_ID' ) AS upload_paparan_program_spm_pagu_format,
		format(a.upload_paparan_program_spm_realisasi, 0, 'id_ID' ) AS upload_paparan_program_spm_realisasi_format,
		format(a.upload_paparan_program_spm_persen_realisasi, 2, 'id_ID' ) AS upload_paparan_program_spm_persen_realisasi_format,
		format(a.upload_paparan_program_spm_sisa, 0, 'id_ID' ) AS upload_paparan_program_spm_sisa_format,
		format(a.upload_paparan_program_spm_target, 0, 'id_ID' ) AS upload_paparan_program_spm_target_format,
		format(a.upload_paparan_program_spm_persen_target, 2, 'id_ID' ) AS upload_paparan_program_spm_persen_target_format,
		format(a.upload_paparan_program_spm_deviasi, 0, 'id_ID' ) AS upload_paparan_program_spm_deviasi_format,
		format(a.upload_paparan_program_spm_persen_deviasi, 2, 'id_ID' ) AS upload_paparan_program_spm_persen_deviasi_format,
		c.work_unit_code,
		c.work_unit_name,
		CAST('' AS CHAR(255)) AS tabs,
		CAST(CONCAT(number_to_alphabet(a.upload_paparan_program_id)) AS CHAR(4400)) AS hirarki,
		0 AS levels

    FROM trx_upload_paparan_program a
		LEFT JOIN mst_work_units c ON a.upload_paparan_program_work_unit_uuid = c.work_unit_uuid AND c.work_unit_log_uuid IS NULL AND c.work_unit_status = 1
    WHERE a.upload_paparan_program_parent_uuid = '0' 
		AND a.upload_paparan_program_status = 1 AND a.upload_paparan_program_log_uuid IS NULL
		AND a.upload_paparan_program_year = tahun AND a.upload_paparan_program_month = bulan_fix
    UNION ALL
    SELECT 
		a.upload_paparan_program_id,
		a.upload_paparan_program_uuid,
		a.upload_paparan_program_parent_uuid,
		a.upload_paparan_program_work_unit_uuid,
		a.upload_paparan_program_year,
		a.upload_paparan_program_month,
		a.upload_paparan_program_code,
		a.upload_paparan_program_name,
		a.upload_paparan_program_spd_pagu,
		a.upload_paparan_program_spd_realisasi,
		a.upload_paparan_program_spd_persen_realisasi,
		a.upload_paparan_program_spd_sisa,
		a.upload_paparan_program_spd_target,
		a.upload_paparan_program_spd_persen_target,
		a.upload_paparan_program_spd_deviasi,
		a.upload_paparan_program_spd_persen_deviasi,
		a.upload_paparan_program_spm_pagu,
		a.upload_paparan_program_spm_realisasi,
		a.upload_paparan_program_spm_persen_realisasi,
		a.upload_paparan_program_spm_sisa,
		a.upload_paparan_program_spm_target,
		a.upload_paparan_program_spm_persen_target,
		a.upload_paparan_program_spm_deviasi,
		a.upload_paparan_program_spm_persen_deviasi,
		format(a.upload_paparan_program_spd_pagu, 0, 'id_ID' ) AS upload_paparan_program_spd_pagu_format,
		format(a.upload_paparan_program_spd_realisasi, 0, 'id_ID' ) AS upload_paparan_program_spd_realisasi_format,
		format(a.upload_paparan_program_spd_persen_realisasi, 2, 'id_ID' ) AS upload_paparan_program_spd_persen_realisasi_format,
		format(a.upload_paparan_program_spd_sisa, 0, 'id_ID' ) AS upload_paparan_program_spd_sisa_format,
		format(a.upload_paparan_program_spd_target, 0, 'id_ID' ) AS upload_paparan_program_spd_target_format,
		format(a.upload_paparan_program_spd_persen_target, 2, 'id_ID' ) AS upload_paparan_program_spd_persen_target_format,
		format(a.upload_paparan_program_spd_deviasi, 0, 'id_ID' ) AS upload_paparan_program_spd_deviasi_format,
		format(a.upload_paparan_program_spd_persen_deviasi, 2, 'id_ID' ) AS upload_paparan_program_spd_persen_deviasi_format,
		format(a.upload_paparan_program_spm_pagu, 0, 'id_ID' ) AS upload_paparan_program_spm_pagu_format,
		format(a.upload_paparan_program_spm_realisasi, 0, 'id_ID' ) AS upload_paparan_program_spm_realisasi_format,
		format(a.upload_paparan_program_spm_persen_realisasi, 2, 'id_ID' ) AS upload_paparan_program_spm_persen_realisasi_format,
		format(a.upload_paparan_program_spm_sisa, 0, 'id_ID' ) AS upload_paparan_program_spm_sisa_format,
		format(a.upload_paparan_program_spm_target, 0, 'id_ID' ) AS upload_paparan_program_spm_target_format,
		format(a.upload_paparan_program_spm_persen_target, 2, 'id_ID' ) AS upload_paparan_program_spm_persen_target_format,
		format(a.upload_paparan_program_spm_deviasi, 0, 'id_ID' ) AS upload_paparan_program_spm_deviasi_format,
		format(a.upload_paparan_program_spm_persen_deviasi, 2, 'id_ID' ) AS upload_paparan_program_spm_persen_deviasi_format,
		c.work_unit_code,
		c.work_unit_name,
		CONCAT(b.tabs,'___') AS tabs,
		CONCAT(b.hirarki,':',(CASE WHEN b.levels >= 2 THEN CONCAT(':',a.upload_paparan_program_code,':') ELSE '' END),number_to_alphabet(a.upload_paparan_program_id)) AS hirarki,
		b.levels + 1
    FROM trx_upload_paparan_program a
    INNER JOIN category_hierarchy b ON a.upload_paparan_program_parent_uuid = b.upload_paparan_program_uuid
		LEFT JOIN mst_work_units c ON a.upload_paparan_program_work_unit_uuid = c.work_unit_uuid AND c.work_unit_log_uuid IS NULL AND c.work_unit_status = 1
		WHERE a.upload_paparan_program_status = 1 AND a.upload_paparan_program_log_uuid IS NULL
		AND a.upload_paparan_program_year = tahun AND a.upload_paparan_program_month = bulan_fix
	)
	SELECT *,
	CONCAT(tabs,' ',upload_paparan_program_name) nama_tabs
	FROM category_hierarchy
	ORDER BY 
	hirarki ASC;
END
;;
delimiter ;

-- ----------------------------
-- Function structure for number_to_alphabet
-- ----------------------------
DROP FUNCTION IF EXISTS `number_to_alphabet`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `number_to_alphabet`(num INT) RETURNS varchar(255) CHARSET utf8mb3
    DETERMINISTIC
BEGIN
    DECLARE result VARCHAR(255) DEFAULT '';
    DECLARE remainder INT;

    WHILE num > 0 DO
        SET remainder = (num - 1) % 26;
        SET result = CONCAT(CHAR(65 + remainder), result); -- 65 is ASCII code for 'A'
        SET num = (num - remainder) DIV 26;
    END WHILE;

    RETURN result;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
