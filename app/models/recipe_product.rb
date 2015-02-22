class RecipeProduct < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :product
  belongs_to :serving

end
