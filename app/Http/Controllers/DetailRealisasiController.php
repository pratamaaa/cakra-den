<?php

namespace App\Http\Controllers;

use App\Helpers\GlobalHelper;
use Illuminate\Support\Facades\DB;
use App\Models\View_data_realisasi_item_target;
use App\Models\View_data_realisasi_item_sppd;
use App\Models\Mst_work_units;
use App\Models\Trx_target;
use App\Models\Trx_budgets;
use App\Models\View_trx_budgets;


use Illuminate\Http\Request;

class DetailrealisasiController extends Controller
{
    public function index()
    {
        $data = array();

        $data_realisasi_item_target = View_data_realisasi_item_target::first();
        $data_realisasi_item_sppd = View_data_realisasi_item_sppd::first();
        $data['data_realisasi_item_target'] = $data_realisasi_item_target;
        $data['data_realisasi_item_sppd'] = $data_realisasi_item_sppd;
        $data_realisasi_item_deviasi_hijau = 100 - ($data_realisasi_item_sppd->persen_sppd - $data_realisasi_item_target->persen_target);
        $data_realisasi_item_deviasi_merah = $data_realisasi_item_sppd->persen_sppd - $data_realisasi_item_target->persen_target;
        $data['data_realisasi_item_deviasi_hijau'] = $data_realisasi_item_deviasi_hijau;
        $data['data_realisasi_item_deviasi_merah'] = $data_realisasi_item_deviasi_merah;
        $belanja = DB::select('CALL get_data_belanja_by_periode(?,?)', array(date('Y'), date('m')));
        $data['belanja'] = $belanja;
        $satker = Mst_work_units::where('work_unit_status', 1)
            ->whereNull('work_unit_log_uuid')
            ->orderBy('work_unit_parent_uuid', 'ASC')
            ->orderBy('work_unit_sort', 'ASC')
            ->get();
        $data['satker'] = $satker;
        // echo '<pre>';
        // print_r($xx);
        // die();
        return view('detailrealisasi', $data);
    }
    public function get_kurva_s(Request $request)
    {
        $result = array();
        if ($this->method == 'POST') {
            $work_unit_uuid = $request->input('work_unit_uuid', '');
            $target_show = $request->input('target_show', 1);
            $realisasi_show = $request->input('realisasi_show', 1);

            $satker = Mst_work_units::where('work_unit_status', 1)
                ->whereNull('work_unit_log_uuid')
                ->where('work_unit_uuid', $work_unit_uuid)
                ->orderBy('work_unit_sort', 'ASC')
                ->first();
            $result['title'] = 'Realisasi Anggaran<br>' . ucwords(strtolower($satker->work_unit_name));
            $result['subtitle'] = 'Tahun Anggaran ' . date('Y');
            $result['categories'] = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
          

            $arrtarget = [];
            $arrrealisasi = [];
            foreach ($result['categories'] as $key => $value) {
                if ($satker->work_unit_parent_uuid == '0') {
                    $target = Trx_target::where('target_status', 1)
                        ->whereNull('target_log_uuid')
                        ->where('target_year', date('Y'))
                        ->where('target_month', '=', ($key + 1))
                        ->sum('target_value');

                    $realisasi = Trx_budgets::where('budget_status', 1)
                        ->whereNull('budget_log_uuid')
                        ->where('budget_year', date('Y'))
                        ->where('budget_month', '=', ($key + 1))
                        ->sum('budget_realization');
                } else {
                    $target = Trx_target::where('target_status', 1)
                        ->whereNull('target_log_uuid')
                        ->where('target_work_unit_uuid', $work_unit_uuid)
                        ->where('target_year', date('Y'))
                        ->where('target_month', '=', ($key + 1))
                        ->sum('target_value');

                    $realisasi = View_trx_budgets::where('budget_status', 1)
                        ->whereNull('budget_log_uuid')
                        ->where('work_program_work_unit_uuid', $work_unit_uuid)
                        ->where('budget_year', date('Y'))
                        ->where('budget_month', '=', ($key + 1))
                        ->sum('budget_realization');
                }
                if ($target_show == 1) {
                    $arrtarget[$key] = $target * 1;
                }
                if ($realisasi_show == 1) {
                    $arrrealisasi[$key] = $realisasi * 1;
                }
            }
            if ($target_show == 1 && $realisasi_show = 0) {
                $result['series'][0]['name'] = 'target';
                $result['series'][0]['data'] = $arrtarget;
            }else if ($target_show == 0 && $realisasi_show = 1) {
                $result['series'][0]['name'] = 'realisasi';
                $result['series'][0]['data'] = $arrrealisasi;
            }else if ($target_show == 1 && $realisasi_show = 1) {
                $result['series'][0]['name'] = 'target';
                $result['series'][0]['data'] = $arrtarget;
                $result['series'][1]['name'] = 'realisasi';
                $result['series'][1]['data'] = $arrrealisasi;
            }

            
            return response(
                json_encode($result),
                200
            )->header('Content-Type', 'application/json');
        }
    }
    public function listdata(Request $request)
    {
        $tahun = $request->input('tahun', date('Y'));
        $bulan = $request->input('bulan', date('m'));

        $field_name = array(
            'work_unit_id',
            'work_unit_name',
            'plafon_format',
            'target_format',
            'persen_target',
            'realisasi_format',
            'sppd_format',
            'deviasi_format',
            'persen_realisasi_target',
            'persen_realisasi_pagu',
            'sisa_anggaran_spm_format',
            'sisa_anggaran_sp2d_format'
        );
        $where_data = array(
            '1 = 1',
            'budget_year = ' . $tahun,
            'budget_month = ' . $bulan,
        );
        $nama_table = 'view_data_anggaran';
        $default_order = 'work_unit_sort ASC';
        $result = array();
        $aaData = array();
        try {
            DB::enableQueryLog();
            $getdata = DB::select('CALL get_data_anggaran_by_periode(?,?)', array($tahun, $bulan));
            $result['iTotalRecords'] = (int)((count($getdata) > 0) ? count($getdata) : 0);
            $result["nomor"] = (($request->input('start') != null) ? ((int)$request->input('start') + 1) : 0);
            $result['iTotalDisplayRecords'] = (int)count($getdata);
            $result['result'] = $getdata;
            if (count($getdata) > 0) {
                foreach ($getdata as $index => $row) {
                    $aaData[$index][] = '<span class="d-inline-block text-truncate" data-bs-popup="popover" data-bs-trigger="hover" data-bs-placement="top" data-bs-content="' . $row->work_unit_name . '" style="max-width: 350px;">' . $row->work_unit_name . '</span>';
                    $aaData[$index][] = $row->plafon_format;
                    $aaData[$index][] = $row->target_format;
                    $aaData[$index][] = $row->persen_target;
                    $aaData[$index][] = $row->realisasi_format;
                    $aaData[$index][] = $row->sppd_format;
                    $aaData[$index][] = $row->deviasi_format;
                    $aaData[$index][] = $row->persen_realisasi_target;
                    $aaData[$index][] = $row->persen_realisasi_pagu;
                    $aaData[$index][] = $row->sisa_anggaran_spm_format;
                    $aaData[$index][] = $row->sisa_anggaran_sp2d_format;
                }
            }
            // $getdata = GlobalHelper::Datatable($nama_table, $field_name, $where_data, $default_order, $request);
            // $getdata_status = $getdata['status'];

            // if ($getdata_status == 1) {
            //     $result['iTotalRecords'] = (int)$getdata['iTotalRecords'];
            //     $result['iTotalDisplayRecords'] = (int)$getdata['iTotalRecords'];
            //     $nomor = (int)$getdata['nomor'];
            //     foreach ($getdata['result'] as $index => $row) {
            //         $aaData[$index][] = '<span class="d-inline-block text-truncate" data-bs-popup="popover" data-bs-trigger="hover" data-bs-placement="top" data-bs-content="'.$row->work_unit_name.'" style="max-width: 350px;">'.$row->work_unit_name.'</span>';
            //         $aaData[$index][] = $row->plafon_format;
            //         $aaData[$index][] = $row->target_format;
            //         $aaData[$index][] = $row->persen_target;
            //         $aaData[$index][] = $row->realisasi_format;
            //         $aaData[$index][] = $row->sppd_format;
            //         $aaData[$index][] = $row->deviasi_format;
            //         $aaData[$index][] = $row->persen_realisasi_target;
            //         $aaData[$index][] = $row->persen_realisasi_pagu;
            //         $aaData[$index][] = $row->sisa_anggaran_spm_format;
            //         $aaData[$index][] = $row->sisa_anggaran_sp2d_format;
            //         $nomor++;
            //     }
            // }
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
