# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'middleman/as_middleware/version'

Gem::Specification.new do |spec|
  spec.name          = "middleman-as-middleware"
  spec.version       = Middleman::AsMiddleware::VERSION
  spec.authors       = ["Jon Rowe"]
  spec.email         = ["hello@jonrowe.co.uk"]
  spec.description   = %q{Simple hander to bind middleman as middleware}
  spec.summary       = %q{Simple hander to bind middleman as middleware}
  spec.homepage      = "https://github.com/JonRowe/middleman-asmiddleware"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.test_files    = spec.files.grep(%r{^(spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "middleman", "> 3"

  if RUBY_VERSION.to_f < 2.3
    spec.add_development_dependency "bundler", "~> 1.3"
  else
    spec.add_development_dependency "bundler", "~> 2.1"
  end
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
