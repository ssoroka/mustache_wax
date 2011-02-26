# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "mustache_wax/version"

Gem::Specification.new do |s|
  s.name        = "mustache_wax"
  s.version     = MustacheWax::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Steven Soroka", "Burke Libbey"]
  s.email       = ["steven@stevensoroka.ca", "burke@burkelibbey.org"]
  s.homepage    = ""
  s.summary     = %q{write me later}
  s.description = %q{write me later}

  s.add_dependency 'yajl-ruby'
  
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
