<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class Sys_access_detail extends Model
{
    protected $table        = 'sys_access_detail';
    protected $primaryKey   = 'access_detail_id';

    const UPDATED_AT        = null;
    const CREATED_AT        = null;
}