class Recipe < ActiveRecord::Base
  validates :name, presence: true
  attr_accessor :ingredients
end
