<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\URL;
use App\Models\Trx_dashboard_realisasi;
use App\Models\View_trx_dashboard_realisasi;

use App\Helpers\GlobalHelper;



class DashboardController extends Controller
{
    public function index()
    {
        $data = array();
        // echo '<pre>';
        // print_r($this->site_menu);
        // die();
        return view('dashboard', $data);
    }
    public function datarealisasi(Request $request)
    {
        $data = array();
        return view('dashboard_data_realisasi.index', $data);
    }
    public function create_datarealisasi(Request $request)
    {
        $data = array();
        if ($this->method == 'POST') {

            $rules = [
                'dashboard_realisasi_year' => 'required',
                'dashboard_realisasi_pegawai' => 'required',
                'dashboard_realisasi_barang' => 'required',
                'dashboard_realisasi_modal' => 'required',
                'dashboard_realisasi_total_belanja' => 'required',
            ];
            $validator = $this->validate($request, $rules);

            $dashboard_realisasi_year = htmlentities($request->input('dashboard_realisasi_year', null));
            $dashboard_realisasi_revision_name = htmlentities($request->input('dashboard_realisasi_revision_name', null));
            $dashboard_realisasi_pegawai = htmlentities($request->input('dashboard_realisasi_pegawai', null));
            $dashboard_realisasi_barang = htmlentities($request->input('dashboard_realisasi_barang', null));
            $dashboard_realisasi_modal = htmlentities($request->input('dashboard_realisasi_modal', null));
            $dashboard_realisasi_total_belanja = htmlentities($request->input('dashboard_realisasi_total_belanja', null));

            try {
                DB::beginTransaction();

                $check_dashboard_realisasi = Trx_dashboard_realisasi::where('dashboard_realisasi_status', 1)
                    ->where('dashboard_realisasi_year', $dashboard_realisasi_year)
                    ->where('dashboard_realisasi_revision_name', $dashboard_realisasi_revision_name)
                    ->orderBy('dashboard_realisasi_create_date', 'desc')
                    ->whereNull('dashboard_realisasi_log_uuid')
                    ->limit(1)
                    ->first();

                if ($check_dashboard_realisasi == null) {
                    $dashboard_realisasi_version = 1;
                } else {
                    $dashboard_realisasi_version = $check_dashboard_realisasi->dashboard_realisasi_version + 1;
                }
                $data_create = new Trx_dashboard_realisasi;
                $data_create->dashboard_realisasi_uuid = $this->uuid();
                $data_create->dashboard_realisasi_year = $dashboard_realisasi_year;
                $data_create->dashboard_realisasi_revision_name = $dashboard_realisasi_revision_name;
                $data_create->dashboard_realisasi_pegawai = $dashboard_realisasi_pegawai;
                $data_create->dashboard_realisasi_barang = $dashboard_realisasi_barang;
                $data_create->dashboard_realisasi_modal = $dashboard_realisasi_modal;
                $data_create->dashboard_realisasi_version = $dashboard_realisasi_version;
                $data_create->dashboard_realisasi_total_belanja = $dashboard_realisasi_total_belanja;

                $data_create->dashboard_realisasi_create_by = $this->user_uuid;
                $data_create->dashboard_realisasi_create_date = date('Y-m-d H:i:s', time());
                $data_create->dashboard_realisasi_status = 1;

                $data_create->save();
                DB::commit();

                return redirect('dashboard/datarealisasi')->with('status_show_notif', 1);
            } catch (\Exception $e) {
                echo '<pre>';
                print_r($request->input());
                print_r($e->getMessage());
                die();
                DB::rollback();
                return redirect('dashboard/datarealisasi')->withErrors($validator)->withInput($request->all())->with('status_show_notif', 2);
            }
        } else {

            $data['temp_uuid'] = $this->uuid();

            return view('dashboard_data_realisasi.create', $data);
        }
    }
    public function update_datarealisasi(Request $request)
    {
        $data = array();
        if ($this->method == 'POST') {

            $rules = [
                'dashboard_realisasi_uuid' => 'required',
                'dashboard_realisasi_year' => 'required',
                'dashboard_realisasi_pegawai' => 'required',
                'dashboard_realisasi_barang' => 'required',
                'dashboard_realisasi_modal' => 'required',
                'dashboard_realisasi_total_belanja' => 'required',
            ];
            $validator = $this->validate($request, $rules);
            $dashboard_realisasi_uuid = htmlentities($request->input('dashboard_realisasi_uuid', null));
            $dashboard_realisasi_year = htmlentities($request->input('dashboard_realisasi_year', null));
            $dashboard_realisasi_revision_name = htmlentities($request->input('dashboard_realisasi_revision_name', null));
            $dashboard_realisasi_pegawai = htmlentities($request->input('dashboard_realisasi_pegawai', null));
            $dashboard_realisasi_barang = htmlentities($request->input('dashboard_realisasi_barang', null));
            $dashboard_realisasi_modal = htmlentities($request->input('dashboard_realisasi_modal', null));
            $dashboard_realisasi_total_belanja = htmlentities($request->input('dashboard_realisasi_total_belanja', null));

            try {
                DB::beginTransaction();

                $data_create = Trx_dashboard_realisasi::where('dashboard_realisasi_status', 1)
                    ->where('dashboard_realisasi_uuid', $dashboard_realisasi_uuid)
                    ->whereNull('dashboard_realisasi_log_uuid')
                    ->first();

                $data_create->dashboard_realisasi_uuid = $this->uuid();
                $data_create->dashboard_realisasi_year = $dashboard_realisasi_year;
                $data_create->dashboard_realisasi_revision_name = $dashboard_realisasi_revision_name;
                $data_create->dashboard_realisasi_pegawai = $dashboard_realisasi_pegawai;
                $data_create->dashboard_realisasi_barang = $dashboard_realisasi_barang;
                $data_create->dashboard_realisasi_modal = $dashboard_realisasi_modal;
                $data_create->dashboard_realisasi_total_belanja = $dashboard_realisasi_total_belanja;

                $data_create->dashboard_realisasi_create_by = $this->user_uuid;
                $data_create->dashboard_realisasi_create_date = date('Y-m-d H:i:s', time());
                $data_create->dashboard_realisasi_status = 1;

                $data_create->save();
                DB::commit();

                return redirect('dashboard/datarealisasi')->with('status_show_notif', 1);
            } catch (\Exception $e) {
                // echo '<pre>';
                // print_r($request->input());
                // print_r($e->getMessage());
                // die();
                DB::rollback();
                return redirect('dashboard/datarealisasi')->withErrors($validator)->withInput($request->all())->with('status_show_notif', 2);
            }
        } else {

            $data['temp_uuid'] = $this->uuid();

            $dashboard_realisasi_uuid = htmlentities($request->input('uuid', null));
            $detail = View_trx_dashboard_realisasi::where('dashboard_realisasi_status', 1)
                ->where('dashboard_realisasi_uuid', $dashboard_realisasi_uuid)
                ->where('dashboard_realisasi_version', 0)
                ->whereNull('dashboard_realisasi_log_uuid')
                ->first();
            $data['detail'] = $detail;

            return view('dashboard_data_realisasi.update', $data);
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

        return view('dashboard_data_realisasi.detail', $data);
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

    public function list_datarealisasi(Request $request)
    {
        $field_name = array(
            'dashboard_realisasi_id',
            'dashboard_realisasi_revision_name',
            'dashboard_realisasi_pegawai_format',
            'dashboard_realisasi_barang_format',
            'dashboard_realisasi_modal_format',
            'dashboard_realisasi_total_belanja_format',
            'dashboard_realisasi_create_date',
            'dashboard_realisasi_create_by_name'
        );
        $dashboard_realisasi_year = $request->input('dashboard_realisasi_year', '');
        $where_data = array(
            '1 = 1',
            'dashboard_realisasi_log_uuid IS NULL',
        );
        if ($dashboard_realisasi_year != 'Semua') {
            $where_data[] = "dashboard_realisasi_year = '" . $dashboard_realisasi_year . "'";
        }

        $nama_table = 'view_trx_dashboard_realisasi';
        $default_order = 'dashboard_realisasi_year DESC, dashboard_realisasi_version DESC';
        $result = array();
        $aaData = array();
        try {
            DB::enableQueryLog();
            $getdata = GlobalHelper::Datatable($request, $nama_table, $field_name, $where_data, $default_order);
            $getdata_status = $getdata['status'];

            if ($getdata_status == 1) {
                $result['iTotalRecords'] = (int)$getdata['iTotalDisplayRecords'];
                $result['iTotalDisplayRecords'] = (int)$getdata['iTotalRecords'];
                $nomor = (int)$getdata['nomor'];
                foreach ($getdata['result'] as $index => $row) {
                    $aaData[$index][] = $nomor;
                    $aaData[$index][] = $row->dashboard_realisasi_revision_name;
                    $aaData[$index][] = $row->dashboard_realisasi_pegawai_format;
                    $aaData[$index][] = $row->dashboard_realisasi_barang_format;
                    $aaData[$index][] = $row->dashboard_realisasi_modal_format;
                    $aaData[$index][] = $row->dashboard_realisasi_total_belanja_format;
                    $aaData[$index][] = $row->dashboard_realisasi_create_date;
                    $aaData[$index][] = $row->dashboard_realisasi_create_by_name;

                    $aksi = '';
                    $aksi .= '<div class="d-inline-flex">';

                    $aksi .= '<a href="' . URL::to('/dashboard/update_datarealisasi?uuid=' . $row->dashboard_realisasi_uuid) . '" class="text-body" style="margin-left:2px;margin-right:2px;" data-bs-popup="tooltip" data-bs-placement="top" data-bs-original-title="Update Data"><i class="ph-note-pencil"></i></a>';

                    $aksi .= '<a href="' . URL::to('/dashboard/detail_datarealisasi?uuid=' . $row->dashboard_realisasi_uuid) . '" class="text-body" style="margin-left:2px;margin-right:2px;" data-bs-popup="tooltip" data-bs-placement="top" data-bs-original-title="Lihat Data"><i class="ph-clipboard-text"></i></a>';
                    // $aksi .= '<a href="'.URL::to('/dashboard/update?uuid='.$row->exam_period_uuid).'" class="text-body" style="margin-left:2px;margin-right:2px;" data-bs-popup="tooltip" data-bs-placement="auto" data-bs-original-title="Bottom tooltip"><i class="ph-gear"></i></a>';
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
