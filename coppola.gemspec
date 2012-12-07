# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'coppola/version'

Gem::Specification.new do |s|
  s.name              = "coppola"
  s.version           = Coppola::VERSION
  s.authors            = ["Cédric Darné"]
  s.email             = ["cedric.darne@c4mprod.com"]
  s.description       = "Functional and load testing library for APIs"
  s.summary           = "Define API scenarii and launch blockbusters!"
  s.homepage          = "https://github.com/cdarne/coppola"

  s.files         = `git ls-files`.split($/)
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
#  s.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
#  s.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  s.required_ruby_version = ">= 1.9.2"

  s.add_dependency('httparty')

  s.add_development_dependency('bundler')
  s.add_development_dependency('pry')
  s.add_development_dependency('rspec')
end