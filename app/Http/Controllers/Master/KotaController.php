<?php
namespace App\Http\Controllers\Master;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class KotaController extends Controller
{
    public function index(){
        $data = array();
        // echo '<pre>';
        // print_r(request()->is('master/kota'));
        // die();
        return view('periodeujian.index', $data);
    }
}
