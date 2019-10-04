# frozen_string_literal: true
require 'faker'
FactoryBot.define do
  factory :like ,class: Like do
    association :user, factory: :user
    association :post, factory: :post
  end
end
