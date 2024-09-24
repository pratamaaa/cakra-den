<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class Trx_upload_work_program_dua extends Model
{
    protected $table        = 'trx_upload_work_program_dua';
    protected $primaryKey   = 'upload_work_program_id';
    protected $fillable     = ['upload_work_program_code', 'upload_work_program_name'];
    
    const UPDATED_AT        = null;
    const CREATED_AT        = null;
}

