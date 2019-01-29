$(document).on 'turbolinks:load', ->
  $('#almoxarifado-materiais-datatable').dataTable
    responsive: true
    processing: true
    serverSide: true
    ajax: $('#almoxarifado-materiais-datatable').data('source')
    pagingType: 'full_numbers'
    columns: [
      { data: 'descricao' },
      { data: 'quantidade' }
    ]
    language: I18n.t('datatables')
  return