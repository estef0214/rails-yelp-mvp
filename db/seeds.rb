# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Restaurant.destroy_all
Review.destroy_all

5.times do
  restaurant = Restaurant.new({
    name: Faker::Company.name,
    address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    category: Restaurant::CATEGORY.sample,
    phone_number: Faker::PhoneNumber.phone_number_with_country_code
  }
  )
  restaurant.save!
end

50.times do
  review = Review.new({
    rating: (0..5).to_a.sample,
    content: Faker::Commerce.department,
    restaurant_id: Restaurant.all.sample.id
  })
  review.save!
end

puts Review.all
