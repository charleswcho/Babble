class RemoveUserUniqueness < ActiveRecord::Migration[5.0]
  def change
    remove_index :users, :name
    add_index :users, :name

    change_column :users, :name, :string, limit: 15
  end
end
