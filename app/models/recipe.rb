class Recipe < ActiveRecord::Base
  validates :name, presence: true
  has_many :recipe_products
  has_many :products, through: :recipe_products
  has_many :steps

  attr_accessor :ingredients

end
