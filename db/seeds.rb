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

10.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: "secret",
    username: Faker::Movies::LordOfTheRings.character.downcase.split.first
    )
end

puts "Users created."
puts "Seeding cats..."

cities = ["Zurich", "Geneva", "Lucerne", "Winterthur", "Basel", "La Chaux-de-Fonds", "Bern", "Chur"]

30.times do
  cat = Cat.new(
    name: Faker::Name.first_name,
    breed: Faker::Creature::Cat.breed,
    color: Faker::Color.color_name,
    age: rand(0..30),
    city: cities.sample,
    description: "My favourite food is #{Faker::Food.dish}. I like to sleep on #{Faker::House.furniture} and play #{Faker::Team.sport} outside. I live by this motto: #{Faker::TvShows::Simpsons.quote}"
    )
  cat.picture_url = Faker::LoremFlickr.image(size: "640x480", search_terms: ['cat', cat.breed.split[0]])
  cat.user = User.all.sample
  cat.save!
end

puts "Cats created."
puts "Seeding bookings..."


10.times do
  date = Faker::Date.in_date_period

  booking = Booking.new(
    # Random date in current year
    date_from: date,
    date_to: date + 7
    )
    booking.cat = Cat.all.sample
    booking.user = User.all.select{|user| user != booking.cat.user }.sample
    booking.save!
end

puts "Bookings created."
puts "Seeding finished."
