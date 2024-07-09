<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class Trx_target extends Model
{
    protected $table        = 'trx_target';
    protected $primaryKey   = 'target_id';
    protected $fillable     = ['target_id', 'target_uuid', 'target_work_unit_uuid', 'target_year', 'target_month', 'target_value', 'target_value_percent', 'target_value_percent_1', 'target_value_percent_2', 'target_value_percent_3', 'target_value_percent_4', 'target_value_percent_5', 'target_value_percent_6', 'target_value_percent_7', 'target_value_percent_8', 'target_value_percent_9', 'target_value_percent_10', 'target_value_percent_11', 'target_value_percent_12', 'target_create_by', 'target_create_date', 'target_status', 'target_log_uuid'];
    const UPDATED_AT        = null;
    const CREATED_AT        = null;
}