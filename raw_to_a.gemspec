# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'raw_to_a/version'

Gem::Specification.new do |spec|
  spec.authors       = ["Tony Drake"]
  spec.email         = ["t27duck@gmail.com"]

  spec.name          = "raw_to_a"
  spec.version       = RawToA::VERSION

  spec.summary       = %q{Get raw data out of your database as an array of hashes}
  spec.description   = %q{Adds row_to_a to ActiveRecord to execute a query directoy on the database and return an array of simple hashes}
  spec.homepage      = "https://github.com/t27duck/raw_to_a"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activerecord", ">= 4.2.0"

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
