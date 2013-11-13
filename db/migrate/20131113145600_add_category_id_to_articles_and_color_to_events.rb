class AddCategoryIdToArticlesAndColorToEvents < ActiveRecord::Migration
  def change
    add_column :articles, :category_id, :integer

    add_index :articles, :category_id

    add_column :events, :color, :string
  end
end
