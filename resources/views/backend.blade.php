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
            <h6 class="py-2 mb-0 content_title">Home</h6>
         </div>

         <div class="card-body">
            @if ($errors->any())
               <div class="alert alert-warning alert-dismissible">
                  <div class="alert-heading fw-semibold">Warning</div>
                  Terdapat Kesalahan. Harap cek kembali inputan anda.
                  <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
               </div>
            @endif
            <p>Selamat datang <b>{{ session('user_fullname') }}</b>. Anda telah masuk pada <b>Aplikasi Monitoring Capaian Kinerja dan Realisasi Anggaran</b>.</p>
            @if (session()->get('user_access_uuid', '') == '2557ee6d-61d0-11ee-befa-f4a4757ae8c3')
               <p>Untuk langkah berikutnya adalah klik menu Pendaftaran Ujian pada kiri layar selanjutnya klik tombol Daftar Peserta Ujian.</p>
            @endif




         </div>
      </div>
   </div>
   <script type="text/javascript">
      $(document).ready(function() {

      });
   </script>
@endsection
