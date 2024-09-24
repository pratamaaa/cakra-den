<?php
namespace App\Helpers;

use PhpOffice\PhpSpreadsheet\IOFactory;

class SheetNameFinder
{
    public function getSheetNames($filePath)
    {
        $spreadsheet = IOFactory::load($filePath);
        $sheetNames = $spreadsheet->getSheetNames();

        return $sheetNames;
    }

    public function getSheetIndexByName($filePath, $desiredSheetName)
    {
        $sheetNames = $this->getSheetNames($filePath);

        $index = array_search($desiredSheetName, $sheetNames);
        
        return $index !== false ? $index : null; // Return index if found, null otherwise
    }
}
