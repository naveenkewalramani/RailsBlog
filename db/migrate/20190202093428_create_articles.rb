class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title, null: false ,default: ""
      t.string :content, null:false ,default:""
      t.string :author, null:false 
      t.timestamps
    end
  end
end
