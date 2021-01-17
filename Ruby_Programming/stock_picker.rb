test_array_1 = [18, 4, 7, 2, 15, 6, 4, 2, 2, 11, 7, 9, 13, 1]
test_array_2 = [17,3,6,9,15,8,6,1,10]


def stock_picker(stock_prices)
  profits = {}
  stock_prices.each_with_index do |price_1, index_1|
    stock_prices.each_with_index do |price_2, index_2|
      if index_2 > index_1
        profits[[index_1, index_2]] = (price_2 - price_1)
      end
    end
  end
  profits = profits.sort_by {|k, v| v}
  max_profit = profits[-1]
  puts "The highest profit of #{max_profit[1]} is achieved by buying on day #{max_profit[0][0] + 1} and 
  selling on day #{max_profit[0][1] + 1}."
end

stock_picker(test_array_1)
stock_picker(test_array_2)