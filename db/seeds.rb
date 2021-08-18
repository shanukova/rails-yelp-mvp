# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database..."
Restaurant.destroy_all
Review.destroy_all

puts "Creating restaurants..."
pizza_east = { name: "Pizza East", address: "NYC", phone_number: "+1 745 344 6253", category: "italian" }
tea_time = { name: "Dishoom", address: "London", phone_number: "+44 745 344 6253", category: "belgian" }
la_luna = { name: "La Luna", address: "Paris", phone_number: "+33 745 344 6253", category: "french" }
sushi_love = { name: "Sushi Love", address: "Tokyo", phone_number: "+81 745 344 6253", category: "japanese" }
oriental_star = { name: "Oriental Star", address: "Beijing", phone_number: "+86 745 344 6253", category: "chinese" }

[pizza_east, tea_time, la_luna, sushi_love, oriental_star].each do |attributes|
  restaurant = Restaurant.create!(attributes)
  puts "Created #{restaurant.name}, #{restaurant.id}"
end

puts 'Creating reviews...'
review_a = Review.new(content: 'it was excellent', rating: 5)
review_b = Review.new(content: 'it was good', rating: 4)
review_c = Review.new(content: 'it was OK', rating: 3)
review_d = Review.new(content: 'it was excellent', rating: 5)
review_e = Review.new(content: 'it was really nice', rating: 4)

review_a.restaurant_id = Restaurant.first.id
review_b.restaurant_id = Restaurant.first.id
review_c.restaurant_id = Restaurant.first.id
review_d.restaurant_id = Restaurant.last.id
review_e.restaurant_id = Restaurant.last.id

review_a.save
review_b.save
review_c.save
review_d.save
review_e.save

puts 'Done!'
