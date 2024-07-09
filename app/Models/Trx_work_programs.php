<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class Trx_work_programs extends Model
{
    protected $table        = 'trx_work_programs';
    protected $primaryKey   = 'work_program_id';
    protected $fillable     = ['work_program_uuid', 'work_program_parent_uuid', 'work_program_year', 'work_program_work_unit_uuid', 'work_program_code', 'work_program_name', 'work_program_is_last_child', 'work_program_description', 'work_program_create_by', 'work_program_create_date', 'work_program_update_by', 'work_program_update_date', 'work_program_log_uuid', 'work_program_status'];
    // protected $fillable     = ['work_program_name'];
    
    const UPDATED_AT        = null;
    const CREATED_AT        = null;
}