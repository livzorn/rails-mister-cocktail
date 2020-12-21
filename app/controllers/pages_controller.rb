class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @cocktails = Cocktail.all
  end

  def admin
    @cocktail = Cocktail.new(strong_params)
    if @cocktail.save
      render 'admin'
    else
      render :new
    end

    @ingredient = Ingredient.new(strong_params)
    if @ingredient.save
      render 'admin'
    else
      render :new
    end
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def review

  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
