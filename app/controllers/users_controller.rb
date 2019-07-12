class UsersController < ApplicationController

    before_action :set_user, only:[:edit, :show, :update, :destroy]
    before_action :most_held 
    before_action :average_value

    def index
        @users = User.all
    end

    def show
      if authorized? == true
        render :show
      else
        redirect_to login_path
      end
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            @portfolio = Portfolio.create(user_id: @user.id)
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            @user.errors.full_messages
            render :new
        end
    end

    def edit
      if authorized?
      else
        redirect_to login_path
      end
    end

    def update
        if @user.update(user_params)
            redirect_to user_path(@user)
        else
            @user.errors.full_messages
            redirect_to user_path(@user)
        end
    end

    def destroy
        @user.delete
        redirect_to users_path
    end

    private


    def user_params
        params.require(:user).permit(:name, :username, :password_digest, :email, :password, :password_confirmation)
    end
   
def most_held
    held_stocks = []
    PortfoliosStock.all.each do |portfolio|
        held_stocks.push(portfolio.stock_id)
    end
    freq = held_stocks.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
    top_stock = held_stocks.max_by { |v| freq[v] }
    @stock = Stock.find(top_stock)
end

def average_value
    total_value = 0
    PortfoliosStock.all.each do |portfolio|
        @stock = Stock.find(portfolio.stock_id)
        fetch_stocks(@stock.symbol)
        total_value += (@price * portfolio.shares)
    end
    @average = total_value/PortfoliosStock.all.length
end




end
