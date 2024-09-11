@extends('layout.layout')
@section('content')
   <div class="content">
      <div class="card flex-lg-row flex-lg-wrap px-3 rounded-0 border-0 shadow">
         <div class="d-flex flex-1">
            <div class="breadcrumb breadcrumb_content">
               <a href="{{ URL::to('/home') }}" class="breadcrumb-item py-2"><i class="ph-house me-2"></i> {{ env('APP_SHORT_NAME') }}</a>
            </div>
         </div>
      </div>
      <div class="row">
         <div class="col-lg-12">
            @csrf
            <ul class="nav nav-tabs nav-tabs-solid nav-justified border mb-3 text-success bg-success border-success bg-opacity-10">
               <li class="nav-item">
                  <a href="#js-tab1" class="nav-link fw-medium fw-semibold active" data-bs-toggle="tab">Realisasi APK DEN</a>
               </li>
               {{-- <li class="nav-item">
                  <a href="#js-tab2" class="nav-link fw-medium fw-semibold" data-bs-toggle="tab">16 Program</a>
               </li> --}}
            </ul>


            <div class="tab-content">
               <div class="tab-pane fade show active" id="js-tab1">
                  <div class="card rounded-0 border-0 shadow-0">
                     <div class="card-header d-flex align-items-center">
                        <h6 class="mb-0">Realisasi APK DEN</h6>
                        <div class="ms-auto">

                           <div class="input-group">
                              <span class="input-group-text">Tahun Anggaran</span>
                              <input type="text" class="form-control datepicker-default-view text-end" readonly placeholder="Tahun" value="{{ date('Y') }}" style="width: 130px" id="data_anggaran_tahun" name="data_anggaran_tahun" onchange="set_realisasi(this)">
                           </div>
                        </div>
                     </div>
                     <div class="card-body">
                        <div class="table-responsive">
                           <table class="table table-bordered table_border_hijau" id="datatable-index">

                              <thead>
                                 <tr class="border-top-success">
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="width: 1%;">No</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="width: 30%;">Nama</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle">Uraian</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle">Pagu</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle">Realisasi</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle">Sisa Anggaran</th>
                                 </tr>
                              </thead>
                           </table>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="tab-pane fade" id="js-tab2">
                  <div class="card rounded-0 border-0 shadow-0">
                     <div class="card-header d-flex align-items-center">
                        <h6 class="mb-0">16 Program</h6>
                        <div class="ms-auto">

                           <div class="input-group">
                              <span class="input-group-text">Tahun Anggaran</span>
                              <input type="text" class="form-control datepicker-default-view text-end" readonly placeholder="Tahun" value="{{ date('Y') }}" style="width: 130px" id="data_anggaran_tahun_2" name="data_anggaran_tahun_2">
                           </div>
                        </div>
                     </div>
                     <div class="card-body">
                        <div class="table-responsive">
                           <table class="table table-bordered table_border_hijau" id="datatable-index2">

                              <thead>
                                 <tr class="border-top-success">
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="width: 1%;">No</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="width: 25%;">PIC / APK DEN</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle">Program</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle">Pagu</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle">Realisasi</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle">Sisa Anggaran</th>
                                 </tr>
                              </thead>
                           </table>
                        </div>
                     </div>
                  </div>
               </div>
            </div>

         </div>
      </div>
   </div>
   <script type="text/javascript">
      var datatableindex, datatableindex2, chart_pagu, chart_jenis_pagu, chart_realisasi_anggaran;

      function set_realisasi() {
         $('#datatable-index').DataTable().ajax.reload();
         $('#datatable-index2').DataTable().ajax.reload();

      }
      $(document).ready(function() {
         $('.select').select2();
         const dpDefaultViewElement = document.querySelector('.datepicker-default-view');

         var dpDefaultView = new Datepicker(dpDefaultViewElement, {
            container: '.content-inner',
            buttonClass: 'btn',
            prevArrow: document.dir == 'rtl' ? '&rarr;' : '&larr;',
            nextArrow: document.dir == 'rtl' ? '&larr;' : '&rarr;',
            startView: 2,
            pickLevel: 2,
            autohide: true,
            autoclose: true,
            format: "yyyy",
            viewMode: "years",
            minViewMode: "years",
            maxDate: new Date(),
         });
         datatableindex = $('#datatable-index').dataTable({
            autoWidth: false,
            ajax: {
               url: baseurl + '/realisasianggaran/list_apk',
               type: "POST",
               data: function(d) {
                  d._token = '{{ csrf_token() }}';
                  d.realisasi_apk_year = function() {
                     return $('#data_anggaran_tahun').val();
                  };

               }
            },
            processing: true,
            serverSide: true,

            order: [],
            dom: '<"datatable-header justify-content-start"<"ms-sm-auto"><"">><"datatable-scroll-wrap"t><"datatable-footer">',
            buttons: {
               dom: {
                  button: {
                     className: 'btn btn-light'
                  }
               },
               buttons: [

               ]
            },
            "pageLength": -1,
            "lengthMenu": [
               [10, 25, 50, -1],
               [10, 25, 50, "Semua"]
            ],
            rowsGroup: [
               1
            ],
            aoColumns: [{
                  "bSortable": false,
                  "sClass": "text-center"
               },
               {
                  "bSortable": false,
                  "sClass": "text-left"
               },
               {
                  "bSortable": false,
                  "sClass": "text-center"
               },
               {
                  "bSortable": false,
                  "sClass": "text-end"
               },
               {
                  "bSortable": false,
                  "sClass": "text-end"
               },
               {
                  "bSortable": false,
                  "sClass": "text-end"
               },
            ],
            drawCallback: function(settings) {
               App.initCore();
               $('body').addClass('loaded');

               //   afterloaddatatable();
               //   $('[data-popup="lightbox"]').fancybox({
               //      padding: 3
               //   });
            },
            initComplete: function() {
               App.initCore();
               //   afterloaddatatable();
               //   $('[data-popup="lightbox"]').fancybox({
               //      padding: 3
               //   });
            }
         });
         datatableindex2 = $('#datatable-index2').dataTable({
            autoWidth: false,
            ajax: {
               url: baseurl + '/realisasianggaran/list_program',
               type: "POST",
               data: function(d) {
                  d._token = '{{ csrf_token() }}';
                  d.program_apk_year = function() {
                     return 2023;//$('#data_anggaran_tahun').val();
                  };

               }
            },
            processing: true,
            serverSide: true,

            order: [],
            dom: '<"datatable-header justify-content-start"<"ms-sm-auto"><"">><"datatable-scroll-wrap"t><"datatable-footer">',
            buttons: {
               dom: {
                  button: {
                     className: 'btn btn-light'
                  }
               },
               buttons: [

               ]
            },
            "pageLength": -1,
            "lengthMenu": [
               [10, 25, 50, -1],
               [10, 25, 50, "Semua"]
            ],
            rowsGroup: [
               1
            ],
            aoColumns: [{
                  "bSortable": false,
                  "sClass": "text-center"
               },
               {
                  "bSortable": false,
                  "sClass": "text-left"
               },
               {
                  "bSortable": false,
                  "sClass": "text-left"
               },
               {
                  "bSortable": false,
                  "sClass": "text-end"
               },
               {
                  "bSortable": false,
                  "sClass": "text-end"
               },
               {
                  "bSortable": false,
                  "sClass": "text-end"
               },
            ],
            drawCallback: function(settings) {
               App.initCore();
               $('body').addClass('loaded');

               //   afterloaddatatable();
               //   $('[data-popup="lightbox"]').fancybox({
               //      padding: 3
               //   });
            },
            initComplete: function() {
               App.initCore();
               //   afterloaddatatable();
               //   $('[data-popup="lightbox"]').fancybox({
               //      padding: 3
               //   });
            }
         });
      });
   </script>
@endsection
