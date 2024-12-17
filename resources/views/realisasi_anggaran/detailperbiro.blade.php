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
                  <a href="#js-tab1" class="nav-link fw-medium fw-semibold active" data-bs-toggle="tab">SETJEN DEN</a>
               </li>
               <li class="nav-item">
                  <a href="#js-tab2" class="nav-link fw-medium fw-semibold" data-bs-toggle="tab">BIRO UMUM</a>
               </li>
               <li class="nav-item">
                  <a href="#js-tab3" class="nav-link fw-medium fw-semibold" data-bs-toggle="tab">BIRO FKEP</a>
               </li>
               <li class="nav-item">
                  <a href="#js-tab4" class="nav-link fw-medium fw-semibold" data-bs-toggle="tab">BIRO FPKPE</a>
               </li>
            </ul>


            <div class="tab-content">
               <div class="tab-pane show active fade" id="js-tab1">
                  <div class="card rounded-0 border-0 shadow-0">
                     <div class="card-header d-flex align-items-center">
                        <h6 class="mb-0">SETJEN - DEN</h6>
                        <div class="ms-auto">

                           <div class="input-group">
                              <span class="input-group-text">Periode Anggaran</span>
                              <select class="form-control select center" data-placeholder="Bulan" id="per_biro_setjen_bulan" name="per_biro_setjen_bulan" onchange="set_tahun_detailperbiro(this)">
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
                              <input type="text" class="form-control datepicker-default-view text-end" readonly placeholder="Tahun" value="{{ date('Y') }}" style="width: 130px" id="per_biro_setjen_tahun" name="per_biro_setjen_tahun" onchange="set_tahun_detailperbiro(this)">

                           </div>
                        </div>
                     </div>
                     <div class="card-body">
                        <div class="table-responsive">
                           <table class="table table-bordered" id="datatable_per_biro_setjen">
                              <thead>
                                 <tr class="border-top-success">
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="min-width:80px;" rowspan="2">KODE</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="" rowspan="2">URAIAN PROGRAM</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="" rowspan="2">PAGU</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="" colspan="2">REALISASI</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="" rowspan="2">SISA</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="" colspan="2">TARGET</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="" colspan="2">DEVIASI</th>

                                 </tr>
                                 <tr class="">
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="min-width:150px;">Rp</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="min-width:80px;">%</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="min-width:150px;">Rp</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="min-width:80px;">%</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="min-width:150px;">Rp</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="min-width:80px;">%</th>
                                 </tr>
                              </thead>
                              <tbody>
                           </table>

                        </div>
                        <div class="row ">
                           <div class="col-lg-12 py-3 d-flex justify-content-center">
                              <span class="badge bg-light border-start border-width-3 text-body rounded-start-0 border-pink ms-3">Deviasi > -3%</span>
                              <span class="badge bg-light border-start border-width-3 text-body rounded-start-0 border-yellow text-yellow ms-3">Deviasi -1% s/d -3%</span>
                              <span class="badge bg-light border-start border-width-3 text-body rounded-start-0 border-success ms-3">Deviasi < 1%</span>
                                    <span class="badge bg-light border-start border-width-3 text-body rounded-start-0 border-primary ms-3">Melebihi Target</span>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="tab-pane fade" id="js-tab2">
                  <div class="card rounded-0 border-0 shadow-0">
                     <div class="card-header d-flex align-items-center">
                        <h6 class="mb-0">BIRO UMUM</h6>
                        <div class="ms-auto">

                           <div class="input-group">
                              <span class="input-group-text">Periode Anggaran</span>
                              <select class="form-control select center" data-placeholder="Bulan" id="per_biro_umum_bulan" name="per_biro_umum_bulan" onchange="set_tahun_detailperbiro_umum(this)">
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
                              <input type="text" class="form-control datepicker-default-view text-end" readonly placeholder="Tahun" value="{{ date('Y') }}" style="width: 130px" id="per_biro_umum_tahun" name="per_biro_umum_tahun" onchange="set_tahun_detailperbiro_umum(this)">

                           </div>
                        </div>
                     </div>
                     <div class="card-body">
                        <div class="table-responsive">
                           <table class="table table-bordered" id="datatable_per_biro_umum">
                              <thead>
                                 <tr class="border-top-success">
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="min-width:80px;" rowspan="2">KODE</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="" rowspan="2">URAIAN PROGRAM</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="" rowspan="2">PAGU</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="" colspan="2">REALISASI</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="" rowspan="2">SISA</th>

                                 </tr>
                                 <tr class="">
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="min-width:150px;">Rp</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="min-width:80px;">%</th>
                                 </tr>
                              </thead>
                              <tbody>
                           </table>

                        </div>
                     </div>
                  </div>
               </div>
               <div class="tab-pane fade" id="js-tab3">
                  <div class="card rounded-0 border-0 shadow-0">
                     <div class="card-header d-flex align-items-center">
                        <h6 class="mb-0">BIRO FASILITASI KEBIJAKAN ENERGI DAN PERSIDANGAN</h6>
                        <div class="ms-auto">

                           <div class="input-group">
                              <span class="input-group-text">Periode Anggaran</span>
                              <select class="form-control select center" data-placeholder="Bulan" id="per_biro_fkep_bulan" name="per_biro_fkep_bulan" onchange="set_tahun_detailperbiro_fkep(this)">
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
                              <input type="text" class="form-control datepicker-default-view text-end" readonly placeholder="Tahun" value="{{ date('Y') }}" style="width: 130px" id="per_biro_fkep_tahun" name="per_biro_fkep_tahun" onchange="set_tahun_detailperbiro_fkep(this)">

                           </div>
                        </div>
                     </div>
                     <div class="card-body">
                        <div class="table-responsive">
                           <table class="table table-bordered" id="datatable_per_biro_fkep">
                              <thead>
                                 <tr class="border-top-success">
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="min-width:80px;" rowspan="2">KODE</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="" rowspan="2">URAIAN PROGRAM</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="" rowspan="2">PAGU</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="" colspan="2">REALISASI</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="" rowspan="2">SISA</th>

                                 </tr>
                                 <tr class="">
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="min-width:150px;">Rp</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="min-width:80px;">%</th>
                                 </tr>
                              </thead>
                              <tbody>
                           </table>

                        </div>
                     </div>
                  </div>
               </div>
               <div class="tab-pane fade" id="js-tab4">
                  <div class="card rounded-0 border-0 shadow-0">
                     <div class="card-header d-flex align-items-center">
                        <h6 class="mb-0">BIRO FASILITASI PENANGGULANGAN KRISIS DAN PENGAWASAN ENERGI</h6>
                        <div class="ms-auto">

                           <div class="input-group">
                              <span class="input-group-text">Periode Anggaran</span>
                              <select class="form-control select center" data-placeholder="Bulan" id="per_biro_fpkpe_bulan" name="per_biro_fpkpe_bulan" onchange="set_tahun_detailperbiro_fpkpe(this)">
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
                              <input type="text" class="form-control datepicker-default-view text-end" readonly placeholder="Tahun" value="{{ date('Y') }}" style="width: 130px" id="per_biro_fpkpe_tahun" name="per_biro_fpkpe_tahun" onchange="set_tahun_detailperbiro_fpkpe(this)">

                           </div>
                        </div>
                     </div>
                     <div class="card-body">
                        <div class="table-responsive">
                           <table class="table table-bordered" id="datatable_per_biro_fpkpe">
                              <thead>
                                 <tr class="border-top-success">
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="min-width:80px;" rowspan="2">KODE</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="" rowspan="2">URAIAN PROGRAM</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="" rowspan="2">PAGU</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="" colspan="2">REALISASI</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="" rowspan="2">SISA</th>

                                 </tr>
                                 <tr class="">
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="min-width:150px;">Rp</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10 align-middle" style="min-width:80px;">%</th>
                                 </tr>
                              </thead>
                              <tbody>
                           </table>

                        </div>
                     </div>
                  </div>
               </div>
               <div class="tab-pane fade " id="js-tab12">
                  <div class="card rounded-0 border-0 shadow">

                     <div class="card-body">

                        <div class="table-responsive">
                           <table class="table table-bordered table_border_hijau" id="datatable-index">

                              <thead>
                                 <tr class="border-top-success">
                                    <th class="text-center border-success text-success bg-success bg-opacity-10" style="width:100px;">KODE</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10" style="">URAIAN PROGRAM</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10" style="width:180px;">PAGU</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10" style="width:180px;">REALISASI</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10" style="width:80px;">%</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10" style="width:180px;">SISA</th>
                                 </tr>
                              </thead>
                              <tbody>
                                 {{-- <tr>
                                    <td class="text-center">020.07.11</td>
                                    <td class="text-left">Program Dukungan</td>
                                    <td class="text-end">56.859.949.000</td>
                                    <td class="text-end">28.021.119.074</td>
                                    <td class="text-center">49.27</td>
                                    <td class="text-end">28.838.829.926</td>
                                 </tr>
                                 <tr>
                                    <td class="text-center">020.07.11</td>
                                    <td class="text-left">Program Dukungan</td>
                                    <td class="text-end">56.859.949.000</td>
                                    <td class="text-end">28.021.119.074</td>
                                    <td class="text-center">49.27</td>
                                    <td class="text-end">28.838.829.926</td>
                                 </tr>
                                 <tr>
                                    <td class="text-center">020.07.11</td>
                                    <td class="text-left">Program Dukungan</td>
                                    <td class="text-end">56.859.949.000</td>
                                    <td class="text-end">28.021.119.074</td>
                                    <td class="text-center">49.27</td>
                                    <td class="text-end">28.838.829.926</td>
                                 </tr>
                                 <tr>
                                    <td class="text-center">020.07.11</td>
                                    <td class="text-left">Program Dukungan</td>
                                    <td class="text-end">56.859.949.000</td>
                                    <td class="text-end">28.021.119.074</td>
                                    <td class="text-center">49.27</td>
                                    <td class="text-end">28.838.829.926</td>
                                 </tr> --}}
                              </tbody>
                           </table>
                        </div>

                     </div>
                  </div>
               </div>
               <div class="tab-pane fade" id="js-tab2xx">
                  <div class="card rounded-0 border-0 shadow">

                     <div class="card-body">
                        <table class="table table-bordered table_border_hijau" id="datatable-index-2">

                           <table class="table table-bordered">
                              <thead>
                                 <tr class="border-top-success">
                                    <th class="text-center border-success text-success bg-success bg-opacity-10" style="width:100px;">KODE</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10" style="">URAIAN PROGRAM</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10" style="width:180px;">PAGU</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10" style="width:180px;">REALISASI</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10" style="width:80px;">%</th>
                                    <th class="text-center border-success text-success bg-success bg-opacity-10" style="width:180px;">SISA</th>
                                 </tr>
                              </thead>
                              {{-- <tbody>
                                 <tr>
                                    <td class="text-center">020.07.11</td>
                                    <td class="text-left">Program Dukungan</td>
                                    <td class="text-end">56.859.949.000</td>
                                    <td class="text-end">28.021.119.074</td>
                                    <td class="text-center">49.27</td>
                                    <td class="text-end">28.838.829.926</td>
                                 </tr>
                                 <tr>
                                    <td class="text-center">020.07.11</td>
                                    <td class="text-left">Program Dukungan</td>
                                    <td class="text-end">56.859.949.000</td>
                                    <td class="text-end">28.021.119.074</td>
                                    <td class="text-center">49.27</td>
                                    <td class="text-end">28.838.829.926</td>
                                 </tr>
                                 <tr>
                                    <td class="text-center">020.07.11</td>
                                    <td class="text-left">Program Dukungan</td>
                                    <td class="text-end">56.859.949.000</td>
                                    <td class="text-end">28.021.119.074</td>
                                    <td class="text-center">49.27</td>
                                    <td class="text-end">28.838.829.926</td>
                                 </tr>
                                 <tr>
                                    <td class="text-center">020.07.11</td>
                                    <td class="text-left">Program Dukungan</td>
                                    <td class="text-end">56.859.949.000</td>
                                    <td class="text-end">28.021.119.074</td>
                                    <td class="text-center">49.27</td>
                                    <td class="text-end">28.838.829.926</td>
                                 </tr>
                              </tbody> --}}
                           </table>
                     </div>

                  </div>
               </div>
            </div>
            <div class="tab-pane fade" id="js-tab3xxxx">
               <div class="card rounded-0 border-0 shadow">

                  <div class="card-body">

                     <div class="table-responsive">
                        <table class="table table-bordered">
                           <thead>
                              <tr class="">
                                 <th class="text-center border-success text-success bg-success bg-opacity-10" style="width:100px;">KODE</th>
                                 <th class="text-center border-success text-success bg-success bg-opacity-10" style="">URAIAN PROGRAM</th>
                                 <th class="text-center border-success text-success bg-success bg-opacity-10" style="width:180px;">PAGU</th>
                                 <th class="text-center border-success text-success bg-success bg-opacity-10" style="width:180px;">REALISASI</th>
                                 <th class="text-center border-success text-success bg-success bg-opacity-10" style="width:80px;">%</th>
                                 <th class="text-center border-success text-success bg-success bg-opacity-10" style="width:180px;">SISA</th>
                              </tr>
                           </thead>
                           <tbody>
                              <tr>
                                 <td class="text-center">020.07.11</td>
                                 <td class="text-left">Program Dukungan</td>
                                 <td class="text-end">56.859.949.000</td>
                                 <td class="text-end">28.021.119.074</td>
                                 <td class="text-center">49.27</td>
                                 <td class="text-end">28.838.829.926</td>
                              </tr>
                              <tr>
                                 <td class="text-center">020.07.11</td>
                                 <td class="text-left">Program Dukungan</td>
                                 <td class="text-end">56.859.949.000</td>
                                 <td class="text-end">28.021.119.074</td>
                                 <td class="text-center">49.27</td>
                                 <td class="text-end">28.838.829.926</td>
                              </tr>
                              <tr>
                                 <td class="text-center">020.07.11</td>
                                 <td class="text-left">Program Dukungan</td>
                                 <td class="text-end">56.859.949.000</td>
                                 <td class="text-end">28.021.119.074</td>
                                 <td class="text-center">49.27</td>
                                 <td class="text-end">28.838.829.926</td>
                              </tr>
                              <tr>
                                 <td class="text-center">020.07.11</td>
                                 <td class="text-left">Program Dukungan</td>
                                 <td class="text-end">56.859.949.000</td>
                                 <td class="text-end">28.021.119.074</td>
                                 <td class="text-center">49.27</td>
                                 <td class="text-end">28.838.829.926</td>
                              </tr>
                           </tbody>
                        </table>
                     </div>

                  </div>
               </div>
            </div>
            <div class="tab-pane fade" id="js-tab4xxxx">
               <div class="card rounded-0 border-0 shadow">

                  <div class="card-body">

                     <div class="table-responsive">
                        <table class="table table-bordered">
                           <thead>
                              <tr class="border-top-success">
                                 <th class="text-center border-success text-success bg-success bg-opacity-10" style="width:100px;">KODE</th>
                                 <th class="text-center border-success text-success bg-success bg-opacity-10" style="">URAIAN PROGRAM</th>
                                 <th class="text-center border-success text-success bg-success bg-opacity-10" style="width:180px;">PAGU</th>
                                 <th class="text-center border-success text-success bg-success bg-opacity-10" style="width:180px;">REALISASI</th>
                                 <th class="text-center border-success text-success bg-success bg-opacity-10" style="width:80px;">%</th>
                                 <th class="text-center border-success text-success bg-success bg-opacity-10" style="width:180px;">SISA</th>
                              </tr>
                           </thead>
                           <tbody>
                              <tr>
                                 <td class="text-center">020.07.11</td>
                                 <td class="text-left">Program Dukungan</td>
                                 <td class="text-end">56.859.949.000</td>
                                 <td class="text-end">28.021.119.074</td>
                                 <td class="text-center">49.27</td>
                                 <td class="text-end">28.838.829.926</td>
                              </tr>
                              <tr>
                                 <td class="text-center">020.07.11</td>
                                 <td class="text-left">Program Dukungan</td>
                                 <td class="text-end">56.859.949.000</td>
                                 <td class="text-end">28.021.119.074</td>
                                 <td class="text-center">49.27</td>
                                 <td class="text-end">28.838.829.926</td>
                              </tr>
                              <tr>
                                 <td class="text-center">020.07.11</td>
                                 <td class="text-left">Program Dukungan</td>
                                 <td class="text-end">56.859.949.000</td>
                                 <td class="text-end">28.021.119.074</td>
                                 <td class="text-center">49.27</td>
                                 <td class="text-end">28.838.829.926</td>
                              </tr>
                              <tr>
                                 <td class="text-center">020.07.11</td>
                                 <td class="text-left">Program Dukungan</td>
                                 <td class="text-end">56.859.949.000</td>
                                 <td class="text-end">28.021.119.074</td>
                                 <td class="text-center">49.27</td>
                                 <td class="text-end">28.838.829.926</td>
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
   <script type="text/javascript">
      var datatableindex, datatable_per_biro_umum, datatable_per_biro_fkep, datatable_per_biro_fpkpe, chart_pagu, chart_jenis_pagu, chart_realisasi_anggaran, chart_realisasi_kurvas, chart_realisasi_kurvas_bu, chart_realisasi_kurvas_bfk, chart_realisasi_kurvas_bfp, chart_realisasi_anggaran_bulanan;

      function set_tahun_detailperbiro(ini) {
         $('#datatable_per_biro_setjen').DataTable().ajax.reload();
      }
      function set_tahun_detailperbiro_umum(ini) {
         $('#datatable_per_biro_umum').DataTable().ajax.reload();
      }
      function set_tahun_detailperbiro_fkep(ini) {
         $('#datatable_per_biro_fkep').DataTable().ajax.reload();
      }
      function set_tahun_detailperbiro_fpkpe(ini) {
         $('#datatable_per_biro_fpkpe').DataTable().ajax.reload();
      }
      
      $(document).ready(function() {
         $('.select').select2({
            dropdownAutoWidth: true,
            width: 'auto'
         });
         datatable_per_biro_fpkpe = $('#datatable_per_biro_fpkpe').dataTable({
            autoWidth: false,
            responsive: false,
            fixedHeader: {
               header: true,
               footer: true
            },
            ajax: {
               url: baseurl + '/realisasianggaran/listdata_detail_per_biro',
               type: "POST",
               data: function(d) {
                  d._token = '{{ csrf_token() }}';
                  d.tahun = function() {
                     return $('#per_biro_fpkpe_tahun').val();
                  };
                  d.bulan = function() {
                     return $('#per_biro_fpkpe_bulan').val();
                  };
                  d.jenis = function() {
                     return 3;
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
                  "sClass": "text-center align-top border-success"
               },
               {
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
            ],
            "createdRow": function(row, data, dataIndex) {
               // console.log(data)
               // Check if the status is 1
               if (data[6] == 2) {
                  $(row).css('background-color', '#ffc966'); // Set background color




                  $(row).css('font-weight', 'bold');
               } else if (data[6] == 3) {
                  $(row).css('background-color', '#ffecc9'); // Set background color
                  $(row).css('font-weight', 'bold');
               } else if (data[6] == 4) {
                  if (/^[a-zA-Z]+$/.test(data[0])) {
                     $(row).css('background-color', '#e8e8e8'); // Set background color
                     $(row).css('font-weight', 'bold');
                  } else {
                  }
               
               }

            },
            "fnRowCallback": function(nRow, aData, iDisplayIndex, iDisplayIndexFull) {


            },
            drawCallback: function(settings) {


            },
            initComplete: function() {
               App.initCore();
            },
         });
         datatable_per_biro_fkep = $('#datatable_per_biro_fkep').dataTable({
            autoWidth: false,
            responsive: false,
            fixedHeader: {
               header: true,
               footer: true
            },
            ajax: {
               url: baseurl + '/realisasianggaran/listdata_detail_per_biro',
               type: "POST",
               data: function(d) {
                  d._token = '{{ csrf_token() }}';
                  d.tahun = function() {
                     return $('#per_biro_fkep_tahun').val();
                  };
                  d.bulan = function() {
                     return $('#per_biro_fkep_bulan').val();
                  };
                  d.jenis = function() {
                     return 2;
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
                  "sClass": "text-center align-top border-success"
               },
               {
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
            ],
            "createdRow": function(row, data, dataIndex) {
               // console.log(data)
               // Check if the status is 1
               if (data[6] == 2) {
                  $(row).css('background-color', '#ffc966'); // Set background color




                  $(row).css('font-weight', 'bold');
               } else if (data[6] == 3) {
                  $(row).css('background-color', '#ffecc9'); // Set background color
                  $(row).css('font-weight', 'bold');
               } else if (data[6] == 4) {
                  if (/^[a-zA-Z]+$/.test(data[0])) {
                     $(row).css('background-color', '#e8e8e8'); // Set background color
                     $(row).css('font-weight', 'bold');
                  } else {
                  }
               
               }

            },
            "fnRowCallback": function(nRow, aData, iDisplayIndex, iDisplayIndexFull) {


            },
            drawCallback: function(settings) {


            },
            initComplete: function() {
               App.initCore();
            },
         });
         datatable_per_biro_umum = $('#datatable_per_biro_umum').dataTable({
            autoWidth: false,
            responsive: false,
            fixedHeader: {
               header: true,
               footer: true
            },
            ajax: {
               url: baseurl + '/realisasianggaran/listdata_detail_per_biro',
               type: "POST",
               data: function(d) {
                  d._token = '{{ csrf_token() }}';
                  d.tahun = function() {
                     return $('#per_biro_umum_tahun').val();
                  };
                  d.bulan = function() {
                     return $('#per_biro_umum_bulan').val();
                  };
                  d.jenis = function() {
                     return 1;
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
                  "sClass": "text-center align-top border-success"
               },
               {
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
            ],
            "createdRow": function(row, data, dataIndex) {
               console.log(data)
               // Check if the status is 1
               if (data[6] == 2) {
                  $(row).css('background-color', '#ffc966'); // Set background color




                  $(row).css('font-weight', 'bold');
               } else if (data[6] == 3) {
                  $(row).css('background-color', '#ffecc9'); // Set background color
                  $(row).css('font-weight', 'bold');
               } else if (data[6] == 4) {
                  if (/^[a-zA-Z]+$/.test(data[0])) {
                     $(row).css('background-color', '#e8e8e8'); // Set background color
                     $(row).css('font-weight', 'bold');
                  } else {
                  }
               
               }

            },
            "fnRowCallback": function(nRow, aData, iDisplayIndex, iDisplayIndexFull) {


            },
            drawCallback: function(settings) {


            },
            initComplete: function() {
               App.initCore();
            },
         });
         datatableindex = $('#datatable_per_biro_setjen').dataTable({
            autoWidth: false,
            responsive: false,
            fixedHeader: {
               header: true,
               footer: true
            },
            ajax: {
               url: baseurl + '/realisasianggaran/listdata_detail_per_biro_setjen',
               type: "POST",
               data: function(d) {
                  d._token = '{{ csrf_token() }}';
                  d.tahun = function() {
                     return $('#per_biro_setjen_tahun').val();
                  };
                  d.bulan = function() {
                     return $('#per_biro_setjen_bulan').val();
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
            aoColumns: [
               {
                  "bSortable": false,
                  "sClass": "text-center align-top border-success"
               },
               {
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
                  "sClass": "text-center align-top border-success"
               },
               {
                  "bSortable": false,
                  "sClass": "text-end align-top border-success"
               },
               {
                  "bSortable": false,
                  "sClass": "text-center align-top border-success"
               },
            ],
            "createdRow": function(row, data, dataIndex) {
               // console.log(data)
               // Check if the status is 1
               if (data[18] == 0) {
                  $(row).css('background-color', '#e8e8e8'); // Set background color
                  $(row).css('font-weight', 'bold');
               } else if (data[18] == 1) {
                  $(row).css('background-color', '#ffc966'); // Set background color
                  $(row).css('font-weight', 'bold');
               } else if (data[18] == 2) {
                  $(row).css('background-color', '#ffecc9'); // Set background color
                  $(row).css('font-weight', 'bold');
               }

               if (parseFloat(data[19]) >= -3 && parseFloat(data[19]) < 1) {
                  $('td', row).eq(9).attr('style', 'background-color: #fab5c8 !important');
               } else if (parseFloat(data[19]) >= -1 && parseFloat(data[19]) < 3) {
                  $('td', row).eq(9).attr('style', 'background-color: #ffe897 !important;');
               } else if (parseFloat(data[19]) < 1) {
                  $('td', row).eq(9).attr('style', 'background-color: #89cdb8 !important');
               } else {
                  $('td', row).eq(9).attr('style', 'background-color: #7ebdff !important;');
               }
               // fab5c8


            },
            "fnRowCallback": function(nRow, aData, iDisplayIndex, iDisplayIndexFull) {


            },
            drawCallback: function(settings) {


            },
            initComplete: function() {
               App.initCore();
            },
         });
         // $('#data_anggaran_bulan').change(function() {
         //    $('#datatable-dataanggaran').DataTable().ajax.reload();
         // });
      });
   </script>
@endsection
