class AddIsTopAritcles < ActiveRecord::Migration
  def change
    add_column :articles, :is_top, :boolean, default: false, comment: '默认不置顶，后期自己选择是否置顶'
  end
end
