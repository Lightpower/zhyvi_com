class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :type,        null: false, default: 'Event'
      t.string :title
      t.text :preview
      t.text :data
      t.datetime :start_at,  null: false
      t.datetime :finish_at

      t.references :user,    null: false, index: true

      t.timestamps
    end
    add_index :events, :type
    add_index :events, :start_at
    add_index :events, :finish_at
  end
end
