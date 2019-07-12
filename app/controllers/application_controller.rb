class ApplicationController < ActionController::Base

    helper_method :logged_in?, :redirect_user, :current_portfolio, :authorized?, :set_user, :fetch_stocks

    def authorized?
        params[:id].to_i == session[:user_id]
    end

    def redirect_user
        !logged_in?
        redirect_to login_path
    end

    def logged_in?
        !!session[:user_id]
    end

  def current_portfolio
    session[:portfolio_stocks] ||= []
  end

  def set_user
      @user = User.find(params[:id])
  end

  def fetch_stocks(symbol)
    base_url = 'https://financialmodelingprep.com/api/v3/company/profile/'

    response_string = RestClient.get(base_url+"#{symbol}")
    response_hash = JSON.parse(response_string)

    @price = response_hash['profile']['price']
    @beta = response_hash['profile']['beta']
    @vol_avg = response_hash['profile']['volAvg']
    @mkt_cap = response_hash['profile']['mktCap']
    @last_div = response_hash['profile']['lastDiv']
    @range = response_hash['profile']['range']
    @changes = response_hash['profile']['changes']
    @changes_percentage = response_hash['profile']['changesPercentage']
    @company_name = response_hash['profile']['companyName']
    @exchange = response_hash['profile']['exchange']
    @industry = response_hash['profile']['industry']
    @website = response_hash['profile']['website']
    @description = response_hash['profile']['description']
    @ceo = response_hash['profile']['ceo']
    @sector = response_hash['profile']['sector']
    # @image
  end


end
