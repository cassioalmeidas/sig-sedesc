class AddResponsavelToAlmoxarifadoRetiradas < ActiveRecord::Migration[5.2]
  def change
    add_column :almoxarifado_retiradas, :responsavel, :string, null: false, default: ''
  end
end
