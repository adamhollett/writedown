# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'writedown/version'

Gem::Specification.new do |s|
  s.name          = 'writedown'
  s.version       = Writedown::VERSION
  s.authors       = ['Adam Hollett']
  s.email         = ['mail@adamhollett.com']

  s.summary       = 'A nicer renderer for kramdown'
  s.homepage      = 'https://github.com/admhlt/writedown'
  s.license       = 'MIT'

  s.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  s.require_paths = ['lib']

  s.add_dependency 'kramdown',  '~> 1.16.0'
  s.add_dependency 'fastimage', '~> 2.0.0'
end
