module RecipeHelper

  def ingredients
    Product.by_name
  end
end
