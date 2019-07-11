class PortfoliosController < ApplicationController

    
    before_action :logged_in?

    def index
      redirect_to login_path
    end

    def show
      @portfolio = Portfolio.find_by(user_id: @user.id)
    end

    def new
      # if session[:portfolio]
      #   redirect_to user_portfolio_path(params[:id])
      # else
      @portfolio = Portfolio.new
   
      # end
    end

    def create
      @portfolio = Portfolio.new(user_id: params[:id])
    
      if @portfolio.save
        redirect_to user_portfolio_path(@portfolio)
      else
        render :new
      end
    end

  

end
