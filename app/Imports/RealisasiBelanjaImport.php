<?php

namespace App\Imports;

use App\Models\User;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithMultipleSheets;
use Maatwebsite\Excel\Concerns\WithCalculatedFormulas;
use Maatwebsite\Excel\Concerns\HasReferencesToOtherSheets;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\WithStartRow;
use App\Models\Trx_work_programs;
use Illuminate\Support\Facades\DB;
use App\Helpers\GlobalHelper;
use Illuminate\Support\Str;
use App\Models\Mst_work_units;
use App\Models\Trx_budgets;
use App\Models\Trx_sppd;


class RealisasiBelanjaImport implements WithMultipleSheets, ToCollection, WithStartRow, WithCalculatedFormulas, HasReferencesToOtherSheets
{
    private $year;
    private $month;
    private $document_type;

    public function __construct(int $year, int $month, $document_type)
    {
        $this->year = $year;
        $this->month = $month;
        $this->document_type = $document_type;
    }
    // public function headingRow(): int
    // {
    //     return 2;
    // }
    public function startRow(): int
    {
        return 6;
    }
    public function sheets(): array
    {
        return [
            //'PER BAGIAN' =>  $this
            6 => $this,
        ];
    }

    public function collection(Collection $rows)
    {
     

        Trx_sppd::query()->truncate();
        $create_date = date('Y-m-d H:i:s', time());
        $datarealisasi = [];
        $rowsidx = 0;
        foreach ($rows as $row) {
            $rowsidx++;
            if ($rowsidx < 10) {
                $sppd_year = $this->year;
                $sppd_month = $this->month;
                if ($rowsidx == 1) {
                    DB::beginTransaction();
                    $data_create = new Trx_sppd;
                    $sppd_work_unit_uuid = '261b373f-5a41-11ee-971e-f4a4757ae8c3';
                    $sppd_pegawai = trim($row[3]);
                    
                    $sppd_pegawai = (($sppd_pegawai == '') ? 0 : $sppd_pegawai * 1);
                   
                    $sppd_barang = trim($row[7]);
                    $sppd_barang = (($sppd_barang == '') ? 0 : $sppd_barang * 1);
                    $sppd_modal = trim($row[11]);
                    $sppd_modal = (($sppd_modal == '') ? 0 : $sppd_modal * 1);
                    $data_create->sppd_uuid = GlobalHelper::getuuid();;
                    $data_create->sppd_work_unit_uuid = $sppd_work_unit_uuid;
                    $data_create->sppd_year = $sppd_year;
                    $data_create->sppd_month = $sppd_month;
                    $data_create->sppd_pegawai = $sppd_pegawai;
                    $data_create->sppd_barang = $sppd_barang;
                    $data_create->sppd_modal = $sppd_modal;
                    $data_create->sppd_create_by = '';
                    $data_create->sppd_create_date = $create_date;
                    $data_create->sppd_status = 1;
                    // if($this->document_type=='data_inisiasi'){
                    //     $data_create->sppd_month = 1;
                    //     $data_create->sppd_pegawai = 0;
                    //     $data_create->sppd_barang = 0;
                    //     $data_create->sppd_modal = 0;
                    // }
                    $data_create->save();

                    DB::commit();
                    
                }else if ($rowsidx == 3) {
                    DB::beginTransaction();
                    $data_create = new Trx_sppd;
                    $sppd_work_unit_uuid = '261b3744-5a41-11ee-971e-f4a4757ae8c3';
                    $sppd_pegawai = trim($row[3]);
                    $sppd_pegawai = (($sppd_pegawai == '') ? 0 : $sppd_pegawai * 1);
                    $sppd_barang = trim($row[7]);
                    $sppd_barang = (($sppd_barang == '') ? 0 : $sppd_barang * 1);
                    $sppd_modal = trim($row[11]);
                    $sppd_modal = (($sppd_modal == '') ? 0 : $sppd_modal * 1);
                    $data_create->sppd_uuid = GlobalHelper::getuuid();;
                    $data_create->sppd_work_unit_uuid = $sppd_work_unit_uuid;
                    $data_create->sppd_year = $sppd_year;
                    $data_create->sppd_month = $sppd_month;
                    $data_create->sppd_pegawai = $sppd_pegawai;
                    $data_create->sppd_barang = $sppd_barang;
                    $data_create->sppd_modal = $sppd_modal;
                    $data_create->sppd_create_by = '';
                    $data_create->sppd_create_date = $create_date;
                    $data_create->sppd_status = 1;
                    if($this->document_type=='data_inisiasi'){
                        $data_create->sppd_month = 1;
                        $data_create->sppd_pegawai = 0;
                        $data_create->sppd_barang = 0;
                        $data_create->sppd_modal = 0;
                    }
                    $data_create->save();

                    DB::commit();
                }else if ($rowsidx == 4) {
                    DB::beginTransaction();
                    $data_create = new Trx_sppd;
                    $sppd_work_unit_uuid = '261b3748-5a41-11ee-971e-f4a4757ae8c3';
                    $sppd_pegawai = trim($row[3]);
                    $sppd_pegawai = (($sppd_pegawai == '') ? 0 : $sppd_pegawai * 1);
                    $sppd_barang = trim($row[7]);
                    $sppd_barang = (($sppd_barang == '') ? 0 : $sppd_barang * 1);
                    $sppd_modal = trim($row[11]);
                    $sppd_modal = (($sppd_modal == '') ? 0 : $sppd_modal * 1);
                    $data_create->sppd_uuid = GlobalHelper::getuuid();;
                    $data_create->sppd_work_unit_uuid = $sppd_work_unit_uuid;
                    $data_create->sppd_year = $sppd_year;
                    $data_create->sppd_month = $sppd_month;
                    $data_create->sppd_pegawai = $sppd_pegawai;
                    $data_create->sppd_barang = $sppd_barang;
                    $data_create->sppd_modal = $sppd_modal;
                    $data_create->sppd_create_by = '';
                    $data_create->sppd_create_date = $create_date;
                    $data_create->sppd_status = 1;
                    if($this->document_type=='data_inisiasi'){
                        $data_create->sppd_month = 1;
                        $data_create->sppd_pegawai = 0;
                        $data_create->sppd_barang = 0;
                        $data_create->sppd_modal = 0;
                    }
                    $data_create->save();

                    DB::commit();
                }
            }
        }

    }
}
