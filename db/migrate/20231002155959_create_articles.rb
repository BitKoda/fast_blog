class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.string :subtitle
      t.text :content, null: false

      t.timestamps
    end
    add_index :articles, :title, unique: true
  end
end
