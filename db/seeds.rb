# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Cocktail.destroy_all
# Dose.destroy_all
# Ingredient.destroy_all

 Ingredient.create(name: "Whisky")
Dose.create(description: "test", ingredient_id: 3, cocktail_id: 23)

# cocktail_list = [{
#   name: "Gin Tonic"
# },
#   {name: "Whisky Sour"
# },
#   {name: "Caipirinha"
# },
#   {name: "Cosmopolitan"
# },
#   {name: "Negroni"
# }]

# Cocktail.create(cocktail_list)

require 'json'
require 'open-uri'
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
user_serialized = open(url).read
user = JSON.parse(user_serialized)
user["drinks"].each do |i|
 ingredient = Ingredient.new
 ingredient[:name] = i["strIngredient1"]
 ingredient.save!
end

