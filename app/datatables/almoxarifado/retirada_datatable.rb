class Almoxarifado::RetiradaDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      almoxarifado_materiais_descricao: { source: "Almoxarifado::Material.descricao", cond: :like },
      quantidade: { source: "Almoxarifado::Retirada.quantidade", cond: :eq, searchable: false },
      almoxarifado_setor_descricao: { source: "Almoxarifado::Setor.descricao", cond: :like },
      responsavel: { source: "Almoxarifado::Retirada.responsavel", cond: :like },
      data: { source: "Almoxarifado::Retirada.created_at", cond: :eq },
      acoes: { source: "acoes", orderable: false, searchable: false }
    }
  end

  def data
    records.map do |record|
      {
        almoxarifado_materiais_descricao: record.almoxarifado_materiais.descricao,
        quantidade: record.quantidade,
        almoxarifado_setor_descricao: record.almoxarifado_setor.descricao,
        responsavel: record.responsavel || 'Não informado',
        data: I18n.l(record.created_at, format: :long),
        acoes: record.decorate.acoes
      }
    end
  end

  def get_raw_records
    Almoxarifado::Retirada.ordenado.joins(
      :almoxarifado_materiais,
      :almoxarifado_setor
    )
  end

end
