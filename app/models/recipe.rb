class Recipe < ActiveRecord::Base
  validates :name, presence: true
  has_many :servings

  attr_accessor :ingredients

end
