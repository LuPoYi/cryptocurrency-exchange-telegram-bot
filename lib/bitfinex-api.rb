module Bitfinex
  module RESTv1Wallet
    def fix_balances(params = {})
      result = balances(params)
      # [{"type"=>"deposit", "currency"=>"btc", "amount"=>"0.0", "available"=>"0.0"}, {"type"=>"deposit", "currency"=>"btg", "amount"=>"0.0", "available"=>"0.0"}, {"type"=>"deposit", "currency"=>"dsh", "amount"=>"1.00399621", "available"=>"1.00399621"}, {"type"=>"deposit", "currency"=>"eos", "amount"=>"0.0", "available"=>"0.0"}, {"type"=>"deposit", "currency"=>"eth", "amount"=>"0.0", "available"=>"0.0"}, {"type"=>"deposit", "currency"=>"iot", "amount"=>"100.0", "available"=>"100.0"}, {"type"=>"deposit", "currency"=>"neo", "amount"=>"0.0", "available"=>"0.0"}, {"type"=>"deposit", "currency"=>"usd", "amount"=>"0.0", "available"=>"0.0"}, {"type"=>"deposit", "currency"=>"xmr", "amount"=>"0.0", "available"=>"0.0"}, {"type"=>"exchange", "currency"=>"bab", "amount"=>"0.00722606", "available"=>"0.00722606"}, {"type"=>"exchange", "currency"=>"bch", "amount"=>"0.0", "available"=>"0.0"}, {"type"=>"exchange", "currency"=>"bsv", "amount"=>"0.00722606", "available"=>"0.00722606"}, {"type"=>"exchange", "currency"=>"btc", "amount"=>"0.00439901", "available"=>"0.00439901"}, {"type"=>"exchange", "currency"=>"btg", "amount"=>"0.0", "available"=>"0.0"}, {"type"=>"exchange", "currency"=>"dsh", "amount"=>"0.2998", "available"=>"0.0998"}, {"type"=>"exchange", "currency"=>"eos", "amount"=>"0.0", "available"=>"0.0"}, {"type"=>"exchange", "currency"=>"eth", "amount"=>"0.47485384", "available"=>"0.47485384"}, {"type"=>"exchange", "currency"=>"iot", "amount"=>"36.52799999", "available"=>"0.0"}, {"type"=>"exchange", "currency"=>"ltc", "amount"=>"0.0", "available"=>"0.0"}, {"type"=>"exchange", "currency"=>"mit", "amount"=>"248.96610645", "available"=>"99.7"}, {"type"=>"exchange", "currency"=>"neo", "amount"=>"3.09835228", "available"=>"1.17185368"}, {"type"=>"exchange", "currency"=>"omg", "amount"=>"0.0", "available"=>"0.0"}, {"type"=>"exchange", "currency"=>"qsh", "amount"=>"308.636576", "available"=>"0.006576"}, {"type"=>"exchange", "currency"=>"rrt", "amount"=>"985.75603407", "available"=>"0.0"}, {"type"=>"exchange", "currency"=>"san", "amount"=>"0.0", "available"=>"0.0"}, {"type"=>"exchange", "currency"=>"usd", "amount"=>"282.32023144", "available"=>"14.73188177"}, {"type"=>"exchange", "currency"=>"xmr", "amount"=>"3.61012385", "available"=>"3.61012385"}, {"type"=>"exchange", "currency"=>"xrp", "amount"=>"329.52", "available"=>"229.52"}, {"type"=>"exchange", "currency"=>"yyw", "amount"=>"0.0", "available"=>"0.0"}, {"type"=>"exchange", "currency"=>"zec", "amount"=>"0.0", "available"=>"0.0"}, {"type"=>"exchange", "currency"=>"zrx", "amount"=>"0.0", "available"=>"0.0"}]
      return Hash[ result.map{|b| [b['currency'], [b['amount'], b['available']]] if b['type'] == 'exchange' && (b['amount'].to_f > 0 || b['available'].to_f > 0)}.compact ]
    end
  end

  module RESTv1Orders
    def fix_orders
      result = orders()


    end
  end

  
  # client.new_order("BTCUSD", 100, "market", "sell", 0)
  # response = client.cancel_orders(448364249)
  # response = client.orders


  # client.orders.first
  # => {"id"=>8790349321, "cid"=>11860059893, "cid_date"=>"2018-02-27", "gid"=>nil, "symbol"=>"xrpusd", "exchange"=>"bitfinex", "price"=>"1.587", "avg_execution_price"=>"0.0", "side"=>"sell", "type"=>"exchange limit", "timestamp"=>"1519701460.0", "is_live"=>true, "is_cancelled"=>false, "is_hidden"=>false, "oco_order"=>nil, "was_forced"=>false, "original_amount"=>"100.0", "remaining_amount"=>"100.0", "executed_amount"=>"0.0", "src"=>"web"}
end

