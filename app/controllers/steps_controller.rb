class StepsController < ApplicationController

  expose :recipe
  expose(:step, attributes: :step_params)

  def create
    recipe.steps << step
    if step.save!
      flash[:notice] = "step created"
      redirect_to recipe
    else
      flash[:alert] = "step not saved"
      render 'new'
    end
  end

  private

    def step_params
      params.require(:step).permit(:description)
    end
end
