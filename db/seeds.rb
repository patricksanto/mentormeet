# Mentorship.destroy_all if Rails.env.development?
Tag.destroy_all
Mentorship.destroy_all

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

tags = ['Arts', 'Business', 'Sports', 'Tech', 'Self-development',
        'Photography', 'Painting', 'Ceramics', 'Spirituality',
        'Career', 'Books', 'Cuisine', 'Illustration', 'Woodwork']

  tags.each do |tag|
    tag = Tag.new(name: tag)
    tag.save!
  end

# 15.times do
#   User.create!(
#     email: Faker::Internet.email,
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     phone: Faker::PhoneNumber.cell_phone,
#     address: Faker::Address.street_address,
#     birthday: Faker::Date.in_date_period(year: 1984, month: 2),
#     city: Faker::Address.city,
#     bio: Faker::Lorem.paragraph,
#     password: '123456'
#   )
# end

# 5.times do
#   new_user = User.new(
#     email: Faker::Internet.email,
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     phone: Faker::PhoneNumber.cell_phone,
#     address: Faker::Address.street_address,
#     birthday: Faker::Date.in_date_period(year: 1984, month: 2),
#     city: Faker::Address.city,
#     bio: Faker::Lorem.paragraph,
#     is_mentor: true,
#     password: '123456'
#   )
#   new_user.save
#   new_mentorship = Mentorship.new(
#     title: Faker::Book.title,
#     content: Faker::Lorem.paragraph(sentence_count: 7),
#     address: Faker::Address.city
#   )
#   new_mentorship.user = new_user
#   new_mentorship.save
# end
