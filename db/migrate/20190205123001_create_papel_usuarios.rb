class CreatePapelUsuarios < ActiveRecord::Migration[5.2]
  def change
    create_table :papel_usuarios do |t|
      t.belongs_to :papel, foreign_key: true, index: false
      t.belongs_to :usuario, foreign_key: true, index: false

      t.timestamps
    end
  end
end
