<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class Trx_upload_apk extends Model
{
    protected $table        = 'trx_upload_apk';
    protected $primaryKey   = 'upload_apk_id';
    protected $fillable     = ['upload_apk_id', 'upload_apk_uuid', 'upload_apk_year', 'upload_apk_month', 'upload_apk_nama', 'upload_apk_ket', 'upload_apk_pagu', 'upload_apk_realisasi', 'upload_apk_persentase_realisasi', 'upload_apk_sisa', 'upload_apk_create_by', 'upload_apk_create_date', 'upload_apk_status', 'upload_apk_log_uuid'];
    
    const UPDATED_AT        = null;
    const CREATED_AT        = null;
}

