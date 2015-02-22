class RecipesController < ApplicationController
  expose(:recipes)
  expose(:recipe, attributes: :recipe_params)
<<<<<<< Updated upstream
  expose(:steps, ancestor: :recipe)
=======
  expose(:recipe_products){recipe.recipe_products}
  expose(:steps){recipe.steps}
>>>>>>> Stashed changes

  def create
    if recipe.save!
      render nothing: true, status: :ok
    else
      render nothing: true, status: :unprocessable_entity
    end
  end

  def update
    if recipe.update(recipe_params)
      render nothing: true, status: :ok
    else
      render nothing: true, status: :unprocessable_entity
    end
  end

  def destroy
    if recipe.destroy
      redirect_to recipes_path, notice: 'Recipe was destroyed. It was so untasty!'
    else
      redirect_to recipes_path, alert: 'Could not delete this recipe.'
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :desc,
      { recipe_products_attributes: [:id, :product_id, :serving_id, :serving_count, :recipe_id]}
    )
  end

end
