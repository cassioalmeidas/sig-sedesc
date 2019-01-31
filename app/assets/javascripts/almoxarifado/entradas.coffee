$(document).on 'turbolinks:load', ->
  $('#almoxarifado-entradas-datatable').dataTable
    processing: true
    serverSide: true
    ajax: $('#almoxarifado-entradas-datatable').data('source')
    pagingType: 'full_numbers'
    columns: [
      { data: 'almoxarifado_materiais_descricao' },
      { data: 'quantidade' },
      { data: 'numero_empenho' }
    ]
    language: I18n.t('datatables')