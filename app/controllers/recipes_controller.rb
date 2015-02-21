class RecipesController < ApplicationController
  expose(:recipes)
  expose(:recipe, attributes: :recipe_params)

  def create
    if recipe.save
      redirect_to recipe, notice: 'Recipe was successfully created.'
    else
      render action: 'new'
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :desc)
  end

end
