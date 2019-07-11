class UsersController < ApplicationController

    before_action :set_user, only:[:edit, :show, :update, :destroy]

    def index
        @users = User.all
    end

    def show
        # @portfolio = Portfolio.find_by(user_id: params[:id])
        # @portfoliostocks = PortfoliosStock.find_by(portfolio_id: @portfolio.id)
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
            # @ps = PortfoliosStock.create(portfolio_id: @portfolio.id)
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
    end

    private


    def user_params
        params.require(:user).permit(:name, :username, :password_digest, :email, :password, :password_confirmation)
    end


end
