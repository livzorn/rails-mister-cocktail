class CocktailsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def index
    @cocktails = Cocktail.all
  end

  def create
    @cocktail = Cocktail.new(strong_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail.id)
    else
      redirect_to mix_path
    end
  end

  def new
    @cocktail = Cocktail.new
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    if current_user
      current_user.email == 'kzorn@longy.edu' ? @admin = true : @admin = false
    end
    @dose = Dose.new
  end

  private

  def strong_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
