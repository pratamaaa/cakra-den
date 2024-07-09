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
            <h6 class="py-3 mb-0 content_title">Tambah Periode Ujian</h6>
         </div>

         <div class="card-body">
            @if ($errors->any())
               <div class="alert alert-warning alert-dismissible">
                  <div class="alert-heading fw-semibold">Warning</div>
                  Terdapat Kesalahan. Harap cek kembali inputan anda.
                  <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
               </div>
            @endif
            <form class="form-validate" action="" method="POST" enctype="multipart/form-data">
               <div class="row mb-2">
                  <label class="col-lg-3 col-form-label">Tanggal Ujian <span class="text-danger">*</span></label>
                  <div class="col-lg-9">
                     <input type="text" class="form-control wajib" placeholder="Tanggal Ujian" id="exam_period_date_temp" name="exam_period_date_temp">
                  </div>
               </div>

               <div class="row mb-2">
                  <label class="col-lg-3 col-form-label">Tanggal Pendaftaran <span class="text-danger">*</span></label>
                  <div class="col-lg-9">
                     <input type="text" class="form-control wajib" placeholder="Tanggal Pendaftaran" id="exam_period_register_date" name="exam_period_register_date">
                  </div>
               </div>
               <div class="row mb-2">
                  <label class="col-lg-3 col-form-label">Keterangan</label>
                  <div class="col-lg-9">
                     <textarea rows="3" cols="3" class="form-control" placeholder="Keterangan" id="exam_period_description" name="exam_period_description"></textarea>
                  </div>
               </div>
               <div class="col-lg-6 offset-lg-3">
                  @csrf
                  <button type="submit" class="btn btn-flat-success btn-outline-success ms-1">
                     <i class="ph-note-pencil me-2"></i>
                     Simpan
                  </button>
                  <a href="{{ url('periodeujian') }}" class="btn btn-flat-warning btn-outline-warning ms-1">
                     <i class="ph-arrow-fat-left me-2"></i>
                     Kembali
                  </a>
               </div>
            </form>
         </div>
      </div>
   </div>
   <script type="text/javascript">
      var datatableindex;
      $(document).ready(function() {
         setDatePicker('#exam_period_date_temp','#exam_period_date');
         setDateRangePicker('#exam_period_register_date','#exam_period_register_start_date','#exam_period_register_end_date');
      });
   </script>
@endsection
