# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pseudo_entity/version'

Gem::Specification.new do |spec|
  spec.name          = 'pseudo_entity'
  spec.version       = PseudoEntity::VERSION
  spec.authors       = ['Frank Hall']
  spec.email         = ['ChapterHouse.Dune@gmail.com']
  spec.description   = %q{A class for generating realistic looking data for people, companies, etc.}
  spec.summary       = %q{A class for generating realistic looking data for people, companies, etc.}
  spec.homepage      = 'http://chapterhouse.github.io/pseudo_entity'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 2.13'

  spec.add_runtime_dependency 'uuidtools', '~> 2.1'
  spec.add_runtime_dependency 'activesupport', '>= 2.0'
  spec.add_runtime_dependency 'iconv' # This is here only while I support activesupport < 3 which is about as long as I support ruby 1.8.7
  spec.add_runtime_dependency 'tzinfo'
  spec.add_runtime_dependency 'huge_enumerable'

end
