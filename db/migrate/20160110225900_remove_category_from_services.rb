class RemoveCategoryFromServices < ActiveRecord::Migration
  def change
    remove_column :services, :category, :string
  end
end
