# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

admin = User.create(name: 'admin', lastname: 'admin', email: 'admin@admin.com', password: 'adminadmin',
                    rol: :administrador)
User.create(name: 'Gianlucas', lastname: 'Galati', email: 'gianlucas@gmail.com', 
            password: '123',rol: :administrador)
User.create(name: 'Camila', lastname: 'Tisera', email: 'camila@gmail.com', 
            password: '123',rol: :administrador)

30.times do
  User.create(
    name: Faker::Name.first_name,
    lastname: Faker::Name.last_name,
    email: Faker::Internet.unique.email,
    password: 'holahola'
  )
end

30.times do
  Student.create(
    name: Faker::Name.first_name,
    lastname: Faker::Name.last_name,
    birthday: Faker::Date.birthday,
    address: Faker::Address.full_address,
    school_grade: Faker::Number.within(range: 0..2),
    currently_studying: Faker::Boolean.boolean,
    user_id: 1
  )
end
