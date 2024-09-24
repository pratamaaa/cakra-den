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

 Date: 24/09/2024 09:40:45
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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `sys_access_detail` VALUES (15, '0d86be47-b08d-11ee-ad93-f4a4757ae8c3', '8558369f-b08c-11ee-ad93-f4a4757ae8c3', '8d78217e-5591-11ee-a558-f4a4757ae8c3', 1, 1, 1, 1, 1, '1', '0000-00-00 00:00:00', '1', '0000-00-00 00:00:00', '1', 1);
INSERT INTO `sys_access_detail` VALUES (16, '0d86be53-b08d-11ee-ad93-f4a4757ae8c3', '8558369f-b08c-11ee-ad93-f4a4757ae8c3', '8d782195-5591-11ee-a558-f4a4757ae8c3', 1, 1, 1, 1, 1, '1', '0000-00-00 00:00:00', '1', '0000-00-00 00:00:00', '1', 1);
INSERT INTO `sys_access_detail` VALUES (17, '0d86be56-b08d-11ee-ad93-f4a4757ae8c3', '8558369f-b08c-11ee-ad93-f4a4757ae8c3', '8d782199-5591-11ee-a558-f4a4757ae8c3', 1, 1, 1, 1, 1, '1', '0000-00-00 00:00:00', '1', '0000-00-00 00:00:00', '1', 1);
INSERT INTO `sys_access_detail` VALUES (19, '0d86be58-b08d-11ee-ad93-f4a4757ae8c3', '8558369f-b08c-11ee-ad93-f4a4757ae8c3', '72d90376-57b0-11ee-b087-f4a4757ae8c3', 1, 1, 1, 1, 1, '1', '0000-00-00 00:00:00', '1', '0000-00-00 00:00:00', '1', 1);
INSERT INTO `sys_access_detail` VALUES (20, '0d86be5a-b08d-11ee-ad93-f4a4757ae8c3', '8558369f-b08c-11ee-ad93-f4a4757ae8c3', 'c99ce7bc-57b0-11ee-b087-f4a4757ae8c3', 1, 1, 1, 1, 1, '1', '0000-00-00 00:00:00', '1', '0000-00-00 00:00:00', '1', 1);
INSERT INTO `sys_access_detail` VALUES (21, '0d86be47-b08d-11ee-ad93-f4a4757ae8c3', '7c841c7a-b08c-11ee-ad93-f4a4757ae8c3', '4a9af4fd-b08f-11ee-ad93-f4a4757ae8c3', 1, 1, 1, 1, 1, '1', '0000-00-00 00:00:00', '1', '0000-00-00 00:00:00', '1', 1);
INSERT INTO `sys_access_detail` VALUES (22, '48d634a8-b47c-11ee-b641-f4a4757ae8c3', '5d0a9005-5582-11ee-a558-f4a4757ae8c3', '8d7821a0-5591-11ee-a558-f4a4757ae8c3', 1, 1, 1, 1, 1, '1', '0000-00-00 00:00:00', '1', '0000-00-00 00:00:00', '1', 1);
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
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `trx_apk` VALUES (1, '27f6b6bc-baa6-11ee-878a-f4a4757ae8c3', 2023, 'Dr. Ir. Agus Puji Prasetyono, M.Eng., IPU', 1, NULL, NULL, 1, NULL);
INSERT INTO `trx_apk` VALUES (2, '27f6b722-baa6-11ee-878a-f4a4757ae8c3', 2023, 'Dr. Ir. Musri, M.T.', 2, NULL, NULL, 1, NULL);
INSERT INTO `trx_apk` VALUES (3, '27f6b725-baa6-11ee-878a-f4a4757ae8c3', 2023, 'Ir. Satya Widya Yudha, M.Sc.', 3, NULL, NULL, 1, NULL);
INSERT INTO `trx_apk` VALUES (4, '27f6b726-baa6-11ee-878a-f4a4757ae8c3', 2023, 'Dr. Ir. Herman Darnel Ibrahim M.Sc. IPU.', 4, NULL, NULL, 1, NULL);
INSERT INTO `trx_apk` VALUES (5, '27f6b728-baa6-11ee-878a-f4a4757ae8c3', 2023, 'Ir. H. Daryatmo Mardiyanto', 5, NULL, NULL, 1, NULL);
INSERT INTO `trx_apk` VALUES (6, '27f6b729-baa6-11ee-878a-f4a4757ae8c3', 2023, 'Dr. Ir. Eri Purnomohadi, M.M.', 6, NULL, NULL, 1, NULL);
INSERT INTO `trx_apk` VALUES (7, '27f6b72a-baa6-11ee-878a-f4a4757ae8c3', 2023, 'Dr. Ir. As Natio Lasman', 7, NULL, NULL, 1, NULL);
INSERT INTO `trx_apk` VALUES (8, '27f6b72c-baa6-11ee-878a-f4a4757ae8c3', 2023, 'Dr. (HC) Yusra Khan, S.H.', 8, NULL, NULL, 1, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of trx_budgets
-- ----------------------------
INSERT INTO `trx_budgets` VALUES (1, 'ec7f5c19-ef27-4085-bce3-4ddecd048257', 2024, 1, '802d6b05-1cfc-4a0c-9f7e-858f6d66c5d6', 187320000, 186848269, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (2, '221e4c87-c518-4fad-b6a9-03247e89f47a', 2024, 1, '024c840c-0e81-4f0a-b2f3-8e169bed7123', 0, 0, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (3, '2e1880ad-de05-48a7-b220-a45f33c9afa0', 2024, 1, 'f295ab3c-cc76-4e2a-a0c0-1a0c9c89913d', 210200000, 210200000, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (4, 'dd653ff2-e78b-4507-8f34-7974e2910ce3', 2024, 1, '3fca8237-42d1-4629-930b-c228c58eb69e', 59908000, 58560823, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (5, 'e1e1fcea-4589-4ff7-bebd-4090048da4b6', 2024, 1, '445b0a07-ba46-46fc-ad14-497436dcd6b7', 332811000, 332600000, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (6, '4079139a-594c-4312-94be-8ecdb58d4af4', 2024, 1, '4d120bc5-187d-4723-91ee-50f931a86e03', 2998891000, 2981875326, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (7, '5849526a-ef3f-4f07-87b0-f635b05825a4', 2024, 1, '9d291d05-22ca-4b0c-a03a-e912bc72105d', 48447000, 45950225, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (8, 'ee36c571-1b33-441c-b420-2fcb91b62279', 2024, 1, 'c8ff0a6e-a25c-4fa3-ae7e-0c4d7bebc262', 219000000, 218500000, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (9, 'f9e8edf7-6c93-489b-8912-5e57eb0af6b1', 2024, 1, '6408b41c-7907-4798-9a17-7c13fd28af56', 18638000, 18575412, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (10, 'cc64825f-cb11-4968-b481-edd240d20ffe', 2024, 1, 'c1506654-0724-445d-8557-d0208bdc0c1f', 16200000, 15400000, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (11, '3ef4551d-ccc9-4e2f-82db-05a212afdcaf', 2024, 1, 'e63f4cc8-718b-4377-9230-63a4794858cb', 446200000, 446200000, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (12, '0862a352-1baa-4163-87b5-16acb6e8c7f7', 2024, 1, 'c99b13be-e084-48f5-a3f1-dcfa4c286eb0', 1541489000, 1524558865, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (13, '4e0a927b-56c2-4605-b50b-e8742f2bedf7', 2024, 1, 'ac5b7fc2-0522-4283-9079-6a6cb59e296d', 7920000, 7626000, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (14, '948a97dc-0444-4698-90c8-f22d0addf255', 2024, 1, '36ef0850-a18d-4f51-a19e-ecf80d065e13', 37675000, 33240500, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (15, '614a76d1-d0d4-46bc-a039-6937849996cb', 2024, 1, '528b1183-0552-4610-9d0d-c67bbfe8c9b7', 26775000, 26722533, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (16, '40d070f0-dc36-4b88-b5cf-c043542890c1', 2024, 1, 'e3d0995c-1492-4a7b-9137-6d658bd36118', 0, 0, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (17, '5350cbba-f077-4758-b21b-e11d68581fad', 2024, 1, '85ebb307-a7d4-4996-8ec2-232afdc10b7a', 815251000, 806169136, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (18, '2f18eedc-6ebc-435d-8672-083c85795fd9', 2024, 1, 'e4f1e110-cdbb-4011-a9de-70b6869c74c2', 13080000, 13000000, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (19, '2a25c66b-aae7-405c-afcd-12b1f70edc23', 2024, 1, '7811fcfd-c8cf-45f8-844a-680db717e53f', 497500000, 480800000, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (20, '8a1bdd05-9ec7-4be2-8cef-d2e74b17a217', 2024, 1, '139e25a6-101b-4076-8792-f3f4784edf74', 4737830000, 4698510348, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (21, 'bac1a83a-0c2a-44b9-8cd9-4b894a516917', 2024, 1, '4db26392-32bb-4b09-9833-954ea8ddcfe3', 32070000, 31060000, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (22, '4008a867-254d-4f46-a2a9-78cf5dadeffe', 2024, 1, 'd2767b40-be8a-4d9b-86d6-0da9bb0ac006', 896727000, 895716279, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (23, 'c222c9c4-8f4c-4c07-9f5f-3d0501503102', 2024, 1, 'acd31ca3-0a04-4133-b098-3491edaaea0c', 623886000, 586634369, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (24, 'e139ea7f-5a6f-4310-a5b1-a6404d6445ba', 2024, 1, '7b2013c4-bab9-4726-b137-f1365580e119', 0, 0, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (25, '487fb102-0f9c-4156-b896-65bdfcffd817', 2024, 1, '5b7894cc-2e95-4273-864a-03a56b0c5019', 215877000, 215876934, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (26, '188278a6-e49d-4841-814d-311216a4d355', 2024, 1, '690605a6-8e3e-4d61-b688-4fe6a9443c4d', 185917000, 185861897, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (27, '31583c19-a5a3-433a-a11b-008f982ca782', 2024, 1, 'eacfeb63-bdac-42c7-91c6-f71fe0f1d1bc', 100016000, 99999668, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (28, 'b4d33a05-a281-4f9c-bba8-cd6e99795ee1', 2024, 1, '66ce2b7a-546a-4030-b137-38751e3ca76a', 263567000, 263444250, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (29, '407ea881-e189-449a-bcda-048ee224d9e2', 2024, 1, '2b1fa045-550b-4117-97e8-b259f37f8671', 187182000, 187123660, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (30, '71849463-7d3c-42f2-8f8e-8fb70bff1e1e', 2024, 1, 'e77ef469-d19c-4837-95c2-0c2c19e840d7', 828000000, 827993500, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (31, '6a36c6a9-5537-4500-8da4-a1b233adb6d5', 2024, 1, '3f146a46-0805-4f44-b731-246bdc372f2b', 0, 0, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (32, '6402a10b-e232-4aed-a71e-89f49b4a5b50', 2024, 1, 'a031ccda-a878-450e-882c-4767b278ad2d', 579048000, 578739327, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (33, '736cd813-3ae9-405a-8d8b-e4d1c257b1c3', 2024, 1, '7f61eda4-3c47-4496-9835-186f9911a254', 11011000, 10992330, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (34, 'dd4eb531-48b1-44ac-a525-d6c5e5d96a6a', 2024, 1, 'e0dd8c33-120f-4348-95d0-97bca17b2e7e', 147900000, 147348905, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (35, '0628c160-e8bf-493f-b9d8-47dd5d35df76', 2024, 1, 'c2768b57-5694-4f96-a6e6-8c57c408ca78', 60600000, 60596265, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (36, 'b047d68e-e06e-42e0-8a35-f1f10c383399', 2024, 1, '14bef32b-7006-4e25-8eca-7f3932872c68', 726900000, 726900000, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (37, '353f1448-44e3-416b-9832-bc821cb43901', 2024, 1, '2e3bffdb-4eaa-43db-ab00-c2bdd0736fde', 57300000, 56351000, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (38, '7eeb598d-be34-4040-9fb3-2cabdb22f018', 2024, 1, '5b932cf9-4fed-4959-a918-79c7963426f8', 12000000, 11036261, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (39, '0aba4419-f0de-4433-8dc9-8d6e29d512a4', 2024, 1, 'cccf60b6-a7a1-4edb-8843-a55916fb6e80', 67200000, 66898372, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (40, 'abb400f2-a59b-4555-9eb2-f83df11b06cb', 2024, 1, 'c364051e-3fd8-4dfa-a13d-a5923fbeb897', 6000000, 5843544, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (41, 'fe18228e-9072-4990-9972-f1476bc83d03', 2024, 1, '76a94129-595e-41c4-a2c4-cb44fa01ae74', 4800000, 4800000, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (42, '567a944b-1cac-4dd3-8dec-ffb410d80552', 2024, 1, 'd081ae16-99fb-4a0f-b64a-75c7db10b823', 1515000, 1514500, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (43, '238cd07c-6205-4ff2-bb24-fc8279bfaff2', 2024, 1, 'd6f03d64-7de7-4ae4-9141-68a06e53f7a1', 3990000, 3990000, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (44, 'f747969b-aaf4-4a06-8dba-81941192cfb2', 2024, 1, 'd3c7ea17-ce8e-46ec-bbe5-5508f35c606e', 144180000, 132937000, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (45, 'd97d8828-a65d-452a-a127-d605412d432b', 2024, 1, '20991120-eb1f-4bc0-a932-f60147eaf935', 131436000, 131434947, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (46, '36375718-dbc4-42c9-b5cf-f9645af7e608', 2024, 1, 'bdd43247-56fa-4a49-aee5-ca667bfe1257', 268280000, 268060040, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (47, '51e45ae7-3323-4bcb-839a-fd57c127f6d6', 2024, 1, 'adb9adda-46df-445a-bd6c-5fd71aec166e', 3290642000, 3289266932, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (48, '81d28d68-d199-4f3f-84d9-ab39f0ded572', 2024, 1, '270ea4f0-594d-475a-be11-32e656cfa8b4', 0, 0, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (49, '21cf15e8-4820-4937-a82f-2a24584f3d5a', 2024, 1, '6bae0c2d-67c4-4c98-86e6-a07c78c98994', 19952000, 19952000, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (50, '54282ce5-abe6-4599-b992-ae724e237c43', 2024, 1, '7aaad101-8bf3-45aa-a91f-381536186f6a', 192576000, 192576000, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (51, 'ec871c8b-9b7d-4bf9-96ba-c5b769053c96', 2024, 1, '0aee8b80-fcbb-42b5-9a6e-0762c505b0b0', 502270000, 492786392, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (52, 'c8840639-bce0-4027-9bac-0a6f49f6a65e', 2024, 1, '23c389a8-d20c-497c-bf4a-6896eeed0d87', 305100000, 280185000, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (53, '5704528f-fb55-474a-9ad9-ed5a6ac5fc01', 2024, 1, 'e1ce20c1-c2e6-478a-ae9b-ebdb17b86b1b', 3457950000, 3457950000, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (54, 'de5ada83-d710-4158-bf93-c4f49515fbde', 2024, 1, 'efe0d727-807b-403a-9a67-aa6d4f528a42', 52440000, 52184376, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (55, 'ee15d613-f809-4b69-a793-d7c941380f0d', 2024, 1, '04f73885-9b3c-4099-a160-79d33effdfd7', 14652000, 14607500, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (56, '48c242b6-19ee-47d6-b68a-170493d54c34', 2024, 1, 'e9d30f2d-c8b2-445e-8bce-52311cb21aab', 318600000, 318600000, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (57, '405e0c52-9c47-4bc6-ad95-3be41d212c68', 2024, 1, '305e646a-0779-4c91-ab1b-6ae66f2b520c', 2007285000, 1940306518, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (58, '4cd1f2e5-ce00-4be2-a9f2-81ac7dfd2e0c', 2024, 1, '7e1b3abf-ee87-473a-b4d9-347d5df46f8c', 439299000, 439164610, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (59, 'e83639a5-6e09-4ec9-bafc-ee860eceb566', 2024, 1, 'b4a7e904-b9af-4c52-bd68-072f2727bf4a', 10224000, 10201129, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (60, 'f7e21505-5248-4d56-8222-7d9caccdb5ea', 2024, 1, 'ea4173c0-f3f4-451e-974d-e4986e3c3cdb', 244962000, 244875350, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (61, 'e5d34631-82f4-49f0-9ff1-309f84049f95', 2024, 1, 'f8c5ea80-31b5-45c8-84dd-7a4ee030afa3', 15038000, 15037557, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (62, '985d1260-de86-42d0-aa6d-a6707b4ce13a', 2024, 1, '618a1253-1e8e-4a7f-b4fa-ea26d68683ad', 4640151000, 4639009680, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (63, '075106f5-dcde-4505-92da-97ac06956141', 2024, 1, '37e5f734-4a94-448e-895b-9f401895f308', 86000, 73756, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (64, '06442e25-ce67-46e2-858e-1e5c279bdea1', 2024, 1, '8d90bc0f-3631-4075-bb75-767c77fb3f23', 346227000, 344441240, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (65, '1f0f7fdc-3f04-44d1-b041-8e35d26fd585', 2024, 1, '1cda844a-435d-42b8-a287-e7add6dff9b9', 96235000, 95339092, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (66, 'f2dbd8a8-d9e9-44ff-8e99-bffd1151444e', 2024, 1, 'f32e846d-714b-40ee-bef7-e0bd2c836873', 236135000, 235470000, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (67, '5f326c7a-7124-4963-ae4c-e63a2411d803', 2024, 1, 'bb02df80-d778-479b-94a5-6d43c292b3e0', 514984000, 514712000, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (68, 'dd3c5960-4893-4b3e-b5e2-8ebd2595f705', 2024, 1, '97fe9185-3267-4c2c-a89e-ce433685e072', 35085000, 33370072, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (69, '729b0557-597f-4a25-a84b-fe882d09a2f8', 2024, 1, '48732a6e-0847-4673-b2bd-3b6e21e533d6', 261241000, 259480860, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (70, 'b3b62421-4876-4a9d-820d-112dfaae66f2', 2024, 1, 'e681548a-df07-4fe3-9d97-736e2b0228b3', 353391000, 344573000, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (71, 'e9107aea-9415-441b-bbe9-e1710e5bba11', 2024, 1, 'aff935ab-4e4b-4a11-9699-8fe9290b22f3', 125025000, 124870000, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (72, 'a2b2f5bd-afbe-4f53-aaed-3f1885d12e28', 2024, 1, '8b6bc569-5f5a-4488-acc7-9b5d4121c1aa', 4201352000, 4200066000, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (73, '473beb75-b87b-49d9-8c01-87751a6d6eef', 2024, 1, '693ec29a-d7d7-41f4-a5f5-56c7ab360455', 0, 0, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (74, '6997b25b-6b8f-4596-a55b-4f0c5e2cf352', 2024, 1, 'fab48720-4be2-4b32-b6a9-6ae809a0ccb5', 7290725000, 7272794111, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (75, '4079187b-3cd7-4475-9e0b-0ba1417ebf94', 2024, 1, '8dd84a84-0408-4c03-af57-2c81a0af0cd7', 109017000, 100861000, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (76, 'ac1d19ea-7f68-4ff2-a88d-bab0b514c57b', 2024, 1, '09e4d719-5dec-4df8-83c4-9fce869216ba', 6000, 2510, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (77, '751fe282-d944-4667-9d5c-2bc50e6adb44', 2024, 1, 'f42daa7c-0948-490f-b6a9-e50db6485429', 10800000, 4449750, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (78, '1866062c-f4ff-4722-b3c6-92eeb2011384', 2024, 1, '2d04b6a0-2adf-4695-b649-7add3c76c23a', 5280000, 2195210, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (79, '30fc7227-3f91-4f51-9fbb-1987eb897c33', 2024, 1, 'e5be8077-91ef-4cba-bd48-69701392e60c', 18360000, 18160000, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (80, 'f050a328-d25c-4c7d-a6e2-ddcf3045df19', 2024, 1, '789546ee-e7a7-4b46-a986-ce435f30e291', 9870000, 6228120, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (81, '463a50ef-7446-4ad8-a6d6-b7a9f8878726', 2024, 1, '0fd77f6c-f0f9-463f-9182-205905385523', 27690000, 12802000, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (82, 'cb56bfa4-983c-49a5-bbf5-af66d6997a40', 2024, 1, '4bcb4b67-50e7-4942-b445-65456df596ea', 156450000, 154966836, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (83, '2e8d0691-8ae0-4a2f-a4a3-4812e71987ee', 2024, 1, 'f8e5a996-1e19-48ac-a562-71758d2a6abc', 135461000, 131865650, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (84, 'bf323c49-29df-4aa0-9087-a8e637b9c740', 2024, 1, '694a1469-2940-4e2c-b45f-ee4ed3cc714c', 114000000, 114000000, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (85, 'ad5fb31c-b600-4314-be9d-ca120de002a1', 2024, 1, 'fa7d1222-f88a-4e18-9475-862480efea9f', 5189000, 5149623, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (86, 'ae61ee94-95c9-4de5-9076-20ccd5daab50', 2024, 1, '2e7e35e8-44bc-4476-8bb5-a73119a049d8', 204121000, 203800000, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (87, 'f6d665c3-06b5-4e16-8ed4-b03e1c1ef8ba', 2024, 1, 'a1cd5aa9-4d55-467d-a658-315572b633a8', 1109509000, 1062716671, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (88, 'e6199608-4565-47bf-9d8a-ace0046aa67e', 2024, 1, 'c6476dfd-7629-4c99-9693-639c600c1548', 82045000, 81963000, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (89, 'a31e5d95-3caa-4b79-8946-04f3670c2139', 2024, 1, '0b44b445-8606-4d1c-a7d8-3af27ffee943', 214000000, 214000000, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (90, '82dbbc2c-3edd-4e34-af0a-48ad3afa92bf', 2024, 1, '8a638835-69e3-447b-af4b-17f52badea95', 0, 0, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (91, 'c28ad973-4850-4297-80fd-071140c73410', 2024, 1, 'd2465534-9aae-427b-a63f-6d984f3c4543', 2000000, 2000000, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (92, '61943f95-d6d5-40de-a336-afd907f54adf', 2024, 1, 'a8510c5b-0829-428f-b09b-e8fb7bc288b7', 1253774000, 1253183489, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (93, 'a5770369-2195-4e37-965e-1f66d1fbc0ea', 2024, 1, 'eb88c03f-0b43-424b-8416-5e6498a6f670', 161458000, 161217624, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (94, 'f8d19cb6-08dd-4e9f-b703-ecd96eafd907', 2024, 1, 'aa0d718a-03df-494c-9886-7a66587b9e86', 214000000, 214000000, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (95, 'cbf0d2e0-3f59-432c-9725-23c06fb110d0', 2024, 1, '37f2762c-08bb-42b1-aa80-d6559dfc3453', 17856000, 17727029, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (96, '52bb7a86-da52-4de8-ad7b-ade231623454', 2024, 1, 'b16e253d-74ec-4018-86d3-263e7508693f', 44700000, 44700000, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (97, '881492cc-0acc-46d1-b493-c4a63b157ef2', 2024, 1, '3e62a333-424a-491a-a1ee-c0ca3150c230', 1498276000, 1487604802, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (98, 'b58d4c47-69fa-4266-99c4-3304fa0af5da', 2024, 1, '3314cace-2909-49b6-bdb1-8aef658858c2', 8940000, 8430000, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (99, 'e0b89955-263c-475b-992f-ea40db5fb24f', 2024, 1, '5c4e52c6-9306-44c5-af5d-d87e883a062f', 132700000, 132339070, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (100, '88947c4f-4f1d-46f1-ab7a-acbd989dc975', 2024, 1, '2e76e938-3120-46a8-b4ac-e92502ce58a0', 42678000, 42525000, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (101, 'afed32c3-e612-420d-9eb8-be77bfa12e4a', 2024, 1, 'db22b9ba-2ab2-4bf4-a41d-d84004bac5dd', 254500000, 254500000, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (102, '7f8f2ec5-28f1-4a01-9d85-cb4344c19064', 2024, 1, '732eddaa-0d2f-4265-870a-5a45dcb4521d', 46817000, 46790450, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (103, '615fd1a2-6b00-4b40-902c-5e701d7add12', 2024, 1, 'abdd4353-6652-406e-9182-70f12e5d1b65', 23700000, 23500000, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (104, 'd0d86864-6a76-4bd7-9c60-e499afe63c00', 2024, 1, '57339b11-bc4e-491f-ae13-d7bee6e34ea7', 1445106000, 1443627688, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (105, '7197a5be-b560-49b0-ae56-c8d1005f20f5', 2024, 1, '3b8b2315-6059-4422-84ca-7ccad765180b', 0, 0, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (106, '7137cd14-b6d4-4cde-b334-394a5bb2fead', 2024, 1, '8277cf92-5bb3-4a78-9791-467b33efaac1', 52442000, 52325400, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (107, '24b808fa-12ab-4375-b5ab-ed90f296b475', 2024, 1, 'e3098dd1-650e-4685-a557-a53cd874531e', 45880000, 45852920, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (108, '2f4ef777-7ee9-430a-bde4-e3fd4ae1e9f6', 2024, 1, '29a60220-c6eb-4eca-ac4a-1185a5ed7f0d', 189000000, 189000000, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (109, 'a76360b8-2340-47da-849a-ce51be737999', 2024, 1, '0b55b2c7-6a06-486b-b69a-dcac6b4301a4', 23088000, 23044105, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (110, 'a7eebc7f-0b53-4436-b617-fd54c266fe88', 2024, 1, '3ae57c3d-16a7-446a-8947-1bf1049e2b39', 164125000, 163300000, '', '2024-02-13 09:43:23', 1, NULL);
INSERT INTO `trx_budgets` VALUES (111, '787987df-601b-406a-b487-293f706a6674', 2024, 1, 'a0686f34-a6c3-47f9-87b2-ec653154f9c3', 1690947000, 1671857757, '', '2024-02-13 09:43:23', 1, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of trx_dashboard_realisasi
-- ----------------------------
INSERT INTO `trx_dashboard_realisasi` VALUES (7, '86931d59-6127-48f7-933a-92c8126201d5', 2023, 'PAGU AWAL', 21499586000, 35817839000, 0, 0, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-01-22 15:25:43', 1, NULL, 57317425000);
INSERT INTO `trx_dashboard_realisasi` VALUES (12, 'c01b6fd3-62b1-4cf6-981c-1a9fc17fce4b', 2023, 'DIPA', 21299586000, 35817839000, 200000000, 1, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-01-22 15:30:11', 1, NULL, 57317425000);
INSERT INTO `trx_dashboard_realisasi` VALUES (13, '3d85a6d0-f827-4efe-bff9-405e944304f0', 2023, 'DIPA', 21399586000, 35817839000, 100000000, 2, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-01-22 15:30:29', 1, NULL, 57317425000);
INSERT INTO `trx_dashboard_realisasi` VALUES (14, '5c09481b-945b-4d74-8c16-4f6763f0b660', 2024, 'PAGU AWAL', 21499586000, 35817839000, 0, 0, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-01-22 15:25:43', 1, NULL, 57317425000);
INSERT INTO `trx_dashboard_realisasi` VALUES (17, 'df4f8d33-bc9b-4351-ac78-c1725a146dff', 2024, 'DIPA', 21299586000, 35817839000, 200000000, 1, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-01-22 15:30:11', 1, NULL, 57317425000);
INSERT INTO `trx_dashboard_realisasi` VALUES (18, '048245e9-66e1-4c68-8eec-8fd6f4249951', 2024, 'DIPA', 21399586000, 35817839000, 100000000, 2, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-01-22 15:30:29', 1, NULL, 57317425000);
INSERT INTO `trx_dashboard_realisasi` VALUES (19, 'e2683511-629d-445d-bc5e-08b6058f8b87', 2024, 'DIPA', 21299586000, 35817839000, 200000000, 3, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-01-22 15:34:35', 1, NULL, 57317425000);
INSERT INTO `trx_dashboard_realisasi` VALUES (20, '94fdeaad-6c5b-40f6-a132-c4caec0f684e', 2024, 'POK', 21299586000, 35817839000, 200000000, 1, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-01-22 15:39:07', 1, NULL, 57317425000);

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
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `trx_indikator_kinerja` VALUES (1, '21349b0a-b94e-11ee-a348-f4a4757ae8c3', '34249079-b94b-11ee-a348-f4a4757ae8c3', NULL, 1, 'Rumusan Kebijakan/ Strategi Peningkatan Ketahanan Energi Nasional', 'Jumlah', 1.00, 0.00, NULL, NULL, 1, NULL);
INSERT INTO `trx_indikator_kinerja` VALUES (2, '21349b1f-b94e-11ee-a348-f4a4757ae8c3', '34249088-b94b-11ee-a348-f4a4757ae8c3', NULL, 2, 'Indeks Kepuasan Layanan Dukungan Teknis dan Administratif yang Optimal Setjen DEN', 'Indeks', 3.09, 0.00, NULL, NULL, 1, NULL);
INSERT INTO `trx_indikator_kinerja` VALUES (3, '21349b23-b94e-11ee-a348-f4a4757ae8c3', '3424908b-b94b-11ee-a348-f4a4757ae8c3', NULL, 3, 'Indeks Kepuasan Layanan Perencanaan Energi', 'Indeks', 3.09, 0.00, NULL, NULL, 1, NULL);
INSERT INTO `trx_indikator_kinerja` VALUES (4, '21349b25-b94e-11ee-a348-f4a4757ae8c3', '3424908e-b94b-11ee-a348-f4a4757ae8c3', NULL, 4, 'Rumusan Rekomendasi Kebijakan Energi Lintas Sektor Hasil Koordinasi dan Sinkronisasi antara lain RUED', 'Jumlah', 7.00, 0.00, NULL, NULL, 1, NULL);
INSERT INTO `trx_indikator_kinerja` VALUES (5, '21349b28-b94e-11ee-a348-f4a4757ae8c3', '3424908e-b94b-11ee-a348-f4a4757ae8c3', NULL, 5, 'Rumusan Perencanaan Energi yang Bersifat Lintas Sektoral', 'Jumlah', 1.00, 0.00, NULL, NULL, 1, NULL);
INSERT INTO `trx_indikator_kinerja` VALUES (6, '21349b2a-b94e-11ee-a348-f4a4757ae8c3', '3424908e-b94b-11ee-a348-f4a4757ae8c3', NULL, 6, 'Jumlah Penyiapan Persidangan DEN', 'Jumlah', 8.00, 0.00, NULL, NULL, 1, NULL);
INSERT INTO `trx_indikator_kinerja` VALUES (7, '21349b2c-b94e-11ee-a348-f4a4757ae8c3', '3424908e-b94b-11ee-a348-f4a4757ae8c3', NULL, 7, 'Persentase Produk Hukum yang Ditindaklanjuti', '%', 100.00, 0.00, NULL, NULL, 1, NULL);
INSERT INTO `trx_indikator_kinerja` VALUES (8, '21349b2f-b94e-11ee-a348-f4a4757ae8c3', '34249090-b94b-11ee-a348-f4a4757ae8c3', NULL, 8, 'Evaluasi Pencapaian Bauran Energi Primer Nasional', 'Jumlah', 1.00, 0.00, NULL, NULL, 1, NULL);
INSERT INTO `trx_indikator_kinerja` VALUES (9, '21349b31-b94e-11ee-a348-f4a4757ae8c3', '34249090-b94b-11ee-a348-f4a4757ae8c3', NULL, 9, 'Evaluasi Pencapaian Bauran Energi Primer Daerah', 'Jumlah', 30.00, 0.00, NULL, NULL, 1, NULL);
INSERT INTO `trx_indikator_kinerja` VALUES (10, '21349b34-b94e-11ee-a348-f4a4757ae8c3', '34249090-b94b-11ee-a348-f4a4757ae8c3', NULL, 10, 'Monitoring Implementasi Matriks Kegiatan RUEN', 'Jumlah', 175.00, 0.00, NULL, NULL, 1, NULL);
INSERT INTO `trx_indikator_kinerja` VALUES (11, '21349b36-b94e-11ee-a348-f4a4757ae8c3', '34249092-b94b-11ee-a348-f4a4757ae8c3', NULL, 11, 'Nilai SAKIP Setjen DEN', 'Nilai', 81.05, 0.00, NULL, NULL, 1, NULL);
INSERT INTO `trx_indikator_kinerja` VALUES (12, '21349b38-b94e-11ee-a348-f4a4757ae8c3', '34249092-b94b-11ee-a348-f4a4757ae8c3', NULL, 12, 'Tingkat Maturitas SPIP Setjen DEN', 'Level', 3.55, 0.00, NULL, NULL, 1, NULL);
INSERT INTO `trx_indikator_kinerja` VALUES (13, '21349b3b-b94e-11ee-a348-f4a4757ae8c3', '34249094-b94b-11ee-a348-f4a4757ae8c3', NULL, 13, 'Indeks Reformasi Birokrasi Setjen DEN', 'Indeks', 85.15, 0.00, NULL, NULL, 1, NULL);
INSERT INTO `trx_indikator_kinerja` VALUES (14, '21349b3d-b94e-11ee-a348-f4a4757ae8c3', '34249096-b94b-11ee-a348-f4a4757ae8c3', NULL, 14, 'Indeks Profesionalitas ASN Setjen DEN', 'Indeks', 81.15, 0.00, NULL, NULL, 1, NULL);
INSERT INTO `trx_indikator_kinerja` VALUES (15, '21349b3f-b94e-11ee-a348-f4a4757ae8c3', '34249096-b94b-11ee-a348-f4a4757ae8c3', NULL, 15, 'Nilai Evaluasi Kelembagaan Setjen DEN', 'Nilai', 74.00, 0.00, NULL, NULL, 1, NULL);
INSERT INTO `trx_indikator_kinerja` VALUES (16, '21349b42-b94e-11ee-a348-f4a4757ae8c3', '34249098-b94b-11ee-a348-f4a4757ae8c3', NULL, 16, 'Nilai Indikator Kinerja Pelaksanaan Anggaran (IKPA)', 'Nilai', 94.10, 0.00, NULL, NULL, 1, NULL);
INSERT INTO `trx_indikator_kinerja` VALUES (17, '84227de7-e56e-428f-9a96-301593204cc4', '7070fd48-a5e8-407d-95ec-024e82f5267c', NULL, NULL, 'yyyyyy', 'Jumlah', 2.00, 1.50, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-02-14 15:58:09', 1, NULL);
INSERT INTO `trx_indikator_kinerja` VALUES (18, 'ecd16a4e-d3d7-4f9a-a8e5-519b3de55fb4', '53a0689b-ced6-4bd8-9d8d-1392640e8be6', NULL, NULL, 'Indikator Baru 2024', 'Jumlah', 3.00, 1.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-02-14 15:57:57', 1, NULL);

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
INSERT INTO `trx_program_apk` VALUES (1, '4213a867-bac6-11ee-8017-f4a4757ae8c3', '27f6b6bc-baa6-11ee-878a-f4a4757ae8c3', 2023, 1, 'Mengawasi Implementasi RUEN di Bidang Pemanfaatan Energi: <br>- Mengawasi Implementasi RUEN terkait Peningkatan Pemanfaatan Energi Baru dan Energi Terbarukan', 450000000.00, 445949850.00, NULL, NULL, 1, NULL);
INSERT INTO `trx_program_apk` VALUES (2, '4213a8bb-bac6-11ee-8017-f4a4757ae8c3', '27f6b6bc-baa6-11ee-878a-f4a4757ae8c3', 2023, 1, 'Mengawasi Implementasi RUEN di Bidang Penyediaan Energi: <br>- Mengawasi Implementasi RUEN terkait Pengelolaan Energi Fosil', 450000000.00, 445351633.00, NULL, NULL, 1, NULL);
INSERT INTO `trx_program_apk` VALUES (3, '4213a8be-bac6-11ee-8017-f4a4757ae8c3', '27f6b6bc-baa6-11ee-878a-f4a4757ae8c3', 2023, 1, 'Melaksanakan sinkronisasi Kebijakan Energi Lintas Sektor (Melaksanakan Sinkronisasi Kebijakan Energi Lintas Sektor dengan kebijakan dan program strategis K/L)', 290643000.00, 330126196.00, NULL, NULL, 1, NULL);
INSERT INTO `trx_program_apk` VALUES (4, '4213a8c0-bac6-11ee-8017-f4a4757ae8c3', '27f6b72a-baa6-11ee-878a-f4a4757ae8c3', 2023, 1, 'Penyusunan Laporan DEN (Koordinasi penyusunan Buku Capaian Kinerja DEN)', 350000000.00, 410830279.00, NULL, NULL, 1, NULL);
INSERT INTO `trx_program_apk` VALUES (5, '4213a8c1-bac6-11ee-8017-f4a4757ae8c3', '27f6b72a-baa6-11ee-878a-f4a4757ae8c3', 2023, 1, 'Menyusun formulasi kebijakan energi lintas sektor', 311224000.00, 153473049.00, NULL, NULL, 1, NULL);
INSERT INTO `trx_program_apk` VALUES (6, '4213a8c3-bac6-11ee-8017-f4a4757ae8c3', '27f6b72a-baa6-11ee-878a-f4a4757ae8c3', 2023, 1, 'Menganalisis Neraca Energi Nasional', 287138000.00, 275259616.00, NULL, NULL, 1, NULL);
INSERT INTO `trx_program_apk` VALUES (7, '4213a8c4-bac6-11ee-8017-f4a4757ae8c3', '27f6b729-baa6-11ee-878a-f4a4757ae8c3', 2023, 1, 'Mengawasi Pencapaian Bauran Energi Primer dan Final (Mengawasi pencapaian bauran energi nasional dan bauran energi daerah)', 550000000.00, 559081551.00, NULL, NULL, 1, NULL);
INSERT INTO `trx_program_apk` VALUES (8, '4213a8c5-bac6-11ee-8017-f4a4757ae8c3', '27f6b729-baa6-11ee-878a-f4a4757ae8c3', 2023, 1, 'Menilai Ketahanan Energi Nasional (Peningkatan Ketahanan  Energi Indonesia', 728210000.00, 686367607.00, NULL, NULL, 1, NULL);
INSERT INTO `trx_program_apk` VALUES (9, '4213a8c6-bac6-11ee-8017-f4a4757ae8c3', '27f6b726-baa6-11ee-878a-f4a4757ae8c3', 2023, 1, 'Menyusun Bahan Tinjauan Kebijakan Energi Nasional (KEN) (Pembaruan KEN)', 548381000.00, 722653672.00, NULL, NULL, 1, NULL);
INSERT INTO `trx_program_apk` VALUES (10, '4213a8c8-bac6-11ee-8017-f4a4757ae8c3', '27f6b726-baa6-11ee-878a-f4a4757ae8c3', 2023, 1, 'Menyusun Outlook Energi Indonesia', 424303000.00, 504262850.00, NULL, NULL, 1, NULL);
INSERT INTO `trx_program_apk` VALUES (11, '4213a8c9-bac6-11ee-8017-f4a4757ae8c3', '27f6b722-baa6-11ee-878a-f4a4757ae8c3', 2023, 1, 'Pembinaan Perencanaan Pelaksanaan RUED Provinsi', 354322000.00, 324116521.00, NULL, NULL, 1, NULL);
INSERT INTO `trx_program_apk` VALUES (12, '4213a8ca-bac6-11ee-8017-f4a4757ae8c3', '27f6b722-baa6-11ee-878a-f4a4757ae8c3', 2023, 1, 'Pembinaan Pendampingan Penyusunan RUED Propinsi (Pendampingan Penyusunan Perda RUED Provinsi)', 488485000.00, 489734637.00, NULL, NULL, 1, NULL);
INSERT INTO `trx_program_apk` VALUES (13, '4213a8cb-bac6-11ee-8017-f4a4757ae8c3', '27f6b72c-baa6-11ee-878a-f4a4757ae8c3', 2023, 1, 'Melaksanakan Kerjasama luar negeri', 471080000.00, 423242332.00, NULL, NULL, 1, NULL);
INSERT INTO `trx_program_apk` VALUES (14, '4213a8cd-bac6-11ee-8017-f4a4757ae8c3', '27f6b72c-baa6-11ee-878a-f4a4757ae8c3', 2023, 1, 'Merumuskan Strategi dan Kebijakan Penyediaan dan Pengelolaan CPE (Pengaturan CPE)', 408923000.00, 447595112.00, NULL, NULL, 1, NULL);
INSERT INTO `trx_program_apk` VALUES (15, '4213a8ce-bac6-11ee-8017-f4a4757ae8c3', '27f6b728-baa6-11ee-878a-f4a4757ae8c3', 2023, 1, 'Menyelenggarakan Keprotokolan, Persidangan dan Kehumasan Dewan Energi Nasional', 1546779000.00, 1550596489.00, NULL, NULL, 1, NULL);
INSERT INTO `trx_program_apk` VALUES (16, '4213a8cf-bac6-11ee-8017-f4a4757ae8c3', '27f6b728-baa6-11ee-878a-f4a4757ae8c3', 2023, 1, 'Penyusunan Renstra', NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `trx_program_apk` VALUES (17, '4213a8d1-bac6-11ee-8017-f4a4757ae8c3', '27f6b728-baa6-11ee-878a-f4a4757ae8c3', 2023, 1, 'Penguatan Kelembagaan DEN (Memberikan layanan hukum)', 680000000.00, 671549988.00, NULL, NULL, 1, NULL);
INSERT INTO `trx_program_apk` VALUES (18, '4213a8d2-bac6-11ee-8017-f4a4757ae8c3', '27f6b725-baa6-11ee-878a-f4a4757ae8c3', 2023, 1, 'Penyusunan Peta Jalan Transisi Energi ', 383072000.00, 281439937.00, NULL, NULL, 1, NULL);

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
INSERT INTO `trx_realisasi_apk` VALUES (1, 'ce70a098-baa6-11ee-878a-f4a4757ae8c3', '27f6b6bc-baa6-11ee-878a-f4a4757ae8c3', 2023, 1, 'Dalam Negeri', 461095500.00, 332843338.00, NULL, NULL, 1, NULL);
INSERT INTO `trx_realisasi_apk` VALUES (2, 'ce70a0a6-baa6-11ee-878a-f4a4757ae8c3', '27f6b6bc-baa6-11ee-878a-f4a4757ae8c3', 2023, 1, 'Luar Negeri', 289424875.00, 169050566.00, NULL, NULL, 1, NULL);
INSERT INTO `trx_realisasi_apk` VALUES (3, 'ce70a0a8-baa6-11ee-878a-f4a4757ae8c3', '27f6b722-baa6-11ee-878a-f4a4757ae8c3', 2023, 1, 'Dalam Negeri', 568428500.00, 521011899.00, NULL, NULL, 1, NULL);
INSERT INTO `trx_realisasi_apk` VALUES (4, 'ce70a0aa-baa6-11ee-878a-f4a4757ae8c3', '27f6b722-baa6-11ee-878a-f4a4757ae8c3', 2023, 1, 'Luar Negeri', 160687875.00, 102053045.00, NULL, NULL, 1, NULL);
INSERT INTO `trx_realisasi_apk` VALUES (5, 'ce70a0ab-baa6-11ee-878a-f4a4757ae8c3', '27f6b725-baa6-11ee-878a-f4a4757ae8c3', 2023, 1, 'Dalam Negeri', 801016177.00, 323655566.00, NULL, NULL, 1, NULL);
INSERT INTO `trx_realisasi_apk` VALUES (6, 'ce70a0ad-baa6-11ee-878a-f4a4757ae8c3', '27f6b725-baa6-11ee-878a-f4a4757ae8c3', 2023, 1, 'Luar Negeri', 4100198.00, 4100198.00, NULL, NULL, 1, NULL);
INSERT INTO `trx_realisasi_apk` VALUES (7, 'ce70a0ae-baa6-11ee-878a-f4a4757ae8c3', '27f6b726-baa6-11ee-878a-f4a4757ae8c3', 2023, 1, 'Dalam Negeri', 541095500.00, 353324827.00, NULL, NULL, 1, NULL);
INSERT INTO `trx_realisasi_apk` VALUES (8, 'ce70a0af-baa6-11ee-878a-f4a4757ae8c3', '27f6b726-baa6-11ee-878a-f4a4757ae8c3', 2023, 1, 'Luar Negeri', 264020875.00, 62825800.00, NULL, NULL, 1, NULL);
INSERT INTO `trx_realisasi_apk` VALUES (9, 'ce70a0b0-baa6-11ee-878a-f4a4757ae8c3', '27f6b728-baa6-11ee-878a-f4a4757ae8c3', 2023, 1, 'Dalam Negeri', 512695500.00, 189599593.00, NULL, NULL, 1, NULL);
INSERT INTO `trx_realisasi_apk` VALUES (10, 'ce70a0b2-baa6-11ee-878a-f4a4757ae8c3', '27f6b728-baa6-11ee-878a-f4a4757ae8c3', 2023, 1, 'Luar Negeri', 182620875.00, 0.00, NULL, NULL, 1, NULL);
INSERT INTO `trx_realisasi_apk` VALUES (11, 'ce70a0b3-baa6-11ee-878a-f4a4757ae8c3', '27f6b729-baa6-11ee-878a-f4a4757ae8c3', 2023, 1, 'Dalam Negeri', 461095500.00, 398804295.00, NULL, NULL, 1, NULL);
INSERT INTO `trx_realisasi_apk` VALUES (12, 'ce70a0b4-baa6-11ee-878a-f4a4757ae8c3', '27f6b729-baa6-11ee-878a-f4a4757ae8c3', 2023, 1, 'Luar Negeri', 344020875.00, 0.00, NULL, NULL, 1, NULL);
INSERT INTO `trx_realisasi_apk` VALUES (13, 'ce70a0b5-baa6-11ee-878a-f4a4757ae8c3', '27f6b72a-baa6-11ee-878a-f4a4757ae8c3', 2023, 1, 'Dalam Negeri', 805116375.00, 542725043.00, NULL, NULL, 1, NULL);
INSERT INTO `trx_realisasi_apk` VALUES (14, 'ce70a0b7-baa6-11ee-878a-f4a4757ae8c3', '27f6b72a-baa6-11ee-878a-f4a4757ae8c3', 2023, 1, 'Luar Negeri', 0.00, 0.00, NULL, NULL, 1, NULL);
INSERT INTO `trx_realisasi_apk` VALUES (15, 'ce70a0b8-baa6-11ee-878a-f4a4757ae8c3', '27f6b72c-baa6-11ee-878a-f4a4757ae8c3', 2023, 1, 'Dalam Negeri', 461095500.00, 347095844.00, NULL, NULL, 1, NULL);
INSERT INTO `trx_realisasi_apk` VALUES (16, 'ce70a0b9-baa6-11ee-878a-f4a4757ae8c3', '27f6b72c-baa6-11ee-878a-f4a4757ae8c3', 2023, 1, 'Luar Negeri', 344020875.00, 311906054.00, NULL, NULL, 1, NULL);

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
INSERT INTO `trx_sasaran_strategis` VALUES (1, '34249079-b94b-11ee-a348-f4a4757ae8c3', 2023, 'Meningkatnya Kemandirian dan Ketahanan Energi Nasional', 1, NULL, NULL, 1, NULL);
INSERT INTO `trx_sasaran_strategis` VALUES (2, '34249088-b94b-11ee-a348-f4a4757ae8c3', 2023, 'Layanan Dukungan Teknis dan Administratif yang Optimal Setjen DEN', 2, NULL, NULL, 1, NULL);
INSERT INTO `trx_sasaran_strategis` VALUES (3, '3424908b-b94b-11ee-a348-f4a4757ae8c3', 2023, 'Layanan Penyusunan Rancangan Perencanaan Energi Lintas Sektor yang Berkelanjutan', 3, NULL, NULL, 1, NULL);
INSERT INTO `trx_sasaran_strategis` VALUES (4, '3424908e-b94b-11ee-a348-f4a4757ae8c3', 2023, 'Merumuskan Kebijakan Energi dan Menyusun Perencanaan Energi yang Bersifat Lintas Sektor Serta Kehumasan dan Persidangan DEN', 4, NULL, NULL, 1, NULL);
INSERT INTO `trx_sasaran_strategis` VALUES (5, '34249090-b94b-11ee-a348-f4a4757ae8c3', 2023, 'Melaksanakan Pengawasan Implementasi Kebijakan Energi yang Bersifat Lintas Sektoral', 5, NULL, NULL, 1, NULL);
INSERT INTO `trx_sasaran_strategis` VALUES (6, '34249092-b94b-11ee-a348-f4a4757ae8c3', 2023, 'Terselenggaranya Monitoring dan Evaluasi Kinerja Organisasi Setjen DEN', 6, NULL, NULL, 1, NULL);
INSERT INTO `trx_sasaran_strategis` VALUES (7, '34249094-b94b-11ee-a348-f4a4757ae8c3', 2023, 'Terwujudnya Birokrasi Setjen DEN yang Efektif, Efisien, dan Berorientasi Pada Layanan Prima', 7, NULL, NULL, 1, NULL);
INSERT INTO `trx_sasaran_strategis` VALUES (8, '34249096-b94b-11ee-a348-f4a4757ae8c3', 2023, 'Organisasi Setjen DEN yang Fit dan SDM yang Unggul', 8, NULL, NULL, 1, NULL);
INSERT INTO `trx_sasaran_strategis` VALUES (9, '34249098-b94b-11ee-a348-f4a4757ae8c3', 2023, 'Pengelolaan Sistem Anggaran Setjen DEN yang Optimal', 9, NULL, NULL, 1, NULL);
INSERT INTO `trx_sasaran_strategis` VALUES (17, '7070fd48-a5e8-407d-95ec-024e82f5267c', 2024, 'xxxx', 17, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-01-22 17:51:35', 1, NULL);
INSERT INTO `trx_sasaran_strategis` VALUES (18, '53a0689b-ced6-4bd8-9d8d-1392640e8be6', 2024, 'SS BARU 2024', NULL, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-01-24 15:50:51', 1, NULL);

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
  `target_value_percent` decimal(12, 2) NULL DEFAULT NULL,
  `target_value_percent_1` decimal(10, 2) NULL DEFAULT NULL,
  `target_value_percent_2` decimal(10, 2) NULL DEFAULT NULL,
  `target_value_percent_3` decimal(10, 2) NULL DEFAULT NULL,
  `target_value_percent_4` decimal(10, 2) NULL DEFAULT NULL,
  `target_value_percent_5` decimal(10, 2) NULL DEFAULT NULL,
  `target_value_percent_6` decimal(10, 2) NULL DEFAULT NULL,
  `target_value_percent_7` decimal(10, 2) NULL DEFAULT NULL,
  `target_value_percent_8` decimal(10, 2) NULL DEFAULT NULL,
  `target_value_percent_9` decimal(10, 2) NULL DEFAULT NULL,
  `target_value_percent_10` decimal(10, 2) NULL DEFAULT NULL,
  `target_value_percent_11` decimal(10, 2) NULL DEFAULT NULL,
  `target_value_percent_12` decimal(10, 2) NULL DEFAULT NULL,
  `target_create_by` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `target_create_date` datetime NULL DEFAULT NULL,
  `target_status` int NULL DEFAULT NULL,
  `target_log_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`target_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of trx_target
-- ----------------------------
INSERT INTO `trx_target` VALUES (1, '92481316-ffc7-4485-a513-414bedd97a02', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2023, NULL, NULL, NULL, 2.26, 8.34, 18.89, 28.98, 35.31, 43.60, 51.49, 58.80, 66.76, 74.25, 82.56, 95.96, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-01-31 15:10:43', 1, NULL);
INSERT INTO `trx_target` VALUES (2, '8428a3b4-f7c0-4145-8a47-cfb8e2a0e7ce', '261b3744-5a41-11ee-971e-f4a4757ae8c3', 2023, NULL, NULL, NULL, 3.30, 12.68, 20.92, 25.94, 36.92, 44.97, 57.26, 67.90, 78.62, 87.13, 91.89, 98.06, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-01-31 15:10:43', 1, NULL);
INSERT INTO `trx_target` VALUES (3, '4e2a7c35-1b9b-495f-b65d-5945998667c5', '261b3748-5a41-11ee-971e-f4a4757ae8c3', 2023, NULL, NULL, NULL, 1.50, 4.83, 12.76, 20.05, 29.49, 38.08, 45.67, 57.72, 68.73, 79.05, 87.78, 99.34, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-01-31 15:10:43', 1, NULL);

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
  PRIMARY KEY (`upload_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of trx_upload
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of trx_upload_apk
-- ----------------------------
INSERT INTO `trx_upload_apk` VALUES (1, '8dd23086-32ed-4fbd-b477-8a79d5494cb9', 2024, 1, 'Dr. Ir. Agus Puji Prasetyono, M.Eng., IPU', 'DN', 522636375.00, 175810436.00, 33.64, 346825939.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:27', 1, NULL);
INSERT INTO `trx_upload_apk` VALUES (2, '3668339f-567f-457d-b706-725c1f742113', 2024, 1, 'Dr. Ir. Agus Puji Prasetyono, M.Eng., IPU', 'LN', 83716875.00, 25455774.00, 30.41, 58261101.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:27', 1, NULL);
INSERT INTO `trx_upload_apk` VALUES (3, '70dee8d8-9889-440f-8608-1c2b0edd80d6', 2024, 1, 'Dr. Ir. Musri, M.T.', 'DN', 522636375.00, 159720327.00, 30.56, 362916048.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:27', 1, NULL);
INSERT INTO `trx_upload_apk` VALUES (4, '18fddb14-95ea-4c46-a5bc-6b2d53dac1f3', 2024, 1, 'Dr. Ir. Musri, M.T.', 'LN', 83716875.00, 0.00, 0.00, 83716875.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:27', 1, NULL);
INSERT INTO `trx_upload_apk` VALUES (5, 'bd2a6eab-efba-4808-ab33-6e0831719b28', 2024, 1, 'Dr. Ir. Eri Purnomohadi, M.M.', 'DN', 522636375.00, 195020362.00, 37.31, 327616013.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:27', 1, NULL);
INSERT INTO `trx_upload_apk` VALUES (6, 'fc50a2d7-7a5f-416d-9016-c9a4803b53f1', 2024, 1, 'Dr. Ir. Eri Purnomohadi, M.M.', 'LN', 83716875.00, 0.00, 0.00, 83716875.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:27', 1, NULL);
INSERT INTO `trx_upload_apk` VALUES (7, 'a4724f9e-0d72-4129-828f-c3c3fbc22c3f', 2024, 1, 'Dr. Ir. As Natio Lasman', 'DN', 522636375.00, 159789369.00, 30.57, 362847006.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:27', 1, NULL);
INSERT INTO `trx_upload_apk` VALUES (8, '239c6d81-3d66-4073-9861-4935e70b717a', 2024, 1, 'Dr. Ir. As Natio Lasman', 'LN', 83716875.00, 0.00, 0.00, 83716875.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:27', 1, NULL);
INSERT INTO `trx_upload_apk` VALUES (9, 'a46e7a6c-e3d4-48d9-a03b-767622d7c62c', 2024, 1, 'Dr. (HC) Yusra Khan, S.H.', 'DN', 522636375.00, 179434217.00, 34.33, 343202158.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:27', 1, NULL);
INSERT INTO `trx_upload_apk` VALUES (10, '762c7881-6e84-4c9b-aa5c-2e16331a5d51', 2024, 1, 'Dr. (HC) Yusra Khan, S.H.', 'LN', 83716875.00, 0.00, 0.00, 83716875.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:27', 1, NULL);
INSERT INTO `trx_upload_apk` VALUES (11, '5e9b61a8-079c-4323-b517-9df08c01992b', 2024, 1, 'Ir. Agus Pramono', 'DN', 522636375.00, 18377127.00, 3.52, 504259248.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:27', 1, NULL);
INSERT INTO `trx_upload_apk` VALUES (12, '7d78caa0-311c-45c1-88ee-66ca95aadcde', 2024, 1, 'Ir. Agus Pramono', 'LN', 83716875.00, 0.00, 0.00, 83716875.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:27', 1, NULL);
INSERT INTO `trx_upload_apk` VALUES (13, 'c3b55543-8ca8-49f3-aca3-a3a11db11966', 2024, 1, 'Dr. Dina Nurul Fitria, SE, MT.', 'DN', 522636375.00, 38336415.00, 7.34, 484299960.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:27', 1, NULL);
INSERT INTO `trx_upload_apk` VALUES (14, 'ea3d5b23-2415-450c-85e8-0f9f998daed7', 2024, 1, 'Dr. Dina Nurul Fitria, SE, MT.', 'LN', 83716875.00, 0.00, 0.00, 83716875.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:27', 1, NULL);
INSERT INTO `trx_upload_apk` VALUES (15, 'e0ad958e-fa64-4fb9-b2e2-2b98dbd00b3b', 2024, 1, 'Ir. Abadi Poernomo, Dipl.Geoth, En.Tech.', 'DN', 522636375.00, 37818159.00, 7.24, 484818216.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:27', 1, NULL);
INSERT INTO `trx_upload_apk` VALUES (16, 'fea86a78-960f-4dbf-92b5-a3ad15c9eb2f', 2024, 1, 'Ir. Abadi Poernomo, Dipl.Geoth, En.Tech.', 'LN', 83716875.00, 1042000.00, 1.24, 82674875.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:27', 1, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of trx_upload_belanja
-- ----------------------------
INSERT INTO `trx_upload_belanja` VALUES (1, '958c9699-e873-402f-913f-00d9984edd11', 2024, 1, '51|BELANJA PEGAWAI', 22355471000.00, 14383300161.00, 64.34, 7972170839.00, 22355471000.00, 14316679150.00, 64.04, 8038791850.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:27', 1, NULL);
INSERT INTO `trx_upload_belanja` VALUES (2, '87c16b70-07b2-4695-85ad-c9b3e2843e7b', 2024, 1, '52|BELANJA BARANG', 34812314000.00, 22048490039.00, 63.34, 12763823961.00, 34812314000.00, 21906847012.00, 62.93, 12905466988.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:27', 1, NULL);
INSERT INTO `trx_upload_belanja` VALUES (3, '7c57ba1e-a0f4-42f4-aa04-55e47b117460', 2024, 1, '53|BELANJA MODAL', 149640000.00, 41600000.00, 27.80, 108040000.00, 149640000.00, 41600000.00, 27.80, 108040000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:27', 1, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of trx_upload_nilai_program
-- ----------------------------
INSERT INTO `trx_upload_nilai_program` VALUES (1, 'e641e5d6-7ef2-4f29-a1af-ae961b0a7926', 2024, 1, 'fe2a2042-b4f0-4795-80e7-1b125d760d6b', 57317425000.00, 36265126162.00, 21052298838.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (2, '3aee4437-0508-4bcf-a813-483062894820', 2024, 1, 'acb6af6e-20dc-40d6-9131-5d26708be539', 48016958000.00, 30618383726.00, 17398574274.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (3, 'd64efc55-2996-464c-9e53-8ad89955cfb1', 2024, 1, '00c85d8f-9f80-4a69-841e-8084fceae6f9', 48016958000.00, 30618383726.00, 17398574274.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (4, 'f0209877-438d-41b6-926a-ed2e535c25df', 2024, 1, 'e01f8a8d-f9d3-4ae1-ae15-4d5294f86c77', 3593915000.00, 2460996947.00, 1132918053.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (5, '01e7d7db-9cfe-4ef0-b2eb-67a7dc46a586', 2024, 1, '74e57f7d-1664-4779-aca1-d247f60e008c', 10800000.00, 10639129.00, 160871.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (6, '5994a9fd-2e06-41dd-92b7-f51abfa723fb', 2024, 1, 'cb4e7407-acd6-4111-a3b0-09572023df79', 184400000.00, 113800000.00, 70600000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (7, 'ec1bde1c-53c1-421d-b470-091fbb1d856c', 2024, 1, '3ed69883-d498-425d-ab1b-ebd0172d10b6', 35240000.00, 11209336.00, 24030664.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (8, 'f9bfa303-7df7-4510-ad67-b7b58fb1633d', 2024, 1, 'fd3a0418-2ed4-416c-b5ce-f67c2f55bc21', 480200000.00, 178500000.00, 301700000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (9, 'adb16269-33b8-4725-9014-fc74d33aec8a', 2024, 1, 'd5b16f81-0cde-4963-b6aa-444f62425d4c', 2600519000.00, 2100396267.00, 500122733.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (10, 'abe72855-efb8-4a2c-8b4e-9f580be9ff02', 2024, 1, '63c673f6-a9f7-4f05-9a73-a929e18a38b0', 44160000.00, 3300000.00, 40860000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (11, '5d0f02db-5246-4380-a928-c707b314329f', 2024, 1, 'e69d8aa2-e2ac-4264-b109-81fca0c860c5', 1911257000.00, 1179374940.00, 731882060.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (12, '1a639808-a5c5-4102-9c9c-4a2851f170e5', 2024, 1, 'c1ec31ce-6159-4b01-abd4-ca6d76ceb61e', 2845293000.00, 1585465194.00, 1259827806.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (13, 'aeb29ba1-5af6-43a0-8e35-c1ef0d61587c', 2024, 1, '5d366ac0-3581-48eb-9ae1-74aaa5a07337', 418542000.00, 416080885.00, 2461115.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (14, 'cca28cdb-9ec1-463a-b299-bb443a385b72', 2024, 1, '9d4f953e-518d-426c-b371-fdaa017df690', 1436777000.00, 1311567781.00, 125209219.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (15, '26b87e68-4a26-4c9f-9bd5-76d69bfcb976', 2024, 1, '4b5a4c4d-887b-46d9-a9b7-0770521e7f25', 5334446000.00, 2437098867.00, 2897347133.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (16, '533b0bc1-a2df-41e1-b4c4-9e418f8aac6a', 2024, 1, 'c87b5ee7-6363-4075-9aaf-c3595678c2c1', 159000000.00, 157524000.00, 1476000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (17, '29d5942e-5741-4c3d-a966-2f3de2114953', 2024, 1, '34743f1b-fedd-4f29-95f0-bb73e399adb4', 150260000.00, 0.00, 150260000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (18, '0613de03-44af-4421-b99f-ee2546853dd8', 2024, 1, '5eee395b-c6fb-4544-b1b1-ba7a56ffe7d9', 133686000.00, 0.00, 133686000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (19, 'a50857f6-b717-4a30-abbf-31e9e101bd1a', 2024, 1, '83884647-0b0b-4ea6-bf0c-d9925ec48458', 552228000.00, 416080885.00, 136147115.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (20, '0eead3f0-1e1b-4eb4-bd96-446eb9f9c2a7', 2024, 1, '472fc8b8-7e90-4dac-8a8c-eea5a7af53a0', 12672424000.00, 8444346027.00, 4228077973.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (21, '6909dd7a-ba5b-4cd6-9028-16e8bba03a45', 2024, 1, 'db0d649d-3412-4ac6-a4ea-689951b476a9', 432909000.00, 284765441.00, 148143559.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (22, 'f7e85f5e-aabc-49a6-8db4-3f204f0af286', 2024, 1, 'a5a94499-9b9f-4133-b398-b5f1ba3b03eb', 197958000.00, 49504000.00, 148454000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (23, 'a8d4b9e1-e78e-403c-b391-df39f2f7d35b', 2024, 1, '64bcb0e3-5bff-4224-9d3b-2d38c7aac8b7', 206400000.00, 0.00, 206400000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (24, 'db4cdae6-3073-4e91-b366-355d76a11169', 2024, 1, '674d8c17-546f-411b-a0cb-430322432965', 7392000.00, 0.00, 7392000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (25, '0a08bc50-5bb8-40b2-bed5-6eac373920e6', 2024, 1, '618df1d9-6c75-4f2a-a771-5063f48a3b83', 488268000.00, 88290000.00, 399978000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (26, '86f223ff-ec67-4d20-a8fa-d2aefcdcfbcb', 2024, 1, '899b0b76-709d-45f1-be28-fc5fd0bef328', 620045000.00, 444821360.00, 175223640.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (27, 'adbc334b-c1bc-4b52-9d26-77408dc3219a', 2024, 1, 'c76771e7-a653-4dd0-92bd-67113f53dd25', 596292000.00, 444821360.00, 151470640.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (28, '55866fa6-40f8-4208-a353-511f248b8256', 2024, 1, '1a550b44-ff23-4bd0-9819-c7a582b4848a', 23753000.00, 0.00, 23753000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (29, '8ba890bc-a9da-4903-a0cd-0344fe0f39e6', 2024, 1, '435a8218-7c2d-4d51-9086-a3a88a9634cb', 204240000.00, 15513000.00, 188727000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (30, 'f1f910d7-5a59-4894-a92b-fb0e933b8924', 2024, 1, '209a9ea4-a016-409f-9db8-f7d49b66829f', 6000000.00, 0.00, 6000000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (31, '1403604e-a58b-41e8-bc3e-465f72ddad55', 2024, 1, '6f83256a-3e95-446d-8f13-388223a888aa', 60000000.00, 15513000.00, 44487000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (32, '5179a7b4-ce67-436b-a91e-7023bf22cdab', 2024, 1, 'd92ae39c-76b9-4ed3-aa2c-e0f97c984abb', 558000000.00, 403400000.00, 154600000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (33, 'bde8c5b7-4e8c-46fd-b82f-8cf6cbd7503f', 2024, 1, 'd7b12523-7ac1-4604-a924-d1e196072748', 6000000.00, 0.00, 6000000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (34, 'd3b834c6-65f4-46ce-b825-8268a6d95cf0', 2024, 1, '4d97a354-3003-4349-a2d3-fd9a65cf8b7c', 449724000.00, 224816519.00, 224907481.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (35, '5b5c5f8e-d9b2-4e68-be7f-c076c3d67acc', 2024, 1, '78901d23-ba9b-4a88-8a88-e5378b60c9a8', 14400000.00, 6946687.00, 7453313.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (36, 'c3976e12-6483-4ebe-a871-2f6c135fe49a', 2024, 1, '22784979-e537-4c84-862a-8231c28bb7a7', 73200000.00, 40453535.00, 32746465.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (37, '32250588-1f11-43ba-9305-5b9a911f2bb1', 2024, 1, '6e922103-4bca-4190-b3c1-47a0d1e80856', 18000000.00, 7136584.00, 10863416.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (38, '8861a076-beb3-4d3c-b0f1-46bfec51d43a', 2024, 1, '133ca34b-b80f-470d-af9d-3cefcc53188e', 4800000.00, 2400000.00, 2400000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (39, '8d0a338a-1097-4d56-8e20-5a360ceb6bec', 2024, 1, 'ac8e8118-7ab2-43b5-90a7-9954df33e65c', 7600000.00, 0.00, 7600000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (40, '2af69672-cee6-4fce-a407-e7fc97c2aa4e', 2024, 1, '0e3bf7ea-b315-44d3-a1c7-ba1b94f9b7fc', 3600000.00, 0.00, 3600000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (41, '6aa27a77-ea19-480e-8f86-bb265c749ff3', 2024, 1, '3d04540a-862e-44dc-b0ae-789b2ce98198', 4000000.00, 0.00, 4000000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (42, 'fb88ff28-e60b-46b5-b365-578a822c8737', 2024, 1, '7363f026-3f2e-4cca-a4c3-74b41da0df2b', 325566000.00, 59289000.00, 266277000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (43, 'eebd0334-20fe-456a-a041-e799a5012ab7', 2024, 1, '12694ff8-fae0-4622-807c-c4319a174419', 115608000.00, 2400000.00, 113208000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (44, 'e5f3f5c8-137f-489b-8efe-3833ac361427', 2024, 1, '5f6bf482-a61d-4b9b-a798-948fe90d7033', 273929000.00, 169388970.00, 104540030.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (45, '21637f3b-280c-4752-a5e4-d159dad93e5b', 2024, 1, '9e7183eb-ba9d-4be3-8c0c-c1bdaaa2a422', 4184788000.00, 2659198058.00, 1525589942.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (46, '7d71376f-75fb-4db6-ae63-06e0ade35aec', 2024, 1, 'e2baaf09-3abe-43c0-a579-a7680bbaecb3', 252792000.00, 46340000.00, 206452000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (47, '85159309-e56e-4977-800b-22aaa3c15ef5', 2024, 1, '1940c4d8-7f92-4bb5-b0d4-aee20581207d', 225960000.00, 46340000.00, 179620000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (48, 'd31b7990-ee50-4912-bb88-ec7ff533055c', 2024, 1, '331f13e1-6f31-4405-add3-b8c53ac0efe7', 126423000.00, 88658679.00, 37764321.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (49, '347bfecf-b539-4ea5-8ab2-6141651eaa19', 2024, 1, 'bc70476c-6645-4d10-b7e2-6012d3331ad4', 330000000.00, 148185000.00, 181815000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (50, 'd59894fe-cd13-4834-9c6f-31d5b3dc055a', 2024, 1, '362cd27f-406f-4ae3-9cb7-6241d2b60492', 4205740000.00, 3811680000.00, 394060000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (51, 'bec1627b-d618-4489-bcb7-2fc564dfce6d', 2024, 1, '626cfac1-7c64-4d30-a40c-48b95d477db9', 4205740000.00, 3811680000.00, 394060000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (52, '410c6697-c95c-4040-81d2-db35cce420e1', 2024, 1, '3592bbc6-af87-4589-a85b-88a64a6c6b28', 126423000.00, 88658679.00, 37764321.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (53, '1cf71a11-2da1-414c-9d88-b782921a095a', 2024, 1, '3bfc4e26-bed8-400f-97ff-95d18995d8d8', 10800000.00, 10639129.00, 160871.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (54, '8315d675-2149-47ac-84c2-64d7e9868fff', 2024, 1, 'fa6b8fcc-35a3-445a-b312-c6a8dac25c95', 10800000.00, 10639129.00, 160871.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (55, 'a730169e-b624-4321-bcb7-e5bf01b2d3a8', 2024, 1, 'd7fcb613-8e9b-49ca-876b-28822abe4ced', 149640000.00, 41600000.00, 108040000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (56, 'dc5c7c1b-c88a-468c-b539-81d445b1ff61', 2024, 1, 'a8cbeac3-a9f6-4690-9fb0-9d021a68eeb9', 149640000.00, 41600000.00, 108040000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (57, 'c461c76d-f2ba-4388-9461-9293733b22e4', 2024, 1, 'd9338520-7d21-4e44-bfed-0361f6b70d85', 22355471000.00, 14316679150.00, 8038791850.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (58, '6ec5af5d-0d8b-4ae1-9287-9c15a6e9dcd2', 2024, 1, '8315dec3-0f2b-4e0a-8ef9-2fe155ca8e54', 5052465000.00, 3709748940.00, 1342716060.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (59, 'a250232c-2eb5-4b0e-8b7d-abc836d53295', 2024, 1, '8bc37203-ed8c-4804-bc02-3723b0491dde', 79000.00, 56030.00, 22970.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (60, '8d8f7298-7c0a-4be6-be60-c4850883e000', 2024, 1, 'c5a2883e-3950-4b4e-badf-1d76f2c9ecc5', 366518000.00, 276786690.00, 89731310.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (61, '103d7a6a-4366-4578-9c22-9043269b0d87', 2024, 1, '4e94100f-4ad8-4866-b95d-5b9527b2314e', 102407000.00, 74653164.00, 27753836.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (62, 'd35080cb-b3f8-425a-a9cd-0182f470cda1', 2024, 1, '245f4f50-921b-4e9b-baa5-30495958e4f9', 250635000.00, 175900000.00, 74735000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (63, '287ee67b-788f-4f33-a0b5-e1f22265b9d7', 2024, 1, 'ddc33044-56ff-4ccf-b8ba-464e7cbdd456', 526384000.00, 401835000.00, 124549000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (64, '5cb9b445-bae3-41da-9241-add522c8f714', 2024, 1, '38e0e855-f0c3-482f-be01-3390217fcb7b', 86548000.00, 70153298.00, 16394702.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (65, 'c265e9d5-04bd-47ac-b760-73c0ee9ac7b0', 2024, 1, 'dd58d32b-81b4-42d5-ac98-792565ef992e', 281577000.00, 189523140.00, 92053860.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (66, '35d3910b-b75f-437e-b1d6-4e9d747131c7', 2024, 1, '456fd554-5c0a-41d9-82d7-113da1485dc1', 551365000.00, 77495000.00, 473870000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (67, '21ba9d90-4933-4f10-b5e4-fcad5b085729', 2024, 1, '59838d54-2f0f-4e61-9eba-4a9a8f13b514', 147252000.00, 80880000.00, 66372000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (68, '9ea57a35-548e-45f0-9c3a-de3bb2027878', 2024, 1, 'ddbebb1e-af85-429d-afbb-02c545a2969f', 429632000.00, 315188000.00, 114444000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (69, '7a0c953b-22df-4582-bce1-58ff93c6be3d', 2024, 1, '36fe47ee-d37c-4f7a-9313-e831cc9f5581', 11000.00, 6996.00, 4004.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (70, '6764eb77-2a48-4be8-bc3a-884112b17646', 2024, 1, '1a27da56-654d-47de-8849-3a8aec2390c9', 18720000.00, 12469600.00, 6250400.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (71, 'dc6accde-5303-4eff-800e-64891c0961cb', 2024, 1, '2ef07503-eec3-4c76-99bc-a6c2e4a545d9', 8288000.00, 5697520.00, 2590480.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (72, '10f93325-69f6-40d8-bd84-6b31ae30cb68', 2024, 1, 'ea5418be-e191-44b4-84bc-da2a8a7a4650', 74256000.00, 50750000.00, 23506000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (73, '4642aad5-5bc2-4a23-a509-d3f553f2f250', 2024, 1, 'fbe04fbd-7eb9-40d3-a8a7-1d903439021d', 24528000.00, 16656600.00, 7871400.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (74, '700fa423-d431-4535-aac8-4930efb783bf', 2024, 1, '01c01cbe-4858-428f-b1df-3eb3c873ccfb', 68376000.00, 9163000.00, 59213000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (75, '439561df-b21d-4fc4-8376-c96e03b0f59a', 2024, 1, '961fdc13-5785-488a-9daa-6a1e1935cb5e', 5250485000.00, 3399741250.00, 1850743750.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (76, 'a8291091-f025-44fe-9a64-699095e330fa', 2024, 1, 'b11b84c7-d18a-49db-8cec-8f172cf41a81', 570600000.00, 0.00, 570600000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (77, 'fdf5aa7d-9ad8-4b24-a136-0eab459e7e53', 2024, 1, 'f392ad3a-e461-4d28-9a36-a014305290db', 7906273000.00, 5074080141.00, 2832192859.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (78, '53c6719e-2113-46a2-943b-75fd59cc9b50', 2024, 1, '918ff7fe-aa96-4395-aa3a-9d83db5801bc', 639072000.00, 375894781.00, 263177219.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (79, '0c67d8e8-c18c-4850-af77-a5428a6ff228', 2024, 1, 'ffe57990-a648-4b95-81e1-918dbfb3ef49', 9300467000.00, 5646742436.00, 3653724564.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (80, '07883bc8-0b9f-4f0c-9314-f294bb631830', 2024, 1, 'c1d80ef4-1857-48be-889f-a96527b59a99', 5322184000.00, 3677471123.00, 1644712877.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (81, '64038d3d-f9fb-4217-8089-67ba6da9dbb7', 2024, 1, '021af842-958a-4efc-858e-d09593d549c7', 1626680000.00, 1116036091.00, 510643909.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (82, '0a5e7bc8-eb15-4f95-951f-c4cbfe5e3a42', 2024, 1, '0f3502ac-f69a-4fbc-84ca-210a13ef8f21', 105714000.00, 2115000.00, 103599000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (83, 'd2f63b17-8004-4006-bf16-fbbe90bbcc2d', 2024, 1, '83eff1eb-85e7-4eda-860f-092d687114d0', 90200000.00, 57400000.00, 32800000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (84, '72a47eb7-06f0-45b9-883c-e2752e859d76', 2024, 1, '81f03015-abcb-4713-9fac-a44450f35f40', 10175000.00, 0.00, 10175000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (85, '6ccc09e7-ed47-4cd7-8e52-b75dbf0f0e9f', 2024, 1, '8323f29d-9701-4150-8505-f9a460b5295b', 125400000.00, 10100000.00, 115300000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (86, '601d5af1-79ea-4efc-a804-35ffa4101441', 2024, 1, '088c0f67-0425-42a1-8b5e-4860ab90be8a', 1084823000.00, 1004226202.00, 80596798.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (87, '8d76da9d-d941-447f-ab92-934fc1b7549f', 2024, 1, '9019c30e-6e0f-4af2-b7bb-0d130cdb9484', 1551819000.00, 1126586907.00, 425232093.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (88, 'acd33346-9620-448c-b3cf-e281efeb1d2b', 2024, 1, '412578a4-1d0b-480a-b0b0-4cb094b17152', 1248276000.00, 859806682.00, 388469318.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (89, '9c594b7e-4f90-45d4-833f-795d923e7317', 2024, 1, '8978c710-5e85-4e1c-bff9-9078ccd3274a', 560680000.00, 505426443.00, 55253557.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (90, '5da469fb-31d7-4687-899c-67ede98e8501', 2024, 1, 'dfc836f7-5987-427d-a764-1768d9ed5dbe', 3240000.00, 0.00, 3240000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (91, '3cd51738-583b-4564-9851-8554b8423fea', 2024, 1, '1d38dc3a-9916-40de-9cbb-ec62c05f0401', 285836000.00, 259515565.00, 26320435.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (92, '6b0721cf-6379-4804-bfe0-4305dc69f06e', 2024, 1, '93a8dc16-fb44-45ab-963b-b765712566fd', 895409000.00, 575041443.00, 320367557.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (93, '514e38e9-d8f1-4cac-8c80-85ea5c31b30b', 2024, 1, '393ff575-8dc7-41b6-b9a5-c927f201c652', 3978283000.00, 1969271313.00, 2009011687.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (94, '13c71084-4c99-403e-aa48-a226d3543c4d', 2024, 1, '55f3eb04-df47-4435-b88d-b127c97dd634', 1196946000.00, 662849508.00, 534096492.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (95, 'b7ed8671-143d-48df-a2ca-6c46bf2d1c8c', 2024, 1, 'fdc00ef9-d14d-494d-a648-aaceb3df1935', 30230000.00, 459000.00, 29771000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (96, '1663b2b7-4c25-49e8-ab7f-3490f3d82727', 2024, 1, 'd153201c-7f06-4ad4-961f-d81f9345a044', 213400000.00, 132800000.00, 80600000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (97, '0c4be22f-e7c7-4bcc-a27a-41f1fc336418', 2024, 1, '90ba9808-04e8-47c2-a047-3dbf0768c8c9', 41160000.00, 0.00, 41160000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (98, '3f4ba971-455e-429f-91a2-cc7cb88dbdb1', 2024, 1, '0f8ea5fb-076b-4f2c-a415-acc412844dea', 329400000.00, 12300000.00, 317100000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (99, 'ea4b3fd0-709c-4e30-8dc4-4ca2a5634cfb', 2024, 1, '348adc4d-eb26-4ba8-a912-4f68d5657f55', 1393074000.00, 750744416.00, 642329584.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (100, 'a49ffa35-bca4-4dd6-b8c9-097c7540fa88', 2024, 1, '569f6acb-937c-4cff-a603-d337bf3036f2', 21660000.00, 6530000.00, 15130000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (101, '8be9550d-a149-4de1-88ee-c4f1da3dfbf1', 2024, 1, 'b47ae16f-57c5-4be7-a056-5c54ec481987', 752413000.00, 403588389.00, 348824611.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (102, '9f900dd7-5772-4615-866c-ea73d69dc2b1', 2024, 1, '3a39924f-e76c-4f9c-8364-08f8c3ea1fb2', 36480000.00, 0.00, 36480000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (103, 'e5226b18-dc67-40e4-b51f-262c7c16bf3c', 2024, 1, '99f23509-1b06-4e14-ad5c-d176c55042b0', 78667000.00, 0.00, 78667000.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_nilai_program` VALUES (104, '4933f428-8368-4715-a3cd-fb94893c0cdd', 2024, 1, '576e1802-be08-4718-8d87-37d17a82c488', 2028924000.00, 902833416.00, 1126090584.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of trx_upload_paparan_program
-- ----------------------------
INSERT INTO `trx_upload_paparan_program` VALUES (1, 'e36640ab-e9be-453e-aae5-22bec64bd37e', '0', '261b36ee-5a41-11ee-971e-f4a4757ae8c3', 2024, 1, '020.07.11', 'PROGRAM DUKUNGAN MANAJEMEN DAN PELAKSANAAN TUGAS TEKNIS LAINNYA DEWAN ENERGI NASIONAL', 57317425000.00, 36265126162.00, 63.27, 21052298838.00, 37467070709.67, 65.37, -1201944547.67, -2.10, 57317425000.00, 36265126162.00, 63.27, 21052298838.00, 37467070709.67, 65.37, -1201944547.67, -2.10, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:23', 1, NULL);
INSERT INTO `trx_upload_paparan_program` VALUES (2, '2e7a49c6-f9a7-474b-bf82-aee671cf0358', 'e36640ab-e9be-453e-aae5-22bec64bd37e', '261b36ee-5a41-11ee-971e-f4a4757ae8c3', 2024, 1, '1909', 'Pengelolaan Manajemen Kesekretariatan Dewan Energi Nasional', 48016958000.00, 30618383726.00, 63.77, 17398574274.00, 31577087405.67, 65.76, -958703679.67, -2.00, 48016958000.00, 30618383726.00, 63.77, 17398574274.00, 31577087405.67, 65.76, -958703679.67, -2.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:23', 1, NULL);
INSERT INTO `trx_upload_paparan_program` VALUES (3, '61b77222-838d-4f94-b5c6-9323b99716b3', '2e7a49c6-f9a7-474b-bf82-aee671cf0358', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, 1, '', 'BIRO UMUM', 48016958000.00, 30618383726.00, 63.77, 17398574274.00, 31577087405.67, 65.76, -958703679.67, -2.00, 48016958000.00, 30618383726.00, 63.77, 17398574274.00, 31577087405.67, 65.76, -958703679.67, -2.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:23', 1, NULL);
INSERT INTO `trx_upload_paparan_program` VALUES (4, '279b2245-1653-4cd6-b7a7-34d54f901c94', '61b77222-838d-4f94-b5c6-9323b99716b3', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, 1, '1', 'Pokja Perencanaan dan Keuangan', 3593915000.00, 2460996947.00, 68.48, 1132918053.00, 2273412995.00, 58.03, 187583952.00, 5.22, 3593915000.00, 2460996947.00, 68.48, 1132918053.00, 2273412995.00, 58.03, 187583952.00, 5.22, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:23', 1, NULL);
INSERT INTO `trx_upload_paparan_program` VALUES (5, 'ded58847-d49f-4707-90b0-2a1ae59b9453', '61b77222-838d-4f94-b5c6-9323b99716b3', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, 1, '2', 'Pokja Hukum dan Kepegawaian', 1911257000.00, 1179374940.00, 61.71, 731882060.00, 1300718180.00, 59.84, -121343240.00, -6.35, 1911257000.00, 1179374940.00, 61.71, 731882060.00, 1300718180.00, 59.84, -121343240.00, -6.35, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:23', 1, NULL);
INSERT INTO `trx_upload_paparan_program` VALUES (6, 'f8096fe8-0952-4e5d-baf6-ffe1501930a4', '61b77222-838d-4f94-b5c6-9323b99716b3', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, 1, '3', 'Bagian Rumah Tangga', 1436777000.00, 1311567781.00, 91.29, 125209219.00, 1235055732.33, 82.13, 76512048.67, 5.33, 1436777000.00, 1311567781.00, 91.29, 125209219.00, 1235055732.33, 82.13, 76512048.67, 5.33, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:23', 1, NULL);
INSERT INTO `trx_upload_paparan_program` VALUES (7, '817d5134-1d0f-46a0-84ee-801927fad92c', '61b77222-838d-4f94-b5c6-9323b99716b3', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, 1, '4', 'APK', 5334446000.00, 2437098867.00, 45.69, 2897347133.00, 3303358012.00, 43.65, -866259145.00, -16.24, 5334446000.00, 2437098867.00, 45.69, 2897347133.00, 3303358012.00, 43.65, -866259145.00, -16.24, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:23', 1, NULL);
INSERT INTO `trx_upload_paparan_program` VALUES (8, '2f232f1c-1f5f-4b32-97d0-fcaa344342b6', '61b77222-838d-4f94-b5c6-9323b99716b3', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, 1, '5', 'Pimpinan', 552228000.00, 416080885.00, 75.35, 136147115.00, 501037728.00, 61.99, -84956843.00, -15.38, 552228000.00, 416080885.00, 75.35, 136147115.00, 501037728.00, 61.99, -84956843.00, -15.38, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:23', 1, NULL);
INSERT INTO `trx_upload_paparan_program` VALUES (9, '541948a5-055c-4f3f-9206-bdbe52ef9412', '61b77222-838d-4f94-b5c6-9323b99716b3', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, 1, '6', 'Operasional Perkantoran', 12672424000.00, 8444346027.00, 66.64, 4228077973.00, 8464938000.33, 61.50, -20591973.33, -0.16, 12672424000.00, 8444346027.00, 66.64, 4228077973.00, 8464938000.33, 61.50, -20591973.33, -0.16, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:23', 1, NULL);
INSERT INTO `trx_upload_paparan_program` VALUES (10, '69aa986c-44c4-45ea-a166-ee76d489de9d', '61b77222-838d-4f94-b5c6-9323b99716b3', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, 1, '7', 'Belanja Bahan (Zoom)', 10800000.00, 10639129.00, 98.51, 160871.00, 10639129.00, 98.51, 0.00, 0.00, 10800000.00, 10639129.00, 98.51, 160871.00, 10639129.00, 98.51, 0.00, 0.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:23', 1, NULL);
INSERT INTO `trx_upload_paparan_program` VALUES (11, '2e0acac1-f73f-4387-b010-8927e047168c', '61b77222-838d-4f94-b5c6-9323b99716b3', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, 1, '8', 'Peralatan dan Mesin', 149640000.00, 41600000.00, 27.80, 108040000.00, 41600000.00, 27.80, 0.00, 0.00, 149640000.00, 41600000.00, 27.80, 108040000.00, 41600000.00, 27.80, 0.00, 0.00, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:23', 1, NULL);
INSERT INTO `trx_upload_paparan_program` VALUES (12, '961ed61f-5bbb-4ad4-ad23-a79a5cf752dc', '61b77222-838d-4f94-b5c6-9323b99716b3', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, 1, '9', 'Gaji dan Tunjangan Honor APK', 22355471000.00, 14316679150.00, 64.04, 8038791850.00, 14446327629.00, 57.09, -129648479.00, -0.58, 22355471000.00, 14316679150.00, 64.04, 8038791850.00, 14446327629.00, 57.09, -129648479.00, -0.58, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:23', 1, NULL);
INSERT INTO `trx_upload_paparan_program` VALUES (13, '3ba8f02a-8e18-45be-a531-8ffbf2d8e2b5', 'e36640ab-e9be-453e-aae5-22bec64bd37e', '261b36ee-5a41-11ee-971e-f4a4757ae8c3', 2024, 1, '6382', 'Dukungan Teknis Pelaksanaan Tugas Dewan Energi Nasional', 9300467000.00, 5646742436.00, 60.71, 3653724564.00, 5889983304.00, 63.33, -243240868.00, -2.62, 9300467000.00, 5646742436.00, 60.71, 3653724564.00, 5889983304.00, 63.33, -243240868.00, -2.62, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:23', 1, NULL);
INSERT INTO `trx_upload_paparan_program` VALUES (14, '1b0e8075-768d-4c84-8736-52fd8d5e0212', '3ba8f02a-8e18-45be-a531-8ffbf2d8e2b5', '261b3744-5a41-11ee-971e-f4a4757ae8c3', 2024, 1, '', 'BIRO FASILITASI KEBIJAKAN ENERGI DAN PERSIDANGAN', 5322184000.00, 3677471123.00, 69.10, 1644712877.00, 3629775637.00, 68.20, 47695486.00, 0.90, 5322184000.00, 3677471123.00, 69.10, 1644712877.00, 3629775637.00, 68.20, 47695486.00, 0.90, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:23', 1, NULL);
INSERT INTO `trx_upload_paparan_program` VALUES (15, '130d1fe8-98c0-41a8-b400-228ed785cdf3', '1b0e8075-768d-4c84-8736-52fd8d5e0212', '261b3744-5a41-11ee-971e-f4a4757ae8c3', 2024, 1, '1', 'Pokja Kebijakan Energi', 1626680000.00, 1116036091.00, 68.61, 510643909.00, 1154943380.00, 46.82, -38907289.00, -2.39, 1626680000.00, 1116036091.00, 68.61, 510643909.00, 1154943380.00, 46.82, -38907289.00, -2.39, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:23', 1, NULL);
INSERT INTO `trx_upload_paparan_program` VALUES (16, '31dc0fbc-00b8-456a-bf1f-7d308e4829df', '1b0e8075-768d-4c84-8736-52fd8d5e0212', '261b3744-5a41-11ee-971e-f4a4757ae8c3', 2024, 1, '2', 'Pokja Humas dan Persidangan', 1551819000.00, 1126586907.00, 72.60, 425232093.00, 1091675409.00, 63.30, 34911498.00, 2.25, 1551819000.00, 1126586907.00, 72.60, 425232093.00, 1091675409.00, 63.30, 34911498.00, 2.25, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:23', 1, NULL);
INSERT INTO `trx_upload_paparan_program` VALUES (17, '4944af2c-c052-4136-be5f-3ab0db3c69ff', '1b0e8075-768d-4c84-8736-52fd8d5e0212', '261b3744-5a41-11ee-971e-f4a4757ae8c3', 2024, 1, '3', 'Pokja RUEN', 1248276000.00, 859806682.00, 68.88, 388469318.00, 797154320.00, 59.12, 62652362.00, 5.02, 1248276000.00, 859806682.00, 68.88, 388469318.00, 797154320.00, 59.12, 62652362.00, 5.02, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:23', 1, NULL);
INSERT INTO `trx_upload_paparan_program` VALUES (18, 'e054d51e-5aea-4dc7-a2c0-ca6e43d192ff', '1b0e8075-768d-4c84-8736-52fd8d5e0212', '261b3744-5a41-11ee-971e-f4a4757ae8c3', 2024, 1, '4', 'Pokja Kemandirian', 895409000.00, 575041443.00, 64.22, 320367557.00, 586002528.00, 59.29, -10961085.00, -1.22, 895409000.00, 575041443.00, 64.22, 320367557.00, 586002528.00, 59.29, -10961085.00, -1.22, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:23', 1, NULL);
INSERT INTO `trx_upload_paparan_program` VALUES (19, 'c24680b5-88d1-487f-b807-85b2cb0837b4', '3ba8f02a-8e18-45be-a531-8ffbf2d8e2b5', '261b3748-5a41-11ee-971e-f4a4757ae8c3', 2024, 1, '', 'BIRO FASILITASI PENANGGULANGAN KRISIS DAN PENGAWASAN ENERGI', 3978283000.00, 1969271313.00, 49.50, 2009011687.00, 2260207667.00, 56.81, -290936354.00, -7.31, 3978283000.00, 1969271313.00, 49.50, 2009011687.00, 2260207667.00, 56.81, -290936354.00, -7.31, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:23', 1, NULL);
INSERT INTO `trx_upload_paparan_program` VALUES (20, '3040398a-59d4-43b3-9a1b-ee04eab82a80', 'c24680b5-88d1-487f-b807-85b2cb0837b4', '261b3748-5a41-11ee-971e-f4a4757ae8c3', 2024, 1, '1', 'Pokja Krisdaren', 1196946000.00, 662849508.00, 55.38, 534096492.00, 623563447.00, 46.82, 39286061.00, 3.28, 1196946000.00, 662849508.00, 55.38, 534096492.00, 623563447.00, 46.82, 39286061.00, 3.28, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:23', 1, NULL);
INSERT INTO `trx_upload_paparan_program` VALUES (21, 'fd3526a8-be74-4ac1-9139-d0b01b27b033', 'c24680b5-88d1-487f-b807-85b2cb0837b4', '261b3748-5a41-11ee-971e-f4a4757ae8c3', 2024, 1, '2', 'Pokja Ketahanan', 752413000.00, 403588389.00, 53.64, 348824611.00, 460168838.00, 53.09, -56580449.00, -7.52, 752413000.00, 403588389.00, 53.64, 348824611.00, 460168838.00, 53.09, -56580449.00, -7.52, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:23', 1, NULL);
INSERT INTO `trx_upload_paparan_program` VALUES (22, '5c0746c7-17dd-410f-8388-aadc61f83dfd', 'c24680b5-88d1-487f-b807-85b2cb0837b4', '261b3748-5a41-11ee-971e-f4a4757ae8c3', 2024, 1, '3', 'Pokja Pengawasan', 2028924000.00, 902833416.00, 44.50, 1126090584.00, 1176475382.00, 44.30, -273641966.00, -13.49, 2028924000.00, 902833416.00, 44.50, 1126090584.00, 1176475382.00, 44.30, -273641966.00, -13.49, '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:23', 1, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of trx_upload_work_program
-- ----------------------------
INSERT INTO `trx_upload_work_program` VALUES (1, 'fe2a2042-b4f0-4795-80e7-1b125d760d6b', '0', '261b36ee-5a41-11ee-971e-f4a4757ae8c3', 2024, '020.07.11', 'PROGRAM DUKUNGAN MANAJEMEN DAN PELAKSANAAN TUGAS TEKNIS LAINNYA DEWAN ENERGI NASIONAL', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (2, 'acb6af6e-20dc-40d6-9131-5d26708be539', 'fe2a2042-b4f0-4795-80e7-1b125d760d6b', '261b36ee-5a41-11ee-971e-f4a4757ae8c3', 2024, '1909', 'Pengelolaan Manajemen Kesekretariatan Dewan Energi Nasional', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (3, '00c85d8f-9f80-4a69-841e-8084fceae6f9', 'acb6af6e-20dc-40d6-9131-5d26708be539', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '', 'BIRO UMUM', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (4, 'e01f8a8d-f9d3-4ae1-ae15-4d5294f86c77', '00c85d8f-9f80-4a69-841e-8084fceae6f9', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '1', 'Bagian Perencanaan dan Keuangan', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (5, '74e57f7d-1664-4779-aca1-d247f60e008c', 'e01f8a8d-f9d3-4ae1-ae15-4d5294f86c77', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '521211', 'Belanja Bahan', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (6, 'cb4e7407-acd6-4111-a3b0-09572023df79', 'e01f8a8d-f9d3-4ae1-ae15-4d5294f86c77', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '521213', 'Belanja Honor Output Kegiatan', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (7, '3ed69883-d498-425d-ab1b-ebd0172d10b6', 'e01f8a8d-f9d3-4ae1-ae15-4d5294f86c77', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '521811', 'Belanja Barang Persediaan Barang Konsumsi (ATK)', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (8, 'fd3a0418-2ed4-416c-b5ce-f67c2f55bc21', 'e01f8a8d-f9d3-4ae1-ae15-4d5294f86c77', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '522151', 'Belanja Jasa Profesi (NARSUM)', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (9, 'd5b16f81-0cde-4963-b6aa-444f62425d4c', 'e01f8a8d-f9d3-4ae1-ae15-4d5294f86c77', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '524111', 'Belanja Perjalanan Dinas', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (10, '63c673f6-a9f7-4f05-9a73-a929e18a38b0', 'e01f8a8d-f9d3-4ae1-ae15-4d5294f86c77', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '524113', 'Belanja Perjalanan Dinas Dalam Kota', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (11, 'e69d8aa2-e2ac-4264-b109-81fca0c860c5', '00c85d8f-9f80-4a69-841e-8084fceae6f9', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '2', 'Bagian Hukum dan Kepegawaian', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (12, 'c1ec31ce-6159-4b01-abd4-ca6d76ceb61e', 'e69d8aa2-e2ac-4264-b109-81fca0c860c5', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '522191', 'Belanja Jasa Lainnya', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (13, '5d366ac0-3581-48eb-9ae1-74aaa5a07337', 'e69d8aa2-e2ac-4264-b109-81fca0c860c5', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '524111', 'Belanja Perjalanan Dinas Biasa', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (14, '9d4f953e-518d-426c-b371-fdaa017df690', '00c85d8f-9f80-4a69-841e-8084fceae6f9', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '3', 'Bagian Rumah Tangga', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (15, '4b5a4c4d-887b-46d9-a9b7-0770521e7f25', '00c85d8f-9f80-4a69-841e-8084fceae6f9', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '4', 'APK', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (16, 'c87b5ee7-6363-4075-9aaf-c3595678c2c1', '4b5a4c4d-887b-46d9-a9b7-0770521e7f25', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '521111', 'Belanja Kebutuhan Perkantoran (konsumsi)', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (17, '34743f1b-fedd-4f29-95f0-bb73e399adb4', '4b5a4c4d-887b-46d9-a9b7-0770521e7f25', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '524119', 'Belanja Perjalanan Dinas Paket Meeting Luar Kota', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (18, '5eee395b-c6fb-4544-b1b1-ba7a56ffe7d9', '4b5a4c4d-887b-46d9-a9b7-0770521e7f25', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '524211', 'Belanja Perjalanan Dinas Biasa - Luar Negeri', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (19, '83884647-0b0b-4ea6-bf0c-d9925ec48458', '00c85d8f-9f80-4a69-841e-8084fceae6f9', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '4', 'Pimpinan', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (20, '472fc8b8-7e90-4dac-8a8c-eea5a7af53a0', '00c85d8f-9f80-4a69-841e-8084fceae6f9', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '5', 'Operasional dan Pemeliharaan Kantor', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (21, 'db0d649d-3412-4ac6-a4ea-689951b476a9', '472fc8b8-7e90-4dac-8a8c-eea5a7af53a0', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, 'A', 'Poliklinik dan Obat-obatan', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (22, 'a5a94499-9b9f-4133-b398-b5f1ba3b03eb', 'db0d649d-3412-4ac6-a4ea-689951b476a9', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '521811', 'Belanja Barang Persediaan Barang Konsumsi', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (23, '64bcb0e3-5bff-4224-9d3b-2d38c7aac8b7', '472fc8b8-7e90-4dac-8a8c-eea5a7af53a0', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, 'B', 'Pengadaan Pakaian Kerja', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (24, '674d8c17-546f-411b-a0cb-430322432965', '64bcb0e3-5bff-4224-9d3b-2d38c7aac8b7', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '521111', 'Belanja Keperluan Perkantoran', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (25, '618df1d9-6c75-4f2a-a771-5063f48a3b83', '472fc8b8-7e90-4dac-8a8c-eea5a7af53a0', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, 'C', 'Pertemuan/Tamu', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (26, '899b0b76-709d-45f1-be28-fc5fd0bef328', '472fc8b8-7e90-4dac-8a8c-eea5a7af53a0', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, 'E', 'Perawatan Gedung Kantor dan Rumah Negara', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (27, 'c76771e7-a653-4dd0-92bd-67113f53dd25', '899b0b76-709d-45f1-be28-fc5fd0bef328', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '523111', 'Belanja Pemeliharaan Gedung dan Bangunan', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (28, '1a550b44-ff23-4bd0-9819-c7a582b4848a', '899b0b76-709d-45f1-be28-fc5fd0bef328', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '523112', 'Belanja Barang Persediaan Pemeliharaan Gedung dan Bangunan', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (29, '435a8218-7c2d-4d51-9086-a3a88a9634cb', '472fc8b8-7e90-4dac-8a8c-eea5a7af53a0', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, 'F', 'Perbaikan peralatan kantor', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (30, '209a9ea4-a016-409f-9db8-f7d49b66829f', '435a8218-7c2d-4d51-9086-a3a88a9634cb', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '523121', 'Belanja Pemeliharaan Peralatan dan Mesin', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (31, '6f83256a-3e95-446d-8f13-388223a888aa', '435a8218-7c2d-4d51-9086-a3a88a9634cb', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '523133', 'Belanja Pemeliharaan Jaringan', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (32, 'd92ae39c-76b9-4ed3-aa2c-e0f97c984abb', '472fc8b8-7e90-4dac-8a8c-eea5a7af53a0', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, 'G', 'Perawatan Kendaraan Bermotor Roda 4/6/10', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (33, 'd7b12523-7ac1-4604-a924-d1e196072748', '472fc8b8-7e90-4dac-8a8c-eea5a7af53a0', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, 'H', 'Perawatan Kendaraan Bermotor Roda 2', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (34, '4d97a354-3003-4349-a2d3-fd9a65cf8b7c', '472fc8b8-7e90-4dac-8a8c-eea5a7af53a0', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, 'I', 'Langganan daya dan Jasa', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (35, '78901d23-ba9b-4a88-8a88-e5378b60c9a8', '4d97a354-3003-4349-a2d3-fd9a65cf8b7c', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '522111', 'Belanja Langganan Listrik', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (36, '22784979-e537-4c84-862a-8231c28bb7a7', '4d97a354-3003-4349-a2d3-fd9a65cf8b7c', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '522112', 'Belanja Langganan Telepon', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (37, '6e922103-4bca-4190-b3c1-47a0d1e80856', '4d97a354-3003-4349-a2d3-fd9a65cf8b7c', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '522113', 'Belanja Langganan Air', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (38, '133ca34b-b80f-470d-af9d-3cefcc53188e', '4d97a354-3003-4349-a2d3-fd9a65cf8b7c', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '522119', 'Belanja Langganan Daya dan Jasa Lainnya', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (39, 'ac8e8118-7ab2-43b5-90a7-9954df33e65c', '472fc8b8-7e90-4dac-8a8c-eea5a7af53a0', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, 'J', 'Jasa pos/giro/sertifikat', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (40, '0e3bf7ea-b315-44d3-a1c7-ba1b94f9b7fc', 'ac8e8118-7ab2-43b5-90a7-9954df33e65c', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '521114', 'Belanja Pengiriman Surat Dinas Pos Pusat', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (41, '3d04540a-862e-44dc-b0ae-789b2ce98198', 'ac8e8118-7ab2-43b5-90a7-9954df33e65c', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '521813', 'Belanja Barang Persediaan Pita Cukai, Meterai dan Leges', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (42, '7363f026-3f2e-4cca-a4c3-74b41da0df2b', '472fc8b8-7e90-4dac-8a8c-eea5a7af53a0', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, 'K', 'Pengadaan Toner dan barang cetakan Setjen DEN', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (43, '12694ff8-fae0-4622-807c-c4319a174419', '7363f026-3f2e-4cca-a4c3-74b41da0df2b', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '521119', 'Belanja Barang Operasional Lainnya', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (44, '5f6bf482-a61d-4b9b-a798-948fe90d7033', '472fc8b8-7e90-4dac-8a8c-eea5a7af53a0', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, 'L', 'Kebutuhan sehari-hari perkantoran', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (45, '9e7183eb-ba9d-4be3-8c0c-c1bdaaa2a422', '472fc8b8-7e90-4dac-8a8c-eea5a7af53a0', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, 'M', 'Honor Satpam, Pramubakti, petugas kebersihan,pengemudi dan teknisi', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (46, 'e2baaf09-3abe-43c0-a579-a7680bbaecb3', '472fc8b8-7e90-4dac-8a8c-eea5a7af53a0', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, 'N', 'Layanan Dukungan Pengelola Operasional Satker', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (47, '1940c4d8-7f92-4bb5-b0d4-aee20581207d', 'e2baaf09-3abe-43c0-a579-a7680bbaecb3', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '521115', 'Belanja Honor Operasional Satuan Kerja', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (48, '331f13e1-6f31-4405-add3-b8c53ac0efe7', 'e2baaf09-3abe-43c0-a579-a7680bbaecb3', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '524111', 'Perjalanan Dinas Biasa', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (49, 'bc70476c-6645-4d10-b7e2-6012d3331ad4', '472fc8b8-7e90-4dac-8a8c-eea5a7af53a0', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, 'O', 'Sewa Peralatan Kantor', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (50, '362cd27f-406f-4ae3-9cb7-6241d2b60492', 'bc70476c-6645-4d10-b7e2-6012d3331ad4', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '522141', 'Belanja Sewa', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (51, '626cfac1-7c64-4d30-a40c-48b95d477db9', '472fc8b8-7e90-4dac-8a8c-eea5a7af53a0', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, 'P', 'Sewa kendaraan dinas jabatan', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (52, '3592bbc6-af87-4589-a85b-88a64a6c6b28', '472fc8b8-7e90-4dac-8a8c-eea5a7af53a0', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, 'Q', 'Dukungan Operasional Kerumahtanggaan', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (53, '3bfc4e26-bed8-400f-97ff-95d18995d8d8', '00c85d8f-9f80-4a69-841e-8084fceae6f9', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '6', 'Pengadaan perangkat pengolah data dan komunikasi', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (54, 'fa6b8fcc-35a3-445a-b312-c6a8dac25c95', '3bfc4e26-bed8-400f-97ff-95d18995d8d8', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, 'A', 'Melakukan Penyelenggaraan Layanan Rapat Online', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (55, 'd7fcb613-8e9b-49ca-876b-28822abe4ced', '00c85d8f-9f80-4a69-841e-8084fceae6f9', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '7', 'Peralatan dan Mesin', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (56, 'a8cbeac3-a9f6-4690-9fb0-9d021a68eeb9', 'd7fcb613-8e9b-49ca-876b-28822abe4ced', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '532111', 'Belanja Modal Peralatan dan Mesin', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (57, 'd9338520-7d21-4e44-bfed-0361f6b70d85', '00c85d8f-9f80-4a69-841e-8084fceae6f9', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '8', 'Gaji dan Tunjangan Honor APK', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (58, '8315dec3-0f2b-4e0a-8ef9-2fe155ca8e54', 'd9338520-7d21-4e44-bfed-0361f6b70d85', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '511111', 'Belanja Gaji Pokok PNS', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (59, '8bc37203-ed8c-4804-bc02-3723b0491dde', 'd9338520-7d21-4e44-bfed-0361f6b70d85', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '511119', 'Belanja Pembulatan Gaji PNS', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (60, 'c5a2883e-3950-4b4e-badf-1d76f2c9ecc5', 'd9338520-7d21-4e44-bfed-0361f6b70d85', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '511121', 'Belanja Tunj. Suami/Istri PNS', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (61, '4e94100f-4ad8-4866-b95d-5b9527b2314e', 'd9338520-7d21-4e44-bfed-0361f6b70d85', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '511122', 'Belanja Tunj. Anak PNS', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (62, '245f4f50-921b-4e9b-baa5-30495958e4f9', 'd9338520-7d21-4e44-bfed-0361f6b70d85', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '511123', 'Belanja Tunj. Struktural PNS', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (63, 'ddc33044-56ff-4ccf-b8ba-464e7cbdd456', 'd9338520-7d21-4e44-bfed-0361f6b70d85', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '511124', 'Belanja Tunj. Fungsional PNS', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (64, '38e0e855-f0c3-482f-be01-3390217fcb7b', 'd9338520-7d21-4e44-bfed-0361f6b70d85', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '511125', 'Belanja Tunj. PPh PNS', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (65, 'dd58d32b-81b4-42d5-ac98-792565ef992e', 'd9338520-7d21-4e44-bfed-0361f6b70d85', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '511126', 'Belanja Tunj. Beras PNS', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (66, '456fd554-5c0a-41d9-82d7-113da1485dc1', 'd9338520-7d21-4e44-bfed-0361f6b70d85', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '511129', 'Belanja Uang Makan PNS', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (67, '59838d54-2f0f-4e61-9eba-4a9a8f13b514', 'd9338520-7d21-4e44-bfed-0361f6b70d85', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '511151', 'Belanja Tunjangan Umum PNS', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (68, 'ddbebb1e-af85-429d-afbb-02c545a2969f', 'd9338520-7d21-4e44-bfed-0361f6b70d85', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '511611', 'Belanja Gaji Pokok PPPK', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (69, '36fe47ee-d37c-4f7a-9313-e831cc9f5581', 'd9338520-7d21-4e44-bfed-0361f6b70d85', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '511619', 'Belanja Pembulatan Gaji PPPK', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (70, '1a27da56-654d-47de-8849-3a8aec2390c9', 'd9338520-7d21-4e44-bfed-0361f6b70d85', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '511621', 'Belanja Tunjangan Suami/Istri PPPK', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (71, '2ef07503-eec3-4c76-99bc-a6c2e4a545d9', 'd9338520-7d21-4e44-bfed-0361f6b70d85', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '511622', 'Belanja Tunjangan Anak PPPK', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (72, 'ea5418be-e191-44b4-84bc-da2a8a7a4650', 'd9338520-7d21-4e44-bfed-0361f6b70d85', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '511624', 'Belanja Tunjangan Fungsional PPPK', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (73, 'fbe04fbd-7eb9-40d3-a8a7-1d903439021d', 'd9338520-7d21-4e44-bfed-0361f6b70d85', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '511625', 'Belanja Tunjangan Beras PPPK', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (74, '01c01cbe-4858-428f-b1df-3eb3c873ccfb', 'd9338520-7d21-4e44-bfed-0361f6b70d85', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '511628', 'Belanja Uang Makan PPPK', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (75, '961fdc13-5785-488a-9daa-6a1e1935cb5e', 'd9338520-7d21-4e44-bfed-0361f6b70d85', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '512111', 'Belanja Uang Honor Tetap', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (76, 'b11b84c7-d18a-49db-8cec-8f172cf41a81', 'd9338520-7d21-4e44-bfed-0361f6b70d85', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '512211', 'Belanja Uang Lembur', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (77, 'f392ad3a-e461-4d28-9a36-a014305290db', 'd9338520-7d21-4e44-bfed-0361f6b70d85', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '512411', 'Belanja Pegawai (Tunjangan Khusus/Kegiatan/Kinerja)', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (78, '918ff7fe-aa96-4395-aa3a-9d83db5801bc', 'd9338520-7d21-4e44-bfed-0361f6b70d85', '261b373f-5a41-11ee-971e-f4a4757ae8c3', 2024, '512414', 'Belanja Pegawai Tunjangan Khusus/Kegiatan/Kinerja PPPK', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (79, 'ffe57990-a648-4b95-81e1-918dbfb3ef49', 'fe2a2042-b4f0-4795-80e7-1b125d760d6b', '261b36ee-5a41-11ee-971e-f4a4757ae8c3', 2024, '6382', 'Dukungan Teknis Pelaksanaan Tugas Dewan Energi Nasional', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (80, 'c1d80ef4-1857-48be-889f-a96527b59a99', 'ffe57990-a648-4b95-81e1-918dbfb3ef49', '261b3744-5a41-11ee-971e-f4a4757ae8c3', 2024, '', 'BIRO FASILITASI KEBIJAKAN ENERGI DAN PERSIDANGAN', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (81, '021af842-958a-4efc-858e-d09593d549c7', 'c1d80ef4-1857-48be-889f-a96527b59a99', '261b3744-5a41-11ee-971e-f4a4757ae8c3', 2024, '1', 'Bagian Kebijakan Energi', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (82, '0f3502ac-f69a-4fbc-84ca-210a13ef8f21', '021af842-958a-4efc-858e-d09593d549c7', '261b3744-5a41-11ee-971e-f4a4757ae8c3', 2024, '521211', 'Belanja Bahan', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (83, '83eff1eb-85e7-4eda-860f-092d687114d0', '021af842-958a-4efc-858e-d09593d549c7', '261b3744-5a41-11ee-971e-f4a4757ae8c3', 2024, '521213', 'Belanja Honor Output Kegiatan', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (84, '81f03015-abcb-4713-9fac-a44450f35f40', '021af842-958a-4efc-858e-d09593d549c7', '261b3744-5a41-11ee-971e-f4a4757ae8c3', 2024, '521811', 'Belanja Barang Persediaan Barang Konsumsi (ATK)', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (85, '8323f29d-9701-4150-8505-f9a460b5295b', '021af842-958a-4efc-858e-d09593d549c7', '261b3744-5a41-11ee-971e-f4a4757ae8c3', 2024, '522151', 'Belanja Jasa Profesi (NARSUM)', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (86, '088c0f67-0425-42a1-8b5e-4860ab90be8a', '021af842-958a-4efc-858e-d09593d549c7', '261b3744-5a41-11ee-971e-f4a4757ae8c3', 2024, '524111', 'Belanja Perjalanan Dinas Biasa', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (87, '9019c30e-6e0f-4af2-b7bb-0d130cdb9484', 'c1d80ef4-1857-48be-889f-a96527b59a99', '261b3744-5a41-11ee-971e-f4a4757ae8c3', 2024, '2', 'Bagian Humas dan Persidangan', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (88, '412578a4-1d0b-480a-b0b0-4cb094b17152', 'c1d80ef4-1857-48be-889f-a96527b59a99', '261b3744-5a41-11ee-971e-f4a4757ae8c3', 2024, '3', 'Bagian RUEN', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (89, '8978c710-5e85-4e1c-bff9-9078ccd3274a', '412578a4-1d0b-480a-b0b0-4cb094b17152', '261b3744-5a41-11ee-971e-f4a4757ae8c3', 2024, '524111', 'Belanja Perjalanan Dinas', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (90, 'dfc836f7-5987-427d-a764-1768d9ed5dbe', '412578a4-1d0b-480a-b0b0-4cb094b17152', '261b3744-5a41-11ee-971e-f4a4757ae8c3', 2024, '524113', 'Belanja Perjalanan Dinas Dalam Kota', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (91, '1d38dc3a-9916-40de-9cbb-ec62c05f0401', '412578a4-1d0b-480a-b0b0-4cb094b17152', '261b3744-5a41-11ee-971e-f4a4757ae8c3', 2024, '524211', 'Belanja Perjalanan Dinas Biasa - Luar Negeri', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (92, '93a8dc16-fb44-45ab-963b-b765712566fd', 'c1d80ef4-1857-48be-889f-a96527b59a99', '261b3744-5a41-11ee-971e-f4a4757ae8c3', 2024, '4', 'Bagian Kemandirian', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (93, '393ff575-8dc7-41b6-b9a5-c927f201c652', 'ffe57990-a648-4b95-81e1-918dbfb3ef49', '261b3748-5a41-11ee-971e-f4a4757ae8c3', 2024, '', 'BIRO FASILITASI PENANGGULANGAN KRISIS DAN PENGAWASAN ENERGI', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (94, '55f3eb04-df47-4435-b88d-b127c97dd634', '393ff575-8dc7-41b6-b9a5-c927f201c652', '261b3748-5a41-11ee-971e-f4a4757ae8c3', 2024, '1', 'Bagian Krisdaren', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (95, 'fdc00ef9-d14d-494d-a648-aaceb3df1935', '55f3eb04-df47-4435-b88d-b127c97dd634', '261b3748-5a41-11ee-971e-f4a4757ae8c3', 2024, '521211', 'Belanja Bahan', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (96, 'd153201c-7f06-4ad4-961f-d81f9345a044', '55f3eb04-df47-4435-b88d-b127c97dd634', '261b3748-5a41-11ee-971e-f4a4757ae8c3', 2024, '521213', 'Belanja Honor Output Kegiatan', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (97, '90ba9808-04e8-47c2-a047-3dbf0768c8c9', '55f3eb04-df47-4435-b88d-b127c97dd634', '261b3748-5a41-11ee-971e-f4a4757ae8c3', 2024, '521811', 'Belanja Barang Persediaan Barang Konsumsi (ATK)', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (98, '0f8ea5fb-076b-4f2c-a415-acc412844dea', '55f3eb04-df47-4435-b88d-b127c97dd634', '261b3748-5a41-11ee-971e-f4a4757ae8c3', 2024, '522151', 'Belanja Jasa Profesi (NARSUM)', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (99, '348adc4d-eb26-4ba8-a912-4f68d5657f55', '55f3eb04-df47-4435-b88d-b127c97dd634', '261b3748-5a41-11ee-971e-f4a4757ae8c3', 2024, '524111', 'Belanja Perjalanan Dinas Biasa', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (100, '569f6acb-937c-4cff-a603-d337bf3036f2', '55f3eb04-df47-4435-b88d-b127c97dd634', '261b3748-5a41-11ee-971e-f4a4757ae8c3', 2024, '524113', 'Belanja Perjalanan Dinas Dalam Kota', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (101, 'b47ae16f-57c5-4be7-a056-5c54ec481987', '393ff575-8dc7-41b6-b9a5-c927f201c652', '261b3748-5a41-11ee-971e-f4a4757ae8c3', 2024, '2', 'Bagian Ketahanan', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (102, '3a39924f-e76c-4f9c-8364-08f8c3ea1fb2', 'b47ae16f-57c5-4be7-a056-5c54ec481987', '261b3748-5a41-11ee-971e-f4a4757ae8c3', 2024, '524119', 'Belanja Perjalanan Dinas Paket Meeting Luar Kota', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (103, '99f23509-1b06-4e14-ad5c-d176c55042b0', 'b47ae16f-57c5-4be7-a056-5c54ec481987', '261b3748-5a41-11ee-971e-f4a4757ae8c3', 2024, '524211', 'Belanja Perjalanan Dinas Luar Negeri', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);
INSERT INTO `trx_upload_work_program` VALUES (104, '576e1802-be08-4718-8d87-37d17a82c488', '393ff575-8dc7-41b6-b9a5-c927f201c652', '261b3748-5a41-11ee-971e-f4a4757ae8c3', 2024, '3', 'Bagian Pengawasan', '9a5c787a-597c-11ee-8476-f4a4757ae8c3', '2024-09-21 16:16:25', 1, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 150 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of trx_work_programs
-- ----------------------------
INSERT INTO `trx_work_programs` VALUES (1, '3553b85a-67bf-4a73-93a9-9fa7bf04a22e', '0', 2024, '261b36ee-5a41-11ee-971e-f4a4757ae8c3', '020.07.11', 'PROGRAM DUKUNGAN MANAJEMEN DAN PELAKSANAAN TUGAS TEKNIS LAINNYA DEWAN ENERGI NASIONAL', NULL, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (2, '75d490ca-9323-4621-aaa0-9e8cc02a78d5', '3553b85a-67bf-4a73-93a9-9fa7bf04a22e', 2024, '261b36ee-5a41-11ee-971e-f4a4757ae8c3', '1909', 'Pengelolaan Manajemen Kesekretariatan Dewan Energi Nasional', NULL, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (3, 'a5ddf82c-356b-41eb-ad79-f88b0251b271', '75d490ca-9323-4621-aaa0-9e8cc02a78d5', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '', 'BIRO UMUM', NULL, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (4, '7e8c5aa9-bb9f-4ae0-8a61-aaba97366107', 'a5ddf82c-356b-41eb-ad79-f88b0251b271', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '1', 'Bagian Perencanaan dan Keuangan', NULL, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (5, '802d6b05-1cfc-4a0c-9f7e-858f6d66c5d6', '7e8c5aa9-bb9f-4ae0-8a61-aaba97366107', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '521211', 'Belanja Bahan', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (6, '024c840c-0e81-4f0a-b2f3-8e169bed7123', '7e8c5aa9-bb9f-4ae0-8a61-aaba97366107', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '521219', 'Belanja Barang Non Operasional Lainnya', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (7, 'f295ab3c-cc76-4e2a-a0c0-1a0c9c89913d', '7e8c5aa9-bb9f-4ae0-8a61-aaba97366107', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '521213', 'Belanja Honor Output Kegiatan', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (8, '3fca8237-42d1-4629-930b-c228c58eb69e', '7e8c5aa9-bb9f-4ae0-8a61-aaba97366107', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '521811', 'Belanja Barang Persediaan Barang Konsumsi (ATK)', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (9, '445b0a07-ba46-46fc-ad14-497436dcd6b7', '7e8c5aa9-bb9f-4ae0-8a61-aaba97366107', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '522151', 'Belanja Jasa Profesi (NARSUM)', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (10, '4d120bc5-187d-4723-91ee-50f931a86e03', '7e8c5aa9-bb9f-4ae0-8a61-aaba97366107', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '524111', 'Belanja Perjalanan Dinas', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (11, '4ddfdfa4-58e2-4a18-bfb8-5e3a9712f448', 'a5ddf82c-356b-41eb-ad79-f88b0251b271', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '2', 'Bagian Hukum dan Kepegawaian', NULL, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (12, '9d291d05-22ca-4b0c-a03a-e912bc72105d', '4ddfdfa4-58e2-4a18-bfb8-5e3a9712f448', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '521211', 'Belanja Bahan', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (13, 'c8ff0a6e-a25c-4fa3-ae7e-0c4d7bebc262', '4ddfdfa4-58e2-4a18-bfb8-5e3a9712f448', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '521213', 'Belanja Honor Output Kegiatan', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (14, '6408b41c-7907-4798-9a17-7c13fd28af56', '4ddfdfa4-58e2-4a18-bfb8-5e3a9712f448', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '521811', 'Belanja Barang Persediaan Barang Konsumsi (ATK)', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (15, 'c1506654-0724-445d-8557-d0208bdc0c1f', '4ddfdfa4-58e2-4a18-bfb8-5e3a9712f448', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '522151', 'Belanja Jasa Profesi (NARSUM)', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (16, 'e63f4cc8-718b-4377-9230-63a4794858cb', '4ddfdfa4-58e2-4a18-bfb8-5e3a9712f448', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '522161', 'Belanja Perjalanan Dinas Biasa', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (17, 'c99b13be-e084-48f5-a3f1-dcfa4c286eb0', '4ddfdfa4-58e2-4a18-bfb8-5e3a9712f448', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '524111', 'Belanja Perjalanan Dinas Biasa', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (18, 'ac5b7fc2-0522-4283-9079-6a6cb59e296d', '4ddfdfa4-58e2-4a18-bfb8-5e3a9712f448', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '524113', 'Belanja Perjalanan Dinas Dalam Kota', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (19, 'a14a5680-ed12-454d-bb89-72eabeab5fb3', 'a5ddf82c-356b-41eb-ad79-f88b0251b271', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '3', 'Bagian Rumah Tangga', NULL, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (20, '36ef0850-a18d-4f51-a19e-ecf80d065e13', 'a14a5680-ed12-454d-bb89-72eabeab5fb3', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '521211', 'Belanja Bahan', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (21, '528b1183-0552-4610-9d0d-c67bbfe8c9b7', 'a14a5680-ed12-454d-bb89-72eabeab5fb3', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '521811', 'Belanja Barang Persediaan Barang Konsumsi (ATK)', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (22, 'e3d0995c-1492-4a7b-9137-6d658bd36118', 'a14a5680-ed12-454d-bb89-72eabeab5fb3', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '522151', 'Belanja Jasa Profesi (NARSUM)', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (23, '85ebb307-a7d4-4996-8ec2-232afdc10b7a', 'a14a5680-ed12-454d-bb89-72eabeab5fb3', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '524111', 'Belanja Perjalanan Dinas Biasa', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (24, '244f8d37-2ed8-49fd-8a51-3c18b7f738ca', 'a5ddf82c-356b-41eb-ad79-f88b0251b271', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '4', 'APK', NULL, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (25, 'e4f1e110-cdbb-4011-a9de-70b6869c74c2', '244f8d37-2ed8-49fd-8a51-3c18b7f738ca', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '521111', 'Belanja Kebutuhan Perkantoran (konsumsi)', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (26, '7811fcfd-c8cf-45f8-844a-680db717e53f', '244f8d37-2ed8-49fd-8a51-3c18b7f738ca', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '522151', 'Belanja Jasa Profesi (NARSUM)', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (27, '139e25a6-101b-4076-8792-f3f4784edf74', '244f8d37-2ed8-49fd-8a51-3c18b7f738ca', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '524111', 'Belanja Perjalanan Dinas Biasa', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (28, '4db26392-32bb-4b09-9833-954ea8ddcfe3', '244f8d37-2ed8-49fd-8a51-3c18b7f738ca', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '524113', 'Belanja Perjalanan Dinas Dalam Kota', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (29, 'd2767b40-be8a-4d9b-86d6-0da9bb0ac006', '244f8d37-2ed8-49fd-8a51-3c18b7f738ca', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '524211', 'Belanja Perjalanan Dinas Biasa - Luar Negeri', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (30, 'c981cc8a-081a-4e75-a52b-4a2c16706f29', 'a5ddf82c-356b-41eb-ad79-f88b0251b271', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '4', 'Pimpinan', NULL, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (31, 'acd31ca3-0a04-4133-b098-3491edaaea0c', 'c981cc8a-081a-4e75-a52b-4a2c16706f29', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '524111', 'Belanja Perjalanan Dinas Biasa', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (32, '7b2013c4-bab9-4726-b137-f1365580e119', 'c981cc8a-081a-4e75-a52b-4a2c16706f29', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '524119', 'Belanja Perjalanan Dinas Paket Meeting Luar Kota', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (33, '5b7894cc-2e95-4273-864a-03a56b0c5019', 'c981cc8a-081a-4e75-a52b-4a2c16706f29', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '524211', 'Belanja Perjalanan Dinas Biasa - Luar Negeri', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (34, 'cf554081-45b4-407f-8137-c91d48c22fa9', 'a5ddf82c-356b-41eb-ad79-f88b0251b271', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '5', 'Operasional dan Pemeliharaan Kantor', NULL, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (35, 'e101e983-8695-49dd-87be-e5613cd272c7', 'cf554081-45b4-407f-8137-c91d48c22fa9', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', 'A', 'Poliklinik dan Obat-obatan', NULL, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (36, '690605a6-8e3e-4d61-b688-4fe6a9443c4d', 'e101e983-8695-49dd-87be-e5613cd272c7', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '521811', 'Belanja Barang Persediaan Barang Konsumsi', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (37, 'eacfeb63-bdac-42c7-91c6-f71fe0f1d1bc', 'e101e983-8695-49dd-87be-e5613cd272c7', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '521113', 'Belanja Penambah Daya Tahan Tubuh', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (38, '66ce2b7a-546a-4030-b137-38751e3ca76a', 'e101e983-8695-49dd-87be-e5613cd272c7', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '522191', 'Belanja Jasa Lainnya', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (39, 'c91c1b2b-4d36-48fd-b960-f6d08fb45f39', 'cf554081-45b4-407f-8137-c91d48c22fa9', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', 'B', 'Pengadaan Pakaian Kerja', NULL, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (40, '2b1fa045-550b-4117-97e8-b259f37f8671', 'c91c1b2b-4d36-48fd-b960-f6d08fb45f39', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '521111', 'Belanja Keperluan Perkantoran', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (41, '483d72fa-cdac-4051-a35a-588289517cd7', 'cf554081-45b4-407f-8137-c91d48c22fa9', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', 'C', 'Pertemuan/Tamu', NULL, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (42, 'e77ef469-d19c-4837-95c2-0c2c19e840d7', '483d72fa-cdac-4051-a35a-588289517cd7', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '521111', 'Belanja Keperluan Perkantoran', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (43, 'a997ec23-d0de-4b9e-9536-ac1bce49013e', 'cf554081-45b4-407f-8137-c91d48c22fa9', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', 'D', 'Pengadaan Koran dan Majalah', NULL, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (44, '3f146a46-0805-4f44-b731-246bdc372f2b', 'a997ec23-d0de-4b9e-9536-ac1bce49013e', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '521111', 'Belanja Keperluan Perkantoran', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (45, 'a4fb14ed-9885-4bcd-8ff5-dd40c853cd9d', 'cf554081-45b4-407f-8137-c91d48c22fa9', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', 'E', 'Perawatan Gedung Kantor dan Rumah Negara', NULL, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (46, 'a031ccda-a878-450e-882c-4767b278ad2d', 'a4fb14ed-9885-4bcd-8ff5-dd40c853cd9d', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '523111', 'Belanja Pemeliharaan Gedung dan Bangunan', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (47, '7f61eda4-3c47-4496-9835-186f9911a254', 'a4fb14ed-9885-4bcd-8ff5-dd40c853cd9d', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '523112', 'Belanja Barang Persediaan Pemeliharaan Gedung dan Bangunan', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (48, '0f7c848f-37fa-4067-a400-ae3c749b7a9d', 'cf554081-45b4-407f-8137-c91d48c22fa9', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', 'F', 'Perbaikan peralatan kantor', NULL, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (49, 'e0dd8c33-120f-4348-95d0-97bca17b2e7e', '0f7c848f-37fa-4067-a400-ae3c749b7a9d', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '523121', 'Belanja Pemeliharaan Peralatan dan Mesin', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (50, 'c2768b57-5694-4f96-a6e6-8c57c408ca78', '0f7c848f-37fa-4067-a400-ae3c749b7a9d', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '523133', 'Belanja Pemeliharaan Jaringan', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (51, 'a99758f8-3c64-43da-9e7c-a0bd5c0a4333', 'cf554081-45b4-407f-8137-c91d48c22fa9', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', 'G', 'Perawatan Kendaraan Bermotor Roda 4/6/10', NULL, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (52, '14bef32b-7006-4e25-8eca-7f3932872c68', 'a99758f8-3c64-43da-9e7c-a0bd5c0a4333', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '523121', 'Belanja Pemeliharaan Peralatan dan Mesin', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (53, 'c925407b-f55e-4616-b8ad-0c40ca34510d', 'cf554081-45b4-407f-8137-c91d48c22fa9', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', 'H', 'Perawatan Kendaraan Bermotor Roda 2', NULL, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (54, '2e3bffdb-4eaa-43db-ab00-c2bdd0736fde', 'c925407b-f55e-4616-b8ad-0c40ca34510d', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '523121', 'Belanja Pemeliharaan Peralatan dan Mesin', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (55, 'bd81b62d-1daa-4c8b-9cf9-5aed0a7d112d', 'cf554081-45b4-407f-8137-c91d48c22fa9', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', 'I', 'Layanan Daya dan Jasa', NULL, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (56, '5b932cf9-4fed-4959-a918-79c7963426f8', 'bd81b62d-1daa-4c8b-9cf9-5aed0a7d112d', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '522111', 'Belanja Langganan Listrik', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (57, 'cccf60b6-a7a1-4edb-8843-a55916fb6e80', 'bd81b62d-1daa-4c8b-9cf9-5aed0a7d112d', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '522112', 'Belanja Langganan Telepon', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (58, 'c364051e-3fd8-4dfa-a13d-a5923fbeb897', 'bd81b62d-1daa-4c8b-9cf9-5aed0a7d112d', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '522113', 'Belanja Langganan Air', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (59, '76a94129-595e-41c4-a2c4-cb44fa01ae74', 'bd81b62d-1daa-4c8b-9cf9-5aed0a7d112d', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '522119', 'Belanja Langganan Daya dan Jasa Lainnya', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (60, '366294a8-42bd-4fbe-a681-2c497b891e88', 'cf554081-45b4-407f-8137-c91d48c22fa9', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', 'J', 'Jasa pos/giro/sertifikat', NULL, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (61, 'd081ae16-99fb-4a0f-b64a-75c7db10b823', '366294a8-42bd-4fbe-a681-2c497b891e88', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '521114', 'Belanja Pengiriman Surat Dinas Pos Pusat', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (62, 'd6f03d64-7de7-4ae4-9141-68a06e53f7a1', '366294a8-42bd-4fbe-a681-2c497b891e88', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '521813', 'Belanja Barang Persediaan Pita Cukai, Meterai dan Leges', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (63, 'f077c43b-5f59-4f51-9579-34cfcbc7558d', 'cf554081-45b4-407f-8137-c91d48c22fa9', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', 'K', 'Pengadaan Toner dan barang cetakan Setjen DEN', NULL, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (64, 'd3c7ea17-ce8e-46ec-bbe5-5508f35c606e', 'f077c43b-5f59-4f51-9579-34cfcbc7558d', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '521211', 'Belanja Bahan', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (65, '20991120-eb1f-4bc0-a932-f60147eaf935', 'f077c43b-5f59-4f51-9579-34cfcbc7558d', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '521811', 'Belanja Barang Persediaan Barang Konsumsi', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (66, '3b6b8aa1-f8a4-4772-aea5-d6472ee6c6a8', 'cf554081-45b4-407f-8137-c91d48c22fa9', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', 'L', 'Kebutuhan sehari-hari perkantoran', NULL, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (67, 'bdd43247-56fa-4a49-aee5-ca667bfe1257', '3b6b8aa1-f8a4-4772-aea5-d6472ee6c6a8', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '521111', 'Belanja Keperluan Perkantoran', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (68, 'fb41ee5e-eeab-404e-86b9-f6ae9973c32f', 'cf554081-45b4-407f-8137-c91d48c22fa9', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', 'M', 'Honor Satpam, Pramubakti, petugas kebersihan,pengemudi dan teknisi', NULL, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (69, 'adb9adda-46df-445a-bd6c-5fd71aec166e', 'fb41ee5e-eeab-404e-86b9-f6ae9973c32f', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '521111', 'Belanja Keperluan Perkantoran', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (70, '270ea4f0-594d-475a-be11-32e656cfa8b4', 'fb41ee5e-eeab-404e-86b9-f6ae9973c32f', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '522191', 'Belanja Jasa Lainnya', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (71, 'ce8529b1-2331-4eb0-aa2a-231539dc4fe1', 'cf554081-45b4-407f-8137-c91d48c22fa9', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', 'N', 'Layanan Dukungan Pengelola Operasional Satker', NULL, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (72, '6bae0c2d-67c4-4c98-86e6-a07c78c98994', 'ce8529b1-2331-4eb0-aa2a-231539dc4fe1', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '521111', 'Belanja Keperluan Perkantoran', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (73, '7aaad101-8bf3-45aa-a91f-381536186f6a', 'ce8529b1-2331-4eb0-aa2a-231539dc4fe1', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '521115', 'Belanja Honor Operasional Satuan Kerja', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (74, '0aee8b80-fcbb-42b5-9a6e-0762c505b0b0', 'ce8529b1-2331-4eb0-aa2a-231539dc4fe1', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '524111', 'Belanja Perjalanan Dinas Biasa', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (75, '503f2194-ff27-4d78-9a09-5e2c2ca66494', 'cf554081-45b4-407f-8137-c91d48c22fa9', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', 'O', 'Sewa Peralatan Kantor', NULL, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (76, '23c389a8-d20c-497c-bf4a-6896eeed0d87', '503f2194-ff27-4d78-9a09-5e2c2ca66494', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '522141', 'Belanja Sewa', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (77, '6c4c435f-ee59-47b8-b508-c94ce0fa451c', 'cf554081-45b4-407f-8137-c91d48c22fa9', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', 'P', 'Sewa kendaraan dinas jabatan', NULL, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (78, 'e1ce20c1-c2e6-478a-ae9b-ebdb17b86b1b', '6c4c435f-ee59-47b8-b508-c94ce0fa451c', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '522141', 'Belanja Sewa', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (79, 'b3addec8-88ea-4698-b33c-e4df2f5cf82d', 'cf554081-45b4-407f-8137-c91d48c22fa9', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', 'Q', 'Belanja Penanganan Pademi COVID-19', NULL, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (80, 'efe0d727-807b-403a-9a67-aa6d4f528a42', 'b3addec8-88ea-4698-b33c-e4df2f5cf82d', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '521131', 'Belanja Barang Operasional - Penanganan Pandemi COVID-19', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (81, '04f73885-9b3c-4099-a160-79d33effdfd7', 'b3addec8-88ea-4698-b33c-e4df2f5cf82d', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '522192', 'Belanja Jasa - Penanganan Pandemi COVID-19', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (82, '19e352da-1cfe-4b79-8773-4777dd606086', 'cf554081-45b4-407f-8137-c91d48c22fa9', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', 'R', 'Memberikan Layanan Dukungan Pimpinan', NULL, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (83, 'e9d30f2d-c8b2-445e-8bce-52311cb21aab', '19e352da-1cfe-4b79-8773-4777dd606086', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '522151', 'Belanja Jasa Profesi', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (84, '305e646a-0779-4c91-ab1b-6ae66f2b520c', '19e352da-1cfe-4b79-8773-4777dd606086', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '524111', 'Belanja Perjalanan Dinas Biasa', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (85, '7e1b3abf-ee87-473a-b4d9-347d5df46f8c', '19e352da-1cfe-4b79-8773-4777dd606086', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '524119', 'Belanja Perjalanan Paket Meeting Luar Kota', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (86, 'a0b43b0d-39a6-4164-8b35-72875bfa841a', 'a5ddf82c-356b-41eb-ad79-f88b0251b271', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '6', 'Pengadaan perangkat pengolah data dan komunikasi', NULL, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (87, '59915769-d31c-46d5-81f1-786d624ead61', 'a0b43b0d-39a6-4164-8b35-72875bfa841a', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', 'A', 'Melakukan Penyelenggaraan Layanan Rapat Online', NULL, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (88, 'b4a7e904-b9af-4c52-bd68-072f2727bf4a', '59915769-d31c-46d5-81f1-786d624ead61', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '521211', 'Belanja Bahan', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (89, 'b0bc8324-acaa-470a-bb39-af748f236a82', 'a5ddf82c-356b-41eb-ad79-f88b0251b271', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '7', 'Peralatan dan Mesin', NULL, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (90, 'ea4173c0-f3f4-451e-974d-e4986e3c3cdb', 'b0bc8324-acaa-470a-bb39-af748f236a82', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '532111', 'Belanja Modal Peralatan dan Mesin', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (91, 'f8c5ea80-31b5-45c8-84dd-7a4ee030afa3', 'b0bc8324-acaa-470a-bb39-af748f236a82', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '536111', 'Belanja Modal Lainnya', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (92, '833d873b-96b1-46c2-92b7-15cc304febe7', 'a5ddf82c-356b-41eb-ad79-f88b0251b271', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '8', 'Gaji dan Tunjangan Honor APK', NULL, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (93, '618a1253-1e8e-4a7f-b4fa-ea26d68683ad', '833d873b-96b1-46c2-92b7-15cc304febe7', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '511111', 'Belanja Gaji Pokok PNS', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (94, '37e5f734-4a94-448e-895b-9f401895f308', '833d873b-96b1-46c2-92b7-15cc304febe7', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '511119', 'Belanja Pembulatan Gaji PNS', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (95, '8d90bc0f-3631-4075-bb75-767c77fb3f23', '833d873b-96b1-46c2-92b7-15cc304febe7', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '511121', 'Belanja Tunj. Suami/Istri PNS', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (96, '1cda844a-435d-42b8-a287-e7add6dff9b9', '833d873b-96b1-46c2-92b7-15cc304febe7', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '511122', 'Belanja Tunj. Anak PNS', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (97, 'f32e846d-714b-40ee-bef7-e0bd2c836873', '833d873b-96b1-46c2-92b7-15cc304febe7', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '511123', 'Belanja Tunj. Struktural PNS', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (98, 'bb02df80-d778-479b-94a5-6d43c292b3e0', '833d873b-96b1-46c2-92b7-15cc304febe7', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '511124', 'Belanja Tunj. Fungsional PNS', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (99, '97fe9185-3267-4c2c-a89e-ce433685e072', '833d873b-96b1-46c2-92b7-15cc304febe7', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '511125', 'Belanja Tunj. PPh PNS', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (100, '48732a6e-0847-4673-b2bd-3b6e21e533d6', '833d873b-96b1-46c2-92b7-15cc304febe7', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '511126', 'Belanja Tunj. Beras PNS', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (101, 'e681548a-df07-4fe3-9d97-736e2b0228b3', '833d873b-96b1-46c2-92b7-15cc304febe7', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '511129', 'Belanja Uang Makan PNS', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (102, 'aff935ab-4e4b-4a11-9699-8fe9290b22f3', '833d873b-96b1-46c2-92b7-15cc304febe7', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '511151', 'Belanja Tunjangan Umum PNS', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (103, '8b6bc569-5f5a-4488-acc7-9b5d4121c1aa', '833d873b-96b1-46c2-92b7-15cc304febe7', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '512111', 'Belanja Uang Honor Tetap', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (104, '693ec29a-d7d7-41f4-a5f5-56c7ab360455', '833d873b-96b1-46c2-92b7-15cc304febe7', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '512211', 'Belanja Uang Lembur', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (105, 'fab48720-4be2-4b32-b6a9-6ae809a0ccb5', '833d873b-96b1-46c2-92b7-15cc304febe7', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '512411', 'Belanja Pegawai (Tunjangan Khusus/Kegiatan/Kinerja)', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (106, '8dd84a84-0408-4c03-af57-2c81a0af0cd7', '833d873b-96b1-46c2-92b7-15cc304febe7', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '511611', 'Belanja Gaji Pokok PPPK', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (107, '09e4d719-5dec-4df8-83c4-9fce869216ba', '833d873b-96b1-46c2-92b7-15cc304febe7', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '511619', 'Belanja Pembulatan Gaji PPPK', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (108, 'f42daa7c-0948-490f-b6a9-e50db6485429', '833d873b-96b1-46c2-92b7-15cc304febe7', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '511621', 'Belanja Tunj. Suami/Istri PPPK', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (109, '2d04b6a0-2adf-4695-b649-7add3c76c23a', '833d873b-96b1-46c2-92b7-15cc304febe7', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '511622', 'Belanja Tunjangan Anak PPPK', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (110, 'e5be8077-91ef-4cba-bd48-69701392e60c', '833d873b-96b1-46c2-92b7-15cc304febe7', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '511624', 'Belanja Tunjangan Fungsional PPPK', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (111, '789546ee-e7a7-4b46-a986-ce435f30e291', '833d873b-96b1-46c2-92b7-15cc304febe7', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '511625', 'Belanja Tunjangan Beras PPPK', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (112, '0fd77f6c-f0f9-463f-9182-205905385523', '833d873b-96b1-46c2-92b7-15cc304febe7', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '511628', 'Belanja Uang Makan PPPK', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (113, '4bcb4b67-50e7-4942-b445-65456df596ea', '833d873b-96b1-46c2-92b7-15cc304febe7', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '512414', 'Belanja Pegawai (Tunjangan Khusus/Kegiatan/Kinerja) PPPK', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (114, 'd512ed22-d6a9-476a-a0db-6523879dedd9', '3553b85a-67bf-4a73-93a9-9fa7bf04a22e', 2024, '261b373f-5a41-11ee-971e-f4a4757ae8c3', '6382', 'Dukungan Teknis Pelaksanaan Tugas Dewan Energi Nasional', NULL, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (115, '8b486de0-5125-4be7-af9b-d86271bf3117', 'd512ed22-d6a9-476a-a0db-6523879dedd9', 2024, '261b3744-5a41-11ee-971e-f4a4757ae8c3', '', 'BIRO FASILITASI KEBIJAKAN ENERGI DAN PERSIDANGAN', NULL, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (116, 'd96828dd-42f6-47ab-99b2-9bc7cc8371b3', '8b486de0-5125-4be7-af9b-d86271bf3117', 2024, '261b3744-5a41-11ee-971e-f4a4757ae8c3', '1', 'Bagian Kebijakan Energi', NULL, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (117, 'f8e5a996-1e19-48ac-a562-71758d2a6abc', 'd96828dd-42f6-47ab-99b2-9bc7cc8371b3', 2024, '261b3744-5a41-11ee-971e-f4a4757ae8c3', '521211', 'Belanja Bahan', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (118, '694a1469-2940-4e2c-b45f-ee4ed3cc714c', 'd96828dd-42f6-47ab-99b2-9bc7cc8371b3', 2024, '261b3744-5a41-11ee-971e-f4a4757ae8c3', '521213', 'Belanja Honor Output Kegiatan', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (119, 'fa7d1222-f88a-4e18-9475-862480efea9f', 'd96828dd-42f6-47ab-99b2-9bc7cc8371b3', 2024, '261b3744-5a41-11ee-971e-f4a4757ae8c3', '521811', 'Belanja Barang Persediaan Barang Konsumsi (ATK)', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (120, '2e7e35e8-44bc-4476-8bb5-a73119a049d8', 'd96828dd-42f6-47ab-99b2-9bc7cc8371b3', 2024, '261b3744-5a41-11ee-971e-f4a4757ae8c3', '522151', 'Belanja Jasa Profesi (NARSUM)', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (121, 'a1cd5aa9-4d55-467d-a658-315572b633a8', 'd96828dd-42f6-47ab-99b2-9bc7cc8371b3', 2024, '261b3744-5a41-11ee-971e-f4a4757ae8c3', '524111', 'Belanja Perjalanan Dinas Biasa', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (122, '3bc1e10f-de8b-476a-b408-12b8e1c58480', '8b486de0-5125-4be7-af9b-d86271bf3117', 2024, '261b3744-5a41-11ee-971e-f4a4757ae8c3', '2', 'Bagian Humas dan Persidangan', NULL, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (123, 'c6476dfd-7629-4c99-9693-639c600c1548', '3bc1e10f-de8b-476a-b408-12b8e1c58480', 2024, '261b3744-5a41-11ee-971e-f4a4757ae8c3', '521211', 'Belanja Bahan', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (124, '0b44b445-8606-4d1c-a7d8-3af27ffee943', '3bc1e10f-de8b-476a-b408-12b8e1c58480', 2024, '261b3744-5a41-11ee-971e-f4a4757ae8c3', '521213', 'Belanja Honor Output Kegiatan', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (125, '8a638835-69e3-447b-af4b-17f52badea95', '3bc1e10f-de8b-476a-b408-12b8e1c58480', 2024, '261b3744-5a41-11ee-971e-f4a4757ae8c3', '521811', 'Belanja Barang Persediaan Barang Konsumsi (ATK)', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (126, 'd2465534-9aae-427b-a63f-6d984f3c4543', '3bc1e10f-de8b-476a-b408-12b8e1c58480', 2024, '261b3744-5a41-11ee-971e-f4a4757ae8c3', '522151', 'Belanja Jasa Profesi (NARSUM)', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (127, 'a8510c5b-0829-428f-b09b-e8fb7bc288b7', '3bc1e10f-de8b-476a-b408-12b8e1c58480', 2024, '261b3744-5a41-11ee-971e-f4a4757ae8c3', '524111', 'Belanja Perjalanan Dinas Biasa', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (128, 'bb95eaae-416e-4913-9e58-4bffeb81d42c', '8b486de0-5125-4be7-af9b-d86271bf3117', 2024, '261b3744-5a41-11ee-971e-f4a4757ae8c3', '3', 'Bagian RUEN', NULL, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (129, 'eb88c03f-0b43-424b-8416-5e6498a6f670', 'bb95eaae-416e-4913-9e58-4bffeb81d42c', 2024, '261b3744-5a41-11ee-971e-f4a4757ae8c3', '521211', 'Belanja Bahan', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (130, 'aa0d718a-03df-494c-9886-7a66587b9e86', 'bb95eaae-416e-4913-9e58-4bffeb81d42c', 2024, '261b3744-5a41-11ee-971e-f4a4757ae8c3', '521213', 'Belanja Honor Output Kegiatan', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (131, '37f2762c-08bb-42b1-aa80-d6559dfc3453', 'bb95eaae-416e-4913-9e58-4bffeb81d42c', 2024, '261b3744-5a41-11ee-971e-f4a4757ae8c3', '521811', 'Belanja Barang Persediaan Barang Konsumsi (ATK)', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (132, 'b16e253d-74ec-4018-86d3-263e7508693f', 'bb95eaae-416e-4913-9e58-4bffeb81d42c', 2024, '261b3744-5a41-11ee-971e-f4a4757ae8c3', '522151', 'Belanja Jasa Profesi (NARSUM)', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (133, '3e62a333-424a-491a-a1ee-c0ca3150c230', 'bb95eaae-416e-4913-9e58-4bffeb81d42c', 2024, '261b3744-5a41-11ee-971e-f4a4757ae8c3', '524111', 'Belanja Perjalanan Dinas', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (134, '3314cace-2909-49b6-bdb1-8aef658858c2', 'bb95eaae-416e-4913-9e58-4bffeb81d42c', 2024, '261b3744-5a41-11ee-971e-f4a4757ae8c3', '524113', 'Belanja Perjalanan Dinas Dalam Kota', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (135, '5c4e52c6-9306-44c5-af5d-d87e883a062f', 'bb95eaae-416e-4913-9e58-4bffeb81d42c', 2024, '261b3744-5a41-11ee-971e-f4a4757ae8c3', '524211', 'Belanja Perjalanan Dinas Biasa - Luar Negeri', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (136, 'f04a7e49-f76b-42fd-ad93-4612c3dfe548', 'd512ed22-d6a9-476a-a0db-6523879dedd9', 2024, '261b3748-5a41-11ee-971e-f4a4757ae8c3', '', 'BIRO FASILITASI PENANGGULANGAN KRISIS DAN PENGAWASAN ENERGI', NULL, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (137, '8b539e74-402a-4b91-9c3a-e04544773a14', 'f04a7e49-f76b-42fd-ad93-4612c3dfe548', 2024, '261b3748-5a41-11ee-971e-f4a4757ae8c3', '1', 'Bagian Krisdaren', NULL, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (138, '2e76e938-3120-46a8-b4ac-e92502ce58a0', '8b539e74-402a-4b91-9c3a-e04544773a14', 2024, '261b3748-5a41-11ee-971e-f4a4757ae8c3', '521211', 'Belanja Bahan', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (139, 'db22b9ba-2ab2-4bf4-a41d-d84004bac5dd', '8b539e74-402a-4b91-9c3a-e04544773a14', 2024, '261b3748-5a41-11ee-971e-f4a4757ae8c3', '521213', 'Belanja Honor Output Kegiatan', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (140, '732eddaa-0d2f-4265-870a-5a45dcb4521d', '8b539e74-402a-4b91-9c3a-e04544773a14', 2024, '261b3748-5a41-11ee-971e-f4a4757ae8c3', '521811', 'Belanja Barang Persediaan Barang Konsumsi (ATK)', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (141, 'abdd4353-6652-406e-9182-70f12e5d1b65', '8b539e74-402a-4b91-9c3a-e04544773a14', 2024, '261b3748-5a41-11ee-971e-f4a4757ae8c3', '522151', 'Belanja Jasa Profesi (NARSUM)', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (142, '57339b11-bc4e-491f-ae13-d7bee6e34ea7', '8b539e74-402a-4b91-9c3a-e04544773a14', 2024, '261b3748-5a41-11ee-971e-f4a4757ae8c3', '524111', 'Belanja Perjalanan Dinas Biasa', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (143, '3b8b2315-6059-4422-84ca-7ccad765180b', '8b539e74-402a-4b91-9c3a-e04544773a14', 2024, '261b3748-5a41-11ee-971e-f4a4757ae8c3', '524119', 'Belanja Perjalanan Dinas Paket Meeting Luar Kota', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (144, '8277cf92-5bb3-4a78-9791-467b33efaac1', '8b539e74-402a-4b91-9c3a-e04544773a14', 2024, '261b3748-5a41-11ee-971e-f4a4757ae8c3', '524211', 'Belanja Perjalanan Dinas Luar Negeri', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (145, '227c3d21-97e8-41a9-8df0-77f7ac61fcac', 'f04a7e49-f76b-42fd-ad93-4612c3dfe548', 2024, '261b3748-5a41-11ee-971e-f4a4757ae8c3', '2', 'Bagian Pengawasan', NULL, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (146, 'e3098dd1-650e-4685-a557-a53cd874531e', '227c3d21-97e8-41a9-8df0-77f7ac61fcac', 2024, '261b3748-5a41-11ee-971e-f4a4757ae8c3', '521211', 'Belanja Bahan', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (147, '29a60220-c6eb-4eca-ac4a-1185a5ed7f0d', '227c3d21-97e8-41a9-8df0-77f7ac61fcac', 2024, '261b3748-5a41-11ee-971e-f4a4757ae8c3', '521213', 'Belanja Honor Output Kegiatan', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (148, '0b55b2c7-6a06-486b-b69a-dcac6b4301a4', '227c3d21-97e8-41a9-8df0-77f7ac61fcac', 2024, '261b3748-5a41-11ee-971e-f4a4757ae8c3', '521811', 'Belanja Barang Persediaan Barang Konsumsi (ATK)', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (149, '3ae57c3d-16a7-446a-8947-1bf1049e2b39', '227c3d21-97e8-41a9-8df0-77f7ac61fcac', 2024, '261b3748-5a41-11ee-971e-f4a4757ae8c3', '522151', 'Belanja Jasa Profesi (NARSUM)', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);
INSERT INTO `trx_work_programs` VALUES (150, 'a0686f34-a6c3-47f9-87b2-ec653154f9c3', '227c3d21-97e8-41a9-8df0-77f7ac61fcac', 2024, '261b3748-5a41-11ee-971e-f4a4757ae8c3', '524111', 'Belanja Perjalanan Dinas Biasa', 1, NULL, '', '2024-02-13 09:43:23', NULL, NULL, NULL, 1);

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
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_trx_target` AS with `aa` as (select `aa`.`target_id` AS `target_id`,`aa`.`target_uuid` AS `target_uuid`,`aa`.`target_work_unit_uuid` AS `target_work_unit_uuid`,`aa`.`target_year` AS `target_year`,`aa`.`target_month` AS `target_month`,`aa`.`target_value` AS `target_value`,`aa`.`target_value_percent` AS `target_value_percent`,`aa`.`target_value_percent_1` AS `target_value_percent_1`,`aa`.`target_value_percent_2` AS `target_value_percent_2`,`aa`.`target_value_percent_3` AS `target_value_percent_3`,`aa`.`target_value_percent_4` AS `target_value_percent_4`,`aa`.`target_value_percent_5` AS `target_value_percent_5`,`aa`.`target_value_percent_6` AS `target_value_percent_6`,`aa`.`target_value_percent_7` AS `target_value_percent_7`,`aa`.`target_value_percent_8` AS `target_value_percent_8`,`aa`.`target_value_percent_9` AS `target_value_percent_9`,`aa`.`target_value_percent_10` AS `target_value_percent_10`,`aa`.`target_value_percent_11` AS `target_value_percent_11`,`aa`.`target_value_percent_12` AS `target_value_percent_12`,`aa`.`target_create_by` AS `target_create_by`,`aa`.`target_create_date` AS `target_create_date`,`aa`.`target_status` AS `target_status`,`aa`.`target_log_uuid` AS `target_log_uuid`,`bb`.`work_unit_id` AS `work_unit_id`,`bb`.`work_unit_code` AS `work_unit_code`,`bb`.`work_unit_name` AS `work_unit_name`,`bb`.`work_unit_sort` AS `work_unit_sort` from (`trx_target` `aa` left join `mst_work_units` `bb` on(((`aa`.`target_work_unit_uuid` = `bb`.`work_unit_uuid`) and (`bb`.`work_unit_log_uuid` is null))))) select `aa`.`target_id` AS `target_id`,`aa`.`target_uuid` AS `target_uuid`,`aa`.`target_work_unit_uuid` AS `target_work_unit_uuid`,`aa`.`target_year` AS `target_year`,`aa`.`target_month` AS `target_month`,`aa`.`target_value` AS `target_value`,`aa`.`target_value_percent` AS `target_value_percent`,`aa`.`target_value_percent_1` AS `target_value_percent_1`,`aa`.`target_value_percent_2` AS `target_value_percent_2`,`aa`.`target_value_percent_3` AS `target_value_percent_3`,`aa`.`target_value_percent_4` AS `target_value_percent_4`,`aa`.`target_value_percent_5` AS `target_value_percent_5`,`aa`.`target_value_percent_6` AS `target_value_percent_6`,`aa`.`target_value_percent_7` AS `target_value_percent_7`,`aa`.`target_value_percent_8` AS `target_value_percent_8`,`aa`.`target_value_percent_9` AS `target_value_percent_9`,`aa`.`target_value_percent_10` AS `target_value_percent_10`,`aa`.`target_value_percent_11` AS `target_value_percent_11`,`aa`.`target_value_percent_12` AS `target_value_percent_12`,round((`bb`.`budget_realization` * (`aa`.`target_value_percent_1` / 100)),0) AS `target_value_1`,round((`bb`.`budget_realization` * (`aa`.`target_value_percent_2` / 100)),0) AS `target_value_2`,round((`bb`.`budget_realization` * (`aa`.`target_value_percent_3` / 100)),0) AS `target_value_3`,round((`bb`.`budget_realization` * (`aa`.`target_value_percent_4` / 100)),0) AS `target_value_4`,round((`bb`.`budget_realization` * (`aa`.`target_value_percent_5` / 100)),0) AS `target_value_5`,round((`bb`.`budget_realization` * (`aa`.`target_value_percent_6` / 100)),0) AS `target_value_6`,round((`bb`.`budget_realization` * (`aa`.`target_value_percent_7` / 100)),0) AS `target_value_7`,round((`bb`.`budget_realization` * (`aa`.`target_value_percent_8` / 100)),0) AS `target_value_8`,round((`bb`.`budget_realization` * (`aa`.`target_value_percent_9` / 100)),0) AS `target_value_9`,round((`bb`.`budget_realization` * (`aa`.`target_value_percent_10` / 100)),0) AS `target_value_10`,round((`bb`.`budget_realization` * (`aa`.`target_value_percent_11` / 100)),0) AS `target_value_11`,round((`bb`.`budget_realization` * (`aa`.`target_value_percent_12` / 100)),0) AS `target_value_12`,`aa`.`target_create_by` AS `target_create_by`,`aa`.`target_create_date` AS `target_create_date`,`aa`.`target_status` AS `target_status`,`aa`.`target_log_uuid` AS `target_log_uuid`,`aa`.`work_unit_id` AS `work_unit_id`,`aa`.`work_unit_code` AS `work_unit_code`,`aa`.`work_unit_name` AS `work_unit_name`,`aa`.`work_unit_sort` AS `work_unit_sort`,`bb`.`budget_realization` AS `budget_realization` from (`aa` join `view_realisasi_by_unit` `bb` on(((`aa`.`target_year` = `bb`.`work_program_year`) and (`aa`.`target_work_unit_uuid` = `bb`.`work_unit_uuid`))));

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
CREATE PROCEDURE `get_data_anggaran_by_periode`(tahun INT, bulan INT)
BEGIN  
  WITH datas AS (
		SELECT
			aa.work_unit_id,
			aa.work_unit_code,
			aa.work_unit_name,
			aa.work_unit_sort,
			IFNULL(sum(cc.budget_plafon),0) AS plafon,
			IFNULL(sum(dd.budget_realization),0) AS realisasi,
			
			(IFNULL(
			(SELECT 
			(CASE 
			WHEN bulan = 1 THEN x.target_value_percent_1
			WHEN bulan = 2 THEN x.target_value_percent_2
			WHEN bulan = 3 THEN x.target_value_percent_3
			WHEN bulan = 4 THEN x.target_value_percent_4
			WHEN bulan = 5 THEN x.target_value_percent_5
			WHEN bulan = 6 THEN x.target_value_percent_6
			WHEN bulan = 7 THEN x.target_value_percent_7
			WHEN bulan = 8 THEN x.target_value_percent_8
			WHEN bulan = 9 THEN x.target_value_percent_9
			WHEN bulan = 10 THEN x.target_value_percent_10
			WHEN bulan = 11 THEN x.target_value_percent_11
			WHEN bulan = 12 THEN x.target_value_percent_12
			 ELSE 0 END) target_value
			 FROM trx_target x WHERE x.target_status = 1 AND x.target_log_uuid IS NULL AND x.target_year = tahun AND  x.target_status = 1 AND x.target_work_unit_uuid = aa.work_unit_uuid)
			 ,0)*IFNULL(sum(cc.budget_plafon),0))/100
				target,
			IFNULL((SELECT SUM(x.sppd_pegawai)+SUM(x.sppd_barang)+SUM(x.sppd_modal) FROM trx_sppd x WHERE x.sppd_status = 1 AND x.sppd_log_uuid IS NULL AND x.sppd_year = tahun AND x.sppd_month <= bulan AND 	x.sppd_work_unit_uuid = aa.work_unit_uuid),0) sppd
		FROM
			mst_work_units aa 
			LEFT JOIN trx_work_programs bb ON bb.work_program_work_unit_uuid = aa.work_unit_uuid AND bb.work_program_year = tahun AND bb.work_program_status = 1 AND bb.work_program_log_uuid IS NULL
			LEFT JOIN trx_budgets cc ON bb.work_program_uuid = cc.budget_work_program_uuid AND cc.budget_year = bb.work_program_year AND cc.budget_month = 1 AND cc.budget_status = 1 AND cc.budget_log_uuid IS NULL
			LEFT JOIN trx_budgets dd ON bb.work_program_uuid = dd.budget_work_program_uuid AND dd.budget_year = bb.work_program_year AND dd.budget_month <= bulan AND dd.budget_status = 1 AND dd.budget_log_uuid IS NULL
		WHERE
			aa.work_unit_log_uuid IS NULL 
			AND aa.work_unit_status = 1 
			AND aa.work_unit_parent_uuid != '0' 
			GROUP BY
			aa.work_unit_id,
			aa.work_unit_code,
			aa.work_unit_name,
			aa.work_unit_sort
	)
	SELECT 
	aa.*,
	format(aa.plafon, 0, 'id_ID' ) plafon_format,
	format(aa.realisasi, 0, 'id_ID' ) realisasi_format,
	format(aa.target, 0, 'id_ID' ) target_format,
	format(aa.sppd, 0, 'id_ID' ) sppd_format,
	IFNULL(ROUND(((aa.target/aa.plafon)*100),2),0) AS persen_target,
	format( ABS(aa.plafon-aa.realisasi), 0, 'id_ID' ) AS deviasi_format,
	IFNULL(ROUND(((aa.realisasi/aa.target)*100),2),0) persen_realisasi_target,
	IFNULL(ROUND(((aa.realisasi/aa.plafon)*100),2),0) persen_realisasi_pagu,
	IFNULL(aa.plafon-aa.realisasi,0) AS sisa_anggaran_spm,
	format( (aa.plafon-aa.realisasi), 0, 'id_ID' ) AS sisa_anggaran_spm_format,
	aa.plafon-aa.sppd AS sisa_anggaran_sp2d,
	format( (aa.plafon-aa.sppd), 0, 'id_ID' ) AS sisa_anggaran_sp2d_format
	FROM datas aa
	ORDER BY
		aa.work_unit_sort ASC;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for get_data_apk_perbiro_by_periode
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_data_apk_perbiro_by_periode`;
delimiter ;;
CREATE PROCEDURE `get_data_apk_perbiro_by_periode`(tahun INT, bulan INT)
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
CREATE PROCEDURE `get_data_belanja_by_periode`(tahun INT, bulan INT)
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
CREATE PROCEDURE `get_data_capaian_kinerja_by_periode`(tahun INT)
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
CREATE PROCEDURE `get_data_dashboard_realisasi_anggaran`(tahun INT)
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
CREATE PROCEDURE `get_data_detail_perbiro_by_periode`(tahun INT, bulan INT, jenis INT)
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
CREATE PROCEDURE `get_data_detail_perbiro_setjen_by_periode`(tahun INT, bulan INT)
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
CREATE FUNCTION `number_to_alphabet`(num INT)
 RETURNS varchar(255) CHARSET utf8mb3
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
