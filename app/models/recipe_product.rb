class RecipeProduct < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :product
  belongs_to :serving

  validates :product, presence: true
  validates :serving, presence: true
  validates :serving_count, presence: true, numericality: true

end
