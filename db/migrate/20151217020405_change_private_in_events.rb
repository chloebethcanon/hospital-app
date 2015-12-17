class ChangePrivateInEvents < ActiveRecord::Migration
  def change
    rename_column :events, :private, :is_private
    change_column :events, :is_private, :boolean, default: false
  end
end
