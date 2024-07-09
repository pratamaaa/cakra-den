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
      <div class="card rounded-0 border-0 shadow">
         <div class="card-header d-flex align-items-center py-0">
            <h6 class="py-3 mb-0 content_title">Upload Data Realisasi</h6>
            <div class="ms-auto my-auto">
               <a href="{{ url('upload/create') }}" class="btn btn-flat-primary btn-outline-primary">
                  <i class="ph-plus me-2"></i>
                  Tambah Data
               </a>
            </div>
         </div>

         {{-- <div class="card-body">
            
         </div> --}}
         <table class="table table-bordered table-striped table-hover" id="datatable-index">
            <thead>
               <tr class="">
                  <th class="text-center" width="50">No</th>
                  <th class="text-center">Jenis</th>
                  <th class="text-center">Tanggal Upload</th>
                  <th class="text-center">Status</th>
                  <th class="text-center" width="100">Aksi</th>
               </tr>
            </thead>
         </table>
      </div>
   </div>
   <script type="text/javascript">
      var datatableindex;

      $(document).ready(function() {
         datatableindex = $('#datatable-index').dataTable({
            autoWidth: false,
            responsive: true,
            ajax: {
               url: baseurl + '/upload/listdata',
               type: "POST",
               data: function(d) {
                  d._token = '{{ csrf_token() }}';
                  //d.showlog = $('#showlog').val();
               }
            },
            processing: true,
            serverSide: true,
            order: [
               [0, "desc"]
            ],
            dom: '<"datatable-header justify-content-start"f<"ms-sm-auto"l><"ms-sm-3"B>><"datatable-scroll-wrap"t><"datatable-footer"ip>',
            buttons: {            
                dom: {
                    button: {
                        className: 'btn btn-light'
                    }
                },
                buttons: [
                    {
                        extend: 'excelHtml5',
                        title: $('.content_title').html()
                    },
                    {
                        extend: 'pdfHtml5',
                        title: $('.content_title').html()
                    }
                ]
            },
            aoColumns: [{
                  "bSortable": false,
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
