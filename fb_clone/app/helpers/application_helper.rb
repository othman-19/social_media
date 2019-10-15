# frozen_string_literal: true

module ApplicationHelper
  def notification(user)
    incoming_count = FriendRequest.where(friend: user).count
    end
end
