class RecipesController < ApplicationController
  expose(:recipes)
  expose(:recipe, attributes: :recipe_params)
  expose(:recipe_products, ancestor: :recipe)
  expose(:steps, ancestor: :recipe)

  def show
    sum_nutritional_info
  end

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
      if params["action"] == "create" && current_user
        params["recipe"]["user_id"] ||= current_user.id
      end
      params.require(:recipe).permit(:name, :desc, :user_id,
        { recipe_products_attributes: [:id, :product_id, :serving_id, :serving_count, :recipe_id]}
      )
    end

    def sum_nutritional_info
      @summary = {
        protein: 0.0,
        carbs: 0.0,
        fat: 0.0,
        calories: 0.0,
      }

      recipe_products.each do |rp|
        @summary[:protein] += rp.serving_count * rp.serving.protein
        @summary[:carbs] += rp.serving_count * rp.serving.carbs
        @summary[:fat] += rp.serving_count * rp.serving.fat
        @summary[:calories] += rp.serving_count * rp.serving.calories
      end
    end

end
