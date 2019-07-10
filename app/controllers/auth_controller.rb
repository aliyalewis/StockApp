class AuthController < ApplicationController

    def new
    end

    def verify
      @user = User.find_by(username: params[:auth][:username])
        if @user
          session[:user_id] = @user.id
          redirect_to @user
        else
            render :new
        end
    end

    def destroy
        session.clear
    end
end
