class CreateFileLinks < ActiveRecord::Migration
  def change
    create_table :file_links do |t|
      t.string :type,     null: false
      t.string :url,      null: false
      t.references :user, index: true

      t.timestamps
    end
    add_index :file_links, :type
  end
end
