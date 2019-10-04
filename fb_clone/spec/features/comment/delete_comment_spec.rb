# frozen_string_literal: true

require 'rails_helper'
# Delete comment.
RSpec.describe 'Delete comment', type: :feature do
  scenario 'Delete comment' do
    visit authenticated_root_path
    fill_in 'Name', with: 'Tester15'
    fill_in 'Email', with: 'tester15@gmail.com'
    fill_in 'Password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_on 'Sign up'
    fill_in 'post_content', with: 'This is a new post'
    click_on 'Post'
    fill_in 'comment_body', with: 'This is a new comment'
    click_on 'Comment'
    #page.evaluate_script('window.confirm = function() { return true; }')
    click_on('remove')
    expect(page).to have_content('Comment removed')
    sleep(2)
  end
end
