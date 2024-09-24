<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class Trx_upload_work_program extends Model
{
    protected $table        = 'trx_upload_work_program';
    protected $primaryKey   = 'upload_work_program_id';
    protected $fillable     = ['upload_work_program_uuid','upload_work_program_parent_uuid','upload_work_program_work_unit_uuid', 'upload_work_program_year', 'upload_work_program_code', 'upload_work_program_name','upload_work_program_create_by','upload_work_program_create_date','upload_work_program_status'];
    
    const UPDATED_AT        = null;
    const CREATED_AT        = null;
}

