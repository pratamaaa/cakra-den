@extends('site_layout.layout')
@section('content')
   <style>
      .g-recaptcha {
         display: inline-block;
      }
   </style>
   <script src="{{ URL::asset('assets/js/custom.js') }}"></script>

   <!-- Content area -->
   <div class="content d-flex justify-content-center align-items-center">

      <!-- Login form -->
      <form class="login-form form-validate" action="" method="POST" id="login-form">
         <div class="card mb-0">
            <div class="card-body">
               <div class="text-center mb-3">
                  <div class="d-inline-flex align-items-center justify-content-center mb-4 mt-2">
                     <img src="{{ URL::asset('assets/base/images/logo_den.png') }}" class="h-80px" alt="">
                  </div>
                  <h5 class="mb-0">Masuk ke akun anda</h5>
                  <span class="d-block text-muted">Masukkan kredensial Anda di bawah</span>
               </div>
               <hr class="text-muted">
               @if ($errors->any())
                  @if ($errors->has('g-recaptcha-response'))
                     <div class="alert alert-warning alert-dismissible mb-2 p-2 text-center">
                        Kode Keamanan Salah
                     </div>
                  @else
                     <div class="alert alert-warning alert-dismissible mb-2 p-2 text-center">
                        Username atau Password Salah
                     </div>
                  @endif
               @endif
               <div class="mb-3">
                  <label class="form-label">Username</label>
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
                     <input type="password" class="form-control wajib" placeholder="Password" id="" name="password">
                     <div class="form-control-feedback-icon">
                        <i class="ph-lock text-muted"></i>
                     </div>
                  </div>
               </div>
               <div class="mb-3 text-center">
                  <div class="text-center col-md-12">
                     <div class="g-recaptcha  text-center" data-sitekey="{{ env('GOOGLE_RECAPTCHA_KEY') }}" data-callback="get_response"></div>
                  </div>



                  <input type="hidden" class="form-control isnothidden wajib" id="captcha" name="captcha" placeholder="" style="" value="">
               </div>



               <div class="mb-3">
                  @csrf
                  <button type="submit" class="btn btn-primary w-100" onclick="get_response()">Masuk ke akun anda</button>
               </div>




               <div class="text-center text-muted content-divider mb-3">
                  <span class="px-2">Lupa Password?</span>
               </div>

               <div class="mb-3">
                  {{-- <a href="javascript:void(0);" class="btn btn-light w-100">Reset password</a> --}}
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
