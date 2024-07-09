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
                        <select class="form-control select" data-placeholder="Tahun Anggaran" id="dashboard_realisasi_year" name="dashboard_realisasi_year" onchange="set_tahun(this)">
                           <option></option>
                           @for ($i = date('Y') - 3; $i <= date('Y'); $i++)
                              <option value="{{ $i }}" {{ $i == date('Y') ? 'selected' : '' }}>{{ $i }}</option>
                           @endfor
                        </select>
                     </div>
                  </div>
                  <div class="mb-3 row">
                     <label class="col-form-label col-lg-4">Periode Revisi</label>
                     <div class="col-lg-8">
                        <select class="form-control select" data-placeholder="Periode Revisi" id="dashboard_realisasi_uuid" name="dashboard_realisasi_uuid" onchange="reload_dashboard()">
                           <option></option>
                        </select>
                     </div>
                  </div>
                  <div class="mb-3 row">
                     <div class="col-lg-12">
                        <div id="chart_pagu" class="chart_layout highcharts-light"></div>
                     </div>
                     {{-- <div class="col-lg-12">
                        <div id="chart_jenis_pagu" class="chart_layout highcharts-light"></div>
                     </div> --}}


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

      function set_tahun(ini) {
         get_periode_revisi();
      }

      function reload_dashboard() {
         set_dashboard_rupiah_murni();
         set_realisasi_anggaran();
      }

      function get_periode_revisi() {
         $.ajax({
            url: baseurl + '/realisasianggaran/get_periode_revisi',
            type: "post",
            dataType: 'json',

            data: {
               _token: '{{ csrf_token() }}',
               dashboard_realisasi_year: $('#dashboard_realisasi_year').val(),
               dashboard_realisasi_version: $('#dashboard_realisasi_version').val(),
            },
            success: function(data) {
               var NewHtml = '<option></option>';
               for (var i = 0; i < data.length; i++) {

                  NewHtml += '<option value="' + data[i].dashboard_realisasi_uuid + '" ' + (((data.length - 1) == i) ? 'selected' : '') + '>' + data[i].jenis_revisi + '</option>';
               }
               $('#dashboard_realisasi_uuid').select2('destroy');
               $('#dashboard_realisasi_uuid').html(NewHtml);
               $('#dashboard_realisasi_uuid').select2({
                  dropdownAutoWidth: true,
                  width: '100%'
               });
               $('#dashboard_realisasi_uuid').change();

            }
         });
      }


      function set_dashboard_rupiah_murni() {
         $.ajax({
            url: baseurl + '/realisasianggaran/set_dashboard_rupiah_murni',
            type: "post",
            dataType: 'json',

            data: {
               _token: '{{ csrf_token() }}',
               dashboard_realisasi_uuid: $('#dashboard_realisasi_uuid').val(),
            },
            success: function(data) {

               var dashboard_realisasi_total_belanja = parseFloat((parseFloat(data.dashboard_realisasi_total_belanja) / 1000000000.0).toFixed(2))
               chart_pagu = Highcharts.chart('chart_pagu', {
                  credits: false,
                  chart: {
                     type: 'pie',
                     backgroundColor: 'rgba(0,0,0,0)'
                  },
                  title: {
                     text: 'Rupiah Murni',
                     align: 'center'
                  },
                  subtitle: {
                     useHTML: true,
                     text: 'Rp. '+dashboard_realisasi_total_belanja+' M',
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
                        y: parseFloat((parseFloat(data.dashboard_realisasi_barang) / 1000000000.0).toFixed(2))
                     }, {
                        name: 'Belanja Pegawai',
                        y: parseFloat((parseFloat(data.dashboard_realisasi_pegawai) / 1000000000.0).toFixed(2))
                     }, {
                        name: 'Belanja Modal',
                        y: parseFloat((parseFloat(data.dashboard_realisasi_modal) / 1000000000.0).toFixed(2))
                     }]
                  }]
               });


            }
         });
      }
      function set_realisasi_anggaran() {
         $.ajax({
            url: baseurl + '/realisasianggaran/set_realisasi_anggaran',
            type: "post",
            dataType: 'json',

            data: {
               _token: '{{ csrf_token() }}',
               dashboard_realisasi_year: $('#dashboard_realisasi_year').val(),
            },
            success: function(data) {
               console.log(data);

            }
         });
      }
      $(document).ready(function() {
         $('.select').select2();
         get_periode_revisi();

         // chart_jenis_pagu = Highcharts.chart('chart_jenis_pagu', {
         //    credits: false,
         //    chart: {
         //       type: 'pie',
         //       backgroundColor: 'rgba(0,0,0,0)'
         //    },
         //    title: {
         //       text: 'PNBP',
         //       align: 'center'
         //    },
         //    subtitle: {
         //       useHTML: true,
         //       text: 'Rp. 56,58 M',
         //       floating: true,
         //       verticalAlign: 'middle',
         //       style: {
         //          fontWeight: 'bold',
         //          fontSize: '1rem'
         //       },
         //       y: 30
         //    },

         //    legend: {
         //       enabled: false
         //    },

         //    tooltip: {
         //       valueDecimals: 2,
         //       valueSuffix: ' M'
         //    },

         //    plotOptions: {
         //       showInLegend: true,
         //       pie: {
         //          allowPointSelect: true,
         //          cursor: 'pointer',
         //          dataLabels: {
         //             enabled: true
         //          },
         //          showInLegend: true
         //       },
         //       series: {
         //          borderWidth: 0,
         //          colorByPoint: true,
         //          type: 'pie',
         //          size: '100%',
         //          innerSize: '70%',
         //          dataLabels: {
         //             enabled: true,
         //             crop: false,
         //             distance: '-10%',
         //             style: {
         //                fontSize: '1rem'
         //             },
         //             connectorWidth: 1
         //          },
         //       },
         //    },
         //    colors: ['#FCE700', '#F8C4B4', '#f6e1ea', '#B8E8FC', '#BCE29E'],
         //    legend: {},
         //    series: [{
         //       type: 'pie',
         //       name: 'Jenis Belanja',
         //       data: [{
         //          name: 'Belanja Barang',
         //          y: 30,
         //          // sliced: true,
         //          // selected: true
         //       }, {
         //          name: 'Belanja Pegawai',
         //          y: 30
         //       }, {
         //          name: 'Belanja Modal',
         //          y: 40
         //       }]
         //    }]
         // });
         chart_realisasi_anggaran = Highcharts.chart('chart_realisasi_anggaran', {
            credits: false,
            chart: {
               type: 'column'
            },
            title: {
               text: 'Realisasi Anggaran'
            },
            subtitle: {
               text: 'Status realisasi per tanggal {{ date('d F Y') }}'
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
                  text: 'Rupiah (Rp)'
               }
            },
            tooltip: {
               headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
               pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                  '<td style="padding:0"><b>{point.y:.1f} M</b></td></tr>',
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
