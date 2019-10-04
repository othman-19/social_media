# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Comment, type: :model do
  describe 'Comment model validation' do
    let(:comment) { FactoryBot.create(:comment) }
    let(:comment_big_content) { FactoryBot.build(:comment_big_content) }

    it 'has a valid factory' do
      expect(comment).to be_valid
    end

    it 'is invalid without a body' do
      comment.body = nil
      expect(comment).to_not be_valid
    end

    it 'is invalid without a user_id' do
      comment.user_id = nil
      expect(comment).to_not be_valid
    end

    it 'is invalid without a post_id' do
      comment.post_id = nil
      expect(post).to_not be_valid
    end

    it 'is invalid with content above three hundred(200) characters of length' do
      expect(comment_big_content).to_not be_valid
    end
  end
  describe 'Comment model associations' do
    it 'belongs to user' do
      assc = Comment.reflect_on_association(:user)
      expect(assc.macro).to eq :belongs_to
    end
    it 'belongs to post' do
      assc = Comment.reflect_on_association(:post)
      expect(assc.macro).to eq :belongs_to
    end
  end
end

