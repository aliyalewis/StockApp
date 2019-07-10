class AuthController < ApplicationController

    def new
    end

    def verify
        if User.find_by(username: params[:username])
          @user = User.find_by(username: params[:username])
          session[:user_id] = @user.id
          redirect_to stocks_path
        else
            redirect_to new_user_path
        end
    end

    def destroy
        session.clear
    end
end
