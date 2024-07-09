@extends('site_layout.layout')
@section('content')
   <script src="{{ URL::asset('assets/js/custom.js') }}"></script>
   <style>
      .g-recaptcha {
         display: inline-block;
      }
   </style>
   <!-- Content area -->
   <div class="content d-flex justify-content-center align-items-center">

      <!-- Login form -->
      <form class="login-form form-validate" action="" method="POST">
         <div class="card mb-0">
            <div class="card-body">
               <div class="text-center mb-3">
                  <div class="d-inline-flex align-items-center justify-content-center mb-4 mt-2">
                     <img src="{{ URL::asset('assets/base/images/logo_peradi_pupa.png') }}" class="h-48px" alt="">
                  </div>
                  <h5 class="mb-0">Registrasi Akun</h5>
                  <span class="d-block text-muted">Masukkan kredensial Anda di bawah</span>
               </div>
               @if ($errors->any())
                  @if ($errors->has('g-recaptcha-response'))
                     <div class="alert alert-warning alert-dismissible mb-2 p-2 text-center">
                        Kode Keamanan Salah
                     </div>
                  @else
                     <div class="alert alert-warning alert-dismissible mb-2 p-2 text-center">
                        Terdapat isian yang tidak sesuai.
                     </div>
                  @endif
               @endif

               @if ($status == 'sukses')
                  <div class="alert alert-success alert-dismissible mb-2 p-2 text-center">
                     Selamat Akun anda berhasil dibuat. silahkan klik <a href="{{ URL::to('/account') }}" class="">Disini</a> untuk login ke akun anda.
                  </div>
               @endif

               <div class="mb-3">
                  <label class="form-label">Nama Lengkap</label>
                  <div class="form-control-feedback form-control-feedback-start">
                     <input type="text" class="form-control wajib" placeholder="Nama Lengkap" id="user_fullname" name="user_fullname">
                     <div class="form-control-feedback-icon">
                        <i class="ph-user-circle text-muted"></i>
                     </div>
                  </div>

               </div>
               <div class="mb-3">
                  <label class="form-label">Email</label>
                  <div class="form-control-feedback form-control-feedback-start">
                     <input type="text" class="form-control wajib email" placeholder="sample@email.com" id="username" name="username">
                     <div class="form-control-feedback-icon">
                        <i class="ph-at text-muted"></i>
                     </div>
                  </div>
               </div>

               <div class="mb-3">
                  <label class="form-label">Password</label>
                  <div class="form-control-feedback form-control-feedback-start">
                     <input type="password" class="form-control wajib" placeholder="Password" id="password_1" name="password">
                     <div class="form-control-feedback-icon">
                        <i class="ph-lock text-muted"></i>
                     </div>
                  </div>
               </div>
               <div class="mb-3">
                  <label class="form-label">Ulangi Password</label>
                  <div class="form-control-feedback form-control-feedback-start">
                     <input type="password" class="form-control wajib" placeholder="Ulangi Password" id="password_2" name="password_2">
                     <div class="form-control-feedback-icon">
                        <i class="ph-lock text-muted"></i>
                     </div>
                  </div>
               </div>
               <div class="mb-3">
                  <div class="text-center col-md-12">
                     <div class="g-recaptcha  text-center" data-sitekey="{{ env('GOOGLE_RECAPTCHA_KEY') }}" data-callback="get_response"></div>
                  </div>

                  @if ($errors->has('g-recaptcha-response'))
                     <span class="text-danger">{{ $errors->first('g-recaptcha-response') }}</span>
                  @endif

                  <input type="hidden" class="form-control isnothidden wajib" id="captcha" name="captcha" placeholder="" style="">
               </div>



               <div class="mb-3">
                  @csrf
                  <button type="submit" class="btn btn-primary w-100">Buat Akun Baru</button>
               </div>



               <div class="text-center text-muted content-divider mb-3">
                  <span class="px-2">Sudah Mempunyai Account?</span>
               </div>

               <div class="mb-3">
                  <a href="{{ URL::to('/account') }}" class="btn btn-light w-100">Masuk ke akun anda</a>
               </div>


               <div class="text-center text-muted content-divider mb-3">
                  <span class="px-2">Lupa Password?</span>
               </div>

               <div class="mb-3">
                  <a href="{{ URL::to('/account/reset_password') }}" class="btn btn-light w-100">Reset Password</a>
               </div>
            </div>
         </div>
      </form>
      <!-- /login form -->

   </div>

   <script type="text/javascript">
      function get_response() {
         if (grecaptcha.getResponse() == "") {
            $('#captcha').val('').change();
         } else {
            $('#captcha').val('1').change().valid();
         }
      }
      $(document).ready(function() {
         $('.captcha').find('img').css('width', '50%');
         $("#password_1").rules("add", {
            minlength: 5,
            required: true,
         });
         $("#password_2").rules("add", {
            minlength: 5,
            equalTo: '#password_1',
            required: true,
         });
         $("#username").rules("add", {
            email: true,
            remote: {
               url: baseurl + '/account/checkemail',
               type: "post",
               data: {
                  _token: $('input[name="_token"]').val(),
               }
            },
         });
      });
      $(document).ready(function() {
         //$('.captcha').find('img').css('width', '50%');
         $('form').on('submit', function(e) {
            if (grecaptcha.getResponse() == "") {
               e.preventDefault();
               $('#captcha').val('').change();
            } else {
               $('#captcha').val('1').change().valid();
            }
         });
      });
   </script>

   <!-- /content area -->
@endsection
