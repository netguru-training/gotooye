class TemplateController < ApplicationController

  def display_product_servings
    if Product.exists?(params[:product_id])
      @product = Product.find(params[:product_id])
      render :display_product_servings, layout: false
    else
      render nothing: true, status: 422
    end
  end

  def display_favourites_products
    @user = User.find(params[:user_id])
    render partial: 'products/favourite_products', layout: false
  end

  def current_user
    @user
  end
end
