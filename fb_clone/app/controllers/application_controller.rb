class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    #to avoid error message "undefined method `errors' for nil:NilClass"
    before_action :instantiatePost
    def instantiatePost
        @post= Post.new
    end
end
