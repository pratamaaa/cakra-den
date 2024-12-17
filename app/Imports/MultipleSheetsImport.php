<?php

namespace App\Imports;

use App\Helpers\SheetNameFinder;
use Maatwebsite\Excel\Concerns\WithMultipleSheets;
use Maatwebsite\Excel\Concerns\SkipsUnknownSheets;
use Maatwebsite\Excel\Concerns\WithConditionalSheets;
use Maatwebsite\Excel\Concerns\HasReferencesToOtherSheets;

class MultipleSheetsImport implements WithMultipleSheets, SkipsUnknownSheets, HasReferencesToOtherSheets
{
    protected $sheet_perbagian;
    protected $sheet_perbelanja;
    protected $sheet_paparan;
    protected $sheet_apk;
    private $year;
    private $month;
    private $document_type;
    private $sort_sheet;

    public function __construct($filePath,int $year, int $month, $document_type)
    {
        $finder = new \App\Helpers\SheetNameFinder();
        $this->sheet_perbagian = $finder->getSheetIndexByName($filePath, 'PER BAGIAN');
        $this->sheet_perbelanja = $finder->getSheetIndexByName($filePath, 'Per Belanja');
        $this->sheet_paparan = $finder->getSheetIndexByName($filePath, 'PAPARAN');
        $this->sheet_apk = $finder->getSheetIndexByName($filePath, 'APK');
        $this->year = $year;
        $this->month = $month;
        $this->document_type = $document_type;
        
        if ($this->sheet_perbagian === null) {
            throw new \Exception("Sheet with name PER BAGIAN not found.");
        }
        if ($this->sheet_perbelanja === null) {
            throw new \Exception("Sheet with name Per Belanja not found.");
        }
        if ($this->sheet_paparan === null) {
            throw new \Exception("Sheet with name Paparan not found.");
        }
        if ($this->sheet_apk === null) {
            throw new \Exception("Sheet with name APK not found.");
        }
    }

    public function onUnknownSheet($sheetName)
    {
        // E.g. you can log that a sheet was not found.
        info("Sheet {$sheetName} was skipped");
    }
    public function sheets(): array
    {
        return [
            $this->sheet_paparan => new PaparanSheetImport($this->year, $this->month),
            $this->sheet_perbagian => new PerbagianSheetImport($this->year, $this->month),  // Ensure these are instances of the import classes
            $this->sheet_perbelanja => new PerbelanjaSheetImport($this->year, $this->month),
            $this->sheet_apk => new ApkSheetImport($this->year, $this->month),
            // 'PER BAGIAN' => new SecondSheetImport(),
            // Add more sheets as necessary
        ];
    }
}

