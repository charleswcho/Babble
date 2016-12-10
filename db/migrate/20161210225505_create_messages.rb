class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :text, null: false
      t.string :user_id, index: true, null: false
      t.timestamps
    end
  end
end
