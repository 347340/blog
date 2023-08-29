class AddAvatarPathToUsers < ActiveRecord::Migration
  def change
    add_column :users, :avatar_path, :string, comment: '头像路径'
  end
end
