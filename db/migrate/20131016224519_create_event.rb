class CreateEvent < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string   :type,        null: false
      t.string   :title,       null: false
      t.text     :preview
      t.text     :data
      t.datetime :start_at,    null: false
      t.datetime :finish_at

      t.references :user

      t.timestamps
    end

    add_index :events, :user_id
  end
end
