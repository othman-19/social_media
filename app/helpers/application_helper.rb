# frozen_string_literal: true

module ApplicationHelper
  def notification(user)
    FriendRequest.where(friend: user).count
  end
end
