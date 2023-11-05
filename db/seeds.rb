# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# Department data to be seeded
# db/seeds.rb

# Seed data for departments
departments = [
  { name: 'Sales' },
  { name: 'Marketing' },
  { name: 'Engineering' },
  { name: 'Human Resources' },
]

departments.each do |department_data|
  Department.create(department_data)
end

# Seed data for users
users = [
  { email: 'user1@example.com', password: 'password1', department_id: Department.find_by(name: 'Sales').id },
  { email: 'user2@example.com', password: 'password2', department_id: Department.find_by(name: 'Sales').id },
  { email: 'user3@example.com', password: 'password3', department_id: Department.find_by(name: 'Engineering').id },
  { email: 'user4@example.com', password: 'password4', department_id: Department.find_by(name: 'Human Resources').id },
]

users.each do |user_data|
  User.create(user_data)
end

# Seed data for profiles
profiles = [
  { user: User.find_by(email: 'user1@example.com'), first_name: 'John', last_name: 'Doe', address: '123 Main St', phone_number: '555-123-4567', sns_information: 'Twitter: @johndoe' },
  { user: User.find_by(email: 'user2@example.com'), first_name: 'Jane', last_name: 'Smith', address: '456 Elm St', phone_number: '555-987-6543', sns_information: 'LinkedIn: linkedin.com/in/janesmith' },
  { user: User.find_by(email: 'user3@example.com'), first_name: 'Robert', last_name: 'Johnson', address: '789 Oak St', phone_number: '555-555-5555', sns_information: 'Facebook: facebook.com/robert.johnson' },
  { user: User.find_by(email: 'user4@example.com'), first_name: 'Emily', last_name: 'Wilson', address: '101 Pine St', phone_number: '555-222-3333', sns_information: 'Instagram: @emilywilson' },
]

profiles.each do |profile_data|
  Profile.create(profile_data)
end
