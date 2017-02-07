$LOAD_PATH.push(File.expand_path("../lib", __FILE__))
require "losant_rest/version"

Gem::Specification.new do |gem|
  gem.name          = "losant_rest"
  gem.authors       = ["Michael Kuehl"]
  gem.email         = ["hello@losant.com"]
  gem.summary       = %q{Provides a simple ruby wrapper around the Losant REST API}
  gem.description   = %q{Easily use the Losant IoT Platform through its REST API with Ruby}
  gem.homepage      = "https://github.com/Losant/losant-rest-ruby"
  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.require_paths = ["lib"]
  gem.version       = LosantRest::VERSION
  gem.licenses      = ["MIT"]

  gem.required_ruby_version = ">= 2.1"

  gem.add_dependency "httparty", "~> 0.14.0"

  gem.add_development_dependency "minitest", "~> 5.9"
  gem.add_development_dependency "rake", "~> 12"
  gem.add_development_dependency "webmock", "~> 2.3"
end
