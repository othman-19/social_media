# frozen_string_literal: true

require 'rails_helper'
# Delete post.
RSpec.describe 'Delete post', type: :feature do
  scenario 'Delete post' do
    visit authenticated_root_path
    fill_in 'Name', with: 'Tester11'
    fill_in 'Email', with: 'tester11@gmail.com'
    fill_in 'Password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_on 'Sign up'
    fill_in 'post_content', with: 'This is a new post'
    click_on 'Post'
    # page.evaluate_script('window.confirm = function() { return true; }')
    click_on('delete')
    expect(page).to have_content('Post was successfully destroyed')
    sleep(2)
  end
end
