# frozen_string_literal: true
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
  spec.homepage = "https://github.com/ChapterHouse/#{spec.name}"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0"
  
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/ChapterHouse/#{spec.name}/tree/v#{spec.version}"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  
  spec.add_development_dependency 'bundler', '~> 2.3'
  spec.add_development_dependency 'rake', '~> 13'
  spec.add_development_dependency 'rspec', '~> 3'

  spec.add_runtime_dependency 'uuidtools', '~> 2.2'
  spec.add_runtime_dependency 'activesupport', '~> 7'
  spec.add_runtime_dependency 'tzinfo', '~> 2'
  spec.add_runtime_dependency 'tzinfo-data', '~> 1'
  spec.add_runtime_dependency 'huge_enumerable', '~> 0.1.3'

end
