class Product < ActiveRecord::Base
  has_many :servings
  has_many :recipe_products
  has_many :recipes, through: :recipe_products
end