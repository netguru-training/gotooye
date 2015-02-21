class ProductsController < ApplicationController
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

  private

    def product_params
      params.require(:product).permit(:name)
    end

end
