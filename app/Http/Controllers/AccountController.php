<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\Facades\Hash;
use App\Models\Sys_users;
use App\Models\View_sys_users;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\Mail;
use App\Rules\ReCaptcha;

class AccountController extends Controller
{

    public function index(Request $request)
    {
       
        if ($request->session()->has('user_id')) {
            return redirect('backend');
        }
        
        //echo Hash::make('shegot3008').'<br>';
        // echo Hash::make('Marcello1@@').'<br>';
        // echo Hash::make('Verra1@@').'<br>';
        // die();
        
        $data = array();
        if ($this->method == 'POST') {
            $rules = [
                'username' => 'required|email|max:255',
                'password' => 'required|max:255',
                'g-recaptcha-response' => ['required', new ReCaptcha]
            ];
            $validator = Validator::make($request->all(), $rules);
            if ($validator->fails()) {
                return redirect('/account')->withErrors($validator)->withInput($request->all());
            }
            $username = $request->input('username', '');
            $request_password = $request->input('password', '');


            try {
                $datauser = View_sys_users::where('user_status', 1)
                    ->where('user_name', $username)
                    ->whereNull('user_log_uuid')
                    ->first();
                $loginstatus = false;
               
                if ($datauser != null) {
                    if (Hash::check($request_password, $datauser->user_password)) {
                        $request->session()->put('user_id', $datauser->user_id);
                        $request->session()->put('user_uuid', $datauser->user_uuid);
                        $request->session()->put('user_fullname', $datauser->user_fullname);
                        $request->session()->put('user_name', $datauser->user_name);
                        $request->session()->put('user_access_uuid', $datauser->user_access_uuid);
                        $request->session()->put('access_name', $datauser->access_name);
                        $loginstatus = true;
                    }
                }
                if ($loginstatus == true) {
                    return redirect('backend');
                } else {
                    return redirect('/account')->withErrors(['wrong' => 'Username atau Password salah'])->withInput($request->all());
                }
            } catch (\Exception $e) {
                return redirect('/account')->withErrors(['wrong' => 'Terdapat Kesalahan'])->withInput($request->all());
            }
        } else {
            return view('account.index', $data);
        }
    }
    public function login(Request $request)
    {

        $data = array();
        if ($this->method == 'POST') {
            $rules = [
                'g-recaptcha-response' => ['required', new ReCaptcha],
                'username' => 'required|email|max:255',
                'password' => 'required|max:255',
            ];
            $validator = Validator::make($request->all(), $rules);

            if ($validator->fails()) {
                return redirect('account')->withErrors($validator)->withInput($request->all());
            }

            $username = $request->input('username', '');
            $request_password = $request->input('password', '');


            try {
                $datauser = View_sys_users::where('user_status', 1)
                    ->where('user_name', $username)
                    ->whereNull('user_log_uuid')
                    ->first();
                $loginstatus = false;
                if ($datauser != null) {
                    if (Hash::check($request_password, $datauser->user_password)) {
                        $request->session()->put('user_id', $datauser->user_id);
                        $request->session()->put('user_uuid', $datauser->user_uuid);
                        $request->session()->put('user_fullname', $datauser->user_fullname);
                        $request->session()->put('user_name', $datauser->user_name);
                        $request->session()->put('user_access_uuid', $datauser->user_access_uuid);
                        $request->session()->put('access_name', $datauser->access_name);
                        $loginstatus = true;
                    }
                }
                if ($loginstatus == true) {
                    return redirect('backend');
                } else {
                    return view('account.index')->withErrors(['wrong' => 'Username atau Password salah'])->withInput($request->all());
                }
            } catch (\Exception $e) {
                return view('account.index')->withErrors(['wrong' => 'Terdapat Kesalahan'])->withInput($request->all());
            }
        } else {
            return view('account.index', $data);
        }
    }
    public function logout(Request $request)
    {
        $request->session()->flush();
        return redirect('account');
    }

    public function resetpasswords(Request $request)
    {
        
        if ($request->session()->has('user_id')) {
            return redirect('backend');
        }
        $data = array();
        $data['status'] = '';
        return view('account.confirmresetpassword', $data);
    }
    public function register(Request $request)
    {
        $data = array();
        $data['status'] = '';
        if ($this->method == 'POST') {
            $rules = [
                'g-recaptcha-response' => ['required', new ReCaptcha],
                'username' => 'required|email|max:255',
                'password' => 'required|max:255',
            ];
            $validator = Validator::make($request->all(), $rules);

            if ($validator->fails()) {
                return redirect('account/register')->withErrors($validator)->withInput($request->all());
            }

            $username = $request->input('username', '');
            $user_fullname = $request->input('user_fullname', '');
            $request_password = $request->input('password', '');


            try {

                $data_create = new Sys_users();
                $data_create->user_uuid = $this->uuid();
                $data_create->user_fullname = $user_fullname;
                $data_create->user_name = $username;
                $data_create->user_password = Hash::make($request_password);
                $data_create->user_create_by = $data_create->user_uuid;
                $data_create->user_create_date = date('Y-m-d H:i:s', time());
                $data_create->user_access_uuid = '2557ee6d-61d0-11ee-befa-f4a4757ae8c3';
                $data_create->user_status = 1;
                $data_create->save();

                if ($data_create) {
                    $data['status'] = 'sukses';
                    return view('account.register', $data);
                } else {
                    return view('account.register')->withErrors(['wrong' => 'Terdapat Kesalahan'])->withInput($request->all());
                }
            } catch (\Exception $e) {
                return view('account.register')->withErrors(['wrong' => 'Terdapat Kesalahan'])->withInput($request->all());
            }
        } else {
            return view('account.register', $data);
        }
    }
    public function checkemail(Request $request)
    {
        $data = array();
        if ($this->method == 'POST') {

            $user_name = $request->input('username', '');

            $check = Sys_users::where('user_status', 1)
                //->where('user_access_uuid', '2557ee6d-61d0-11ee-befa-f4a4757ae8c3')
                ->whereRaw("lower(user_name) = '" . strtolower($user_name) . "'")
                ->whereNull('user_log_uuid')
                ->get();
            if (count($check) > 0) {
                return response(
                    json_encode('Username telah tersedia harap gunakan email lain.'),
                    200
                )->header('Content-Type', 'application/json');
            } else {
                return response(
                    json_encode('true'),
                    200
                )->header('Content-Type', 'application/json');
            }
        }
    }
    public function checkemailreset(Request $request)
    {
        $data = array();
        if ($this->method == 'POST') {

            $user_name = $request->input('username', '');

            $check = Sys_users::where('user_status', 1)
                //->where('user_access_uuid', '2557ee6d-61d0-11ee-befa-f4a4757ae8c3')
                ->whereRaw("lower(user_name) = '" . strtolower($user_name) . "'")
                ->whereNull('user_log_uuid')
                ->get();
            if (count($check) == 0) {
                return response(
                    json_encode('Username tidak ditemukan.'),
                    200
                )->header('Content-Type', 'application/json');
            } else {
                return response(
                    json_encode('true'),
                    200
                )->header('Content-Type', 'application/json');
            }
        }
    }
    public function reset_password(Request $request)
    {
        
        if ($request->session()->has('user_id')) {
            return redirect('backend');
        }
        $data = array();
        $data['status'] = '';
        if ($this->method == 'POST') {
            $rules = [
                'g-recaptcha-response' => ['required', new ReCaptcha],
                'username' => 'required|email|max:255',
            ];
            $validator = Validator::make($request->all(), $rules);

            if ($validator->fails()) {
                return redirect('account/reset_password')->withErrors($validator)->withInput($request->all());
            }

            $username = $request->input('username', '');


            try {
                $check = Sys_users::where('user_status', 1)
                    ->whereRaw("lower(user_name) = '" . strtolower($username) . "'")
                    ->whereNull('user_log_uuid')
                    ->first();
                if ($check) {
                    $reset_code = Hash::make($check->user_uuid);
                    $check->user_reset_code = $reset_code;
                    $check->save();
                    $datamail = array('name' => $check->user_fullname, 'email' => $check->user_name, 'code' => $reset_code);
                    $user_name = $check->user_name;
                    $nama = $check->user_fullname;

                    Mail::send('emails.reset_password', $datamail, function ($message) use ($user_name, $nama) {
                        $message->to($user_name, $nama)->subject('Reset Password Akun pada Panitia Ujian Profesi Advokat - PERADI');
                    });
                    $data['status'] = 'sukses';

                    return view('account.reset_password', $data);
                } else {
                    return view('account.reset_password', $data)->withErrors(['wrong' => 'Terdapat Kesalahan'])->withInput($request->all());
                }
            } catch (\Exception $e) {
                return view('account.reset_password', $data)->withErrors(['wrong' => 'Terdapat Kesalahan'])->withInput($request->all());
            }
        } else {
            return view('account.reset_password', $data);
        }
    }
}
