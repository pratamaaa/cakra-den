<?php

namespace App\Imports;

use App\Models\Trx_upload_belanja;  // Replace with your actual model
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithStartRow;
use Maatwebsite\Excel\Concerns\WithCalculatedFormulas;  // Import this concern
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Str;
use App\Models\Mst_work_units;

use Maatwebsite\Excel\Concerns\ToCollection;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\HasReferencesToOtherSheets;

class PerbelanjaSheetImport implements ToCollection, WithStartRow, WithCalculatedFormulas, HasReferencesToOtherSheets
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
        $upload_work_program_create_by = session('user_uuid');
        $rowindex = 0;
        foreach ($rows as $row) {
            $rowindex++;
            $upload_belanja_uuid = Str::uuid();
            $no = trim($row[0]);
            $upload_belanja_nama = trim($row[1]);
            $upload_belanja_spd_pagu = trim($row[2]);
            $upload_belanja_spd_realisasi = trim($row[3]);
            $upload_belanja_spd_total = trim($row[5]);
            if (empty($no)) {
                continue; // Skips row if both columns are empty
            }
            if (($no == '1' || $no == '2' || $no == '3') && $rowindex < 10) {
                if(is_numeric($upload_belanja_spd_realisasi)){
                    $upload_belanja_spd_persentase_realisasi = ((float)$upload_belanja_spd_realisasi)/((float)$upload_belanja_spd_pagu)*100;
                    Trx_upload_belanja::updateOrCreate(
                        [
                            'upload_belanja_nama' => $upload_belanja_nama,
                            'upload_belanja_year' => $this->year,
                            'upload_belanja_month' => $this->month,
                        ],
                        [
                            'upload_belanja_uuid' => $upload_belanja_uuid,
                            'upload_belanja_nama' => $upload_belanja_nama,
                            'upload_belanja_spd_pagu' => $upload_belanja_spd_pagu,
                            'upload_belanja_spd_realisasi' => $upload_belanja_spd_realisasi,
                            'upload_belanja_spd_persentase_realisasi' => $upload_belanja_spd_persentase_realisasi,
                            'upload_belanja_spd_total' => $upload_belanja_spd_total,
                            'upload_belanja_year' => $this->year,
                            'upload_belanja_month' => $this->month,
                            'upload_belanja_create_by' => $upload_work_program_create_by,
                            'upload_belanja_create_date' => $create_date,
                            'upload_belanja_status' => 1
                        ]
                    );
                }

                
            }
            if (($no == '1' || $no == '2' || $no == '3') && ($rowindex > 10 && $rowindex < 20)) {
                $upload_belanja_spm_pagu = trim($row[2]);
                $upload_belanja_spm_realisasi = trim($row[3]);
                $upload_belanja_spm_total = trim($row[5]);
                if(is_numeric($upload_belanja_spm_realisasi)){
                    $upload_belanja_spm_persentase_realisasi = ((float)$upload_belanja_spm_realisasi)/((float)$upload_belanja_spm_pagu)*100;
                    Trx_upload_belanja::updateOrCreate(
                        [
                            'upload_belanja_nama' => $upload_belanja_nama,
                            'upload_belanja_year' => $this->year,
                            'upload_belanja_month' => $this->month,
                        ],
                        [
                            'upload_belanja_uuid' => $upload_belanja_uuid,
                            'upload_belanja_nama' => $upload_belanja_nama,
                            'upload_belanja_spm_pagu' => $upload_belanja_spm_pagu,
                            'upload_belanja_spm_realisasi' => $upload_belanja_spm_realisasi,
                            'upload_belanja_spm_persentase_realisasi' => $upload_belanja_spm_persentase_realisasi,
                            'upload_belanja_spm_total' => $upload_belanja_spm_total,
                            'upload_belanja_year' => $this->year,
                            'upload_belanja_month' => $this->month,
                            'upload_belanja_create_by' => $upload_work_program_create_by,
                            'upload_belanja_create_date' => $create_date,
                            'upload_belanja_status' => 1
                        ]
                    );
                }
               
            }
        }
        // $rowindex = 0;
        // foreach ($rows as $row) {
        //     $rowindex++;
        //     $upload_belanja_uuid = Str::uuid();
        //     $no = trim($row[0]);
        //     $upload_belanja_nama = trim($row[1]);
        //     $upload_belanja_spm_pagu = trim($row[2]);
        //     $upload_belanja_spm_realisasi = trim($row[3]);
        //     $upload_belanja_spm_persentase_realisasi = trim($row[4]);
        //     $upload_belanja_spm_total = trim($row[5]);
        //     if (empty($no)) {
        //         continue; // Skips row if both columns are empty
        //     }
        //     if (($no == '1' || $no == '2' || $no == '3') && $rowindex > 10 && $rowindex < 20) {
        //         Trx_upload_belanja::updateOrCreate(
        //             [
        //                 'upload_belanja_nama' => $upload_belanja_nama,
        //                 'upload_belanja_year' => $this->year,
        //                 'upload_belanja_month' => $this->month,
        //                 'upload_belanja_spm_pagu' => $upload_belanja_spm_pagu,
        //                 'upload_belanja_spm_realisasi' => $upload_belanja_spm_realisasi,
        //                 'upload_belanja_spm_persentase_realisasi' => $upload_belanja_spm_persentase_realisasi,
        //                 'upload_belanja_spm_total' => $upload_belanja_spm_total,
        //             ],
        //             [
        //                 'upload_belanja_uuid' => $upload_belanja_uuid,
        //                 'upload_belanja_nama' => $upload_belanja_nama,
        //                 'upload_belanja_spm_pagu' => $upload_belanja_spm_pagu,
        //                 'upload_belanja_spm_realisasi' => $upload_belanja_spm_realisasi,
        //                 'upload_belanja_spm_persentase_realisasi' => $upload_belanja_spm_persentase_realisasi,
        //                 'upload_belanja_spm_total' => $upload_belanja_spm_total,
        //                 'upload_belanja_year' => $this->year,
        //                 'upload_belanja_month' => $this->month,
        //                 'upload_belanja_create_by' => $upload_work_program_create_by,
        //                 'upload_belanja_create_date' => $create_date,
        //                 'upload_belanja_status' => 1
        //             ]
        //         );
        //     }
        // }
    }
}
