require 'nokogiri'

class ExchangeRate
  def self.at(date, base, counter)
    if base == counter
      1
    elsif base == 'EUR'
      self.getRateWithEURBase(date, counter)
    elsif counter == 'EUR'
      self.getRateWithEURCounter(date, base)
    else
      self.getRateWithOtherCurrencies(date, base, counter)
    end
  end

  private
  FILE_PATH = './data/forex.xml'

  def self.getRateWithEUR(date, currency)
    f = File.open(FILE_PATH)
    doc = Nokogiri::XML(f).at_css("[time='#{date}'] [currency='#{currency}']")
    f.close
    doc['rate'].to_f.round(4) if doc
  end

  def self.getRateWithEURBase(date, currency)
    self.getRateWithEUR(date, currency)
  end

  def self.getRateWithEURCounter(date, currency)
    rate = self.getRateWithEUR(date, currency)
    (1 / rate).round(4) if rate
  end

  def self.getRateWithOtherCurrencies(date, base, counter)
    base_rate = self.getRateWithEUR(date, base)
    counter_rate = self.getRateWithEUR(date, counter)
    (counter_rate / base_rate).round(4) if (base_rate && counter_rate)
  end
end
