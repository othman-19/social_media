# frozen_string_literal: true

require 'rails_helper'

# creating friend request.
RSpec.describe 'Friend request', type: :feature do
  let(:user2) { User.create(name: 'username2', email: 'user2email@gmail.com', password: 'password') }
  let(:friend2) { User.create(name: 'friendname2', email: 'friend2email@gmail.com', password: 'password') }
  let(:friend_request2) { user2.friend_requests.create(friend: friend2) }
  scenario 'deleating friend request' do
    friend_request2.save
    def delete_request
      user2.friend_requests.destroy(friend_request2)
    end
    expect { delete_request }.to change(user2.friend_requests, :count).by(-1)
    sleep(3)
  end
end
