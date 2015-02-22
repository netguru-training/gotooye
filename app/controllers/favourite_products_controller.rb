class FavouriteProductsController < ApplicationController
  before_action :authenticate_user!
  
  def create
   FavouriteProduct.create(favourites_hash)
   render nothing: true, status: :ok
  end

  def destroy
    FavouriteProduct.find_by!(favourites_hash).destroy
    render nothing: true, status: :ok
  end

  def favourites_hash
    { user_id: params[:user_id], product_id: params[:product_id] }
  end
end
