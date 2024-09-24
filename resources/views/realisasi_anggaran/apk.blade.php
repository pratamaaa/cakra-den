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
            {{-- 
            <ul class="nav nav-tabs nav-tabs-solid nav-justified border mb-3 text-success bg-success border-success bg-opacity-10">
               <li class="nav-item">
                  <a href="#js-tab1" class="nav-link fw-medium fw-semibold active" data-bs-toggle="tab">Realisasi APK DEN</a>
               </li>
            </ul> 
            --}}


            <div class="tab-content">
               <div class="tab-pane fade show active" id="js-tab1">
                  <div class="card rounded-0 border-0 shadow-0">
                     <div class="card-header d-flex align-items-center">
                        <h6 class="mb-0">Anggaran APK DEN</h6>
                        <div class="ms-auto">

                           <div class="input-group">
                              <span class="input-group-text">Tahun Anggaran</span>
                              <select class="form-control select center" data-placeholder="Bulan" id="data_anggaran_apk_bulan" name="data_anggaran_apk_bulan" onchange="set_realisasi(this)">
                                 <option></option>
                                 <option value="1" {{ date('m') == 1 ? 'selected' : '' }}>{{ strtoupper('Januari') }}</option>
                                 <option value="2" {{ date('m') == 2 ? 'selected' : '' }}>{{ strtoupper('Februari') }}</option>
                                 <option value="3" {{ date('m') == 3 ? 'selected' : '' }}>{{ strtoupper('Maret') }}</option>
                                 <option value="4" {{ date('m') == 4 ? 'selected' : '' }}>{{ strtoupper('April') }}</option>
                                 <option value="5" {{ date('m') == 5 ? 'selected' : '' }}>{{ strtoupper('Mei') }}</option>
                                 <option value="6" {{ date('m') == 6 ? 'selected' : '' }}>{{ strtoupper('Juni') }}</option>
                                 <option value="7" {{ date('m') == 7 ? 'selected' : '' }}>{{ strtoupper('Juli') }}</option>
                                 <option value="8" {{ date('m') == 8 ? 'selected' : '' }}>{{ strtoupper('Agustus') }}</option>
                                 <option value="9" {{ date('m') == 9 ? 'selected' : '' }}>{{ strtoupper('September') }}</option>
                                 <option value="10" {{ date('m') == 10 ? 'selected' : '' }}>{{ strtoupper('Oktober') }}</option>
                                 <option value="11" {{ date('m') == 11 ? 'selected' : '' }}>{{ strtoupper('November') }}</option>
                                 <option value="12" {{ date('m') == 12 ? 'selected' : '' }}>{{ strtoupper('Desember') }}</option>
                              </select>
                              <input type="text" class="form-control datepicker-default-view text-end" readonly placeholder="Tahun" value="{{ date('Y') }}" style="width: 130px" id="data_anggaran_apk_tahun" name="data_anggaran_apk_tahun" onchange="set_realisasi(this)">
                           </div>
                        </div>
                     </div>
                     <div class="card-body">
                        <div class="table-responsive">
                           <table class="table table-bordered table_border_hijau" id="datatable-apk">

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
            </div>

         </div>
      </div>
   </div>
   <script type="text/javascript">
      var datatableapk, datatableindex2, chart_pagu, chart_jenis_pagu, chart_realisasi_anggaran;

      function set_realisasi() {
         $('#datatable-apk').DataTable().ajax.reload();
         // $('#datatable-index2').DataTable().ajax.reload();

      }
      $(document).ready(function() {
         $('.select').select2({
            dropdownAutoWidth: true,
            width: 'auto'
         });
         datatableapk = $('#datatable-apk').dataTable({
            autoWidth: false,
            ajax: {
               url: baseurl + '/realisasianggaran/list_apk',
               type: "POST",
               data: function(d) {
                  d._token = '{{ csrf_token() }}';
                  d.tahun = function() {
                     return $('#data_anggaran_apk_tahun').val();
                  };
                  d.bulan = function() {
                     return $('#data_anggaran_apk_bulan').val();
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
            rowsGroup: [0, 1],
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
         const data_anggaran_apk_tahun = document.querySelector('#data_anggaran_apk_tahun');

         var dpDefaultView_data_anggaran_apk_tahun = new Datepicker(data_anggaran_apk_tahun, {
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
      });
   </script>
@endsection
