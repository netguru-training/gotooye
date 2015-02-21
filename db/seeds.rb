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
  carb: 10.0,
  fat: 20.0
)
egg.servings.create(
  name: "piece",
  protein: 30.0,
  carb: 6.0,
  fat: 11.0
)

tomato.servings.create(
  name: "100g",
  protein: 40.0,
  carb: 50.0,
  fat: 10.0
)
tomato.servings.create(
  name: "piece",
  protein: 25.0,
  carb: 26.0,
  fat: 4.0
)