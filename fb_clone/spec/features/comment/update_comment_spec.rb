# frozen_string_literal: true

require 'rails_helper'
# Update post.
RSpec.describe 'Update comment', type: :feature do
  scenario 'Update comment' do
    visit authenticated_root_path
    fill_in 'Name', with: 'Tester16'
    fill_in 'Email', with: 'tester16@gmail.com'
    fill_in 'Password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_on 'Sign up'
    fill_in 'post_content', with: 'This is a new post'
    click_on('Post')
    fill_in 'comment_body', with: 'This is a new comment'
    click_on 'Comment'
    click_on 'Edit comment'
    fill_in 'comment_body', with: 'This is a new comment (updated)'
    click_on('Comment')
    expect(page).to have_content('Comment updated')
    sleep(2)
  end
end
