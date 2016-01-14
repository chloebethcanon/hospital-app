class ChangeAvatarUrlInUsers < ActiveRecord::Migration
  def change
    change_column :users, :avatar_url, :text
  end
end
