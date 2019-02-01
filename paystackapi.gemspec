# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'paystackapi/version'

Gem::Specification.new do |spec|
  spec.name          = "paystackapi"
  spec.version       = Paystackapi::VERSION
  spec.authors       = ["Samuel Joseph"]
  spec.email         = ["samuelsadiq52@gmail.com"]

  spec.summary       = %q{PayStack Gem for Ruby Api applications}
  spec.description   = %q{This gem will be used mostly for ruby api only apps}
  spec.homepage      = "https://github.com/samuel52/PaystackRubyApi.git"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*.rb", "ext/**/*.{c,h,rb}", "*.md", "BSDL", "LICENSE.txt"]
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  #Dev dependencies
  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  # spec.add_development_dependency 'rspec', '~> 3.0'

  #Dependencies
  spec.required_ruby_version = '>= 2.0.0'
  spec.add_dependency('httparty', '~> 0.16.3')
  spec.add_dependency('dotenv', '~> 2.6')
  spec.add_dependency('openssl', '~> 2.1', '>= 2.1.2')
end
