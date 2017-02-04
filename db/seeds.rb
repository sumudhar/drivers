# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

1.upto(50000) do |i|
  Driver.create({first_name: 'driver', last_name: i ,phone: 9000000000+i})
  puts "Driver #{i} creating"
end