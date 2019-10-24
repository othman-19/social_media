# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]
  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email password password_confirmation])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name email password password_confirmation])
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in keys: [:name])
  #   devise_parameter_sanitizer.permit(:sign_in keys: [:password])
  # end
  # end

  # private

  #   def sign_up_params
  #     params.require(:user).permit(:name, :email, :password,
  #     :password_confirmation)
  #   end

  #   def account_update_params
  #     params.require(:user).permit(:name, :email, :password,
  #     :password_confirmation, :current_password)
  #   end
end
