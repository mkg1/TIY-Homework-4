require 'byebug'

class DifferentCurrencyCodeError < StandardError
end

class Currency
  def initialize (amount, symbol="")
    @amount = amount
    @symbol = symbol
    code = {"$"=>:USD, "£" => :GBP, "€"=>:EUR, "₽"=>:RUB, "₹"=>:INR, "元"=>:CNY,
     "¥"=>:JPY, "R$"=>:BRL}
   if @amount != nil && @symbol == ""
     arrayed_amount = amount.split("", 2)
     @amount = arrayed_amount.join[1..-1].to_f
     puts "The amount you've entered is #{@amount}"
     @symbol = code[arrayed_amount[0]]
     puts "You currently have money in #{@symbol}s"
   else
     @amount = amount.to_f
     puts "The amount you've entered is #{@amount}"
     @symbol = symbol
     puts "You currently have money in #{@symbol}s"
     return
   end

    #obnoxiouslybrokencode!
    # if @amount[0].to_i == 0
    #   ccode = @amount.split("", 2)
    #   puts "symbol entered is #{ccode}"
    #   @symbol = code[ccode[0]]
    #   puts "code is #{@symbol}"
    #   @amount = ccode.join[1..-1].to_f
    #   puts "just the amount is #{@amount}"
    #   return @amount
    #  else
    #   puts "Awesome, the code is #{@symbol}"
    # end
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
      new_times = Currency.new(@amount * multiplier, @symbol)
      puts new_times.amount
      puts new_times.symbol
      puts "new amount is #{new_times.amount}#{new_times.symbol}"
  end

end
