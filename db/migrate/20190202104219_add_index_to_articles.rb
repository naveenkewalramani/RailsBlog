class AddIndexToArticles < ActiveRecord::Migration[5.2]
  def change
    add_index :articles, :title
    add_index :articles, :author
  end
end
