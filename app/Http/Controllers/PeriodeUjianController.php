<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\View_trx_exam_period;
use App\Helpers\GlobalHelper;
use App\Models\Trx_exam_period;



class PeriodeUjianController extends Controller
{
    public function index()
    {
        $data = array();
        // echo '<pre>';
        // print_r($this->site_menu);
        // die();
        return view('periodeujian.index', $data);
    }
    public function create(Request $request)
    {
        $data = array();
        if ($this->method == 'POST') {
            $rules = [
                'exam_period_date' => 'required',
                'exam_period_register_start_date' => 'required',
                'exam_period_register_end_date' => 'required',
                'exam_period_register_date' => 'required',
                'exam_period_description' => 'max:255',
            ];
            $validator = $this->validate($request, $rules);
            $exam_period_date = $request->input('exam_period_date', null);
            $exam_period_register_start_date = $request->input('exam_period_register_start_date', null);
            $exam_period_register_end_date = $request->input('exam_period_register_end_date', null);
            $exam_period_description = $request->input('exam_period_description', null);
            try {
                DB::beginTransaction();
                $data_create = new Trx_exam_period;
                $data_create->exam_pessriod_uuid = $this->uuid();
                $data_create->exam_period_date = $exam_period_date;
                $data_create->exam_period_register_start_date = $exam_period_register_start_date;
                $data_create->exam_period_register_end_date = $exam_period_register_end_date;
                $data_create->exam_period_description = $exam_period_description;
                $data_create->exam_period_create_by = $this->user_uuid;
                $data_create->exam_period_create_date = date('Y-m-d H:i:s', time());
                $data_create->exam_period_status = 1;
                $data_create->save();
                DB::commit();
                return redirect('periodeujian')->with('status_show_notif', 1);
            } catch (\Exception $e) {
                DB::rollback();
                //return back()->withInput();
                return redirect('periodeujian')->withErrors($validator)->withInput($request->all())->with('status_show_notif', 2);
            }
            
        } else {
            return view('periodeujian.create', $data);
        }
    }
    public function save_create(Request $request)
    {
        $data = array();
        $input = $request->all();
        $name = $request->input('name');
        echo '<pre>';
        print_r($input);
        die();
    }
    public function listdata(Request $request)
    {
        $field_name = array(
            'exam_period_id',
            'exam_period_date',
            'exam_period_register_start_date',
            'exam_period_register_end_date',
            'exam_period_status_name',
            'exam_period_status'
        );
        $where_data = array(
            '1 = 1'
        );
        $nama_table = 'view_trx_exam_period';
        $default_order = '';
        $result = array();
        $aaData = array();
        try {
            DB::enableQueryLog();
            $getdata = GlobalHelper::Datatable($request, $nama_table, $field_name, $where_data, $default_order);
            $getdata_status = $getdata['status'];

            if ($getdata_status == 1) {
                $result['iTotalRecords'] = (int)$getdata['iTotalRecords'];
                $result['iTotalDisplayRecords'] = (int)$getdata['iTotalRecords'];
                $nomor = (int)$getdata['nomor'];
                foreach ($getdata['result'] as $index => $row) {
                    $aaData[$index][] = $nomor;
                    $aaData[$index][] = GlobalHelper::parseDateID($row->exam_period_date, 'short');
                    $aaData[$index][] = GlobalHelper::parseDateID($row->exam_period_register_start_date, 'short');
                    $aaData[$index][] = GlobalHelper::parseDateID($row->exam_period_register_end_date, 'short');
                    $aaData[$index][] = $row->exam_period_status_name;
                    $aksi = '';
                    $aksi .= '<div class="d-inline-flex">';

                    $aksi .= '<a href="#" class="text-body" style="margin-left:2px;margin-right:2px;"><i class="ph-pen"></i></a>';
                    $aksi .= '<a href="#" class="text-body" style="margin-left:2px;margin-right:2px;"><i class="ph-trash"></i></a>';
                    $aksi .= '<a href="#" class="text-body" style="margin-left:2px;margin-right:2px;"><i class="ph-article"></i></a>';
                    $aksi .= '<a href="#" class="text-body" style="margin-left:2px;margin-right:2px;"><i class="ph-gear"></i></a>';
                    $aksi .= '</div>';
                    $aaData[$index][] = $aksi;
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
