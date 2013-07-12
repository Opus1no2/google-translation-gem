Gem::Specification.new do |s|
  s.name             = 'google_translation'
  s.version          = '0.0.1'
  s.date             = '2013-07-11'
  s.homepage         = 'https://github.com/Opus1no2/Google-Translation-Gem'
  s.summary          = 'Mini Translation Client for Google Translate API'
  s.description      = 'Simple API client as an interface for Google Translation API'
  s.authors          = ['Travis Tillotson']
  s.email            = 'tillotson.travis@gmail.com'
  s.extra_rdoc_files = ["README.md"]
  s.files            = ["lib/google_translation.rb"]
  
  s.add_dependency 'faraday', '~> 0.8.0'
  s.add_dependency 'faraday_middleware', '~> 0.9.0'
end