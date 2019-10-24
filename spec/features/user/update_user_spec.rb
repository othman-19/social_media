# frozen_string_literal: true

require 'rails_helper'
# Update user.
RSpec.describe 'Update user', type: :feature do
  scenario 'update user' do
    tester8 = User.new(name: 'tester8',
                       email: 'tester8@gmail.com',
                       password: 'password')

    visit authenticated_root_path

    fill_in 'Name', with: tester8.name
    fill_in 'Email', with: tester8.email
    fill_in 'Password', with: tester8.password
    fill_in 'user_password_confirmation', with: tester8.password
    click_on 'Sign up'

    click_on 'Log out'
    click_on 'Log_in'

    fill_in 'Email', with: tester8.email
    fill_in 'Password', with: tester8.password
    click_on 'Log in'

    visit edit_user_registration_path
    fill_in 'Email', with: 'new_tester8_email@gmail.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    fill_in 'user_current_password', with: 'password'
    click_on 'Update'
    expect(page).to have_content('updated successfully')
    sleep(2)
  end
end
