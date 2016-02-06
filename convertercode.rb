require "./Currency"
require "./Currency_Converter"

rates = {:USD => 1.0, :EUR => 0.89, :GBP => 0.69}

testobj = CurrencyConverter.new(rates)

puts testobj.rate

testobj.convert(Currency.new(30, :USD), :EUR)
#currency_converter.convert(Currency.new(1, :USD), :USD) == Currency.new(1, :USD)
