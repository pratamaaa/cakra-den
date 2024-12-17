<?php

namespace App\Imports;

use App\Models\Trx_upload_apk;
use App\Models\Trx_upload_nilai_program;
use App\Models\Trx_upload_paparan_program;

use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithStartRow;
use Maatwebsite\Excel\Concerns\WithCalculatedFormulas;  // Import this concern
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Str;
use App\Models\Mst_work_units;


use Maatwebsite\Excel\Concerns\ToCollection;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\HasReferencesToOtherSheets;


class ApkSheetImport implements ToCollection, WithStartRow, WithCalculatedFormulas, HasReferencesToOtherSheets
{
    protected $year;
    protected $month;

    public function __construct($year, $month)
    {
        $this->year = $year;
        $this->month = $month;
        
    }
    public function startRow(): int
    {
        return 5; // Start from row 2, skipping the header
    }
    public function collection(Collection $rows)
    {
        // echo '<pre>';
        // print_r($rows);
        // die();
        $create_date = date('Y-m-d H:i:s');
        $upload_apk_create_by = session('user_uuid');
        $upload_apk_uuid = '';
        $upload_apk_nama_old = '';
        $level = 0;
        foreach ($rows as $row) {
            $upload_apk_uuid = Str::uuid();
            $upload_apk_nama = trim($row[2]);
            $upload_apk_ket = trim($row[3]);
            $upload_apk_pagu = trim($row[4]);
            $upload_apk_realisasi = trim($row[5]);
            $upload_apk_sisa = trim($row[7]);
            $upload_apk_persentase_realisasi = 0;
            if($upload_apk_nama == ''){
                $upload_apk_nama = $upload_apk_nama_old;
            }
            if (empty($upload_apk_ket) || $upload_apk_ket == "") {
                break; // Skips row if both columns are empty
            }
            
            if((float)$upload_apk_realisasi > 0){
                $upload_apk_persentase_realisasi = ((float)$upload_apk_realisasi)/((float)$upload_apk_pagu)*100;
            }
            

            Trx_upload_apk::updateOrCreate(
                [
                    'upload_apk_year' => $this->year,
                    'upload_apk_month' => $this->month,
                    'upload_apk_nama' => $upload_apk_nama,
                    'upload_apk_ket' => $upload_apk_ket,
                ],
                [
                    'upload_apk_uuid' => $upload_apk_uuid,
                    'upload_apk_year' => $this->year,
                    'upload_apk_month' => $this->month,
                    'upload_apk_nama' => $upload_apk_nama,
                    'upload_apk_ket' => $upload_apk_ket,
                    'upload_apk_pagu' => (float)$upload_apk_pagu,
                    'upload_apk_realisasi' => (float)$upload_apk_realisasi,
                    'upload_apk_persentase_realisasi' => (float)$upload_apk_persentase_realisasi,
                    'upload_apk_sisa' => (float)$upload_apk_sisa,
                    'upload_apk_create_by' => $upload_apk_create_by,
                    'upload_apk_create_date' => $create_date,
                    'upload_apk_status' => 1
                ]
            );

            $upload_apk_nama_old = $upload_apk_nama;

        }
    }
}
