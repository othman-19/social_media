require 'rails_helper'
# Delete user.
RSpec.describe 'Delete user', type: :feature do
  
  scenario 'Delete user' do
    tester1 = User.new(name: "tester1",
                           email: "tester1@gmail.com",
                           password: "password") 
   
    visit authenticated_root_path

    fill_in 'Name', with: tester1.name
    fill_in 'Email', with: tester1.email
    fill_in 'Password', with: tester1.password
    fill_in "user_password_confirmation", with: tester1.password
    click_on "Sign up"
    visit users_path
    page.evaluate_script('window.confirm = function() { return true; }')
    click_on('Destroy')
    expect(page).to have_content('successfully destroyed')
    sleep(3)
  end
end