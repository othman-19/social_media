# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FriendRequest, type: :model do
  describe 'Friend Request model validation' do
    let(:user1) { FactoryBot.create(:user, email: 'same_email@gmail.com') }
    let(:friend) { FactoryBot.create(:user, name: 'friend', password: 'password', email: 'friendemail@gmail.com') }
    let(:friend_request) { user1.friend_requests.build(friend: friend) }
    let(:friend_request2) { user1.friend_requests.build(friend: friend) }
    let(:friend_request3) { friend.friend_requests.build(friend: user1) }
    it 'friend_request should be valid' do
      expect(friend_request).to be_valid
    end

    it 'Friend request should have user' do
      expect(friend_request.user).to eq(user1)
    end

    it 'Friend request should have friend' do
      expect(friend_request.friend).to eq(friend)
    end

    it "User can't send friend request for him self" do
      friend_request = user1.friend_requests.build(friend: user1)
      expect(friend_request).to_not be_valid
    end

    it "User can't send friend request twice" do
      friend_request.save
      friend_request2.save
      expect(friend_request2).to_not be_valid
    end
    it "pending friend can't send friend request" do
      friend_request.save
      friend_request3.save
      expect(friend_request3).to_not be_valid
    end
  end

  context 'Friend_request associations' do
    describe 'FriendRequest model associations' do
      it 'belongs to user' do
        assc = FriendRequest.reflect_on_association(:user)
        expect(assc.macro).to eq :belongs_to
      end
      it 'belongs to friend' do
        assc = FriendRequest.reflect_on_association(:friend)
        expect(assc.macro).to eq :belongs_to
      end
    end
  end
end
