class RecipesController < ApplicationController
  expose(:recipes)
  expose(:recipe, attributes: :recipe_params)

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
    recipe.destroy
    redirect_to recipes_path, notice: 'Recipe was destroyed. It was so untasty!'
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :desc)
  end

end
