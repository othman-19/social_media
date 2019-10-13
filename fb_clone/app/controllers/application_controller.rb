# frozen_string_literal: true

# Application controller
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # to avoid error message "undefined method `errors' for nil:NilClass"
  before_action :instantiate_post
  before_action :instantiate_comment
  def instantiate_post
    @post = Post.new
  end

  def instantiate_comment
    @comment = Comment.new
  end
  
end
