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
         <div class="col-md-12">
            <div class="card rounded-0 border-0 shadow-0">
               <div class="card-header d-flex align-items-center">
                  <h6 class="mb-0">Dashboard Capaian Kinerja</h6>
                  <div class="ms-auto">

                     <div class="input-group">
                        <span class="input-group-text">Tahun Anggaran</span>
                        <input type="text" class="form-control datepicker-default-view text-end" readonly placeholder="Tahun" value="{{ date('Y') }}" style="width: 130px" id="sasaran_strategis_year" name="sasaran_strategis_year" onchange="set_ulang_dashboard(this)">
                     </div>
                  </div>
               </div>
               <div class="card-body">

                  <div class="table-responsive">
                     <table class="table table-bordered table_border_hijau" id="datatable-index">

                        <thead>
                           <tr class="border-top-success">
                              <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="width: 1%;">No</th>
                              <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="width: 30%;">Sasaran Strategis</th>
                              <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="width: 40%;">Indikator Kinerja</th>
                              <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle">Satuan</th>
                              <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle">Target</th>
                              <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle">Realisasi</th>
                              <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle">% Capaian</th>
                              {{-- <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle">% Anggaran</th> --}}
                           </tr>
                        </thead>
                        <tfoot>
                           <tr>
                              <td class="text-left border-success text-success bg-success bg-opacity-10 fw-semibold" colspan="6">RATA RATA NILAI KINERJA ORGANISASI</td>
                              <td class="text-end border-success text-success bg-success bg-opacity-10 fw-semibold total_capaian">0</td>
                              {{-- <td class="text-end border-success text-success bg-success bg-opacity-10 fw-semibold total_index_8">0</td>
                              <td class="text-end border-success text-success bg-success bg-opacity-10 fw-semibold total_index_9">0</td> --}}
                           </tr>
                        </tfoot>
                     </table>
                  </div>

               </div>
            </div>
         </div>
      </div>
   </div>
   <script type="text/javascript">
      var datatableindex, chart_pagu, chart_jenis_pagu, chart_realisasi_anggaran;
      function set_ulang_dashboard(){
         $('#datatable-index').DataTable().ajax.reload();

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
               url: baseurl + '/capaiankinerja/list',
               type: "POST",
               data: function(d) {
                  d._token = '{{ csrf_token() }}';
                  d.sasaran_strategis_year = function() {
                     return $('#sasaran_strategis_year').val();
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
                  "sClass": "text-center"
               },
               {
                  "bSortable": false,
                  "sClass": "text-center"
               },
               {
                  "bSortable": false,
                  "sClass": "text-center"
               },
               {
                  "bSortable": false,
                  "sClass": "text-center"
               },
               // {
               //    "bSortable": false,
               //    "sClass": "text-center"
               // },
            ],
            drawCallback: function(settings) {
               App.initCore();
               var api = this.api();
               var data_api = api.rows({
                  page: 'current'
               }).data();
               var response = settings.json;
               var total_capaian = 0;
               // console.log(data_api.length)
               for (let index = 0; index < data_api.length; index++) {
                  total_capaian += parseFloat(data_api[index][6].replace(/\./g, ''));
               }
               total_capaian = (total_capaian/data_api.length).toFixed(2);
               $('.total_capaian').html(new Intl.NumberFormat('id-ID').format(total_capaian));

               // console.log(total_capaian/data_api.length)
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
