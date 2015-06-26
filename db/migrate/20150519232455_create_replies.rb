class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.integer :message_id
      t.integer :user_id
      t.text :text
      t.boolean :is_approved, default: false

      t.timestamps null: false
    end
  end
end
