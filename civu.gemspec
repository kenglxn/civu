# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'civu/version'

Gem::Specification.new do |spec|
  spec.name          = "civu"
  spec.version       = Civu::VERSION
  spec.authors       = ["Ken Gullaksen"]
  spec.email         = ["ken.gullaksen@embriq.no"]
  spec.description   = "a simple CLI for cloning git repos from jenkins views"
  spec.summary       = "solves all your problems, even on mondays"
  spec.homepage      = "https://github.com/kenglxn/civu"
  spec.license       = "MIT"

  spec.files         = `git ls-files | sed '/^jenkins/ d'`.split($/) # sed hack to remove jenkins folder from the gem
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"

  spec.add_runtime_dependency "jenkins_api_client"
  spec.add_runtime_dependency "commander"
  spec.add_runtime_dependency "nokogiri"
end
