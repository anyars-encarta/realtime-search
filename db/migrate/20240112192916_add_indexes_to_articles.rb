class AddIndexesToArticles < ActiveRecord::Migration[7.1]
  def change
    add_index :articles, :title
    add_index :articles, :content
  end
end
