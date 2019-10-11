require 'faker'

category_list = %w[chinese italian japanese french belgian]

15.times do
  restaurant = Restaurant.new(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    category: category_list.sample,
    phone_number: Faker::PhoneNumber.phone_number
  )
  restaurant.save!
  3.times do
    review = Review.new(
      content: Faker::Restaurant.review,
      rating: rand(0..5),
      restaurant_id: restaurant.id
    )
    review.save!
  end
end
