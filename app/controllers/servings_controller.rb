class ServingsController < ApplicationController
  expose(:serving, attributes: :serving_params)
  expose(:sevings)
  expose(:product)

  def new
  end

  def create
    if serving.save
      redirect_to products_path, flash: { notice: "Product's serving successfully added!" }
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
    if serving.destroy
      redirect_to products_path, flash: { notice: "Product's serving successfully deleted!" }
    else
      redirect_to products_path, flash: { error: "Could not delete product's serving" }
    end
  end

  private 

    def serving_params
      params.require(:serving).permit(:name, :protein, :fat, :carb, :product_id)
    end
end
