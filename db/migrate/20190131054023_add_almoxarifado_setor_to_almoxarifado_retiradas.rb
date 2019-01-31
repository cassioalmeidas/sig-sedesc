class AddAlmoxarifadoSetorToAlmoxarifadoRetiradas < ActiveRecord::Migration[5.2]
  def change
    add_reference :almoxarifado_retiradas, :almoxarifado_setor, foreign_key: true, index: true
  end
end
