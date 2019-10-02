# frozen_string_literal: true
# Post Model
class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 300 }
  validate :picture_size

  private

  # Validates the size of an uploaded picture.
  def picture_size
    errors.add(:picture, 'image size could not be more than 5MB') if picture.size > 5.megabytes
  end
end
