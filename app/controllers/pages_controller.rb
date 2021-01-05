class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :about]

  def home
    @cocktails = Cocktail.all
    if current_user
      current_user.email == 'kzorn@longy.edu' ? @admin = true : @admin = false
    end
  end

  def about
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
