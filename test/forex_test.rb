require 'cutest'
require './lib/forex'

setup do
  @date = '2015-08-11'
end

test "if base and counter are equal, the exchange rate should be 1" do
  assert ExchangeRate.at(@date, 'EUR', 'EUR') == 1
  assert ExchangeRate.at(@date, 'GBP', 'GBP') == 1
end

test "if base is EUR and counter is GBP, the exchange rate should be 0.7088" do
  assert ExchangeRate.at(@date, 'EUR', 'GBP') == 0.7088
end

test "if base is GBP and counter is EUR, the exchange rate should be 1.4108" do
  assert ExchangeRate.at(@date, 'GBP', 'EUR') == 1.4108
end

test "if base is USD and counter is GBP, the exchange rate should be 0.6412" do
  assert ExchangeRate.at(@date, 'USD', 'GBP') == 0.6412
end

test "if base is GBP and counter is USD, the exchange rate should be 1.5597" do
  assert ExchangeRate.at(@date, 'GBP', 'USD') == 1.5597
end

test "if base is XXX, the exchange rate should be nil" do
  assert ExchangeRate.at(@date, 'XXX', 'USD') == nil
  assert ExchangeRate.at(@date, 'XXX', 'EUR') == nil
end

test "if counter is XXX, the exchange rate should be nil" do
  assert ExchangeRate.at(@date, 'GBP', 'XXX') == nil
  assert ExchangeRate.at(@date, 'EUR', 'XXX') == nil
end

test "if date is invalid, the exchange rate should be nil" do
  assert ExchangeRate.at('20150-08-11', 'GBP', 'XXX') == nil
  assert ExchangeRate.at('2015-038-11', 'GBP', 'XXX') == nil
  assert ExchangeRate.at('2015-08-112', 'GBP', 'XXX') == nil
  assert ExchangeRate.at('2015-58-11' , 'GBP', 'XXX') == nil
  assert ExchangeRate.at('2015-08-51' , 'GBP', 'XXX') == nil
end
