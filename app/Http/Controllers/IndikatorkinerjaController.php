<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\URL;
use App\Models\Trx_dashboard_realisasi;
use App\Models\View_trx_dashboard_realisasi;
use App\Models\Trx_sasaran_strategis;
use App\Models\View_trx_sasaran_strategis;
use App\Models\Trx_indikator_kinerja;
use App\Models\View_trx_indikator_kinerja;

use App\Helpers\GlobalHelper;
use App\Models\Mst_work_units;

class IndikatorkinerjaController extends Controller
{

    public function index(Request $request)
    {
        $data = array();
        return view('indikatorkinerja.index', $data);
    }


    public function create(Request $request)
    {
        $data = array();
        if ($this->method == 'POST') {

            $rules = [
                'indikator_kinerja_sasaran_strategis_uuid' => 'required',
                'indikator_kinerja_name' => 'required',
                'indikator_kinerja_satuan' => 'required',
                'indikator_kinerja_target' => 'required',
            ];
            $validator = $this->validate($request, $rules);

            $indikator_kinerja_sasaran_strategis_uuid = htmlentities($request->input('indikator_kinerja_sasaran_strategis_uuid', null));
            $indikator_kinerja_name = htmlentities($request->input('indikator_kinerja_name', null));
            $indikator_kinerja_satuan = htmlentities($request->input('indikator_kinerja_satuan', null));
            $indikator_kinerja_target = htmlentities($request->input('indikator_kinerja_target', null));


            try {
                DB::beginTransaction();

                $data_create = new Trx_indikator_kinerja();
                $data_create->indikator_kinerja_uuid = $this->uuid();
                $data_create->indikator_kinerja_sasaran_strategis_uuid = $indikator_kinerja_sasaran_strategis_uuid;
                $data_create->indikator_kinerja_name = $indikator_kinerja_name;
                $data_create->indikator_kinerja_satuan = $indikator_kinerja_satuan;
                $data_create->indikator_kinerja_target = $indikator_kinerja_target;
                $data_create->indikator_kinerja_create_by = $this->user_uuid;
                $data_create->indikator_kinerja_create_date = date('Y-m-d H:i:s', time());
                $data_create->indikator_kinerja_status = 1;

                $data_create->save();
                DB::commit();

                return redirect('indikatorkinerja')->with('status_show_notif', 1);
            } catch (\Exception $e) {
                echo '<pre>';
                print_r($request->input());
                print_r($e->getMessage());
                die();
                DB::rollback();
                return redirect('indikatorkinerja')->withErrors($validator)->withInput($request->all())->with('status_show_notif', 2);
            }
        } else {

            $data['temp_uuid'] = $this->uuid();
            $ss = Trx_sasaran_strategis::where('sasaran_strategis_status', 1)
                ->orderBy('sasaran_strategis_sort', 'asc')
                ->whereNull('sasaran_strategis_log_uuid')
                ->get();
            $work_unit = Mst_work_units::where('work_unit_status', 1)
                ->where('work_unit_parent_uuid', '<>', '0')
                ->orderBy('work_unit_sort', 'asc')
                ->whereNull('work_unit_log_uuid')
                ->get();
            $data['work_unit'] = $work_unit;
            $data['ss'] = $ss;
            return view('indikatorkinerja.create', $data);
        }
    }
    public function update(Request $request)
    {
        $data = array();
        if ($this->method == 'POST') {


            $rules = [
                'indikator_kinerja_uuid' => 'required',
                'indikator_kinerja_name' => 'required',
                'indikator_kinerja_satuan' => 'required',
                'indikator_kinerja_target' => 'required',
                'indikator_kinerja_sasaran_strategis_uuid' => 'required',
            ];
            $validator = $this->validate($request, $rules);
            $indikator_kinerja_uuid = htmlentities($request->input('indikator_kinerja_uuid', null));
            $indikator_kinerja_sasaran_strategis_uuid = htmlentities($request->input('indikator_kinerja_sasaran_strategis_uuid', null));
            $indikator_kinerja_name = htmlentities($request->input('indikator_kinerja_name', null));
            $indikator_kinerja_satuan = htmlentities($request->input('indikator_kinerja_satuan', null));
            $indikator_kinerja_target = htmlentities($request->input('indikator_kinerja_target', null));
            $indikator_kinerja_realisasi = htmlentities($request->input('indikator_kinerja_realisasi', null));
            
            try {
                DB::beginTransaction();

                $data_create = Trx_indikator_kinerja::where('indikator_kinerja_status', 1)
                    ->where('indikator_kinerja_uuid', $indikator_kinerja_uuid)
                    ->whereNull('indikator_kinerja_log_uuid')
                    ->first();

                $data_create->indikator_kinerja_sasaran_strategis_uuid = $indikator_kinerja_sasaran_strategis_uuid;
                $data_create->indikator_kinerja_name = $indikator_kinerja_name;
                $data_create->indikator_kinerja_satuan = $indikator_kinerja_satuan;
                $data_create->indikator_kinerja_target = $indikator_kinerja_target;
                $data_create->indikator_kinerja_realisasi = $indikator_kinerja_realisasi;

                $data_create->indikator_kinerja_create_by = $this->user_uuid;
                $data_create->indikator_kinerja_create_date = date('Y-m-d H:i:s', time());
                $data_create->indikator_kinerja_status = 1;

                $data_create->save();
                DB::commit();

                return redirect('indikatorkinerja')->with('status_show_notif', 1);
            } catch (\Exception $e) {
                // echo '<pre>';
                // print_r($request->input());
                // print_r($e->getMessage());
                // die();
                DB::rollback();
                return redirect('indikatorkinerja')->withErrors($validator)->withInput($request->all())->with('status_show_notif', 2);
            }
        } else {

            $data['temp_uuid'] = $this->uuid();


            $indikator_kinerja_uuid = htmlentities($request->input('uuid', null));

            $data['temp_uuid'] = $this->uuid();
            $ss = Trx_sasaran_strategis::where('sasaran_strategis_status', 1)
                ->orderBy('sasaran_strategis_sort', 'asc')
                ->whereNull('sasaran_strategis_log_uuid')
                ->get();
            $work_unit = Mst_work_units::where('work_unit_status', 1)
                ->where('work_unit_parent_uuid', '<>', '0')
                ->orderBy('work_unit_sort', 'asc')
                ->whereNull('work_unit_log_uuid')
                ->get();
            $data['work_unit'] = $work_unit;
            $data['ss'] = $ss;

            $detail = View_trx_indikator_kinerja::where('indikator_kinerja_status', 1)
                ->where('indikator_kinerja_uuid', $indikator_kinerja_uuid)
                ->whereNull('indikator_kinerja_log_uuid')
                ->first();
            $data['detail'] = $detail;

            return view('indikatorkinerja.update', $data);
        }
    }
    public function detail(Request $request)
    {
        $data['temp_uuid'] = $this->uuid();


        $indikator_kinerja_uuid = htmlentities($request->input('uuid', null));

        $data['temp_uuid'] = $this->uuid();
        $ss = Trx_sasaran_strategis::where('sasaran_strategis_status', 1)
            ->orderBy('sasaran_strategis_sort', 'asc')
            ->whereNull('sasaran_strategis_log_uuid')
            ->get();
        $work_unit = Mst_work_units::where('work_unit_status', 1)
            ->where('work_unit_parent_uuid', '<>', '0')
            ->orderBy('work_unit_sort', 'asc')
            ->whereNull('work_unit_log_uuid')
            ->get();
        $data['work_unit'] = $work_unit;
        $data['ss'] = $ss;

        $detail = View_trx_indikator_kinerja::where('indikator_kinerja_status', 1)
            ->where('indikator_kinerja_uuid', $indikator_kinerja_uuid)
            ->whereNull('indikator_kinerja_log_uuid')
            ->first();
        $data['detail'] = $detail;

        return view('indikatorkinerja.detail', $data);
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

    public function get_ss(Request $request)
    {
        $data = array();
        if ($this->method == 'POST') {

            $sasaran_strategis_year = htmlentities($request->input('sasaran_strategis_year', null));

            $View_trx_sasaran_strategis = View_trx_sasaran_strategis::where('sasaran_strategis_status', 1)
                ->where('sasaran_strategis_year', $sasaran_strategis_year)
                ->whereNull('sasaran_strategis_log_uuid')
                ->orderBy('sasaran_strategis_sort', 'asc')
                ->orderBy('sasaran_strategis_id', 'asc')
                ->get();
            return response(
                json_encode($View_trx_sasaran_strategis),
                200
            )->header('Content-Type', 'application/json');
        }
    }
    public function list(Request $request)
    {
        $field_name = array(
            'indikator_kinerja_id',
            'indikator_kinerja_name',
            'sasaran_strategis_name',
            'indikator_kinerja_satuan',
            'indikator_kinerja_target',
            'indikator_kinerja_realisasi',
        );

        $sasaran_strategis_year = $request->input('sasaran_strategis_year', '');
        $where_data = array(
            '1 = 1',
            'indikator_kinerja_log_uuid IS NULL',
        );
        if ($sasaran_strategis_year != 'Semua') {
            $where_data[] = "sasaran_strategis_year = '" . $sasaran_strategis_year . "'";
        }

        $nama_table = 'view_trx_indikator_kinerja';
        $default_order = 'sasaran_strategis_sort ASC, indikator_kinerja_sort ASC';
        $result = array();
        $aaData = array();
        try {
            DB::enableQueryLog();
            $getdata = GlobalHelper::Datatable($nama_table, $field_name, $where_data, $default_order, $request);
            $getdata_status = $getdata['status'];

            if ($getdata_status == 1) {
                $result['iTotalRecords'] = (int)$getdata['iTotalDisplayRecords'];
                $result['iTotalDisplayRecords'] = (int)$getdata['iTotalRecords'];
                $nomor = (int)$getdata['nomor'];



                foreach ($getdata['result'] as $index => $row) {
                    $aaData[$index][] = $nomor;
                    $aaData[$index][] = $row->indikator_kinerja_name;
                    $aaData[$index][] = $row->sasaran_strategis_name;
                    $aaData[$index][] = $row->indikator_kinerja_satuan;
                    $aaData[$index][] = $row->indikator_kinerja_target;
                    $aaData[$index][] = $row->indikator_kinerja_realisasi;

                    $aksi = '';
                    $aksi .= '<div class="d-inline-flex">';

                    $aksi .= '<a href="' . URL::to('/indikatorkinerja/update?uuid=' . $row->indikator_kinerja_uuid) . '" class="text-body" style="margin-left:2px;margin-right:2px;" data-bs-popup="tooltip" data-bs-placement="top" data-bs-original-title="Update Data"><i class="ph-note-pencil"></i></a>';

                    $aksi .= '<a href="' . URL::to('/indikatorkinerja/detail?uuid=' . $row->indikator_kinerja_uuid) . '" class="text-body" style="margin-left:2px;margin-right:2px;" data-bs-popup="tooltip" data-bs-placement="top" data-bs-original-title="Lihat Data"><i class="ph-clipboard-text"></i></a>';
                    // $aksi .= '<a href="'.URL::to('/indikatorkinerja/update?uuid='.$row->exam_period_uuid).'" class="text-body" style="margin-left:2px;margin-right:2px;" data-bs-popup="tooltip" data-bs-placement="auto" data-bs-original-title="Bottom tooltip"><i class="ph-gear"></i></a>';
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
