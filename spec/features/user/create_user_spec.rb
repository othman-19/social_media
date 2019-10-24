# frozen_string_literal: true

require 'rails_helper'

# Creating user.
RSpec.describe 'Creating user', type: :feature do
  scenario 'valid inputs' do
    visit authenticated_root_path
    fill_in 'Name', with: 'Tester1'
    fill_in 'Email', with: 'tester1@gmail.com'
    fill_in 'Password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_on 'Sign up'
    visit users_path
    expect(page).to have_content('Tester1')
    sleep(2)
  end
  scenario 'invalid name' do
    visit authenticated_root_path
    fill_in 'Name', with: ''
    fill_in 'Email', with: 'tester2@gmail.com'
    fill_in 'Password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_on 'Sign up'
    expect(page).to have_content("Name can't be blank")
    sleep(2)
  end
  scenario 'invalid email' do
    visit authenticated_root_path
    fill_in 'Name', with: 'Tester3'
    fill_in 'Email', with: ''
    fill_in 'Password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_on 'Sign up'
    expect(page).to have_content("Email can't be blank")
    sleep(2)
  end
  scenario 'invalid password' do
    visit authenticated_root_path
    fill_in 'Name', with: 'Tester4'
    fill_in 'Email', with: 'tester4@gmail.com'
    fill_in 'Password', with: ''
    fill_in 'user_password_confirmation', with: 'password'
    click_on 'Sign up'
    expect(page).to have_content("Password can't be blank")
    sleep(2)
  end
  scenario 'diffrent password_confirmation' do
    visit authenticated_root_path
    fill_in 'Name', with: 'Tester5'
    fill_in 'Email', with: 'tester5@gmail.com'
    fill_in 'Password', with: 'password'
    fill_in 'user_password_confirmation', with: 'pass_word'
    click_on 'Sign up'
    expect(page).to have_content("Password confirmation doesn't match Password")
    sleep(2)
  end
end
