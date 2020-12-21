# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Ingredient.destroy_all
User.destroy_all
puts "cleaned database"

require 'open-uri'
require 'json'
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
html = open(url).read
cocktail_json = JSON.parse(html)
cocktail_json["drinks"].each do |drink|
  Ingredient.create!(name: drink["strIngredient1"])
end
puts "created many ingredients"

mom = User.create!(email: "kzorn@longy.edu", password: "hickleberry")
puts "created Mom"
