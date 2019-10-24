# frozen_string_literal: true

# Comment model
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :user_id, presence: true
  validates :body, presence: true, length: { maximum: 200 }
  validates :post_id, presence: true

  default_scope -> { order(created_at: :desc) }
end
