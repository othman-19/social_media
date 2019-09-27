# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # to avoid error message "undefined method `errors' for nil:NilClass"
  before_action :instantiate_post
  def instantiate_post
    @post = Post.new
  end
end
