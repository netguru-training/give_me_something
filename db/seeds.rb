# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file .env file.


User.create(:name => "Testuser", 
  :email => "testuser@test.com", 
  :password => "password", 
  :password_confirmation => "password")
User.create(:name => "Testuser2", 
  :email => "testuser2@test.com", 
  :password => "password", 
  :password_confirmation => "password")


10.times do
  pass = "password"
  User.create! :name => Faker::Name.name, 
    :email => Faker::Internet.email, 
    :password => pass, 
    :password_confirmation => pass
end

User.all.each do |user|
 3.times {user.lists.create(:name => Faker::Company.catch_phrase)}
end

List.all.each do |list|
  Random.rand(5..15).times do
    buyer = if [true, false].sample
      User.all.sample
    else
      nil
    end
    list.gifts.create(:name => Faker::Company.catch_phrase, :description => Faker::Lorem.paragraph, :buyer => buyer)
  end
end

