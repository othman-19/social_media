require 'faker'

FactoryBot.define do
  factory :post ,class: Post do |f|
    association :user 
    f.content { Faker::Lorem.sentence(word_count: 2) }
  end
end

FactoryBot.define do
    factory :post_big_content ,class: Post do |f|
      association :user 
      f.content { Faker::Lorem.characters(number: 301) }
    end
end