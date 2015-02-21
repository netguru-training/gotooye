class ServingsController < ApplicationController
  expose(:serving)
  expose(:sevings)
  expose(:product)

  def new
  end

  def create
    self.serving = product.servings.new(serving_params)
    if serving.save
      redirect_to products_path, flash: { notice: "Product's serving successfully added!" }
    else
      render action: 'new'
    end
  end

  private 

    def serving_params
      params.require(:serving).permit(:name, :protein, :fat, :carb)
    end
end
