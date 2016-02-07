require "./Currency"
require "./Currency_Converter"

puts "Please enter an amount"
input_amount = gets.chomp

puts "Please enter a currency code"
currency_code = gets.chomp

current = Currency.new(input_amount, currency_code)

puts "What do you want to convert your money (in #{current.symbol}) to? (Please enter a currency code.)"
convert_to = gets.chomp.to_sym

rates = {:USD => 1.0, :EUR => 0.89, :GBP => 0.69}

testobj = CurrencyConverter.new(rates)


#testobj.convert(Currency.new("£30"), :EUR)
testobj.convert(current, convert_to)
# puts "conv is #{conv}"
