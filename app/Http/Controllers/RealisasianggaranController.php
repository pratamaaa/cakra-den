<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\URL;
use App\Models\Trx_dashboard_realisasi;
use App\Models\View_trx_dashboard_realisasi;
use App\Models\View_periode_revisi;
use App\Models\View_data_realisasi_item_target;
use App\Models\View_data_realisasi_item_sppd;
use App\Models\Mst_work_units;
use App\Models\Trx_target;
use App\Models\Trx_budgets;
use App\Models\Trx_upload_paparan_program;
use App\Models\View_trx_budgets;
use App\Models\View_trx_realisasi_apk;

use App\Models\View_trx_target;
use App\Helpers\GlobalHelper;



class RealisasianggaranController extends Controller
{
    public function index(Request $request)
    {
        $data = array();
        return view('realisasi_anggaran.index', $data);
    }
    public function detailrealisasi(Request $request)
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
        return view('realisasi_anggaran.detailrealisasi', $data);
    }
    public function detailperbiro(Request $request)
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
        return view('realisasi_anggaran.detailperbiro', $data);
    }
    public function apk(Request $request)
    {
        $data = array();
        return view('realisasi_anggaran.apk', $data);
    }

    public function list_apk(Request $request)
    {
        $tahun = $request->input('tahun', date('Y'));
        $bulan = $request->input('bulan', '12');
        $result = array();
        $aaData = array();
        try {
            DB::enableQueryLog();
            $getdata = DB::select('CALL get_data_apk_perbiro_by_periode(?,?)', array($tahun, $bulan));
            $result['iTotalRecords'] = (int)((count($getdata) > 0) ? count($getdata) : 0);
            $result["nomor"] = (($request->input('start') != null) ? ((int)$request->input('start') + 1) : 0);
            $result['iTotalDisplayRecords'] = (int)count($getdata);
            $result['result'] = $getdata;
            if (count($getdata) > 0) {
                $nomor = 1;

                foreach ($getdata as $index => $row) {
                    $aaData[$index][] = $nomor;
                    $aaData[$index][] = $row->upload_apk_nama;
                    $aaData[$index][] = $row->upload_apk_ket_name;
                    $aaData[$index][] = $row->upload_apk_pagu_format;
                    $aaData[$index][] = $row->upload_apk_realisasi_format;
                    $aaData[$index][] = $row->upload_apk_sisa_format;
                    if ($index % 2 == 0) {
                    } else{
                        $nomor++;

                    }
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
    public function list_program(Request $request)
    {
        $field_name = array(
            'program_apk_id',
            'apk_name',
            'program_apk_urian',
            'program_apk_pagu_format',
            'program_apk_realisasi_format',
        );

        $program_apk_year = $request->input('program_apk_year', '');
        $where_data = array(
            '1 = 1',
            'program_apk_log_uuid IS NULL',
        );
        if ($program_apk_year != 'Semua') {
            $where_data[] = "program_apk_year = '" . $program_apk_year . "'";
        }

        $nama_table = 'view_trx_program_apk';
        $default_order = 'apk_sort ASC, program_apk_id ASC';
        $request->replace(['order' => null]);
        $request->replace(['length' => -1]);

        $result = array();
        $aaData = array();
        try {
            DB::enableQueryLog();
            $getdata = GlobalHelper::Datatable($request, $nama_table, $field_name, $where_data, $default_order);
            $getdata_status = $getdata['status'];

            if ($getdata_status == 1) {
                $result['iTotalRecords'] = (int)$getdata['iTotalDisplayRecords'];
                $result['iTotalDisplayRecords'] = (int)$getdata['iTotalRecords'];
                $nomor = (int)$getdata['nomor'] + 1;



                foreach ($getdata['result'] as $index => $row) {
                    $aaData[$index][] = $nomor;
                    $aaData[$index][] = $row->apk_name;
                    $aaData[$index][] = $row->program_apk_urian;
                    $aaData[$index][] = $row->program_apk_pagu_format;
                    $aaData[$index][] = $row->program_apk_realisasi_format;
                    $aaData[$index][] = $row->program_apk_realisasi_format;
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

    public function listdata_detailrealisasi(Request $request)
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
            $gettanggal = DB::select("SELECT (CASE WHEN YEAR(NOW()) = " . $tahun . " THEN CURRENT_DATE ELSE DATE_FORMAT(NOW(),'" . $tahun . "-12-31') END) hari_terakhir");

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
                    // $aaData[$index][] = $row->sppd_format;
                    $aaData[$index][] = $row->deviasi_format;
                    $aaData[$index][] = $row->persen_realisasi_target;
                    $aaData[$index][] = $row->persen_realisasi_pagu;
                    // $aaData[$index][] = $row->sisa_anggaran_spm_format;
                    // $aaData[$index][] = $row->sisa_anggaran_sp2d_format;
                }
            }
            $result['aaData'] = $aaData;
            $result['getdata'] = $getdata;
            $result['gettanggal'] = $gettanggal;

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
    public function get_kurva_s(Request $request)
    {
        $result = array();
        if ($this->method == 'POST') {
            $work_unit_uuid = $request->input('work_unit_uuid', '');
            $target_show = $request->input('target_show', 1);
            $realisasi_show = $request->input('realisasi_show', 1);
            $tahun = $request->input('tahun', date('Y'));

            $satker = Mst_work_units::where('work_unit_status', 1)
                ->whereNull('work_unit_log_uuid')
                ->where('work_unit_uuid', $work_unit_uuid)
                ->orderBy('work_unit_sort', 'ASC')
                ->first();
            $result['title'] = 'Realisasi Anggaran<br>' . ucwords(strtolower($satker->work_unit_name));
            $result['subtitle'] = 'Tahun Anggaran ' . $tahun;
            $result['categories'] = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
            $plafon_realisasi = DB::select('CALL get_data_dashboard_realisasi_anggaran(?)', array($tahun));
            $result['plafon_realisasi'] = $plafon_realisasi;

            $result['categories_plafon_realisasi'] = array();
            $result['series_plafon_realisasi'] = array();
            // {
            //     name: 'PAGU',
            //     data: [49.9, 71.5, 106.4]

            //  }, {
            //     name: 'REALISASI',
            //     data: [83.6, 78.8, 98.5]

            //  }
            $result['series_plafon_realisasi'][0]['name'] = 'PAGU';
            $result['series_plafon_realisasi'][1]['name'] = 'REALISASI';
            foreach ($plafon_realisasi as $key => $value) {

                $result['series_plafon_realisasi'][0]['data'][] = $value->plafon * 1;
                $result['series_plafon_realisasi'][1]['data'][] = $value->realisasi * 1;
                $result['categories_plafon_realisasi'][] = $value->work_unit_code;
            }

            $arrtarget = [];
            $arrrealisasi = [];
            foreach ($result['categories'] as $key => $value) {
                if ($satker->work_unit_parent_uuid == '0') {
                    $target = View_trx_target::where('target_status', 1)
                        ->whereNull('target_log_uuid')
                        ->where('target_year', $tahun)
                        ->groupBy('target_year')
                        ->select(
                            DB::raw('
                    SUM(`target_value_1`) AS `target_value_1`,
                    SUM(`target_value_2`) AS `target_value_2`,
                    SUM(`target_value_3`) AS `target_value_3`,
                    SUM(`target_value_4`) AS `target_value_4`,
                    SUM(`target_value_5`) AS `target_value_5`,
                    SUM(`target_value_6`) AS `target_value_6`,
                    SUM(`target_value_7`) AS `target_value_7`,
                    SUM(`target_value_8`) AS `target_value_8`,
                    SUM(`target_value_9`) AS `target_value_9`,
                    SUM(`target_value_10`) AS `target_value_10`,
                    SUM(`target_value_11`) AS `target_value_11`,
                    SUM(`target_value_12`) AS `target_value_12`
                    ')
                        )->first();
                    if ($target != null) {
                        $arrtarget[0] = $target->target_value_1 * 1;
                        $arrtarget[1] = $target->target_value_2 * 1;
                        $arrtarget[2] = $target->target_value_3 * 1;
                        $arrtarget[3] = $target->target_value_4 * 1;
                        $arrtarget[4] = $target->target_value_5 * 1;
                        $arrtarget[5] = $target->target_value_6 * 1;
                        $arrtarget[6] = $target->target_value_7 * 1;
                        $arrtarget[7] = $target->target_value_8 * 1;
                        $arrtarget[8] = $target->target_value_9 * 1;
                        $arrtarget[9] = $target->target_value_10 * 1;
                        $arrtarget[10] = $target->target_value_11 * 1;
                        $arrtarget[11] = $target->target_value_12 * 1;
                    } else {
                        $arrtarget[0] = 0;
                        $arrtarget[1] = 0;
                        $arrtarget[2] = 0;
                        $arrtarget[3] = 0;
                        $arrtarget[4] = 0;
                        $arrtarget[5] = 0;
                        $arrtarget[6] = 0;
                        $arrtarget[7] = 0;
                        $arrtarget[8] = 0;
                        $arrtarget[9] = 0;
                        $arrtarget[10] = 0;
                        $arrtarget[11] = 0;
                    }


                    $realisasi = Trx_upload_paparan_program::where('upload_paparan_program_status', 1)
                        ->whereNull('upload_paparan_program_log_uuid')
                        ->where('upload_paparan_program_parent_uuid', '0')
                        ->where('upload_paparan_program_year', $tahun)
                        ->where('upload_paparan_program_month', '=', ($key + 1))
                        
                        ->sum('upload_paparan_program_spd_realisasi');
                } else {
                    $target = View_trx_target::where('target_status', 1)
                        ->whereNull('target_log_uuid')
                        ->where('target_work_unit_uuid', $work_unit_uuid)
                        ->where('target_year', $tahun)
                        ->groupBy('target_year')
                        ->select(
                            DB::raw('
                SUM(`target_value_1`) AS `target_value_1`,
                SUM(`target_value_2`) AS `target_value_2`,
                SUM(`target_value_3`) AS `target_value_3`,
                SUM(`target_value_4`) AS `target_value_4`,
                SUM(`target_value_5`) AS `target_value_5`,
                SUM(`target_value_6`) AS `target_value_6`,
                SUM(`target_value_7`) AS `target_value_7`,
                SUM(`target_value_8`) AS `target_value_8`,
                SUM(`target_value_9`) AS `target_value_9`,
                SUM(`target_value_10`) AS `target_value_10`,
                SUM(`target_value_11`) AS `target_value_11`,
                SUM(`target_value_12`) AS `target_value_12`
                ')
                        )->first();
                    if ($target != null) {
                        $arrtarget[0] = $target->target_value_1 * 1;
                        $arrtarget[1] = $target->target_value_2 * 1;
                        $arrtarget[2] = $target->target_value_3 * 1;
                        $arrtarget[3] = $target->target_value_4 * 1;
                        $arrtarget[4] = $target->target_value_5 * 1;
                        $arrtarget[5] = $target->target_value_6 * 1;
                        $arrtarget[6] = $target->target_value_7 * 1;
                        $arrtarget[7] = $target->target_value_8 * 1;
                        $arrtarget[8] = $target->target_value_9 * 1;
                        $arrtarget[9] = $target->target_value_10 * 1;
                        $arrtarget[10] = $target->target_value_11 * 1;
                        $arrtarget[11] = $target->target_value_12 * 1;
                    } else {
                        $arrtarget[0] = 0;
                        $arrtarget[1] = 0;
                        $arrtarget[2] = 0;
                        $arrtarget[3] = 0;
                        $arrtarget[4] = 0;
                        $arrtarget[5] = 0;
                        $arrtarget[6] = 0;
                        $arrtarget[7] = 0;
                        $arrtarget[8] = 0;
                        $arrtarget[9] = 0;
                        $arrtarget[10] = 0;
                        $arrtarget[11] = 0;
                    }

                   
                    $realisasi = Trx_upload_paparan_program::where('upload_paparan_program_status', 1)
                        ->whereNull('upload_paparan_program_log_uuid')
                        ->where('upload_paparan_program_work_unit_uuid', $work_unit_uuid)
                        ->where('upload_paparan_program_year', $tahun)
                        ->where('upload_paparan_program_month', '=', ($key + 1))
                        
                        ->sum('upload_paparan_program_spd_realisasi');
                }
                if ($target_show == 1) {
                    // $arrtarget[$key] = $target * 1;
                }
                if ($realisasi_show == 1) {
                    $arrrealisasi[$key] = $realisasi * 1;
                }
            }



            if ($target_show == 1 && $realisasi_show = 0) {
                $result['series'][0]['name'] = 'target';
                $result['series'][0]['data'] = $arrtarget;
            } else if ($target_show == 0 && $realisasi_show = 1) {
                $result['series'][0]['name'] = 'realisasi';
                $result['series'][0]['data'] = $arrrealisasi;
            } else if ($target_show == 1 && $realisasi_show = 1) {
                $result['series'][0]['name'] = 'target';
                $result['series'][0]['data'] = $arrtarget;
                $result['series'][1]['name'] = 'realisasi';
                $result['series'][1]['data'] = $arrrealisasi;
            }


            $result['xxxx'] = $arrtarget;
            return response(
                json_encode($result),
                200
            )->header('Content-Type', 'application/json');
        }
    }
    public function listdata_detailbelanja(Request $request)
    {
        $tahun = $request->input('tahun', date('Y'));
        $bulan = $request->input('bulan', '12');

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
            $getdata = DB::select('CALL get_data_belanja_by_periode(?,?)', array($tahun, $bulan));
            $result['iTotalRecords'] = (int)((count($getdata) > 0) ? count($getdata) : 0);
            $result["nomor"] = (($request->input('start') != null) ? ((int)$request->input('start') + 1) : 0);
            $result['iTotalDisplayRecords'] = (int)count($getdata);
            $result['result'] = $getdata;
            if (count($getdata) > 0) {
                foreach ($getdata as $index => $row) {
                    $aaData[$index][] = '<span class="d-inline-block text-truncate" data-bs-popup="popover" data-bs-trigger="hover" data-bs-placement="top" data-bs-content="' . $row->upload_belanja_nama . '" style="max-width: 350px;">' . $row->upload_belanja_nama . '</span>';
                    $aaData[$index][] = $row->upload_belanja_spm_pagu_format;
                    $aaData[$index][] = $row->upload_belanja_spm_realisasi_format;
                    $aaData[$index][] = $row->upload_belanja_spm_persentase_realisasi_format;
                    $aaData[$index][] = $row->upload_belanja_spm_total_format;
                    $aaData[$index][] = $row->upload_belanja_spd_realisasi_format;
                    $aaData[$index][] = $row->upload_belanja_spd_persentase_realisasi_format;
                    $aaData[$index][] = $row->upload_belanja_spd_total_format;
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
    public function listdata_detail_per_biro_setjen(Request $request)
    {
        $tahun = $request->input('tahun', date('Y'));
        $bulan = $request->input('bulan', '12');

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
            $getdata = DB::select('CALL get_data_detail_perbiro_setjen_by_periode(?,?)', array($tahun, $bulan));
            $result['iTotalRecords'] = (int)((count($getdata) > 0) ? count($getdata) : 0);
            $result["nomor"] = (($request->input('start') != null) ? ((int)$request->input('start') + 1) : 0);
            $result['iTotalDisplayRecords'] = (int)count($getdata);
            $result['result'] = $getdata;
            if (count($getdata) > 0) {
                foreach ($getdata as $index => $row) {
                    // $aaData[$index][] = '<span class="d-inline-block text-truncate" data-bs-popup="popover" data-bs-trigger="hover" data-bs-placement="top" data-bs-content="' . $row->upload_belanja_nama . '" style="max-width: 350px;">' . $row->upload_belanja_nama . '</span>';
                    $aaData[$index][] = $row->upload_paparan_program_code;
                    $aaData[$index][] = $row->upload_paparan_program_name;
                    $aaData[$index][] = $row->upload_paparan_program_spd_pagu_format;
                    $aaData[$index][] = $row->upload_paparan_program_spd_realisasi_format;
                    $aaData[$index][] = $row->upload_paparan_program_spd_persen_realisasi_format;
                    $aaData[$index][] = $row->upload_paparan_program_spd_sisa_format;
                    $aaData[$index][] = $row->upload_paparan_program_spd_target_format;
                    $aaData[$index][] = $row->upload_paparan_program_spd_persen_target_format;
                    $aaData[$index][] = $row->upload_paparan_program_spd_deviasi_format;
                    $aaData[$index][] = $row->upload_paparan_program_spd_persen_deviasi_format;
                    $aaData[$index][] = $row->upload_paparan_program_spm_pagu_format;
                    $aaData[$index][] = $row->upload_paparan_program_spm_realisasi_format;
                    $aaData[$index][] = $row->upload_paparan_program_spm_persen_realisasi_format;
                    $aaData[$index][] = $row->upload_paparan_program_spm_sisa_format;
                    $aaData[$index][] = $row->upload_paparan_program_spm_target_format;
                    $aaData[$index][] = $row->upload_paparan_program_spm_persen_target_format;
                    $aaData[$index][] = $row->upload_paparan_program_spm_deviasi_format;
                    $aaData[$index][] = $row->upload_paparan_program_spm_persen_deviasi_format;
                    $aaData[$index][] = $row->levels;
                    $aaData[$index][] = $row->upload_paparan_program_spm_persen_deviasi;
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
    public function listdata_detail_per_biro(Request $request)
    {
        $tahun = $request->input('tahun', date('Y'));
        $bulan = $request->input('bulan', '12');
        $jenis = $request->input('jenis', 1);

  


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
            $getdata = DB::select('CALL get_data_detail_perbiro_by_periode(?,?,?)', array($tahun, $bulan, $jenis));
            $result['iTotalRecords'] = (int)((count($getdata) > 0) ? count($getdata) : 0);
            $result["nomor"] = (($request->input('start') != null) ? ((int)$request->input('start') + 1) : 0);
            $result['iTotalDisplayRecords'] = (int)count($getdata);
            $result['result'] = $getdata;
            if (count($getdata) > 0) {
                foreach ($getdata as $index => $row) {
                    // $aaData[$index][] = '<span class="d-inline-block text-truncate" data-bs-popup="popover" data-bs-trigger="hover" data-bs-placement="top" data-bs-content="' . $row->upload_belanja_nama . '" style="max-width: 350px;">' . $row->upload_belanja_nama . '</span>';
                    $aaData[$index][] = $row->upload_work_program_code;
                    $aaData[$index][] = $row->upload_work_program_name;
                    $aaData[$index][] = $row->upload_nilai_program_pagu_format;
                    $aaData[$index][] = $row->upload_nilai_program_realisasi_format;
                    $aaData[$index][] = $row->upload_nilai_program_realisasi_percen_format;
                    $aaData[$index][] = $row->upload_nilai_program_sisa_format;
                    $aaData[$index][] = $row->levels;

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
    public function listdata_detail_per_biro_setjen_backup(Request $request)
    {
        $tahun = $request->input('tahun', date('Y'));

        $field_name = array(
            'work_program_id',
            'work_program_name_tabs',
            'budget_plafon_format',
            'budget_realization_format'
        );
        $where_data = array(
            '1 = 1',
            'work_program_year = ' . $tahun,
        );
        $nama_table = 'view_per_biro_setjen';
        $default_order = 'hirarki ASC';
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
                    $aaData[$index][] = $row->work_program_code;
                    $aaData[$index][] = $row->work_program_name_tabs;
                    $aaData[$index][] = $row->budget_plafon_format;
                    $aaData[$index][] = $row->budget_realization_format;
                    $aaData[$index][] = '';
                    $aaData[$index][] = '';
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

    public function landing()
    {
        $data = array();
        return view('landing', $data);
    }
    public function capaian_kinerja()
    {
        $data = array();
        echo '<pre>';
        print_r($this->site_menu);
        die();
        return view('capaian_kinerja', $data);
    }
    public function realisasi_anggaran()
    {
        $data = array();

        return view('realisasi_anggaran', $data);
    }
    public function get_periode_revisi(Request $request)
    {
        $data = array();
        if ($this->method == 'POST') {

            $dashboard_realisasi_year = $request->input('dashboard_realisasi_year', '');

            $Trx_dashboard_realisasi = View_periode_revisi::where('dashboard_realisasi_year', $dashboard_realisasi_year)
                ->orderBy('dashboard_realisasi_create_date', 'asc')
                ->get();
            return response(
                json_encode($Trx_dashboard_realisasi),
                200
            )->header('Content-Type', 'application/json');
        }
    }
    public function set_dashboard_rupiah_murni(Request $request)
    {
        $data = array();
        if ($this->method == 'POST') {

            $dashboard_realisasi_uuid = $request->input('dashboard_realisasi_uuid', '');

            $Trx_dashboard_realisasi = View_trx_dashboard_realisasi::where('dashboard_realisasi_uuid', $dashboard_realisasi_uuid)
                ->first();
            return response(
                json_encode($Trx_dashboard_realisasi),
                200
            )->header('Content-Type', 'application/json');
        }
    }
    public function set_realisasi_anggaran(Request $request)
    {
        $data = array();
        if ($this->method == 'POST') {

            $dashboard_realisasi_uuid = $request->input('dashboard_realisasi_uuid', '');

            $Trx_dashboard_realisasi = View_trx_dashboard_realisasi::where('dashboard_realisasi_uuid', $dashboard_realisasi_uuid)
                ->first();
            return response(
                json_encode($Trx_dashboard_realisasi),
                200
            )->header('Content-Type', 'application/json');
        }
    }

    public function get_pagu(Request $request)
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
}
