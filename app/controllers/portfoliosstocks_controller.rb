class PortfoliosstocksController < ApplicationController
    def index
        @user = User.find(params[:user_id])
        # @sps = PortfoliosStock.all
    end

    def show
        @ps = PortfoliosStock.find_or_create_by(portfolio_id: params[:id])
        @stock = Stock.find_by(params[:symbol])
    end


    # def new
    #     @sp = PortfoliosStock.new
    # end

    # def create
    #     @portfolio = Portfolio.find_by(user_id: params[:id])
    #     @sp = Portfolio.new(portfolio_id: @portfolio.id)
    # end

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
