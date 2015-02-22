# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Users
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

User.create(
  name: "Example User",
  email: "example@mail.com",
  password: "12345678",
  password_confirmation: "12345678"
)

users = []
10.times do 
  users << User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: "12345678",
    password_confirmation: "12345678"
  )
end

#Products
egg = Product.create(name: "Egg")
tomato = Product.create(name: "Tomato")

#Servings
egg.servings.create(
  name: "100g",
  protein: 70.0,
  carbs: 10.0,
  fat: 20.0,
  calories: 200.0,
  id: 20
)
egg.servings.create(
  name: "piece",
  protein: 30.0,
  carbs: 6.0,
  fat: 11.0,
  calories: 100.0,
  id: 21
)

tomato.servings.create(
  name: "100g",
  protein: 40.0,
  carbs: 50.0,
  fat: 10.0,
  calories: 20.0,
  id: 23
)
tomato.servings.create(
  name: "piece",
  protein: 25.0,
  carbs: 26.0,
  fat: 4.0,
  calories: 10.0,
  id: 24
)

recipe = Recipe.create(
  name: "Jajecznica z pomidorami",
  desc: Faker::Lorem.sentence,
  user: user
)

tomatos_for_scrambbledeggs = RecipeProduct.create(
  product_id: tomato.id,
  serving_id: 24,
  serving_count: 3,
  recipe_id: recipe.id
)

eggs_for_scrambbledeggs = RecipeProduct.create(
  product_id: egg.id,
  serving_id: 20,
  serving_count: 2,
  recipe_id: recipe.id
)

recipe_tomato = Recipe.create(
  name: "Tomato salad",
  desc: Faker::Lorem.sentence,
  user: user
)

tomatos_for_salad = RecipeProduct.create(
  product_id: tomato.id,
  serving_id: 23,
  serving_count: 13,
  recipe_id: recipe_tomato.id
)

  rand(3..6).times do
    recipe.steps << Step.create(
      description: Faker::Lorem.sentence
    )
  end
