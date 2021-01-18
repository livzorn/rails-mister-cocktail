class CocktailsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def index
    @cocktails = Cocktail.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(strong_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail.id)
    else
      redirect_to mix_path
    end
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
    if current_user
      current_user.email == 'kzorn@longy.edu' ? @admin = true : @admin = false
    end
    @cocktail.notes.empty? ? @btn_method = "+ add method" : @btn_method = "edit method"
  end

  def edit
    @cocktail = Cocktail.find(params[:id])
  end

  def update
    @cocktail = Cocktail.find(params[:id])
    @cocktail.update(strong_params)
    redirect_to cocktail_path(@cocktail.id)
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
    redirect_to root_path
  end

  private

  def strong_params
    params.require(:cocktail).permit(:name, :photo, :notes)
  end
end
