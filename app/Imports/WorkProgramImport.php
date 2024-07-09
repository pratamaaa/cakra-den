<?php

namespace App\Imports;

use App\Models\Trx_work_programs;
use Maatwebsite\Excel\Concerns\WithMultipleSheets;

class WorkProgramImport implements WithMultipleSheets 
{
   
    public function sheets(): array
    {
        return [
            'Worksheet 1' => new FirstSheetImport(),
            'Worksheet 2' => new SecondSheetImport(),
        ];
    }
}
