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
            <h6 class="py-3 mb-0 content_title">Form Detail Data Dashboard Realisasi</h6>
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
                  <label class="col-lg-3 col-form-label">Tahun Anggaran <span class="text-danger">*</span></label>
                  <div class="col-lg-9">
                     <select class="form-control select wajib" disabled data-placeholder="Tahun Anggaran" id="dashboard_realisasi_year" name="dashboard_realisasi_year" onchange="check_tahun(this)">
                        <option></option>
                        @for ($i = date('Y') - 5; $i <= date('Y') + 1; $i++)
                           <option value="{{ $i }}" {{ $detail->dashboard_realisasi_year == $i ? 'selected' : '' }}>{{ $i }}</option>
                        @endfor
                     </select>
                  </div>
               </div>
               <div class="is_revisi" style="">
                  <div class="row mb-2">
                     <label class="col-lg-3 col-form-label">Pagu Awal</label>
                     <div class="col-lg-9">
                        <div class="input-group mt-2">
                           <span class="input-group-text">Rp</span>
                           <input readonly type="text" value="{{ $detail->dashboard_realisasi_total_belanja }}" class="form-control angka_doank" placeholder="" id="dashboard_realisasi_pagu_awal" name="dashboard_realisasi_pagu_awal">
                        </div>
                     </div>
                  </div>
                  <div class="row mb-2">
                     <label class="col-lg-3 col-form-label">Jenis Revisi <span class="text-danger">*</span></label>
                     <div class="col-lg-9">
                        <select class="form-control select wajib" disabled data-placeholder="Jenis Revisi" id="dashboard_realisasi_revision_name" name="dashboard_realisasi_revision_name">
                           <option></option>
                           <option value="PAGU AWAL" {{ $detail->dashboard_realisasi_revision_name == 'PAGU AWAL' ? 'selected' : '' }}>PAGU AWAL</option>
                           <option value="POK" {{ $detail->dashboard_realisasi_revision_name == 'POK' ? 'selected' : '' }}>POK</option>
                        </select>
                     </div>
                  </div>
               </div>
               <div class="row mb-2">
                  <label class="col-lg-3 col-form-label">Belanja Pegawai <span class="text-danger">*</span></label>
                  <div class="col-lg-9">
                     <div class="input-group mt-2">
                        <span class="input-group-text">Rp</span>
                        <input type="text" readonly value="{{ $detail->dashboard_realisasi_pegawai }}" class="form-control wajib angka_doank" placeholder="" id="dashboard_realisasi_pegawai" name="dashboard_realisasi_pegawai" onkeyup="hitung_total(this)">
                     </div>
                  </div>
               </div>
               <div class="row mb-2">
                  <label class="col-lg-3 col-form-label">Belanja Barang <span class="text-danger">*</span></label>
                  <div class="col-lg-9">
                     <div class="input-group mt-2">
                        <span class="input-group-text">Rp</span>
                        <input type="text" readonly value="{{ $detail->dashboard_realisasi_barang }}" class="form-control wajib angka_doank" placeholder="" id="dashboard_realisasi_barang" name="dashboard_realisasi_barang" onkeyup="hitung_total(this)">
                     </div>
                  </div>
               </div>
               <div class="row mb-2">
                  <label class="col-lg-3 col-form-label">Belanja Modal <span class="text-danger">*</span></label>
                  <div class="col-lg-9">
                     <div class="input-group mt-2">
                        <span class="input-group-text">Rp</span>
                        <input type="text" readonly value="{{ $detail->dashboard_realisasi_modal }}" class="form-control wajib angka_doank" placeholder="" id="dashboard_realisasi_modal" name="dashboard_realisasi_modal" onkeyup="hitung_total(this)">
                     </div>
                  </div>
               </div>
               <div class="row mb-2">
                  <label class="col-lg-3 col-form-label">Total Belanja</label>
                  <div class="col-lg-9">
                     <div class="input-group mt-2">
                        <span class="input-group-text">Rp</span>
                        <input readonly type="text" value="{{ $detail->dashboard_realisasi_total_belanja }}" class="form-control wajib angka_doank" placeholder="" id="dashboard_realisasi_total_belanja_temp" name="dashboard_realisasi_total_belanja_temp">
                        <input readonly type="hidden" value="{{ $detail->dashboard_realisasi_total_belanja }}" class="form-control isnothidden" placeholder="" id="dashboard_realisasi_total_belanja" name="dashboard_realisasi_total_belanja">
                     </div>
                  </div>

               </div>

               <div class="col-lg-6 offset-lg-3 mt-3">
                  @csrf
                  <input type="hidden" name="save_tipe" id="save_tipe" value="0">
                  <input readonly type="hidden" value="{{ $detail->dashboard_realisasi_total_belanja }}" class="form-control" placeholder="" id="dashboard_realisasi_total" name="dashboard_realisasi_total">
                  <input readonly type="hidden" value="{{ $detail->dashboard_realisasi_uuid }}" class="form-control" placeholder="" id="dashboard_realisasi_uuid" name="dashboard_realisasi_uuid">

                  <a href="{{ url('dashboard/datarealisasi') }}" class="btn btn-flat-warning btn-outline-warning ms-1">
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

      function set_toc(jenis) {
         if (jenis == 1) {
            $('#toc').prop('checked', true);
         } else {
            $('#toc').prop('checked', false);
         }
         $('#modal_animation').modal('hide');

      }

      function hitung_total(ini) {
         var dashboard_realisasi_pegawai = $('#dashboard_realisasi_pegawai').val();
         var dashboard_realisasi_barang = $('#dashboard_realisasi_barang').val();
         var dashboard_realisasi_modal = $('#dashboard_realisasi_modal').val();
         dashboard_realisasi_pegawai = ((dashboard_realisasi_pegawai == '') ? '0' : dashboard_realisasi_pegawai);
         dashboard_realisasi_barang = ((dashboard_realisasi_barang == '') ? '0' : dashboard_realisasi_barang);
         dashboard_realisasi_modal = ((dashboard_realisasi_modal == '') ? '0' : dashboard_realisasi_modal);

         dashboard_realisasi_pegawai = parseFloat(dashboard_realisasi_pegawai.replace(/\./g, '').replace(/\,/g, '.'));
         dashboard_realisasi_barang = parseFloat(dashboard_realisasi_barang.replace(/\./g, '').replace(/\,/g, '.'));
         dashboard_realisasi_modal = parseFloat(dashboard_realisasi_modal.replace(/\./g, '').replace(/\,/g, '.'));
         var dashboard_realisasi_total_belanja = dashboard_realisasi_pegawai + dashboard_realisasi_barang + dashboard_realisasi_modal;

         $('#dashboard_realisasi_total_belanja_temp').val(dashboard_realisasi_total_belanja);
         $('#dashboard_realisasi_total_belanja').val(dashboard_realisasi_total_belanja);
      }

      function check_tahun(ini) {
         var dashboard_realisasi_year = $('#dashboard_realisasi_year').val();
         $('body').removeClass('loaded');
         $.ajax({
            url: baseurl + '/dashboard/checktahun',
            type: "post",
            dataType: 'json',
            data: {
               _token: $('input[name="_token"]').val(),
               dashboard_realisasi_year: dashboard_realisasi_year
            },
            success: function(data) {
               if (data != null) {
                  $('.is_revisi').slideDown();
                  $('#dashboard_realisasi_pegawai').val(data.dashboard_realisasi_pegawai);
                  $('#dashboard_realisasi_barang').val(data.dashboard_realisasi_barang);
                  $('#dashboard_realisasi_modal').val(data.dashboard_realisasi_modal);
                  $('#dashboard_realisasi_total').val(data.dashboard_realisasi_total);
                  $('#dashboard_realisasi_total_belanja').val(data.dashboard_realisasi_total_belanja);
                  $('#dashboard_realisasi_total_belanja_temp').val(data.dashboard_realisasi_total_belanja);
                  $('#dashboard_realisasi_pagu_awal').val(data.dashboard_realisasi_total_belanja);
                  $("#dashboard_realisasi_revision_name").val('').trigger('change');

                  $("#dashboard_realisasi_total_belanja").rules("add", {
                     required: true,
                     max: function() {
                        var total = ($('#dashboard_realisasi_pagu_awal').val()).replace(/\./g, '');
                        return parseInt(total);
                     },
                     min: function() {
                        var total = ($('#dashboard_realisasi_pagu_awal').val()).replace(/\./g, '');
                        return parseInt(total);
                     },
                     messages: {
                        max: "Maaf Total Belanja tidak dapat melebih Pagu Awal Rp. " + addCommas(parseInt(($('#dashboard_realisasi_pagu_awal').val()).replace(/\./g, ''))),
                        min: "Maaf Total Belanja tidak dapat Kurang dari Pagu Awal Rp. " + addCommas(parseInt(($('#dashboard_realisasi_pagu_awal').val()).replace(/\./g, ''))),
                     }
                  });
               } else {
                  $('.is_revisi').slideUp();
                  $('#dashboard_realisasi_pagu_awal').val('');
                  $("#dashboard_realisasi_revision_name").val('PAGU AWAL').trigger('change');
                  $("#dashboard_realisasi_total_belanja_temp").rules("remove", 'required');
                  $("#dashboard_realisasi_total_belanja_temp").rules("remove", 'max');
                  $("#dashboard_realisasi_total_belanja_temp").rules("remove", 'min');
               }

               $('body').addClass('loaded');

            }
         });
      }

      function addCommas(nStr) {
         nStr += '';
         var x = nStr.split('.');
         var x1 = x[0];
         var x2 = x.length > 1 ? '.' + x[1] : '';
         var rgx = /(\d+)(\d{3})/;
         while (rgx.test(x1)) {
            x1 = x1.replace(rgx, '$1' + '.' + '$2');
         }

         return x1 + x2;
      }
      $(document).ready(function() {
         $('.select').select2();
         var element_list = document.getElementsByClassName('angka_doank');
         $(".angka_doank").inputmask('decimal', {
            placeholder: '',
            removeMaskOnSubmit: true,
            rightAlign: false,
            radixPoint: ",",
            numericInput: true,
            groupSeparator: '.',
            digits: 0,
            allowMinus: false
         });
      });
   </script>
@endsection
