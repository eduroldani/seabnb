# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "Deleting all Users and Boats"

User.destroy_all

puts "Creating 10 Users and 10 Boats"

10.times do
User.create(first_name: Faker::Name.first_name ,
   last_name: Faker::Name.last_name  ,
   email: Faker::Internet.email,
   phone: Faker::PhoneNumber.cell_phone,
   country: Faker::Nation.nationality,
   password: Faker::Internet.password)
end

def user_id
  User.all[rand(0..9)].id
end

10.times do
  Boat.create(name: Faker::GreekPhilosophers.name ,
     description: Faker::Lorem.paragraph  ,
     location: Faker::Address.city ,
     price_per_day: Faker::Number.between(from: 50, to: 500),
     size: Faker::Number.between(from: 10, to: 100),
     max_speed: Faker::Number.number(digits: 3),
     capacity: Faker::Number.number(digits: 2),
     user_id: user_id
    )
  end



puts "Seed File Completed"
