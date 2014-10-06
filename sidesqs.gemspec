# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sidesqs/version'

Gem::Specification.new do |spec|
  spec.name          = "sidesqs"
  spec.version       = SideSQS::VERSION
  spec.authors       = ["Woowa Brothers"]
  spec.email         = ["ahastudio@gmail.com"]
  spec.description   = %q{Simple, efficient background processing using Amazon SQS.}
  spec.summary       = %q{SideSQS}
  spec.homepage      = "https://github.com/woowabros/sidesqs"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'aws-sdk-v1'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
