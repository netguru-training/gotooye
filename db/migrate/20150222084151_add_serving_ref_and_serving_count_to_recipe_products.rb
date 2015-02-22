class AddServingRefAndServingCountToRecipeProducts < ActiveRecord::Migration
  def change
    add_column :recipe_products, :serving_count, :float, default: 0.0
    add_reference :recipe_products, :serving, index: true
  end
end
