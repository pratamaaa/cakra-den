<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class View_periode_revisi extends Model
{
    protected $table        = 'view_periode_revisi';
    protected $primaryKey   = 'work_program_id';

    const UPDATED_AT        = null;
    const CREATED_AT        = null;
}
