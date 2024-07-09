<?php

namespace App\Imports;

use App\Models\Trx_work_programs;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\SkipsEmptyRows;

class Trx_work_programsImport implements ToCollection, SkipsEmptyRows
{
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function collection(Collection $rows)
    {
        // dd($rows);
        foreach ($rows as $row) 
        {
            Trx_work_programs::create([
                'work_program_name' => $row[2],
            ]);
        }
    }
}
