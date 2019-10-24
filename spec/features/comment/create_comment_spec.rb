# frozen_string_literal: true

require 'rails_helper'
# Creating comment.
RSpec.describe 'Creating comment', type: :feature do
  scenario 'valid inputs' do
    visit authenticated_root_path
    fill_in 'Name', with: 'Tester13'
    fill_in 'Email', with: 'tester13@gmail.com'
    fill_in 'Password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_on 'Sign up'
    fill_in 'post_content', with: 'This is a new post'
    click_on 'Post'
    fill_in 'comment_body', with: 'This is a new comment'
    click_on 'Comment'
    expect(page).to have_content('Post commented')
    sleep(3)
  end
  scenario 'invalid content' do
    visit authenticated_root_path
    fill_in 'Name', with: 'Tester14'
    fill_in 'Email', with: 'tester14@gmail.com'
    fill_in 'Password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_on 'Sign up'
    fill_in 'post_content', with: 'This is a new post'
    click_on 'Post'
    fill_in 'comment_body', with: ''
    click_on 'Comment'
    expect(page).to have_content('post not commented')
    sleep(3)
  end
end
