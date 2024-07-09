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
         <div class="col-lg-5">

            <div class="card rounded-0 border-0 shadow">
               <div class="card-header d-flex align-items-center py-0">
                  <h6 class="py-2 mb-0 content_title">Total Pagu</h6>
               </div>

               <div class="card-body">
                  <div class="mb-3 row">
                     <label class="col-form-label col-lg-4">Tahun Anggaran</label>
                     <div class="col-lg-8">
                        <select class="form-control select" data-placeholder="Tahun Anggaran">
                           <option></option>
                           @for ($i = 2020; $i <= 2023; $i++)
                              <option value="{{ $i }}" {{ $i == 2023 ? 'selected' : '' }}>{{ $i }}</option>
                           @endfor
                        </select>
                     </div>
                  </div>
                  <div class="mb-3 row">
                     <label class="col-form-label col-lg-4">Periode Revisi</label>
                     <div class="col-lg-8">
                        <select class="form-control select" data-placeholder="Periode Revisi">
                           <option></option>
                        </select>
                     </div>
                  </div>
                  <div class="mb-3 row">
                     <div class="col-lg-12">
                        <div id="chart_pagu" class="chart_layout highcharts-light"></div>
                     </div>
                     <div class="col-lg-12">
                        <div id="chart_jenis_pagu" class="chart_layout highcharts-light"></div>
                     </div>


                  </div>
               </div>
            </div>

         </div>

         <div class="col-lg-7">
            <div class="card rounded-0 border-0 shadow">
               <div class="card-header d-flex align-items-center py-0">
                  <h6 class="py-2 mb-0 content_title">Realisasi Anggaran</h6>
               </div>

               <div class="card-body">
                  <div id="chart_realisasi_anggaran" class="chart_layout highcharts-light"></div>
               </div>
            </div>
         </div>
      </div>
   </div>
   <script type="text/javascript">
      var datatableindex, chart_pagu, chart_jenis_pagu, chart_realisasi_anggaran;

      $(document).ready(function() {
         $('.select').select2();
         chart_pagu = Highcharts.chart('chart_pagu', {
            credits: false,
            chart: {
               type: 'pie',
               backgroundColor: 'rgba(0,0,0,0)'
            },
            title: {
               text: '<span class=""><h6>Rupiah Murni</h6></span>',
               useHtml: true,
               align: 'center'
            },
            subtitle: {
               useHTML: true,
               text: 'Rp. 56,58 M',
               floating: true,
               verticalAlign: 'middle',
               style: {
                  fontSize: '1rem'
               },
               y: 30
            },

            legend: {
               enabled: false
            },

            tooltip: {
               valueDecimals: 2,
               valueSuffix: ' M'
            },

            plotOptions: {
               series: {
                  borderWidth: 0,
                  colorByPoint: true,
                  type: 'pie',
                  size: '100%',
                  innerSize: '70%',
                  dataLabels: {
                     enabled: true,
                     crop: false,
                     distance: '-10%',
                     style: {
                        fontSize: '1rem'
                     },
                     connectorWidth: 1
                  }
               }
            },
            colors: ['#FCE700', '#F8C4B4', '#f6e1ea', '#B8E8FC', '#BCE29E'],
            series: [{
               type: 'pie',
               name: 'Pagu Anggaran',
               data: [{
                  name: 'Rp.30M',
                  y: 30,
                  // sliced: true,
                  // selected: true
               }, {
                  name: 'Rp.30M',
                  y: 30
               }, {
                  name: 'Rp.40M',
                  y: 40
               }]
            }]
         });

         chart_jenis_pagu = Highcharts.chart('chart_jenis_pagu', {
            credits: false,
            chart: {
               type: 'pie',
               backgroundColor: 'rgba(0,0,0,0)'
            },
            title: {
               text: 'PNBP',
               align: 'center'
            },
            subtitle: {
               useHTML: true,
               text: 'Rp. 56,58 M',
               floating: true,
               verticalAlign: 'middle',
               style: {
                  fontWeight: 'bold',
                  fontSize: '1rem'
               },
               y: 30
            },

            legend: {
               enabled: false
            },

            tooltip: {
               valueDecimals: 2,
               valueSuffix: ' M'
            },

            plotOptions: {
               showInLegend: true,
               pie: {
                  allowPointSelect: true,
                  cursor: 'pointer',
                  dataLabels: {
                     enabled: true
                  },
                  showInLegend: true
               },
               series: {
                  borderWidth: 0,
                  colorByPoint: true,
                  type: 'pie',
                  size: '100%',
                  innerSize: '70%',
                  dataLabels: {
                     enabled: true,
                     crop: false,
                     distance: '-10%',
                     style: {
                        fontSize: '1rem'
                     },
                     connectorWidth: 1
                  },
               },
            },
            colors: ['#FCE700', '#F8C4B4', '#f6e1ea', '#B8E8FC', '#BCE29E'],
            legend: {},
            series: [{
               type: 'pie',
               name: 'Jenis Belanja',
               data: [{
                  name: 'Belanja Barang',
                  y: 30,
                  // sliced: true,
                  // selected: true
               }, {
                  name: 'Belanja Pegawai',
                  y: 30
               }, {
                  name: 'Belanja Modal',
                  y: 40
               }]
            }]
         });
         chart_realisasi_anggaran = Highcharts.chart('chart_realisasi_anggaran', {
            chart: {
               type: 'column'
            },
            title: {
               text: 'Realisasi Anggaran'
            },
            xAxis: {
               categories: [
                  'BIRO UMUM',
                  'BIRO FKEP',
                  'BIRO FPKPE',
                  'PNBP'
               ],
               crosshair: true
            },
            yAxis: {
               min: 0,
               title: {
                  text: 'Rainfall (mm)'
               }
            },
            tooltip: {
               headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
               pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                  '<td style="padding:0"><b>{point.y:.1f} mm</b></td></tr>',
               footerFormat: '</table>',
               shared: true,
               useHTML: true
            },
            plotOptions: {
               column: {
                  pointPadding: 0.2,
                  borderWidth: 0
               },
               showInLegend: true
            },
            series: [{
               name: 'PAGU',
               data: [49.9, 71.5, 106.4, 129.2]

            }, {
               name: 'REALISASI',
               data: [83.6, 78.8, 98.5, 93.4]

            }]
         });
      });
   </script>
@endsection
