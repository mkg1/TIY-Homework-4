class CurrencyConverter
  def initialize(rate)
    @rate = rate
  end

  def rate
    @rate
  end

  def convert(original_currency, convert_to)
    if !@rate.include?(convert_to)
      raise UnknownCurrencyCodeError, "Not familiar with #{convert_to}. Please only use valid currency codes."
      return false
    elsif !@rate.include?(original_currency.symbol)
      raise UnknownCurrencyCodeError, "Not familiar with #{original_currency.symbol}. Please only use valid currency codes."
      return false
    elsif original_currency.symbol != :USD
      foreign_conversion = original_currency.amount * ((@rate[convert_to]/@rate[original_currency.symbol]))
      puts  "You are starting with #{original_currency.amount} #{original_currency.symbol}. The exchange rate for #{original_currency.symbol} to #{convert_to} is #{@rate[convert_to]}/#{@rate[original_currency.symbol]} so you should get back #{foreign_conversion}"
    else
      puts "You are starting with #{original_currency.amount} #{original_currency.symbol}. The exchange rate is #{@rate[convert_to]} #{convert_to} to 1 #{original_currency.symbol} so you'll get back #{original_currency.amount * @rate[convert_to]} #{convert_to}"
    end
  end
  
end
