class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.references :event,    index: true,   null: false
      t.references :user,     index: true,   null: false
      t.references :file,     index: true
      t.text       :data
      t.boolean    :selected, default: false

      t.timestamps
    end
  end
end
