class AddIsShownToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :is_shown, :boolean, default: false, comment: '默认不显示，后期自己选择是否显示'
  end
end
