require 'byebug'

class DifferentCurrencyCodeError < StandardError
end

class Currency
  def initialize (amount, symbol="")
    @amount = amount
    #if @amount contains a code, parse out code
    @symbol = symbol
    @code = {"$" => "USD", "¥" => "JPY", "£" => "GBP", "€" => "EUR", }
  end

  def amount
    @amount
  end

  def symbol
    @symbol
  end

  def symbol_to_code
    return @code[@symbol]
  end

  def ==(other)
    if @symbol == other.symbol && @amount == other.amount
      return true
    else
      raise DifferentCurrencyCodeError, "These amounts and/or currencies are not equal"
      return false
    end
  end

  def +(other)
    if @symbol == other.symbol
      return Currency.new(@amount + other.amount, @symbol)
    else
      raise DifferentCurrencyCodeError, "Can't directly add different currencies"
    end
  end

  def -(other)
    if @symbol == other.symbol
      return Currency.new(@amount - other.amount, @symbol)
    else
      raise DifferentCurrencyCodeError, "Can't directly subtract different currencies"
    end
  end

  def *(multiplier)
      return Currency.new(@amount * multiplier, @symbol)
  end

end

puts "Enter amount:"
input_amount = gets.chomp
if input_amount[0].to_i == 0
  input_symbol = input_amount[0]
  input_amount = input_amount[1..-1]
else
  puts "Enter currency symbol:"
  input_symbol = gets.chomp
end

puts "Amount is #{input_amount}, Symbol is #{input_symbol}"

wad1 = Currency.new(input_amount.to_i, input_symbol)
puts wad1.symbol_to_code

new_wad = wad1 * 5.25
puts new_wad.amount


puts "Enter amount:"
input_amount2 = gets.chomp
if input_amount2[0].to_i == 0
  input_symbol2 = input_amount2[0]
  input_amount2 = input_amount2[1..-1]
else
  puts "Enter currency symbol:"
  input_symbol2 = gets.chomp
end

puts "Amount is #{input_amount2}, Code is #{input_symbol2}"

wad2 = Currency.new(input_amount2.to_i, input_symbol2)





  # if input_amount.to_i == 0
  #   values = input_amount.split ""
  #   if values[0].to_i == 0
  #     input_amount = values[1..-1]
  #     input_code = values[0]
  #   end
  #   puts "Amount is #{input_amount}, Code is #{input_code}"
  # end


# puts input_amount.to_s
# puts input_amount.to_i



#
# # Currency.new should be able to take one argument with a currency
# # symbol embedded in it, like "$1.20" or "€ 7.00",
# # and figure out the correct currency code.
# # It can also take two arguments like before,
# # one being the amount and the other being the currency code.
#
#
# puts wad1 == wad2
# multiplied = wad1 * 3.5
# puts multiplied.amount
# newwad = wad1 * 3
# puts "wad1 is: #{wad1}"
# puts "multiplying gives: #{newwad.code}#{newwad.amount}"

#puts wad1 + wad2
# begin
#   puts wad1 == wad2
# ensure
#   puts wad1 + wad2
#   puts wad1 - wad2
# end


# # 5usd * 2 = 10usd, not ¥
