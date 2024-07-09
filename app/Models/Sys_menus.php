<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class Sys_menus extends Model
{
    protected $table        = 'sys_menus';
    protected $primaryKey   = 'menu_id';

    const UPDATED_AT        = null;
    const CREATED_AT        = null;
}