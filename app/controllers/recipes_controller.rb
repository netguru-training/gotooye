class RecipesController < ApplicationController
  expose(:recipes)
  expose(:recipe)

  def create
    self.recipe = Recipe.new(recipe_params)
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
