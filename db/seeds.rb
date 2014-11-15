# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email
# Environment variables (ENV['...']) can be set in the file .env file.

User.delete_all


user1 = User.create! :name => 'Kalinda', :email => 'kalinda@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret'
user2 = User.create! :name => 'Anna', :email => 'anna@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret'
user3 = User.create! :name => 'Kate', :email => 'kate@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret'
user4 = User.create! :name => 'Beth', :email => 'beth@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret'
