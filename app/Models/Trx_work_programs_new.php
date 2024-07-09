<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class Trx_work_programs_new extends Model
{
    protected $table        = 'trx_work_programs_new';
    protected $primaryKey   = 'work_program_id';
    protected $fillable = ['work_program_year'];
    // protected $fillable     = ['work_program_uuid', 'work_program_year', 'work_program_code', 'work_program_name', 'work_program_create_by', 'work_program_create_date', 'work_program_log_uuid', 'work_program_status'];
    const UPDATED_AT        = null;
    const CREATED_AT        = null;
}

