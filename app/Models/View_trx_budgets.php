<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class View_trx_budgets extends Model
{
    protected $table        = 'view_trx_budgets';
    protected $primaryKey   = 'budget_id';
    
    const UPDATED_AT        = null;
    const CREATED_AT        = null;
}