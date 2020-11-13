class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def create
    @cocktail = Cocktail.new(strong_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail.id)
    else
      render :new
    end
  end

  def new
    @cocktail = Cocktail.new
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  private

  def strong_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
