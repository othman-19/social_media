# frozen_string_literal: true

require 'rails_helper'

# creating like.
RSpec.describe 'like post', type: :feature do
  scenario 'like post' do
    visit authenticated_root_path
    fill_in 'Name', with: 'Tester17'
    fill_in 'Email', with: 'tester17@gmail.com'
    fill_in 'Password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_on 'Sign up'
    fill_in 'post_content', with: 'This is a new post'
    click_on 'Post'
    click_on '.'
    expect(page).to have_content('1 Like')
    sleep(3)
  end
end
