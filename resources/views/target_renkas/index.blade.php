@extends('layout.layout')
@section('content')
   <div class="content">
      <div class="card flex-lg-row flex-lg-wrap px-3 rounded-0 border shadow">
         <div class="d-flex flex-1">
            <div class="breadcrumb breadcrumb_content">
               <a href="{{ URL::to('/home') }}" class="breadcrumb-item py-2"><i class="ph-house me-2"></i> {{ env('APP_SHORT_NAME') }}</a>
            </div>
         </div>
      </div>
      <div class="card rounded-0 border shadow">
         <div class="card-header d-flex align-items-center py-0">
            <h6 class="py-3 mb-0 content_title">Daftar Data Target Renkas</h6>
            <div class="ms-auto my-auto">
               <a href="{{ url('targetrenkas/create') }}" class="btn btn-flat-primary btn-outline-primary">
                  <i class="ph-plus me-2"></i>
                  Tambah Data Target Renkas
               </a>
            </div>
         </div>

         <div class="card-body">
            <div class="row mb-2">
               <label class="col-lg-2 col-form-label">Tahun Anggaran</label>
               <div class="col-lg-10">
                  <select class="form-control select wajib" data-placeholder="Tahun Anggaran" id="target_year" name="target_year">
                     <option></option>

                     @for ($i = date('Y') - 5; $i <= date('Y') + 1; $i++)
                        <option value="{{ $i }}" {{ $i == date('Y') ? 'selected' : '' }}>{{ $i }}</option>
                     @endfor
                  </select>
               </div>
            </div>
            <div class="row mb-2">
               <label class="col-lg-2 col-form-label"></label>
               <div class="col-lg-10">
                  <button type="button" class="btn btn-flat-primary btn-outline-primary" onclick="cari(1)">
                     <i class="ph-magnifying-glass me-2"></i>
                     Cari
                  </button>
               </div>
            </div>
         </div>
         <table class="table table-bordered table-striped table-hover" id="datatable-index">
            <thead>
               <tr class="">
                  <th class="text-center" width="50">No</th>
                  <th class="text-center">Satker</th>
                  <th class="text-center">Tahun</th>
                  <th class="text-center">Jan<br>(%)</th>
                  <th class="text-center">Feb<br>(%)</th>
                  <th class="text-center">Mar<br>(%)</th>
                  <th class="text-center">Apr<br>(%)</th>
                  <th class="text-center">Mei<br>(%)</th>
                  <th class="text-center">Jun<br>(%)</th>
                  <th class="text-center">Jul<br>(%)</th>
                  <th class="text-center">Ags<br>(%)</th>
                  <th class="text-center">Sep<br>(%)</th>
                  <th class="text-center">Okt<br>(%)</th>
                  <th class="text-center">Nov<br>(%)</th>
                  <th class="text-center">Des<br>(%)</th>

                  <th class="text-center" width="100">Aksi</th>
               </tr>
            </thead>
         </table>
      </div>
   </div>
   <script type="text/javascript">
      var datatableindex;

      function cari(jenis) {
         var target_year = $('#target_year').val();
         var participant_approval_iief_status_name = $('#participant_approval_iief_status_name').val();
         var participant_test_city_uuid = $('#participant_test_city_uuid').val();

         $('#datatable-index').DataTable().ajax.reload();

      }
      $(document).ready(function() {
         $('body').removeClass('loaded');

         $('.select').select2({
            dropdownAutoWidth: true,
            width: '100%'
         });
         datatableindex = $('#datatable-index').dataTable({
            autoWidth: false,
            responsive: true,
            ajax: {
               url: baseurl + '/targetrenkas/list',
               type: "POST",
               data: function(d) {
                  d._token = '{{ csrf_token() }}';
                  d.target_year = function() {
                     return $('#target_year').val();
                  };

               }
            },
            processing: true,
            serverSide: true,
            order: [
               [0, "desc"]
            ],
            dom: '<"datatable-header justify-content-start"f<"ms-sm-auto"l><"">><"datatable-scroll-wrap"t><"datatable-footer"ip>',
            buttons: {
               dom: {
                  button: {
                     className: 'btn btn-light'
                  }
               },
               buttons: [

               ]
            },
            aoColumns: [{
                  "bSortable": false,
                  "sClass": "text-center"
               },
               {
                  "sClass": "text-left"
               },
               {
                  "sClass": "text-center"
               },
               {
                  "sClass": "text-center"
               },
               {
                  "sClass": "text-center"
               },
               {
                  "sClass": "text-center"
               },
               {
                  "sClass": "text-center"
               },
               {
                  "sClass": "text-center"
               },
               {
                  "sClass": "text-center"
               },
               {
                  "sClass": "text-center"
               },
               {
                  "sClass": "text-center"
               },
               {
                  "sClass": "text-center"
               },
               {
                  "sClass": "text-center"
               },
               {
                  "sClass": "text-center"
               },
               
               {
                  "sClass": "text-center"
               },
               {
                  "bSortable": false,
                  "sClass": "text-center"
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
