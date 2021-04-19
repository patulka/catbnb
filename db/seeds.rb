# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "Cleaning database"
Booking.destroy_all
Cat.destroy_all
User.destroy_all

puts "Seeding users..."

user_ids = [] # needed for randomisation of cats and bookings later
10.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: "secret",
    username: Faker::Movies::LordOfTheRings.character.downcase.split.first
    )
  user_ids << user.id
end

puts "Users created."
puts "Seeding cats..."

cats = [] # needed for randomisation of bookings later
30.times do
  cat = Cat.create!(
    name: Faker::Name.first_name,
    breed: Faker::Creature::Cat.breed,
    color: Faker::Color.color_name,
    # may be shortened later
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat...",
    user_id: user_ids.sample
    )
    cats << cat
end

puts "Cats created."
puts "Seeding bookings..."


10.times do
  date = Faker::Date.in_date_period
  cat = cats.sample
  # Avoid having the same user *owning* and *renting* a cat.
  possible_user_ids = user_ids.select{|id| id != cat.user_id}

  booking = Booking.create!(
    cat_id: cat.id,
    user_id: user_id = possible_user_ids.sample,
    # Random date in current year
    date_from: date,
    date_to: date + 7
    )
end

puts "Bookings created."
puts "Seeding finished."
