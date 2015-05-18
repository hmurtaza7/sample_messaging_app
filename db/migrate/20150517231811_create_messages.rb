class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :ad_id
      t.integer :user_id
      t.text :text
      t.boolean :is_approved, default: false

      t.timestamps null: false
    end
  end
end
