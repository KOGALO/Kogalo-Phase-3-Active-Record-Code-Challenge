# This will delete any existing rows from the Product and User tables
# so you can run the seed file multiple times without having duplicate entries in your database
puts "Deleting old data..."
Product.destroy_all
User.destroy_all
Review.destroy_all

puts "Creating users..."
user1 = User.create(name: Faker::Name.name)
user2 = User.create(name: Faker::Name.name)
user3 = User.create(name: Faker::Name.name)

puts "Creating products..."
product1 = Product.create(name: "Stapler", price: 10)
product2 = Product.create(name: "Whiteboard", price: 15)
product3 = Product.create(name: "Dry Erase Markers", price: 5)
product4 = Product.create(name: "Ballpoint Pens", price: 2)
product5 = Product.create(name: "Scotch Tape", price: 3)

puts "Creating reviews..."
review1 = Review.create(comment: "Great product!", star_rating: 5, product_id: product1.id, user_id: user1.id)
review2 = Review.create(comment: "Not bad.", star_rating: 3, product_id: product2.id, user_id: user2.id)
review3 = Review.create(comment: "Could be better.", star_rating: 2, product_id: product3.id, user_id: user3.id)
review4 = Review.create(comment: "Love it!", star_rating: 4, product_id: product4.id, user_id: user1.id)
review5 = Review.create(comment: "Excellent value.", star_rating: 5, product_id: product5.id, user_id: user2.id)

puts "Seeding done!"