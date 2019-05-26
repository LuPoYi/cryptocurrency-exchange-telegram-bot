module Bitopro
  module Public
    def tickers(currency_pair = nil)
      if currency_pair
        get("/tickers/#{currency_pair}")
      else
        get("/tickers")
      end
    end
  end
end