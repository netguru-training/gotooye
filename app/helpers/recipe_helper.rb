module RecipeHelper

  def ingredients
    Product.by_name
  end

  def step_expanded?(index)
    result = {
      expanded: "false",
      inn: ""
    }

    if index == 0
      result[:expanded] = "true"
      result[:inn] = "in"
    end
    result
  end

end
