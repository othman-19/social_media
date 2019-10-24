# frozen_string_literal: true

require 'rails_helper'
# Update post.
RSpec.describe 'Update post', type: :feature do
  scenario 'Update post' do
    visit authenticated_root_path
    fill_in 'Name', with: 'Tester12'
    fill_in 'Email', with: 'tester12@gmail.com'
    fill_in 'Password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_on 'Sign up'
    fill_in 'post_content', with: 'This is a new post'
    click_on('Post')
    click_on 'Edit'
    fill_in 'post_content', with: 'This is a new post (updated)'
    click_on('Post')
    expect(page).to have_content('Post was successfully updated')
    sleep(2)
  end
end
