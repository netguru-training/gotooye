class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.text :description
      t.references :recipe, index: true

      t.timestamps null: false
    end
    add_foreign_key :steps, :recipes
  end
end
