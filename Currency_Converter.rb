class CurrencyConverter
  def initialize(rates)
    @rate = rates
  end

  def rate
    @rates
  end

  def convert(original_currency, convert_to)
    puts original_currency.amount
    puts original_currency.symbol
    puts original_currency.amount * @rate[convert_to]
  end
  #takes in currency $5usd, takes in code, ¥, gives back currency object with ¥ amount
end

# yen = Converter.new({1: "fdlsfkd", 2: "kfdla;fj"})
#
#
#
# Should be able to take a Currency object and a requested currency code that is the same currency code as the Currency object's and return a Currency object equal to the one passed in (that is, currency_converter.convert(Currency.new(1, :USD), :USD) == Currency.new(1, :USD))
# Should be able to take a Currency object that has one currency code it knows and a requested currency code and return a new Currency object with the right amount in the new currency code
# Should be able to be created with a Hash of three or more currency codes and conversion rates. An example would be this: {USD: 1.0, EUR: 0.74, JPY: 120.0}, which implies that a dollar is worth 0.74 euros and that a dollar is worth 120 yen, but also that a euro is worth 120/0.74 = 162.2 yen.
# Should be able to convert Currency in any currency code it knows about to Currency in any other currency code it knows about.
# Should raise an UnknownCurrencyCodeError when you try to convert from or to a currency code it doesn't know about.
#
# every time you call converter.new, you should have to give it the rates
