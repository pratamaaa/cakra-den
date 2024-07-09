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
                  <div class="mb-3 row">
                     <label class="col-form-label col-lg-4">Tahun Anggaran</label>
                     <div class="col-lg-8">
                        <select class="form-control select" data-placeholder="Tahun Anggaran" id="dashboard_realisasi_year_realisasi" name="dashboard_realisasi_year_realisasi" onchange="set_tahun_realisasi(this)">
                           <option></option>
                           @for ($i = date('Y') - 3; $i <= date('Y'); $i++)
                              <option value="{{ $i }}" {{ $i == date('Y') ? 'selected' : '' }}>{{ $i }}</option>
                           @endfor
                        </select>
                     </div>
                  </div>

                  <div id="chart_realisasi_anggaran" class="chart_layout highcharts-light"></div>
                  <hr>
                  <div id="chart_realisasi_kurvas" class="chart_layout highcharts-light"></div>

               </div>
            </div>
         </div>
      </div>
   </div>
   <script type="text/javascript">
      var datatableindex, chart_pagu, chart_jenis_pagu, chart_realisasi_anggaran;

      function set_tahun_realisasi(ini) {
         // get_periode_revisi();
         get_kurva_s();

      }

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

      function get_kurva_s() {
         var work_unit_uuid = '';
         var target_show = 1;
         var realisasi_show = 1;

         var dashboard_realisasi_year_realisasi = $('#dashboard_realisasi_year_realisasi').val();
         $.ajax({
            url: baseurl + '/realisasianggaran/get_kurva_s',
            type: "post",
            dataType: 'json',
            data: {
               _token: '{{ csrf_token() }}',
               work_unit_uuid: '261b36ee-5a41-11ee-971e-f4a4757ae8c3',
               target_show: 1,
               realisasi_show: 1,
               tahun: dashboard_realisasi_year_realisasi
            },
            success: function(data) {
               var categories_plafon_realisasi = data.categories_plafon_realisasi;
               console.log(data);
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
                        // format: '{value:%b %e}'
                     },
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
                     categories: categories_plafon_realisasi,
                     crosshair: true,
                     labels: {
                        format: '{value:%b %e}'
                     },
                  },
                  yAxis: {
                     min: 0,
                     title: {
                        text: 'Rupiah (Rp)'
                     },
                     labels: {
                        format: '{value:%b %e}'
                     },
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
                  series: data.series_plafon_realisasi
                  // [{
                  //    name: 'PAGU',
                  //    data: [49.9, 71.5, 106.4]

                  // }, {
                  //    name: 'REALISASI',
                  //    data: [83.6, 78.8, 98.5]

                  // }]
               });
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
               var colors = ['#FF530D', '#E82C0C', '#FF0000', '#E80C7A', '#E80C7A'];
               var dashboard_realisasi_total_belanja = parseFloat((parseFloat(data.dashboard_realisasi_total_belanja) / 1000000000.0).toFixed(2))


               chart_pagu = Highcharts.chart('chart_pagu', {
                  credits: false,
                  chart: {
                     plotBackgroundColor: null,
                     plotBorderWidth: null,
                     plotShadow: false,
                     type: 'pie'
                  },
                  title: {
                     margin: 50,
                     useHTML: true,
                     text: '<span class="mb-3">Rupiah Murni</span>',
                     align: 'center'
                  },
                  subtitle: {
                     useHTML: true,
                     text: 'Rp. ' + dashboard_realisasi_total_belanja + ' M',
                     floating: true,
                     verticalAlign: 'middle',
                     style: {
                        fontWeight: 'bold',
                        fontSize: '1rem'
                     },
                     y: 30
                  },
                  tooltip: {
                     valueDecimals: 2,
                     valueSuffix: ' M',
                     style: {
                        fontWeight: 'bold',
                        fontSize: '0.8rem'
                     },
                     headerFormat: '<span>{series.name}</span><br>',
                     pointFormat: '{point.name}: <b>{point.y:.2f} M</b> ({point.percentage:.2f}%)'
                  },
                  accessibility: {
                     point: {
                        valueSuffix: '%'
                     }
                  },
                  plotOptions: {
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
                           connectorWidth: 1
                        },
                     },
                  },
                  series: [{
                     name: 'Jenis Belanja',
                     colorByPoint: true,
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

               // chart_pagu = Highcharts.chart('chart_pagu', {
               //    credits: false,
               //    chart: {
               //       type: 'pie',
               //       backgroundColor: 'rgba(0,0,0,0)'
               //    },
               //    title: {
               //       text: 'Rupiah Murni',
               //       align: 'center'
               //    },
               //    subtitle: {
               //       useHTML: true,
               //       text: 'Rp. ' + dashboard_realisasi_total_belanja + ' M',
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
               //          showInLegend: true,
               //          colors: colors
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
               //    legend: {},
               //    colors: colors,
               //    series: [{
               //       type: 'pie',
               //       name: 'Jenis Belanja',
               //       data: [{
               //          name: 'Belanja Barang',
               //          color: '#FF530D',
               //          y: parseFloat((parseFloat(data.dashboard_realisasi_barang) / 1000000000.0).toFixed(2))
               //       }, {
               //          name: 'Belanja Pegawai',
               //          color: '#FF530D',
               //          y: parseFloat((parseFloat(data.dashboard_realisasi_pegawai) / 1000000000.0).toFixed(2))
               //       }, {
               //          name: 'Belanja Modal',
               //          color: '#FF530D',
               //          y: parseFloat((parseFloat(data.dashboard_realisasi_modal) / 1000000000.0).toFixed(2))
               //       }]
               //    }]
               // });


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
         Highcharts.setOptions({

            lang: {
               decimalPoint: ',',
               thousandsSep: '.'
            }
         });
         $('.select').select2();
         get_periode_revisi();
         get_kurva_s();

      });
   </script>
@endsection
