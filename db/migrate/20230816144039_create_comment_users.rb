class CreateCommentUsers < ActiveRecord::Migration
  def change
    create_table :comment_users do |t|
      t.string :username
      t.string :password
      t.integer :article_id
      t.timestamps
    end
  end
end
