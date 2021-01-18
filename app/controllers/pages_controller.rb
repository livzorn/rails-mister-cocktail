class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :about]

  def home
    @cocktails = Cocktail.all
    if current_user
      current_user.email == 'kzorn@longy.edu' ? @admin = true : @admin = false
    end
  end

  def about
    if current_user
      current_user.email == 'kzorn@longy.edu' ? @admin = true : @admin = false
    end
  end

  def mix
    @cocktail = Cocktail.new
    @ingredient = Ingredient.new
    if current_user
      current_user.email == 'kzorn@longy.edu' ? @admin = true : @admin = false
    end
  end

  def review
  end
end
