<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class Trx_dashboard_realisasi extends Model
{
    protected $table        = 'trx_dashboard_realisasi';
    protected $primaryKey   = 'dashboard_realisasi_id';
    protected $fillable     = [ 'dashboard_realisasi_id', 'dashboard_realisasi_uuid', 'dashboard_realisasi_year', 'dashboard_realisasi_revision_name', 'dashboard_realisasi_pegawai', 'dashboard_realisasi_barang', 'dashboard_realisasi_modal', 'dashboard_realisasi_version', 'dashboard_realisasi_create_by', 'dashboard_realisasi_create_date', 'dashboard_realisasi_status', 'dashboard_realisasi_log_uuid','dashboard_realisasi_total_belanja'];
    const UPDATED_AT        = null;
    const CREATED_AT        = null;
}