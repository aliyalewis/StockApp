module Adapter
  class StockInfos
      BASE_URL = "https://financialmodelingprep.com/api/v3/company/profile/"

      attr_reader :symbol

      def initialize(sym)
        @symbol = sym
      end

      def fetch_stocks
        byebug
        stocks = JSON.parse(RestClient.get(stocks_url))

        20.times do
          stocks['profile'].each do |sp|
            sp = ::Stock.new
          sp['companyName'] = company_name
          sp['industry'] = industry
          sp['website'] = website
          sp['price'] = price
          sp['description'] = description
          byebug
          sp.save
        end
       end
      end

      private

      def stocks_url
        "#{BASE_URL}#{symbol}"
      end

    end
  end
