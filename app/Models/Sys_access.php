<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class Sys_access extends Model
{
    protected $table        = 'sys_access';
    protected $primaryKey   = 'access_id';

    const UPDATED_AT        = null;
    const CREATED_AT        = null;
}