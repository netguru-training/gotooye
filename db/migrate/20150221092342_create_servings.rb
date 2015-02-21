class CreateServings < ActiveRecord::Migration
  def change
    create_table :servings do |t|
      t.string  :name
      t.integer :protein
      t.integer :fat
      t.integer :carb
      t.integer :product_id
      t.timestamps
    end
  end
end
