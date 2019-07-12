class StocksController < ApplicationController
    before_action :set_stock, only:[:update]

    def index
      @stocks = Stock.all
    end

    def new
        @stock = Stock.new
    end

    # def fetch_stocks(symbol)
    #   base_url = 'https://financialmodelingprep.com/api/v3/company/profile/'

    #   response_string = RestClient.get(base_url+"#{symbol}")
    #   response_hash = JSON.parse(response_string)

    #   @price = response_hash['profile']['price']
    #   @beta = response_hash['profile']['beta']
    #   @vol_avg = response_hash['profile']['volAvg']
    #   @mkt_cap = response_hash['profile']['mktCap']
    #   @last_div = response_hash['profile']['lastDiv']
    #   @range = response_hash['profile']['range']
    #   @changes = response_hash['profile']['changes']
    #   @changes_percentage = response_hash['profile']['changesPercentage']
    #   @company_name = response_hash['profile']['companyName']
    #   @exchange = response_hash['profile']['exchange']
    #   @industry = response_hash['profile']['industry']
    #   @website = response_hash['profile']['website']
    #   @description = response_hash['profile']['description']
    #   @ceo = response_hash['profile']['ceo']
    #   @sector = response_hash['profile']['sector']
    #   # @image
    # end

    def show
      @stock = Stock.find(params[:id])
      fetch_stocks(@stock.symbol)

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
      @portfolio = Portfolio.find_by(user_id: session[:user_id])
      @ps = PortfoliosStock.find_by(@portfolio.user_id)
      @ps.delete
    end

    private

    def set_stock
        params.require(:stock).permit(:symbol)
    end

end
