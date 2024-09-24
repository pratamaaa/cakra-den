<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class Trx_upload_belanja extends Model
{
    protected $table        = 'trx_upload_belanja';
    protected $primaryKey   = 'upload_belanja_id';
    protected $fillable     = ['upload_belanja_id', 'upload_belanja_uuid', 'upload_belanja_year', 'upload_belanja_month', 'upload_belanja_nama', 'upload_belanja_spd_pagu', 'upload_belanja_spd_realisasi', 'upload_belanja_spd_persentase_realisasi', 'upload_belanja_spd_total', 'upload_belanja_spm_pagu', 'upload_belanja_spm_realisasi', 'upload_belanja_spm_persentase_realisasi', 'upload_belanja_spm_total', 'upload_belanja_create_by', 'upload_belanja_create_date', 'upload_belanja_status', 'upload_belanja_log_uuid'];
    
    const UPDATED_AT        = null;
    const CREATED_AT        = null;
}

