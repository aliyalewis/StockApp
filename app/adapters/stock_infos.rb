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

        # books = JSON.parse(RestClient.get(author_url))
        #
        # books['items'].each do |item|
        #   if item['volumeInfo']['authors'] && item['volumeInfo']['authors'].include?(author.name)
        #
        #     book = ::Book.new
        #     book.author = author
        #     book.title = item['volumeInfo']['title']
        #     book.snippet = item['volumeInfo']['description']
        #
        #     book.save
        end
       end
      end

      private

      def stocks_url
        "#{BASE_URL}#{symbol}"
      end

      # def author_sanitizer(author)
      #   author.gsub(/\W+/, '').downcase
      # end
    end
  end
