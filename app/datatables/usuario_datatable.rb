class UsuarioDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      login: { source: 'Usuario.username', cond: :like },
      email: { source: 'Usuario.email', cond: :like },
      papeis: { source: 'Papel.name', cond: :like, searchable: false },
      criado_em: { source: 'Usuario.created_at', cond: :like },
      acoes: { source: 'acoes', searchable: false, orderable: false }
    }
  end

  def data
    records.map do |record|
      {
        login: record.username,
        email: record.email,
        papeis: record.roles.map(&:name).join(','),
        criado_em: record.created_at.strftime("%d/%m/%Y as %H:%M:%S"),
        acoes: record.decorate.acoes
      }
    end
  end

  def get_raw_records
    Usuario.includes(:roles)
  end

end
