@extends('site_layout.layout')
@section('content')
   <style>
      .g-recaptcha {
         display: inline-block;
      }
   </style>
   <script src="{{ URL::asset('assets/js/custom.js') }}"></script>
   <div class="content p-0 m-0">
      <div class="row">
         <div class="col-md-12 p-2 justify-content-center align-items-center text-center pt-3">

            <img src="{{ URL::asset('assets/base/images/logo_den.png') }}" class="img-rounded img-responsive text-center" alt="" style="max-width:150px;">

         </div>
      </div>
      <div class="row pt-2">
         <div class="col-md-12 badge border border-success text-success fs-lg py-2 bg-success bg-opacity-20 rounded-0" style="border: 1px solid red">
            <p class="text-center">Aplikasi Monitoring</p>
            <p class="text-center">Capaian Kinerja & Monitoring Anggaran</p>
            <p class="text-center">Dewan Energi Nasional</p>

         </div>
      </div>

   <!-- Content area -->
   <div class="pt-5 d-flex justify-content-center align-items-center">

      <!-- Login form -->
      <form class="form-validate" action="" method="POST" id="login-form">

         <div class="row">

            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
               <a href="{{ URL::to('/capaiankinerja/dashboard') }}"><img src="{{ URL::asset('assets/base/images/fe_capaian_kinerja.png') }}" class="img-rounded img-responsive" alt="" style="max-width:300px;"></a>


            </div>
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
               <a href="{{ URL::to('/realisasianggaran') }}"><img src="{{ URL::asset('assets/base/images/fe_realisasi_anggaran.png') }}" class="img-rounded img-responsive" alt="" style="max-width:300px;"></a>

            </div>
         </div>

      </form>
      <!-- /login form -->

   </div>
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
