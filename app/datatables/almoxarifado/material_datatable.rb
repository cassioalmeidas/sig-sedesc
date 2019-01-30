class Almoxarifado::MaterialDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      # id: { source: "User.id", cond: :eq },
      descricao: { source: "Almoxarifado::Material.descricao", cond: :like },
      quantidade: { source: "Almoxarifado::Material.quantidade", cond: :eq, searchable: false },
      acoes: { source: "acoes", orderable: false, searchable: false }
    }
  end

  def data
    records.map do |record|
      {
        # example:
        # id: record.id,
        descricao: record.descricao,
        quantidade: record.quantidade,
        acoes: record.decorate.acoes
      }
    end
  end

  def get_raw_records
    # insert query here
    Almoxarifado::Material.all
  end

end
