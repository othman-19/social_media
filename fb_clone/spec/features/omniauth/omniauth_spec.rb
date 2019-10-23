# frozen_string_literal: true

require 'rails_helper'
RSpec.describe 'testing oauth', type: :feature do
  def login_with_oauth
    visit user_facebook_omniauth_authorize_path
  end
  scenario 'signin with facebook' do
    login_with_oauth
    expect(page).to have_content('Log out')
    sleep(2)
  end
end