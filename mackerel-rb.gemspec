# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mackerel/version'

Gem::Specification.new do |spec|
  spec.name          = "mackerel-rb"
  spec.version       = Mackerel::VERSION
  spec.authors       = ["mizokami"]
  spec.email         = ["suzunatsu@yahoo.com"]

  spec.summary       = %q{Yet another mackerel client for Ruby.}
  spec.description   = %q{Yet another mackerel client for Ruby.}
  spec.homepage      = "https://github.com/mizoR/mackerel-rb"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "thor"
  spec.add_dependency "hashie"
  spec.add_dependency "faraday"
  spec.add_dependency "faraday_middleware"
  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end
