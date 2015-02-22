class AddCaloriesToServingsWithFloat < ActiveRecord::Migration
  def change
    add_column :servings, :calories, :float
  end
end
