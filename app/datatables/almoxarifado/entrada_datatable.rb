class Almoxarifado::EntradaDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      almoxarifado_materiais_descricao: { source: "Almoxarifado::Material.descricao", cond: :like },
      quantidade: { source: "Almoxarifado::Entrada.quantidade", cond: :eq, searchable: false },
      numero_empenho: { source: "Almoxarifado::Entrada.numero_empenho", cond: :like },
      data: { source: "Almoxarifado::Entrada.created_at", cond: :like },
      acoes: { source: 'acoes', searchable: false, orderable: false }
    }
  end

  def data
    records.map do |record|
      {
        # example:
        almoxarifado_materiais_descricao: record.almoxarifado_materiais.descricao,
        quantidade: record.quantidade,
        numero_empenho: record.numero_empenho || 'Não informado',
        data: I18n.l(record.created_at, format: :long),
        acoes: record.decorate.acoes
      }
    end
  end

  def get_raw_records
    # insert query here
    Almoxarifado::Entrada.ordenado.joins(:almoxarifado_materiais)
  end

end
