class Serving < ActiveRecord::Base
  belongs_to :product
  has_many :recipe_products

  validates :name, presence: true, format: { with: /\A[\w\-\s]+\z/, message: 'only allows letters!' }

end
