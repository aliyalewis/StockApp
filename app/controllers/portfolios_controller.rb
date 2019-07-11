class PortfoliosController < ApplicationController

    before_action :set_user, only:[:show]
    before_action :logged_in?

    def index
      redirect_to login_path
    end

    def show

      @portfolio = Portfolio.find(@user.id)
    end

    def new
      if session[:portfolio]
        redirect_to user_portfolio_path(params[:id])
      else
      @portfolio = Portfolio.new
      end
    end

    def create
      @portfolio = Portfolio.new(:stock_id, :user_id)
      if @portfolio.save
        redirect_to user_portfolio_path(@portfolio)
      else
        render :new
      end
    end

    def add_to_portfolio
      @stock = Stock.find(params[:id])
      current_portfolio << @stock.symbol
    end

end
