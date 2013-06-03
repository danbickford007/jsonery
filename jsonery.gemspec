# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jsonery/version'

Gem::Specification.new do |spec|
  spec.name          = "jsonery"
  spec.version       = Jsonery::VERSION
  spec.authors       = ["Daniel Bickford"]
  spec.email         = ["danbickford007@yahoo.com"]
  spec.description   = %q{Jsonery is meant to query a json file to quickly retreive information.  As well, a sqlite3 file will be created to allow further use of the contained information.}
  spec.summary       = %q{Jsonery is in it's infant stage, the main use is to query a json file for information the plain sql.  Once you have run the gem, you will be given a sqlite3 file
                          to use later if need, so this gem really only needs to be run once.  Within irb, require Jsonery and begin your query right away.  You can query as many times as you 
                          wish.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'rspec'
  spec.add_dependency 'sqlite3'
end
