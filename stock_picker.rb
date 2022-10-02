def stock_picker(prices)
  profit = []
  sale_day = []
  prices.each_with_index do |price, idx|
    available_max = prices[idx..-1].max
    sale_day.push(prices.index(available_max))
    profit.push(available_max - price)
  end
  buy_index = profit.index(profit.max)
  sell_index = sale_day[buy_index]

  [buy_index, sell_index]
end

some_prices = [17, 3, 6, 9, 15, 8, 6, 1, 10]

p stock_picker(some_prices)
