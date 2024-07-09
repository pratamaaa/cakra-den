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
            <h6 class="py-3 mb-0 content_title">Form Upload</h6>
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
                  <label class="col-lg-3 col-form-label">Jenis Upload <span class="text-danger">*</span></label>
                  <div class="col-lg-9">
                     <select class="form-control select" data-placeholder="Jenis Upload" id="jenis_upload" name="jenis_upload" onchange="set_jenis_upload(this)">
                        <option></option>
                        <option value="data_inisiasi">Data Inisiasi</option>
                        <option value="data_realisasi">Data Realisasi</option>
                     </select>
                  </div>
               </div>
               <div class="row mb-2">
                  <label class="col-lg-3 col-form-label">Tahun <span class="text-danger">*</span></label>
                  <div class="col-lg-9">
                     <input type="text" class="form-control picker_tahun" readonly placeholder="Tahun" value="{{ date('Y') }}" id="tahun" name="tahun">
                  </div>
               </div>
               <div class="row mb-2 is_not_inisiasi" style="display: none;">
                  <label class="col-lg-3 col-form-label">Bulan <span class="text-danger">*</span></label>
                  <div class="col-lg-9">
                     <select class="form-control select" data-placeholder="Bulan" id="bulan" name="bulan">
                        <option></option>
                        <option value="1" {{ date('m') == 1 ? 'selected' : '' }}>Januari</option>
                        <option value="2" {{ date('m') == 2 ? 'selected' : '' }}>Februari</option>
                        <option value="3" {{ date('m') == 3 ? 'selected' : '' }}>Maret</option>
                        <option value="4" {{ date('m') == 4 ? 'selected' : '' }}>April</option>
                        <option value="5" {{ date('m') == 5 ? 'selected' : '' }}>Mei</option>
                        <option value="6" {{ date('m') == 6 ? 'selected' : '' }}>Juni</option>
                        <option value="7" {{ date('m') == 7 ? 'selected' : '' }}>Juli</option>
                        <option value="8" {{ date('m') == 8 ? 'selected' : '' }}>Agustus</option>
                        <option value="9" {{ date('m') == 9 ? 'selected' : '' }}>September</option>
                        <option value="10" {{ date('m') == 10 ? 'selected' : '' }}>Oktober</option>
                        <option value="11" {{ date('m') == 11 ? 'selected' : '' }}>November</option>
                        <option value="12" {{ date('m') == 12 ? 'selected' : '' }}>Desember</option>
                     </select>
                  </div>
               </div>
               <div class="row mb-2">
                  <label class="col-lg-3 col-form-label">Upload File</label>
                  <div class="col-lg-9">
                     <input type="file" class="file-input-ajax wajib" id="upload_file" name="upload_file">
                     <div class="form-text text-info">File yang diizinkan : xls, xlsx | Maksimum Ukuran File : 2 MB</div>
                  </div>
               </div>

               <div class="col-lg-6 offset-lg-3">
                  @csrf
                  <input type="hidden" name="file_upload_code" id="file_upload_code" value="{{ $temp_uuid }}">
                  <button type="submit" class="btn btn-flat-success btn-outline-success ms-1">
                     <i class="ph-note-pencil me-2"></i>
                     Simpan
                  </button>
                  <a href="{{ url('pkpa') }}" class="btn btn-flat-warning btn-outline-warning ms-1">
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

      function set_jenis_upload(ini){
         if($(ini).val()=='data_inisiasi'){
            $('.is_not_inisiasi').slideUp();
         }else{
            $('.is_not_inisiasi').slideDown();
         }

      }
      $(document).ready(function() {
         $('.select').select2();

         setDatePicker('#participant_date_of_birth_temp', '#participant_date_of_birth');
         setDatePicker('#participant_pkpa_certificate_date_temp', '#participant_pkpa_certificate_date');

         setDateRangePicker('#exam_period_register_date', '#exam_period_register_start_date', '#exam_period_register_end_date');
         const dpDefaultViewElement = document.querySelector('.picker_tahun');

         const dpDefaultView = new Datepicker(dpDefaultViewElement, {
            container: '.content-inner',
            buttonClass: 'btn',
            prevArrow: document.dir == 'rtl' ? '&rarr;' : '&larr;',
            nextArrow: document.dir == 'rtl' ? '&larr;' : '&rarr;',
            startView: 2,
            pickLevel: 2,
            autoHide: true,
            autoClose: true,
            format: "yyyy",
            viewMode: "years",
            minViewMode: "years",
            maxDate: new Date(),
            autoclose: true
         });
         var upload_file = $('#upload_file');

         upload_file.fileinput({
            allowedFileExtensions: ['xls', 'xlsx'],
            browseLabel: 'Browse',
            uploadUrl: baseurl + '/registrasi/upload_file',
            deleteUrl: baseurl + '/registrasi/delete_file',
            enableResumableUpload: true,
            uploadExtraData: {
               _token: $('input[name="_token"]').val(),
               file_upload_code: $('#file_upload_code').val()
            },
            autoReplace: true,
            uploadAsync: false,
            showUpload: false,
            minFileCount: 1,
            maxFileCount: 1,
            minFileSize: 0,
            maxFileSize: 2048,
            initialPreviewAsData: true,
            browseIcon: '<i class="ph-file-plus me-2"></i>',
            uploadIcon: '<i class="ph-file-arrow-up me-2"></i>',
            removeIcon: '<i class="ph-x fs-base me-2"></i>',
            fileActionSettings: {
               removeIcon: '<i class="ph-trash"></i>',
               removeClass: '',
               uploadIcon: '<i class="ph-upload-simple"></i>',
               uploadClass: '',
               zoomIcon: '<i class="ph-magnifying-glass-plus"></i>',
               zoomClass: '',
               indicatorNew: '<i class="ph-file-plus text-success"></i>',
               indicatorSuccess: '<i class="ph-check file-icon-large text-success"></i>',
               indicatorError: '<i class="ph-x text-danger"></i>',
               indicatorLoading: '<i class="ph-spinner spinner text-muted"></i>',
            },
            layoutTemplates: {
               icon: '<i class="ph-check"></i>'
            },
            uploadClass: 'btn btn-light',
            removeClass: 'btn btn-light',
            initialCaption: 'No file selected',
            previewZoomButtonClasses: previewZoomButtonClasses,
            previewZoomButtonIcons: previewZoomButtonIcons
         }).on("filebatchselected", function(event, files) {
            //upload_file.fileinput("upload");
         });

      });
   </script>
@endsection
