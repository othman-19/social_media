# frozen_string_literal: true

require 'rails_helper'

# creating friend request.
RSpec.describe 'Friend request', type: :feature do
  let(:user3){ User.create( name: 'username3', email: 'useremail3@gmail.com', password: 'password') }
  let(:friend3){ User.create( name: 'friendname3', email: 'friendemail3@gmail.com', password: 'password') }
  let(:friend_request3){ user3.friend_requests.create(friend: friend3) }
  scenario 'creating friend request' do
    def accept_request
      friend_request3.accept
    end
    expect{ accept_request }.to change(user3.friends, :count).by(1)
    sleep(3)
  end

  scenario 'Creating mutual friends' do
    friend_request3.accept
    expect( user3.friends.include?(friend3) && friend3.friends.include?(user3) ).to be(true)
    sleep(3)
  end
end
