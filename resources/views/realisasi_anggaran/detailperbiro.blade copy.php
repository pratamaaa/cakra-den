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
                  <a href="#js-tab1" class="nav-link fw-medium fw-semibold active" data-bs-toggle="tab">SETJEN DEN</a>
               </li>
               <li class="nav-item">
                  <a href="#js-tab2" class="nav-link fw-medium fw-semibold" data-bs-toggle="tab">BIRO UMUM</a>
               </li>
               <li class="nav-item">
                  <a href="#js-tab3" class="nav-link fw-medium fw-semibold" data-bs-toggle="tab">BIRO FKEP</a>
               </li>
               <li class="nav-item">
                  <a href="#js-tab4" class="nav-link fw-medium fw-semibold" data-bs-toggle="tab">BIRO FPKPE</a>
               </li>
            </ul>


            <div class="tab-content">
               <div class="tab-pane fade show active" id="js-tab1">
                  <div class="card rounded-0 border-0 shadow">

                     <div class="card-body">

                        <div class="table-responsive">
                           <table class="table table-bordered table_border_hijau" id="datatable-index">
                           
                              <thead>
                                 <tr class="border-top-success">
                                    <th class="text-center border-success text-success bg-success bg-opacity-10" style="width:100px;">KODE</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10" style="">URAIAN PROGRAM</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10" style="width:180px;">PAGU</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10" style="width:180px;">REALISASI</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10" style="width:80px;">%</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10" style="width:180px;">SISA</th>
                                 </tr>
                              </thead>
                              <tbody>
                                 {{-- <tr>
                                    <td class="text-center">020.07.11</td>
                                    <td class="text-left">Program Dukungan</td>
                                    <td class="text-end">56.859.949.000</td>
                                    <td class="text-end">28.021.119.074</td>
                                    <td class="text-center">49.27</td>
                                    <td class="text-end">28.838.829.926</td>
                                 </tr>
                                 <tr>
                                    <td class="text-center">020.07.11</td>
                                    <td class="text-left">Program Dukungan</td>
                                    <td class="text-end">56.859.949.000</td>
                                    <td class="text-end">28.021.119.074</td>
                                    <td class="text-center">49.27</td>
                                    <td class="text-end">28.838.829.926</td>
                                 </tr>
                                 <tr>
                                    <td class="text-center">020.07.11</td>
                                    <td class="text-left">Program Dukungan</td>
                                    <td class="text-end">56.859.949.000</td>
                                    <td class="text-end">28.021.119.074</td>
                                    <td class="text-center">49.27</td>
                                    <td class="text-end">28.838.829.926</td>
                                 </tr>
                                 <tr>
                                    <td class="text-center">020.07.11</td>
                                    <td class="text-left">Program Dukungan</td>
                                    <td class="text-end">56.859.949.000</td>
                                    <td class="text-end">28.021.119.074</td>
                                    <td class="text-center">49.27</td>
                                    <td class="text-end">28.838.829.926</td>
                                 </tr> --}}
                              </tbody>
                           </table>
                        </div>

                     </div>
                  </div>
               </div>
               <div class="tab-pane fade" id="js-tab2">
                  <div class="card rounded-0 border-0 shadow">

                     <div class="card-body">
                        <table class="table table-bordered table_border_hijau" id="datatable-index-2">

                           <table class="table table-bordered">
                              <thead>
                                 <tr class="border-top-success">
                                    <th class="text-center border-success text-success bg-success bg-opacity-10" style="width:100px;">KODE</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10" style="">URAIAN PROGRAM</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10" style="width:180px;">PAGU</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10" style="width:180px;">REALISASI</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10" style="width:80px;">%</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10" style="width:180px;">SISA</th>
                                 </tr>
                              </thead>
                              {{-- <tbody>
                                 <tr>
                                    <td class="text-center">020.07.11</td>
                                    <td class="text-left">Program Dukungan</td>
                                    <td class="text-end">56.859.949.000</td>
                                    <td class="text-end">28.021.119.074</td>
                                    <td class="text-center">49.27</td>
                                    <td class="text-end">28.838.829.926</td>
                                 </tr>
                                 <tr>
                                    <td class="text-center">020.07.11</td>
                                    <td class="text-left">Program Dukungan</td>
                                    <td class="text-end">56.859.949.000</td>
                                    <td class="text-end">28.021.119.074</td>
                                    <td class="text-center">49.27</td>
                                    <td class="text-end">28.838.829.926</td>
                                 </tr>
                                 <tr>
                                    <td class="text-center">020.07.11</td>
                                    <td class="text-left">Program Dukungan</td>
                                    <td class="text-end">56.859.949.000</td>
                                    <td class="text-end">28.021.119.074</td>
                                    <td class="text-center">49.27</td>
                                    <td class="text-end">28.838.829.926</td>
                                 </tr>
                                 <tr>
                                    <td class="text-center">020.07.11</td>
                                    <td class="text-left">Program Dukungan</td>
                                    <td class="text-end">56.859.949.000</td>
                                    <td class="text-end">28.021.119.074</td>
                                    <td class="text-center">49.27</td>
                                    <td class="text-end">28.838.829.926</td>
                                 </tr>
                              </tbody> --}}
                           </table>
                        </div>

                     </div>
                  </div>
               </div>
               <div class="tab-pane fade" id="js-tab3">
                  <div class="card rounded-0 border-0 shadow">

                     <div class="card-body">

                        <div class="table-responsive">
                           <table class="table table-bordered">
                              <thead>
                                 <tr class="">
                                    <th class="text-center border-success text-success bg-success bg-opacity-10" style="width:100px;">KODE</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10" style="">URAIAN PROGRAM</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10" style="width:180px;">PAGU</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10" style="width:180px;">REALISASI</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10" style="width:80px;">%</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10" style="width:180px;">SISA</th>
                                 </tr>
                              </thead>
                              <tbody>
                                 <tr>
                                    <td class="text-center">020.07.11</td>
                                    <td class="text-left">Program Dukungan</td>
                                    <td class="text-end">56.859.949.000</td>
                                    <td class="text-end">28.021.119.074</td>
                                    <td class="text-center">49.27</td>
                                    <td class="text-end">28.838.829.926</td>
                                 </tr>
                                 <tr>
                                    <td class="text-center">020.07.11</td>
                                    <td class="text-left">Program Dukungan</td>
                                    <td class="text-end">56.859.949.000</td>
                                    <td class="text-end">28.021.119.074</td>
                                    <td class="text-center">49.27</td>
                                    <td class="text-end">28.838.829.926</td>
                                 </tr>
                                 <tr>
                                    <td class="text-center">020.07.11</td>
                                    <td class="text-left">Program Dukungan</td>
                                    <td class="text-end">56.859.949.000</td>
                                    <td class="text-end">28.021.119.074</td>
                                    <td class="text-center">49.27</td>
                                    <td class="text-end">28.838.829.926</td>
                                 </tr>
                                 <tr>
                                    <td class="text-center">020.07.11</td>
                                    <td class="text-left">Program Dukungan</td>
                                    <td class="text-end">56.859.949.000</td>
                                    <td class="text-end">28.021.119.074</td>
                                    <td class="text-center">49.27</td>
                                    <td class="text-end">28.838.829.926</td>
                                 </tr>
                              </tbody>
                           </table>
                        </div>

                     </div>
                  </div>
               </div>
               <div class="tab-pane fade" id="js-tab4">
                  <div class="card rounded-0 border-0 shadow">

                     <div class="card-body">

                        <div class="table-responsive">
                           <table class="table table-bordered">
                              <thead>
                                 <tr class="border-top-success">
                                    <th class="text-center border-success text-success bg-success bg-opacity-10" style="width:100px;">KODE</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10" style="">URAIAN PROGRAM</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10" style="width:180px;">PAGU</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10" style="width:180px;">REALISASI</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10" style="width:80px;">%</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10" style="width:180px;">SISA</th>
                                 </tr>
                              </thead>
                              <tbody>
                                 <tr>
                                    <td class="text-center">020.07.11</td>
                                    <td class="text-left">Program Dukungan</td>
                                    <td class="text-end">56.859.949.000</td>
                                    <td class="text-end">28.021.119.074</td>
                                    <td class="text-center">49.27</td>
                                    <td class="text-end">28.838.829.926</td>
                                 </tr>
                                 <tr>
                                    <td class="text-center">020.07.11</td>
                                    <td class="text-left">Program Dukungan</td>
                                    <td class="text-end">56.859.949.000</td>
                                    <td class="text-end">28.021.119.074</td>
                                    <td class="text-center">49.27</td>
                                    <td class="text-end">28.838.829.926</td>
                                 </tr>
                                 <tr>
                                    <td class="text-center">020.07.11</td>
                                    <td class="text-left">Program Dukungan</td>
                                    <td class="text-end">56.859.949.000</td>
                                    <td class="text-end">28.021.119.074</td>
                                    <td class="text-center">49.27</td>
                                    <td class="text-end">28.838.829.926</td>
                                 </tr>
                                 <tr>
                                    <td class="text-center">020.07.11</td>
                                    <td class="text-left">Program Dukungan</td>
                                    <td class="text-end">56.859.949.000</td>
                                    <td class="text-end">28.021.119.074</td>
                                    <td class="text-center">49.27</td>
                                    <td class="text-end">28.838.829.926</td>
                                 </tr>
                              </tbody>
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
      var datatableindex, chart_pagu, chart_jenis_pagu, chart_realisasi_anggaran, chart_realisasi_kurvas, chart_realisasi_kurvas_bu, chart_realisasi_kurvas_bfk, chart_realisasi_kurvas_bfp, chart_realisasi_anggaran_bulanan;

      $(document).ready(function() {
         $('.select').select2();
         datatableindex = $('#datatable-index').dataTable({
            autoWidth: false,
            ajax: {
               url: baseurl + '/realisasianggaran/listdata_detail_per_biro_setjen',
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
      });
   </script>
@endsection
