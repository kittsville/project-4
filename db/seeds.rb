# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

restaurants = [
	[{name: 'Pizza Express', address: '22 King Street, Aberdeen, AB24 5KG'}, [
		{name: 'Garlic Dough Balls', price: 3.99, cat: 1},
		{name: 'Mini Pizzas', price: 4.99, cat: 1},
		{name: 'Soup', price: 5.99, cat: 1},
		{name: 'Classic Margherita Pizza', price: 10.99, cat: 2},
		{name: 'Spicy American Pizza', price: 13.99, cat: 2},
		{name: 'Mighty Veg Pizza', price: 11.99, cat: 2},
		{name: 'Macaroni', price: 8.49, cat: 2},
		{name: 'Vanilla Ice Cream', price: 5.99, cat: 3},
		{name: 'Kinky Ice Cream', price: 6.99, cat: 3},
		{name: 'Sticky Toffee Pudding', price: 5.99, cat: 3},
		{name: 'Garlic Bread', price: 3.99, cat: 4},
		{name: '1L Fanta', price: 4.99, cat: 4},
		{name: '1L Coke', price: 4.99, cat: 4},
	]],
	[{name: 'Tim\'s Burgers', address: '13 Orchard Street, Aberdeen, AB24 3DL'}, [
		{name: 'Mini Burgers', price: 3.99, cat: 1},
		{name: 'Regular Burger', price: 5.99, cat: 2},
		{name: 'Mega Burger', price: 7.99, cat: 2},
		{name: 'The Epic Burger', price: 10.99, cat: 2},
		{name: 'Veggie Burger', price: 6.99, cat: 2},
		{name: 'Chocolate Icecream', price: 5.99, cat: 3},
		{name: 'Garlic Bread', price: 3.99, cat: 4},
		{name: 'Chips', price: 4.99, cat: 4},
		{name: '1L Fanta', price: 4.99, cat: 4},
		{name: '1L Coke', price: 4.99, cat: 4},
	]],
	[{name: 'Kim\'s Chinese Takeaway', address: '23 South Drive, Aberdeen, AB24 R32'}, [
		{name: 'Mini Spring Rolls', price: 2.99, cat: 1},
		{name: 'Mini Veg Spring Rolls', price: 2.99, cat: 1},
		{name: 'Sweet and Sour Soup', price: 4.99, cat: 1},
		{name: 'Mini Crispy Duck', price: 5.99, cat: 1},
		{name: 'Crispy Roast 1/4 Duck', price: 5.99, cat: 2},
		{name: 'Crispy Roast 1/2 Duck', price: 7.99, cat: 2},
		{name: 'Crispy Roast 3/4 Duck', price: 8.99, cat: 2},
		{name: 'Crispy Roast Full Duck', price: 10.99, cat: 2},
		{name: 'Sweet and Sour Beef', price: 6.99, cat: 2},
		{name: 'Coconut Chicken', price: 7.99, cat: 2},
		{name: 'Sweet Rice', price: 6.99, cat: 3},
		{name: 'Plain Rice', price: 4.99, cat: 4},
		{name: 'Bane Rice', price: 4.99, cat: 4}, # You merely adported the rice, HE WAS BORN IN IT
		{name: 'Singapore Rice Noodles', price: 6.99, cat: 4},
		{name: '1L Fanta', price: 4.99, cat: 4},
		{name: '1L Coke', price: 4.99, cat: 4}
	]]
]

drivers = [
  {fname: 'Frank', lname: 'Underwood', username: 'underwood', password: 'underwood', available: 'true'}
  ]

# Iterates over all restaurants, creating them and adding their items
restaurants.each do |restaurantData|
	# Creates the restaurant
	restaurant = Restaurant.create!( restaurantData[0] )
	puts "Restaurant '#{restaurant['name']}' created"
	# Iterates over restaurant's items. Adding them to the items table with a foreign key pointing to their respective restaurant
	restaurantData[1].each do |item|
		item['restaurant_id'] = restaurant.id
		
		Item.create!(item)
	end
	puts "#{restaurantData[1].length} Items added to restaurant menu"
end

drivers.each do |driver|
  Driver.create(driver)
end
