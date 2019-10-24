# frozen_string_literal: true

require 'rails_helper'
# Delete user.
RSpec.describe 'Delete user', type: :feature do
  scenario 'Delete user' do
    tester6 = User.new(name: 'tester6',
                       email: 'tester6@gmail.com',
                       password: 'password')

    visit authenticated_root_path

    fill_in 'Name', with: tester6.name
    fill_in 'Email', with: tester6.email
    fill_in 'Password', with: tester6.password
    fill_in 'user_password_confirmation', with: tester6.password
    click_on 'Sign up'
    visit users_path
    # page.evaluate_script('window.confirm = function() { return true; }')
    click_on('Destroy')
    expect(page).to have_content('successfully destroyed')
    sleep(2)
  end
end
