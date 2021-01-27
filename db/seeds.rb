# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Faker::Config.locale = 'en-US'

User.destroy_all
1000.times do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email,
    title: (Faker::Name.prefix if Faker::Boolean.boolean(true_ratio: 0.8)),
    phone: Faker::PhoneNumber.cell_phone_in_e164,
    active: Faker::Boolean.boolean
  )
end
