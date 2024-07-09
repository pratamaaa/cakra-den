<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class Trx_budgets extends Model
{
    protected $table        = 'trx_budgets';
    protected $primaryKey   = 'budget_id';
    protected $fillable     = ['budget_uuid', 'budget_work_program_uuid', 'budget_plafon', 'budget_realization', 'budget_create_by', 'budget_create_date', 'budget_status'];
    
    const UPDATED_AT        = null;
    const CREATED_AT        = null;
}