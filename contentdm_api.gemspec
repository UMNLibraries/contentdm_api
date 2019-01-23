# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'contentdm_api/version'

Gem::Specification.new do |spec|
  spec.name          = "contentdm_api"
  spec.version       = CONTENTdmAPI::VERSION
  spec.authors       = ["Chad Fennell"]
  spec.email         = ["fenne035@umn.edu"]

  spec.summary       = %q{Ruby bindings for the CONTENTdm API}
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "http", "~> 4.0.3"
  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "yard", "~> 0.9.0"
end
