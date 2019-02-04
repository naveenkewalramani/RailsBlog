class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
    	t.string :tag_name, presence: true, uniqueness: true
    end
    add_index :tags , :tag_name
  end
end
