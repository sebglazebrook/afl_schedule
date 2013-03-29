# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'afl/version'

Gem::Specification.new do |spec|
  spec.name          = 'afl_schedule'
  spec.version       = AFL::VERSION
  spec.authors       = ['Seb Glazebrook']
  spec.email         = ['me@sebglazebrook.com']
  spec.description   = %q{It helps you get AFL schedule data in your app.}
  spec.summary       = %q{It helps you get AFL schedule data in your app. Currently only 2013 included.}
  spec.homepage      = 'https://github.com/sebglazebrook/afl_schedule'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'chronic'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'rspec', '2.13.0'

end
