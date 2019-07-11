class ApplicationController < ActionController::Base

    helper_method :logged_in?, :redirect_user, :current_portfolio, :authorized?, :set_user

    def authorized?
        params[:id].to_i == session[:user_id]
    end

    def redirect_user
        !logged_in?
        redirect_to login_path
    end

    def logged_in?
        !!session[:user_id]
    end

  def current_portfolio
    session[:portfolio_stocks] ||= []
  end

  def set_user
      @user = User.find(params[:id])
  end


end
