# frozen_string_literal: true

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n + 1}@google.com"
  password = 'password'
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
  # activated: true,
  # activated_at: Time.zone.now
end

users = User.order(:created_at).take(5)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.posts.create!(content: content) }
end
