# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

50.times do |index|
    pass = Faker::Name.unique.name
    User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.unique.email,
             password: pass, password_confirmation: pass, username: Faker::Pokemon.unique.name)
    end
User.create(first_name: "Ramia", last_name: "Davis", email: "ramia.davis@gmail.com", password: "1luvvash!",
                                   password_confirmation: "1luvvash!", username: "Admin")
                                   
User.create(first_name: "Hello", last_name: "World", email: "ramdavis@mills.edu", password: "hellohello",
                                   password_confirmation: "hellohello", username: "TestUser")
                                   
                                