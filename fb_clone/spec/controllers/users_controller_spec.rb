# frozen_string_literal: true

require 'rails_helper'
RSpec.describe PostsController, type: :controller do
  context  'DELETE#destroy' do
    let(:user1) {User.create(name:"John", email:"john@mail.com", password:"password")}
    let(:creator) { User.create(name: "creator", email: "creaor@gmail.com", password: "password") }
    let(:new_post){creator.posts.create(content: "Neque porro quisquam est qui dolorem ipsum")}
    
    it 'A user cannot delete a post created by other user' do
      new_post.save
      sign_in user1
      expect { delete :destroy, params: { id: new_post.id } }.to change(Post, :count).by(0)
      #expect(flash[:notice]).to eq 'Product was successfully deleted.'
    end
  end
end

