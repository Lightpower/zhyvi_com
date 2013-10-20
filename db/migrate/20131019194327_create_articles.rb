class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :type,   default: 'Article'
      t.string :title
      t.text :preview
      t.text :data
      t.references :user, index: true

      t.timestamps
    end
    add_index :articles, :type
  end
end
