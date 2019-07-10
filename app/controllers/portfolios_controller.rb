class PortfoliosController < ApplicationController

    before_action :set_user, only:[:show]
    before_action :logged_in?

    def new
      byebug
      if sessions[:portfolio]
        redirect_to user_portfolio_path(params[:id])
      else
      @portfolio = Portfolio.new
      end
    end

    def create
      @portfolio = Portfolio
    end

    def add_to_portfolio
      @stock = Stock.find(params[:id])

      current_portfolio << @stock.id
    end

end
