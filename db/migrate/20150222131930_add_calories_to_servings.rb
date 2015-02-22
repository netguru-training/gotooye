class AddCaloriesToServings < ActiveRecord::Migration
  def change
    add_column :servings, :calories, :string, default: 0
  end
end
