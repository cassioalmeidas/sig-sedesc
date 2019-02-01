$(document).on 'turbolinks:load', ->
  $('#almoxarifado-retiradas-datatable').dataTable
    processing: true
    serverSide: true
    ajax: $('#almoxarifado-retiradas-datatable').data('source')
    pagingType: 'full_numbers'
    columns: [
      { data: 'almoxarifado_materiais_descricao' },
      { data: 'quantidade' },
      { data: 'almoxarifado_setor_descricao' },
      { data: 'responsavel' },
      { data: 'data' },
      { data: 'acoes' }
    ]
    language: I18n.t('datatables')