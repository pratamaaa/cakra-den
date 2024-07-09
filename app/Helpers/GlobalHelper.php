<?php

namespace App\Helpers;

use Carbon\Carbon;
use Carbon\CarbonPeriod;
use Illuminate\Support\Facades\DB;
use Illuminate\Routing\UrlGenerator;
use Illuminate\Support\Facades\URL;

date_default_timezone_set(env('APP_TIMEZONE', 'Asia/Jakarta'));

class GlobalHelper
{
    public static function public_path($path = null)
    {
        return rtrim(app()->basePath('public/' . $path), '/');
    }

    public function uuid()
    {
        $data = random_bytes(16);
        assert(strlen($data) == 16);

        $data[6] = chr(ord($data[6]) & 0x0f | 0x40);
        $data[8] = chr(ord($data[8]) & 0x3f | 0x80);
        return vsprintf('%s%s-%s-%s-%s-%s%s%s', str_split(bin2hex($data), 4));
    }
    public static function getuuid()
    {
        $uuid = self::uuid();
        return $uuid;
    }
    public static function parseDate($date, $separator = '/')
    {
        $res = null;
        if ($date != null) {
            $res = Carbon::parse($date)->format("d{$separator}m{$separator}Y");
        }
        return $res;
    }

    /**
     * Get date parse in indonesian locale, ex 21 September 2021
     *
     * @param  date  $date
     * @return string
     */
    public static function parseDateID($date, $tipe = "short")
    {
        $res = null;
        if ($date != null) {
            if ($tipe == "short") {
                $res = Carbon::parse($date)->locale('id')->isoFormat('D MMM Y'); // 21 Sep 2021
            } else {
                $res = Carbon::parse($date)->locale('id')->isoFormat('D MMMM Y'); // 21 September 2021
            }
        }
        return $res;
    }

    /**
     * Get day name indonesian locale from date, ex Senin
     *
     * @param  date  $date
     * @return string
     */
    public static function getDayName($date)
    {
        $res = null;
        if ($date != null) {
            $res = Carbon::parse($date)->locale('id')->isoFormat('dddd'); // Senin
        }
        return $res;
    }

    /**
     * Get year form date ex 2021
     *
     * @param  date  $date
     * @return string
     */
    public static function getYear($date)
    {
        $res = null;
        if ($date != null) {
            $res = Carbon::parse($date)->format("Y");
        }
        return $res;
    }

    /**
     * Get month form date ex 1
     *
     * @param  date  $date
     * @return string
     */
    public static function getMonth($date)
    {
        $res = null;
        if ($date != null) {
            $res = Carbon::parse($date)->format("m");
        }
        return $res;
    }

    /**
     * Get currency in IDR
     *
     * @param  integer  $number
     * @return string
     */
    public static function rupiah($number)
    {
        $res = null;
        if ($number != null) {
            $res = number_format($number, 0, ',', '.');
        }
        return $res;
    }

    /**
     * Get indonesian "terbilang"
     *
     * @param  integer  $number
     * @param  string  $subfix
     * @return string
     */
    public static function terbilang($nilai, $subfix = '')
    {
        if ($nilai < 0) {
            $hasil = "minus " . trim(self::penyebut($nilai));
        } else {
            $hasil = trim(self::penyebut($nilai));
        }
        return $hasil . ' ' . $subfix;
    }

    /**
     * Get indenesian "penyebut"
     *
     * @param  integer  $number
     * @return string
     */
    private static function penyebut($nilai)
    {
        $nilai = abs($nilai);
        $huruf = array("", "satu", "dua", "tiga", "empat", "lima", "enam", "tujuh", "delapan", "sembilan", "sepuluh", "sebelas");
        $temp = "";
        if ($nilai < 12) {
            $temp = " " . $huruf[$nilai];
        } else if ($nilai < 20) {
            $temp = self::penyebut($nilai - 10) . " belas";
        } else if ($nilai < 100) {
            $temp = self::penyebut($nilai / 10) . " puluh" . self::penyebut($nilai % 10);
        } else if ($nilai < 200) {
            $temp = " seratus" . self::penyebut($nilai - 100);
        } else if ($nilai < 1000) {
            $temp = self::penyebut($nilai / 100) . " ratus" . self::penyebut($nilai % 100);
        } else if ($nilai < 2000) {
            $temp = " seribu" . self::penyebut($nilai - 1000);
        } else if ($nilai < 1000000) {
            $temp = self::penyebut($nilai / 1000) . " ribu" . self::penyebut($nilai % 1000);
        } else if ($nilai < 1000000000) {
            $temp = self::penyebut($nilai / 1000000) . " juta" . self::penyebut($nilai % 1000000);
        } else if ($nilai < 1000000000000) {
            $temp = self::penyebut($nilai / 1000000000) . " milyar" . self::penyebut(fmod($nilai, 1000000000));
        } else if ($nilai < 1000000000000000) {
            $temp = self::penyebut($nilai / 1000000000000) . " trilyun" . self::penyebut(fmod($nilai, 1000000000000));
        }
        return $temp;
    }
    public static function getMenuByAccess($access_uuid)
    {
        $access_uuid = session()->get('user_access_uuid');
        $user_id = session()->get('user_id');


        $uri = rtrim(ltrim(str_replace('/index.php/', '', explode('?', $_SERVER['REQUEST_URI'] ?? '', 2)[0]), '/'), '/');
        $CheckActiveUrl = '';
        $segment = explode('/', $uri);

        if ($uri == '') {
            $CheckActiveUrl = 'home';
        } else {
            if (count($segment) > 2) {
                $CheckActiveUrl = strtolower($segment[0]) . '/' . strtolower($segment[1]);
            } else {
                $CheckActiveUrl = $uri;
            }
        }
        // echo '<pre>';
        // print_r($CheckActiveUrl);
        // die(); 
        // sasaranstrategis/create
        if (strtolower($segment[0]) == 'capaiankinerja') {
            $access_uuid = '7c841c7a-b08c-11ee-ad93-f4a4757ae8c3';
        } else if (strtolower($segment[0]) == 'realisasianggaran') {
            $access_uuid = '8558369f-b08c-11ee-ad93-f4a4757ae8c3';
        } else {
            $access_uuid = session()->get('user_access_uuid');
        }

        $baseurl = URL::to('/');
        $menu = DB::table('sys_menus')
            ->whereRaw("menu_uuid IN (select access_detail_menu_uuid from sys_access_detail where access_detail_access_uuid = '" . $access_uuid . "' AND access_detail_status = 1)")
            ->where('menu_status', 1)
            ->whereNull('menu_log_uuid')
            ->select('sys_menus.*')
            ->orderBy('menu_sort', 'asc')
            ->get();
        $parents = $menu->where('menu_parent_uuid', '0');

        $items = self::tree($parents, $menu);
        $NewMenus = '<ul class="nav nav-sidebar" data-nav-type="accordion">';
        foreach ($items as $i => $item) {
            
            $isActive = (((strpos($CheckActiveUrl, $item['menu_url']) !== FALSE) || request()->is($item['menu_url'])) ? 'active' : '');
            $child = $item['child'];
            $NewMenus .= '<li class="nav-item ' . ((count($child) > 0) ? 'nav-item-submenu' : '') . '"><a class="nav-link ' . $isActive . '" href="' . (($item['menu_url'] != null && $item['menu_url'] != '') ? $baseurl . '/' . $item['menu_url'] : $baseurl) . '">' . (($item['menu_icon'] != null && $item['menu_icon'] != '') ? '<i class="' . $item['menu_icon'] . '"></i> ' : '') . '<span>' . $item['menu_name'] . '</span></a>';

            if (count($child) > 0) {
                $NewMenus .= '<ul class="nav-group-sub collapse">';
                foreach ($child as $i1 => $item1) {
                    $isActive2 = (((strpos($CheckActiveUrl, $item1['menu_url']) !== FALSE) || request()->is($item1['menu_url'])) ? 'active' : '');
                    $child2 = $item1['child'];
                    $NewMenus .= '<li class="nav-item ' . ((count($child2) > 0) ? 'nav-item-submenu' : '') . '"><a class="nav-link ' . $isActive2 . '" href="' . (($item1['menu_url'] != null && $item1['menu_url'] != '') ? $baseurl . '/' . $item1['menu_url'] : $baseurl) . '"><span>' . $item1['menu_name'] . '</span></a>';

                    if (count($child2) > 0) {
                        $NewMenus .= '<ul class="nav-group-sub collapse">';
                        foreach ($child2 as $i2 => $item2) {
                            $isActive3 = (((strpos($CheckActiveUrl, $item2['menu_url']) !== FALSE) || request()->is($item2['menu_url'])) ? 'active' : '');
                            $child3 = $item2['child'];
                            $NewMenus .= '<li class="nav-item ' . ((count($child3) > 0) ? 'nav-item-submenu' : '') . '"><a class="nav-link ' . $isActive3 . '" href="' . (($item2['menu_url'] != null && $item2['menu_url'] != '') ? $baseurl . '/' . $item2['menu_url'] : $baseurl) . '"><span>' . $item2['menu_name'] . '</span></a>';
                            if (count($child3) > 0) {
                                $NewMenus .= '<ul class="nav-group-sub collapse">';
                                foreach ($child3 as $i3 => $item3) {
                                    $isActive4 = (((strpos($CheckActiveUrl, $item3['menu_url']) !== FALSE) || request()->is($item3['menu_url'])) ? 'active' : '');
                                    $NewMenus .= '<li class="nav-item"><a class="nav-link ' . $isActive4 . '" href="' . (($item3['menu_url'] != null && $item3['menu_url'] != '') ? $baseurl . '/' . $item3['menu_url'] : $baseurl) . '"><span>' . $item3['menu_name'] . '</span></a></li>';
                                }
                                $NewMenus .= '</ul>';
                            }
                            $NewMenus .= '</li>';
                        }
                        $NewMenus .= '</ul>';
                    }
                    $NewMenus .= '</li>';
                }
                $NewMenus .= '</ul>';
            }
            $NewMenus .= '</li>';
        }
        $NewMenus .= '</ul>';
        // echo $NewMenus;
        // die();

        return $NewMenus;
    }

    public static function tree($items, $all_items)
    {
        $data_arr = array();
        foreach ($items as $i => $item) {

            $data_arr[$i] = json_decode(json_encode($item), true); //all column attributes

            $find = $all_items->where('menu_parent_uuid', $item->menu_uuid);
            //$findw = json_decode(json_encode($find), FALSE);


            $data_arr[$i]['child'] = array(); //empty array or remove if you dont need it
            if ($find->count() > 0) {

                $data_arr[$i]['child'] = json_decode(json_encode(self::tree($find, $all_items)), true);
            }
        }
        return $data_arr;
    }

    public static function getEloquentSqlWithBindings($query)
    {
        return vsprintf(str_replace('?', '%s', $query->toSql()), collect($query->getBindings())->map(function ($binding) {
            return is_numeric($binding) ? $binding : "'{$binding}'";
        })->toArray());
    }
    public static function Datatable($nama_table = '', $field_name = array(), $where_data = array(), $default_order = '', $request)
    {

        $limit_start = (($request->input('start') != null) ? $request->input('start') : 0);
        $limit_end = (($request->input('length') != null) ? $request->input('length') : 10);
        $search = (($request->input('search') != null) ? $request->input('search') : null);
        $order_data = (($request->input('order') != null) ? $request->input('order') : null);
        $where = 'WHERE 1=1';
        if (count($where_data) > 0) {
            $where = $where . ' AND ' . implode(' AND ', $where_data);
        }
        $search_data = '';

        if ($search != null) {
            $arrsearch = array();
            foreach ($field_name as $index => $value) {
                if ($search['value'] != '') {
                    $arrsearch[$index] = $value . " LIKE '%" . $search['value'] . "%'";
                }
            }
            if (count($arrsearch) > 0) {
                $search_data = '(' . implode(' OR ', $arrsearch) . ')';
                $where = $where . ' AND ' . $search_data;
            }
        }

        $order = '';

        if ($order_data != null) {
            $arrorder = array();
            foreach ($order_data as $index => $value) {
                $arrorder[$index] = $field_name[$value['column']] . ' ' . $value['dir'];
            }
            if (count($arrorder) > 0) {
                $order = 'ORDER BY ' . implode(', ', $arrorder);
            }
        }
        if ($order == '' && $default_order != '') {
            $order = 'ORDER BY ' . $default_order;
        }
        $selected_field = '*';
        if (count($field_name) > 0) {
            $selected_field = implode(', ', $field_name);
        }


        $querycountdata = 'SELECT COUNT(*) TotalData FROM ' . $nama_table . ' ' . $where;
        if ($limit_end != -1) {
            $query = 'SELECT * FROM ' . $nama_table . ' ' . $where . ' ' . $order . ' LIMIT ' . $limit_start . ',' . $limit_end . '';
        }else{
            $query = 'SELECT * FROM ' . $nama_table . ' ' . $where . ' ' . $order . '';
        }
        $returndata = array();
        $errMess = "";
        $status = 1;

        try {
            $res_query = DB::select($query);
            $res_querycountdata = DB::select($querycountdata);
            $returndata['iTotalRecords'] = (int)((count($res_querycountdata) > 0) ? $res_querycountdata[0]->TotalData : 0);
            $returndata["nomor"] = (($request->input('start') != null) ? ((int)$request->input('start') + 1) : 0);
            $returndata['iTotalDisplayRecords'] = (int)count($res_query);
            $returndata['result'] = $res_query;
        } catch (\Exception $e) {
            $errMess = $e->getMessage();
            $status = 0;
        }
        $returndata["status"] = $status;
        $returndata["query"] = $query;
        $returndata["error_message"] = $errMess;
        return $returndata;
    }
}
