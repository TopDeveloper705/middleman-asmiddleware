source 'https://rubygems.org'

# Specify your gem's dependencies in middleman-as_middleware.gemspec
gemspec

# support ruby 1.9.2
if RUBY_VERSION < "1.9.3"
  gem "activesupport", "< 4.0.0"
  gem "middleman", "< 3.2.1" #middleman-core imposes ruby 1.9.3 after this point
elsif RUBY_VERSION.to_f < 2 || RUBY_PLATFORM == 'java'
  gem "middleman", "~> 3.3.0" #middleman breaks after this
end
