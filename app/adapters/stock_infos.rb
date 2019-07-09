module Adapter
  class StockInfos
      BASE_URL = 'https://financialmodelingprep.com/api/v3/company/profile/'

      def initialize(symbol)
        @symbol = symbol
      end

      # def fetch_stocks(symbol)
      #   response_string = RestClient.get(BASE_URL+"#{symbol}")
      #   response_hash = JSON.parse(response_string)
      #
      #   @price = repsponse_hash['profile']['price']
      # end


        # stocks = JSON.parse(RestClient.get(stock_url))
        #
        # stocks['profile'].each do |stock|
          # byebug
          # if p['profile']['authors'] && item['volumeInfo']['authors'].include?(author.name)
        end
      end
