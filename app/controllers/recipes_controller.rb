class RecipesController < ApplicationController
  expose(:recipes)
  expose(:recipe, attributes: :recipe_params)
  expose(:steps){recipe.steps}

  def create
    if recipe.save
      redirect_to recipes_path, notice: 'Recipe was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if recipe.update(recipe_params)
      redirect_to recipes_path, notice: 'Recipe was successfully created.'
    else
      render action: 'edit'
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
      :recipe_products_attributes => [:id, :product_id, :serving_id, :serving_count])
  end

end
