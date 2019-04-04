class AddLikesToArticles < ActiveRecord::Migration[5.2]
  def change
  	add_column :articles , :likes , :integer ,:default => 0
  	add_column :articles, :dislikes, :integer, :default => 0
  end
end
