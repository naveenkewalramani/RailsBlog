class CreateAuthorArticleCounts < ActiveRecord::Migration[5.2]
  def change
    create_table :author_article_counts do |t|
      t.string :author_name, presence: true, uniqueness: true
      t.integer :count ,presence: true, deafult: 0
      t.timestamps
    end
    add_index  :author_article_counts , :author_name
  end
end
