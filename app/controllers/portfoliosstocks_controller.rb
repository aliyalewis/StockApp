class PortfoliosstocksController < ApplicationController
    def index
        @user = User.find(params[:user_id])
        # @sps = PortfoliosStock.all
    end

    def show
        @total_value = 0
        @sps = PortfoliosStock.where(portfolio_id: params[:id])
        @sps.each do |portfolio|
           @stock = Stock.find(portfolio.stock_id)
           if @stock != nil
            fetch_stocks(@stock.symbol)
            @total_value += (@price * portfolio.shares)
           end
        end
        # if @stock != nil
        #     fetch_stocks(@stock.symbol)
        # end
       
        
    end

    def new
        @ps = PortfoliosStock.new
        
    end

    def create
        @portfolio = Portfolio.find_by(user_id: params[:user_id])
       
        @ps = PortfoliosStock.new(portfolio_id: @portfolio.id, stock_id: params[:portfoliosstock][:stock_id], shares: params[:shares])
        if @ps.save
          redirect_to user_path(session[:user_id])
        else
          render :new
        end
    end



    def edit
        @user = User.find(params[:user_id])
        @portfolio = Portfolio.find_by(user_id: @user.id)
        @ps = PortfoliosStock.find_by(portfolio_id: @portfolio.id)
    end

    def update
        @user = User.find(params[:user_id])
        @portfolio = Portfolio.find_by(user_id: @user.id)
        @ps = PortfoliosStock.find_by(portfolio_id: @portfolio.id)
        @ps.update(:stock_id, :shares)
    end
end
