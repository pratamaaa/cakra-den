<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class View_sys_users extends Model
{
    protected $table        = 'view_sys_users';
    protected $primaryKey   = 'user_id';

    const UPDATED_AT        = null;
    const CREATED_AT        = null;
}