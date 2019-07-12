class PortfoliosstocksController < ApplicationController
    def index
        @user = User.find(params[:user_id])
    end

    def show
        @sps = PortfoliosStock.where(portfolio_id: params[:id])
        @sps.each do |portfolio|
           @stock = Stock.find(portfolio.stock_id)
           @stock.symbol
           portfolio.shares
        end
        fetch_stocks(@stock.symbol)
       
        
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
        if @ps.update
          redirect_to user_path(session[:user_id])
        else
          render :edit
        end
    end

    def destroy
      @stock = Stock.find_by(params[:symbol])
      @stock.destroy
      redirect_to user_portfoliosstock_path(session[:user_id])
    end
end
