<?php

namespace App\Imports;

use App\Models\Trx_upload_work_program;  // Replace with your actual model
use App\Models\Trx_upload_nilai_program;

use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithStartRow;
use Maatwebsite\Excel\Concerns\WithCalculatedFormulas;  // Import this concern
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Str;
use App\Models\Mst_work_units;


use Maatwebsite\Excel\Concerns\ToCollection;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\HasReferencesToOtherSheets;


class PerbagianSheetImport implements ToCollection, WithStartRow, WithCalculatedFormulas, HasReferencesToOtherSheets
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
        return 3; // Start from row 2, skipping the header
    }
    public function collection(Collection $rows)
    {
        $create_date = date('Y-m-d H:i:s');
        $upload_work_program_create_by = session('user_uuid');
        $isFirstRow = true;
        $upload_work_program_uuid_lvl_1 = '';
        $upload_work_program_uuid_lvl_2 = '';
        $upload_work_program_uuid_lvl_3 = '';
        $upload_work_program_uuid_lvl_4 = '';
        $upload_work_program_uuid_lvl_5 = '';
        $upload_work_program_uuid = '';
        $upload_work_program_work_unit_uuid = '';
        $level = 0;
        foreach ($rows as $row) {
            $upload_work_program_uuid = Str::uuid();
            $upload_work_program_parent_uuid = '';
            // Trim values for each column
            $upload_work_program_code = trim($row[0]);
            $upload_work_program_name = trim($row[1]);

            // Skip the row if both columns are empty
            if (empty($upload_work_program_code) && empty($upload_work_program_name)) {
                continue; // Skips row if both columns are empty
            }


            // Check if this is the first row
            if ($isFirstRow) {
                // Level 1
                $upload_work_program_parent_uuid = '0';
                $upload_work_program_uuid_lvl_1 = $upload_work_program_uuid;
                $dataWorkUnit = Mst_work_units::where('work_unit_parent_uuid', '0')
                    ->whereNull('work_unit_log_uuid')
                    ->where('work_unit_status', 1)
                    ->first();
                $upload_work_program_work_unit_uuid = $dataWorkUnit->work_unit_uuid;
                $level = 1;
                $isFirstRow = false;
            }

            if (Str::length($upload_work_program_code) == 4) {
                // Level 2
                $level = 2;
                $upload_work_program_uuid_lvl_2 = $upload_work_program_uuid;
                $upload_work_program_parent_uuid = $upload_work_program_uuid_lvl_1;
                $dataWorkUnit = Mst_work_units::where('work_unit_parent_uuid', '0')
                    ->whereNull('work_unit_log_uuid')
                    ->where('work_unit_status', 1)
                    ->first();
                $upload_work_program_work_unit_uuid = $dataWorkUnit->work_unit_uuid;
            }

            if ($upload_work_program_code == '') {
                // Level 3
                $level = 3;
                $upload_work_program_uuid_lvl_3 = $upload_work_program_uuid;
                $upload_work_program_parent_uuid = $upload_work_program_uuid_lvl_2;

                $dataWorkUnit = Mst_work_units::where('work_unit_name', $upload_work_program_name)
                    ->whereNull('work_unit_log_uuid')
                    ->where('work_unit_status', 1)
                    ->first();
                $upload_work_program_work_unit_uuid = $dataWorkUnit->work_unit_uuid;
            }

            if (Str::length($upload_work_program_code) == 1 && is_numeric($upload_work_program_code) == 1) {
                // Level 4
                $level = 4;
                $upload_work_program_uuid_lvl_4 = $upload_work_program_uuid;
                $upload_work_program_parent_uuid = $upload_work_program_uuid_lvl_3;
            }

            if (Str::length($upload_work_program_code) == 1 && is_numeric($upload_work_program_code) == 0) {
                // Level 5
                $level = 5;
                $upload_work_program_uuid_lvl_5 = $upload_work_program_uuid;
                $upload_work_program_parent_uuid = $upload_work_program_uuid_lvl_4;
            }

            if (Str::length($upload_work_program_code) == 6 && is_numeric($upload_work_program_code) == 1) {
                // Anak
                if ($level == 4) {
                    $upload_work_program_parent_uuid = $upload_work_program_uuid_lvl_4;
                }
                if ($level == 5) {
                    $upload_work_program_parent_uuid = $upload_work_program_uuid_lvl_5;
                }
            }
            $work_program_exist = Trx_upload_work_program::where('upload_work_program_year', $this->year)
            ->where('upload_work_program_year', $this->year)
            ->where('upload_work_program_code', $upload_work_program_code)
            ->where('upload_work_program_name', $upload_work_program_name)
            ->where('upload_work_program_work_unit_uuid', $upload_work_program_work_unit_uuid)
            ->first();
            if($work_program_exist){
                $upload_work_program_uuid = $work_program_exist->upload_work_program_uuid;
                $upload_work_program_parent_uuid = $work_program_exist->upload_work_program_parent_uuid;
                $upload_work_program_work_unit_uuid = $work_program_exist->upload_work_program_work_unit_uuid;
            }

            Trx_upload_work_program::updateOrCreate(
                [
                    'upload_work_program_work_unit_uuid' => $upload_work_program_work_unit_uuid,
                    'upload_work_program_year' => $this->year,
                    'upload_work_program_code' => $upload_work_program_code,
                    'upload_work_program_name' => $upload_work_program_name,
                ],
                [
                    'upload_work_program_uuid' => $upload_work_program_uuid,
                    'upload_work_program_parent_uuid' => $upload_work_program_parent_uuid,
                    'upload_work_program_work_unit_uuid' => $upload_work_program_work_unit_uuid,
                    'upload_work_program_year' => $this->year,
                    'upload_work_program_code' => $upload_work_program_code,
                    'upload_work_program_name' => $upload_work_program_name,
                    'upload_work_program_create_by' => $upload_work_program_create_by,
                    'upload_work_program_create_date' => $create_date,
                    'upload_work_program_status' => 1
                ]
            );
           
            $upload_nilai_program_pagu = trim($row[2]);
            $upload_nilai_program_realisasi = trim($row[3]);
            $upload_nilai_program_sisa = trim($row[4]);
            Trx_upload_nilai_program::updateOrCreate(
                [
                    'upload_nilai_program_work_program_uuid' => $upload_work_program_uuid,
                    'upload_nilai_program_year' => $this->year,
                    'upload_nilai_program_month' => $this->month,
                ],
                [
                    'upload_nilai_program_uuid' => Str::uuid(),
                    'upload_nilai_program_year' => $this->year,
                    'upload_nilai_program_month' => $this->month,
                    'upload_nilai_program_work_program_uuid' => $upload_work_program_uuid,
                    'upload_nilai_program_pagu' => $upload_nilai_program_pagu,
                    'upload_nilai_program_realisasi' => $upload_nilai_program_realisasi,
                    'upload_nilai_program_sisa' => $upload_nilai_program_sisa,
                    'upload_nilai_program_create_by' => $upload_work_program_create_by,
                    'upload_nilai_program_create_date' => $create_date,
                    'upload_nilai_program_status' => 1,
                ]
            );
            // Create the new record
            // Trx_upload_work_program::create([
            //     'upload_work_program_uuid' => $upload_work_program_uuid,
            //     'upload_work_program_parent_uuid' => $upload_work_program_parent_uuid,
            //     'upload_work_program_work_unit_uuid' => $upload_work_program_work_unit_uuid,
            //     'upload_work_program_year' => $this->year,
            //     'upload_work_program_code' => $upload_work_program_code,
            //     'upload_work_program_name' => $upload_work_program_name,
            //     'upload_work_program_create_by' => $upload_work_program_create_by,
            //     'upload_work_program_create_date' => $create_date,
            //     'upload_work_program_status' => 1
            // ]);

        }
    }
}



// class FirstSheetImport implements ToModel, WithStartRow, WithCalculatedFormulas
// {
//     protected $year;

//     public function __construct($year)
//     {
//         $this->year = $year;
//     }

//     public function startRow(): int
//     {
//         return 3; // Start from row 2, skipping the header
//     }
//     public function model(array $row)
//     {
//         $upload_work_program_code = trim($row[0]);
//         $upload_work_program_name = trim($row[1]);
//         $create_date = date('Y-m-d H:i:s', time());
//         $upload_work_program_create_by = session('user_uuid'); // Replace 'key' with the actual session key you need

//         if (empty($row[0]) && empty($row[1])) {
//             return null; // Skips row if both columns are empty
//         }

//         // Return an instance of your Eloquent model
//         return new Trx_upload_work_program([
//             'upload_work_program_uuid' => Str::uuid(), // Generate a UUID
//             'upload_work_program_year' => $this->year,
//             'upload_work_program_code' => $upload_work_program_code,  // Replace with actual column names
//             'upload_work_program_name' => $upload_work_program_name,
//             'upload_work_program_create_by' => $upload_work_program_create_by,
//             'upload_work_program_create_date' => $create_date,
//             'upload_work_program_status' => 1
//             // Add more mappings if necessary
//         ]);
//     }
// }
