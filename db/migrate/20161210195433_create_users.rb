class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name, limit: 10
      t.string :color
      t.string :profile_pic

      t.timestamps
    end

    add_index :users, :name, unique: true
  end
end
