require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get new_user_registration_path
    assert_no_difference 'User.count' do
      post user_registration_path, params: { user: { name:  "",
                                         email: "user@invalid",
                                         password: "foo" } }
    end
    assert_template "devise/shared/_error_messages"
    assert_template "devise/shared/_links"
    assert_template "devise/registrations/new"
    assert_template "layouts/application"
  end

  test "valid signup information" do
    get new_user_registration_path
    assert_difference 'User.count', 1 do
      post user_registration_path, params: { user: { name:  "Example User",
                                         email: "user@example.com",
                                         password: "password" } }
    end
  end
end
