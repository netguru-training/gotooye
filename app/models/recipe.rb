class Recipe < ActiveRecord::Base
  validates :name, presence: true
  has_many :recipe_products
  has_many :products, through: :recipe_products
  has_many :steps

  attr_accessor :ingredients
  accepts_nested_attributes_for :recipe_products

end
