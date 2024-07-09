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
use Illuminate\Support\Facades\DB;
use App\Models\Trx_work_programs;
use App\Models\Trx_work_programs_new;
use App\Helpers\GlobalHelper;
use Illuminate\Support\Str;
use App\Models\Mst_work_units;
use App\Models\Trx_budgets;
use App\Models\View_work_program_parent;
use App\Imports\PerbagianImport;
use Maatwebsite\Excel\Concerns\ToArray;
use Maatwebsite\Excel\Concerns\SkipsOnFailure;
use Maatwebsite\Excel\Validators\Failure;
use Maatwebsite\Excel\Concerns\SkipsErrors;

class RealisasiImport implements ToModel, WithMultipleSheets, HasReferencesToOtherSheets, WithCalculatedFormulas, WithStartRow, SkipsOnFailure
{
    public function __construct($year, $month, $document_type = '')
    {
        $this->year = $year;
        $this->month = $month;
        $this->document_type = $document_type;
    }
    public function model(array $row)
    {
        return new Trx_work_programs_new([
            'work_program_uuid' => GlobalHelper::getuuid(),
            'work_program_year' => 2024,
            'work_program_name' => $row[1],
            'work_program_code' => $row[2]
        ]);
    }

    public function onFailure(Failure ...$failures)
    {
        echo '<pre>';
        print_r($failures);
        die();
        // Handle the failures how you'd like.
    }
    public function sheets(): array
    {

        // return [
        //     3 => $this,
        //     6 => new RealisasiBelanjaImport($this->year, $this->month, $this->document_type),
        // ];
        return [
            3 => $this,
            // 'PER BAGIAN' => new PerbagianImport(),
        ];
    }
    public function startRow(): int
    {
        return 3;
    }
    public function collection(Collection $rows)
    {
        foreach ($rows as $row) {
            $work_program_code = trim($rows[0]);
            $work_program_name = trim($rows[1]);
            Trx_work_programs_new::updateOrCreate(
                [
                    'work_program_uuid' => GlobalHelper::getuuid(),
                    'work_program_year' => 2024,
                    'work_program_name' => $work_program_name,
                    'work_program_code' => $work_program_code,
                ]
            );
        }


        // $create_date = date('Y-m-d H:i:s', time());
        // $datainsert = array();
        // foreach ($rows as $value) {
        //     $work_program_code = trim($value[0]);
        //     $work_program_name = trim($value[1]);
        //     $kolom_c = trim($value[2]);
        //     $kolom_d = trim($value[3]);
        //     $kolom_e = trim($value[4]);
        //     $kolom_f = trim($value[5]);
        //     $kolom_g = trim($value[6]);
        //     $work_program_year = 2024;

        //     $datainsertzz = [
        //         'work_program_uuid' => GlobalHelper::getuuid(),
        //         'work_program_year' => $work_program_year,
        //         'work_program_name' => $work_program_name,
        //         'work_program_code' => $work_program_code,
        //         'work_program_create_date' => $create_date,
        //         'work_program_create_by' => ''

        //     ];


        //     // foreach ($rows as $row) {
        //     //     $we  = Trx_work_programs_new::create($datainsertzz);
        //     //     // echo '<pre>';
        //     //     // print_r($we);
        //     //     // die(); 
        //     // }
        // }
        // DB::beginTransaction();

        // $data_create = new Trx_work_programs_new;
        // $data_create->work_program_uuid = GlobalHelper::getuuid();
        // $data_create->work_program_year = 2024;


        // $data_create->save();
        // DB::commit();
        // DB::beginTransaction();
        // Trx_work_programs_new::insert($datainsert);
        // DB::commit();
        // try {

        // } catch (\Exception $e) {
        //     DB::rollBack();
        //     echo '<pre>';
        //     echo $e->getMessage();
        //     die();
        // }
        // echo '<pre>';
        // print_r($datainsert);
        // die();
        // echo '<pre>';
        // print_r($row);
        // die();
    }
    // public function collection(Collection $rows)
    // {
    //     echo '<pre>';
    //     print_r($rows);
    //     die();
    // }
}

// class RealisasiImport implements WithMultipleSheets, ToCollection, WithStartRow, HasReferencesToOtherSheets, WithCalculatedFormulas
// {
//     private $year;
//     private $month;
//     private $document_type;

//     public function __construct($year, $month, $document_type = '')
//     {
//         $this->year = $year;
//         $this->month = $month;
//         $this->document_type = $document_type;
//     }
//     // public function headingRow(): int
//     // {
//     //     return 2;
//     // }
//     public function startRow(): int
//     {
//         return 3;
//     }
    
//     public function sheets(): array
//     {

//         // return [
//         //     3 => $this,
//         //     6 => new RealisasiBelanjaImport($this->year, $this->month, $this->document_type),
//         // ];
//         return [
//             'PER BAGIAN' => $this
//         ];
//     }

//     public function collection(Collection $rows)
//     {
//         echo '<pre>';
//         print_r($rows);
//         die();
//         try {

//             foreach ($rows as $value) {
//                 // $kolom_a = trim($value[0]);
//                 // $kolom_b = trim($value[1]);
//                 // $kolom_c = trim($value[2]);
//                 // if ($kolom_a != '' && $kolom_b != '' && $kolom_c != '' && strtolower($kolom_a) != 'no' && strtolower($kolom_a) != 'id') {
//                 //     $datainsert[] = [
//                 //         'pkpa_uuid' => GlobalHelper::getuuid(),
//                 //         'pkpa_code' => $kolom_a,
//                 //         'pkpa_name' => $kolom_b,
//                 //         'pkpa_certificate_number' => $kolom_c,
//                 //         'pkpa_status' => 1,
//                 //         'pkpa_create_date' => $this->create_date,
//                 //         'pkpa_create_by' => $this->user_uuid

//                 //     ];
//                 // }
//             }
//             // $newinsert[] = $datainsert;
//             try {
//                 DB::beginTransaction();
//                 // Trx_pkpa::insert($datainsert);
//                 DB::commit();
//             } catch (\Exception $e) {
//                 DB::rollBack();
//                 echo '<pre>';
//                 echo $e->getMessage();
//                 die();
//             }

//         } catch (\Exception $e) {
//             DB::rollBack();

//             echo '<pre>';
//             echo $e->getMessage();
//             die();
//         }

//         // try {
            
//         //     $prev_uuid = '0';
//         //     $prev_work_program_work_unit_uuid = '';
//         //     $work_program_year = $this->year * 1;
//         //     $prev_work_program_parent_uuid = '0';
//         //     $prev_work_program_parent_uuid_lvl_2 = '';
//         //     $prev_work_program_parent_uuid_lvl_3 = '';
//         //     $prev_work_program_parent_uuid_lvl_4 = '';
//         //     $prev_work_program_parent_uuid_lvl_5 = '';
//         //     $prev_work_program_parent_uuid_lvl_6 = '';
//         //     $prev_work_program_parent_name_select = '';
//         //     $prev_work_program_parent_code_select = '';
//         //     Trx_work_programs::query()->truncate();
//         //     Trx_budgets::query()->truncate();
//         //     $create_date = date('Y-m-d H:i:s', time());
//         //     $datarealisasi = [];
//         //     $rowsidx = 1;
//         //     foreach ($rows as $row) {

//         //         $rowsidx++;
//         //         $work_program_uuid = GlobalHelper::getuuid();
//         //         $work_program_year = $work_program_year;
//         //         $work_program_code = trim($row[0]);
//         //         $work_program_name = trim($row[1]);

//         //         $work_program_work_unit_uuid = '';
//         //         if (Str::length($work_program_code) == 9) {
//         //             $dataWorkUnit = Mst_work_units::where('work_unit_parent_uuid', '0')
//         //                 ->whereNull('work_unit_log_uuid')
//         //                 ->where('work_unit_status', 1)
//         //                 ->first();
//         //             $work_program_work_unit_uuid = $dataWorkUnit->work_unit_uuid;
//         //         } else if ($work_program_code == '') {
//         //             $dataWorkUnit = Mst_work_units::where('work_unit_name', $work_program_name)
//         //                 ->whereNull('work_unit_log_uuid')
//         //                 ->where('work_unit_status', 1)
//         //                 ->first();
//         //             if ($dataWorkUnit != null) {
//         //                 $work_program_work_unit_uuid = $dataWorkUnit->work_unit_uuid;
//         //             }
//         //         }
//         //         $work_program_work_unit_uuid = (($work_program_work_unit_uuid == '') ? $prev_work_program_work_unit_uuid : $work_program_work_unit_uuid);

//         //         if ($row[1] != '') {
//         //             $data_create = new Trx_work_programs();

//         //             if (Str::length($work_program_code) == 9) {
//         //                 $data_create->work_program_parent_uuid = '0';
//         //                 $prev_work_program_parent_uuid = $work_program_uuid;
//         //             } else if (Str::length($work_program_code) == 4) {
//         //                 $data_create->work_program_parent_uuid = $prev_work_program_parent_uuid;
//         //                 $prev_work_program_parent_uuid_lvl_3 = $work_program_uuid;
//         //             } else if ($work_program_code == '') {
//         //                 $data_create->work_program_parent_uuid = $prev_work_program_parent_uuid_lvl_3;
//         //                 if ($prev_work_program_work_unit_uuid != $work_program_work_unit_uuid) {
//         //                     $prev_work_program_parent_uuid_lvl_4 = $work_program_uuid;
//         //                 }
//         //             } else if (Str::length($work_program_code) == 1 && is_numeric($work_program_code) == 1) {
//         //                 $prev_work_program_parent_name_select = $work_program_name;
//         //                 $prev_work_program_parent_code_select = $work_program_code;
//         //                 $data_create->work_program_parent_uuid = $prev_work_program_parent_uuid_lvl_4;
//         //                 $prev_work_program_parent_uuid_lvl_5 = $work_program_uuid;
//         //                 $prev_work_program_parent_uuid_lvl_6 = $work_program_uuid;
//         //             } else if (Str::length($work_program_code) == 1 && is_numeric($work_program_code) == 0) {
//         //                 $prev_work_program_parent_name_select = $work_program_name;
//         //                 $prev_work_program_parent_code_select = $work_program_code;
//         //                 $data_create->work_program_parent_uuid = $prev_work_program_parent_uuid_lvl_5;
//         //                 $prev_work_program_parent_uuid_lvl_6 = $work_program_uuid;
//         //             } else if (Str::length($work_program_code) == 6) {
//         //                 $data_create->work_program_parent_uuid = $prev_work_program_parent_uuid_lvl_6;
//         //                 $data_create->work_program_is_last_child = 1;
//         //             }
//         //             if ($this->document_type == 'data_inisiasi') {
//         //                 DB::beginTransaction();
//         //                 $data_create->work_program_uuid = $work_program_uuid;


//         //                 $data_create->work_program_work_unit_uuid = $work_program_work_unit_uuid;
//         //                 $data_create->work_program_year = $work_program_year;
//         //                 $data_create->work_program_name = $work_program_name;
//         //                 $data_create->work_program_code = $work_program_code;
//         //                 $data_create->work_program_create_by = '';
//         //                 $data_create->work_program_create_date = $create_date;
//         //                 $data_create->work_program_status = 1;

//         //                 $data_create->save();
                        
//         //                 DB::commit();
//         //                 // echo '<pre>';
//         //                 // print_r($data_create);
//         //                 // die();
//         //             } else {
//         //                 if (Str::length($work_program_code) == 6) {
//         //                     $dataprogram = View_work_program_parent::where('work_program_status', 1)
//         //                         ->where('work_program_year', $work_program_year)
//         //                         ->where('work_program_code', $work_program_code)
//         //                         ->where('work_program_name', $work_program_name)
//         //                         ->where('work_program_parent_code', $prev_work_program_parent_code_select)
//         //                         ->where('work_program_parent_name', $prev_work_program_parent_name_select)
//         //                         ->where('work_program_work_unit_uuid', $work_program_work_unit_uuid)
//         //                         ->whereNull('work_program_log_uuid')
//         //                         ->first();

//         //                     if ($dataprogram == null) {
//         //                         echo 'work_program_year = ' . $work_program_year . '<br>work_program_code = ' . $work_program_code . '<br>work_program_name = ' . $work_program_name . '<br>work_program_work_unit_uuid = ' . $work_program_work_unit_uuid . '<br>work_program_parent_code = ' . $prev_work_program_parent_code_select . '<br>work_program_parent_name = ' . $prev_work_program_parent_name_select;
//         //                         die();
//         //                     }

//         //                     $work_program_uuid = $dataprogram->work_program_parent_uuid;
//         //                 }
//         //             }


//         //             if (Str::length($work_program_code) == 6) {
//         //                 $data_create_pagu = new Trx_budgets();

//         //                 try {
//         //                     $budget_plafon = trim($row[2]);
//         //                     $budget_plafon = (($budget_plafon == '') ? 0 : $budget_plafon * 1);
    
//         //                     $budget_realization = trim($row[3]);
//         //                     $budget_realization = (($budget_realization == '') ? 0 : $budget_realization * 1);
//         //                     $datarealisasi[] = $budget_realization;
    
//         //                     DB::beginTransaction();
    
    
//         //                     $data_create_pagu->budget_uuid = GlobalHelper::getuuid();
//         //                     $data_create_pagu->budget_year = $this->year;
//         //                     $data_create_pagu->budget_month = $this->month;
//         //                     $data_create_pagu->budget_plafon = $budget_plafon;
//         //                     $data_create_pagu->budget_realization = $budget_realization;
//         //                     $data_create_pagu->budget_work_program_uuid = $work_program_uuid;
//         //                     $data_create_pagu->budget_create_by = '';
//         //                     $data_create_pagu->budget_create_date = $create_date;
//         //                     $data_create_pagu->budget_status = 1;
    
//         //                     // if ($this->document_type == 'data_inisiasi') {
//         //                     //     $data_create_pagu->budget_month = 1;
//         //                     //     $data_create_pagu->budget_realization = 0;
//         //                     // }
//         //                     $data_create_pagu->save();
//         //                     DB::commit();
                         

//         //                 } catch (\Exception $e) {
//         //                     DB::rollBack();

//         //                     echo '<pre>';
//         //                     echo 'budget_plafon '.$budget_plafon.'<br>';
//         //                     // echo 'budget_realization '.$budget_realization.'<br>';
//         //                     echo $work_program_name.' -- '.$e->getMessage();
//         //                     print_r($row);
//         //                     die();
//         //                 }
                       

//         //             }
//         //         }

//         //         $prev_work_program_work_unit_uuid = $work_program_work_unit_uuid;
//         //     }
//         // } catch (\Exception $e) {
//         //     DB::rollBack();

//         //     echo '<pre>';
//         //     echo $e->getMessage();
//         //     die();
//         // }
//     }
// }
