<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class Trx_sasaran_strategis extends Model
{
    protected $table        = 'trx_sasaran_strategis';
    protected $primaryKey   = 'dashboard_realisasi_id';
    protected $fillable     = ['sasaran_strategis_id','sasaran_strategis_uuid','sasaran_strategis_year','sasaran_strategis_name','sasaran_strategis_sort','sasaran_strategis_create_by','sasaran_strategis_create_date','sasaran_strategis_status','sasaran_strategis_log_uuid'];
    const UPDATED_AT        = null;
    const CREATED_AT        = null;
}