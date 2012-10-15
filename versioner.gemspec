# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = "versioner"
  gem.version       = "0.0.1"
  gem.authors       = ["Joshua Rieken @ ChaiONE"]
  gem.email         = ["joshua@joshuarieken.com"]
  gem.summary       = %q{Easily version your Rails apps.}
  gem.description   = %q{Simple versioning solution for Rails apps.}
  gem.homepage      = "http://github.com/chaione/versioner"
  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "railties", "~> 3.1"
  gem.add_dependency "actionpack", "~> 3.1"

  gem.add_development_dependency "rspec-rails", "~> 2.11.4"
  gem.add_development_dependency "guard", "~> 1.1.1"
  gem.add_development_dependency "guard-rspec", "~> 1.1.0"
  gem.add_development_dependency "growl", "~> 1.0.3"
  gem.add_development_dependency "ammeter", "~> 0.2.8"
  gem.add_development_dependency "tzinfo", "~> 0.3.33"
end
