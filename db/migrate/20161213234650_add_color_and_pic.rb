class AddColorAndPic < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :color, :string, null: false
    add_column :users, :profile_pic, :string, null: false
  end
end
