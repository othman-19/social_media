require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Post model validation' do
    let(:post) { FactoryBot.create(:post)}
    let(:post_big_content) { FactoryBot.create(:post_big_content)}
    it 'has a valid factory' do
      p post
      expect(post).to be_valid
    end

    it "is invalid without a content" do
      post.content = nil
      p post
      expect(post).to_not be_valid
    end
  
    it "is invalid with content above threehundred(300) characters of length" do
      post_big_content.valid?
      expect(post_big_content.errors[:content]).to include("Content is too long")
    end
  end

end

