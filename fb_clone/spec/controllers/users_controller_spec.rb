# frozen_string_literal: true

require 'rails_helper'
RSpec.describe PostsController, type: :controller do
  context 'DELETE #destroy' do
    creator = User.create(name: 'creator', email: 'creaor@gmail.com', password: 'password')
    new_post = creator.posts.create(content: 'new post')
    creator.save
    new_post.save
    login_user

    it 'A user cannot delete a post created by other user' do
      p new_post
      expect { delete :destroy, params: { id: new_post } }.to change(Post, :count).by(0)
      # expect(flash[:notice]).to eq 'Product was successfully deleted.'
    end
  end
end
