# -*- encoding: utf-8 -*-
require File.expand_path('../lib/sinatra/sprockets/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Andrew Marshall"]
  gem.email         = ["andrew@johnandrewmarshall.com"]
  gem.description   = %q{Sinatra plugin for Sprockets integration}
  gem.summary       = %q{Sinatra plugin for Sprockets integration}
  gem.homepage      = "http://johnandrewmarshall.com/projects/sinatra-sprockets"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "sinatra-sprockets-ext"
  gem.require_paths = ["lib"]
  gem.version       = Sinatra::Sprockets::VERSION

  gem.add_dependency "sprockets"
end
