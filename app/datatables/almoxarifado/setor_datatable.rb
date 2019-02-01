class Almoxarifado::SetorDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      descricao: { source: 'Almoxarifado::Setor.descricao', cond: :like },
      acoes: { source: 'acoes', searchable: false, orderable: false }
    }
  end

  def data
    records.map do |record|
      {
        descricao: record.descricao,
        acoes: record.decorate.acoes
      }
    end
  end

  def get_raw_records
    Almoxarifado::Setor.ordenado
  end

end
