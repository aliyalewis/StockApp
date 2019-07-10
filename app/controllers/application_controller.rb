class ApplicationController < ActionController::Base
    helper_method :logged_in?, :redirect_user

    def logged_in?
        !!session[:user_id]
    end

    def redirect_user
        !session[:user_id]
        redirect_to login_path
    end
end
