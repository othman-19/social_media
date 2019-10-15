# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FriendRequest, type: :model do
  describe 'Friend Request model validation' do
    let(:user1) { FactoryBot.create(:user, email: 'same_email@gmail.com') }
    let(:friend) {FactoryBot.create(:user, name:"friend", password:"password", email:"friendemail@gmail.com")}
    let(:friend_request) { user1.friend_requests.build(friend: friend) }
    
    it 'A user should have a friend' do 
      p friend_request.user
      expect(friend_request.friend).to eq(friend)
    end
    
    it 'Friend request should have user' do
      friend_request.friend = nil
      expect(friend_request).to_not be_valid
    end
  end


  # context 'User associations' do
  #   describe 'User model associations' do
  #     it 'has many posts' do
  #       assc = User.reflect_on_association(:posts)
  #       expect(assc.macro).to eq :has_many
  #     end
  #   end
  # end
end

