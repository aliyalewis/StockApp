class AuthController < ApplicationController

    def new
    end

    def verify
        if User.find_by(username: params[:auth][:username])
          @user = User.find_by(username: params[:auth][:username])
          session[:user_id] = @user.id
          redirect_to stocks_path
        else
            render :new
        end
    end

    def destroy
        session.clear
    end
end
