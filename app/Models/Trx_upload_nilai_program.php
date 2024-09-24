<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class Trx_upload_nilai_program extends Model
{
    protected $table        = 'trx_upload_nilai_program';
    protected $primaryKey   = 'upload_nilai_program_id';
    protected $fillable     = ['upload_nilai_program_id', 'upload_nilai_program_uuid', 'upload_nilai_program_year', 'upload_nilai_program_month', 'upload_nilai_program_work_program_uuid', 'upload_nilai_program_pagu', 'upload_nilai_program_realisasi', 'upload_nilai_program_sisa', 'upload_nilai_program_create_by', 'upload_nilai_program_create_date', 'upload_nilai_program_status', 'upload_nilai_program_log_uuid'];
    
    const UPDATED_AT        = null;
    const CREATED_AT        = null;
}

