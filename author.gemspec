# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'author/version'

Gem::Specification.new do |spec|
  spec.name          = "author"
  spec.version       = Author::VERSION
  spec.authors       = ["Terry Schmidt"]
  spec.email         = ["terry.m.schmidt@gmail.com"]
  spec.summary       = %q{Quickly create ebooks using Markdown}
  spec.description   = spec.summary
  spec.homepage      = "http://github.com/tschmidt/author"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "minitest-spec-expect"
  spec.add_development_dependency "english"
  
  spec.add_dependency "thor",     "~> 0.19"
  spec.add_dependency "liquid",   "~> 2.6"
  spec.add_dependency "coderay",  "~> 1.1"
  spec.add_dependency "kramdown", "~> 1.3"
  spec.add_dependency "safe_yaml","~> 1.0"
  spec.add_dependency "eeepub",   "~> 0.8"
  spec.add_dependency "rubyzip",  "~> 1.1"
  spec.add_dependency "zip-zip",  "~> 0.3"
end
