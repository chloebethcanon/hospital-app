class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.date :date
      t.time :start_time
      t.time :end_time
      t.string :location
      t.string :category
      t.text :description
      t.integer :capacity
      t.boolean :private

      t.timestamps null: false
    end
  end
end
