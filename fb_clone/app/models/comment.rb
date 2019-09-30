class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 300 }
  validates :post_id, presence: true

  scope :recent, -> {order('created_at DESC')}
end
