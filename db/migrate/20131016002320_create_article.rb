class CreateArticle < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title,   null: false
      t.string :type,    null: false
      t.text   :preview
      t.text   :data

      t.references :user

      t.timestamps
    end

    add_index :articles, :user_id
  end
end
