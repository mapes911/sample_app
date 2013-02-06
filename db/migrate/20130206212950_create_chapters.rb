class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.string :title
      t.integer :order_by
      t.text :body
      t.integer :experience_id

      t.timestamps
    end
  end
end
