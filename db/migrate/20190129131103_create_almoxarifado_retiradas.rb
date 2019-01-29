class CreateAlmoxarifadoRetiradas < ActiveRecord::Migration[5.2]
  def change
    create_table :almoxarifado_retiradas do |t|
      t.belongs_to :almoxarifado_materiais, foreign_key: true, index: true
      t.integer :quantidade, null: false

      t.timestamps
    end
  end
end
