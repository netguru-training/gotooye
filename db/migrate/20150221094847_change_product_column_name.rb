class ChangeProductColumnName < ActiveRecord::Migration
  def change
    rename_column :products, :CreateProducts, :name
  end
end
