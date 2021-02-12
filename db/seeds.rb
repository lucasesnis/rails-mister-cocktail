# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
require "open-uri"

file = URI.open('https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png')
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Ingredient.destroy_all
Ingredient.create!(name: "lemon")
Ingredient.create!(name: "ice")
Ingredient.create!(name: "mint leaves")

Cocktail.destroy_all

cocktail = Cocktail.new(name: "Sex on the beach")
cocktail.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
cocktail.save

Dose.destroy_all
Dose.create!(description: '3 teaspoons', cocktail: Cocktail.first, ingredient: Ingredient.first)
