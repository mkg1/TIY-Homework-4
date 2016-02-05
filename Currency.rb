require 'byebug'

class DifferentCurrencyCodeError < StandardError
end

class Currency
  def initialize (amount, code="")
    @amount = amount
    #if @amount contains a code, parse out code
    @code = code
  end

  def amount
    @amount
  end

  def code
    @code
  end

  def ==(other)
    if @code == other.code && @amount == other.amount
      return true
    else
      raise DifferentCurrencyCodeError, "Not equal"
      return false
    end
  end

  def +(other)
    if @code == other.code
      return @amount + other.amount
    else
      raise DifferentCurrencyCodeError, "Can't add different currencies directly"
    end
  end

  def -(other)
    if @code == other.code
      return @amount - other.amount
    else
      raise DifferentCurrencyCodeError, "Can't subtract different currencies directly"
    end
  end

  def *(multiplier)
      return Currency.new(@amount * multiplier, @code)
  end

end

loop do
  puts "Input amount:"
  input_amount = gets.chomp
  puts "Input code:"
  input_code = gets.chomp

  if input_amount.to_i == 0
    values = input_amount.split ""
    if values[0].to_i == 0
      input_amount = values[1..-1]
      input_code = values[0]
    end
    puts "Amount is #{input_amount}, Code is #{input_code}"
  end
  break
end

# puts input_amount.to_s
# puts input_amount.to_i




#
# wad1 = Currency.new(input_amount, input_code)
#
# # Currency.new should be able to take one argument with a currency
# # symbol embedded in it, like "$1.20" or "€ 7.00",
# # and figure out the correct currency code.
# # It can also take two arguments like before,
# # one being the amount and the other being the currency code.
#
# wad1 = Currency.new(3, "$")
# wad2 = Currency.new(3, "$")
# puts "You have #{wad1.amount}#{wad1.code}"
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
