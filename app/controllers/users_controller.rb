class UsersController < ApplicationController

    before_action :set_user, only:[:edit, :show, :update, :destroy]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to user_path(@user)
        else
            @user.errors.full_messages
            render :new
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
    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        require(:user).permit(:name, :username, :email)
    end


end
