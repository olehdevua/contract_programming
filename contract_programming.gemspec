# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'contract_programming/version'

Gem::Specification.new do |spec|
  spec.name          = "contract_programming"
  spec.version       = ContractProgramming::VERSION
  spec.authors       = ["OlegTsyba"]
  spec.email         = ["idethrone1@gmail.com"]
  spec.summary       = %q{Gem for support programming by contract}
  spec.description   = %q{This small gem make contract programming in ruby more convenient}
  spec.homepage      = "https://github.com/OlegTsyba/contract_programming"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rspec", "3.0.0"
end
