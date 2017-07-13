# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

user = User.create!(
  first_name: 'Praveen',
  last_name: 'Y',
  email: 'praveen@bloc.io',
  password: 'helloworld',
  confirmed_at: '2016-08-14'
)

5.times do
  RegisteredApplication.create!(
    name: Faker::App.name,
    url:  Faker::Internet.url,
    user: user
  )
end

registered_applications = RegisteredApplication.all

# Create Posts
30.times do
  Event.create!(
    name:  Faker::Hacker.ingverb,
    registered_application:  registered_applications.sample
  )
end


puts "Seed finished"
puts "#{User.count} users created"
puts "#{RegisteredApplication.count} applications created"
puts "#{Event.count} events created"
