class CreateRecipeProducts < ActiveRecord::Migration
  def change
    create_table :recipe_products do |t|
      t.belongs_to :recipe, index: true
      t.belongs_to :product, index: true

      t.timestamps null: false
    end
  end
end
