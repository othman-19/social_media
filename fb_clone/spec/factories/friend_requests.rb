# frozen_string_literal: true

FactoryBot.define do
  factory :friend_request do
    user { nil }
    friend { nil }
  end
end
