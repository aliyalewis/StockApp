class ApplicationController < ActionController::Base
helper_method :current_portfolio

  def current_portfolio
    session[:portfolio] ||= []
  end

end
