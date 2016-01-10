class CreateMessageRecipients < ActiveRecord::Migration
  def change
    create_table :message_recipients do |t|
      t.integer :message_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
