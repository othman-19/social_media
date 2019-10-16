# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Friendship', type: :feature do
    let (:user5) {User.create(name: 'username5', email: 'useremail5@gmail.com', password: 'password')}
    let (:friend5) {User.create(name: 'friendname5', email: 'friendemail5@gmail.com', password: 'password')}
    let(:friend_request5) {user5.friend_requests.create(friend: friend5)}
    scenario 'destroy mutual friends' do
      user5.remove_friend(user5, friend5)
      expect( (!user5.friends.include?(friend5) && !friend5.friends.include?(user5)) ).to be(true)
      sleep(3)
    end
  end
