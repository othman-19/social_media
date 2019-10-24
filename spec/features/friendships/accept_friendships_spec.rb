# frozen_string_literal: true

require 'rails_helper'

# creating friend request.
RSpec.describe 'Friendship', type: :feature do
  let(:user4) { User.create(name: 'username4', email: 'useremail4@gmail.com', password: 'password') }
  let(:friend4) { User.create(name: 'friendname4', email: 'friendemail4@gmail.com', password: 'password') }
  let(:friend_request4) { user4.friend_requests.create(friend: friend4) }
  scenario 'Creating mutual friends' do
    friend_request4.accept
    expect(user4.friends.include?(friend4) && friend4.friends.include?(user4)).to be(true)
    sleep(3)
  end
end
