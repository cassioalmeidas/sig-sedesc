class RolifyCreatePapeis < ActiveRecord::Migration[5.2]
  def change
    create_table(:papeis) do |t|
      t.string :name
      t.references :resource, :polymorphic => true

      t.timestamps
    end

    create_table(:usuarios_papeis, :id => false) do |t|
      t.references :usuario
      t.references :papel
    end
    
    add_index(:papeis, [ :name, :resource_type, :resource_id ])
    add_index(:usuarios_papeis, [ :usuario_id, :papel_id ])
  end
end
