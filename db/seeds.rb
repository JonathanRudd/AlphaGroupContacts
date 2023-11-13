require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# departments.rb (seed for departments)
Department.create(name: 'Sales', created_at: Time.now, updated_at: Time.now)
Department.create(name: 'Engineering', created_at: Time.now, updated_at: Time.now)
Department.create(name: 'Human Resources', created_at: Time.now, updated_at: Time.now)


# users.rb (seed for users)
50.times do |i|
  user = User.create!(
    email: "user#{i + 1}@example.com",
    password: 'password123',
    password_confirmation: 'password123',
    created_at: Time.now,
    updated_at: Time.now,
    department_id: Department.all.sample.id
  )

  if user.errors.any?
    puts "Failed to create user: #{user.errors.full_messages.join(", ")}"
  else
    user.profile.update(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      address: Faker::Address.street_address,
      phone_number: Faker::PhoneNumber.phone_number,
      sns_information: Faker::Internet.username,
      created_at: Time.now,
      updated_at: Time.now
    )
  end
end
