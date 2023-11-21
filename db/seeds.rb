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

  affiliations = [
  "株式会社アルファエンタープライズ",
  "九州アルファ株式会社",
  "株式会社アルファロッカーシステム",
  "ALPHA TECHNOLOGY CORPORATION",
  "ALPHA INDUSTRY QUERETARO, S.A. DE C.V.",
  "ALPHA INDUSTRY（THAILAND）CO.,LTD.",
  "ALPHA (SHANGHAI) LOCK CO.,LTD."
]



  if user.errors.any?
    puts "Failed to create user: #{user.errors.full_messages.join(", ")}"
  else
    user.profile.update(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      address: Faker::Address.street_address,
      affiliation: affiliations.sample,
      phone_number: Faker::PhoneNumber.phone_number,
      mobile: Faker::PhoneNumber.cell_phone,
      company_phone: Faker::PhoneNumber.phone_number,
      private_phone: Faker::PhoneNumber.phone_number,
      sns_information: Faker::Internet.username,
      created_at: Time.now,
      updated_at: Time.now
    )
  end
end
