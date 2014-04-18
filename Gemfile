source 'https://rubygems.org'

# Specify your gem's dependencies in middleman-as_middleware.gemspec
gemspec

# support ruby 1.9.2
if RUBY_VERSION < "1.9.3"
  gem "activesupport", "< 4.0.0"
  gem "middleman",     "< 3.2.1" #middleman-core imposes ruby 1.9.3 after this point
end
