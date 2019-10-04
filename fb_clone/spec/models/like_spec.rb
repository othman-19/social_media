# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Like, type: :model do
  describe 'Like model validation' do

    let(:like) { FactoryBot.create(:like) }

    it 'has a valid factory' do
      expect(like).to be_valid
    end

    it 'is invalid without a user_id' do
      like.user_id = nil
      expect(like).to_not be_valid
    end

    it 'is invalid without a post_id' do
      like.post_id = nil
      expect(like).to_not be_valid
    end
  end
  describe 'Like model associations' do
    it 'belongs to user' do
      assc = Like.reflect_on_association(:user)
      expect(assc.macro).to eq :belongs_to
    end
    it 'belongs to post' do
      assc = Like.reflect_on_association(:post)
      expect(assc.macro).to eq :belongs_to
    end
  end
end

