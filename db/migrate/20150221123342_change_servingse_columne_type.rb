class ChangeServingseColumneType < ActiveRecord::Migration
  def change
    change_column :servings, :protein, :float
    change_column :servings, :fat,     :float
    change_column :servings, :carb,    :float
  end
end
