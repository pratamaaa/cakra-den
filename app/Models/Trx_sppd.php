<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class Trx_sppd extends Model
{
    protected $table        = 'trx_sppd';
    protected $primaryKey   = 'sppd_id';
    protected $fillable     = ['sppd_id', 'sppd_uuid', 'sppd_year', 'sppd_month', 'sppd_work_unit_uuid', 'sppd_pegawai', 'sppd_barang', 'sppd_modal', 'sppd_create_by', 'sppd_create_date', 'sppd_status'];
    
    const UPDATED_AT        = null;
    const CREATED_AT        = null;
}