<?php

namespace App\Imports;

use App\Models\Trx_upload_work_program;  // Replace with your actual model
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


class PaparanSheetImport implements ToCollection, WithStartRow, WithCalculatedFormulas, HasReferencesToOtherSheets
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
        $upload_paparan_program_create_by = session('user_uuid');
        $isFirstRow = true;
        $upload_paparan_program_uuid_lvl_1 = '';
        $upload_paparan_program_uuid_lvl_2 = '';
        $upload_paparan_program_uuid_lvl_3 = '';
        $upload_paparan_program_uuid_lvl_4 = '';
        $upload_paparan_program_uuid_lvl_5 = '';
        $upload_paparan_program_uuid = '';
        $upload_paparan_program_work_unit_uuid = '';
        $level = 0;
        foreach ($rows as $row) {
            $upload_paparan_program_uuid = Str::uuid();
            $upload_paparan_program_parent_uuid = '';
            // Trim values for each column
            $upload_paparan_program_code = trim($row[0]);
            $upload_paparan_program_name = trim($row[1]);
            $upload_paparan_program_spd_pagu = trim($row[2]);
            $upload_paparan_program_spd_realisasi = trim($row[3]);
            $upload_paparan_program_spd_sisa = trim($row[5]);
            $upload_paparan_program_spd_target = trim($row[9]);
            $upload_paparan_program_spd_persen_target = trim($row[10]);
            $upload_paparan_program_spd_deviasi = trim($row[11]);
            $upload_paparan_program_spd_persen_deviasi = trim($row[12]);

            // Skip the row if both columns are empty
            if (empty($upload_paparan_program_code) && empty($upload_paparan_program_name)) {
                continue; // Skips row if both columns are empty
            }


            // Check if this is the first row
            if ($isFirstRow) {
                // Level 1
                $upload_paparan_program_parent_uuid = '0';
                $upload_paparan_program_uuid_lvl_1 = $upload_paparan_program_uuid;
                $dataWorkUnit = Mst_work_units::where('work_unit_parent_uuid', '0')
                    ->whereNull('work_unit_log_uuid')
                    ->where('work_unit_status', 1)
                    ->first();
                $upload_paparan_program_work_unit_uuid = $dataWorkUnit->work_unit_uuid;
                $level = 1;
                $isFirstRow = false;
            }

            if (Str::length($upload_paparan_program_code) == 4) {
                // Level 2
                $level = 2;
                $upload_paparan_program_uuid_lvl_2 = $upload_paparan_program_uuid;
                $upload_paparan_program_parent_uuid = $upload_paparan_program_uuid_lvl_1;
                $dataWorkUnit = Mst_work_units::where('work_unit_parent_uuid', '0')
                    ->whereNull('work_unit_log_uuid')
                    ->where('work_unit_status', 1)
                    ->first();
                $upload_paparan_program_work_unit_uuid = $dataWorkUnit->work_unit_uuid;
            }

            if ($upload_paparan_program_code == '') {
                // Level 3
                $level = 3;
                $upload_paparan_program_uuid_lvl_3 = $upload_paparan_program_uuid;
                $upload_paparan_program_parent_uuid = $upload_paparan_program_uuid_lvl_2;

                $dataWorkUnit = Mst_work_units::where('work_unit_name', $upload_paparan_program_name)
                    ->whereNull('work_unit_log_uuid')
                    ->where('work_unit_status', 1)
                    ->first();
                $upload_paparan_program_work_unit_uuid = $dataWorkUnit->work_unit_uuid;
            }

            if (Str::length($upload_paparan_program_code) == 1 && is_numeric($upload_paparan_program_code) == 1) {
                // Level 4
                $level = 4;
                $upload_paparan_program_uuid_lvl_4 = $upload_paparan_program_uuid;
                $upload_paparan_program_parent_uuid = $upload_paparan_program_uuid_lvl_3;
            }

            // if (Str::length($upload_paparan_program_code) == 1 && is_numeric($upload_paparan_program_code) == 0) {
            //     // Level 5
            //     $level = 5;
            //     $upload_paparan_program_uuid_lvl_5 = $upload_paparan_program_uuid;
            //     $upload_paparan_program_parent_uuid = $upload_paparan_program_uuid_lvl_4;
            // }

            // if (Str::length($upload_paparan_program_code) == 6 && is_numeric($upload_paparan_program_code) == 1) {
            //     // Anak
            //     if ($level == 4) {
            //         $upload_paparan_program_parent_uuid = $upload_paparan_program_uuid_lvl_4;
            //     }
            //     if ($level == 5) {
            //         $upload_paparan_program_parent_uuid = $upload_paparan_program_uuid_lvl_5;
            //     }
            // }
            $upload_paparan_program_spd_persen_realisasi = ((float)$upload_paparan_program_spd_realisasi)/((float)$upload_paparan_program_spd_pagu)*100;

            Trx_upload_paparan_program::updateOrCreate(
                [
                    // 'upload_paparan_program_parent_uuid' => $upload_paparan_program_parent_uuid,
                    'upload_paparan_program_work_unit_uuid' => $upload_paparan_program_work_unit_uuid,
                    'upload_paparan_program_year' => $this->year,
                    'upload_paparan_program_month' => $this->month,
                    'upload_paparan_program_code' => $upload_paparan_program_code,
                    'upload_paparan_program_name' => $upload_paparan_program_name,
                ],
                [
                    'upload_paparan_program_uuid' => $upload_paparan_program_uuid,
                    'upload_paparan_program_parent_uuid' => $upload_paparan_program_parent_uuid,
                    'upload_paparan_program_work_unit_uuid' => $upload_paparan_program_work_unit_uuid,
                    'upload_paparan_program_year' => $this->year,
                    'upload_paparan_program_month' => $this->month,
                    'upload_paparan_program_code' => $upload_paparan_program_code,
                    'upload_paparan_program_name' => $upload_paparan_program_name,
                    'upload_paparan_program_spd_pagu' => (float)$upload_paparan_program_spd_pagu,
                    'upload_paparan_program_spd_realisasi' => (float)$upload_paparan_program_spd_realisasi,
                    'upload_paparan_program_spd_persen_realisasi' => $upload_paparan_program_spd_persen_realisasi,
                    'upload_paparan_program_spd_sisa' => (float)$upload_paparan_program_spd_sisa,
                    'upload_paparan_program_spd_target' => (float)$upload_paparan_program_spd_target,
                    'upload_paparan_program_spd_persen_target' => (float)$upload_paparan_program_spd_persen_target*100,
                    'upload_paparan_program_spd_deviasi' => (float)$upload_paparan_program_spd_deviasi,
                    'upload_paparan_program_spd_persen_deviasi' => (float)$upload_paparan_program_spd_persen_deviasi*100,
                    'upload_paparan_program_spm_pagu' => (float)$upload_paparan_program_spd_pagu,
                    'upload_paparan_program_spm_realisasi' => (float)$upload_paparan_program_spd_realisasi,
                    'upload_paparan_program_spm_persen_realisasi' => $upload_paparan_program_spd_persen_realisasi,
                    'upload_paparan_program_spm_sisa' => (float)$upload_paparan_program_spd_sisa,
                    'upload_paparan_program_spm_target' => (float)$upload_paparan_program_spd_target,
                    'upload_paparan_program_spm_persen_target' => (float)$upload_paparan_program_spd_persen_target*100,
                    'upload_paparan_program_spm_deviasi' => (float)$upload_paparan_program_spd_deviasi,
                    'upload_paparan_program_spm_persen_deviasi' => (float)$upload_paparan_program_spd_persen_deviasi*100,
                    'upload_paparan_program_create_by' => $upload_paparan_program_create_by,
                    'upload_paparan_program_create_date' => $create_date,
                    'upload_paparan_program_status' => 1
                ]
            );
        }
    }
}
