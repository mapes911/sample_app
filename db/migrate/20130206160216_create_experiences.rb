class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :title
      t.string :slug
      t.integer :user_id

      t.timestamps
    end
  end
end
