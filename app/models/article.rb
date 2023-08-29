class Article < ActiveRecord::Base
  has_many :comments
  has_many :comment_users, through: :comments
end
