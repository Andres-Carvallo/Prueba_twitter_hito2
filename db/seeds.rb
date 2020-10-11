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
  User.create([{ name: Faker::Name.name, email: Faker::Internet.email, avatar_url: Faker::LoremPixel.image,  password:"123456" ,password_confirmation:"123456" }])
end

100.times do
    user = rand(50)
    tweet = rand(50)
    Tweet.create([{ content: Faker::Lorem.paragraph, user_id: user}])
    
end

50.times do
  user = rand(50)
  tweet = rand(100)
  Friend.create([{ user_id: user, friend_id: tweet }])
end

100.times do
  user = rand(50)
  Friend.create([{ user_id: user}])
end


Tweet.create([{ content: Faker::Lorem.paragraph, user_id: 1, origin_tweet: 2}])
Tweet.create([{ content: Faker::Lorem.paragraph, user_id: 2, origin_tweet: 2}])


AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
