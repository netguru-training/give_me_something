# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file .env file.

User.delete_all
List.delete_all
Gift.delete_all

User.create!(:name => "Testuser", :email => "testuser@test.com", :password => "password", :password_confirmation => "password")


5.times do
  pass = "password"
  User.create! :name => Faker::Name.name, :email => Faker::Internet.email, :password => pass, :password_confirmation => pass
end

User.all.each do |user|
 3.times {user.lists.create(:name => Faker::Lorem.word)}
end

List.all.each do |list|
  3.times {list.gifts.create(:name => Faker::Lorem.word)}
end

