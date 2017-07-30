# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tic_tac_toe/version'

Gem::Specification.new do |spec|
  spec.name          = "tic_tac_toe"
  spec.version       = TicTacToe::VERSION
  spec.authors       = ["Hassan Mahmoud"]
  spec.email         = ["hassan.mahmoud1@outlook.com"]
  spec.summary       = %q{Small TicTacToe Game}
  spec.description   = %q{a pretty multiplyers Game build it using pure Ruby to practice OOP concept}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.add_development_dependency "rspec"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
