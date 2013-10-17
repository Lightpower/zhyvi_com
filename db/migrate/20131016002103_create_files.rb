class CreateFiles < ActiveRecord::Migration
  def change
    create_table :files do |t|
      t.string :file_type,    null: false
      t.string :url,          null: false

      t.references :user
    end

    add_index :files, :user_id
  end
end
