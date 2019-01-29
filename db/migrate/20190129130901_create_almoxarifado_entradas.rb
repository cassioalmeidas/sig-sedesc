class CreateAlmoxarifadoEntradas < ActiveRecord::Migration[5.2]
  def change
    create_table :almoxarifado_entradas do |t|
      t.belongs_to :almoxarifado_materiais, foreign_key: true, index: true
      t.integer :quantidade, null: false
      t.bigint :numero_empenho

      t.timestamps
    end
  end
end
