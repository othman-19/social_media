# frozen_string_literal: true

require 'rails_helper'

# creating friend request.
RSpec.describe 'Friend request', type: :feature do
  let(:user1) { User.create(name: 'username1', email: 'useremail1@gmail.com', password: 'password') }
  let(:friend1) { User.create(name: 'friendname1', email: 'friendemail1@gmail.com', password: 'password') }
  scenario 'creating friend request' do
    def create_request
      user1.friend_requests.create(friend: friend1)
    end
    expect { create_request }.to change(user1.friend_requests, :count).by(1)
    sleep(3)
  end
end
