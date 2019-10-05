# frozen_string_literal: true

require 'faker'
FactoryBot.define do
  factory :comment, class: Comment do |f|
    association :user, factory: :user
    association :post, factory: :post
    f.body { Faker::Lorem.sentence(word_count: 2) }
  end
  factory :comment_big_content, class: Comment do |f|
    association :user, factory: :user
    association :post, factory: :post
    f.body { Faker::Lorem.characters(number: 201) }
  end
end
