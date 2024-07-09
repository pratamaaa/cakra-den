<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class DetailBiroController extends Controller
{
    public function index(){
        $data = array();
        // echo '<pre>';
        // print_r($this->site_menu);
        // die();
        return view('detailbiro', $data);
    }
}
