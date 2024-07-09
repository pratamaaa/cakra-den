<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}" dir="ltr">

<head>
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   <title>{{ config('app.name') }}</title>

   <!-- Global stylesheets -->
   <link href="{{ URL::asset('assets/base/fonts/inter/inter.css') }}" rel="stylesheet" type="text/css">
   <link href="{{ URL::asset('assets/base/icons/phosphor/styles.min.css') }}" rel="stylesheet" type="text/css">
   <link href="{{ URL::asset('assets/css/ltr/all.min.css') }}" id="stylesheet" rel="stylesheet" type="text/css">
   <link href="{{ URL::asset('assets/base/icons/fontawesome/styles.min.css') }}" rel="stylesheet" type="text/css">
   <link href="{{ URL::asset('assets/css/custom.css') }}" id="stylesheet" rel="stylesheet" type="text/css">
   <!-- /global stylesheets -->

   <!-- Core JS files -->
   <script type="text/javascript">
      var baseurl = '{{ URL::to('/') }}';
      var status_show_notif = '{{ $errors->any() ? 2 : session('status_show_notif') }}';
   </script>
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
   <script src="{{ URL::asset('assets/base/js/vendor/tables/datatables/extensions/row_group.js') }}"></script>

   <script src="{{ URL::asset('assets/base/js/vendor/ui/moment/moment.min.js') }}"></script>
   <script src="{{ URL::asset('assets/base/js/vendor/pickers/daterangepicker.js') }}"></script>
   <script src="{{ URL::asset('assets/base/js/vendor/pickers/datepicker.min.js') }}"></script>
   <script src="{{ URL::asset('assets/base/js/vendor/forms/validation/validate.min.js') }}"></script>
   <script src="{{ URL::asset('assets/base/js/vendor/forms/selects/select2.min.js') }}"></script>
   <script src="{{ URL::asset('assets/base/js/vendor/notifications/noty.min.js') }}"></script>
   <script src="{{ URL::asset('assets/base/js/vendor/uploaders/fileinput/fileinput.min.js') }}"></script>
   <script src="{{ URL::asset('assets/base/js/vendor/uploaders/fileinput/plugins/sortable.min.js') }}"></script>
   {{-- <script src="{{ URL::asset('assets/base/js/vendor/forms/inputs/imask.min.js') }}"></script> --}}
   <script src="{{ URL::asset('assets/base/js/jquery/jquery.inputmask.js') }}"></script>



   <script src="{{ URL::asset('assets/js/app.js') }}"></script>
   <script src="{{ URL::asset('assets/js/custom.js') }}"></script>
   <script src="{{ URL::asset('assets/base/js/vendor/highcharts/highcharts.js') }}"></script>
   <!-- /theme JS files -->

</head>

<body>

   <!-- Page content -->
   <div class="page-content">
      <!-- Main sidebar -->
      <div class="sidebar sidebar-main sidebar-expand-lg">

         <!-- Sidebar header -->
         <div class="sidebar-section border-bottom">
            <div class="sidebar-logo d-flex justify-content-center align-items-center">
               <a href="{{ URL::to('/') }}" class="d-inline-flex align-items-center py-0">
                  <img src="{{ URL::asset('assets/base/images/logo_den.png') }}" class="sidebar-logo-icon" alt="" style="height: 42px;">
                  <span class="sidebar-resize-hide ms-2 fw-semibold text-capitalize fs-lg" style="color: #1f2937 !important; font-size:1.3rem !important;text-shadow: 0.7px 0.7px 0 #fff, -0.7px 0.7px 0 #fff, 0.7px -0.7px 0 #fff, -0.7px -0.7px 0 #fff, 0px 0.7px 0 #fff, 0px -0.7px 0 #fff, -0.7px 0px 0 #fff, 0.7px 0px 0 #fff, 1.7px 1.7px 0 #fff, -1.7px 1.7px 0 #fff, 1.7px -1.7px 0 #fff, -1.7px -1.7px 0 #fff, 0px 1.7px 0 #fff, 0px -1.7px 0 #fff, -1.7px 0px 0 #fff, 1.7px 0px 0 #fff, 0.7px 1.7px 0 #fff, -0.7px 1.7px 0 #fff, 0.7px -1.7px 0 #fff, -0.7px -1.7px 0 #fff, 1.7px 0.7px 0 #fff, -1.7px 0.7px 0 #fff, 1.7px -0.7px 0 #fff, -1.7px -0.7px 0 #fff;">{{ env('APP_SHORT_NAME') }}</span>
               </a>

               <div class="sidebar-resize-hide ms-auto">
                  <button type="button" class="btn btn-light btn-icon btn-sm rounded-pill border-transparent sidebar-control sidebar-main-resize d-none d-lg-inline-flex">
                     <i class="ph-arrows-left-right"></i>
                  </button>

                  <button type="button" class="btn btn-light btn-icon btn-sm rounded-pill border-transparent sidebar-mobile-main-toggle d-lg-none">
                     <i class="ph-x"></i>
                  </button>
               </div>
            </div>
         </div>
         <!-- /sidebar header -->


         <!-- Sidebar content -->
         <div class="sidebar-content">

            <!-- Customers -->
            <div class="sidebar-section sidebar-resize-hide dropdown mx-2 border-bottom">
               <div class="text-center mb-3">
                  <a href="#" class="d-inline-block mt-2 mb-1">
                     <img src="{{ URL::asset('assets/base/images/logo_den.png') }}" class="rounded-circle img-fluid" width="100" height="100" alt="">
                  </a>

                  <div class="text-muted">Aplikasi Monitoring<br>Capaian Kinerja dan Realisasi Anggaran<br>Dewan Energi Nasional</div>
               </div>
            </div>
            <!-- /customers -->

            <!-- Main navigation -->
            @include('layout.main_navigation')
            <!-- Main navigation -->


         </div>
         <!-- /sidebar content -->



      </div>
      <!-- /main sidebar -->


      <!-- Main content -->
      <div class="content-wrapper">

         <!-- Main navbar -->
         <div class="navbar navbar-expand-lg navbar-static shadow" style="min-height: 62px;">
            <div class="container-fluid">
               <div class="d-flex d-lg-none me-1">
                  <button type="button" class="navbar-toggler sidebar-mobile-main-toggle rounded-pill">
                     <i class="ph-list"></i>
                  </button>
               </div>
               <div class="navbar-brand d-lg-none flex-1 flex-lg-0">
                  <a href="{{ URL::to('/') }}" class="d-inline-flex align-items-center">
                     <img src="{{ URL::asset('assets/base/images/logo_den.png') }}" style="height: 32px;">
                     <span class="ms-1 fw-semibold text-capitalize fs-lg" style="color: #1f2937 !important; font-size:1.3rem !important;text-shadow: 0.7px 0.7px 0 #fff, -0.7px 0.7px 0 #fff, 0.7px -0.7px 0 #fff, -0.7px -0.7px 0 #fff, 0px 0.7px 0 #fff, 0px -0.7px 0 #fff, -0.7px 0px 0 #fff, 0.7px 0px 0 #fff, 1.7px 1.7px 0 #fff, -1.7px 1.7px 0 #fff, 1.7px -1.7px 0 #fff, -1.7px -1.7px 0 #fff, 0px 1.7px 0 #fff, 0px -1.7px 0 #fff, -1.7px 0px 0 #fff, 1.7px 0px 0 #fff, 0.7px 1.7px 0 #fff, -0.7px 1.7px 0 #fff, 0.7px -1.7px 0 #fff, -0.7px -1.7px 0 #fff, 1.7px 0.7px 0 #fff, -1.7px 0.7px 0 #fff, 1.7px -0.7px 0 #fff, -1.7px -0.7px 0 #fff;">{{ env('APP_SHORT_NAME') }}</span>
                  </a>
               </div>
               <!-- Left content -->
               <div class="flex-row d-none d-sm-block">
                  <span class="badge border border-success text-success fs-lg py-2 bg-success bg-opacity-20 rounded-0">Aplikasi Monitoring {{ env('APP_NAME') }}</span>
               </div>
               <!-- /left content -->
               @if (session('user_uuid') != '')
                  <ul class="nav hstack gap-sm-1 flex-row justify-content-end order-1 order-lg-2">
                     {{-- <li class="nav-item">
                     <a href="javascript:void(0)" class="navbar-nav-link navbar-nav-link-icon rounded-pill" data-bs-toggle="offcanvas" data-bs-target="#notifications">
                        <i class="ph-bell"></i>
                        <span class="badge bg-yellow text-black position-absolute top-0 end-0 translate-middle-top zindex-1 rounded-pill mt-1 me-1">2</span>
                     </a>
                  </li> --}}

                     <li class="nav-item nav-item-dropdown-lg dropdown">
                        <a href="javascript:void(0)" class="navbar-nav-link align-items-center rounded-pill p-1" data-bs-toggle="dropdown">
                           <div class="status-indicator-container">
                              <img src="{{ URL::asset('assets/base/images/default_image_user.png') }}" class="w-32px h-32px rounded-pill" alt="">
                              <span class="status-indicator bg-success"></span>
                           </div>
                           <span class="d-none d-lg-inline-block mx-lg-2">{{ session('user_fullname') }} ({{ session('access_name') }})</span>
                        </a>

                        <div class="dropdown-menu dropdown-menu-end">
                           {{-- <a href="javascript:void(0)" class="dropdown-item">
                           <i class="ph-user-circle me-2"></i>
                           My profile
                        </a>
                        <a href="javascript:void(0)" class="dropdown-item">
                           <i class="ph-gear me-2"></i>
                           Account settings
                        </a> --}}
                           <a href="{{ URL::to('/account/logout') }}" class="dropdown-item">
                              <i class="ph-sign-out me-2"></i>
                              Logout
                           </a>
                        </div>
                     </li>
                  </ul>
               @endif


            </div>
         </div>
         <!-- /main navbar -->

         <!-- Inner content -->
         <div class="content-inner">
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


   <!-- Notifications -->
   @include('layout.notification')
   <!-- /notifications -->


   <!-- Theme config -->
   <div class="offcanvas offcanvas-end" tabindex="-1" id="demo_config">
      <div class="position-absolute top-50 end-100 visible">
         <button type="button" class="btn btn-primary btn-icon translate-middle-y rounded-end-0" data-bs-toggle="offcanvas" data-bs-target="#demo_config">
            <i class="ph-gear"></i>
         </button>
      </div>

      <div class="offcanvas-header border-bottom py-0">
         <h5 class="offcanvas-title py-3">Theme Configuration</h5>
         <button type="button" class="btn btn-light btn-sm btn-icon border-transparent rounded-pill" data-bs-dismiss="offcanvas">
            <i class="ph-x"></i>
         </button>
      </div>

      <div class="offcanvas-body">
         <div class="fw-semibold mb-2">Color mode</div>
         <div class="list-group mb-3">
            <label class="list-group-item list-group-item-action form-check border-width-1 rounded mb-2">
               <div class="d-flex flex-fill my-1">
                  <div class="form-check-label d-flex me-2">
                     <i class="ph-sun ph-lg me-3"></i>
                     <div>
                        <span class="fw-bold">Light theme</span>
                        <div class="fs-sm text-muted">Set light theme or reset to default</div>
                     </div>
                  </div>
                  <input type="radio" class="form-check-input cursor-pointer ms-auto" name="main-theme" value="light" checked>
               </div>
            </label>

            <label class="list-group-item list-group-item-action form-check border-width-1 rounded mb-2">
               <div class="d-flex flex-fill my-1">
                  <div class="form-check-label d-flex me-2">
                     <i class="ph-moon ph-lg me-3"></i>
                     <div>
                        <span class="fw-bold">Dark theme</span>
                        <div class="fs-sm text-muted">Switch to dark theme</div>
                     </div>
                  </div>
                  <input type="radio" class="form-check-input cursor-pointer ms-auto" name="main-theme" value="dark">
               </div>
            </label>

            <label class="list-group-item list-group-item-action form-check border-width-1 rounded mb-0">
               <div class="d-flex flex-fill my-1">
                  <div class="form-check-label d-flex me-2">
                     <i class="ph-translate ph-lg me-3"></i>
                     <div>
                        <span class="fw-bold">Auto theme</span>
                        <div class="fs-sm text-muted">Set theme based on system mode</div>
                     </div>
                  </div>
                  <input type="radio" class="form-check-input cursor-pointer ms-auto" name="main-theme" value="auto">
               </div>
            </label>
         </div>

      </div>

   </div>
   <!-- /Theme config -->

   <script type="text/javascript">
      function setActiveMenu() {
         jQuery.fn.reverse = [].reverse;
         $('.nav-link.active').parents('*').each(function() {
            if ($(this).hasClass('nav')) {
               return false;
            }
            if ($(this).hasClass('nav-group-sub')) {
               $(this).addClass('show');
            }
            $(this).addClass('nav-item-expanded').addClass('nav-item-open');
         });
         var breadcrumb_content = "<a href='{{ URL::to('/home') }}' class='breadcrumb-item py-2'><i class='ph-house me-2'></i> {{ env('APP_SHORT_NAME') }}</a>";
         var loopdata = $('.nav-link.active').parents('li.nav-item:not(.nav)').reverse();
         var length = loopdata.length;
         loopdata.each(function(index, element) {
            var lastClass = '';
            if (index === (length - 1)) {
               lastClass = 'active';
            }
            var menuname = $(this).children(":first").find('span').text();
            if (menuname != '') {
               breadcrumb_content += '<span class="breadcrumb-item py-2 ' + lastClass + '">' + menuname + '</span>';
            }
         });
         $('.breadcrumb_content').html(breadcrumb_content);

      }
      $(document).ready(function() {
         setActiveMenu();
      });
   </script>
</body>

</html>
