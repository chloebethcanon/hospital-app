class CreateCategorizedEvents < ActiveRecord::Migration
  def change
    create_table :categorized_events do |t|
      t.integer :category_id
      t.integer :event_id

      t.timestamps null: false
    end
  end
end
