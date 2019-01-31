class CreateAlmoxarifadoSetores < ActiveRecord::Migration[5.2]
  def change
    create_table :almoxarifado_setores do |t|
      t.string :descricao, null: false

      t.timestamps
    end
  end
end
