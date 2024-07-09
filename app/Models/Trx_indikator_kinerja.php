<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class Trx_indikator_kinerja extends Model
{
    protected $table        = 'trx_indikator_kinerja';
    protected $primaryKey   = 'indikator_kinerja_id';
    protected $fillable     = ['indikator_kinerja_id', 'indikator_kinerja_uuid', 'indikator_kinerja_sasaran_strategis_uuid', 'indikator_kinerja_biro_uuid', 'indikator_kinerja_sort', 'indikator_kinerja_name', 'indikator_kinerja_satuan', 'indikator_kinerja_target', 'indikator_kinerja_realisasi', 'indikator_kinerja_create_by', 'indikator_kinerja_create_date', 'indikator_kinerja_status', 'indikator_kinerja_log_uuid'];
    const UPDATED_AT        = null;
    const CREATED_AT        = null;
}