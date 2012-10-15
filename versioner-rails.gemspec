# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = "versioner-rails"
  gem.version       = "0.9.0"
  gem.authors       = ["ChaiONE"]
  gem.email         = ["joshua.rieken@chaione.com"]
  gem.summary       = %q{Super simple versioning for Rails apps}
  gem.description   = %q{This gem makes it easy to add and update a version number for your Rails app.}
  gem.homepage      = "https://github.com/chaione/versioner-rails"
  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "railties", "~> 3.0"
  gem.add_dependency "actionpack", "~> 3.0"

  gem.add_development_dependency "rspec-rails", "~> 2.11.4"
  gem.add_development_dependency "guard", "~> 1.1.1"
  gem.add_development_dependency "guard-rspec", "~> 1.1.0"
  gem.add_development_dependency "growl", "~> 1.0.3"
  gem.add_development_dependency "ammeter", "~> 0.2.8"
  gem.add_development_dependency "tzinfo", "~> 0.3.33"
end
