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
            <ul class="nav nav-tabs nav-tabs-solid nav-justified border mb-3 text-success bg-success border-success bg-opacity-10">
               <li class="nav-item">
                  <a href="#js-tab1" class="nav-link fw-medium fw-semibold active" data-bs-toggle="tab">Data Anggaran</a>
               </li>
               <li class="nav-item">
                  <a href="#js-tab2" class="nav-link fw-medium fw-semibold" data-bs-toggle="tab">Kurva-S</a>
               </li>
               <li class="nav-item">
                  <a href="#js-tab3" class="nav-link fw-medium fw-semibold" data-bs-toggle="tab">Detail Per-Belanja</a>
               </li>
               <li class="nav-item">
                  <a href="#js-tab4" class="nav-link fw-medium fw-semibold" data-bs-toggle="tab">Diagam Realisasi</a>
               </li>
            </ul>

            <div class="row d-flex justify-content-center">
               <div class="col-sm-6 col-md-4 col-xl-4">
                  <div class="card card-body rounded-0 border-0">
                     <div class="d-flex align-items-center mb-3">
                        <i class="ph-activity ph-2x text-indigo opacity-75 me-3"></i>
                        <div class="flex-fill">
                           <h6 class="mb-0">Target</h6>
                           <span class="text-muted">Anggaran</span>
                        </div>


                     </div>

                     <div class="progress mb-2" style="height: 0.125rem;">
                        <div class="progress-bar bg-indigo" style="width: {{ $data_realisasi_item_target->persen_target }}%"></div>
                     </div>

                     <div>
                        <span class="float-end">{{ $data_realisasi_item_target->persen_target }}%</span>
                        Sampai Dengan {{ GlobalHelper::parseDateID($data_realisasi_item_target->tanggal_target, 'short') }}
                     </div>
                  </div>
               </div>

               <div class="col-sm-6 col-md-4 col-xl-4">
                  <div class="card card-body rounded-0 border-0">
                     <div class="d-flex align-items-center mb-3">
                        <i class="ph-activity ph-2x text-primary opacity-75 me-3"></i>

                        <div class="flex-fill">
                           <h6 class="mb-0">SP2D</h6>
                           <span class="text-muted">Anggaran</span>
                        </div>
                     </div>

                     <div class="progress mb-2" style="height: 0.125rem;">
                        <div class="progress-bar bg-primary" style="width: {{ $data_realisasi_item_sppd->persen_sppd }}%"></div>
                     </div>

                     <div>
                        <span class="float-end">{{ $data_realisasi_item_sppd->persen_sppd }}%</span>
                        Sampai Dengan {{ GlobalHelper::parseDateID(date('Y-m-d'), 'short') }}
                     </div>
                  </div>
               </div>

               <div class="col-sm-6 col-md-4 col-xl-4">
                  <div class="card card-body rounded-0 border-0">
                     <div class="d-flex align-items-center mb-3">
                        <i class="ph-activity ph-2x text-success opacity-75 me-3"></i>

                        <div class="flex-fill">
                           <h6 class="mb-0">Deviasi</h6>
                           <span class="text-muted">Anggaran</span>
                        </div>
                     </div>

                     <div class="progress mb-2" style="height: 0.125rem;">
                        <div class="progress-bar bg-success" style="width: {{ $data_realisasi_item_deviasi_hijau }}%" aria-valuenow="{{ $data_realisasi_item_deviasi_hijau }}" aria-valuemin="0" aria-valuemax="100"></div>
                        <div class="progress-bar bg-danger" style="width: {{ $data_realisasi_item_deviasi_merah }}%" aria-valuenow="{{ $data_realisasi_item_deviasi_merah }}" aria-valuemin="0" aria-valuemax="100"></div>

                     </div>

                     <div>
                        <span class="float-end">{{ $data_realisasi_item_deviasi_merah }}%</span>
                        Sampai Dengan {{ GlobalHelper::parseDateID(date('Y-m-d'), 'short') }}
                     </div>
                  </div>
               </div>
            </div>

            <div class="tab-content">
               <div class="tab-pane fade show active" id="js-tab1">
                  <div class="card rounded-0 border-0 shadow-0">
                     <div class="card-header d-flex align-items-center">
                        <h6 class="mb-0">Data Anggaran</h6>
                        <div class="ms-auto">

                           <div class="input-group">
                              <span class="input-group-text">Tahun Anggaran</span>
                              <input type="text" class="form-control datepicker-default-view text-end" readonly placeholder="Tahun" value="{{ date('Y') }}" style="width: 130px" id="data_anggaran_tahun" name="data_anggaran_tahun">
                           </div>
                        </div>
                     </div>
                     <div class="card-body">

                        <div class="table-responsive">
                           <table class="table table-bordered" id="datatable-dataanggaran">

                              <thead>
                                 <tr class="border-top-success">
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="min-width:350px;" rowspan="3">SATUAN KERJA</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="" rowspan="1">PAGU</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="" colspan="2">TARGET BULAN<br>
                                       <select class="form-control select center" data-placeholder="Bulan" id="data_anggaran_bulan" name="data_anggaran_bulan">
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
                                    </th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="" colspan="5">REALISASI DAN DEVIASI</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="" colspan="2">SISA ANGGARAN</th>
                                 </tr>
                                 <tr class="">
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="min-width:150px;" rowspan="2">Rp. M</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="min-width:150px;" rowspan="2">RP. M</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="min-width:150px;" rowspan="2">%</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="" rowspan="1">SPM</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="" rowspan="1">SP2D</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="" rowspan="1">DEVIASI</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="" colspan="2">REALISASI (%) TERHADAP</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="" rowspan="1">SPM</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="" rowspan="1">SP2D</th>
                                 </tr>
                                 <tr class="">
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="min-width:150px;">RP. M</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="min-width:150px;">RP. M</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="min-width:150px;">RP. M</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="min-width:100px;">Target</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="min-width:100px;">Pagu</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="min-width:150px;">RP. M</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="min-width:150px;">RP. M</th>
                                 </tr>
                              </thead>
                              <tfoot>
                                 <tr>
                                    <td class="text-left border-success text-success bg-success bg-opacity-10 fw-semibold">SEKRETARIS JENDERAL DEWAN ENERGI NASIONAL</td>
                                    <td class="text-end border-success text-success bg-success bg-opacity-10 fw-semibold total_index_1">0</td>
                                    <td class="text-end border-success text-success bg-success bg-opacity-10 fw-semibold total_index_2">0</td>
                                    <td class="text-end border-success text-success bg-success bg-opacity-10 fw-semibold total_index_3">0</td>
                                    <td class="text-end border-success text-success bg-success bg-opacity-10 fw-semibold total_index_4">0</td>
                                    <td class="text-end border-success text-success bg-success bg-opacity-10 fw-semibold total_index_5">0</td>
                                    <td class="text-end border-success text-success bg-success bg-opacity-10 fw-semibold total_index_6">0</td>
                                    <td class="text-end border-success text-success bg-success bg-opacity-10 fw-semibold total_index_7">0</td>
                                    <td class="text-end border-success text-success bg-success bg-opacity-10 fw-semibold total_index_8">0</td>
                                    <td class="text-end border-success text-success bg-success bg-opacity-10 fw-semibold total_index_9">0</td>
                                    <td class="text-end border-success text-success bg-success bg-opacity-10 fw-semibold total_index_10">0</td>
                                 </tr>
                              </tfoot>
                           </table>
                        </div>
                        <div class="row ">
                           <div class="col-lg-12 py-3 d-flex justify-content-center">
                              <span class="badge bg-light border-start border-width-3 text-body rounded-start-0 border-pink ms-3">Deviasi > -3%</span>
                              <span class="badge bg-light border-start border-width-3 text-body rounded-start-0 border-yellow text-yellow ms-3">Deviasi -1% s/d -3%</span>
                              <span class="badge bg-light border-start border-width-3 text-body rounded-start-0 border-success ms-3">Deviasi < -1%</span>
                                    <span class="badge bg-light border-start border-width-3 text-body rounded-start-0 border-primary ms-3">Melebihi Target</span>
                           </div>
                        </div>

                     </div>
                  </div>
               </div>
               <div class="tab-pane fade" id="js-tab2">
                  <div class="row">
                     <div class="col-lg-3">

                        <div class="card rounded-0 border-0 shadow">
                           <div class="card-header d-flex align-items-center py-0">
                              <h6 class="py-2 mb-0 content_title">Chart</h6>
                           </div>
                           <div class="card-body">

                              <!-- Filter -->
                              <div class="sidebar-section-body">
                                 <label class="form-check form-check-reverse text-start mb-2">
                                    <input type="checkbox" class="form-check-input filter_target" value="1" checked>
                                    <span class="form-check-label">Target</span>
                                 </label>

                                 <label class="form-check form-check-reverse text-start mb-2">
                                    <input type="checkbox" class="form-check-input filter_target" value="2" checked>
                                    <span class="form-check-label">Realisasi</span>
                                 </label>

                              </div>
                              <!-- /filter -->
                           </div>
                        </div>
                        <div class="card rounded-0 border-0 shadow">
                           <div class="card-header d-flex align-items-center py-0">
                              <h6 class="py-2 mb-0 content_title">Satker</h6>
                           </div>
                           <div class="card-body">

                              <!-- Filter -->
                              <div class="sidebar-section-body">
                                 @foreach ($satker as $row)
                                    <label class="form-check form-check-reverse text-start mb-2">
                                       @if (!$loop->first)
                                          <input type="checkbox" class="form-check-input filter_satker" value="{{ $row->work_unit_uuid }}">
                                          <span class="form-check-label ps-3">{{ $row->work_unit_code }}</span>
                                       @else
                                          <input type="checkbox" class="form-check-input filter_satker" value="{{ $row->work_unit_uuid }}" checked>
                                          <span class="form-check-label">{{ $row->work_unit_code }}</span>
                                       @endif
                                    </label>
                                 @endforeach

                              </div>
                              <!-- /filter -->
                           </div>
                        </div>
                     </div>
                     <div class="col-lg-9">
                        <div class="card rounded-0 border-0 shadow">

                           <div class="card-body">
                              <div id="chart_realisasi_kurvas" class="chart_layout highcharts-light"></div>


                           </div>
                        </div>
                     </div>
                  </div>
               </div>

               <div class="tab-pane fade" id="js-tab3">
                  <div class="card rounded-0 border-0 shadow">

                     <div class="card-body">

                        <div class="table-responsive">
                           <table class="table table-bordered">
                              <thead>
                                 <tr class="border-top-success">
                                    <th class="text-center border-success text-success bg-success bg-opacity-10" style="" rowspan="2">SATKER</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10" style="" colspan="2">BELANJA PEGAWAI<br></th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10" style="" colspan="2">BELANJA BARANG<br></th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10" style="" colspan="2">BELANJA MODAL<br></th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10" style="" colspan="2">TOTAL</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10" style="" rowspan="2">% REALISASI<br></th>
                                 </tr>
                                 <tr>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10" style="">PAGU</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10" style="">REALISASI</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10" style="">PAGU</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10" style="">REALISASI</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10" style="">PAGU</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10" style="">REALISASI</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10" style="">PAGU</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10" style="">REALISASI</th>
                                 </tr>
                              </thead>
                              <tbody>
                                 @php $total_pagu_pegawai = 0; @endphp
                                 @php $total_sppd_pegawai = 0; @endphp
                                 @php $total_pagu_barang = 0; @endphp
                                 @php $total_sppd_barang = 0; @endphp
                                 @php $total_pagu_modal = 0; @endphp
                                 @php $total_sppd_modal = 0; @endphp
                                 @php $total_total_pagu = 0; @endphp
                                 @php $total_total_realisasi = 0; @endphp
                                 @php $total_persentasi_realisasi = 0; @endphp
                                 @foreach ($belanja as $row)
                                    <tr>
                                       <td class="text-left border-success bg-opacity-10">{{ $row->work_unit_name }}</td>
                                       <td class="text-end border-success bg-opacity-10">{{ $row->pagu_pegawai_format }}</td>
                                       <td class="text-end border-success bg-opacity-10">{{ $row->sppd_pegawai_format }}</td>
                                       <td class="text-end border-success bg-opacity-10">{{ $row->pagu_barang_format }}</td>
                                       <td class="text-end border-success bg-opacity-10">{{ $row->sppd_barang_format }}</td>
                                       <td class="text-end border-success bg-opacity-10">{{ $row->pagu_modal_format }}</td>
                                       <td class="text-end border-success bg-opacity-10">{{ $row->sppd_modal_format }}</td>
                                       <td class="text-end border-success bg-opacity-10">{{ $row->total_pagu_format }}</td>
                                       <td class="text-end border-success bg-opacity-10">{{ $row->total_realisasi_format }}</td>
                                       <td class="text-center border-success bg-opacity-10">{{ $row->persentasi_realisasi }}</td>
                                    </tr>
                                    @php $total_pagu_pegawai += $row->pagu_pegawai; @endphp
                                    @php $total_sppd_pegawai += $row->sppd_pegawai; @endphp
                                    @php $total_pagu_barang += $row->pagu_barang; @endphp
                                    @php $total_sppd_barang += $row->sppd_barang; @endphp
                                    @php $total_pagu_modal += $row->pagu_modal; @endphp
                                    @php $total_sppd_modal += $row->sppd_modal; @endphp
                                    @php $total_total_pagu += $row->total_pagu; @endphp
                                    @php $total_total_realisasi += $row->total_realisasi; @endphp
                                    @php $total_persentasi_realisasi += $row->persentasi_realisasi; @endphp
                                 @endforeach

                              </tbody>
                              <tfoot>
                                 <tr class="border-bottom-success">
                                    @php $total_persentasi_realisasi = round(($total_persentasi_realisasi/3),2); @endphp
                                    <td class="text-center border-success text-success bg-success bg-opacity-10" style="">TOTAL</td>
                                    <td class="text-end border-success text-success bg-success bg-opacity-10" style="">{{ GlobalHelper::rupiah($total_pagu_pegawai) }}</td>
                                    <td class="text-end border-success text-success bg-success bg-opacity-10" style="">{{ GlobalHelper::rupiah($total_sppd_pegawai) }}</td>
                                    <td class="text-end border-success text-success bg-success bg-opacity-10" style="">{{ GlobalHelper::rupiah($total_pagu_barang) }}</td>
                                    <td class="text-end border-success text-success bg-success bg-opacity-10" style="">{{ GlobalHelper::rupiah($total_sppd_barang) }}</td>
                                    <td class="text-end border-success text-success bg-success bg-opacity-10" style="">{{ GlobalHelper::rupiah($total_pagu_modal) }}</td>
                                    <td class="text-end border-success text-success bg-success bg-opacity-10" style="">{{ GlobalHelper::rupiah($total_sppd_modal) }}</td>
                                    <td class="text-end border-success text-success bg-success bg-opacity-10" style="">{{ GlobalHelper::rupiah($total_total_pagu) }}</td>
                                    <td class="text-end border-success text-success bg-success bg-opacity-10" style="">{{ GlobalHelper::rupiah($total_total_realisasi) }}</td>
                                    <td class="text-center border-success text-success bg-success bg-opacity-10" style="">{{ GlobalHelper::rupiah($total_persentasi_realisasi) }}</td>
                                 </tr>
                              </tfoot>
                           </table>
                        </div>

                     </div>
                  </div>
               </div>

               <div class="tab-pane fade" id="js-tab4">
                  <div class="row">
                     <div class="col-lg-3">

                        <div class="card rounded-0 border-0 shadow">
                           <div class="card-header d-flex align-items-center py-0">
                              <h6 class="py-2 mb-0 content_title">Chart</h6>
                           </div>
                           <div class="card-body">

                              <!-- Filter -->
                              <div class="sidebar-section-body">
                                 <label class="form-check form-check-reverse text-start mb-2">
                                    <input type="checkbox" class="form-check-input" checked>
                                    <span class="form-check-label">Target</span>
                                 </label>

                                 <label class="form-check form-check-reverse text-start mb-2">
                                    <input type="checkbox" class="form-check-input">
                                    <span class="form-check-label">Realisasi</span>
                                 </label>

                              </div>
                              <!-- /filter -->
                           </div>
                        </div>
                        <div class="card rounded-0 border-0 shadow">
                           <div class="card-header d-flex align-items-center py-0">
                              <h6 class="py-2 mb-0 content_title">Satker</h6>
                           </div>
                           <div class="card-body">

                              <!-- Filter -->
                              <div class="sidebar-section-body">
                                 <label class="form-check form-check-reverse text-start mb-2">
                                    <input type="checkbox" class="form-check-input" checked>
                                    <span class="form-check-label">SETJEN DEN</span>
                                 </label>

                                 <label class="form-check form-check-reverse text-start mb-2">
                                    <input type="checkbox" class="form-check-input">
                                    <span class="form-check-label">BIRO UMUM</span>
                                 </label>
                                 <label class="form-check form-check-reverse text-start mb-2">
                                    <input type="checkbox" class="form-check-input">
                                    <span class="form-check-label">BIRO FKEP</span>
                                 </label>
                                 <label class="form-check form-check-reverse text-start mb-2">
                                    <input type="checkbox" class="form-check-input">
                                    <span class="form-check-label">BIRO FPKPE</span>
                                 </label>

                              </div>
                              <!-- /filter -->
                           </div>
                        </div>
                     </div>
                     <div class="col-lg-9">
                        <div class="card rounded-0 border-0 shadow">

                           <div class="card-body">
                              <div id="chart_realisasi_anggaran_bulanan" class="chart_layout highcharts-light"></div>
                              <div class="table-responsive">
                                 <table class="table table-bordered">
                                    <thead>
                                       <tr class="border-top-success">
                                          <th class="text-center border-success text-success bg-success bg-opacity-10" style="" rowspan="2">JENIS</th>
                                          <th class="text-center border-success text-success bg-success bg-opacity-10" style="" colspan="2">JANUARI</th>
                                          <th class="text-center border-success text-success bg-success bg-opacity-10" style="" colspan="2">FEBRUARI</th>
                                          <th class="text-center border-success text-success bg-success bg-opacity-10" style="" colspan="2">MARET<br></th>
                                          <th class="text-center border-success text-success bg-success bg-opacity-10" style="" colspan="2">APRIL<br></th>
                                          <th class="text-center border-success text-success bg-success bg-opacity-10" style="" colspan="2">MEI</th>
                                          <th class="text-center border-success text-success bg-success bg-opacity-10" style="" colspan="2">JUNI</th>
                                       </tr>
                                       <tr>
                                          <th class="text-center border-success text-success bg-success bg-opacity-10" style="">BULANAN</th>
                                          <th class="text-center border-success text-success bg-success bg-opacity-10" style="">KUMULATIF</th>
                                          <th class="text-center border-success text-success bg-success bg-opacity-10" style="">BULANAN</th>
                                          <th class="text-center border-success text-success bg-success bg-opacity-10" style="">KUMULATIF</th>
                                          <th class="text-center border-success text-success bg-success bg-opacity-10" style="">BULANAN</th>
                                          <th class="text-center border-success text-success bg-success bg-opacity-10" style="">KUMULATIF</th>
                                          <th class="text-center border-success text-success bg-success bg-opacity-10" style="">BULANAN</th>
                                          <th class="text-center border-success text-success bg-success bg-opacity-10" style="">KUMULATIF</th>
                                          <th class="text-center border-success text-success bg-success bg-opacity-10" style="">BULANAN</th>
                                          <th class="text-center border-success text-success bg-success bg-opacity-10" style="">KUMULATIF</th>
                                          <th class="text-center border-success text-success bg-success bg-opacity-10" style="">BULANAN</th>
                                          <th class="text-center border-success text-success bg-success bg-opacity-10" style="">KUMULATIF</th>
                                       </tr>
                                    </thead>
                                    <tbody>
                                       <tr>
                                          <td class="text-left">TARGET</td>
                                          <td class="text-center">100</td>
                                          <td class="text-center">100</td>
                                          <td class="text-center">100</td>
                                          <td class="text-center">100</td>
                                          <td class="text-center">100</td>
                                          <td class="text-center">100</td>
                                          <td class="text-center">100</td>
                                          <td class="text-center">100</td>
                                          <td class="text-center">100</td>
                                          <td class="text-center">100</td>
                                          <td class="text-center">100</td>
                                          <td class="text-center">100</td>
                                       </tr>
                                       <tr>
                                          <td class="text-left">REALISASI</td>
                                          <td class="text-center">100</td>
                                          <td class="text-center">100</td>
                                          <td class="text-center">100</td>
                                          <td class="text-center">100</td>
                                          <td class="text-center">100</td>
                                          <td class="text-center">100</td>
                                          <td class="text-center">100</td>
                                          <td class="text-center">100</td>
                                          <td class="text-center">100</td>
                                          <td class="text-center">100</td>
                                          <td class="text-center">100</td>
                                          <td class="text-center">100</td>
                                       </tr>
                                       <tr>
                                          <td class="text-left">DEVIASI</td>
                                          <td class="text-center">100</td>
                                          <td class="text-center">100</td>
                                          <td class="text-center">100</td>
                                          <td class="text-center">100</td>
                                          <td class="text-center">100</td>
                                          <td class="text-center">100</td>
                                          <td class="text-center">100</td>
                                          <td class="text-center">100</td>
                                          <td class="text-center">100</td>
                                          <td class="text-center">100</td>
                                          <td class="text-center">100</td>
                                          <td class="text-center">100</td>
                                       </tr>
                                    </tbody>
                                 </table>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>


         </div>
      </div>
   </div>
   <script type="text/javascript">
      var datatableindex, chart_pagu, chart_jenis_pagu, chart_realisasi_anggaran, chart_realisasi_kurvas, chart_realisasi_kurvas_bu, chart_realisasi_kurvas_bfk, chart_realisasi_kurvas_bfp, chart_realisasi_anggaran_bulanan;

      function formatCurrency(number) {
         var n = number.split('').reverse().join("");
         var n2 = n.replace(/\d\d\d(?!$)/g, "$&,");
         return "$" + n2.split('').reverse().join('');
      }
      $(document).ready(function() {
         const dpDefaultViewElement = document.querySelector('.datepicker-default-view');

         var dpDefaultView = new Datepicker(dpDefaultViewElement, {
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
         //    $('.datepicker-default-view').Datepicker({
         //       autoclose: true,
         //       format: " yyyy",
         //       viewMode: "years",
         //       minViewMode: "years"
         //   });
         // Change default view


         datatableindex = $('#datatable-dataanggaran').dataTable({
            autoWidth: false,
            responsive: false,
            fixedHeader: {
               header: true,
               footer: true
            },
            ajax: {
               url: baseurl + '/detailrealisasi/listdata',
               type: "POST",
               data: function(d) {
                  d._token = '{{ csrf_token() }}';
                  d.tahun = function() {
                     return $('#data_anggaran_tahun').val();
                  };
                  d.bulan = function() {
                     return $('#data_anggaran_bulan').val();
                  };
               }
            },
            processing: true,
            serverSide: true,
            order: [
               //[0, "desc"]
            ],
            dom: '<"datatable-scroll-wrap">',
            buttons: {
               dom: {
                  button: {
                     className: 'btn btn-light'
                  }
               },
               buttons: [{
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
                  "sClass": "text-left align-top border-success"
               },
               {
                  "bSortable": false,
                  "sClass": "text-end align-top border-success"
               },
               {
                  "bSortable": false,
                  "sClass": "text-end align-top border-success"
               },
               {
                  "bSortable": false,
                  "sClass": "text-center align-top border-success"
               },
               {
                  "bSortable": false,
                  "sClass": "text-end align-top border-success"
               },
               {
                  "bSortable": false,
                  "sClass": "text-end align-top border-success"
               },
               {
                  "bSortable": false,
                  "sClass": "text-end align-top border-success"
               },
               {
                  "bSortable": false,
                  "sClass": "text-center align-top border-success"
               },
               {
                  "bSortable": false,
                  "sClass": "text-center align-top border-success"
               },
               {
                  "bSortable": false,
                  "sClass": "text-end align-top border-success"
               },

               {
                  "bSortable": false,
                  "sClass": "text-end align-top border-success"
               },
            ],
            drawCallback: function(settings) {
               App.initCore();
               var api = this.api();
               var data_api = api.rows({
                  page: 'current'
               }).data();
               var total_index_1 = 0;
               var total_index_2 = 0;
               var total_index_3 = 0;
               var total_index_4 = 0;
               var total_index_5 = 0;
               var total_index_6 = 0;
               var total_index_7 = 0;
               var total_index_8 = 0;
               var total_index_9 = 0;
               var total_index_10 = 0;
               for (let index = 0; index < data_api.length; index++) {
                  total_index_1 += parseInt(data_api[index][1].replace(/\./g, ''));
                  total_index_2 += parseInt(data_api[index][2].replace(/\./g, ''));
                  total_index_3 += parseFloat(data_api[index][3]) / 3;
                  total_index_4 += parseInt(data_api[index][4].replace(/\./g, ''));
                  total_index_5 += parseInt(data_api[index][5].replace(/\./g, ''));
                  total_index_6 += parseInt(data_api[index][6].replace(/\./g, ''));
                  total_index_7 += parseFloat(data_api[index][7]) / 3;
                  total_index_8 += parseFloat(data_api[index][8]) / 3;
                  total_index_9 += parseInt(data_api[index][9].replace(/\./g, ''));
                  total_index_10 += parseInt(data_api[index][10].replace(/\./g, ''));


               }
               $('.total_index_1').html(new Intl.NumberFormat('id-ID').format(total_index_1));
               $('.total_index_2').html(new Intl.NumberFormat('id-ID').format(total_index_2));
               $('.total_index_3').html(new Intl.NumberFormat('id-ID').format(total_index_3.toFixed(2)));
               $('.total_index_4').html(new Intl.NumberFormat('id-ID').format(total_index_4));
               $('.total_index_5').html(new Intl.NumberFormat('id-ID').format(total_index_5));
               $('.total_index_6').html(new Intl.NumberFormat('id-ID').format(total_index_6));
               $('.total_index_7').html(new Intl.NumberFormat('id-ID').format(total_index_7));
               $('.total_index_8').html(new Intl.NumberFormat('id-ID').format(total_index_8));
               $('.total_index_9').html(new Intl.NumberFormat('id-ID').format(total_index_9));
               $('.total_index_10').html(new Intl.NumberFormat('id-ID').format(total_index_10));


            },
            initComplete: function() {
               App.initCore();
            },
         });
         $('#data_anggaran_tahun').on("focusout", function() {
            setTimeout(function() {
               $('#datatable-dataanggaran').DataTable().ajax.reload();
            }, 1000)
         });

         $('#data_anggaran_bulan').change(function() {
            $('#datatable-dataanggaran').DataTable().ajax.reload();
         });
      });

      function get_kurva_s() {
         var work_unit_uuid = '';
         var target_show = 1;
         var realisasi_show = 1;
         $('.filter_target').each(function() {
            if ($(this).is(":checked")) {
               if ($(this).val() == 1) {
                  target_show = 1;
               }
               if ($(this).val() == 2) {
                  realisasi_show = 1;
               }
            } else {
               if ($(this).val() == 1) {
                  target_show = 0;
               }
               if ($(this).val() == 1) {
                  realisasi_show = 0;
               }
            }
         })
         $('.filter_satker').each(function() {
            if ($(this).is(":checked")) {
               work_unit_uuid = $(this).val();
            }
         })

         $.ajax({
            url: baseurl + '/detailrealisasi/get_kurva_s',
            type: "post",
            dataType: 'json',
            data: {
               _token: $('input[name="_token"]').val(),
               work_unit_uuid: work_unit_uuid,
               target_show: target_show,
               realisasi_show: realisasi_show,
            },
            success: function(data) {
               chart_realisasi_kurvas = Highcharts.chart('chart_realisasi_kurvas', {
                  credits: false,
                  colors: ['#32bfea', '#f0924c'],
                  chart: {
                     type: 'spline'
                  },
                  title: {
                     text: data.title
                  },
                  subtitle: {
                     text: data.subtitle
                  },
                  xAxis: {
                     categories: data.categories,
                     accessibility: {
                        description: 'Realisasi Anggaran'
                     }
                  },
                  yAxis: {
                     title: {
                        text: 'Rupiah'
                     },
                     labels: {
                        formatter: function() {
                           return this.value / 1000000000 + 'M';
                        }
                     }
                  },
                  tooltip: {
                     crosshairs: true,
                     shared: true
                  },
                  plotOptions: {
                     spline: {
                        marker: {
                           radius: 4,
                           lineColor: '#666666',
                           lineWidth: 1
                        }
                     }
                  },
                  series: data.series
               });

            }
         });
      }
      $(document).ready(function() {
         $('.filter_target').click(function() {
            get_kurva_s()
         })
         $('.filter_satker').click(function() {

            if ($(this).is(':checked')) {
               $('.filter_satker[value!="' + $(this).val() + '"]').prop('checked', false); // Checks it
               get_kurva_s()
            }
         })
         $('.select').select2({
            dropdownAutoWidth: true,
            width: 'auto'
         });
         get_kurva_s();

      });
   </script>
@endsection
