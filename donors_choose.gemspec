# -*- encoding: utf-8 -*-
require File.expand_path('../lib/donors_choose/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["michael verdi"]
  gem.email         = ["michael.v.verdi@gmail.com"]
  gem.description   = %q{Ruby wrapper for the Donors Choose Api}
  gem.summary       = %q{Ruby wrapper for the Donors Choose Api}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "donors_choose2"
  gem.require_paths = ["lib"]
  gem.version       = DonorsChoose::VERSION

  gem.add_runtime_dependency('faraday')
  gem.add_runtime_dependency('nokogiri')
  gem.add_development_dependency('rspec')
end
