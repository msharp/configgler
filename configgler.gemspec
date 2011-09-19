# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "configgler/version"

Gem::Specification.new do |s|
  s.name        = "configgler"
  s.version     = Configgler::VERSION
  s.authors     = ["max sharples"]
  s.email       = ["maxsharples@gmail.com"]
  s.homepage    = "https://github.com/msharp/configgler"
  s.summary     = %q{Idiomatic access to yaml configuration files}
  s.description = %q{Get data from your config files in different ways}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "yaml"
  s.add_development_dependency "rspec"
end
