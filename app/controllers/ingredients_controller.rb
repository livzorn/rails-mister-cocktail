class IngredientsController < ApplicationController

  def create
    @ingredient = Ingredient.new(strong_params)
    if @ingredient.save
      redirect_to mix_path
    else
      redirect_to mix_path
    end
  end

  private

  def strong_params
    params.require(:ingredient).permit(:name)
  end
end
