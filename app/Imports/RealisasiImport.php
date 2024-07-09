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
use Illuminate\Support\Facades\DB;
use App\Models\Trx_work_programs;
use App\Models\Trx_work_programs_new;
use App\Helpers\GlobalHelper;
use Illuminate\Support\Str;
use App\Models\Mst_work_units;
use App\Models\Trx_budgets;
use App\Models\View_work_program_parent;
use App\Imports\MatriksImport;
use App\Imports\PerbagianImport;

use Maatwebsite\Excel\Concerns\ToArray;
use Maatwebsite\Excel\Concerns\SkipsOnFailure;
use Maatwebsite\Excel\Validators\Failure;
use Maatwebsite\Excel\Concerns\SkipsErrors;


class RealisasiImport implements WithMultipleSheets
{

    public function __construct($year, $month, $document_type = '')
    {
        $this->year = $year;
        $this->month = $month;
        $this->document_type = $document_type;
    }
    public function sheets(): array
    {
        return [
            // 'MATRIKS' => new MatriksImport(),
            3 => new PerbagianImport($this->year, $this->month, $this->document_type),
        ];
        // return [
        //     new MatriksImport(),
        //     null,
        //     new PerbagianImport($this->year, $this->month, $this->document_type),
        // ];
    }

    // public function sheets(): array
    // {
    //     return [
    //         'MATRIKS' => new MatriksImport(),
    //         'PER BAGIAN' => new PerbagianImport($this->year,$this->month,$this->document_type),
    //     ];
    // }
    public function onUnknownSheet($sheetName)
    {
        // E.g. you can log that a sheet was not found.
        info("Sheet {$sheetName} was skipped");
    }
}
