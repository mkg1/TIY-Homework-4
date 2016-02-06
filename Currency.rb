require 'byebug'

class DifferentCurrencyCodeError < StandardError
end

class UnknownCurrencyCodeError < StandardError
end

class Currency
  def initialize (amount, symbol=nil)
    @amount = amount
    #if @amount contains a code, parse out code
    @symbol = symbol
    code = {"$"=>:USD, "£" => :GBP, "€"=>:EUR, "₽"=>:RUB, "₹"=>:INR, "元"=>:CNY,
     "¥"=>:JPY, "R$"=>:BRL}
     if @amount != nil && @symbol == nil
       breaker = amount.split("", 2)
       @amount = breaker[1].to_f
       @symbol = code[breaker[0]]
    # if @amount[0].to_i == 0
    #   #puts "symbol entered is #{@amount[0]}"
    #   @symbol = code[@amount[0]]
    #   #puts "code is #{@symbol}"
    #   @amount = @amount[1..-1].to_f
     else
      puts "fjl;fj;asfj"
    end

  end

  def amount
    @amount
  end

  def symbol
    @symbol
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

# puts "Enter amount:"
# input_amount = gets.chomp
# if input_amount[0].to_i == 0
#   input_symbol = input_amount[0]
#   input_amount = input_amount[1..-1]
# else
#   puts "Enter currency symbol:"
#   input_symbol = gets.chomp
# end
#
# puts "Amount is #{input_amount}, Symbol is #{input_symbol}"
#
# wad1 = Currency.new(input_amount.to_i, input_symbol)
# puts wad1.symbol_to_code
#
# new_wad = wad1 * 5.25
# puts new_wad.amount
#
#
# puts "Enter amount:"
# input_amount2 = gets.chomp
# if input_amount2[0].to_i == 0
#   input_symbol2 = input_amount2[0]
#   input_amount2 = input_amount2[1..-1]
# else
#   puts "Enter currency symbol:"
#   input_symbol2 = gets.chomp
# end
#
# puts "Amount is #{input_amount2}, Code is #{input_symbol2}"
#
# wad2 = Currency.new(input_amount2.to_i, input_symbol2)
# e = Currency.new("$300")
# puts e.amount
# puts e.symbol
# puts e.symbol
# puts "e amount is #{e.amount} and symbol is #{e.symbol}"




  # if input_amount.to_i == 0
  #   values = input_amount.split ""
  #   if values[0].to_i == 0
  #     input_amount = values[1..-1]
  #     input_code = values[0]
  #   end
  #   puts "Amount is #{input_amount}, Code is #{input_code}"
  # end


# # 5usd * 2 = 10usd, not ¥
