$(document).on 'turbolinks:load', ->
  $('#almoxarifado-setores-datatable').dataTable
    processing: true
    serverSide: true
    ajax: $('#almoxarifado-setores-datatable').data('source')
    pagingType: 'full_numbers'
    columns: [
      { data: 'descricao' },
      { data: 'acoes' }
    ]
    language: I18n.t('datatables')