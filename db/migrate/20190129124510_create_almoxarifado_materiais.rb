class CreateAlmoxarifadoMateriais < ActiveRecord::Migration[5.2]
  def change
    create_table :almoxarifado_materiais do |t|
      t.string :descricao, null: false
      t.integer :quantidade, default: 0

      t.timestamps
    end
  end
end
