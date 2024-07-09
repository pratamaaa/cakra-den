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
            <h6 class="py-3 mb-0 content_title">Verifikasi Data Pendaftaran Ujian</h6>
         </div>

         <div class="card-body">
            @if ($errors->any())
               <div class="alert alert-warning alert-dismissible">
                  <div class="alert-heading fw-semibold">Warning</div>
                  Terdapat Kesalahan. Harap cek kembali inputan anda. {{ implode('', $errors->all('<div>:message</div>')) }}
                  <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
               </div>
            @endif
            <form class="form-validate" action="" method="POST" enctype="multipart/form-data">
               <div class="alert alert-success alert-dismissible fade show pt-2 pb-2 rounded-0 mt-0">
                  <span class="fw-semibold">Informasi Umum</span>
               </div>
               <div class="row mb-2">
                  <label class="col-lg-3 col-form-label">Pendaftaran Ujian <span class="text-danger">*</span></label>
                  <div class="col-lg-9">
                     <select class="form-control select" data-placeholder="Pendaftaran Ujian" id="participant_exam_period_uuid" name="participant_exam_period_uuid" disabled>
                        @foreach ($periodeujian as $row)
                           @php
                              $selected = '';
                              $selected = $detail->participant_exam_period_uuid == $row->exam_period_uuid ? 'selected' : '';
                           @endphp
                           <option value="{{ $row->exam_period_uuid }}" {{ $selected }}>{{ $row->exam_period_name }}</option>
                        @endforeach
                     </select>
                  </div>
               </div>
               <div class="row mb-2">
                  <label class="col-lg-3 col-form-label">Kota Ujian <span class="text-danger">*</span></label>
                  <div class="col-lg-9">
                     <select class="form-control select" data-placeholder="Kota Ujian" id="participant_test_city_uuid_temp" name="participant_test_city_uuid_temp" disabled>
                        <option></option>
                        @foreach ($kota_ujian as $row)
                           <option value="{{ $row->city_test_uuid }}" {{ $detail->participant_test_city_uuid == $row->city_test_uuid ? 'selected' : '' }}>{{ $row->city_test_name }}</option>
                        @endforeach
                     </select>
                  </div>
               </div>

               <div class="row mb-2">
                  <label class="col-lg-3 col-form-label">Nama Lengkap - Tanpa Gelar <span class="text-danger">*</span></label>
                  <div class="col-lg-9">
                     <input type="text" value="{{ $detail->participant_name }}" class="form-control" placeholder="Nama Lengkap - Tanpa Gelar" id="participant_name" name="participant_name" disabled>
                  </div>
               </div>
               <div class="row mb-2">
                  <label class="col-lg-3 col-form-label">Nama Lengkap - Dengan Gelar <span class="text-danger">*</span></label>
                  <div class="col-lg-9">
                     <input type="text" value="{{ $detail->participant_fullname }}" class="form-control" placeholder="Nama Lengkap - Dengan Gelar" id="participant_fullname" name="participant_fullname" disabled>
                     <div class="form-text text-info">Nama Lengkap termasuk Gelar Depan dan Gelar Belakan sesuai Ijazah yang dimiliki, UNTUK DICANTUMKAN DI SERTIFIKAT. Contoh penulisan: DR. XXXX, S.H., M.H.</div>
                  </div>
               </div>
               <div class="row mb-2">
                  <label class="col-lg-3 col-form-label">Kartu Identitas Nasional <span class="text-danger">*</span></label>
                  <div class="col-lg-9">
                     <div class="input-group">
                        <select class="form-control select flex-grow-0" data-minimum-results-for-search="Infinity" data-width="130" id="participant_identity_type" name="participant_identity_type" onchange="set_kin(this)" disabled>
                           <option value="KTP" {{ $detail->participant_identity_type == 'KTP' ? 'selected' : '' }}>KTP</option>
                           <option value="SIM" {{ $detail->participant_identity_type == 'SIM' ? 'selected' : '' }}>SIM</option>
                           <option value="PASSPOR" {{ $detail->participant_identity_type == 'PASSPOR' ? 'selected' : '' }}>PASSPOR</option>
                        </select>
                        <input type="text" value="{{ $detail->participant_identity_number }}" class="form-control" placeholder="Nomor Identitas" id="participant_identity_number" name="participant_identity_number" disabled>
                     </div>
                     <div class="form-text text-info">Identitas yang akan ditunjukan pada hari ujian - HARUS SAMA</div>
                  </div>
               </div>
               <div class="row mb-2 masa_berakhir" style="display: {{ $detail->participant_identity_type == 'KTP' ? 'none' : 'block' }};">
                  <label class="col-lg-3 col-form-label">Masa Berakhir Kartu Identitas <span class="text-danger">*</span></label>
                  <div class="col-lg-9">
                     <input type="text" value="{{ date('d-m-Y', strtotime($detail->participant_identity_expire_date)) }}" class="form-control" placeholder="Masa Berakhir Kartu Identitas" id="participant_identity_expire_date_temp" name="participant_identity_expire_date_temp" data-real-value="{{ $detail->participant_identity_expire_date }}" disabled>
                  </div>
               </div>
               <div class="row mb-2">
                  <label class="col-lg-3 col-form-label">Jenis Kelamin <span class="text-danger">*</span></label>
                  <div class="col-lg-9">
                     <select class="form-control select" data-placeholder="Jenis Kelamin" id="participant_gender" name="participant_gender" disabled>
                        <option></option>
                        <option value="Laki-Laki" {{ $detail->participant_gender == 'Laki-Laki' ? 'selected' : '' }}>Laki-Laki</option>
                        <option value="Perempuan" {{ $detail->participant_gender == 'Perempuan' ? 'selected' : '' }}>Perempuan</option>
                     </select>
                  </div>
               </div>
               <div class="row mb-2">
                  <label class="col-lg-3 col-form-label">Tempat Lahir <span class="text-danger">*</span></label>
                  <div class="col-lg-9">
                     <div class="row">
                        <div class="col-md-12">
                           <div class="input-group">
                              <span class="input-group-text">Provinsi</span>
                              <select class="form-control select" data-placeholder="Provinsi" data-width="1%" id="participant_place_of_birth_prov_uuid" name="participant_place_of_birth_prov_uuid" onchange="getKota(this,'participant_place_of_birth_city_uuid')" disabled>
                                 <option></option>
                                 @foreach ($provinsi as $row)
                                    <option value="{{ $row->province_uuid }}" {{ $detail->participant_place_of_birth_prov_uuid == $row->province_uuid ? 'selected' : '' }}>{{ $row->province_name }}</option>
                                 @endforeach
                              </select>
                           </div>
                        </div>
                        <div class="col-md-6" style="display: none;">
                           <div class="input-group">
                              <span class="input-group-text">Kota / Kab.</span>
                              <select class="form-control select" data-placeholder="Kota / Kab." data-width="1%" id="participant_place_of_birth_city_uuid" name="participant_place_of_birth_city_uuid" data-value="{{ $detail->participant_place_of_birth_city_uuid }}" disabled>
                                 <option></option>
                              </select>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="row mb-2">
                  <label class="col-lg-3 col-form-label">Tanggal Lahir <span class="text-danger">*</span></label>
                  <div class="col-lg-9">
                     <input type="text" value="{{ date('d-m-Y', strtotime($detail->participant_date_of_birth)) }}" class="form-control" placeholder="Tanggal Lahir" id="participant_date_of_birth_temp" name="participant_date_of_birth_temp" data-real-value="{{ $detail->participant_date_of_birth }}" disabled>
                  </div>
               </div>
               <div class="row mb-2">
                  <label class="col-lg-3 col-form-label">Alamat Lengkap <span class="text-danger">*</span></label>
                  <div class="col-lg-9">
                     <input type="text" value="{{ $detail->participant_address }}" class="form-control" placeholder="Alamat" id="participant_address" name="participant_address" disabled>
                     <div class="row">
                        <div class="col-md-4">
                           <div class="input-group mt-2">
                              <span class="input-group-text">No</span>
                              <input type="text" value="{{ $detail->participant_address_no }}" class="form-control" placeholder="No" id="participant_address_no" name="participant_address_no" disabled>
                           </div>
                        </div>
                        <div class="col-md-4">
                           <div class="input-group mt-2">
                              <span class="input-group-text">Rt</span>
                              <input type="text" value="{{ $detail->participant_address_rt }}" class="form-control" placeholder="Rt" id="participant_address_rt" name="participant_address_rt" disabled>
                           </div>
                        </div>
                        <div class="col-md-4">
                           <div class="input-group mt-2">
                              <span class="input-group-text">Rw</span>
                              <input type="text" value="{{ $detail->participant_address_rw }}" class="form-control" placeholder="Rw" id="participant_address_rw" name="participant_address_rw" disabled>
                           </div>
                        </div>
                     </div>
                     <div class="row">
                        <div class="col-md-6">
                           <div class="input-group mt-2">
                              <span class="input-group-text" style="min-width:105px;">Provinsi</span>
                              <select class="form-control select" data-placeholder="Provinsi" data-width="1%" id="participant_address_prov_uuid" name="participant_address_prov_uuid" onchange="getKota(this,'participant_address_city_uuid')" disabled>
                                 <option></option>
                                 @foreach ($provinsi as $row)
                                    <option value="{{ $row->province_uuid }}" {{ $detail->participant_address_prov_uuid == $row->province_uuid ? 'selected' : '' }}>{{ $row->province_name }}</option>
                                 @endforeach
                              </select>
                           </div>
                        </div>
                        <div class="col-md-6">
                           <div class="input-group mt-2">
                              <span class="input-group-text" style="min-width:105px;">Kota</span>
                              <select class="form-control select" data-placeholder="Kota" data-width="1%" id="participant_address_city_uuid" name="participant_address_city_uuid" onchange="getKelurahan(this,'participant_address_district_uuid')" data-value="{{ $detail->participant_address_city_uuid }}" disabled>
                                 <option></option>

                              </select>
                           </div>
                        </div>
                     </div>
                     <div class="row">
                        <div class="col-md-6">
                           <div class="input-group mt-2">
                              <span class="input-group-text" style="min-width:105px;">Kecamatan</span>
                              <select class="form-control select" data-placeholder="Kecamatan" data-width="1%" id="participant_address_district_uuid" name="participant_address_district_uuid" onchange="getKecamatan(this,'participant_address_subdistrict_uuid')" data-value="{{ $detail->participant_address_district_uuid }}" disabled>
                                 <option></option>

                              </select>
                           </div>
                        </div>
                        <div class="col-md-6">
                           <div class="input-group mt-2">
                              <span class="input-group-text" style="min-width:105px;">Kelurahan</span>
                              <select class="form-control select" data-placeholder="Kelurahan" data-width="1%" id="participant_address_subdistrict_uuid" name="participant_address_subdistrict_uuid" data-value="{{ $detail->participant_address_subdistrict_uuid }}" disabled>
                                 <option></option>

                              </select>
                           </div>
                        </div>
                     </div>
                     <div class="form-text text-info">Untuk pengiriman sertifikat dan surat menyurat.</div>

                  </div>
               </div>
               <div class="row mb-2">
                  <label class="col-lg-3 col-form-label">Nomor Telepon <span class="text-danger">*</span></label>
                  <div class="col-lg-9">
                     <div class="row">
                        <div class="col-md-6">
                           <div class="input-group mt-2">
                              <span class="input-group-text">Hp</span>
                              <input type="text" value="{{ $detail->participant_mobile_number }}" class="form-control" placeholder="No Hp" id="participant_mobile_number" name="participant_mobile_number" disabled>
                           </div>
                           <div class="form-text text-info">Memiliki Aplikasi Whatapp.</div>

                        </div>
                        <div class="col-md-6">
                           <div class="input-group mt-2">
                              <span class="input-group-text">Rumah</span>
                              <input type="text" value="{{ $detail->participant_phone_number }}" class="form-control" placeholder="No Telp Rumah" id="participant_phone_number" name="participant_phone_number" disabled>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="row mb-2">
                  <label class="col-lg-3 col-form-label">Alamat Email <span class="text-danger">*</span></label>
                  <div class="col-lg-9">
                     <input type="text" value="{{ $detail->participant_email }}" class="form-control email" placeholder="Alamat Email" id="participant_email" name="participant_email" disabled>
                     <div class="form-text text-info">isi sesuai huruf besar dan kecil serta tanda bacanya - jika ada.</div>
                  </div>
               </div>
               <div class="row mb-2">
                  <label class="col-lg-3 col-form-label">DPC PERADI <span class="text-danger">*</span></label>
                  <div class="col-lg-9">
                     <select class="form-control select" data-placeholder="DPC PERADI" id="participant_dpc_uuid" name="participant_dpc_uuid" disabled>
                        <option></option>
                        @foreach ($dpc as $row)
                           <option value="{{ $row->dpc_uuid }}" {{ $detail->participant_dpc_uuid == $row->dpc_uuid ? 'selected' : '' }}>{{ $row->dpc_name }}</option>
                        @endforeach
                     </select>
                     <div class="form-text text-info">DPC PERADI yang dipilih untuk mengirim Sertifikat.</div>
                  </div>
               </div>
               <div class="row mb-2">
                  <label class="col-lg-3 col-form-label">Calon Peserta Berkebutuhan Khusus/Difabel <span class="text-danger">*</span></label>
                  <div class="col-lg-9">
                     <select class="form-control select" data-placeholder="Berkebutuhan Khusus/Difabel?" id="participant_special_need" name="participant_special_need" onchange="set_kebutuhan_khusus(this)" disabled>
                        <option></option>
                        <option value="Ya" {{ $detail->participant_special_need == 'Ya' ? 'selected' : '' }}>Ya</option>
                        <option value="Tidak" {{ $detail->participant_special_need == 'Tidak' ? 'selected' : '' }}>Tidak</option>
                     </select>
                     <div class="form-text text-info">Calon Peserta Berkebutuhan Khusus/Difabel dan Memerlukan Fasilitas Khusus?</div>
                     <div class="row is_kebutuhan_khusus mt-2" style="display: {{ $detail->participant_special_need == 'Ya' ? 'block' : 'none' }};">
                        <div class="col-md-12">
                           <textarea disabled rows="3" cols="3" class="form-control" placeholder="Keterangan" id="participant_special_need_description" name="participant_special_need_description">{{ $detail->participant_special_need_description }}</textarea>
                           <div class="form-text text-info">Sebutkan dengan rinci Kondisinya dan Kebutuhannya.</div>
                        </div>
                     </div>


                  </div>
               </div>

               <div class="alert alert-success alert-dismissible fade show pt-2 pb-2 rounded-0 mt-3">
                  <span class="fw-semibold">Latar Belakang Pendidikan S1</span>
               </div>
               <div class="row mb-2">
                  <label class="col-lg-3 col-form-label">Nama Universitas <span class="text-danger">*</span></label>
                  <div class="col-lg-9">
                     <input type="text" value="{{ $detail->participant_university_uuid }}" class="form-control wajib" placeholder="Nama Universitas" id="participant_university_uuid" name="participant_university_uuid" disabled>
                  </div>
               </div>
               <div class="row mb-2">
                  <label class="col-lg-3 col-form-label">Fakultas <span class="text-danger">*</span></label>
                  <div class="col-lg-9">
                     <select class="form-control select" data-placeholder="Fakultas" id="participant_faculty_uuid" name="participant_faculty_uuid" disabled>
                        <option></option>
                        @foreach ($fakultas as $row)
                           <option value="{{ $row->faculty_uuid }}" {{ $detail->participant_faculty_uuid == $row->faculty_uuid ? 'selected' : '' }}>{{ $row->faculty_name }}</option>
                        @endforeach
                     </select>
                  </div>
               </div>
               <div class="row mb-2">
                  <label class="col-lg-3 col-form-label">No Ijazah <span class="text-danger">*</span></label>
                  <div class="col-lg-9">
                     <input type="text" value="{{ $detail->participant_ijazah_number }}" class="form-control" placeholder="No Ijazah" id="participant_ijazah_number" name="participant_ijazah_number" disabled>
                  </div>
               </div>
               <div class="row mb-2">
                  <label class="col-lg-3 col-form-label">Tahun Lulus <span class="text-danger">*</span></label>
                  <div class="col-lg-9">
                     <input type="text" value="{{ $detail->participant_graduation_year }}" class="form-control" placeholder="Tahun Lulus" id="participant_graduation_year" name="participant_graduation_year" disabled>
                  </div>
               </div>
               <div class="row mb-2">
                  <label class="col-lg-3 col-form-label">Provinsi <span class="text-danger">*</span></label>
                  <div class="col-lg-9">
                     <select class="form-control select" data-placeholder="Provinsi" id="participant_university_prov_uuid" name="participant_university_prov_uuid" onchange="getKota(this,'participant_university_city_uuid')" disabled>
                        <option></option>
                        @foreach ($provinsi as $row)
                           <option value="{{ $row->province_uuid }}" {{ $detail->participant_university_prov_uuid == $row->province_uuid ? 'selected' : '' }}>{{ $row->province_name }}</option>
                        @endforeach
                     </select>
                  </div>
               </div>
               <div class="row mb-2">
                  <label class="col-lg-3 col-form-label">Kota <span class="text-danger">*</span></label>
                  <div class="col-lg-9">
                     <select class="form-control select" data-placeholder="Kota" id="participant_university_city_uuid" name="participant_university_city_uuid" data-value="{{ $detail->participant_university_city_uuid }}" disabled>
                        <option></option>
                     </select>
                  </div>
               </div>
               <div class="alert alert-success alert-dismissible fade show pt-2 pb-2 rounded-0 mt-3">
                  <span class="fw-semibold">PKPA yang telah diikuti.</span>
               </div>
               <div class="row mb-2">
                  <label class="col-lg-3 col-form-label">Nomor Sertifikat PKPA</label>
                  <div class="col-lg-9">
                     <input type="text" value="{{ $detail->participant_pkpa_certificate_number }}" class="form-control" placeholder="Nomor Sertifikat PKPA" id="participant_pkpa_certificate_number" name="participant_pkpa_certificate_number" disabled>
                  </div>
               </div>
               <div class="row mb-2">
                  <label class="col-lg-3 col-form-label">Tanggal Sertifikat PKPA</label>
                  <div class="col-lg-9">
                     <input type="text" value="{{ date('d-m-Y', strtotime($detail->participant_pkpa_certificate_date)) }}" class="form-control" placeholder="Tanggal Sertifikat PKPA" id="participant_pkpa_certificate_date_temp" name="participant_pkpa_certificate_date_temp" data-real-value="{{ $detail->participant_pkpa_certificate_date }}" disabled>
                  </div>
               </div>
               <div class="row mb-2">
                  <label class="col-lg-3 col-form-label">Nama Pelaksana PKPA</label>
                  <div class="col-lg-9">
                     <input type="text" value="{{ $detail->participant_pkpa_certificate_executor }}" class="form-control" placeholder="Nama Pelaksana PKPA" id="participant_pkpa_certificate_executor" name="participant_pkpa_certificate_executor" disabled>
                  </div>
               </div>
               <div class="alert alert-success alert-dismissible fade show pt-2 pb-2 rounded-0 mt-3">
                  <span class="fw-semibold">Dokumen Pendaftaran</span>
               </div>
               <div class="row mb-2">
                  <label class="col-lg-3 col-form-label">Dokumen Kartu Identitas Nasional <span class="jenis_identitas fw-semibold">(KTP)</span></label>
                  <div class="col-lg-9">
                     @if ($detail->participant_doc_identity_document_file_type == 'image')
                        <img class="border p-2" src="{{ url('file/get?uuid=' . $detail->participant_doc_identity_uuid) }}" alt="" style="max-width: 200px;">
                     @else
                        <embed class="kv-preview-data file-preview-pdf file-zoom-detail" src="{{ url('file/get?uuid=' . $detail->participant_doc_identity_uuid) }}" type="application/pdf" style="border: 1px solid #ddd !important; padding:1rem; width: 100%; height: 100%; min-height: 400px;">
                     @endif
                  </div>
               </div>
               <div class="row mb-2">
                  <label class="col-lg-3 col-form-label">Bukti setor <b>(Biaya Pendaftaran)</b> asli Bank </label>
                  <div class="col-lg-9">
                     @if ($detail->participant_doc_bukti_setor_document_file_type == 'image')
                        <img class="border p-2" src="{{ url('file/get?uuid=' . $detail->participant_doc_bukti_setor_uuid) }}" alt="" style="max-width: 200px;">
                     @else
                        <embed class="kv-preview-data file-preview-pdf file-zoom-detail" src="{{ url('file/get?uuid=' . $detail->participant_doc_bukti_setor_uuid) }}" type="application/pdf" style="border: 1px solid #ddd !important; padding:1rem; width: 100%; height: 100%; min-height: 400px;">
                     @endif
                  </div>
               </div>
               <div class="row mb-2">
                  <label class="col-lg-3 col-form-label">Pas Foto berwarna <b>3x4 ( berlatar belakang biru)</b>.</label>
                  <div class="col-lg-9">
                     @if ($detail->participant_doc_foto_document_file_type == 'image')
                        <img class="border p-2" src="{{ url('file/get?uuid=' . $detail->participant_doc_foto_uuid) }}" alt="" style="max-width: 200px;">
                     @else
                        <embed class="kv-preview-data file-preview-pdf file-zoom-detail" src="{{ url('file/get?uuid=' . $detail->participant_doc_foto_uuid) }}" type="application/pdf" style="border: 1px solid #ddd !important; padding:1rem; width: 100%; height: 100%; min-height: 400px;">
                     @endif
                  </div>
               </div>
               <div class="row mb-2">
                  <label class="col-lg-3 col-form-label">Ijazah S1 Asli berlatar belakang <b>Pendidikan Tinggi HUKUM</b> yang telah dilegalisir asli perguruan tinggi yang mengeluarkannya/menerbitkan ijazah tersebut.</label>
                  <div class="col-lg-9">
                     @if ($detail->participant_doc_ijazah_document_file_type == 'image')
                        <img class="border p-2" src="{{ url('file/get?uuid=' . $detail->participant_doc_ijazah_uuid) }}" alt="" style="max-width: 200px;">
                     @else
                        <embed class="kv-preview-data file-preview-pdf file-zoom-detail" src="{{ url('file/get?uuid=' . $detail->participant_doc_ijazah_uuid) }}" type="application/pdf" style="border: 1px solid #ddd !important; padding:1rem; width: 100%; height: 100%; min-height: 400px;">
                     @endif
                  </div>
               </div>
               <div class="row mb-2">
                  <label class="col-lg-3 col-form-label">Sertifikat <b>PKPA (Pendidikan Khusus Profesi Advokat)</b> yang dikeluarkan oleh <b>PERADI</b> dan ditandatangani oleh Ketua Umum <b>Otto Hasibuan</b> atau <b>Fauzie Yusuf Hasibuan</b>.</label>
                  <div class="col-lg-9">
                     @if ($detail->participant_doc_sertifikat_pkpa_document_file_type == 'image')
                        <img class="border p-2" src="{{ url('file/get?uuid=' . $detail->participant_doc_sertifikat_pkpa_uuid) }}" alt="" style="max-width: 200px;">
                     @else
                        <embed class="kv-preview-data file-preview-pdf file-zoom-detail" src="{{ url('file/get?uuid=' . $detail->participant_doc_sertifikat_pkpa_uuid) }}" type="application/pdf" style="border: 1px solid #ddd !important; padding:1rem; width: 100%; height: 100%; min-height: 400px;">
                     @endif
                  </div>
               </div>
               <div class="alert alert-primary alert-dismissible fade show pt-2 pb-2 rounded-0 mt-3">
                  <span class="fw-semibold">Proses Verifikasi</span>
               </div>
               <div class="row mb-2">
                  <label class="col-lg-3 col-form-label">Kota Ujian <span class="text-danger">*</span></label>
                  <div class="col-lg-9">
                     <select class="form-control select wajib" data-placeholder="Kota Ujian" id="participant_test_city_uuid" name="participant_test_city_uuid">
                        <option></option>
                        @foreach ($kota_ujian as $row)
                           <option value="{{ $row->city_test_uuid }}" {{ $detail->participant_test_city_uuid == $row->city_test_uuid ? 'selected' : '' }}>{{ $row->city_test_name }}</option>
                        @endforeach
                     </select>
                  </div>
               </div>
               <div class="row mb-2">
                  <label class="col-lg-3 col-form-label">Lokasi Ujian <span class="text-danger">*</span></label>
                  <div class="col-lg-9">
                     <select class="form-control select wajib" data-placeholder="Lokasi Ujian" id="participant_location_test_uuid" name="participant_location_test_uuid">
                        <option></option>
                        @foreach ($lokasi_test as $row)
                           <option value="{{ $row->location_test_uuid }}" {{ $detail->participant_location_test_uuid == $row->location_test_uuid ? 'selected' : '' }}>{{ $row->location_test_name }} - {{ $row->location_test_address }}</option>
                        @endforeach
                     </select>
                  </div>
               </div>
               <div class="row mb-2">
                  <label class="col-lg-3 col-form-label">Berkas Pendaftaran <span class="text-danger">*</span></label>
                  <div class="col-lg-9">
                     @foreach ($kelengkapan_dokumen as $row)
                        <label class="form-check mb-2">
                           <input type="checkbox" class="form-check-input form-check-input-success" {{ $row->ischeck > 0 ? 'checked' : '' }} onclick="set_berkas(this, {{ $row->kelengkapan_document_id }})">
                           <span class="form-check-label">
                              {{ $row->kelengkapan_document_name }}
                           </span>
                        </label>
                        <input type="hidden" name="kelengkapan_document_uuid[]" id="kelengkapan_document_uuid_{{ $row->kelengkapan_document_id }}" value="{{ $row->kelengkapan_document_uuid }}">
                        <input type="hidden" name="kelengkapan_document_value[]" id="kelengkapan_document_value_{{ $row->kelengkapan_document_id }}" value="{{ $row->ischeck > 0 ? 1 : 0 }}">
                     @endforeach
                  </div>
               </div>
               <div class="row mb-2">
                  <label class="col-lg-3 col-form-label">Status Verifikasi <span class="text-danger">*</span></label>
                  <div class="col-lg-9">
                     <select class="form-control select wajib" data-placeholder="Status Verifikasi" id="status" name="status" onchange="set_status(this)">
                        <option></option>
                        <option value="1">Disetujui</option>
                        <option value="2">Verifikasi Lanjutan ke PERADI</option>
                        <option value="3">Dikembalikan Kepada Calon Peserta</option>
                     </select>
                  </div>
               </div>
               <div class="row mb-2 status_description" style="display: none;">
                  <label class="col-lg-3 col-form-label">Keterangan Verifikasi <span class="text-danger">*</span></label>
                  <div class="col-lg-9">
                     <textarea rows="3" cols="3" class="form-control" placeholder="Keterangan" id="status_description" name="status_description"></textarea>
                     <div class="form-text text-info">Keterangan Verifikasi ini akan dikirim melalui Email/WA ke Calon Peserta Jika dikembalikan</div>
                  </div>
               </div>
               <div class="col-lg-6 offset-lg-3">
                  @csrf
                  @csrf
                  <input type="hidden" name="save_tipe" id="save_tipe" value="0">
                  <input type="hidden" name="participant_id" id="participant_id" value="{{ $detail->participant_id }}">
                  <input type="hidden" name="file_upload_code" id="file_upload_code" value="{{ $temp_uuid }}">
                  <button type="submit" class="btn btn-flat-primary btn-outline-primary ms-1">
                     <i class="ph-note-pencil me-2"></i>
                     Simpan
                  </button>
                  <a href="{{ url('participant') }}" class="btn btn-flat-warning btn-outline-warning ms-1">
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

      function set_berkas(ini, id) {
         if ($(ini).is(':checked')) {
            $('#kelengkapan_document_value_' + id).val(1);
         } else {
            $('#kelengkapan_document_value_' + id).val(0);
         }
      }

      function set_status(ini) {
         if ($(ini).val() == 3) {
            $('.status_description').slideDown();
         } else {
            $('.status_description').slideUp();
            $('#status_description').val('');
         }
      }

      function set_save(tipe) {
         $('#save_tipe').val(tipe);
      }

      function set_toc(jenis) {
         if (jenis == 1) {
            $('#toc').prop('checked', true);
         } else {
            $('#toc').prop('checked', false);
         }
         $('#modal_animation').modal('hide');

      }

      function show_toc() {
         $('#modal_animation').modal('show');
      }

      function set_kin(ini) {
         var vals = $(ini).val();
         if (vals != 'KTP') {
            $('.masa_berakhir').slideDown();
         } else {
            $('.masa_berakhir').slideUp().val('');
         }
         $('.jenis_identitas').html('(' + vals + ')');
      }

      function set_kebutuhan_khusus(ini) {
         var vals = $(ini).val();
         if (vals == 'Ya') {
            $('.is_kebutuhan_khusus').slideDown();
         } else {
            $('.is_kebutuhan_khusus').slideUp();
         }
      }

      function getKota(ini, kota_id) {
         var province_uuid = $(ini).val();
         var selectedkota = $('#' + kota_id).attr('data-value');

         $('body').removeClass('loaded');
         $.ajax({
            url: baseurl + '/participant/getkota',
            type: "post",
            dataType: 'json',
            data: {
               _token: $('input[name="_token"]').val(),
               province_uuid: province_uuid
            },
            success: function(data) {
               var NewHtml = '<option></option>';
               for (var i = 0; i < data.length; i++) {

                  NewHtml += '<option value="' + data[i].city_uuid + '" ' + ((selectedkota == data[i].city_uuid) ? 'selected' : '') + '>' + data[i].city_name + '</option>';
               }
               $('#' + kota_id).select2('destroy');
               $('#' + kota_id).html(NewHtml);
               $('#' + kota_id).select2({
                  dropdownAutoWidth: true,
                  width: '100%'
               });
               if (selectedkota != '') {
                  $('#' + kota_id).val(selectedkota).trigger('change');
               }

               $('body').addClass('loaded');

            }
         });
      }

      function getKelurahan(ini, kel_id) {
         var city_uuid = $(ini).val();
         var selectedkelurahan = $('#' + kel_id).attr('data-value');

         $('body').removeClass('loaded');
         $.ajax({
            url: baseurl + '/participant/getkelurahan',
            type: "post",
            dataType: 'json',
            data: {
               _token: $('input[name="_token"]').val(),
               city_uuid: city_uuid
            },
            success: function(data) {
               var NewHtml = '<option></option>';
               for (var i = 0; i < data.length; i++) {

                  NewHtml += '<option value="' + data[i].district_uuid + '" ' + ((selectedkelurahan == data[i].district_uuid) ? 'selected' : '') + '>' + data[i].district_name + '</option>';
               }
               $('#' + kel_id).select2('destroy');
               $('#' + kel_id).html(NewHtml);
               $('#' + kel_id).select2({
                  dropdownAutoWidth: true,
                  width: '100%'
               });
               if (selectedkelurahan != '') {
                  $('#' + kel_id).val(selectedkelurahan).trigger('change');
               }

               $('body').addClass('loaded');

            }
         });
      }

      function getKecamatan(ini, kec_id) {
         var distric_uuid = $(ini).val();
         var selectedkecamatan = $('#' + kec_id).attr('data-value');

         $('body').removeClass('loaded');
         $.ajax({
            url: baseurl + '/participant/getkecamatan',
            type: "post",
            dataType: 'json',
            data: {
               _token: $('input[name="_token"]').val(),
               distric_uuid: distric_uuid
            },
            success: function(data) {
               var NewHtml = '<option></option>';
               for (var i = 0; i < data.length; i++) {

                  NewHtml += '<option value="' + data[i].subdistrict_uuid + '" ' + ((selectedkecamatan == data[i].subdistrict_uuid) ? 'selected' : '') + '>' + data[i].subdistrict_name + '</option>';
               }
               $('#' + kec_id).select2('destroy');
               $('#' + kec_id).html(NewHtml);
               $('#' + kec_id).select2({
                  dropdownAutoWidth: true,
                  width: '100%'
               });
               if (selectedkecamatan != '') {
                  $('#' + kec_id).val(selectedkecamatan).trigger('change');
               }

               $('body').addClass('loaded');

            }
         });
      }


      $(document).ready(function() {
         $('.select').select2();

         setDatePicker('#participant_date_of_birth_temp', '#participant_date_of_birth');
         setDatePicker('#participant_identity_expire_date_temp', '#participant_identity_expire_date');
         setDatePicker('#participant_pkpa_certificate_date_temp', '#participant_pkpa_certificate_date');

         setDateRangePicker('#exam_period_register_date', '#exam_period_register_start_date', '#exam_period_register_end_date');
         const dpDefaultViewElement = document.querySelector('#participant_graduation_year');
         //const dpDefaultViewElement = document.querySelector('.datepicker-default-view');
         if (dpDefaultViewElement) {
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
               maxDate: new Date()
            });
         }
         var doc_identity_uuid = $('#participant_doc_identity_uuid');
         doc_identity_uuid.fileinput({
            allowedFileExtensions: ['jpg', 'png', 'jpeg', 'pdf'],
            uploadUrl: baseurl + '/participant/upload_file',
            deleteUrl: baseurl + '/participant/delete_file',
            uploadExtraData: {
               _token: $('input[name="_token"]').val(),
               file_upload_code: $('#file_upload_code').val(),
               document_type: 'IDENTITAS'
            },
            autoReplace: true,
            uploadAsync: true,
            minFileCount: 1,
            maxFileCount: 1,
            minFileSize: 0,
            maxFileSize: 2048,
            initialPreviewAsData: true,
            initialPreviewFileType: doc_identity_uuid.attr('data-type'),
            initialPreview: [
               baseurl + '/file/get?uuid=' + doc_identity_uuid.attr('data-file')
            ],
         }).on("filebatchselected", function(event, files) {
            doc_identity_uuid.fileinput("upload");
         }).on('fileuploaded', function(e, params) {
            doc_identity_uuid.removeClass('wajib');
            doc_identity_uuid.valid();
         }).on('fileremoved', function(event, id, index) {
            doc_identity_uuid.addClass('wajib');
            doc_identity_uuid.valid();
         });

         var doc_bukti_setor_uuid = $('#participant_doc_bukti_setor_uuid');

         doc_bukti_setor_uuid.fileinput({
            allowedFileExtensions: ['jpg', 'png', 'jpeg', 'pdf'],
            browseLabel: 'Browse',
            uploadUrl: baseurl + '/participant/upload_file',
            deleteUrl: baseurl + '/participant/delete_file',
            enableResumableUpload: true,
            uploadExtraData: {
               _token: $('input[name="_token"]').val(),
               file_upload_code: $('#file_upload_code').val(),
               document_type: 'BUKTI_SETOR_BIAYA_PENDAFTARAN'
            },
            autoReplace: true,
            uploadAsync: true,
            showRemove: true,
            required: true,
            minFileCount: 1,
            maxFileCount: 1,
            minFileSize: 0,
            maxFileSize: 2048,
            initialPreviewAsData: true,
            initialPreviewFileType: doc_bukti_setor_uuid.attr('data-type'),
            initialPreview: [
               baseurl + '/file/get?uuid=' + doc_bukti_setor_uuid.attr('data-file')
            ],
         }).on("filebatchselected", function(event, files) {
            doc_bukti_setor_uuid.fileinput("upload");
         }).on('fileuploaded', function(e, params) {
            doc_bukti_setor_uuid.removeClass('wajib');
            doc_bukti_setor_uuid.valid();
         }).on('fileremoved', function(event, id, index) {
            doc_bukti_setor_uuid.addClass('wajib');
            doc_bukti_setor_uuid.valid();
         });


         var doc_foto_uuid = $('#participant_doc_foto_uuid');
         doc_foto_uuid.fileinput({
            allowedFileExtensions: ['jpg', 'png', 'jpeg'],
            browseLabel: 'Browse',
            uploadUrl: baseurl + '/participant/upload_file',
            deleteUrl: baseurl + '/participant/delete_file',
            enableResumableUpload: true,
            uploadExtraData: {
               _token: $('input[name="_token"]').val(),
               file_upload_code: $('#file_upload_code').val(),
               document_type: 'PAS_FOTO'
            },
            autoReplace: true,
            uploadAsync: true,
            showRemove: true,
            required: true,
            minFileCount: 1,
            maxFileCount: 1,
            minFileSize: 0,
            maxFileSize: 2048,
            initialPreviewAsData: true,
            initialPreviewFileType: doc_foto_uuid.attr('data-type'),
            initialPreview: [
               baseurl + '/file/get?uuid=' + doc_foto_uuid.attr('data-file')
            ],
         }).on("filebatchselected", function(event, files) {
            doc_foto_uuid.fileinput("upload");
         }).on('fileuploaded', function(e, params) {
            doc_foto_uuid.removeClass('wajib');
            doc_foto_uuid.valid();
         }).on('fileremoved', function(event, id, index) {
            doc_foto_uuid.addClass('wajib');
            doc_foto_uuid.valid();
         });

         var doc_ijazah_uuid = $('#participant_doc_ijazah_uuid');

         doc_ijazah_uuid.fileinput({
            allowedFileExtensions: ['jpg', 'png', 'jpeg', 'pdf'],
            browseLabel: 'Browse',
            uploadUrl: baseurl + '/participant/upload_file',
            deleteUrl: baseurl + '/participant/delete_file',
            enableResumableUpload: true,
            uploadExtraData: {
               _token: $('input[name="_token"]').val(),
               file_upload_code: $('#file_upload_code').val(),
               document_type: 'IJAZAH'
            },
            autoReplace: true,
            uploadAsync: true,
            showRemove: true,
            required: true,
            minFileCount: 1,
            maxFileCount: 1,
            minFileSize: 0,
            maxFileSize: 2048,
            initialPreviewAsData: true,
            initialPreviewFileType: doc_ijazah_uuid.attr('data-type'),
            initialPreview: [
               baseurl + '/file/get?uuid=' + doc_ijazah_uuid.attr('data-file')
            ],
         }).on("filebatchselected", function(event, files) {
            doc_ijazah_uuid.fileinput("upload");
         }).on('fileuploaded', function(e, params) {
            doc_ijazah_uuid.removeClass('wajib');
            doc_ijazah_uuid.valid();
         }).on('fileremoved', function(event, id, index) {
            doc_ijazah_uuid.addClass('wajib');
            doc_ijazah_uuid.valid();
         });

         var doc_sertifikat_pkpa_uuid = $('#participant_doc_sertifikat_pkpa_uuid');

         doc_sertifikat_pkpa_uuid.fileinput({
            allowedFileExtensions: ['jpg', 'png', 'jpeg', 'pdf'],
            browseLabel: 'Browse',
            uploadUrl: baseurl + '/participant/upload_file',
            deleteUrl: baseurl + '/participant/delete_file',
            enableResumableUpload: true,
            uploadExtraData: {
               _token: $('input[name="_token"]').val(),
               file_upload_code: $('#file_upload_code').val(),
               document_type: 'SERTIFIKAT_PKPA_PERADI'
            },
            autoReplace: true,
            uploadAsync: true,
            showRemove: true,
            required: true,
            minFileCount: 1,
            maxFileCount: 1,
            minFileSize: 0,
            maxFileSize: 2048,
            initialPreviewAsData: true,
            initialPreviewFileType: doc_sertifikat_pkpa_uuid.attr('data-type'),
            initialPreview: [
               baseurl + '/file/get?uuid=' + doc_sertifikat_pkpa_uuid.attr('data-file')
            ],
         }).on("filebatchselected", function(event, files) {
            doc_sertifikat_pkpa_uuid.fileinput("upload");
         }).on('fileuploaded', function(e, params) {
            doc_sertifikat_pkpa_uuid.removeClass('wajib');
            doc_sertifikat_pkpa_uuid.valid();
         }).on('fileremoved', function(event, id, index) {
            doc_sertifikat_pkpa_uuid.addClass('wajib');
            doc_sertifikat_pkpa_uuid.valid();
         });

         $("#participant_pkpa_certificate_number").rules("add", {
            remote: {
               url: baseurl + '/participant/checkcertificate',
               type: "post",
               data: {
                  participant_name: function() {
                     return $('#participant_name').val();
                  },
                  participant_fullname: function() {
                     return $('#participant_fullname').val();
                  },
               }
            },
            messages: {
               remote: "Sertifikat PKPA yang telah diikuti Tidak Valid. Cek kembali Nomor sertifikat dan Nama Lengkap",
            }
         });

         $('#participant_place_of_birth_prov_uuid').change();
         $('#participant_address_prov_uuid').change();
         $('#participant_university_prov_uuid').change();



         $('#participant_date_of_birth').val($('#participant_date_of_birth_temp').attr('data-real-value'));
         $('#participant_identity_expire_date').val($('#participant_identity_expire_date_temp').attr('data-real-value'));
         $('#participant_pkpa_certificate_date').val($('#participant_pkpa_certificate_date_temp').attr('data-real-value'));
      });
   </script>
@endsection
