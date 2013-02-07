class AddMoralToExperience < ActiveRecord::Migration
  def change
    add_column :experiences, :moral, :string
  end
end
