<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}" dir="ltr">

<head>
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   <meta name="author" content="Ghany Cahyadi">
   <meta name="description" content="Panitia Ujian Profesi Advokat PERADI">
   <meta name="keywords" content="ujian profesi advokat, pupa, peradi, ujian">
   <title>{{ config('app.name') }}</title>
   <script src="https://www.google.com/recaptcha/api.js" async defer></script>

   <!-- Global stylesheets -->
   <link rel="icon" type="image/x-icon" href="{{ URL::asset('assets/base/images/favicon.ico') }}">
   <link href="{{ URL::asset('assets/base/fonts/inter/inter.css') }}" rel="stylesheet" type="text/css">
   <link href="{{ URL::asset('assets/base/icons/phosphor/styles.min.css') }}" rel="stylesheet" type="text/css">
   <link href="{{ URL::asset('assets/css/ltr/all.min.css') }}" id="stylesheet" rel="stylesheet" type="text/css">
   <link href="{{ URL::asset('assets/css/custom.css') }}" id="stylesheet" rel="stylesheet" type="text/css">

   <!-- /global stylesheets -->
   <script type="text/javascript">
      var baseurl = '{{ URL::to('/') }}';
      var status_show_notif = '0';

   </script>
   <!-- Core JS files -->
   <script src="{{ URL::asset('assets/base/demo/demo_configurator.js') }}"></script>
   <script src="{{ URL::asset('assets/base/js/bootstrap/bootstrap.bundle.min.js') }}"></script>
   <!-- /core JS files -->

   <!-- Theme JS files -->
   <script src="{{ URL::asset('assets/base/js/vendor/ui/prism.min.js') }}"></script>
   <script src="{{ URL::asset('assets/base/js/jquery/jquery.min.js') }}"></script>
   <script src="{{ URL::asset('assets/base/js/vendor/notifications/sweet_alert.min.js') }}"></script>
   <script src="{{ URL::asset('assets/base/js/vendor/tables/datatables/datatables.min.js') }}"></script>
   <script src="{{ URL::asset('assets/base/js/vendor/tables/datatables/extensions/responsive.min.js') }}"></script>
   <script src="{{ URL::asset('assets/base/js/vendor/tables/datatables/extensions/pdfmake/pdfmake.min.js') }}"></script>
   <script src="{{ URL::asset('assets/base/js/vendor/tables/datatables/extensions/pdfmake/vfs_fonts.min.js') }}"></script>
   <script src="{{ URL::asset('assets/base/js/vendor/tables/datatables/extensions/buttons.min.js') }}"></script>
   <script src="{{ URL::asset('assets/base/js/vendor/ui/moment/moment.min.js') }}"></script>
   <script src="{{ URL::asset('assets/base/js/vendor/pickers/daterangepicker.js') }}"></script>
   <script src="{{ URL::asset('assets/base/js/vendor/pickers/datepicker.min.js') }}"></script>
   <script src="{{ URL::asset('assets/base/js/vendor/forms/validation/validate.min.js') }}"></script>
   <script src="{{ URL::asset('assets/base/js/vendor/forms/selects/select2.min.js') }}"></script>
   <script src="{{ URL::asset('assets/base/js/vendor/notifications/noty.min.js') }}"></script>
   <script src="{{ URL::asset('assets/base/js/vendor/uploaders/fileinput/fileinput.min.js') }}"></script>
	<script src="{{ URL::asset('assets/base/js/vendor/uploaders/fileinput/plugins/sortable.min.js') }}"></script>
   <script src="{{ URL::asset('assets/js/app.js') }}"></script>

   
   <!-- /theme JS files -->

</head>

<body>

   <!-- Main navbar -->
   <div class="navbar navbar-expand-xl navbar-static shadow">
      <div class="container px-sm-3">
         <div class="navbar-brand flex-1">
            <a href="{{ URL::to('/') }}" class="d-inline-flex align-items-center py-0">
               <img src="{{ URL::asset('assets/base/images/logo_den.png') }}" class="sidebar-logo-icon" alt="" style="height: 42px;">
            </a>
         </div>

         <ul class="nav gap-1 flex-xl-1 justify-content-end order-0 order-xl-1">

            <li class="nav-item {{ ((request()->segment(1)=='')?'active':'') }}">
               <a href="{{ URL::to('/') }}" class="navbar-nav-link rounded-pill {{ ((request()->segment(1)=='')?'active':'') }}">
                  <i class="ph-house me-2"></i>
                  Home
               </a>
            </li>
            <li class="nav-item {{ ((request()->segment(1)=='account')?'active':'') }}">
               <a href="{{ URL::to('/account') }}" class="navbar-nav-link rounded-pill {{ ((request()->segment(1)=='account')?'active':'') }}">
                  <i class="ph-user-circle me-2"></i>
                  Account
               </a>
            </li>
         </ul>
      </div>
   </div>
   <!-- /main navbar -->


   <!-- Page content -->
   <div class="page-content">

      <!-- Main content -->
      <div class="content-wrapper">

         <!-- Inner content -->
         <div class="content-inner">

            <!-- Page header -->
            <div class="page-header">
               <div class="page-header-content container d-lg-flex">

               </div>
            </div>
            <!-- /page header -->

           
            <!-- Content area -->
            @yield('content')
            <!-- /content area -->


            <!-- Footer -->

            @include('layout.footer')

            <!-- /footer -->

         </div>
         <!-- /inner content -->

      </div>
      <!-- /main content -->

   </div>
   <!-- /page content -->



</body>

</html>
