require "./Currency"
require "./Currency_Converter"
require "./different_currency_class"
require "./unknown_currency_class"

puts "Please enter an amount:"
input_amount = gets.chomp

if input_amount.to_i != 0
  puts "Please enter a currency code:"
  currency_code = gets.chomp.upcase
else
  currency_code = ""
end

current = Currency.new(input_amount, currency_code)

puts "What do you want to convert your money (in #{current.symbol}) to? (Please enter a currency code.)"
converts_to = gets.chomp.upcase.to_sym

rates = {:USD => 1.0, :CNY => 6.58, :EUR => 0.89, :GBP => 0.69, :INR => 67.94, :JPY => 116.83, :RUB => 77.03}

testobj = CurrencyConverter.new(rates)

testobj.convert(current, converts_to)
