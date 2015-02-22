class RemoveCaloriesFromServings < ActiveRecord::Migration
  def change
    remove_column :servings, :calories
  end
end
