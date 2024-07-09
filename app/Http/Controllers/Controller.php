<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Support\Facades\View;
use Illuminate\Support\Facades\DB;
use App\Models\Sys_menus;
use App\Models\Sys_access;
use App\Models\Sys_access_detail;
use App\Helpers\GlobalHelper;
use Illuminate\Routing\UrlGenerator;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
class Controller extends BaseController
{
    protected $site_menu;
    protected $method;
    protected $baseurl;
    protected $uuid;
    protected $user_uuid;
    public function __construct(UrlGenerator $url, Request $request)
    {

        $uri = rtrim(ltrim(str_replace('/index.php/', '', explode('?', $_SERVER['REQUEST_URI'] ?? '', 2)[0]), '/'), '/');
        $CheckActiveUrl = '';
        $segment = explode('/', $uri);
        // $jenis = session('jenis');
        // echo $jenis;
        // die();
        // if($segment[0]=='capaiankinerja'){

        //     $access_id = 2;
        //     $access_uuid = '7c841c7a-b08c-11ee-ad93-f4a4757ae8c3';
        // }elseif($segment[0]=='realisasianggaran'){

        //     $access_id = 3;
        //     $access_uuid = '8558369f-b08c-11ee-ad93-f4a4757ae8c3';
        // }else{
        //     $access_id = 3;
        //     $access_uuid = '8558369f-b08c-11ee-ad93-f4a4757ae8c3';
        // }
     
        $routeArray = app('request')->route()->getAction();

        $controllerAction = class_basename($routeArray['controller']);

        list($controller, $action) = explode('@', $controllerAction);
        // if($controller!='SiteController'){
            $access_uuid = session('user_access_uuid');
            // echo '<pre>';
            // print_r($access_uuid);
            // die();
            $menu = GlobalHelper::getMenuByAccess($access_uuid);
            $this->method = $request->method();
            $this->site_menu = $menu;
            View::share('site_menu', $this->site_menu);
        // }

        $this->method = $request->method();
        
        $this->site_menu = $menu;
        $this->baseurl = $url;
        $this->user_uuid = session('user_uuid');
      
        $this->uuid = $this->uuid();

        $data = url()->full();
        View::share('site_menu', $this->site_menu);
    }
    function uuid()
    {
        $data = random_bytes(16);
        assert(strlen($data) == 16);

        $data[6] = chr(ord($data[6]) & 0x0f | 0x40);
        $data[8] = chr(ord($data[8]) & 0x3f | 0x80);
        return vsprintf('%s%s-%s-%s-%s-%s%s%s', str_split(bin2hex($data), 4));
    }
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;
}
