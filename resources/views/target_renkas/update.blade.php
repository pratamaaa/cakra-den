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
            <h6 class="py-3 mb-0 content_title">Form Update Data Target Renkas</h6>
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
               <div class="mb-2">
                  <label class="form-label">Tahun Anggaran <span class="text-danger">*</span></label>
                  <input type="text" class="form-control picker_tahun wajib" readonly placeholder="Tahun" value="{{ date('Y') }}" id="target_year" name="target_year">
               </div>
               <div class="mb-2">
                  <label class="form-label">Target Renkas (%) <span class="text-danger">*</span></label>
                  <div class="table-responsive">
                     <table class="table table-bordered" id="datatable-detailbelanja">
                        <thead>

                           <tr class="border-top-success">
                              <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="">Satker</th>
                              <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="">Jan</th>
                              <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="">Feb</th>
                              <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="">Mar</th>
                              <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="">Apr</th>
                              <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="">Mei</th>
                              <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="">Jun</th>
                              <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="">Jul</th>
                              <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="">Ags</th>
                              <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="">Sep</th>
                              <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="">Okt</th>
                              <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="">Nov</th>
                              <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="">Des</th>
                           </tr>
                           @foreach ($work_unit as $row)
                           @if ($row->work_unit_uuid == $detail->target_work_unit_uuid)
                           <tr class="border-top-success">
                              <th class="text-center border-success text-success align-top" style="">
                                 {{ $row->work_unit_code }}
                              </th>
                              <th class="text-center border-success text-success align-top" style="">
                                 <input type="text" class="form-control wajib angka_doank" placeholder="" value="{{ $detail->target_value_percent_1 }}"  id="target_month_{{ $row->work_unit_id }}_1" name="target_month_{{ $row->work_unit_id }}_1" data_wo_id="{{ $row->work_unit_id }}" data_idx="1" onchange="check_value(this)">
                              </th>
                              <th class="text-center border-success text-success align-top" style="">
                                 <input type="text" class="form-control wajib angka_doank" placeholder="" value="{{ $detail->target_value_percent_2 }}"  id="target_month_{{ $row->work_unit_id }}_2" name="target_month_{{ $row->work_unit_id }}_2" data_wo_id="{{ $row->work_unit_id }}" data_idx="2" onchange="check_value(this)">
                              </th>
                              <th class="text-center border-success text-success align-top" style="">
                                 <input type="text" class="form-control wajib angka_doank" placeholder="" value="{{ $detail->target_value_percent_3 }}"  id="target_month_{{ $row->work_unit_id }}_3" name="target_month_{{ $row->work_unit_id }}_3" data_wo_id="{{ $row->work_unit_id }}" data_idx="3" onchange="check_value(this)">
                              </th>
                              <th class="text-center border-success text-success align-top" style="">
                                 <input type="text" class="form-control wajib angka_doank" placeholder="" value="{{ $detail->target_value_percent_4 }}"  id="target_month_{{ $row->work_unit_id }}_4" name="target_month_{{ $row->work_unit_id }}_4" data_wo_id="{{ $row->work_unit_id }}" data_idx="4" onchange="check_value(this)">
                              </th>
                              <th class="text-center border-success text-success align-top" style="">
                                 <input type="text" class="form-control wajib angka_doank" placeholder="" value="{{ $detail->target_value_percent_5 }}"  id="target_month_{{ $row->work_unit_id }}_5" name="target_month_{{ $row->work_unit_id }}_5" data_wo_id="{{ $row->work_unit_id }}" data_idx="5" onchange="check_value(this)">
                              </th>
                              <th class="text-center border-success text-success align-top" style="">
                                 <input type="text" class="form-control wajib angka_doank" placeholder="" value="{{ $detail->target_value_percent_6 }}"  id="target_month_{{ $row->work_unit_id }}_6" name="target_month_{{ $row->work_unit_id }}_6" data_wo_id="{{ $row->work_unit_id }}" data_idx="6" onchange="check_value(this)">
                              </th>
                              <th class="text-center border-success text-success align-top" style="">
                                 <input type="text" class="form-control wajib angka_doank" placeholder="" value="{{ $detail->target_value_percent_7 }}"  id="target_month_{{ $row->work_unit_id }}_7" name="target_month_{{ $row->work_unit_id }}_7" data_wo_id="{{ $row->work_unit_id }}" data_idx="7" onchange="check_value(this)">
                              </th>
                              <th class="text-center border-success text-success align-top" style="">
                                 <input type="text" class="form-control wajib angka_doank" placeholder="" value="{{ $detail->target_value_percent_8 }}"  id="target_month_{{ $row->work_unit_id }}_8" name="target_month_{{ $row->work_unit_id }}_8" data_wo_id="{{ $row->work_unit_id }}" data_idx="8" onchange="check_value(this)">
                              </th>
                              <th class="text-center border-success text-success align-top" style="">
                                 <input type="text" class="form-control wajib angka_doank" placeholder="" value="{{ $detail->target_value_percent_9 }}"  id="target_month_{{ $row->work_unit_id }}_9" name="target_month_{{ $row->work_unit_id }}_9" data_wo_id="{{ $row->work_unit_id }}" data_idx="9" onchange="check_value(this)">
                              </th>
                              <th class="text-center border-success text-success align-top" style="">
                                 <input type="text" class="form-control wajib angka_doank" placeholder="" value="{{ $detail->target_value_percent_10 }}" id="target_month_{{ $row->work_unit_id }}_10" name="target_month_{{ $row->work_unit_id }}_10" data_wo_id="{{ $row->work_unit_id }}" data_idx="10" onchange="check_value(this)">
                              </th>
                              <th class="text-center border-success text-success align-top" style="">
                                 <input type="text" class="form-control wajib angka_doank" placeholder="" value="{{ $detail->target_value_percent_11 }}" id="target_month_{{ $row->work_unit_id }}_11" name="target_month_{{ $row->work_unit_id }}_11" data_wo_id="{{ $row->work_unit_id }}" data_idx="11" onchange="check_value(this)">
                              </th>
                              <th class="text-center border-success text-success align-top" style="">
                                 <input type="text" class="form-control wajib angka_doank" placeholder="" value="{{ $detail->target_value_percent_12 }}" id="target_month_{{ $row->work_unit_id }}_12" name="target_month_{{ $row->work_unit_id }}_12" data_wo_id="{{ $row->work_unit_id }}" data_idx="12" onchange="check_value(this)">
                              </th>
                           </tr>
                           @endif
                          
                           @endforeach

                        </thead>
                        <tbody>
                        </tbody>
                     </table>
                  </div>
               </div>
              

               <div class="col-lg-12 mt-3">
                  @csrf
                  <input type="hidden" name="save_tipe" id="save_tipe" value="0">
                  <input type="hidden" name="target_uuid" id="target_uuid" value="{{ $detail->target_uuid }}">
                  <input type="hidden" name="target_work_unit_uuid" id="target_work_unit_uuid" value="{{ $detail->target_work_unit_uuid }}">
                  <input type="hidden" name="work_unit_id" id="work_unit_id" value="{{ $detail->work_unit_id }}">

                  <button type="submit" class="btn btn-flat-primary btn-outline-primary ms-1">
                     <i class="ph-note-pencil me-2"></i>
                     Simpan
                  </button>
                  <a href="{{ url('targetrenkas') }}" class="btn btn-flat-warning btn-outline-warning ms-1">
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

      function check_value(ini) {

         var dataidx = parseInt($(ini).attr('data_idx'));
         var data_wo_id = parseInt($(ini).attr('data_wo_id'));
         var prev_val = $('#target_month_'+data_wo_id+'_' + (dataidx - 1)).val();
         var next_val = $('#target_month_'+data_wo_id+'_' + (dataidx + 1)).val();
         var vals = parseFloat($(ini).val());
         if (vals < prev_val) {
            $(ini).val(prev_val);
            $(ini).change();
            return false;
         }
         if (next_val < vals) {
            for (var i = (dataidx + 1); i <= 12; i++) {
               var next_val_new = parseFloat($('#target_month_'+data_wo_id+'_' + i).val());
               if (next_val_new < vals) {
                  $('#target_month_'+data_wo_id+'_' + i).val('');
               }
            }
         }
      }

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
         var dashboard_realisasi_year = $(ini).val();
         $('body').removeClass('loaded');
         $.ajax({
            url: baseurl + '/sasaranstrategis/checktahun',
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
         // $(".angka_doank").inputmask('decimal', {
         //    placeholder: '',
         //    removeMaskOnSubmit: true,
         //    rightAlign: false,
         //    //radixPoint: ",",
         //    numericInput: true,
         //    //groupSeparator: '',
         //    digits: 3,
         //    allowMinus: false
         // });

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
         $(".angka_doank").inputmask('decimal', {
            digits: 2,
            placeholder: "0",
            digitsOptional: true,
            removeMaskOnSubmit: true,
            rightAlign: false,
            allowMinus: false,
            min: 0,
            max: 100,
            greedy: false,
            showMaskOnFocus: false,
            showMaskOnHover: false
         });
      });
   </script>
@endsection
