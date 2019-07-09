class WatchlistsController < ApplicationController

    def new
        @users = User.All 
        @stocks = Stock.all 
        @portfolio = Portfolio.new
    end

end
