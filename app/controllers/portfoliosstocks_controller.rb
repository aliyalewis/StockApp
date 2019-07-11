class PortfoliosstocksController < ApplicationController

    def new
        @sp = PortfoliosStock.new
    end


    def create
        @portfolio = Portfolio.find_by(user_id: params[:user_id])
        @sp = Portfolio.new(portfolio_id: @portfolio.id)
    end

    def show
        @sps = PortfoliosStock.where(portfolio_id: params[:id])
        if @sps == nil
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
