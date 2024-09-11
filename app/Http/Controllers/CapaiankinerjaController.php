<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\URL;
use App\Models\Trx_dashboard_realisasi;
use App\Models\View_trx_dashboard_realisasi;
use App\Models\Trx_sasaran_strategis;

use App\Helpers\GlobalHelper;
use App\Models\Mst_work_units;

class CapaiankinerjaController extends Controller
{
    public function index(Request $request){
        $data = array();
        

        return view('capaian_kinerja.index', $data);
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
        $request->replace(['order' => null]);
        $request->replace(['length' => -1]);

        $result = array();
        $aaData = array();
        try {
            DB::enableQueryLog();
            $getdata = GlobalHelper::Datatable($nama_table, $field_name, $where_data, $default_order, $request);
            $getdata_status = $getdata['status'];

            if ($getdata_status == 1) {
                $result['iTotalRecords'] = (int)$getdata['iTotalDisplayRecords'];
                $result['iTotalDisplayRecords'] = (int)$getdata['iTotalRecords'];
                $nomor = (int)$getdata['nomor']+1;
             


                foreach ($getdata['result'] as $index => $row) {
                    $aaData[$index][] = $nomor;
                    $aaData[$index][] = $row->sasaran_strategis_name;
                    $aaData[$index][] = $row->indikator_kinerja_name;
                    $aaData[$index][] = $row->indikator_kinerja_satuan;
                    $aaData[$index][] = $row->indikator_kinerja_target;
                    $aaData[$index][] = $row->indikator_kinerja_realisasi;
                    $aaData[$index][] = $row->indikator_kinerja_persen_capaian;
                    // $aaData[$index][] = $row->indikator_kinerja_persen_anggaran;
                    $nomor++;
                }
            }
            $result['aaData'] = $aaData;
            $result['getdata'] = $getdata;
            $order_data = (($request->input('order') != null) ? $request->input('order') : null);

            $result['order_data'] = $order_data;
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
    public function list2(Request $request)
    {
        $tahun = $request->input('tahun', date('Y'));

        $result = array();
        $aaData = array();
        try {
            DB::enableQueryLog();
            $getdata = DB::select('CALL get_data_capaian_kinerja_by_periode(?)', array($tahun));
            $result['iTotalRecords'] = (int)((count($getdata) > 0) ? count($getdata) : 0);
            $result["nomor"] = (($request->input('start') != null) ? ((int)$request->input('start') + 1) : 0);
            $result['iTotalDisplayRecords'] = (int)count($getdata);
            $result['result'] = $getdata;
            if (count($getdata) > 0) {
                foreach ($getdata as $index => $row) {
                    if($row->levels > 0){
                        $aaData[$index][] = '<div class="text-center">'.$row->sasaran_strategis_name.'</div>';
                    }else{
                        $aaData[$index][] = '<div class="font-weight-bold">'.$row->sasaran_strategis_name.'</div>';
                    }
                    
                    $aaData[$index][] = $row->sasaran_strategis_indicator_name;
                    $aaData[$index][] = $row->sasaran_strategis_satuan;
                    $aaData[$index][] = $row->sasaran_strategis_target;
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
    public function dashboard(){
        $data = array();
        return view('dashboard_capaian_kinerja', $data);
    }
    public function capaian_kinerja(){
        $data = array();
          echo '<pre>';
        print_r($this->site_menu);
        die();
        return view('capaian_kinerja', $data);
    }
    public function realisasi_anggaran(){
        $data = array();
      
        return view('realisasi_anggaran', $data);
    }
}
