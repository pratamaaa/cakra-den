<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class HomeController extends Controller
{
    public function index(){
        $data = array();
      
        return view('public.index', $data);
    }
    public function landing(){
        $data = array();
        return view('landing', $data);
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
