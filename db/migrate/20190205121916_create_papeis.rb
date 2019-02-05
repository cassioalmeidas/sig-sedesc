class CreatePapeis < ActiveRecord::Migration[5.2]
  def change
    create_table :papeis do |t|
      t.string :descricao
      t.string :nome, null: false

      t.timestamps
    end
  end
end
