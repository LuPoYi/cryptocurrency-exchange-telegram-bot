module TradingBot
  # 三角套利 Triangular Arbitrage
  # 網格交易 Grid Trading
  # USDt/USD

  # form:
  # high_price 1.04
  # low_price 0.99
  # stop_loss_price 0.8
  # amount_per_grid 100
  # number_of_grid 20
  
  # available


  # use redis or mysql?

  # redis schema

  # "trading:12345678"
  #   => "settings"
  #     => [pair, high_price, low_price, stop_loss_price, amount_per_grid, number_of_grid]
  #   => "price_range"
  #     => [price0, price1, price2...]
  #   => "deal"
  #     => [bug_order, sell_order]
  #   => "penging"
  #     => [order]

  
end