class AddTagsToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :tags, :integer
    add_index :articles , :tags
  end
end
