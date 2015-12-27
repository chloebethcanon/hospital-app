class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :title
      t.string :category
      t.text :description
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
