require 'rails_helper'

# Creating user.
RSpec.describe 'Login user', type: :feature do
  scenario 'valid inputs' do
    visit authenticated_root_path
    fill_in 'Name', with: 'Tester1'
    fill_in 'Email', with: 'tester1@gmail.com'
    fill_in 'Password', with: 'password'
    fill_in "user_password_confirmation", with: 'password'
    click_on "Sign up"
    visit users_path
    expect(page).to have_content('Tester1')
  end
end