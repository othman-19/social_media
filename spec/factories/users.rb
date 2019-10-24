# frozen_string_literal: true

# spec/factories/contacts.rb
require 'faker'

FactoryBot.define do
  factory :user, class: User do |f|
    f.name { Faker::Name.name }
    f.email { Faker::Internet.email }
    f.password { Faker::Internet.password(min_length: 6, mix_case: true, special_characters: true) }
  end

  factory :user_small_password_length, class: User do |f|
    f.name { Faker::Name.name }
    f.email { Faker::Internet.email }
    f.password { Faker::Internet.password(min_length: 0, max_length: 5, mix_case: true) }
  end

  factory :user_with_blank_password, class: User do |f|
    f.name { Faker::Name.name }
    f.email { Faker::Internet.email }
    f.password { ' ' * (rand 0..20) }
  end

  factory :user_with_nil_password, class: User do |f|
    f.name { Faker::Name.name }
    f.email { Faker::Internet.email }
    f.password { nil }
  end
end
