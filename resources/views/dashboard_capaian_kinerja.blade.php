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
         Dashboard Capaian Kinerja
       </div>
      </div>
   </div>
   <script type="text/javascript">
      var datatableindex, chart_pagu, chart_jenis_pagu, chart_realisasi_anggaran;

      $(document).ready(function() {
         $('.select').select2();
       
      });
   </script>
@endsection
