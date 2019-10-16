# frozen_string_literal: true

module FriendRequestsHelper
  def notification(user)
    FriendRequest.where(friend: user).count
  end
end
