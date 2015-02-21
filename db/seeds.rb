# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
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

