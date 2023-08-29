class AddCommentUserToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :comment_user, index: true, foreign_key: true
  end
end
