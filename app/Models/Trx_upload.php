<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class Trx_upload extends Model
{
    protected $table        = 'trx_upload';
    protected $primaryKey   = 'upload_id';
    protected $fillable     = ['upload_id', 'upload_uuid', 'upload_type', 'upload_file_path', 'upload_create_by', 'upload_create_date', 'upload_status', 'upload_log_uuid'];
    
    const UPDATED_AT        = null;
    const CREATED_AT        = null;
}

