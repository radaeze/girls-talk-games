# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(first_name: "Ramia", last_name: "Davis", email: "ramia.davis@gmail.com", password: "1luvvash!",
                                   password_confirmation: "1luvvash!", username: "Admin")
                                   
User.create(first_name: "Hello", last_name: "World", email: "ramdavis@mills.edu", password: "hellohello",
                                   password_confirmation: "hellohello", username: "TestUser")