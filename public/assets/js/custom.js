
if (!$().DataTable) {
    console.warn('Warning - datatables.min.js is not loaded.');
}
$.extend($.fn.dataTable.defaults, {
    autoWidth: false,
    processing: true,
    //dom: '<"datatable-header"frBl><"datatable-scroll-wrap"t><"datatable-footer"ip>',
    dom: '<"datatable-header justify-content-start"f<"ms-sm-auto"l><"ms-sm-3"B>><"datatable-scroll-wrap"t><"datatable-footer"ip>',
    language: {
        search: '_INPUT_',
        searchPlaceholder: 'Pencarian Data',
        info: "Menampilkan _START_ sampai _END_ dari _TOTAL_ data",
        lengthMenu: '_MENU_',
        processing: '<span class="font-size-sm text-uppercase font-weight-semibold"><i class="icon-spinner2 spinner"></i> LOADING</span>',
        paginate: { 'first': 'First', 'last': 'Last', 'next': $('html').attr('dir') == 'rtl' ? '&larr;' : '&rarr;', 'previous': $('html').attr('dir') == 'rtl' ? '&rarr;' : '&larr;' }
    },
});

const FormValidation = function () {


    // Select2 select
    const _componentSelect2 = function () {
        if (!$().select2) {
            console.warn('Warning - select2.min.js is not loaded.');
            return;
        }

        // Initialize
        const $select = $('.form-control-select2').select2({
            minimumResultsForSearch: Infinity
        });

        // Trigger value change when selection is made
        $select.on('change', function () {
            $(this).trigger('blur');
        });
    };

    // Validation config
    const _componentValidation = function () {
        if (!$().validate) {
            console.warn('Warning - validate.min.js is not loaded.');
            return;
        }

        // Initialize
        $('.form-validate').each(function () {
            var forms = $(this);
            const validator = $(this).validate({
                ignore: ':hidden:not(.isnothidden) , .select2-search__field', // ignore hidden fields
                errorClass: 'validation-invalid-label validation-invalid-label-new',
                successClass: 'validation-valid-label',
                validClass: 'validation-valid-label',
                highlight: function (element, errorClass) {
                    $(element).removeClass(errorClass);
                    $(element).removeClass('validation-invalid-label-new');
                },
                unhighlight: function (element, errorClass) {
                    $(element).removeClass(errorClass);
                    $(element).removeClass('validation-invalid-label-new');
                },
                success: function (label) {
                    $(label).remove();
                },

                // Different components require proper error label placement
                errorPlacement: function (error, element) {
                    var attr = element.attr('data-width');

                    if (typeof attr !== 'undefined' && attr !== false) {
                        error.appendTo(element.parent().parent());
                    } else {
                        // Input with icons and Select2
                        if (element.hasClass('select2-hidden-accessible')) {
                            error.appendTo(element.parent());
                        }

                        // Input group, form checks and custom controls
                        else if (element.parents().hasClass('form-control-feedback') || element.parents().hasClass('form-check') || element.parents().hasClass('input-group')) {
                            error.appendTo(element.parent().parent());
                        }

                        // Other elements
                        else {
                            error.insertAfter(element);
                        }
                    }
                },
                submitHandler: function (form) {
                    const swalInit = swal.mixin({
                        buttonsStyling: false,
                        customClass: {
                            confirmButton: 'btn btn-primary',
                            cancelButton: 'btn btn-light',
                            denyButton: 'btn btn-light',
                            input: 'form-control'
                        }
                    });

                    swalInit.fire({
                        title: 'Konfirmasi?',
                        text: "Apakah anda yakin dengan data ini?",
                        icon: 'warning',
                        showCancelButton: true,
                        confirmButtonText: 'YAKIN',
                        cancelButtonText: 'BATAL',
                        buttonsStyling: false,
                        customClass: {
                            confirmButton: 'btn btn-success',
                            cancelButton: 'btn btn-danger'
                        }
                    }).then(function (result) {
                        if (result.value) {
                            if ($('.angka_doank').length > 0) {
                                $('.angka_doank').inputmask('remove');
                                // $('.angka_doank').each(function () {
                                //     var vals = $(this).val();
                                //     var newVal = vals.replace(/\./g, '');
                                //     $(this).val(newVal);
                                // })
                            }
                            form.submit();
                        }
                        else if (result.dismiss === swal.DismissReason.cancel) {
                            return false;
                        }
                    });


                    //$('#konfirmasipenyimpanan').modal('show');
                    //$('#setujukonfirmasibutton').prop('disabled', false);

                    //$('#setujukonfirmasibutton').unbind();

                    //$('#setujukonfirmasibutton').on('click', function () {
                    //    $('#setujukonfirmasibutton').prop('disabled', true);
                    //    $("#loader-wrapper").show();
                    //    $('#konfirmasipenyimpanan').modal('hide');
                    //    $('.angkadoank').inputmask('remove');
                    //    form.submit();
                    //    $('#text_konfirmasi').html('Anda yakin dengan data ini ?');
                    //    $("#loader-wrapper").hide();
                    //});
                    //return false;
                },
                rules: {
                    password: {
                        minlength: 5
                    },
                    repeat_password: {
                        equalTo: '#password'
                    },
                    email: {
                        email: true
                    },
                    repeat_email: {
                        equalTo: '#email'
                    },
                    minimum_characters: {
                        minlength: 10
                    },
                    maximum_characters: {
                        maxlength: 10
                    },
                    minimum_number: {
                        min: 10
                    },
                    maximum_number: {
                        max: 10
                    },
                    number_range: {
                        range: [10, 20]
                    },
                    url: {
                        url: true
                    },
                    date: {
                        date: true
                    },
                    date_iso: {
                        dateISO: true
                    },
                    numbers: {
                        number: true
                    },
                    digits: {
                        digits: true
                    },
                    creditcard: {
                        creditcard: true
                    },
                    basic_checkbox: {
                        minlength: 2
                    },
                    styled_checkbox: {
                        minlength: 2
                    },
                    switch_group: {
                        minlength: 2
                    }
                },
                messages: {
                    custom: {
                        required: 'This is a custom error message'
                    },
                    basic_checkbox: {
                        minlength: 'Please select at least {0} checkboxes'
                    },
                    styled_checkbox: {
                        minlength: 'Please select at least {0} checkboxes'
                    },
                    switch_group: {
                        minlength: 'Please select at least {0} switches'
                    },
                    agree: 'Please accept our policy'
                }
            });
            $.validator.addClassRules({
                wajib: {
                    required: true
                },
                email: {
                    email: true
                },
                wajibcheckbox: {
                    required: true
                },
                wajibfile: {
                    required: true,
                    extension: "pdf|doc|docx|odt",
                    filesize: 10240000,
                },
                FileDocument: {
                    required: false,
                    extension: "pdf|doc|docx|odt",
                    filesize: 10240000,
                },
                url: {
                    url: true
                },
                angkadoank: {
                    digits: true
                },
            });

            $.extend($.validator.messages, {
                required: "Wajib",
                remote: "Please fix this field",
                email: "Harap Gunakan Format Email",
                url: "Harap Masukan Format Url contoh : https://www.google.com",
                date: "Harap Gunakan Format Tanggal",
                dateISO: "Please enter a valid date (ISO)",
                number: "Hanya Angka yang di perbolehkan",
                digits: "Hanya Angka yang di perbolehkan",
                creditcard: "Please enter a valid credit card number",
                equalTo: "Tidak Sama",
                accept: "Harap Masukan Extension yang di ijinkan",
                maxlength: $.validator.format("Maksimal {0} Karakter"),
                minlength: $.validator.format("Minimal {0} Karakter."),
                rangelength: $.validator.format("Please enter a value between {0} and {1} characters long."),
                range: $.validator.format("Please enter a value between {0} and {1}."),
                max: $.validator.format("Maksimal {0}"),
                min: $.validator.format("Minimal {0}"),
            });
            // Reset form
            $('#reset').on('click', function () {
                validator.resetForm();
            });

            $('input', $(forms)).on("change", function () {
                $(forms).validate().element($(this));
            });
            $('textarea', $(forms)).on("change", function () {
                $(forms).validate().element($(this));
            });
            $('select', $(forms)).on("change", function () {
                $(forms).validate().element($(this));
            });
        })


    };


    //
    // Return objects assigned to module
    //

    return {
        init: function () {
            _componentSelect2();
            _componentValidation();
        }
    }
}();


// Initialize module
// ------------------------------

document.addEventListener('DOMContentLoaded', function () {
    FormValidation.init();
});
function setDateRangePicker(id, id_start, id_end) {
    var newInput = '';
    if ($(id_start).length == 0) {
        newInput += '<input type="hidden" class="form-control" placeholder="" id="' + (id_start.replace('#', '')) + '" name="' + (id_start.replace('#', '')) + '">';
    }
    if ($(id_end).length == 0) {
        newInput += '<input type="hidden" class="form-control" placeholder="" id="' + (id_end.replace('#', '')) + '" name="' + (id_end.replace('#', '')) + '">';
    }
    $(newInput).insertAfter(id);

    $(id).daterangepicker({
        parentEl: '.content-inner',
        autoApply: true,
        showDropdowns: true,
        autoUpdateInput: false,
        showButtonPanel: false,
        locale: {
            "format": "DD-MM-YYYY",
            "separator": " - ",
            "applyLabel": "Apply",
            "cancelLabel": "Cancel",
            "fromLabel": "From",
            "toLabel": "To",
            "customRangeLabel": "Custom",
            "weekLabel": "W",
            "daysOfWeek": [
                "Min",
                "Sen",
                "Sel",
                "Rab",
                "Kam",
                "Jum",
                "Sab"
            ],
            "monthNames": [
                "Januari",
                "Februari",
                "Maret",
                "April",
                "Mei",
                "Juni",
                "Juli",
                "Agustus",
                "September",
                "Oktober",
                "November",
                "Desember"
            ],
        },
    }, function (start, end, label) {
        $(id_start).val(start.format('YYYY-MM-DD'));
        $(id_end).val(end.format('YYYY-MM-DD'));
    });

    $(id).on('apply.daterangepicker', function (ev, picker) {
        $(id).val(picker.startDate.format('DD-MM-YYYY') + ' s/d ' + picker.endDate.format('DD-MM-YYYY'));
    });
}
function setDatePicker(id, start) {
    if ($(start).length == 0) {
        var newInput = '<input type="hidden" class="form-control" placeholder="" id="' + (start.replace('#', '')) + '" name="' + (start.replace('#', '')) + '">';
        $(newInput).insertAfter(id);
    }

    $(id).daterangepicker({
        parentEl: '.content-inner',
        singleDatePicker: true,
        showDropdowns: true,
        autoApply: true,
        autoUpdateInput: false,
        locale: {
            "format": "DD-MM-YYYY",
            "separator": " - ",
            "applyLabel": "Apply",
            "cancelLabel": "Cancel",
            "fromLabel": "From",
            "toLabel": "To",
            "customRangeLabel": "Custom",
            "weekLabel": "W",
            "daysOfWeek": [
                "Min",
                "Sen",
                "Sel",
                "Rab",
                "Kam",
                "Jum",
                "Sab"
            ],
            "monthNames": [
                "Januari",
                "Februari",
                "Maret",
                "April",
                "Mei",
                "Juni",
                "Juli",
                "Agustus",
                "September",
                "Oktober",
                "November",
                "Desember"
            ],
        },
    }, function (start) {
        $(id).val(start.format('YYYY-MM-DD'));
    });

    $(id).on('apply.daterangepicker', function (ev, picker) {
        //console.log(picker)
        $(id).val(picker.startDate.format('DD-MM-YYYY'));
        $(start).val(picker.startDate.format('YYYY-MM-DD'));
    });
}
function show_notif() {
    Noty.overrideDefaults({
        theme: 'limitless',
        layout: 'topRight',
        type: 'alert',
        timeout: 2500
    });

    // Success


    // Warning

    if (status_show_notif == 2) {
        new Noty({
            text: 'Gagal menyimpan data.<br>Terdapat Kesalahan.',
            type: 'error'
        }).show();
    } else if (status_show_notif == 1) {
        new Noty({
            text: 'Berhasil.<br>Data berhasil disimpan.',
            type: 'success'
        }).show();
    }
}

// Buttons inside zoom modal
const previewZoomButtonClasses = {
    rotate: 'btn btn-light btn-icon btn-sm',
    toggleheader: 'btn btn-light btn-icon btn-header-toggle btn-sm',
    fullscreen: 'btn btn-light btn-icon btn-sm',
    borderless: 'btn btn-light btn-icon btn-sm',
    close: 'btn btn-light btn-icon btn-sm'
};

// Icons inside zoom modal classes
const previewZoomButtonIcons = {
    prev: document.dir == 'rtl' ? '<i class="ph-arrow-right"></i>' : '<i class="ph-arrow-left"></i>',
    next: document.dir == 'rtl' ? '<i class="ph-arrow-left"></i>' : '<i class="ph-arrow-right"></i>',
    rotate: '<i class="ph-arrow-clockwise"></i>',
    toggleheader: '<i class="ph-arrows-down-up"></i>',
    fullscreen: '<i class="ph-corners-out"></i>',
    borderless: '<i class="ph-frame-corners"></i>',
    close: '<i class="ph-x"></i>'
};

// File actions
const fileActionSettings = {
    zoomClass: '',
    zoomIcon: '<i class="ph-magnifying-glass-plus"></i>',
    dragClass: 'p-2',
    dragIcon: '<i class="ph-dots-six"></i>',
    removeClass: '',
    removeErrorClass: 'text-danger',
    removeIcon: '<i class="ph-trash"></i>',
    indicatorNew: '<i class="ph-file-plus text-success"></i>',
    indicatorSuccess: '<i class="ph-check file-icon-large text-success"></i>',
    indicatorError: '<i class="ph-x text-danger"></i>',
    indicatorLoading: '<i class="ph-spinner spinner text-muted"></i>'
};


$(document).ready(function () {
    show_notif();
});

