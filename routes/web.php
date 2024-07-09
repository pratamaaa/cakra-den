<?php

use App\Http\Controllers\DashboardController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\PeriodeUjianController;
use App\Http\Controllers\Master\KotaController;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Artisan;

$router->get('/', [HomeController::class, 'index']);



$uri = str_replace('/index.php/', '', explode('?', $_SERVER['REQUEST_URI'] ?? '', 2)[0]);
if (substr($uri, 0, 1) == '/') {
    $uri = ltrim($uri, '/');
}

function callback($uri)
{
    
    if ($uri == '') {
        return "App\\Http\\Controllers\\HomeController@index"; 
    } else {
        $segment = explode('/', $uri);
        if (count($segment) == 1) {
            return "App\\Http\\Controllers\\" . ucfirst($segment[0]) . "Controller@index";
        } else if (count($segment) == 2) {
            if(strtolower($segment[0]) != "master"){
                return "App\\Http\\Controllers\\" . ucfirst($segment[0]) . "Controller@".(($segment[1]!='')?strtolower($segment[1]):'index');
            }else{
                return "App\\Http\\Controllers\\" . ucfirst($segment[0]) . "\\" . ucfirst($segment[1]) . "Controller@index";
            }
        } else if (count($segment) >= 3) {
            if(strtolower($segment[0]) != "master"){
                return "App\\Http\\Controllers\\" . ucfirst($segment[0]) . "Controller@".ucfirst($segment[1]);
            }else{
                return "App\\Http\\Controllers\\" . ucfirst($segment[0]) . "\\" . ucfirst($segment[1]) . "Controller@".(($segment[2]!='')?strtolower($segment[2]):'index');
            }
        } else {
            return "App\\Http\\Controllers\\" . ucfirst($segment[0]) . "Controller@index";
        }
    }
}
$router->get($uri, callback($uri));
$router->post($uri, callback($uri));
$router->put($uri, callback($uri));
$router->patch($uri, callback($uri));
$router->delete($uri, callback($uri));
$router->options($uri, callback($uri));
Route::get('/clear-cache', function () {
    Artisan::call('cache:clear');
    Artisan::call('route:clear');
 
    return "Cache cleared successfully";
 });