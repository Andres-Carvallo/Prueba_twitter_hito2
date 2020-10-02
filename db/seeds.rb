# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Tweet.delete_all
User.delete_all




50.times do
  User.create([{ name: Faker::Name.name, email: Faker::Internet.email, image_url: Faker::LoremPixel.image,  password:"123456" ,password_confirmation:"123456" }])
end

100.times do
    user = rand(50)
    Tweet.create([{ content: Faker::Lorem.paragraph, user_id: user}])
end


