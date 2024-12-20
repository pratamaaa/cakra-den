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
            <h6 class="py-3 mb-0 content_title">Form Data Indikator Kinerja</h6>
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
                     <input type="text" class="form-control picker_tahun wajib" readonly placeholder="Tahun" value="{{ $detail->sasaran_strategis_year }}" id="sasaran_strategis_year" name="sasaran_strategis_year" onchange="get_ss(this)">
                  </div>
               </div>
               <div class="row mb-2">
                  <label class="col-lg-3 col-form-label">Sasaran Strategis <span class="text-danger">*</span></label>
                  <div class="col-lg-9">
                     <select class="form-control select wajib" data-placeholder="Sasaran Strategis" id="indikator_kinerja_sasaran_strategis_uuid" name="indikator_kinerja_sasaran_strategis_uuid" data-value="{{ $detail->indikator_kinerja_sasaran_strategis_uuid }}">
                        <option></option>
                     </select>
                  </div>
               </div>
               <div class="row mb-2">
                  <label class="col-lg-3 col-form-label">Indikator Kinerja <span class="text-danger">*</span></label>
                  <div class="col-lg-9">
                     <input type="text" class="form-control wajib" placeholder="Indikator Kinerja" value="{{ $detail->indikator_kinerja_name }}" id="indikator_kinerja_name" name="indikator_kinerja_name">
                  </div>
               </div>
               <div class="row mb-2">
                  <label class="col-lg-3 col-form-label">Satuan <span class="text-danger">*</span></label>
                  <div class="col-lg-9">
                     <input type="text" class="form-control wajib" placeholder="Satuan" value="{{ $detail->indikator_kinerja_satuan }}" id="indikator_kinerja_satuan" name="indikator_kinerja_satuan">
                  </div>
               </div>
               <div class="row mb-2">
                  <label class="col-lg-3 col-form-label">Target <span class="text-danger">*</span></label>
                  <div class="col-lg-9">
                     <input type="text" class="form-control wajib" placeholder="Target" value="{{ $detail->indikator_kinerja_target }}" id="indikator_kinerja_target" name="indikator_kinerja_target">
                  </div>
               </div>
               <div class="row mb-2">
                  <label class="col-lg-3 col-form-label">Realisasi <span class="text-danger">*</span></label>
                  <div class="col-lg-9">
                     <input type="text" class="form-control wajib" placeholder="Realisasi" value="{{ $detail->indikator_kinerja_realisasi }}" id="indikator_kinerja_realisasi" name="indikator_kinerja_realisasi">
                  </div>
               </div>

               <div class="col-lg-6 offset-lg-3 mt-3">
                  @csrf
                  <input type="hidden" name="save_tipe" id="save_tipe" value="0">
                  <input type="hidden" name="indikator_kinerja_uuid" id="indikator_kinerja_uuid" value="{{ $detail->indikator_kinerja_uuid }}">

                  <button type="submit" class="btn btn-flat-primary btn-outline-primary ms-1">
                     <i class="ph-note-pencil me-2"></i>
                     Simpan
                  </button>
                  <a href="{{ url('indikatorkinerja') }}" class="btn btn-flat-warning btn-outline-warning ms-1">
                     <i class="ph-arrow-fat-left me-2"></i>
                     Kembali
                  </a>
               </div>
            </form>
         </div>
      </div>
   </div>
   <div id="modal_animation" class="modal fade" data-bs-keyboard="false" data-bs-backdrop="static" tabindex="-1">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title">Syarat dan Ketentuan</h5>
               <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <div class="modal-body text-justify">

               <p> Dengan mengisi formulir pendaftaran dan mengunggah lampirannya, sebagai <b>PENDAFTAR / CALON PESERTA UPA 2023 GEL.2</b>. Dengan ini saya menyatakan bahwa:<br></p>
               <ol>
                  <li>Semua informasi yang diberikan berikut lampirannya tersebut diatas adalah benar dan sah.</li>
                  <li>Bersedia menyampaikan dokumen yang sesuai kepada Panitia Ujian apabila diperlukan.</li>
                  <li>Saya bersedia mematuhi segala syarat dan ketentuan yang telah dan/atau akan ditetapkan oleh <b>PUPA 2023 GEL.2/PERADI</b>.</li>
                  <li>Sebelum mengikuti ujian saya bersedia untuk memperlihatkan <b>KTP/SIM/PASPORT Asli</b> dan <b>TTBP Asli</b> atas nama saya sendiri pada hari ujian.</li>
               </ol>
            </div>

            <div class="modal-footer">
               <button type="button" class="btn btn-flat-success btn-outline-success ms-1" onclick="set_toc(1)">Setuju</button>
               <button type="button" class="btn btn-flat-danger btn-outline-danger ms-1" onclick="set_toc(0)">Tidak Setuju</button>

            </div>
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

      function get_ss(ini) {

         var sasaran_strategis_year = $(ini).val();
         var indikator_kinerja_sasaran_strategis_uuid = $('#indikator_kinerja_sasaran_strategis_uuid').attr('data-value');
         $('body').removeClass('loaded');
         $.ajax({
            url: baseurl + '/indikatorkinerja/get_ss',
            type: "post",
            dataType: 'json',
            data: {
               _token: $('input[name="_token"]').val(),
               sasaran_strategis_year: sasaran_strategis_year
            },
            success: function(data) {
               var NewHtml = '<option></option>';

               if (data != null) {
                  for (var i = 0; i < data.length; i++) {

                     NewHtml += '<option value="' + data[i].sasaran_strategis_uuid + '" '+((data[i].sasaran_strategis_uuid == indikator_kinerja_sasaran_strategis_uuid) ? 'selected' : '')+'>' + data[i].sasaran_strategis_name + '</option>';
                  }
                  $('#indikator_kinerja_sasaran_strategis_uuid').select2('destroy');
                  $('#indikator_kinerja_sasaran_strategis_uuid').html(NewHtml);
                  $('#indikator_kinerja_sasaran_strategis_uuid').select2({
                     dropdownAutoWidth: true,
                     width: '100%'
                  });
                  $('#indikator_kinerja_sasaran_strategis_uuid').change();
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
         get_ss($('#sasaran_strategis_year'));
         var element_list = document.getElementsByClassName('angka_doank');
         $(".angka_doank").inputmask('decimal', {
            placeholder: '',
            removeMaskOnSubmit: true,
            rightAlign: false,
            //radixPoint: ",",
            numericInput: true,
            //groupSeparator: '',
            digits: 3,
            allowMinus: false
         });

         const dpDefaultViewElement = document.querySelector('.picker_tahun');

         const dpDefaultView = new Datepicker(dpDefaultViewElement, {
            container: '.content-inner',
            buttonClass: 'btn',
            prevArrow: document.dir == 'rtl' ? '&rarr;' : '&larr;',
            nextArrow: document.dir == 'rtl' ? '&larr;' : '&rarr;',
            startView: 2,
            pickLevel: 2,
            autohide: true,
            format: "yyyy",
            viewMode: "years",
            minViewMode: "years",
            maxDate: new Date(),
            showOnClick: 1,
            showOnFocus: 1,
         });
      });
   </script>
@endsection
