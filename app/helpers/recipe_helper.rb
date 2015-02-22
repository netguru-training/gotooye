module RecipeHelper

  def ingredients
    Product.by_name
  end

  def step_expanded?(index)
    result = {
      expanded: "false",
      in: ""
    }

    if index == 0
      result[:expanded] = "true"
      result[:in] = "in"
    end
    result
  end

end
