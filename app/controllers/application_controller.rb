class ApplicationController < ActionController::Base

    helper_method :logged_in?, :redirect_user, :current_portfolio

    def authorized?
        params[:id] == session[:user_id]
    end

    def redirect_user
        !logged_in?
        redirect_to login_path
    end

    def logged_in?
        !!session[:user_id]
    end

  def current_portfolio
    session[:portfolio] ||= []
  end


end
