Gem::Specification.new do |s|
  s.name        = 'forex'
  s.version     = '0.0.1'
  s.summary     = 'Simple gem that returns the exchange rate between currencies'
  s.description = 'Simple gem that returns the exchange rate for a given date
                   between 2 currencies. The information is read from a local
                   file'
  s.authors     = ['Nicolas Rotta']
  s.email       = 'nicolasrotta@gmail.com'
  s.homepage    = 'http://github.com/nrotta/forex'
  s.license     = 'APACHE'
  s.files       = ['lib/forex.rb', 'test/forex_test.rb', 'data/forex.xml']
end
