
module ControllerMacros
  def login_user
   before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user  = User.create(name: "user", email: "user@gmail.com", password: "password") 
    #user.confirm #only if account is confirmable
    sign_in user
   end
  end
end