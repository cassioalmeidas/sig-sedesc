class AddUsernameToUsuarios < ActiveRecord::Migration[5.2]
  def change
    add_column :usuarios, :username, :string
    add_index :usuarios, :username, unique: true
  end
end
