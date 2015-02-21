class AddDefaultsToServingsColumns < ActiveRecord::Migration
  def change
    change_column_default :servings, :protein, 0
    change_column_default :servings, :fat,     0
    change_column_default :servings, :carb,    0
  end
end
