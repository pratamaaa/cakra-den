<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class BackendController extends Controller
{
    public function index(Request $request){
        $data = array();
       
        if (session()->has('user_uuid')) {
            return view('backend', $data);
        }else{
            return redirect('account');
        }
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
