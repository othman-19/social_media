# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Post model validation' do
    let(:post) { FactoryBot.create(:post) }
    let(:post_big_content) { FactoryBot.build(:post_big_content) }

    it 'has a valid factory' do
      expect(post).to be_valid
    end

    it 'is invalid without a content' do
      post.content = nil
      expect(post).to_not be_valid
    end

    it 'is invalid without a user_id' do
      post.user_id = nil
      expect(post).to_not be_valid
    end

    it 'is invalid with content above three hundred(300) characters of length' do
      expect(post_big_content).to_not be_valid
    end
  end
  describe 'User model associations' do
    it 'belongs to user' do
      assc = Post.reflect_on_association(:user)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
