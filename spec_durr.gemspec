# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'spec_durr/version'

Gem::Specification.new do |spec|
  spec.name          = "spec_durr"
  spec.version       = SpecDurr::VERSION
  spec.authors       = ["Woody Peterson"]
  spec.email         = ["woody.peterson@gmail.com"]
  spec.summary       = %q{pretty-print specs that can't print themselves}
  spec.description   = %q{The dumbest-thing-that-could-work for pretty-printing a directory of specs that can't print themselves (currently, in languages that use brackets for scoping).}
  spec.homepage      = "https://github.com/woahdae/spec_durr"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
