class CarbToCarbsInServings < ActiveRecord::Migration
  def change
    rename_column :servings, :carb, :carbs
  end
end
