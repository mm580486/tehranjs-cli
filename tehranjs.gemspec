# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tehranjs/identity'

Gem::Specification.new do |spec|
  spec.name          = "tehranjs"
  spec.version       = Tehranjs::Identity.version
  spec.authors       = ["mohammad mahmoudi"]
  spec.email         = ["mm580486@gmail.com"]

  spec.summary       = %q{Tehranjs gem help you to build markdown file}
  spec.description   = %q{Tehranjs gem help you to build markdown file}
  spec.homepage      = "https://github.com/mm580486/tehranjs-cli"
  spec.license       = "MIT"


  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   << 'tehranjs'
  spec.require_paths = ["lib"]

  spec.required_ruby_version = "~> 2.0"
  spec.add_dependency "thor", "~> 0.19"
  spec.add_dependency "thor_plus", "~> 5.0"
  spec.add_dependency "i18n"

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  
end
