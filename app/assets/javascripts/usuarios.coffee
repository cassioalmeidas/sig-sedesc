$(document).on 'turbolinks:load', ->
  $('#usuarios-datatable').dataTable
    processing: true
    serverSide: true
    ajax: $('#usuarios-datatable').data('source')
    pagingType: 'full_numbers'
    columns: [
      { data: 'login' },
      { data: 'email' },
      { data: 'papeis' },
      { data: 'criado_em' },
      { data: 'acoes' }
    ]
    language: I18n.t('datatables')