# frozen_string_literal: true
module UsersHelper
  # Returns the Gravatar for the given user.
  def gravatar_for(user, options = { size: 80 })
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: 'gravatar')
  end

  def remove_friend(friend)
    current_user.friends.destroy(friend)
  end
  def get_request(user, friend)
    user.friend_requests.where(friend: friend).first
  end
  def notification(user)
    incoming_count = FriendRequest.where(friend: user).count
  end
end
