<!DOCTYPE html>
<html lang="en">

<head>
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   <title>{{ config('app.name') }}</title>

   <!-- Global stylesheets -->
   <link href="https://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700,900" rel="stylesheet" type="text/css">
   <link href="{{ URL::asset('assets/css/bootstrap.css') }}" rel="stylesheet" type="text/css">
   <link href="{{ URL::asset('assets/css/core.css') }}" rel="stylesheet" type="text/css">
   <link href="{{ URL::asset('assets/css/components.css') }}" rel="stylesheet" type="text/css">
   <link href="{{ URL::asset('assets/css/colors.css') }}" rel="stylesheet" type="text/css">

   <link href="{{ URL::asset('assets/css/bootstrap.css') }}" rel="stylesheet" type="text/css">
   <link href="{{ URL::asset('assets/css/core.css') }}" rel="stylesheet" type="text/css">
   <link href="{{ URL::asset('assets/css/components.css') }}" rel="stylesheet" type="text/css">
   <link href="{{ URL::asset('assets/css/colors.css') }}" rel="stylesheet" type="text/css">
   <link href="{{ URL::asset('assets/css/extras/animate.min.css') }}" rel="stylesheet" type="text/css">

   <!-- /global stylesheets -->

   <!-- Core JS files -->
   <script src="{{ URL::asset('assets/base/js/jquery/jquery.min.js') }}"></script>
   <!-- /core JS files -->
   <style>

   </style>

</head>

<body>

   <!-- Page container -->
   <div class="page-container login-container" style="background-color: #e3e4dc;">

      <!-- Page content -->
      <div class="page-content">

         <!-- Main content -->
         <div class="content-wrapper" style="vertical-align: top !important;">

            <!-- Content area -->
            <div class="content">

               <!-- Advanced login -->
               <div class="">
                  <div class="row text-center">
                     <img src="{{ URL::asset('assets/base/images/logo_den.png') }}" class="content-group-lg" alt="" style="height: 200px;">
                     <h5 class="mb-10 p-10 text-uppercase" style="color:#626262; border: 2px solid #626262; background-color:#fefffe;">Aplikasi Monitoring<br>Capaian Kinerja & Monitoring Anggaran<br>Dewan Energi Nasional</h5>

                  </div>
                  <div class="row text-center pt-20">
                     <div class="col-md-12">
                        <a href="{{ URL::to('/capaiankinerja') }}"><img src="{{ URL::asset('assets/base/images/fe_capaian_kinerja.png') }}" class="img-rounded img-fe m-5" id="img-fe-1" alt="" style="max-width:300px;"></a>
                        <a href="{{ URL::to('/realisasianggaran') }}"><img src="{{ URL::asset('assets/base/images/fe_realisasi_anggaran.png') }}" class="img-rounded img-fe m-5" id="img-fe-2" alt="" style="max-width:300px;"></a>

                     </div>
                  </div>
               </div>

               <!-- /advanced login -->


               <!-- Footer -->
               <div class="footer text-muted">

                  <a style="color:#626262;" href="{{ env('COPYRIGHT_URL') }}" target="_blank">{{ env('COPYRIGHT') }}</a>
               </div>
               <!-- /footer -->

            </div>
            <!-- /content area -->

         </div>
         <!-- /main content -->

      </div>
      <!-- /page content -->

   </div>
   <!-- /page container -->
   <script type="text/javascript">
      $(document).ready(function() {
         var animationLeft = 'bounceInLeft';

         $('#img-fe-1').addClass("animated " + animationLeft).one("webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend", function() {
            $('#img-fe-1').removeClass("animated " + animationLeft);
         });
         var animationRight = 'bounceInRight';
         $('#img-fe-2').addClass("animated " + animationRight).one("webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend", function() {
            $('#img-fe-2').removeClass("animated " + animationRight);
         });

         var animationHover = 'bounceIn';
         $(".img-fe").on("mouseover", function() {
            var id = $(this).attr('id');
            $('#' + id).addClass("animated " + animationHover).one("webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend", function() {
               $('#' + id).removeClass("animated " + animationHover);
            });
         });
      });
   </script>


</body>

</html>
