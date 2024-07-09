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


class MatriksImport implements ToArray, HasReferencesToOtherSheets, WithCalculatedFormulas
{
    public function array($row)
    {
        // echo '<pre>';
        // print_r($row);
        // die();
    }
}
