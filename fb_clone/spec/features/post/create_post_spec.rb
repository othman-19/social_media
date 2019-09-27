require 'rails_helper'

# Creating post.
RSpec.describe 'Creating post', type: :feature do
  scenario 'valid inputs' do
    visit authenticated_root_path
    fill_in 'Name', with: 'Tester9'
    fill_in 'Email', with: 'tester9@gmail.com'
    fill_in 'Password', with: 'password'
    fill_in "user_password_confirmation", with: 'password'
    click_on "Sign up"
    fill_in 'post_content', with: 'This is a new post'
    click_on "Post"
    expect(page).to have_content('Post was successfully created')
    sleep(3)
  end
  scenario 'invalid content' do
    visit authenticated_root_path
    fill_in 'Name', with: 'Tester10'
    fill_in 'Email', with: 'tester10@gmail.com'
    fill_in 'Password', with: 'password'
    fill_in "user_password_confirmation", with: 'password'
    click_on "Sign up"
    fill_in 'post_content', with: ''
    click_on "Post"
    expect(page).to have_content("post not created")
    sleep(3)
  end
end