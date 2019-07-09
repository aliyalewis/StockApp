class StocksController < ApplicationController
    before_action :set_stock, only:[:update, :destroy]

    def new
        @stock = Stock.new
    end

    def create
        @stock = Stock.new(stock_params)
        if @stock.save
            redirect to stock_path(@stock)
        else
            @stock.errors.full_messages
            render :new
        end
    end

    def destroy
        @stock.delete
    end

    private

    def set_stock
        params.require(:stock).permit(:symbol, :company_name)
    end
end
