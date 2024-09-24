<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class Trx_upload_paparan_program extends Model
{
    protected $table        = 'trx_upload_paparan_program';
    protected $primaryKey   = 'upload_paparan_program_id';
    protected $fillable     = ['upload_paparan_program_id', 'upload_paparan_program_uuid', 'upload_paparan_program_parent_uuid', 'upload_paparan_program_work_unit_uuid', 'upload_paparan_program_year', 'upload_paparan_program_month', 'upload_paparan_program_code', 'upload_paparan_program_name', 'upload_paparan_program_spd_pagu', 'upload_paparan_program_spd_realisasi', 'upload_paparan_program_spd_persen_realisasi', 'upload_paparan_program_spd_sisa', 'upload_paparan_program_spd_target', 'upload_paparan_program_spd_persen_target', 'upload_paparan_program_spd_deviasi', 'upload_paparan_program_spd_persen_deviasi', 'upload_paparan_program_spm_pagu', 'upload_paparan_program_spm_realisasi', 'upload_paparan_program_spm_persen_realisasi', 'upload_paparan_program_spm_sisa', 'upload_paparan_program_spm_target', 'upload_paparan_program_spm_persen_target', 'upload_paparan_program_spm_deviasi', 'upload_paparan_program_spm_persen_deviasi', 'upload_paparan_program_create_by', 'upload_paparan_program_create_date', 'upload_paparan_program_status', 'upload_paparan_program_log_uuid'];
    
    const UPDATED_AT        = null;
    const CREATED_AT        = null;
}

