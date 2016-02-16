# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'flexibee/version'

Gem::Specification.new do |spec|
  spec.name          = "flexibee"
  spec.version       = Flexibee::VERSION
  spec.authors       = ["Dan Pecher"]
  spec.email         = ["dan.pecher@gmail.com"]

  spec.summary       = 'Flexibee API wrapper'
  spec.description   = 'Flexibee API wrapper'
  spec.homepage      = "https://github.com/danpecher/flexibee"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'vcr'

  spec.add_dependency 'rest-client'
end
