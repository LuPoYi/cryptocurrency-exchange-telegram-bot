module Bitopro
  module Public
    def tickers(pair = nil)
      if pair
        get("/tickers/#{pair}")
      else
        get("/tickers")
      end
    end
  end
end