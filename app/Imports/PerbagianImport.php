<?php

namespace App\Imports;

use App\Models\User;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithMultipleSheets;
use Maatwebsite\Excel\Concerns\WithCalculatedFormulas;
use Maatwebsite\Excel\Concerns\HasReferencesToOtherSheets;
use Maatwebsite\Excel\Concerns\WithConditionalSheets;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\WithStartRow;
use App\Models\Trx_work_programs;
use Illuminate\Support\Facades\DB;
use App\Helpers\GlobalHelper;
use Illuminate\Support\Str;
use App\Models\Mst_work_units;
use App\Models\Trx_budgets;
use App\Models\View_work_program_parent;
use Maatwebsite\Excel\Concerns\ToArray;
use Maatwebsite\Excel\Concerns\SkipsEmptyRows;
use Maatwebsite\Excel\Concerns\SkipsOnError;
use Maatwebsite\Excel\Concerns\OnEachRow;
use App\Models\Trx_work_programs_new;

class PerbagianImport implements ToArray, HasReferencesToOtherSheets, WithCalculatedFormulas, SkipsEmptyRows, WithStartRow//ToCollection
{
    private $year;
    private $month;
    private $document_type;

    public function __construct($year, $month, $document_type = '')
    {
        $this->year = $year;
        $this->month = $month;
        $this->document_type = $document_type;
    }
    public function startRow(): int
    {
        return 3;
    }
    public function array($rows)
    {
        try {
           
            $prev_uuid = '0';
            $prev_work_program_work_unit_uuid = '';
            $work_program_year = $this->year * 1;
            $prev_work_program_parent_uuid = '0';
            $prev_work_program_parent_uuid_lvl_2 = '';
            $prev_work_program_parent_uuid_lvl_3 = '';
            $prev_work_program_parent_uuid_lvl_4 = '';
            $prev_work_program_parent_uuid_lvl_5 = '';
            $prev_work_program_parent_uuid_lvl_6 = '';
            $prev_work_program_parent_name_select = '';
            $prev_work_program_parent_code_select = '';
            //Trx_work_programs::query()->truncate();
            // Trx_budgets::query()->truncate();
            $create_date = date('Y-m-d H:i:s', time());
            $datarealisasi = [];
            $rowsidx = 1;
            foreach ($rows as $row) {

                $rowsidx++;
                $work_program_uuid = GlobalHelper::getuuid();
                $work_program_year = $work_program_year;
                $work_program_code = trim($row[0]);
                $work_program_name = trim($row[1]);
                // if($work_program_name=='#REF!'){
                //     echo $rowsidx. '--' .$work_program_code;
                //     die();

                // }
                $work_program_work_unit_uuid = '';
                if (Str::length($work_program_code) == 9) {
                    $dataWorkUnit = Mst_work_units::where('work_unit_parent_uuid', '0')
                        ->whereNull('work_unit_log_uuid')
                        ->where('work_unit_status', 1)
                        ->first();
                    $work_program_work_unit_uuid = $dataWorkUnit->work_unit_uuid;
                } else if ($work_program_code == '') {
                    $dataWorkUnit = Mst_work_units::where('work_unit_name', $work_program_name)
                        ->whereNull('work_unit_log_uuid')
                        ->where('work_unit_status', 1)
                        ->first();
                    if ($dataWorkUnit != null) {
                        $work_program_work_unit_uuid = $dataWorkUnit->work_unit_uuid;
                    }
                }
                $work_program_work_unit_uuid = (($work_program_work_unit_uuid == '') ? $prev_work_program_work_unit_uuid : $work_program_work_unit_uuid);

                if ($row[1] != '') {
                    $data_create = new Trx_work_programs();

                    if (Str::length($work_program_code) == 9) {
                        $data_create->work_program_parent_uuid = '0';
                        $prev_work_program_parent_uuid = $work_program_uuid;
                    } else if (Str::length($work_program_code) == 4) {
                        $data_create->work_program_parent_uuid = $prev_work_program_parent_uuid;
                        $prev_work_program_parent_uuid_lvl_3 = $work_program_uuid;
                    } else if ($work_program_code == '') {
                        $data_create->work_program_parent_uuid = $prev_work_program_parent_uuid_lvl_3;
                        if ($prev_work_program_work_unit_uuid != $work_program_work_unit_uuid) {
                            $prev_work_program_parent_uuid_lvl_4 = $work_program_uuid;
                        }
                    } else if (Str::length($work_program_code) == 1 && is_numeric($work_program_code) == 1) {
                        $prev_work_program_parent_name_select = $work_program_name;
                        $prev_work_program_parent_code_select = $work_program_code;
                        $data_create->work_program_parent_uuid = $prev_work_program_parent_uuid_lvl_4;
                        $prev_work_program_parent_uuid_lvl_5 = $work_program_uuid;
                        $prev_work_program_parent_uuid_lvl_6 = $work_program_uuid;
                    } else if (Str::length($work_program_code) == 1 && is_numeric($work_program_code) == 0) {
                        $prev_work_program_parent_name_select = $work_program_name;
                        $prev_work_program_parent_code_select = $work_program_code;
                        $data_create->work_program_parent_uuid = $prev_work_program_parent_uuid_lvl_5;
                        $prev_work_program_parent_uuid_lvl_6 = $work_program_uuid;
                    } else if (Str::length($work_program_code) == 6) {
                        $data_create->work_program_parent_uuid = $prev_work_program_parent_uuid_lvl_6;
                        $data_create->work_program_is_last_child = 1;
                    }
                    if ($this->document_type == 'data_inisiasi') {
                        DB::beginTransaction();
                        $data_create->work_program_uuid = $work_program_uuid;


                        $data_create->work_program_work_unit_uuid = $work_program_work_unit_uuid;
                        $data_create->work_program_year = $work_program_year;
                        $data_create->work_program_name = $work_program_name;
                        $data_create->work_program_code = $work_program_code;
                        $data_create->work_program_create_by = '';
                        $data_create->work_program_create_date = $create_date;
                        $data_create->work_program_status = 1;

                        $data_create->save();
                        DB::commit();
                    } else {
                        if (Str::length($work_program_code) == 6) {
                            $dataprogram = View_work_program_parent::where('work_program_status', 1)
                                ->where('work_program_year', $work_program_year)
                                ->where('work_program_code', $work_program_code)
                                ->where('work_program_name', $work_program_name)
                                ->where('work_program_parent_code', $prev_work_program_parent_code_select)
                                ->where('work_program_parent_name', $prev_work_program_parent_name_select)
                                ->where('work_program_work_unit_uuid', $work_program_work_unit_uuid)
                                ->whereNull('work_program_log_uuid')
                                ->first();

                            if ($dataprogram == null) {
                                echo 'work_program_year = ' . $work_program_year . '<br>work_program_code = ' . $work_program_code . '<br>work_program_name = ' . $work_program_name . '<br>work_program_work_unit_uuid = ' . $work_program_work_unit_uuid . '<br>work_program_parent_code = ' . $prev_work_program_parent_code_select . '<br>work_program_parent_name = ' . $prev_work_program_parent_name_select;
                                die();
                            }

                            $work_program_uuid = $dataprogram->work_program_parent_uuid;
                        }
                    }


                    if (Str::length($work_program_code) == 6) {
                        $budget_plafon = trim($row[2]);
                        if (is_numeric($budget_plafon)) {
                            $budget_plafon = (($budget_plafon == '') ? 0 : $budget_plafon * 1);
                        } else {
                            $budget_plafon = 0;
                        }

                        $budget_realization = trim($row[3]);
                        if (is_numeric($budget_realization)) {
                            $budget_realization = (($budget_realization == '') ? 0 : $budget_realization * 1);
                        } else {
                            $budget_realization = 0;
                        }
                     
                        $datarealisasi[] = $budget_realization;

                        DB::beginTransaction();
                        $data_create_pagu = new Trx_budgets();


                        $data_create_pagu->budget_uuid = GlobalHelper::getuuid();
                        $data_create_pagu->budget_year = $this->year;
                        $data_create_pagu->budget_month = $this->month;
                        $data_create_pagu->budget_plafon = $budget_plafon;
                        $data_create_pagu->budget_realization = $budget_realization;
                        $data_create_pagu->budget_work_program_uuid = $work_program_uuid;
                        $data_create_pagu->budget_create_by = '';
                        $data_create_pagu->budget_create_date = $create_date;
                        $data_create_pagu->budget_status = 1;

                        if ($this->document_type == 'data_inisiasi') {
                            $data_create_pagu->budget_month = 1;
                            // $data_create_pagu->budget_realization = 0;
                        }
                        $data_create_pagu->save();

                        DB::commit();
                    }
                }

                $prev_work_program_work_unit_uuid = $work_program_work_unit_uuid;
            }
            // echo '<pre>';
            // print_r($datarealisasi);
            // die();
        } catch (\Exception $e) {
            DB::rollBack();

            echo '<pre>';
            echo $e->getMessage();
            die();
        }
    }

   
    public function collection(Collection $rows)
    {
        try {
            echo '<pre>';
            print_r($rows);
            die();
            $prev_uuid = '0';
            $prev_work_program_work_unit_uuid = '';
            $work_program_year = $this->year * 1;
            $prev_work_program_parent_uuid = '0';
            $prev_work_program_parent_uuid_lvl_2 = '';
            $prev_work_program_parent_uuid_lvl_3 = '';
            $prev_work_program_parent_uuid_lvl_4 = '';
            $prev_work_program_parent_uuid_lvl_5 = '';
            $prev_work_program_parent_uuid_lvl_6 = '';
            $prev_work_program_parent_name_select = '';
            $prev_work_program_parent_code_select = '';
            //Trx_work_programs::query()->truncate();
            // Trx_budgets::query()->truncate();
            $create_date = date('Y-m-d H:i:s', time());
            $datarealisasi = [];
            $rowsidx = 1;
            foreach ($rows as $row) {

                $rowsidx++;
                $work_program_uuid = GlobalHelper::getuuid();
                $work_program_year = $work_program_year;
                $work_program_code = trim($row[0]);
                $work_program_name = trim($row[1]);
                // if($work_program_name=='#REF!'){
                //     echo $rowsidx. '--' .$work_program_code;
                //     die();

                // }
                $work_program_work_unit_uuid = '';
                if (Str::length($work_program_code) == 9) {
                    $dataWorkUnit = Mst_work_units::where('work_unit_parent_uuid', '0')
                        ->whereNull('work_unit_log_uuid')
                        ->where('work_unit_status', 1)
                        ->first();
                    $work_program_work_unit_uuid = $dataWorkUnit->work_unit_uuid;
                } else if ($work_program_code == '') {
                    $dataWorkUnit = Mst_work_units::where('work_unit_name', $work_program_name)
                        ->whereNull('work_unit_log_uuid')
                        ->where('work_unit_status', 1)
                        ->first();
                    if ($dataWorkUnit != null) {
                        $work_program_work_unit_uuid = $dataWorkUnit->work_unit_uuid;
                    }
                }
                $work_program_work_unit_uuid = (($work_program_work_unit_uuid == '') ? $prev_work_program_work_unit_uuid : $work_program_work_unit_uuid);

                if ($row[1] != '') {
                    $data_create = new Trx_work_programs();

                    if (Str::length($work_program_code) == 9) {
                        $data_create->work_program_parent_uuid = '0';
                        $prev_work_program_parent_uuid = $work_program_uuid;
                    } else if (Str::length($work_program_code) == 4) {
                        $data_create->work_program_parent_uuid = $prev_work_program_parent_uuid;
                        $prev_work_program_parent_uuid_lvl_3 = $work_program_uuid;
                    } else if ($work_program_code == '') {
                        $data_create->work_program_parent_uuid = $prev_work_program_parent_uuid_lvl_3;
                        if ($prev_work_program_work_unit_uuid != $work_program_work_unit_uuid) {
                            $prev_work_program_parent_uuid_lvl_4 = $work_program_uuid;
                        }
                    } else if (Str::length($work_program_code) == 1 && is_numeric($work_program_code) == 1) {
                        $prev_work_program_parent_name_select = $work_program_name;
                        $prev_work_program_parent_code_select = $work_program_code;
                        $data_create->work_program_parent_uuid = $prev_work_program_parent_uuid_lvl_4;
                        $prev_work_program_parent_uuid_lvl_5 = $work_program_uuid;
                        $prev_work_program_parent_uuid_lvl_6 = $work_program_uuid;
                    } else if (Str::length($work_program_code) == 1 && is_numeric($work_program_code) == 0) {
                        $prev_work_program_parent_name_select = $work_program_name;
                        $prev_work_program_parent_code_select = $work_program_code;
                        $data_create->work_program_parent_uuid = $prev_work_program_parent_uuid_lvl_5;
                        $prev_work_program_parent_uuid_lvl_6 = $work_program_uuid;
                    } else if (Str::length($work_program_code) == 6) {
                        $data_create->work_program_parent_uuid = $prev_work_program_parent_uuid_lvl_6;
                        $data_create->work_program_is_last_child = 1;
                    }
                    if ($this->document_type == 'data_inisiasi') {
                        DB::beginTransaction();
                        $data_create->work_program_uuid = $work_program_uuid;


                        $data_create->work_program_work_unit_uuid = $work_program_work_unit_uuid;
                        $data_create->work_program_year = $work_program_year;
                        $data_create->work_program_name = $work_program_name;
                        $data_create->work_program_code = $work_program_code;
                        $data_create->work_program_create_by = '';
                        $data_create->work_program_create_date = $create_date;
                        $data_create->work_program_status = 1;

                        $data_create->save();
                        DB::commit();
                    } else {
                        if (Str::length($work_program_code) == 6) {
                            $dataprogram = View_work_program_parent::where('work_program_status', 1)
                                ->where('work_program_year', $work_program_year)
                                ->where('work_program_code', $work_program_code)
                                ->where('work_program_name', $work_program_name)
                                ->where('work_program_parent_code', $prev_work_program_parent_code_select)
                                ->where('work_program_parent_name', $prev_work_program_parent_name_select)
                                ->where('work_program_work_unit_uuid', $work_program_work_unit_uuid)
                                ->whereNull('work_program_log_uuid')
                                ->first();

                            if ($dataprogram == null) {
                                echo 'work_program_year = ' . $work_program_year . '<br>work_program_code = ' . $work_program_code . '<br>work_program_name = ' . $work_program_name . '<br>work_program_work_unit_uuid = ' . $work_program_work_unit_uuid . '<br>work_program_parent_code = ' . $prev_work_program_parent_code_select . '<br>work_program_parent_name = ' . $prev_work_program_parent_name_select;
                                die();
                            }

                            $work_program_uuid = $dataprogram->work_program_parent_uuid;
                        }
                    }


                    if (Str::length($work_program_code) == 6) {
                        $budget_plafon = trim($row[2]);
                        if (is_numeric($budget_plafon)) {
                            $budget_plafon = (($budget_plafon == '') ? 0 : $budget_plafon * 1);
                        } else {
                            $budget_plafon = 0;
                        }

                        $budget_realization = trim($row[3]);
                        if (is_numeric($budget_realization)) {
                            $budget_realization = (($budget_realization == '') ? 0 : $budget_realization * 1);
                        } else {
                            $budget_realization = 0;
                        }
                     
                        $datarealisasi[] = $budget_realization;

                        DB::beginTransaction();
                        $data_create_pagu = new Trx_budgets();


                        $data_create_pagu->budget_uuid = GlobalHelper::getuuid();
                        $data_create_pagu->budget_year = $this->year;
                        $data_create_pagu->budget_month = $this->month;
                        $data_create_pagu->budget_plafon = $budget_plafon;
                        $data_create_pagu->budget_realization = $budget_realization;
                        $data_create_pagu->budget_work_program_uuid = $work_program_uuid;
                        $data_create_pagu->budget_create_by = '';
                        $data_create_pagu->budget_create_date = $create_date;
                        $data_create_pagu->budget_status = 1;

                        if ($this->document_type == 'data_inisiasi') {
                            $data_create_pagu->budget_month = 1;
                            // $data_create_pagu->budget_realization = 0;
                        }
                        $data_create_pagu->save();

                        DB::commit();
                    }
                }

                $prev_work_program_work_unit_uuid = $work_program_work_unit_uuid;
            }
            // echo '<pre>';
            // print_r($datarealisasi);
            // die();
        } catch (\Exception $e) {
            DB::rollBack();

            echo '<pre>';
            echo $e->getMessage();
            die();
        }
        // echo '<pre>';
        // print_r($collection);
        // die();
        // $idx = 0;
        // foreach ($collection as $value) {
        //     // if ($idx < 2) {
        //         $work_program_code = trim($value[0]);
        //         $work_program_name = trim($value[1]);
        //         // $data['work_program_name'] = $work_program_name;
        //         // Trx_work_programs::create($data);
        //         // dd($wew);
        //         Trx_work_programs::create(
        //             [
        //                 'work_program_uuid' => GlobalHelper::getuuid(),
        //                 'work_program_year' => '2024',
        //                 'work_program_name' => $work_program_name,
        //                 'work_program_code' => $work_program_code,
        //             ]
        //         );
        //     // }
        //     $idx++;
        // }
    }
}
