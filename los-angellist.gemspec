# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "los-angellist/version"

Gem::Specification.new do |s|
  s.name        = "los-angellist"
  s.version     = Angellist::VERSION
  s.authors     = ["Akeem Adeniji"]
  s.email       = ["akeem.adeniji@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "los-angellist"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
   s.add_development_dependency "rspec"
   s.add_development_dependency "vcr"
   s.add_development_dependency "fakeweb"

   s.add_runtime_dependency "faraday"
   s.add_runtime_dependency "json"
   s.add_runtime_dependency "faraday_middleware"
   s.add_runtime_dependency "multi_json"
end
