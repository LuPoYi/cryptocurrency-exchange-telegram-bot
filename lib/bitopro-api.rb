module Bitopro

  class Client
    def fm_tickers(currency_pair = nil)
      tickers(currency_pair)
    end

    def fm_balance
      result = JSON.parse(account_balance)

      # a['data'].map{|s| "[#{s['currency'].upcase}]" if s['amount'] == "0" && s['available'] == "0" && s['stake'] == "0"}
      # {"data"=>[{"currency"=>"twd", "amount"=>"21912.52140391", " "=>"0.41140431", "stake"=>"0"}, {"currency"=>"btc", "amount"=>"0.02289663", "available"=>"0", "stake"=>"0"}, {"currency"=>"ltc", "amount"=>"0", "available"=>"0", "stake"=>"0"}, {"currency"=>"eth", "amount"=>"0", "available"=>"0", "stake"=>"0"}, {"currency"=>"bch", "amount"=>"0", "available"=>"0", "stake"=>"0"}, {"currency"=>"bchsv", "amount"=>"0", "available"=>"0", "stake"=>"0"}, {"currency"=>"btg", "amount"=>"0", "available"=>"0", "stake"=>"0"}, {"currency"=>"bcd", "amount"=>"0", "available"=>"0", "stake"=>"0"}, {"currency"=>"bito", "amount"=>"201238.89483564", "available"=>"9988.89483564", "stake"=>"191250"}, {"currency"=>"panda", "amount"=>"2000", "available"=>"2000", "stake"=>"0"}, {"currency"=>"cgp", "amount"=>"0", "available"=>"0", "stake"=>"0"}, {"currency"=>"trx", "amount"=>"0", "available"=>"0", "stake"=>"0"}, {"currency"=>"mith", "amount"=>"0", "available"=>"0", "stake"=>"0"}, {"currency"=>"sda", "amount"=>"0", "available"=>"0", "stake"=>"0"}, {"currency"=>"alln", "amount"=>"0", "available"=>"0", "stake"=>"0"}, {"currency"=>"modl", "amount"=>"0", "available"=>"0", "stake"=>"0"}, {"currency"=>"qntu", "amount"=>"0", "available"=>"0", "stake"=>"0"}, {"currency"=>"npxs", "amount"=>"0", "available"=>"0", "stake"=>"0"}, {"currency"=>"usdt", "amount"=>"66.96438863", "available"=>"66.96438863", "stake"=>"0"}, {"currency"=>"rpc", "amount"=>"0", "available"=>"0", "stake"=>"0"}, {"currency"=>"twdt", "amount"=>"0", "available"=>"0", "stake"=>"0"}, {"currency"=>"xem", "amount"=>"10", "available"=>"10", "stake"=>"0"}, {"currency"=>"xrp", "amount"=>"0", "available"=>"0", "stake"=>"0"}]}
    end
  end

  module Public
    def tickers(pair = nil)
      if pair
        get("/tickers/#{pair}")
      else
        get("/tickers")
      end
    end
  end

  module Account
    def order_list(pair: nil, page: 1, active: false)
      raise Error, "pair is required" unless pair

      authenticated_get("/orders/#{pair}", params: { page: page, active: active })
    end
  end
end