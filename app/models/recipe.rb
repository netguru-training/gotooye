class Recipe < ActiveRecord::Base
  validates :name, presence: true
  has_many :recipe_products, dependent: :destroy
  has_many :products, through: :recipe_products
  has_many :steps, dependent: :destroy
  belongs_to :user

  attr_accessor :ingredients
  accepts_nested_attributes_for :recipe_products

  def owner
    if user
      return user.email
    end
    "Unknown"
  end

end
