# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Friendship, type: :model do
  let(:user1) { FactoryBot.create(:user, email: 'user1email@gmail.com') }
  let(:friend) {FactoryBot.create(:user, name:"friend", password:"password", email:"afriendemail@gmail.com")}
  let(:friendship) { user1.friendships.build(friend: friend) }
  let(:friendship2) { user1.friendships.build(friend: friend) }
  let(:friendship3) { friend.friendships.build(friend: user1) }
  it 'friendship should be valid' do 
    expect(friendship).to be_valid
  end
  
  it 'Friendship should have user' do
    expect(friendship.user).to eq(user1)
  end

  it 'Friend request should have friend' do
    expect(friendship.friend).to eq(friend)
  end

  it 'Friendship should be mutual' do
    friendship.save
    expect(user1.friends.include?(friend) && friend.friends.include?(user1)).to be(true)
  end

  it "User can't be friend to him self" do
    friendship = user1.friendships.build(friend: user1)
    expect(friendship).to_not be_valid
  end

  it "Users can't be friends twice" do
    friendship.save
    friendship2.save
    expect(friendship2).to_not be_valid
  end
  
  context 'Friendship associations' do
    describe 'Friendship model associations' do
      it 'belongs to user' do
        assc = Friendship.reflect_on_association(:user)
        expect(assc.macro).to eq :belongs_to
      end
      it 'belongs to friend' do
        assc = Friendship.reflect_on_association(:friend)
        expect(assc.macro).to eq :belongs_to
      end
    end 
  end
end
