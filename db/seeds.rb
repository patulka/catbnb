# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "Cleaning database"
Cat.destroy_all
User.destroy_all

puts "Seeding users..."

10.times do
  user = User.create(
    email: "Faker::Internet.email",
    password: "secret",
    username: ""
    )
end

puts "Users created."

puts "Seeding cats..."

30.times do
  cat = Cat.create(
    name: "Faker::Name.first_name",
    breed: "Faker::Creature::Cat.breed",
    color: "Faker::Color.color_name",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat...",
    user_id: rand(1..30)
    )
end

puts "Cats created."

puts "Seeding bookings..."

date = "Faker::Date.in_date_period"

10.times do
  booking = Booking.create(
    cat_id: rand(1..30),
    user_id: rand(1..10),
    # Random date in current year
    date_from: date,
    date_to: date + 7
    )
end

puts "Bookings created."
puts "Seeding finished."
