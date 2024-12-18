<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\URL;
use App\Models\Trx_dashboard_realisasi;
use App\Models\View_trx_dashboard_realisasi;
use App\Models\Trx_sasaran_strategis;
use App\Models\Trx_target;
use App\Models\View_trx_target;


use App\Helpers\GlobalHelper;
use App\Models\Mst_work_units;

class TargetrenkasController extends Controller
{

    public function index(Request $request)
    {
        $data = array();
        return view('target_renkas.index', $data);
    }
    public function create(Request $request)
    {
        $data = array();
        if ($this->method == 'POST') {


            $rules = [
                'target_year' => 'required',
            ];
            $validator = $this->validate($request, $rules);

            $target_year = htmlentities($request->input('target_year', null));



            $work_unit = Mst_work_units::where('work_unit_status', 1)
                // ->where('work_unit_parent_uuid', '<>', '0')
                ->orderBy('work_unit_sort', 'asc')
                ->whereNull('work_unit_log_uuid')
                ->get();




            try {
                DB::beginTransaction();
                $target_create_by = $this->user_uuid;
                $target_create_date = date('Y-m-d H:i:s', time());
                foreach ($work_unit as $key => $value) {
                    $target_value_percent_1 = $request->input('target_month_' . $value->work_unit_id . '_1', null);
                    $target_value_percent_2 = $request->input('target_month_' . $value->work_unit_id . '_2', null);
                    $target_value_percent_3 = $request->input('target_month_' . $value->work_unit_id . '_3', null);
                    $target_value_percent_4 = $request->input('target_month_' . $value->work_unit_id . '_4', null);
                    $target_value_percent_5 = $request->input('target_month_' . $value->work_unit_id . '_5', null);
                    $target_value_percent_6 = $request->input('target_month_' . $value->work_unit_id . '_6', null);
                    $target_value_percent_7 = $request->input('target_month_' . $value->work_unit_id . '_7', null);
                    $target_value_percent_8 = $request->input('target_month_' . $value->work_unit_id . '_8', null);
                    $target_value_percent_9 = $request->input('target_month_' . $value->work_unit_id . '_9', null);
                    $target_value_percent_10 = $request->input('target_month_' . $value->work_unit_id . '_10', null);
                    $target_value_percent_11 = $request->input('target_month_' . $value->work_unit_id . '_11', null);
                    $target_value_percent_12 = $request->input('target_month_' . $value->work_unit_id . '_12', null);


                    $data_create = new Trx_target;
                    $data_create->target_uuid = $this->uuid();
                    $data_create->target_year = $target_year;
                    $data_create->target_work_unit_uuid = $value->work_unit_uuid;
                    $data_create->target_value_percent_1 = $target_value_percent_1;
                    $data_create->target_value_percent_2 = $target_value_percent_2;
                    $data_create->target_value_percent_3 = $target_value_percent_3;
                    $data_create->target_value_percent_4 = $target_value_percent_4;
                    $data_create->target_value_percent_5 = $target_value_percent_5;
                    $data_create->target_value_percent_6 = $target_value_percent_6;
                    $data_create->target_value_percent_7 = $target_value_percent_7;
                    $data_create->target_value_percent_8 = $target_value_percent_8;
                    $data_create->target_value_percent_9 = $target_value_percent_9;
                    $data_create->target_value_percent_10 = $target_value_percent_10;
                    $data_create->target_value_percent_11 = $target_value_percent_11;
                    $data_create->target_value_percent_12 = $target_value_percent_12;
                    $data_create->target_create_by = $target_create_by;
                    $data_create->target_create_date = $target_create_date;
                    $data_create->target_status = 1;
                    $data_create->save();
                }

                DB::commit();

                return redirect('targetrenkas')->with('status_show_notif', 1);
            } catch (\Exception $e) {
                echo '<pre>';
                print_r($request->input());
                print_r($e->getMessage());
                die();
                DB::rollback();
                return redirect('targetrenkas')->withErrors($validator)->withInput($request->all())->with('status_show_notif', 2);
            }
        } else {

            $data['temp_uuid'] = $this->uuid();
            $work_unit = Mst_work_units::where('work_unit_status', 1)
                // ->where('work_unit_parent_uuid', '<>', '0')
                ->orderBy('work_unit_sort', 'asc')
                ->whereNull('work_unit_log_uuid')
                ->get();
            $data['work_unit'] = $work_unit;
            return view('target_renkas.create', $data);
        }
    }
    public function update(Request $request)
    {
        $data = array();
        if ($this->method == 'POST') {

            $rules = [
                'target_uuid' => 'required',
                'target_work_unit_uuid' => 'required',
            ];
            $validator = $this->validate($request, $rules);
            $target_uuid = htmlentities($request->input('target_uuid', null));
            $target_create_by = $this->user_uuid;
            $target_create_date = date('Y-m-d H:i:s', time());
            try {
                DB::beginTransaction();
                $detail_log = Trx_target::where('target_status', 1)
                    ->where('target_uuid', $target_uuid)
                    ->whereNull('target_log_uuid')
                    ->first();
                $data_log = $detail_log->replicate();
                $data_log->target_log_uuid = $data_log->target_uuid;
                $data_log->save();

                $data_update = Trx_target::where('target_status', 1)
                    ->where('target_uuid', $target_uuid)
                    ->whereNull('target_log_uuid')
                    ->first();
                $work_unit_id = $request->input('work_unit_id', null);
                $target_value_percent_1 = $request->input('target_month_' . $work_unit_id . '_1', null);
                $target_value_percent_2 = $request->input('target_month_' . $work_unit_id . '_2', null);
                $target_value_percent_3 = $request->input('target_month_' . $work_unit_id . '_3', null);
                $target_value_percent_4 = $request->input('target_month_' . $work_unit_id . '_4', null);
                $target_value_percent_5 = $request->input('target_month_' . $work_unit_id . '_5', null);
                $target_value_percent_6 = $request->input('target_month_' . $work_unit_id . '_6', null);
                $target_value_percent_7 = $request->input('target_month_' . $work_unit_id . '_7', null);
                $target_value_percent_8 = $request->input('target_month_' . $work_unit_id . '_8', null);
                $target_value_percent_9 = $request->input('target_month_' . $work_unit_id . '_9', null);
                $target_value_percent_10 = $request->input('target_month_' . $work_unit_id . '_10', null);
                $target_value_percent_11 = $request->input('target_month_' . $work_unit_id . '_11', null);
                $target_value_percent_12 = $request->input('target_month_' . $work_unit_id . '_12', null);

                $data_update->target_value_percent_1 = $target_value_percent_1;
                $data_update->target_value_percent_2 = $target_value_percent_2;
                $data_update->target_value_percent_3 = $target_value_percent_3;
                $data_update->target_value_percent_4 = $target_value_percent_4;
                $data_update->target_value_percent_5 = $target_value_percent_5;
                $data_update->target_value_percent_6 = $target_value_percent_6;
                $data_update->target_value_percent_7 = $target_value_percent_7;
                $data_update->target_value_percent_8 = $target_value_percent_8;
                $data_update->target_value_percent_9 = $target_value_percent_9;
                $data_update->target_value_percent_10 = $target_value_percent_10;
                $data_update->target_value_percent_11 = $target_value_percent_11;
                $data_update->target_value_percent_12 = $target_value_percent_12;
                $data_update->target_create_by = $target_create_by;
                $data_update->target_create_date = $target_create_date;
                $data_update->save();

                DB::commit();

                return redirect('targetrenkas')->with('status_show_notif', 1);
            } catch (\Exception $e) {
                // echo '<pre>';
                // print_r($request->input());
                // print_r($e->getMessage());
                // die();
                DB::rollback();
                return redirect('targetrenkas')->withErrors($validator)->withInput($request->all())->with('status_show_notif', 2);
            }
        } else {

            $data['temp_uuid'] = $this->uuid();
            $work_unit = Mst_work_units::where('work_unit_status', 1)
                // ->where('work_unit_parent_uuid', '<>', '0')
                ->orderBy('work_unit_sort', 'asc')
                ->whereNull('work_unit_log_uuid')
                ->get();
            $data['work_unit'] = $work_unit;

            $target_uuid = htmlentities($request->input('uuid', null));
            $detail = View_trx_target::where('target_status', 1)
                ->where('target_uuid', $target_uuid)
                ->whereNull('target_log_uuid')
                ->first();
            $data['detail'] = $detail;

            return view('target_renkas.update', $data);
        }
    }
    public function detail_datarealisasi(Request $request)
    {
        $data = array();
        $data['temp_uuid'] = $this->uuid();

        $dashboard_realisasi_uuid = htmlentities($request->input('uuid', null));
        $detail = View_trx_dashboard_realisasi::where('dashboard_realisasi_status', 1)
            ->where('dashboard_realisasi_uuid', $dashboard_realisasi_uuid)
            ->where('dashboard_realisasi_version', 0)
            ->whereNull('dashboard_realisasi_log_uuid')
            ->first();
        $data['detail'] = $detail;

        return view('target_renkas.detail', $data);
    }
    public function checktahun(Request $request)
    {
        $data = array();
        if ($this->method == 'POST') {

            $dashboard_realisasi_year = htmlentities($request->input('dashboard_realisasi_year', null));

            $Trx_dashboard_realisasi = View_trx_dashboard_realisasi::where('dashboard_realisasi_status', 1)
                ->where('dashboard_realisasi_year', $dashboard_realisasi_year)
                ->whereNull('dashboard_realisasi_log_uuid')
                ->orderBy('dashboard_realisasi_create_date', 'desc')
                ->first();
            return response(
                json_encode($Trx_dashboard_realisasi),
                200
            )->header('Content-Type', 'application/json');
        }
    }

    public function checkpagu(Request $request)
    {
        $data = array();
        if ($this->method == 'POST') {

            $dashboard_realisasi_year = $request->input('dashboard_realisasi_year', '');

            $Trx_dashboard_realisasi = View_trx_dashboard_realisasi::where('dashboard_realisasi_status', 1)
                ->where('dashboard_realisasi_year', $dashboard_realisasi_year)
                ->where('dashboard_realisasi_version', 0)
                ->whereNull('dashboard_realisasi_log_uuid')
                ->first();
            return response(
                json_encode($Trx_dashboard_realisasi),
                200
            )->header('Content-Type', 'application/json');
        }
    }

    public function list(Request $request)
    {
        $field_name = array(
            'target_id',
            'work_unit_code',
            'target_year',
            'target_value_percent_1',
            'target_value_percent_2',
            'target_value_percent_3',
            'target_value_percent_4',
            'target_value_percent_5',
            'target_value_percent_6',
            'target_value_percent_7',
            'target_value_percent_8',
            'target_value_percent_9',
            'target_value_percent_10',
            'target_value_percent_11',
            'target_value_percent_12',
        );

        $target_year = $request->input('target_year', '');
        $where_data = array(
            '1 = 1',
            'target_log_uuid IS NULL',
        );
        if ($target_year != 'Semua') {
            $where_data[] = "target_year = '" . $target_year . "'";
        }

        $nama_table = 'view_trx_target';
        $default_order = 'work_unit_sort ASC';
        $result = array();
        $aaData = array();
        try {
            DB::enableQueryLog();
            $getdata = GlobalHelper::Datatable($request, $nama_table, $field_name, $where_data, $default_order );
            // echo '<pre>';
            // print_r($getdata);
            // die();
            $getdata_status = $getdata['status'];

            if ($getdata_status == 1) {
                $result['iTotalRecords'] = (int)$getdata['iTotalDisplayRecords'];
                $result['iTotalDisplayRecords'] = (int)$getdata['iTotalRecords'];
                $nomor = (int)$getdata['nomor'];

                foreach ($getdata['result'] as $index => $row) {
                    $aaData[$index][] = $nomor;
                    $aaData[$index][] = $row->work_unit_code;
                    $aaData[$index][] = $row->target_year;
                    $aaData[$index][] = $row->target_value_percent_1;
                    $aaData[$index][] = $row->target_value_percent_2;
                    $aaData[$index][] = $row->target_value_percent_3;
                    $aaData[$index][] = $row->target_value_percent_4;
                    $aaData[$index][] = $row->target_value_percent_5;
                    $aaData[$index][] = $row->target_value_percent_6;
                    $aaData[$index][] = $row->target_value_percent_7;
                    $aaData[$index][] = $row->target_value_percent_8;
                    $aaData[$index][] = $row->target_value_percent_9;
                    $aaData[$index][] = $row->target_value_percent_10;
                    $aaData[$index][] = $row->target_value_percent_11;
                    $aaData[$index][] = $row->target_value_percent_12;

                    $aksi = '';
                    $aksi .= '<div class="d-inline-flex">';

                    $aksi .= '<a href="' . URL::to('/targetrenkas/update?uuid=' . $row->target_uuid) . '" class="text-body" style="margin-left:2px;margin-right:2px;" data-bs-popup="tooltip" data-bs-placement="top" data-bs-original-title="Update Data"><i class="ph-note-pencil"></i></a>';

                    // $aksi .= '<a href="' . URL::to('/targetrenkas/detail?uuid=' . $row->target_uuid) . '" class="text-body" style="margin-left:2px;margin-right:2px;" data-bs-popup="tooltip" data-bs-placement="top" data-bs-original-title="Lihat Data"><i class="ph-clipboard-text"></i></a>';
                    // $aksi .= '<a href="'.URL::to('/targetrenkas/update?uuid='.$row->exam_period_uuid).'" class="text-body" style="margin-left:2px;margin-right:2px;" data-bs-popup="tooltip" data-bs-placement="auto" data-bs-original-title="Bottom tooltip"><i class="ph-gear"></i></a>';
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
