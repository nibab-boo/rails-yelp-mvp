# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "deleting all records"
Restaurant.destroy_all
Review.destroy_all

restaurants = []
puts "seeding the database with restaurant"
10.times do
  restaurants << Restaurant.create(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_name,
    category: ["chinese", "italian", "japanese", "french", "belgian"].sample,
    phone_number: Faker::PhoneNumber.cell_phone
  )
end

puts "seeding the database with review"
20.times do
  Review.create(
    content: Faker::Restaurant.review,
    restaurant: restaurants.sample,
    rating: rand(0..5)
  )
end

puts "done done"