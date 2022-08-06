let people_table
// let form_new_person = $('#form-person')
$(document).ready(function(){
  
	people_table = $("#people_table").DataTable({
    'ajax':'people',
    'columns': [
    {'data': 'legajo'},
    {'data': 'last_name'},
    {'data': 'name'},
    {'data': 'dni'},
    {'data': 'cuil'},
    {'data': 'birth_date'},
    {'data': 'nationality'},
    {'data': 'direction'},
    {'data': 'phone'},
    {'data': 'company'},
    {'data': 'actions'}
    ],
    'language': { 'url': "/assets/vendor/datatables_lang_es.json"}
  })

  // $('.select-2-company').select2({ width: '50%',theme: "bootstrap4" })

  $("#form_disable_person").on("ajax:success", function(event) {
      people_table.ajax.reload(null,false)
      $("#modal_disable_person").modal('hide')
      noty_alert('success', 'Persona dada de baja')
      console.log( event.detail )
    }).on("ajax:error", function(event) {
      $('#form_disable_person #error_explanation').hide(500)
      $('#form_disable_person #error_list').empty()
      var msj = jQuery.parseJSON( event.detail[2].response )
      $.each( msj, function( key, value ) {
        $('#form_disable_person #error_list').append('<li> ' + key + ": " + value + ' </li>')
      })
      $('#form_disable_person #error_explanation').show('slow')
  })

  $("#form-person").on("ajax:success", function(event) {
    window.location.href = event.detail[2].responseURL
  }).on("ajax:error", function(event) {
    show_errors(event)
  })

}) // End document.ready

function modal_disable_person( person_id ) {
  $("#form_disable_person")[0].reset()
  $("#form_disable_person #disable_person_id").val( person_id )
  $('#modal_disable_person').modal('show')
}

  inactivity_reasons_table = $("#inactivity_reasons_table").DataTable({
    'ajax':'inactivity_reasons?r_type=' + $('#r_type').val(),
    'responsive': true,
    'columns': [
    {'data': 'name'},
    {'data': 'description'},
    {'data': 'actions'}
    ],
    'language': { 'url': "/assets/Spanish.json"}
  })
