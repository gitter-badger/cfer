# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cfer/version'

Gem::Specification.new do |spec|
  spec.name          = "cfer"
  spec.version       = Cfer::VERSION
  spec.authors       = ["Sean Edwards"]
  spec.email         = ["stedwards87+cfer@gmail.com"]

  spec.summary       = %q{Toolkit for automating infrastructure using AWS CloudFormation}
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/seanedwards/cfer"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'bin'
  spec.executables   = 'cfer'
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'docile'
  spec.add_runtime_dependency 'thor'
  spec.add_runtime_dependency 'activesupport'
  spec.add_runtime_dependency 'aws-sdk'
  spec.add_runtime_dependency 'aws-sdk-resources'
  spec.add_runtime_dependency 'preconditions'
  spec.add_runtime_dependency 'semantic'
  spec.add_runtime_dependency 'rainbow'
  spec.add_runtime_dependency 'highline'
  spec.add_runtime_dependency 'table_print'
  spec.add_runtime_dependency "rake"
  spec.add_runtime_dependency "erubis"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "yard"
end
