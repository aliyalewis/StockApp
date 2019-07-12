class PortfoliosstocksController < ApplicationController
    def index
        @user = User.find(params[:user_id])
        # @sps = PortfoliosStock.all
    end

    def show
        @sps = PortfoliosStock.where(portfolio_id: params[:id])
        @stock = Stock.find_by(params[:symbol])
    end

    def new
        @ps = PortfoliosStock.new
    end

    def create
        @portfolio = Portfolio.find_by(user_id: params[:user_id])
        @ps = PortfoliosStock.new(portfolio_id: @portfolio.id, stock_id: params[:portfoliosstock][:stock_id])
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
