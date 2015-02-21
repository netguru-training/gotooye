class Product < ActiveRecord::Base
  has_many :servings
  has_many :recipe_products
  has_many :recipes, through: :recipe_products

  validates :name, presence: true, format: { with: /\A[\w\-\s]+\z/, message: 'only allows letters!' }
end