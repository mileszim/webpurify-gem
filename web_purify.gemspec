# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'web_purify/version'

Gem::Specification.new do |s|
  s.name        = "webpurify"
  s.version     = WebPurify::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Miles Zimmerman"]
  s.email       = ["miles@zserver.org"]
  s.homepage    = "https://github.com/mileszim/webpurify-gem"
  s.summary     = %q{A RubyGem for interfacing with the WebPurify API.}
  s.description = %q{A RubyGem for interfacing with the WebPurify API.}

  s.add_dependency "json"

  s.add_development_dependency "rspec", "~> 3.10.0"
  s.add_development_dependency "vcr"
  s.add_development_dependency "webmock"

  s.files         = %w(LICENSE README.md web_purify.gemspec)
  s.files        += Dir.glob("lib/**/*.rb")
  s.test_files    = Dir.glob("spec/**/*.rb")
  s.require_paths = ["lib"]
end
