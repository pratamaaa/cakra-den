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
-- View structure for view_data_anggaran
-- ----------------------------
DROP VIEW IF EXISTS `view_data_anggaran`;
CREATE VIEW `view_data_anggaran` AS with `datas` as (select `c`.`work_unit_id` AS `work_unit_id`,`c`.`work_unit_code` AS `work_unit_code`,`c`.`work_unit_name` AS `work_unit_name`,`c`.`work_unit_sort` AS `work_unit_sort`,`b`.`budget_year` AS `budget_year`,`b`.`budget_month` AS `budget_month`,sum(`b`.`budget_plafon`) AS `plafon`,concat(format(sum(`b`.`budget_plafon`),0,'id_ID')) AS `plafon_format`,concat(format(sum(`b`.`budget_realization`),0,'id_ID')) AS `realisasi_format`,sum(`b`.`budget_realization`) AS `realisasi`,((sum(`b`.`budget_realization`) / sum(`b`.`budget_plafon`)) * 100) AS `presentasi_realisasi`,(sum(`b`.`budget_plafon`) - sum(`b`.`budget_realization`)) AS `total_fund`,(select sum(`x`.`target_value`) from `trx_target` `x` where ((`x`.`target_status` = 1) and (`x`.`target_log_uuid` is null) and (`x`.`target_year` = `b`.`budget_year`) and (`x`.`target_month` <= `b`.`budget_month`) and (`x`.`target_work_unit_uuid` = `c`.`work_unit_uuid`))) AS `target`,(select ((sum(`x`.`sppd_pegawai`) + sum(`x`.`sppd_barang`)) + sum(`x`.`sppd_modal`)) from `trx_sppd` `x` where ((`x`.`sppd_status` = 1) and (`x`.`sppd_log_uuid` is null) and (`x`.`sppd_year` = `b`.`budget_year`) and (`x`.`sppd_month` <= `b`.`budget_month`) and (`x`.`sppd_work_unit_uuid` = `c`.`work_unit_uuid`))) AS `sppd` from ((`trx_work_programs` `a` join `trx_budgets` `b` on((`a`.`work_program_uuid` = `b`.`budget_work_program_uuid`))) join `mst_work_units` `c` on(((`a`.`work_program_work_unit_uuid` = `c`.`work_unit_uuid`) and (`c`.`work_unit_log_uuid` is null)))) where (length(`a`.`work_program_code`) = 6) group by `c`.`work_unit_id`,`c`.`work_unit_code`,`c`.`work_unit_name`,`c`.`work_unit_sort`,`b`.`budget_year`,`b`.`budget_month`) select `aa`.`work_unit_id` AS `work_unit_id`,`aa`.`work_unit_code` AS `work_unit_code`,`aa`.`work_unit_name` AS `work_unit_name`,`aa`.`work_unit_sort` AS `work_unit_sort`,`aa`.`budget_year` AS `budget_year`,`aa`.`budget_month` AS `budget_month`,`aa`.`plafon` AS `plafon`,`aa`.`plafon_format` AS `plafon_format`,`aa`.`realisasi_format` AS `realisasi_format`,`aa`.`realisasi` AS `realisasi`,`aa`.`presentasi_realisasi` AS `presentasi_realisasi`,`aa`.`total_fund` AS `total_fund`,`aa`.`target` AS `target`,format(`aa`.`target`,0,'id_ID') AS `target_format`,round(((`aa`.`target` / `aa`.`plafon`) * 100),2) AS `persen_target`,`aa`.`sppd` AS `sppd`,format(`aa`.`sppd`,0,'id_ID') AS `sppd_format`,abs((`aa`.`sppd` - `aa`.`realisasi`)) AS `deviasi`,format(abs((`aa`.`sppd` - `aa`.`realisasi`)),0,'id_ID') AS `deviasi_format`,round(((`aa`.`target` / `aa`.`sppd`) * 100),2) AS `persen_realisasi_target`,round(((`aa`.`sppd` / `aa`.`plafon`) * 100),2) AS `persen_realisasi_pagu`,(`aa`.`plafon` - `aa`.`realisasi`) AS `sisa_anggaran_spm`,format((`aa`.`plafon` - `aa`.`realisasi`),0,'id_ID') AS `sisa_anggaran_spm_format`,(`aa`.`plafon` - `aa`.`sppd`) AS `sisa_anggaran_sp2d`,format((`aa`.`plafon` - `aa`.`sppd`),0,'id_ID') AS `sisa_anggaran_sp2d_format` from `datas` `aa`;

-- ----------------------------
-- View structure for view_data_realisasi_item_sppd
-- ----------------------------
DROP VIEW IF EXISTS `view_data_realisasi_item_sppd`;
CREATE VIEW `view_data_realisasi_item_sppd` AS with `data_item_target` as (select (select ifnull(sum(`trx_budgets`.`budget_plafon`),0) from `trx_budgets` where ((`trx_budgets`.`budget_year` = year(now())) and (`trx_budgets`.`budget_month` = 1))) AS `plafon`,((ifnull(sum(`trx_sppd`.`sppd_pegawai`),0) + ifnull(sum(`trx_sppd`.`sppd_barang`),0)) + ifnull(sum(`trx_sppd`.`sppd_modal`),0)) AS `sppd`,cast(now() as date) AS `tanggal_target` from `trx_sppd` where ((`trx_sppd`.`sppd_status` = 1) and (`trx_sppd`.`sppd_log_uuid` is null) and (`trx_sppd`.`sppd_year` = year(now())) and (`trx_sppd`.`sppd_month` <= month(now())))) select `data_item_target`.`plafon` AS `plafon`,`data_item_target`.`sppd` AS `sppd`,`data_item_target`.`tanggal_target` AS `tanggal_target`,ifnull(round(((`data_item_target`.`sppd` / `data_item_target`.`plafon`) * 100),2),0) AS `persen_sppd` from `data_item_target`;

-- ----------------------------
-- View structure for view_data_realisasi_item_target
-- ----------------------------
DROP VIEW IF EXISTS `view_data_realisasi_item_target`;
CREATE VIEW `view_data_realisasi_item_target` AS with `data_item_target` as (select (select ifnull(sum(`trx_budgets`.`budget_plafon`),0) from `trx_budgets` where ((`trx_budgets`.`budget_year` = year(now())) and (`trx_budgets`.`budget_month` = 1))) AS `plafon`,ifnull(sum(`trx_target`.`target_value`),0) AS `target`,last_day(now()) AS `tanggal_target` from `trx_target` where ((`trx_target`.`target_status` = 1) and (`trx_target`.`target_log_uuid` is null) and (`trx_target`.`target_year` = year(now())) and (`trx_target`.`target_month` <= month(now())))) select `data_item_target`.`plafon` AS `plafon`,`data_item_target`.`target` AS `target`,`data_item_target`.`tanggal_target` AS `tanggal_target`,ifnull(round(((`data_item_target`.`target` / `data_item_target`.`plafon`) * 100),2),0) AS `persen_target` from `data_item_target`;

-- ----------------------------
-- View structure for view_per_biro_setjen
-- ----------------------------
DROP VIEW IF EXISTS `view_per_biro_setjen`;
CREATE VIEW `view_per_biro_setjen` AS with recursive `datas` as (select `a`.`work_program_id` AS `work_program_id`,`a`.`work_program_uuid` AS `work_program_uuid`,`a`.`work_program_parent_uuid` AS `work_program_parent_uuid`,`a`.`work_program_code` AS `work_program_code`,`a`.`work_program_name` AS `work_program_name`,`a`.`work_program_year` AS `work_program_year`,1 AS `work_program_level`,cast('' as char(4000) charset utf8mb4) AS `tabs`,cast(concat('',`a`.`work_program_uuid`) as char(4000) charset utf8mb4) AS `hirarki` from `trx_work_programs` `a` where (`a`.`work_program_parent_uuid` = '0') union all select `a`.`work_program_id` AS `work_program_id`,`a`.`work_program_uuid` AS `work_program_uuid`,`a`.`work_program_parent_uuid` AS `work_program_parent_uuid`,`a`.`work_program_code` AS `work_program_code`,`a`.`work_program_name` AS `work_program_name`,`a`.`work_program_year` AS `work_program_year`,(`b`.`work_program_level` + 1) AS `work_program_level`,concat(`b`.`tabs`,'___') AS `tabs`,concat(`b`.`hirarki`,'::',cast(`b`.`work_unit_sort` as char(10) charset utf8mb4),'::',convert(`a`.`work_program_code` using utf8mb4),'::',convert(`a`.`work_program_uuid` using utf8mb4)) AS `hirarki` from ((`trx_work_programs` `a` join `datas` `b` on((`a`.`work_program_parent_uuid` = `b`.`work_program_uuid`))) join `mst_work_units` `b` on((`a`.`work_program_work_unit_uuid` = `b`.`work_unit_uuid`)))) select concat(`aa`.`tabs`,'',convert(`aa`.`work_program_name` using utf8mb4)) AS `work_program_name_tabs`,`bb`.`budget_plafon` AS `budget_plafon`,format(abs(`bb`.`budget_plafon`),0,'id_ID') AS `budget_plafon_format`,`bb`.`budget_realization` AS `budget_realization`,format(abs(`bb`.`budget_realization`),0,'id_ID') AS `budget_realization_format`,`bb`.`budget_year` AS `budget_year`,`bb`.`budget_month` AS `budget_month`,`aa`.`work_program_id` AS `work_program_id`,`aa`.`work_program_uuid` AS `work_program_uuid`,`aa`.`work_program_parent_uuid` AS `work_program_parent_uuid`,`aa`.`work_program_code` AS `work_program_code`,`aa`.`work_program_name` AS `work_program_name`,`aa`.`work_program_year` AS `work_program_year`,`aa`.`work_program_level` AS `work_program_level`,`aa`.`tabs` AS `tabs`,`aa`.`hirarki` AS `hirarki` from (`datas` `aa` left join `trx_budgets` `bb` on(((`aa`.`work_program_uuid` = `bb`.`budget_work_program_uuid`) and (`bb`.`budget_log_uuid` is null) and (`aa`.`work_program_year` = `bb`.`budget_year`) and (`bb`.`budget_month` = (select max(`xx`.`budget_month`) from `trx_budgets` `xx` where ((`xx`.`budget_year` = `bb`.`budget_year`) and (`xx`.`budget_work_program_uuid` = `bb`.`budget_work_program_uuid`) and (`xx`.`budget_log_uuid` is null))))))) order by `aa`.`hirarki`;

-- ----------------------------
-- View structure for view_periode_revisi
-- ----------------------------
DROP VIEW IF EXISTS `view_periode_revisi`;
CREATE VIEW `view_periode_revisi` AS select `aa`.`dashboard_realisasi_uuid` AS `dashboard_realisasi_uuid`,`aa`.`dashboard_realisasi_year` AS `dashboard_realisasi_year`,concat(`aa`.`dashboard_realisasi_revision_name`,convert((case when (`aa`.`dashboard_realisasi_revision_name` <> 'PAGU AWAL') then concat(' ',`aa`.`dashboard_realisasi_version`) else '' end) using utf8mb3)) AS `jenis_revisi`,`aa`.`dashboard_realisasi_create_date` AS `dashboard_realisasi_create_date` from `trx_dashboard_realisasi` `aa` group by `aa`.`dashboard_realisasi_uuid`,`aa`.`dashboard_realisasi_revision_name`,`aa`.`dashboard_realisasi_version`,`aa`.`dashboard_realisasi_year`,`aa`.`dashboard_realisasi_create_date`;

-- ----------------------------
-- View structure for view_realisasi_by_unit
-- ----------------------------
DROP VIEW IF EXISTS `view_realisasi_by_unit`;
CREATE VIEW `view_realisasi_by_unit` AS select `aa`.`work_program_year` AS `work_program_year`,`bb`.`work_unit_id` AS `work_unit_id`,`bb`.`work_unit_uuid` AS `work_unit_uuid`,`bb`.`work_unit_code` AS `work_unit_code`,`bb`.`work_unit_name` AS `work_unit_name`,sum(`cc`.`budget_realization`) AS `budget_realization` from ((`trx_work_programs` `aa` join `mst_work_units` `bb` on((`aa`.`work_program_work_unit_uuid` = `bb`.`work_unit_uuid`))) left join `trx_budgets` `cc` on(((`aa`.`work_program_uuid` = `cc`.`budget_work_program_uuid`) and (`cc`.`budget_year` = `aa`.`work_program_year`) and (`cc`.`budget_status` = 1) and (`cc`.`budget_log_uuid` is null) and (`cc`.`budget_month` = (select max(`xx`.`budget_month`) from `trx_budgets` `xx` where ((`xx`.`budget_year` = `cc`.`budget_year`) and (`xx`.`budget_work_program_uuid` = `cc`.`budget_work_program_uuid`) and (`xx`.`budget_log_uuid` is null))))))) where (`bb`.`work_unit_id` > 1) group by `bb`.`work_unit_id`,`bb`.`work_unit_code`,`bb`.`work_unit_name`,`aa`.`work_program_year`;

-- ----------------------------
-- View structure for view_sys_users
-- ----------------------------
DROP VIEW IF EXISTS `view_sys_users`;
CREATE VIEW `view_sys_users` AS select `aa`.`user_id` AS `user_id`,`aa`.`user_uuid` AS `user_uuid`,`aa`.`user_fullname` AS `user_fullname`,`aa`.`user_name` AS `user_name`,`aa`.`user_password` AS `user_password`,`aa`.`user_create_by` AS `user_create_by`,`aa`.`user_create_date` AS `user_create_date`,`aa`.`user_update_by` AS `user_update_by`,`aa`.`user_update_date` AS `user_update_date`,`aa`.`user_log_uuid` AS `user_log_uuid`,`aa`.`user_status` AS `user_status`,`aa`.`user_access_uuid` AS `user_access_uuid`,`bb`.`access_id` AS `access_id`,`bb`.`access_uuid` AS `access_uuid`,`bb`.`access_name` AS `access_name`,`bb`.`access_is_admin` AS `access_is_admin`,`bb`.`access_create_by` AS `access_create_by`,`bb`.`access_create_date` AS `access_create_date`,`bb`.`access_update_by` AS `access_update_by`,`bb`.`access_update_date` AS `access_update_date`,`bb`.`access_log_uuid` AS `access_log_uuid`,`bb`.`access_status` AS `access_status`,(case when (`aa`.`user_status` = 1) then 'Aktif' else 'Tidak Aktif' end) AS `user_status_name` from (`sys_users` `aa` join `sys_access` `bb` on(((`aa`.`user_access_uuid` = `bb`.`access_uuid`) and (`bb`.`access_status` = 1) and (`bb`.`access_log_uuid` is null)))) where ((`aa`.`user_status` = 1) and (`aa`.`user_log_uuid` is null));

-- ----------------------------
-- View structure for view_trx_budgets
-- ----------------------------
DROP VIEW IF EXISTS `view_trx_budgets`;
CREATE VIEW `view_trx_budgets` AS select `aa`.`budget_id` AS `budget_id`,`aa`.`budget_uuid` AS `budget_uuid`,`aa`.`budget_year` AS `budget_year`,`aa`.`budget_month` AS `budget_month`,`aa`.`budget_work_program_uuid` AS `budget_work_program_uuid`,`aa`.`budget_plafon` AS `budget_plafon`,`aa`.`budget_realization` AS `budget_realization`,`aa`.`budget_create_by` AS `budget_create_by`,`aa`.`budget_create_date` AS `budget_create_date`,`aa`.`budget_status` AS `budget_status`,`aa`.`budget_log_uuid` AS `budget_log_uuid`,`bb`.`work_program_id` AS `work_program_id`,`bb`.`work_program_uuid` AS `work_program_uuid`,`bb`.`work_program_parent_uuid` AS `work_program_parent_uuid`,`bb`.`work_program_year` AS `work_program_year`,`bb`.`work_program_work_unit_uuid` AS `work_program_work_unit_uuid`,`bb`.`work_program_code` AS `work_program_code`,`bb`.`work_program_name` AS `work_program_name`,`bb`.`work_program_is_last_child` AS `work_program_is_last_child`,`bb`.`work_program_description` AS `work_program_description`,`bb`.`work_program_create_by` AS `work_program_create_by`,`bb`.`work_program_create_date` AS `work_program_create_date`,`bb`.`work_program_update_by` AS `work_program_update_by`,`bb`.`work_program_update_date` AS `work_program_update_date`,`bb`.`work_program_log_uuid` AS `work_program_log_uuid`,`bb`.`work_program_status` AS `work_program_status` from (`trx_budgets` `aa` join `trx_work_programs` `bb` on(((`aa`.`budget_work_program_uuid` = `bb`.`work_program_uuid`) and (`bb`.`work_program_status` = 1) and (`bb`.`work_program_log_uuid` is null)))) where ((`aa`.`budget_status` = 1) and (`aa`.`budget_log_uuid` is null));

-- ----------------------------
-- View structure for view_trx_dashboard_realisasi
-- ----------------------------
DROP VIEW IF EXISTS `view_trx_dashboard_realisasi`;
CREATE VIEW `view_trx_dashboard_realisasi` AS select `aa`.`dashboard_realisasi_id` AS `dashboard_realisasi_id`,`aa`.`dashboard_realisasi_uuid` AS `dashboard_realisasi_uuid`,`aa`.`dashboard_realisasi_year` AS `dashboard_realisasi_year`,(case when (`aa`.`dashboard_realisasi_version` <> 'Pagu Awal') then concat(`aa`.`dashboard_realisasi_revision_name`,' ',`aa`.`dashboard_realisasi_version`) else `aa`.`dashboard_realisasi_revision_name` end) AS `dashboard_realisasi_revision_name`,`aa`.`dashboard_realisasi_pegawai` AS `dashboard_realisasi_pegawai`,format(`aa`.`dashboard_realisasi_pegawai`,0,'id_ID') AS `dashboard_realisasi_pegawai_format`,`aa`.`dashboard_realisasi_barang` AS `dashboard_realisasi_barang`,format(`aa`.`dashboard_realisasi_barang`,0,'id_ID') AS `dashboard_realisasi_barang_format`,`aa`.`dashboard_realisasi_total_belanja` AS `dashboard_realisasi_total_belanja`,format(`aa`.`dashboard_realisasi_total_belanja`,0,'id_ID') AS `dashboard_realisasi_total_belanja_format`,`aa`.`dashboard_realisasi_modal` AS `dashboard_realisasi_modal`,format(`aa`.`dashboard_realisasi_modal`,0,'id_ID') AS `dashboard_realisasi_modal_format`,((`aa`.`dashboard_realisasi_pegawai` + `aa`.`dashboard_realisasi_barang`) + `aa`.`dashboard_realisasi_modal`) AS `dashboard_realisasi_total`,`aa`.`dashboard_realisasi_version` AS `dashboard_realisasi_version`,`aa`.`dashboard_realisasi_create_by` AS `dashboard_realisasi_create_by`,`aa`.`dashboard_realisasi_create_date` AS `dashboard_realisasi_create_date`,`aa`.`dashboard_realisasi_status` AS `dashboard_realisasi_status`,`aa`.`dashboard_realisasi_log_uuid` AS `dashboard_realisasi_log_uuid`,`bb`.`user_fullname` AS `dashboard_realisasi_create_by_name` from (`trx_dashboard_realisasi` `aa` left join `sys_users` `bb` on((`aa`.`dashboard_realisasi_create_by` = `bb`.`user_uuid`)));

-- ----------------------------
-- View structure for view_trx_indikator_kinerja
-- ----------------------------
DROP VIEW IF EXISTS `view_trx_indikator_kinerja`;
CREATE VIEW `view_trx_indikator_kinerja` AS select `aa`.`indikator_kinerja_id` AS `indikator_kinerja_id`,`aa`.`indikator_kinerja_uuid` AS `indikator_kinerja_uuid`,`aa`.`indikator_kinerja_sasaran_strategis_uuid` AS `indikator_kinerja_sasaran_strategis_uuid`,`aa`.`indikator_kinerja_biro_uuid` AS `indikator_kinerja_biro_uuid`,`aa`.`indikator_kinerja_sort` AS `indikator_kinerja_sort`,`aa`.`indikator_kinerja_name` AS `indikator_kinerja_name`,`aa`.`indikator_kinerja_satuan` AS `indikator_kinerja_satuan`,`aa`.`indikator_kinerja_target` AS `indikator_kinerja_target`,`aa`.`indikator_kinerja_realisasi` AS `indikator_kinerja_realisasi`,round(((`aa`.`indikator_kinerja_realisasi` / `aa`.`indikator_kinerja_target`) * 100),2) AS `indikator_kinerja_persen_capaian`,0 AS `indikator_kinerja_persen_anggaran`,`aa`.`indikator_kinerja_create_by` AS `indikator_kinerja_create_by`,`aa`.`indikator_kinerja_create_date` AS `indikator_kinerja_create_date`,`aa`.`indikator_kinerja_status` AS `indikator_kinerja_status`,`aa`.`indikator_kinerja_log_uuid` AS `indikator_kinerja_log_uuid`,`cc`.`sasaran_strategis_year` AS `sasaran_strategis_year`,`cc`.`sasaran_strategis_name` AS `sasaran_strategis_name`,`cc`.`sasaran_strategis_sort` AS `sasaran_strategis_sort`,`bb`.`user_fullname` AS `indikator_kinerja_create_by_name`,concat(`aa`.`indikator_kinerja_sort`,':',`cc`.`sasaran_strategis_sort`) AS `sorting` from ((`trx_indikator_kinerja` `aa` left join `sys_users` `bb` on((`aa`.`indikator_kinerja_create_by` = `bb`.`user_uuid`))) left join `trx_sasaran_strategis` `cc` on(((`aa`.`indikator_kinerja_sasaran_strategis_uuid` = `cc`.`sasaran_strategis_uuid`) and (`cc`.`sasaran_strategis_log_uuid` is null))));

-- ----------------------------
-- View structure for view_trx_program_apk
-- ----------------------------
DROP VIEW IF EXISTS `view_trx_program_apk`;
CREATE VIEW `view_trx_program_apk` AS select `aa`.`program_apk_id` AS `program_apk_id`,`aa`.`program_apk_uuid` AS `program_apk_uuid`,`aa`.`program_apk_apk_uuid` AS `program_apk_apk_uuid`,`aa`.`program_apk_year` AS `program_apk_year`,`aa`.`program_apk_month` AS `program_apk_month`,`aa`.`program_apk_urian` AS `program_apk_urian`,`aa`.`program_apk_pagu` AS `program_apk_pagu`,format(`aa`.`program_apk_pagu`,0,'id_ID') AS `program_apk_pagu_format`,`aa`.`program_apk_realisasi` AS `program_apk_realisasi`,format(`aa`.`program_apk_realisasi`,0,'id_ID') AS `program_apk_realisasi_format`,`aa`.`program_apk_create_by` AS `program_apk_create_by`,`aa`.`program_apk_create_date` AS `program_apk_create_date`,`aa`.`program_apk_status` AS `program_apk_status`,`aa`.`program_apk_log_uuid` AS `program_apk_log_uuid`,`bb`.`apk_id` AS `apk_id`,`bb`.`apk_uuid` AS `apk_uuid`,`bb`.`apk_year` AS `apk_year`,`bb`.`apk_name` AS `apk_name`,`bb`.`apk_sort` AS `apk_sort`,`bb`.`apk_create_by` AS `apk_create_by`,`bb`.`apk_create_date` AS `apk_create_date`,`bb`.`apk_status` AS `apk_status`,`bb`.`apk_log_uuid` AS `apk_log_uuid` from (`trx_program_apk` `aa` join `trx_apk` `bb` on((`aa`.`program_apk_apk_uuid` = `bb`.`apk_uuid`))) where ((`aa`.`program_apk_log_uuid` is null) and (`aa`.`program_apk_status` = 1));

-- ----------------------------
-- View structure for view_trx_realisasi_apk
-- ----------------------------
DROP VIEW IF EXISTS `view_trx_realisasi_apk`;
CREATE VIEW `view_trx_realisasi_apk` AS select `aa`.`realisasi_apk_id` AS `realisasi_apk_id`,`aa`.`realisasi_apk_uuid` AS `realisasi_apk_uuid`,`aa`.`realisasi_apk_apk_uuid` AS `realisasi_apk_apk_uuid`,`aa`.`realisasi_apk_year` AS `realisasi_apk_year`,`aa`.`realisasi_apk_month` AS `realisasi_apk_month`,`aa`.`realisasi_apk_urian` AS `realisasi_apk_urian`,`aa`.`realisasi_apk_pagu` AS `realisasi_apk_pagu`,format(`aa`.`realisasi_apk_pagu`,0,'id_ID') AS `realisasi_apk_pagu_format`,`aa`.`realisasi_apk_realisasi` AS `realisasi_apk_realisasi`,format(`aa`.`realisasi_apk_realisasi`,0,'id_ID') AS `realisasi_apk_realisasi_format`,`aa`.`realisasi_apk_create_by` AS `realisasi_apk_create_by`,`aa`.`realisasi_apk_create_date` AS `realisasi_apk_create_date`,`aa`.`realisasi_apk_status` AS `realisasi_apk_status`,`aa`.`realisasi_apk_log_uuid` AS `realisasi_apk_log_uuid`,`bb`.`apk_id` AS `apk_id`,`bb`.`apk_uuid` AS `apk_uuid`,`bb`.`apk_year` AS `apk_year`,`bb`.`apk_name` AS `apk_name`,`bb`.`apk_sort` AS `apk_sort`,`bb`.`apk_create_by` AS `apk_create_by`,`bb`.`apk_create_date` AS `apk_create_date`,`bb`.`apk_status` AS `apk_status`,`bb`.`apk_log_uuid` AS `apk_log_uuid` from (`trx_realisasi_apk` `aa` join `trx_apk` `bb` on((`aa`.`realisasi_apk_apk_uuid` = `bb`.`apk_uuid`))) where ((`aa`.`realisasi_apk_log_uuid` is null) and (`aa`.`realisasi_apk_status` = 1));

-- ----------------------------
-- View structure for view_trx_sasaran_strategis
-- ----------------------------
DROP VIEW IF EXISTS `view_trx_sasaran_strategis`;
CREATE VIEW `view_trx_sasaran_strategis` AS select `aa`.`sasaran_strategis_id` AS `sasaran_strategis_id`,`aa`.`sasaran_strategis_uuid` AS `sasaran_strategis_uuid`,`aa`.`sasaran_strategis_year` AS `sasaran_strategis_year`,`aa`.`sasaran_strategis_name` AS `sasaran_strategis_name`,`aa`.`sasaran_strategis_sort` AS `sasaran_strategis_sort`,`aa`.`sasaran_strategis_create_by` AS `sasaran_strategis_create_by`,`aa`.`sasaran_strategis_create_date` AS `sasaran_strategis_create_date`,`aa`.`sasaran_strategis_status` AS `sasaran_strategis_status`,`aa`.`sasaran_strategis_log_uuid` AS `sasaran_strategis_log_uuid`,`bb`.`user_fullname` AS `sasaran_strategis_create_by_name` from (`trx_sasaran_strategis` `aa` left join `sys_users` `bb` on((`aa`.`sasaran_strategis_create_by` = `bb`.`user_uuid`)));

-- ----------------------------
-- View structure for view_trx_target
-- ----------------------------
DROP VIEW IF EXISTS `view_trx_target`;
CREATE VIEW `view_trx_target` AS with `aa` as (select `aa`.`target_id` AS `target_id`,`aa`.`target_uuid` AS `target_uuid`,`aa`.`target_work_unit_uuid` AS `target_work_unit_uuid`,`aa`.`target_year` AS `target_year`,`aa`.`target_month` AS `target_month`,`aa`.`target_value` AS `target_value`,`aa`.`target_value_percent` AS `target_value_percent`,`aa`.`target_value_percent_1` AS `target_value_percent_1`,`aa`.`target_value_percent_2` AS `target_value_percent_2`,`aa`.`target_value_percent_3` AS `target_value_percent_3`,`aa`.`target_value_percent_4` AS `target_value_percent_4`,`aa`.`target_value_percent_5` AS `target_value_percent_5`,`aa`.`target_value_percent_6` AS `target_value_percent_6`,`aa`.`target_value_percent_7` AS `target_value_percent_7`,`aa`.`target_value_percent_8` AS `target_value_percent_8`,`aa`.`target_value_percent_9` AS `target_value_percent_9`,`aa`.`target_value_percent_10` AS `target_value_percent_10`,`aa`.`target_value_percent_11` AS `target_value_percent_11`,`aa`.`target_value_percent_12` AS `target_value_percent_12`,`aa`.`target_create_by` AS `target_create_by`,`aa`.`target_create_date` AS `target_create_date`,`aa`.`target_status` AS `target_status`,`aa`.`target_log_uuid` AS `target_log_uuid`,`bb`.`work_unit_id` AS `work_unit_id`,`bb`.`work_unit_code` AS `work_unit_code`,`bb`.`work_unit_name` AS `work_unit_name`,`bb`.`work_unit_sort` AS `work_unit_sort` from (`trx_target` `aa` left join `mst_work_units` `bb` on(((`aa`.`target_work_unit_uuid` = `bb`.`work_unit_uuid`) and (`bb`.`work_unit_log_uuid` is null))))) select `aa`.`target_id` AS `target_id`,`aa`.`target_uuid` AS `target_uuid`,`aa`.`target_work_unit_uuid` AS `target_work_unit_uuid`,`aa`.`target_year` AS `target_year`,`aa`.`target_month` AS `target_month`,`aa`.`target_value` AS `target_value`,`aa`.`target_value_percent` AS `target_value_percent`,`aa`.`target_value_percent_1` AS `target_value_percent_1`,`aa`.`target_value_percent_2` AS `target_value_percent_2`,`aa`.`target_value_percent_3` AS `target_value_percent_3`,`aa`.`target_value_percent_4` AS `target_value_percent_4`,`aa`.`target_value_percent_5` AS `target_value_percent_5`,`aa`.`target_value_percent_6` AS `target_value_percent_6`,`aa`.`target_value_percent_7` AS `target_value_percent_7`,`aa`.`target_value_percent_8` AS `target_value_percent_8`,`aa`.`target_value_percent_9` AS `target_value_percent_9`,`aa`.`target_value_percent_10` AS `target_value_percent_10`,`aa`.`target_value_percent_11` AS `target_value_percent_11`,`aa`.`target_value_percent_12` AS `target_value_percent_12`,round((`bb`.`budget_realization` * (`aa`.`target_value_percent_1` / 100)),0) AS `target_value_1`,round((`bb`.`budget_realization` * (`aa`.`target_value_percent_2` / 100)),0) AS `target_value_2`,round((`bb`.`budget_realization` * (`aa`.`target_value_percent_3` / 100)),0) AS `target_value_3`,round((`bb`.`budget_realization` * (`aa`.`target_value_percent_4` / 100)),0) AS `target_value_4`,round((`bb`.`budget_realization` * (`aa`.`target_value_percent_5` / 100)),0) AS `target_value_5`,round((`bb`.`budget_realization` * (`aa`.`target_value_percent_6` / 100)),0) AS `target_value_6`,round((`bb`.`budget_realization` * (`aa`.`target_value_percent_7` / 100)),0) AS `target_value_7`,round((`bb`.`budget_realization` * (`aa`.`target_value_percent_8` / 100)),0) AS `target_value_8`,round((`bb`.`budget_realization` * (`aa`.`target_value_percent_9` / 100)),0) AS `target_value_9`,round((`bb`.`budget_realization` * (`aa`.`target_value_percent_10` / 100)),0) AS `target_value_10`,round((`bb`.`budget_realization` * (`aa`.`target_value_percent_11` / 100)),0) AS `target_value_11`,round((`bb`.`budget_realization` * (`aa`.`target_value_percent_12` / 100)),0) AS `target_value_12`,`aa`.`target_create_by` AS `target_create_by`,`aa`.`target_create_date` AS `target_create_date`,`aa`.`target_status` AS `target_status`,`aa`.`target_log_uuid` AS `target_log_uuid`,`aa`.`work_unit_id` AS `work_unit_id`,`aa`.`work_unit_code` AS `work_unit_code`,`aa`.`work_unit_name` AS `work_unit_name`,`aa`.`work_unit_sort` AS `work_unit_sort`,`bb`.`budget_realization` AS `budget_realization` from (`aa` left join `view_realisasi_by_unit` `bb` on(((`aa`.`target_year` = `bb`.`work_program_year`) and (`aa`.`target_work_unit_uuid` = `bb`.`work_unit_uuid`))));

-- ----------------------------
-- View structure for view_trx_upload
-- ----------------------------
DROP VIEW IF EXISTS `view_trx_upload`;
CREATE VIEW `view_trx_upload` AS select `trx_upload`.`upload_id` AS `upload_id`,`trx_upload`.`upload_uuid` AS `upload_uuid`,`trx_upload`.`upload_year` AS `upload_year`,`trx_upload`.`upload_type` AS `upload_type`,`trx_upload`.`upload_file_path` AS `upload_file_path`,`trx_upload`.`upload_create_by` AS `upload_create_by`,`trx_upload`.`upload_create_date` AS `upload_create_date`,`trx_upload`.`upload_status` AS `upload_status`,`trx_upload`.`upload_log_uuid` AS `upload_log_uuid`,`trx_upload`.`upload_month` AS `upload_month`,(case when (`trx_upload`.`upload_type` = 1) then 'Data Inisiasi' else 'Data Realisasi' end) AS `upload_type_name` from `trx_upload`;

-- ----------------------------
-- View structure for view_work_program_parent
-- ----------------------------
DROP VIEW IF EXISTS `view_work_program_parent`;
CREATE VIEW `view_work_program_parent` AS select `aa`.`work_program_id` AS `work_program_id`,`aa`.`work_program_uuid` AS `work_program_uuid`,`aa`.`work_program_parent_uuid` AS `work_program_parent_uuid`,`aa`.`work_program_year` AS `work_program_year`,`aa`.`work_program_work_unit_uuid` AS `work_program_work_unit_uuid`,`aa`.`work_program_code` AS `work_program_code`,`aa`.`work_program_name` AS `work_program_name`,`aa`.`work_program_is_last_child` AS `work_program_is_last_child`,`aa`.`work_program_description` AS `work_program_description`,`aa`.`work_program_create_by` AS `work_program_create_by`,`aa`.`work_program_create_date` AS `work_program_create_date`,`aa`.`work_program_update_by` AS `work_program_update_by`,`aa`.`work_program_update_date` AS `work_program_update_date`,`aa`.`work_program_log_uuid` AS `work_program_log_uuid`,`aa`.`work_program_status` AS `work_program_status`,`bb`.`work_program_code` AS `work_program_parent_code`,`bb`.`work_program_name` AS `work_program_parent_name` from (`trx_work_programs` `aa` left join `trx_work_programs` `bb` on(((`aa`.`work_program_parent_uuid` = `bb`.`work_program_uuid`) and (`bb`.`work_program_status` = 1) and (`bb`.`work_program_log_uuid` is null)))) where ((`aa`.`work_program_status` = 1) and (`aa`.`work_program_log_uuid` is null));

-- ----------------------------
-- Procedure structure for get_data_anggaran_by_periode
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_data_anggaran_by_periode`;
delimiter ;;
CREATE PROCEDURE `get_data_anggaran_by_periode`( tahun INT, bulan INT )
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
CREATE PROCEDURE `get_data_apk_perbiro_by_periode`( tahun INT, bulan INT)
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
CREATE PROCEDURE `get_data_capaian_kinerja_by_periode`( tahun INT)
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
CREATE PROCEDURE `get_data_dashboard_realisasi_anggaran`( tahun INT)
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
CREATE PROCEDURE `get_data_detail_perbiro_by_periode`( tahun INT, bulan INT, jenis INT )
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
CREATE PROCEDURE `get_data_detail_perbiro_setjen_by_periode`( tahun INT, bulan INT )
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
CREATE FUNCTION `number_to_alphabet`(num INT) RETURNS varchar(255) CHARSET utf8mb3
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
