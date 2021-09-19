# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

#ROLES
admin = Role.create!(
    name: "admin" ,
    description: "an admin user cans access to: categories#delete,#index,
    users#index ..."
)

regular = Role.create!(
    name: "regular" ,
    description: "a regular user cans access to: users#update ..."
)

#USERS
5.times do
    users = User.create!(
        firstName: Faker::Name.first_name ,
        lastName: Faker::Name.last_name,
        email: Faker::Name.first_name+"@email.com",
        password: "123",
        photo: Faker::Book.title,
        role: admin
    )
end

5.times do
    users = User.create!(
        firstName: Faker::Name.first_name ,
        lastName: Faker::Name.last_name,
        email: Faker::Name.first_name+"@email.com",
        password: "1234",
        photo: Faker::Book.title,
        role: regular
    )
end

#CATEGORIES
10.times do
    categories = Category.create!(
        name: Faker::Book.title,
        description: Faker::Quote.famous_last_words,
        image: nil
    )
end    

p "Creados #{User.count} usuarios y #{Category.count} categorias"



#Faker::Name.name      #=> "Christophe Bartell"
#Faker::Internet.email #=> "kirsten.greenholt@corkeryfisher.info"

