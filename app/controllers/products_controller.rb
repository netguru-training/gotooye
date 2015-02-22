class ProductsController < ApplicationController
  before_action :authenticate_user!

  expose(:products)
  expose(:product, attributes: :product_params)

  def index
  end

  def new
  end

  def create
    if product.save
      redirect_to products_path, flash: { notice: 'Product successfully added!' }
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if product.save
      redirect_to products_path, flash: { notice: 'Product successfully edited!' }
    else 
      render action: 'edit'
    end
  end

  def destroy
    if product.destroy
      redirect_to products_path, flash: { notice: 'Product successfully deleted!' }
    else 
      redirect_to products_path, flash: { error: "Could not delete product!" }
    end
  end

  private

    def product_params
      params.require(:product).permit(:name)
    end

end
