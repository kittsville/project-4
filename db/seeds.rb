# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
restaurants = [
	{name: 'Pizza Express', address: '22 King Street, Aberdeen, AB24 5KG'},
	{name: 'Tim\'s Burgers', address: '13 Orchard Street, Aberdeen, AB24 3DL'},
	{name: 'Kim\'s Chinese Takeaway', address: '23 South Drive, Aberdeen, AB24 R32'}
]

restaurants.each do |restaurant|
	Restaurant.create( name: restaurant.name, address: restaurant.address )
end
