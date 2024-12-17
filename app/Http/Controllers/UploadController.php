<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\URL;
use Illuminate\Http\File;
use Illuminate\Support\Facades\Storage;
use Carbon\Carbon;
use App\Helpers\GlobalHelper;
use App\Imports\UploadImport;
use App\Imports\RealisasiImport;
use App\Imports\WorkProgramImport;
use Maatwebsite\Excel\Facades\Excel;
use Maatwebsite\Excel\Concerns\WithMultipleSheets;
use App\Models\Trx_upload;
use App\Imports\Trx_work_programsImport;
use App\Imports\MultipleSheetsImport;

class UploadController extends Controller
{
    public function index()
    {
        $data = array();
        // echo '<pre>';
        // print_r($this->site_menu);
        // die();
        return view('upload.index', $data);
    }
    public function create(Request $request)
    {
        $data = array();

        if ($this->method == 'POST') {
            $document_type = $request->input('jenis_upload', 1);
            $tahun = $request->input('tahun', date('Y'));
            $bulan = $request->input('bulan', date('m'));
            $filePath = $request->file('upload_file')->store('uploads');



            // Path ke file yang diupload
            $fullPath = storage_path('app/' . $filePath);

            // Inisialisasi MultipleSheetsImport dengan file path
            try {
                if ($document_type == 'data_inisiasi') {
                    $bulan = 1;
                }

                DB::beginTransaction();
                $data_create = new Trx_upload();
                $data_create->upload_uuid = $this->uuid();
                $data_create->upload_type = $document_type;
                $data_create->upload_file_path = $fullPath;
                $data_create->upload_create_by = $this->user_uuid;
                $data_create->upload_create_date = date('Y-m-d H:i:s', time());
                $data_create->upload_status = 1;
                $data_create->upload_year = $tahun;
                $data_create->upload_month = $bulan;
                $data_create->save();
                DB::commit();

                $import = new MultipleSheetsImport($fullPath, $tahun, $bulan, $document_type);

                // Lakukan impor
                Excel::import($import, $fullPath);
                return redirect('upload')->with('status_show_notif', 1);
            } catch (\Exception $e) {
                echo '<pre>';
                print_r($e->getMessage());
                die();
                return redirect('upload')->with('status_show_notif', 0);
            }

            // try {
            //     $request->validate([
            //         'upload_file' => 'required|mimes:xls,xlsx'
            //     ]);

            //     Excel::import(new MultipleSheetsImport($request->file('upload_file')), $request->file('upload_file'));
            //     echo 'ok';
            //     die();
            //     return back()->with('success', 'Excel file uploaded and data imported successfully.');
            // } catch (\Exception $e) {
            //     //DB::rollback();
            //     echo '<pre>';
            //     print_r($e->getMessage());
            //     die();
            //     $data['error'] = $e->getMessage();
            // }
        } else {
            $data['temp_uuid'] = $this->uuid();
        }
        return view('upload.create2', $data);
    }
    public function create_backup(Request $request)
    {
        $data = array();

        if ($this->method == 'POST') {
            try {
                $file = $request->file('upload_file');
                $document_file_ext = $file->extension();
                $document_type = $request->input('jenis_upload', '');
                $tahun = $request->input('tahun', '');
                $bulan = $request->input('bulan', '');
                $document_file_size = $request->input('fileSize', 0);
                $document_name = $document_type . '_' . time();
                $document_temp_code = $request->input('file_upload_code', '');
                $document_file_name = $document_name . '.' . $document_file_ext;
                $document_file_path = Storage::putFileAs('upload', $file, $document_file_name, 'private');
                $document_file_mime = Storage::mimeType($document_file_path);
                DB::beginTransaction();
                $data_create = new Trx_upload();
                $data_create->upload_uuid = $this->uuid();
                $data_create->upload_type = $document_type;
                $data_create->upload_file_path = $document_file_path;
                $data_create->upload_create_by = $this->user_uuid;
                $data_create->upload_create_date = date('Y-m-d H:i:s', time());
                $data_create->upload_status = 1;
                $data_create->save();
                DB::commit();

                $data['error'] = '';
                $data['initialPreview'] = [];
                $data['initialPreviewConfig'] = [];
                $data['initialPreviewThumbTags'] = [];
                $data['append'] = false;
                $data['request'] = $request->all();

                $path = Storage::path('upload/' . $document_name . '.xlsx');

                //Excel::import(new Trx_work_programsImport(), request()->file('upload_file'));

                Excel::import(new RealisasiImport($tahun, $bulan, $document_type), request()->file('upload_file'));

                //$array = Excel::toArray([], request()->file('upload_file'));
                //$excel = Excel::import(new WorkProgramImport(), $path);


                echo '<pre>';
                print_r($path);
                die();
                return redirect('upload')->with('status_show_notif', 1);
            } catch (\Exception $e) {
                //DB::rollback();
                echo '<pre>';
                print_r($e->getMessage());
                die();
                $data['error'] = $e->getMessage();
            }
        } else {
            $data['temp_uuid'] = $this->uuid();
        }
        return view('upload.create', $data);
    }

    public function listdata(Request $request)
    {

        $field_name = array(
            'upload_type_name',
            'upload_year',
            'upload_create_date',
            'upload_uuid',
        );
        $where_data = array(
            '1 = 1',
        );
        $nama_table = 'view_trx_upload';
        $default_order = 'upload_create_date DESC';
        $result = array();
        $aaData = array();
        try {
            DB::enableQueryLog();
            $getdata = GlobalHelper::Datatable($request, $nama_table, $field_name, $where_data, $default_order);

            $result['iTotalRecords'] = (int)((count($getdata) > 0) ? count($getdata) : 0);
            $result["nomor"] = (($request->input('start') != null) ? ((int)$request->input('start') + 1) : 0);
            $result['iTotalDisplayRecords'] = (int)count($getdata);
            $result['result'] = $getdata;
            $getdata_status = $getdata['status'];

            if ($getdata_status == 1) {
                $result['iTotalRecords'] = (int)$getdata['iTotalDisplayRecords'];
                $result['iTotalDisplayRecords'] = (int)$getdata['iTotalRecords'];
                $nomor = (int)$getdata['nomor'];

                foreach ($getdata['result'] as $index => $row) {
                    $aaData[$index][] = $nomor;
                    $aaData[$index][] = $row->upload_type_name;
                    $aaData[$index][] = $row->upload_year;
                    $aaData[$index][] = $row->upload_month;
                    $aaData[$index][] = $row->upload_create_date;
                    $nomor++;
                }
            }
            $result['aaData'] = $aaData;
            $result['getdata'] = $getdata;
            return response(
                json_encode($result),
                200
            )->header('Content-Type', 'application/json');
        } catch (\Exception $e) {
            return response(
                json_encode($e->getMessage()),
                400
            )->header('Content-Type', 'application/json');
        }
    }
}
